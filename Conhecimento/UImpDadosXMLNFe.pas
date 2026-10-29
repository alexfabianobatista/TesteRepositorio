unit UImpDadosXMLNFe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, xmldom, XMLIntf, msxmldom, XMLDoc, UBiblioteca;

type
  TCadastro = class
  private
    fcnpjCad :String;
    fnomeCad :String;
    ffantCad :String;
    flgrCad :String;
    fnroCad :String;
    fbairroCad :String;
    fcMunCad :String;
    fmunCad :String;
    fufCad :String;
    fcUfCad :String;
    fcepCad :String;
    fcPaisCad :String;
    fpaisCad :String;
    ffoneCad :String;
    fieCad :String;
  published
    property CnpjCad: String read fcnpjCad write fcnpjCad;
    property NomeCad: String read fnomeCad write fnomeCad;
    property FantCad: String read ffantCad write ffantCad;
    property LgrCad: String read flgrCad write flgrCad;
    property NroCad: String read fnroCad write fnroCad;
    property BairroCad: String read fbairroCad write fbairroCad;
    property CMunCad: String read fcMunCad write fcMunCad;
    property MunCad: String read fmunCad write fmunCad;
    property UFCad: String read fufCad write fufCad;
    property CUFCad: String read fcUfCad write fcUfCad;
    property CepCad: String read fcepCad write fcepCad;
    property CPaisCad: String read fcPaisCad write fcPaisCad;
    property PaisCad: String read fpaisCad write fpaisCad;
    property FoneCad: String read ffoneCad write ffoneCad;
    property IECad: String read fieCad write fieCad;
  end;
  TNfe = class
  private
    chaveAcesso: String;
    pesoB: String;
    volumes: String;
    numero: String;
    serie: String;
    modelo: String;
    vNF: String;
    dataEmissao: String;
  public
    property pChaveAcesso: String read chaveAcesso write chaveAcesso;
    property pPesoB: String read pesoB write pesoB;
    property pVolumes: String read volumes write volumes;
    property pNumero: String read numero write numero;
    property pSerie: string read serie write serie;
    property pModelo: string read modelo write modelo;
    property pVNF: String read vNF write vNF;
    property pDataEmissao: String read dataEmissao write dataEmissao;
  end;

  TFImpDadosXMLNFe = class(TForm)
    Label1: TLabel;
    BtOk: TBitBtn;
    BtCancela: TBitBtn;
    sbArquivoCons: TSpeedButton;
    OpenDialog1: TOpenDialog;
    XMLDocument1: TXMLDocument;
    LBArquivo: TListBox;
    procedure sbArquivoConsClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    procedure LeArquivoXML;
    procedure RealizaCadastro(Cadastro: TCadastro); 
  public
    { Public declarations }
    NFes: Array of TNfe;
    Remetentes: Array of TCadastro;
    Destinatarios: Array of TCadastro;
  end;

var
  FImpDadosXMLNFe: TFImpDadosXMLNFe;

implementation

uses StrUtils, UNfe_cl, UOracle_cl, UUsuario_cl;

{$R *.dfm}

procedure TFImpDadosXMLNFe.sbArquivoConsClick(Sender: TObject);
var codCad, i : Integer;
    CadastrosRealizados : String;
begin
  LBArquivo.Clear;
  if OpenDialog1.Execute then
  begin
    Screen.Cursor := crHourGlass;
    CadastrosRealizados := '';
    LBArquivo.Items := OpenDialog1.Files;
    LeArquivoXML;
    for i := 0 to Length(Remetentes) -1 do
    begin
      if Remetentes[i] <> nil then
      begin
        codCad := DMNfe.OPNfe.CallIntegerFunction('COMPARA_CNPJ',[Remetentes[i].CnpjCad]);
        if codCad = 0 then
        begin
          RealizaCadastro(Remetentes[i]);
          CadastrosRealizados := CadastrosRealizados + chr(13)+chr(10)+ Remetentes[i].NomeCad;
        end;
      end;
    end;
    for i := 0 to Length(Destinatarios) -1 do
    begin
      if Destinatarios[i] <> nil then
      begin
        codCad := DMNfe.OPNfe.CallIntegerFunction('COMPARA_CNPJ',[Destinatarios[i].CnpjCad]);
        if codCad = 0 then
        begin
          RealizaCadastro(Destinatarios[i]);
          CadastrosRealizados := CadastrosRealizados + chr(13)+chr(10)+ Destinatarios[i].NomeCad;
        end;
      end;
    end;
    Screen.Cursor := crDefault;
    if(CadastrosRealizados <> '') then
      MessageDlg('Cadastros importados com sucesso!'+ chr(13)+chr(10)+ CadastrosRealizados,mtConfirmation,[mbOK],0);
