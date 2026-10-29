unit URRecibo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls;

type
  TFRRecibo = class(TForm)
    QRPrimario: TQuickRep;
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel7: TQRLabel;
    QRLValorExtenso: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText12: TQRDBText;
    QRLData: TQRLabel;
    QRLabel13: TQRLabel;
    QRLResponsavel: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText8: TQRDBText;
    QRLNumRecibo: TQRLabel;
    QRLNumOS: TQRLabel;
    QRLValor: TQRLabel;
    QRLCliente: TQRLabel;
    QRLReferente: TQRLabel;
    QRLabel1: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    fValor : Real;
  public
    { Public declarations }
    Property pValor : Real Read fValor Write fValor;
  end;

var
  FRRecibo: TFRRecibo;

implementation

uses UFilial_cl, UBiblioteca;


{$R *.DFM}

procedure TFRRecibo.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLValor.Caption := FormatFloat('###,###,##0.00',pValor);
  QRLValorExtenso.Caption := Bib.Extenso(pValor);
end;

end.
