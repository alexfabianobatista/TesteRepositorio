unit URComissaoClasse;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRComissaoClasse = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRBand3: TQRBand;
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
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRBand4: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRLFilial: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape2: TQRShape;
    QRBand5: TQRBand;
    QRLabel14: TQRLabel;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRShape1: TQRShape;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
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
  FRComissaoClasse: TFRComissaoClasse;

implementation

uses URelatorioVenda_cl;

{$R *.dfm}

procedure TFRComissaoClasse.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  PrintBand := pTipoRelatorio = 'ANALITICO';
  With DMRelatorio_Venda do
  Begin
    pTotalQtdeVend := pTotalQtdeVend+QRComissaoClasseSQT_Quantidade.Value;
    pTotalValorVend := pTotalValorVend+QRComissaoClasseSVal_Total.Value;
    pTotalDescontoVend := pTotalDescontoVend+QRComissaoClasseSVal_Desconto.Value;
    pTotalComissaoVend := pTotalComissaoVend+QRComissaoClasseVal_Comissao.Value;
    fTotalLiqVend := fTotalLiqVend+QRComissaoClasseSTOTAL_LIQ.Value;
    pTotalQtdeVend_Tot := pTotalQtdeVend_Tot+QRComissaoClasseSQT_Quantidade.Value;
    pTotalValorVend_Tot := pTotalValorVend_Tot+QRComissaoClasseSVal_Total.Value;
    pTotalDescontoVend_Tot := pTotalDescontoVend_Tot+QRComissaoClasseSVal_Desconto.Value;
    pTotalComissaoVend_Tot := pTotalComissaoVend_Tot+QRComissaoClasseVal_Comissao.Value;
    fTotalLiqVend_Tot := fTotalLiqVend_Tot+QRComissaoClasseSTOTAL_LIQ.Value;
  End;
end;

end.
