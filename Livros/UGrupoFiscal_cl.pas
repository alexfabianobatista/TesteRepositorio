unit UGrupoFiscal_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMGrupoFiscal = class(TDataModule)
    QGrupoFiscalCab: TOracleDataSet1;
    QGrupoFiscalCabCOD_GRUPO_FISCAL_CAB: TIntegerField;
    QGrupoFiscalCabDESC_GRUPO_FISCAL: TStringField;
    QGrupoFiscalItem: TOracleDataSet1;
    QGrupoFiscalItemCOD_GRUPO_FISCAL_ITEM: TIntegerField;
    QGrupoFiscalItemCOD_GRUPO_FISCAL_CAB: TIntegerField;
    QGrupoFiscalItemNUM_NATUREZA_OPERACAO_INI: TIntegerField;
    QGrupoFiscalItemNUM_NATUREZA_OPERACAO_FIM: TIntegerField;
    QGrupoFiscalCons: TOracleDataSet1;
    QGrupoFiscalConsCOD_GRUPO_FISCAL_CAB: TIntegerField;
    QGrupoFiscalConsDESC_GRUPO_FISCAL: TStringField;
    QGrupoFiscalCabIND_TIPO_GRUPO: TStringField;
    QRGrupoFiscal: TOracleDataSet1;
    QRGrupoFiscalCOD_GRUPO_FISCAL_CAB: TIntegerField;
    QRGrupoFiscalDESC_GRUPO_FISCAL: TStringField;
    QRGrupoFiscalIND_TIPO_GRUPO: TStringField;
    QRGrupoFiscalCOD_GRUPO_FISCAL_ITEM: TIntegerField;
    QRGrupoFiscalNUM_NATUREZA_OPERACAO_INI: TIntegerField;
    QRGrupoFiscalNUM_NATUREZA_OPERACAO_FIM: TIntegerField;
    QRGrupoFiscalValor: TOracleDataSet1;
    QRGrupoDFC: TOracleDataSet1;
    QRGrupoFiscalValorVAL_CONTABIL: TFloatField;
    QRGrupoDFCCOD_GRUPO_FISCAL_CAB: TIntegerField;
    QRGrupoDFCDESC_GRUPO_FISCAL: TStringField;
    QRGrupoDFCIND_TIPO_GRUPO: TStringField;
    QRGrupoDFCNUM_NATUREZA_OPERACAO_INI: TIntegerField;
    QRGrupoDFCNUM_NATUREZA_OPERACAO_FIM: TIntegerField;
    QRGrupoFiscalCFOP: TOracleDataSet1;
    QRDFCCidade: TOracleDataSet1;
    QRGrupoFiscalCFOPCOD_FILIAL: TFloatField;
    QRGrupoFiscalCFOPDESC_FILIAL: TStringField;
    QRGrupoFiscalCFOPCFOP: TFloatField;
    QRGrupoFiscalCFOPVAL_CONTABIL: TFloatField;
    QRGrupoFiscalCFOPSVAL_ICM_BASE: TFloatField;
    QRGrupoFiscalCFOPSVAL_ICM_BASE_ISENTO: TFloatField;
    QRGrupoFiscalCFOPSVAL_ICM_BASE_OUTRAS: TFloatField;
    QRMostraDados: TOracleDataSet1;
    QRMostraDadosCOD_FILIAL: TIntegerField;
    QRMostraDadosDESC_FILIAL: TStringField;
    QRMostraDadosCFOP_INICIAL: TIntegerField;
    QRMostraDadosVAL_CONTABIL: TFloatField;
    QRMostraDadosVAL_ICM_BASE: TFloatField;
    QRMostraDadosVAL_ICM_BASE_ISENTO: TFloatField;
    QRMostraDadosVAL_ICM_BASE_OUTRAS: TFloatField;
    QRMostraDadosCFOP_FINAL: TIntegerField;
    QRMostraDadosDESC_GRUPO_FISCAL: TStringField;
    QRDFCEntrada: TOracleDataSet1;
    QRDFCEntradaGRUPO_FISCAL: TStringField;
    QRDFCEntradaVAL_ICM_BASE_SQL: TFloatField;
    QRDFCEntradaVAL_ICM_BASE_ISENTO_SQL: TFloatField;
    QRDFCEntradaVAL_ICM_SQL: TFloatField;
    QRDFCEntradaVAL_ICM_BASE_OUTRAS_SQL: TFloatField;
    QRDFCEntradaVAL_CONTABIL_SQL: TFloatField;
    QRDFCSaida: TOracleDataSet1;
    QRDFCSaidaGRUPO_FISCAL: TStringField;
    QRDFCSaidaVAL_ICM_BASE: TFloatField;
    QRDFCSaidaVAL_ICM_BASE_ISENTO: TFloatField;
    QRDFCSaidaVAL_ICM: TFloatField;
    QRDFCSaidaVAL_ICM_BASE_OUTRAS: TFloatField;
    QRDFCSaidaVAL_CONTABIL: TFloatField;
    QRDFCArquivo: TOracleDataSet1;
    QRDFCArquivoSaida: TOracleDataSet1;
    QGrupoFiscalCabDESC_GRUPO_CONTABEIS: TIntegerField;
    QGrupoFiscalCabDESC_GRUPO_BASE: TIntegerField;
    QGrupoFiscalCabDESC_GRUPO_ISENTAS: TIntegerField;
    QGrupoFiscalCabDESC_GRUPO_OUTRAS: TIntegerField;
    QRDFCArquivoVAL_ICM_BASE: TFloatField;
    QRDFCArquivoVAL_ICM_BASE_ISENTO: TFloatField;
    QRDFCArquivoVAL_ICM: TFloatField;
    QRDFCArquivoVAL_ICM_BASE_OUTRAS: TFloatField;
    QRDFCArquivoVAL_CONTABIL: TFloatField;
    QRDFCArquivoSaidaVAL_ICM_BASE: TFloatField;
    QRDFCArquivoSaidaVAL_ICM_BASE_ISENTO: TFloatField;
    QRDFCArquivoSaidaVAL_ICM: TFloatField;
    QRDFCArquivoSaidaVAL_ICM_BASE_OUTRAS: TFloatField;
    QRDFCArquivoSaidaVAL_CONTABIL: TFloatField;
    QRDFCCidadeVAL_CONTABIL: TFloatField;
    QRDFCCidadeDESC_CIDADE: TStringField;
    QRDFCCidadeVAL_CONTABIL_ENTRADA: TFloatField;
    QRDFCCidadeVAL_CONTABIL_SAIDA: TFloatField;
    QRGIArquivo: TOracleDataSet1;
    QRGIArquivoCOD_ESTADO: TStringField;
    QRGIArquivoIND_ENTRADA_SAIDA: TStringField;
    QRGIArquivoIND_FISICA_JURIDICA: TStringField;
    QRGIArquivoVAL_ICM_BASE: TFloatField;
    QRGIArquivoVAL_ICM_BASE_ISENTO: TFloatField;
    QRGIArquivoVAL_ICM_BASE_OUTRAS: TFloatField;
    QRGIArquivoVAL_CONTABIL: TFloatField;
    QRGIArquivoCOD_GI: TFloatField;
    QRDFCArquivoDESC_GRUPO_CONTABEIS: TFloatField;
    QRDFCArquivoDESC_GRUPO_BASE: TFloatField;
    QRDFCArquivoDESC_GRUPO_ISENTAS: TFloatField;
    QRDFCArquivoDESC_GRUPO_OUTRAS: TFloatField;
    QRDFCArquivoSaidaDESC_GRUPO_CONTABEIS: TFloatField;
    QRDFCArquivoSaidaDESC_GRUPO_BASE: TFloatField;
    QRDFCArquivoSaidaDESC_GRUPO_ISENTAS: TFloatField;
    QRDFCArquivoSaidaDESC_GRUPO_OUTRAS: TFloatField;
    QRDFCCidadeCOD_DFC: TFloatField;
    procedure QGrupoFiscalItemBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMGrupoFiscal: TDMGrupoFiscal;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMGrupoFiscal.QGrupoFiscalItemBeforePost(DataSet: TDataSet);
begin
  //se o valor final da natureza estiver em branco, joga o valor inicial
  if DMGrupoFiscal.QGrupoFiscalItem.State in [dsInsert] then
    if DMGrupoFiscal.QGrupoFiscalItemNUM_NATUREZA_OPERACAO_FIM.IsNull then
      DMGrupoFiscal.QGrupoFiscalItemNUM_NATUREZA_OPERACAO_FIM.Value := DMGrupoFiscal.QGrupoFiscalItemNUM_NATUREZA_OPERACAO_INI.Value;
end;

end.
