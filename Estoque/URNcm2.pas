unit URNcm2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt, ExtCtrls;

type
  TFRNcm2 = class(TForm)
    QRPrimario: TQuickRep;
    QRBand1: TQRBand;
    QRSysData2: TQRSysData;
    QRLabel2: TQRLabel;
    QRLTitulo: TQRLabel;
    QRSysData1: TQRSysData;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRLNomeRelatorio: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText4: TQRDBText;
    ColumnHeaderBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRTextFilter1: TQRTextFilter;
    QRPDFFilter1: TQRPDFFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLEmpresa: TQRLabel;
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRNcm2: TFRNcm2;

implementation

uses UNcm_cl, UOracle_cl;

{$R *.dfm}

procedure TFRNcm2.QRPrimarioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
  var wEmpresa : String;
begin
  wEmpresa :=DMOracle.BuscaNome('SELECT COD_EMPRESA FROM TB_PARAM_SISTEMA','COD_FILIAL>=0');
  QRLNomeRelatorio.Caption := 'FRNcm2';
  QRLEmpresa.Caption := wEmpresa;
end;

end.
