unit URomaneioRel_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMRomaneioRel = class(TDataModule)
    QRControleSojaRRAnalitico: TOracleDataSet1;
    QRControleSojaRRAnaliticoCOD_NOTA_CAB: TIntegerField;
    QRControleSojaRRAnaliticoDT_EMISSAO: TDateTimeField;
    QRControleSojaRRAnaliticoNUM_NOTA: TIntegerField;
    QRControleSojaRRAnaliticoDESC_PRODUTO: TStringField;
    QRControleSojaRRAnaliticoQT_QUANTIDADE: TFloatField;
    QRControleSojaRRAnaliticoQT_CREDITO_TRANSGENICOS: TFloatField;
    QRControleSojaRRAnaliticoVAL_UNITARIO: TFloatField;
    QRControleSojaRRAnaliticoVAL_TOTAL: TFloatField;
    QRControleSojaRRAnaliticoVAL_BASE_DPI: TFloatField;
    QRControleSojaRRAnaliticoPERC_DPI_TRANSGENICOS: TFloatField;
    QRControleSojaRRAnaliticoCOD_PRODUTO: TFloatField;
    QRControleSojaRRAnaliticoCOD_CADASTRO: TIntegerField;
    QRControleSojaRRAnaliticoCOD_OPERACAO: TIntegerField;
    QRControleSojaRRSintetico: TOracleDataSet1;
    QRControleSojaRRSinteticoDESC_PRODUTO: TStringField;
    QRControleSojaRRSinteticoCOD_PRODUTO: TFloatField;
    QRControleSojaRRSinteticoQT_QUANTIDADE: TFloatField;
    QRControleSojaRRSinteticoReceb: TOracleDataSet1;
    QRControleSojaRRSinteticoRecebDESC_TIPO_SOJICULTOR: TStringField;
    QRControleSojaRRSinteticoRecebQT_QUANTIDADE: TFloatField;
    QRControleSojaRRSinteticoRecebQT_CREDITO_TRANSGENICOS: TFloatField;
    QRControleSojaRRSinteticoRecebVAL_TOTAL: TFloatField;
    QRControleSojaRRSinteticoRecebVAL_DPI_TRANSGENICOS: TFloatField;
    QRControleSojaRRAnaliticoVAL_DPI: TFloatField;
    QRControleSojaRRFitasSintetico: TOracleDataSet1;
    QRControleSojaRRFitasSinteticoDESC_RESULTADO: TStringField;
    QRControleSojaRRFitasSinteticoNUM_TESTE: TFloatField;
    QRControleSojaRRSinteticoInvent: TOracleDataSet1;
    QRControleSojaRRSinteticoInventQT_QUANTIDADE: TFloatField;
    QRFechamentoComparativo: TOracleDataSet1;
    QRFechamentoComparativoCOD_PRODUTO: TFloatField;
    QRFechamentoComparativoDESC_PRODUTO: TStringField;
    QRFechamentoComparativoDT_EMISSAO: TDateTimeField;
    QRFechamentoComparativoNUM_NOTA: TIntegerField;
    QRFechamentoComparativoVAL_PRECO: TFloatField;
    QRFechamentoComparativoQT_TOTAL: TFloatField;
    QRFechamentoComparativoVAL_TOTAL_NOTA: TFloatField;
    QRFechamentoComparativoVAL_UNITARIO_NOTA: TFloatField;
    QRFechamentoComparativoCOD_FILIAL: TFloatField;
    QRFechamentoComparativoVAL_TOTAL_DIA: TFloatField;
    QRFechamentoComparativodesc_filial: TStringField;
    QRFechamentoComparativoNOME: TStringField;
    QRFechamentoComparativoNUM_EMBALAGEM: TFloatField;
    QRPosicaoCompradaVendida: TOracleDataSet1;
    QRPosicaoCompradaVendidaval_preco: TFloatField;
    QRPosicaoCompradaVendidaval_total: TFloatField;
    QRPosicaoCompradaVendidaDESC_POSICAO: TStringField;
    QRPosicaoCompradaVendidaDESC_TIPO: TStringField;
    QRPosicaoCompradaVendidaCOD_PRODUTO: TFloatField;
    QRPosicaoCompradaVendidaCOD_LOTE_TIPO: TFloatField;
    QRPosicaoCompradaVendidaCOD_FILIAL: TFloatField;
    QRPosicaoCompradaVendidaDESC_FILIAL: TStringField;
    QRPosicaoCompradaVendidaDESC_PRODUTO: TStringField;
    QRPosicaoCompradaVendidaNUM_EMBALAGEM: TFloatField;
    QRPosicaoCompradaVendidaSQUANTIDADE: TFloatField;
    QRPosicaoCompradaVendidaCOD_CIDADE: TFloatField;
    QRPosicaoCompradaVendidaCOD_CLASSE: TFloatField;
    QRFechamentoComparativoind_baixa_por_contrato: TStringField;
    QRFechamentoComparativoCOD_CONTRATO_GP_MOV: TIntegerField;
    QRFechamentoComparativoCOD_CONTRATO_MOV: TIntegerField;
    QRPosicaoCompradaVendida_Res: TOracleDataSet1;
    QRPosicaoCompradaVendida_ResDESC_POSICAO: TStringField;
    QRPosicaoCompradaVendida_ResDESC_TIPO: TStringField;
    QRPosicaoCompradaVendida_ResDESC_PRODUTO: TStringField;
    QRPosicaoCompradaVendida_ResSQUANTIDADE: TFloatField;
    QRPosicaoCompradaVendida_ResSVAL_TOTAL: TFloatField;
    QRResumoPosicaoCereais: TOracleDataSet1;
    QRResumoPosicaoCereaisSVAL_FISICA: TFloatField;
    QRResumoPosicaoCereaisSVAL_FUTURA: TFloatField;
    QRResumoPosicaoCereaisDESC_POSICAO: TStringField;
    QRSaldoFixar_Sintetico: TOracleDataSet1;
    QRSaldoFixar_SinteticoCOD_FILIAL: TFloatField;
    QRSaldoFixar_SinteticoCOD_PRODUTO: TFloatField;
    QRSaldoFixar_SinteticoDESC_PRODUTO: TStringField;
    QRSaldoFixar_SinteticoSCONSUMO: TFloatField;
    QRSaldoFixar_SinteticoSAFIXAR: TFloatField;
    QRSaldoFixar_SinteticoSVALORAFIXAR: TFloatField;
    QRSaldoFixar_SinteticoSQT_FIXAR: TFloatField;
    QRSaldoFixar_SinteticoSQT_FIXADO: TFloatField;
    QRSaldoFixar_Sinteticodesc_filial: TStringField;
    QRFechamentoComparativoIND_BAIXA_CONTRATO_CF: TStringField;
    QrPosicaoCompradaVendida_Mes: TOracleDataSet1;
    QrPosicaoCompradaVendida_MesDESC_POSICAO: TStringField;
    QrPosicaoCompradaVendida_MesDESC_TIPO: TStringField;
    QrPosicaoCompradaVendida_MesDESC_MES_ORDENAR: TStringField;
    QrPosicaoCompradaVendida_MesDESC_PRODUTO: TStringField;
    QrPosicaoCompradaVendida_MesSQUANTIDADE: TFloatField;
    QrPosicaoCompradaVendida_MesSVAL_TOTAL: TFloatField;
    QRControleSojaRRAnaliticoIND_SOJICULTOR_PARTICIPANTE: TStringField;
    QRControleSojaRRAnaliticoNOME: TStringField;
    QRControleSojaRRAnaliticoqt_compra_com_dpi: TFloatField;
    QRControleSojaRRAnaliticoqt_compra_participante: TFloatField;
    QRControleSojaRRAnaliticoqt_compra_com_credito: TFloatField;
    QRControleSojaRR: TOracleDataSet1;
    QRControleSojaRRDESC_PRODUTO: TStringField;
    QRControleSojaRRCOD_PRODUTO: TFloatField;
    QRControleSojaRRNOME: TStringField;
    QRControleSojaRRNUM_CGC_CPF: TStringField;
    QRControleSojaRRCOD_CADASTRO: TIntegerField;
    QRControleSojaRRIND_SOJICULTOR_PARTICIPANTE: TStringField;
    QRControleSojaRRCOD_OPERACAO: TIntegerField;
    QRControleSojaRRDESC_OPERACAO: TStringField;
    QRControleSojaRRQT_QUANTIDADE_ENTRADA: TFloatField;
    QRControleSojaRRQT_QUANTIDADE_SAIDA: TFloatField;
    QRControleSojaRRdesc_tipo_produtor: TStringField;
    QRControleSojaRRAnaliticoDT_RECEBIMENTO: TDateTimeField;
    QRControleSojaRRAnaliticoIND_FISICA_JURIDICA: TStringField;
    QRControleSojaRRAnaliticoNUM_CGC_CPF: TStringField;
    QRPrecoMedioCidade: TOracleDataSet1;
    QRPrecoMedioCidadeDT_EMISSAO: TDateTimeField;
    QRPrecoMedioCidadeNOME: TStringField;
    QRPrecoMedioCidadeVAL_TOTAL: TFloatField;
    QRPrecoMedioCidadeQT_QUANTIDADE: TFloatField;
    QRPrecoMedioCidadeCOD_ESTADO: TStringField;
    QRPrecoMedioCidadeDESC_CIDADE: TStringField;
    QRPrecoMedioCidadeVL_PRECO_MEDIO: TFloatField;
    QRPrecoMedioCidadePERC_RENDA: TFloatField;
    QRRomPesoIndiceRenda: TOracleDataSet1;
    QRRomPesoIndiceRendaDESC_PLACA: TStringField;
    QRRomPesoIndiceRendaDT_EMISSAO: TDateTimeField;
    QRRomPesoIndiceRendaPERC_RENDA: TFloatField;
    QRRomPesoIndiceRendaQT_PESO_BRUTO: TIntegerField;
    QRRomPesoIndiceRendaQT_TARA: TIntegerField;
    QRRomPesoIndiceRendaPERC_DESCONTO: TFloatField;
    QRRomPesoIndiceRendaCOD_ROMANEIO_AGRICOLA: TIntegerField;
    QRRomPesoIndiceRendaCOD_PRODUTO: TFloatField;
    QRRomPesoIndiceRendaCOD_CADASTRO: TIntegerField;
    QRRomPesoIndiceRendaCOD_FILIAL: TIntegerField;
    QRRomPesoIndiceRendaNUM_ROMANEIO: TIntegerField;
    QRRomPesoIndiceRendaPERC_UMIDADE: TFloatField;
    QRRomPesoIndiceRendaPERC_ARDIDOS: TFloatField;
    QRRomPesoIndiceRendaPERC_IMPUREZA: TFloatField;
    QRRomPesoIndiceRendaDESC_OBSERVACAO: TStringField;
    QRRomPesoIndiceRendaDT_MOVIMENTO: TDateTimeField;
    QRRomPesoIndiceRendaPERC_AVARIADO: TFloatField;
    QRRomPesoIndiceRendaNUM_CLASSIFICACAO: TIntegerField;
    QRRomPesoIndiceRendaNUM_TICKET: TIntegerField;
    QRRomPesoIndiceRendaPERC_DIVERSOS: TFloatField;
    QRRomPesoIndiceRendaNUM_NOTA_PRODUTOR: TIntegerField;
    QRRomPesoIndiceRendaIND_EMITIDO: TStringField;
    QRRomPesoIndiceRendaPERC_QUEBRADOS: TFloatField;
    QRRomPesoIndiceRendaPERC_TRIGUILHO: TFloatField;
    QRRomPesoIndiceRendaPERC_PH: TFloatField;
    QRRomPesoIndiceRendaPERC_QUEBRADOS_ARROZ: TFloatField;
    QRRomPesoIndiceRendaPERC_INTEIROS_ARROZ: TFloatField;
    QRRomPesoIndiceRendaCOD_USUARIO: TIntegerField;
    QRRomPesoIndiceRendaNUM_ARMAZEM: TIntegerField;
    QRRomPesoIndiceRendaIND_SITUACAO: TStringField;
    QRRomPesoIndiceRendaIND_TIPO_ROMANEIO: TStringField;
    QRRomPesoIndiceRendaCOD_MENSAGEM: TIntegerField;
    QRRomPesoIndiceRendaDT_ANO_SAFRA: TStringField;
    QRRomPesoIndiceRendaPERC_TOLERA_ARDIDOS: TFloatField;
    QRRomPesoIndiceRendaPERC_TOLERA_IMPUREZA: TFloatField;
    QRRomPesoIndiceRendaPERC_TOLERA_AVARIADO: TFloatField;
    QRRomPesoIndiceRendaNUM_AMOSTRA: TIntegerField;
    QRRomPesoIndiceRendaCOD_CADASTRO_PARCEIRO: TIntegerField;
    QRRomPesoIndiceRendaVAL_PESAGEM: TFloatField;
    QRRomPesoIndiceRendaCOD_BALANCA: TIntegerField;
    QRRomPesoIndiceRendaNOME_MOTORISTA: TStringField;
    QRRomPesoIndiceRendaDESC_PLACA_CARRETA1: TStringField;
    QRRomPesoIndiceRendaDESC_PLACA_CARRETA2: TStringField;
    QRRomPesoIndiceRendaCOD_TRANSPORTADORA: TIntegerField;
    QRRomPesoIndiceRendaDT_EMISSAO_NOTA: TDateTimeField;
    QRRomPesoIndiceRendaQT_PESO_NOTA: TIntegerField;
    QRRomPesoIndiceRendaIND_COMPLEMENTO_PESO: TStringField;
    QRRomPesoIndiceRendaDT_PRIMEIRA_PESAGEM: TDateTimeField;
    QRRomPesoIndiceRendaDT_SEGUNDA_PESAGEM: TDateTimeField;
    QRRomPesoIndiceRendaCOD_CONTRATO_VEND: TIntegerField;
    QRRomPesoIndiceRendaCOD_CONTRATO_PJURIDICA: TIntegerField;
    QRRomPesoIndiceRendaCOD_NOTA_CAB: TIntegerField;
    QRRomPesoIndiceRendaCOD_TALHAO: TIntegerField;
    QRRomPesoIndiceRendaCOD_OPERACAO: TIntegerField;
    QRRomPesoIndiceRendaIND_CONDICAO_PAGTO: TStringField;
    QRRomPesoIndiceRendaVAL_DESPESAS: TFloatField;
    QRRomPesoIndiceRendaVAL_PRECO_VENDA: TFloatField;
    QRRomPesoIndiceRendaPERC_BENEFICIADO: TFloatField;
    QRRomPesoIndiceRendaPERC_QUEBRADO_ARROZ: TFloatField;
    QRRomPesoIndiceRendaPERC_INTEIRO_ARROZ: TFloatField;
    QRRomPesoIndiceRendaDT_VENCTO: TDateTimeField;
    QRRomPesoIndiceRendaVL_FRETE: TFloatField;
    QRRomPesoIndiceRendaDT_VENCTO_FRETE: TDateTimeField;
    QRRomPesoIndiceRendaCOD_ARRANQUIO: TIntegerField;
    QRRomPesoIndiceRendaVL_ARRANQUIO: TFloatField;
    QRRomPesoIndiceRendaDT_VENCTO_ARRANQUIO: TDateTimeField;
    QRRomPesoIndiceRendaCOD_OBRA: TIntegerField;
    QRRomPesoIndiceRendaCOD_OBRA_REQ_CAB: TIntegerField;
    QRRomPesoIndiceRendapesoliquido: TFloatField;
    QRRomPesoIndiceRendaindice: TFloatField;
    QRSaldoFixar_SinteticoSAFIXAR_SACAS: TFloatField;
    QREmissaoRomaneio: TOracleDataSet1;
    QREmissaoRomaneioCOD_ROMANEIO_AGRICOLA: TIntegerField;
    QREmissaoRomaneioCOD_PRODUTO: TFloatField;
    QREmissaoRomaneioCOD_USUARIO: TIntegerField;
    QREmissaoRomaneioCOD_CADASTRO_ROMANEIO: TIntegerField;
    QREmissaoRomaneioCOD_MENSAGEM: TIntegerField;
    QREmissaoRomaneioCOD_FILIAL: TIntegerField;
    QREmissaoRomaneioCOD_BALANCA: TIntegerField;
    QREmissaoRomaneioNUM_ROMANEIO: TIntegerField;
    QREmissaoRomaneioDT_EMISSAO: TDateTimeField;
    QREmissaoRomaneioQT_PESO_BRUTO: TIntegerField;
    QREmissaoRomaneioQT_TARA: TIntegerField;
    QREmissaoRomaneioPESOBALANCA: TFloatField;
    QREmissaoRomaneioDT_PRIMEIRA_PESAGEM: TDateTimeField;
    QREmissaoRomaneioDT_SEGUNDA_PESAGEM: TDateTimeField;
    QREmissaoRomaneioDESC_PLACA: TStringField;
    QREmissaoRomaneioPERC_UMIDADE: TFloatField;
    QREmissaoRomaneioPERC_ARDIDOS: TFloatField;
    QREmissaoRomaneioPERC_TOLERA_ARDIDOS: TFloatField;
    QREmissaoRomaneioPERC_IMPUREZA: TFloatField;
    QREmissaoRomaneioPERC_TOLERA_IMPUREZA: TFloatField;
    QREmissaoRomaneioPERC_DESCONTO: TFloatField;
    QREmissaoRomaneioDESC_OBSERVACAO: TStringField;
    QREmissaoRomaneioDT_MOVIMENTO: TDateTimeField;
    QREmissaoRomaneioPERC_AVARIADO: TFloatField;
    QREmissaoRomaneioPERC_TOLERA_AVARIADO: TFloatField;
    QREmissaoRomaneioNUM_CLASSIFICACAO: TIntegerField;
    QREmissaoRomaneioNUM_TICKET: TIntegerField;
    QREmissaoRomaneioPERC_DIVERSOS: TFloatField;
    QREmissaoRomaneioNUM_NOTA_PRODUTOR: TIntegerField;
    QREmissaoRomaneioIND_EMITIDO: TStringField;
    QREmissaoRomaneioIND_TIPO_ROMANEIO: TStringField;
    QREmissaoRomaneioIND_SITUACAO: TStringField;
    QREmissaoRomaneioPERC_QUEBRADOS: TFloatField;
    QREmissaoRomaneioPERC_TRIGUILHO: TFloatField;
    QREmissaoRomaneioPERC_PH: TFloatField;
    QREmissaoRomaneioPERC_BENEFICIADO: TFloatField;
    QREmissaoRomaneioPERC_INTEIRO_ARROZ: TFloatField;
    QREmissaoRomaneioPERC_QUEBRADO_ARROZ: TFloatField;
    QREmissaoRomaneioNUM_AMOSTRA: TIntegerField;
    QREmissaoRomaneioVAL_PESAGEM: TFloatField;
    QREmissaoRomaneioVAL_PRECO_VENDA: TFloatField;
    QREmissaoRomaneioNOME_MOTORISTA: TStringField;
    QREmissaoRomaneioCOD_CONTRATO_VEND: TIntegerField;
    QREmissaoRomaneioCOD_CONTRATO_PJURIDICA: TIntegerField;
    QREmissaoRomaneioPERC_RENDA: TFloatField;
    QREmissaoRomaneioCOD_ARRANQUIO: TIntegerField;
    QREmissaoRomaneioCOD_TRANSPORTADORA: TIntegerField;
    QREmissaoRomaneioCOD_OBRA: TIntegerField;
    QREmissaoRomaneioVL_ARRANQUIO: TFloatField;
    QREmissaoRomaneioVL_FRETE: TFloatField;
    QREmissaoRomaneioDT_VENCTO: TDateTimeField;
    QREmissaoRomaneioDT_VENCTO_FRETE: TDateTimeField;
    QREmissaoRomaneioDT_VENCTO_ARRANQUIO: TDateTimeField;
    QREmissaoRomaneioCOD_CADASTRO: TIntegerField;
    QREmissaoRomaneioPERC_RATEIO: TFloatField;
    QREmissaoRomaneioQT_RATEIO: TIntegerField;
    QREmissaoRomaneioIND_ORDEM: TIntegerField;
    QREmissaoRomaneioESTADO_CADASTRO: TStringField;
    QREmissaoRomaneioNOME: TStringField;
    QREmissaoRomaneioCGC_CPF_CLIENTE: TStringField;
    QREmissaoRomaneioNUM_INSCRICAO_CLIENTE: TStringField;
    QREmissaoRomaneioENDERECO_CADASTRO: TStringField;
    QREmissaoRomaneioCIDADE_CADASTRO: TStringField;
    QREmissaoRomaneioNUM_INSCRICAO: TStringField;
    QREmissaoRomaneioDESC_FILIAL: TStringField;
    QREmissaoRomaneioCIDADE_FILIAL: TStringField;
    QREmissaoRomaneioENDERECO_FILIAL: TStringField;
    QREmissaoRomaneioBAIRRO_FILIAL: TStringField;
    QREmissaoRomaneioNUM_CGC: TStringField;
    QREmissaoRomaneioDESC_INSCRICAO: TStringField;
    QREmissaoRomaneioDESC_TELEFONE: TStringField;
    QREmissaoRomaneioESTADO_FILIAL: TStringField;
    QREmissaoRomaneioDESC_PRODUTO: TStringField;
    QREmissaoRomaneioNUM_EMBALAGEM: TFloatField;
    QREmissaoRomaneioNUM_CONVERTE_FARDO: TFloatField;
    QREmissaoRomaneioIND_CESTA_BASICA: TStringField;
    QREmissaoRomaneioNUM_VOLUMES: TFloatField;
    QREmissaoRomaneioDESC_UNIDADE: TStringField;
    QREmissaoRomaneioDESC_PLACA_CARRETA: TStringField;
    QREmissaoRomaneioDESCONTOS: TFloatField;
    QREmissaoRomaneioPESO_LIQUIDO: TFloatField;
    QREmissaoRomaneiodesc_mensagem_fitas: TStringField;
    QREmissaoRomaneiodesc_usuario: TStringField;
    QREmissaoRomaneioIMG_PESAGEM_ENTRADA: TBlobField;
    QREmissaoRomaneioIMG_PESAGEM_ENTRADA_2: TBlobField;
    QREmissaoRomaneioIMG_PESAGEM_SAIDA: TBlobField;
    QREmissaoRomaneioIMG_PESAGEM_SAIDA_2: TBlobField;
    QREmissaoRomaneioDESC_CONTRATO: TStringField;
    QREmissaoRomaneioDESC_MENSAGEM: TStringField;
    procedure QRFechamentoComparativoCalcFields(DataSet: TDataSet);
    procedure QRPosicaoCompradaVendidaCalcFields(DataSet: TDataSet);
    procedure QRSaldoFixar_SinteticoCalcFields(DataSet: TDataSet);
    procedure QRControleSojaRRAnaliticoCalcFields(DataSet: TDataSet);
    procedure QRControleSojaRRCalcFields(DataSet: TDataSet);
    procedure QRRomPesoIndiceRendaCalcFields(DataSet: TDataSet);
    Procedure CalculoDesconto(wPeso_Produto,
                              wPerc_Desconto,
                              wArdidos,
                              wUmidade,
                              wImpureza,
                              wAvariado,
                              wQuebrados,
                              wDiversos,
                              wCodRomaneio,
                              wCodProduto,
                              wTriguilho,
                              wTolera_Ardido,
                              wTolera_Impureza,
                              wTolera_Avariado,
                              wBeneficiado:real;
                              var wQtLiquido,
                              wQtDesconto:real);
    procedure QREmissaoRomaneioCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMRomaneioRel: TDMRomaneioRel;

