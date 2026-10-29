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
    QRGerenciaConhecimentoNOME: TStringField;
    QConhecimentoFreteval_frete_comparativo: TFloatField;
    QConhecimentoFreteConsQT_PESO_CHEGADA: TFloatField;
    QRGerenciaConhecimentoVAL_ESTADIA: TFloatField;
    QConhecimentoFreteCOD_TRIBUTACAO: TIntegerField;
    QConhecimentoFreteVAL_PIS: TFloatField;
    QConhecimentoFreteVAL_COFINS: TFloatField;
    QConhecimentoFreteConsVAL_PEDAGIO: TFloatField;
    QConhecimentoFreteConsDESC_PLACA: TStringField;
    QConhecimentoFreteCOD_USUARIO: TIntegerField;
    QConhecimentoFreteqt_dif_peso: TFloatField;
    QConhecimentoFreteqt_dif_frete: TFloatField;
    QRConhecimentoSContratoDESC_MOTORISTA: TStringField;
    QRConhecimentoSContratoCOD_CADASTRO: TIntegerField;
    QRConhecimentoSContratoNOME: TStringField;
    QRConhecimentoSContratoCADASTRO_COD: TIntegerField;
    QRConhecimentoSContratoVALOR_FRETE_TON: TFloatField;
    QRConhecimentoSContratoVAL_ICMS: TFloatField;
    QRConhecimentoSContratoVAL_ESTADIA: TFloatField;
    QRConhecimentoSContratoVAL_PEDAGIO: TFloatField;
    QRConhecimentoSContratoDT_RECEBIMENTO: TDateTimeField;
    QRConhecimentoFreteTransp: TOracleDataSet1;
    IntegerField1: TIntegerField;
    FloatField1: TFloatField;
    DateTimeField1: TDateTimeField;
    StringField1: TStringField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    IntegerField2: TIntegerField;
    DateTimeField2: TDateTimeField;
    FloatField4: TFloatField;
    StringField3: TStringField;
    IntegerField3: TIntegerField;
    StringField4: TStringField;
    IntegerField4: TIntegerField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    DateTimeField3: TDateTimeField;
    QRTituloAbertoConhecimento: TOracleDataSet1;
    QRTituloAbertoConhecimentoVAL_QUEBRA_TECNICA: TFloatField;
    QRTituloAbertoConhecimentoCOD_NOTA_CAB: TIntegerField;
    QRTituloAbertoConhecimentoNUM_TITULO: TIntegerField;
    QRTituloAbertoConhecimentoDT_EMISSAO: TDateTimeField;
    QRTituloAbertoConhecimentoDT_VENCIMENTO: TDateTimeField;
    QRTituloAbertoConhecimentoVALOR_FRETE_TON: TFloatField;
    QRTituloAbertoConhecimentoDESC_PLACA: TStringField;
    QRTituloAbertoConhecimentoQT_PESO_FRETE: TFloatField;
    QRTituloAbertoConhecimentoQT_PESO_CHEGADA: TFloatField;
    QRTituloAbertoConhecimentoVLR_FRETE: TFloatField;
    QRTituloAbertoConhecimentoval_frete_comparativo: TFloatField;
    QRTituloAbertoConhecimentoval_pagar: TFloatField;
    QRTituloAbertoConhecimentoqt_dif_frete: TFloatField;
    QRTituloAbertoConhecimentoIND_TIPO_CALCULO: TStringField;
    QRTituloAbertoConhecimentoVAL_PEDAGIO: TFloatField;
    QRTituloAbertoConhecimentoCOD_CADASTRO: TIntegerField;
    QRTituloAbertoConhecimentoDESC_TRANSPORTADOR: TStringField;
    QRTituloAbertoConhecimentoCOD_FILIAL: TIntegerField;
    QRTituloAbertoConhecimentoDESC_FILIAL: TStringField;
    QRTituloAbertoConhecimentoqt_peso_notas: TFloatField;
    QRConhecimentoFreteTranspDESC_PRODUTO: TStringField;
    QRConhecimentoFreteDESC_PRODUTO: TStringField;
    QRConhecimentoData: TOracleDataSet1;
    QRConhecimentoDataNUM_FRETE: TIntegerField;
    QRConhecimentoDataVAL_FRETE: TFloatField;
    QRConhecimentoDataDT_RECEBIMENTO: TDateTimeField;
    QRConhecimentoDataDT_EMISSAO_CONHECIMENTO: TDateTimeField;
    QRConhecimentoDataNOME: TStringField;
    QConhecimentoFreteCOD_SERIE: TStringField;
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
    procedure QConhecimentoFreteAfterEdit(DataSet: TDataSet);
    procedure QConhecimentoFreteAfterInsert(DataSet: TDataSet);
    procedure QRTituloAbertoConhecimentoCalcFields(DataSet: TDataSet);
  private
    procedure Calcula_ValorFrete;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMConhecimentoFrete: TDMConhecimentoFrete;

