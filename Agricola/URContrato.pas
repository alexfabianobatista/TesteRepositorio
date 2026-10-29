unit URContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRContrato = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRBand3: TQRBand;
    QRGroup2: TQRGroup;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRBand4: TQRBand;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRBand5: TQRBand;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel9: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel10: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel11: TQRLabel;
    QRDBText5: TQRDBText;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRLabel12: TQRLabel;
    QRDBText7: TQRDBText;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRLabel13: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRGroup3: TQRGroup;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel14: TQRLabel;
    QRLTipo: TQRLabel;
    QRLabel15: TQRLabel;
    QRBand6: TQRBand;
    QRLabel16: TQRLabel;
    QRExpr5: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRDBText15: TQRDBText;
    QRLTipoPagto: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText18: TQRDBText;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRContrato: TFRContrato;

implementation

uses Ucontrato_cl;

{$R *.DFM}

procedure TFRContrato.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  If DMContrato.QRContratoDesc_Observacao.Value = '' Then
     QRBand5.Height := 20
  Else
     QRBand5.Height := 35;
end;

end.