implementation

uses UOracle_cl, UPrecoAgricola_cl, UPrecoCidadeClasse_cl;

{$R *.DFM}

procedure TDMRomaneioRel.QRFechamentoComparativoCalcFields(
  DataSet: TDataSet);
begin
  If QRFechamentoComparativoCod_Filial.Value > 20 Then
     QRFechamentoComparativoDesc_Filial.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+QRFechamentoComparativoCod_Filial.Text,True)
  Else
     QRFechamentoComparativoDesc_Filial.Value := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+QRFechamentoComparativoCod_Filial.Text,True);
  // indica se a nota foi realizada por baixa de contrato no agricola (contrato garantia preco ou contrato compra futura)
  If (QRFechamentoComparativoCOD_CONTRATO_GP_MOV.Text = '') And (QRFechamentoComparativoCOD_CONTRATO_MOV.Text = '') AND (QRFechamentoComparativoIND_BAIXA_CONTRATO_CF.Value = 'N') Then
     QRFechamentoComparativoind_baixa_por_contrato.Value := 'Não'
  Else
     QRFechamentoComparativoind_baixa_por_contrato.Value := 'Sim';
end;

procedure TDMRomaneioRel.QRPosicaoCompradaVendidaCalcFields(
  DataSet: TDataSet);
