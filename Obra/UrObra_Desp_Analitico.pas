unit UrObra_Desp_Analitico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QuickRpt, QRExport, Qrctrls, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFrObra_Desp_Analitico = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRGroup2: TQRGroup;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    QRBand3: TQRBand;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRBand4: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRDBText8: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel12: TQRLabel;
    QRLCompetencia: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText10: TQRDBText;
    QRExpr3: TQRExpr;
    QRLabel8: TQRLabel;
    QRDBText7: TQRDBText;
    QRBand5: TQRBand;
    QRLabel14: TQRLabel;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRLabel15: TQRLabel;
    QRDBText11: TQRDBText;
    QRBand6: TQRBand;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel18: TQRLabel;
    QRExpr8: TQRExpr;
    QRLabel19: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel20: TQRLabel;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    procedure QRGroup2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrObra_Desp_Analitico: TFrObra_Desp_Analitico;
  wVlAcumulado : Real;

implementation

uses UObra_Rel_cl;

{$R *.DFM}

procedure TFrObra_Desp_Analitico.QRGroup2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
//  wVlAcumulado := 0;
end;

procedure TFrObra_Desp_Analitico.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
//  wVlAcumulado := wVlAcumulado + DMObra_Rel.QrObra_Desp_AnaliticoValor.Value;
//  QRLAcumulado.Caption := FormatFloat('#,##0.00',wVlAcumulado);
end;

procedure TFrObra_Desp_Analitico.FormCreate(Sender: TObject);
begin
  inherited;
  if QRPrimario.DataSet = nil then
    QRPrimario.DataSet := DMObra_Rel.QrObra_Desp_Analitico;
end;

End.
