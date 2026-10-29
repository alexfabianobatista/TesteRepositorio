unit UREmbarque_Rota;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport;

type
  TFREmbarque_Rota = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLTotalM1: TQRLabel;
    QRLTotalPE: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText7: TQRDBText;
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
     wContPE, wContM1:Integer;

  end;

var
  FREmbarque_Rota: TFREmbarque_Rota;

implementation

uses UEmbarque_cl;

{$R *.DFM}
  

procedure TFREmbarque_Rota.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  If Trim(DMEmbarque.QREmbarque_RotaCod_Serie.Value) = 'M1' Then
  begin
    QRDBText1.Font.Style := [FsBold];
    inc(wContM1);
  end
  Else
  begin
    QRDBText1.Font.Style := [];
    inc(wContPE);
  end;
end;

procedure TFREmbarque_Rota.QRPrimarioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  wContPE :=0;
  wContM1:=0;
end;

procedure TFREmbarque_Rota.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLTotalPE.Caption:=IntToStr(wContPE);
  QRLTotalM1.Caption:=IntToStr(wContM1);
end;

end.
