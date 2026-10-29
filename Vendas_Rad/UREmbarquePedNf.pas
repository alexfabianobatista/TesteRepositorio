unit UREmbarquePedNf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport;

type
  TFrEmbarque_Ped_Nf = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRBand4: TQRBand;
    QRDBText5: TQRDBText;
    QRGroup1: TQRGroup;
    QRBand5: TQRBand;
    QRLabel9: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel11: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRCompositeReport1: TQRCompositeReport;
    QRLabel10: TQRLabel;
    QRDBText8: TQRDBText;
    QRBand6: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel7: TQRLabel;
    QRExpr1: TQRExpr;
    procedure QRCompositeReport1AddReports(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrEmbarque_Ped_Nf: TFrEmbarque_Ped_Nf;

implementation

uses UEmbarque_cl, UrEmbarquePedNf1;

{$R *.DFM}

procedure TFrEmbarque_Ped_Nf.QRCompositeReport1AddReports(Sender: TObject);
begin
  inherited;
  QRCompositeReport1.Reports.Add(FREmbarque_Ped_Nf.QRPrimario);
  QRCompositeReport1.Reports.Add(FREmbarque_Ped_Nf1.QRPrimario);
end;

end.
