object DMVendedorFirebird: TDMVendedorFirebird
  OldCreateOrder = False
  Left = 375
  Top = 226
  Height = 229
  Width = 251
  object ZQVendedorRetifoz: TZQuery
    Connection = DMFirebird.ZConnection1
    SQL.Strings = (
      'SELECT'
      ' CAD.CODIGO AS COD_VENDEDOR,'
      ' UPPER(CAD.NOME) AS NOME,'
      
        ' UPPER(CAD.ENDERECO) || '#39','#39' || UPPER(CAD.NRO_ENDERECO) AS DESC_E' +
        'NDERECO,'
      ' UPPER(CAD.BAIRRO) AS DESC_BAIRRO,'
      ' CAD.CPF_CNPJ AS DESC_CPF,'
      ' CAD.RG_INSCESTADUAL AS DESC_IDENTIDADE,'
      ' CAD.DT_NASCIMENTO AS DT_NASCIMENTO,'
      ' CAD.EMAIL AS DESC_EMAIL,'
      ' '#39'ATIVO'#39' AS IND_SITUACAO,'
      ' VEND.DATA_INC AS DT_CADASTRO,'
      ' CAD.CEP AS DESC_CEP,'
      ' UPPER(CID.NOME) AS DESC_CIDADE,'
      ' UPPER(CID.UF) AS COD_ESTADO'
      'FROM'
      ' CAD_TERCEIROS CAD'
      
        'INNER JOIN CAD_TERCEIROS_VENDEDORES VEND ON CAD.CODIGO = VEND.CO' +
        'DIGO'
      'INNER JOIN CAD_MUNICIPIOS CID ON CAD.MUNICIPIO = CID.CODIGO')
    Params = <>
    Left = 48
    Top = 24
    object ZQVendedorRetifozCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object ZQVendedorRetifozNOME: TStringField
      FieldName = 'NOME'
      ReadOnly = True
      Size = 50
    end
    object ZQVendedorRetifozDESC_ENDERECO: TStringField
      FieldName = 'DESC_ENDERECO'
      ReadOnly = True
      Size = 71
    end
    object ZQVendedorRetifozDESC_BAIRRO: TStringField
      FieldName = 'DESC_BAIRRO'
      ReadOnly = True
      Size = 40
    end
    object ZQVendedorRetifozDESC_CPF: TStringField
      FieldName = 'DESC_CPF'
    end
    object ZQVendedorRetifozDESC_IDENTIDADE: TStringField
      FieldName = 'DESC_IDENTIDADE'
      Size = 15
    end
    object ZQVendedorRetifozDT_NASCIMENTO: TDateField
      FieldName = 'DT_NASCIMENTO'
    end
    object ZQVendedorRetifozDESC_EMAIL: TStringField
      FieldName = 'DESC_EMAIL'
      Size = 200
    end
    object ZQVendedorRetifozIND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      ReadOnly = True
      Size = 5
    end
    object ZQVendedorRetifozDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
    end
    object ZQVendedorRetifozDESC_CEP: TStringField
      FieldName = 'DESC_CEP'
      Size = 10
    end
    object ZQVendedorRetifozDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      ReadOnly = True
      Size = 50
    end
    object ZQVendedorRetifozCOD_ESTADO: TStringField
      FieldName = 'COD_ESTADO'
      ReadOnly = True
      Size = 2
    end
  end
  object ZQVendedorFoneRetifoz: TZQuery
    Connection = DMFirebird.ZConnection1
    SQL.Strings = (
      'SELECT'
      '  CODIGO AS COD_VENDEDOR,'
      '  NUMERO AS DESC_FONE,'
      '  TIPO AS DESC_TIPO_FONE,'
      '  UPPER(CONTATO) AS NOME_CONTATO1'
      'FROM'
      '  CAD_TERCEIROS_FONES'
      'WHERE'
      '  CODIGO = :COD_VENDEDOR'
      'ORDER BY'
      '  CODIGO')
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_VENDEDOR'
        ParamType = ptUnknown
      end>
    Left = 96
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'COD_VENDEDOR'
        ParamType = ptUnknown
      end>
    object ZQVendedorFoneRetifozCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object ZQVendedorFoneRetifozDESC_FONE: TStringField
      FieldName = 'DESC_FONE'
      Required = True
    end
    object ZQVendedorFoneRetifozDESC_TIPO_FONE: TStringField
      FieldName = 'DESC_TIPO_FONE'
      Size = 15
    end
    object ZQVendedorFoneRetifozNOME_CONTATO1: TStringField
      FieldName = 'NOME_CONTATO1'
      ReadOnly = True
      Size = 50
    end
  end
end
