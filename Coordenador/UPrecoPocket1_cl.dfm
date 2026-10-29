object DMPrecoPocket1: TDMPrecoPocket1
  OldCreateOrder = False
  Left = 224
  Top = 129
  Height = 234
  Width = 328
  object QPrecoPocket_Cad: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  ROWID,'
      '  TB_TABELA_POCKET.*'
      'FROM'
      '  TB_TABELA_POCKET'
      'WHERE'
      '  COD_TABELA_POCKET = :PK')
    Variables.Data = {0300000001000000030000003A504B050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000A0000000D000000504552435F434F4D495353414F01000000000011
      000000434F445F544142454C415F504F434B45540100000000000B0000004445
      53435F544142454C410100000000000C000000494E445F534954554143414F01
      0000000000100000004E554D5F5052415A4F5F4D4158494D4F01000000000010
      00000051545F4D494E494D4F5F43414958415301000000000010000000504552
      435F444553435F4156495354410100000000000F0000004E554D5F434F445F54
      424C5F5041490100000000000D000000504552435F564152494143414F010000
      0000000C0000004445535F4F5045524143414F010000000000}
    Session = DMOracle.DBCemapa
    Left = 56
    Top = 16
    object QPrecoPocket_CadCOD_TABELA_POCKET: TIntegerField
      FieldName = 'COD_TABELA_POCKET'
      Required = True
    end
    object QPrecoPocket_CadDESC_TABELA: TStringField
      FieldName = 'DESC_TABELA'
      Required = True
      Size = 25
    end
    object QPrecoPocket_CadIND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Size = 10
    end
    object QPrecoPocket_CadNUM_PRAZO_MAXIMO: TIntegerField
      FieldName = 'NUM_PRAZO_MAXIMO'
    end
    object QPrecoPocket_CadPERC_COMISSAO: TFloatField
      FieldName = 'PERC_COMISSAO'
    end
    object QPrecoPocket_CadQT_MINIMO_CAIXAS: TIntegerField
      FieldName = 'QT_MINIMO_CAIXAS'
    end
    object QPrecoPocket_CadPERC_DESC_AVISTA: TFloatField
      FieldName = 'PERC_DESC_AVISTA'
    end
    object QPrecoPocket_CadNUM_COD_TBL_PAI: TIntegerField
      FieldName = 'NUM_COD_TBL_PAI'
    end
    object QPrecoPocket_CadPERC_VARIACAO: TFloatField
      FieldName = 'PERC_VARIACAO'
    end
    object QPrecoPocket_CadDES_OPERACAO: TStringField
      FieldName = 'DES_OPERACAO'
      Size = 1
    end
  end
  object QPrecoPocket_Cons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '  TB_TABELA_POCKET'
      'WHERE'
      '  (:DESC_TABELA IS NULL'
      '   OR'
      '    DESC_TABELA >= :DESC_TABELA)'
      'ORDER BY'
      '  COD_TABELA_POCKET')
    Variables.Data = {
      03000000010000000C0000003A444553435F544142454C410500000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      04000000070000000D000000504552435F434F4D495353414F01000000000011
      000000434F445F544142454C415F504F434B45540100000000000B0000004445
      53435F544142454C410100000000000C000000494E445F534954554143414F01
      0000000000100000004E554D5F5052415A4F5F4D4158494D4F01000000000011
      0000004E554D5F4D494E494D4F5F434149584153010000000000100000005154
      5F4D494E494D4F5F434149584153010000000000}
    Session = DMOracle.DBCemapa
    Left = 216
    Top = 16
    object QPrecoPocket_ConsCOD_TABELA_POCKET: TIntegerField
      FieldName = 'COD_TABELA_POCKET'
      Required = True
    end
    object QPrecoPocket_ConsDESC_TABELA: TStringField
      FieldName = 'DESC_TABELA'
      Required = True
      Size = 25
    end
    object QPrecoPocket_ConsIND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Size = 10
    end
    object QPrecoPocket_ConsNUM_PRAZO_MAXIMO: TIntegerField
      FieldName = 'NUM_PRAZO_MAXIMO'
    end
    object QPrecoPocket_ConsPERC_COMISSAO: TFloatField
      FieldName = 'PERC_COMISSAO'
    end
  end
  object QPrecoPocket_Item: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Rowid,'
      '  Tb_Tabela_Pocket_Item.*'
      'From'
      '  Tb_Tabela_Pocket_Item'
      'Where'
      '  Cod_Tabela_Pocket = :Cod_Tabela_Pocket')
    Variables.Data = {
      0300000001000000120000003A434F445F544142454C415F504F434B45540300
      00000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000400000011000000434F445F544142454C415F504F434B4554010000
      0000000B000000434F445F50524F4455544F0100000000001000000056414C5F
      505245434F5F4156495354410100000000001000000056414C5F505245434F5F
      415052415A4F010000000000}
    Master = QPrecoPocket_Cad
    MasterFields = 'cod_tabela_pocket'
    DetailFields = 'cod_tabela_pocket'
    Session = DMOracle.DBCemapa
    AfterInsert = QPrecoPocket_ItemAfterInsert
    Left = 56
    Top = 80
    object QPrecoPocket_ItemCOD_TABELA_POCKET: TIntegerField
      FieldName = 'COD_TABELA_POCKET'
      Required = True
    end
    object QPrecoPocket_ItemCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QPrecoPocket_ItemVAL_PRECO_AVISTA: TFloatField
      FieldName = 'VAL_PRECO_AVISTA'
      DisplayFormat = '#,##0.00'
    end
    object QPrecoPocket_ItemVAL_PRECO_APRAZO: TFloatField
      FieldName = 'VAL_PRECO_APRAZO'
      DisplayFormat = '#,##0.00'
    end
  end
  object QRPrecoPocket: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '   TB_TABELA_POCKET.COD_TABELA_POCKET,'
      '   TB_TABELA_POCKET.DESC_TABELA,'
      '   TB_TABELA_POCKET.NUM_PRAZO_MAXIMO,'
      '   TB_TABELA_POCKET.PERC_COMISSAO,'
      '   TB_TABELA_POCKET.QT_MINIMO_CAIXAS,'
      '   TB_TABELA_POCKET_ITEM.VAL_PRECO_AVISTA,'
      '   TB_TABELA_POCKET_ITEM.VAL_PRECO_APRAZO,'
      '   TB_TABELA_POCKET_ITEM.COD_PRODUTO,'
      '   TB_PRODUTO.DESC_PRODUTO,'
      '   TB_RAMO.COD_RAMO AS COD_CLASSE,'
      '   TB_RAMO.DESC_RAMO AS DESC_CLASSE'
      'FROM'
      '  TB_TABELA_POCKET,'
      '  TB_TABELA_POCKET_ITEM,'
      '  TB_PRODUTO,'
      '  TB_CLASSE,'
      '  TB_RAMO'
      'WHERE'
      
        '  TB_TABELA_POCKET.COD_TABELA_POCKET = TB_TABELA_POCKET_ITEM.COD' +
        '_TABELA_POCKET'
      '  AND'
      '  TB_TABELA_POCKET_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '  AND'
      '  TB_PRODUTO.COD_CLASSE = TB_CLASSE.COD_CLASSE'
      '  AND'
      '  TB_CLASSE.COD_RAMO = TB_RAMO.COD_RAMO'
      '  AND'
      '  (:COD_TABELA IS NULL'
      '   OR'
      '    TB_TABELA_POCKET.COD_TABELA_POCKET = :COD_TABELA)'
      '  AND'
      '  (:IND_SITUACAO IS NULL'
      '   OR'
      '    TB_TABELA_POCKET.IND_SITUACAO = :IND_SITUACAO)'
      'ORDER BY'
      '   TB_TABELA_POCKET.COD_TABELA_POCKET,'
      '   TB_RAMO.COD_RAMO,'
      '   SUBSTR(TB_PRODUTO.DESC_PRODUTO,1,1),'
      '   TB_TABELA_POCKET_ITEM.COD_PRODUTO'
      '')
    Variables.Data = {
      03000000020000000D0000003A494E445F534954554143414F05000000000000
      00000000000B0000003A434F445F544142454C41030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000B0000000D000000504552435F434F4D495353414F01000000000011
      000000434F445F544142454C415F504F434B45540100000000000B0000004445
      53435F544142454C41010000000000100000004E554D5F5052415A4F5F4D4158
      494D4F0100000000001000000051545F4D494E494D4F5F434149584153010000
      0000001000000056414C5F505245434F5F415649535441010000000000100000
      0056414C5F505245434F5F415052415A4F0100000000000C000000444553435F
      50524F4455544F0100000000000B000000434F445F50524F4455544F01000000
      00000A000000434F445F434C415353450100000000000B000000444553435F43
      4C41535345010000000000}
    Session = DMOracle.DBCemapa
    Left = 216
    Top = 80
    object QRPrecoPocketCOD_TABELA_POCKET: TIntegerField
      FieldName = 'COD_TABELA_POCKET'
      Required = True
    end
    object QRPrecoPocketDESC_TABELA: TStringField
      FieldName = 'DESC_TABELA'
      Required = True
      Size = 25
    end
    object QRPrecoPocketNUM_PRAZO_MAXIMO: TIntegerField
      FieldName = 'NUM_PRAZO_MAXIMO'
    end
    object QRPrecoPocketPERC_COMISSAO: TFloatField
      FieldName = 'PERC_COMISSAO'
    end
    object QRPrecoPocketQT_MINIMO_CAIXAS: TIntegerField
      FieldName = 'QT_MINIMO_CAIXAS'
    end
    object QRPrecoPocketVAL_PRECO_AVISTA: TFloatField
      FieldName = 'VAL_PRECO_AVISTA'
    end
    object QRPrecoPocketVAL_PRECO_APRAZO: TFloatField
      FieldName = 'VAL_PRECO_APRAZO'
    end
    object QRPrecoPocketDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
    object QRPrecoPocketCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QRPrecoPocketCOD_CLASSE: TIntegerField
      FieldName = 'COD_CLASSE'
      Required = True
    end
    object QRPrecoPocketDESC_CLASSE: TStringField
      FieldName = 'DESC_CLASSE'
      Size = 30
    end
  end
  object QTabelaPocket_Cons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '  TB_TABELA_POCKET'
      'WHERE'
      '  (:DESC_TABELA IS NULL'
      '   OR'
      '    DESC_TABELA >= :DESC_TABELA)'
      '  AND'
      '   COD_TABELA_POCKET <> :PK'
      ' AND'
      '   NUM_COD_TBL_PAI IS NULL'
      'ORDER BY'
      '  COD_TABELA_POCKET')
    Variables.Data = {
      03000000020000000C0000003A444553435F544142454C410500000000000000
      00000000030000003A504B050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000A0000000D000000504552435F434F4D495353414F01000000000011
      000000434F445F544142454C415F504F434B45540100000000000B0000004445
      53435F544142454C410100000000000C000000494E445F534954554143414F01
      0000000000100000004E554D5F5052415A4F5F4D4158494D4F01000000000010
      00000051545F4D494E494D4F5F43414958415301000000000010000000504552
      435F444553435F4156495354410100000000000F0000004E554D5F434F445F54
      424C5F5041490100000000000D000000504552435F564152494143414F010000
      0000000C0000004445535F4F5045524143414F010000000000}
    Session = DMOracle.DBCemapa
    Left = 216
    Top = 144
    object QTabelaPocket_ConsCOD_TABELA_POCKET: TIntegerField
      FieldName = 'COD_TABELA_POCKET'
      Required = True
    end
    object QTabelaPocket_ConsDESC_TABELA: TStringField
      FieldName = 'DESC_TABELA'
      Required = True
      Size = 25
    end
    object QTabelaPocket_ConsIND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Size = 10
    end
    object QTabelaPocket_ConsNUM_PRAZO_MAXIMO: TIntegerField
      FieldName = 'NUM_PRAZO_MAXIMO'
    end
    object QTabelaPocket_ConsPERC_COMISSAO: TFloatField
      FieldName = 'PERC_COMISSAO'
    end
    object QTabelaPocket_ConsQT_MINIMO_CAIXAS: TIntegerField
      FieldName = 'QT_MINIMO_CAIXAS'
    end
    object QTabelaPocket_ConsPERC_DESC_AVISTA: TFloatField
      FieldName = 'PERC_DESC_AVISTA'
    end
    object QTabelaPocket_ConsNUM_COD_TBL_PAI: TIntegerField
      FieldName = 'NUM_COD_TBL_PAI'
    end
    object QTabelaPocket_ConsPERC_VARIACAO: TFloatField
      FieldName = 'PERC_VARIACAO'
    end
    object QTabelaPocket_ConsDES_OPERACAO: TStringField
      FieldName = 'DES_OPERACAO'
      Size = 1
    end
  end
end
