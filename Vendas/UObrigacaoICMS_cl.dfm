object DMObrigacaoICMS: TDMObrigacaoICMS
  OldCreateOrder = False
  Left = 310
  Top = 160
  Height = 150
  Width = 215
  object QObrigacaoICMSCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_OBRIGACAO_ICMS.COD_OBRIGACAO_ICMS,'
      '  TB_OBRIGACAO_ICMS.DESC_OBRIGACAO_ICMS,'
      
        '  (TB_OBRIGACAO_ICMS.COD_OBRIGACAO_ICMS || '#39' - '#39' || TB_OBRIGACAO' +
        '_ICMS.DESC_OBRIGACAO_ICMS) AS DESC_COMPLETA'
      'FROM'
      '  TB_OBRIGACAO_ICMS'
      'ORDER BY'
      '  TB_OBRIGACAO_ICMS.COD_OBRIGACAO_ICMS')
    QBEDefinition.QBEFieldDefs = {
      040000000300000012000000434F445F4F425249474143414F5F49434D530100
      0000000013000000444553435F4F425249474143414F5F49434D530100000000
      000D000000444553435F434F4D504C455441010000000000}
    Session = DMOracle.DBCemapa
    Left = 48
    Top = 16
    object QObrigacaoICMSConsCOD_OBRIGACAO_ICMS: TStringField
      FieldName = 'COD_OBRIGACAO_ICMS'
      Required = True
      Size = 3
    end
    object QObrigacaoICMSConsDESC_OBRIGACAO_ICMS: TStringField
      FieldName = 'DESC_OBRIGACAO_ICMS'
      Required = True
      Size = 60
    end
    object QObrigacaoICMSConsDESC_COMPLETA: TStringField
      FieldName = 'DESC_COMPLETA'
      Size = 66
    end
  end
end
