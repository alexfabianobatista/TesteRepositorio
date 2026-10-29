unit Ucontrato_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste;

type
  TDMContrato = class(TDataModule)
    DSContrato: TDataSource;
    DSContrato_GP: TDataSource;
    DSContrato_Vend: TDataSource;
    DSContrato_Vend_Pagto: TDataSource;
    DSContratoGP_Mov: TDataSource;
    DSContratoMovAberto: TDataSource;
    DSContratoMovGP_Aberto: TDataSource;
    DSContratoVend_Nota: TDataSource;
    QMudaStatusItemNF: TOracleDataSet1;
    QRContrato_Venda: TOracleDataSet1;
    QRContrato_VendaCOD_CONTRATO_VEND: TIntegerField;
    QRContrato_VendaCOD_FILIAL: TIntegerField;
    QRContrato_VendaCOD_CADASTRO: TIntegerField;
    QRContrato_VendaCOD_PRODUTO: TIntegerField;
    QRContrato_VendaQT_QUANTIDADE: TFloatField;
    QRContrato_VendaDT_CONTRATO: TDateTimeField;
    QRContrato_VendaIND_RET_ENTR: TStringField;
    QRContrato_VendaDT_ENTREGA: TDateTimeField;
    QRContrato_VendaPRECO: TFloatField;
    QRContrato_VendaCOD_CORRETORA: TIntegerField;
    QRContrato_VendaDT_PAGTO: TDateTimeField;
    QRContrato_VendaPERC_COMISSAO: TFloatField;
    QRContrato_VendaCOD_CC: TIntegerField;
    QRContrato_VendaOBS: TStringField;
    QRContrato_VendaNUM_CONTRATO: TIntegerField;
    QRContrato_VendaCOD_CC_CORRETORA: TStringField;
    QRContrato_VendaIND_CONF: TStringField;
    QRContrato_VendaNUM_AGENCIA_CORRETORA: TStringField;
    QRContrato_VendaDESC_BANCO_CORRETORA: TStringField;
    QRContrato_VendaVAL_SALDO: TFloatField;
    QRContrato_VendaSALDO_NF_EMBARQUE: TFloatField;
    QRContrato_VendaDESC_FILIAL: TStringField;
    QRContrato_VendaNOME: TStringField;
    QRContrato_VendaNUM_EMBALAGEM: TFloatField;
    QContratoVend_Nota: TOracleDataSet1;
    QTotalNotaItem: TOracleDataSet1;
    QContrato_GP: TOracleDataSet1;
    QContrato_GPCOD_CONTRATO_GP: TIntegerField;
    QContrato_GPCOD_FILIAL: TIntegerField;
    QContrato_GPCOD_CADASTRO: TIntegerField;
    QContrato_GPCOD_PRODUTO: TIntegerField;
    QContrato_GPDT_SAFRA: TStringField;
    QContrato_GPIND_TIPO_BASE: TStringField;
    QContrato_GPDT_ENTREGA: TDateTimeField;
    QContrato_GPQT_QUANTIDADE: TFloatField;
    QContrato_GPDESC_ACONDICIONAMENTO: TStringField;
    QContrato_GPDT_PAGTO: TDateTimeField;
    QContrato_GPNUM_CONTRATO: TIntegerField;
    QContrato_GPPERC_FUNRURAL: TFloatField;
    QContrato_GPIND_SITUACAO: TStringField;
    QContrato_GPIND_CP: TIntegerField;
    QContrato_GPDT_CONTRATO: TDateTimeField;
    QContrato_GPLOCAL_ENTREGA: TStringField;
    QContrato_GPQTDE_SALDO: TFloatField;
    QContrato_GPDESC_OBSERVACAO: TStringField;
    QContrato_GPDT_VENCTO_PROMISSORIA: TDateTimeField;
    QContrato_GPVAL_PROMISSORIA: TFloatField;
    QContrato_VendMovDeleta_GP: TOracleDataSet1;
    QTotalNotaItemTOTAL_QUANTIDADE: TFloatField;
    QTotalNotaItemsaldo_disponivel: TFloatField;
    QContratoVend_NotaCOD_NOTA_ITEM: TIntegerField;
    QContratoVend_NotaCOD_NOTA_CAB: TIntegerField;
    QContratoVend_NotaQT_QUANTIDADE: TFloatField;
    QContratoVend_NotaVAL_TOTAL: TFloatField;
    QContratoVend_NotaCOD_PRODUTO: TFloatField;
    QContratoVend_NotaCOD_LOTE_TIPO: TIntegerField;
    QContratoVend_NotaVAL_UNITARIO: TFloatField;
    QContratoVend_NotaVAL_CUSTO: TFloatField;
    QContratoVend_NotaCOD_FILIAL: TIntegerField;
    QContratoVend_NotaNUM_NOTA: TIntegerField;
    QContratoVend_NotaDT_EMISSAO: TDateTimeField;
    QContasPagarMov_GP: TOracleDataSet1;
    QContasPagarMov_GPCOD_CONTA_PAGAR_MOV: TIntegerField;
    QContasPagarMov_GPCOD_CONTA_PAGAR_CAB: TIntegerField;
    QContasPagarMov_GPDT_MOVIMENTO: TDateTimeField;
    QContasPagarMov_GPVAL_MOVIMENTO: TFloatField;
    QContasPagarMov_GPDESC_OBSERVACAO: TStringField;
    QContasPagarMov_GPIND_TIPO_MOVIMENTO: TStringField;
    QContasPagarMov_GPDT_USUARIO: TDateTimeField;
    QContasPagarMov_GPCOD_USUARIO: TIntegerField;
    QContasPagarMov_GPCOD_BCO_MOVIMENTO: TIntegerField;
    QContasPagarMov_GPCOD_CAIXA_MOV: TIntegerField;
    QContasPagarMov_GPCOD_LANCTO_CONTABIL_CRED: TIntegerField;
    QContasPagarMov_GPCOD_LANCTO_CONTABIL_DEB: TIntegerField;
    QContasPagar_GP: TOracleDataSet1;
    QRContrato_GP: TOracleDataSet1;
    QRContrato_GPCOD_CONTRATO_GP: TIntegerField;
    QRContrato_GPCOD_FILIAL: TIntegerField;
    QRContrato_GPCOD_CADASTRO: TIntegerField;
    QRContrato_GPCOD_PRODUTO: TIntegerField;
    QRContrato_GPDT_SAFRA: TStringField;
    QRContrato_GPIND_TIPO_BASE: TStringField;
    QRContrato_GPDT_ENTREGA: TDateTimeField;
    QRContrato_GPDESC_ACONDICIONAMENTO: TStringField;
    QRContrato_GPDT_PAGTO: TDateTimeField;
    QRContrato_GPNUM_CONTRATO: TIntegerField;
    QRContrato_GPPERC_FUNRURAL: TFloatField;
    QRContrato_GPIND_SITUACAO: TStringField;
    QRContrato_GPIND_CP: TIntegerField;
    QRContrato_GPDT_CONTRATO: TDateTimeField;
    QRContrato_GPNOME: TStringField;
    QRContrato_GPDESC_FILIAL: TStringField;
    QRContrato_Vend: TOracleDataSet1;
    QRContrato_Vend_Pagto: TOracleDataSet1;
    QRContrato_Vend_PagtoCOD_CONTRATO_PGTO: TIntegerField;
    QRContrato_Vend_PagtoCOD_CONTRATO_VEND: TIntegerField;
    QRContrato_Vend_PagtoDT_PAGTO: TDateTimeField;
    QRContrato_Vend_PagtoVAL_PAGTO: TFloatField;
    QContrato_VendCons: TOracleDataSet1;
    QContratoVendAlt: TOracleDataSet1;
    QContratoVendAltCOD_CONTRATO_VEND: TIntegerField;
    QContratoVendAltQT_QUANTIDADE: TFloatField;
    QContratoVendAltDT_CONTRATO: TDateTimeField;
    QContratoVendAltDT_ENTREGA: TDateTimeField;
    QContratoVendAltNUM_CONTRATO: TIntegerField;
    QContratoVendAltVAL_SALDO: TFloatField;
    QContratoVendAltSALDO_NF_EMBARQUE: TFloatField;
    QContratoVendAltVAL_AJUSTE: TFloatField;
    QRContratoVenda_SaldoEmb: TOracleDataSet1;
    QContrato_GPCons: TOracleDataSet1;
    QRContratoC_Aberto: TOracleDataSet1;
    QRContratoC_AbertoCOD_CONTRATO: TIntegerField;
    QRContratoC_AbertoCOD_FILIAL: TIntegerField;
    QRContratoC_AbertoCOD_CADASTRO: TIntegerField;
    QRContratoC_AbertoIND_FIXAR: TIntegerField;
    QRContratoC_AbertoCOD_PRODUTO: TIntegerField;
    QRContratoC_AbertoQT_QUANTIDADE: TFloatField;
    QRContratoC_AbertoVAL_DOLAR: TFloatField;
    QRContratoC_AbertoIND_ICMS: TIntegerField;
    QRContratoC_AbertoDT_EMISSAO: TDateTimeField;
    QRContratoC_AbertoDT_ENTREGA: TDateTimeField;
    QRContratoC_AbertoDT_VENCIMENTO: TDateTimeField;
    QRContratoC_AbertoDESC_LOCAL_ENTREGA: TStringField;
    QRContratoC_AbertoDESC_ACONDICIONAMENTO: TStringField;
    QRContratoC_AbertoIND_FRETE: TStringField;
    QRContratoC_AbertoPERC_FUNRURAL: TFloatField;
    QRContratoC_AbertoDT_ANO_SAFRA: TStringField;
    QRContratoC_AbertoIND_TIPO_SAFRA: TStringField;
    QRContratoC_AbertoTIPO_BASE: TStringField;
    QRContratoC_AbertoCOD_AVALISTA: TIntegerField;
    QRContratoC_AbertoPRECO: TFloatField;
    QRContratoC_AbertoNUM_CONTRATO: TIntegerField;
    QRContratoC_AbertoIND_CP: TIntegerField;
    QRContratoC_AbertoIND_SITUACAO: TStringField;
    QRContratoC_AbertoNUM_EMBALAGEM: TFloatField;
    QRContratoC_AbertoNOME: TStringField;
    QRContratoC_Abertoval_unitario: TFloatField;
    QRContratoC_Abertovalor_saldo: TFloatField;
    QRContrato_Vend_Contabil: TOracleDataSet1;
    QRContratoVend_Aberto: TOracleDataSet1;
    QRContratoGP_Aberto: TOracleDataSet1;
    QRContrato: TOracleDataSet1;
    QContrato: TOracleDataSet1;
    QContratoCOD_CONTRATO: TIntegerField;
    QContratoCOD_FILIAL: TIntegerField;
    QContratoCOD_CADASTRO: TIntegerField;
    QContratoIND_FIXAR: TIntegerField;
    QContratoCOD_PRODUTO: TIntegerField;
    QContratoVAL_DOLAR: TFloatField;
    QContratoIND_ICMS: TIntegerField;
    QContratoDT_EMISSAO: TDateTimeField;
    QContratoDT_ENTREGA: TDateTimeField;
    QContratoDT_VENCIMENTO: TDateTimeField;
    QContratoDESC_LOCAL_ENTREGA: TStringField;
    QContratoDESC_ACONDICIONAMENTO: TStringField;
    QContratoIND_FRETE: TStringField;
    QContratoPERC_FUNRURAL: TFloatField;
    QContratoDT_ANO_SAFRA: TStringField;
    QContratoIND_TIPO_SAFRA: TStringField;
    QContratoTIPO_BASE: TStringField;
    QContratoCOD_AVALISTA: TIntegerField;
    QContratoNUM_CONTRATO: TIntegerField;
    QContratoIND_CP: TIntegerField;
    QContratoIND_SITUACAO: TStringField;
    QContratoCons: TOracleDataSet1;
    QContratoConsCOD_CADASTRO: TIntegerField;
    QContratoConsCOD_CONTRATO: TIntegerField;
    QContratoConsCOD_FILIAL: TIntegerField;
    QContratoConsIND_FIXAR: TIntegerField;
    QContratoConsCOD_PRODUTO: TIntegerField;
    QContratoConsQT_QUANTIDADE: TFloatField;
    QContratoConsVAL_DOLAR: TFloatField;
    QContratoConsIND_ICMS: TIntegerField;
    QContratoConsDT_EMISSAO: TDateTimeField;
    QContratoConsDT_ENTREGA: TDateTimeField;
    QContratoConsDT_VENCIMENTO: TDateTimeField;
    QContratoConsDESC_LOCAL_ENTREGA: TStringField;
    QContratoConsDESC_ACONDICIONAMENTO: TStringField;
    QContratoConsIND_FRETE: TStringField;
    QContratoConsPERC_FUNRURAL: TFloatField;
    QContratoConsDT_ANO_SAFRA: TStringField;
    QContratoConsIND_TIPO_SAFRA: TStringField;
    QContratoConsTIPO_BASE: TStringField;
    QContratoConsCOD_AVALISTA: TIntegerField;
    QContratoConsNUM_CONTRATO: TIntegerField;
    QContratoConsDESC_FILIAL: TStringField;
    QContratoConsNOME: TStringField;
    QContasPagar: TOracleDataSet1;
    QContasPagarCOD_CONTA_PAGAR_CAB: TIntegerField;
    QContasPagarCOD_FINALIDADE: TIntegerField;
    QContasPagarCOD_BANCO_AGENCIA: TIntegerField;
    QContasPagarCOD_CADASTRO: TIntegerField;
    QContasPagarCOD_FILIAL: TIntegerField;
    QContasPagarNUM_TITULO: TIntegerField;
    QContasPagarNUM_PARCELA: TIntegerField;
    QContasPagarDESC_TIPO_DOCUMENTO: TStringField;
    QContasPagarDT_MOVIMENTO: TDateTimeField;
    QContasPagarDT_BAIXA: TDateTimeField;
    QContasPagarDT_VENCIMENTO: TDateTimeField;
    QContasPagarDT_EMISSAO: TDateTimeField;
    QContasPagarDT_CAPITALIZACAO: TDateTimeField;
    QContasPagarVAL_TITULO: TFloatField;
    QContasPagarCOD_NOTA_CAB: TIntegerField;
    QContasPagarIND_ACEITE: TStringField;
    QContasPagarIND_SITUACAO: TStringField;
    QContasPagarVAL_ORIGINAL: TFloatField;
    QContasPagarVAL_INDEXADO: TFloatField;
    QContasPagarCOD_DEPARTAMENTO: TIntegerField;
    QContasPagarCOD_CONTRATO: TIntegerField;
    QContasPagarMov: TOracleDataSet1;
    QContratoMovGP_Aberto: TOracleDataSet1;
    QContratoMovGP_AbertoCOD_CONTRATO_GP: TIntegerField;
    QContratoMovGP_AbertoCOD_FILIAL: TIntegerField;
    QContratoMovGP_AbertoCOD_CADASTRO: TIntegerField;
    QContratoMovGP_AbertoCOD_PRODUTO: TIntegerField;
    QContratoMovGP_AbertoDT_SAFRA: TStringField;
    QContratoMovGP_AbertoIND_TIPO_BASE: TStringField;
    QContratoMovGP_AbertoDT_ENTREGA: TDateTimeField;
    QContratoMovGP_AbertoQT_QUANTIDADE: TFloatField;
    QContratoMovGP_AbertoDESC_ACONDICIONAMENTO: TStringField;
    QContratoMovGP_AbertoDT_PAGTO: TDateTimeField;
    QContratoMovGP_AbertoNUM_CONTRATO: TIntegerField;
    QContratoMovGP_AbertoPERC_FUNRURAL: TFloatField;
    QContratoMovGP_AbertoIND_SITUACAO: TStringField;
    QContratoMovGP_AbertoIND_CP: TIntegerField;
    QContratoMovGP_AbertoDT_CONTRATO: TDateTimeField;
    QContratoMovGP_AbertoLOCAL_ENTREGA: TStringField;
    QContratoMovGP_AbertoQTDE_SALDO: TFloatField;
    QContratoMovGP_AbertoDESC_OBSERVACAO: TStringField;
    QContratoMovGP_AbertoDT_VENCTO_PROMISSORIA: TDateTimeField;
    QContratoMovGP_AbertoVAL_PROMISSORIA: TFloatField;
    QContratoMovGP_Abertodesc_produto: TStringField;
    QContratoMovGP_Abertodesc_filial: TStringField;
    QContratoGP_Mov: TOracleDataSet1;
    QContratoGP_MovCOD_CONTRATO_GP_MOV: TIntegerField;
    QContratoGP_MovCOD_CONTRATO_GP: TIntegerField;
    QContratoGP_MovDATA: TDateTimeField;
    QContratoGP_MovQT_QUANTIDADE: TFloatField;
    QContratoGP_MovVAL_MOVIMENTO: TFloatField;
    QContratoGP_MovDESC_OBSERVACAO: TStringField;
    QContratoGP_MovIND_SALDO_ZERO: TStringField;
    QContratoMovVend_Mov_GP: TOracleDataSet1;
    QContratoMovVend_Mov_GPTOTAL_QUANTIDADE: TFloatField;
    QContratoMovAntecipado: TOracleDataSet1;
    QContratoMovAntecipadoCOD_CONTRATO_MOV: TIntegerField;
    QContratoMovAntecipadoCOD_CONTRATO: TIntegerField;
    QContratoMovAntecipadoDATA: TDateTimeField;
    QContratoMovAntecipadoQT_QUANTIDADE: TFloatField;
    QContratoMovAntecipadoVAL_MOVIMENTO: TFloatField;
    QContratoMovAntecipadoDESC_OBSERVACAO: TStringField;
    QContratoMovAntecipadoIND_SALDO_ZERO: TStringField;
    QContrato_Vend: TOracleDataSet1;
    QContrato_VendCOD_CONTRATO_VEND: TIntegerField;
    QContrato_VendCOD_FILIAL: TIntegerField;
    QContrato_VendCOD_CADASTRO: TIntegerField;
    QContrato_VendCOD_PRODUTO: TIntegerField;
    QContrato_VendQT_QUANTIDADE: TFloatField;
    QContrato_VendDT_CONTRATO: TDateTimeField;
    QContrato_VendIND_RET_ENTR: TStringField;
    QContrato_VendDT_ENTREGA: TDateTimeField;
    QContrato_VendCOD_CORRETORA: TIntegerField;
    QContrato_VendDT_PAGTO: TDateTimeField;
    QContrato_VendPERC_COMISSAO: TFloatField;
    QContrato_VendCOD_CC: TIntegerField;
    QContrato_VendOBS: TStringField;
    QContrato_VendNUM_CONTRATO: TIntegerField;
    QContrato_VendCOD_CC_CORRETORA: TStringField;
    QContrato_VendIND_CONF: TStringField;
    QContrato_VendDESC_BANCO_CORRETORA: TStringField;
    QContrato_VendNUM_AGENCIA_CORRETORA: TStringField;
    QContrato_VendVAL_SALDO: TFloatField;
    QContrato_VendSALDO_NF_EMBARQUE: TFloatField;
    QContrato_VendVAL_AJUSTE: TFloatField;
    QContasPagar_Vend: TOracleDataSet1;
    QContasPagar_VendCOD_CONTA_PAGAR_CAB: TIntegerField;
    QContasPagar_VendCOD_FINALIDADE: TIntegerField;
    QContasPagar_VendCOD_BANCO_AGENCIA: TIntegerField;
    QContasPagar_VendCOD_CADASTRO: TIntegerField;
    QContasPagar_VendCOD_FILIAL: TIntegerField;
    QContasPagar_VendNUM_TITULO: TIntegerField;
    QContasPagar_VendNUM_PARCELA: TIntegerField;
    QContasPagar_VendDESC_TIPO_DOCUMENTO: TStringField;
    QContasPagar_VendDT_MOVIMENTO: TDateTimeField;
    QContasPagar_VendDT_BAIXA: TDateTimeField;
    QContasPagar_VendDT_VENCIMENTO: TDateTimeField;
    QContasPagar_VendDT_EMISSAO: TDateTimeField;
    QContasPagar_VendDT_CAPITALIZACAO: TDateTimeField;
    QContasPagar_VendVAL_TITULO: TFloatField;
    QContasPagar_VendCOD_NOTA_CAB: TIntegerField;
    QContasPagar_VendIND_ACEITE: TStringField;
    QContasPagar_VendIND_SITUACAO: TStringField;
    QContasPagar_VendVAL_ORIGINAL: TFloatField;
    QContasPagar_VendVAL_INDEXADO: TFloatField;
    QContasPagar_VendCOD_DEPARTAMENTO: TIntegerField;
    QContasPagar_VendCOD_CONTRATO: TIntegerField;
    QContasPagar_VendCOD_CONTRATO_GP: TIntegerField;
    QContasPagar_VendCOD_CONTRATO_VEND: TIntegerField;
    QContasPagarMov_Vend: TOracleDataSet1;
    QContasPagarMov_VendCOD_CONTA_PAGAR_MOV: TIntegerField;
    QContasPagarMov_VendCOD_CONTA_PAGAR_CAB: TIntegerField;
    QContasPagarMov_VendDT_MOVIMENTO: TDateTimeField;
    QContasPagarMov_VendVAL_MOVIMENTO: TFloatField;
    QContasPagarMov_VendDESC_OBSERVACAO: TStringField;
    QContasPagarMov_VendIND_TIPO_MOVIMENTO: TStringField;
    QContasPagarMov_VendDT_USUARIO: TDateTimeField;
    QContasPagarMov_VendCOD_USUARIO: TIntegerField;
    QContasPagarMov_VendCOD_BCO_MOVIMENTO: TIntegerField;
    QContasPagarMov_VendCOD_CAIXA_MOV: TIntegerField;
    QContasPagarMov_VendCOD_LANCTO_CONTABIL_CRED: TIntegerField;
    QContasPagarMov_VendCOD_LANCTO_CONTABIL_DEB: TIntegerField;
    QContrato_VendMov: TOracleDataSet1;
    QRNotaAgricola_Aberto: TOracleDataSet1;
    QRContrato_com_Mov: TOracleDataSet1;
    QContasReceber_Vend: TOracleDataSet1;
    QContasReceber_VendCOD_CONTA_RECEBER_CAB: TIntegerField;
    QContasReceber_VendCOD_FINALIDADE: TIntegerField;
    QContasReceber_VendCOD_BANCO_AGENCIA: TIntegerField;
    QContasReceber_VendCOD_FILIAL: TIntegerField;
    QContasReceber_VendNUM_TITULO: TIntegerField;
    QContasReceber_VendNUM_PARCELA: TIntegerField;
    QContasReceber_VendDESC_TIPO_DOCUMENTO: TStringField;
    QContasReceber_VendDT_MOVIMENTO: TDateTimeField;
    QContasReceber_VendDT_BAIXA: TDateTimeField;
    QContasReceber_VendDT_VENCIMENTO: TDateTimeField;
    QContasReceber_VendDT_EMISSAO: TDateTimeField;
    QContasReceber_VendDT_CAPITALIZACAO: TDateTimeField;
    QContasReceber_VendVAL_TITULO: TFloatField;
    QContasReceber_VendVAL_NEGOCIO: TFloatField;
    QContasReceber_VendIND_ACEITE: TStringField;
    QContasReceber_VendIND_SITUACAO: TStringField;
    QContasReceber_VendDESC_OBSERVACAO: TStringField;
    QContasReceber_VendCOD_NOTA_CAB: TIntegerField;
    QContasReceber_VendCOD_CADASTRO: TIntegerField;
    QContasReceber_VendVAL_ORIGINAL: TFloatField;
    QContasReceber_VendCOD_NOSSO_NUMERO: TStringField;
    QContasReceber_VendVAL_JUROS: TFloatField;
    QContasReceber_VendCOD_DEPARTAMENTO: TIntegerField;
    QContasReceber_VendCOD_CONTRATO_VEND: TIntegerField;
    QContasReceberMov_Vend: TOracleDataSet1;
    QContratoMovVend_Mov_Ant: TOracleDataSet1;
    QContrato_VendMovDeleta: TOracleDataSet1;
    QContrato_VendMovDeletaCOD_CONTRATO_VEND_MOV: TIntegerField;
    QContrato_VendMovDeletaCOD_CONTRATO_VEND: TIntegerField;
    QContrato_VendMovDeletaDATA: TDateTimeField;
    QContrato_VendMovDeletaQT_QUANTIDADE: TFloatField;
    QContrato_VendMovDeletaVAL_MOVIMENTO: TFloatField;
    QContrato_VendMovDeletaDESC_OBSERVACAO: TStringField;
    QContrato_VendMovDeletaCOD_CONTRATO_GP_MOV: TIntegerField;
    QContrato_VendMovDeletaCOD_CONTRATO_MOV: TIntegerField;
    QContratoMovAnt_Aberto: TOracleDataSet1;
    QContratoMovAnt_Abertodesc_filial: TStringField;
    QContratoMovAnt_Abertodesc_produto: TStringField;
    QRContratoVend_Mov: TOracleDataSet1;
    QContrato_Vendtotal: TFloatField;
    QContrVend_Nota: TOracleDataSet1;
    QContrato_Vendvalor_aplicado: TFloatField;
    QContratoMovAnt_AbertoCOD_CONTRATO: TIntegerField;
    QContratoMovAnt_AbertoCOD_FILIAL: TIntegerField;
    QContratoMovAnt_AbertoCOD_CADASTRO: TIntegerField;
    QContratoMovAnt_AbertoIND_FIXAR: TIntegerField;
    QContratoMovAnt_AbertoCOD_PRODUTO: TIntegerField;
    QContratoMovAnt_AbertoQT_QUANTIDADE: TFloatField;
    QContratoMovAnt_AbertoVAL_DOLAR: TFloatField;
    QContratoMovAnt_AbertoIND_ICMS: TIntegerField;
    QContratoMovAnt_AbertoDT_EMISSAO: TDateTimeField;
    QContratoMovAnt_AbertoDT_ENTREGA: TDateTimeField;
    QContratoMovAnt_AbertoDT_VENCIMENTO: TDateTimeField;
    QContratoMovAnt_AbertoDESC_LOCAL_ENTREGA: TStringField;
    QContratoMovAnt_AbertoDESC_ACONDICIONAMENTO: TStringField;
    QContratoMovAnt_AbertoIND_FRETE: TStringField;
    QContratoMovAnt_AbertoPERC_FUNRURAL: TFloatField;
    QContratoMovAnt_AbertoDT_ANO_SAFRA: TStringField;
    QContratoMovAnt_AbertoIND_TIPO_SAFRA: TStringField;
    QContratoMovAnt_AbertoTIPO_BASE: TStringField;
    QContratoMovAnt_AbertoCOD_AVALISTA: TIntegerField;
    QContratoMovAnt_AbertoPRECO: TFloatField;
    QContratoMovAnt_AbertoNUM_CONTRATO: TIntegerField;
    QContratoMovAnt_AbertoIND_CP: TIntegerField;
    QContratoMovAnt_AbertoIND_SITUACAO: TStringField;
    QContratoMovAnt_AbertoQTDE_SALDO: TFloatField;
    QRContratosval_contrato: TFloatField;
    QContrato_VendMovCOD_CONTRATO_VEND_MOV: TIntegerField;
    QContrato_VendMovCOD_CONTRATO_VEND: TIntegerField;
    QContrato_VendMovDATA: TDateTimeField;
    QContrato_VendMovQT_QUANTIDADE: TFloatField;
    QContrato_VendMovVAL_MOVIMENTO: TFloatField;
    QContrato_VendMovDESC_OBSERVACAO: TStringField;
    QContrato_VendMovCOD_CONTRATO_GP_MOV: TIntegerField;
    QContrato_VendMovCOD_CONTRATO_MOV: TIntegerField;
    QContrato_VendMovCOD_NOTA_ITEM: TIntegerField;
    QContrato_GPConsCOD_CONTRATO_GP: TIntegerField;
    QContrato_GPConsCOD_FILIAL: TIntegerField;
    QContrato_GPConsCOD_CADASTRO: TIntegerField;
    QContrato_GPConsCOD_PRODUTO: TIntegerField;
    QContrato_GPConsDT_SAFRA: TStringField;
    QContrato_GPConsIND_TIPO_BASE: TStringField;
    QContrato_GPConsDT_ENTREGA: TDateTimeField;
    QContrato_GPConsQT_QUANTIDADE: TFloatField;
    QContrato_GPConsDESC_ACONDICIONAMENTO: TStringField;
    QContrato_GPConsDT_PAGTO: TDateTimeField;
    QContrato_GPConsNUM_CONTRATO: TIntegerField;
    QContrato_GPConsPERC_FUNRURAL: TFloatField;
    QContrato_GPConsNOME: TStringField;
    QContrato_GPConsDESC_FILIAL: TStringField;
    QContasPagarMovCOD_CONTA_PAGAR_MOV: TIntegerField;
    QContasPagarMovCOD_CONTA_PAGAR_CAB: TIntegerField;
    QContasPagarMovDT_MOVIMENTO: TDateTimeField;
    QContasPagarMovVAL_MOVIMENTO: TFloatField;
    QContasPagarMovDESC_OBSERVACAO: TStringField;
    QContasPagarMovIND_TIPO_MOVIMENTO: TStringField;
    QContasPagarMovDT_USUARIO: TDateTimeField;
    QContasPagarMovCOD_USUARIO: TIntegerField;
    QContasPagarMovCOD_BCO_MOVIMENTO: TIntegerField;
    QContasPagarMovCOD_CAIXA_MOV: TIntegerField;
    QContasPagarMovCOD_LANCTO_CONTABIL_CRED: TIntegerField;
    QContasPagarMovCOD_LANCTO_CONTABIL_DEB: TIntegerField;
    QContrato_VendMovDeleta_GPCOD_CONTRATO_VEND_MOV: TIntegerField;
    QContrato_VendMovDeleta_GPCOD_CONTRATO_VEND: TIntegerField;
    QContrato_VendMovDeleta_GPDATA: TDateTimeField;
    QContrato_VendMovDeleta_GPQT_QUANTIDADE: TFloatField;
    QContrato_VendMovDeleta_GPVAL_MOVIMENTO: TFloatField;
    QContrato_VendMovDeleta_GPDESC_OBSERVACAO: TStringField;
    QContrato_VendMovDeleta_GPCOD_CONTRATO_GP_MOV: TIntegerField;
    QContrato_VendMovDeleta_GPCOD_CONTRATO_MOV: TIntegerField;
    QRContratoVend_MovNUM_NOTA: TIntegerField;
    QRContratoVend_MovDT_EMISSAO: TDateTimeField;
    QRContratoVend_MovDESC_PLACA: TStringField;
    QRContratoVend_MovQT_QUANTIDADE: TFloatField;
    QRContratoVend_MovVAL_TOTAL: TFloatField;
    QContrVend_NotaCOD_NOTA_CAB: TIntegerField;
    QContrVend_NotaNOME: TStringField;
    QContrVend_NotaCOD_FILIAL: TIntegerField;
    QContrVend_NotaDT_EMISSAO: TDateTimeField;
    QContrVend_NotaCOD_CONTRATO_VEND: TIntegerField;
    QContrVend_NotaQT_QUANTIDADE: TFloatField;
    QContrVend_NotaNUM_NOTA: TIntegerField;
    QContrVend_NotaDESC_PLACA: TStringField;
    QContasReceberMov_VendCOD_CONTA_RECEBER_MOV: TIntegerField;
    QContasReceberMov_VendCOD_CONTA_RECEBER_CAB: TIntegerField;
    QContasReceberMov_VendDT_MOVIMENTO: TDateTimeField;
    QContasReceberMov_VendVAL_MOVIMENTO: TFloatField;
    QContasReceberMov_VendDESC_OBSERVACAO: TStringField;
    QContasReceberMov_VendCOD_USUARIO: TIntegerField;
    QContasReceberMov_VendDT_USUARIO: TDateTimeField;
    QContasReceberMov_VendIND_TIPO_MOVIMENTO: TStringField;
    QContasReceberMov_VendCOD_BCO_MOVIMENTO: TIntegerField;
    QContasReceberMov_VendCOD_CAIXA_MOV: TIntegerField;
    QContasReceberMov_VendCOD_LANCTO_CONTABIL_CRED: TIntegerField;
    QContasReceberMov_VendCOD_LANCTO_CONTABIL_DEB: TIntegerField;
    DSContratoMovAntecipado: TDataSource;
    QContrato_Vend_Pagto: TOracleDataSet1;
    QContrato_Vend_PagtoCOD_CONTRATO_PGTO: TIntegerField;
    QContrato_Vend_PagtoCOD_CONTRATO_VEND: TIntegerField;
    QContrato_Vend_PagtoDT_PAGTO: TDateTimeField;
    DSContrato_VendMov: TDataSource;
    DSContrVend_Nota: TDataSource;
    QTotalContratoGP: TOracleDataSet1;
    QTotalContratoGPTOTAL_QUANTIDADE: TFloatField;
    QTotalContratoGPsaldo_disponivel: TFloatField;
    QContrVend_NotaVAL_TOTAL: TFloatField;
    QContrato_VendVAL_FRETE: TFloatField;
    QContrato_VendVAL_DESPESAS_PORTO: TFloatField;
    QContrato_VendVAL_DESPESAS_PIS_COFINS: TFloatField;
    QContrato_VendVAL_FINANCEIRO: TFloatField;
    QRContrato_Vend_Nota_Custos: TOracleDataSet1;
    QRContrato_VendQT_QUANTIDADE: TFloatField;
    QRContrato_VendDT_CONTRATO: TDateTimeField;
    QRContrato_VendIND_RET_ENTR: TStringField;
    QRContrato_VendDT_ENTREGA: TDateTimeField;
    QRContrato_VendPRECO: TFloatField;
    QRContrato_VendDT_PAGTO: TDateTimeField;
    QRContrato_VendPERC_COMISSAO: TFloatField;
    QRContrato_VendOBS: TStringField;
    QRContrato_VendNUM_AGENCIA_CORRETORA: TStringField;
    QRContrato_VendDESC_BANCO_CORRETORA: TStringField;
    QRContrato_VendVAL_FRETE: TFloatField;
    QRContrato_VendVAL_DESPESAS_PORTO: TFloatField;
    QRContrato_VendVAL_FINANCEIRO: TFloatField;
    QRContrato_VendDESC_FILIAL: TStringField;
    QRContrato_VendCOD_ESTADO: TStringField;
    QRContrato_VendNOME: TStringField;
    QRContrato_VendDESC_ENDERECO: TStringField;
    QRContrato_VendDESC_CIDADE: TStringField;
    QRContrato_VendNUM_INSCRICAO: TStringField;
    QRContrato_VendNUM_CGC_CPF: TStringField;
    QRContrato_VendNUM_EMBALAGEM: TFloatField;
    QRContrato_Vendcorretora: TStringField;
    QRContrato_Vendconta_corrente: TStringField;
    QRContrato_Venddesc_banco_agencia: TStringField;
    QRContrato_Vendcod_agencia: TIntegerField;
    QRContrato_VendCOD_CC_CORRETORA: TStringField;
    QRContrato_VendVALOR_TOTAL: TFloatField;
    QRContrato_VendVALOR_FUNRURAL: TFloatField;
    QRContrato_Vend_Nota_Custosval_dolar: TFloatField;
    QContratoVend_Notadt_vencimento: TDateField;
    QContrato_VendVAL_COMISSAO: TFloatField;
    QContrato_VendPERC_PIS_COFINS_CPMF: TFloatField;
    QRContrato_VendSALDO_NF_EMBARQUE: TFloatField;
    QRContrato_Vendval_custo_comp: TFloatField;
    QRContrato_Vendval_icms_notas: TFloatField;
    QRContrato_VendVAL_DESPESAS_PIS_COFINS: TFloatField;
    QRContrato_Vend_Nota_Custosdt_vencimento: TDateField;
    QRContrato_Vend_Recebimento: TOracleDataSet1;
    QRContrato_Vend_RecebimentoDT_MOVIMENTO: TDateTimeField;
    QRContrato_Vend_RecebimentoVAL_MOVIMENTO: TFloatField;
    QRContrato_VendVALOR_COMISSAO: TFloatField;
    QRContrato_Vend_RecebimentoIND_TIPO_MOVIMENTO: TStringField;
    QRContrato_Vend_Recebimentoind_tipo: TStringField;
    QRContrato_Vend_Nota_CustosQT_QUANTIDADE: TFloatField;
    QRContrato_Vend_Nota_CustosVAL_MOVIMENTO: TFloatField;
    QRContrato_Vend_Nota_CustosCOD_CONTRATO_MOV: TFloatField;
    QRContrato_Vend_Nota_CustosCOD_NOTA_ITEM: TFloatField;
    QRContrato_Vend_Nota_CustosCOD_CONTRATO_GP_MOV: TFloatField;
    QRContrato_Vend_Nota_CustosCOD_NOTA_CAB: TFloatField;
    QRContrato_Vend_Nota_CustosNUM_NOTA: TFloatField;
    QRContrato_Vend_Nota_CustosDT_EMISSAO: TDateTimeField;
    QRContrato_Vend_Nota_CustosDT_VENCIMENTO_CONTRATO: TDateTimeField;
    QContratoVend_NotaCOD_CADASTRO: TIntegerField;
    QRNotaAgricola_AbertoCOD_FILIAL: TFloatField;
    QRNotaAgricola_AbertoNUM_NOTA: TFloatField;
    QRNotaAgricola_AbertoCOD_SERIE: TStringField;
    QRNotaAgricola_AbertoDT_EMISSAO: TDateTimeField;
    QRNotaAgricola_AbertoNOME: TStringField;
    QRNotaAgricola_AbertoCOD_PRODUTO: TFloatField;
    QRNotaAgricola_AbertoVAL_UNITARIO: TFloatField;
    QRNotaAgricola_AbertoSALDO: TFloatField;
    QRNotaAgricola_AbertoCOD_NOTA_CAB: TFloatField;
    QRNotaAgricola_Abertodt_vencimento: TDateField;
    QRContratoDESC_FILIAL: TStringField;
    QRContratoCOD_PRODUTO: TFloatField;
    QRContratoCOD_FILIAL: TFloatField;
    QRContratoQT_QUANTIDADE: TFloatField;
    QRContratoVAL_DOLAR: TFloatField;
    QRContratoDT_EMISSAO: TDateTimeField;
    QRContratoDT_ENTREGA: TDateTimeField;
    QRContratoDT_VENCIMENTO: TDateTimeField;
    QRContratoPERC_FUNRURAL: TFloatField;
    QRContratoCOD_AVALISTA: TFloatField;
    QRContratoNUM_CONTRATO: TFloatField;
    QRContratoNUM_EMBALAGEM: TFloatField;
    QRContratoNOME: TStringField;
    QRContratoCOD_CADASTRO: TFloatField;
    QRContratoQTDE_MOV: TFloatField;
    QRContratoSALDO: TFloatField;
    QRContrato_Vendval_frete_notas: TFloatField;
    QRContrato_Vendval_variacao_cambial_pos: TFloatField;
    QRContrato_Vendval_variacao_cambial_neg: TFloatField;
    QContrato_VendVAL_AJUSTE_CONTABIL: TFloatField;
    QRContratoResumo: TOracleDataSet1;
    QRContratoResumoCOD_PRODUTO: TFloatField;
    QRContratoResumoQT_QUANTIDADE: TFloatField;
    QRContratoResumoQT_ATENDIDO: TFloatField;
    QContrato_VendConsQT_QUANTIDADE: TFloatField;
    QContrato_VendConsNUM_CONTRATO: TIntegerField;
    QContrato_VendConsNOME: TStringField;
    QContrato_VendConsCOD_CONTRATO_VEND: TIntegerField;
    QContrato_VendConsVAL_SALDO: TFloatField;
    QContrato_VendMovCOD_CONTRATO_VEND_CUSTOS: TIntegerField;
    QRContrato_Vend_Nota_CustosCOD_CONTRATO_VEND_CUSTOS: TFloatField;
    QContratoCOD_FIEL_DEPOSITARIO: TIntegerField;
    QContrato_Vend_PagtoVAL_PAGTO: TFloatField;
    QContasPagarDESC_OBSERVACAO: TStringField;
    QContasPagar_GPCOD_CONTA_PAGAR_CAB: TIntegerField;
    QContasPagar_GPCOD_FINALIDADE: TIntegerField;
    QContasPagar_GPCOD_BANCO_AGENCIA: TIntegerField;
    QContasPagar_GPCOD_CADASTRO: TIntegerField;
    QContasPagar_GPCOD_FILIAL: TIntegerField;
    QContasPagar_GPNUM_TITULO: TIntegerField;
    QContasPagar_GPNUM_PARCELA: TIntegerField;
    QContasPagar_GPDESC_TIPO_DOCUMENTO: TStringField;
    QContasPagar_GPDT_MOVIMENTO: TDateTimeField;
    QContasPagar_GPDT_BAIXA: TDateTimeField;
    QContasPagar_GPDT_VENCIMENTO: TDateTimeField;
    QContasPagar_GPDT_EMISSAO: TDateTimeField;
    QContasPagar_GPDT_CAPITALIZACAO: TDateTimeField;
    QContasPagar_GPVAL_TITULO: TFloatField;
    QContasPagar_GPCOD_NOTA_CAB: TIntegerField;
    QContasPagar_GPDESC_OBSERVACAO: TStringField;
    QContasPagar_GPIND_ACEITE: TStringField;
    QContasPagar_GPIND_SITUACAO: TStringField;
    QContasPagar_GPVAL_ORIGINAL: TFloatField;
    QContasPagar_GPVAL_INDEXADO: TFloatField;
    QContasPagar_GPCOD_DEPARTAMENTO: TIntegerField;
    QContasPagar_GPCOD_CONTRATO: TIntegerField;
    QContasPagar_GPCOD_CONTRATO_GP: TIntegerField;
    QContasPagar_VendDESC_OBSERVACAO: TStringField;
    QContrato_GPDESC_TIPO_PRECO: TStringField;
    QContrVend_NotaCOD_OPERACAO: TIntegerField;
    QContratoCOD_MOTIVO: TIntegerField;
    QRContratoIND_SITUACAO: TStringField;
    QRContrato_GPNUM_EMBALAGEM: TFloatField;
    QRContratoC_Abertoqtde_saldo: TFloatField;
    QRContratoC_AbertoQT_SALDO: TFloatField;
    QContrVend_NotaCOD_MENSAGEM: TIntegerField;
    QContrVend_NotaCOD_SERIE: TStringField;
    QContrato_VendCOD_OPERACAO: TIntegerField;
    QContrato_VendCOD_MENSAGEM: TIntegerField;
    QContrato_VendIND_TIPO_FRETE: TStringField;
    QContrato_VendCOD_TRIBUTACAO: TIntegerField;
    QContrato_VendMovDeleta_GPnum_contrato: TFloatField;
    QContrato_VendMovDeletanum_contrato: TFloatField;
    QContratoqt_saldo_baixar: TFloatField;
    QContratoDESC_TESTEMUNHA1: TStringField;
    QContratoDESC_TESTEMUNHA2: TStringField;
    QContrato_GPDESC_TESTEMUNHA1: TStringField;
    QContrato_GPDESC_TESTEMUNHA2: TStringField;
    QContrato_VendCOD_MSG_CORPO_NOTA: TIntegerField;
    QRContrato_GPQT_CONTRATO: TFloatField;
    QRContrato_GPQT_MOVIMENTO: TFloatField;
    QRContrato_GPvalor: TFloatField;
    QRContrato_GPvalor_bruto: TFloatField;
    QRContrato_GPqt_quantidade: TFloatField;
    QRContratoVenda_SaldoEmbCOD_CONTRATO_VEND: TIntegerField;
    QRContratoVenda_SaldoEmbCOD_FILIAL: TIntegerField;
    QRContratoVenda_SaldoEmbCOD_CADASTRO: TIntegerField;
    QRContratoVenda_SaldoEmbCOD_PRODUTO: TIntegerField;
    QRContratoVenda_SaldoEmbQT_QUANTIDADE: TFloatField;
    QRContratoVenda_SaldoEmbDT_CONTRATO: TDateTimeField;
    QRContratoVenda_SaldoEmbIND_RET_ENTR: TStringField;
    QRContratoVenda_SaldoEmbDT_ENTREGA: TDateTimeField;
    QRContratoVenda_SaldoEmbPRECO: TFloatField;
    QRContratoVenda_SaldoEmbCOD_CORRETORA: TIntegerField;
    QRContratoVenda_SaldoEmbDT_PAGTO: TDateTimeField;
    QRContratoVenda_SaldoEmbPERC_COMISSAO: TFloatField;
    QRContratoVenda_SaldoEmbCOD_CC: TIntegerField;
    QRContratoVenda_SaldoEmbOBS: TStringField;
    QRContratoVenda_SaldoEmbNUM_CONTRATO: TIntegerField;
    QRContratoVenda_SaldoEmbCOD_CC_CORRETORA: TStringField;
    QRContratoVenda_SaldoEmbIND_CONF: TStringField;
    QRContratoVenda_SaldoEmbNUM_AGENCIA_CORRETORA: TStringField;
    QRContratoVenda_SaldoEmbDESC_BANCO_CORRETORA: TStringField;
    QRContratoVenda_SaldoEmbVAL_SALDO: TFloatField;
    QRContratoVenda_SaldoEmbSALDO_NF_EMBARQUE: TFloatField;
    QRContratoVenda_SaldoEmbDESC_FILIAL: TStringField;
    QRContratoVenda_SaldoEmbNOME: TStringField;
    QRContratoVenda_SaldoEmbVALOR_SALDO: TFloatField;
    QRContrato_Vend_Nota_CustosCOD_CADASTRO_PARCEIRO: TFloatField;
    QContratoCOD_CADASTRO_PARCEIRO: TIntegerField;
    QContrato_GPCOD_CADASTRO_PARCEIRO: TIntegerField;
    QRContrato_Vend_Nota_Custosnome_parceiro: TStringField;
    QRContrato_Vend_Nota_CustosCOD_FILIAL: TFloatField;
    QRContrato_Vend_Nota_Custosdesc_filial: TStringField;
    QContrato_VendVAL_CUSTO_PARCERIA: TFloatField;
    QContrato_VendVAL_CUSTO_CLASPAR: TFloatField;
    QContrato_VendVAL_CUSTO_QUEBRA_TRANSP: TFloatField;
    QRContrato_VendVAL_CUSTO_PARCERIA: TFloatField;
    QRContrato_VendVAL_CUSTO_CLASPAR: TFloatField;
    QRContrato_VendVAL_CUSTO_QUEBRA_TRANSP: TFloatField;
    QRContrato_Vend_Nota_CustosNOME: TStringField;
    QContrato_VendDT_VENCIMENTO: TDateTimeField;
    QContrato_VendConsDT_ENTREGA: TDateTimeField;
    QContrato_VendConsSALDO_NF_EMBARQUE: TFloatField;
    QContrato_VendConsDESC_FILIAL: TStringField;
    QContrato_VendConsCOD_FILIAL: TIntegerField;
    QContratoIND_FISICA_JURIDICA: TStringField;
    QContrato_VendIND_CONDICAO_PAGTO: TStringField;
    QContrato_VendIND_TIPO_MERCADO: TStringField;
    QContrato_VendNUM_CONTRATO_CLIENTE: TStringField;
    QContrato_GPConsDESC_TIPO_PRECO: TStringField;
    QContratoIND_TIPO_CONTRATO: TStringField;
    QContrato_VendIND_TIPO_PRECO: TStringField;
    QContrato_GPIND_RETIRAR_ENTREGUE: TStringField;
    QContrato_GPCOD_CIDADE_ENTREGA: TIntegerField;
    QContrato_GPdesc_cidade_entrega: TStringField;
    QContratoCOD_CIDADE_ENTREGA: TIntegerField;
    QContratodesc_cidade_entrega: TStringField;
    QContratoIND_RETIRAR_ENTREGUE: TStringField;
    QRContrato_GPIND_RETIRAR_ENTREGUE: TStringField;
    QRBaixaValor_NaoAplicado: TOracleDataSet1;
    QRBaixaValor_NaoAplicadoNUM_CONTRATO: TIntegerField;
    QRBaixaValor_NaoAplicadoCOD_CADASTRO: TIntegerField;
    QRBaixaValor_NaoAplicadoDT_EMISSAO: TDateTimeField;
    QRBaixaValor_NaoAplicadoCOD_PRODUTO: TIntegerField;
    QRBaixaValor_NaoAplicadoCOD_FILIAL: TIntegerField;
    QRBaixaValor_NaoAplicadoDESC_FILIAL: TStringField;
    QRBaixaValor_NaoAplicadoNOME: TStringField;
    QRBaixaValor_NaoAplicadoVAL_MOVIMENTO: TFloatField;
    QRBaixaValor_NaoAplicadoSUBSTRTB_CONTRATO_MOV_ANTECIP: TStringField;
    QRBaixaValor_NaoAplicadoQT_QUANTIDADE: TFloatField;
    QContratoQT_PENHOR: TIntegerField;
    QContratoDESC_AREA_PENHOR: TStringField;
    QContratoDESC_ENDERECO_PENHOR: TStringField;
    QContratoDESC_MATRICULA_PENHOR: TStringField;
    QContratoDESC_CARTORIO_PENHOR: TStringField;
    QContratoDESC_ARMAZENS_PENHOR: TStringField;
    QContrato_GPQT_PENHOR: TIntegerField;
    QContrato_GPDESC_AREA_PENHOR: TStringField;
    QContrato_GPDESC_ENDERECO_PENHOR: TStringField;
    QContrato_GPDESC_MATRICULA_PENHOR: TStringField;
    QContrato_GPDESC_CARTORIO_PENHOR: TStringField;
    QContrato_GPDESC_ARMAZENS_PENHOR: TStringField;
    QContrato_GPCOD_AVALISTA: TIntegerField;
    QRContratoDESC_PRODUTO: TStringField;
    QRContratoResumoDESC_PRODUTO: TStringField;
    QContratoMovVend_Mov_AntTOTAL_QUANTIDADE: TFloatField;
    QRContrato_com_MovNUM_CONTRATO: TIntegerField;
    QRContrato_com_MovDT_ENTREGA: TDateTimeField;
    QRContrato_com_MovQT_CONTRATOS: TFloatField;
    QRContrato_com_MovDT_CONTRATO: TDateTimeField;
    QRContrato_com_MovCOD_PRODUTO: TFloatField;
    QRContrato_com_MovDESC_PRODUTO: TStringField;
    QRContrato_com_MovCOD_CADASTRO: TIntegerField;
    QRContrato_com_MovNOME: TStringField;
    QRContrato_com_MovQT_QUANTIDADE: TFloatField;
    QRContrato_com_MovDT_EMISSAO: TDateTimeField;
    QRContrato_com_MovNUM_NOTA: TIntegerField;
    QRContratoVend_AbertoCOD_CONTRATO_VEND: TIntegerField;
    QRContratoVend_AbertoCOD_FILIAL: TIntegerField;
    QRContratoVend_AbertoCOD_CADASTRO: TIntegerField;
    QRContratoVend_AbertoCOD_PRODUTO: TIntegerField;
    QRContratoVend_AbertoQT_QUANTIDADE: TFloatField;
    QRContratoVend_AbertoDT_CONTRATO: TDateTimeField;
    QRContratoVend_AbertoIND_RET_ENTR: TStringField;
    QRContratoVend_AbertoDT_ENTREGA: TDateTimeField;
    QRContratoVend_AbertoPRECO: TFloatField;
    QRContratoVend_AbertoCOD_CORRETORA: TIntegerField;
    QRContratoVend_AbertoDT_PAGTO: TDateTimeField;
    QRContratoVend_AbertoPERC_COMISSAO: TFloatField;
    QRContratoVend_AbertoCOD_CC: TIntegerField;
    QRContratoVend_AbertoOBS: TStringField;
    QRContratoVend_AbertoNUM_CONTRATO: TIntegerField;
    QRContratoVend_AbertoCOD_CC_CORRETORA: TStringField;
    QRContratoVend_AbertoIND_CONF: TStringField;
    QRContratoVend_AbertoNUM_AGENCIA_CORRETORA: TStringField;
    QRContratoVend_AbertoDESC_BANCO_CORRETORA: TStringField;
    QRContratoVend_AbertoVAL_SALDO: TFloatField;
    QRContratoVend_AbertoSALDO_NF_EMBARQUE: TFloatField;
    QRContratoVend_AbertoDESC_FILIAL: TStringField;
    QRContratoVend_AbertoNOME: TStringField;
    QRContratoVend_AbertoDESC_PRODUTO: TStringField;
    QContrato_VendConsDESC_PRODUTO: TStringField;
    QRContrato_VendDESC_PRODUTO: TStringField;
    QRContrato_GPDESC_PRODUTO: TStringField;
    QRContratoVenda_SaldoEmbDESC_PRODUTO: TStringField;
    QRContratoC_AbertoDESC_PRODUTO: TStringField;
    QRContrato_VendaDESC_PRODUTO: TStringField;
    QContrato_VendDT_ENTREGA_FINAL: TDateTimeField;
    QContrato_VendIND_MOEDA_PRECO: TStringField;
    QContrato_VendVAL_CUSTO_COMP: TFloatField;
    QContrato_VendDESC_RE: TStringField;
    QContrato_VendDESC_DESPACHO: TStringField;
    QContrato_VendDESC_BL: TStringField;
    QContrato_VendDESC_FATURA_EXP: TStringField;
    QContrato_VendDESC_BANCO_RECEBTO: TStringField;
    QContrato_VendDESC_LOCAL_ENTREGA: TStringField;
    QContrato_VendDESC_PRIM_TESTEMUNHA: TStringField;
    QContrato_VendDESC_SEG_TESTEMUNHA: TStringField;
    QRContratoVend_MovCOD_OPERACAO: TIntegerField;
    QRContratoVend_MovCOD_FILIAL: TIntegerField;
    QRContratoIND_RETIRAR_ENTREGUE: TStringField;
    QRContrato_VendCOD_CONTRATO_VEND: TFloatField;
    QRContrato_VendCOD_FILIAL: TFloatField;
    QRContrato_VendCOD_CADASTRO: TFloatField;
    QRContrato_VendCOD_PRODUTO: TFloatField;
    QRContrato_VendCOD_CORRETORA: TFloatField;
    QRContrato_VendCOD_CC: TFloatField;
    QRContrato_VendNUM_CONTRATO: TFloatField;
    QContrato_VendCOD_USUARIO: TIntegerField;
    QContrato_GPQT_HECTARES: TFloatField;
    QContrato_GPNUM_CPF_TESTEMUNHA1: TStringField;
    QContrato_GPNUM_CPF_TESTEMUNHA2: TStringField;
    QContratoIND_TIPO_PAGAMENTO: TStringField;
    QRContratoDESC_CIDADE: TStringField;
    QRContrato_GPDESC_CIDADE: TStringField;
    QRContrato_GPDESC_TIPO_PRECO: TStringField;
    QRContrato_Vend_Geral: TOracleDataSet1;
    QRContrato_Vend_GeralCOD_FILIAL: TIntegerField;
    QRContrato_Vend_GeralCOD_CADASTRO: TIntegerField;
    QRContrato_Vend_GeralCOD_PRODUTO: TIntegerField;
    QRContrato_Vend_GeralQT_QUANTIDADE: TFloatField;
    QRContrato_Vend_GeralNUM_CONTRATO: TIntegerField;
    QRContrato_Vend_GeralSALDO_NF_EMBARQUE: TFloatField;
    QRContrato_Vend_GeralVAL_SALDO: TFloatField;
    QRContrato_Vend_GeralNOME: TStringField;
    QRContrato_Vend_GeralIND_TIPO_MERCADO: TStringField;
    QContrato_GPIND_LIBERADO: TStringField;
    QContratoConsCOD_CADASTRO_PARCEIRO: TIntegerField;
    QContratoDESC_OBSERVACAO: TStringField;
    QRContratoDESC_OBSERVACAO: TStringField;
    QRContrato_GPDESC_OBSERVACAO: TStringField;
    QContrato_VendCOD_PADRAO_DESCONTO_PRODUTO: TIntegerField;
    QRContratoC_AbertoDT_ANO_ENTREGA: TStringField;
    QRResumoContrato_GP: TOracleDataSet1;
    QRResumoContrato_GPCOD_CONTRATO_GP: TIntegerField;
    QRResumoContrato_GPCOD_CADASTRO: TIntegerField;
    QRResumoContrato_GPIND_TIPO_BASE: TStringField;
    QRResumoContrato_GPDT_PAGTO: TDateTimeField;
    QRResumoContrato_GPDT_ENTREGA: TDateTimeField;
    QRResumoContrato_GPQT_QUANTIDADE: TFloatField;
    QRResumoContrato_GPPRECO: TFloatField;
    QRResumoContrato_GPNUM_CONTRATO: TIntegerField;
    QRResumoContrato_GPCOD_CIDADE_ENTREGA: TIntegerField;
    QRResumoContrato_GPNOME: TStringField;
    QRResumoContrato_GPDESC_CIDADE: TStringField;
    QRResumoContrato_GPdt_pgto: TStringField;
    QRResumoContrato_GPCOD_PRODUTO: TIntegerField;
    QRResumoContrato_GPDESC_PRODUTO: TStringField;
    QRResumoContrato_GPvalorReal: TFloatField;
    QRResumoContrato_GPvalorDolar: TFloatField;
    QRResumoContrato_GPDESC_TIPO_PRECO: TStringField;
    QRResumoContrato_GPNUM_EMBALAGEM: TFloatField;
    QRContratoVenda_SaldoEmbIND_MOEDA_PRECO: TStringField;
    QRContratoVenda_SaldoEmbVALOR_CONTRATO: TFloatField;
    QContrato_VendCOD_CIDADE: TIntegerField;
    QContrato_VendIND_SITUACAO_CUSTO: TStringField;
    QContrato_VendVAL_DOLAR: TFloatField;
    QContrato_Vend_PagtoDESC_OBSERVACAO: TStringField;
    QRContrato_Vend_PagtoDESC_OBSERVACAO: TStringField;
    QRContrato_Venda_Parcelas: TOracleDataSet1;
    QRContrato_Venda_ParcelasCOD_CONTRATO_PGTO: TIntegerField;
    QRContrato_Venda_ParcelasCOD_CONTRATO_VEND: TIntegerField;
    QRContrato_Venda_ParcelasDT_PAGTO: TDateTimeField;
    QRContrato_Venda_ParcelasVAL_PAGTO: TFloatField;
    QRContrato_Venda_ParcelasDESC_OBSERVACAO: TStringField;
    QRContratoVend_MovIND_TIPO_OPERACAO: TStringField;
    QRContrato_GPSTIPO_PRECO: TStringField;
    QRContrato_GPsqt_dolar: TFloatField;
    QRContrato_GPsqt_real: TFloatField;
    QRContrato_GPsval_dolar: TFloatField;
    QRContrato_GPsval_real: TFloatField;
    QRContrato_GPsval_bruto_dolar: TFloatField;
    QRContrato_GPsval_bruto_real: TFloatField;
    QContrato_GPConsCOD_CADASTRO_PARCEIRO: TIntegerField;
    QRContratoVenda_SaldoEmbDT_ENTREGA_FINAL: TDateTimeField;
    QRContratoVenda_SaldoEmbDESC_CIDADE: TStringField;
    QRContratoVend_MovQT_PESO_CHEGADA: TFloatField;
    QRContrato_Vend_ContabilCOD_CONTRATO_VEND: TFloatField;
    QRContrato_Vend_ContabilCOD_CADASTRO: TFloatField;
    QRContrato_Vend_ContabilDT_CONTRATO: TDateTimeField;
    QRContrato_Vend_ContabilNUM_CONTRATO: TFloatField;
    QRContrato_Vend_ContabilNOME: TStringField;
    QRContrato_Vend_ContabilSVALOR_CONTRATO: TFloatField;
    QRContrato_Vend_ContabilSVALOR_RECEBIDO: TFloatField;
    QRContrato_Vend_ContabilSVALOR_AJUSTE: TFloatField;
    QRContrato_Vend_ContabilSVALOR_DEVOLUCAO: TFloatField;
    QContratoQT_CREDITO_TRANSGENICOS: TFloatField;
    QContratoIND_BAIXA_CREDITO_MONSANTO: TStringField;
    QContratoConsIND_BAIXA_CREDITO_MONSANTO: TStringField;
    QContratoConsQT_CREDITO_TRANSGENICOS: TFloatField;
    QRResumoContrato_GP2: TOracleDataSet1;
    QRResumoContrato_GP2desc_mes: TStringField;
    QRResumoContrato_GP2valor_real: TFloatField;
    QRResumoContrato_GP2valor_dolar: TFloatField;
    QRResumoContrato_GP2COD_FILIAL: TIntegerField;
    QRResumoContrato_GP2COD_PRODUTO: TIntegerField;
    QRResumoContrato_GP2DESC_PRODUTO: TStringField;
    QRResumoContrato_GP2NUM_CONTRATO: TIntegerField;
    QRResumoContrato_GP2COD_CADASTRO: TIntegerField;
    QRResumoContrato_GP2NOME: TStringField;
    QRResumoContrato_GP2DT_PAGTO: TDateTimeField;
    QRResumoContrato_GP2DT_ENTREGA: TDateTimeField;
    QRResumoContrato_GP2MES_PAGAMENTO: TFloatField;
    QRResumoContrato_GP2DESC_TIPO_PRECO: TStringField;
    QRResumoContrato_GP2DESC_CIDADE: TStringField;
    QRResumoContrato_GP2DESC_FILIAL: TStringField;
    QRResumoContrato_GP2PRECO: TFloatField;
    QRResumoContrato_GP2STIPO_PRECO: TStringField;
    QRResumoContrato_GP2NUM_EMBALAGEM: TFloatField;
    QRResumoContrato_GP2QT_QUANTIDADE: TFloatField;
    QRContrato_Vend_GeralDT_CONTRATO: TDateTimeField;
    QRContratoQT_CREDITO_TRANSGENICOS: TFloatField;
    QRContratoIND_SOJICULTOR_PARTICIPANTE: TStringField;
    QRContratoIND_FISICA_JURIDICA: TStringField;
    QRContratoPERC_DPI_TRANSGENICOS: TFloatField;
    QRContratoIND_BAIXA_CREDITO_MONSANTO: TStringField;
    QContratoCOD_OPERACAO: TIntegerField;
    QContrato_GPCOD_OPERACAO: TIntegerField;
    QContrato_GPQT_AJUSTE: TFloatField;
    QContratoGP_MovIND_APLICADO_AJUSTE: TStringField;
    QRContratoGP_AbertoPRECO: TFloatField;
    QRContratoGP_AbertoDT_PAGTO: TDateTimeField;
    QRContratoGP_AbertoDT_CONTRATO: TDateTimeField;
    QRContratoGP_AbertoDT_ENTREGA: TDateTimeField;
    QRContratoGP_AbertoSANO: TStringField;
    QRContratoGP_AbertoQTDE_SALDO: TFloatField;
    QRContratoGP_AbertoDESC_TIPO_PRECO: TStringField;
    QRContratoGP_AbertoNOME: TStringField;
    QRContratoGP_AbertoDESC_PRODUTO: TStringField;
    QRContratoGP_AbertoDESC_CLASSE: TStringField;
    QRContratoGP_AbertoDESC_CIDADE: TStringField;
    QContrato_VendCOD_OPERACAO_INCLUSAO: TIntegerField;
    QContrato_GPIND_PAGAMENTO_ANTECIPADO: TStringField;
    QRContratoGP_AbertoCOD_CONTRATO_GP: TFloatField;
    QRContratoGP_AbertoCOD_FILIAL: TFloatField;
    QRContratoGP_AbertoCOD_CADASTRO: TFloatField;
    QRContratoGP_AbertoCOD_CIDADE_ENTREGA: TFloatField;
    QRContratoGP_AbertoCOD_PRODUTO: TFloatField;
    QRContratoGP_AbertoNUM_CONTRATO: TFloatField;
    QContrato_Vend_Variacao: TOracleDataSet1;
    QContrato_Vend_VariacaoCOD_CONTRATO_VEND_VARIACAO: TIntegerField;
    QContrato_Vend_VariacaoCOD_CONTRATO_VEND: TIntegerField;
    QContrato_Vend_VariacaoDT_VARIACAO: TDateTimeField;
    QContrato_Vend_VariacaoVL_VARIACAO: TFloatField;
    QContrato_GPQT_CREDITO_TRANSGENICOS: TFloatField;
    QContrato_GPIND_BAIXA_CREDITO_MONSANTO: TStringField;
    QRContratoCOD_CLASSE: TFloatField;
    QRContratoCOD_CIDADE_ENTREGA: TFloatField;
    QRContratovlr_mercado: TFloatField;
    QRContrato_GPCOD_CIDADE_ENTREGA: TIntegerField;
    QRContrato_GPVlr_Mercado: TFloatField;
    QRContrato_GPCOD_CLASSE: TIntegerField;
    QRContrato_GPval_contabil: TFloatField;
    QRContrato_GPIND_BAIXA_CREDITO_MONSANTO: TStringField;
    QRContrato_GPQT_CREDITO_TRANSGENICOS: TFloatField;
    QRContrato_GPPERC_DPI_TRANSGENICOS: TFloatField;
    QContrato_VendMovCOD_CONTRATO_GP: TIntegerField;
    QContrato_VendMovDeleta_GPCOD_CONTRATO_GP: TIntegerField;
    QContrato_VendCOD_ARMAZEM_ALFANDEGADO: TIntegerField;
    QContrato_VendConsNUM_CONTRATO_CLIENTE: TStringField;
    QContrato_VendCOD_LOTE_TIPO: TIntegerField;
    QContrato_VendPRECO: TFloatField;
    QContrato_VendConsPRECO: TFloatField;
    QContratoConsPRECO: TFloatField;
    QContratoPRECO: TFloatField;
    QContratoMovGP_AbertoPRECO: TFloatField;
    QRContratoPRECO: TFloatField;
    QContrato_GPPRECO: TFloatField;
    QContratoVendAltPRECO: TFloatField;
    QContrato_GPConsPRECO: TFloatField;
    QContratoVend_Doc: TOracleDataSet;
    QContratoVend_DocCOD_CONTRATO_VEND_DOC: TIntegerField;
    QContratoVend_DocNOME_ARQUIVO: TStringField;
    QContratoVend_DocDT_INCLUSAO: TDateTimeField;
    QContratoVend_DocDESCRICAO: TStringField;
    QContratoVend_DocARQUIVO: TBlobField;
    QContratoVend_DocCOD_CONTRATO_VEND: TIntegerField;
    QContratoGP_Doc: TOracleDataSet;
    QContratoGP_DocCOD_CONTRATO_GP_DOC: TIntegerField;
    QContratoGP_DocNOME_ARQUIVO: TStringField;
    QContratoGP_DocDT_INCLUSAO: TDateTimeField;
    QContratoGP_DocDESCRICAO: TStringField;
    QContratoGP_DocARQUIVO: TBlobField;
    QContratoGP_DocCOD_CONTRATO_GP: TIntegerField;
    QContrato_Doc: TOracleDataSet;
    QContrato_DocCOD_CONTRATO_DOC: TIntegerField;
    QContrato_DocNOME_ARQUIVO: TStringField;
    QContrato_DocDT_INCLUSAO: TDateTimeField;
    QContrato_DocDESCRICAO: TStringField;
    QContrato_DocARQUIVO: TBlobField;
    QContrato_DocCOD_CONTRATO: TIntegerField;
    QContratoQT_QUANTIDADE: TFloatField;
    QContratoQTDE_SALDO: TFloatField;
    QRContrato_GPPRECO: TFloatField;
    procedure QContratoAfterInsert(DataSet: TDataSet);
    procedure QContratoBeforePost(DataSet: TDataSet);
    procedure QContratoBeforeInsert(DataSet: TDataSet);
    procedure QContratoBeforeEdit(DataSet: TDataSet);
    procedure QContratoCOD_CADASTROValidate(Sender: TField);
    procedure QContratoMovAntecipadoAfterInsert(DataSet: TDataSet);
    procedure QContrato_GPBeforePost(DataSet: TDataSet);
    procedure QContrato_GPAfterInsert(DataSet: TDataSet);
    procedure QContrato_GPCOD_CADASTROValidate(Sender: TField);
    procedure QContrato_GPBeforeInsert(DataSet: TDataSet);
    procedure QContrato_VendAfterInsert(DataSet: TDataSet);
    procedure QContrato_VendBeforePost(DataSet: TDataSet);
    procedure QContrato_VendBeforeInsert(DataSet: TDataSet);
    procedure QContrato_VendBeforeEdit(DataSet: TDataSet);
    procedure QContrato_Vend_PagtoAfterInsert(DataSet: TDataSet);
    procedure QContrato_Vend_PagtoAfterPost(DataSet: TDataSet);
    procedure QContrato_VendCalcFields(DataSet: TDataSet);
    procedure QContratoMovAnt_AbertoAfterScroll(DataSet: TDataSet);
    procedure QContratoMovGP_AbertoAfterScroll(DataSet: TDataSet);
    procedure QTotalContratoGPCalcFields(DataSet: TDataSet);
    procedure QTotalNotaItemCalcFields(DataSet: TDataSet);
    procedure QContratoVend_NotaAfterScroll(DataSet: TDataSet);
    procedure QContratoMovAnt_AbertoCalcFields(DataSet: TDataSet);
    procedure QContratoMovGP_AbertoCalcFields(DataSet: TDataSet);
    procedure QRContratoCalcFields(DataSet: TDataSet);
    procedure QRContrato_VendCalcFields(DataSet: TDataSet);
    procedure QContrato_VendAfterPost(DataSet: TDataSet);
    procedure QContrato_VendCOD_CADASTROValidate(Sender: TField);
    procedure QRContratoC_AbertoCalcFields(DataSet: TDataSet);
    procedure QRContrato_Vend_Nota_CustosCalcFields(DataSet: TDataSet);
    procedure QContratoVend_NotaCalcFields(DataSet: TDataSet);
    procedure QRContrato_Vend_RecebimentoCalcFields(DataSet: TDataSet);
    procedure QRNotaAgricola_AbertoCalcFields(DataSet: TDataSet);
    Procedure MontaSql(wClasse,wSubClasse,wSaldo,wEmbarque:Integer; wFilial,wCliente,wProduto,wCorretora,wContrato,wDtInicial,wDtFinal:String;wMercado:Integer);
    procedure QContrato_VendMovDeleta_GPCalcFields(DataSet: TDataSet);
    procedure QContrato_VendMovDeletaCalcFields(DataSet: TDataSet);
    procedure QContratoCalcFields(DataSet: TDataSet);
    procedure QRContrato_GPCalcFields(DataSet: TDataSet);
    procedure QContrato_GPCalcFields(DataSet: TDataSet);
    procedure QRResumoContrato_GPCalcFields(DataSet: TDataSet);
    procedure QRResumoContrato_GP2CalcFields(DataSet: TDataSet);


  private
    fTipo_Valor : Integer;  {tipo de valor para relatório de contratos 1-real 2-dolar}
    fBaixa_Automatica : boolean; // serve para indicar baixa automatica na tela FBaixaItemNota (nao realiza busca na query QContratoVendNota)
    { Private declarations }
  public
    Property pTipo_Valor : Integer Read fTipo_Valor Write fTipo_Valor;
    Property pBaixa_Automatica : Boolean Read fBaixa_Automatica Write fBaixa_Automatica Default False;
    procedure AtualizaContrato;  // atualizar os saldos de embarque - usa no contrato de venda e nas notas de entrada

    { Public declarations }
  end;