//    else
//      MessageDlg('Os Cadastros já estavam presentes no banco de dados!' + chr(13)+chr(10)+ 'Nenhum registro importado.',mtConfirmation,[mbOK],0);
  end;
end;

procedure TFImpDadosXMLNFe.LeArquivoXML;
var
  nodeTransp: IXMLNode;
  nodeIde: IXMLNode;
  nodeTotal: IXMLNode;
  nodeDest: IXMLNode;
  nodeEmit: IXMLNode;
  nodeEnderDest: IXMLNode;
  xml :String;
  i: Integer;
begin
  if LBArquivo.Items.Count > 0 then
  begin
    SetLength(NFes,LBArquivo.Items.Count);
    SetLength(Remetentes,LBArquivo.Items.Count);
    SetLength(Destinatarios,LBArquivo.Items.Count);
    for i := 0 to LBArquivo.Items.Count - 1 do
    begin

      XMLDocument1.FileName := LBArquivo.Items[i];
      XMLDocument1.Active := true;
      //inicializa as variáveis
      nodeTransp := Nil;
      xml := XMLDocument1.XML.Text;

      if XMLDocument1.DocumentElement.NodeName  <> 'nfeProc' then
      begin
        MessageDlg('Erro em ' + LBArquivo.Items[i] + ': Tag nfeProc inexistente neste documento.' +
          ' Este documento não está em conformidade com o Layout da Distribuição NF-e.' +
          ' Entre em contato com o seu fornecedor.',
          mtError, [mbOk],0);
        Abort;
      end;
      NFes[i] := TNfe.Create;
      NFes[i].chaveAcesso :=
        RightStr(XMLDocument1.DocumentElement.ChildNodes['NFe'].ChildNodes['infNFe'].GetAttributeNS('Id', ''), 44);

      nodeIde := XMLDocument1.DocumentElement.ChildNodes['NFe'].ChildNodes.FindNode('infNFe').
        ChildNodes.FindNode('ide');
      NFes[i].serie := nodeIde.ChildNodes['serie'].Text;
      NFes[i].numero := nodeIde.ChildNodes['nNF'].Text;
      NFes[i].modelo := nodeIde.ChildNodes['mod'].Text;
      NFes[i].dataEmissao := nodeIde.ChildNodes['dhEmi'].Text;
      NFes[i].dataEmissao := Copy(NFes[i].dataEmissao,9,2)+'/' +
        Copy(NFes[i].dataEmissao,6,2)+'/'+Copy(NFes[i].dataEmissao,0,4);
      nodeTotal := XMLDocument1.DocumentElement.ChildNodes['NFe'].ChildNodes.FindNode('infNFe').
        ChildNodes.FindNode('total');

      nodeEmit := XMLDocument1.DocumentElement.ChildNodes['NFe'].ChildNodes['infNFe'].
        ChildNodes.FindNode('emit');

      Remetentes[i] := TCadastro.Create;
      Remetentes[i].CnpjCad   := nodeEmit.ChildNodes.Nodes['CNPJ'].Text;
      if trim(Remetentes[i].CnpjCad) = '' then
        Remetentes[i].CnpjCad := nodeEmit.ChildNodes['CPF'].Text;
      Remetentes[i].nomeCad   := nodeEmit.ChildNodes.Nodes['xNome'].Text;
      Remetentes[i].fantCad   := nodeEmit.ChildNodes.Nodes['xFant'].Text;
      Remetentes[i].ieCad     := nodeEmit.ChildNodes.Nodes['IE'].Text;
      Remetentes[i].lgrCad    := nodeEmit.ChildNodes.Nodes['enderEmit'].ChildNodes.Nodes['xLgr'].Text;
      Remetentes[i].nroCad    := nodeEmit.ChildNodes.Nodes['enderEmit'].ChildNodes.Nodes['nro'].Text;
      Remetentes[i].bairroCad := nodeEmit.ChildNodes.Nodes['enderEmit'].ChildNodes.Nodes['xBairro'].Text;
      Remetentes[i].cMunCad   := nodeEmit.ChildNodes.Nodes['enderEmit'].ChildNodes.Nodes['cMun'].Text;
      Remetentes[i].munCad    := nodeEmit.ChildNodes.Nodes['enderEmit'].ChildNodes.Nodes['xMun'].Text;
      Remetentes[i].ufCad     := nodeEmit.ChildNodes.Nodes['enderEmit'].ChildNodes.Nodes['UF'].Text;
      Remetentes[i].cepCad    := nodeEmit.ChildNodes.Nodes['enderEmit'].ChildNodes.Nodes['CEP'].Text;
      Remetentes[i].cPaisCad  := nodeEmit.ChildNodes.Nodes['enderEmit'].ChildNodes.Nodes['cPais'].Text;
      Remetentes[i].paisCad   := nodeEmit.ChildNodes.Nodes['enderEmit'].ChildNodes.Nodes['xPais'].Text;
      Remetentes[i].foneCad   := nodeEmit.ChildNodes.Nodes['enderEmit'].ChildNodes.Nodes['fone'].Text;
      Remetentes[i].CUFCad    := Copy(Remetentes[i].CMunCad,1,2);
      if Remetentes[i].CPaisCad = '' then
        Remetentes[i].CPaisCad := '1058'; //Brasil

      nodeDest := XMLDocument1.DocumentElement.ChildNodes['NFe'].ChildNodes['infNFe'].
        ChildNodes.FindNode('dest');

      Destinatarios[i] := TCadastro.Create;
      Destinatarios[i].CnpjCad := nodeDest.ChildNodes['CNPJ'].Text;
      if trim(Destinatarios[i].CnpjCad) = '' then
        Destinatarios[i].CnpjCad := nodeDest.ChildNodes['CPF'].Text;
      Destinatarios[i].nomeCad   := nodeDest.ChildNodes.Nodes['xNome'].Text;
      Destinatarios[i].fantCad   := nodeDest.ChildNodes.Nodes['xFant'].Text;
      Destinatarios[i].ieCad    := nodeDest.ChildNodes.Nodes['IE'].Text;
      Destinatarios[i].lgrCad    := nodeDest.ChildNodes.Nodes['enderDest'].ChildNodes.Nodes['xLgr'].Text;
      Destinatarios[i].nroCad    := nodeDest.ChildNodes.Nodes['enderDest'].ChildNodes.Nodes['nro'].Text;
      Destinatarios[i].bairroCad := nodeDest.ChildNodes.Nodes['enderDest'].ChildNodes.Nodes['xBairro'].Text;
      Destinatarios[i].cMunCad  := nodeDest.ChildNodes.Nodes['enderDest'].ChildNodes.Nodes['cMun'].Text;
      Destinatarios[i].munCad   := nodeDest.ChildNodes.Nodes['enderDest'].ChildNodes.Nodes['xMun'].Text;
      Destinatarios[i].ufCad     := nodeDest.ChildNodes.Nodes['enderDest'].ChildNodes.Nodes['UF'].Text;
      Destinatarios[i].cepCad    := nodeDest.ChildNodes.Nodes['enderDest'].ChildNodes.Nodes['CEP'].Text;
      Destinatarios[i].cPaisCad  := nodeDest.ChildNodes.Nodes['enderDest'].ChildNodes.Nodes['cPais'].Text;
      Destinatarios[i].paisCad   := nodeDest.ChildNodes.Nodes['enderDest'].ChildNodes.Nodes['xPais'].Text;
      Destinatarios[i].foneCad   := nodeDest.ChildNodes.Nodes['enderDest'].ChildNodes.Nodes['fone'].Text;
      Destinatarios[i].CUFCad    := Copy(Destinatarios[i].CMunCad,1,2);

      if Destinatarios[i].CPaisCad = '' then
        Destinatarios[i].CPaisCad := '1058'; //Brasil

      //if nodeEnderDest.ChildNodes.FindNode('xCpl') <> nil then
