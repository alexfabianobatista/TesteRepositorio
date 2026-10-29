object DMCadastroMySQL: TDMCadastroMySQL
  OldCreateOrder = False
  Left = 652
  Top = 247
  Height = 309
  Width = 406
  object ZQCadastro: TZQuery
    Connection = DMMySQL.ZConnection1
    SQL.Strings = (
      'SELECT'
      '  '#39'C'#39' AS TIPO,'
      '  CLI.CLI_CODIGO,'
      #9'CLI.CLI_NOME,'
      #9'CLI.CLI_NOMEFANT,'
      #9'CLI.CLI_ENDERECO,'
      #9'CLI.CLI_BAIRRO,'
      #9'CLI.CLI_CEP,'
      #9'CLI.CLI_FONE,'
      '  CLI.CLI_DDD,'
      '  CLI.CLI_FAXDDD,'
      #9'CLI.CLI_FAX,'
      #9'CLI.CLI_EMAIL,'
      #9'CLI.CLI_CXPOSTAL,'
      #9'CLI.CLI_FISICAJURIDICA,'
      #9'CLI.CLI_CONSUMFINAL,'
      #9'CLI.CLI_LIMITECREDITO,'
      #9'CLI.CLI_OBSERVACOES,'
      #9'CLI.CLI_SITUACAO,'
      #9'CLI.CLI_DATACAD,'
      #9'C.CID_NOME,'
      #9'C.CID_ESTADO,'
      #9'CLI.CLI_COMPLEMENTO,'
      #9'CLI.CLI_ENDNUMERO,'
      #9'CLI.CLI_CODANP,'
      '  FIS.CLFS_RG AS INSCEST,'
      '  FIS.CLFS_CPF AS CPF,'
      '  FIS.CLFS_RG AS RG'
      'FROM'
      '  CLIENTES CLI,'
      '  CIDADES C,'
      '  CLIENTESFISICA FIS'
      'WHERE'
      '  CLI.CID_CODIGO = C.CID_CODIGO'
      '  AND'
      '  CLI.CLI_CODIGO = FIS.CLI_CODIGO'
      ''
      'UNION'
      ''
      'SELECT'
      '  '#39'C'#39' AS TIPO,'
      '  CLI.CLI_CODIGO,'
      #9'CLI.CLI_NOME,'
      #9'CLI.CLI_NOMEFANT,'
      #9'CLI.CLI_ENDERECO,'
      #9'CLI.CLI_BAIRRO,'
      #9'CLI.CLI_CEP,'
      #9'CLI.CLI_FONE,'
      '  CLI.CLI_DDD,'
      '  CLI.CLI_FAXDDD,'
      #9'CLI.CLI_FAX,'
      #9'CLI.CLI_EMAIL,'
      #9'CLI.CLI_CXPOSTAL,'
      #9'CLI.CLI_FISICAJURIDICA,'
      #9'CLI.CLI_CONSUMFINAL,'
      #9'CLI.CLI_LIMITECREDITO,'
      #9'CLI.CLI_OBSERVACOES,'
      #9'CLI.CLI_SITUACAO,'
      #9'CLI.CLI_DATACAD,'
      #9'C.CID_NOME,'
      #9'C.CID_ESTADO,'
      #9'CLI.CLI_COMPLEMENTO,'
      #9'CLI.CLI_ENDNUMERO,'
      #9'CLI.CLI_CODANP,'
      '  JUR.CLJR_INSCEST AS INSCEST,'
      '  JUR.CLJR_CNPJ AS CPF,'
      '  '#39#39' AS RG'
      'FROM'
      '  CLIENTES CLI,'
      '  CIDADES C,'
      '  CLIENTESJURIDICA JUR'
      'WHERE'
      '  CLI.CID_CODIGO = C.CID_CODIGO'
      '  AND'
      '  CLI.CLI_CODIGO = JUR.CLI_CODIGO'
      '')
    Params = <>
    Left = 32
    Top = 24
    object ZQCadastroTIPO: TStringField
      FieldName = 'TIPO'
      ReadOnly = True
      Size = 1
    end
    object ZQCadastroCLI_NOME: TStringField
      FieldName = 'CLI_NOME'
      ReadOnly = True
      Size = 60
    end
    object ZQCadastroCLI_NOMEFANT: TStringField
      FieldName = 'CLI_NOMEFANT'
      ReadOnly = True
      Size = 50
    end
    object ZQCadastroCLI_ENDERECO: TStringField
      FieldName = 'CLI_ENDERECO'
      ReadOnly = True
      Size = 50
    end
    object ZQCadastroCLI_BAIRRO: TStringField
      FieldName = 'CLI_BAIRRO'
      ReadOnly = True
      Size = 50
    end
    object ZQCadastroCLI_CEP: TStringField
      FieldName = 'CLI_CEP'
      ReadOnly = True
      Size = 8
    end
    object ZQCadastroCLI_FONE: TStringField
      FieldName = 'CLI_FONE'
      ReadOnly = True
      Size = 25
    end
    object ZQCadastroCLI_FAX: TStringField
      FieldName = 'CLI_FAX'
      ReadOnly = True
      Size = 25
    end
    object ZQCadastroCLI_EMAIL: TStringField
      FieldName = 'CLI_EMAIL'
      ReadOnly = True
      Size = 50
    end
    object ZQCadastroCLI_FISICAJURIDICA: TStringField
      FieldName = 'CLI_FISICAJURIDICA'
      ReadOnly = True
      Size = 1
    end
    object ZQCadastroCLI_CONSUMFINAL: TStringField
      FieldName = 'CLI_CONSUMFINAL'
      ReadOnly = True
      Size = 1
    end
    object ZQCadastroCLI_LIMITECREDITO: TFloatField
      FieldName = 'CLI_LIMITECREDITO'
      ReadOnly = True
    end
    object ZQCadastroCLI_OBSERVACOES: TMemoField
      FieldName = 'CLI_OBSERVACOES'
      ReadOnly = True
      BlobType = ftMemo
    end
    object ZQCadastroCLI_SITUACAO: TStringField
      FieldName = 'CLI_SITUACAO'
      ReadOnly = True
      Size = 1
    end
    object ZQCadastroCLI_DATACAD: TDateField
      FieldName = 'CLI_DATACAD'
      ReadOnly = True
    end
    object ZQCadastroCID_NOME: TStringField
      FieldName = 'CID_NOME'
      ReadOnly = True
      Size = 50
    end
    object ZQCadastroCID_ESTADO: TStringField
      FieldName = 'CID_ESTADO'
      ReadOnly = True
      Size = 2
    end
    object ZQCadastroCLI_COMPLEMENTO: TStringField
      FieldName = 'CLI_COMPLEMENTO'
      ReadOnly = True
      Size = 500
    end
    object ZQCadastroCLI_ENDNUMERO: TStringField
      FieldName = 'CLI_ENDNUMERO'
      ReadOnly = True
      Size = 10
    end
    object ZQCadastroCLI_CODANP: TStringField
      FieldName = 'CLI_CODANP'
      ReadOnly = True
      Size = 7
    end
    object ZQCadastroINSCEST: TStringField
      FieldName = 'INSCEST'
      ReadOnly = True
    end
    object ZQCadastroCPF: TStringField
      FieldName = 'CPF'
      ReadOnly = True
    end
    object ZQCadastroRG: TStringField
      FieldName = 'RG'
      ReadOnly = True
    end
    object ZQCadastroCLI_DDD: TStringField
      FieldName = 'CLI_DDD'
      ReadOnly = True
      Size = 2
    end
    object ZQCadastroCLI_FAXDDD: TStringField
      FieldName = 'CLI_FAXDDD'
      ReadOnly = True
      Size = 2
    end
    object ZQCadastroCLI_CODIGO: TIntegerField
      FieldName = 'CLI_CODIGO'
      ReadOnly = True
    end
  end
end
