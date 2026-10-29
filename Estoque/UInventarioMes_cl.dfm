object DMInventarioMes: TDMInventarioMes
  OldCreateOrder = False
  Left = 449
  Top = 229
  Height = 222
  Width = 382
  object QInventarioMes_Cad: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Rowid,'
      '  Tb_Estoque_Inventario.*'
      'From'
      '  Tb_Estoque_Inventario'
      'Where'
      '  Cod_Estoque_Inventario = :PK'
      '')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_ESTOQUE_INVENTARIO'
    SequenceField.Sequence = 'SQ_ESTOQUE_INVENTARIO'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000A00000016000000434F445F4553544F5155455F494E56454E544152
      494F0100000000000A000000434F445F46494C49414C0100000000000B000000
      434F445F50524F4455544F0100000000000D000000434F445F4C4F54455F5449
      504F0100000000000E000000564C5F435553544F5F4D4544494F010000000000
      0D00000051545F5155414E544944414445010000000000070000004E554D5F41
      4E4F010000000000070000004E554D5F4D45530100000000000B00000044545F
      524547495354524F0100000000000B000000434F445F5553554152494F010000
      000000}
    Session = DMOracle.DBCemapa
    BeforePost = QInventarioMes_CadBeforePost
    Left = 40
    Top = 24
    object QInventarioMes_CadCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QInventarioMes_CadCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QInventarioMes_CadCOD_LOTE_TIPO: TIntegerField
      FieldName = 'COD_LOTE_TIPO'
      Required = True
    end
    object QInventarioMes_CadVL_CUSTO_MEDIO: TFloatField
      FieldName = 'VL_CUSTO_MEDIO'
      Required = True
    end
    object QInventarioMes_CadNUM_ANO: TIntegerField
      FieldName = 'NUM_ANO'
      Required = True
    end
    object QInventarioMes_CadNUM_MES: TIntegerField
      FieldName = 'NUM_MES'
      Required = True
    end
    object QInventarioMes_CadQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
      Required = True
    end
    object QInventarioMes_CadCOD_ESTOQUE_INVENTARIO: TIntegerField
      FieldName = 'COD_ESTOQUE_INVENTARIO'
      Required = True
    end
    object QInventarioMes_CadDT_REGISTRO: TDateTimeField
      FieldName = 'DT_REGISTRO'
    end
    object QInventarioMes_CadCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
  end
  object QInventarioMes_Cons: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '   Tb_Estoque_Inventario.*,'
      '   Tb_Produto.Desc_Produto,'
      '   tb_produto.ind_tipo_produto'
      'From'
      '  Tb_Estoque_Inventario,'
      '  Tb_Produto'
      'Where'
      '  Tb_Produto.COD_PRODUTO = Tb_Estoque_Inventario.COD_PRODUTO'
      '  And'
      '  (:Cod_Produto Is Null'
      '   Or'
      '    Tb_Estoque_Inventario.Cod_Produto = :Cod_Produto)'
      '  And'
      '  (:Cod_Lote_Tipo Is Null'
      '   Or'
      '    Tb_Estoque_Inventario.Cod_Lote_Tipo = :Cod_Lote_Tipo)'
      '  And'
      '  (:Cod_Filial Is Null'
      '   Or'
      '    Tb_Estoque_Inventario.Cod_Filial = :Cod_Filial)'
      '  And'
      '  (Tb_Estoque_Inventario.Num_Ano = :Num_Ano)'
      '  And'
      '  (Tb_Estoque_Inventario.Num_Mes = :Num_Mes)'
      'Order By'
      '  Tb_Estoque_Inventario.Cod_Produto'
      '')
    Variables.Data = {
      03000000050000000C0000003A434F445F50524F4455544F0300000000000000
      000000000B0000003A434F445F46494C49414C03000000000000000000000008
      0000003A4E554D5F414E4F030000000000000000000000080000003A4E554D5F
      4D45530300000000000000000000000E0000003A434F445F4C4F54455F544950
      4F030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000C00000016000000434F445F4553544F5155455F494E56454E544152
      494F0100000000000A000000434F445F46494C49414C0100000000000B000000
      434F445F50524F4455544F0100000000000D000000434F445F4C4F54455F5449
      504F0100000000000E000000564C5F435553544F5F4D4544494F010000000000
      0D00000051545F5155414E544944414445010000000000070000004E554D5F41
      4E4F010000000000070000004E554D5F4D45530100000000000C000000444553
      435F50524F4455544F01000000000010000000494E445F5449504F5F50524F44
      55544F0100000000000B00000044545F524547495354524F0100000000000B00
      0000434F445F5553554152494F010000000000}
    Session = DMOracle.DBCemapa
    Left = 160
    Top = 24
    object QInventarioMes_ConsCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QInventarioMes_ConsCOD_LOTE_TIPO: TIntegerField
      FieldName = 'COD_LOTE_TIPO'
      Required = True
    end
    object QInventarioMes_ConsVL_CUSTO_MEDIO: TFloatField
      FieldName = 'VL_CUSTO_MEDIO'
      Required = True
    end
    object QInventarioMes_ConsQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
      Required = True
    end
    object QInventarioMes_ConsNUM_ANO: TIntegerField
      FieldName = 'NUM_ANO'
      Required = True
    end
    object QInventarioMes_ConsNUM_MES: TIntegerField
      FieldName = 'NUM_MES'
      Required = True
    end
    object QInventarioMes_ConsDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
    object QInventarioMes_ConsCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QInventarioMes_ConsCOD_ESTOQUE_INVENTARIO: TIntegerField
      FieldName = 'COD_ESTOQUE_INVENTARIO'
      Required = True
    end
    object QInventarioMes_ConsIND_TIPO_PRODUTO: TStringField
      FieldName = 'IND_TIPO_PRODUTO'
      Required = True
      Size = 10
    end
    object QInventarioMes_ConsCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
  end
  object QRInventarioMes: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '   Tb_Estoque_Inventario.COD_ESTOQUE_INVENTARIO,'
      '   Tb_Estoque_Inventario.COD_FILIAL,'
      
        '   DECODE(:IND_CODIGO,'#39'FABRICANTE'#39',TB_PRODUTO.NUM_FABRICANTE, Tb' +
        '_Estoque_Inventario.COD_PRODUTO) AS COD_PRODUTO,'
      '   Tb_Estoque_Inventario.COD_LOTE_TIPO,'
      '   Tb_Estoque_Inventario.QT_QUANTIDADE,'
      '   Tb_Estoque_Inventario.NUM_ANO,'
      '   Tb_Estoque_Inventario.NUM_MES,'
      '   Tb_LOTE_TIPO.COD_LOTE_TIPO,'
      '   TB_LOTE_TIPO.DESC_LOTE,'
      
        '   Decode(IND_TIPO_PRODUTO,'#39'AGRICOLA'#39',Vl_Custo_Medio / Num_Embal' +
        'agem,Vl_Custo_Medio) AS Vl_Custo_Medio,'
      '   TB_PRODUTO.DESC_PRODUTO,'
      '   TB_PRODUTO.NUM_GENERO_NCM,'
      '   TB_PRODUTO.IND_SITUACAO,'
      '   TB_PRODUTO.DESC_UNIDADE,'
      '   tb_estoque_inventario.cod_usuario'
      'From'
      '  Tb_Estoque_Inventario,'
      '  Tb_Produto,'
      '  TB_CLASSE,'
      '  TB_LOTE_TIPO'
      'Where'
      '  Tb_Produto.COD_PRODUTO = Tb_Estoque_Inventario.COD_PRODUTO'
      '  And'
      '  ( TB_PRODUTO.COD_CLASSE = TB_CLASSE.COD_CLASSE )'
      '  AND'
      '  (:Cod_Filial Is Null'
      '   Or'
      '    Tb_Estoque_Inventario.Cod_Filial = :Cod_Filial)'
      '  AND'
      
        '    TB_ESTOQUE_INVENTARIO.COD_LOTE_TIPO = TB_LOTE_TIPO.COD_LOTE_' +
        'TIPO'
      '  AND'
      '  (:COD_LOTE_TIPO Is Null'
      '   Or'
      '    Tb_Estoque_Inventario.COD_LOTE_TIPO = :COD_LOTE_TIPO)'
      '  AND'
      '  ((:NCM IS NULL)'
      '  OR (:NCM = TB_PRODUTO.NUM_GENERO_NCM))'
      '  And'
      '  (Tb_Estoque_Inventario.Num_Ano = :Num_Ano)'
      '  And'
      '  (Tb_Estoque_Inventario.Num_Mes = :Num_Mes)'
      '  AND'
      '  :CLASSE_INICIAL'
      '  AND'
      '  ((:SITUACAO IS NULL)'
      '  OR'
      '  (TB_PRODUTO.IND_SITUACAO = :SITUACAO))'
      '  AND'
      '  :ESTOQUE'
      '  AND'
      '  ((:TIPO IS NULL)'
      '  OR'
      '  (TB_PRODUTO.IND_TIPO_PRODUTO = :TIPO))'
      'ORDER BY  TB_ESTOQUE_INVENTARIO.COD_PRODUTO')
    Variables.Data = {
      030000000A0000000B0000003A434F445F46494C49414C030000000000000000
      000000080000003A4E554D5F414E4F030000000000000000000000080000003A
      4E554D5F4D45530300000000000000000000000F0000003A434C415353455F49
      4E494349414C0100000004000000313D310000000000040000003A4E434D0500
      000000000000000000000B0000003A494E445F434F4449474F05000000080000
      0053495354454D410000000000090000003A534954554143414F050000000000
      000000000000050000003A5449504F0500000002000000310000000000080000
      003A4553544F5155450100000000000000000000000E0000003A434F445F4C4F
      54455F5449504F030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000F00000016000000434F445F4553544F5155455F494E56454E544152
      494F0100000000000A000000434F445F46494C49414C0100000000000B000000
      434F445F50524F4455544F0100000000000D000000434F445F4C4F54455F5449
      504F0100000000000E000000564C5F435553544F5F4D4544494F010000000000
      0D00000051545F5155414E544944414445010000000000070000004E554D5F41
      4E4F010000000000070000004E554D5F4D45530100000000000C000000444553
      435F50524F4455544F0100000000000E0000004E554D5F47454E45524F5F4E43
      4D0100000000000C000000494E445F534954554143414F0100000000000F0000
      00434F445F4C4F54455F5449504F5F3101000000000009000000444553435F4C
      4F54450100000000000C000000444553435F554E49444144450100000000000B
      000000434F445F5553554152494F010000000000}
    Session = DMOracle.DBCemapa
    Left = 272
    Top = 24
    object QRInventarioMesCOD_ESTOQUE_INVENTARIO: TIntegerField
      FieldName = 'COD_ESTOQUE_INVENTARIO'
      Required = True
    end
    object QRInventarioMesCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QRInventarioMesCOD_LOTE_TIPO: TIntegerField
      FieldName = 'COD_LOTE_TIPO'
      Required = True
    end
    object QRInventarioMesVL_CUSTO_MEDIO: TFloatField
      FieldName = 'VL_CUSTO_MEDIO'
      Required = True
    end
    object QRInventarioMesQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
      Required = True
    end
    object QRInventarioMesNUM_ANO: TIntegerField
      FieldName = 'NUM_ANO'
      Required = True
    end
    object QRInventarioMesNUM_MES: TIntegerField
      FieldName = 'NUM_MES'
      Required = True
    end
    object QRInventarioMesDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
    object QRInventarioMesNUM_GENERO_NCM: TStringField
      FieldName = 'NUM_GENERO_NCM'
      Size = 8
    end
    object QRInventarioMesCOD_PRODUTO: TStringField
      FieldName = 'COD_PRODUTO'
      Size = 40
    end
    object QRInventarioMesIND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Size = 15
    end
    object QRInventarioMesDESC_UNIDADE: TStringField
      FieldName = 'DESC_UNIDADE'
      Size = 3
    end
    object QRInventarioMesCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
  end
end
