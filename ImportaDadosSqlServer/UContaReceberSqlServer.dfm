object DMContaReceberSqlServer: TDMContaReceberSqlServer
  OldCreateOrder = False
  Left = 617
  Top = 280
  Height = 150
  Width = 215
  object SSQContaReceber: TADOQuery
    Connection = DMSqlServer.ConexaoSqlServer
    Parameters = <>
    SQL.Strings = (
      'SELECT [Numero lcto] COD_CONTA_RECEBER_CAB'
      '      , REPLACE([Duplicata],'#39'-'#39', '#39#39') NUM_CONTA_RECEBER'
      
        #9'  , SUBSTRING([Duplicata], CHARINDEX('#39'-'#39', [Duplicata]) + 1, LEN' +
        '([Duplicata]))  NUM_PARCELA '
      '      ,[Cod fornecedor] COD_CADASTRO'
      '      ,[Nome fornecedor] NOME_CADASTRO'
      '      ,[Vencimento] DT_VENCIMENTO'
      '      ,[Emiss'#227'o] DT_EMISSAO'
      '      ,[Valor duplicata] VAL_TITULO'
      '      ,[Valor pago] VAL_PAGO'
      '      ,[Juros pago] VAL_JUROS'
      '      ,[Data de pgto] DT_PAGAMENTO'
      '      ,[Recebimento] IND_SITUACAO'
      '      ,[Codigo conta] COD_CONTA_CONTABIL'
      '      ,[Descricao conta] DESC_CONTA_CONTABIL'
      '      ,[Cxbco] COD_CAIXA'
      '      ,[Cobran'#231'a] IND_TIPO_COBRANCA'
      '      ,[Cheque] '
      '      ,[Historico]'
      '      ,[Dias atraso]'
      '      ,[Numero nf] NUM_NOTA'
      '      ,[Codemp] COD_FILIAL'
      '  FROM [SIGIND].[dbo].[Pagar]'
      '  ORDER BY COD_CONTA_RECEBER_CAB,'
      #9#9'   NUM_CONTA_RECEBER,'
      #9#9'   COD_CADASTRO,'
      #9#9'   DT_EMISSAO;')
    Left = 40
    Top = 24
    object SSQContaReceberCOD_CONTA_RECEBER_CAB: TIntegerField
      FieldName = 'COD_CONTA_RECEBER_CAB'
    end
    object SSQContaReceberNUM_CONTA_RECEBER: TStringField
      FieldName = 'NUM_CONTA_RECEBER'
      ReadOnly = True
      Size = 8000
    end
    object SSQContaReceberNUM_PARCELA: TStringField
      FieldName = 'NUM_PARCELA'
      ReadOnly = True
    end
    object SSQContaReceberCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
    end
    object SSQContaReceberNOME_CADASTRO: TStringField
      FieldName = 'NOME_CADASTRO'
      Size = 70
    end
    object SSQContaReceberDT_VENCIMENTO: TDateTimeField
      FieldName = 'DT_VENCIMENTO'
    end
    object SSQContaReceberDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
    object SSQContaReceberVAL_TITULO: TBCDField
      FieldName = 'VAL_TITULO'
      Precision = 10
      Size = 2
    end
    object SSQContaReceberVAL_PAGO: TBCDField
      FieldName = 'VAL_PAGO'
      Precision = 10
      Size = 2
    end
    object SSQContaReceberVAL_JUROS: TBCDField
      FieldName = 'VAL_JUROS'
      Precision = 10
      Size = 2
    end
    object SSQContaReceberDT_PAGAMENTO: TDateTimeField
      FieldName = 'DT_PAGAMENTO'
    end
    object SSQContaReceberIND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
    end
    object SSQContaReceberCOD_CONTA_CONTABIL: TStringField
      FieldName = 'COD_CONTA_CONTABIL'
      Size = 8
    end
    object SSQContaReceberDESC_CONTA_CONTABIL: TStringField
      FieldName = 'DESC_CONTA_CONTABIL'
      Size = 30
    end
    object SSQContaReceberCOD_CAIXA: TSmallintField
      FieldName = 'COD_CAIXA'
    end
    object SSQContaReceberIND_TIPO_COBRANCA: TSmallintField
      FieldName = 'IND_TIPO_COBRANCA'
    end
    object SSQContaReceberCheque: TStringField
      FieldName = 'Cheque'
      Size = 6
    end
    object SSQContaReceberHistorico: TStringField
      FieldName = 'Historico'
      Size = 100
    end
    object SSQContaReceberDiasatraso: TIntegerField
      FieldName = 'Dias atraso'
    end
    object SSQContaReceberNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
    end
    object SSQContaReceberCOD_FILIAL: TStringField
      FieldName = 'COD_FILIAL'
      Size = 5
    end
  end
end
