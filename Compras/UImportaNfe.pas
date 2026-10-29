unit UImportaNfe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFmNota, StdCtrls, Buttons, xmldom, XMLIntf, msxmldom, XMLDoc, Oracle,
  Mask, UBiblioteca, UAguardoBloqueado, NfeCliente, NFeRPCRetorno;

type
  TFImportaNfe = class(TForm)
    FmNota: TFmNota;
    BtImportar: TBitBtn;
    ODXmlEntrada: TOpenDialog;
    XML: TXMLDocument;
    MEFilial: TMaskEdit;
    Label1: TLabel;
    SDXmlEntrada: TSaveDialog;
    CBConsultar: TCheckBox;
    procedure BtImportarClick(Sender: TObject);
    procedure FmNota1MeNotaExit(Sender: TObject);
    procedure FmNota1BtNotaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MEFilialExit(Sender: TObject);
  private
    procedure VerificaConsulta(Sender: TObject; Tentativa: Integer;
      Parametros: TVariantMap; var Acao: TExecucaoAction; var Msg: String);
    function StringEntre(Str, de, ate: String): String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FImportaNfe: TFImportaNfe;

implementation

uses UNfe_cl, UOracle_cl, UAguardoNfe, UNotaEntrada_cl, UFilial_cl, StrUtils,
  UNFeRetorno;

{$R *.dfm}

