unit URNota_Pedido;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TFRNota_Pedido = class(TForm)
    QRPrimario: TQuickRep;
    QRBCabecalho: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText15: TQRDBText;
    QRSubDetail2: TQRSubDetail;
    QRSBCabReceber: TQRStringsBand;
    QRLabel15: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel21: TQRLabel;
    QRL_Total: TQRLabel;
    QRLPedOrc: TQRLabel;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRSBRodAssinatura: TQRStringsBand;
    QRLabel23: TQRLabel;
    QRShape1: TQRShape;
    QRDBText23: TQRDBText;
    QRShape2: TQRShape;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText27: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText28: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText29: TQRDBText;
    QRLabel25: TQRLabel;
    QRL_Pedido: TQRLabel;
    procedure QRBCabecalhoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSBCabReceberBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRNota_Pedido: TFRNota_Pedido;

implementation

uses UNotaSaida_cl;

{$R *.DFM}

procedure TFRNota_Pedido.QRBCabecalhoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  (*  With DMNotaSaida do
  Begin
    Case StrToInt(QNFE_EmiteInd_Condicao_Pagto.Value) of
      1: QRLCondPagto.Caption := 'A VISTA';
      2: QRLCondPagto.Caption := 'A PRAZO';
      3: QRLCondPagto.Caption := 'CONTA CORRENTE';
    End; // Case
  End;
*)
end;

procedure TFRNota_Pedido.QRSBCabReceberBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  With DMNotaSaida do
  Begin
    QRL_Pedido.Caption := FormatFloat('###,###,##0.00',QNFE_EmiteTotal_Produtos.Value);
    QRL_Total.Caption := FormatFloat('###,###,##0.00',QNFE_EmiteTotal_Produtos.Value);
  End;

end;

end.
