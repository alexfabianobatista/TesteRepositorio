unit URConhecimentosCidades;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, QRExport, QRPDFFilt, QRWebFilt, Variants,
  grimgctrl;

type
  TFRConhecimentosCidades = class(TForm)
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
    QRDBText1: TQRDBText;
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRGroup2: TQRGroup;
    QRLabel12: TQRLabel;
    QRDBText4: TQRDBText;
    QRBand3: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLEmissao: TQRLabel;
    QRLEntrega: TQRLabel;
    QRDBText12: TQRDBText;
    procedure FormCreate(Sender: TObject);
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
    fCod_Filial : Real;
  public
    { Public declarations }
    Property pCod_Filial : Real Read fCod_Filial Write fCod_Filial;

  end;

var
  FRConhecimentosCidades: TFRConhecimentosCidades;

implementation

uses UOracle_cl, UCadastro_cl, UConhecimento_cl;

{$R *.DFM}


procedure TFRConhecimentosCidades.FormCreate(Sender: TObject);
var
  wEmail : TQREmail;
  Buscador: TBuscador;
  wPortaSmtp: String;
//  wSql, wRes :array of String;
begin
//  setLength(wSql,3);
//  setLength(wRes,3);

//  wSql[0] := 'SELECT DESC_EMAIL FROM TB_EMAIL';
//  wSql[1] := 'SELECT DESC_SENHA FROM TB_EMAIL';
//  wSql[2] := 'SELECT DESC_SMTP FROM TB_EMAIL';
  Buscador := TBuscador.Create;
  Buscador.Limpa;
  Buscador.Adiciona('DESC_EMAIL', 'TB_EMAIL');
  Buscador.Adiciona('DESC_SENHA', 'TB_EMAIL');
  Buscador.Adiciona('DESC_SMTP', 'TB_EMAIL');
  Buscador.Adiciona('NUM_PORTA_SMTP','TB_EMAIL');
  Buscador.Adiciona('IND_SSL', 'TB_EMAIL');
  Buscador.Adiciona('DESC_EMPRESA', 'TB_PARAM_SISTEMA');
  Buscador.Buscar;

//  DMOracle.BuscaNomes(wSql, wRes);

//  wEmail.User := wRes[0];
//  wEmail.Password := wRes[1];
//  wEmail.Host := wRes[2];
  wEmail.EmailAddress := Buscador.Proximo;
  wEmail.Password := Buscador.Proximo;
  wEmail.Smtp := Buscador.Proximo;

  wPortaSmtp := Buscador.Proximo;
  if(wPortaSmtp <> '') then
    wEmail.SmtpPort := StrToInt(wPortaSmtp);
  wEmail.SSL := Buscador.Proximo = 'S';
  QRLEmpresa.Caption := 'Empresa: ' + Buscador.Proximo;

  QRPrimario.Email := wEmail;

//  QRLEmpresa.Caption := 'Empresa: '+DMOracle.BuscaNome('SELECT DESC_EMPRESA FROM TB_PARAM_SISTEMA ',
//                                                       'COD_FILIAL >= 0');
  QRLNomeRel.Caption := Self.Name;
end;

procedure TFRConhecimentosCidades.QRPrimarioBeforePrint(Sender: TCustomQuickRep;
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
end;

end.