begin
  If (QRPosicaoCompradaVendidaDesc_Tipo.Value = 'A Fixar em C/C') Or
     (QRPosicaoCompradaVendidaDesc_Tipo.Value = 'Estoque Armazens') Then
   Begin
     DMPrecoAgricola.QPrecoAgricola_Cons.Close;
     DMPrecoAgricola.QPrecoAgricola_Cons.SetVariable('Cod_Filial',QRPosicaoCompradaVendidaCod_Filial.Value);
     DMPrecoAgricola.QPrecoAgricola_Cons.SetVariable('COD_PRODUTO',QRPosicaoCompradaVendidaCod_Produto.Value);
     DMPrecoAgricola.QPrecoAgricola_Cons.SetVariable('COD_LOTE_TIPO',QRPosicaoCompradaVendidaCod_Lote_Tipo.Value);
     DMPrecoAgricola.QPrecoAgricola_Cons.SetVariable('DT_PRECO_AGRICOLA',Date);
     DMPrecoAgricola.QPrecoAgricola_Cons.Open;
     If Not(DMPrecoAgricola.QPrecoAgricola_Cons.Eof) Then
      Begin
        QRPosicaoCompradaVendidaVal_Preco.Value := DMPrecoAgricola.QPrecoAgricola_ConsVal_Preco.Value;
        QRPosicaoCompradaVendidaVal_Total.Value := DMPrecoAgricola.QPrecoAgricola_ConsVal_Preco.Value * QRPosicaoCompradaVendidaSQUANTIDADE.Value / QRPosicaoCompradaVendidaNum_Embalagem.Value ;
      End;
   End
  Else
   Begin
     DMPrecoCidadeClasse.QPrecoCidadeClasseCons.Close;
     DMPrecoCidadeClasse.QPrecoCidadeClasseCons.SetVariable('COD_CIDADE',QRPosicaoCompradaVendidaCod_Cidade.Value);
     DMPrecoCidadeClasse.QPrecoCidadeClasseCons.SetVariable('COD_CLASSE',QRPosicaoCompradaVendidaCod_classe.Value);
     DMPrecoCidadeClasse.QPrecoCidadeClasseCons.SetVariable('DATA',Date);
     DMPrecoCidadeClasse.QPrecoCidadeClasseCons.Open;
     If not(DMPrecoCidadeClasse.QPrecoCidadeClasseCons.Eof) Then
      Begin
        QRPosicaoCompradaVendidaVal_Preco.Value := DMPrecoCidadeClasse.QPrecoCidadeClasseConsVal_Preco.Value;
        QRPosicaoCompradaVendidaVal_Total.Value := DMPrecoCidadeClasse.QPrecoCidadeClasseConsVal_Preco.Value * QRPosicaoCompradaVendidaSQUANTIDADE.Value / QRPosicaoCompradaVendidaNum_Embalagem.Value ;
      End;
   End;
