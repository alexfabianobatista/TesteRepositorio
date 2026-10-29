unit URResumoCliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFrResumoCliente = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRBand4: TQRBand;
    QRBand5: TQRBand;
    QRLabel10: TQRLabel;
    QRDBText2: TQRDBText;
    QRLFilial: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel21: TQRLabel;
    QRBand6: TQRBand;
    QRLabel8: TQRLabel;
    QRLBonificada_Mes: TQRLabel;
    QRLQt_Venda_Mes: TQRLabel;
    QRLVl_Venda_Mes: TQRLabel;
    QRLPerc_Mes: TQRLabel;
    QRLVl_MEDIA: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel3: TQRLabel;
    QRLMes: TQRLabel;
    QRLabel12: TQRLabel;
    QRBand7: TQRBand;
    QRLabel20: TQRLabel;
    QRExpr7: TQRExpr;
    QRBand8: TQRBand;
    QRLabel22: TQRLabel;
    QRLBonificada_Vendedor: TQRLabel;
    QRLPerc_Vendedor: TQRLabel;
    QRLVl_MEDIA_Vendedor: TQRLabel;
    QRLQt_Venda_Vendedor: TQRLabel;
    QRLVl_Venda_Vendedor: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr1: TQRExpr;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    procedure QRGroup2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand6BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrResumoCliente: TFrResumoCliente;
  wQt_Venda_Vendedor,wQt_Bonificada_Vendedor,wQt_Venda_Mes,wQt_Bonificada_Mes : Real;
  wVl_Venda_Vendedor,wVl_Venda_Mes:Real;

implementation

uses UOracle_cl, URelatorioVenda_cl;

{$R *.DFM}

procedure TFrResumoCliente.QRGroup2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if DMRelatorio_Venda.QrResumoClienteCOD_VENDEDOR.Value = 0 then
    QrLabel3.Caption := 'Nenhum'
  else
    QrLabel3.Caption := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+FloatToStr(DMRelatorio_Venda.QrResumoClienteCOD_VENDEDOR.Value) );
end;

procedure TFrResumoCliente.QRGroup3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  Case Trunc(DMRelatorio_Venda.QrResumoClienteDt_Mes.Value) Of
    1: QrlMes.Caption := 'Janeiro';
    2: QrlMes.Caption := 'Fevereiro';
    3: QrlMes.Caption := 'Marco';
    4: QrlMes.Caption := 'Abril';
    5: QrlMes.Caption := 'Maio';
    6: QrlMes.Caption := 'Junho';
    7: QrlMes.Caption := 'Julho';
    8: QrlMes.Caption := 'Agosto';
    9: QrlMes.Caption := 'Setembro';
    10: QrlMes.Caption := 'Outubro';
    11: QrlMes.Caption := 'Novembro';
    12: QrlMes.Caption := 'Dezembro';
  End;
end;

procedure TFrResumoCliente.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  With DMRelatorio_Venda Do
  Begin
    If QrResumoClienteSTIPO.Value = ' MOVIMENTO' Then
     Begin
      wQt_Venda_Vendedor:=wQt_Venda_Vendedor + QrResumoClienteSQT_QUANTIDADE.Value;
      wQt_Venda_Mes:=wQt_Venda_Mes + QrResumoClienteSQT_QUANTIDADE.Value;
      wVl_Venda_Vendedor:=wVl_Venda_Vendedor + QrResumoClienteSVAL_TOTAL.Value;
      wVl_Venda_Mes:=wVl_Venda_Mes + QrResumoClienteSVAL_TOTAL.Value;
     End
    Else
     Begin
      wQt_Bonificada_Mes:=wQt_Bonificada_Mes + QrResumoClienteSQT_QUANTIDADE.Value;
      wQt_Bonificada_Vendedor:=wQt_Bonificada_Vendedor + QrResumoClienteSQT_QUANTIDADE.Value;
     End;
  End;
end;

procedure TFrResumoCliente.QRBand6BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QrlBonificada_Mes.Caption :=FormatFloat('##,###,##0',wQt_Bonificada_Mes);
  QrlQt_Venda_Mes.Caption := FormatFloat('##,###,##0',wQt_Venda_Mes);
  QrlVl_Venda_Mes.Caption := FormatFloat('##,###,##0.00',wVl_Venda_Mes);

  if (wVl_Venda_Mes = 0) or (wQt_Venda_Mes = 0) then
    QRLVl_MEDIA.Caption := '0'
  else
    QRLVl_MEDIA.Caption := FormatFloat('##,###,##0.00',wVl_Venda_Mes / wQt_Venda_Mes * 60);

  If wQt_Venda_Mes = 0 Then
     QrlPerc_Mes.Caption := '100'
  Else
     QrlPerc_Mes.Caption := FormatFloat('##0.00',wQt_Bonificada_Mes / wQt_Venda_Mes * 100);
  wQt_Bonificada_Mes := 0;
  wQt_Venda_Mes := 0;
  wVl_Venda_Mes := 0;
end;

procedure TFrResumoCliente.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QrlBonificada_Vendedor.Caption :=FormatFloat('##,###,##0',wQt_Bonificada_Vendedor);
  QrlQt_Venda_Vendedor.Caption := FormatFloat('##,###,##0',wQt_Venda_Vendedor);
  QrlVl_Venda_Vendedor.Caption := FormatFloat('##,###,##0.00',wVl_Venda_Vendedor);

  if (wVl_Venda_Vendedor = 0) or (wQt_Venda_Vendedor = 0) then
    QRLVl_MEDIA_Vendedor.Caption := '0'
  else
    QRLVl_MEDIA_Vendedor.Caption := FormatFloat('##,###,##0.00',wVl_Venda_Vendedor / wQt_Venda_Vendedor * 60);

  If wQt_Venda_Vendedor = 0 Then
     QrlPerc_Vendedor.Caption := '100'
  Else
     QrlPerc_Vendedor.Caption := FormatFloat('##0.00',wQt_Bonificada_Vendedor / wQt_Venda_Vendedor * 100);
  wQt_Bonificada_Vendedor := 0;
  wQt_Venda_Vendedor := 0;
  wVl_Venda_Vendedor := 0;
end;

procedure TFrResumoCliente.QRPrimarioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  wQt_Venda_Vendedor:=0;      // Isso estava no FormActivate, mas dava erro por que nao estava zerando.
  wQt_Bonificada_Vendedor:=0;
  wQt_Venda_Mes:=0;
  wQt_Bonificada_Mes:=0;
  wVl_Venda_Vendedor:=0;
  wVl_Venda_Mes:=0;
end;

end.
