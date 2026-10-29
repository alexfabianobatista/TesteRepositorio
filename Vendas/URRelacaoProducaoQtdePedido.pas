unit URRelacaoProducaoQtdePedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRRelacaoProducaoQtdePedido = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRBand4: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRCompositeReport1: TQRCompositeReport;
    QRLEmbarque: TQRLabel;
    procedure QRCompositeReport1AddReports(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRRelacaoProducaoQtdePedido: TFRRelacaoProducaoQtdePedido;

implementation
uses UOracle_cl, UEmbarque_cl, URRelacaoProducao;
{$R *.dfm}

procedure TFRRelacaoProducaoQtdePedido.QRCompositeReport1AddReports(
  Sender: TObject);
begin
  inherited;
  QRCompositeReport1.Reports.Add(FRRelacaoProducaoQtdePedido.QRPrimario);
  QRCompositeReport1.Reports.Add(FRRelacaoProducao.QRPrimario);
end;

end.
