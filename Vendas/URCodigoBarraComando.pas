unit URCodigoBarraComando;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRCtrls, QRExport, QRWebFilt, QRPDFFilt, QuickRpt,
  ExtCtrls, BarCode;

type
  TFRCodigoBarraComando = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRIBarra: TQRImage;
    QRDBTDescricao: TQRDBText;
    QRDBCodigo: TQRDBText;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    BCode: TBarcode;
  public
    { Public declarations }
  end;

var
  FRCodigoBarraComando: TFRCodigoBarraComando;

implementation

uses UEmbarque_cl, ClipBrd;

{$R *.dfm}

procedure TFRCodigoBarraComando.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  BCode.Digits := DMEmbarque.CDSCodigoBarraComandoCODIGO.Value;
  BCode.BarcodeCopy;
  QRIBarra.Picture.Assign(Clipboard);
end;

procedure TFRCodigoBarraComando.FormCreate(Sender: TObject);
begin
  inherited;
  BCode := TBarcode.Create(Self);
  BCode.BarcodeType := btCode39;
end;

end.
