unit URTitulosPorNota;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt, ExtCtrls,
  StdCtrls;

type
  TFRTitulosPorNota = class(TForm)
    QRPrimario: TQuickRep;
    QRBand1: TQRBand;
    QRSysData2: TQRSysData;
    QRLabel2: TQRLabel;
    QRLTitulo: TQRLabel;
    QRLEmpresa: TQRLabel;
    QRSysData1: TQRSysData;
    QRLbPeriodo: TQRLabel;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRLNomeRel: TQRLabel;
    QRBdFooter: TQRBand;
    QRDBText5: TQRDBText;
    QRTextFilter1: TQRTextFilter;
    QRPDFFilter1: TQRPDFFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRDBText3: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    Label1: TLabel;
    QRBand3: TQRBand;
    QRDBText6: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRTitulosPorNota: TFRTitulosPorNota;

implementation

uses UNotaEntradaCad, UContasPagar_cl, UParamSistema_cl;

{$R *.dfm}

end.