implementation

uses UOracle_cl, UUsuario_cl;

{$R *.DFM}

procedure TDMConhecimentoFrete.QConhecimentoFreteCalcFields(
  DataSet: TDataSet);
Var wTotal,wUnidade,wTipoProduto : String;
begin
   If QConhecimentoFreteCod_Nota_Cab.Text <> '' Then
    Begin
      wUnidade := DMOracle.BuscaNome('SELECT DESC_UNIDADE FROM TB_NOTA_ITEM,TB_PRODUTO',
                                     'TB_NOTA_ITEM.COD_PRODUTO=TB_PRODUTO.COD_PRODUTO AND COD_NOTA_CAB ='
                                     + FloatToStr(QConhecimentoFreteCOD_NOTA_CAB.VALUE));

      wTipoProduto := DMOracle.BuscaNome('SELECT IND_TIPO_PRODUTO FROM TB_NOTA_ITEM,TB_PRODUTO',
                                         'TB_NOTA_ITEM.COD_PRODUTO=TB_PRODUTO.COD_PRODUTO AND COD_NOTA_CAB ='
                                         + FloatToStr(QConhecimentoFreteCOD_NOTA_CAB.VALUE));

      //-----------CALCULA O QT_PESO_NOTAS----------------
      If wTipoProduto <> 'AGRICOLA' Then
         QConhecimentoFreteqt_peso_notas.Value :=
              StrToFloat(DMOracle.BuscaNome('SELECT SUM(QT_QUANTIDADE * NUM_EMBALAGEM) ' +
                                            'FROM TB_NOTA_ITEM, TB_PRODUTO',
                                            'TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO AND COD_NOTA_CAB ='
                                            + FloatToStr(QConhecimentoFreteCOD_NOTA_CAB.VALUE)))
      Else
         QConhecimentoFreteqt_peso_notas.Value :=
              StrToFloat(DMOracle.BuscaNome('SELECT SUM(QT_QUANTIDADE) FROM TB_NOTA_ITEM',
                                            'COD_NOTA_CAB ='
                                            + FloatToStr(QConhecimentoFreteCOD_NOTA_CAB.VALUE)));
      //-----------FIM CALCULA O QT_PESO_NOTAS----------------

      IF QConhecimentoFreteQT_PESO_FRETE.Text = '' Then
      begin
        If wTipoProduto = 'AGRICOLA' Then
          QConhecimentoFreteQT_PESO_FRETE.Value := QConhecimentoFreteqt_peso_notas.Value
        else
          QConhecimentoFreteQT_PESO_FRETE.Value := StrToFloat(DMOracle.BuscaNome('SELECT SUM(QT_QUANTIDADE) FROM TB_NOTA_ITEM',
                                             'COD_NOTA_CAB ='
                                             + FloatToStr(QConhecimentoFreteCOD_NOTA_CAB.VALUE)));
      end;

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
  If QConhecimentoFreteInd_Tipo_Calculo.Value = 'CHEGADA' then
     QConhecimentoFreteVal_Frete_Comparativo.Value := QConhecimentoFreteValor_Frete_Ton.Value * QConhecimentoFreteQt_Peso_Frete.Value
  Else
     QConhecimentoFreteVal_Frete_Comparativo.Value := QConhecimentoFreteValor_Frete_Ton.Value * QConhecimentoFreteQt_Peso_Chegada.Value;
  If (Trim(wUnidade) <> 'T') And (QConhecimentoFreteVal_Frete_Comparativo.Value <> 0) then
     QConhecimentoFreteVal_Frete_Comparativo.Value := QConhecimentoFreteVal_Frete_Comparativo.Value / 1000;
  QConhecimentoFreteVal_Frete_Comparativo.Value := QConhecimentoFreteVal_Frete_Comparativo.Value +
                                                   QConhecimentoFreteVal_Pedagio.Value;


  if QConhecimentoFreteQT_PESO_CHEGADA.Text <> '' then
    QConhecimentoFreteqt_dif_peso.Value := QConhecimentoFreteQT_PESO_CHEGADA.Value
                                       - QConhecimentoFreteqt_peso_notas.Value;

  QConhecimentoFreteqt_dif_frete.Value := QConhecimentoFreteval_frete_comparativo.Value
                                       - QConhecimentoFreteval_frete_total_tela.Value;
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
  Calcula_ValorFrete
