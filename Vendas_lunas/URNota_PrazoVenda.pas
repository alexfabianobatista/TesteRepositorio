unit URNota_PrazoVenda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport;

type
  TFRNota_PrazoVenda = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLAVista: TQRLabel;
    QRLPrazo1: TQRLabel;
    QRLPrazo2: TQRLabel;
    QRLPrazo3: TQRLabel;
    QRLPrazo4: TQRLabel;
    QRLLongoPrazo: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLPercVista: TQRLabel;
    QRLPercPrazo1: TQRLabel;
    QRLPercPrazo2: TQRLabel;
    QRLPercPrazo3: TQRLabel;
    QRLPercPrazo4: TQRLabel;
    QRLPercLongoPrazo: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText9: TQRDBText;
    QRBand4: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRLPrazo5: TQRLabel;
    QRDBText10: TQRDBText;
    QRLPercPrazo5: TQRLabel;
    QRDBText11: TQRDBText;
    QRLPercPrazo6: TQRLabel;
    QRLPrazo6: TQRLabel;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRNota_PrazoVenda: TFRNota_PrazoVenda;

implementation

uses URelatorioVenda_cl;

{$R *.DFM}

procedure TFRNota_PrazoVenda.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  IF DMRelatorio_Venda.QRPrazoVendaSVal_Total.Value<> 0 then
  Begin
    QRLPercVista.Caption := FormatFloat('##0.00%',DMRelatorio_Venda.QRPrazoVendaSVal_AVista.Value*100/DMRelatorio_Venda.QRPrazoVendaSVal_Total.Value);
    QRLPercPrazo1.Caption:= FormatFloat('##0.00%',DMRelatorio_Venda.QRPrazoVendaSVal_Prazo1.Value*100/DMRelatorio_Venda.QRPrazoVendaSVal_Total.Value);
    QRLPercPrazo2.Caption:= FormatFloat('##0.00%',DMRelatorio_Venda.QRPrazoVendaSVal_Prazo2.Value*100/DMRelatorio_Venda.QRPrazoVendaSVal_Total.Value);
    QRLPercPrazo3.Caption:= FormatFloat('##0.00%',DMRelatorio_Venda.QRPrazoVendaSVal_Prazo3.Value*100/DMRelatorio_Venda.QRPrazoVendaSVal_Total.Value);
    QRLPercPrazo4.Caption:= FormatFloat('##0.00%',DMRelatorio_Venda.QRPrazoVendaSVal_Prazo4.Value*100/DMRelatorio_Venda.QRPrazoVendaSVal_Total.Value);
    QRLPercPrazo5.Caption:= FormatFloat('##0.00%',DMRelatorio_Venda.QRPrazoVendaSVal_Prazo5.Value*100/DMRelatorio_Venda.QRPrazoVendaSVal_Total.Value);
    QRLPercPrazo6.Caption:= FormatFloat('##0.00%',DMRelatorio_Venda.QRPrazoVendaSVal_Prazo6.Value*100/DMRelatorio_Venda.QRPrazoVendaSVal_Total.Value);
    QRLPercLongoPrazo.Caption:= FormatFloat('##0.00%',DMRelatorio_Venda.QRPrazoVendaSVal_Longo_Prazo.Value*100/DMRelatorio_Venda.QRPrazoVendaSVal_Total.Value);
  end
  else
  Begin
    QRLPercVista.Caption := '0';
    QRLPercPrazo1.Caption:= '0';
    QRLPercPrazo2.Caption:= '0';
    QRLPercPrazo3.Caption:= '0';
    QRLPercPrazo4.Caption:= '0';
    QRLPercPrazo5.Caption:= '0';
    QRLPercPrazo6.Caption:= '0';
    QRLPercLongoPrazo.Caption:= '0';
  end;
end;

end.
