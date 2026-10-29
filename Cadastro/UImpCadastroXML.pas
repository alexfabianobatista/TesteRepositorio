unit UImpCadastroXML;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, xmldom, XMLIntf, msxmldom, XMLDoc;

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
  TFImpCadastroXML = class(TForm)
    BtOk: TBitBtn;
    BtCancela: TBitBtn;
    sbArquivoCons: TSpeedButton;
    OpenDialog1: TOpenDialog;
    XMLDocument1: TXMLDocument;
    LBArquivo: TListBox;
    Label1: TLabel;
    procedure sbArquivoConsClick(Sender: TObject);
    procedure BtOkClick(Sender: TObject);
  private
    { Private declarations }
    Cadastros: Array of TCadastro;
    procedure LeArquivoXML;
    procedure RealizaCadastro(Cadastro: TCadastro); 
  public
    { Public declarations }
  end;

var
  FImpCadastroXML: TFImpCadastroXML;

implementation

uses StrUtils, UCadastro_cl, UNfe_cl, UOracle_cl, UUsuario_cl;

{$R *.dfm}

procedure TFImpCadastroXML.sbArquivoConsClick(Sender: TObject);
begin
  LBArquivo.Clear;
  if OpenDialog1.Execute then
    LBArquivo.Items := OpenDialog1.Files;
end;

procedure TFImpCadastroXML.LeArquivoXML;
var
  nodeFornecedor :IXMLNode;
  nodeDest :IXMLNode;
  i :Integer;
begin
  try
    if LBArquivo.Items.Count > 0 then
    begin
      SetLength(Cadastros,LBArquivo.Items.Count*2);
      for i := 0 to LBArquivo.Items.Count - 1 do
      begin
        XMLDocument1.FileName := LBArquivo.Items[i];
        XMLDocument1.Active := true;

        //inicializa as variáveis
        nodeFornecedor := Nil;
        nodeDest := Nil;

        if RightStr(XMLDocument1.DocumentElement.NodeName,4)  <> 'Proc' then
        begin
          MessageDlg('Erro em ' + LBArquivo.Items[i] + ': Tag de distribuição (nfeProc, cteProc ou mdfeProc) inexistente neste documento.' +
            ' Este documento não está em conformidade com o Layout de Distribuição.' +
            ' Entre em contato com o emissor do documento.',
            mtError, [mbOk],0);
          Abort;
        end;

        //Dados do fornecedor
        nodeFornecedor := XMLDocument1.DocumentElement.ChildNodes['NFe'].ChildNodes.FindNode('infNFe').
          ChildNodes.FindNode('emit');
        Cadastros[i*2] := TCadastro.Create;
        Cadastros[i*2].CnpjCad   := nodeFornecedor.ChildNodes.Nodes['CNPJ'].Text;
        Cadastros[i*2].nomeCad   := nodeFornecedor.ChildNodes.Nodes['xNome'].Text;
        Cadastros[i*2].fantCad   := nodeFornecedor.ChildNodes.Nodes['xFant'].Text;
        Cadastros[i*2].ieCad     := nodeFornecedor.ChildNodes.Nodes['IE'].Text;
        Cadastros[i*2].lgrCad    := nodeFornecedor.ChildNodes.Nodes['enderEmit'].ChildNodes.Nodes['xLgr'].Text;
        Cadastros[i*2].nroCad    := nodeFornecedor.ChildNodes.Nodes['enderEmit'].ChildNodes.Nodes['nro'].Text;
        Cadastros[i*2].bairroCad := nodeFornecedor.ChildNodes.Nodes['enderEmit'].ChildNodes.Nodes['xBairro'].Text;
        Cadastros[i*2].cMunCad   := nodeFornecedor.ChildNodes.Nodes['enderEmit'].ChildNodes.Nodes['cMun'].Text;
        Cadastros[i*2].munCad    := nodeFornecedor.ChildNodes.Nodes['enderEmit'].ChildNodes.Nodes['xMun'].Text;
        Cadastros[i*2].ufCad     := nodeFornecedor.ChildNodes.Nodes['enderEmit'].ChildNodes.Nodes['UF'].Text;
        Cadastros[i*2].cepCad    := nodeFornecedor.ChildNodes.Nodes['enderEmit'].ChildNodes.Nodes['CEP'].Text;
        Cadastros[i*2].cPaisCad  := nodeFornecedor.ChildNodes.Nodes['enderEmit'].ChildNodes.Nodes['cPais'].Text;
        Cadastros[i*2].paisCad   := nodeFornecedor.ChildNodes.Nodes['enderEmit'].ChildNodes.Nodes['xPais'].Text;
        Cadastros[i*2].foneCad   := nodeFornecedor.ChildNodes.Nodes['enderEmit'].ChildNodes.Nodes['fone'].Text;
        Cadastros[i*2].CUFCad    := Copy(Cadastros[i*2].CMunCad,1,2);
        if Cadastros[i*2].CPaisCad = '' then
          Cadastros[i*2].CPaisCad := '1058'; //Brasil

        //CNPJ da filial
        nodeDest := XMLDocument1.DocumentElement.ChildNodes['NFe'].ChildNodes.FindNode('infNFe').
          ChildNodes.FindNode('dest');
        Cadastros[i*2+1] := TCadastro.Create;
        Cadastros[i*2+1].CnpjCad := nodeDest.ChildNodes['CNPJ'].Text;
        if trim(Cadastros[i*2+1].CnpjCad) = '' then
          Cadastros[i*2+1].CnpjCad := nodeDest.ChildNodes['CPF'].Text;
        Cadastros[i*2+1].nomeCad   := nodeDest.ChildNodes.Nodes['xNome'].Text;
        Cadastros[i*2+1].fantCad   := nodeDest.ChildNodes.Nodes['xFant'].Text;
        Cadastros[i*2+1].ieCad    := nodeDest.ChildNodes.Nodes['IE'].Text;
        Cadastros[i*2+1].lgrCad    := nodeDest.ChildNodes.Nodes['enderDest'].ChildNodes.Nodes['xLgr'].Text;
        Cadastros[i*2+1].nroCad    := nodeDest.ChildNodes.Nodes['enderDest'].ChildNodes.Nodes['nro'].Text;
        Cadastros[i*2+1].bairroCad := nodeDest.ChildNodes.Nodes['enderDest'].ChildNodes.Nodes['xBairro'].Text;
        Cadastros[i*2+1].cMunCad  := nodeDest.ChildNodes.Nodes['enderDest'].ChildNodes.Nodes['cMun'].Text;
        Cadastros[i*2+1].munCad   := nodeDest.ChildNodes.Nodes['enderDest'].ChildNodes.Nodes['xMun'].Text;
        Cadastros[i*2+1].ufCad     := nodeDest.ChildNodes.Nodes['enderDest'].ChildNodes.Nodes['UF'].Text;
        Cadastros[i*2+1].cepCad    := nodeDest.ChildNodes.Nodes['enderDest'].ChildNodes.Nodes['CEP'].Text;
        Cadastros[i*2+1].cPaisCad  := nodeDest.ChildNodes.Nodes['enderDest'].ChildNodes.Nodes['cPais'].Text;
        Cadastros[i*2+1].paisCad   := nodeDest.ChildNodes.Nodes['enderDest'].ChildNodes.Nodes['xPais'].Text;
        Cadastros[i*2+1].foneCad   := nodeDest.ChildNodes.Nodes['enderDest'].ChildNodes.Nodes['fone'].Text;
        Cadastros[i*2+1].CUFCad    := Copy(Cadastros[i*2+1].CMunCad,1,2);

        if Cadastros[i*2+1].CPaisCad = '' then
          Cadastros[i*2+1].CPaisCad := '1058'; //Brasil
      end;
    end;
  except
    Screen.Cursor := crDefault;
  end;
