object DMCalculaDigito: TDMCalculaDigito
  OldCreateOrder = False
  Left = 380
  Top = 181
  Height = 204
  Width = 279
  object QCalculaDigito: TOracleDataSet
    SQL.Strings = (
      'select'
      ' rowid, '
      ' tb_calcula_digito.*'
      'from '
      ' tb_calcula_digito'
      'where'
      ' tb_calcula_digito.cod_calcula_digito = :PK')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_CALCULA_DIGITO'
    SequenceField.Sequence = 'SQCALCULADIGITO'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000400000012000000434F445F43414C43554C415F44494749544F0100
      00000000060000004E554D45524F01000000000005000000454D41494C010000
      0000000800000054454C45464F4E45010000000000}
    RefreshOptions = [roBeforeEdit, roAllFields]
    Session = DMOracle.DBCemapa
    Left = 32
    Top = 24
    object QCalculaDigitoNUMERO: TFloatField
      FieldName = 'NUMERO'
    end
    object QCalculaDigitoEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 150
    end
    object QCalculaDigitoTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 14
    end
    object QCalculaDigitoCOD_CALCULA_DIGITO: TIntegerField
      FieldName = 'COD_CALCULA_DIGITO'
      Required = True
    end
  end
  object QCalculaDigitoCons: TOracleDataSet
    SQL.Strings = (
      'select'
      ' *'
      'from'
      ' tb_calcula_digito')
    QBEDefinition.QBEFieldDefs = {
      040000000400000012000000434F445F43414C43554C415F44494749544F0100
      00000000060000004E554D45524F01000000000005000000454D41494C010000
      0000000800000054454C45464F4E45010000000000}
    Session = DMOracle.DBCemapa
    Left = 120
    Top = 24
    object QCalculaDigitoConsCOD_CALCULA_DIGITO: TIntegerField
      FieldName = 'COD_CALCULA_DIGITO'
      Required = True
    end
    object QCalculaDigitoConsNUMERO: TFloatField
      FieldName = 'NUMERO'
    end
    object QCalculaDigitoConsEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 150
    end
    object QCalculaDigitoConsTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 14
    end
  end
end
