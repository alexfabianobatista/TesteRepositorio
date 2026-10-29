unit URBancoMov_Cheques_CC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRBancoMov_Cheques_CC = class(TFTRelSimples)
    QRLPeriodo: TQRLabel;
    QRGroup1: TQRGroup;
    QRBand5: TQRBand;
    QRLabel8: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRExpr1: TQRExpr;
    QRBand4: TQRBand;
    QRLabel4: TQRLabel;
    QRExpr2: TQRExpr;
    QRLHistorico: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel5: TQRLabel;
    ChildBand1: TQRChildBand;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRBancoMov_Cheques_CC: TFRBancoMov_Cheques_CC;

implementation

uses UBancoAgencia_cl, UBancoAgenciaRel_cl;

{$R *.DFM}

procedure TFRBancoMov_Cheques_CC.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  With DMBancoAgenciaRel do
  QRLHistorico.Caption := Trim(QRBancoMov_Cheques_CCDesc_Historico.Text) + ' - ' + Trim(QRBancoMov_Cheques_CCNome.Text);
end;

end.
