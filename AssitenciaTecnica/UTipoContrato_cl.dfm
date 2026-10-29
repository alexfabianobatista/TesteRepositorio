object DMTipoContrato: TDMTipoContrato
  OldCreateOrder = False
  Left = 322
  Top = 126
  Height = 150
  Width = 292
  object QTipoContrato: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_TIPO_CONTRATO."COD_TIPO_CONTRATO",'
      '  TB_TIPO_CONTRATO."DESC_TIPO_CONTRATO",'
      '  TB_TIPO_CONTRATO."VAL_MENSAL"'
      'FROM'
      '  TB_TIPO_CONTRATO'
      'WHERE'
      '  TB_TIPO_CONTRATO.COD_TIPO_CONTRATO = :PK')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_TIPO_CONTRATO'
    SequenceField.Sequence = 'SQTIPO_CONTRATO'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000300000011000000434F445F5449504F5F434F4E545241544F010000
      00000012000000444553435F5449504F5F434F4E545241544F0100000000000A
      00000056414C5F4D454E53414C010000000000}
    Session = DMOracle.DBCemapa
    Left = 32
    Top = 32
    object QTipoContratoCOD_TIPO_CONTRATO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_TIPO_CONTRATO'
      Required = True
    end
    object QTipoContratoDESC_TIPO_CONTRATO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESC_TIPO_CONTRATO'
      Required = True
      Size = 30
    end
    object QTipoContratoVAL_MENSAL: TFloatField
      DisplayLabel = 'Valor Mensal'
      FieldName = 'VAL_MENSAL'
      DisplayFormat = '#,##0.00'
    end
  end
  object QTipoContratoCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      ' TB_TIPO_CONTRATO."COD_TIPO_CONTRATO",'
      ' TB_TIPO_CONTRATO."DESC_TIPO_CONTRATO",'
      ' TB_TIPO_CONTRATO."VAL_MENSAL"'
      'FROM'
      '  TB_TIPO_CONTRATO'
      'WHERE'
      '  (:DESCRICAO IS NULL'
      '   OR'
      '    TB_TIPO_CONTRATO.DESC_TIPO_CONTRATO >= :DESCRICAO)'
      '  AND'
      '  (:VALOR IS NULL'
      '   OR'
      '    TB_TIPO_CONTRATO.VAL_MENSAL >= :VALOR)'
      'ORDER BY'
      '  TB_TIPO_CONTRATO.DESC_TIPO_CONTRATO')
    Variables.Data = {
      03000000020000000A0000003A44455343524943414F05000000000000000000
      0000060000003A56414C4F52040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000300000011000000434F445F5449504F5F434F4E545241544F010000
      00000012000000444553435F5449504F5F434F4E545241544F0100000000000A
      00000056414C5F4D454E53414C010000000000}
    Session = DMOracle.DBCemapa
    Left = 120
    Top = 32
    object QTipoContratoConsCOD_TIPO_CONTRATO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_TIPO_CONTRATO'
      Required = True
    end
    object QTipoContratoConsDESC_TIPO_CONTRATO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESC_TIPO_CONTRATO'
      Required = True
      Size = 30
    end
    object QTipoContratoConsVAL_MENSAL: TFloatField
      DisplayLabel = 'Valor Mensal'
      FieldName = 'VAL_MENSAL'
    end
  end
  object QRTipoContrato: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_TIPO_CONTRATO."COD_TIPO_CONTRATO",'
      '  TB_TIPO_CONTRATO."DESC_TIPO_CONTRATO",'
      '  TB_TIPO_CONTRATO."VAL_MENSAL"'
      'FROM'
      '  TB_TIPO_CONTRATO'
      'ORDER BY'
      '  TB_TIPO_CONTRATO."DESC_TIPO_CONTRATO"')
    QBEDefinition.QBEFieldDefs = {
      040000000300000011000000434F445F5449504F5F434F4E545241544F010000
      00000012000000444553435F5449504F5F434F4E545241544F0100000000000A
      00000056414C5F4D454E53414C010000000000}
    Session = DMOracle.DBCemapa
    Left = 216
    Top = 32
    object QRTipoContratoCOD_TIPO_CONTRATO: TIntegerField
      FieldName = 'COD_TIPO_CONTRATO'
      Required = True
    end
    object QRTipoContratoDESC_TIPO_CONTRATO: TStringField
      FieldName = 'DESC_TIPO_CONTRATO'
      Required = True
      Size = 30
    end
    object QRTipoContratoVAL_MENSAL: TFloatField
      FieldName = 'VAL_MENSAL'
    end
  end
end
