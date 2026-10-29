unit UFinalidade_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste;

type
  TDMFinalidade = class(TDataModule)
    QFinalidade: TOracleDataSet1;
    QFinalidadeCOD_FINALIDADE: TIntegerField;
    QFinalidadeCOD_MOEDA: TIntegerField;
    QFinalidadeDESC_FINALIDADE: TStringField;
    QFinalidadeNUM_TIPO_JURO: TStringField;
    QFinalidadePERC_TAXA: TFloatField;
    QFinalidadeNUM_PRAZO: TIntegerField;
    QFinalidadeIND_ENCARGO: TStringField;
    QFinalidadeIND_RECIBO: TStringField;
    QFinalidadePERC_JURO_MORA: TFloatField;
    QFinalidadeDESC_RESUMO: TStringField;
    QFinalidadeCOD_HISTORICO_BAIXA: TIntegerField;
    QFinalidadeCOD_HISTORICO_DESC: TIntegerField;
    QFinalidadeCOD_HISTORICO_JURO: TIntegerField;
    QFinalidadeCOD_HISTORICO_CHEQUE: TIntegerField;
    QFinalidadeCOD_CONTABIL_VL_BAIXA_CRED: TStringField;
    QFinalidadeCOD_CONTABIL_VL_BAIXA_DEB: TStringField;
    QFinalidadeCOD_CONTABIL_VL_JURO_CRED: TStringField;
    QFinalidadeCOD_CONTABIL_VL_JURO_DEB: TStringField;
    QFinalidadeCOD_CONTABIL_VL_DESC_CRED: TStringField;
    QFinalidadeCOD_CONTABIL_VL_DESC_DEB: TStringField;
    QFinalidadeCOD_CONTABIL_VL_BANCO_CRED: TStringField;
    QFinalidadeCOD_CONTABIL_VL_BANCO_DEB: TStringField;
    QFinalidadeCOD_CONTABIL_VL_JURO_BCO_DEB: TStringField;
    QFinalidadeCOD_CONTABIL_VL_DESC_BCO_CRED: TStringField;
    QFinalidadeCOD_HISTORICO_CONTABIL: TIntegerField;
    QFinalidadeCOD_HISTORICO_CAIXA_INCLUSAO: TIntegerField;
    QFinalidadeCons: TOracleDataSet1;
    QFinalidadeConsCOD_FINALIDADE: TIntegerField;
    QFinalidadeConsDESC_FINALIDADE: TStringField;
    QRFinalidade: TOracleDataSet1;
    QFinalidadeIND_CONTABILIDADE: TStringField;
    QFinalidadeCOD_HISTORICO_VARIACAO_POS: TIntegerField;
    QFinalidadeCOD_HISTORICO_VARIACAO_NEG: TIntegerField;
    QFinalidadeCOD_CONTABIL_VARIACAO_POS_CRED: TStringField;
    QFinalidadeCOD_CONTABIL_VARIACAO_POS_DEB: TStringField;
    QFinalidadeCOD_CONTABIL_VARIACAO_NEG_CRED: TStringField;
    QFinalidadeCOD_CONTABIL_VARIACAO_NEG_DEB: TStringField;
    QFinalidadeCOD_CONTABIL_INCLUSAO_DEB: TStringField;
    QFinalidadeCOD_CONTABIL_INCLUSAO_CRED: TStringField;
    QFinalidadeCOD_HIST_CONTABIL_INCLUSAO: TIntegerField;
    QFinalidadeCOD_CONTABIL_BAIXA_CONT_CRED: TStringField;
    QFinalidadeCOD_CONTABIL_VL_DESC_FIN_CRED: TStringField;
    QFinalidadeCOD_CONTABIL_VL_DESC_COM_CRED: TStringField;
    QFinalidadeIND_TIPO: TStringField;
    QFinalidadeIND_VEICULO: TStringField;
    QFinalidadeCOD_CONTABIL_BAIXA_CONT_DEB: TStringField;
    QFinalidadeCOD_CONTABIL_JURO_CONT_DEB: TStringField;
    QFinalidadeCOD_CONTABIL_DESC_CONT_CRED: TStringField;
    QFinalidadeCOD_HISTORICO_CAIXA_DEVOLUCAO: TIntegerField;
    QFinalidadeIND_LIBERADO: TStringField;
    QFinalidadeNUM_DIAS_CARENCIA: TIntegerField;
    QFinalidadeIND_FLUXO_CAIXA: TStringField;
    QRFinalidadeCOD_FINALIDADE: TIntegerField;
    QRFinalidadeCOD_MOEDA: TIntegerField;
    QRFinalidadeDESC_FINALIDADE: TStringField;
    QRFinalidadeNUM_TIPO_JURO: TStringField;
    QRFinalidadePERC_TAXA: TFloatField;
    QRFinalidadePERC_JURO_MORA: TFloatField;
    QRFinalidadeDESC_RESUMO: TStringField;
    QRFinalidadeVAL_LIMITE: TFloatField;
    QRFinalidadeDESC_MOEDA: TStringField;
    QFinalidadeVAL_LIMITE: TFloatField;
    QFinalidadeCOD_CONTABIL_IR_DEB: TStringField;
    QFinalidadeCOD_CONTABIL_IR_CRED: TStringField;
    QFinalidadeIND_CARNE: TStringField;
    QFinalidadeCOD_HISTORICO_OUTROS: TIntegerField;
    QFinalidadeCOD_CONTABIL_VL_OUTROS_CRED: TStringField;
    QFinalidadeCOD_CONTABIL_VL_OUTROS_DEB: TStringField;
    QFinalidadePERC_DESC_FINANCEIRO: TFloatField;
    QFinalidadeIND_PERMITE_DESCONTO_BAIXA: TStringField;
    QFinalidadeCOD_HISTORICO_CARTAO_CREDITO: TIntegerField;
    QFinalidadeCOD_HISTORICO_CARTAO_DEBITO: TIntegerField;
    QFinalidadeCOD_HISTORICO_JUROS_CREDITO: TIntegerField;
    QFinalidadeCOD_HISTORICO_JUROS_DEBITO: TIntegerField;
    QFinalidadeCOD_HISTORICO_CAIXA_CHEQUE: TIntegerField;
    QFinalidadeCOD_HISTORICO_JUROS_CHEQUE: TIntegerField;
    QFinalidadeIND_DRE_POLYANA: TStringField;
    QFinalidadeCOD_CENTRO_CUSTO: TIntegerField;
    QFinalidadeCOD_HISTORICO_PIX: TIntegerField;
    QFinalidadeCOD_HISTORICO_JUROS_PIX: TIntegerField;
    QFinalidadeIND_FINALIDADE: TStringField;
    QFinalidadeConsIND_FINALIDADE: TStringField;

    procedure QFinalidadeCalcFields(DataSet: TDataSet);
    procedure QFinalidadeAfterInsert(DataSet: TDataSet);
    procedure QFinalidadeBeforePost(DataSet: TDataSet);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMFinalidade: TDMFinalidade;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMFinalidade.QFinalidadeCalcFields(DataSet: TDataSet);
