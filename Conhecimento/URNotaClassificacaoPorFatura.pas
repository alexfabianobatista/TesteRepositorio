unit URNotaClassificacaoPorFatura;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls;

type
  TFRNotaClassificacaoPorFatura = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    DetailBand1: TQRBand;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRBand4: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr1: TQRExpr;
    QRBand3: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel19: TQRLabel;
    QRETotalDiferenca: TQRExpr;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRETotalValor: TQRExpr;
    QRLabel22: TQRLabel;
    QRLTotalDiferenca: TQRLabel;
    QRLTotalValor: TQRLabel;
    procedure FormCreate(Sender: TObject);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
    wTotalDiferenca : real;
    wTotalValor : real;
  public
    { Public declarations }
  end;

var
  FRNotaClassificacaoPorFatura: TFRNotaClassificacaoPorFatura;

implementation

uses UNotaClassificacao_cl;

{$R *.DFM}

procedure TFRNotaClassificacaoPorFatura.FormCreate(Sender: TObject);
begin
  inherited;
  wTotalDiferenca := 0;
  wTotalValor := 0;
end;

procedure TFRNotaClassificacaoPorFatura.QRBand4BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  wTotalDiferenca := wTotalDiferenca + QRETotalDiferenca.Value.dblResult;
  wTotalValor := wTotalValor + QRETotalValor.Value.dblResult;
end;

procedure TFRNotaClassificacaoPorFatura.QRBand3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  QRLTotalDiferenca.Caption := FormatFloat('#,##0', wTotalDiferenca);
  QRLTotalValor.Caption := FormatFloat('#,##0.00', wTotalValor);

  wTotalValor := 0;
  wTotalDiferenca := 0;
end;

procedure TFRNotaClassificacaoPorFatura.QRPrimarioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  wTotalValor := 0;
  wTotalDiferenca := 0;
end;

end.
