unit UContasPagarRel_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMContasPagarRel = class(TDataModule)
    QrTitulosAPagar_For: TOracleDataSet1;
    QrTitulosAPagar_ForCOD_CADASTRO: TIntegerField;
    QrTitulosAPagar_ForNUM_TITULO: TIntegerField;
    QrTitulosAPagar_ForNUM_PARCELA: TIntegerField;
    QrTitulosAPagar_ForDT_EMISSAO: TDateTimeField;
    QrTitulosAPagar_ForDT_VENCIMENTO: TDateTimeField;
    QrTitulosAPagar_ForPERC_DESC_PONTUALIDADE: TFloatField;
    QrTitulosAPagar_ForPERC_DESC_ANTECIPACAO: TFloatField;
    QrTitulosAPagar_ForVAL_TITULO: TFloatField;
    QrTitulosAPagar_ForNOME: TStringField;
    QrTitulosAPagar_Forval_desc_pontualidade: TFloatField;
    QrTitulosAPagar_Forval_desc_antecipacao: TFloatField;
    QrTitulosAPagar_ForDESC_AGENCIA: TStringField;
    QrTitulosAPagar_ForDESC_CONTA_CORRENTE: TStringField;
    QrTitulosAPagar_ForNUM_CGC_CPF: TStringField;
    QrTitulosAPagar_ForCOD_BANCO_AGENCIA: TIntegerField;
    QrTitulosAPagar_Forval_saldo_titulo: TFloatField;
    QrTitulosAPagar_ForDESC_COMPLEMENTO: TStringField;
    QrTitulosAPagar_ForDESC_COMPLEMENTO_SINTEGRA: TStringField;
    QrTitulosAPagar_ForDT_REFERENCIA: TDateTimeField;
    QRAgendaBaixa: TOracleDataSet1;
    QRAgendaBaixaIND_FORMA_PAGAMENTO: TStringField;
    QRAgendaBaixaDESC_CNPJ_CPF_PGTO: TStringField;
    QRAgendaBaixaCOD_CONTA_CORRENTE_PGTO: TStringField;
    QRAgendaBaixaCOD_AGENCIA: TStringField;
    QRAgendaBaixaCOD_BANCO_PGTO: TIntegerField;
    QRAgendaBaixaDT_VENCIMENTO: TDateTimeField;
    QRAgendaBaixaVAL_TITULO: TFloatField;
    QRAgendaBaixaCOD_BANCO_AGENCIA: TIntegerField;
    QRAgendaBaixaIND_ACEITE: TStringField;
    QRAgendaBaixaCOD_CADASTRO: TIntegerField;
    QRAgendaBaixaDESC_NOME_TITULAR_CONTA: TStringField;
    QRAgendaBaixaNOME: TStringField;
    QRAgendaBaixaBANCO_AGENCIA: TStringField;
    QRAgendaBaixaBANCO_AGENCIA_PGTO: TStringField;
    QRAgendaBaixaCOD_USUARIO_ACEITE: TIntegerField;
    QRAgendaBaixaDESC_COMPLEMENTO_SINTEGRA: TStringField;
    QrTitulosAPagar_Fordesc_banco_agencia: TStringField;
    QRContasPagarSintetico: TOracleDataSet1;
    QRContasPagarSinteticoNOME: TStringField;
    QRContasPagarSinteticoCOD_CADASTRO: TIntegerField;
    QRContasPagarSinteticoVAL_TITULO: TFloatField;
    QRTitulosPorFinalidade: TOracleDataSet1;
    QrCustosProducao: TOracleDataSet1;
    QrCustosProducaoCOD_CENTRO_CUSTO: TIntegerField;
    QrCustosProducaoDESC_CENTRO_CUSTO: TStringField;
    QrCustosProducaoCOD_FINALIDADE: TIntegerField;
    QrCustosProducaoDESC_FINALIDADE: TStringField;
    QrCustosProducaoCOD_HISTORICO: TIntegerField;
    QrCustosProducaoDESC_HISTORICO: TStringField;
    QrCustosProducaoTOTAL: TFloatField;
    QRTitulosReparceladosCP: TOracleDataSet1;
    QRTitulosReparceladosCPCOD_CONTA_PAGAR_CAB: TIntegerField;
    QRTitulosReparceladosCPNUM_TITULO: TFloatField;
    QRTitulosReparceladosCPNUM_PARCELA: TIntegerField;
    QRTitulosReparceladosCPDT_VENCIMENTO: TDateTimeField;
    QRTitulosReparceladosCPTB_CADASTROCOD_CADASTRO: TStringField;
    QRTitulosReparceladosCPDESC_ENDERECO: TStringField;
    QRTitulosReparceladosCPTB_CADASTRODESC_CIDADE: TStringField;
    QRTitulosReparceladosCPNUM_CGC_CPF: TStringField;
    QRTitulosReparceladosCPNUM_INSCRICAO: TStringField;
    QRTituloOriginalRep: TOracleDataSet1;
    QRTituloOriginalRepNUM_TITULO: TFloatField;
    QRTituloOriginalRepDT_EMISSAO: TDateTimeField;
    QRTituloOriginalRepSVALOR: TFloatField;
    QRTitulosReparceladosCPVAL_TITULO: TFloatField;
    procedure QrTitulosAPagar_ForCalcFields(DataSet: TDataSet);
    procedure QRTituloOriginalRepAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    SValTotal: Double;
  end;

