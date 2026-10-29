unit UConhecimentoFrete_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMConhecimentoFrete = class(TDataModule)
    QConhecimentoFrete: TOracleDataSet1;
    QConhecimentoFreteCOD_CONHECIMENTO_FRETE: TIntegerField;
    QConhecimentoFreteCOD_NOTA_CAB: TIntegerField;
    QConhecimentoFreteNUM_FRETE: TIntegerField;
    QConhecimentoFreteDT_PAGAMENTO: TDateTimeField;
    QConhecimentoFreteCOD_CONTRATO_VEND: TIntegerField;
    QConhecimentoFreteVAL_FRETE: TFloatField;
    QConhecimentoFreteCons: TOracleDataSet1;
    QConhecimentoFreteConsDT_PAGAMENTO: TDateTimeField;
    QConhecimentoFreteConsNUM_FRETE: TIntegerField;
    QConhecimentoFreteConsVAL_FRETE: TFloatField;
    QConhecimentoFreteConsCOD_CONHECIMENTO_FRETE: TIntegerField;
    QConhecimentoFretevalor_total_frete: TFloatField;
    QConhecimentoFreteQT_PESO_CHEGADA: TFloatField;
    QConhecimentoFreteDESC_PLACA: TStringField;
    QConhecimentoFreteqt_quantidade_contrato: TFloatField;
    QRConhecimentoFrete: TOracleDataSet1;
    QRConhecimentoFreteNUM_FRETE: TIntegerField;
    QRConhecimentoFreteVAL_FRETE: TFloatField;
    QRConhecimentoFreteDT_PAGAMENTO: TDateTimeField;
    QRConhecimentoFreteDESC_PLACA: TStringField;
    QRConhecimentoFreteQT_QUANTIDADE: TFloatField;
    QRConhecimentoFreteQT_PESO_CHEGADA: TFloatField;
    QRConhecimentoFreteNUM_NOTA: TIntegerField;
    QRConhecimentoFreteNUM_CONTRATO: TIntegerField;
    QRConhecimentoFreteDT_EMISSAO: TDateTimeField;
    QRConhecimentoFreteNOME: TStringField;
    QRConhecimentoSContrato: TOracleDataSet1;
    QConhecimentoFreteDT_EMISSAO_CONHECIMENTO: TDateTimeField;
    QRConhecimentoSContratoNUM_FRETE: TIntegerField;
    QRConhecimentoSContratoVAL_FRETE: TFloatField;
    QRConhecimentoSContratoDT_PAGAMENTO: TDateTimeField;
    QRConhecimentoSContratoDESC_PLACA: TStringField;
    QRConhecimentoSContratoQT_QUANTIDADE: TFloatField;
    QRConhecimentoSContratoQT_PESO_CHEGADA: TFloatField;
    QRConhecimentoSContratoNUM_NOTA: TIntegerField;
    QRConhecimentoSContratoDT_EMISSAO: TDateTimeField;
    QConhecimentoFreteqt_quantidade_embarque: TFloatField;
    QConhecimentoFreteQT_PESO_FRETE: TFloatField;
    QConhecimentoFreteConsnum_contrato: TFloatField;
    QConhecimentoFreteConsnum_nota: TFloatField;
    QConhecimentoFreteConsCOD_NOTA_CAB: TIntegerField;
    QConhecimentoFreteConsCOD_CONTRATO_VEND: TIntegerField;
    QConhecimentoFreteVAL_PEDAGIO: TFloatField;
    QConhecimentoFreteVAL_ICMS: TFloatField;
    QConhecimentoFreteVAL_ESTADIA: TFloatField;
    QConhecimentoFreteVAL_DESCONTO: TFloatField;
    QConhecimentoFreteVAL_QUEBRA_TECNICA: TFloatField;
    QConhecimentoFreteCOD_CADASTRO: TIntegerField;
    QContaPagarCab: TOracleDataSet1;
    QContaPagarMov: TOracleDataSet1;
    QContaPagarCabCOD_CONTA_PAGAR_CAB: TIntegerField;
    QContaPagarMovCOD_CONTA_PAGAR_MOV: TIntegerField;
    QContaPagarMovIND_TIPO_MOVIMENTO: TStringField;
    QRConhecimentoFreteVAL_PEDAGIO: TFloatField;
    QRConhecimentoFreteVAL_ESTADIA: TFloatField;
    QRConhecimentoFreteVAL_ICMS: TFloatField;
    QRConhecimentoFreteVAL_QUEBRA_TECNICA: TFloatField;
    QConhecimentoFreteCOD_FILIAL: TIntegerField;
    QConhecimentoFreteVAL_FRETE_COMPLEMENTO: TFloatField;
    QRConhecimentoFreteCOD_PRODUTO: TFloatField;
    QRConhecimentoFreteDESC_PRODUTO: TStringField;
    QConhecimentoFreteConscod_produto: TIntegerField;
    QRConhecimentoSContratoCOD_PRODUTO: TFloatField;
    QRConhecimentoSContratoDESC_PRODUTO: TStringField;
    QConhecimentoFreteIND_GERA_CUSTO: TStringField;
    QConhecimentoFreteDESC_MOTORISTA: TStringField;
    QConhecimentoFreteQT_QUANTIDADE: TFloatField;
    QConhecimentoFreteVALOR_FRETE_TON: TFloatField;
    QConhecimentoFreteIND_TIPO_CALCULO: TStringField;
    QConhecimentoFreteqt_peso_notas: TFloatField;
    QConhecimentoFreteDT_RECEBIMENTO: TDateTimeField;
    QConhecimentoFreteCOD_OPERACAO: TIntegerField;
    QConhecimentoFreteval_frete_total_tela: TFloatField;
    QConhecimentoFreteVAL_FRETE_TON: TFloatField;
    QConhecimentoFreteConsDT_EMISSAO_CONHECIMENTO: TDateTimeField;
    QConhecimentoFreteConsCOD_CADASTRO: TIntegerField;
    QConhecimentoFreteIND_SITUACAO: TStringField;
    QRGerenciaConhecimento: TOracleDataSet1;
    QRGerenciaConhecimentoNUM_FRETE: TIntegerField;
    QRGerenciaConhecimentoDT_EMISSAO_CONHECIMENTO: TDateTimeField;
    QRGerenciaConhecimentoDESC_PLACA: TStringField;
    QRGerenciaConhecimentoQT_PESO_FRETE: TFloatField;
    QRGerenciaConhecimentoQT_PESO_CHEGADA: TFloatField;
    QRGerenciaConhecimentoVALOR_FRETE_TON: TFloatField;
    QRGerenciaConhecimentoVAL_PEDAGIO: TFloatField;
    QRGerenciaConhecimentoVAL_FRETE: TFloatField;
    QRGerenciaConhecimentoVAL_ICMS: TFloatField;
    QRGerenciaConhecimentoVAL_TOTAL: TFloatField;
    QRGerenciaConhecimentoNUM_NOTA: TIntegerField;
    QRGerenciaConhecimentoCOD_PRODUTO: TFloatField;
    QRGerenciaConhecimentoNOME: TStringField;
    QConhecimentoFreteCOD_TRIBUTACAO: TIntegerField;
    procedure QConhecimentoFreteCalcFields(DataSet: TDataSet);
    procedure QConhecimentoFreteConsCalcFields(DataSet: TDataSet);
    procedure QConhecimentoFreteBeforeInsert(DataSet: TDataSet);
    procedure QConhecimentoFreteBeforeEdit(DataSet: TDataSet);
    procedure QConhecimentoFretePostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure QConhecimentoFreteAfterPost(DataSet: TDataSet);
    procedure QConhecimentoFreteAfterCancel(DataSet: TDataSet);
    procedure QConhecimentoFreteVALOR_FRETE_TONChange(Sender: TField);
    procedure QConhecimentoFreteQT_PESO_FRETEValidate(Sender: TField);
    procedure QConhecimentoFreteQT_PESO_CHEGADAValidate(Sender: TField);
    procedure QConhecimentoFreteIND_TIPO_CALCULOChange(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMConhecimentoFrete: TDMConhecimentoFrete;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMConhecimentoFrete.QConhecimentoFreteCalcFields(
  DataSet: TDataSet);
Var wTotal : String;
begin
  With DMConhecimentoFrete do
   Begin
     If QConhecimentoFreteCod_Nota_Cab.Text <> '' Then
      Begin
        QConhecimentoFreteQt_Peso_Notas.Value := StrToFloat(DMOracle.BuscaNome('SELECT SUM(QT_QUANTIDADE) FROM TB_NOTA_ITEM','COD_NOTA_CAB =' +FloatToStr(QConhecimentoFreteCOD_NOTA_CAB.VALUE)));
        IF QConhecimentoFreteQt_Peso_Frete.Text = '' Then
           QConhecimentoFreteQt_Peso_Frete.Value := QConhecimentoFreteQt_Peso_Notas.Value;
      End;
     If QConhecimentoFreteCod_Contrato_Vend.Text <> '' Then
      Begin
        wTotal := DMOracle.BuscaNome('SELECT SUM(VAL_FRETE + VAL_FRETE_COMPLEMENTO) FROM TB_CONHECIMENTO_FRETE','COD_CONTRATO_VEND =' +FloatToStr(QConhecimentoFreteCOD_CONTRATO_VEND.VALUE));
        If wTotal <> '' Then
           QConhecimentoFreteValor_Total_Frete.Value := StrToFloat(wTotal);
        wTotal :=DMOracle.BuscaNome('SELECT SUM(QT_PESO_FRETE) FROM TB_CONHECIMENTO_FRETE ','COD_CONTRATO_VEND =' +FloatToStr(QConhecimentoFreteCOD_CONTRATO_VEND.VALUE));
        If wTotal <> '' Then
           QConhecimentoFreteQt_Quantidade_Embarque.Value := StrToFloat(wTotal);
        wTotal := DMOracle.BuscaNome('SELECT QT_QUANTIDADE FROM TB_CONTRATO_VEND','COD_CONTRATO_VEND =' +FloatToStr(QConhecimentoFreteCOD_CONTRATO_VEND.VALUE));
        If wTotal <> '' Then
           QConhecimentoFreteQt_Quantidade_Contrato.Value := StrToFloat(wTotal);
      end;
      QConhecimentoFreteVal_Frete_Total_Tela.Value := QConhecimentoFreteVAL_FRETE.Value +
                                                     QConhecimentoFreteVal_Pedagio.Value +
                                                     QConhecimentoFreteVAL_FRETE_COMPLEMENTO.Value;
   End;
end;

procedure TDMConhecimentoFrete.QConhecimentoFreteConsCalcFields(
  DataSet: TDataSet);
Var wCod_Produto : String;
begin
  QConhecimentoFreteConsNum_Nota.Text :=DMOracle.BuscaNome('SELECT NUM_NOTA FROM TB_NOTA_CAB','COD_NOTA_CAB =' +FloatToStr(QConhecimentoFreteConsCOD_NOTA_CAB.VALUE));
  wCod_Produto := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_NOTA_ITEM','COD_NOTA_CAB =' +FloatToStr(QConhecimentoFreteConsCOD_NOTA_CAB.VALUE));
  If wCod_Produto <> '' Then
     QConhecimentoFreteConsCod_Produto.Value := StrToInt(wCod_Produto);
  QConhecimentoFreteConsNum_Contrato.Text :=DMOracle.BuscaNome('SELECT NUM_CONTRATO FROM TB_CONTRATO_VEND','COD_CONTRATO_VEND =' +FloatToStr(QConhecimentoFreteConsCOD_CONTRATO_VEND.VALUE));
end;

procedure TDMConhecimentoFrete.QConhecimentoFreteBeforeInsert(
  DataSet: TDataSet);
begin
  if not(DMOracle.DBCemapa.inTransaction) then
    DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMConhecimentoFrete.QConhecimentoFreteBeforeEdit(
  DataSet: TDataSet);
begin
  if not(DMOracle.DBCemapa.inTransaction) then
    DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMConhecimentoFrete.QConhecimentoFretePostError(
  DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  If DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.Rollback;
end;

procedure TDMConhecimentoFrete.QConhecimentoFreteAfterPost(
  DataSet: TDataSet);
var wCodigo:Integer;
begin
  If DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.Commit;
  wCodigo := QConhecimentoFreteCod_Conhecimento_Frete.Value;
  QConhecimentoFrete.Close;
  QConhecimentoFrete.SetVariable('PK',wCodigo);
  QConhecimentoFrete.Open;
end;

procedure TDMConhecimentoFrete.QConhecimentoFreteAfterCancel(
  DataSet: TDataSet);
begin
  If DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.Rollback;
end;

procedure TDMConhecimentoFrete.QConhecimentoFreteVALOR_FRETE_TONChange(
  Sender: TField);
begin
  If QConhecimentoFreteInd_Tipo_Calculo.Value = 'CHEGADA' then
     QConhecimentoFreteVal_Frete.Value := QConhecimentoFreteValor_Frete_Ton.Value * QConhecimentoFreteQt_Peso_Chegada.Value / 1000
  Else
     QConhecimentoFreteVal_Frete.Value := QConhecimentoFreteValor_Frete_Ton.Value * QConhecimentoFreteQt_Peso_Frete.Value / 1000;
end;

procedure TDMConhecimentoFrete.QConhecimentoFreteQT_PESO_FRETEValidate(
  Sender: TField);
begin
  If QConhecimentoFreteInd_Tipo_Calculo.Value = 'CHEGADA' then
     QConhecimentoFreteVal_Frete.Value := QConhecimentoFreteValor_Frete_Ton.Value * QConhecimentoFreteQt_Peso_Chegada.Value / 1000
  Else
     QConhecimentoFreteVal_Frete.Value := QConhecimentoFreteValor_Frete_Ton.Value * QConhecimentoFreteQt_Peso_Frete.Value / 1000;

end;

procedure TDMConhecimentoFrete.QConhecimentoFreteQT_PESO_CHEGADAValidate(
  Sender: TField);
begin
  If QConhecimentoFreteInd_Tipo_Calculo.Value = 'CHEGADA' then
     QConhecimentoFreteVal_Frete.Value := QConhecimentoFreteValor_Frete_Ton.Value * QConhecimentoFreteQt_Peso_Chegada.Value / 1000
  Else
     QConhecimentoFreteVal_Frete.Value := QConhecimentoFreteValor_Frete_Ton.Value * QConhecimentoFreteQt_Peso_Frete.Value / 1000;
end;

procedure TDMConhecimentoFrete.QConhecimentoFreteIND_TIPO_CALCULOChange(
  Sender: TField);
begin
  If QConhecimentoFreteInd_Tipo_Calculo.Value = 'CHEGADA' then
     QConhecimentoFreteVal_Frete.Value := QConhecimentoFreteValor_Frete_Ton.Value * QConhecimentoFreteQt_Peso_Chegada.Value / 1000
  Else
     QConhecimentoFreteVal_Frete.Value := QConhecimentoFreteValor_Frete_Ton.Value * QConhecimentoFreteQt_Peso_Frete.Value / 1000;

end;

end.
