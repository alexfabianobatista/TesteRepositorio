unit URelContasPagar_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste, DBClient;

type
  TDMRelContasPagar = class(TDataModule)
    QRContasPagar_Finalidade: TOracleDataSet1;
    QRContasPagar_FinalidadeCOD_FINALIDADE: TIntegerField;
    QRContasPagar_FinalidadeDESC_FINALIDADE: TStringField;
    QRContasPagar_FinalidadeCOD_CONTA_PAGAR_CAB: TIntegerField;
    QRContasPagar_FinalidadeIND_SITUACAO: TStringField;
    QRContasPagar_FinalidadeVALT_TITULO: TFloatField;
    QRContasPagar_Finalidadevalorpago: TFloatField;
    QRContasPagar_Finalidadeval_titulo: TFloatField;
    QRTotalPagarFornecedor: TOracleDataSet1;
    QRTotalPagarFornecedorCOD_CADASTRO: TIntegerField;
    QRTotalPagarFornecedorNOME: TStringField;
    QRTotalPagarFornecedorDT_VENCIMENTO: TDateTimeField;
    QRTotalPagarFornecedorVALOR: TFloatField;
    QRTitulosAberto_Depto_Sintetico: TOracleDataSet1;
    QRTitulosAberto_Depto_SinteticoCOD_DEPARTAMENTO: TIntegerField;
    QRTitulosAberto_Depto_SinteticoDESC_DEPARTAMENTO: TStringField;
    QRTitulosAberto_Depto_SinteticoTOTAL: TFloatField;
    QRTitulosAberto_Depto_SinteticoCOD_FILIAL: TIntegerField;
    QRTitulosAberto_Depto_SinteticoDESC_FILIAL: TStringField;
    QRConciliacao_Cp_Cr: TOracleDataSet1;
    QRConciliacao_Cp_CrTIPO: TStringField;
    QRConciliacao_Cp_CrDT_EMISSAO: TDateTimeField;
    QRConciliacao_Cp_CrDT_VENCIMENTO: TDateTimeField;
    QRConciliacao_Cp_CrIND_SITUACAO: TStringField;
    QRConciliacao_Cp_CrDT_CAPITALIZACAO: TDateTimeField;
    QRConciliacao_Cp_CrDT_CAPITALIZACAO_MOEDA: TDateTimeField;
    QRConciliacao_Cp_CrCOD_NOTA_CAB: TFloatField;
    QRConciliacao_Cp_CrCOD_CADASTRO: TFloatField;
    QRConciliacao_Cp_CrNUM_NOTA: TFloatField;
    QRConciliacao_Cp_CrNOME: TStringField;
    QRConciliacao_Cp_CrQT_QUANTIDADE: TFloatField;
    QRConciliacao_Cp_CrVAL_UNITARIO: TFloatField;
    QRConciliacao_Cp_CrVAL_UNITARIO_TABELA: TFloatField;
    QRConciliacao_Cp_CrVAL_TOTAL: TFloatField;
    QRConciliacao_Cp_CrDESC_PRODUTO: TStringField;
    QRConciliacao_Cp_CrNUM_TIPO_JURO: TStringField;
    QRConciliacao_Cp_CrPERC_TAXA: TFloatField;
    QRConciliacao_Cp_CrPERC_JURO_MORA: TFloatField;
    QRConciliacao_Cp_CrNUM_DIAS_CARENCIA: TFloatField;
    QRConciliacao_Cp_CrCOD_MOEDA: TFloatField;
    QRConciliacao_Cp_Crval_aberto: TFloatField;
    QRConciliacao_Cp_Crval_saldo: TFloatField;
    procedure QRContasPagar_FinalidadeCalcFields(DataSet: TDataSet);
    procedure QRConciliacao_Cp_CrCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    fDataBase : TdateTime;
  public
    { Public declarations }
    Property pDataBase : TDateTime Read fDataBase Write fDataBase;
  end;

var
  DMRelContasPagar: TDMRelContasPagar;

implementation

uses UOracle_cl, UContasReceber_cl;

{$R *.DFM}

procedure TDMRelContasPagar.QRContasPagar_FinalidadeCalcFields(
  DataSet: TDataSet);
var
  ValorPago : String;
  wRecebto : Real;
begin
  wRecebto := 0;   // Variavel inicializada.
  QRContasPagar_FinalidadeValorPago.Value:=0;
  If QRContasPagar_FinalidadeInd_Situacao.Value <> 'ABERTO' Then
  Begin    // o que muda da consulta anterior é somente a data de movimento para data do usuario
     ValorPago:=DMOracle.BuscaNome('SELECT SUM(VAL_MOVIMENTO) FROM TB_CONTA_PAGAR_MOV','(COD_CONTA_PAGAR_CAB = '+FloatToStr(QRContasPagar_FinalidadeCod_Conta_Pagar_Cab.Value)+
     ') AND (IND_TIPO_MOVIMENTO<>'+CHR(39)+'PRINCIPAL'+CHR(39)+') AND (IND_TIPO_MOVIMENTO<>'+CHR(39)+'DESC. CONCEDIDO'+CHR(39)+') AND (DT_MOVIMENTO <='+chr(39)+DateToStr(pDataBase)+chr(39)+')');
     If Trim(ValorPago)<>'' then
       QRContasPagar_FinalidadeValorPago.Value:=StrToFloat(ValorPago);
     wRecebto := 0;  // esta rotina serve para calcular o valor recebido apos a data emissão de referencia
     ValorPago:=DMOracle.BuscaNome('SELECT SUM(VAL_MOVIMENTO) FROM TB_CONTA_PAGAR_MOV','(COD_CONTA_PAGAR_CAB = '+FloatToStr(QRContasPagar_FinalidadeCod_Conta_Pagar_Cab.Value)+
     ') AND ((IND_TIPO_MOVIMENTO='+CHR(39)+'PAGTO. PRINCIPAL'+CHR(39)+
     ') OR   (IND_TIPO_MOVIMENTO='+CHR(39)+'DESC. CONCEDIDO'+CHR(39)+')) AND (DT_MOVIMENTO >'+chr(39)+DateToStr(pDataBase)+chr(39)+')');
    If Trim(ValorPago)<>'' then
      wRecebto:=StrToFloat(ValorPago);
  End;
  QRContasPagar_FinalidadeVal_Titulo.Value := QRContasPagar_FinalidadeValT_Titulo.Value + wRecebto;
