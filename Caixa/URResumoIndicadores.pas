unit URResumoIndicadores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFRResumoIndicadores = class(TFTRelSimples)
    QRLabel3: TQRLabel;
    qrlValorEstoque: TQRLabel;
    QRLabel5: TQRLabel;
    qrlTotalItensEstoque: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    qrlVendasBrutasAC: TQRLabel;
    qrl1: TQRLabel;
    qrlNumItensAC: TQRLabel;
    QRLabel13: TQRLabel;
    qrlVendasAVistaAC: TQRLabel;
    QRLabel15: TQRLabel;
    qrlPercAVistaAC: TQRLabel;
    QRLabel17: TQRLabel;
    qrlVendasAPrazoAC: TQRLabel;
    QRLabel19: TQRLabel;
    qrlPercAPrazoAC: TQRLabel;
    QRLabel21: TQRLabel;
    qrlCMVAVistaAC: TQRLabel;
    QRLabel23: TQRLabel;
    qrlMargemBrutaAC: TQRLabel;
    QRLabel25: TQRLabel;
    qrlVendasBrutas: TQRLabel;
    QRLabel27: TQRLabel;
    qrlNumItens: TQRLabel;
    QRLabel29: TQRLabel;
    qrlVendasAVista: TQRLabel;
    QRLabel31: TQRLabel;
    qrlPercAVista: TQRLabel;
    QRLabel33: TQRLabel;
    qrlVendasAPrazo: TQRLabel;
    QRLabel35: TQRLabel;
    qrlPercAPrazo: TQRLabel;
    QRLabel37: TQRLabel;
    qrlCMVAVista: TQRLabel;
    QRLabel39: TQRLabel;
    qrlMargemBruta: TQRLabel;
    QRLabel41: TQRLabel;
    qrlContasReceber: TQRLabel;
    QRLabel43: TQRLabel;
    qrlContasReceberVenc: TQRLabel;
    qrlMesReceber1: TQRLabel;
    qrlContasReceber1: TQRLabel;
    qrlMesReceber2: TQRLabel;
    qrlContasReceber2: TQRLabel;
    qrlMesReceber3: TQRLabel;
    qrlContasReceber3: TQRLabel;
    qrlMesReceber4: TQRLabel;
    qrlContasReceber4: TQRLabel;
    qrlMesReceber5: TQRLabel;
    qrlContasReceber5: TQRLabel;
    qrlMesReceber6: TQRLabel;
    qrlContasReceber6: TQRLabel;
    qrlMesReceber7: TQRLabel;
    qrlContasReceber7: TQRLabel;
    qrlMesReceber8: TQRLabel;
    qrlContasReceber8: TQRLabel;
    QRLabel61: TQRLabel;
    qrlContasPagar: TQRLabel;
    QRLabel63: TQRLabel;
    qrlContasPagarVenc: TQRLabel;
    qrlMesPagar1: TQRLabel;
    qrlContasPagar1: TQRLabel;
    qrlMesPagar2: TQRLabel;
    qrlContasPagar2: TQRLabel;
    qrlMesPagar3: TQRLabel;
    qrlContasPagar3: TQRLabel;
    qrlMesPagar4: TQRLabel;
    qrlContasPagar4: TQRLabel;
    qrlMesPagar5: TQRLabel;
    qrlContasPagar5: TQRLabel;
    qrlMesPagar6: TQRLabel;
    qrlContasPagar6: TQRLabel;
    qrlMesPagar7: TQRLabel;
    qrlContasPagar7: TQRLabel;
    qrlMesPagar8: TQRLabel;
    qrlContasPagar8: TQRLabel;
    DetailBand1: TQRBand;
    QRLabel4: TQRLabel;
    qrlSaldoBanco: TQRLabel;
    QRLabel10: TQRLabel;
    qrlSaldoCaixa: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    GroupHeaderBand1: TQRBand;
    GroupFooterBand1: TQRBand;
    QRLabel6: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRExpr1: TQRExpr;
    QRLabel12: TQRLabel;
    QRShape1: TQRShape;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRResumoIndicadores: TFRResumoIndicadores;

implementation

uses UParamSistema_cl, UCaixaRel_cl;

{$R *.DFM}

procedure TFRResumoIndicadores.FormCreate(Sender: TObject);
begin
  inherited;
  if QRPrimario.DataSet = nil then
    QRPrimario.DataSet := DMParamSistema.QParamSistema;
end;

end.
