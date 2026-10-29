unit URRegServPrestados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFRRegServPrestados = class(TFTRelSimples)
    QRLNomeFilial: TQRLabel;
    QRLCGCFilial: TQRLabel;
    QRLInscricaoFilial: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRBand5: TQRBand;
    QRLabel19: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRBand6: TQRBand;
    QRSysData3: TQRSysData;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText6: TQRDBText;
    ChildBand1: TQRChildBand;
    QRLabel16: TQRLabel;
    QRShape1: TQRShape;
    QRLabel21: TQRLabel;
    QRLPaginaI: TQRLabel;
    QRDBText10: TQRDBText;
    QRExpr4: TQRExpr;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand5AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
    fPaginaCorrente : Integer;
  public
    { Public declarations }
    Property pPaginaCorrente : Integer Read fPaginaCorrente Write fPaginaCorrente;
  end;

var
  FRRegServPrestados: TFRRegServPrestados;

implementation

uses URegServPrestados_cl, URegServPrestadosParam;

{$R *.DFM}

procedure TFRRegServPrestados.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLPaginaI.Caption := FormatFloat('####0',pPaginaCorrente);
  pPaginaCorrente := pPaginaCorrente + 1;

end;

procedure TFRRegServPrestados.QRBand5AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  pPaginaCorrente := Trunc(StrToFloat(FRegServPrestadosParam.ME0PaginaI.Text));
end;

end.