end;

procedure TFImpCadastroXML.BtOkClick(Sender: TObject);
var codCad, i : Integer;
    CadastrosRealizados : String;
begin
  Screen.Cursor := crHourGlass;
  CadastrosRealizados := '';
  LeArquivoXML;
  for i := 0 to Length(Cadastros) -1 do
  begin
    if Cadastros[i] <> nil then
    begin
      codCad := DMNfe.OPNfe.CallIntegerFunction('COMPARA_CNPJ',[Cadastros[i].CnpjCad]);
      if codCad = 0 then
      begin
        RealizaCadastro(Cadastros[i]);
        CadastrosRealizados := CadastrosRealizados + chr(13)+chr(10)+ Cadastros[i].NomeCad;
      end;
    end;
  end;
  Screen.Cursor := crDefault;
  if(CadastrosRealizados <> '') then
    MessageDlg('Cadastros importados com sucesso!'+ chr(13)+chr(10)+ CadastrosRealizados,mtConfirmation,[mbOK],0)
  else
    MessageDlg('Os Cadastros já estavam presentes no banco de dados!' + chr(13)+chr(10)+ 'Nenhum registro importado.',mtConfirmation,[mbOK],0);
  ModalResult := mrOk;
end;
procedure TFImpCadastroXML.RealizaCadastro(Cadastro: TCadastro);
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
    buscador.Adiciona('SELECT COUNT(*) FROM TB_CIDADE WHERE COD_CIDADE_IBGE = ' + copy(Cadastro.CMunCad,3,5) +
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
      + ' AND COD_ESTADO = ' + QuotedStr(Cadastro.UFCad);;
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
    wSql := wSql + 'NUM_INSCRICAO, DT_CADASTRO, IND_SEXO_CATEGORIA, DESC_TELEFONE, DESC_BAIRRO, ';
    wSql := wSql + 'DESC_FANTASIA, IND_FISICA_JURIDICA, COD_USUARIO) VALUES ( ';
    wSql := wSql + 'SQCADASTRO.NEXTVAL, ' + quotedStr(Cadastro.NomeCad) + ', ' + '2' + ', ' + quotedStr(Cadastro.UFCad) + ', ';
    wSql := wSql + wCodPais +', '+ quotedStr(Cadastro.LgrCad + ', ' + Cadastro.NroCad) + ', ' + quotedStr(Cadastro.MunCad) + ', ' + wCodcidade + ', ';
    wSql := wSql + quotedStr(Cadastro.CepCad) + ', ' + quotedStr(Cadastro.CnpjCad) + ', ' + quotedStr(Cadastro.IECad) + ', ';
    wSql := wSql + quotedStr(DateToStr(DataServ)) + ', ' + quotedStr('M') + ', ' + quotedStr(Cadastro.FoneCad) + ', ' + quotedStr(Cadastro.BairroCad) + ', ';
    wSql := wSql + quotedStr(copy(Cadastro.FantCad,1,30)) + ', ' + quotedStr('J') + ', ' + IntToStr(DMUsuario.CodUsuarioCorrente) + ')';
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
end.
