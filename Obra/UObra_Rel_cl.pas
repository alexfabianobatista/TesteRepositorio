unit UObra_Rel_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMObra_Rel = class(TDataModule)
    QRObras: TOracleDataSet1;
    QRObrasCOD_OBRA: TIntegerField;
    QRObrasCOD_FILIAL: TIntegerField;
    QRObrasDESC_OBRA: TStringField;
    QRObrasDESC_ENDERECO: TStringField;
    QRObrasCOD_CIDADE: TIntegerField;
    QRObrasDT_INICIO_OBRA: TDateTimeField;
    QRObrasDT_FIM_OBRA: TDateTimeField;
    QRObrasCOD_CADASTRO: TIntegerField;
    QRObrasDT_CADASTRO_OBRA: TDateTimeField;
    QRObrasCOD_USUARIO: TIntegerField;
    QRObrasNOME: TStringField;
    QRObrasDESC_CIDADE: TStringField;
    QRObrasDESC_FILIAL: TStringField;
    QrObra_Desp_Analitico: TOracleDataSet1;
    QrObra_Desp_Sintetico: TOracleDataSet1;
    QrObra_Desp_AnaliticoCOD_OBRA: TFloatField;
    QrObra_Desp_AnaliticoDT_EMISSAO: TDateTimeField;
    QrObra_Desp_AnaliticoCOD_PRODUTO: TFloatField;
    QrObra_Desp_AnaliticoQT_QUANTIDADE: TFloatField;
    QrObra_Desp_AnaliticoVALOR: TFloatField;
    QrObra_Desp_AnaliticoDESC_OBRA: TStringField;
    QrObra_Desp_SinteticoCOD_OBRA: TFloatField;
    QrObra_Desp_SinteticoCOD_PRODUTO: TFloatField;
    QrObra_Desp_SinteticoDESC_OBRA: TStringField;
    QrObra_Desp_SinteticoQUANT: TFloatField;
    QrObra_Desp_SinteticoVALOR: TFloatField;
    QrObra_Desp_AnaliticoNUM_REQUISICAO: TFloatField;
    QRObraReqCentroCusto: TOracleDataSet1;
    QRObraReqCentroCustoCOD_OBRA: TIntegerField;
    QRObraReqCentroCustoDESC_OBRA: TStringField;
    QRObraReqCentroCustoCOD_FILIAL: TIntegerField;
    QRObraReqCentroCustoDESC_FILIAL: TStringField;
    QRObraReqCentroCustoCOD_CENTRO_CUSTO: TIntegerField;
    QRObraReqCentroCustoDESC_CENTRO_CUSTO: TStringField;
    QRObraReqCentroCustoQT_QUANTIDADE: TFloatField;
    QRObraReqCentroCustoTOTAL: TFloatField;
    QRObraReqCentroCustoDESC_PRODUTO: TStringField;
    QrObra_Desp_SinteticoDESC_PRODUTO: TStringField;
    QRPosicaoFinanceiraObra: TOracleDataSet1;
    QRPosicaoFinanceiraObraCOD_OBRA: TFloatField;
    QRPosicaoFinanceiraObraDESC_OBRA: TStringField;
    QRPosicaoFinanceiraObraNUM_TITULO: TFloatField;
    QRPosicaoFinanceiraObraDT_VENCIMENTO: TDateTimeField;
    QRPosicaoFinanceiraObraVAL_ABERTO_CP: TFloatField;
    QRPosicaoFinanceiraObraVAL_BAIXADO_CP: TFloatField;
    QRPosicaoFinanceiraObraVAL_ABERTO_CR: TFloatField;
    QRPosicaoFinanceiraObraVAL_BAIXADO_CR: TFloatField;
    QrObra_Desp_AnaliticoIND_TIPO_REQUISICAO: TStringField;
    QrObra_Desp_AnaliticoDESC_PRODUTO: TStringField;
    QrObra_Desp_SinteticoDESC_UNIDADE: TStringField;
    QrObra_Desp_AnaliticoDESC_UNIDADE: TStringField;
    QrObra_Desp_Analiticovl_contrato: TFloatField;
    QrObra_Desp_Sinteticovl_contrato: TFloatField;
    QRObraFinanceiro: TOracleDataSet1;
    QRObraFinanceiroCOD_OBRA: TFloatField;
    QRObraFinanceiroCOD_PRODUTO: TFloatField;
    QRObraFinanceiroDESC_PRODUTO: TStringField;
    QRObraFinanceiroDESC_UNIDADE: TStringField;
    QRObraFinanceiroDESC_OBRA: TStringField;
    QRObraFinanceiroQUANT: TFloatField;
    QRObraFinanceiroVALOR: TFloatField;
    QRObraFinanceirovl_contrato: TFloatField;
    QRObraFinanceiroDT_VENCTO: TDateTimeField;
    QRObraFinanceiroDT_BAIXA: TDateTimeField;
    QRObraFinanceiroIND_TIPO: TStringField;
    QrObra_Desp_AnaliticoNOME: TStringField;
    QRObraFinanceiroNUM_AREA_OBRA: TFloatField;
    QRObraFinanceiroDT_INICIO_OBRA: TDateTimeField;
    QRObraFinanceiroDT_FIM_OBRA: TDateTimeField;
    QRObraFinanceiroVAL_M2: TFloatField;
    QRObraFinanceiroVAL_OBRA_M2: TFloatField;
    QRObraFinanceiroVAL_INCC: TFloatField;
    QrObraCustoEstoque: TOracleDataSet1;
    QRObraFinanceiroNUM_TITULO: TFloatField;
    QrObra_Desp_Analiticoqt_contrato: TFloatField;
    QrObra_Desp_AnaliticoVAL_FRETE: TFloatField;
    QRObraReqCentroCustoCOD_PRODUTO: TFloatField;
    procedure QrObra_Desp_AnaliticoCalcFields(DataSet: TDataSet);
    procedure QrObra_Desp_SinteticoCalcFields(DataSet: TDataSet);
    procedure QRObraFinanceiroCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMObra_Rel: TDMObra_Rel;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMObra_Rel.QrObra_Desp_AnaliticoCalcFields(DataSet: TDataSet);
