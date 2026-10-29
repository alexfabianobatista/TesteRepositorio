unit URContratoVenda_Custos1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TFrContratoVenda_Custos1 = class(TForm)
    QRPrimario: TQuickRep;
    QRBand1: TQRBand;
    QRDBText16: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRExpr1: TQRExpr;
    QRDBText19: TQRDBText;
    QRBand5: TQRBand;
    QRLabel32: TQRLabel;
    QRLQuant: TQRLabel;
    QRLValor: TQRLabel;
    QRLCusto: TQRLabel;
    QRLDolar: TQRLabel;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRLQuant1: TQRLabel;
    QRLValor1: TQRLabel;
    QRLCusto1: TQRLabel;
    QRLDolar1: TQRLabel;
    QRGroup2: TQRGroup;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRLQuant2: TQRLabel;
    QRLValor2: TQRLabel;
    QRLCusto2: TQRLabel;
    QRLDolar2: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel37: TQRLabel;
    QRDBText26: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    procedure QRBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrContratoVenda_Custos1: TFrContratoVenda_Custos1;
  wQuant,wCusto,wDolar,wValor : Real;
  wSQuant,wSCusto,wSDolar,wSValor : Real;
  wFQuant,wFCusto,wFDolar,wFValor : Real;
implementation

uses Ucontrato_cl;

{$R *.DFM}

procedure TFrContratoVenda_Custos1.QRBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  wDolar := wDolar + DMContrato.QRContrato_Vend_Nota_Custosval_dolar.Value;
  wQuant := wQuant + DMContrato.QRContrato_Vend_Nota_CustosQT_QUANTIDADE.Value;
  wValor := wValor + DMContrato.QRContrato_Vend_Nota_CustosVAL_MOVIMENTO.Value;
  If (wValor <> 0) And (wQuant <> 0) Then
     wCusto := wValor / wQuant * 60
  Else
     wCusto := wValor;
  wSDolar := wSDolar + DMContrato.QRContrato_Vend_Nota_Custosval_dolar.Value;
  wSQuant := wSQuant + DMContrato.QRContrato_Vend_Nota_CustosQT_QUANTIDADE.Value;
  wSValor := wSValor + DMContrato.QRContrato_Vend_Nota_CustosVAL_MOVIMENTO.Value;
  If (wSValor <> 0) And (wSQuant <> 0) Then
     wSCusto := wSValor / wSQuant * 60
  Else
     wSCusto := wSValor;
  wFDolar := wFDolar + DMContrato.QRContrato_Vend_Nota_Custosval_dolar.Value;
  wFQuant := wFQuant + DMContrato.QRContrato_Vend_Nota_CustosQT_QUANTIDADE.Value;
  wFValor := wFValor + DMContrato.QRContrato_Vend_Nota_CustosVAL_MOVIMENTO.Value;
  If (wFValor <> 0) And (wFQuant <> 0) Then
     wFCusto := wFValor / wFQuant * 60
  Else
     wFCusto := wFValor;
end;

procedure TFrContratoVenda_Custos1.QRBand5BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  QRLValor.Caption := FormatFloat('#,##0.00',wValor);
  QRLQuant.Caption := FormatFloat('#,##0',wQuant);
  QRLCusto.Caption := FormatFloat('#,##0.00',wCusto);
  QRLDolar.Caption := FormatFloat('#,##0.00',wDolar);
end;

procedure TFrContratoVenda_Custos1.QRBand2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  QRLValor1.Caption := FormatFloat('#,##0.00',wSValor);
  QRLQuant1.Caption := FormatFloat('#,##0',wSQuant);
  QRLCusto1.Caption := FormatFloat('#,##0.00',wSCusto);
  QRLDolar1.Caption := FormatFloat('#,##0.00',wSDolar);
end;

procedure TFrContratoVenda_Custos1.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  wSValor := 0;
  wSQuant := 0;
  wSCusto := 0;
  wSDolar := 0;
end;

procedure TFrContratoVenda_Custos1.QRBand3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  QRLValor2.Caption := FormatFloat('#,##0.00',wFValor);
  QRLQuant2.Caption := FormatFloat('#,##0',wFQuant);
  QRLCusto2.Caption := FormatFloat('#,##0.00',wFCusto);
  QRLDolar2.Caption := FormatFloat('#,##0.00',wFDolar);
end;

procedure TFrContratoVenda_Custos1.QRBand3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
Begin
  wFValor := 0;
  wFQuant := 0;
  wFCusto := 0;
  wFDolar := 0;
End;

end.