//        NFes[i].pXCpl := nodeEnderDest.ChildNodes.FindNode('xCpl').Text;

      NFes[i].vNF := nodeTotal.ChildNodes.FindNode('ICMSTot').ChildNodes.FindNode('vNF').Text;
      NFes[i].vNF := StringReplace(NFes[i].vNF ,'.',',', [rfReplaceAll]);
      nodeTransp := XMLDocument1.DocumentElement.ChildNodes['NFe'].ChildNodes.FindNode('infNFe').
        ChildNodes.FindNode('transp');
      if nodeTransp.ChildNodes.FindNode('vol') <> Nil then
      begin
        if nodeTransp.ChildNodes.FindNode('vol').ChildNodes.FindNode('qVol') <> Nil then
          NFes[i].volumes :=
            nodeTransp.ChildNodes.FindNode('vol').ChildNodes.FindNode('qVol').Text;
        if nodeTransp.ChildNodes.FindNode('vol').ChildNodes.FindNode('pesoB') <> Nil then
          NFes[i].pesoB :=
            nodeTransp.ChildNodes.FindNode('vol').ChildNodes.FindNode('pesoB').Text;
        NFes[i].volumes := StringReplace(NFes[i].volumes ,'.',',', [rfReplaceAll]);
        NFes[i].pesoB := StringReplace(NFes[i].pesoB ,'.',',', [rfReplaceAll]);
      end;
    end;
  end;
