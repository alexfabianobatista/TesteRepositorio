unit URGastoVeiculo2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRGastoVeiculo2 = class(TFTRelSimples)
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
    QRLabel19: TQRLabel;
    QRGroup2: TQRGroup;
    QRDBText7: TQRDBText;
    DetailBand1: TQRBand;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRExpr1: TQRExpr;
    QRDBText13: TQRDBText;
    QRDBText12: TQRDBText;
    QRLMedia: TQRLabel;
    QRBand3: TQRBand;
    QRLabel15: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRBand4: TQRBand;
    QRLabel16: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText14: TQRDBText;
    QRLMediaProduto: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLMediaProdutoPrint(sender: TObject; var Value: String);
    procedure QRGroup2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRGastoVeiculo2: TFRGastoVeiculo2;
  UltKm: Real;
  TotalMedia: Real;
  QtItensMedia: Integer;

implementation

uses UCustoVeiculoMov_cl;

{$R *.dfm}

procedure TFRGastoVeiculo2.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  wKm: Real;
begin
  inherited;
  QRLMedia.Caption := '';
  with DMCustoVeiculoMov do
    if QRGastoVeiculo2IND_KM.Value = 'S' then
    begin
      if UltKm < 0 then
        UltKm := DMCustoVeiculoMov.QRGastoVeiculo2ULT_KM.Value;
      if UltKm > 0 then
      begin
        wKm := DMCustoVeiculoMov.QRGastoVeiculo2KM.Value - UltKm;
        QRLMedia.Caption := FormatFloat('#,##0.00', wKm / DMCustoVeiculoMov.QRGastoVeiculo2QT_QUANTIDADE.Value);
        TotalMedia := TotalMedia + (wKm / DMCustoVeiculoMov.QRGastoVeiculo2QT_QUANTIDADE.Value);
        Inc(QtItensMedia);
      end;
      UltKm := DMCustoVeiculoMov.QRGastoVeiculo2KM.Value;
    end;
end;

procedure TFRGastoVeiculo2.QRLMediaProdutoPrint(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := '';
  if (QtItensMedia > 0) and (DMCustoVeiculoMov.QRGastoVeiculo2IND_KM.Value = 'S') then
    Value := FormatFloat('#,##0.00', TotalMedia / QtItensMedia);
end;

procedure TFRGastoVeiculo2.QRGroup2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  UltKm := -1;
  TotalMedia := 0;
  QtItensMedia := 0;
end;

end.
