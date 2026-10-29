unit URContrato_GP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, StdCtrls, QRExport, QRWebFilt,
  QRPDFFilt;

type
  TFRContrato_GP = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRLabel9: TQRLabel;
    QRDBText1: TQRDBText;
    QRBand4: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText6: TQRDBText;
    QRGroup2: TQRGroup;
    QRDBText10: TQRDBText;
    QRLabel10: TQRLabel;
    QRBand5: TQRBand;
    QRBand6: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText9: TQRDBText;
    QRLVendedor: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText11: TQRDBText;
    QRBand3: TQRBand;
    QRLabel6: TQRLabel;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRLabel18: TQRLabel;
    QRExpr9: TQRExpr;
    QRLPeriodo: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel20: TQRLabel;
    QRExpr11: TQRExpr;
    QRLabel21: TQRLabel;
    QRExpr7: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr12: TQRExpr;
    QRLabel8: TQRLabel;
    QRLabel22: TQRLabel;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRLabel12: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel25: TQRLabel;
    QRDBText17: TQRDBText;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRContrato_GP: TFRContrato_GP;

implementation

uses Ucontrato_cl;

{$R *.DFM}

procedure TFRContrato_GP.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  If DMContrato.QRContrato_GPDesc_Observacao.Value = '' Then
     QRBand4.Height := 20
  Else
     QRBand4.Height := 35;

end;

end.
