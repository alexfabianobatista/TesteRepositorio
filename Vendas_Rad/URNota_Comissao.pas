unit URNota_Comissao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRNota_Comissao = class(TFTRelSimples)
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRGCabVendedor: TQRGroup;
    QRLabel9: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRBRodVendedor: TQRBand;
    QRLabel10: TQRLabel;
    QRLQtVend: TQRLabel;
    QRLValorVend: TQRLabel;
    QRLComissaoVend: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText8: TQRDBText;
    QRLValorDesc: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel12: TQRLabel;
    QRBand4: TQRBand;
    QRLabel13: TQRLabel;
    QRLQtVend_Tot: TQRLabel;
    QRLValorVend_Tot: TQRLabel;
    QRLValorDesc_Tot: TQRLabel;
    QRLComissaoVend_Tot: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText11: TQRDBText;
    QRLLiquidoVend: TQRLabel;
    QRLLiquidoVend_Tot: TQRLabel;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGCabVendedorBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBRodVendedorBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure QRBand4AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
    fTipoRelatorio : String;
    fTotalQtdeVend, fTotalValorVend,fTotalComissaoVend,fTotalDescontoVend,fTotalLiqVend : Real;
    fTotalQtdeVend_Tot, fTotalValorVend_Tot,fTotalComissaoVend_Tot,fTotalDescontoVend_Tot,fTotalLiqVend_Tot : Real;
    Property pTotalQtdeVend : Real Read fTotalQtdeVend Write fTotalQtdeVend;
    Property pTotalValorVend : Real Read fTotalValorVend Write fTotalValorVend;
    Property pTotalComissaoVend : Real Read fTotalComissaoVend Write fTotalComissaoVend;
    Property pTotalDescontoVend : Real Read fTotalDescontoVend Write fTotalDescontoVend;
    Property pTotalLiqVend : Real Read fTotalLiqVend Write fTotalLiqVend;
    Property pTotalQtdeVend_Tot : Real Read fTotalQtdeVend_Tot Write fTotalQtdeVend_Tot;
    Property pTotalValorVend_Tot : Real Read fTotalValorVend_Tot Write fTotalValorVend_Tot;
    Property pTotalComissaoVend_Tot : Real Read fTotalComissaoVend_Tot Write fTotalComissaoVend_Tot;
    Property pTotalDescontoVend_Tot : Real Read fTotalDescontoVend_Tot Write fTotalDescontoVend_Tot;
    Property pTotalLiqVend_Tot : Real Read fTotalLiqVend_Tot Write fTotalLiqVend_Tot;
  public
    { Public declarations }
    Property pTipoRelatorio : String Read fTipoRelatorio Write fTipoRelatorio;
  end;

var
  FRNota_Comissao: TFRNota_Comissao;

implementation

uses URelatorioVenda_cl;

{$R *.DFM}

procedure TFRNota_Comissao.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  PrintBand := pTipoRelatorio = 'ANALITICO';
  With DMRelatorio_Venda do
  Begin
    pTotalQtdeVend := pTotalQtdeVend+QRComissaoSQT_Quantidade.Value;
    pTotalValorVend := pTotalValorVend+QRComissaoSVal_Total.Value;
    pTotalDescontoVend := pTotalDescontoVend+QRComissaoSVal_Desconto.Value;
    pTotalComissaoVend := pTotalComissaoVend+QRComissaoVal_Comissao.Value;
    fTotalLiqVend := fTotalLiqVend+QRComissaoSTOTAL_LIQ.Value;
    pTotalQtdeVend_Tot := pTotalQtdeVend_Tot+QRComissaoSQT_Quantidade.Value;
    pTotalValorVend_Tot := pTotalValorVend_Tot+QRComissaoSVal_Total.Value;
    pTotalDescontoVend_Tot := pTotalDescontoVend_Tot+QRComissaoSVal_Desconto.Value;
    pTotalComissaoVend_Tot := pTotalComissaoVend_Tot+QRComissaoVal_Comissao.Value;
    fTotalLiqVend_Tot := fTotalLiqVend_Tot+QRComissaoSTOTAL_LIQ.Value;
  End;
end;

procedure TFRNota_Comissao.QRGCabVendedorBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  pTotalQtdeVend := 0;
  pTotalValorVend := 0;
  pTotalComissaoVend := 0;
  pTotalDescontoVend := 0;
  fTotalLiqVend := 0;
end;

procedure TFRNota_Comissao.QRBRodVendedorBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLQtVend.Caption := FormatFloat('###,###,##0',pTotalQtdeVend);
  QRLValorVend.Caption := FormatFloat('###,###,##0.00',pTotalValorVend);
  QRLComissaoVend.Caption := FormatFloat('###,###,##0.00',pTotalComissaoVend);
  QRLValorDesc.Caption := FormatFloat('###,###,##0.00',pTotalDescontoVend);
  QRLLiquidoVend.Caption := FormatFloat('###,###,##0.00',pTotalLiqVend);
end;

procedure TFRNota_Comissao.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLQtVend_Tot.Caption := FormatFloat('###,###,##0',pTotalQtdeVend_Tot);
  QRLValorVend_Tot.Caption := FormatFloat('###,###,##0.00',pTotalValorVend_Tot);
  QRLComissaoVend_Tot.Caption := FormatFloat('###,###,##0.00',pTotalComissaoVend_Tot);
  QRLValorDesc_Tot.Caption := FormatFloat('###,###,##0.00',pTotalDescontoVend_Tot);
  QRLLiquidoVend_Tot.Caption := FormatFloat('###,###,##0.00',pTotalLiqVend_Tot);
end;

procedure TFRNota_Comissao.FormActivate(Sender: TObject);
begin
  inherited;
  pTotalQtdeVend_Tot := 0;
  pTotalValorVend_Tot := 0;
  pTotalComissaoVend_Tot := 0;
  pTotalDescontoVend_Tot := 0;
  pTotalLiqVend_Tot := 0;
end;

procedure TFRNota_Comissao.QRBand4AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  pTotalQtdeVend_Tot := 0;
  pTotalValorVend_Tot := 0;
  pTotalComissaoVend_Tot := 0;
  pTotalDescontoVend_Tot := 0;
  pTotalLiqVend_Tot := 0;
end;

end.
