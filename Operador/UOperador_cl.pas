unit UOperador_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMOperador = class(TDataModule)
    QContratoVendAberto: TOracleDataSet1;
    DSContratoVendAberto: TDataSource;
    QContratoVendAbertoCOD_PRODUTO: TIntegerField;
    QContratoVendAbertoVAL_SALDO: TFloatField;
    QNotaAgricola_Aberto: TOracleDataSet1;
    QNotaAgricola_AbertoCOD_PRODUTO: TFloatField;
    DSNotaAgricola_Aberto: TDataSource;
    QContratoGP_Aberto: TOracleDataSet1;
    DSContratoGP_Aberto: TDataSource;
    QContratoC_Aberto: TOracleDataSet1;
    DSContratoC_Aberto: TDataSource;
    QContratoVenda_SaldoEmb: TOracleDataSet1;
    QContratoVenda_SaldoEmbCOD_PRODUTO: TIntegerField;
    QContratoVenda_SaldoEmbQT_SALDO: TFloatField;
    DSContratoVenda_SaldoEmb: TDataSource;
    QContratoVendAbertoNOME: TStringField;
    QContratoVendAbertoNUM_CONTRATO: TIntegerField;
    QContratoVendAbertoPRECO: TFloatField;
    QContratoVendAbertoQT_QUANTIDADE: TFloatField;
    QNotaAgricola_AbertoVAL_TOTAL: TFloatField;
    QNotaAgricola_Abertoval_medio: TFloatField;
    QNotaAgricola_AbertoNUM_EMBALAGEM: TFloatField;
    QContratoVendAbertoCOD_CONTRATO_VEND: TIntegerField;
    QContratoVendAbertovl_compra: TFloatField;
    QContratoGP_AbertoCOD_PRODUTO: TIntegerField;
    QContratoGP_AbertoNUM_EMBALAGEM: TFloatField;
    QContratoGP_AbertoVALOR: TFloatField;
    QContratoGP_AbertoQT_SALDO: TFloatField;
    QContratoGP_Abertoval_medio: TFloatField;
    QContratoC_AbertoNUM_EMBALAGEM: TFloatField;
    QContratoC_AbertoCOD_PRODUTO: TIntegerField;
    QContratoC_AbertoQT_QUANTIDADE: TFloatField;
    QContratoC_AbertoVAL_TOTAL: TFloatField;
    QContratoC_AbertoQT_SALDO: TFloatField;
    QContratoC_Abertoval_medio: TFloatField;
    QContratoGP_AbertoDT_PERIODO: TFloatField;
    QContratoC_AbertoDT_PERIODO: TFloatField;
    QContratoVenda_SaldoEmbIND_RET_ENTR: TStringField;
    QContratoVenda_SaldoEmbDT_ENTREGA: TDateTimeField;
    QContratoVenda_SaldoEmbNUM_CONTRATO: TIntegerField;
    QContratoVenda_SaldoEmbNOME: TStringField;
    QContratoGP_AbertoDESC_TIPO_PRECO: TStringField;
    QContratoVendAbertoIND_RET_ENTR: TStringField;
    QContratoGP_AbertoIND_RETIRAR_ENTREGUE: TStringField;
    QNotaAgricola_AbertoCOD_FILIAL: TFloatField;
    QNotaAgricola_AbertoSALDO: TFloatField;
    QContratoGP_AbertoDESC_PRODUTO: TStringField;
    QContratoVendAbertoDESC_PRODUTO: TStringField;
    QContratoC_AbertoDESC_PRODUTO: TStringField;
    QContratoVenda_SaldoEmbDESC_PRODUTO: TStringField;
    QNotaAgricola_AbertoDESC_PRODUTO: TStringField;
    QContratoC_AbertoIND_RETIRAR_ENTREGUE: TStringField;
    procedure QNotaAgricola_AbertoCalcFields(DataSet: TDataSet);
    procedure QContratoVendAbertoCalcFields(DataSet: TDataSet);
    procedure QContratoGP_AbertoCalcFields(DataSet: TDataSet);
    procedure QContratoC_AbertoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMOperador: TDMOperador;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMOperador.QNotaAgricola_AbertoCalcFields(DataSet: TDataSet);
begin
  If QNotaAgricola_AbertoSaldo.Value > 0 Then
    QNotaAgricola_AbertoVal_Medio.Value := QNotaAgricola_AbertoVal_Total.Value / QNotaAgricola_AbertoSaldo.Value * QNotaAgricola_AbertoNum_Embalagem.Value;
end;

procedure TDMOperador.QContratoVendAbertoCalcFields(DataSet: TDataSet);
Var wValor : String;
begin
  wValor:=DMOracle.Buscanome('SELECT SUM(VAL_MOVIMENTO) FROM TB_CONTRATO_VEND_MOV',
      'COD_CONTRATO_VEND = '+FloatToStr(QContratoVendAbertoCOD_CONTRATO_VEND.Value));
  If wValor <> '' Then
     QContratoVendAbertoVl_Compra.Value := StrToFloat(wValor) / QContratoVendAbertoQt_Quantidade.Value - QContratoVendAbertoVal_Saldo.Value;
end;

procedure TDMOperador.QContratoGP_AbertoCalcFields(DataSet: TDataSet);
begin
  If QContratoGP_AbertoQt_Saldo.Value > 0 Then
     QContratoGP_AbertoVal_Medio.Value := QContratoGP_AbertoValor.Value / (QContratoGP_AbertoQt_Saldo.Value
                                          / QContratoGP_AbertoNum_Embalagem.Value);
end;

procedure TDMOperador.QContratoC_AbertoCalcFields(DataSet: TDataSet);
begin
  If QContratoC_AbertoQT_SALDO.Value > 0 Then
     QContratoC_AbertoVal_Medio.Value := QContratoC_AbertoVal_Total.Value / (QContratoC_AbertoQt_SALDO.Value
                                          / QContratoC_AbertoNum_Embalagem.Value);

end;

end.
