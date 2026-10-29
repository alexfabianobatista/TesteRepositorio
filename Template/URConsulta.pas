unit URConsulta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, QRExport, QRPDFFilt;

type
  TFRConsulta = class(TForm)
    qRelatorio: TQuickRep;
    bTitulo: TQRBand;
    bSumario: TQRBand;
    bRodape: TQRBand;
    bDetalhe: TQRBand;
    QRTextFilter1: TQRTextFilter;
    QRPDFFilter1: TQRPDFFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRConsulta: TFRConsulta;

implementation

{$R *.dfm}

end.
