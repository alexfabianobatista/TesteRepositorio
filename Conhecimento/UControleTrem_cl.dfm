object DMControleTrem: TDMControleTrem
  OldCreateOrder = False
  Left = 391
  Top = 113
  Height = 255
  Width = 346
  object QControleTrem: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_FLUXO_TREM.*'
      'FROM'
      '  TB_FLUXO_TREM'
      'WHERE'
      '  TB_FLUXO_TREM.COD_FLUXO_TREM = :PK'
      '')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_FLUXO_TREM'
    SequenceField.Sequence = 'SQCONTROLETREM'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      04000000120000000E000000434F445F464C55584F5F5452454D010000000000
      0A000000444553435F464C55584F0100000000000900000044545F41434F5244
      4F0100000000000A000000434F445F46494C49414C0100000000000B00000043
      4F445F50524F4455544F0100000000001300000056414C5F5441524946415F54
      4F4E454C4144410100000000000D00000051545F5155414E5449444144450100
      0000000019000000434F445F434144415354524F5F44455354494E4154415249
      4F0100000000000B000000434F445F5553554152494F0100000000000A000000
      44545F5553554152494F0100000000000A000000434F445F4D4F5449564F0100
      0000000013000000434F445F434144415354524F5F4F524947454D0100000000
      000C000000434F445F4F5045524143414F0100000000000E000000434F445F54
      52494255544143414F01000000000009000000494E445F4D4F44414C01000000
      00000C000000494E445F534954554143414F0100000000001700000051545F51
      55414E5449444144455F43414E43454C41444101000000000010000000434F44
      5F50524F4455544F5F4E4F5441010000000000}
    RefreshOptions = [roBeforeEdit, roAllFields]
    Session = DMOracle.DBCemapa
    BeforePost = QControleTremBeforePost
    AfterPost = QControleTremAfterPost
    OnCalcFields = QControleTremCalcFields
    Left = 40
    Top = 16
    object QControleTremCOD_FLUXO_TREM: TIntegerField
      FieldName = 'COD_FLUXO_TREM'
      Required = True
    end
    object QControleTremDT_ACORDO: TDateTimeField
      FieldName = 'DT_ACORDO'
      Required = True
      EditMask = '!99/99/##00;1;_'
    end
    object QControleTremCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QControleTremCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QControleTremVAL_TARIFA_TONELADA: TFloatField
      FieldName = 'VAL_TARIFA_TONELADA'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object QControleTremQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
      Required = True
      DisplayFormat = '#,##0'
    end
    object QControleTremCOD_CADASTRO_DESTINATARIO: TIntegerField
      FieldName = 'COD_CADASTRO_DESTINATARIO'
      Required = True
    end
    object QControleTremCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Required = True
    end
    object QControleTremDT_USUARIO: TDateTimeField
      FieldName = 'DT_USUARIO'
    end
    object QControleTremCOD_MOTIVO: TIntegerField
      FieldName = 'COD_MOTIVO'
    end
    object QControleTremCOD_CADASTRO_ORIGEM: TIntegerField
      DisplayLabel = 'Origem'
      FieldName = 'COD_CADASTRO_ORIGEM'
    end
    object QControleTremCOD_OPERACAO: TIntegerField
      DisplayLabel = 'Opera'#231#227'o'
      FieldName = 'COD_OPERACAO'
    end
    object QControleTremCOD_TRIBUTACAO: TIntegerField
      DisplayLabel = 'Tributa'#231#227'o'
      FieldName = 'COD_TRIBUTACAO'
    end
    object QControleTremIND_MODAL: TStringField
      DisplayLabel = 'Modal'
      FieldName = 'IND_MODAL'
      Size = 5
    end
    object QControleTremcidade_origem: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'cidade_origem'
      Calculated = True
    end
    object QControleTremcidade_destino: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'cidade_destino'
      Calculated = True
    end
    object QControleTremDESC_FLUXO: TStringField
      DisplayLabel = 'Nr. Fluxo'
      FieldName = 'DESC_FLUXO'
      Required = True
      Size = 50
    end
    object QControleTremIND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Size = 1
    end
    object QControleTremQT_QUANTIDADE_CANCELADA: TFloatField
      DisplayLabel = 'Quantidade Cancelada'
      FieldName = 'QT_QUANTIDADE_CANCELADA'
    end
  end
  object QControleTremCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_FLUXO_TREM.*,'
      '  TB_CADASTRO.NOME,'
      '  TB_PRODUTO.DESC_PRODUTO'
      'FROM'
      '  TB_FLUXO_TREM,'
      '  TB_PRODUTO,'
      '  TB_CADASTRO'
      'WHERE'
      
        '  TB_CADASTRO.COD_CADASTRO = TB_FLUXO_TREM.COD_CADASTRO_DESTINAT' +
        'ARIO'
      '  AND'
      '  TB_FLUXO_TREM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '  AND'
      '  (:COD_PRODUTO IS NULL'
      '    OR'
      '    TB_FLUXO_TREM.COD_PRODUTO = :COD_PRODUTO)'
      '  AND'
      '  (:COD_FILIAL IS NULL'
      '    OR'
      '    TB_FLUXO_TREM.COD_FILIAL = :COD_FILIAL)'
      '  AND'
      '  (:DESC_FLUXO IS NULL'
      '    OR'
      '    TB_FLUXO_TREM.DESC_FLUXO = :DESC_FLUXO)'
      '  AND'
      '  (:COD_DESTINATARIO IS NULL'
      '   OR'
      
        '     TB_FLUXO_TREM.COD_CADASTRO_DESTINATARIO = :COD_DESTINATARIO' +
        ')'
      '  AND'
      '  (:COD_ORIGEM IS NULL'
      '   OR'
      '     TB_FLUXO_TREM.COD_CADASTRO_ORIGEM = :COD_ORIGEM)'
      '  AND'
      '  (:MODAL IS NULL'
      '   OR'
      '    TB_FLUXO_TREM.IND_MODAL = :MODAL)'
      '  AND'
      '  TB_FLUXO_TREM.DT_ACORDO >= :DATA_I'
      '  AND'
      '  TB_FLUXO_TREM.DT_ACORDO <= :DATA_F'
      'ORDER BY'
      '  DESC_FLUXO')
    Variables.Data = {
      0300000008000000070000003A444154415F490C000000000000000000000007
      0000003A444154415F460C00000000000000000000000C0000003A434F445F50
      524F4455544F0500000000000000000000000B0000003A434F445F46494C4941
      4C0500000000000000000000000B0000003A444553435F464C55584F05000000
      0000000000000000110000003A434F445F44455354494E41544152494F050000
      0000000000000000000B0000003A434F445F4F524947454D0300000000000000
      00000000060000003A4D4F44414C6100000002000000310000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000130000000E000000434F445F464C55584F5F5452454D010000000000
      0A000000444553435F464C55584F0100000000000900000044545F41434F5244
      4F0100000000000A000000434F445F46494C49414C0100000000000B00000043
      4F445F50524F4455544F0100000000001300000056414C5F5441524946415F54
      4F4E454C4144410100000000000D00000051545F5155414E5449444144450100
      0000000019000000434F445F434144415354524F5F44455354494E4154415249
      4F0100000000000B000000434F445F5553554152494F0100000000000A000000
      44545F5553554152494F0100000000000A000000434F445F4D4F5449564F0100
      00000000040000004E4F4D450100000000000C000000444553435F50524F4455
      544F01000000000013000000434F445F434144415354524F5F4F524947454D01
      00000000000C000000434F445F4F5045524143414F0100000000000E00000043
      4F445F5452494255544143414F01000000000009000000494E445F4D4F44414C
      0100000000000C000000494E445F534954554143414F01000000000017000000
      51545F5155414E5449444144455F43414E43454C414441010000000000}
    Session = DMOracle.DBCemapa
    Left = 40
    Top = 80
    object QControleTremConsCOD_FLUXO_TREM: TIntegerField
      DisplayLabel = 'Fluxo'
      FieldName = 'COD_FLUXO_TREM'
      Required = True
    end
    object QControleTremConsDT_ACORDO: TDateTimeField
      DisplayLabel = 'Dt. Acordo'
      FieldName = 'DT_ACORDO'
      Required = True
    end
    object QControleTremConsCOD_FILIAL: TIntegerField
      DisplayLabel = 'Filial'
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QControleTremConsCOD_PRODUTO: TIntegerField
      DisplayLabel = 'Produto'
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QControleTremConsVAL_TARIFA_TONELADA: TFloatField
      DisplayLabel = 'Tarifa'
      FieldName = 'VAL_TARIFA_TONELADA'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object QControleTremConsQT_QUANTIDADE: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QT_QUANTIDADE'
      Required = True
      DisplayFormat = '#,##0'
    end
    object QControleTremConsCOD_CADASTRO_DESTINATARIO: TIntegerField
      DisplayLabel = 'Destino'
      FieldName = 'COD_CADASTRO_DESTINATARIO'
      Required = True
    end
    object QControleTremConsCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Required = True
    end
    object QControleTremConsDT_USUARIO: TDateTimeField
      FieldName = 'DT_USUARIO'
    end
    object QControleTremConsCOD_MOTIVO: TIntegerField
      FieldName = 'COD_MOTIVO'
    end
    object QControleTremConsNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object QControleTremConsDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
    object QControleTremConsDESC_FLUXO: TStringField
      DisplayLabel = 'Num. Fluxo'
      FieldName = 'DESC_FLUXO'
      Required = True
      Size = 50
    end
    object QControleTremConsCOD_CADASTRO_ORIGEM: TIntegerField
      DisplayLabel = 'Origem'
      FieldName = 'COD_CADASTRO_ORIGEM'
    end
    object QControleTremConsCOD_OPERACAO: TIntegerField
      FieldName = 'COD_OPERACAO'
    end
    object QControleTremConsCOD_TRIBUTACAO: TIntegerField
      FieldName = 'COD_TRIBUTACAO'
    end
    object QControleTremConsIND_MODAL: TStringField
      DisplayLabel = 'Modal'
      FieldName = 'IND_MODAL'
      Size = 5
    end
    object QControleTremConsIND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Size = 1
    end
    object QControleTremConsQT_QUANTIDADE_CANCELADA: TFloatField
      FieldName = 'QT_QUANTIDADE_CANCELADA'
    end
  end
  object QRControleTrem: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_CONTROLE_TREM.COD_CONTROLE_TREM,'
      '  TB_CONTROLE_TREM.COD_REMETENTE,'
      '  TB_CONTROLE_TREM.COD_DESTINATARIO,'
      '  TB_PAGAMENTO_TREM.COD_EMPRESA,'
      '  TB_PAGAMENTO_TREM.NUM_FATURA,'
      '  TB_PAGAMENTO_TREM.NUM_DESPACHO,'
      '  TB_PAGAMENTO_TREM.VAL_TON,'
      '  TB_PAGAMENTO_TREM.DT_VENCIMENTO,'
      '  TB_CONTROLE_TREM.NUM_VAGAO,'
      '  TB_CONTROLE_TREM.DT_CONTROLE,'
      '  TB_FILIAL.DESC_FILIAL,'
      '  TB_NOTA_TREM.COD_NOTA,'
      '  T1.NOME REMETENTE,'
      '  T2.NOME DESTINATARIO,'
      '  SUM(TB_NOTA_ITEM.QT_CHEGADA) PESO_CHEGADA,'
      '  SUM(TB_NOTA_ITEM.QT_QUANTIDADE) PESO_SAIDA,'
      
        '  SUM(TB_NOTA_ITEM.QT_QUANTIDADE) - SUM(TB_NOTA_ITEM.QT_CHEGADA)' +
        ' DIF_PESO,'
      
        '  ((SUM(TB_NOTA_ITEM.QT_QUANTIDADE) - SUM(TB_NOTA_ITEM.QT_CHEGAD' +
        'A)) * 100) / SUM(TB_NOTA_ITEM.QT_QUANTIDADE) PERC_VAR '
      'FROM'
      '  TB_CONTROLE_TREM,'
      '  TB_PAGAMENTO_TREM,'
      '  TB_NOTA_TREM,'
      '  TB_FILIAL,'
      '  TB_NOTA_ITEM,'
      '  TB_CADASTRO T1,'
      '  TB_CADASTRO T2'
      'WHERE'
      
        '  TB_CONTROLE_TREM.COD_CONTROLE_TREM = TB_PAGAMENTO_TREM.COD_CON' +
        'TROLE_TREM'
      '  AND'
      
        '  TB_CONTROLE_TREM.COD_CONTROLE_TREM = TB_NOTA_TREM.COD_CONTROLE' +
        '_TREM'
      '  AND'
      '  TB_NOTA_TREM.COD_NOTA = TB_NOTA_ITEM.COD_NOTA_CAB'
      '  AND'
      '  TB_PAGAMENTO_TREM.COD_EMPRESA = TB_FILIAL.COD_FILIAL'
      '  AND'
      '  T1.COD_CADASTRO = TB_CONTROLE_TREM.COD_REMETENTE'
      '  AND'
      '  T2.COD_CADASTRO = TB_CONTROLE_TREM.COD_DESTINATARIO'
      '  AND'
      '  (:REMETENTE IS NULL'
      '    OR'
      '    T1.COD_CADASTRO = :REMETENTE)'
      '  AND'
      '  (:DESTINATARIO IS NULL'
      '    OR'
      '    T2.COD_CADASTRO = :DESTINATARIO)'
      '  AND'
      '  TB_CONTROLE_TREM.DT_CONTROLE BETWEEN :DATA_I AND :DATA_F'
      'GROUP BY'
      '  TB_CONTROLE_TREM.COD_CONTROLE_TREM,'
      '  TB_CONTROLE_TREM.COD_REMETENTE,'
      '  TB_CONTROLE_TREM.COD_DESTINATARIO,'
      '  TB_PAGAMENTO_TREM.COD_EMPRESA,'
      '  TB_PAGAMENTO_TREM.NUM_FATURA,'
      '  TB_PAGAMENTO_TREM.NUM_DESPACHO,'
      '  TB_PAGAMENTO_TREM.VAL_TON,'
      '  TB_PAGAMENTO_TREM.DT_VENCIMENTO,'
      '  TB_CONTROLE_TREM.NUM_VAGAO,'
      '  TB_CONTROLE_TREM.DT_CONTROLE,'
      '  TB_FILIAL.DESC_FILIAL,'
      '  TB_NOTA_TREM.COD_NOTA,'
      '  T1.NOME,'
      '  T2.NOME'
      'ORDER BY'
      '  COD_CONTROLE_TREM,'
      '  TB_NOTA_TREM.COD_NOTA'
      ''
      '')
    Variables.Data = {
      03000000040000000A0000003A52454D4554454E544503000000000000000000
      00000D0000003A44455354494E41544152494F03000000000000000000000007
      0000003A444154415F490C0000000000000000000000070000003A444154415F
      460C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001200000011000000434F445F434F4E54524F4C455F5452454D010000
      0000000D000000434F445F52454D4554454E544501000000000010000000434F
      445F44455354494E41544152494F010000000000090000004E554D5F56414741
      4F0100000000000B00000044545F434F4E54524F4C4501000000000008000000
      434F445F4E4F54410100000000000A0000005045534F5F534149444101000000
      00000C0000005045534F5F434845474144410100000000000B000000434F445F
      454D50524553410100000000000A0000004E554D5F4641545552410100000000
      000C0000004E554D5F444553504143484F0100000000000700000056414C5F54
      4F4E0100000000000D00000044545F56454E43494D454E544F0100000000000B
      000000444553435F46494C49414C0100000000000900000052454D4554454E54
      450100000000000C00000044455354494E41544152494F010000000000080000
      004449465F5045534F01000000000008000000504552435F5641520100000000
      00}
    Session = DMOracle.DBCemapa
    Left = 144
    Top = 80
    object QRControleTremCOD_CONTROLE_TREM: TIntegerField
      FieldName = 'COD_CONTROLE_TREM'
      Required = True
    end
    object QRControleTremCOD_REMETENTE: TIntegerField
      FieldName = 'COD_REMETENTE'
    end
    object QRControleTremCOD_DESTINATARIO: TIntegerField
      FieldName = 'COD_DESTINATARIO'
    end
    object QRControleTremCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
    end
    object QRControleTremNUM_FATURA: TIntegerField
      FieldName = 'NUM_FATURA'
    end
    object QRControleTremNUM_DESPACHO: TIntegerField
      FieldName = 'NUM_DESPACHO'
    end
    object QRControleTremVAL_TON: TFloatField
      FieldName = 'VAL_TON'
    end
    object QRControleTremDT_VENCIMENTO: TDateTimeField
      FieldName = 'DT_VENCIMENTO'
    end
    object QRControleTremNUM_VAGAO: TIntegerField
      FieldName = 'NUM_VAGAO'
    end
    object QRControleTremDT_CONTROLE: TDateTimeField
      FieldName = 'DT_CONTROLE'
    end
    object QRControleTremDESC_FILIAL: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
    object QRControleTremCOD_NOTA: TIntegerField
      FieldName = 'COD_NOTA'
    end
    object QRControleTremREMETENTE: TStringField
      FieldName = 'REMETENTE'
      Required = True
      Size = 50
    end
    object QRControleTremDESTINATARIO: TStringField
      FieldName = 'DESTINATARIO'
      Required = True
      Size = 50
    end
    object QRControleTremPESO_CHEGADA: TFloatField
      FieldName = 'PESO_CHEGADA'
    end
    object QRControleTremPESO_SAIDA: TFloatField
      FieldName = 'PESO_SAIDA'
    end
    object QRControleTremDIF_PESO: TFloatField
      FieldName = 'DIF_PESO'
    end
    object QRControleTremPERC_VAR: TFloatField
      FieldName = 'PERC_VAR'
    end
  end
  object QVagao: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  COD_VAGAO,'
      '  NUM_VAGAO,'
      '  DT_VAGAO,'
      '  QT_QUANTIDADE,'
      '  QT_PESO_CHEGADA,'
      '  COD_FLUXO_TREM,'
      '  NUM_SERIE,'
      '  COD_USUARIO,'
      '  DT_USUARIO'
      'FROM'
      '  TB_VAGAO'
      ''
      'where cod_fluxo_trem = :cod_fluxo_trem')
    Variables.Data = {
      03000000010000000F0000003A434F445F464C55584F5F5452454D0300000000
      00000000000000}
    SequenceField.Field = 'COD_VAGAO'
    SequenceField.Sequence = 'SQCADASTRO_VAGAO'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000900000009000000434F445F564147414F010000000000090000004E
      554D5F564147414F0100000000000800000044545F564147414F010000000000
      0D00000051545F5155414E5449444144450100000000000F00000051545F5045
      534F5F434845474144410100000000000E000000434F445F464C55584F5F5452
      454D010000000000090000004E554D5F53455249450100000000000B00000043
      4F445F5553554152494F0100000000000A00000044545F5553554152494F0100
      00000000}
    Master = QControleTrem
    MasterFields = 'COD_FLUXO_TREM'
    DetailFields = 'COD_FLUXO_TREM'
    RefreshOptions = [roBeforeEdit, roAllFields]
    Session = DMOracle.DBCemapa
    Left = 144
    Top = 16
    object QVagaoCOD_VAGAO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_VAGAO'
      Required = True
    end
    object QVagaoDT_VAGAO: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DT_VAGAO'
      EditMask = '!99/99/0000;1;_'
    end
    object QVagaoQT_QUANTIDADE: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QT_QUANTIDADE'
    end
    object QVagaoQT_PESO_CHEGADA: TFloatField
      DisplayLabel = 'Peso Chegada'
      FieldName = 'QT_PESO_CHEGADA'
    end
    object QVagaoCOD_FLUXO_TREM: TIntegerField
      DisplayLabel = 'C'#243'digo Fluxo Trem'
      FieldName = 'COD_FLUXO_TREM'
    end
    object QVagaoCOD_USUARIO: TIntegerField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'COD_USUARIO'
    end
    object QVagaoDT_USUARIO: TDateTimeField
      DisplayLabel = 'Dt. Usu'#225'rio'
      FieldName = 'DT_USUARIO'
    end
    object F: TStringField
      DisplayLabel = 'S'#233'rie Vag'#227'o'
      FieldName = 'NUM_SERIE'
      Size = 15
    end
    object QVagaoNUM_VAGAO: TStringField
      DisplayLabel = 'Num. Vag'#227'o'
      FieldName = 'NUM_VAGAO'
      Size = 50
    end
  end
  object QVagaoItem: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_VAGAO_ITEM.COD_VAGAO_ITEM,'
      '  TB_VAGAO_ITEM.COD_VAGAO,'
      '  TB_VAGAO_ITEM.COD_NOTA,'
      '  TB_VAGAO_ITEM.QT_PESO_SAIDA,'
      '  TB_VAGAO_ITEM.QT_PESO_CHEGADA'
      'FROM'
      '  TB_VAGAO_ITEM'
      'where cod_vagao = :cod_vagao')
    Variables.Data = {
      03000000010000000A0000003A434F445F564147414F03000000000000000000
      0000}
    SequenceField.Field = 'COD_VAGAO_ITEM'
    SequenceField.Sequence = 'SQCADASTRO_VAGAO_ITEM'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      04000000050000000E000000434F445F564147414F5F4954454D010000000000
      09000000434F445F564147414F01000000000008000000434F445F4E4F544101
      00000000000D00000051545F5045534F5F53414944410100000000000F000000
      51545F5045534F5F43484547414441010000000000}
    Master = QVagao
    MasterFields = 'COD_VAGAO'
    DetailFields = 'COD_VAGAO'
    Session = DMOracle.DBCemapa
    AfterPost = QVagaoItemAfterPost
    AfterDelete = QVagaoItemAfterDelete
    OnCalcFields = QVagaoItemCalcFields
    Left = 232
    Top = 16
    object QVagaoItemCOD_VAGAO_ITEM: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_VAGAO_ITEM'
      Required = True
    end
    object QVagaoItemCOD_VAGAO: TIntegerField
      DisplayLabel = 'C'#243'd. Vag'#227'o'
      FieldName = 'COD_VAGAO'
      Required = True
    end
    object QVagaoItemCOD_NOTA: TIntegerField
      DisplayLabel = 'C'#243'digo Nota'
      FieldName = 'COD_NOTA'
    end
    object QVagaoItemQT_PESO_SAIDA: TFloatField
      DisplayLabel = 'P. Sa'#237'da'
      FieldName = 'QT_PESO_SAIDA'
    end
    object QVagaoItemQT_PESO_CHEGADA: TFloatField
      DisplayLabel = 'P. Chegada'
      FieldName = 'QT_PESO_CHEGADA'
    end
    object QVagaoItemnum_nota: TIntegerField
      DisplayLabel = 'Nr. Nota'
      FieldKind = fkCalculated
      FieldName = 'num_nota'
      Calculated = True
    end
    object QVagaoItemdt_emissao_nota: TDateField
      DisplayLabel = 'Dt. Emiss'#227'o'
      FieldKind = fkCalculated
      FieldName = 'dt_emissao_nota'
      Calculated = True
    end
    object QVagaoItemqt_quantidade_nota: TFloatField
      DisplayLabel = 'Quantidade'
      FieldKind = fkCalculated
      FieldName = 'qt_quantidade_nota'
      Calculated = True
    end
  end
  object QRVagaoNota: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_FLUXO_TREM.COD_FLUXO_TREM,'
      '  TB_FLUXO_TREM.DESC_FLUXO,'
      '  TB_FLUXO_TREM.DT_ACORDO,'
      '  TB_VAGAO.NUM_VAGAO,'
      '  TB_VAGAO.QT_QUANTIDADE,'
      '  TB_VAGAO.QT_PESO_CHEGADA AS QT_PESO_CHEGADA_VAGAO,'
      '  TB_VAGAO_ITEM.QT_PESO_SAIDA,'
      '  TB_VAGAO_ITEM.QT_PESO_CHEGADA,'
      '  TB_NOTA_CAB.NUM_NOTA,'
      '  TB_NOTA_CAB.DT_EMISSAO'
      'FROM'
      '  TB_FLUXO_TREM,'
      '  TB_VAGAO,'
      '  TB_VAGAO_ITEM,'
      '  TB_NOTA_CAB'
      'WHERE'
      '   TB_VAGAO.COD_VAGAO = TB_VAGAO_ITEM.COD_VAGAO(+)'
      '  AND'
      '   TB_VAGAO_ITEM.COD_NOTA = TB_NOTA_CAB.COD_NOTA_CAB(+)'
      '  AND'
      '   TB_FLUXO_TREM.COD_FLUXO_TREM = TB_VAGAO.COD_FLUXO_TREM'
      '  AND'
      '   (:COD_FLUXO IS NULL'
      '    OR'
      '    TB_FLUXO_TREM.COD_FLUXO_TREM = :COD_FLUXO)'
      '  AND'
      '   TB_VAGAO.DT_VAGAO >= :DATA_I'
      '  AND'
      '   TB_VAGAO.DT_VAGAO <= :DATA_F'
      'ORDER BY'
      '   TB_FLUXO_TREM.COD_FLUXO_TREM'
      ''
      '')
    Variables.Data = {
      0300000003000000070000003A444154415F490C000000000000000000000007
      0000003A444154415F460C00000000000000000000000A0000003A434F445F46
      4C55584F030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000A000000090000004E554D5F564147414F0100000000000D00000051
      545F5045534F5F53414944410100000000000F00000051545F5045534F5F4348
      4547414441010000000000080000004E554D5F4E4F54410100000000000A0000
      0044545F454D495353414F0100000000000E000000434F445F464C55584F5F54
      52454D0100000000000A000000444553435F464C55584F0100000000000D0000
      0051545F5155414E5449444144450100000000001500000051545F5045534F5F
      434845474144415F564147414F0100000000000900000044545F41434F52444F
      010000000000}
    Session = DMOracle.DBCemapa
    OnCalcFields = QRVagaoNotaCalcFields
    Left = 232
    Top = 80
    object QRVagaoNotaCOD_FLUXO_TREM: TIntegerField
      FieldName = 'COD_FLUXO_TREM'
      Required = True
    end
    object QRVagaoNotaQT_PESO_SAIDA: TFloatField
      FieldName = 'QT_PESO_SAIDA'
    end
    object QRVagaoNotaQT_PESO_CHEGADA: TFloatField
      FieldName = 'QT_PESO_CHEGADA'
    end
    object QRVagaoNotaNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
      Required = True
    end
    object QRVagaoNotaDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object QRVagaoNotaQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
    end
    object QRVagaoNotaQT_PESO_CHEGADA_VAGAO: TFloatField
      FieldName = 'QT_PESO_CHEGADA_VAGAO'
    end
    object QRVagaoNotadiferencapesonota: TFloatField
      FieldKind = fkCalculated
      FieldName = 'diferencapesonota'
      Calculated = True
    end
    object QRVagaoNotaDT_ACORDO: TDateTimeField
      FieldName = 'DT_ACORDO'
      Required = True
    end
    object QRVagaoNotadiferencapesovagao: TFloatField
      FieldKind = fkCalculated
      FieldName = 'diferencapesovagao'
      Calculated = True
    end
    object QRVagaoNotaDESC_FLUXO: TStringField
      FieldName = 'DESC_FLUXO'
      Required = True
      Size = 50
    end
    object QRVagaoNotaNUM_VAGAO: TStringField
      FieldName = 'NUM_VAGAO'
      Size = 50
    end
  end
  object QFluxoNota: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  QUANTIDADE,'
      '  QT_CHEGADA,'
      '  NOTA_CAB,'
      '  NUM_NOTA,'
      '  DT_EMISSAO,'
      '  COD_NOTA_ITEM'
      'FROM'
      '  (SELECT'
      '    SUM(TB_NOTA_ITEM.QT_QUANTIDADE) AS QUANTIDADE,'
      '    SUM(TB_NOTA_ITEM.QT_CHEGADA_TREM) AS QT_CHEGADA,'
      '    TB_NOTA_CAB.COD_NOTA_CAB AS NOTA_CAB,'
      '    TB_NOTA_CAB.NUM_NOTA AS NUM_NOTA,'
      '    TB_NOTA_CAB.DT_EMISSAO AS DT_EMISSAO,'
      '    TB_NOTA_ITEM.COD_NOTA_ITEM'
      '   FROM'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_FLUXO_TREM'
      '   WHERE'
      '    (TB_NOTA_CAB.COD_FLUXO_TREM = :FLUXO)'
      '    AND'
      '    TB_FLUXO_TREM.COD_FLUXO_TREM = TB_NOTA_CAB.COD_FLUXO_TREM'
      '    AND'
      '    TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_CAB'
      '  GROUP BY'
      '    TB_NOTA_CAB.DT_EMISSAO,'
      '    TB_NOTA_CAB.NUM_NOTA,'
      '    TB_NOTA_CAB.COD_NOTA_CAB,'
      '    TB_NOTA_ITEM.COD_NOTA_ITEM)'
      'WHERE'
      '  NOTA_CAB NOT IN '#9#9#9'('
      '                                    SELECT'
      
        '                                      TB_VAGAO_ITEM.COD_NOTA AS ' +
        'NOTA'
      '                                    FROM'
      '                                      TB_VAGAO_ITEM,'
      '                                      TB_VAGAO,'
      '                                      TB_FLUXO_TREM'
      '                                    WHERE'
      
        '                                      (TB_FLUXO_TREM.COD_FLUXO_T' +
        'REM = :FLUXO)'
      '                                      AND'
      
        '                                      TB_FLUXO_TREM.COD_FLUXO_TR' +
        'EM = TB_VAGAO.COD_FLUXO_TREM'
      '                                      AND'
      
        '                                      TB_VAGAO.COD_VAGAO = TB_VA' +
        'GAO_ITEM.COD_VAGAO'
      '                    )'
      '')
    Variables.Data = {0300000001000000060000003A464C55584F030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000006000000080000004E554D5F4E4F54410100000000000A0000004454
      5F454D495353414F0100000000000A0000005155414E54494441444501000000
      0000080000004E4F54415F4341420100000000000D000000434F445F4E4F5441
      5F4954454D0100000000000A00000051545F43484547414441010000000000}
    Session = DMOracle.DBCemapa
    OnCalcFields = QFluxoNotaCalcFields
    Left = 40
    Top = 144
    object QFluxoNotaQUANTIDADE: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE'
    end
    object QFluxoNotaNUM_NOTA: TIntegerField
      DisplayLabel = 'Nr. Nota'
      FieldName = 'NUM_NOTA'
      Required = True
    end
    object QFluxoNotaDT_EMISSAO: TDateTimeField
      DisplayLabel = 'Dt. Emiss'#227'o'
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object QFluxoNotaNOTA_CAB: TIntegerField
      FieldName = 'NOTA_CAB'
      Required = True
    end
    object QFluxoNotaqt_quantidade_nota: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'qt_quantidade_nota'
      Calculated = True
    end
    object QFluxoNotaCOD_NOTA_ITEM: TIntegerField
      FieldName = 'COD_NOTA_ITEM'
      Required = True
    end
    object QFluxoNotaQT_CHEGADA: TFloatField
      FieldName = 'QT_CHEGADA'
    end
  end
  object OPControleTrem: TOraclePackage
    Session = DMOracle.DBCemapa
    PackageName = 'PCK_CONHECIMENTO'
    Left = 144
    Top = 151
  end
end