var
  DMContrato: TDMContrato;
  wDtBase_Contrato : TDateTime;

implementation

uses UOracle_cl, USequencia_cl, UParamSistema_cl, UUsuario_cl, UMoeda_cl;

{$R *.DFM}

procedure TDMContrato.QContratoAfterInsert(DataSet: TDataSet);
begin
//  QContratoCod_contrato.Value:=DMOracle.Sequencia('CONTRATO');
  QContratoCOD_Filial.Value:=DMUsuario.CodFilialUsuario;
  QContratoDT_EMISSAO.Value:=DMoracle.DataServ;
  QContratoDT_VENCIMENTO.Value:=DMoracle.DataServ;
  QContratoDT_ENTREGA.Value:=DMoracle.DataServ;
  QContratoIND_FIXAR.Value:=1;
  QContratoIND_ICMS.Value:=2;
  QContratoIND_SITUACAO.Value:='ABERTO';
  QContratoIND_FRETE.Value:='CIF';
  QContratoIND_TIPO_SAFRA.Value:='SAFRA';
  QContratoIND_TIPO_PAGAMENTO.Value:='F';
  QContratoDESC_ACONDICIONAMENTO.Value:='A GRANEL';
  QContratoDESC_LOCAL_ENTREGA.Value:='NOS ARMAZENS DA COMPRADORA';
  QContratoTIPO_BASE.Value:='EXPORTAÇÃO';
  QContratoNUM_CONTRATO.Value:=0;