var
  DMContasPagarRel: TDMContasPagarRel;

implementation

uses UOracle_cl;

{$R *.dfm}

procedure TDMContasPagarRel.QrTitulosAPagar_ForCalcFields(
  DataSet: TDataSet);
begin
  QRTitulosApagar_ForVal_Desc_Pontualidade.Value := 0;
  QRTitulosApagar_ForVal_Desc_Antecipacao.Value := 0;
  If QRTitulosApagar_ForPerc_Desc_Pontualidade.Value <> 0 then
    If QRTitulosApagar_ForDt_Vencimento.Value >= Date Then
       QRTitulosApagar_ForVal_Desc_Pontualidade.Value := Trunc((QRTitulosApagar_ForVal_Titulo.Value * QRTitulosApagar_ForPerc_Desc_Pontualidade.Value / 100) * 100) / 100;
  If QRTitulosApagar_ForPerc_Desc_Antecipacao.Value <> 0 then
    If QRTitulosApagar_ForDt_Vencimento.Value > Date Then                                                                                                                      // a grasiela falou que é sempre 30 dias
       QRTitulosApagar_ForVal_Desc_Antecipacao.Value := Trunc(
                               (QRTitulosApagar_ForVal_Titulo.Value - QRTitulosApagar_ForVal_Desc_Pontualidade.Value) *
                               ((QRTitulosApagar_ForDt_Vencimento.Value - QRTitulosApagar_ForDt_Referencia.Value)
                               * QRTitulosApagar_ForPerc_Desc_Antecipacao.Value / 30 / 100) * 100) / 100;
  QRTitulosApagar_ForVal_Saldo_Titulo.Value := QRTitulosApagar_ForVal_Titulo.Value  -
                                               QRTitulosApagar_ForVal_Desc_Antecipacao.Value -
                                               QRTitulosApagar_ForVal_Desc_Pontualidade.Value;
  QRTitulosApagar_ForDesc_Banco_Agencia.Value:=QRTitulosApagar_ForCOD_BANCO_AGENCIA.Text + '-'+DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO = '+FloatToStr(QRTitulosApagar_ForCOD_BANCO_AGENCIA.Value),True);
end;

procedure TDMContasPagarRel.QRTituloOriginalRepAfterOpen(
  DataSet: TDataSet);
begin
  SValTotal := 0;
  while not QRTituloOriginalRep.Eof do
  begin
    SValTotal := SValTotal + QRTituloOriginalRepSVALOR.Value;
    QRTituloOriginalRep.Next;
  end

end;

end.
