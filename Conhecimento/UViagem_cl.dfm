object DMViagem: TDMViagem
  OldCreateOrder = False
  Left = 637
  Top = 299
  Height = 258
  Width = 406
  object QViagemCad: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_VIAGEM.*'
      'FROM'
      '  TB_VIAGEM'
      'WHERE'
      '  TB_VIAGEM.COD_VIAGEM=:PK'
      ''
      ' '
      ' '
      '')
    Variables.Data = {0300000001000000030000003A504B050000000000000000000000}
    SequenceField.Field = 'COD_VIAGEM'
    SequenceField.Sequence = 'SQVIAGEM'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      04000000110000000A000000434F445F56494147454D0100000000000A000000
      444553435F504C4143410100000000000900000044545F56494147454D010000
      0000000B000000444553435F56494147454D0100000000000C000000564C5F46
      524554455F4944410100000000000E000000564C5F46524554455F564F4C5441
      0100000000000E000000564C5F46524554455F544F54414C0100000000000B00
      0000564C5F434F4D495353414F0100000000000F000000564C5F414449414E54
      414D454E544F0100000000000A000000434F445F46494C49414C010000000000
      0900000051545F56494147454D01000000000013000000434F445F4341444153
      54524F5F4F524947454D01000000000014000000434F445F434144415354524F
      5F44455354494E4F0100000000000D000000434F445F4D4F544F524953544101
      00000000000D00000051545F5155414E5449444144450100000000000B000000
      564C5F554E49544152494F01000000000008000000564C5F544F54414C010000
      000000}
    Session = DMOracle.DBCemapa
    AfterInsert = QViagemCadAfterInsert
    BeforePost = QViagemCadBeforePost
    OnCalcFields = QViagemCadCalcFields
    Left = 24
    Top = 16
    object QViagemCadCOD_VIAGEM: TIntegerField
      FieldName = 'COD_VIAGEM'
      Required = True
    end
    object QViagemCadDESC_PLACA: TStringField
      FieldName = 'DESC_PLACA'
      Required = True
      Size = 8
    end
    object QViagemCadDT_VIAGEM: TDateTimeField
      FieldName = 'DT_VIAGEM'
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object QViagemCadDESC_VIAGEM: TStringField
      FieldName = 'DESC_VIAGEM'
      Size = 60
    end
    object QViagemCadVL_FRETE_IDA: TFloatField
      FieldName = 'VL_FRETE_IDA'
      DisplayFormat = '#,##0.00'
    end
    object QViagemCadVL_FRETE_VOLTA: TFloatField
      FieldName = 'VL_FRETE_VOLTA'
      DisplayFormat = '#,##0.00'
    end
    object QViagemCadVL_FRETE_TOTAL: TFloatField
      FieldName = 'VL_FRETE_TOTAL'
      DisplayFormat = '#,##0.00'
    end
    object QViagemCadVL_COMISSAO: TFloatField
      FieldName = 'VL_COMISSAO'
      DisplayFormat = '#,##0.00'
    end
    object QViagemCadVL_ADIANTAMENTO: TFloatField
      FieldName = 'VL_ADIANTAMENTO'
      DisplayFormat = '#,##0.00'
    end
    object QViagemCadsval_saldo_receber: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sval_saldo_receber'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
    object QViagemCadCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QViagemCadQT_VIAGEM: TFloatField
      FieldName = 'QT_VIAGEM'
    end
    object QViagemCadCOD_CADASTRO_ORIGEM: TIntegerField
      FieldName = 'COD_CADASTRO_ORIGEM'
    end
    object QViagemCadCOD_CADASTRO_DESTINO: TIntegerField
      FieldName = 'COD_CADASTRO_DESTINO'
    end
    object QViagemCadCOD_MOTORISTA: TIntegerField
      FieldName = 'COD_MOTORISTA'
    end
    object QViagemCadQT_QUANTIDADE: TIntegerField
      FieldName = 'QT_QUANTIDADE'
      OnValidate = QViagemCadQT_QUANTIDADEValidate
      DisplayFormat = '#,##0.00'
    end
    object QViagemCadVL_UNITARIO: TFloatField
      FieldName = 'VL_UNITARIO'
      OnValidate = QViagemCadVL_UNITARIOValidate
      DisplayFormat = '#,##0.00'
    end
    object QViagemCadVL_TOTAL: TFloatField
      FieldName = 'VL_TOTAL'
      DisplayFormat = '#,##0.00'
    end
  end
  object QViagemCons: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  TB_VIAGEM.*,'
      '  ORIGEM.NOME AS NOME_ORIGEM,'
      '  DESTINO.NOME AS NOME_DESTINO,'
      '  MOTORISTA.NOME AS NOME_MOTORISTA'
      'FROM '
      '  TB_VIAGEM, '
      '  TB_CADASTRO ORIGEM,'
      '  TB_CADASTRO DESTINO,'
      '  TB_CADASTRO MOTORISTA'
      'WHERE'
      '  TB_VIAGEM.COD_CADASTRO_ORIGEM = ORIGEM.COD_CADASTRO(+)'
      'AND'
      '  TB_VIAGEM.COD_CADASTRO_DESTINO = DESTINO.COD_CADASTRO(+)'
      'AND'
      '  TB_VIAGEM.COD_MOTORISTA = MOTORISTA.COD_CADASTRO(+)'
      'AND'
      '  (:DESC_VIAGEM IS NULL'
      '    OR DESC_VIAGEM LIKE :DESC_VIAGEM)'
      '  AND'
      '  (:COD_FILIAL IS NULL'
      '    OR TB_VIAGEM.COD_FILIAL = :COD_FILIAL)'
      '  AND'
      '  (:PLACA IS NULL'
      '    OR TB_VIAGEM.DESC_PLACA = :PLACA)'
      '  AND'
      '  (:DT_VIAGEM_INI IS NULL OR'
      '    DT_VIAGEM >= :DT_VIAGEM_INI)'
      '  AND'
      '  (:DT_VIAGEM_FIM IS NULL OR'
      '    DT_VIAGEM <= :DT_VIAGEM_FIM)')
    Variables.Data = {
      03000000050000000C0000003A444553435F56494147454D0500000000000000
      00000000060000003A504C4143410500000000000000000000000E0000003A44
      545F56494147454D5F494E490C00000000000000000000000E0000003A44545F
      56494147454D5F46494D0C00000000000000000000000B0000003A434F445F46
      494C49414C030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000140000000A000000434F445F56494147454D0100000000000A000000
      444553435F504C4143410100000000000900000044545F56494147454D010000
      0000000B000000444553435F56494147454D0100000000000C000000564C5F46
      524554455F4944410100000000000E000000564C5F46524554455F564F4C5441
      0100000000000E000000564C5F46524554455F544F54414C0100000000000B00
      0000564C5F434F4D495353414F0100000000000F000000564C5F414449414E54
      414D454E544F0100000000000A000000434F445F46494C49414C010000000000
      0900000051545F56494147454D01000000000013000000434F445F4341444153
      54524F5F4F524947454D01000000000014000000434F445F434144415354524F
      5F44455354494E4F0100000000000D000000434F445F4D4F544F524953544101
      00000000000D00000051545F5155414E5449444144450100000000000B000000
      564C5F554E49544152494F01000000000008000000564C5F544F54414C010000
      0000000B0000004E4F4D455F4F524947454D0100000000000C0000004E4F4D45
      5F44455354494E4F0100000000000E0000004E4F4D455F4D4F544F5249535441
      010000000000}
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 104
    Top = 16
    object QViagemConsCOD_VIAGEM: TIntegerField
      FieldName = 'COD_VIAGEM'
      Required = True
    end
    object QViagemConsDESC_PLACA: TStringField
      FieldName = 'DESC_PLACA'
      Required = True
      Size = 8
    end
    object QViagemConsDT_VIAGEM: TDateTimeField
      FieldName = 'DT_VIAGEM'
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object QViagemConsDESC_VIAGEM: TStringField
      FieldName = 'DESC_VIAGEM'
      Required = True
      Size = 60
    end
    object QViagemConsVL_FRETE_IDA: TFloatField
      FieldName = 'VL_FRETE_IDA'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object QViagemConsVL_FRETE_VOLTA: TFloatField
      FieldName = 'VL_FRETE_VOLTA'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object QViagemConsVL_FRETE_TOTAL: TFloatField
      FieldName = 'VL_FRETE_TOTAL'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object QViagemConsVL_COMISSAO: TFloatField
      FieldName = 'VL_COMISSAO'
      DisplayFormat = '#,##0.00'
    end
    object QViagemConsVL_ADIANTAMENTO: TFloatField
      FieldName = 'VL_ADIANTAMENTO'
      DisplayFormat = '#,##0.00'
    end
    object QViagemConsCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QViagemConsQT_VIAGEM: TFloatField
      FieldName = 'QT_VIAGEM'
    end
    object QViagemConsCOD_CADASTRO_ORIGEM: TIntegerField
      FieldName = 'COD_CADASTRO_ORIGEM'
    end
    object QViagemConsCOD_CADASTRO_DESTINO: TIntegerField
      FieldName = 'COD_CADASTRO_DESTINO'
    end
    object QViagemConsCOD_MOTORISTA: TIntegerField
      FieldName = 'COD_MOTORISTA'
    end
    object QViagemConsQT_QUANTIDADE: TIntegerField
      FieldName = 'QT_QUANTIDADE'
      DisplayFormat = '#,##0.00'
    end
    object QViagemConsVL_UNITARIO: TFloatField
      FieldName = 'VL_UNITARIO'
      DisplayFormat = '#,##0.00'
    end
    object QViagemConsVL_TOTAL: TFloatField
      FieldName = 'VL_TOTAL'
      DisplayFormat = '#,##0.00'
    end
    object QViagemConsNOME_ORIGEM: TStringField
      FieldName = 'NOME_ORIGEM'
      Size = 60
    end
    object QViagemConsNOME_DESTINO: TStringField
      FieldName = 'NOME_DESTINO'
      Size = 60
    end
    object QViagemConsNOME_MOTORISTA: TStringField
      FieldName = 'NOME_MOTORISTA'
      Size = 60
    end
  end
  object QRViagem: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  V.COD_VIAGEM,'
      '  V.DESC_PLACA,'
      '  V.DT_VIAGEM,'
      '  V.DESC_VIAGEM,'
      '  V.VL_FRETE_IDA,'
      '  V.VL_FRETE_VOLTA,'
      '  V.VL_FRETE_TOTAL,'
      '  V.VL_COMISSAO,'
      '  V.VL_ADIANTAMENTO,'
      '  V.COD_FILIAL,'
      '  (V.VL_COMISSAO - V.VL_ADIANTAMENTO) AS SVL_SALDO_RECEBER'
      'FROM TB_VIAGEM V'
      'WHERE'
      '  (:COD_FILIAL IS NULL OR'
      '   :COD_FILIAL = V.COD_FILIAL)'
      '  AND'
      '  (:DESC_PLACA IS NULL OR'
      '   :DESC_PLACA = V.DESC_PLACA)'
      '  AND'
      '    V.DT_VIAGEM >= :DT_INICIAL'
      '  AND'
      '    V.DT_VIAGEM <= :DT_FINAL'
      'ORDER BY'
      '  DT_VIAGEM ASC')
    Variables.Data = {
      03000000040000000B0000003A434F445F46494C49414C030000000000000000
      0000000B0000003A444553435F504C4143410500000000000000000000000B00
      00003A44545F494E494349414C0C0000000000000000000000090000003A4454
      5F46494E414C0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000B0000000A000000434F445F56494147454D0100000000000A000000
      444553435F504C4143410100000000000900000044545F56494147454D010000
      0000000B000000444553435F56494147454D0100000000000C000000564C5F46
      524554455F4944410100000000000E000000564C5F46524554455F564F4C5441
      0100000000000E000000564C5F46524554455F544F54414C0100000000000B00
      0000564C5F434F4D495353414F0100000000000F000000564C5F414449414E54
      414D454E544F0100000000000A000000434F445F46494C49414C010000000000
      1100000053564C5F53414C444F5F52454345424552010000000000}
    Session = DMOracle.DBCemapa
    Left = 24
    Top = 72
    object QRViagemCOD_VIAGEM: TIntegerField
      FieldName = 'COD_VIAGEM'
      Required = True
    end
    object QRViagemDESC_PLACA: TStringField
      FieldName = 'DESC_PLACA'
      Required = True
      EditMask = '###-####'
      Size = 8
    end
    object QRViagemDT_VIAGEM: TDateTimeField
      FieldName = 'DT_VIAGEM'
      Required = True
    end
    object QRViagemDESC_VIAGEM: TStringField
      FieldName = 'DESC_VIAGEM'
      Required = True
      Size = 60
    end
    object QRViagemVL_FRETE_IDA: TFloatField
      FieldName = 'VL_FRETE_IDA'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object QRViagemVL_FRETE_VOLTA: TFloatField
      FieldName = 'VL_FRETE_VOLTA'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object QRViagemVL_FRETE_TOTAL: TFloatField
      FieldName = 'VL_FRETE_TOTAL'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object QRViagemVL_COMISSAO: TFloatField
      FieldName = 'VL_COMISSAO'
      DisplayFormat = '#,##0.00'
    end
    object QRViagemVL_ADIANTAMENTO: TFloatField
      FieldName = 'VL_ADIANTAMENTO'
      DisplayFormat = '#,##0.00'
    end
    object QRViagemCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QRViagemSVL_SALDO_RECEBER: TFloatField
      FieldName = 'SVL_SALDO_RECEBER'
      DisplayFormat = '#,##0.00'
    end
  end
  object QRControleViagem: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  VIAGEM.*,'
      '  ORIGEM.NOME AS NOME_ORIGEM,'
      '  DESTINO.NOME AS NOME_DESTINO,'
      '  MOTORISTA.NOME AS NOME_MOTORISTA'
      'FROM'
      '  TB_VIAGEM VIAGEM,'
      '  TB_CADASTRO ORIGEM,'
      '  TB_CADASTRO DESTINO,'
      '  TB_CADASTRO MOTORISTA'
      'WHERE'
      '  VIAGEM.COD_CADASTRO_ORIGEM = ORIGEM.COD_CADASTRO(+)'
      'AND'
      '  VIAGEM.COD_CADASTRO_DESTINO = DESTINO.COD_CADASTRO(+)'
      'AND'
      '  VIAGEM.COD_MOTORISTA = MOTORISTA.COD_CADASTRO(+)'
      'AND'
      '  (:COD_FILIAL IS NULL OR'
      '   :COD_FILIAL = VIAGEM.COD_FILIAL)'
      '  AND'
      '  (:DESC_PLACA IS NULL OR'
      '   :DESC_PLACA = VIAGEM.DESC_PLACA)'
      'AND'
      '  (:DT_INICIAL IS NULL OR'
      '    DT_VIAGEM >= :DT_INICIAL)'
      'AND'
      '  (:DT_FINAL IS NULL OR'
      '    DT_VIAGEM <= :DT_FINAL)'
      'ORDER BY'
      '  DT_VIAGEM ASC')
    Variables.Data = {
      03000000040000000B0000003A434F445F46494C49414C030000000000000000
      0000000B0000003A444553435F504C4143410500000000000000000000000B00
      00003A44545F494E494349414C0C0000000000000000000000090000003A4454
      5F46494E414C0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000140000000A000000434F445F56494147454D0100000000000A000000
      444553435F504C4143410100000000000900000044545F56494147454D010000
      0000000B000000444553435F56494147454D0100000000000C000000564C5F46
      524554455F4944410100000000000E000000564C5F46524554455F564F4C5441
      0100000000000E000000564C5F46524554455F544F54414C0100000000000B00
      0000564C5F434F4D495353414F0100000000000F000000564C5F414449414E54
      414D454E544F0100000000000A000000434F445F46494C49414C010000000000
      0900000051545F56494147454D01000000000013000000434F445F4341444153
      54524F5F4F524947454D01000000000014000000434F445F434144415354524F
      5F44455354494E4F0100000000000D000000434F445F4D4F544F524953544101
      00000000000D00000051545F5155414E5449444144450100000000000B000000
      564C5F554E49544152494F01000000000008000000564C5F544F54414C010000
      0000000B0000004E4F4D455F4F524947454D0100000000000C0000004E4F4D45
      5F44455354494E4F0100000000000E0000004E4F4D455F4D4F544F5249535441
      010000000000}
    Session = DMOracle.DBCemapa
    Left = 104
    Top = 72
    object QRControleViagemCOD_VIAGEM: TIntegerField
      FieldName = 'COD_VIAGEM'
      Required = True
    end
    object QRControleViagemCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QRControleViagemDESC_PLACA: TStringField
      FieldName = 'DESC_PLACA'
      Required = True
      Size = 8
    end
    object QRControleViagemDT_VIAGEM: TDateTimeField
      FieldName = 'DT_VIAGEM'
      Required = True
    end
    object QRControleViagemDESC_VIAGEM: TStringField
      FieldName = 'DESC_VIAGEM'
      Size = 60
    end
    object QRControleViagemVL_FRETE_IDA: TFloatField
      FieldName = 'VL_FRETE_IDA'
    end
    object QRControleViagemVL_FRETE_VOLTA: TFloatField
      FieldName = 'VL_FRETE_VOLTA'
    end
    object QRControleViagemVL_FRETE_TOTAL: TFloatField
      FieldName = 'VL_FRETE_TOTAL'
    end
    object QRControleViagemVL_COMISSAO: TFloatField
      FieldName = 'VL_COMISSAO'
    end
    object QRControleViagemVL_ADIANTAMENTO: TFloatField
      FieldName = 'VL_ADIANTAMENTO'
    end
    object QRControleViagemQT_VIAGEM: TFloatField
      FieldName = 'QT_VIAGEM'
    end
    object QRControleViagemCOD_CADASTRO_ORIGEM: TIntegerField
      FieldName = 'COD_CADASTRO_ORIGEM'
    end
    object QRControleViagemCOD_CADASTRO_DESTINO: TIntegerField
      FieldName = 'COD_CADASTRO_DESTINO'
    end
    object QRControleViagemCOD_MOTORISTA: TIntegerField
      FieldName = 'COD_MOTORISTA'
    end
    object QRControleViagemQT_QUANTIDADE: TIntegerField
      FieldName = 'QT_QUANTIDADE'
      DisplayFormat = '#,##0.00'
    end
    object QRControleViagemVL_UNITARIO: TFloatField
      FieldName = 'VL_UNITARIO'
      DisplayFormat = '#,##0.00'
    end
    object QRControleViagemVL_TOTAL: TFloatField
      FieldName = 'VL_TOTAL'
      DisplayFormat = '#,##0.00'
    end
    object QRControleViagemNOME_ORIGEM: TStringField
      FieldName = 'NOME_ORIGEM'
      Size = 60
    end
    object QRControleViagemNOME_DESTINO: TStringField
      FieldName = 'NOME_DESTINO'
      Size = 60
    end
    object QRControleViagemNOME_MOTORISTA: TStringField
      FieldName = 'NOME_MOTORISTA'
      Size = 60
    end
  end
end
