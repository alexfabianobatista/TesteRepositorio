unit URReciboFrete;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TFRReciboFrete = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLValorFrete: TQRLabel;
    QRLabel13: TQRLabel;
    QRLResponsavel: TQRLabel;
    QRLabel12: TQRLabel;
    QRLValorAdiantamento: TQRLabel;
    QRLabel14: TQRLabel;
    QRLAjudaCusto: TQRLabel;
    QRLabel15: TQRLabel;
    QRLValorCarga: TQRLabel;
    QRLabel1: TQRLabel;
    QRLValor_Pagamento: TQRLabel;
    QRLTitulo: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel9: TQRLabel;
    QRLPerc: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel21: TQRLabel;
    QRLFilial: TQRLabel;
    QRLabel22: TQRLabel;
    QRLObs: TQRLabel;
    QRLabel23: TQRLabel;
    QRLNumConhecimento: TQRLabel;
    QRLCarga: TQRLabel;
    QRLDtSaida: TQRLabel;
    QRLVencimento: TQRLabel;
    QRLTransportador: TQRLabel;
    QRLMotorista: TQRLabel;
    QRLabel24: TQRLabel;
    QRLDestino: TQRLabel;
    QRLKMSaida: TQRLabel;
    QRLKMChegada: TQRLabel;
    QRLKMTotal: TQRLabel;
    QRLabel25: TQRLabel;
    QRLVlrPedagio: TQRLabel;
    QRLabel26: TQRLabel;
    QRLVlrTotal: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLValorICMS: TQRLabel;
    QRLabel16: TQRLabel;
    qrlNumManifesto: TQRLabel;
    QRLabel29: TQRLabel;
    qrlValorManifesto: TQRLabel;
    QRLabel31: TQRLabel;
    qrlFreteComplemento: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRReciboFrete: TFRReciboFrete;

implementation

uses UEmbarque_cl;

{$R *.DFM}

end.
