unit URFluxoCaixaRealizadoSint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRFluxoCaixaRealizadoSint = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRGroup2: TQRGroup;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText7: TQRDBText;
    QRLFilial: TQRLabel;
    QRLPeriodo: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRFluxoCaixaRealizadoSint: TFRFluxoCaixaRealizadoSint;

implementation

uses UCaixaRel_cl;

{$R *.dfm}

end.
