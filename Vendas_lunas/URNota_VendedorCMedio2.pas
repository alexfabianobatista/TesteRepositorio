unit URNota_VendedorCMedio2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRNota_VendedorCMedio2 = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText6: TQRDBText;
    QRBRodVendedor: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRGroup1: TQRGroup;
    QRLabel9: TQRLabel;
    QRDBText8: TQRDBText;
    QRBClasse: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRLabel8: TQRLabel;
    QRExpr11: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr10: TQRExpr;
    QRLabel12: TQRLabel;
    QRDBText7: TQRDBText;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRLOperacao: TQRLabel;
    QRLRepresentante: TQRLabel;
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBRodVendedorBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
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

uses URelatorioVenda_cl, UParamSistema_cl;

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

procedure TFRNota_VendedorCMedio2.FormCreate(Sender: TObject);
begin
  inherited;
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' Then
  Begin
    QRLabel12.Enabled := False;
    QRDBText7.Enabled := False;
    QRExpr12.Enabled := False;
    QRExpr13.Enabled := False;

    QRLabel8.Left := 697;
    QRExpr11.Left := 683;
    QRExpr5.Left := 683;
    QRExpr10.Left := 683;

    QRLabel7.Enabled := False;
    QRDBText6.Enabled := False;
    QRExpr9.Enabled := False;
    QRExpr4.Enabled := False;

    QRLabel6.Left := 612;
    QRDBText5.Left := 598;
    QRExpr8.Left := 598;
    QRExpr3.Left := 598;

    QRLabel5.Left := 554;
    QRDBText4.Left := 513;
    QRExpr7.Left := 513;
    QRExpr2.Left := 513;

    QRLabel4.Left := 435;
    QRDBText3.Left := 429;
    QRExpr6.Left := 418;
    QRExpr1.Left := 418;

    QRDBText2.Width := 359;
  End;
end;

end.
