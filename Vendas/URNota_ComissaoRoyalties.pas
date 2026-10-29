unit URNota_ComissaoRoyalties;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRNota_ComissaoRoyalties = class(TFTRelSimples)
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRBRodFilial: TQRBand;
    QRLabel8: TQRLabel;
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
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRBand3: TQRBand;
    QRDBText10: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText16: TQRDBText;
    procedure QRGCabVendedorBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBRodVendedorBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBRodFilialBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGFilialBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    fTipoRelatorio : String;
    fTotalQtdeVend, fTotalValorVend,fTotalComissaoVend : Real;
    fTotalQtdeFilial, fTotalValorFilial, fTotalComissaoFilial : Real;
    Property pTotalQtdeVend : Real Read fTotalQtdeVend Write fTotalQtdeVend;
    Property pTotalValorVend : Real Read fTotalValorVend Write fTotalValorVend;
    Property pTotalComissaoVend : Real Read fTotalComissaoVend Write fTotalComissaoVend;
    Property pTotalQtdeFilial : Real Read fTotalQtdeFilial Write fTotalQtdeFilial;
    Property pTotalValorFilial : Real Read fTotalValorFilial Write fTotalValorFilial;
    Property pTotalComissaoFilial : Real Read fTotalComissaoFilial Write fTotalComissaoFilial;
  public
    { Public declarations }
    Property pTipoRelatorio : String Read fTipoRelatorio Write fTipoRelatorio;
  end;

var
  FRNota_ComissaoRoyalties: TFRNota_ComissaoRoyalties;

implementation

uses URelatorioVenda_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFRNota_ComissaoRoyalties.QRGCabVendedorBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  pTotalQtdeVend := 0;
  pTotalValorVend := 0;
  pTotalComissaoVend  := 0;
end;

procedure TFRNota_ComissaoRoyalties.QRBRodVendedorBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLQtVend.Caption := FormatFloat('###,###,##0.00',pTotalQtdeVend);
  QRLValorVend.Caption := FormatFloat('###,###,##0.00',pTotalValorVend);
  QRLComissaoVend.Caption := FormatFloat('###,###,##0.00',pTotalComissaoVend);
end;

procedure TFRNota_ComissaoRoyalties.QRBRodFilialBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLQtFilial.Caption := FormatFloat('###,###,##0.00',pTotalQtdeFilial);
  QRLValorFilial.Caption := FormatFloat('###,###,##0.00',pTotalValorFilial);
  QRLComissaoFilial.Caption := FormatFloat('###,###,##0.00',pTotalComissaoFilial);
end;

procedure TFRNota_ComissaoRoyalties.QRGFilialBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  pTotalQtdeFilial := 0;
  pTotalValorFilial := 0;
  pTotalComissaoFilial  := 0;
end;

procedure TFRNota_ComissaoRoyalties.QRBand3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  //PrintBand := pTipoRelatorio = 'ANALITICO';
  With DMRelatorio_Venda do
  Begin
    pTotalQtdeVend :=       pTotalQtdeVend       + QRComissaoRoyaltiesSQT_Quantidade.Value;
    pTotalValorVend :=      pTotalValorVend      + QRComissaoRoyaltiesSVal_Total.Value;
    pTotalComissaoVend :=   pTotalComissaoVend   + QRComissaoRoyaltiesVal_Comissao.Value;
    pTotalQtdeFilial :=     pTotalQtdeFilial     + QRComissaoRoyaltiesSQT_Quantidade.Value;
    pTotalValorFilial :=    pTotalValorFilial    + QRComissaoRoyaltiesSVal_Total.Value;
    pTotalComissaoFilial := pTotalComissaoFilial + QRComissaoRoyaltiesVal_Comissao.Value;
  End;
end;

end.
