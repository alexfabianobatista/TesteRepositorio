object DMContaReceberSQLServer: TDMContaReceberSQLServer
  OldCreateOrder = False
  Left = 259
  Top = 125
  Height = 150
  Width = 215
  object SSQCR: TADOQuery
    Connection = DMSqlServer.ConexaoSqlServer
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'WITH CTE AS'
      '('
      '    SELECT '
      '        [Duplicata]       AS NUM_TITULO,'
      #9#9'[Numero lcto]     AS COD_CONTA_RECEBER_CAB,'
      '        [Cliente]         AS COD_CADASTRO,'
      '        [Nome cliente]    AS NOME_CADASTRO,'
      '        [Emiss'#227'o]         AS DT_EMISSAO,'
      '        [Vencimento]      AS DT_VENCIMENTO,'
      '        [Data pgto]       AS DT_PAGAMENTO,'
      '        [Valor duplicata] AS VAL_TITULO,'
      '        [Valor recebido]  AS VAL_RECEBIDO,'
      '        [Juros]           AS VAL_JUROS,'
      '        [N'#186' pedido]       AS NUM_PEDIDO,'
      '        [Receb]           AS IND_SITUACAO,'
      '        [Nossonumero],'
      '        [Registro]        AS DESC_REGISTRO,'
      '        [Valor pecas],'
      '        [Valor bruto],'
      
        '        ROW_NUMBER() OVER (PARTITION BY [Duplicata] ORDER BY [Nu' +
        'mero lcto]) AS RN'
      '    FROM [SIGIND].[dbo].[Receber]'
      '    WHERE [Cliente] > 1'
      '      AND [Cliente] NOT IN (101,1)'
      '      AND [Receb] = '#39'Baixado'#39
      '      AND [Duplicata] <> '#39'Entrada'#39
      '      AND [Emiss'#227'o] >= '#39'2024-01-01'#39
      '      AND [Valor duplicata] > 0'
      ')'
      ''
      'SELECT *'
      'FROM CTE'
      'WHERE RN = 1')
    Left = 24
    Top = 16
    object SSQCRCOD_CONTA_RECEBER_CAB: TIntegerField
      FieldName = 'COD_CONTA_RECEBER_CAB'
    end
    object SSQCRNUM_TITULO: TStringField
      FieldName = 'NUM_TITULO'
    end
    object SSQCRCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
    end
    object SSQCRNOME_CADASTRO: TStringField
      FieldName = 'NOME_CADASTRO'
      Size = 100
    end
    object SSQCRDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
    object SSQCRDT_VENCIMENTO: TDateTimeField
      FieldName = 'DT_VENCIMENTO'
    end
    object SSQCRDT_PAGAMENTO: TDateTimeField
      FieldName = 'DT_PAGAMENTO'
    end
    object SSQCRVAL_TITULO: TBCDField
      FieldName = 'VAL_TITULO'
      Precision = 10
      Size = 2
    end
    object SSQCRVAL_JUROS: TBCDField
      FieldName = 'VAL_JUROS'
      Precision = 10
      Size = 2
    end
    object SSQCRNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object SSQCRIND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Size = 15
    end
    object SSQCRNossonumero: TIntegerField
      FieldName = 'Nossonumero'
    end
    object SSQCRDESC_REGISTRO: TStringField
      FieldName = 'DESC_REGISTRO'
      Size = 30
    end
    object SSQCRValorpecas: TBCDField
      FieldName = 'Valor pecas'
      Precision = 10
      Size = 2
    end
    object SSQCRValorbruto: TBCDField
      FieldName = 'Valor bruto'
      Precision = 10
      Size = 2
    end
    object SSQCRVAL_RECEBIDO: TBCDField
      FieldName = 'VAL_RECEBIDO'
      Precision = 10
      Size = 2
    end
  end
end