end;

procedure TDMRomaneioRel.QRSaldoFixar_SinteticoCalcFields(
  DataSet: TDataSet);
Var wDescricao : String;
begin
  wDescricao := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+QRSaldoFixar_SinteticoCod_Filial.Text,True);
  If wDescricao = ''  Then
     wDescricao := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+QRSaldoFixar_SinteticoCod_Filial.Text,True);
  QRSaldoFixar_SinteticoDesc_Filial.Value := wDescricao;   
end;

procedure TDMRomaneioRel.QRControleSojaRRAnaliticoCalcFields(
  DataSet: TDataSet);
begin
  If QRControleSojaRRAnaliticoIND_SOJICULTOR_PARTICIPANTE.Value = 'PAR' Then
     QRControleSojaRRAnaliticoqt_compra_participante.Value := QRControleSojaRRAnaliticoQT_QUANTIDADE.Value// - QRControleSojaRRAnaliticoQT_CREDITO_TRANSGENICOS.Value //Alterado 05/06/2009, pedido de Vilson Posamai (Moinho)
  Else
     QRControleSojaRRAnaliticoqt_compra_participante.Value := 0;
  If QRControleSojaRRAnaliticoVAL_DPI.Value > 0 Then
     QRControleSojaRRAnaliticoqt_Compra_com_Dpi.Value := QRControleSojaRRAnaliticoQT_QUANTIDADE.Value - QRControleSojaRRAnaliticoqt_compra_participante.Value - QRControleSojaRRAnaliticoQT_CREDITO_TRANSGENICOS.Value  //Alterado 05/06/2009, pedido de Vilson Posamai (Moinho)
  Else
     QRControleSojaRRAnaliticoqt_Compra_com_Dpi.Value := 0;
  If QRControleSojaRRAnaliticoQT_CREDITO_TRANSGENICOS.Value > 0 Then
     QRControleSojaRRAnaliticoqt_compra_com_credito.Value := {QRControleSojaRRAnaliticoQT_QUANTIDADE.Value - }QRControleSojaRRAnaliticoQT_CREDITO_TRANSGENICOS.Value //Alterado 05/06/2009, pedido de Vilson Posamai (Moinho)
  Else
     QRControleSojaRRAnaliticoqt_compra_com_credito.Value := 0;
