unit UEGF_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMEGF = class(TDataModule)
    QEGF: TOracleDataSet1;
    QEGFCOD_EGF: TIntegerField;
    QEGFCOD_CONTA_CORRENTE: TIntegerField;
    QEGFDT_CREDITO: TDateTimeField;
    QEGFPERC_JUROS_AA: TFloatField;
    QEGFNUM_CEDULA: TStringField;
    QEGFDESC_PRODUTO: TStringField;
    QEGFQTD_PRODUTO: TFloatField;
    QEGFCOD_FILIAL: TIntegerField;
    QEGFVAL_SEGURO: TFloatField;
    QEGFVAL_ORIGINAL: TFloatField;
    QEGFDT_VENCIMENTO: TDateTimeField;
    QEGFVAL_REGISTRO: TFloatField;
    QEGFDT_BAIXA_PENHOR: TDateTimeField;
    QEGFCons: TOracleDataSet1;
    QEGFConsCOD_EGF: TIntegerField;
    QEGFConsDESC_BANCO_CONTA: TStringField;
    QEGFConsDT_CREDITO: TDateTimeField;
    QEGFConsPERC_JUROS_AA: TFloatField;
    QEGFConsNUM_CEDULA: TStringField;
    QEGFConsDESC_PRODUTO: TStringField;
    QEGFConsQTD_PRODUTO: TFloatField;
    QEGFConsDESC_FILIAL: TStringField;
    QEGFConsVAL_SEGURO: TFloatField;
    QEGFConsVAL_ORIGINAL: TFloatField;
    QEGFConsDT_VENCIMENTO: TDateTimeField;
    QREGF: TOracleDataSet1;
    QREGFCOD_EGF: TIntegerField;
    QREGFDESC_BANCO_AGENCIA: TStringField;
    QREGFDT_CREDITO: TDateTimeField;
    QREGFPERC_JUROS_AA: TFloatField;
    QREGFNUM_CEDULA: TStringField;
    QREGFDESC_PRODUTO: TStringField;
    QREGFQTD_PRODUTO: TFloatField;
    QREGFDESC_FILIAL: TStringField;
    QREGFVAL_SEGURO: TFloatField;
    QREGFVAL_ORIGINAL: TFloatField;
    QREGFDT_VENCIMENTO: TDateTimeField;
    QREGFVAL_JURO: TFloatField;
    QRPenhorProduto: TOracleDataSet1;
    QRPenhorProdutoDESC_PRODUTO: TStringField;
    QRPenhorProdutoQTD_PRODUTO: TFloatField;
    QREGFMes: TOracleDataSet1;
    QREGFMesDESC_MES: TStringField;
    QREGFMesVAL_ORIGINAL: TFloatField;
    QEGFCOD_HISTORICO: TIntegerField;
    QEGFVAL_BAIXA_PENHOR: TFloatField;
    QEGFCOD_DEPARTAMENTO: TIntegerField;
    QEGFCOD_USUARIO: TIntegerField;
    QEGFVAL_ATUAL_TITULO: TFloatField;
    QEGFLiq: TOracleDataSet1;
    QEGFLiqCOD_EGF_LIQ: TIntegerField;
    QEGFLiqCOD_EGF: TIntegerField;
    QEGFLiqDT_MOVIMENTO: TDateTimeField;
    QEGFLiqVAL_MOVIMENTO: TFloatField;
    QEGFLiqVAL_JURO: TFloatField;
    QEGFLiqCOD_USUARIO: TIntegerField;
    QEGFLiqCOD_BCO_MOVIMENTO: TIntegerField;
    QEGFLiqCOD_HISTORICO: TIntegerField;
    QEGFVAL_APLICACAO: TFloatField;
    QEGFPERC_APLICACAO: TStringField;
    QREGFVAL_APLICACAO: TFloatField;
    QEGFConsVAL_LIQUIDADO: TFloatField;
    procedure QEGFAfterInsert(DataSet: TDataSet);
    procedure QEGFLiqAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMEGF: TDMEGF;

implementation

uses UOracle_cl, UUsuario_cl;

{$R *.DFM}

procedure TDMEGF.QEGFAfterInsert(DataSet: TDataSet);
begin
  QEGFCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
end;

procedure TDMEGF.QEGFLiqAfterInsert(DataSet: TDataSet);
var wVal : string;
begin
  QEGFLiqCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
  QEGFLiqDT_MOVIMENTO.Value := date;

  wVal := DMOracle.BuscaNome('SELECT VAL_ATUAL_TITULO FROM TB_EGF','COD_EGF = ' + QEGFLiqCOD_EGF.Text);

  QEGFLiqVAL_MOVIMENTO.Value := StrToFloat(wVal);
end;

end.
