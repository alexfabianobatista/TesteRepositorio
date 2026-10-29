unit URFunruralPeriodo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRFunruralPeriodo = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRGroup1: TQRGroup;
    QRBand4: TQRBand;
    QRBand5: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel10: TQRLabel;
    QRGroup2: TQRGroup;
    QRBand6: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRExpr3: TQRExpr;
    QRDBText13: TQRDBText;
    QRLabel14: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel15: TQRLabel;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRDBText8: TQRDBText;
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRFunruralPeriodo: TFRFunruralPeriodo;

implementation

uses UNotaEntrada_cl;

{$R *.DFM}

procedure TFRFunruralPeriodo.QRPrimarioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
  wValor: Real;
  wNumero: Integer;
  wFilial: Integer;
begin
  inherited;
  DMNotaEntrada.QRFunRural.First;
  wNumero := -1;
  wFilial := -1;
  wValor := 0;
  while not DMNotaEntrada.QRFunRural.Eof do
  begin
    if (DMNotaEntrada.QRFunRuralCOD_FILIAL.Value <> wFilial) or
        (DMNotaEntrada.QRFunRuralNUM_NOTA.Value <> wNumero) then
    begin
      wFilial := DMNotaEntrada.QRFunRuralCOD_FILIAL.Value;
      wNumero := DMNotaEntrada.QRFunRuralNUM_NOTA.Value;
      wValor := wValor + DMNotaEntrada.QRFunRuralVAL_FUNRURAL.Value;
    end;
    DMNotaEntrada.QRFunRural.Next;
  end;
//  QRLValTotalFunrural.Caption := FormatFloat('#,##0.00', wValor);
end;

end.
