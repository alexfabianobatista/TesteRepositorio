object DMContasPagarRel: TDMContasPagarRel
  OldCreateOrder = False
  Left = 623
  Top = 273
  Height = 209
  Width = 623
  object QrTitulosAPagar_For: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Tb_Conta_Pagar_Cab.Cod_Cadastro,'
      '  Tb_Conta_Pagar_Cab.Num_Titulo,'
      '  Tb_Conta_Pagar_Cab.Num_Parcela,'
      '  Tb_Conta_Pagar_Cab.Dt_Emissao,'
      
        '  NVL(TB_CONTA_PAGAR_CAB."DT_VENCIMENTO_PRORROGADO",Tb_Conta_Pag' +
        'ar_Cab.Dt_Vencimento) as DT_VENCIMENTO,'
      '  Tb_Conta_Pagar_Cab.Perc_Desc_Pontualidade,'
      '  Tb_Conta_Pagar_Cab.Perc_Desc_Antecipacao,'
      '  Tb_Conta_Pagar_Cab.Val_Titulo,'
      '  Tb_Cadastro.Nome,'
      '  Tb_Cadastro.Desc_Agencia,'
      '  Tb_Cadastro.Desc_Conta_Corrente,'
      '  Tb_Cadastro.Desc_Complemento,'
      '  Tb_Cadastro.Desc_Complemento_Sintegra,'
      '  Tb_Cadastro.Num_Cgc_Cpf,'
      '  Tb_Cadastro.Cod_Banco_Agencia,'
      '  :DT_REFERENCIA As Dt_Referencia'
      'From'
      '  Tb_Conta_Pagar_Cab,'
      '  Tb_Cadastro'
      'Where'
      '  Tb_Conta_Pagar_Cab.Cod_Cadastro = Tb_Cadastro.Cod_Cadastro'
      '  And'
      '  Tb_Conta_Pagar_Cab.Ind_Situacao <> '#39'BAIXA TOTAL'#39
      '  And'
      '  (:Cod_Cadastro is Null'
      '   Or'
      '    Tb_Conta_Pagar_Cab.Cod_Cadastro = :Cod_Cadastro)'
      '  And'
      '  (:Cod_Filial is Null'
      '   Or'
      '    Tb_Conta_Pagar_Cab.Cod_Filial = :Cod_Filial)'
      '  And'
      
        '  NVL(TB_CONTA_PAGAR_CAB."DT_VENCIMENTO_PRORROGADO",Tb_Conta_Pag' +
        'ar_Cab.Dt_Vencimento) >= :Dt_Inicial'
      '  And'
      
        '  NVL(TB_CONTA_PAGAR_CAB."DT_VENCIMENTO_PRORROGADO",Tb_Conta_Pag' +
        'ar_Cab.Dt_Vencimento) <= :Dt_Final'
      'ORDER BY'
      '  Tb_Conta_Pagar_Cab.Cod_Cadastro')
    Variables.Data = {
      03000000050000000D0000003A434F445F434144415354524F03000000000000
      00000000000B0000003A44545F494E494349414C0C0000000000000000000000
      090000003A44545F46494E414C0C00000000000000000000000B0000003A434F
      445F46494C49414C0300000000000000000000000E0000003A44545F52454645
      52454E4349410C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000110000000C000000434F445F434144415354524F0100000000000A00
      00004E554D5F544954554C4F0100000000000B0000004E554D5F50415243454C
      410100000000000A00000044545F454D495353414F0100000000000D00000044
      545F56454E43494D454E544F01000000000016000000504552435F444553435F
      504F4E5455414C494441444501000000000015000000504552435F444553435F
      414E54454349504143414F0100000000000A00000056414C5F544954554C4F01
      0000000000040000004E4F4D450100000000000C000000444553435F4147454E
      43494101000000000013000000444553435F434F4E54415F434F5252454E5445
      0100000000000B0000004E554D5F4347435F4350460100000000001100000043
      4F445F42414E434F5F4147454E43494101000000000012000000444553435F42
      414E434F5F4147454E43494101000000000010000000444553435F434F4D504C
      454D454E544F01000000000019000000444553435F434F4D504C454D454E544F
      5F53494E54454752410100000000000D00000044545F5245464552454E434941
      010000000000}
    Session = DMOracle.DBCemapa
    OnCalcFields = QrTitulosAPagar_ForCalcFields
    Left = 56
    Top = 16
    object QrTitulosAPagar_ForCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QrTitulosAPagar_ForNUM_TITULO: TIntegerField
      FieldName = 'NUM_TITULO'
    end
    object QrTitulosAPagar_ForNUM_PARCELA: TIntegerField
      FieldName = 'NUM_PARCELA'
    end
    object QrTitulosAPagar_ForDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
    object QrTitulosAPagar_ForDT_VENCIMENTO: TDateTimeField
      FieldName = 'DT_VENCIMENTO'
    end
    object QrTitulosAPagar_ForPERC_DESC_PONTUALIDADE: TFloatField
      FieldName = 'PERC_DESC_PONTUALIDADE'
    end
    object QrTitulosAPagar_ForPERC_DESC_ANTECIPACAO: TFloatField
      FieldName = 'PERC_DESC_ANTECIPACAO'
    end
    object QrTitulosAPagar_ForVAL_TITULO: TFloatField
      FieldName = 'VAL_TITULO'
    end
    object QrTitulosAPagar_ForNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object QrTitulosAPagar_Forval_desc_pontualidade: TFloatField
      FieldKind = fkCalculated
      FieldName = 'val_desc_pontualidade'
      Calculated = True
    end
    object QrTitulosAPagar_Forval_desc_antecipacao: TFloatField
      FieldKind = fkCalculated
      FieldName = 'val_desc_antecipacao'
      Calculated = True
    end
    object QrTitulosAPagar_ForDESC_AGENCIA: TStringField
      FieldName = 'DESC_AGENCIA'
      Size = 7
    end
    object QrTitulosAPagar_ForDESC_CONTA_CORRENTE: TStringField
      FieldName = 'DESC_CONTA_CORRENTE'
      Size = 10
    end
    object QrTitulosAPagar_ForNUM_CGC_CPF: TStringField
      FieldName = 'NUM_CGC_CPF'
      Size = 18
    end
    object QrTitulosAPagar_ForCOD_BANCO_AGENCIA: TIntegerField
      FieldName = 'COD_BANCO_AGENCIA'
    end
    object QrTitulosAPagar_Forval_saldo_titulo: TFloatField
      FieldKind = fkCalculated
      FieldName = 'val_saldo_titulo'
      Calculated = True
    end
    object QrTitulosAPagar_ForDESC_COMPLEMENTO: TStringField
      FieldName = 'DESC_COMPLEMENTO'
      Size = 40
    end
    object QrTitulosAPagar_ForDESC_COMPLEMENTO_SINTEGRA: TStringField
      FieldName = 'DESC_COMPLEMENTO_SINTEGRA'
      Size = 14
    end
    object QrTitulosAPagar_ForDT_REFERENCIA: TDateTimeField
      FieldName = 'DT_REFERENCIA'
    end
    object QrTitulosAPagar_Fordesc_banco_agencia: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_banco_agencia'
      Size = 40
      Calculated = True
    end
  end
  object QRAgendaBaixa: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_CONTA_PAGAR_CAB.IND_FORMA_PAGAMENTO,'
      '  TB_CONTA_PAGAR_CAB.DESC_CNPJ_CPF_PGTO,'
      '  TB_CONTA_PAGAR_CAB.COD_CONTA_CORRENTE_PGTO,'
      '  TB_CONTA_PAGAR_CAB.COD_AGENCIA,'
      '  TB_CONTA_PAGAR_CAB.COD_BANCO_PGTO,'
      
        '  NVL(TB_CONTA_PAGAR_CAB."DT_VENCIMENTO_PRORROGADO",TB_CONTA_PAG' +
        'AR_CAB.DT_VENCIMENTO) AS DT_VENCIMENTO,'
      '  TB_CONTA_PAGAR_CAB.VAL_TITULO,'
      '  TB_CONTA_PAGAR_CAB.COD_BANCO_AGENCIA,'
      '  TB_CONTA_PAGAR_CAB.IND_ACEITE,'
      '  TB_CONTA_PAGAR_CAB.COD_CADASTRO,'
      '  TB_CONTA_PAGAR_CAB.DESC_NOME_TITULAR_CONTA,'
      '  TB_CONTA_PAGAR_CAB.COD_USUARIO_ACEITE,'
      '  TB_CONTA_PAGAR_CAB.DESC_COMPLEMENTO_SINTEGRA,'
      '  TB_CADASTRO.NOME,'
      '  TBA1.DESC_BANCO_AGENCIA AS BANCO_AGENCIA,'
      '  TBA2.DESC_BANCO_AGENCIA AS BANCO_AGENCIA_PGTO'
      'FROM'
      '  TB_CONTA_PAGAR_CAB,'
      '  TB_CADASTRO,'
      '  TB_BANCO_AGENCIA TBA1,'
      '  TB_BANCO_AGENCIA TBA2'
      'WHERE'
      '  TB_CONTA_PAGAR_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
      '  AND'
      
        '  TB_CONTA_PAGAR_CAB.COD_BANCO_AGENCIA = TBA1.COD_BANCO_AGENCIA(' +
        '+)'
      '  AND'
      '  TB_CONTA_PAGAR_CAB.COD_BANCO_PGTO = TBA2.COD_BANCO(+)'
      '  AND'
      '  TB_CONTA_PAGAR_CAB.IND_SITUACAO <> '#39'BAIXA TOTAL'#39
      '  AND'
      '  (:FILIAL IS NULL'
      '    OR'
      '    TB_CONTA_PAGAR_CAB.COD_FILIAL = :FILIAL)'
      '  AND'
      '  (:DEPARTAMENTO IS NULL'
      '    OR'
      '    TB_CONTA_PAGAR_CAB.COD_DEPARTAMENTO = :DEPARTAMENTO)'
      '  AND'
      '  (:FORNECEDOR IS NULL'
      '    OR'
      '    TB_CONTA_PAGAR_CAB.COD_CADASTRO = :FORNECEDOR)'
      '  AND'
      '  (:BANCO IS NULL'
      '    OR'
      '    TB_CONTA_PAGAR_CAB.COD_BANCO_AGENCIA = :BANCO)'
      '  AND'
      '  (:PAGAMENTO IS NULL'
      '    OR'
      '    TB_CONTA_PAGAR_CAB.IND_FORMA_PAGAMENTO = :PAGAMENTO)'
      '  AND'
      
        '    NVL(TB_CONTA_PAGAR_CAB."DT_VENCIMENTO_PRORROGADO",TB_CONTA_P' +
        'AGAR_CAB.DT_VENCIMENTO) BETWEEN :DATA_I AND :DATA_F'
      'ORDER BY'
      '  TB_CONTA_PAGAR_CAB.IND_FORMA_PAGAMENTO,'
      '  TB_CONTA_PAGAR_CAB.COD_BANCO_AGENCIA'
      ''
      ''
      '')
    Variables.Data = {
      0300000007000000070000003A46494C49414C0300000000000000000000000D
      0000003A444550415254414D454E544F0300000000000000000000000B000000
      3A464F524E454345444F52030000000000000000000000060000003A42414E43
      4F0300000000000000000000000A0000003A504147414D454E544F0500000000
      00000000000000070000003A444154415F490C00000000000000000000000700
      00003A444154415F460C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001000000013000000494E445F464F524D415F504147414D454E544F01
      000000000012000000444553435F434E504A5F4350465F5047544F0100000000
      0017000000434F445F434F4E54415F434F5252454E54455F5047544F01000000
      00000B000000434F445F4147454E4349410100000000000E000000434F445F42
      414E434F5F5047544F0100000000000D00000044545F56454E43494D454E544F
      0100000000000A00000056414C5F544954554C4F01000000000011000000434F
      445F42414E434F5F4147454E4349410100000000000A000000494E445F414345
      4954450100000000000C000000434F445F434144415354524F01000000000017
      000000444553435F4E4F4D455F544954554C41525F434F4E5441010000000000
      040000004E4F4D450100000000000D00000042414E434F5F4147454E43494101
      00000000001200000042414E434F5F4147454E4349415F5047544F0100000000
      0012000000434F445F5553554152494F5F414345495445010000000000190000
      00444553435F434F4D504C454D454E544F5F53494E5445475241010000000000}
    Session = DMOracle.DBCemapa
    Left = 168
    Top = 16
    object QRAgendaBaixaIND_FORMA_PAGAMENTO: TStringField
      FieldName = 'IND_FORMA_PAGAMENTO'
      Size = 8
    end
    object QRAgendaBaixaDESC_CNPJ_CPF_PGTO: TStringField
      FieldName = 'DESC_CNPJ_CPF_PGTO'
      Size = 18
    end
    object QRAgendaBaixaCOD_CONTA_CORRENTE_PGTO: TStringField
      FieldName = 'COD_CONTA_CORRENTE_PGTO'
      Size = 10
    end
    object QRAgendaBaixaCOD_AGENCIA: TStringField
      FieldName = 'COD_AGENCIA'
      Size = 6
    end
    object QRAgendaBaixaCOD_BANCO_PGTO: TIntegerField
      FieldName = 'COD_BANCO_PGTO'
    end
    object QRAgendaBaixaDT_VENCIMENTO: TDateTimeField
      FieldName = 'DT_VENCIMENTO'
    end
    object QRAgendaBaixaVAL_TITULO: TFloatField
      FieldName = 'VAL_TITULO'
    end
    object QRAgendaBaixaCOD_BANCO_AGENCIA: TIntegerField
      FieldName = 'COD_BANCO_AGENCIA'
    end
    object QRAgendaBaixaIND_ACEITE: TStringField
      FieldName = 'IND_ACEITE'
      Size = 3
    end
    object QRAgendaBaixaCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QRAgendaBaixaDESC_NOME_TITULAR_CONTA: TStringField
      FieldName = 'DESC_NOME_TITULAR_CONTA'
      Size = 30
    end
    object QRAgendaBaixaNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object QRAgendaBaixaBANCO_AGENCIA: TStringField
      FieldName = 'BANCO_AGENCIA'
      Size = 30
    end
    object QRAgendaBaixaBANCO_AGENCIA_PGTO: TStringField
      FieldName = 'BANCO_AGENCIA_PGTO'
      Size = 30
    end
    object QRAgendaBaixaCOD_USUARIO_ACEITE: TIntegerField
      FieldName = 'COD_USUARIO_ACEITE'
    end
    object QRAgendaBaixaDESC_COMPLEMENTO_SINTEGRA: TStringField
      FieldName = 'DESC_COMPLEMENTO_SINTEGRA'
      Size = 14
    end
  end
  object QRContasPagarSintetico: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  Tb_cadastro.NOME,'
      '  Tb_conta_pagar_cab.COD_CADASTRO,'
      '  Sum(Tb_conta_pagar_cab.VAL_TITULO) as Val_Titulo'
      'FROM'
      '  TB_CONTA_PAGAR_CAB,'
      '  TB_CADASTRO'
      'WHERE'
      '  TB_CONTA_PAGAR_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
      '  AND'
      '  (TB_CONTA_PAGAR_CAB.IND_SITUACAO <> '#39'BAIXA TOTAL'#39')'
      '  AND'
      '  (:COD_CADASTRO IS NULL'
      '   OR'
      '    TB_CONTA_PAGAR_CAB.COD_CADASTRO = :COD_CADASTRO)'
      '  AND'
      '  (:COD_FILIAL IS NULL'
      '   OR'
      '    TB_CONTA_PAGAR_CAB.COD_FILIAL = :COD_FILIAL)'
      '  AND'
      '  (:COD_DEPARTAMENTO IS NULL'
      '   OR'
      '    TB_CONTA_PAGAR_CAB.COD_DEPARTAMENTO = :COD_DEPARTAMENTO)'
      '  AND'
      '  (:DEPARTAMENTOS)'
      '  AND'
      
        '  NVL(TB_CONTA_PAGAR_CAB.DT_VENCIMENTO_PRORROGADO,TB_CONTA_PAGAR' +
        '_CAB.DT_VENCIMENTO) >= :DT_INICIAL'
      '  AND'
      
        '  NVL(TB_CONTA_PAGAR_CAB.DT_VENCIMENTO_PRORROGADO,TB_CONTA_PAGAR' +
        '_CAB.DT_VENCIMENTO) <= :DT_FINAL'
      '  AND'
      '  (:DESC_TIPO_DOCUMENTO IS NULL'
      '   OR'
      
        '    TB_CONTA_PAGAR_CAB.DESC_TIPO_DOCUMENTO = :DESC_TIPO_DOCUMENT' +
        'O)'
      'GROUP BY'
      '  Tb_cadastro.NOME,'
      '  Tb_conta_pagar_cab.COD_CADASTRO'
      'ORDER BY  Tb_conta_pagar_cab.COD_CADASTRO')
    Variables.Data = {
      03000000070000000D0000003A434F445F434144415354524F03000000000000
      00000000000B0000003A434F445F46494C49414C030000000000000000000000
      110000003A434F445F444550415254414D454E544F0300000000000000000000
      000B0000003A44545F494E494349414C0C000000000000000000000009000000
      3A44545F46494E414C0C0000000000000000000000140000003A444553435F54
      49504F5F444F43554D454E544F0500000000000000000000000E0000003A4445
      50415254414D454E544F53010000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000003000000040000004E4F4D450100000000000C000000434F445F4341
      44415354524F0100000000000A00000056414C5F544954554C4F010000000000}
    Session = DMOracle.DBCemapa
    Left = 48
    Top = 72
    object QRContasPagarSinteticoNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object QRContasPagarSinteticoCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QRContasPagarSinteticoVAL_TITULO: TFloatField
      FieldName = 'VAL_TITULO'
    end
  end
  object QRTitulosPorFinalidade: TOracleDataSet1
    Session = DMOracle.DBCemapa
    Left = 176
    Top = 72
  end
  object QrCustosProducao: TOracleDataSet1
    SQL.Strings = (
      'SELECT '
      '    TB_CENTRO_CUSTO.COD_CENTRO_CUSTO, '
      '    TB_CENTRO_CUSTO.DESC_CENTRO_CUSTO,'
      '    TB_FINALIDADE.COD_FINALIDADE,'
      '    TB_FINALIDADE.DESC_FINALIDADE,'
      '    TB_HISTORICO.COD_HISTORICO,'
      '    TB_HISTORICO.DESC_HISTORICO,'
      '    SUM(TB_CONTA_PAGAR_MOV.VAL_MOVIMENTO)AS TOTAL'
      'FROM'
      '    TB_CENTRO_CUSTO, '
      '    TB_FINALIDADE, '
      '    TB_HISTORICO, '
      '    TB_CONTA_PAGAR_CAB,'
      '    TB_FILIAL,'
      '    TB_CONTA_PAGAR_MOV'
      'WHERE'
      '    TB_CONTA_PAGAR_CAB.COD_FILIAL = TB_FILIAL.COD_FILIAL'
      'AND'
      
        '    TB_FINALIDADE.COD_CENTRO_CUSTO = TB_CENTRO_CUSTO.COD_CENTRO_' +
        'CUSTO '
      'AND'
      
        '    TB_FINALIDADE.COD_HISTORICO_BAIXA = TB_HISTORICO.COD_HISTORI' +
        'CO'
      'AND'
      
        '    TB_CONTA_PAGAR_CAB.COD_FINALIDADE = TB_FINALIDADE.COD_FINALI' +
        'DADE'
      'AND'
      
        '    TB_CONTA_PAGAR_MOV.COD_CONTA_PAGAR_CAB = TB_CONTA_PAGAR_CAB.' +
        'COD_CONTA_PAGAR_CAB'
      'AND'
      
        '    TB_CONTA_PAGAR_MOV.COD_CONTA_PAGAR_CAB = TB_CONTA_PAGAR_CAB.' +
        'COD_CONTA_PAGAR_CAB'
      'AND'
      
        '    TB_CONTA_PAGAR_MOV.DT_MOVIMENTO BETWEEN :DATA_INI AND :DATA_' +
        'FIN  '
      'AND '
      '(:COD_FILIAL IS NULL OR'
      '    TB_CONTA_PAGAR_CAB.COD_FILIAL = :COD_FILIAL)'
      ''
      'GROUP BY'
      '    TB_CENTRO_CUSTO.COD_CENTRO_CUSTO, '
      '    TB_CENTRO_CUSTO.DESC_CENTRO_CUSTO,'
      '    TB_FINALIDADE.COD_FINALIDADE,'
      '    TB_FINALIDADE.DESC_FINALIDADE,'
      '    TB_HISTORICO.COD_HISTORICO,'
      '    TB_HISTORICO.DESC_HISTORICO'
      'order by cod_centro_custo nulls last')
    Variables.Data = {
      0300000003000000090000003A444154415F494E49050000000B00000030312F
      30312F323031390000000000090000003A444154415F46494E050000000B0000
      0033312F30312F3230313900000000000B0000003A434F445F46494C49414C05
      0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000700000010000000434F445F43454E54524F5F435553544F01000000
      000011000000444553435F43454E54524F5F435553544F0100000000000E0000
      00434F445F46494E414C49444144450100000000000F000000444553435F4649
      4E414C49444144450100000000000D000000434F445F484953544F5249434F01
      00000000000E000000444553435F484953544F5249434F010000000000050000
      00544F54414C010000000000}
    Session = DMOracle.DBCemapa
    Left = 280
    Top = 16
    object QrCustosProducaoCOD_CENTRO_CUSTO: TIntegerField
      FieldName = 'COD_CENTRO_CUSTO'
      Required = True
    end
    object QrCustosProducaoDESC_CENTRO_CUSTO: TStringField
      FieldName = 'DESC_CENTRO_CUSTO'
      Size = 30
    end
    object QrCustosProducaoCOD_FINALIDADE: TIntegerField
      FieldName = 'COD_FINALIDADE'
      Required = True
    end
    object QrCustosProducaoDESC_FINALIDADE: TStringField
      FieldName = 'DESC_FINALIDADE'
      Required = True
      Size = 30
    end
    object QrCustosProducaoCOD_HISTORICO: TIntegerField
      FieldName = 'COD_HISTORICO'
      Required = True
    end
    object QrCustosProducaoDESC_HISTORICO: TStringField
      FieldName = 'DESC_HISTORICO'
      Required = True
      Size = 30
    end
    object QrCustosProducaoTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
  object QRTitulosReparceladosCP: TOracleDataSet1
    SQL.Strings = (
      'SELECT DISTINCT'
      '    TB_CONTA_PAGAR_CAB.COD_CONTA_PAGAR_CAB,'
      '    TB_CONTA_PAGAR_CAB.NUM_TITULO,'
      '    TB_CONTA_PAGAR_CAB.NUM_PARCELA,'
      '    tb_conta_pagar_cab.val_titulo,'
      '    TB_CONTA_PAGAR_CAB.DT_VENCIMENTO,'
      '    TB_CADASTRO.COD_CADASTRO || '#39'-'#39' || TB_CADASTRO.NOME,'
      '    TB_CADASTRO.DESC_ENDERECO,'
      '    TB_CADASTRO.DESC_CIDADE || '#39'-'#39' || TB_CADASTRO.COD_ESTADO,'
      '    TB_CADASTRO.NUM_CGC_CPF,'
      '    TB_CADASTRO.NUM_INSCRICAO'
      'FROM TB_CONTA_PAGAR_CAB, TB_REPARCELAMENTO_CP, TB_CADASTRO'
      'WHERE'
      'TB_CONTA_PAGAR_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
      'AND'
      'TB_CONTA_PAGAR_CAB.NUM_TITULO = TB_REPARCELAMENTO_CP.NUM_TITULO'
      'AND'
      'TB_CONTA_PAGAR_CAB.NUM_TITULO = :NUM_TITULO'
      'AND'
      'TB_CONTA_PAGAR_CAB.DT_EMISSAO = :DT_EMISSAO'
      
        'ORDER BY TB_CONTA_PAGAR_CAB.NUM_TITULO, TB_CONTA_PAGAR_CAB.NUM_P' +
        'ARCELA')
    Variables.Data = {
      03000000020000000B0000003A4E554D5F544954554C4F030000000000000000
      0000000B0000003A44545F454D495353414F0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000A00000013000000434F445F434F4E54415F50414741525F43414201
      00000000000A0000004E554D5F544954554C4F0100000000000B0000004E554D
      5F50415243454C410100000000000D00000044545F56454E43494D454E544F01
      00000000001E00000054425F434144415354524F2E434F445F43414441535452
      4F7C7C272D277C0100000000000D000000444553435F454E44455245434F0100
      000000001E00000054425F434144415354524F2E444553435F4349444144457C
      7C272D277C7C0100000000000B0000004E554D5F4347435F4350460100000000
      000D0000004E554D5F494E5343524943414F0100000000000A00000056414C5F
      544954554C4F010000000000}
    Session = DMOracle.DBCemapa
    Left = 392
    Top = 16
    object QRTitulosReparceladosCPCOD_CONTA_PAGAR_CAB: TIntegerField
      FieldName = 'COD_CONTA_PAGAR_CAB'
      Required = True
    end
    object QRTitulosReparceladosCPNUM_TITULO: TFloatField
      FieldName = 'NUM_TITULO'
    end
    object QRTitulosReparceladosCPNUM_PARCELA: TIntegerField
      FieldName = 'NUM_PARCELA'
    end
    object QRTitulosReparceladosCPDT_VENCIMENTO: TDateTimeField
      FieldName = 'DT_VENCIMENTO'
    end
    object QRTitulosReparceladosCPTB_CADASTROCOD_CADASTRO: TStringField
      FieldName = 'TB_CADASTRO.COD_CADASTRO||'#39'-'#39'|'
      Size = 101
    end
    object QRTitulosReparceladosCPDESC_ENDERECO: TStringField
      FieldName = 'DESC_ENDERECO'
      Size = 60
    end
    object QRTitulosReparceladosCPTB_CADASTRODESC_CIDADE: TStringField
      FieldName = 'TB_CADASTRO.DESC_CIDADE||'#39'-'#39'||'
      Size = 33
    end
    object QRTitulosReparceladosCPNUM_CGC_CPF: TStringField
      FieldName = 'NUM_CGC_CPF'
      Size = 18
    end
    object QRTitulosReparceladosCPNUM_INSCRICAO: TStringField
      FieldName = 'NUM_INSCRICAO'
    end
    object QRTitulosReparceladosCPVAL_TITULO: TFloatField
      FieldName = 'VAL_TITULO'
    end
  end
  object QRTituloOriginalRep: TOracleDataSet1
    SQL.Strings = (
      'SELECT DISTINCT'
      '    TB_CONTA_PAGAR_CAB.NUM_TITULO,'
      '    TB_CONTA_PAGAR_CAB.DT_EMISSAO,'
      '    SUM(TB_CONTA_PAGAR_CAB.VAL_ORIGINAL) SVALOR'
      'FROM TB_CONTA_PAGAR_CAB'
      'where'
      
        'TB_CONTA_PAGAR_CAB.num_titulo in (select num_titulo_ant from tb_' +
        'reparcelamento_cp where num_titulo IN (:NUM_TITULO))'
      'and'
      
        'TB_CONTA_PAGAR_CAB.DT_EMISSAO IN (select DT_EMISSAO_ant from tb_' +
        'reparcelamento_cp where num_titulo IN (:NUM_TITULO))'
      'GROUP BY'
      '    TB_CONTA_PAGAR_CAB.NUM_TITULO,'
      '    TB_CONTA_PAGAR_CAB.DT_EMISSAO')
    Variables.Data = {
      03000000010000000B0000003A4E554D5F544954554C4F010000000000000000
      000000}
    QBEDefinition.QBEFieldDefs = {
      04000000030000000A0000004E554D5F544954554C4F0100000000000A000000
      44545F454D495353414F010000000000060000005356414C4F52010000000000}
    Session = DMOracle.DBCemapa
    AfterOpen = QRTituloOriginalRepAfterOpen
    Left = 504
    Top = 16
    object QRTituloOriginalRepNUM_TITULO: TFloatField
      FieldName = 'NUM_TITULO'
    end
    object QRTituloOriginalRepDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
    object QRTituloOriginalRepSVALOR: TFloatField
      FieldName = 'SVALOR'
    end
  end
end
