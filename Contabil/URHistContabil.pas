unit URHistContabil;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFrHistContabil = class(TFTRelSimples)
    QRBand4: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLNumPagina: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
    FPag_Inicial,FPag_Inicial_Param,FNum_Linhas: real;
   public
    { Public declarations }
    Property Pag_Inicial: Real Read FPag_Inicial write FPag_Inicial;
    Property Pag_Inicial_Param: Real Read FPag_Inicial_Param write FPag_Inicial_Param;
  end;

var
  vNum_Pagina:Real;
  FrHistContabil: TFrHistContabil;

implementation

uses UHistContabil_cl;

{$R *.DFM}

procedure TFrHistContabil.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  vNum_Pagina:=vNum_Pagina+1;
  QRLNumPagina.Caption:=FloatToStr(vNum_Pagina);

end;

procedure TFrHistContabil.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  FPag_Inicial:=FPag_Inicial_Param;
end;

procedure TFrHistContabil.QRPrimarioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  vNum_Pagina:=Pag_Inicial;
end;

end.
