unit UPremioExportacao_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMPremioExportacao = class(TDataModule)
    QPremioExportacao: TOracleDataSet1;
    QPremioExportacaoCOD_PREMIO_EXPORTACAO: TIntegerField;
    QPremioExportacaoDESC_CONTRATO: TStringField;
    QPremioExportacaoDT_CONTRATO: TDateTimeField;
    QPremioExportacaoCOD_CONTA_CORRENTE: TIntegerField;
    QPremioExportacaoVAL_DOLAR: TFloatField;
    QPremioExportacaoVAL_TAXA_DOLAR: TFloatField;
    QPremioExportacaoVAL_REAL: TFloatField;
    QPremioExportacaoCOD_CADASTRO: TIntegerField;
    QPremioExportacaoDESC_NAVIO: TStringField;
    QPremioExportacaoDESC_FATURA: TStringField;
    QPremioExportacaoCons: TOracleDataSet1;
    QPremioExportacaoConsCOD_PREMIO_EXPORTACAO: TIntegerField;
    QPremioExportacaoConsDESC_CONTRATO: TStringField;
    QPremioExportacaoConsDT_CONTRATO: TDateTimeField;
    QPremioExportacaoConsVAL_DOLAR: TFloatField;
    QPremioExportacaoConsVAL_TAXA_DOLAR: TFloatField;
    QPremioExportacaoConsVAL_REAL: TFloatField;
    QPremioExportacaoConsDESC_NAVIO: TStringField;
    QPremioExportacaoConsDESC_FATURA: TStringField;
    QPremioExportacaoConsNUM_CONTA_CORRENTE: TStringField;
    QPremioExportacaoConsCOMPRADOR: TStringField;
    QRPremioExportacao: TOracleDataSet1;
    QRPremioExportacaoCOD_PREMIO_EXPORTACAO: TIntegerField;
    QRPremioExportacaoDESC_CONTRATO: TStringField;
    QRPremioExportacaoDT_CONTRATO: TDateTimeField;
    QRPremioExportacaoDESC_NAVIO: TStringField;
    QRPremioExportacaoDESC_FATURA: TStringField;
    QRPremioExportacaoVAL_DOLAR: TFloatField;
    QRPremioExportacaoVAL_TAXA_DOLAR: TFloatField;
    QRPremioExportacaoVAL_REAL: TFloatField;
    QRPremioExportacaoCOMPRADOR: TStringField;
    QRPremioExportacaoNUM_CONTA_CORRENTE: TStringField;
    QRPremioExportacaoCOD_CADASTRO: TIntegerField;
    QRPremioExportacaoDESC_BANCO_AGENCIA: TStringField;
    QPremioExportacaoCOD_HISTORICO: TIntegerField;
    QPremioExportacaoCOD_LANCTO_CONTABIL_DEB: TIntegerField;
    QPremioExportacaoCOD_LANCTO_CONTABIL_CRED: TIntegerField;
    QPremioExportacaoCOD_DEPARTAMENTO: TIntegerField;
    QPremioExportacaoCOD_USUARIO: TIntegerField;
    QPremioExportacaoCOD_BCO_MOVIMENTO: TIntegerField;
    QPremioExportacaoCOD_FILIAL: TIntegerField;
    procedure QPremioExportacaoBeforePost(DataSet: TDataSet);
    procedure QPremioExportacaoVAL_TAXA_DOLARChange(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMPremioExportacao: TDMPremioExportacao;

implementation

uses UOracle_cl, UUsuario_cl;

{$R *.dfm}

procedure TDMPremioExportacao.QPremioExportacaoBeforePost(
  DataSet: TDataSet);
begin
  DMPremioExportacao.QPremioExportacaoCOD_USUARIO.Value :=
  DMUsuario.CodUsuarioCorrente;
end;

procedure TDMPremioExportacao.QPremioExportacaoVAL_TAXA_DOLARChange(
  Sender: TField);
begin
  QPremioExportacaoVal_Real.Value := QPremioExportacaoVal_Dolar.Value * QPremioExportacaoVal_Taxa_Dolar.Value; 
end;

end.
