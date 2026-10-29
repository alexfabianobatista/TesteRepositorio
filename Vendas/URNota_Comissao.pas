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
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRGFilial: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRBRodFilial: TQRBand;
    QRLabel8: TQRLabel;
    QRGCabVendedor: TQRGroup;
    QRLabel9: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRBRodVendedor: TQRBand;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLQtVend: TQRLabel;
    QRLValorVend: TQRLabel;
    QRLComissaoVend: TQRLabel;
    QRLQtFilial: TQRLabel;
    QRLValorFilial: TQRLabel;
    QRLComissaoFilial: TQRLabel;
    QRDBText10: TQRDBText;
    QRLSupervisor: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText11: TQRDBText;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGCabVendedorBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBRodVendedorBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBRodFilialBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGFilialBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
    fTipoRelatorio : String;
    fTotalQtdeVend, fTotalValorVend : Real;
    fTotalPercIrf,fTotalValIrf,fTotalComissaoVend  : Real;
    fTotalQtdeFilial, fTotalValorFilial, fTotalComissaoFilial : Real;
    Property pTotalQtdeVend : Real Read fTotalQtdeVend Write fTotalQtdeVend;
    Property pTotalValorVend : Real Read fTotalValorVend Write fTotalValorVend;
    Property pTotalValIrf : Real Read fTotalValIrf Write fTotalValIrf;
    Property pTotalPercIrf : Real Read fTotalPercIrf Write fTotalPercIrf;
    Property pTotalComissaoVend : Real Read fTotalComissaoVend Write fTotalComissaoVend;
    Property pTotalQtdeFilial : Real Read fTotalQtdeFilial Write fTotalQtdeFilial;
    Property pTotalValorFilial : Real Read fTotalValorFilial Write fTotalValorFilial;
    Property pTotalComissaoFilial : Real Read fTotalComissaoFilial Write fTotalComissaoFilial;
  public
    { Public declarations }
    Property pTipoRelatorio : String Read fTipoRelatorio Write fTipoRelatorio;
  end;

var
  FRNota_Comissao: TFRNota_Comissao;

implementation

uses URelatorioVenda_cl, UParamSistema_cl;

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
    pTotalValIrf := pTotalValIrf+QRComissaoSVal_Irrf.Value;
    pTotalComissaoVend := pTotalComissaoVend+QRComissaoVal_Comissao.Value;
    pTotalQtdeFilial := pTotalQtdeFilial+QRComissaoSQT_Quantidade.Value;
    pTotalValorFilial := pTotalValorFilial+QRComissaoSVal_Total.Value;
    pTotalPercIrf := QRComissaoPerc_Irrf.Value;
    pTotalComissaoFilial := pTotalComissaoFilial+QRComissaoVal_Comissao.Value;
  End;
end;

procedure TFRNota_Comissao.QRGCabVendedorBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  pTotalQtdeVend := 0;
  pTotalValorVend := 0;
  pTotalPercIrf := 0;
  pTotalValIrf := 0;
  pTotalComissaoVend  := 0;
end;

procedure TFRNota_Comissao.QRBRodVendedorBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLQtVend.Caption := FormatFloat('###,###,##0.00',pTotalQtdeVend);
  QRLValorVend.Caption := FormatFloat('###,###,##0.00',pTotalValorVend);
//  QRLPercIrf.Caption := FormatFloat('##0.00',pTotalPercIrf);
//  QRLValIrf.Caption := FormatFloat('###,##0.00',pTotalValIrf);
  QRLComissaoVend.Caption := FormatFloat('###,###,##0.00',pTotalComissaoVend);

end;

procedure TFRNota_Comissao.QRBRodFilialBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLQtFilial.Caption := FormatFloat('###,###,##0.00',pTotalQtdeFilial);
  QRLValorFilial.Caption := FormatFloat('###,###,##0.00',pTotalValorFilial);
  QRLComissaoFilial.Caption := FormatFloat('###,###,##0.00',pTotalComissaoFilial);

end;

procedure TFRNota_Comissao.QRGFilialBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  pTotalQtdeFilial := 0;
  pTotalValorFilial := 0;
  pTotalComissaoFilial  := 0;
  pTotalPercIrf := 0;
  pTotalValIrf := 0;
end;

procedure TFRNota_Comissao.QRPrimarioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  if dmparamsistema.QParamSistemaCOD_EMPRESA.Text = 'NEOALI' then
    QRDBText15.Enabled := False;
end;

end.