begin
{  QFinalidadedesc_moeda.value:=DMOracle.BuscaNome('SELECT DESC_MOEDA FROM TB_MOEDA','COD_MOEDA='+FloatToStr(QFinalidadeCod_moeda.Value));
  QFinalidadedesc_hist_baixa.value:=DMOracle.BuscaNome('SELECT DESC_HISTORICO FROM TB_HISTORICO','COD_HISTORICO='+FloatToStr(QFinalidadeCod_Historico_Baixa.Value));
  QFinalidadedesc_historico_devolucao.value:=DMOracle.BuscaNome('SELECT DESC_HISTORICO FROM TB_HISTORICO','COD_HISTORICO='+FloatToStr(QFinalidadeCod_Historico_Caixa_Devolucao.Value));
  QFinalidadedesc_hist_desc.value:=DMOracle.BuscaNome('SELECT DESC_HISTORICO FROM TB_HISTORICO','COD_HISTORICO='+FloatToStr(QFinalidadeCod_Historico_Desc.Value));
  QFinalidadedesc_hist_juro.value:=DMOracle.BuscaNome('SELECT DESC_HISTORICO FROM TB_HISTORICO','COD_HISTORICO='+FloatToStr(QFinalidadeCod_Historico_Juro.Value));
  QFinalidadedesc_hist_cheque.value:=DMOracle.BuscaNome('SELECT DESC_HISTORICO FROM TB_HISTORICO','COD_HISTORICO='+FloatToStr(QFinalidadeCod_Historico_Cheque.Value));
  QFinalidadedesc_Contabil_Vl_Baixa_Cred.value:=DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+chr(39)+QFinalidadeCod_Contabil_Vl_Baixa_Cred.Value+chr(39));
  QFinalidadedesc_Contabil_Vl_Baixa_Deb.value:=DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+chr(39)+QFinalidadeCod_Contabil_Vl_Baixa_Deb.Value+chr(39));
  QFinalidadedesc_Contabil_Vl_Juro_Cred.value:=DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+chr(39)+QFinalidadeCod_Contabil_Vl_Juro_Cred.Value+chr(39));
  QFinalidadedesc_Contabil_Vl_Juro_Deb.value:=DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+chr(39)+QFinalidadeCod_Contabil_Vl_Juro_Deb.Value+chr(39));
  QFinalidadedesc_Contabil_Vl_Desc_Deb.value:=DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+chr(39)+QFinalidadeCod_Contabil_Vl_Desc_Deb.Value+chr(39));
  QFinalidadedesc_Contabil_Vl_Desc_Cred.value:=DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+chr(39)+QFinalidadeCod_Contabil_Vl_Desc_Cred.Value+chr(39));
  QFinalidadedesc_Contabil_Vl_Desc_Fin_Cred.value:=DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+chr(39)+QFinalidadeCod_Contabil_Vl_Desc_Fin_Cred.Value+chr(39));
  QFinalidadedesc_Contabil_Vl_Desc_Com_Cred.value:=DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+chr(39)+QFinalidadeCod_Contabil_Vl_Desc_Com_Cred.Value+chr(39));
  QFinalidadedesc_Contabil_Vl_Banco_Deb.value:=DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+chr(39)+QFinalidadeCod_Contabil_Vl_Banco_Deb.Value+chr(39));
  QFinalidadedesc_Contabil_Vl_Banco_Cred.value:=DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+chr(39)+QFinalidadeCod_Contabil_Vl_Banco_Cred.Value+chr(39));
  QFinalidadedesc_Contabil_Vl_Desc_Bco_Cred.value:=DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+chr(39)+QFinalidadeCod_Contabil_Vl_Desc_Bco_Cred.Value+chr(39));
  QFinalidadedesc_Contabil_Vl_Juro_Bco_Deb.value:=DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+chr(39)+QFinalidadeCod_Contabil_Vl_Juro_Bco_Deb.Value+chr(39));
  QFinalidadedesc_contabil_variacao_pos_deb.value:=DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+chr(39)+QFinalidadeCod_Contabil_Variacao_Pos_Deb.Value+chr(39));
  QFinalidadedesc_contabil_variacao_pos_cred.value:=DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+chr(39)+QFinalidadeCod_Contabil_Variacao_Pos_Cred.Value+chr(39));
  QFinalidadedesc_contabil_variacao_neg_deb.value:=DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+chr(39)+QFinalidadeCod_Contabil_Variacao_Neg_Deb.Value+chr(39));
  QFinalidadedesc_contabil_variacao_neg_cred.value:=DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+chr(39)+QFinalidadeCod_Contabil_Variacao_Neg_Cred.Value+chr(39));
  QFinalidadedesc_Hist_Contabil.value:=DMOracle.BuscaNome('SELECT DESC_HISTORICO_CONTABIL FROM TB_HISTORICO_CONTABIL','COD_HISTORICO_CONTABIL = '+FloatToStr(QFinalidadeCod_Historico_Contabil.Value));
  QFinalidadedesc_historico_caixa_inclusao.value:=DMOracle.BuscaNome('SELECT DESC_HISTORICO FROM TB_HISTORICO','COD_HISTORICO='+FloatToStr(QFinalidadeCod_Historico_Caixa_Inclusao.Value));
  QFinalidadedesc_variacao_cambial_pos.value:=DMOracle.BuscaNome('SELECT DESC_HISTORICO FROM TB_HISTORICO','COD_HISTORICO='+FloatToStr(QFinalidadeCod_Historico_Variacao_Pos.Value));
  QFinalidadedesc_variacao_cambial_neg.value:=DMOracle.BuscaNome('SELECT DESC_HISTORICO FROM TB_HISTORICO','COD_HISTORICO='+FloatToStr(QFinalidadeCod_Historico_Variacao_Neg.Value));
  QFinalidadedesc_contabil_inclusao_deb.value:=DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+chr(39)+QFinalidadeCod_Contabil_inclusao_Deb.Value+chr(39));
  QFinalidadedesc_contabil_inclusao_cred.value:=DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+chr(39)+QFinalidadeCod_Contabil_Inclusao_Cred.Value+chr(39));
  QFinalidadedesc_contabil_baixa_cont_cred.Value:=DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+chr(39)+QFinalidadeCOD_CONTABIL_BAIXA_CONT_CRED.Value+chr(39));
  QFinalidadedesc_contabil_baixa_cont_deb.Value:=DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+chr(39)+QFinalidadeCOD_CONTABIL_BAIXA_CONT_DEB.Value+chr(39));
  QFinalidadedesc_contabil_juro_cont_deb.Value:=DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+chr(39)+QFinalidadeCOD_CONTABIL_JURO_CONT_DEB.Value+chr(39));
  QFinalidadedesc_contabil_desc_cont_cred.Value:=DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+chr(39)+QFinalidadeCOD_CONTABIL_DESC_CONT_CRED.Value+chr(39));
  QFinalidadedesc_Hist_Contabil_Inclusao.value:=DMOracle.BuscaNome('SELECT DESC_HISTORICO_CONTABIL FROM TB_HISTORICO_CONTABIL','COD_HISTORICO_CONTABIL = '+FloatToStr(QFinalidadeCod_Hist_Contabil_Inclusao.Value));
  }
