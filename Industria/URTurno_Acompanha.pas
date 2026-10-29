unit URTurno_Acompanha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRTurno_Acompanha = class(TFTRelSimples)
    QRGTurno: TQRGroup;
    QRGDia: TQRGroup;
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRBTotDia: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRBand4: TQRBand;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel11: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText10: TQRDBText;
    procedure QRBTotTurnoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGDiaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    fParado : Real;
    fTrabalhado : Real;
  public
    { Public declarations }
    Property pParado : Real Read fParado Write fParado ;
    Property pTrabalhado : Real Read fTrabalhado Write fTrabalhado ;
  end;

var
  FRTurno_Acompanha: TFRTurno_Acompanha;

implementation

uses UTurno_cl, UOracle_cl, UTurnoControle;

{$R *.DFM}

procedure TFRTurno_Acompanha.QRBTotTurnoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var wAux : String;
begin
  inherited;
  wAux := FloatToStr(pTrabalhado);
  wAux := StringReplace(wAux,',','.',[rfReplaceAll]);
end;

procedure TFRTurno_Acompanha.QRGDiaBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  pParado := 0;
  pTrabalhado := 0;
end;

procedure TFRTurno_Acompanha.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  With DMTurno do
  Begin
    pParado := pParado + QRAcompanhaSNum_Parado.Value;
    pTrabalhado := pTrabalhado + QRAcompanhaSNum_Trabalho.Value;
  End;
end;

end.
