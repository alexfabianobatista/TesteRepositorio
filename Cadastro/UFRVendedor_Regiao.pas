unit UFRVendedor_Regiao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QuickRpt, Qrctrls, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRVendedor_Regiao = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRGroup1: TQRGroup;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel6: TQRLabel;
    QRTextFilterRobson: TQRTextFilter;
    procedure QRPrimarioAfterPreview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRVendedor_Regiao: TFRVendedor_Regiao;

implementation

uses UVendedor_cl;

{$R *.DFM}

procedure TFRVendedor_Regiao.QRPrimarioAfterPreview(Sender: TObject);
var wNomeRep : String;
begin
  inherited;
  if messageDlg('Deseja imprimir para arquivo?',mtInformation,[mbOK, mbCancel],0) = mrOK then
  begin
    wNomeRep := 'C:\'+FRVendedor_Regiao.Name+'.TXT';
    FRVendedor_Regiao.QRPrimario.ExportToFilter(TQRAsciiExportFilter.Create(wNomeRep));
  end;  
end;

end.
