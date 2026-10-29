unit URComissao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRComissao = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRBand3: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRBand4: TQRBand;
    QRLabel4: TQRLabel;
    QRDBText9: TQRDBText;
    QRLFilial: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel11: TQRLabel;
    QRLValor: TQRLabel;
    QRLComissao: TQRLabel;
    QRLPerc: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel12: TQRLabel;
    QRLIrrf: TQRLabel;
    QRDBText11: TQRDBText;
    QRBand5: TQRBand;
    QRLabel13: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel15: TQRLabel;
    QRLTotIRRF: TQRLabel;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand5AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
    fTipoRelatorio : String;
    fTotalValorVend : Real;
    fTotalComissaoVend  : Real;
    fTotal  : Real;
    Property pTotalValorVend : Real Read fTotalValorVend Write fTotalValorVend;
    Property pTotalComissaoVend : Real Read fTotalComissaoVend Write fTotalComissaoVend;
    Property pTotal : Real Read fTotal Write fTotal;
  public
    { Public declarations }
    Property pTipoRelatorio : String Read fTipoRelatorio Write fTipoRelatorio;
  end;

var
  FRComissao: TFRComissao;
  wPerc_Irrf, wTotIRRF : Real;

implementation

uses UContasReceber_cl, UParamSistema_cl, UOracle_cl;

{$R *.DFM}

procedure TFRComissao.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  PrintBand := pTipoRelatorio = 'ANALITICO';
  With DMContasReceber do
  Begin
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'GRASEL' then
      if QRComissaoCod_Nota_Cab.Value > 0 then
        pTotalValorVend := pTotalValorVend + strToFloat(DMOracle.BuscaNome('SELECT SUM(Tb_nota_item.VAL_TOTAL + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_ICMS_SUBST) FROM TB_NOTA_ITEM',
                    'COD_NOTA_CAB ='+FloatToStr(QRComissaoCod_Nota_Cab.Value)))
    else
      pTotalValorVend := pTotalValorVend+QRComissaoSVal_Total.Value;

    pTotal := pTotal + QRComissaoSVal_Total.Value;
    pTotalComissaoVend := pTotalComissaoVend+QRComissaoVal_Comissao.Value;
    wPerc_Irrf := QRComissaoPerc_Irrf.Value;
  End;
end;

procedure TFRComissao.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLValor.Caption := FormatFloat('###,###,##0.00',pTotalValorVend);
  QRLComissao.Caption := FormatFloat('###,###,##0.00',pTotalComissaoVend);
  QRLIrrf.Caption := FormatFloat('###,###,##0.00',pTotalComissaoVend * wPerc_Irrf / 100);
  If (pTotalComissaoVend <> 0) And (pTotalValorVend <> 0) Then
     QRLPerc.Caption := FormatFloat('###,###,##0.00',pTotalComissaoVend / pTotal * 100)
  Else
     QRLPerc.Caption := '0,00';
  wTotIRRF := wTotIRRF + pTotalComissaoVend * wPerc_Irrf / 100;
end;

procedure TFRComissao.QRBand4AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  pTotalValorVend := 0;
  pTotalComissaoVend := 0;
  pTotal := 0;
end;

procedure TFRComissao.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  If pTipoRelatorio = 'SINTETICO' Then
     QRGroup1.ForceNewPage := False;
  pTotalValorVend := 0;
  pTotalComissaoVend := 0;
  pTotal := 0;
end;

procedure TFRComissao.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLTotIRRF.Caption := FormatFloat('###,###,##0.00',wTotIRRF);
end;

procedure TFRComissao.QRBand5AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  wTotIRRF := 0;
end;

end.
