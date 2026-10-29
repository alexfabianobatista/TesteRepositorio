object DMNotaSaidaFirebird: TDMNotaSaidaFirebird
  OldCreateOrder = False
  Left = 563
  Top = 241
  Height = 226
  Width = 236
  object ZQHistoricoReceituario: TZQuery
    Connection = DMFirebird.ZConnection1
    SQL.Strings = (
      'SELECT'
      '  REC.COD_CLIENTE,'
      '  REC.COD_FILIAL,'
      '  REP.COD_RECEITUARIO_OTICA,'
      '  REC.DESC_OBSERVACAO,'
      '  REP.COD_PRODUTO,'
      '  REP.QDE_PRODUTO,'
      '  REP.VLR_PRODUTO,'
      '  REP.DESC_PRODUTO,'
      '  REP.VLR_DESCONTO,'
      '  REC.dt_emissao'
      'FROM'
      ' TBLJ_RECEITUARIO_OTICA REC,'
      'TBLJ_RECEITUARIO_OTICA_PROD REP'
      'WHERE'
      '  REC.COD_RECEITUARIO_OTICA = REP.COD_RECEITUARIO_OTICA'
      'ORDER BY'
      '  REP.COD_RECEITUARIO_OTICA'
      '')
    Params = <>
    Left = 112
    Top = 32
    object ZQHistoricoReceituarioCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object ZQHistoricoReceituarioDT_EMISSAO: TDateField
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object ZQHistoricoReceituarioCOD_RECEITUARIO_OTICA: TIntegerField
      FieldName = 'COD_RECEITUARIO_OTICA'
      Required = True
    end
    object ZQHistoricoReceituarioDESC_OBSERVACAO: TStringField
      FieldName = 'DESC_OBSERVACAO'
      Size = 500
    end
    object ZQHistoricoReceituarioCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object ZQHistoricoReceituarioQDE_PRODUTO: TFloatField
      FieldName = 'QDE_PRODUTO'
      Required = True
    end
    object ZQHistoricoReceituarioVLR_PRODUTO: TFloatField
      FieldName = 'VLR_PRODUTO'
      Required = True
    end
    object ZQHistoricoReceituarioDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 500
    end
    object ZQHistoricoReceituarioVLR_DESCONTO: TFloatField
      FieldName = 'VLR_DESCONTO'
    end
    object ZQHistoricoReceituarioCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
    end
  end
  object ZQNota_Atenas: TZQuery
    Connection = DMFirebird.ZConnection1
    SQL.Strings = (
      'SELECT'
      '  TBLJ_VENDA.COD_VENDA AS COD_NOTA_CAB,'
      '  TBLJ_VENDA.COD_CLIENTE AS COD_CADASTRO,'
      '  TBLJ_VENDA.COD_FILIAL AS COD_FILIAL,'
      '  TBLJ_VENDA.dt_venda AS DT_EMISSAO,'
      '  TBLJ_VENDA.DT_FINALIZACAO AS DT_SAIDA,'
      '  TBLJ_VENDA.IND_TIPO_VENDA AS IND_CONDICAO_PAGTO,'
      '  '#39'1'#39' AS COD_VENDEDOR,'
      '  TBLJ_VENDA.VLR_ENTRADA AS VAL_ENTRADA,'
      '  TBLJ_VENDA.VLR_DESCONTO AS VAL_DESCONTO,'
      '  TBLJ_VENDA_PRODUTO.VLR_DESCONTO AS VAL_DESCONTO_ITEM,'
      '  TBLJ_VENDA.vlr_frete AS VAL_DESPESAS,'
      '  TBLJ_VENDA.DESC_OBSERVACAO AS DESC_OBSERVACAO,'
      '  TBLJ_VENDA.TOTAL_VENDA AS VAL_TOTAL,'
      '  TBLJ_VENDA_PRODUTO.COD_PRODUTO AS COD_PRODUTO,'
      
        '  (TBLJ_VENDA_PRODUTO.vlr_venda_produto * TBLJ_VENDA_PRODUTO.QDE' +
        '_VENDA_PRODUTO) AS VAL_TOTAL_ITEM,'
      '  TBLJ_VENDA_PRODUTO.QDE_VENDA_PRODUTO AS QT_QUANTIDADE,'
      '  TBLJ_VENDA_PRODUTO.vlr_venda_produto AS VAL_UNITARIO,'
      '  '#39'1'#39' AS COD_TRIBUTACAO'
      'FROM'
      '  TBLJ_VENDA,'
      '  TBLJ_VENDA_PRODUTO'
      'WHERE'
      '  TBLJ_VENDA.COD_VENDA = TBLJ_VENDA_PRODUTO.COD_VENDA'
      'ORDER BY'
      '  TBLJ_VENDA.COD_VENDA')
    Params = <>
    Left = 32
    Top = 96
    object ZQNota_AtenasCOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
      Required = True
    end
    object ZQNota_AtenasCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object ZQNota_AtenasDT_EMISSAO: TDateField
      FieldName = 'DT_EMISSAO'
    end
    object ZQNota_AtenasDT_SAIDA: TDateField
      FieldName = 'DT_SAIDA'
    end
    object ZQNota_AtenasIND_CONDICAO_PAGTO: TStringField
      FieldName = 'IND_CONDICAO_PAGTO'
      Size = 30
    end
    object ZQNota_AtenasCOD_VENDEDOR: TStringField
      FieldName = 'COD_VENDEDOR'
      ReadOnly = True
      Size = 1
    end
    object ZQNota_AtenasVAL_ENTRADA: TFloatField
      FieldName = 'VAL_ENTRADA'
    end
    object ZQNota_AtenasVAL_DESCONTO: TFloatField
      FieldName = 'VAL_DESCONTO'
    end
    object ZQNota_AtenasVAL_DESPESAS: TFloatField
      FieldName = 'VAL_DESPESAS'
    end
    object ZQNota_AtenasDESC_OBSERVACAO: TStringField
      FieldName = 'DESC_OBSERVACAO'
      Size = 500
    end
    object ZQNota_AtenasVAL_TOTAL: TFloatField
      FieldName = 'VAL_TOTAL'
      ReadOnly = True
    end
    object ZQNota_AtenasCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object ZQNota_AtenasQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
      Required = True
    end
    object ZQNota_AtenasVAL_UNITARIO: TFloatField
      FieldName = 'VAL_UNITARIO'
      Required = True
    end
    object ZQNota_AtenasCOD_TRIBUTACAO: TStringField
      FieldName = 'COD_TRIBUTACAO'
      ReadOnly = True
      Size = 1
    end
    object ZQNota_AtenasCOD_FILIAL: TSmallintField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object ZQNota_AtenasVAL_DESCONTO_ITEM: TFloatField
      FieldName = 'VAL_DESCONTO_ITEM'
    end
    object ZQNota_AtenasVAL_TOTAL_ITEM: TFloatField
      FieldName = 'VAL_TOTAL_ITEM'
      ReadOnly = True
    end
  end
end
