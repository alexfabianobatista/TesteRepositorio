unit UControleCargaRel_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMControleCargaRel = class(TDataModule)
    QRControleCarga: TOracleDataSet1;
    QRControleCargaCOD_CONTROLE_CARGA: TIntegerField;
    QRControleCargaCOD_EMBARQUE: TIntegerField;
    QRControleCargaDT_SAIDA: TDateTimeField;
    QRControleCargaDT_VENCIMENTO: TDateTimeField;
    QRControleCargaDESC_MOTORISTA: TStringField;
    QRControleCargaDESC_VIAGEM_PARA: TStringField;
    QRControleCargaKM_TOTAL: TFloatField;
    QRControleCargaVAL_KM: TFloatField;
    QRControleCargaVAL_FRETE: TFloatField;
    QRControleCargaVAL_AJUDA_CUSTO: TFloatField;
    QRControleCargaVAL_ADTO_VIAGEM: TFloatField;
    QRControleCargaVAL_SALDO_PAGAR: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMControleCargaRel: TDMControleCargaRel;

implementation

uses UOracle_cl;

{$R *.DFM}

end.