end;

procedure TDMContrato.QContratoBeforePost(DataSet: TDataSet);
begin
  DMOracle.ValidaFilial(QContratoCOD_FILIAL.Text);
  if QContrato.State = dsInsert then
    If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'GONZATTI') And (QContratoInd_Fixar.Value = 2) Then
       QContratoNUM_CONTRATO.Value:=DMSequencia.Sequencia(Trunc(QCONTRATOCOD_FILIAL.VALUE),'Contrato_Fixar')
    Else
       QContratoNUM_CONTRATO.Value:=DMSequencia.Sequencia(Trunc(QCONTRATOCOD_FILIAL.VALUE),'Contrato');
end;

procedure TDMContrato.QContratoBeforeInsert(DataSet: TDataSet);
begin
  if not(DMOracle.DBCemapa.InTransaction) then
    DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMContrato.QContratoBeforeEdit(DataSet: TDataSet);
begin
  if not(DMOracle.DBCemapa.InTransaction) then
    DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMContrato.QContratoCOD_CADASTROValidate(Sender: TField);
var
  aux:string;
begin
  aux:=DMOracle.Buscanome('SELECT PERC_FUNRURAL FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(QContratoCOD_CADASTRO.Value));
  if trim(aux)<>'' then
    QContratoPERC_FUNRURAL.Value:=StrToFloat(aux)
  else
    QContratoPERC_FUNRURAL.Value:=0;

  if Trim(QContratoCOD_CADASTRO.Text) <> '' then
  begin
    if Trim(DMOracle.BuscaNome('SELECT DT_CANCELAMENTO FROM TB_CADASTRO',' COD_CADASTRO = '+QContratoCOD_CADASTRO.Text)) <> '' then
       raise exception.Create('ATENÇÃO - Cadastro Cancelado, Verifique!')
  end;
end;

procedure TDMContrato.QContratoMovAntecipadoAfterInsert(DataSet: TDataSet);
begin
//  QContratoMovAntecipadoCOD_CONTRATO_MOV.Value:=DMOracle.Sequencia('CONTRATO_ANTECIPADO');
end;

procedure TDMContrato.QContrato_GPBeforePost(DataSet: TDataSet);
begin
  DMOracle.ValidaFilial(QContrato_GPCOD_FILIAL.Text);
  If QContrato_GP.State = dsInsert then
    begin
      QContrato_GPQTDE_SALDO.Value:=QContrato_GPQT_QUANTIDADE.Value;
      If DMParamSistema.QparamSistemaCod_Empresa.Value = 'MOINHO' Then
         QContrato_GPNUM_CONTRATO.Value:=DMSequencia.Sequencia(Trunc(QCONTRATO_GPCOD_FILIAL.VALUE),'Contrato_gp')
      else
       Begin
         If QContrato_GPDESC_TIPO_PRECO.Value = 'REAL' Then
            QContrato_GPNUM_CONTRATO.Value:=DMSequencia.Sequencia(Trunc(QCONTRATO_GPCOD_FILIAL.VALUE),'Contrato_gp')
         Else
            QContrato_GPNUM_CONTRATO.Value:=DMSequencia.Sequencia(Trunc(QCONTRATO_GPCOD_FILIAL.VALUE),'Contrato_gp_Dolar');
       End;
    end;
end;

procedure TDMContrato.QContrato_GPAfterInsert(DataSet: TDataSet);
begin
  QContrato_GPIND_SITUACAO.VALUE := 'ABERTO';
  QContrato_GPIND_TIPO_BASE.VALUE := 'EXPORTAÇÃO';
  QContrato_GPDESC_ACONDICIONAMENTO.VALUE := 'A GRANEL';
  QContrato_GPLOCAL_ENTREGA.VALUE := 'NOS ARMAZENS DA COMPRADORA';
  QContrato_GPDT_CONTRATO.VAlue:=DMOracle.DataServ;
  QContrato_GPCOD_FILIAL.VAlue:=DMUsuario.CodFilialUsuario;
end;

procedure TDMContrato.QContrato_GPCOD_CADASTROValidate(Sender: TField);
var
  aux:string;
begin
  aux:=DMOracle.Buscanome('SELECT PERC_FUNRURAL FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(QContrato_GPCOD_CADASTRO.Value));
  if trim(aux)<>'' then
    QContrato_GPPERC_FUNRURAL.Value:=StrToFloat(aux)
  else
    QContrato_GPPERC_FUNRURAL.Value:=0;

  if Trim(QContrato_GPCOD_CADASTRO.Text) <> '' then
  begin
    if Trim(DMOracle.BuscaNome('SELECT DT_CANCELAMENTO FROM TB_CADASTRO',' COD_CADASTRO = '+QContrato_GPCOD_CADASTRO.Text)) <> '' then
       raise exception.Create('ATENÇÃO - Cadastro Cancelado, Verifique!')
  end;   
end;

procedure TDMContrato.QContrato_GPBeforeInsert(DataSet: TDataSet);
begin
  if not(DMOracle.DBCemapa.InTransaction) then
    DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMContrato.QContrato_VendAfterInsert(DataSet: TDataSet);
begin
  QContrato_VendDT_CONTRATO.Value:=DMOracle.DataServ;
  QContrato_VendIND_RET_ENTR.Value:='RETIRADA';
  QContrato_VendQT_QUANTIDADE.Value:=1;
  QContrato_VendNUM_CONTRATO.Value:=0;
  QContrato_VendCod_Usuario.Value := DMUsuario.CodUsuarioCorrente
end;

procedure TDMContrato.QContrato_VendBeforePost(DataSet: TDataSet);
begin
  if QContrato_VendNUM_CONTRATO.Value = 0 Then
   Begin
     QContrato_VendNUM_CONTRATO.Value:=DMSequencia.Sequencia(Trunc(QContrato_VendCOD_FILIAL.Value),'Contrato_venda');
     QContrato_VendVAL_SALDO.Value:=QContrato_VendQT_QUANTIDADE.Value;
   End;
end;

procedure TDMContrato.QContrato_VendBeforeInsert(DataSet: TDataSet);
begin
  if not(DMOracle.DBCemapa.InTransaction) then
    DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMContrato.QContrato_VendBeforeEdit(DataSet: TDataSet);
begin
  if not(DMOracle.DBCemapa.InTransaction) then
    DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMContrato.QContrato_Vend_PagtoAfterInsert(DataSet: TDataSet);
begin
  QContrato_Vend_PagtoCOD_CONTRATO_VEND.Value:=QContrato_VendCOD_CONTRATO_VEND.Value;
//  QContrato_Vend_PagtoCOD_CONTRATO_PGTO.Value:=DMOracle.Sequencia('CONTRATO_VENDA_PAGTO');
end;

procedure TDMContrato.QContrato_Vend_PagtoAfterPost(DataSet: TDataSet);
begin
  QContrato_Vend_Pagto.Close;
  QContrato_Vend_Pagto.Open;
end;

procedure TDMContrato.QContrato_VendCalcFields(DataSet: TDataSet);
var  waux:string;
 wEmb, wFunRural : Real;
begin
//  If (QContrato_VendVal_Dolar.Text <> '') And (QContrato_VendVal_Dolar.Value <> 0) Then
//     QContrato_Vendtotal.Value := QContrato_VendVal_Dolar.Value
//  Else
//   Begin
     wAux:=DMOracle.BuscaNome('SELECT NUM_EMBALAGEM FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QContrato_VendCOD_PRODUTO.Value));
     if wAux<>'' then
       wEmb:=StrtoFloat(wAux)
     else
       wEmb:=0;
     wFunRural:=0;
     If wEmb >0 then
      Begin
         QContrato_Vendtotal.value:=Trunc((QContrato_VendPRECO.Value*QContrato_VendQT_Quantidade.Value)/wEmb*((100-wFunRural)/100)*100);
         QContrato_Vendtotal.value:=QContrato_Vendtotal.value / 100;
      End;
//   End;
  If QContrato_VendIND_MOEDA_PRECO.Value = 'DOLAR' Then
   Begin
     DMMoeda.QCotacao.Close;
     DMMoeda.QCotacao.SetVariable('Cod_Moeda',2);
     DMMoeda.QCotacao.SetVariable('Data_I',QContrato_VendDT_CONTRATO.Value);
     DMMoeda.QCotacao.Open;
     QContrato_Vendtotal.value := QContrato_VendVAL_DOLAR.Value * DMMoeda.QCotacaoVlr_Cotacao.Value;
   End
  Else
   QContrato_Vendtotal.value:= QContrato_Vendtotal.value + QContrato_VendVal_Ajuste.value;
  QContrato_Vendvalor_aplicado.Value:=QContrato_VendQt_Quantidade.Value - QContrato_VendSALDO_NF_EMBARQUE.Value;
end;

procedure TDMContrato.QContratoMovAnt_AbertoAfterScroll(DataSet: TDataSet);
Var wClasse,wSubClasse,wCodClasse : Integer;
    wCodProduto : Real;
begin
  wClasse:=0;
  wSubClasse:=0;
  if DMContrato.QContratoMovGP_AbertoCOD_CONTRATO_GP.Value>0 then
    begin
      wCodProduto:=StrToFloat(DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_CONTRATO_GP','COD_CONTRATO_GP = '+FloatToStr(DMContrato.QContratoMovGP_AbertoCOD_CONTRATO_GP.Value)));
      wCodClasse:=StrToInt(DMOracle.BuscaNome('SELECT COD_CLASSE FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(wCodProduto)));
      wClasse:=StrToInt(DMOracle.BuscaNome('SELECT NUM_CLASSE FROM TB_CLASSE','COD_CLASSE = '+FloatToStr(wCodClasse)));
      wSubClasse:=StrToInt(DMOracle.BuscaNome('SELECT NUM_SUBCLASSE FROM TB_CLASSE','COD_CLASSE = '+FloatToStr(wCodClasse)));
    end;
  With DMContrato do
  Begin
    MontaSql(wClasse,wSubClasse,0,2,'','','','','','','',4);
  End;
end;

procedure TDMContrato.QContratoMovGP_AbertoAfterScroll(DataSet: TDataSet);
Var wClasse,wSubClasse,wCodClasse : Integer;
    wCodProduto : Real;
begin
  wClasse   :=0;
  wSubClasse:=0;
  if DMContrato.QContratoMovGP_AbertoCOD_CONTRATO_GP.Value>0 then
    begin
      wCodProduto:=StrToFloat(DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_CONTRATO_GP','COD_CONTRATO_GP = '+FloatToStr(DMContrato.QContratoMovGP_AbertoCOD_CONTRATO_GP.Value)));
      wCodClasse:=StrToInt(DMOracle.BuscaNome('SELECT COD_CLASSE FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(wCodProduto)));
      wClasse:=StrToInt(DMOracle.BuscaNome('SELECT NUM_CLASSE FROM TB_CLASSE','COD_CLASSE = '+FloatToStr(wCodClasse)));
      wSubClasse:=StrToInt(DMOracle.BuscaNome('SELECT NUM_SUBCLASSE FROM TB_CLASSE','COD_CLASSE = '+FloatToStr(wCodClasse)));
    end;
  With DMContrato do
  Begin
    MontaSql(wClasse,wSubClasse,0,2,'','','','','','','',4);
  End;
end;

procedure TDMContrato.QTotalContratoGPCalcFields(DataSet: TDataSet);
begin
  QTotalContratoGPsaldo_disponivel.value:=QContratoMovGP_AbertoQT_QUANTIDADE.Value - QTotalContratoGPTotal_Quantidade.Value;
end;

procedure TDMContrato.QTotalNotaItemCalcFields(DataSet: TDataSet);
begin
  QTotalNotaItemsaldo_disponivel.value:=QContratoVend_NotaQT_QUANTIDADE.Value - QTotalNotaItemTotal_Quantidade.Value;
end;

procedure TDMContrato.QContratoVend_NotaAfterScroll(DataSet: TDataSet);
var
  wClasse,wSubClasse,wCodClasse : Integer;
  wCodProduto : Real;
begin
  If Not(pBaixa_Automatica) Then
  Begin
    wClasse:=0;
    wSubClasse:=0;
    if DMContrato.QContratoVend_NotaCOD_NOTA_ITEM.Value > 0 then
      begin
        wCodProduto:=StrToFloat(DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_NOTA_ITEM','COD_NOTA_ITEM = '+FloatToStr(DMContrato.QContratoVend_NotaCOD_NOTA_ITEM.Value)));
        wCodClasse:=StrToInt(DMOracle.BuscaNome('SELECT COD_CLASSE FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(wCodProduto)));
        wClasse:=StrToInt(DMOracle.BuscaNome('SELECT NUM_CLASSE FROM TB_CLASSE','COD_CLASSE = '+FloatToStr(wCodClasse)));
        wSubClasse:=StrToInt(DMOracle.BuscaNome('SELECT NUM_SUBCLASSE FROM TB_CLASSE','COD_CLASSE = '+FloatToStr(wCodClasse)));
      end;
    With DMContrato do
    Begin
      MontaSql(wClasse,wSubClasse,0,2,'','','','','','','',4);
    End;
  End;
end;

procedure TDMContrato.QContratoMovAnt_AbertoCalcFields(DataSet: TDataSet);
begin
  QContratoMovAnt_Abertodesc_produto.Value:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+QContratoMovAnt_AbertoCod_produto.text);
  QContratoMovAnt_Abertodesc_filial.Value:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+QContratoMovAnt_AbertoCod_filial.text);
end;

procedure TDMContrato.QContratoMovGP_AbertoCalcFields(DataSet: TDataSet);
begin
  QContratoMovGP_Abertodesc_produto.Value:=DmOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+QContratoMovGP_AbertoCod_produto.text);
  QContratoMovGP_Abertodesc_Filial.Value:=DmOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+QContratoMovGP_AbertoCod_filial.text);
end;

procedure TDMContrato.QRContratoCalcFields(DataSet: TDataSet);
Var wDolar,wData_Ref : String;
    wDpi,wFunrural,wValor_Produto : Real;
begin
  If QRContratoVal_Dolar.Value <> 0 Then
   Begin
     wData_Ref := DateToStr(Date);
     wDolar := DmOracle.BuscaNome('SELECT VLR_COTACAO FROM TB_COTACAO', 'COD_MOEDA = 2 AND DT_COTACAO =' + chr(39) + wData_Ref + chr(39));
     if wDolar <> '' Then
      Begin
        wDpi := 0;
        If (QRContratoPERC_DPI_TRANSGENICOS.Text <> '') And (QRContratoIND_SOJICULTOR_PARTICIPANTE.Value <> 'PAR') Then  // identifica que é uma compra de pessoa juridica e tem percentual de DPI transgenico
           wDpi := (((QRContratoVAL_DOLAR.Value*(QRContratoSALDO.Value-QRContratoQT_Credito_Transgenicos.Value)*StrToFloat(wDolar)/QRContratoNUM_EMBALAGEM.Value * QRContratoPERC_DPI_TRANSGENICOS.Value) / 100) * 100) / 100;

        QRContratosVal_Contrato.Value := QRContratoVAL_DOLAR.Value*QRContratoSALDO.Value*StrToFloat(wDolar)/QRContratoNUM_EMBALAGEM.Value*
                                         ((100-QRContratoPERC_FUNRURAL.Value)/100);
        QRContratosVal_Contrato.Value := Round((QRContratosVal_Contrato.Value - wDpi) * 100) / 100;
      End
   End
  Else
   Begin
     wDpi := 0;
     If QrContratoIND_BAIXA_CREDITO_MONSANTO.Value = 'SIM' Then
       If QrContratoQT_CREDITO_TRANSGENICOS.Text <> '' Then
        If (QRContratoPERC_DPI_TRANSGENICOS.Text <> '')  Then  // identifica que é uma compra de pessoa juridica e tem percentual de DPI transgenico
            wDpi := (((QRContratoPRECO.Value*(QRContratoSALDO.Value-QRContratoQT_Credito_Transgenicos.Value)/QRContratoNUM_EMBALAGEM.Value * QRContratoPERC_DPI_TRANSGENICOS.Value) / 100) * 100) / 100;
     QRContratosVal_Contrato.Value := QRContratoPRECO.Value*QRContratoSALDO.Value/QRContratoNUM_EMBALAGEM.Value*
                                   ((100-QRContratoPERC_FUNRURAL.Value)/100);
     QRContratosVal_Contrato.Value := Round((QRContratosVal_Contrato.Value - wDpi) * 100) / 100;
   End;
  If QRContratoCOD_CIDADE_ENTREGA.Text <> '' Then
   Begin
     wValor_Produto := StrToFloat('0' + DmOracle.BuscaNome('SELECT VAL_PRECO FROM TB_PRECO_CIDADE_CLASSE', 'COD_CLASSE = '+ QRContratoCOD_CLASSE.Text + ' And COD_CIDADE = ' + QRContratoCOD_CIDADE_ENTREGA.Text + ' And DT_REFERENCIA = ' + QuoteDStr(DateToStr(wDtBase_Contrato))));
     If wValor_Produto > 0 Then
        QRContratoVlr_Mercado.Value := wValor_Produto * QRContratoSALDO.Value / QRContratoNUM_EMBALAGEM.Value;
   End;
end;

procedure TDMContrato.QRContrato_VendCalcFields(DataSet: TDataSet);
Var wBancoAgencia,wValIcm,wValComp,wVal_Frete_Notas,wVal_Correcao : String;
begin
  QRContrato_VendCorretora.Value := DmOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + FloattoStr(QrContrato_VendCod_CORRETORA.Value));
  wValIcm := DmOracle.BuscaNome('SELECT SUM(TB_NOTA_ITEM.VAL_ICM) FROM TB_NOTA_CAB,TB_NOTA_ITEM', 'TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_CAB AND TB_NOTA_CAB.COD_CONTRATO_VEND=' + FloattoStr(QrContrato_VendCod_Contrato_Vend.Value));
  If wValIcm <> '' Then
     QRContrato_VendVal_Icms_Notas.Value := StrToFloat(wValIcm);
  wValComp := DmOracle.BuscaNome('SELECT SUM(VAL_MOVIMENTO) FROM TB_CONTRATO_VEND_MOV', 'COD_CONTRATO_VEND=' + FloatToStr(QrContrato_VendCod_Contrato_Vend.Value));
//  wValCustos := DmOracle.BuscaNome('SELECT SUM(VAL_LANCAMENTO) FROM TB_CONTRATO_VEND_CUSTOS', 'COD_CONTRATO_VEND=' + FloatToStr(QrContrato_VendCod_Contrato_Vend.Value));
  If wValComp <> '' Then
     QRContrato_VendVal_Custo_Comp.Value := StrToFloat(wValComp)
  else
     QRContrato_VendVal_Custo_Comp.Value := 0;
//  If wValCustos <> '' Then  RETIRADO PELO CÉSAR PORQUE O MOVIMENTO JÁ ESTA NA TABELA TB_CONTRATO_VEND_MOV (ANTES NAO ESTAVA)
//     QRContrato_VendVal_Custo_Comp.Value := QRContrato_VendVal_Custo_Comp.Value + StrToFloat(wValCustos);
  If QrContrato_VendCod_CC.Text <> '' Then
  Begin
    QRContrato_VendConta_Corrente.Value := DmOracle.BuscaNome('SELECT NUM_CONTA_CORRENTE FROM TB_CONTA_CORRENTE', 'COD_CONTA_CORRENTE = ' + FloatToStr(QrContrato_VendCod_CC.Value));
    wBancoAgencia := DmOracle.BuscaNome('SELECT COD_BANCO_AGENCIA FROM TB_CONTA_CORRENTE', 'COD_CONTA_CORRENTE = ' + FloatToStr(QrContrato_VendCod_CC.Value));
    QRContrato_VendDesc_Banco_Agencia.Value := DmOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA', 'COD_BANCO_AGENCIA = ' + wBancoAgencia);
    QRContrato_VendCod_Agencia.Value := StrToInt(DmOracle.BuscaNome('SELECT COD_AGENCIA FROM TB_BANCO_AGENCIA', 'COD_BANCO_AGENCIA = ' + wBancoAgencia));
  End;
  wVal_Frete_Notas := DMOracle.BuscaNome('SELECT SUM(VAL_FRETE+VAL_PEDAGIO+VAL_ICMS+VAL_ESTADIA-VAL_DESCONTO+VAL_QUEBRA_TECNICA) FROM TB_CONHECIMENTO_FRETE','COD_CONTRATO_VEND =' +FloatToStr(QRContrato_VendCOD_CONTRATO_VEND.VALUE));
  If wVal_Frete_Notas <> '' Then
     QRContrato_VendVal_Frete_Notas.Value := StrToFloat(wVal_Frete_Notas);
  wVal_Frete_Notas := DMOracle.BuscaNome('SELECT SUM(VAL_FRETE+VAL_PEDAGIO+VAL_ICMS+VAL_VARIACAO_FRETE+VAL_ESTADIA) FROM TB_CONHECIMENTO','COD_CONTRATO_VEND =' +FloatToStr(QRContrato_VendCOD_CONTRATO_VEND.VALUE));
  If wVal_Frete_Notas <> '' Then
     QRContrato_VendVal_Frete_Notas.Value := QRContrato_VendVal_Frete_Notas.Value + StrToFloat(wVal_Frete_Notas);
  wVal_Frete_Notas := DMOracle.BuscaNome('SELECT SUM(VAL_SERVICO+NVL(VAL_PEDAGIO,0)+NVL(VAL_ICMS_DEVIDO,0)) FROM TB_RPA','COD_CONTRATO_VEND =' +FloatToStr(QRContrato_VendCOD_CONTRATO_VEND.VALUE));
  If wVal_Frete_Notas <> '' Then
     QRContrato_VendVal_Frete_Notas.Value := QRContrato_VendVal_Frete_Notas.Value + StrToFloat(wVal_Frete_Notas);
  wVal_Correcao:=DMOracle.BuscaNome('SELECT SUM(VAL_MOVIMENTO) FROM TB_CONTA_RECEBER_CAB A,TB_CONTA_RECEBER_MOV B','A.COD_CONTA_RECEBER_CAB=B.COD_CONTA_RECEBER_CAB AND B.IND_TIPO_MOVIMENTO=' + CHR(39) + 'DESC. CONCEDIDO' + CHR(39)+ 'AND A.COD_CONTRATO_VEND =' +FloatToStr(QRContrato_VendCOD_CONTRATO_VEND.VALUE));
  If wVal_Correcao <> '' Then
   QRContrato_Vendval_variacao_cambial_Neg.Value := StrToFloat(wVal_Correcao);
  wVal_Correcao:=DMOracle.BuscaNome('SELECT SUM(VAL_MOVIMENTO) FROM TB_CONTA_RECEBER_CAB A,TB_CONTA_RECEBER_MOV B','A.COD_CONTA_RECEBER_CAB=B.COD_CONTA_RECEBER_CAB AND B.IND_TIPO_MOVIMENTO=' + CHR(39) + 'RECEBTO. JUROS' + CHR(39)+ 'AND A.COD_CONTRATO_VEND =' +FloatToStr(QRContrato_VendCOD_CONTRATO_VEND.VALUE));
  If wVal_Correcao <> '' Then
    QRContrato_Vendval_variacao_cambial_Pos.Value := StrToFloat(wVal_Correcao);
end;

procedure TDMContrato.QContrato_VendAfterPost(DataSet: TDataSet);
Var wCod_Contrato : Integer;
begin
  wCod_Contrato := QContrato_VendCOD_CONTRATO_VEND.value;
  QContrato_Vend.Close;
  QContrato_Vend.SetVariable('PK',wCod_Contrato);
  QContrato_Vend.Open;
end;

procedure TDMContrato.QContrato_VendCOD_CADASTROValidate(Sender: TField);
begin
 if Trim(QContrato_VendCOD_CADASTRO.Text) <> '' then
  begin
    if Trim(DMOracle.BuscaNome('SELECT DT_CANCELAMENTO FROM TB_CADASTRO',' COD_CADASTRO = '+QContrato_VendCOD_CADASTRO.Text)) <> '' then
       raise exception.Create('ATENÇÃO - Cadastro Cancelado, Verifique!')
  end;
end;

procedure TDMContrato.QRContratoC_AbertoCalcFields(DataSet: TDataSet);
Var wBaixa : String;
begin
  If DMParamSistema.QparamSistemaCod_Empresa.Value = 'MOINHO' Then
     QRContratoC_AbertoQTDE_SALDO.Value := QRContratoC_AbertoQT_SALDO.Value
  Else
    Begin
      wBaixa := DmOracle.BuscaNome('SELECT SUM(QT_QUANTIDADE) FROM TB_CONTRATO_MOV_ANTECIPADA', 'COD_CONTRATO = ' + QRContratoC_AbertoCOD_CONTRATO.Text);
      If wBaixa <> '' Then
         QRContratoC_AbertoQTDE_SALDO.Value := QRContratoC_AbertoQt_Quantidade.Value - StrToFloat(wBaixa)
      Else
         QRContratoC_AbertoQTDE_SALDO.Value := QRContratoC_AbertoQt_Quantidade.Value;
    End;
  If pTipo_Valor = 1 Then
   Begin
     QRContratoC_AbertoVal_Unitario.Value := QRContratoC_AbertoPRECO.Value;
     QRContratoC_AbertoValor_Saldo.Value := (QRContratoC_AbertoQTDE_SALDO.Value*QRContratoC_AbertoPRECO.Value/QRContratoC_AbertoNUM_EMBALAGEM.Value);
   End
  Else
   Begin
     QRContratoC_AbertoVal_Unitario.Value := QRContratoC_AbertoVAL_DOLAR.Value;
     QRContratoC_AbertoValor_Saldo.Value := (QRContratoC_AbertoQTDE_SALDO.Value*QRContratoC_AbertoVAL_DOLAR.Value/QRContratoC_AbertoNUM_EMBALAGEM.Value);
   End;
  If DMParamSistema.QparamSistemaCod_Empresa.Value = 'GONZATTI' Then
    QRContratoC_AbertoValor_Saldo.Value := QRContratoC_AbertoValor_Saldo.Value -
                 (QRContratoC_AbertoValor_Saldo.Value*QRContratoC_AbertoPERC_FUNRURAL.Value/100);
end;

procedure TDMContrato.QRContrato_Vend_Nota_CustosCalcFields(
  DataSet: TDataSet);
Var wDolar,wDtVencto : String;
begin
  If QRContrato_Vend_Nota_CustosCOD_NOTA_CAB.Value <> 0 Then
  Begin
    wDtVencto := DmOracle.BuscaNome('SELECT DT_VENCIMENTO FROM TB_CONTA_PAGAR_CAB', 'COD_NOTA_CAB = ' + FloatToStr(QRContrato_Vend_Nota_CustosCOD_NOTA_CAB.Value));
    QRContrato_Vend_Nota_CustosVal_Dolar.Value :=  0;
    If wDtVencto <> '' Then
    Begin
      QRContrato_Vend_Nota_CustosDt_Vencimento.Value := StrToDate(wDtVencto);
      wDolar := DmOracle.BuscaNome('SELECT VLR_COTACAO FROM TB_COTACAO', 'COD_MOEDA = 2 AND DT_COTACAO =' + chr(39) + wDtVencto + chr(39));
      if wDolar <> '' Then
         QRContrato_Vend_Nota_CustosVal_Dolar.Value :=  QRContrato_Vend_Nota_CustosVal_Movimento.Value / StrToFloat(wDolar);
    End;
  End;
  If QRContrato_Vend_Nota_CustosCOD_CONTRATO_MOV.Value <> 0 Then
  Begin
    QRContrato_Vend_Nota_CustosVal_Dolar.Value :=  0;
    QRContrato_Vend_Nota_CustosDt_Vencimento.Value := QRContrato_Vend_Nota_CustosDT_VENCIMENTO_CONTRATO.Value;
    If DateToStr(QRContrato_Vend_Nota_CustosDT_VENCIMENTO_CONTRATO.Value) <> '' Then
    Begin
      wDolar := DmOracle.BuscaNome('SELECT VLR_COTACAO FROM TB_COTACAO', 'COD_MOEDA = 2 AND DT_COTACAO =' + chr(39) + DateToStr(QRContrato_Vend_Nota_CustosDt_Vencimento_Contrato.Value) + chr(39));
      if wDolar <> '' Then
         QRContrato_Vend_Nota_CustosVal_Dolar.Value :=  QRContrato_Vend_Nota_CustosVal_Movimento.Value / StrToFloat(wDolar);
    End;
  End;
  If QRContrato_Vend_Nota_CustosCOD_CONTRATO_GP_MOV.Value <> 0 Then
  Begin
    QRContrato_Vend_Nota_CustosVal_Dolar.Value :=  0;
    QRContrato_Vend_Nota_CustosDt_Vencimento.Value := QRContrato_Vend_Nota_CustosDT_VENCIMENTO_CONTRATO.Value;
    If DateToStr(QRContrato_Vend_Nota_CustosDT_VENCIMENTO_CONTRATO.Value) <> '' Then
    Begin
      wDolar := DmOracle.BuscaNome('SELECT VLR_COTACAO FROM TB_COTACAO', 'COD_MOEDA = 2 AND DT_COTACAO =' + chr(39) + DateToStr(QRContrato_Vend_Nota_CustosDt_Vencimento_Contrato.Value) + chr(39));
      if wDolar <> '' Then
         QRContrato_Vend_Nota_CustosVal_Dolar.Value :=  QRContrato_Vend_Nota_CustosVal_Movimento.Value / StrToFloat(wDolar);
    End;
  End;
  If QRContrato_Vend_Nota_CustosCOD_CONTRATO_VEND_CUSTOS.Value <> 0 Then
  Begin
    QRContrato_Vend_Nota_CustosVal_Dolar.Value :=  0;
    QRContrato_Vend_Nota_CustosDt_Vencimento.Value := QRContrato_Vend_Nota_CustosDT_VENCIMENTO_CONTRATO.Value;
    If DateToStr(QRContrato_Vend_Nota_CustosDT_VENCIMENTO_CONTRATO.Value) <> '' Then
    Begin
      wDolar := DmOracle.BuscaNome('SELECT VLR_COTACAO FROM TB_COTACAO', 'COD_MOEDA = 2 AND DT_COTACAO =' + chr(39) + DateToStr(QRContrato_Vend_Nota_CustosDt_Vencimento_Contrato.Value) + chr(39));
      if wDolar <> '' Then
         QRContrato_Vend_Nota_CustosVal_Dolar.Value :=  QRContrato_Vend_Nota_CustosVal_Movimento.Value / StrToFloat(wDolar);
    End;
  End;
  If QRContrato_Vend_Nota_CustosCOD_CADASTRO_PARCEIRO.Text <> '' Then
      QRContrato_Vend_Nota_CustosNOME_PARCEIRO.Value := DmOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + FloatToStr(QRContrato_Vend_Nota_CustosCOD_CADASTRO_PARCEIRO.Value));
  If QRContrato_Vend_Nota_CustosCOD_FILIAL.Text <> '' Then
      QRContrato_Vend_Nota_CustosDesc_Filial.Value := DmOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL', 'COD_FILIAL = ' + FloatToStr(QRContrato_Vend_Nota_CustosCOD_FILIAL.Value));
end;

procedure TDMContrato.QContratoVend_NotaCalcFields(DataSet: TDataSet);
Var wDtVencto : String;
begin
  wDtVencto := DmOracle.BuscaNome('SELECT DT_VENCIMENTO FROM TB_CONTA_PAGAR_CAB', 'COD_NOTA_CAB = ' + FloatToStr(QContratoVend_NotaCOD_NOTA_CAB.Value));
  If wDtVencto <> '' Then
     QContratoVend_NotaDt_Vencimento.Value := StrToDate(wDtVencto);
end;

procedure TDMContrato.QRContrato_Vend_RecebimentoCalcFields(
  DataSet: TDataSet);
begin
  If QRContrato_Vend_RecebimentoIND_TIPO_MOVIMENTO.Value = 'RECEBTO. PRINCIPAL' Then
    QRContrato_Vend_RecebimentoIND_TIPO.Value := 'Rec';
  If QRContrato_Vend_RecebimentoIND_TIPO_MOVIMENTO.Value = 'RECEBTO. JUROS' Then
    QRContrato_Vend_RecebimentoIND_TIPO.Value := 'Jur';
  If QRContrato_Vend_RecebimentoIND_TIPO_MOVIMENTO.Value = 'DESC. CONCEDIDO' Then
    QRContrato_Vend_RecebimentoIND_TIPO.Value := 'Des';
end;

procedure TDMContrato.QRNotaAgricola_AbertoCalcFields(DataSet: TDataSet);
Var wDtVencto : String;
begin
  wDtVencto := DmOracle.BuscaNome('SELECT DT_VENCIMENTO FROM TB_CONTA_PAGAR_CAB', 'COD_NOTA_CAB = ' + FloatToStr(QRNotaAgricola_AbertoCOD_NOTA_CAB.Value));
  If wDtVencto <> '' Then
     QRNotaAgricola_AbertoDt_Vencimento.Value := StrToDate(wDtVencto);
end;

Procedure TDMContrato.MontaSql(wClasse,wSubClasse,wSaldo,wEmbarque:Integer; wFilial,wCliente,wProduto,wCorretora,wContrato,wDtInicial,wDtFinal:String;wMercado:Integer);
Begin
  With DMContrato do
  Begin
    QContrato_VendCons.Close;
    QContrato_VendCons.Sql.Clear;
    QContrato_VendCons.Sql.Add('SELECT Tb_contrato_vend.COD_CONTRATO_VEND,TB_CONTRATO_VEND.COD_FILIAL,Tb_contrato_vend.QT_QUANTIDADE,Tb_contrato_vend.DT_ENTREGA,');
    QContrato_VendCons.Sql.Add('Tb_contrato_vend.PRECO,Tb_contrato_vend.VAL_SALDO,Tb_contrato_vend.NUM_CONTRATO,Tb_contrato_vend.SALDO_NF_EMBARQUE,Tb_cadastro.NOME,');
    QContrato_VendCons.Sql.Add('Tb_produto.DESC_PRODUTO,Tb_filial.DESC_FILIAL,Tb_contrato_vend.NUM_CONTRATO_CLIENTE ');
    QContrato_VendCons.Sql.Add(' FROM TB_CONTRATO_VEND,TB_CADASTRO,TB_PRODUTO,TB_FILIAL,TB_CLASSE WHERE ');
    QContrato_VendCons.Sql.Add(' (Tb_contrato_vend.COD_CADASTRO = Tb_cadastro.COD_CADASTRO) ');
    QContrato_VendCons.Sql.Add(' AND (Tb_contrato_vend.COD_PRODUTO = Tb_produto.COD_PRODUTO) ');
    QContrato_VendCons.Sql.Add(' AND (Tb_contrato_vend.COD_FILIAL = Tb_filial.COD_FILIAL) ');
    QContrato_VendCons.Sql.Add(' AND (Tb_Produto.COD_CLASSE = Tb_Classe.COD_CLASSE) ');
    If wMercado = 4 Then
       QContrato_VendCons.Sql.Add(' AND Tb_contrato_vend.IND_TIPO_MERCADO <> ' + QuotedStr('REM.DEPOS.'));
    If wSaldo = 0 Then
       QContrato_VendCons.Sql.Add(' AND TB_CONTRATO_VEND.VAL_SALDO > 0');
    If wClasse <> 0 Then
       QContrato_VendCons.Sql.Add(' AND Tb_Classe.NUM_CLASSE = ' + FloatToStr(wClasse));
    If (wClasse = 50) And ((wSubClasse = 3) Or (wSubClasse = 8)) Then
       QContrato_VendCons.Sql.Add(' AND ((Tb_Classe.NUM_SUBCLASSE = 3) Or (Tb_Classe.NUM_SUBCLASSE = 8))')
    Else
      If wSubClasse <> 0 Then
         QContrato_VendCons.Sql.Add(' AND Tb_Classe.NUM_SUBCLASSE = ' + FloatToStr(wSubClasse));
    if Trim(wFilial) <> '' then
       QContrato_VendCons.Sql.Add(' AND TB_CONTRATO_VEND.COD_FILIAL = ' + Trim(wFilial));
    if Trim(wCliente) <> '' then
       QContrato_VendCons.Sql.Add(' AND TB_CONTRATO_VEND.COD_CADASTRO = ' + Trim(wCliente));
    if Trim(wProduto) <> '' then
       QContrato_VendCons.Sql.Add(' AND TB_CONTRATO_VEND.COD_PRODUTO = ' + Trim(wProduto));
    if Trim(wCorretora) <> '' then
       QContrato_VendCons.Sql.Add(' AND TB_CONTRATO_VEND.COD_CORRETORA = ' + Trim(wCorretora));
    if Trim(wContrato) <> '' then
       QContrato_VendCons.Sql.Add(' AND TB_CONTRATO_VEND.NUM_CONTRATO = ' + Trim(wContrato));
    if Trim(wDtInicial) <> '' Then
       QContrato_VendCons.Sql.Add(' AND TB_CONTRATO_VEND.DT_CONTRATO >= ' + chr(39) + Trim(wDtInicial)+chr(39));
    if Trim(wDtFinal) <> '' Then
       QContrato_VendCons.Sql.Add(' AND TB_CONTRATO_VEND.DT_CONTRATO <= ' + chr(39) + Trim(wDtFinal)+chr(39));
    Case wMercado Of
      0 : QContrato_VendCons.Sql.Add(' AND TB_CONTRATO_VEND.IND_TIPO_MERCADO =' + chr(39) + 'INTERNO' + chr(39));
      1 : QContrato_VendCons.Sql.Add(' AND TB_CONTRATO_VEND.IND_TIPO_MERCADO =' + chr(39) + 'EXTERNO' + chr(39));
      2 : QContrato_VendCons.Sql.Add(' AND TB_CONTRATO_VEND.IND_TIPO_MERCADO =' + chr(39) + 'EXPORTACAO' + chr(39));
      3 : QContrato_VendCons.Sql.Add(' AND TB_CONTRATO_VEND.IND_TIPO_MERCADO =' + chr(39) + 'REM.DEPOS.' + chr(39));
    End;
    Case wEmbarque of
      0 : QContrato_VendCons.Sql.Add(' AND TB_CONTRATO_VEND.SALDO_NF_EMBARQUE > 0');
      1 : QContrato_VendCons.Sql.Add(' AND TB_CONTRATO_VEND.SALDO_NF_EMBARQUE = 0');
    End;
    QContrato_VendCons.Sql.Add(' ORDER BY Tb_contrato_vend.NUM_CONTRATO');
    
    QContrato_VendCons.Open;
  End;
End;
procedure TDMContrato.QContrato_VendMovDeleta_GPCalcFields(
  DataSet: TDataSet);
begin
  QContrato_VendMovDeleta_GPNum_Contrato.Value:=StrToFloat(DMOracle.BuscaNome('SELECT NUM_CONTRATO FROM TB_CONTRATO_VEND','COD_CONTRATO_VEND = '+FloatToStr(QContrato_VendMovDeleta_GPCOD_CONTRATO_VEND.Value)));
end;

procedure TDMContrato.QContrato_VendMovDeletaCalcFields(DataSet: TDataSet);
begin
  QContrato_VendMovDeletaNum_Contrato.Value:=StrToFloat(DMOracle.BuscaNome('SELECT NUM_CONTRATO FROM TB_CONTRATO_VEND','COD_CONTRATO_VEND = '+FloatToStr(QContrato_VendMovDeletaCOD_CONTRATO_VEND.Value)));
end;

procedure TDMContrato.QContratoCalcFields(DataSet: TDataSet);
Var wBaixa : String;
begin
  QContratodesc_cidade_entrega.Text := DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_CIDADE','COD_CIDADE = '+IntToStr(QContratoCOD_CIDADE_ENTREGA.Value));

  wBaixa := DmOracle.BuscaNome('SELECT SUM(QT_QUANTIDADE) FROM TB_CONTRATO_MOV_ANTECIPADA', 'COD_CONTRATO = ' + QContratoCOD_CONTRATO.Text);
  If wBaixa <> '' Then
     QContratoQT_SALDO_BAIXAR.Value := QContratoQt_Quantidade.Value - StrToFloat(wBaixa)
  Else
     QContratoQT_SALDO_BAIXAR.Value := QContratoQt_Quantidade.Value;
end;

procedure TDMContrato.QRContrato_GPCalcFields(DataSet: TDataSet);
Var wVl_Atual,wDolar,wValor_Produto,wVal_Dpi,wQt_DPI : Real;
begin
  wVl_Atual := QRContrato_GPPRECO.Value;
{  If QRContrato_GPDesc_Tipo_Preco.Value <> 'REAL' Then   // FOI SOLICITADO PARA RETIRAR A CONVERSAO PELO VILSON NO DIA 11/03/2008
   Begin
     wDolar := StrToFloat('0' + DMOracle.BuscaNome('SELECT VLR_COTACAO FROM TB_COTACAO','COD_MOEDA = 2 AND DT_COTACAO='+Chr(39)+DateToStr(Date)+Chr(39)));
     wVl_Atual := wVl_Atual * wDolar;
   End;
}  If QRContrato_GPQt_Movimento.Text = '' Then
   Begin
     QRContrato_GPValor.Value := ((QRContrato_GPQT_CONTRATO.Value*wVl_Atual)/QRContrato_GPNUM_EMBALAGEM.Value)*((100-QRContrato_GPPERC_FUNRURAL.Value)/100);
     QRContrato_GPValor_bruto.Value := ((QRContrato_GPQT_CONTRATO.Value*wVl_Atual)/QRContrato_GPNUM_EMBALAGEM.Value);
     QRContrato_GPQt_Quantidade.Value := QRContrato_GPQt_Contrato.Value;
   End
  Else
   Begin
     QRContrato_GPValor.Value := (((QRContrato_GPQT_CONTRATO.Value-QRContrato_GPQT_MOVIMENTO.Value)*wVl_Atual)/QRContrato_GPNUM_EMBALAGEM.Value)*((100-QRContrato_GPPERC_FUNRURAL.Value)/100);
     QRContrato_GPValor_bruto.Value := (((QRContrato_GPQT_CONTRATO.Value-QRContrato_GPQT_MOVIMENTO.Value)*wVl_Atual)/QRContrato_GPNUM_EMBALAGEM.Value);
     QRContrato_GPQt_Quantidade.Value := QRContrato_GPQt_Contrato.Value-QRContrato_GPQT_MOVIMENTO.Value;
   End;
  If QRContrato_GPCOD_CIDADE_ENTREGA.Text <> '' Then
   Begin
     wValor_Produto := StrToFloat('0' + DmOracle.BuscaNome('SELECT VAL_PRECO FROM TB_PRECO_CIDADE_CLASSE', 'COD_CLASSE = '+ QRContrato_GPCOD_CLASSE.Text + ' And COD_CIDADE = ' + QRContrato_GPCOD_CIDADE_ENTREGA.Text + ' And DT_REFERENCIA = ' + QuoteDStr(DateToStr(wDtBase_Contrato))));
     If wValor_Produto > 0 Then
        QRContrato_GPVlr_Mercado.Value := wValor_Produto * QRContrato_GPQt_Quantidade.Value / QRContrato_GPNUM_EMBALAGEM.Value;
   End;
  QRContrato_GPVal_Contabil.Value := StrToFloat('0' + DmOracle.BuscaNome('SELECT VAL_TITULO FROM TB_CONTA_PAGAR_CAB', 'COD_CONTRATO_GP = '+ QRContrato_GPCOD_CONTRATO_GP.Text));

  wVal_Dpi := 0;
  If QRContrato_GPIND_BAIXA_CREDITO_MONSANTO.Value = 'SIM' Then
    If QRContrato_GPQT_CREDITO_TRANSGENICOS.Text <> '' Then
     Begin
       wQt_DPI := QRContrato_GPQT_QUANTIDADE.Value - QRContrato_GPQT_CREDITO_TRANSGENICOS.Value;
       If wQt_DPI > 0 Then
        Begin
          If QRContrato_GPPERC_DPI_TRANSGENICOS.Value > 0  Then
             wVal_Dpi := QRContrato_GPPRECO.value * wQt_DPI / QRContrato_GPNum_Embalagem.Value * QRContrato_GPPERC_DPI_TRANSGENICOS.Value / 100;
        End;
     End;
  QRContrato_GPValor.Value := QRContrato_GPValor.Value - wVal_Dpi;
  If QRContrato_GPDesc_Tipo_Preco.Value = 'REAL' Then  // coloquei aqui este campo calculado porque nao consegui usar o IF no relatorio - César
   Begin
     QRContrato_GPsQt_Real.Value := QRContrato_GPQt_Quantidade.Value;
     QRContrato_GPsVal_Real.Value := QRContrato_GPValor.Value;
     QRContrato_GPsVal_Bruto_Real.Value := QRContrato_GPValor_bruto.Value;
   End
  Else
   Begin
     QRContrato_GPsQt_Dolar.Value := QRContrato_GPQt_Quantidade.Value;
     QRContrato_GPsVal_Dolar.Value := QRContrato_GPValor.Value;
     QRContrato_GPsVal_Bruto_Dolar.Value := QRContrato_GPValor_bruto.Value;
   End;

end;

procedure TDMContrato.QContrato_GPCalcFields(DataSet: TDataSet);
begin
  QContrato_GPdesc_cidade_entrega.Text := DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_CIDADE','COD_CIDADE = '+IntToStr(QContrato_GPCOD_CIDADE_ENTREGA.Value));
end;

procedure TDMContrato.QRResumoContrato_GPCalcFields(DataSet: TDataSet);
var
  wDia, wMes, wAno : Word;
begin
  DecodeDate(QRResumoContrato_GPDT_PAGTO.Value, wAno, wMes, wDia);
  if wMes < 10 then
    QRResumoContrato_GPdt_pgto.Value := IntToStr(wAno) + '/' + '0' + IntToStr(wMes)
  else
    QRResumoContrato_GPdt_pgto.Value := IntToStr(wAno) + '/' + IntToStr(wMes);

  if QRResumoContrato_GPDESC_TIPO_PRECO.Value = 'REAL' then
  begin
    QRResumoContrato_GPvalorReal.Value := ((QRResumoContrato_GPQT_QUANTIDADE.value) *
                                          (QRResumoContrato_GPPRECO.Value))/(QRResumoContrato_GPNUM_EMBALAGEM.Value);
    QRResumoContrato_GPvalorDolar.Value := 0.00;
  end
  else
  begin
    QRResumoContrato_GPvalorDolar.Value := ((QRResumoContrato_GPQT_QUANTIDADE.value) *
                                           (QRResumoContrato_GPPRECO.Value))/(QRResumoContrato_GPNUM_EMBALAGEM.Value);
    QRResumoContrato_GPvalorReal.Value := 0.00;
  end;
end;

procedure TDMContrato.QRResumoContrato_GP2CalcFields(DataSet: TDataSet);
begin
  case QRResumoContrato_GP2MES_PAGAMENTO.AsInteger of
  1:
    QRResumoContrato_GP2desc_mes.Value := 'Janeiro';
  2:
    QRResumoContrato_GP2desc_mes.Value := 'Fevereiro';
  3:
    QRResumoContrato_GP2desc_mes.Value := 'Março';
  4:
    QRResumoContrato_GP2desc_mes.Value := 'Abril';
  5:
    QRResumoContrato_GP2desc_mes.Value := 'Maio';
  6:
    QRResumoContrato_GP2desc_mes.Value := 'Junho';
  7:
    QRResumoContrato_GP2desc_mes.Value := 'Julho';
  8:
    QRResumoContrato_GP2desc_mes.Value := 'Agosto';
  9:
    QRResumoContrato_GP2desc_mes.Value := 'Setembro';
  10:
    QRResumoContrato_GP2desc_mes.Value := 'Outubro';
  11:
    QRResumoContrato_GP2desc_mes.Value := 'Novembro';
  12:
    QRResumoContrato_GP2desc_mes.Value := 'Dezembro';
  end;
  if QRResumoContrato_GP2DESC_TIPO_PRECO.Value = 'REAL' then
  begin
    QRResumoContrato_GP2valor_real.Value := ((QRResumoContrato_GP2QT_QUANTIDADE.value) *
                                          (QRResumoContrato_GP2PRECO.Value))/(QRResumoContrato_GP2NUM_EMBALAGEM.Value);
    QRResumoContrato_GP2valor_dolar.Value := 0.00;
  end
  else
  begin
    QRResumoContrato_GP2valor_dolar.Value := ((QRResumoContrato_GP2QT_QUANTIDADE.value) *
                                           (QRResumoContrato_GP2PRECO.Value))/(QRResumoContrato_GP2NUM_EMBALAGEM.Value);
    QRResumoContrato_GP2valor_real.Value := 0.00;
  end;

end;

procedure TDMContrato.AtualizaContrato;
Var  wTotal,wTotal_Ent :String;
Begin
   if DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' Then
    Begin
       wTotal :=DMOracle.BuscaNome('SELECT Sum(qt_quantidade) FROM TB_NOTA_CAB,TB_NOTA_ITEM,TB_OPERACAO','TB_NOTA_CAB.COD_NOTA_CAB=TB_NOTA_ITEM.COD_NOTA_CAB AND TB_NOTA_CAB.COD_OPERACAO=TB_OPERACAO.COD_OPERACAO AND TB_NOTA_CAB.IND_SITUACAO='+chr(39)+'2'+chr(39)+' AND TB_NOTA_CAB.COD_CONTRATO_VEND='+DmContrato.QContrato_VendCOD_CONTRATO_VEND.TEXT + ' AND ((IND_VENDAS='+CHR(39)+'V'+CHR(39)+ ' AND IND_FUTURA_CLIENTE<>'+CHR(39)+'V'+CHR(39)+') OR (IND_FUTURA_CLIENTE='+CHR(39)+'S'+CHR(39)+') OR ( IND_DEPOSITO_OUTRAS='+CHR(39)+'S'+CHR(39)+'))');
       wTotal_Ent :=DMOracle.BuscaNome('SELECT Sum(qt_quantidade) FROM TB_NOTA_CAB,TB_NOTA_ITEM,TB_OPERACAO','TB_NOTA_CAB.COD_NOTA_CAB=TB_NOTA_ITEM.COD_NOTA_CAB  AND TB_NOTA_CAB.COD_OPERACAO=TB_OPERACAO.COD_OPERACAO AND IND_SITUACAO='+chr(39)+'2'+chr(39)+' AND IND_ENTRADA_SAIDA=' + Chr(39)+ 'E' + Chr(39) + ' AND TB_NOTA_CAB.COD_CONTRATO_VEND='+DmContrato.QContrato_VendCOD_CONTRATO_VEND.TEXT+ ' AND (IND_VENDAS='+QuoteDStr('D') + ' OR IND_FUTURA_CLIENTE='+QuoteDStr('D')+' OR IND_FUTURA_CLIENTE='+QuoteDStr('D')+' OR  IND_DEPOSITO_OUTRAS='+QuoteDStr('D')+')');
    End
   else
     Begin
       wTotal :=DMOracle.BuscaNome('SELECT Sum(qt_quantidade) FROM TB_NOTA_CAB,TB_NOTA_ITEM','TB_NOTA_CAB.COD_NOTA_CAB=TB_NOTA_ITEM.COD_NOTA_CAB AND IND_SITUACAO='+chr(39)+'2'+chr(39)+' AND IND_ENTRADA_SAIDA=' + Chr(39)+ 'S' + Chr(39) + ' AND TB_NOTA_CAB.COD_CONTRATO_VEND='+DmContrato.QContrato_VendCOD_CONTRATO_VEND.TEXT);
       wTotal_Ent :=DMOracle.BuscaNome('SELECT Sum(qt_quantidade) FROM TB_NOTA_CAB,TB_NOTA_ITEM','TB_NOTA_CAB.COD_NOTA_CAB=TB_NOTA_ITEM.COD_NOTA_CAB AND IND_SITUACAO='+chr(39)+'2'+chr(39)+' AND IND_ENTRADA_SAIDA=' + Chr(39)+ 'E' + Chr(39) + ' AND TB_NOTA_CAB.COD_CONTRATO_VEND='+DmContrato.QContrato_VendCOD_CONTRATO_VEND.TEXT);
     End;
   If wTotal <> '' Then
      DmContrato.QContrato_VendSALDO_NF_EMBARQUE.Value:=DmContrato.QContrato_VendQT_QUANTIDADE.Value - StrToFloat(wTotal)
   else
      DmContrato.QContrato_VendSALDO_NF_EMBARQUE.Value:=DmContrato.QContrato_VendQT_QUANTIDADE.Value;
   If wTotal_Ent <> '' Then
      DmContrato.QContrato_VendSALDO_NF_EMBARQUE.Value:=DmContrato.QContrato_VendSALDO_NF_EMBARQUE.Value + StrToFloat(wTotal_Ent);
   wTotal :=DMOracle.BuscaNome('SELECT Sum(qt_quantidade) FROM TB_CONTRATO_VEND_MOV','COD_CONTRATO_VEND='+DmContrato.QContrato_VendCOD_CONTRATO_VEND.TEXT);
   If wTotal <> '' Then
      DmContrato.QContrato_VendVAL_SALDO.Value:=DmContrato.QContrato_VendQT_QUANTIDADE.Value - StrToFloat(wTotal)
   else
      DmContrato.QContrato_VendVAL_SALDO.Value:=DmContrato.QContrato_VendQT_QUANTIDADE.Value;
End;

end.