end;

procedure TDMFinalidade.QFinalidadeAfterInsert(DataSet: TDataSet);
begin
  QFinalidadeCod_finalidade.Value:=DMOracle.Sequencia('FINALIDADE');
  QFinalidadeInd_encargo.Value:='VENCIMENTO';
  QFinalidadeInd_Recibo.Value:='N';
  QFinalidadeNum_Tipo_Juro.Value:='SIMPLES';
  QFinalidadeIND_VEICULO.Value := 'N';
  QFinalidadeCOD_MOEDA.Value := 1; //Para não precisar preencher toda vez que cadastrar uma nova finalidade. Junior 15/10/2019 suporte(13581)
end;

procedure TDMFinalidade.QFinalidadeBeforePost(DataSet: TDataSet);
var
  IndOperacao: string;
  QConsulta: TOracleDataSet1;
begin
  If (Not(QFinalidadeCod_Contabil_Vl_Banco_Deb.IsNull) and (QFinalidadeCod_Contabil_Vl_Banco_Cred.IsNull))
    or (Not(QFinalidadeCod_Contabil_Vl_Banco_Cred.IsNull) and (QFinalidadeCod_Contabil_Vl_Banco_Deb.IsNull)) Then
    Raise Exception.Create('Erro! Não é Possível Incluir este registro. Campo Cod Contabil Banco Débito\Crédito em Branco');

  If (Not(QFinalidadeCod_Contabil_Vl_Baixa_Deb.IsNull) and (QFinalidadeCod_Contabil_Vl_Baixa_Cred.IsNull))
    or (Not(QFinalidadeCod_Contabil_Vl_Baixa_Cred.IsNull) and (QFinalidadeCod_Contabil_Vl_Baixa_Deb.IsNull)) Then
    Raise Exception.Create('Erro! Não é Possível Incluir este registro. Campo Cod Contabil Baixa Débito\Crédito em Branco');

  If (Not(QFinalidadeCod_Contabil_Vl_Juro_Deb.IsNull) and (QFinalidadeCod_Contabil_Vl_Juro_Cred.IsNull))
    or (Not(QFinalidadeCod_Contabil_Vl_Juro_Cred.IsNull) and (QFinalidadeCod_Contabil_Vl_Juro_Deb.IsNull)) Then
    Raise Exception.Create('Erro! Não é Possível Incluir este registro. Campo Cod Contabil Juro Débito\Crédito em Branco');

  If (Not(QFinalidadeCod_Contabil_Vl_Desc_Deb.IsNull) and (QFinalidadeCod_Contabil_Vl_Desc_Cred.IsNull))
    or (Not(QFinalidadeCod_Contabil_Vl_Desc_Cred.IsNull) and (QFinalidadeCod_Contabil_Vl_Desc_Deb.IsNull)) Then
    Raise Exception.Create('Erro! Não é Possível Incluir este registro. Campo Cod Contabil Desc. Débito\Crédito em Branco');

  If (Not(QFinalidadeCod_Contabil_Vl_Baixa_Deb.IsNull) or Not(QFinalidadeCod_Contabil_Vl_Baixa_Cred.IsNull)
    or Not(QFinalidadeCod_Contabil_Vl_Juro_Cred.IsNull) or Not(QFinalidadeCod_Contabil_Vl_Juro_Deb.IsNull)
    or Not(QFinalidadeCod_Contabil_Vl_Desc_Cred.IsNull) or Not(QFinalidadeCod_Contabil_Vl_Juro_Deb.IsNull))
    and (QFinalidadeCod_Historico_Contabil.IsNull) Then
    Raise Exception.Create('Erro! Não é Possível Incluir este registro. Campo Cod Histórico Contabil em Branco');

  //Validação Campo Pagar ou Receber com IND_OPERACAO do Historico. Verificar se
  // Pagar Diminui e se Receber Soma. Jefferson 14/11/2024
  QConsulta := TOracleDataSet1.Create(Self);
  try
    QConsulta.Session := QFinalidade.Session;

    if not QFinalidadeCOD_HISTORICO_BAIXA.IsNull then
    begin
      QConsulta.Close;
      QConsulta.SQL.Text := 'SELECT IND_OPERACAO FROM TB_HISTORICO WHERE COD_HISTORICO = ' + IntToStr(QFinalidadeCOD_HISTORICO_BAIXA.Value);
      QConsulta.Open;
      if not QConsulta.IsEmpty then
      begin
        IndOperacao := QConsulta.FieldByName('IND_OPERACAO').AsString;
        if (IndOperacao = '-') and (QFinalidadeIND_FINALIDADE.Value <> 'P') then
        begin
          raise Exception.Create('Erro: O campo "IND_FINALIDADE" deve ser "Pagar" para esse COD_HISTORICO.');
          Abort;
        end
        else if (IndOperacao = '+') and (QFinalidadeIND_FINALIDADE.Value <> 'R') then
        begin
          raise Exception.Create('Erro: O campo "IND_FINALIDADE" deve ser "Receber" para esse COD_HISTORICO.');
          Abort;
        end;
      end
      else
      begin
        raise Exception.Create('Erro: Histórico não encontrado na tabela TB_HISTORICO.');
        Abort;
      end;
    end;
  finally
    QConsulta.Free;
  end;
end;

end.