procedure TFImportaNfe.BtImportarClick(Sender: TObject);
  procedure Importa(CodNota, Chave, StrXML: String);
  var
    i: Integer;
    Msg: TMensagem;
    Arquivo: String;
  begin
    Msg := TMensagem.Create(StrXML, 255);

    //Limpando o campo no banco.
    Executador.Adiciona('BIN_XML_NFE = ''''', 'TB_NOTA_CAB', 'COD_NOTA_CAB = ' + CodNota);
    while (Msg.HasNext) do
    begin
      Arquivo := '';
      for i := 0 to 3 do
        if Msg.HasNext then
          Arquivo := Arquivo + ' || ' + QuotedStr(Msg.Next)
        else
          Break;

      //Inserindo o XML por partes, porque, tudo de uma vez só, dá erro de banco.
      Executador.Adiciona('BIN_XML_NFE = BIN_XML_NFE ' + Arquivo, 'TB_NOTA_CAB',
          'COD_NOTA_CAB = ' + CodNota);
    end;
    Executador.Adiciona(MontaUpdate('DESC_CHAVE_ACESSO', QuotedStr(
        Bib.LimpaNumero(Chave)), 'TB_NOTA_CAB', 'COD_NOTA_CAB = ' + CodNota));
  end;
var
  Rep, NNf, Nota, Filial, Arquivo, Chave, SistemaNfe, Uf, Amb: String;
  Aguardo: TAguardoBloqueado;
  Exec: TExecucaoConsultaProtocolo;
  Str: TStrings;
begin
  Nota := Trim(FmNota.MeNota.Text);
  Filial := Trim(MEFilial.Text);
  if Nota = '' then
  begin
    MessageDlg('Por favor, informe a nota.', mtError, [mbOK], 0);
    Exit;
  end;
  with DMNotaEntrada do
  begin
    if not (Nota = QNotaEntradaCOD_NOTA_CAB.Text) then
    begin
      QNotaEntrada.Close;
      QNotaEntrada.SetVariable('PK', Nota);
      QNotaEntrada.Open;
    end;

    if QNotaEntradaIND_SITUACAO.Value <> '2' then
    begin
      MessageDlg('A nota de entrada precisa estar confirmada.', mtError, [mbOK], 0);
      Exit;
    end;
  end;
  if ODXmlEntrada.Execute then
  begin
    Arquivo := ODXmlEntrada.FileName;
    if Arquivo = '' then
    begin
      MessageDlg('Por favor, informe um arquivo.', mtError, [mbOK], 0);
      Exit;
    end;
    try
//      XML.LoadFromFile(Arquivo);
      Str := TStringList.Create;
      Str.LoadFromFile(Arquivo);
      Chave := Str.Text;
      Chave := Copy(Chave, PosEx('Id=', Chave) + 4, 47); //Gambiarra obrigada pelo Delphi. XMLDocument não ta axando as TAGs e nem os atributos mais.
      Chave := DMNfe.LimpaChave(Chave);
    except
      on E: Exception do
      begin
        MessageDlg('Erro ao carregar arquivo.' + #13 + #10 +
            E.Message, mtError, [mbOK], 0);
        Exit;
      end;
    end;

    if DMFilial.QFilialCOD_FILIAL.Text = Filial then
      SistemaNfe := DMFilial.QFilialIND_SISTEMA_NFE.Text
    else
      SistemaNfe := DMOracle.FastSelect('IND_SISTEMA_NFE', 'TB_FILIAL', 'COD_FILIAL = ' + Filial);

    Uf := StringEntre(Str.Text, '<cUF>', '</cUF>');
//    XML.DocumentElement.ChildNodes['NFe'].ChildNodes['infNFe'].
//        ChildNodes['ide'].ChildNodes['cUF'].Text;
    Executador.Limpa;
    if not CBConsultar.Checked then
      Importa(Nota, Chave, Str.Text)
    else if (SistemaNfe = '3') then
    begin
      Rep := DMOracle.FastSelect('DESC_REPOSITORIO_NFE', 'TB_FILIAL',
          'COD_FILIAL = ' + Filial);
      Amb := StringEntre(Str.Text, '<tpAmb>', '</tpAmb>');
//      XML.DocumentElement.ChildNodes.FindNode('NFe').ChildNodes.
//        FindNode('infNFe').ChildNodes.FindNode('ide').ChildValues['tpAmb'];
      NNf := StringEntre(Str.Text, '<nNF>', '</nNF>');
//      XML.DocumentElement.ChildNodes.FindNode('NFe').ChildNodes.
//        FindNode('infNFe').ChildNodes.FindNode('ide').ChildValues['nNF'];
      Exec := TExecucaoConsultaProtocolo.Create(Rep, StrToInt('0' + Filial),
          StrToInt('0' + Uf), StrToInt(Amb), StrToInt(NNf), Chave);
      DMNfe.ExecutaAcoes(TExecucoesList.Create.Add(Exec), False);
//      Cli.ConsultaChave(StrToInt('0' + Filial), StrToInt('0' + Uf),
//          StrToInt(Amb), Bib.LimpaNumero(Chave));
      if not (Exec.Retorno.Status in SIT_NFE_ACEITO) then
      begin
        MessageDlg('Não foi possível validar NF-e na SEFAZ.', mtError, [mbOK], 0);
        if FNFeRetorno = nil then
          FNFeRetorno := TFNFeRetorno.Create(Application);
        FNFeRetorno.Carrega(ACAO_CONS_PROT, Exec.Retorno);
        FNFeRetorno.ShowModal;
        Exit;
      end;
      Importa(Nota, Chave, Str.Text);
    end
    else  //Nota de fora do estado, apenas importar.
    begin
      if (MessageDlg('Não é possível consultar a nota. Continuar', mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then
        Exit;
      Importa(Nota, Chave, Str.Text);
    end;
    Executador.Executar(True, True);
    MessageDlg('Importação efetuada com êxito.', mtInformation, [mbOK], 0);
    Close;
  end;
end;

procedure TFImportaNfe.FmNota1MeNotaExit(Sender: TObject);
begin
  FmNota.MeNotaExit(Sender);
  MEFilial.Text := '';
  if Trim(FmNota.MeNota.Text) <> '' then
    MEFilial.Text := DMOracle.FastSelect('COD_FILIAL', 'TB_NOTA_CAB',
      'COD_NOTA_CAB = ' + FmNota.MeNota.Text, True);
end;

procedure TFImportaNfe.FmNota1BtNotaClick(Sender: TObject);
begin
  FmNota.BtNotaClick(Sender);
  FmNota1MeNotaExit(FmNota.MeNota);
end;

procedure TFImportaNfe.FormCreate(Sender: TObject);
begin
  Constraints.MinHeight := Height;
  Constraints.MinWidth := Width;
end;

procedure TFImportaNfe.VerificaConsulta(Sender: TObject;
  Tentativa: Integer; Parametros: TVariantMap; var Acao: TExecucaoAction;
  var Msg: String);
begin
  with DMNfe do
  begin
    SetaNfeConsEntr(Parametros.getValue('CHAVE'));
    if QNfeConsEntrind_aprovado.Value then
      Acao := eaOk
    else if not QNfeConsEntrDESC_RETORNO_PROCESSAMENTO.IsNull then //Retornou da SEFAZ, mas não está autorizada.
    begin
      Acao := eaAbort;
      Msg := QNfeConsEntrDESC_MSG_VALIDACAO_LOTE.Value;
    end
    else
      Msg := 'Não houve retorno da SEFAZ, talvez o Servidor NF-e não esteja funcionando.';
    QNfeConsEntr.Close;
  end;
end;

function TFImportaNfe.StringEntre(Str, de, ate: String): String;
var
  x, y: Integer;
begin
  x := PosEx(de, Str) + Length(de);
  y := PosEx(ate, Str, x) - x;
  Result := Copy(Str, x, y);
end;

procedure TFImportaNfe.MEFilialExit(Sender: TObject);
begin
  DMOracle.ValidaFilial(MEFilial.Text);
end;

end.

