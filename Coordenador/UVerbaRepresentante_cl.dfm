object DMVerbaRepresentante: TDMVerbaRepresentante
  OldCreateOrder = False
  Left = 322
  Top = 224
  Height = 275
  Width = 308
  object QVerbaRepresentante_Cad: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Rowid,'
      '  Tb_Verba_Representante.*'
      'From'
      '  Tb_Verba_Representante'
      'Where'
      '  Cod_Verba_Representante = :pk')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_VERBA_REPRESENTANTE'
    SequenceField.Sequence = 'SQVERBA_REPRESENTANTE'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000500000017000000434F445F56455242415F524550524553454E5441
      4E54450100000000000C000000434F445F56454E4445444F5201000000000007
      0000004E554D5F414E4F010000000000070000004E554D5F4D45530100000000
      000900000056414C5F5645524241010000000000}
    Session = DMOracle.DBCemapa
    Left = 64
    Top = 8
    object QVerbaRepresentante_CadCOD_VERBA_REPRESENTANTE: TIntegerField
      FieldName = 'COD_VERBA_REPRESENTANTE'
      Required = True
    end
    object QVerbaRepresentante_CadCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object QVerbaRepresentante_CadNUM_ANO: TIntegerField
      FieldName = 'NUM_ANO'
    end
    object QVerbaRepresentante_CadNUM_MES: TIntegerField
      FieldName = 'NUM_MES'
    end
    object QVerbaRepresentante_CadVAL_VERBA: TFloatField
      FieldName = 'VAL_VERBA'
      DisplayFormat = '#,##0.00'
    end
  end
  object QVerbaVendedor: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Rowid,'
      '  Tb_Verba_Vendedor.*'
      'From'
      '  Tb_Verba_Vendedor'
      'Where'
      '  Cod_Verba_Representante = :Cod_Verba_Representante'
      '  And'
      '  Cod_Vendedor = :Cod_Vendedor'
      '  AND'
      '  Num_Ano = :Num_Ano'
      '  AND'
      '  Num_Mes = :Num_Mes')
    Variables.Data = {
      0300000004000000180000003A434F445F56455242415F524550524553454E54
      414E54450300000000000000000000000D0000003A434F445F56454E4445444F
      52030000000000000000000000080000003A4E554D5F414E4F03000000000000
      0000000000080000003A4E554D5F4D4553030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000600000017000000434F445F56455242415F524550524553454E5441
      4E54450100000000000C000000434F445F56454E4445444F5201000000000007
      0000004E554D5F414E4F010000000000070000004E554D5F4D45530100000000
      000900000056414C5F56455242410100000000000D00000056414C5F5554494C
      495A41444F010000000000}
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    BeforeInsert = QVerbaVendedorBeforeInsert
    BeforeEdit = QVerbaVendedorBeforeEdit
    AfterPost = QVerbaVendedorAfterPost
    AfterCancel = QVerbaVendedorAfterCancel
    BeforeDelete = QVerbaVendedorBeforeDelete
    AfterDelete = QVerbaVendedorAfterDelete
    OnDeleteError = QVerbaVendedorDeleteError
    Left = 56
    Top = 72
    object QVerbaVendedorCOD_VERBA_REPRESENTANTE: TIntegerField
      FieldName = 'COD_VERBA_REPRESENTANTE'
      Required = True
    end
    object QVerbaVendedorCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object QVerbaVendedorNUM_ANO: TIntegerField
      FieldName = 'NUM_ANO'
      Required = True
    end
    object QVerbaVendedorNUM_MES: TIntegerField
      FieldName = 'NUM_MES'
      Required = True
    end
    object QVerbaVendedorVAL_VERBA: TFloatField
      FieldName = 'VAL_VERBA'
      DisplayFormat = '#,##0.00'
    end
    object QVerbaVendedorVAL_UTILIZADO: TFloatField
      FieldName = 'VAL_UTILIZADO'
      DisplayFormat = '#,##0.00'
    end
  end
  object QVerbaVendedor_All: TOracleDataSet1
    SQL.Strings = (
      'select'
      '  Cod_vendedor,'
      '  Nome,'
      '  sum(Val_Verba) as val_verba,'
      '  sum(Val_Utilizado) as Val_Utilizado,'
      '  Cod_Verba_Representante'
      'From'
      '('
      '  Select'
      '    Tb_Vendedor.Cod_vendedor,'
      '    Tb_Vendedor.Nome,'
      '    Tb_Verba_Vendedor.Val_Verba,'
      '    Tb_Verba_Vendedor.Val_Utilizado,'
      '    Tb_Verba_Representante.Cod_Verba_Representante'
      '  From'
      '    Tb_Verba_Representante, /*verba do supervisor */'
      '    Tb_Verba_Vendedor,'
      '    Tb_Vendedor'
      '  Where'
      
        '    Tb_Verba_Representante.cod_verba_Representante = Tb_Verba_Ve' +
        'ndedor.cod_verba_Representante'
      '    and'
      '    tb_verba_vendedor.cod_vendedor = tb_vendedor.cod_vendedor'
      '    AND'
      '    Tb_Verba_Representante.NUM_ANO = :NUM_ANO'
      '    AND'
      '    Tb_Verba_Representante.NUM_MES = :NUM_MES'
      '    AND'
      '    Tb_Verba_Representante.COD_VENDEDOR = :COD_REPRESENTANTE'
      ''
      ' union all'
      ''
      '  Select'
      '    Tb_Vendedor.Cod_vendedor,'
      '    Tb_Vendedor.Nome,'
      '    0,'
      '    0,'
      '    Tb_Verba_Representante.Cod_Verba_Representante'
      '  From'
      '    Tb_Verba_Representante, /*verba do supervisor */'
      '    Tb_Vendedor'
      '  Where'
      
        '    Tb_Verba_Representante.cod_vendedor = Tb_Vendedor.COD_SUPERV' +
        'ISOR'
      '    AND'
      '    Tb_Verba_Representante.NUM_ANO = :NUM_ANO'
      '    AND'
      '    Tb_Verba_Representante.NUM_MES = :NUM_MES'
      '    AND'
      '    Tb_Verba_Representante.COD_VENDEDOR = :COD_REPRESENTANTE'
      ')'
      'group by'
      '  Cod_vendedor,'
      '  Nome,'
      '  Cod_Verba_Representante'
      '')
    Variables.Data = {
      0300000003000000080000003A4E554D5F414E4F030000000000000000000000
      080000003A4E554D5F4D4553030000000000000000000000120000003A434F44
      5F524550524553454E54414E5445030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000050000000C000000434F445F56454E4445444F520100000000000400
      00004E4F4D450100000000000900000056414C5F56455242410100000000000D
      00000056414C5F5554494C495A41444F01000000000017000000434F445F5645
      5242415F524550524553454E54414E5445010000000000}
    Session = DMOracle.DBCemapa
    Left = 192
    Top = 8
    object QVerbaVendedor_AllCOD_VENDEDOR: TFloatField
      FieldName = 'COD_VENDEDOR'
    end
    object QVerbaVendedor_AllNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object QVerbaVendedor_AllVAL_VERBA: TFloatField
      FieldName = 'VAL_VERBA'
    end
    object QVerbaVendedor_AllVAL_UTILIZADO: TFloatField
      FieldName = 'VAL_UTILIZADO'
    end
    object QVerbaVendedor_AllCOD_VERBA_REPRESENTANTE: TFloatField
      FieldName = 'COD_VERBA_REPRESENTANTE'
    end
  end
  object QRVerbaRepresentante: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_VERBA_REPRESENTANTE.COD_VENDEDOR,'
      '  TB_VERBA_REPRESENTANTE.VAL_VERBA,'
      '  TB_VENDEDOR.NOME'
      'FROM'
      '  TB_VERBA_REPRESENTANTE,'
      '  TB_VENDEDOR'
      'WHERE'
      '  TB_VERBA_REPRESENTANTE.COD_VENDEDOR = TB_VENDEDOR.COD_VENDEDOR'
      '  AND'
      '  (:VENDEDOR IS NULL'
      '    OR'
      '    TB_VERBA_REPRESENTANTE.COD_VENDEDOR = :VENDEDOR)'
      '  AND'
      '    TB_VERBA_REPRESENTANTE.NUM_MES = :MES'
      '  AND'
      '    TB_VERBA_REPRESENTANTE.NUM_ANO = :ANO')
    Variables.Data = {
      0300000003000000090000003A56454E4445444F520300000000000000000000
      00040000003A4D4553030000000000000000000000040000003A414E4F030000
      000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000030000000900000056414C5F5645524241010000000000040000004E
      4F4D450100000000000C000000434F445F56454E4445444F52010000000000}
    Session = DMOracle.DBCemapa
    Left = 192
    Top = 72
    object QRVerbaRepresentanteVAL_VERBA: TFloatField
      FieldName = 'VAL_VERBA'
    end
    object QRVerbaRepresentanteNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 40
    end
    object QRVerbaRepresentanteCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
  end
  object QRVerbaVendedor: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_VERBA_VENDEDOR.COD_VENDEDOR,'
      '  TB_VERBA_VENDEDOR.NUM_ANO,'
      '  TB_VERBA_VENDEDOR.NUM_MES,'
      '  TB_VERBA_VENDEDOR.VAL_VERBA,'
      '  TB_VERBA_VENDEDOR.VAL_UTILIZADO,'
      '  TB_VERBA_VENDEDOR.COD_VERBA_REPRESENTANTE,'
      '  TB_VENDEDOR.NOME,'
      '  TB_VERBA_REPRESENTANTE.VAL_VERBA AS VAL_VERBA_REPRESENTANTE,'
      '  TB_VERBA_REPRESENTANTE.COD_VENDEDOR AS COD_REPRESENTANTE'
      'FROM'
      '  TB_VERBA_REPRESENTANTE,'
      '  TB_VERBA_VENDEDOR,'
      '  TB_VENDEDOR'
      'WHERE'
      
        '  TB_VERBA_REPRESENTANTE.COD_VERBA_REPRESENTANTE = TB_VERBA_VEND' +
        'EDOR.COD_VERBA_REPRESENTANTE'
      '  AND'
      '  TB_VERBA_VENDEDOR.COD_VENDEDOR = TB_VENDEDOR.COD_VENDEDOR'
      '  AND'
      '  (:REPRESENTANTE IS NULL'
      '    OR'
      '    TB_VERBA_REPRESENTANTE.COD_VENDEDOR = :REPRESENTANTE)'
      '  AND'
      '  (:ANO IS NULL'
      '    OR'
      '    TB_VERBA_REPRESENTANTE.NUM_ANO = :ANO)'
      '  AND'
      '  (:MES IS NULL'
      '    OR'
      '    TB_VERBA_REPRESENTANTE.NUM_MES = :MES)'
      ''
      'ORDER BY'
      '  TB_VERBA_VENDEDOR.COD_VERBA_REPRESENTANTE,'
      '  TB_VENDEDOR.NOME'
      ''
      ''
      '')
    Variables.Data = {
      03000000030000000E0000003A524550524553454E54414E5445030000000000
      000000000000040000003A414E4F030000000000000000000000040000003A4D
      4553030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000090000000C000000434F445F56454E4445444F520100000000000700
      00004E554D5F414E4F010000000000070000004E554D5F4D4553010000000000
      0900000056414C5F56455242410100000000000D00000056414C5F5554494C49
      5A41444F010000000000040000004E4F4D4501000000000017000000434F445F
      56455242415F524550524553454E54414E54450100000000001700000056414C
      5F56455242415F524550524553454E54414E544501000000000011000000434F
      445F524550524553454E54414E5445010000000000}
    Session = DMOracle.DBCemapa
    Left = 56
    Top = 128
    object QRVerbaVendedorCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object QRVerbaVendedorNUM_ANO: TIntegerField
      FieldName = 'NUM_ANO'
      Required = True
    end
    object QRVerbaVendedorNUM_MES: TIntegerField
      FieldName = 'NUM_MES'
      Required = True
    end
    object QRVerbaVendedorVAL_VERBA: TFloatField
      FieldName = 'VAL_VERBA'
    end
    object QRVerbaVendedorVAL_UTILIZADO: TFloatField
      FieldName = 'VAL_UTILIZADO'
    end
    object QRVerbaVendedorCOD_VERBA_REPRESENTANTE: TIntegerField
      FieldName = 'COD_VERBA_REPRESENTANTE'
      Required = True
    end
    object QRVerbaVendedorNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 40
    end
    object QRVerbaVendedorVAL_VERBA_REPRESENTANTE: TFloatField
      FieldName = 'VAL_VERBA_REPRESENTANTE'
    end
    object QRVerbaVendedorCOD_REPRESENTANTE: TIntegerField
      FieldName = 'COD_REPRESENTANTE'
    end
  end
  object QVerbaRepresentanteCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '  TB_VERBA_REPRESENTANTE'
      'WHERE'
      '  (:MES IS NULL'
      '    OR'
      '    TB_VERBA_REPRESENTANTE.NUM_MES = :MES)'
      '  AND'
      '  (:ANO IS NULL'
      '    OR'
      '    TB_VERBA_REPRESENTANTE.NUM_ANO = :ANO)'
      '  AND'
      '  (:REPRESENTANTE IS NULL'
      '    OR'
      '    COD_VENDEDOR >= :REPRESENTANTE)'
      'ORDER BY'
      '  COD_VENDEDOR')
    Variables.Data = {
      03000000030000000E0000003A524550524553454E54414E5445030000000000
      000000000000040000003A4D4553030000000000000000000000040000003A41
      4E4F030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000500000017000000434F445F56455242415F524550524553454E5441
      4E54450100000000000C000000434F445F56454E4445444F5201000000000007
      0000004E554D5F414E4F010000000000070000004E554D5F4D45530100000000
      000900000056414C5F5645524241010000000000}
    Session = DMOracle.DBCemapa
    Left = 192
    Top = 128
    object QVerbaRepresentanteConsCOD_VERBA_REPRESENTANTE: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_VERBA_REPRESENTANTE'
      Required = True
    end
    object QVerbaRepresentanteConsCOD_VENDEDOR: TIntegerField
      DisplayLabel = 'Vendedor'
      FieldName = 'COD_VENDEDOR'
    end
    object QVerbaRepresentanteConsNUM_ANO: TIntegerField
      DisplayLabel = 'Ano'
      FieldName = 'NUM_ANO'
    end
    object QVerbaRepresentanteConsNUM_MES: TIntegerField
      DisplayLabel = 'Mes'
      FieldName = 'NUM_MES'
    end
    object QVerbaRepresentanteConsVAL_VERBA: TFloatField
      DisplayLabel = 'Val Verba'
      FieldName = 'VAL_VERBA'
    end
  end
  object QVerbaVendedorCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT DISTINCT'
      '  TB_VERBA_VENDEDOR.COD_VENDEDOR,'
      '  TB_VERBA_VENDEDOR.NUM_ANO,'
      '  TB_VERBA_VENDEDOR.NUM_MES,'
      '  TB_VERBA_VENDEDOR.VAL_VERBA,'
      '  TB_VERBA_VENDEDOR.VAL_UTILIZADO,'
      '  TB_VERBA_VENDEDOR.COD_VERBA_REPRESENTANTE,'
      '  TB_VENDEDOR.NOME,'
      '  TB_VENDEDOR.COD_SUPERVISOR'
      'FROM'
      '  TB_VERBA_VENDEDOR,'
      '  TB_VENDEDOR'
      'WHERE'
      '  TB_VERBA_VENDEDOR.COD_VENDEDOR = TB_VENDEDOR.COD_VENDEDOR'
      '  AND'
      '  (:MES IS NULL'
      '    OR'
      '    TB_VERBA_VENDEDOR.NUM_MES = :MES)'
      '  AND'
      '  (:ANO IS NULL'
      '    OR'
      '    TB_VERBA_VENDEDOR.NUM_ANO = :ANO)'
      '  AND'
      '  TB_VERBA_VENDEDOR.COD_VENDEDOR = :VENDEDOR'
      'ORDER BY'
      '  COD_VENDEDOR,'
      '  TB_VERBA_VENDEDOR.NUM_ANO,'
      '  TB_VERBA_VENDEDOR.NUM_MES')
    Variables.Data = {
      0300000003000000090000003A56454E4445444F520300000000000000000000
      00040000003A4D4553030000000000000000000000040000003A414E4F030000
      000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000080000000C000000434F445F56454E4445444F520100000000000700
      00004E554D5F414E4F010000000000070000004E554D5F4D4553010000000000
      0900000056414C5F5645524241010000000000040000004E4F4D450100000000
      000E000000434F445F53555045525649534F520100000000000D00000056414C
      5F5554494C495A41444F01000000000017000000434F445F56455242415F5245
      50524553454E54414E5445010000000000}
    Session = DMOracle.DBCemapa
    Left = 56
    Top = 184
    object QVerbaVendedorConsCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object QVerbaVendedorConsNUM_ANO: TIntegerField
      FieldName = 'NUM_ANO'
      Required = True
    end
    object QVerbaVendedorConsNUM_MES: TIntegerField
      FieldName = 'NUM_MES'
      Required = True
    end
    object QVerbaVendedorConsVAL_VERBA: TFloatField
      FieldName = 'VAL_VERBA'
    end
    object QVerbaVendedorConsNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 40
    end
    object QVerbaVendedorConsCOD_SUPERVISOR: TIntegerField
      FieldName = 'COD_SUPERVISOR'
    end
    object QVerbaVendedorConsVAL_UTILIZADO: TFloatField
      FieldName = 'VAL_UTILIZADO'
    end
    object QVerbaVendedorConsCOD_VERBA_REPRESENTANTE: TIntegerField
      FieldName = 'COD_VERBA_REPRESENTANTE'
      Required = True
    end
  end
end
