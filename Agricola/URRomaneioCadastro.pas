unit URRomaneioCadastro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRRomaneioCadastro = class(TFTRelSimples)
    QRGCadastro: TQRGroup;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel16: TQRLabel;
    QRLDesc: TQRLabel;
    QRBTotCliente: TQRBand;
    QRLabel17: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel7: TQRLabel;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRDBText16: TQRDBText;
    QRLFilial: TQRLabel;
    QRBand4: TQRBand;
    QRLabel9: TQRLabel;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRLabel11: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText10: TQRDBText;
    QRExpr17: TQRExpr;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRRomaneioCadastro: TFRRomaneioCadastro;

implementation

uses URomaneioAgricola_cl;

{$R *.DFM}

procedure TFRRomaneioCadastro.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var wTotal : Real;
begin
  inherited;
  With DMRomaneioAgricola do
  Begin
    wTotal := QRCadastroSQT_UMIDADE.Value
             +QRCadastroSQT_IMPUREZA.Value
             +QRCadastroSQT_ARDIDOS.Value;
//             +QRCadastroSQT_DIVERSOS.Value;
  End;
  QRLDesc.Caption := FormatFloat('###,##0',wTotal);
end;

end.