end;

procedure TDMRomaneioRel.QRControleSojaRRCalcFields(DataSet: TDataSet);
begin
  If QRControleSojaRRIND_SOJICULTOR_PARTICIPANTE.Value = 'PAR' Then
     QRControleSojaRRdesc_tipo_Produtor.Value := 'PARTICIPANTE'
  Else
    If QRControleSojaRRIND_SOJICULTOR_PARTICIPANTE.Value = 'SOJ' Then
       QRControleSojaRRdesc_tipo_Produtor.Value := 'SOJICULTOR'
    Else
      If QRControleSojaRRIND_SOJICULTOR_PARTICIPANTE.Value = 'NAO' Then
         QRControleSojaRRdesc_tipo_Produtor.Value := 'NAO PARTICIPANTE';

end;

procedure TDMRomaneioRel.QRRomPesoIndiceRendaCalcFields(DataSet: TDataSet);
var
wLiquido,wDesconto : Real;
begin
  CalculoDesconto( (QRRomPesoIndiceRendaQT_PESO_BRUTO.Value-QRRomPesoIndiceRendaQT_TARA.Value),
                    QRRomPesoIndiceRendaPerc_desconto.Value,
                    QRRomPesoIndiceRendaPerc_ardidos.Value,
                    QRRomPesoIndiceRendaPerc_Umidade.Value,
                    QRRomPesoIndiceRendaPerc_Impureza.Value,
                    QRRomPesoIndiceRendaPerc_Avariado.Value,
                    QRRomPesoIndiceRendaPerc_Quebrados.Value,
                    QRRomPesoIndiceRendaPerc_Diversos.Value,
                    QRRomPesoIndiceRendaCod_Romaneio_Agricola.Value,
                    QRRomPesoIndiceRendaCod_Produto.Value,
                    QRRomPesoIndiceRendaPerc_Triguilho.Value,
                    QRRomPesoIndiceRendaPerc_Tolera_Ardidos.Value,
                    QRRomPesoIndiceRendaPerc_Tolera_Impureza.Value,
                    QRRomPesoIndiceRendaPerc_Tolera_Avariado.Value,
                    QRRomPesoIndiceRendaPerc_Beneficiado.Value,
                    wLiquido, wDesconto);

  QRRomPesoIndiceRendapesoliquido.Value := wLiquido;
  QRRomPesoIndiceRendaindice.Value := QRRomPesoIndiceRendaPERC_RENDA.Value * wLiquido;
