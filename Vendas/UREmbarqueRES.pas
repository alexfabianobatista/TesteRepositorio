unit UREmbarqueRES;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFREmbarqueRes = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRBand5: TQRBand;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRCompositeReport1: TQRCompositeReport;
    QrlQtdeEntrega: TQRLabel;
    QRBand4: TQRBand;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    procedure QRCompositeReport1AddReports(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FREmbarqueRes: TFREmbarqueRes;

implementation
uses uEmbarque_cl, urEmbarquePrazoVcto, UREmbarque2, UREmbarquePesoPorCidade,
     UParamSistema_cl;
{$R *.dfm}

procedure TFREmbarqueRes.QRCompositeReport1AddReports(Sender: TObject);
begin
  inherited;
  QRCompositeReport1.Reports.Add(FREmbarqueRES.QRPrimario);
  if (DMParamSistema.CodEmpresa = 'DEION') then    //Junior Deion solicitou peso bruto por cidade. Junior 16/12/2021. Suporte:4241
    QRCompositeReport1.Reports.Add(FREmbarquePesoPorCidade.QRPrimario);
  QRCompositeReport1.Reports.Add(FREmbarquePrazoVcto.QRPrimario);
end;

end.
