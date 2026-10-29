unit URMaioresClientes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport;

type
  TFrMaioresClientes = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QrSequencia: TQRLabel;
    QRLabel7: TQRLabel;
    QRCompositeReport1: TQRCompositeReport;
    QRBand4: TQRBand;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText5: TQRDBText;
    QRBand5: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr1: TQRExpr;
    QRDBText6: TQRDBText;
    QRLabel11: TQRLabel;
    QRSysData3: TQRSysData;
    QRLSupervisor: TQRLabel;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRCompositeReport1AddReports(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrMaioresClientes: TFrMaioresClientes;
  wSequencia:Integer;

implementation

uses URelatorioVenda_cl, URMaioresClientesVend;

{$R *.DFM}

procedure TFrMaioresClientes.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  Inc(wSequencia);
  QrSequencia.Caption := FloatToStr(wSequencia);
end;

procedure TFrMaioresClientes.QRPrimarioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  wSequencia := 0;
end;

procedure TFrMaioresClientes.QRCompositeReport1AddReports(Sender: TObject);
begin
  inherited;
  QRCompositeReport1.Reports.Add(FRMaioresClientesVend.QRPrimario);
  QRCompositeReport1.Reports.Add(FRMaioresClientes.QRPrimario);
end;

end.
