object DMPecaRetorno: TDMPecaRetorno
  OldCreateOrder = False
  Left = 430
  Top = 193
  Height = 191
  Width = 268
  object QPecaRetorno: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_PECA_RETORNO.*'
      'FROM'
      '  TB_PECA_RETORNO'
      'WHERE'
      '  TB_PECA_RETORNO.COD_PECA_RETORNO = :PK')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_PECA_RETORNO'
    SequenceField.Sequence = 'SQ_PECA_RETORNO'
    SequenceField.ApplyMoment = amOnNewRecord
    OracleDictionary.DefaultValues = True
    QBEDefinition.QBEFieldDefs = {
      040000000600000010000000434F445F504543415F5245544F524E4F01000000
      000008000000434F445F50454341010000000000090000004E554D5F53455249
      450100000000000A00000044545F5245544F524E4F0100000000000F00000044
      4553435F4F42534552564143414F0100000000000C000000494E445F53495455
      4143414F010000000000}
    Session = DMOracle.DBCemapa
    AfterInsert = QPecaRetornoAfterInsert
    Left = 32
    Top = 16
    object QPecaRetornoCOD_PECA_RETORNO: TFloatField
      FieldName = 'COD_PECA_RETORNO'
      Required = True
    end
    object QPecaRetornoCOD_PECA: TStringField
      FieldName = 'COD_PECA'
      Required = True
      Size = 8
    end
    object QPecaRetornoNUM_SERIE: TIntegerField
      FieldName = 'NUM_SERIE'
      Required = True
    end
    object QPecaRetornoDT_RETORNO: TDateTimeField
      FieldName = 'DT_RETORNO'
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object QPecaRetornoDESC_OBSERVACAO: TStringField
      FieldName = 'DESC_OBSERVACAO'
      Size = 100
    end
    object QPecaRetornoIND_SITUACAO: TStringField
      DefaultExpression = #39'D'#39
      FieldName = 'IND_SITUACAO'
      Size = 1
    end
  end
  object QPecaRetornoCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_PECA_RETORNO.*'
      'FROM'
      '  TB_PECA_RETORNO'
      'WHERE'
      '  (:PECA IS NULL OR TB_PECA_RETORNO.COD_PECA = :PECA)'
      'AND'
      
        '  (:DT_INICIO IS NULL OR TB_PECA_RETORNO.DT_RETORNO >= :DT_INICI' +
        'O)'
      'AND'
      '  (:DT_FIM IS NULL OR TB_PECA_RETORNO.DT_RETORNO <= :DT_FIM)'
      '')
    Variables.Data = {
      0300000003000000050000003A504543410500000000000000000000000A0000
      003A44545F494E4943494F0C0000000000000000000000070000003A44545F46
      494D0C0000000000000000000000}
    SequenceField.ApplyMoment = amOnNewRecord
    OracleDictionary.DefaultValues = True
    QBEDefinition.QBEFieldDefs = {
      040000000400000010000000434F445F504543415F5245544F524E4F01000000
      000008000000434F445F50454341010000000000090000004E554D5F53455249
      450100000000000A00000044545F5245544F524E4F010000000000}
    Session = DMOracle.DBCemapa
    AfterInsert = QPecaRetornoAfterInsert
    Left = 136
    Top = 16
    object QPecaRetornoConsCOD_PECA_RETORNO: TFloatField
      FieldName = 'COD_PECA_RETORNO'
      Required = True
    end
    object QPecaRetornoConsCOD_PECA: TStringField
      FieldName = 'COD_PECA'
      Required = True
      Size = 8
    end
    object QPecaRetornoConsNUM_SERIE: TIntegerField
      FieldName = 'NUM_SERIE'
      Required = True
    end
    object QPecaRetornoConsDT_RETORNO: TDateTimeField
      FieldName = 'DT_RETORNO'
      Required = True
    end
  end
  object QRPecaRetorno: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  PR.COD_PECA_RETORNO,'
      '  PR.COD_PECA,'
      '  PR.NUM_SERIE,'
      '  PR.DT_RETORNO,'
      '  PR.DESC_OBSERVACAO,'
      '  PR.IND_SITUACAO,'
      '  M.VAL_LARGURA || '#39' X '#39' || M.VAL_ALTURA AS MEDIDA,'
      '  M.COD_PEDIDO,'
      '  PIT.COD_PRODUTO,'
      '  P.DESC_PRODUTO'
      'FROM'
      '  TB_PECA_RETORNO PR,'
      '  TB_MATERIAL M,'
      '  TB_PEDIDO_ITEM PIT,'
      '  TB_PRODUTO P,'
      '  TB_PEDIDO_CAB,'
      '  TB_CADASTRO'
      'WHERE'
      '  PR.COD_PECA = M.COD_PECA(+)'
      'AND'
      '  M.COD_PEDIDO_ITEM = PIT.COD_PEDIDO_ITEM(+)'
      'AND'
      '  PIT.COD_PRODUTO = P.COD_PRODUTO(+)'
      'AND'
      '  PIT.COD_PEDIDO_CAB = TB_PEDIDO_CAB.COD_PEDIDO_CAB'
      'AND'
      '  TB_PEDIDO_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
      'AND'
      '  (:DT_INICIO IS NULL OR PR.DT_RETORNO >= :DT_INICIO)'
      'AND'
      '  (:DT_FIM IS NULL OR PR.DT_RETORNO <= :DT_FIM)'
      'AND'
      '  (:PRODUTO IS NULL OR PIT.COD_PRODUTO = :PRODUTO)'
      'AND'
      '  (:CADASTRO IS NULL'
      '   OR'
      '    TB_PEDIDO_CAB.COD_CADASTRO =:CADASTRO)'
      'AND'
      '  (:REGIAO IS NULL'
      '   OR'
      '    TB_CADASTRO.COD_REGIAO =:REGIAO)'
      'AND'
      '  (:IND_SITUACAO IS NULL'
      '    OR'
      '     PR.IND_SITUACAO = :IND_SITUACAO)'
      'ORDER BY'
      '  P.DESC_PRODUTO,'
      '  PIT.COD_PRODUTO ')
    Variables.Data = {
      03000000060000000A0000003A44545F494E4943494F0C000000000000000000
      0000070000003A44545F46494D0C0000000000000000000000080000003A5052
      4F4455544F030000000000000000000000090000003A434144415354524F0300
      00000000000000000000070000003A52454749414F0300000000000000000000
      000D0000003A494E445F534954554143414F050000000000000000000000}
    SequenceField.ApplyMoment = amOnNewRecord
    OracleDictionary.DefaultValues = True
    QBEDefinition.QBEFieldDefs = {
      040000000A00000010000000434F445F504543415F5245544F524E4F01000000
      000008000000434F445F50454341010000000000090000004E554D5F53455249
      450100000000000A00000044545F5245544F524E4F0100000000000B00000043
      4F445F50524F4455544F0100000000000C000000444553435F50524F4455544F
      010000000000060000004D45444944410100000000000A000000434F445F5045
      4449444F0100000000000F000000444553435F4F42534552564143414F010000
      0000000C000000494E445F534954554143414F010000000000}
    Session = DMOracle.DBCemapa
    AfterInsert = QPecaRetornoAfterInsert
    Left = 32
    Top = 64
    object QRPecaRetornoCOD_PECA_RETORNO: TFloatField
      FieldName = 'COD_PECA_RETORNO'
      Required = True
    end
    object QRPecaRetornoCOD_PECA: TStringField
      FieldName = 'COD_PECA'
      Required = True
      Size = 8
    end
    object QRPecaRetornoNUM_SERIE: TIntegerField
      FieldName = 'NUM_SERIE'
      Required = True
    end
    object QRPecaRetornoDT_RETORNO: TDateTimeField
      FieldName = 'DT_RETORNO'
      Required = True
    end
    object QRPecaRetornoCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
    end
    object QRPecaRetornoDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
    object QRPecaRetornoMEDIDA: TStringField
      FieldName = 'MEDIDA'
      Size = 83
    end
    object QRPecaRetornoCOD_PEDIDO: TIntegerField
      FieldName = 'COD_PEDIDO'
    end
    object QRPecaRetornoDESC_OBSERVACAO: TStringField
      FieldName = 'DESC_OBSERVACAO'
      Size = 100
    end
    object QRPecaRetornoIND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Size = 1
    end
  end
end
