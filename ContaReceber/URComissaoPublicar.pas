unit URComissaoPublicar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRComissaoPublicar = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRBand6: TQRBand;
    QRLabel4: TQRLabel;
    QRLValor: TQRLabel;
    QRLComissao: TQRLabel;
    QRLPerc: TQRLabel;
    QRLabel12: TQRLabel;
    QRLIrrf: TQRLabel;
    QRLFilial: TQRLabel;
    QRBand5: TQRBand;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRGroup2: TQRGroup;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand6BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand6AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
    fTipoRelatorio :String;
    fTotalValorVend : Real;
    fTotalComissaoVend  : Real;
    Property pTotalComissaoVend : Real Read fTotalComissaoVend Write fTotalComissaoVend;
    Property pTotalValorVend : Real Read fTotalValorVend Write fTotalValorVend;
  public
    { Public declarations }
    Property pTipoRelatorio : String Read fTipoRelatorio Write fTipoRelatorio;
  end;

var
  FRComissaoPublicar: TFRComissaoPublicar;
  wPerc_Irrf, wTotIRRF : Real;

implementation

uses UContasReceber_cl;

{$R *.dfm}

procedure TFRComissaoPublicar.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  PrintBand := pTipoRelatorio = 'ANALITICO';
  With DMContasReceber do
  Begin
    pTotalValorVend := pTotalValorVend+QRComissaoPublicarSVal_Total.Value;
    pTotalComissaoVend := pTotalComissaoVend+QRComissaoPublicarVal_Comissao.Value;
    wPerc_Irrf := QRComissaoPublicarPerc_Irrf.Value;
  End;
end;

procedure TFRComissaoPublicar.QRBand6BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLValor.Caption := FormatFloat('###,###,##0.00',pTotalValorVend);
  QRLComissao.Caption := FormatFloat('###,###,##0.00',pTotalComissaoVend);
  QRLIrrf.Caption := FormatFloat('###,###,##0.00',pTotalComissaoVend * wPerc_Irrf / 100);
  If (pTotalComissaoVend <> 0) And (pTotalValorVend <> 0) Then
     QRLPerc.Caption := FormatFloat('###,###,##0.00',pTotalComissaoVend / pTotalValorVend * 100)
  Else
     QRLPerc.Caption := '0,00';
  wTotIRRF := wTotIRRF + pTotalComissaoVend * wPerc_Irrf / 100;
end;

procedure TFRComissaoPublicar.QRBand6AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  pTotalValorVend := 0;
  pTotalComissaoVend := 0;
end;

end.
