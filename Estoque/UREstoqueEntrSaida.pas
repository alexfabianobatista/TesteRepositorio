unit UREstoqueEntrSaida;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, Mask, QRExport, QRWebFilt,
  QRPDFFilt;

type
  TFREstoqueEntrSaida = class(TFTRelSimples)
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel8: TQRLabel;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLFilial: TQRLabel;
    QRBand4: TQRBand;
    QRLabel7: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRL_Saldo: TQRLabel;
    QRL_Saida: TQRLabel;
    QRL_TEntrada: TQRLabel;
    QRL_TSaida: TQRLabel;
    QRLSaldoGeral: TQRLabel;
    QRL_Entrada: TQRLabel;
    QRLSaldo: TQRLabel;
    QRLClasse: TQRLabel;
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRL_TEntradaPrint(sender: TObject; var Value: String);
    procedure QRL_TSaidaPrint(sender: TObject; var Value: String);
    procedure QRLSaldoGeralPrint(sender: TObject; var Value: String);
   private
    { Private declarations }
   public
    { Public declarations }
  end;

var
  FREstoqueEntrSaida: TFREstoqueEntrSaida;
  wTEntrada, wTSaida, wSaldoGeral : Real;
  wSaldo,wSaldoInicial, wQTDEntrada,wQTDSaldo,wQTDSaida : Real;

implementation
uses UEstoque_cl, UProdutoParam;

{$R *.DFM}


procedure TFREstoqueEntrSaida.QRPrimarioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  If TRIM(FREstoqueEntrSaida.QRLSaldo.Caption) <> '' Then
    wSaldoInicial := StrToFloat( TRIM(FREstoqueEntrSaida.QRLSaldo.Caption) )
  Else
    wSaldoInicial := 0;
  // FREstoqueEntrSaida.QRLSaldo.Caption := FormatFloat('###,#00',wSaldoInicial);
  FREstoqueEntrSaida.QRL_Saldo.Caption:=FloatToStr(wSaldoInicial);   // Saldo informado na tela.
  wTEntrada  :=0;
  wTSaida    :=0;
  wSaldoGeral:=0;
  wQTDEntrada:=0;
  wQTDSaida  :=0;
  wQTDSaldo  :=0;
  wsaldo     := wSaldoInicial;
end;

procedure TFREstoqueEntrSaida.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if DMEstoque.QREstoqueEntrSaidaIND_ENTRADA_SAIDA.Value = 'S' then
   begin
     wQTDSaida:= DMEstoque.QREstoqueEntrSaidaQT_QUANTIDADE.Value;
     FREstoqueEntrSaida.QRL_Saida.Caption:=FormatFloat('###,##0.000', wQTDSaida);
     FREstoqueEntrSaida.QRL_Entrada.Caption := '';
     wTSaida := wTSaida + DMEstoque.QREstoqueEntrSaidaQT_QUANTIDADE.Value;
   end;
  if DMEstoque.QREstoqueEntrSaidaIND_ENTRADA_SAIDA.Value = 'E' then
   begin
     wQTDEntrada:= DMEstoque.QREstoqueEntrSaidaQT_QUANTIDADE.Value;
     FREstoqueEntrSaida.QRL_Entrada.Caption := FormatFloat('###,##0.000', wQTDEntrada);
     FREstoqueEntrSaida.QRL_Saida.Caption := '';
     wTEntrada := wTEntrada + DMEstoque.QREstoqueEntrSaidaQT_QUANTIDADE.Value;
   end;
  wsaldo:= wsaldo + DMEstoque.QREstoqueEntrSaidaQT_QUANTIDADE.Value;
  FREstoqueEntrSaida.QRL_Saldo.Caption:=FormatFloat('###,##0.000',wsaldo);
end;

procedure TFREstoqueEntrSaida.QRL_TEntradaPrint(sender: TObject;
  var Value: String);
begin
  inherited;
   Value := FormatFloat('###,##0.000',wTEntrada);
end;

procedure TFREstoqueEntrSaida.QRL_TSaidaPrint(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := FormatFloat('###,##0.000',wTSaida);
end;

procedure TFREstoqueEntrSaida.QRLSaldoGeralPrint(sender: TObject;
  var Value: String);
begin
  inherited;
  wSaldoGeral :=  wSaldoInicial + wTEntrada + wTSaida;
  Value := FormatFloat('###,##0.000',wSaldoGeral);
end;

end.
