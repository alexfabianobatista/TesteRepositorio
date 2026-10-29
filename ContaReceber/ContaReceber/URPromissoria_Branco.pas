unit URPromissoria_Branco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TFrPromissoria_Branco = class(TForm)
    QrPrimario: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QrDescricao: TQRLabel;
    QRLabel5: TQRLabel;
    QrLocal_Pagamento: TQRLabel;
    QRLabel7: TQRLabel;
    QrEmitente: TQRLabel;
    QRLabel8: TQRLabel;
    QrCpf_Cnpj: TQRLabel;
    QRLabel9: TQRLabel;
    QrEndereco: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel6: TQRLabel;
    QRLCidade: TQRLabel;
    QRShape3: TQRShape;
    QrNomeEmitente: TQRLabel;
    QRCpfEmitente: TQRLabel;
    QRLAvalista1: TQRLabel;
    QRLAvalista2: TQRLabel;
    QRLabel11: TQRLabel;
    QRCidade: TQRLabel;
    QRLValor: TQRLabel;
    QRLNumero: TQRLabel;
    QRLParcela: TQRLabel;
    QRLVencimento: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrPromissoria_Branco: TFrPromissoria_Branco;

implementation

{$R *.DFM}

end.
