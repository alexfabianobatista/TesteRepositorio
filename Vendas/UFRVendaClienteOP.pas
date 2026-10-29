unit UFRVendaClienteOP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRVendaClienteOP = class(TFTRelSimples)
    QRLbFilial: TQRLabel;
    QRLabel3: TQRLabel;
    QRLbPeriodo: TQRLabel;
    QRGroup1: TQRGroup;
    QRBand3: TQRBand;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRBand4: TQRBand;
    QRExpr1: TQRExpr;
    QRGroup2: TQRGroup;
    QRDBTipo: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBQT_Quantidade: TQRDBText;
    QRLabel4: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRExpr3: TQRExpr;
    QRDBText6: TQRDBText;
    QRLabel8: TQRLabel;
    QRBand5: TQRBand;
    QRLabel9: TQRLabel;
    QRLTotal_Base: TQRLabel;
    QRLTotal: TQRLabel;
    procedure QRGroup2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRVendaClienteOP: TFRVendaClienteOP;
  val_total_base : Double = 0;
  val_total      : Double = 0;

implementation
uses URelatorioVenda_cl;

{$R *.dfm}

procedure TFRVendaClienteOP.QRGroup2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRExpr1.Reset;
  QrExpr2.Reset;
  QRExpr3.Reset;
  if DMRelatorio_Venda.QRVendaClienteOPTIPO.Value = 'PRODUTOS' then
  begin
    QRDBQT_Quantidade.Enabled := True;
    QRLabel4.Enabled := true;
    QRExpr2.Enabled  := True;
  end
  else
  begin
    QRDBQT_Quantidade.Enabled := False;
    QRLabel4.Enabled := False;
    QRExpr2.Enabled  := False;
  end;

end;

procedure TFRVendaClienteOP.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if DMRelatorio_Venda.QRVendaClienteOPTIPO.Value = 'OPERACOES' then
  begin
    val_total_base := val_total_base + DMRelatorio_Venda.QRVendaClienteOPSVAL_BASE_CALCULO.Value;
    val_total      := val_total + DMRelatorio_Venda.QRVendaClienteOPSVAL_TOTAL.Value;
  end;
end;

procedure TFRVendaClienteOP.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLTotal_Base.Caption := FloatToStr(val_total_base);
  QRLTotal.Caption      := FloatToStr(val_total);
end;

end.
