unit UROSPreFechamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFROSPreFechamento = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRBand4: TQRBand;
    QRLabel14: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel15: TQRLabel;
    QRDBText14: TQRDBText;
    QRExpr2: TQRExpr;
    QRCompositeReport1: TQRCompositeReport;
    QRBand5: TQRBand;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    procedure QRCompositeReport1AddReports(Sender: TObject);
    procedure QRBand4AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FROSPreFechamento: TFROSPreFechamento;

implementation

uses UOficina_cl, UROSPreFechamentoServTerceiro, URServico_Terceiro,
  UROSPreFechamentoMO;

{$R *.DFM}

procedure TFROSPreFechamento.QRCompositeReport1AddReports(Sender: TObject);
begin
  inherited;
  QRCompositeReport1.Reports.Add(FROsPreFechamento.QRPrimario);
  QRCompositeReport1.Reports.Add(FRServico_Terceiro.QRPrimario);
  QRCompositeReport1.Reports.Add(FROsPreFechamentoMO.QRPrimario);
end;

procedure TFROSPreFechamento.QRBand4AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  QRPrimario.NewPage;
end;

end.
