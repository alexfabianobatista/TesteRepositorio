object DmRelatorioConsulta: TDmRelatorioConsulta
  OldCreateOrder = False
  Left = 468
  Top = 256
  Height = 218
  Width = 215
  object QCamposTela: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  R.COD_USUARIO,'
      '  C.*'
      'FROM'
      '  TB_RELATORIO_CONSULTA_CAMPO C'
      
        'INNER JOIN TB_RELATORIO_CONSULTA R ON R.COD_RELATORIO_CONSULTA =' +
        ' C.COD_RELATORIO_CONSULTA'
      'WHERE'
      '  R.DESC_TELA = :DESC_TELA'
      'ORDER BY'
      '  C.NUM_ORDEM')
    Variables.Data = {
      03000000010000000A0000003A444553435F54454C4105000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      040000000800000016000000434F445F52454C41544F52494F5F434F4E53554C
      54410100000000000B000000444553435F544954554C4F0100000000001C0000
      00434F445F52454C41544F52494F5F434F4E53554C54415F43414D504F010000
      0000000A000000444553435F43414D504F010000000000090000004E554D5F4F
      5244454D0100000000000B0000004E554D5F4C41524755524101000000000010
      000000444553435F414C494E48414D454E544F0100000000000B000000434F44
      5F5553554152494F010000000000}
    Session = DMOracle.DBCemapa
    Left = 24
    Top = 8
    object QCamposTelaCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
    object QCamposTelaCOD_RELATORIO_CONSULTA_CAMPO: TIntegerField
      FieldName = 'COD_RELATORIO_CONSULTA_CAMPO'
      Required = True
    end
    object QCamposTelaCOD_RELATORIO_CONSULTA: TIntegerField
      FieldName = 'COD_RELATORIO_CONSULTA'
      Required = True
    end
    object QCamposTelaDESC_CAMPO: TStringField
      FieldName = 'DESC_CAMPO'
      Required = True
      Size = 150
    end
    object QCamposTelaDESC_TITULO: TStringField
      FieldName = 'DESC_TITULO'
      Size = 150
    end
    object QCamposTelaNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
      Required = True
    end
    object QCamposTelaNUM_LARGURA: TIntegerField
      FieldName = 'NUM_LARGURA'
      Required = True
    end
    object QCamposTelaDESC_ALINHAMENTO: TStringField
      FieldName = 'DESC_ALINHAMENTO'
      Required = True
      Size = 150
    end
  end
  object QRelTela: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  R.*'
      'FROM'
      '  TB_RELATORIO_CONSULTA R'
      'WHERE'
      '  R.DESC_TELA = :DESC_TELA')
    Variables.Data = {
      03000000010000000A0000003A444553435F54454C4105000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      040000000800000016000000434F445F52454C41544F52494F5F434F4E53554C
      54410100000000000B000000444553435F544954554C4F0100000000000B0000
      00434F445F5553554152494F01000000000009000000444553435F54454C4101
      00000000000D000000494E445F444154415F484F524101000000000011000000
      494E445F4E554D45524F5F504147494E410100000000000B000000494E445F50
      55424C49434F0100000000000A000000494E445F544954554C4F010000000000}
    Session = DMOracle.DBCemapa
    Left = 24
    Top = 56
    object QRelTelaCOD_RELATORIO_CONSULTA: TIntegerField
      FieldName = 'COD_RELATORIO_CONSULTA'
      Required = True
    end
    object QRelTelaDESC_TELA: TStringField
      FieldName = 'DESC_TELA'
      Required = True
      Size = 150
    end
    object QRelTelaDESC_TITULO: TStringField
      FieldName = 'DESC_TITULO'
      Required = True
      Size = 250
    end
    object QRelTelaCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
    object QRelTelaIND_DATA_HORA: TStringField
      FieldName = 'IND_DATA_HORA'
      Required = True
      Size = 1
    end
    object QRelTelaIND_NUMERO_PAGINA: TStringField
      FieldName = 'IND_NUMERO_PAGINA'
      Required = True
      Size = 1
    end
    object QRelTelaIND_PUBLICO: TStringField
      FieldName = 'IND_PUBLICO'
      Required = True
      Size = 1
    end
    object QRelTelaIND_TITULO: TStringField
      FieldName = 'IND_TITULO'
      Required = True
      Size = 1
    end
  end
  object QCamposCod: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  R.COD_USUARIO,'
      '  C.*'
      'FROM'
      '  TB_RELATORIO_CONSULTA_CAMPO C'
      
        'INNER JOIN TB_RELATORIO_CONSULTA R ON R.COD_RELATORIO_CONSULTA =' +
        ' C.COD_RELATORIO_CONSULTA'
      'WHERE'
      '  R.COD_RELATORIO_CONSULTA = :COD_RELATORIO_CONSULTA'
      'ORDER BY'
      '  C.NUM_ORDEM')
    Variables.Data = {
      0300000001000000170000003A434F445F52454C41544F52494F5F434F4E5355
      4C5441030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000800000016000000434F445F52454C41544F52494F5F434F4E53554C
      54410100000000000B000000444553435F544954554C4F0100000000001C0000
      00434F445F52454C41544F52494F5F434F4E53554C54415F43414D504F010000
      0000000A000000444553435F43414D504F010000000000090000004E554D5F4F
      5244454D0100000000000B0000004E554D5F4C41524755524101000000000010
      000000444553435F414C494E48414D454E544F0100000000000B000000434F44
      5F5553554152494F010000000000}
    Session = DMOracle.DBCemapa
    Left = 120
    Top = 8
    object QCamposCodCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
    object QCamposCodCOD_RELATORIO_CONSULTA_CAMPO: TIntegerField
      FieldName = 'COD_RELATORIO_CONSULTA_CAMPO'
      Required = True
    end
    object QCamposCodCOD_RELATORIO_CONSULTA: TIntegerField
      FieldName = 'COD_RELATORIO_CONSULTA'
      Required = True
    end
    object QCamposCodDESC_CAMPO: TStringField
      FieldName = 'DESC_CAMPO'
      Required = True
      Size = 150
    end
    object QCamposCodDESC_TITULO: TStringField
      FieldName = 'DESC_TITULO'
      Size = 150
    end
    object QCamposCodNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
      Required = True
    end
    object QCamposCodNUM_LARGURA: TIntegerField
      FieldName = 'NUM_LARGURA'
      Required = True
    end
    object QCamposCodDESC_ALINHAMENTO: TStringField
      FieldName = 'DESC_ALINHAMENTO'
      Required = True
      Size = 150
    end
  end
  object QRelCod: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  R.*'
      'FROM'
      '  TB_RELATORIO_CONSULTA R'
      'WHERE'
      '  R.COD_RELATORIO_CONSULTA = :COD_RELATORIO_CONSULTA')
    Variables.Data = {
      0300000001000000170000003A434F445F52454C41544F52494F5F434F4E5355
      4C5441030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000900000016000000434F445F52454C41544F52494F5F434F4E53554C
      54410100000000000B000000444553435F544954554C4F0100000000000B0000
      00434F445F5553554152494F01000000000009000000444553435F54454C4101
      00000000000D000000494E445F444154415F484F524101000000000011000000
      494E445F4E554D45524F5F504147494E410100000000000B000000494E445F50
      55424C49434F0100000000000A000000494E445F544954554C4F010000000000
      0E000000494E445F4F5249454E544143414F010000000000}
    Session = DMOracle.DBCemapa
    Left = 120
    Top = 56
    object QRelCodCOD_RELATORIO_CONSULTA: TIntegerField
      FieldName = 'COD_RELATORIO_CONSULTA'
      Required = True
    end
    object QRelCodDESC_TELA: TStringField
      FieldName = 'DESC_TELA'
      Required = True
      Size = 150
    end
    object QRelCodDESC_TITULO: TStringField
      FieldName = 'DESC_TITULO'
      Required = True
      Size = 250
    end
    object QRelCodCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
    object QRelCodIND_DATA_HORA: TStringField
      FieldName = 'IND_DATA_HORA'
      Required = True
      Size = 1
    end
    object QRelCodIND_NUMERO_PAGINA: TStringField
      FieldName = 'IND_NUMERO_PAGINA'
      Required = True
      Size = 1
    end
    object QRelCodIND_PUBLICO: TStringField
      FieldName = 'IND_PUBLICO'
      Required = True
      Size = 1
    end
    object QRelCodIND_TITULO: TStringField
      FieldName = 'IND_TITULO'
      Required = True
      Size = 1
    end
    object QRelCodIND_ORIENTACAO: TStringField
      FieldName = 'IND_ORIENTACAO'
      Size = 10
    end
  end
  object QRelTelaPublico: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  R.*'
      'FROM'
      '  TB_RELATORIO_CONSULTA R'
      'WHERE'
      '  R.DESC_TELA = :DESC_TELA'
      'AND'
      '  (R.COD_USUARIO = :COD_USUARIO OR R.IND_PUBLICO = '#39'S'#39')')
    Variables.Data = {
      03000000020000000A0000003A444553435F54454C4105000000000000000000
      00000C0000003A434F445F5553554152494F030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000800000016000000434F445F52454C41544F52494F5F434F4E53554C
      54410100000000000B000000444553435F544954554C4F0100000000000B0000
      00434F445F5553554152494F01000000000009000000444553435F54454C4101
      00000000000D000000494E445F444154415F484F524101000000000011000000
      494E445F4E554D45524F5F504147494E410100000000000B000000494E445F50
      55424C49434F0100000000000A000000494E445F544954554C4F010000000000}
    Session = DMOracle.DBCemapa
    Left = 24
    Top = 104
    object QRelTelaPublicoCOD_RELATORIO_CONSULTA: TIntegerField
      FieldName = 'COD_RELATORIO_CONSULTA'
      Required = True
    end
    object QRelTelaPublicoDESC_TELA: TStringField
      FieldName = 'DESC_TELA'
      Required = True
      Size = 150
    end
    object QRelTelaPublicoDESC_TITULO: TStringField
      FieldName = 'DESC_TITULO'
      Required = True
      Size = 250
    end
    object QRelTelaPublicoCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
    object QRelTelaPublicoIND_DATA_HORA: TStringField
      FieldName = 'IND_DATA_HORA'
      Required = True
      Size = 1
    end
    object QRelTelaPublicoIND_NUMERO_PAGINA: TStringField
      FieldName = 'IND_NUMERO_PAGINA'
      Required = True
      Size = 1
    end
    object QRelTelaPublicoIND_PUBLICO: TStringField
      FieldName = 'IND_PUBLICO'
      Required = True
      Size = 1
    end
    object QRelTelaPublicoIND_TITULO: TStringField
      FieldName = 'IND_TITULO'
      Required = True
      Size = 1
    end
  end
end