end;

procedure TDMRelContasPagar.QRConciliacao_Cp_CrCalcFields(
  DataSet: TDataSet);
var wDataCapitalizacao,wTipoJuro,wDiasCarencia:String;
    wTaxa,wMoeda,wValor_Capitalizacao,wPerc_Juro_Mora: Real;
begin
//  QContasReceberBaixaDesc_Finalidade.value:=DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE ','COD_FINALIDADE = '+FloatToStr(QContasReceberBaixaCod_Finalidade.Value));
  If QRConciliacao_Cp_CrCod_Nota_Cab.Value <> 0 Then
    If QRConciliacao_Cp_CrTipo.Value = 'CONTAS RECEBER' then
     Begin
       QRConciliacao_Cp_CrVal_Aberto.Value := StrToFloat(DMOracle.BuscaNome('SELECT SUM(VAL_TITULO) / SUM(VAL_ORIGINAL) FROM TB_CONTA_RECEBER_CAB','COD_NOTA_CAB = '+FloatToStr(QRConciliacao_Cp_CrCOD_NOTA_CAB.Value)));
       QRConciliacao_Cp_CrVal_Aberto.Value := QRConciliacao_Cp_CrVal_Aberto.Value * QRConciliacao_Cp_CrVal_Total.Value;
       QRConciliacao_Cp_CrVal_Saldo.Value := QRConciliacao_Cp_CrVal_Aberto.Value;
       wValor_Capitalizacao:=0;
       wDataCapitalizacao:=DateToStr(QRConciliacao_Cp_CrDt_Capitalizacao.Value);
       wTipoJuro:=QRConciliacao_Cp_CrNUM_TIPO_JURO.Text;
       If QRConciliacao_Cp_CrInd_Situacao.Value = 'ABERTO' Then // Carencia somente na primeira baixa do titulo
          wDiasCarencia:=QRConciliacao_Cp_CrNUM_DIAS_CARENCIA.Text;
       If wDiasCarencia = '' Then
          wDiasCarencia := '0';
       wTaxa := 0;
       if QRConciliacao_Cp_CrPerc_Taxa.Text <> '' Then
          wTaxa  := QRConciliacao_Cp_CrPerc_Taxa.value;
       wPerc_Juro_Mora := 0;
       if (QRConciliacao_Cp_CrPerc_Juro_Mora.Text <> '') And (QRConciliacao_Cp_CrInd_Situacao.Value = 'ABERTO' )Then
          wPerc_Juro_Mora  := QRConciliacao_Cp_CrPerc_Juro_Mora.value;
       wMoeda:=QRConciliacao_Cp_CrCOD_MOEDA.Value;
       If wTipoJuro <> 'SEM JURO' then
        Begin
          pDataBase := Date;
          wValor_Capitalizacao:=DMContasReceber.CalculaJuros(QRConciliacao_Cp_CrVal_Aberto.Value,wTaxa,wPerc_Juro_Mora,wMoeda,
               StrToDate(wDataCapitalizacao),pDataBase,QRConciliacao_Cp_CrDt_Capitalizacao_Moeda.Value,wTipoJuro,wDiasCarencia,'CR');
          wValor_Capitalizacao:=(Trunc(wValor_Capitalizacao*100)/100);
          if wValor_Capitalizacao > 0.001 then
             QRConciliacao_Cp_CrVal_Aberto.Value:=QRConciliacao_Cp_CrVal_Aberto.Value + wValor_Capitalizacao;
        End; //if sem juro
     End
    Else
     Begin
       QRConciliacao_Cp_CrVal_Aberto.Value := StrToFloat(DMOracle.BuscaNome('SELECT SUM(VAL_TITULO) / SUM(VAL_ORIGINAL) FROM TB_CONTA_PAGAR_CAB','COD_NOTA_CAB = '+FloatToStr(QRConciliacao_Cp_CrCOD_NOTA_CAB.Value)));
       QRConciliacao_Cp_CrVal_Aberto.Value := QRConciliacao_Cp_CrVal_Aberto.Value * QRConciliacao_Cp_CrVal_Total.Value;
       QRConciliacao_Cp_CrVal_Saldo.Value := QRConciliacao_Cp_CrVal_Aberto.Value * -1;
     End
  Else
    Begin
      QRConciliacao_Cp_CrVal_Aberto.Value := QRConciliacao_Cp_CrVal_Total.Value;
      If QRConciliacao_Cp_CrTipo.Value = 'CONTAS RECEBER' then
         QRConciliacao_Cp_CrVal_Saldo.Value := QRConciliacao_Cp_CrVal_Total.Value
      Else
         QRConciliacao_Cp_CrVal_Saldo.Value := QRConciliacao_Cp_CrVal_Total.Value * -1;
    End;  
End;

end.