end;

procedure TDMConhecimentoFrete.QConhecimentoFreteQT_PESO_FRETEValidate(
  Sender: TField);
begin
  Calcula_ValorFrete
end;

procedure TDMConhecimentoFrete.QConhecimentoFreteQT_PESO_CHEGADAValidate(
  Sender: TField);
begin
  Calcula_ValorFrete
end;

procedure TDMConhecimentoFrete.QConhecimentoFreteIND_TIPO_CALCULOChange(
  Sender: TField);
begin
  Calcula_ValorFrete;
end;

procedure TDMConhecimentoFrete.Calcula_ValorFrete;
Var wPeso,wTipoProduto,wUnidade: String;
    wEmbalagem : Real;
Begin
  With DMConhecimentoFrete  do
  Begin
    If QConhecimentoFreteCod_Nota_Cab.Text <> '' Then
     Begin
        wUnidade := DMOracle.BuscaNome('SELECT DESC_UNIDADE FROM TB_NOTA_ITEM,TB_PRODUTO','TB_NOTA_ITEM.COD_PRODUTO=TB_PRODUTO.COD_PRODUTO AND COD_NOTA_CAB =' +FloatToStr(QConhecimentoFreteCOD_NOTA_CAB.VALUE));
        wPeso := DMOracle.BuscaNome('SELECT NUM_EMBALAGEM FROM TB_NOTA_ITEM,TB_PRODUTO','TB_NOTA_ITEM.COD_PRODUTO=TB_PRODUTO.COD_PRODUTO AND COD_NOTA_CAB =' +FloatToStr(QConhecimentoFreteCOD_NOTA_CAB.VALUE));
        wTipoProduto := DMOracle.BuscaNome('SELECT IND_TIPO_PRODUTO FROM TB_NOTA_ITEM,TB_PRODUTO','TB_NOTA_ITEM.COD_PRODUTO=TB_PRODUTO.COD_PRODUTO AND COD_NOTA_CAB =' +FloatToStr(QConhecimentoFreteCOD_NOTA_CAB.VALUE));
     End;
    If (wPeso <> '')  And (wTipoProduto = 'COMERCIAL') Then
      wEmbalagem := StrToFloat(wPeso)
    Else
      wEmbalagem := 1;
    If QConhecimentoFreteInd_Tipo_Calculo.Value = 'CHEGADA' then
       QConhecimentoFreteVal_Frete.Value := QConhecimentoFreteValor_Frete_Ton.Value * QConhecimentoFreteQt_Peso_Chegada.Value * wEmbalagem
    Else
       QConhecimentoFreteVal_Frete.Value := QConhecimentoFreteValor_Frete_Ton.Value * QConhecimentoFreteQt_Peso_Frete.Value * wEmbalagem;
    If Trim(wUnidade) <> 'T' Then
       QConhecimentoFreteVal_Frete.Value := QConhecimentoFreteVal_Frete.Value / 1000;
  end;
End;


procedure TDMConhecimentoFrete.QConhecimentoFreteAfterEdit(
  DataSet: TDataSet);
begin
  QConhecimentoFreteCod_Usuario.Value := DMUsuario.CodUsuarioCorrente;
end;

procedure TDMConhecimentoFrete.QConhecimentoFreteAfterInsert(
  DataSet: TDataSet);
begin
  QConhecimentoFreteCod_Usuario.Value := DMUsuario.CodUsuarioCorrente;
  QConhecimentoFreteCOD_SERIE.Value := '8';
end;

function arredondarValor(valor : real):real;
var resto, v : real;
begin
  v := trunc(valor * 100)/100;
  resto := valor - v;

  result := v;
  if resto >= 0.005 then
    result := result + 0.01;

  if resto <= -0.005 then
    result := result - 0.01;
