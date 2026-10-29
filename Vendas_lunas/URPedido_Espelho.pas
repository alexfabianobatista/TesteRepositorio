unit URPedido_Espelho;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, quickrpt, ExtCtrls, QRExport;

type
  TFRPedido_Espelho = class(TFTRelSimples)
    QRBSumOC: TQRBand;
    QRLabel14: TQRLabel;
    QRShape1: TQRShape;
    QRBCabOC: TQRBand;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel17: TQRLabel;
    QRLTotal: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText24: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText25: TQRDBText;
    QRLTotalQtde: TQRLabel;
    QRLabel25: TQRLabel;
    QRLM3: TQRLabel;
    QRLabel26: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel27: TQRLabel;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRLabel28: TQRLabel;
    QRLVolumes: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRDBText29: TQRDBText;
    QRBand3: TQRBand;
    QRDBText11: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBSumOCBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPedido_Espelho: TFRPedido_Espelho;
  wTotalPedido, wQtdeTotal, wM3, wVolumes : Real;


implementation

uses UPedido_cl, UOracle_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFRPedido_Espelho.QRPrimarioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  wTotalPedido := 0;
  wQtdeTotal :=0;
  wM3 := 0;
  wVolumes := 0;
end;

procedure TFRPedido_Espelho.QRBSumOCBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLTotal.Caption := FormatFloat(' ###,###,##0.00',wTotalPedido);
  QRLTotalQtde.caption := FormatFloat(' ###,###,##0.00',wQtdeTotal);
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'CGS' Then
   Begin
    QrLabel25.Caption := 'M3:';
    QRLM3.Caption := FormatFloat(' ###,###,##0.00',wM3);
    QRLVolumes.Caption := FormatFloat(' #,##0.00',wVolumes);
   End
  Else
   Begin
    QrLabel25.Caption := '';
    QRLM3.Caption := '';
    QRLVolumes.Caption := '';
   End;
end;

procedure TFRPedido_Espelho.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLEmpresa.Caption := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+FloatToStr(DMPedido.QPedidoCod_Filial.Value));
end;

procedure TFRPedido_Espelho.QRBand3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
  Var wEmbalagem, wVol : String;
begin
  inherited;
  wTotalPedido := wTotalPedido+DMPedido.QrPedidoValor_Total.Value;
  wQtdeTotal  := wQtdeTotal+DMPedido.QrPedidoQrQuantidade.Value;
  wEmbalagem := FloatToStr(DMPedido.QrPedidoNUM_EMBALAGEM.Value);
  wVol := FloatToStr(DMPedido.QrPedidoNUM_VOLUMES.Value);
  If Trim(wEmbalagem) <> '' Then
     wM3 := wM3 + DMPedido.QrPedidoQt_Pedido.Value * StrToFloat(wEmbalagem);
  If Trim(wVol) <> '' Then
     wVolumes := wVolumes + DMPedido.QrPedidoQt_Pedido.Value * StrToFloat(wVol);

end;

end.
