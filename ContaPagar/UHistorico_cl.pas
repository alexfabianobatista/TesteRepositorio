unit UHistorico_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste;

type
  TDMHistorico = class(TDataModule)
    QHistorico: TOracleDataSet1;
    QHistoricoCOD_HISTORICO: TIntegerField;
    QHistoricoDESC_HISTORICO: TStringField;
    QHistoricoIND_OPERACAO: TStringField;
    QHistoricoIND_EMITE_CHEQUE: TStringField;
    QHistoricoIND_CONCILIA: TStringField;
    QHistoricoCOD_HISTORICO_CONTABIL: TIntegerField;
    QHistoricoCOD_CONTABIL_CRED: TStringField;
    QHistoricoCOD_CONTABIL_DEB: TStringField;
    QHistoricoCOD_HISTORICO_CAIXA: TIntegerField;
    QHistoricoCons: TOracleDataSet1;
    QRHistorico: TOracleDataSet1;
    QHistoricoCOD_DEPARTAMENTO: TIntegerField;
    QRHistoricoCOD_HISTORICO: TIntegerField;
    QRHistoricoDESC_HISTORICO: TStringField;
    QRHistoricoIND_OPERACAO: TStringField;
    QRHistoricoIND_EMITE_CHEQUE: TStringField;
    QRHistoricoIND_CONCILIA: TStringField;
    QRHistoricoCOD_HISTORICO_CONTABIL: TIntegerField;
    QRHistoricoCOD_CONTABIL_CRED: TStringField;
    QRHistoricoCOD_CONTABIL_DEB: TStringField;
    QRHistoricoCOD_DEPARTAMENTO: TIntegerField;
    QHistoricoIND_SITUACAO: TStringField;
    QHistoricoCOD_CENTRO_CUSTO: TIntegerField;
    QRHistoricoCOD_CENTRO_CUSTO: TIntegerField;
    QRHistoricoIND_SITUACAO: TStringField;
    QRHistoricoDESC_DEPARTAMENTO: TStringField;
    QHistoricoIND_VEICULO: TStringField;
    QHistoricoIND_CUSTOS: TStringField;
    QHistoricoCOD_GRUPO: TIntegerField;
    QHistoricoIND_LANCTO_MOV_FLUXO: TStringField;
    QHistoricoIND_ADIANTAMENTO: TStringField;
    QHistoricoIND_TIPO_CUSTO: TStringField;
    QHistoricoIND_TIPO_RECIBO: TStringField;
    QHistoricoIND_REL_CAIXA_BANCO: TStringField;
    QHistoricoNUM_PLANO_CONTA_CAIXA: TStringField;
    QRPlanoContasCaixa: TOracleDataSet1;
    QRPlanoContasCaixaCOD_HISTORICO: TIntegerField;
    QRPlanoContasCaixaDESC_HISTORICO: TStringField;
    QRPlanoContasCaixaNUM_PLANO_CONTA_CAIXA: TStringField;
    QRPlanoContasCaixaNUM_PLANO1: TStringField;
    QRPlanoContasCaixaNUM_PLANO2: TStringField;
    QHistoricoConsCOD_HISTORICO: TIntegerField;
    QHistoricoConsDESC_HISTORICO: TStringField;
    QHistoricoConsIND_OPERACAO: TStringField;
    QHistoricoConsIND_EMITE_CHEQUE: TStringField;
    QHistoricoConsIND_CONCILIA: TStringField;
    QHistoricoConsIND_CUSTOS: TStringField;
    QHistoricoConsCOD_HISTORICO_CONTABIL: TIntegerField;
    QHistoricoConsCOD_CONTABIL_CRED: TStringField;
    QHistoricoConsCOD_CONTABIL_DEB: TStringField;
    QHistoricoConsCOD_DEPARTAMENTO: TIntegerField;
    QHistoricoConsDESC_DEPARTAMENTO: TStringField;
    QHistoricoConsNUM_PLANO_CONTA_CAIXA: TStringField;
    QHistoricoIND_DRE_POLYANA: TStringField;
    QHistoricoCOD_USUARIO: TIntegerField;
    procedure QHistoricoAfterInsert(DataSet: TDataSet);
    procedure QHistoricoBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMHistorico: TDMHistorico;

implementation

uses UOracle_cl, UUsuario_cl;

{$R *.DFM}

procedure TDMHistorico.QHistoricoAfterInsert(DataSet: TDataSet);
begin
  DataSet['Ind_Concilia']:='S';
  DataSet['Ind_Operacao']:='+';
  DataSet['Ind_Emite_cheque']:='S';
  DataSet['Ind_Veiculo']:='N';
  DataSet['IND_ADIANTAMENTO']:='NAO';
  DataSet['IND_LANCTO_MOV_FLUXO']:='SIM';
  DataSet['Cod_Historico']:=DMOracle.Sequencia('HISTORICO');
end;

procedure TDMHistorico.QHistoricoBeforePost(DataSet: TDataSet);
begin
  QHistoricoCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
end;

end.
