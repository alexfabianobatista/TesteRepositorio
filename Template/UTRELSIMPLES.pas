unit UTRelSimples;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, QRExport, QRPDFFilt, QRWebFilt, Variants;

type
  TFTRelSimples = class(TForm)
    QRPrimario: TQuickRep;
    QRBand1: TQRBand;
    QRSysData2: TQRSysData;
    QRLabel2: TQRLabel;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRLTitulo: TQRLabel;
    QRLEmpresa: TQRLabel;
    QRSysData1: TQRSysData;
    QRLNomeRel: TQRLabel;
    QRTextFilter1: TQRTextFilter;
    QRPDFFilter1: TQRPDFFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    procedure FormCreate(Sender: TObject);
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
    fCod_Filial : Real;
    procedure EstatisticaUso;
  public
    { Public declarations }
    Property pCod_Filial : Real Read fCod_Filial Write fCod_Filial;

  end;

var
  FTRelSimples: TFTRelSimples;

implementation

uses UOracle_cl, UCadastro_cl, UUsuario_cl;

{$R *.DFM}


procedure TFTRelSimples.EstatisticaUso;
begin
  DMOracle.ExecutaSql('INSERT INTO TB_ESTATISTICA_USO'
    + ' VALUES (SQESTATISTICAUSO.NEXTVAL, '
    + QuotedStr(UpperCase(Copy(ExtractFileName(Application.ExeName), 0, Length(ExtractFileName(Application.ExeName))-4)))
    + ', ' + QuotedStr(UpperCase(QRLNomeRel.Caption))
    + ', ' + QuotedStr('RELATORIO')
    + ')');

end;

procedure TFTRelSimples.FormCreate(Sender: TObject);
var
  wEmail : TQREmail;
  Buscador: TBuscador;
  wPortaSmtp: String;
begin
  Buscador := TBuscador.Create;
  Buscador.Limpa;
  Buscador.Adiciona('DESC_EMAIL', 'TB_USUARIO','COD_USUARIO = '+IntToStr(DMUsuario.CodUsuarioCorrente));
  Buscador.Adiciona('DESC_SENHA_EMAIL', 'TB_USUARIO','COD_USUARIO = '+IntToStr(DMUsuario.CodUsuarioCorrente));
  Buscador.Adiciona('DESC_SMTP', 'TB_USUARIO','COD_USUARIO = '+IntToStr(DMUsuario.CodUsuarioCorrente));
  Buscador.Adiciona('NUM_PORTA_SMTP','TB_USUARIO','COD_USUARIO = '+IntToStr(DMUsuario.CodUsuarioCorrente));
  Buscador.Adiciona('IND_SSL', 'TB_USUARIO','COD_USUARIO = '+IntToStr(DMUsuario.CodUsuarioCorrente));
  Buscador.Adiciona('DESC_EMPRESA', 'TB_PARAM_SISTEMA');
  Buscador.Buscar;
  wEmail.EmailAddress := Buscador.Proximo;

  if wEmail.EmailAddress = '' then
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
  end;
  wEmail.Password := Buscador.Proximo;
  wEmail.Smtp := Buscador.Proximo;

  wPortaSmtp := Buscador.Proximo;
  if(wPortaSmtp <> '') then
    wEmail.SmtpPort := StrToInt(wPortaSmtp);
  wEmail.SSL := Buscador.Proximo = 'S';
  QRLEmpresa.Caption := 'Empresa: ' + Buscador.Proximo;

  QRPrimario.Email := wEmail;
  QRLNomeRel.Caption := Self.Name;
end;

procedure TFTRelSimples.QRPrimarioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  (*
  If (QRPrimario.QRPrinter.PaperWidth < QRPrimario.Page.Width)
     or
     (QRPrimario.QRPrinter.PaperLength < QRPrimario.Page.Length) Then
  Begin
    If MessageDlg('Dimensões do relatório diferente da Conf. da Impressora.'
               +#13+'Largura: Relatório='+ FloatToStr(QRPrimario.Page.Width)
               +' Drive='+FloatToStr(QRPrimario.QRPrinter.PaperWidth)
               +#13+'Comprimento: Relatório='+FloatToStr(QRPrimario.Page.Length)
               +' Drive='+FloatToStr( QRPrimario.QRPrinter.PaperLength ), mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    Begin
    End;
  End;
  *)
//  QRPrimario.QRPrinter.PaperLength := Round(QRPrimario.Page.Length);
//  QRPrimario.QRPrinter.PaperWidth := Round(QRPrimario.Page.Width);

(*
  If FRelPreview = Nil Then
    FRelPreview := TFRelPreview.Create(Application);
  FRelPreview.QRPreview.QRPrinter := QRPrimario.QRPrinter;
  FRelPreview.pLarguraPagina := QRPrimario.Page.
  FRelPreview.Show;
*)
  if QRPrimario.DataSet = nil then
    MessageDlg('Atenção!'+#13+#10+'O relatório que você está gerando perdeu sua conexão, ' +
        'provavelmente ele não trará registro algum.'+#13+#10+
        'Favor avisar a Cemapa sobre este relatório.'+#13+#10+
        'Dados técnicos: Relatório ' + Self.Name + ' perdeu seu DataSet.', mtWarning, [mbOK], 0);
  QRPrimario.PreviewInitialState := wsMaximized;
  EstatisticaUso;
end;

end.