Var
  wAditivo : Real;
  wQuantidade, wObra_Contrato : String;
begin
  QrObra_Desp_AnaliticoVl_Contrato.Value:=StrToFloat('0' + DMOracle.BuscaNome('SELECT SUM(VL_CONTRATO) FROM TB_OBRA_CONTRATO','COD_OBRA = '+QrObra_Desp_AnaliticoCod_Obra.Text));
  wAditivo :=StrToFloat('0' + DMOracle.BuscaNome('SELECT SUM(VL_ADITIVO) FROM Tb_Obra_Contrato_Aditivo,TB_OBRA_CONTRATO',
      'Tb_Obra_Contrato_Aditivo.COD_OBRA_CONTRATO = TB_OBRA_CONTRATO.COD_OBRA_CONTRATO AND COD_OBRA = '+QrObra_Desp_AnaliticoCod_Obra.Text));
  QrObra_Desp_AnaliticoVl_Contrato.Value := QrObra_Desp_AnaliticoVl_Contrato.Value + wAditivo;

  QrObra_Desp_AnaliticoQt_Contrato.Value := 0;
  wObra_Contrato:=DMOracle.BuscaNome('SELECT COD_OBRA_CONTRATO FROM TB_OBRA_CONTRATO','COD_OBRA = '+QrObra_Desp_AnaliticoCod_Obra.Text);
  If wObra_Contrato <> '' Then
  Begin
    wQuantidade:=DMOracle.BuscaNome('SELECT QT_QUANTIDADE FROM TB_OBRA_CONTRATO_PRODUTO','COD_OBRA_CONTRATO = '+wObra_Contrato +
         ' AND COD_PRODUTO='+QrObra_Desp_AnaliticoCod_Produto.Text);
    If wQuantidade <> '' Then
       QrObra_Desp_AnaliticoQt_Contrato.Value := StrToFloat(Trim(wQuantidade));
  End;
end;

procedure TDMObra_Rel.QrObra_Desp_SinteticoCalcFields(DataSet: TDataSet);
Var
  wAditivo : Real;
begin
  QrObra_Desp_SinteticoVl_Contrato.Value:=StrToFloat('0' + DMOracle.BuscaNome('SELECT SUM(VL_CONTRATO) FROM TB_OBRA_CONTRATO','COD_OBRA = '+QrObra_Desp_SinteticoCod_Obra.Text));
  wAditivo :=StrToFloat('0' + DMOracle.BuscaNome('SELECT SUM(VL_ADITIVO) FROM Tb_Obra_Contrato_Aditivo,TB_OBRA_CONTRATO',
      'Tb_Obra_Contrato_Aditivo.COD_OBRA_CONTRATO = TB_OBRA_CONTRATO.COD_OBRA_CONTRATO AND COD_OBRA = '+QrObra_Desp_SinteticoCod_Obra.Text));
  QrObra_Desp_SinteticoVl_Contrato.Value := QrObra_Desp_SinteticoVl_Contrato.Value + wAditivo;

end;

procedure TDMObra_Rel.QRObraFinanceiroCalcFields(DataSet: TDataSet);
begin
{  QRObraFinanceiroVl_Contrato.Value:=StrToFloat('0' + DMOracle.BuscaNome('SELECT SUM(VL_CONTRATO) FROM TB_OBRA_CONTRATO','COD_OBRA = '+QRObraFinanceiroCod_Obra.Text));
  QRObraFinanceiroVl_Contrato.Value:=QRObraFinanceiroVl_Contrato.Value +
      StrToFloat('0' + DMOracle.BuscaNome('SELECT SUM(VL_ADITIVO) FROM TB_OBRA_CONTRATO_ADITIVO,TB_OBRA_CONTRATO',
      'TB_OBRA_CONTRATO_ADITIVO.COD_OBRA_CONTRATO = TB_OBRA_CONTRATO.COD_OBRA_CONTRATO AND COD_OBRA = '+QRObraFinanceiroCod_Obra.Text));
}
// esta alteracao de valor do contrato foi uma solicitação do Carlos Razente no dia 07.03.2016 - César Angonese
  QRObraFinanceiroVl_Contrato.Value := DMObra_Rel.QRObraFinanceiroNUM_AREA_OBRA.Value * DMObra_Rel.QRObraFinanceiroVal_OBRA_M2.Value;
end;

end.
