object DMTravamento: TDMTravamento
  OldCreateOrder = False
  Left = 373
  Top = 189
  Height = 150
  Width = 215
  object QTravamentoCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT '
      '  SUBSTR(ORACLE_USERNAME,1,20) AS ORACLE_USERNAME,'
      '  SUBSTR(OS_USER_NAME,1,20) AS OS_USER_NAME,'
      '  SUBSTR(S.PROGRAM,1,20) AS PROGRAM,'
      '  SUBSTR(OBJECT_NAME,1,30) AS OBJECT_NAME,'
      '  B.OBJECT_TYPE,'
      '  S.SID,'
      '  GV.SERIAL# SERIAL'
      'FROM '
      '  V$LOCKED_OBJECT A, DBA_OBJECTS B, V$SESSION S, GV$SESSION GV'
      'WHERE'
      '  A.OBJECT_ID = B.OBJECT_ID'
      'AND'
      '  A.SESSION_ID = S.SID'
      'AND'
      '  S.SID = GV.SID'
      'AND'
      '  (:TABELA IS NULL OR UPPER(OBJECT_NAME) LIKE UPPER(:TABELA))'
      '')
    Variables.Data = {0300000001000000070000003A544142454C41050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000070000000F0000004F5241434C455F555345524E414D450100000000
      000C0000004F535F555345525F4E414D450100000000000700000050524F4752
      414D0100000000000B0000004F424A4543545F4E414D450100000000000B0000
      004F424A4543545F545950450100000000000300000053494401000000000006
      00000053455249414C010000000000}
    Session = DMOracle.DBCemapa
    Left = 40
    Top = 16
    object QTravamentoConsORACLE_USERNAME: TStringField
      FieldName = 'ORACLE_USERNAME'
    end
    object QTravamentoConsOS_USER_NAME: TStringField
      FieldName = 'OS_USER_NAME'
    end
    object QTravamentoConsPROGRAM: TStringField
      FieldName = 'PROGRAM'
    end
    object QTravamentoConsOBJECT_NAME: TStringField
      FieldName = 'OBJECT_NAME'
      Size = 30
    end
    object QTravamentoConsOBJECT_TYPE: TStringField
      FieldName = 'OBJECT_TYPE'
      Size = 19
    end
    object QTravamentoConsSID: TFloatField
      FieldName = 'SID'
    end
    object QTravamentoConsSERIAL: TFloatField
      FieldName = 'SERIAL'
    end
  end
end