end;
procedure TFImpDadosXMLNFe.RealizaCadastro(Cadastro: TCadastro);
var
  wSql :String;
  buscador :TBuscador;
  wCodCidade :String;
  wCodPais: String;
begin
  with DMOracle do
  begin
    //Pega os dados do formulário para salvar no banco de dados
    //Procura se existe UF cadastrada, caso não tenha faz o cadastro
    buscador := TBuscador.Create;
    buscador.Limpa;
    buscador.Adiciona('SELECT COUNT(*) FROM TB_ESTADO WHERE COD_UF_IBGE = ' + Cadastro.CUFCad);
    buscador.Buscar();
    if buscador.Proximo = '0' then
    begin
      wSql := 'INSERT INTO TB_ESTADO(COD_ESTADO, DESC_ESTADO, DESC_SIGLA_ESTADO, COD_UF_IBGE) ';
      wSql := wSql + 'VALUES(' + quotedStr(Cadastro.UFCad) + ',' + quotedStr(Cadastro.UFCad) + ',' + quotedStr(Cadastro.CUFCad) + ',' +
         Cadastro.CUFCad + ')';
      QExecSQL.SQL.Clear;
      QExecSQL.SQL.Add(wSql);
      try
        QExecSQL.Close;
        QExecSQL.ExecSQL;
        DBCemapa.Commit;
      Except
        DBCemapa.Rollback;
        Screen.Cursor := crDefault;
        Abort;
      end;
    end;

    // Procura se existe Cidade, caso não exista faz o cadastro
    buscador.Limpa;
    buscador.Adiciona('SELECT COUNT(*) FROM TB_CIDADE WHERE COD_CIDADE_IBGE = ' + copy(Cadastro.CMunCad,3,5)+
      ' AND COD_ESTADO = ' + QuotedStr(Cadastro.UFCad));
    buscador.Buscar();
    if buscador.Proximo = '0' then
    begin
      wSql := 'INSERT INTO TB_CIDADE(COD_CIDADE, DESC_CIDADE, COD_ESTADO, COD_CIDADE_IBGE) VALUES ';
      wSql := wSql + '(SQCIDADE.NEXTVAL, ' + quotedStr(Cadastro.MunCad) + ',' + quotedStr(Cadastro.UFCad) + ',' + copy(Cadastro.CMunCad,3,5) + ')';
      QExecSQL.SQL.Clear;
      QExecSQL.SQL.Add(wSql);
      try
        QExecSQL.Close;
        QExecSQL.ExecSQL;
        DBCemapa.Commit;
      Except
        DBCemapa.Rollback;
        Screen.Cursor := crDefault;
        Abort;
      end;
    end;

    // Recupera o código da cidade
    wSql := 'SELECT COD_CIDADE FROM TB_CIDADE WHERE COD_CIDADE_IBGE = ' + copy(Cadastro.CMunCad,3,5)
      + ' AND COD_ESTADO = ' + QuotedStr(Cadastro.UFCad);
    QExecSql.SQL.Clear;
    QExecSql.SQL.Add(wSql);
    QExecSQL.Close;
    QExecSQL.Open;
    wCodCidade := QExecSQL.Fields[0].AsString;

    // Recupera o código do país
    wSql := 'SELECT COD_PAIS FROM TB_PAIS WHERE COD_PAIS_IBGE = ' + Cadastro.CPaisCad;
    QExecSql.SQL.Clear;
    QExecSql.SQL.Add(wSql);
    QExecSQL.Close;
    QExecSQL.Open;
    wCodPais := QExecSQL.Fields[0].AsString;

    // Cadastra o fornecedor
    wSql := 'INSERT INTO TB_CADASTRO ( COD_CADASTRO, NOME, COD_TIPO_CADASTRO, COD_ESTADO, ';
    wSql := wSql + 'COD_PAIS, DESC_ENDERECO, DESC_CIDADE, COD_CIDADE, DESC_CEP, NUM_CGC_CPF, ';
    wSql := wSql + Bib.ift(length(Cadastro.CnpjCad) = 14,'NUM_INSCRICAO, ', 'DESC_INSCRICAO_MUNICIPAL, ');
    wSql := wSql + 'DT_CADASTRO, IND_SEXO_CATEGORIA, DESC_TELEFONE, DESC_BAIRRO, ';
    wSql := wSql + 'DESC_FANTASIA, IND_FISICA_JURIDICA, COD_USUARIO) VALUES ( ';
    wSql := wSql + 'SQCADASTRO.NEXTVAL, ' + quotedStr(Cadastro.NomeCad) + ', ' + '2' + ', ' + quotedStr(Cadastro.UFCad) + ', ';
    wSql := wSql + wCodPais +', '+ quotedStr(Cadastro.LgrCad + ', ' + Cadastro.NroCad) + ', ' + quotedStr(Cadastro.MunCad) + ', ' + wCodcidade + ', ';
    wSql := wSql + quotedStr(Cadastro.CepCad) + ', ' + quotedStr(Cadastro.CnpjCad) + ', ' + quotedStr(Cadastro.IECad) + ', ';
    wSql := wSql + quotedStr(DateToStr(DataServ)) + ', ' + quotedStr('M') + ', ' + quotedStr(Cadastro.FoneCad) + ', ' + quotedStr(Cadastro.BairroCad) + ', ';
    wSql := wSql + quotedStr(copy(Cadastro.FantCad,1,30)) + ', ' + quotedStr(Bib.ift(length(Cadastro.CnpjCad) = 14, 'J', 'F')) + ', ' + IntToStr(DMUsuario.CodUsuarioCorrente) + ')';
    QExecSql.Close;
    QExecSql.SQL.Clear;
    QExecSql.SQL.Add(wSql);
    try
      QExecSQL.ExecSQL;
      DBCemapa.Commit;
    Except
      DBCemapa.Rollback;
      Screen.Cursor := crDefault;
      Abort;
    end;
  end;
end;
procedure TFImpDadosXMLNFe.FormActivate(Sender: TObject);
begin
  sbArquivoConsClick(Self);
end;

end.
