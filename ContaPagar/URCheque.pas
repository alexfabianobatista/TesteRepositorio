unit URCheque;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TQRCheque = class(TQuickRep)
    TitleBand1: TQRBand;
    QRLValor: TQRLabel;
    QRLValorExtenso: TQRLabel;
    QRLCidade: TQRLabel;
    QRLDia: TQRLabel;
    QRLMes: TQRLabel;
    QRLAno: TQRLabel;
    QRLabel1: TQRLabel;
  private

  public

  end;

var
  QRCheque: TQRCheque;

implementation

{$R *.DFM}

end.
