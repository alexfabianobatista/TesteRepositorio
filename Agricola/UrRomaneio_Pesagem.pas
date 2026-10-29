unit UrRomaneio_Pesagem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, jpeg, QRExport, QRPDFFilt, QRWebFilt;

type
  TFRRomaneio_Pesagem = class(TForm)
    QRPrimario: TQuickRep;
    QRBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText14: TQRDBText;
    QRLTipo: TQRLabel;
    QRLNome: TQRLabel;
    QRLUsuario: TQRLabel;
    QRDBText16: TQRDBText;
    QRLEndereco: TQRLabel;
    QRLCidade: TQRLabel;
    QRDBText4: TQRDBText;
    QRShape3: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText10: TQRDBText;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel1: TQRLabel;
    QRDBText11: TQRDBText;
    QRLMensagem: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRILogo: TQRImage;
    QRTextFilter1: TQRTextFilter;
    QRPDFFilter1: TQRPDFFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRLInmetro: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRRomaneio_Pesagem: TFRRomaneio_Pesagem;

implementation

uses URomaneioAgricola_cl, UOracle_cl, UFilial_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFRRomaneio_Pesagem.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
 x, y: array of string;
begin
  setLength(x, 8); //8 sql diferentes
  setLength(y, 8);

  x[0] := 'SELECT DESC_PRODUTO FROM TB_PRODUTO WHERE COD_PRODUTO = '+FloatToStr(DMRomaneioAgricola.QRomaneioCod_Produto.Value);
  x[1] := 'SELECT NOME FROM TB_CADASTRO WHERE COD_CADASTRO = '+FloatToStr(DMRomaneioAgricola.QRomaneioCod_Cadastro.Value);
  x[2] := 'SELECT NOME FROM TB_USUARIO WHERE COD_USUARIO = '+FloatToStr(DMRomaneioAgricola.QRomaneioCod_Usuario.Value);
  x[3] := 'SELECT DESC_ENDERECO FROM TB_CADASTRO WHERE COD_CADASTRO = '+FloatToStr(DMRomaneioAgricola.QRomaneioCod_Cadastro.Value);
  x[4] := 'SELECT DESC_CIDADE FROM TB_CADASTRO WHERE COD_CADASTRO = '+FloatToStr(DMRomaneioAgricola.QRomaneioCod_Cadastro.Value);
  x[5] := 'SELECT COD_ESTADO FROM TB_CADASTRO WHERE COD_CADASTRO = '+FloatToStr(DMRomaneioAgricola.QRomaneioCod_Cadastro.Value);
  x[6] := 'SELECT NUM_CGC_CPF FROM TB_CADASTRO WHERE COD_CADASTRO = '+FloatToStr(DMRomaneioAgricola.QRomaneioCod_Cadastro.Value);
  x[7] := 'SELECT NUM_INSCRICAO FROM TB_CADASTRO WHERE COD_CADASTRO = '+FloatToStr(DMRomaneioAgricola.QRomaneioCod_Cadastro.Value);

  DMOracle.BuscaNomes(x, y);

//  QRLProduto.Caption:=y[0];
  QRLNome.Caption:=Y[1];
  If DMRomaneioAgricola.QRomaneioCod_Mensagem.Text <> '' Then
     QRLMensagem.Caption:=DMOracle.BuscaNome('SELECT DESC_MENSAGEM FROM TB_MENSAGEM','COD_MENSAGEM = '+FloatToStr(DMRomaneioAgricola.QRomaneioCod_Mensagem.Value))
  Else
     QRLMensagem.Caption:= DMRomaneioAgricola.QRomaneioDESC_OBSERVACAO.Value;
  QRLUsuario.Caption:=Y[2];
//  QRLEndereco_Cli.Caption := Y[3];
//  QRLCidade_Cli.Caption := Y[4] + '  UF:'+Y[5];
//  QRLCnpj.Caption := Y[6] + '    RG/IE.:'+Y[7];
  QRLEndereco.Caption := DMFilial.QFilialDesc_Endereco.Value + '- ' + DMFilial.QFilialDesc_Bairro.Value;
  QRLCidade.Caption := DMFilial.QFilialDesc_Cidade.Value + '-' + DMFilial.QFilialCod_Estado.Value + '   FONE:'+DMFilial.QFilialDesc_Telefone.Value;
  if DMParamSistema.CodEmpresa = 'INOVAR' then  //Junior 31/07/2019
  begin
    QRILogo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'logo\logo.jpg');
  end;
end;

procedure TFRRomaneio_Pesagem.FormCreate(Sender: TObject);
var
  wEmail : TQREmail;
  Buscador: TBuscador;
  wPortaSmtp: String;
begin
  Buscador := TBuscador.Create;
  Buscador.Limpa;
  Buscador.Adiciona('DESC_EMAIL', 'TB_EMAIL');
  Buscador.Adiciona('DESC_SENHA', 'TB_EMAIL');
  Buscador.Adiciona('DESC_SMTP', 'TB_EMAIL');
  Buscador.Adiciona('NUM_PORTA_SMTP','TB_EMAIL');
  Buscador.Adiciona('IND_SSL', 'TB_EMAIL');
  Buscador.Adiciona('DESC_EMPRESA', 'TB_PARAM_SISTEMA');
  Buscador.Buscar;

   wEmail.EmailAddress := Buscador.Proximo;
  wEmail.Password := Buscador.Proximo;
  wEmail.Smtp := Buscador.Proximo;

  wPortaSmtp := Buscador.Proximo;
  if(wPortaSmtp <> '') then
    wEmail.SmtpPort := StrToInt(wPortaSmtp);
  wEmail.SSL := Buscador.Proximo = 'S';
//  QRLEmpresa.Caption := 'Empresa: ' + Buscador.Proximo;

  QRPrimario.Email := wEmail;
//  QRLNomeRel.Caption := Self.Name;

end;

procedure TFRRomaneio_Pesagem.QRPrimarioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  if QRPrimario.DataSet = nil then
    MessageDlg('Atenção!'+#13+#10+'O relatório que você está gerando perdeu sua conexão, ' +
        'provavelmente ele não trará registro algum.'+#13+#10+
        'Favor avisar a Cemapa sobre este relatório.'+#13+#10+
        'Dados técnicos: Relatório ' + Self.Name + ' perdeu seu DataSet.', mtWarning, [mbOK], 0);
  QRPrimario.PreviewInitialState := wsMaximized;
end;

end.