end;

procedure TDMConhecimentoFrete.QRTituloAbertoConhecimentoCalcFields(
  DataSet: TDataSet);
Var wUnidade,wTipoProduto : String;
begin
  //--------------CALCULA O PESO NOTA---------------------------
  wTipoProduto := DMOracle.BuscaNome('SELECT IND_TIPO_PRODUTO FROM TB_NOTA_ITEM,TB_PRODUTO',
                                     'TB_NOTA_ITEM.COD_PRODUTO=TB_PRODUTO.COD_PRODUTO AND COD_NOTA_CAB ='
                                    + FloatToStr(QRTituloAbertoConhecimentoCOD_NOTA_CAB.VALUE));
  If wTipoProduto <> 'AGRICOLA' Then
   begin
    QRTituloAbertoConhecimentoQt_Peso_Notas.Value :=
      StrToFloat(DMOracle.BuscaNome('SELECT SUM(QT_QUANTIDADE*NUM_EMBALAGEM) FROM TB_NOTA_ITEM,TB_PRODUTO',
                                    'TB_NOTA_ITEM.COD_PRODUTO=TB_PRODUTO.COD_PRODUTO AND COD_NOTA_CAB ='
                                    + FloatToStr(QRTituloAbertoConhecimentoCOD_NOTA_CAB.VALUE)));
   end
  Else
   begin
    QRTituloAbertoConhecimentoqt_peso_notas.Value :=
      StrToFloat(DMOracle.BuscaNome('SELECT SUM(QT_QUANTIDADE) FROM TB_NOTA_ITEM',
                                    'COD_NOTA_CAB ='
                                    + FloatToStr(QRTituloAbertoConhecimentoCOD_NOTA_CAB.VALUE)));
   end;
  //--------------FIM CALCULA O PESO NOTA---------------------------

  If QConhecimentoFreteCod_Nota_Cab.Text <> '' Then
  Begin
    wUnidade := DMOracle.BuscaNome('SELECT DESC_UNIDADE FROM TB_NOTA_ITEM,TB_PRODUTO','TB_NOTA_ITEM.COD_PRODUTO=TB_PRODUTO.COD_PRODUTO AND COD_NOTA_CAB =' +FloatToStr(QRTituloAbertoConhecimentoCOD_NOTA_CAB.VALUE));;
  End;

  If QRTituloAbertoConhecimentoIND_TIPO_CALCULO.Value = 'CHEGADA' then
     QRTituloAbertoConhecimentoval_frete_comparativo.Value := QRTituloAbertoConhecimentoVALOR_FRETE_TON.Value * QRTituloAbertoConhecimentoQT_PESO_FRETE.Value
  Else
     QRTituloAbertoConhecimentoval_frete_comparativo.Value := QRTituloAbertoConhecimentoVALOR_FRETE_TON.Value * QRTituloAbertoConhecimentoQT_PESO_CHEGADA.Value;
  If (Trim(wUnidade) <> 'T') And (QRTituloAbertoConhecimentoval_frete_comparativo.Value <> 0) then
     QRTituloAbertoConhecimentoval_frete_comparativo.Value := QRTituloAbertoConhecimentoval_frete_comparativo.Value / 1000;
  QRTituloAbertoConhecimentoval_frete_comparativo.Value := QRTituloAbertoConhecimentoval_frete_comparativo.Value +
                                                   QRTituloAbertoConhecimentoVAL_PEDAGIO.Value;

  QRTituloAbertoConhecimentoqt_dif_frete.Value := QRTituloAbertoConhecimentoval_frete_comparativo.Value
                                       - QRTituloAbertoConhecimentoVLR_FRETE.Value;
  QRTituloAbertoConhecimentoqt_dif_frete.Value := arredondarValor(QRTituloAbertoConhecimentoqt_dif_frete.Value);
     //  trunc(QRTituloAbertoConhecimentoqt_dif_frete.Value * 100) / 100;//arredonda com duas casas

  QRTituloAbertoConhecimentoval_pagar.Value := QRTituloAbertoConhecimentoVLR_FRETE.Value
                                             + QRTituloAbertoConhecimentoqt_dif_frete.Value
                                             - QRTituloAbertoConhecimentoVAL_QUEBRA_TECNICA.Value;
end;

end.
