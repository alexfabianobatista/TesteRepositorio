unit UREmbarquePedNf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFrEmbarque_Ped_Nf = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRBand7: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRGroup3: TQRGroup;
    QRLabel12: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel13: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr6: TQRExpr;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText6: TQRDBText;
    QRGroup1: TQRGroup;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel5: TQRLabel;
    QRExpr3: TQRExpr;
    QRBand4: TQRBand;
    QRLabel9: TQRLabel;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr1: TQRExpr;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrEmbarque_Ped_Nf: TFrEmbarque_Ped_Nf;

implementation

uses UEmbarque_cl, UrEmbarquePedNf1, UParamSistema_cl;

{$R *.DFM}

procedure TFrEmbarque_Ped_Nf.QRPrimarioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  if ((DMParamSistema.QParamSistemaCOD_EMPRESA.text = 'TEMPERMED') OR
      (DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'TEMPERFOZ'))Then
  Begin
    QRGroup1.Enabled := False;
    QRBand4.Enabled := False;
    QRDBText6.Enabled := False;
    QRDBText7.Enabled := True;
    QRDBText8.Enabled := True;
    QRExpr1.Left    := 665;
    QRExpr2.Left    := 420;
    QRExpr3.Left    := 665;
    QRExpr6.Left    := 582;
    QRDBText1.Left  := 2;
    QRDBText11.Left := 70;
    QRDBText2.Left  := 480;
    QRDBText5.Left  := 582;
    QRDBText7.Left  := 160;
    QRDBText8.Left  := 190;
    QRLabel6.Left   := 482;
    QRLabel8.Left   := 582;
    QRLabel5.Left   := 695;
    QRLabel3.left   := 25;
    QRLabel7.Enabled := FALSE;
  end;
end;

end.
