unit UProdutoAgricola_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste;

type
  TDMProdutoAgricola = class(TDataModule)
    DSProdutoAgricola: TDataSource;
    QProdutoAgricolaCons: TOracleDataSet1;
    QProdutoAgricolaConsCOD_PRODUTO: TFloatField;
    QProdutoAgricola: TOracleDataSet1;
    QProdutoAgricolaCOD_PRODUTO: TFloatField;
    QProdutoAgricolaIND_FUNRURAL: TStringField;
    QProdutoAgricolaPERC_TOLERA_ARDIDOS: TFloatField;
    QProdutoAgricolaPERC_TOLERA_IMPUREZA: TFloatField;
    QProdutoAgricolaPERC_TOLERA_AVARIADO: TFloatField;
    QProdutoAgricolaPERC_MAX_UMIDADE_SEM_DESC: TFloatField;
    QProdutoAgricolaPERC_MAX_UMIDADE_COM_DESC: TFloatField;
    QProdutoAgricolaDESC_UMIDADE_GRAU_ADIC: TStringField;
    QProdutoAgricolaPERC_MAX_IMPUREZA_SEM_DESC: TFloatField;
    QProdutoAgricolaPERC_MAX_IMPUREZA_COM_DESC: TFloatField;
    QProdutoAgricolaDESC_IMPUREZA_GRAU_ADIC: TStringField;
    QProdutoAgricolaPERC_MAX_ARDIDOS_SEM_DESC: TFloatField;
    QProdutoAgricolaPERC_MAX_ARDIDOS_COM_DESC: TFloatField;
    QProdutoAgricolaDESC_ARDIDOS_GRAU_ADIC: TStringField;
    QProdutoAgricolaPERC_MAX_QUEBRA_SEM_DESC: TFloatField;
    QProdutoAgricolaPERC_MAX_QUEBRA_COM_DESC: TFloatField;
    QProdutoAgricolaDESC_QUEBRA_GRAU_ADIC: TStringField;
    QProdutoAgricolaPERC_MAX_AVARIA_SEM_DESC: TFloatField;
    QProdutoAgricolaPERC_MAX_AVARIA_COM_DESC: TFloatField;
    QProdutoAgricolaDESC_AVARIA_GRAU_ADIC: TStringField;
    QProdutoAgricolaPERC_MAX_PH_SEM_DESC: TFloatField;
    QProdutoAgricolaPERC_MAX_PH_COM_DESC: TFloatField;
    QProdutoAgricolaDESC_PH_GRAU_ADIC: TStringField;
    QProdutoAgricolaCOD_TRIBUTACAO: TIntegerField;
    QProdutoAgricolaCOD_OPERACAO_AFIXAR: TIntegerField;
    QProdutoAgricolaCOD_OPERACAO_AFIXAR_CONSUMO: TIntegerField;
    QProdutoAgricolaCOD_OPERACAO_FIXACAO: TIntegerField;
    QProdutoAgricolaCOD_OPERACAO_FIXACAO_CONTRATO: TIntegerField;
    QProdutoAgricolaPERC_UMIDADE_CONTRATO: TFloatField;
    QProdutoAgricolaPERC_IMPUREZA_CONTRATO: TFloatField;
    QProdutoAgricolaPERC_AVARIADO_CONTRATO: TFloatField;
    QProdutoAgricolaPERC_ARDIDOS_CONTRATO: TFloatField;
    QProdutoAgricolaPERC_QUEBRADOS_CONTRATO: TFloatField;
    QProdutoAgricolaPERC_VERDES_CONTRATO: TFloatField;
    QProdutoAgricolaPERC_PH_CONTRATO: TFloatField;
    QProdutoAgricolaCOD_OPER_FIXACAO_CONTRATO_CF: TIntegerField;
    QProdutoAgricolaCOD_OPERACAO_TRANSFERENCIA: TIntegerField;
    QProdutoAgricolaCOD_OPER_TRANSF_ENTRADA: TIntegerField;
    QProdutoAgricolaConsDESC_PRODUTO: TStringField;
    QProdutoAgricolaPERC_DPI_TRANSGENICOS: TFloatField;
    QProdutoAgricolaCOD_PRODUTO_FITA: TIntegerField;
    QProdutoAgricolaVAL_FACS: TFloatField;
    QProdutoAgricolaVAL_FETHAB: TFloatField;
    QRProdutoAgricola: TOracleDataSet1;
    QRProdutoAgricolaCOD_PRODUTO: TFloatField;
    QRProdutoAgricolaDESC_PRODUTO: TStringField;
    QRProdutoAgricolaCOD_TRIBUTACAO: TIntegerField;
    QRProdutoAgricolaDESC_TRIBUTACAO: TStringField;
    QRProdutoAgricolaIND_FUNRURAL: TStringField;
    QProdutoAgricolaCOD_OPERACAO_FIXACAO_GP_US: TIntegerField;
    QProdutoAgricolaCOD_OPERACAO_DEVOLUCAO: TIntegerField;
    QProdutoAgricolaFilial_Cad: TOracleDataSet1;
    QProdutoAgricolaFilial_CadCOD_PRODUTO: TFloatField;
    QProdutoAgricolaFilial_CadCOD_FILIAL: TIntegerField;
    QProdutoAgricolaFilial_CadPERC_TOLERA_ARDIDOS: TFloatField;
    QProdutoAgricolaFilial_CadPERC_TOLERA_IMPUREZA: TFloatField;
    QProdutoAgricolaFilial_CadPERC_TOLERA_AVARIADO: TFloatField;
    QProdutoAgricolaFilial_Cons: TOracleDataSet1;
    QProdutoAgricolaFilial_ConsCOD_PRODUTO: TFloatField;
    QProdutoAgricolaFilial_ConsCOD_FILIAL: TIntegerField;
    QProdutoAgricolaFilial_ConsPERC_TOLERA_ARDIDOS: TFloatField;
    QProdutoAgricolaFilial_ConsPERC_TOLERA_IMPUREZA: TFloatField;
    QProdutoAgricolaFilial_ConsPERC_TOLERA_AVARIADO: TFloatField;
    QProdutoAgricolaIND_SENAR: TStringField;
    QProdutoAgricolaCOD_USUARIO: TIntegerField;
    procedure QProdutoAgricolaCalcFields(DataSet: TDataSet);
    procedure QProdutoAgricolaAfterInsert(DataSet: TDataSet);
    procedure QProdutoAgricolaAfterPost(DataSet: TDataSet);
    procedure QProdutoAgricolaFilial_CadAfterInsert(DataSet: TDataSet);
    procedure QProdutoAgricolaBeforeEdit(DataSet: TDataSet);
    procedure QProdutoAgricolaBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMProdutoAgricola: TDMProdutoAgricola;

