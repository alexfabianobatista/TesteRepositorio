unit URMedia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFRMedia = class(TFTRelSimples)
    QRLPeriodo: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText6: TQRDBText;
    QRShape1: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    Cadastro: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRExpr1: TQRExpr;
    QRDBText13: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText7: TQRDBText;
    QRBand4: TQRBand;
    QRLabel17: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRShape2: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText20: TQRDBText;
    QRLMedia: TQRLabel;
    QRLabel25: TQRLabel;
    QRLMediaFinal: TQRLabel;
    QREQtdeTotal: TQRExpr;
    QREValorTotal: TQRExpr;
    QREMedia: TQRExpr;
    QRMemo1: TQRMemo;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRLMediaFinalPrint(sender: TObject; var Value: String);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMedia: TFRMedia;
  UltKm: Real;
  TotalMedia: Real;

implementation

uses UCustoVeiculoMov_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFRMedia.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  wKm: Real;
begin
  inherited;
  QRLMedia.Caption := '';
  if UltKm < 0 then
    UltKm := DMCustoVeiculoMov.QRMediaULT_KM.Value;
  if UltKm > 0 then
  begin
    wKm := DMCustoVeiculoMov.QRMediaKM.Value - UltKm;
    QRLMedia.Caption := FormatFloat('#,##0.00', wKm / DMCustoVeiculoMov.QRMediaQTDE_MOV.Value);
    TotalMedia := TotalMedia + (wKm / DMCustoVeiculoMov.QRMediaQTDE_MOV.Value);
  end;
  UltKm := DMCustoVeiculoMov.QRMediaKM.Value;
end;

procedure TFRMedia.QRPrimarioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  UltKm := -1;
  TotalMedia := 0;
end;

procedure TFRMedia.QRLMediaFinalPrint(sender: TObject; var Value: String);
begin
  inherited;
  Value := FormatFloat('#,##0.00', TotalMedia / QRPrimario.DataSet.RecordCount);
end;

procedure TFRMedia.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  {if DMParamSistema.CodEmpresa = 'ESPINDOLA' then
  begin
    QRDBText14.Enabled    := False;
    QRDBText16.Enabled    := False;
    QRLMediaFinal.Enabled := False;

    QREQtdeTotal.Enabled  := True;
    QREValorTotal.Enabled := True;
    QREMedia.Enabled := True;

    QREQtdeTotal.Left := 212;
    QREValorTotal.Left:= 212;
    QREMedia.Left     := 212;
  end;}
end;

end.
