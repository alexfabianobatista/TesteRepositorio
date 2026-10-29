object DmValida: TDmValida
  OldCreateOrder = False
  Left = 396
  Top = 199
  Height = 303
  Width = 407
  object QCadastro: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  C.COD_CADASTRO,'
      '  C.NOME,'
      '  C.NUM_CGC_CPF,'
      '  C.IND_FISICA_JURIDICA,'
      
        '  decode(C.IND_FISICA_JURIDICA, '#39'J'#39', C.NUM_CGC_CPF, '#39#39') as DESC_' +
        'CNPJ,'
      
        '  decode(C.IND_FISICA_JURIDICA, '#39'F'#39', C.NUM_CGC_CPF, '#39#39') as DESC_' +
        'CPF,'
      '  C.NUM_INSCRICAO,'
      '  E.DESC_SIGLA_ESTADO,'
      '  '#39'N'#39' as IND_ERRO,'
      '  cast('#39#39' as varchar2(2000)) as DESC_MENSAGEM_ERRO,'
      '  '#39'N'#39' as IND_ALTERADO,'
      '  '#39'N'#39' AS IND_ERRO_CPF,'
      '  '#39'N'#39' AS IND_ERRO_CNPJ,'
      '  '#39'N'#39' AS IND_ERRO_IE,'
      '  '#39'N'#39' AS IND_ERRO_TELEFONE,'
      '  CAST('#39#39' AS VARCHAR(20))AS DESC_CPF_NUMEROS,'
      '  CAST('#39#39' AS VARCHAR(20))AS DESC_CNPJ_NUMEROS,'
      '  CAST('#39#39' AS VARCHAR(20))AS NUM_INSCRICAO_NUMEROS,'
      '  C.DESC_TELEFONE,'
      '  CAST('#39#39' AS VARCHAR(20))AS DESC_TELEFONE_NUMEROS,'
      '  C.DESC_INSCRICAO_MUNICIPAL'
      'FROM'
      '  TB_CADASTRO C'
      'LEFT JOIN TB_ESTADO E ON C.COD_ESTADO = E.COD_ESTADO'
      'ORDER BY'
      '  C.COD_CADASTRO')
    QBEDefinition.QBEFieldDefs = {
      04000000150000000B0000004E554D5F4347435F435046010000000000130000
      00494E445F4649534943415F4A55524944494341010000000000090000004445
      53435F434E504A01000000000008000000444553435F4350460100000000000D
      0000004E554D5F494E5343524943414F0100000000000C000000434F445F4341
      44415354524F010000000000040000004E4F4D45010000000000110000004445
      53435F5349474C415F45535441444F01000000000008000000494E445F455252
      4F01000000000012000000444553435F4D454E534147454D5F4552524F010000
      0000000C000000494E445F414C54455241444F0100000000000C000000494E44
      5F4552524F5F4350460100000000000D000000494E445F4552524F5F434E504A
      0100000000000B000000494E445F4552524F5F49450100000000001000000044
      4553435F4350465F4E554D45524F5301000000000011000000444553435F434E
      504A5F4E554D45524F53010000000000150000004E554D5F494E534352494341
      4F5F4E554D45524F5301000000000011000000494E445F4552524F5F54454C45
      464F4E450100000000000D000000444553435F54454C45464F4E450100000000
      0015000000444553435F54454C45464F4E455F4E554D45524F53010000000000
      18000000444553435F494E5343524943414F5F4D554E49434950414C01000000
      0000}
    AutoCalcFields = False
    Session = DMOracle.DBCemapa
    Left = 24
    Top = 16
    object QCadastroNUM_CGC_CPF: TStringField
      FieldName = 'NUM_CGC_CPF'
      Size = 18
    end
    object QCadastroIND_FISICA_JURIDICA: TStringField
      FieldName = 'IND_FISICA_JURIDICA'
      Size = 1
    end
    object QCadastroDESC_CNPJ: TStringField
      FieldName = 'DESC_CNPJ'
      Size = 18
    end
    object QCadastroDESC_CPF: TStringField
      FieldName = 'DESC_CPF'
      Size = 18
    end
    object QCadastroNUM_INSCRICAO: TStringField
      FieldName = 'NUM_INSCRICAO'
    end
    object QCadastroCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
    end
    object QCadastroNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object QCadastroDESC_SIGLA_ESTADO: TStringField
      FieldName = 'DESC_SIGLA_ESTADO'
      Size = 2
    end
    object QCadastroIND_ERRO: TStringField
      FieldName = 'IND_ERRO'
      Size = 1
    end
    object QCadastroDESC_MENSAGEM_ERRO: TStringField
      FieldName = 'DESC_MENSAGEM_ERRO'
      Size = 2000
    end
    object QCadastroIND_ALTERADO: TStringField
      FieldName = 'IND_ALTERADO'
      Size = 1
    end
    object QCadastroIND_ERRO_CPF: TStringField
      FieldName = 'IND_ERRO_CPF'
      Size = 1
    end
    object QCadastroIND_ERRO_CNPJ: TStringField
      FieldName = 'IND_ERRO_CNPJ'
      Size = 1
    end
    object QCadastroIND_ERRO_IE: TStringField
      FieldName = 'IND_ERRO_IE'
      Size = 1
    end
    object QCadastroDESC_CPF_NUMEROS: TStringField
      FieldName = 'DESC_CPF_NUMEROS'
    end
    object QCadastroDESC_CNPJ_NUMEROS: TStringField
      FieldName = 'DESC_CNPJ_NUMEROS'
    end
    object QCadastroNUM_INSCRICAO_NUMEROS: TStringField
      FieldName = 'NUM_INSCRICAO_NUMEROS'
    end
    object QCadastroIND_ERRO_TELEFONE: TStringField
      FieldName = 'IND_ERRO_TELEFONE'
      Size = 1
    end
    object QCadastroDESC_TELEFONE: TStringField
      FieldName = 'DESC_TELEFONE'
      Size = 12
    end
    object QCadastroDESC_TELEFONE_NUMEROS: TStringField
      FieldName = 'DESC_TELEFONE_NUMEROS'
    end
    object QCadastroDESC_INSCRICAO_MUNICIPAL: TStringField
      FieldName = 'DESC_INSCRICAO_MUNICIPAL'
      Size = 15
    end
  end
  object DsPCadastro: TDataSetProvider
    DataSet = QCadastro
    Left = 24
    Top = 64
  end
  object CdCadastro: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    AutoCalcFields = False
    Filter = 'IND_ERRO = '#39'S'#39
    Filtered = True
    Params = <>
    ProviderName = 'DsPCadastro'
    Left = 24
    Top = 112
    object CdCadastroNUM_CGC_CPF: TStringField
      FieldName = 'NUM_CGC_CPF'
      Size = 18
    end
    object CdCadastroIND_FISICA_JURIDICA: TStringField
      FieldName = 'IND_FISICA_JURIDICA'
      Size = 1
    end
    object CdCadastroDESC_CNPJ: TStringField
      FieldName = 'DESC_CNPJ'
      Size = 18
    end
    object CdCadastroDESC_CPF: TStringField
      FieldName = 'DESC_CPF'
      Size = 18
    end
    object CdCadastroNUM_INSCRICAO: TStringField
      FieldName = 'NUM_INSCRICAO'
    end
    object CdCadastroCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
    end
    object CdCadastroNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object CdCadastroDESC_SIGLA_ESTADO: TStringField
      FieldName = 'DESC_SIGLA_ESTADO'
      Size = 2
    end
    object CdCadastroIND_ERRO: TStringField
      FieldName = 'IND_ERRO'
      Size = 1
    end
    object CdCadastroDESC_MENSAGEM_ERRO: TStringField
      FieldName = 'DESC_MENSAGEM_ERRO'
      Size = 2000
    end
    object CdCadastroIND_ALTERADO: TStringField
      FieldName = 'IND_ALTERADO'
      Size = 1
    end
    object CdCadastroIND_ERRO_CPF: TStringField
      FieldName = 'IND_ERRO_CPF'
      Size = 1
    end
    object CdCadastroIND_ERRO_CNPJ: TStringField
      FieldName = 'IND_ERRO_CNPJ'
      Size = 1
    end
    object CdCadastroIND_ERRO_IE: TStringField
      FieldName = 'IND_ERRO_IE'
      Size = 1
    end
    object CdCadastroDESC_CPF_NUMEROS: TStringField
      FieldName = 'DESC_CPF_NUMEROS'
    end
    object CdCadastroDESC_CNPJ_NUMEROS: TStringField
      FieldName = 'DESC_CNPJ_NUMEROS'
    end
    object CdCadastroNUM_INSCRICAO_NUMEROS: TStringField
      FieldName = 'NUM_INSCRICAO_NUMEROS'
    end
    object CdCadastroIND_ERRO_TELEFONE: TStringField
      FieldName = 'IND_ERRO_TELEFONE'
      Size = 1
    end
    object CdCadastroDESC_TELEFONE: TStringField
      FieldName = 'DESC_TELEFONE'
      Size = 12
    end
    object CdCadastroDESC_TELEFONE_NUMEROS: TStringField
      FieldName = 'DESC_TELEFONE_NUMEROS'
    end
    object CdCadastroDESC_INSCRICAO_MUNICIPAL: TStringField
      FieldName = 'DESC_INSCRICAO_MUNICIPAL'
      Size = 15
    end
    object CdCadastrototal_registros: TAggregateField
      FieldName = 'total_registros'
      Active = True
      DisplayFormat = '#,##0.'
      Expression = 'count(*)'
    end
  end
  object QConsEstado: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  DESC_SIGLA_ESTADO'
      'FROM'
      '  TB_ESTADO')
    QBEDefinition.QBEFieldDefs = {
      040000000100000011000000444553435F5349474C415F45535441444F010000
      000000}
    Session = DMOracle.DBCemapa
    Left = 88
    Top = 16
    object QConsEstadoDESC_SIGLA_ESTADO: TStringField
      FieldName = 'DESC_SIGLA_ESTADO'
      Required = True
      Size = 2
    end
    object QConsEstadodesc_mascara: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_mascara'
      Size = 30
      Calculated = True
    end
  end
  object QNotas: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  N.ROWID,'
      '  N.COD_NOTA_CAB,'
      '  N.NUM_NOTA,'
      '  '#39'('#39' || F.COD_FILIAL || '#39') '#39' || F.DESC_FILIAL AS DESC_FILIAL,'
      '  N.COD_SERIE,'
      '  N.DESC_CHAVE_ACESSO'
      'FROM'
      '  TB_NOTA_CAB N'
      
        'INNER JOIN TB_SERIE S ON (N.COD_SERIE = S.COD_SERIE AND N.COD_FI' +
        'LIAL = S.COD_FILIAL)'
      'INNER JOIN TB_FILIAL F ON F.COD_FILIAL = N.COD_FILIAL'
      'WHERE'
      '  S.DESC_MODELO = '#39'55'#39
      'AND'
      
        '  (((N.DESC_CHAVE_ACESSO is null or N.DESC_CHAVE_ACESSO = '#39#39') an' +
        'd :TIPO = 0) or ((N.DESC_CHAVE_ACESSO is not null or N.DESC_CHAV' +
        'E_ACESSO <> '#39#39') and :TIPO = 1) or (:TIPO = 2))'
      'AND'
      '  (N.COD_FILIAL = :COD_FILIAL OR :COD_FILIAL = 0)'
      'AND'
      '  (N.DT_RECEBIMENTO BETWEEN :DATA_INI AND :DATA_FIN)')
    Variables.Data = {
      0300000004000000050000003A5449504F0300000000000000000000000B0000
      003A434F445F46494C49414C030000000000000000000000090000003A444154
      415F494E490C0000000000000000000000090000003A444154415F46494E0C00
      00000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000050000000C000000434F445F4E4F54415F4341420100000000000800
      00004E554D5F4E4F544101000000000009000000434F445F5345524945010000
      00000011000000444553435F43484156455F41434553534F0100000000000B00
      0000444553435F46494C49414C010000000000}
    Session = DMOracle.DBCemapa
    Left = 184
    Top = 16
    object QNotasCOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
      ReadOnly = True
      Required = True
    end
    object QNotasNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
      ReadOnly = True
      Required = True
    end
    object QNotasDESC_FILIAL: TStringField
      FieldName = 'DESC_FILIAL'
      ReadOnly = True
      Size = 50
    end
    object QNotasCOD_SERIE: TStringField
      FieldName = 'COD_SERIE'
      ReadOnly = True
      Required = True
      Size = 3
    end
    object QNotasDESC_CHAVE_ACESSO: TStringField
      FieldName = 'DESC_CHAVE_ACESSO'
      Size = 47
    end
  end
end
