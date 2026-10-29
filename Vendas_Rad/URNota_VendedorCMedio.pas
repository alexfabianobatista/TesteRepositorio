unit URNota_VendedorCMedio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport;

type
  TFRNota_VendedorCMedio = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel8: TQRLabel;
    QRGVendedor: TQRGroup;
    QRLabel9: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRBRodVendedor: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr2: TQRExpr;
    QRBand4: TQRBand;
    QRExpr4: TQRExpr;
    QRGroup1: TQRGroup;
    QRLabel11: TQRLabel;
    QRDBText10: TQRDBText;
    QRBRodClasse: TQRBand;
    QRLabel12: TQRLabel;
    QRExpr7: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr5: TQRExpr;
    QRLabel13: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr8: TQRExpr;
    QRDBText5: TQRDBText;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRLabel14: TQRLabel;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBRodVendedorAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBRodVendedorBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRNota_VendedorCMedio: TFRNota_VendedorCMedio;
  wCont : Integer;
  wValor : Real;

implementation

uses URelatorioVenda_cl, URNota_VendedorCMedio2;

{$R *.DFM}

procedure TFRNota_VendedorCMedio.QRBand3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
{ inc(wCont);
  wValor := wValor + DMRelatorio_Venda.QRVendedorCMedioSPRECO_MEDIO_KG.Value;  }
end;

procedure TFRNota_VendedorCMedio.QRBRodVendedorAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  inherited;
//wCont := 0;
//wValor := 0;
end;

procedure TFRNota_VendedorCMedio.QRBRodVendedorBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
//sValorMedio.Caption := FormatFloat('###,##0.00',(wValor / wCont));
end;

end.
