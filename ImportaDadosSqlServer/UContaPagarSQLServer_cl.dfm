object DMContaPagarSQLServer: TDMContaPagarSQLServer
  OldCreateOrder = False
  Left = 248
  Top = 138
  Height = 216
  Width = 234
  object SSQCP: TADOQuery
    Connection = DMSqlServer.ConexaoSqlServer
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT [Numero lcto] AS COD_CONTA_PAGAR_CAB'
      '      ,[Duplicata] AS NUM_DUPLICATA'
      '      ,[Cod fornecedor] AS COD_FORNECEDOR'
      '      ,[Nome fornecedor] AS NOME_FORNECEDOR'
      '      ,[Vencimento] AS DT_VENCIMENTO'
      '      ,[Emiss'#227'o] AS DT_EMISSAO'
      '      ,[Valor duplicata] AS VALOR'
      '      ,[Valor pago] AS VALOR_PAGO'
      '      ,[Juros pago] AS VALOR_JUROS'
      '      ,[Data de pgto] AS DT_PAGAMENTO'
      '      ,[Recebimento] AS IND_SITUACAO'
      '      ,[Codigo conta] AS COD_FINALIDADE'
      '      ,[Descricao conta] AS DESC_FINALIDADE'
      '      ,[Historico]'
      '      ,[Numero nf]'
      'FROM [SIGIND].[dbo].[Pagar]'
      'WHERE [Recebimento] = '#39'Aberto'#39)
    Left = 24
    Top = 16
    object SSQCPCOD_CONTA_PAGAR_CAB: TIntegerField
      FieldName = 'COD_CONTA_PAGAR_CAB'
    end
    object SSQCPNUM_DUPLICATA: TStringField
      FieldName = 'NUM_DUPLICATA'
    end
    object SSQCPCOD_FORNECEDOR: TIntegerField
      FieldName = 'COD_FORNECEDOR'
    end
    object SSQCPNOME_FORNECEDOR: TStringField
      FieldName = 'NOME_FORNECEDOR'
      Size = 70
    end
    object SSQCPDT_VENCIMENTO: TDateTimeField
      FieldName = 'DT_VENCIMENTO'
    end
    object SSQCPDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
    object SSQCPVALOR: TBCDField
      FieldName = 'VALOR'
      Precision = 10
      Size = 2
    end
    object SSQCPVALOR_PAGO: TBCDField
      FieldName = 'VALOR_PAGO'
      Precision = 10
      Size = 2
    end
    object SSQCPVALOR_JUROS: TBCDField
      FieldName = 'VALOR_JUROS'
      Precision = 10
      Size = 2
    end
    object SSQCPDT_PAGAMENTO: TDateTimeField
      FieldName = 'DT_PAGAMENTO'
    end
    object SSQCPIND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
    end
    object SSQCPCOD_FINALIDADE: TStringField
      FieldName = 'COD_FINALIDADE'
      Size = 8
    end
    object SSQCPDESC_FINALIDADE: TStringField
      FieldName = 'DESC_FINALIDADE'
      Size = 30
    end
    object SSQCPHistorico: TStringField
      FieldName = 'Historico'
      Size = 100
    end
    object SSQCPNumeronf: TIntegerField
      FieldName = 'Numero nf'
    end
  end
end
