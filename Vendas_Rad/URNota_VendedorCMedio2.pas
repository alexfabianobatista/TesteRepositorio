unit URNota_VendedorCMedio2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport;

type
  TFRNota_VendedorCMedio2 = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText6: TQRDBText;
    QRBRodVendedor: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr4: TQRExpr;
    QRGroup1: TQRGroup;
    QRLabel9: TQRLabel;
    QRDBText8: TQRDBText;
    QRBClasse: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr9: TQRExpr;
    QRLabel8: TQRLabel;
    QRExpr11: TQRExpr;
    QRLabel12: TQRLabel;
    QRExpr13: TQRExpr;
    QRLabel6: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRExpr14: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr8: TQRExpr;
    QRDBText5: TQRDBText;
    QRExpr12: TQRExpr;
    QRLabel13: TQRLabel;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr10: TQRExpr;
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBRodVendedorBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRNota_VendedorCMedio2: TFRNota_VendedorCMedio2;
  wCont:Integer;
  wValor:Real;
  
implementation

uses URelatorioVenda_cl;

{$R *.DFM}

procedure TFRNota_VendedorCMedio2.QRBand3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
{ wValor := wValor + DMRelatorio_Venda.QRVendedorCMedio2SPRECO_MEDIO_KG.Value;
  Inc(wCont); }
end;

procedure TFRNota_VendedorCMedio2.QRBRodVendedorBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
//sValorMedio.Caption := FormatFloat('###,##0.00',(wValor / wCont));
end;

end.
