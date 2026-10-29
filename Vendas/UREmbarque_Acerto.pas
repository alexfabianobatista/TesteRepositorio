unit UREmbarque_Acerto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFREmbarque_Acerto = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText5: TQRDBText;
    QRCompositeReport1: TQRCompositeReport;
    QRLabel22: TQRLabel;
    QRLNota: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRLabel25: TQRLabel;
    QRShape14: TQRShape;
    QRDBText8: TQRDBText;
    QRDBText3: TQRDBText;
    QRLNumero: TQRLabel;
    QRLabel26: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    procedure QRCompositeReport1AddReports(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FREmbarque_Acerto: TFREmbarque_Acerto;

implementation

uses UEmbarque_cl, UREmbarque3;

{$R *.DFM}

procedure TFREmbarque_Acerto.QRCompositeReport1AddReports(Sender: TObject);
begin
  inherited;
  QRCompositeReport1.Reports.Add(FREmbarque_Acerto.QRPrimario);
  QRCompositeReport1.Reports.Add(FREmbarque3.QRPrimario);
end;

end.
