unit URGuiaCustodia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TFRGuiaCustodia = class(TForm)
    QRPrimario: TQuickRep;
    DetailBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel4: TQRLabel;
    QRLBDT_Entrega: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLAgencia: TQRLabel;
    QRLAgenciaEntrega: TQRLabel;
    QRLConta: TQRLabel;
    QRLNumRemessa: TQRLabel;
    QRLConvenio: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRGuiaCustodia: TFRGuiaCustodia;

implementation

uses UBancoAgencia_cl, UFilial_cl, UFuncao_cl;

{$R *.DFM}

end.