end;

Procedure TDMRomaneioRel.CalculoDesconto(wPeso_Produto,
                                              wPerc_Desconto,
                                              wArdidos,
                                              wUmidade,
                                              wImpureza,
                                              wAvariado,
                                              wQuebrados,
                                              wDiversos,
                                              wCodRomaneio,
                                              wCodProduto,
                                              wTriguilho,
                                              wTolera_Ardido,
                                              wTolera_Impureza,
                                              wTolera_Avariado,
                                              wBeneficiado : Real;
                                              var wQtLiquido,
                                              wQtDesconto : Real);
// Var wDesconto:String;
Var wPercDescLiquido : Real;
begin
{  With DMProdutoAgricola do
  Begin
    If QProdutoAgricolaCod_Produto.Value <> wCodProduto Then
    Begin
      QProdutoAgricola.Close;
      QProdutoAgricola.setVariable('PK',wCodProduto);
      QProdutoAgricola.Open;
    End;
  End;  }

//  wDesconto := DMOracle.Buscanome('SELECT PERC_DESCONTO FROM TB_ROMANEIO_AGRICOLA','COD_ROMANEIO_AGRICOLA ='+FloatToStr(wCodRomaneio));

  wQtDesconto := 0;
  if wPerc_Desconto > 0 then
     wQtDesconto := wQtDesconto + round(wPeso_Produto * wPerc_Desconto / 100);

  If ((wArdidos - wTolera_Ardido) > 0) Then
  Begin
    wPercDescLiquido := wArdidos - wTolera_Ardido;
    if (wPercDescLiquido >  0) then
       wQtDesconto := wQtDesconto + round(wPeso_Produto * wPercDescLiquido / 100);
  End;

  If ((wImpureza - wTolera_Impureza) > 0) Then
   Begin
     wPercDescLiquido := wImpureza - wTolera_Impureza;
     if wPercDescLiquido > 0 then
       wQtDesconto := wQtDesconto + round(wPeso_Produto * wPercDescLiquido / 100);
   End;

  If ((wAvariado - wTolera_Avariado) > 0) Then
   Begin
     wPercDescLiquido := wAvariado - wTolera_Avariado;
     if wPercDescLiquido > 0 then
       wQtDesconto := wQtDesconto + round(wPeso_Produto * wPercDescLiquido / 100);
   End;
  If wQuebrados > 0 then
     wQtDesconto := wQtDesconto + round(wPeso_Produto * wQuebrados / 100);
  If wDiversos > 0 then
     wQtDesconto := wQtDesconto + wDiversos;
  If wTriguilho > 0 then
     wQtDesconto := wQtDesconto + round(wPeso_Produto * wTriguilho / 100);
//  If wBeneficiado > 0 then
//     wQtDesconto := wQtDesconto + round(wPeso_Produto * (100 - wBeneficiado) / 100);   // O PERCENTUAL DE BENEFICIADO É QUANTO VAI ENTRAR NO ESTOQUE
  wQtLiquido := wPeso_Produto - round(wQtDesconto);
end;

procedure TDMRomaneioRel.QREmissaoRomaneioCalcFields(DataSet: TDataSet);
begin
  QREmissaoRomaneioDesc_Mensagem_Fitas.Value := 'Resultado Intacta: ' + DMOracle.Buscanome('SELECT IND_RESULTADO FROM TB_ROMANEIO_FITAS','COD_ROMANEIO_AGRICOLA ='+FloatToStr(QREmissaoRomaneioCod_Romaneio_Agricola.Value));
  QREmissaoRomaneiodesc_usuario.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_USUARIO', 'COD_USUARIO = ' + FloattoStr(QREmissaoRomaneioCOD_USUARIO.Value), True);
end;

end.
