unit UROrdemServico_Sintetico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFROrdemServico_Sintetico = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRBand4: TQRBand;
    QRLabel4: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel9: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel10: TQRLabel;
    QRLPeriodoEntrada: TQRLabel;
    QRLPeriodoSaida: TQRLabel;
    QRLIndSituacaoOS: TQRLabel;
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FROrdemServico_Sintetico: TFROrdemServico_Sintetico;

implementation

uses UOrdemServico_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFROrdemServico_Sintetico.QRPrimarioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  if (DMParamSistema.CodEmpresa = 'FURGOESMED') then
  begin
    QRLabel5.Enabled := False;
    QRLabel6.Enabled := False;
    QRDBText4.Enabled := False;
    QRDBText5.Enabled := False;
    QRExpr2.Enabled := False;
    QRExpr3.Enabled := False;
  end;
end;

end.
