object DMTabelaPreco: TDMTabelaPreco
  OldCreateOrder = False
  Left = 476
  Top = 211
  Height = 321
  Width = 550
  object QTabelaPrecoCab: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '   ROWID,'
      '   TB_TABELA_PRECO_CAB.*'
      'FROM'
      '   TB_TABELA_PRECO_CAB'
      'WHERE'
      '  TB_TABELA_PRECO_CAB.COD_TABELA_PRECO_CAB=:PK')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_TABELA_PRECO_CAB'
    SequenceField.Sequence = 'SQTABELAPRECOCAB'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000400000014000000434F445F544142454C415F505245434F5F434142
      01000000000011000000444553435F544142454C415F505245434F0100000000
      000C000000494E445F534954554143414F01000000000015000000494E445F42
      4C4F51554549415F444553434F4E544F010000000000}
    RefreshOptions = [roAfterInsert]
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    BeforeInsert = QTabelaPrecoCabBeforeInsert
    AfterInsert = QTabelaPrecoCabAfterInsert
    BeforeEdit = QTabelaPrecoCabBeforeEdit
    BeforePost = QTabelaPrecoCabBeforePost
    AfterPost = QTabelaPrecoCabAfterPost
    BeforeCancel = QTabelaPrecoCabBeforeCancel
    AfterCancel = QTabelaPrecoCabAfterCancel
    BeforeDelete = QTabelaPrecoCabBeforeDelete
    AfterDelete = QTabelaPrecoCabAfterDelete
    OnDeleteError = QTabelaPrecoCabDeleteError
    Left = 48
    Top = 32
    object QTabelaPrecoCabCOD_TABELA_PRECO_CAB: TIntegerField
      FieldName = 'COD_TABELA_PRECO_CAB'
      Required = True
    end
    object QTabelaPrecoCabDESC_TABELA_PRECO: TStringField
      FieldName = 'DESC_TABELA_PRECO'
      Required = True
      Size = 30
    end
    object QTabelaPrecoCabIND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Required = True
    end
    object QTabelaPrecoCabIND_BLOQUEIA_DESCONTO: TStringField
      FieldName = 'IND_BLOQUEIA_DESCONTO'
      Size = 3
    end
  end
  object QTabelaPrecoItem: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_TABELA_PRECO_ITEM.ROWID,'
      '  TB_TABELA_PRECO_ITEM.*'
      'FROM'
      '  TB_TABELA_PRECO_ITEM,'
      '  TB_PRODUTO'
      'where'
      
        '  TB_TABELA_PRECO_ITEM.cod_tabela_preco_cab = :cod_tabela_preco_' +
        'cab'
      'AND'
      '  TB_TABELA_PRECO_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      'order by'
      '  TB_PRODUTO.DESC_PRODUTO')
    Variables.Data = {
      0300000001000000150000003A434F445F544142454C415F505245434F5F4341
      42030000000000000000000000}
    SequenceField.Field = 'COD_TABELA_PRECO_ITEM'
    SequenceField.Sequence = 'SQTABELAPRECOITEM'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000500000015000000434F445F544142454C415F505245434F5F495445
      4D01000000000014000000434F445F544142454C415F505245434F5F43414201
      00000000000B000000434F445F50524F4455544F010000000000090000005641
      4C5F505245434F0100000000000D00000051545F5155414E5449444144450100
      00000000}
    Master = QTabelaPrecoCab
    MasterFields = 'COD_TABELA_PRECO_CAB'
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    BeforeInsert = QTabelaPrecoItemBeforeInsert
    AfterInsert = QTabelaPrecoItemAfterInsert
    BeforeEdit = QTabelaPrecoItemBeforeEdit
    OnCalcFields = QTabelaPrecoItemCalcFields
    Left = 154
    Top = 31
    object QTabelaPrecoItemCOD_TABELA_PRECO_ITEM: TIntegerField
      FieldName = 'COD_TABELA_PRECO_ITEM'
      Required = True
    end
    object QTabelaPrecoItemCOD_TABELA_PRECO_CAB: TIntegerField
      FieldName = 'COD_TABELA_PRECO_CAB'
      Required = True
    end
    object QTabelaPrecoItemCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QTabelaPrecoItemVAL_PRECO: TFloatField
      FieldName = 'VAL_PRECO'
      Required = True
      OnValidate = QTabelaPrecoItemVAL_PRECOValidate
      DisplayFormat = '#,###0.000'
    end
    object QTabelaPrecoItemdescricao: TStringField
      FieldKind = fkCalculated
      FieldName = 'descricao'
      Calculated = True
    end
    object QTabelaPrecoItemQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
    end
  end
  object QTabelaPrecoCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '   TB_TABELA_PRECO_CAB.COD_TABELA_PRECO_CAB,'
      '   TB_TABELA_PRECO_CAB.DESC_TABELA_PRECO,'
      '   TB_TABELA_PRECO_CAB.IND_SITUACAO'
      'FROM'
      '   TB_TABELA_PRECO_CAB'
      'WHERE'
      '   (:DESCRICAO IS NULL '
      '       OR TB_TABELA_PRECO_CAB.DESC_TABELA_PRECO LIKE :DESCRICAO)')
    Variables.Data = {
      03000000010000000A0000003A44455343524943414F05000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      040000000300000014000000434F445F544142454C415F505245434F5F434142
      01000000000011000000444553435F544142454C415F505245434F0100000000
      000C000000494E445F534954554143414F010000000000}
    ReadOnly = True
    RefreshOptions = [roBeforeEdit, roAllFields]
    Session = DMOracle.DBCemapa
    Left = 256
    Top = 32
    object QTabelaPrecoConsCOD_TABELA_PRECO_CAB: TIntegerField
      FieldName = 'COD_TABELA_PRECO_CAB'
      Required = True
    end
    object QTabelaPrecoConsDESC_TABELA_PRECO: TStringField
      FieldName = 'DESC_TABELA_PRECO'
      Required = True
      Size = 30
    end
    object QTabelaPrecoConsIND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Required = True
    end
  end
  object QTabelaPrecoItensCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '   TPI.COD_TABELA_PRECO_ITEM,'
      '   TPI.COD_TABELA_PRECO_CAB,'
      '   TPI.COD_PRODUTO,'
      '   TPI.VAL_PRECO,'
      '   TPI.QT_QUANTIDADE,'
      '   TPI.VAL_PRECO * TPI.QT_QUANTIDADE AS VAL_TOTAL_ITEM,'
      '   PRO.DESC_PRODUTO'
      ' FROM'
      '   TB_TABELA_PRECO_ITEM TPI,'
      '   TB_PRODUTO PRO'
      'WHERE'
      '    TPI.COD_PRODUTO = PRO.COD_PRODUTO'
      'AND'
      '   TPI.COD_TABELA_PRECO_CAB = :COD_TABELA_PRECO_CAB'
      'ORDER BY TPI.COD_PRODUTO')
    Variables.Data = {
      0300000001000000150000003A434F445F544142454C415F505245434F5F4341
      42030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000700000015000000434F445F544142454C415F505245434F5F495445
      4D01000000000014000000434F445F544142454C415F505245434F5F43414201
      00000000000B000000434F445F50524F4455544F010000000000090000005641
      4C5F505245434F0100000000000C000000444553435F50524F4455544F010000
      0000000D00000051545F5155414E5449444144450100000000000E0000005641
      4C5F544F54414C5F4954454D010000000000}
    ReadOnly = True
    RefreshOptions = [roBeforeEdit, roAllFields]
    Session = DMOracle.DBCemapa
    Left = 257
    Top = 97
    object QTabelaPrecoItensConsCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QTabelaPrecoItensConsVAL_PRECO: TFloatField
      FieldName = 'VAL_PRECO'
      Required = True
      DisplayFormat = '#,###0.000'
    end
    object QTabelaPrecoItensConsDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 200
    end
    object QTabelaPrecoItensConsQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
    end
    object QTabelaPrecoItensConsVAL_TOTAL_ITEM: TFloatField
      FieldName = 'VAL_TOTAL_ITEM'
      DisplayFormat = '#,###0.000'
    end
  end
  object QRTabelaPreco: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TPC.COD_TABELA_PRECO_CAB,'
      '  TPC.DESC_TABELA_PRECO,'
      '  TPC.IND_SITUACAO,'
      '  TPI.COD_TABELA_PRECO_ITEM,'
      '  TPI.COD_PRODUTO,'
      '  PROD.DESC_PRODUTO,'
      '  TPI.VAL_PRECO,'
      '  TPI.QT_QUANTIDADE,'
      '  PROD.PERC_IPI,'
      '  cla.num_classe,'
      '  CLA.NUM_SUBCLASSE,'
      '  CLA.DESC_CLASSE,'
      
        '  (TPI.VAL_PRECO * TPI.QT_QUANTIDADE) AS VAL_TOTAL_ITEM, /*INJEP' +
        'AR*/'
      
        '  TPI.VAL_PRECO + (TPI.VAL_PRECO * PROD.PERC_IPI / 100) AS VAL_T' +
        'OTAL_COM_IPI /*DEION*/'
      'FROM'
      '  TB_TABELA_PRECO_CAB TPC,'
      '  TB_TABELA_PRECO_ITEM TPI,'
      '  TB_PRODUTO PROD,'
      '  TB_CLASSE Cla'
      'WHERE'
      '  TPC.COD_TABELA_PRECO_CAB = TPI.COD_TABELA_PRECO_CAB'
      'AND'
      '  TPI.COD_PRODUTO = PROD.COD_PRODUTO'
      'AND'
      '  PROD.COD_CLASSE = CLA.COD_CLASSE'
      'AND'
      '  (:COD_TABELA IS NULL'
      '    OR TPC.COD_TABELA_PRECO_CAB = :COD_TABELA)'
      'AND'
      '  (:IND_SITUACAO IS NULL'
      '    OR TPC.IND_SITUACAO = :IND_SITUACAO)'
      'AND'
      '  (:CLASSE IS NULL'
      '   OR'
      '    CLA.NUM_CLASSE =:CLASSE)'
      '  AND'
      '  (:SUBCLASSE IS NULL'
      '   OR'
      '    CLA.NUM_SUBCLASSE =:SUBCLASSE)  '
      'group by'
      '  TPC.COD_TABELA_PRECO_CAB,'
      '  TPC.DESC_TABELA_PRECO,'
      '  TPC.IND_SITUACAO,'
      '  TPI.COD_TABELA_PRECO_ITEM,'
      '  TPI.COD_PRODUTO,'
      '  PROD.DESC_PRODUTO,'
      '  TPI.VAL_PRECO,'
      '  TPI.QT_QUANTIDADE,'
      '  PROD.PERC_IPI,'
      '  cla.num_classe,'
      '  CLA.NUM_SUBCLASSE,'
      '  CLA.DESC_CLASSE'
      
        'ORDER BY cla.num_classe,CLA.NUM_SUBCLASSE,TPC.COD_TABELA_PRECO_C' +
        'AB, TPC.IND_SITUACAO ')
    Variables.Data = {
      03000000040000000D0000003A494E445F534954554143414F05000000000000
      00000000000B0000003A434F445F544142454C41030000000000000000000000
      070000003A434C415353450300000000000000000000000A0000003A53554243
      4C41535345030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000E00000014000000434F445F544142454C415F505245434F5F434142
      01000000000011000000444553435F544142454C415F505245434F0100000000
      000C000000494E445F534954554143414F01000000000015000000434F445F54
      4142454C415F505245434F5F4954454D0100000000000B000000434F445F5052
      4F4455544F0100000000000C000000444553435F50524F4455544F0100000000
      000900000056414C5F505245434F0100000000000A0000004E554D5F434C4153
      53450100000000000D0000004E554D5F535542434C415353450100000000000B
      000000444553435F434C415353450100000000000D00000051545F5155414E54
      49444144450100000000000E00000056414C5F544F54414C5F4954454D010000
      00000008000000504552435F4950490100000000001100000056414C5F544F54
      414C5F434F4D5F495049010000000000}
    Session = DMOracle.DBCemapa
    Left = 40
    Top = 104
    object QRTabelaPrecoCOD_TABELA_PRECO_CAB: TIntegerField
      FieldName = 'COD_TABELA_PRECO_CAB'
      Required = True
    end
    object QRTabelaPrecoDESC_TABELA_PRECO: TStringField
      FieldName = 'DESC_TABELA_PRECO'
      Required = True
      Size = 30
    end
    object QRTabelaPrecoIND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Required = True
    end
    object QRTabelaPrecoCOD_TABELA_PRECO_ITEM: TIntegerField
      FieldName = 'COD_TABELA_PRECO_ITEM'
      Required = True
    end
    object QRTabelaPrecoCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QRTabelaPrecoDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 200
    end
    object QRTabelaPrecoVAL_PRECO: TFloatField
      FieldName = 'VAL_PRECO'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object QRTabelaPrecoNUM_CLASSE: TIntegerField
      FieldName = 'NUM_CLASSE'
      Required = True
    end
    object QRTabelaPrecoNUM_SUBCLASSE: TIntegerField
      FieldName = 'NUM_SUBCLASSE'
      Required = True
    end
    object QRTabelaPrecoDESC_CLASSE: TStringField
      FieldName = 'DESC_CLASSE'
      Size = 30
    end
    object QRTabelaPrecoQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
      DisplayFormat = '#,##0.00'
    end
    object QRTabelaPrecoVAL_TOTAL_ITEM: TFloatField
      FieldName = 'VAL_TOTAL_ITEM'
      DisplayFormat = '#,##0.00'
    end
    object QRTabelaPrecoPERC_IPI: TFloatField
      FieldName = 'PERC_IPI'
    end
    object QRTabelaPrecoVAL_TOTAL_COM_IPI: TFloatField
      FieldName = 'VAL_TOTAL_COM_IPI'
      DisplayFormat = '#,##0.00'
    end
  end
  object QTabelaPrecoProduto: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_TABELA_PRECO_ITEM.*,'
      '  TB_TABELA_PRECO_CAB.IND_BLOQUEIA_DESCONTO,'
      '  TB_TABELA_PRECO_CAB.IND_SITUACAO'
      'FROM'
      '  TB_TABELA_PRECO_ITEM'
      '    INNER JOIN TB_TABELA_PRECO_CAB'
      
        '        ON TB_TABELA_PRECO_ITEM.COD_TABELA_PRECO_CAB = TB_TABELA' +
        '_PRECO_CAB.COD_TABELA_PRECO_CAB'
      'WHERE'
      '  COD_PRODUTO = :COD_PRODUTO'
      '  AND'
      '  TB_TABELA_PRECO_CAB.COD_TABELA_PRECO_CAB = :COD_TABELA_PRECO')
    Variables.Data = {
      03000000020000000C0000003A434F445F50524F4455544F0300000000000000
      00000000110000003A434F445F544142454C415F505245434F03000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000700000015000000434F445F544142454C415F505245434F5F495445
      4D01000000000014000000434F445F544142454C415F505245434F5F43414201
      00000000000B000000434F445F50524F4455544F010000000000090000005641
      4C5F505245434F01000000000015000000494E445F424C4F51554549415F4445
      53434F4E544F0100000000000C000000494E445F534954554143414F01000000
      00000D00000051545F5155414E544944414445010000000000}
    Session = DMOracle.DBCemapa
    Left = 257
    Top = 154
    object QTabelaPrecoProdutoCOD_TABELA_PRECO_ITEM: TIntegerField
      FieldName = 'COD_TABELA_PRECO_ITEM'
      Required = True
    end
    object QTabelaPrecoProdutoCOD_TABELA_PRECO_CAB: TIntegerField
      FieldName = 'COD_TABELA_PRECO_CAB'
      Required = True
    end
    object QTabelaPrecoProdutoCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QTabelaPrecoProdutoVAL_PRECO: TFloatField
      FieldName = 'VAL_PRECO'
      Required = True
    end
    object QTabelaPrecoProdutoIND_BLOQUEIA_DESCONTO: TStringField
      FieldName = 'IND_BLOQUEIA_DESCONTO'
      Size = 3
    end
    object QTabelaPrecoProdutoIND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Required = True
    end
    object QTabelaPrecoProdutoQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
    end
  end
  object QReajustaPreco: TOracleDataSet1
    SQL.Strings = (
      'select '
      '  I.COD_TABELA_PRECO_CAB, '
      '  I.COD_TABELA_PRECO_ITEM, '
      '  I.COD_PRODUTO, '
      '  I.VAL_PRECO'
      'from'
      '  TB_TABELA_PRECO_ITEM I'
      'WHERE'
      '  I.COD_TABELA_PRECO_CAB = :COD_TABELA_PRECO_CAB')
    Variables.Data = {
      0300000001000000150000003A434F445F544142454C415F505245434F5F4341
      42030000000000000000000000}
    SequenceField.ApplyMoment = amOnNewRecord
    OracleDictionary.DefaultValues = True
    QBEDefinition.QBEFieldDefs = {
      04000000040000000B000000434F445F50524F4455544F010000000000140000
      00434F445F544142454C415F505245434F5F4341420100000000001500000043
      4F445F544142454C415F505245434F5F4954454D010000000000090000005641
      4C5F505245434F010000000000}
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 49
    Top = 225
    object QReajustaPrecoCOD_TABELA_PRECO_CAB: TIntegerField
      FieldName = 'COD_TABELA_PRECO_CAB'
      Required = True
    end
    object QReajustaPrecoCOD_TABELA_PRECO_ITEM: TIntegerField
      FieldName = 'COD_TABELA_PRECO_ITEM'
      Required = True
    end
    object QReajustaPrecoCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QReajustaPrecoVAL_PRECO: TFloatField
      FieldName = 'VAL_PRECO'
      Required = True
    end
  end
  object OPReajustaListaPreco: TOraclePackage
    Session = DMOracle.DBCemapa
    PackageName = 'PCK_REAJUSTALISTAPRECO'
    Left = 46
    Top = 170
  end
  object CDSTabelaPrecoItem: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 216
    Top = 224
    Data = {
      7B0000009619E0BD0100000018000000040000000000030000007B0015636F64
      5F746162656C615F707265636F5F6974656D040001000000000014636F645F74
      6162656C615F707265636F5F63616204000100000000000B636F645F70726F64
      75746F04000100000000000976616C5F707265636F08000400000000000000}
    object CDSTabelaPrecoItemcod_tabela_preco_item: TIntegerField
      FieldName = 'cod_tabela_preco_item'
    end
    object CDSTabelaPrecoItemcod_tabela_preco_cab: TIntegerField
      FieldName = 'cod_tabela_preco_cab'
    end
    object CDSTabelaPrecoItemcod_produto: TIntegerField
      FieldName = 'cod_produto'
    end
    object CDSTabelaPrecoItemval_preco: TFloatField
      FieldName = 'val_preco'
    end
  end
end
