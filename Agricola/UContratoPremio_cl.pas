unit UContratoPremio_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Provider, DBClient, OracleData, OraTeste, Oracle;

type
  TDMContratoPremio = class(TDataModule)
    QContratoPremio: TOracleDataSet1;
    QContratoPremioCOD_CONTRATO_PREMIO: TIntegerField;
    QContratoPremioCOD_FILIAL: TIntegerField;
    QContratoPremioCOD_CADASTRO: TIntegerField;
    QContratoPremioQT_QUANTIDADE: TFloatField;
    QContratoPremioDT_EMISSAO: TDateTimeField;
    QContratoPremioDT_ENTREGA: TDateTimeField;
    QContratoPremioDT_VENCIMENTO: TDateTimeField;
    QContratoPremioDT_ANO_SAFRA: TStringField;
    QContratoPremioDESC_OBS_CANCELADO: TStringField;
    QContratoPremioIND_SITUACAO: TStringField;
    QContratoPremioCons: TOracleDataSet1;
    QContratoPremioConsCOD_CONTRATO_PREMIO: TIntegerField;
    QContratoPremioConsDESC_FILIAL: TStringField;
    QContratoPremioConsNOME: TStringField;
    QContratoPremioConsDESC_PRODUTO: TStringField;
    QContratoPremioConsQT_QUANTIDADE: TFloatField;
    QContratoPremioConsDT_EMISSAO: TDateTimeField;
    QContratoPremioConsDT_ENTREGA: TDateTimeField;
    QContratoPremioConsDT_VENCIMENTO: TDateTimeField;
    QContratoPremioConsDT_ANO_SAFRA: TStringField;
    QContratoPremioConsIND_SITUACAO: TStringField;
    QContratoPremioIND_TIPO_PREMIO: TStringField;
    QRContratoPremio: TOracleDataSet1;
    QRContratoPremioDT_EMISSAO: TDateTimeField;
    QRContratoPremioDT_ENTREGA: TDateTimeField;
    QRContratoPremioDESC_PRODUTOR: TStringField;
    QRContratoPremioQT_QUANTIDADE: TFloatField;
    QRContratoPremioDT_VENCIMENTO: TDateTimeField;
    QRContratoPremioQT_FIXADO: TFloatField;
    QRContratoPremioQT_SALDO: TFloatField;
    QRContratoPremioVAL_PRODUTO: TFloatField;
    QRContratoPremioVAL_PREMIO_UNITARIO: TFloatField;
    QRContratoPremioVAL_PREMIO_TOTAL: TFloatField;
    QContratoPremioVAL_PREMIO: TFloatField;
    QContratoPremioConsVAL_PREMIO: TFloatField;
    QRContratoPrecoFixo: TOracleDataSet1;
    QRContratoPrecoFixoDT_EMISSAO: TDateTimeField;
    QRContratoPrecoFixoDT_ENTREGA: TDateTimeField;
    QRContratoPrecoFixoDESC_PRODUTOR: TStringField;
    QRContratoPrecoFixoQT_QUANTIDADE: TFloatField;
    QRContratoPrecoFixoDT_VENCIMENTO: TDateTimeField;
    QRContratoPrecoFixoQT_FIXADO: TFloatField;
    QRContratoPrecoFixoQT_SALDO: TFloatField;
    QRContratoPrecoFixoVAL_SACA: TFloatField;
    QRContratoPrecoFixoVAL_PRODUTO: TFloatField;
    QRContratoPrecoFixoDESC_PRODUTO: TStringField;
    QContratoPremioConsDESC_MOEDA: TStringField;
    QContratoPremioConsCOD_CADASTRO: TIntegerField;
    QContasPagarPremio: TOracleDataSet1;
    QContasPagarPremioCOD_CONTA_PAGAR_CAB: TIntegerField;
    QContasPagarPremioCOD_FINALIDADE: TIntegerField;
    QContasPagarPremioCOD_BANCO_AGENCIA: TIntegerField;
    QContasPagarPremioCOD_CADASTRO: TIntegerField;
    QContasPagarPremioCOD_FILIAL: TIntegerField;
    QContasPagarPremioNUM_TITULO: TIntegerField;
    QContasPagarPremioNUM_PARCELA: TIntegerField;
    QContasPagarPremioDESC_TIPO_DOCUMENTO: TStringField;
    QContasPagarPremioDT_MOVIMENTO: TDateTimeField;
    QContasPagarPremioDT_BAIXA: TDateTimeField;
    QContasPagarPremioDT_VENCIMENTO: TDateTimeField;
    QContasPagarPremioDT_EMISSAO: TDateTimeField;
    QContasPagarPremioDT_CAPITALIZACAO: TDateTimeField;
    QContasPagarPremioVAL_TITULO: TFloatField;
    QContasPagarPremioCOD_NOTA_CAB: TIntegerField;
    QContasPagarPremioDESC_OBSERVACAO: TStringField;
    QContasPagarPremioIND_ACEITE: TStringField;
    QContasPagarPremioIND_SITUACAO: TStringField;
    QContasPagarPremioVAL_ORIGINAL: TFloatField;
    QContasPagarPremioVAL_INDEXADO: TFloatField;
    QContasPagarPremioCOD_DEPARTAMENTO: TIntegerField;
    QContasPagarPremioCOD_CONTRATO: TIntegerField;
    QContasPagarPremioCOD_CONTRATO_GP: TIntegerField;
    QContratoPremioMov: TOracleDataSet1;
    QContratoPremioMovCOD_CONTRATO_PREMIO_MOV: TIntegerField;
    QContratoPremioMovCOD_CONTRATO_PREMIO: TIntegerField;
    QContratoPremioMovQT_QUANTIDADE: TFloatField;
    QContratoPremioMovDT_MOVIMENTO: TDateTimeField;
    QContratoPremioMovDESC_OBSERVACAO: TStringField;
    QContratoPremioMovCOD_NOTA_CAB: TIntegerField;
    QContratoPremioConsCOD_PRODUTO: TFloatField;
    QContratoPremioConsCOD_FILIAL: TIntegerField;
    QContratoPremioConsIND_TIPO_PREMIO: TStringField;
    QContratoPremioCOD_PRODUTO: TFloatField;
    QContratoPremioDESC_OBS: TStringField;
    procedure QContratoPremioAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMContratoPremio: TDMContratoPremio;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMContratoPremio.QContratoPremioAfterInsert(DataSet: TDataSet);
begin
  QContratoPremioIND_SITUACAO.Value    := 'ABERTO';
//  QContratoPremioIND_TIPO_PREMIO.Value := 'PR';
  QContratoPremioDT_EMISSAO.Value      := date;
end;

end.
