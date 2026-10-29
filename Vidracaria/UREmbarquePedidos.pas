unit UREmbarquePedidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFREmbarquePedidos = class(TFTRelSimples)
    QRLabel4: TQRLabel;
    QRBand4: TQRBand;
    QRLabel25: TQRLabel;
    QRLabel24: TQRLabel;
    QRBand3: TQRBand;
    QRExpr5: TQRExpr;
    QRDBText1: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRGroup1: TQRGroup;
    QRLabel8: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRBand5: TQRBand;
    QRLabel3: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel5: TQRLabel;
    QRExpr4: TQRExpr;
    QRDBText11: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel9: TQRLabel;
    QRExpr6: TQRExpr;
    QRLabel11: TQRLabel;
    QRExpr7: TQRExpr;
    QRLabel12: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText17: TQRDBText;
    QRExpr10: TQRExpr;
    QRExpr9: TQRExpr;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRCompositeReport1: TQRCompositeReport;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRLabel18: TQRLabel;
    procedure QRGroup2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRCompositeReport1AddReports(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FREmbarquePedidos: TFREmbarquePedidos;
  wTotalPeso : real = 0;
  wTotalMetro: real = 0;
  wCont : integer = 0;
implementation

uses UVidracaria_cl, UOracle_cl, UParamSistema_cl, UREmbarquePedidosResumo;

{$R *.dfm}

procedure TFREmbarquePedidos.QRGroup2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);

begin
  inherited;
  QRExpr5.Reset;
  //QRPeso.Caption := DMOracle.BuscaNome('SELECT SUM(TB_PRODUTO.NUM_METROS_CUBICOS * TB_PEDIDO_ITEM.QT_PEDIDO) FROM TB_MATERIAL INNER JOIN TB_PEDIDO_ITEM ON TB_PEDIDO_ITEM.COD_PEDIDO_ITEM = TB_MATERIAL.COD_PEDIDO_ITEM INNER JOIN TB_PRODUTO ON TB_PRODUTO.COD_PRODUTO = TB_PEDIDO_ITEM.COD_PRODUTO', 'TB_MATERIAL.COD_PEDIDO = ' + DmVidracaria.QREmbarquePedidoCOD_PEDIDO_CAB.Text);
  //QRMetros.Caption := DMOracle.BuscaNome('SELECT SUM(TB_PEDIDO_ITEM.QT_PEDIDO) FROM TB_MATERIAL INNER JOIN TB_PEDIDO_ITEM ON TB_PEDIDO_ITEM.COD_PEDIDO_ITEM = TB_MATERIAL.COD_PEDIDO_ITEM INNER JOIN TB_PRODUTO ON TB_PRODUTO.COD_PRODUTO = TB_PEDIDO_ITEM.COD_PRODUTO', 'TB_MATERIAL.COD_PEDIDO = ' + DmVidracaria.QREmbarquePedidoCOD_PEDIDO_CAB.Text);
  //wTotalMetro := wTotalMetro + StrToFloat(QRMetros.Caption);
 // wTotalPeso := wTotalPeso + StrToFloat(QRPeso.Caption);
 // QRPeso.Repaint;
 // QRMetros.Repaint;
end;

procedure TFREmbarquePedidos.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if wCont = 0 then
    inc(wcont);
  if DMParamSistema.QparamSistemaCOD_EMPRESA.Value = 'TEMPERFOZ' Then
  Begin  
    QRLabel9.Enabled  := True;
    QRLabel11.Enabled := True;
    QRExpr6.Enabled   := True;
    QRExpr7.Enabled   := True;
  end;
  {if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERMED' then
  begin
    QRExpr9.Enabled    := True;
    QRExpr10.Enabled   := True;
    QRDBText10.Enabled := True;
    QRDBText12.Enabled := True;
    QRDBText17.Enabled := True;
    qrlabel14.Enabled := True;
  end;}
end;

procedure TFREmbarquePedidos.QRBand4AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  wCont:=0;
  wTotalMetro := 0;
  wTotalPeso := 0;
end;

procedure TFREmbarquePedidos.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value =  'TEMPERFOZ' then
  Begin
    QRLabel12.Enabled := False;
    QRLabel13.Enabled := True;
    QRDBText11.Width := 150;
    QRLabel18.Top := 1;
    QRLabel18.Enabled := True;
  end;
  {if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERMED' then
  begin
    QRBankd3.Enabled   := False;
  end;}
end;

procedure TFREmbarquePedidos.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERFOZ' then
  Begin
    QRDBText4.Enabled := False;
    QRDBText5.Enabled := true;
    QRDBText2.Width := 130;
    
    QRDBText13.Enabled := True;
    QRDBText14.Enabled := True;
    QRDBText15.Enabled := True;
    QRDBText16.Enabled := True;
    QRDBText13.Top := 1;
    QRDBText14.Top := 1;
    QRDBText15.Top := 1;
    QRDBText16.Top := 1;
  end;
end;

procedure TFREmbarquePedidos.QRCompositeReport1AddReports(Sender: TObject);
begin
  inherited;
  QRCompositeReport1.Reports.add(FREmbarquePedidos.QRPrimario);
  QRCompositeReport1.Reports.add(FREmbarquePedidosResumo.QRPrimario);
end;

end.
