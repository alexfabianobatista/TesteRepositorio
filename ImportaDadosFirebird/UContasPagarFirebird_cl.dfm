object DMContasPagarFirebird: TDMContasPagarFirebird
  OldCreateOrder = False
  Left = 544
  Top = 344
  Height = 185
  Width = 293
  object ZQCP_INTELIC: TZQuery
    Connection = DMFirebird.ZConnection1
    SQL.Strings = (
      'SELECT'
      '  1 AS FILIAL,'
      '  CODCLI,'
      '  1 AS VENDEDOR,'
      '  PARCELA,'
      '  VENCIMENTO,'
      '  PAGAMENTO,'
      '  VALOR,'
      '  MULTA,'
      '  JUROS,'
      '  VLRPAGO,'
      '  OUTROS,'
      '  DESCONTO,'
      '  TOTAL,'
      '  MORA'
      '  NFVLR,'
      '  ABATIMENTO,'
      '  NUMERO_NOTA,'
      '  NUMERO_DOCUMENTO AS OBS,'
      '  VALOR_MORA_PAGO,'
      '  VALOR_MULTA_PAGO,'
      '  VALOR_DESCONTO_CONCEDIDO,'
      '  VALOR_ABATIMENTO_CONCEDIDO,'
      '  COMPETE,'
      '  CONTA'
      'FROM'
      '  APAGAR'
      'ORDER BY CODCLI'
      '')
    Params = <>
    Left = 32
    Top = 16
    object ZQCP_INTELICFILIAL: TIntegerField
      FieldName = 'FILIAL'
      ReadOnly = True
    end
    object ZQCP_INTELICCODCLI: TIntegerField
      FieldName = 'CODCLI'
    end
    object ZQCP_INTELICVENDEDOR: TIntegerField
      FieldName = 'VENDEDOR'
      ReadOnly = True
    end
    object ZQCP_INTELICPARCELA: TStringField
      FieldName = 'PARCELA'
      Size = 5
    end
    object ZQCP_INTELICVENCIMENTO: TDateTimeField
      FieldName = 'VENCIMENTO'
    end
    object ZQCP_INTELICPAGAMENTO: TDateTimeField
      FieldName = 'PAGAMENTO'
    end
    object ZQCP_INTELICVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object ZQCP_INTELICMULTA: TFloatField
      FieldName = 'MULTA'
    end
    object ZQCP_INTELICJUROS: TFloatField
      FieldName = 'JUROS'
    end
    object ZQCP_INTELICVLRPAGO: TFloatField
      FieldName = 'VLRPAGO'
    end
    object ZQCP_INTELICOUTROS: TFloatField
      FieldName = 'OUTROS'
    end
    object ZQCP_INTELICDESCONTO: TFloatField
      FieldName = 'DESCONTO'
    end
    object ZQCP_INTELICTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object ZQCP_INTELICNFVLR: TFloatField
      FieldName = 'NFVLR'
    end
    object ZQCP_INTELICABATIMENTO: TFloatField
      FieldName = 'ABATIMENTO'
    end
    object ZQCP_INTELICNUMERO_NOTA: TStringField
      FieldName = 'NUMERO_NOTA'
      Size = 10
    end
    object ZQCP_INTELICOBS: TStringField
      FieldName = 'OBS'
    end
    object ZQCP_INTELICVALOR_MORA_PAGO: TFloatField
      FieldName = 'VALOR_MORA_PAGO'
    end
    object ZQCP_INTELICVALOR_MULTA_PAGO: TFloatField
      FieldName = 'VALOR_MULTA_PAGO'
    end
    object ZQCP_INTELICVALOR_DESCONTO_CONCEDIDO: TFloatField
      FieldName = 'VALOR_DESCONTO_CONCEDIDO'
    end
    object ZQCP_INTELICVALOR_ABATIMENTO_CONCEDIDO: TFloatField
      FieldName = 'VALOR_ABATIMENTO_CONCEDIDO'
    end
    object ZQCP_INTELICCOMPETE: TDateTimeField
      FieldName = 'COMPETE'
    end
    object ZQCP_INTELICCONTA: TStringField
      FieldName = 'CONTA'
      Size = 100
    end
  end
  object ZQCP_Retifoz: TZQuery
    Connection = DMFirebird.ZConnection1
    SQL.Strings = (
      'SELECT'
      '  CAP.CODIGO AS COD_CONTA_PAGAR_CAB,'
      '  CAP.DOC AS NUM_TITULO,'
      '  CAP.PARCELA AS NUM_PARCELA,'
      '  '#39'IMP'#39' AS TIPO_DOCUMENTO,'
      '  1 AS COD_FILIAL,'
      '  CAP.FORNECEDOR AS COD_CADASTRO,'
      
        '  (SELECT NOME FROM CAD_TERCEIROS WHERE EMPRESA = CAP.EMPRESA AN' +
        'D CODIGO = CAP.FORNECEDOR) AS NOMEFORNECEDOR,'
      '  2 AS COD_FINALIDADE,'
      '  1 AS COD_DEPARTAMENTO,'
      '  CAP.DT_EMISSAO AS DT_EMISSAO,'
      '  CAP.DT_VENC AS DT_VENCIMENTO,'
      '  CAP.PORTADOR,'
      '  CAP.TIPODOC,'
      '  CAPDET.VALOR AS VAL_ORIGINAL,'
      '  CAP.DT_EMISSAO AS DT_ACEITE,'
      
        '  (SELECT SALDO FROM FIN_PAGAR_SALDO (CAP.EMPRESA, CAP.CODIGO)) ' +
        'AS VAL_TITULO,'
      
        '  (SELECT NOME FROM CAD_TIPODOC WHERE EMPRESA = CAP.EMPRESA AND ' +
        'CODIGO = CAP.TIPODOC) AS NOMETIPODOC,'
      
        '  (SELECT CREDITOS FROM FIN_PAGAR_SALDO (CAP.EMPRESA, CAP.CODIGO' +
        ')) AS CREDITO,'
      
        '  (SELECT DEBITOS FROM FIN_PAGAR_SALDO (CAP.EMPRESA, CAP.CODIGO)' +
        ') AS DEBITO,'
      '  CAP.HISTORICO || '#39'-'#39'||CAPDET.HISTORICO AS OBS'
      'FROM'
      
        '  FIN_CONTAS_PAGAR CAP, FIN_CONTAS_PAGAR_DETALHE CAPDET, CAD_PLA' +
        'NOCONTAS PLANO'
      'WHERE'
      '  CAP.EMPRESA = CAPDET.EMPRESA'
      'AND'
      '  CAP.CODIGO  = CAPDET.CODIGO'
      'AND'
      '  CAPDET.EMPRESA = PLANO.EMPRESA'
      'AND'
      '  CAPDET.PLANOCONTA = PLANO.CODIGO'
      'AND'
      '  PLANO.CODIGO NOT IN(1502,224)'
      'AND'
      
        '  (SELECT SALDO FROM FIN_PAGAR_SALDO (CAP.EMPRESA, CAP.CODIGO)) ' +
        '> 0'
      'ORDER BY CAP.DT_VENC, VAL_TITULO')
    Params = <>
    Left = 48
    Top = 80
    object ZQCP_RetifozCOD_CONTA_PAGAR_CAB: TIntegerField
      FieldName = 'COD_CONTA_PAGAR_CAB'
      Required = True
    end
    object ZQCP_RetifozNUM_TITULO: TStringField
      FieldName = 'NUM_TITULO'
      Required = True
      Size = 40
    end
    object ZQCP_RetifozNUM_PARCELA: TSmallintField
      FieldName = 'NUM_PARCELA'
    end
    object ZQCP_RetifozTIPO_DOCUMENTO: TStringField
      FieldName = 'TIPO_DOCUMENTO'
      ReadOnly = True
      Size = 3
    end
    object ZQCP_RetifozCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      ReadOnly = True
    end
    object ZQCP_RetifozCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object ZQCP_RetifozNOMEFORNECEDOR: TStringField
      FieldName = 'NOMEFORNECEDOR'
      ReadOnly = True
      Size = 50
    end
    object ZQCP_RetifozCOD_FINALIDADE: TIntegerField
      FieldName = 'COD_FINALIDADE'
      ReadOnly = True
    end
    object ZQCP_RetifozCOD_DEPARTAMENTO: TIntegerField
      FieldName = 'COD_DEPARTAMENTO'
      ReadOnly = True
    end
    object ZQCP_RetifozDT_EMISSAO: TDateField
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object ZQCP_RetifozDT_VENCIMENTO: TDateField
      FieldName = 'DT_VENCIMENTO'
      Required = True
    end
    object ZQCP_RetifozPORTADOR: TSmallintField
      FieldName = 'PORTADOR'
      Required = True
    end
    object ZQCP_RetifozTIPODOC: TSmallintField
      FieldName = 'TIPODOC'
      Required = True
    end
    object ZQCP_RetifozVAL_ORIGINAL: TFloatField
      FieldName = 'VAL_ORIGINAL'
      Required = True
    end
    object ZQCP_RetifozDT_ACEITE: TDateField
      FieldName = 'DT_ACEITE'
      Required = True
    end
    object ZQCP_RetifozVAL_TITULO: TFloatField
      FieldName = 'VAL_TITULO'
      ReadOnly = True
    end
    object ZQCP_RetifozNOMETIPODOC: TStringField
      FieldName = 'NOMETIPODOC'
      ReadOnly = True
      Size = 50
    end
    object ZQCP_RetifozCREDITO: TFloatField
      FieldName = 'CREDITO'
      ReadOnly = True
    end
    object ZQCP_RetifozDEBITO: TFloatField
      FieldName = 'DEBITO'
      ReadOnly = True
    end
    object ZQCP_RetifozOBS: TStringField
      FieldName = 'OBS'
      ReadOnly = True
      Size = 601
    end
  end
  object ZQCP_RetifozBaixado: TZQuery
    Connection = DMFirebird.ZConnection1
    SQL.Strings = (
      'SELECT'
      '  CAP.CODIGO AS COD_CONTA_PAGAR_CAB,'
      '  CAP.DOC AS NUM_TITULO,'
      '  CAP.PARCELA AS NUM_PARCELA,'
      '  '#39'IMP'#39' AS TIPO_DOCUMENTO,'
      '  1 AS COD_FILIAL,'
      '  CAP.FORNECEDOR AS COD_CADASTRO,'
      
        '  (SELECT NOME FROM CAD_TERCEIROS WHERE EMPRESA = CAP.EMPRESA AN' +
        'D CODIGO = CAP.FORNECEDOR) AS NOMEFORNECEDOR,'
      '  2 AS COD_FINALIDADE,'
      '  1 AS COD_DEPARTAMENTO,'
      '  CAP.DT_EMISSAO AS DT_EMISSAO,'
      '  CAP.DT_VENC AS DT_VENCIMENTO,'
      '  CAP.PORTADOR,'
      '  CAP.TIPODOC,'
      '  CAPDET.VALOR AS VAL_ORIGINAL,'
      '  CAP.DT_EMISSAO AS DT_ACEITE,'
      
        '  (SELECT SALDO FROM FIN_PAGAR_SALDO (CAP.EMPRESA, CAP.CODIGO)) ' +
        'AS VAL_TITULO,'
      
        '  (SELECT NOME FROM CAD_TIPODOC WHERE EMPRESA = CAP.EMPRESA AND ' +
        'CODIGO = CAP.TIPODOC) AS NOMETIPODOC,'
      
        '  (SELECT CREDITOS FROM FIN_PAGAR_SALDO (CAP.EMPRESA, CAP.CODIGO' +
        ')) AS CREDITO,'
      
        '  (SELECT DEBITOS FROM FIN_PAGAR_SALDO (CAP.EMPRESA, CAP.CODIGO)' +
        ') AS DEBITO,'
      '  CAP.HISTORICO || '#39'-'#39'||CAPDET.HISTORICO AS OBS'
      'FROM'
      
        '  FIN_CONTAS_PAGAR CAP, FIN_CONTAS_PAGAR_DETALHE CAPDET, CAD_PLA' +
        'NOCONTAS PLANO'
      'WHERE'
      '  CAP.EMPRESA = CAPDET.EMPRESA'
      'AND'
      '  CAP.CODIGO  = CAPDET.CODIGO'
      'AND'
      '  CAPDET.EMPRESA = PLANO.EMPRESA'
      'AND'
      '  CAPDET.PLANOCONTA = PLANO.CODIGO'
      'AND'
      '  PLANO.CODIGO NOT IN(1502,224,1442)'
      'AND'
      
        '  (SELECT SALDO FROM FIN_PAGAR_SALDO (CAP.EMPRESA, CAP.CODIGO)) ' +
        '= 0'
      'AND'
      '  CAP.DT_EMISSAO BETWEEN '#39'01.01.2020'#39' AND '#39'31.12.2020'#39
      'ORDER BY CAP.DT_VENC, VAL_TITULO')
    Params = <>
    Left = 158
    Top = 80
    object ZQCP_RetifozBaixadoCOD_CONTA_PAGAR_CAB: TIntegerField
      FieldName = 'COD_CONTA_PAGAR_CAB'
      Required = True
    end
    object ZQCP_RetifozBaixadoNUM_TITULO: TStringField
      FieldName = 'NUM_TITULO'
      Required = True
      Size = 40
    end
    object ZQCP_RetifozBaixadoNUM_PARCELA: TSmallintField
      FieldName = 'NUM_PARCELA'
    end
    object ZQCP_RetifozBaixadoTIPO_DOCUMENTO: TStringField
      FieldName = 'TIPO_DOCUMENTO'
      ReadOnly = True
      Size = 3
    end
    object ZQCP_RetifozBaixadoCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      ReadOnly = True
    end
    object ZQCP_RetifozBaixadoCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object ZQCP_RetifozBaixadoNOMEFORNECEDOR: TStringField
      FieldName = 'NOMEFORNECEDOR'
      ReadOnly = True
      Size = 50
    end
    object ZQCP_RetifozBaixadoCOD_FINALIDADE: TIntegerField
      FieldName = 'COD_FINALIDADE'
      ReadOnly = True
    end
    object ZQCP_RetifozBaixadoCOD_DEPARTAMENTO: TIntegerField
      FieldName = 'COD_DEPARTAMENTO'
      ReadOnly = True
    end
    object ZQCP_RetifozBaixadoDT_EMISSAO: TDateField
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object ZQCP_RetifozBaixadoDT_VENCIMENTO: TDateField
      FieldName = 'DT_VENCIMENTO'
      Required = True
    end
    object ZQCP_RetifozBaixadoPORTADOR: TSmallintField
      FieldName = 'PORTADOR'
      Required = True
    end
    object ZQCP_RetifozBaixadoTIPODOC: TSmallintField
      FieldName = 'TIPODOC'
      Required = True
    end
    object ZQCP_RetifozBaixadoVAL_ORIGINAL: TFloatField
      FieldName = 'VAL_ORIGINAL'
      Required = True
    end
    object ZQCP_RetifozBaixadoDT_ACEITE: TDateField
      FieldName = 'DT_ACEITE'
      Required = True
    end
    object ZQCP_RetifozBaixadoVAL_TITULO: TFloatField
      FieldName = 'VAL_TITULO'
      ReadOnly = True
    end
    object ZQCP_RetifozBaixadoNOMETIPODOC: TStringField
      FieldName = 'NOMETIPODOC'
      ReadOnly = True
      Size = 50
    end
    object ZQCP_RetifozBaixadoCREDITO: TFloatField
      FieldName = 'CREDITO'
      ReadOnly = True
    end
    object ZQCP_RetifozBaixadoDEBITO: TFloatField
      FieldName = 'DEBITO'
      ReadOnly = True
    end
    object ZQCP_RetifozBaixadoOBS: TStringField
      FieldName = 'OBS'
      ReadOnly = True
      Size = 601
    end
  end
end