implementation

uses UOracle_cl,UUsuario_cl;

{$R *.DFM}

procedure TDMProdutoAgricola.QProdutoAgricolaCalcFields(DataSet: TDataSet);
begin
{  QProdutoAgricolaDesc_Produto.Value := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO='+FloatToStr(QProdutoAgricolaCod_Produto.Value));
  QProdutoAgricolaDesc_Tributacao.Value := DMOracle.BuscaNome('SELECT DESC_TRIBUTACAO FROM TB_TRIBUTACAO','COD_TRIBUTACAO='+FloatToStr(QProdutoAgricolaCod_Tributacao.Value));
  QProdutoAgricolaDesc_AFixar.Value := DMOracle.BuscaNome('SELECT DESC_OPERACAO FROM TB_OPERACAO','COD_OPERACAO='+FloatToStr(QProdutoAgricolaCod_Operacao_AFixar.Value));
  QProdutoAgricolaDesc_AFixar_Consumo.Value := DMOracle.BuscaNome('SELECT DESC_OPERACAO FROM TB_OPERACAO','COD_OPERACAO='+FloatToStr(QProdutoAgricolaCod_Operacao_AFixar_Consumo.Value));
  QProdutoAgricolaDesc_Fixacao.Value := DMOracle.BuscaNome('SELECT DESC_OPERACAO FROM TB_OPERACAO','COD_OPERACAO='+FloatToStr(QProdutoAgricolaCod_Operacao_Fixacao.Value));
  QProdutoAgricolaDesc_Fixacao_Contrato.Value := DMOracle.BuscaNome('SELECT DESC_OPERACAO FROM TB_OPERACAO','COD_OPERACAO='+FloatToStr(QProdutoAgricolaCod_Operacao_Fixacao_Contrato.Value));
  QProdutoAgricoladesc_oper_fixacao_contrato_Cf.Value:= DMOracle.BuscaNome('SELECT DESC_OPERACAO FROM TB_OPERACAO','COD_OPERACAO='+FloatToStr(QProdutoAgricolaCod_Oper_Fixacao_Contrato_CF.Value));
  QProdutoAgricoladesc_operacao_transferencia.Value:= DMOracle.BuscaNome('SELECT DESC_OPERACAO FROM TB_OPERACAO','COD_OPERACAO='+FloatToStr(QProdutoAgricolaCod_Operacao_Transferencia.Value));
  QProdutoAgricoladesc_oper_transf_entrada.Value:= DMOracle.BuscaNome('SELECT DESC_OPERACAO FROM TB_OPERACAO','COD_OPERACAO='+FloatToStr(QProdutoAgricolaCod_Oper_Transf_Entrada.Value));
}  
end;

procedure TDMProdutoAgricola.QProdutoAgricolaAfterInsert(
  DataSet: TDataSet);
begin
  QProdutoAgricolaInd_Funrural.Value := 'S'
end;

procedure TDMProdutoAgricola.QProdutoAgricolaAfterPost(DataSet: TDataSet);
Var wCodigo : Real;
begin
  wCodigo := QProdutoAgricolaCod_Produto.Value;
  QProdutoAgricola.Close;
  QProdutoAgricola.SetVariable('PK',wCodigo);
  QProdutoAgricola.Open;
end;

procedure TDMProdutoAgricola.QProdutoAgricolaFilial_CadAfterInsert(
  DataSet: TDataSet);
begin
  QProdutoAgricolaFilial_CadCOD_PRODUTO.Value := QProdutoAgricolaCOD_PRODUTO.Value;
  QProdutoAgricolaFilial_CadPERC_TOLERA_ARDIDOS.Value := QProdutoAgricolaPERC_TOLERA_ARDIDOS.Value;
  QProdutoAgricolaFilial_CadPERC_TOLERA_IMPUREZA.Value := QProdutoAgricolaPERC_TOLERA_IMPUREZA.Value;
  QProdutoAgricolaFilial_CadPERC_TOLERA_AVARIADO.Value := QProdutoAgricolaPERC_TOLERA_AVARIADO.Value;
end;

procedure TDMProdutoAgricola.QProdutoAgricolaBeforeEdit(DataSet: TDataSet);
begin
  QProdutoAgricolaCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
end;

procedure TDMProdutoAgricola.QProdutoAgricolaBeforePost(DataSet: TDataSet);
begin
  QProdutoAgricolaCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
end;

end.
