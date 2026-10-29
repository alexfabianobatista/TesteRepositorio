object DMProdutoSkyhub: TDMProdutoSkyhub
  OldCreateOrder = False
  Left = 489
  Top = 193
  Height = 439
  Width = 530
  object QProdutoSkyhub: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID, '
      '  TB_PRODUTO_SKYHUB.*'
      'FROM '
      '   TB_PRODUTO_SKYHUB'
      'WHERE'
      '  TB_PRODUTO_SKYHUB.COD_PRODUTO_SKYHUB = :PK')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_PRODUTO_SKYHUB'
    SequenceField.Sequence = 'SQPRODUTO_SKYHUB'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000002D00000012000000434F445F50524F4455544F5F534B594855420100
      000000000B000000434F445F50524F4455544F0100000000000C000000444553
      435F50524F4455544F0100000000000B000000444553435F5354415455530100
      000000000A00000056414C5F414C545552410100000000000B00000056414C5F
      4C4152475552410100000000000F00000056414C5F434F4D5052494D454E544F
      0100000000000A000000444553435F4D4152434101000000000016000000434F
      445F50524F4455544F5F534B594855425F5041490100000000000E0000004445
      53435F43415445474F52494101000000000012000000444553435F4C494E4B5F
      494D4147454D5F3101000000000012000000444553435F4C494E4B5F494D4147
      454D5F3201000000000012000000444553435F4C494E4B5F494D4147454D5F33
      01000000000012000000444553435F4C494E4B5F494D4147454D5F3401000000
      00000F0000004553505F414C494D454E544143414F0100000000001800000045
      53505F41504152454C484F53434F4D5041544956454953010000000000170000
      004553505F434F4E544555444F4441454D42414C4147454D0100000000000700
      00004553505F434F520100000000001D0000004553505F4441544144454C414E
      43414D454E544F4E4F4D45524341444F010000000000140000004553505F4449
      4D454E534F455350524F4455544F0100000000000E0000004553505F46414252
      4943414E5445010000000000180000004553505F474152414E5449414445464F
      524E454345444F52010000000000130000004553505F4D414953494E464F524D
      41434F45530100000000000A0000004553505F4D414E55414C01000000000016
      0000004553505F4D4154455249414C434F4D504F534943414F0100000000000A
      0000004553505F4D4F44454C4F0100000000001E0000004553505F5045534F4C
      49514441454D42414C4147454D4350524F4455544F0100000000001400000045
      53505F5045534F4C4951444F50524F4455544F0100000000001B000000455350
      5F5245435552534F5346554E43494F4E414C4944414445530100000000001600
      00004553505F5245464552454E434941444F4D4F44454C4F0100000000000700
      00004553505F5341430100000000000B0000004553505F54414D414E484F0100
      00000000090000004553505F564944454F0100000000000C0000004553505F56
      4F4C544147454D0100000000000800000056414C5F5045534F01000000000010
      000000434F445F43415445474F5249415F4D4C01000000000008000000494D41
      47454D5F3100000000000008000000494D4147454D5F32000000000000080000
      00494D4147454D5F3300000000000008000000494D4147454D5F340000000000
      001B000000444553435F494E464F524D41434F45535F41444943494F4E414953
      00000000000013000000444553435F434F4E4558414F5F534B59485542010000
      0000000F000000444553435F434F4E4558414F5F4D4C01000000000015000000
      44545F415455414C495A4143414F5F534B594855420100000000001100000044
      545F415455414C495A4143414F5F4D4C010000000000}
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    AfterOpen = QProdutoSkyhubAfterOpen
    AfterInsert = QProdutoSkyhubAfterInsert
    BeforePost = QProdutoSkyhubBeforePost
    AfterPost = QProdutoSkyhubAfterPost
    AfterCancel = QProdutoSkyhubAfterCancel
    BeforeDelete = QProdutoSkyhubBeforeDelete
    AfterDelete = QProdutoSkyhubAfterDelete
    OnCalcFields = QProdutoSkyhubCalcFields
    Left = 48
    Top = 32
    object QProdutoSkyhubdesc_situacao: TStringField
      DisplayWidth = 100
      FieldKind = fkCalculated
      FieldName = 'desc_situacao'
      Size = 100
      Calculated = True
    end
    object QProdutoSkyhubdesc_cor_situacao: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_cor_situacao'
      Calculated = True
    end
    object QProdutoSkyhubCOD_PRODUTO_SKYHUB: TFloatField
      FieldName = 'COD_PRODUTO_SKYHUB'
      Required = True
    end
    object QProdutoSkyhubCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QProdutoSkyhubDESC_PRODUTO: TStringField
      DisplayWidth = 60
      FieldName = 'DESC_PRODUTO'
      Size = 60
    end
    object QProdutoSkyhubDESC_STATUS: TStringField
      FieldName = 'DESC_STATUS'
      Size = 10
    end
    object QProdutoSkyhubDESC_MARCA: TStringField
      FieldName = 'DESC_MARCA'
      Size = 15
    end
    object QProdutoSkyhubVAL_ALTURA: TFloatField
      FieldName = 'VAL_ALTURA'
    end
    object QProdutoSkyhubVAL_LARGURA: TFloatField
      FieldName = 'VAL_LARGURA'
    end
    object QProdutoSkyhubVAL_COMPRIMENTO: TFloatField
      FieldName = 'VAL_COMPRIMENTO'
    end
    object QProdutoSkyhubCOD_PRODUTO_SKYHUB_PAI: TFloatField
      FieldName = 'COD_PRODUTO_SKYHUB_PAI'
    end
    object QProdutoSkyhubDESC_CATEGORIA: TStringField
      FieldName = 'DESC_CATEGORIA'
      Size = 150
    end
    object QProdutoSkyhubDESC_LINK_IMAGEM_1: TStringField
      FieldName = 'DESC_LINK_IMAGEM_1'
      Size = 200
    end
    object QProdutoSkyhubDESC_LINK_IMAGEM_2: TStringField
      FieldName = 'DESC_LINK_IMAGEM_2'
      Size = 200
    end
    object QProdutoSkyhubDESC_LINK_IMAGEM_3: TStringField
      FieldName = 'DESC_LINK_IMAGEM_3'
      Size = 200
    end
    object QProdutoSkyhubDESC_LINK_IMAGEM_4: TStringField
      FieldName = 'DESC_LINK_IMAGEM_4'
      Size = 200
    end
    object QProdutoSkyhubESP_ALIMENTACAO: TStringField
      FieldName = 'ESP_ALIMENTACAO'
      Size = 30
    end
    object QProdutoSkyhubESP_APARELHOSCOMPATIVEIS: TStringField
      FieldName = 'ESP_APARELHOSCOMPATIVEIS'
      Size = 30
    end
    object QProdutoSkyhubESP_CONTEUDODAEMBALAGEM: TStringField
      FieldName = 'ESP_CONTEUDODAEMBALAGEM'
      Size = 30
    end
    object QProdutoSkyhubESP_COR: TStringField
      FieldName = 'ESP_COR'
      Size = 30
    end
    object QProdutoSkyhubESP_DATADELANCAMENTONOMERCADO: TStringField
      FieldName = 'ESP_DATADELANCAMENTONOMERCADO'
      Size = 30
    end
    object QProdutoSkyhubESP_DIMENSOESPRODUTO: TStringField
      FieldName = 'ESP_DIMENSOESPRODUTO'
      Size = 30
    end
    object QProdutoSkyhubESP_FABRICANTE: TStringField
      FieldName = 'ESP_FABRICANTE'
      Size = 30
    end
    object QProdutoSkyhubESP_GARANTIADEFORNECEDOR: TStringField
      FieldName = 'ESP_GARANTIADEFORNECEDOR'
      Size = 30
    end
    object QProdutoSkyhubESP_MAISINFORMACOES: TStringField
      FieldName = 'ESP_MAISINFORMACOES'
      Size = 30
    end
    object QProdutoSkyhubESP_MANUAL: TStringField
      FieldName = 'ESP_MANUAL'
      Size = 30
    end
    object QProdutoSkyhubESP_MATERIALCOMPOSICAO: TStringField
      FieldName = 'ESP_MATERIALCOMPOSICAO'
      Size = 30
    end
    object QProdutoSkyhubESP_MODELO: TStringField
      FieldName = 'ESP_MODELO'
      Size = 30
    end
    object QProdutoSkyhubESP_PESOLIQDAEMBALAGEMCPRODUTO: TStringField
      FieldName = 'ESP_PESOLIQDAEMBALAGEMCPRODUTO'
      Size = 30
    end
    object QProdutoSkyhubESP_PESOLIQDOPRODUTO: TStringField
      FieldName = 'ESP_PESOLIQDOPRODUTO'
      Size = 30
    end
    object QProdutoSkyhubESP_RECURSOSFUNCIONALIDADES: TStringField
      FieldName = 'ESP_RECURSOSFUNCIONALIDADES'
      Size = 30
    end
    object QProdutoSkyhubESP_REFERENCIADOMODELO: TStringField
      FieldName = 'ESP_REFERENCIADOMODELO'
      Size = 30
    end
    object QProdutoSkyhubESP_SAC: TStringField
      FieldName = 'ESP_SAC'
      Size = 30
    end
    object QProdutoSkyhubESP_TAMANHO: TStringField
      FieldName = 'ESP_TAMANHO'
      Size = 30
    end
    object QProdutoSkyhubESP_VIDEO: TStringField
      FieldName = 'ESP_VIDEO'
      Size = 30
    end
    object QProdutoSkyhubESP_VOLTAGEM: TStringField
      FieldName = 'ESP_VOLTAGEM'
      Size = 30
    end
    object QProdutoSkyhubVAL_PESO: TFloatField
      FieldName = 'VAL_PESO'
    end
    object QProdutoSkyhubCOD_CATEGORIA_ML: TStringField
      FieldName = 'COD_CATEGORIA_ML'
      Size = 10
    end
    object QProdutoSkyhubIMAGEM_1: TBlobField
      FieldName = 'IMAGEM_1'
      BlobType = ftOraBlob
    end
    object QProdutoSkyhubIMAGEM_2: TBlobField
      FieldName = 'IMAGEM_2'
      BlobType = ftOraBlob
    end
    object QProdutoSkyhubIMAGEM_3: TBlobField
      FieldName = 'IMAGEM_3'
      BlobType = ftOraBlob
    end
    object QProdutoSkyhubIMAGEM_4: TBlobField
      FieldName = 'IMAGEM_4'
      BlobType = ftOraBlob
    end
    object QProdutoSkyhubDESC_INFORMACOES_ADICIONAIS: TMemoField
      FieldName = 'DESC_INFORMACOES_ADICIONAIS'
      BlobType = ftOraClob
    end
    object QProdutoSkyhubDT_ATUALIZACAO_SKYHUB: TDateTimeField
      FieldName = 'DT_ATUALIZACAO_SKYHUB'
    end
    object QProdutoSkyhubDT_ATUALIZACAO_ML: TDateTimeField
      FieldName = 'DT_ATUALIZACAO_ML'
    end
    object QProdutoSkyhubDESC_CONEXAO_SKYHUB: TStringField
      FieldName = 'DESC_CONEXAO_SKYHUB'
    end
    object QProdutoSkyhubDESC_CONEXAO_ML: TStringField
      FieldName = 'DESC_CONEXAO_ML'
    end
    object QProdutoSkyhubdesc_produto_cadastro: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_produto_cadastro'
      Size = 70
      Calculated = True
    end
  end
  object QProdutoSkyhubCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_PRODUTO_SKYHUB.*'
      'FROM '
      '   TB_PRODUTO_SKYHUB'
      'WHERE'
      
        '  (:COD_PRODUTO IS NULL OR TB_PRODUTO_SKYHUB.COD_PRODUTO = :COD_' +
        'PRODUTO)'
      '  AND'
      
        '  (:DESC_PRODUTO IS NULL OR UPPER(TB_PRODUTO_SKYHUB.DESC_PRODUTO' +
        ') LIKE UPPER(:DESC_PRODUTO))')
    Variables.Data = {
      03000000020000000C0000003A434F445F50524F4455544F0300000000000000
      000000000D0000003A444553435F50524F4455544F0500000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      040000002D00000012000000434F445F50524F4455544F5F534B594855420100
      000000000B000000434F445F50524F4455544F0100000000000C000000444553
      435F50524F4455544F0100000000000B000000444553435F5354415455530100
      000000000A00000056414C5F414C545552410100000000000B00000056414C5F
      4C4152475552410100000000000F00000056414C5F434F4D5052494D454E544F
      0100000000000A000000444553435F4D4152434101000000000016000000434F
      445F50524F4455544F5F534B594855425F5041490100000000000E0000004445
      53435F43415445474F52494101000000000012000000444553435F4C494E4B5F
      494D4147454D5F3101000000000012000000444553435F4C494E4B5F494D4147
      454D5F3201000000000012000000444553435F4C494E4B5F494D4147454D5F33
      01000000000012000000444553435F4C494E4B5F494D4147454D5F3401000000
      00000F0000004553505F414C494D454E544143414F0100000000001800000045
      53505F41504152454C484F53434F4D5041544956454953010000000000170000
      004553505F434F4E544555444F4441454D42414C4147454D0100000000000700
      00004553505F434F520100000000001D0000004553505F4441544144454C414E
      43414D454E544F4E4F4D45524341444F010000000000140000004553505F4449
      4D454E534F455350524F4455544F0100000000000E0000004553505F46414252
      4943414E5445010000000000180000004553505F474152414E5449414445464F
      524E454345444F52010000000000130000004553505F4D414953494E464F524D
      41434F45530100000000000A0000004553505F4D414E55414C01000000000016
      0000004553505F4D4154455249414C434F4D504F534943414F0100000000000A
      0000004553505F4D4F44454C4F0100000000001E0000004553505F5045534F4C
      49514441454D42414C4147454D4350524F4455544F0100000000001400000045
      53505F5045534F4C4951444F50524F4455544F0100000000001B000000455350
      5F5245435552534F5346554E43494F4E414C4944414445530100000000001600
      00004553505F5245464552454E434941444F4D4F44454C4F0100000000000700
      00004553505F5341430100000000000B0000004553505F54414D414E484F0100
      00000000090000004553505F564944454F0100000000000C0000004553505F56
      4F4C544147454D0100000000000800000056414C5F5045534F01000000000010
      000000434F445F43415445474F5249415F4D4C01000000000008000000494D41
      47454D5F3100000000000008000000494D4147454D5F32000000000000080000
      00494D4147454D5F3300000000000008000000494D4147454D5F340000000000
      001B000000444553435F494E464F524D41434F45535F41444943494F4E414953
      0000000000001500000044545F415455414C495A4143414F5F534B5948554201
      00000000001100000044545F415455414C495A4143414F5F4D4C010000000000
      13000000444553435F434F4E4558414F5F534B594855420100000000000F0000
      00444553435F434F4E4558414F5F4D4C010000000000}
    Session = DMOracle.DBCemapa
    OnCalcFields = QProdutoSkyhubConsCalcFields
    Left = 168
    Top = 32
    object QProdutoSkyhubConsCOD_PRODUTO_SKYHUB: TFloatField
      FieldName = 'COD_PRODUTO_SKYHUB'
      Required = True
    end
    object QProdutoSkyhubConsCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QProdutoSkyhubConsDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 100
    end
    object QProdutoSkyhubConsDESC_STATUS: TStringField
      FieldName = 'DESC_STATUS'
      Size = 10
    end
    object QProdutoSkyhubConsDESC_MARCA: TStringField
      FieldName = 'DESC_MARCA'
      Size = 15
    end
    object QProdutoSkyhubConsVAL_ALTURA: TFloatField
      FieldName = 'VAL_ALTURA'
    end
    object QProdutoSkyhubConsVAL_LARGURA: TFloatField
      FieldName = 'VAL_LARGURA'
    end
    object QProdutoSkyhubConsVAL_COMPRIMENTO: TFloatField
      FieldName = 'VAL_COMPRIMENTO'
    end
    object QProdutoSkyhubConsCOD_PRODUTO_SKYHUB_PAI: TFloatField
      FieldName = 'COD_PRODUTO_SKYHUB_PAI'
    end
    object QProdutoSkyhubConsDESC_CATEGORIA: TStringField
      FieldName = 'DESC_CATEGORIA'
      Size = 150
    end
    object QProdutoSkyhubConsDESC_LINK_IMAGEM_1: TStringField
      FieldName = 'DESC_LINK_IMAGEM_1'
      Size = 200
    end
    object QProdutoSkyhubConsDESC_LINK_IMAGEM_2: TStringField
      FieldName = 'DESC_LINK_IMAGEM_2'
      Size = 200
    end
    object QProdutoSkyhubConsDESC_LINK_IMAGEM_3: TStringField
      FieldName = 'DESC_LINK_IMAGEM_3'
      Size = 200
    end
    object QProdutoSkyhubConsDESC_LINK_IMAGEM_4: TStringField
      FieldName = 'DESC_LINK_IMAGEM_4'
      Size = 200
    end
    object QProdutoSkyhubConsESP_ALIMENTACAO: TStringField
      FieldName = 'ESP_ALIMENTACAO'
      Size = 30
    end
    object QProdutoSkyhubConsESP_APARELHOSCOMPATIVEIS: TStringField
      FieldName = 'ESP_APARELHOSCOMPATIVEIS'
      Size = 30
    end
    object QProdutoSkyhubConsESP_CONTEUDODAEMBALAGEM: TStringField
      FieldName = 'ESP_CONTEUDODAEMBALAGEM'
      Size = 30
    end
    object QProdutoSkyhubConsESP_COR: TStringField
      FieldName = 'ESP_COR'
      Size = 30
    end
    object QProdutoSkyhubConsESP_DATADELANCAMENTONOMERCADO: TStringField
      FieldName = 'ESP_DATADELANCAMENTONOMERCADO'
      Size = 30
    end
    object QProdutoSkyhubConsESP_DIMENSOESPRODUTO: TStringField
      FieldName = 'ESP_DIMENSOESPRODUTO'
      Size = 30
    end
    object QProdutoSkyhubConsESP_FABRICANTE: TStringField
      FieldName = 'ESP_FABRICANTE'
      Size = 30
    end
    object QProdutoSkyhubConsESP_GARANTIADEFORNECEDOR: TStringField
      FieldName = 'ESP_GARANTIADEFORNECEDOR'
      Size = 30
    end
    object QProdutoSkyhubConsESP_MAISINFORMACOES: TStringField
      FieldName = 'ESP_MAISINFORMACOES'
      Size = 30
    end
    object QProdutoSkyhubConsESP_MANUAL: TStringField
      FieldName = 'ESP_MANUAL'
      Size = 30
    end
    object QProdutoSkyhubConsESP_MATERIALCOMPOSICAO: TStringField
      FieldName = 'ESP_MATERIALCOMPOSICAO'
      Size = 30
    end
    object QProdutoSkyhubConsESP_MODELO: TStringField
      FieldName = 'ESP_MODELO'
      Size = 30
    end
    object QProdutoSkyhubConsESP_PESOLIQDAEMBALAGEMCPRODUTO: TStringField
      FieldName = 'ESP_PESOLIQDAEMBALAGEMCPRODUTO'
      Size = 30
    end
    object QProdutoSkyhubConsESP_PESOLIQDOPRODUTO: TStringField
      FieldName = 'ESP_PESOLIQDOPRODUTO'
      Size = 30
    end
    object QProdutoSkyhubConsESP_RECURSOSFUNCIONALIDADES: TStringField
      FieldName = 'ESP_RECURSOSFUNCIONALIDADES'
      Size = 30
    end
    object QProdutoSkyhubConsESP_REFERENCIADOMODELO: TStringField
      FieldName = 'ESP_REFERENCIADOMODELO'
      Size = 30
    end
    object QProdutoSkyhubConsESP_SAC: TStringField
      FieldName = 'ESP_SAC'
      Size = 30
    end
    object QProdutoSkyhubConsESP_TAMANHO: TStringField
      FieldName = 'ESP_TAMANHO'
      Size = 30
    end
    object QProdutoSkyhubConsESP_VIDEO: TStringField
      FieldName = 'ESP_VIDEO'
      Size = 30
    end
    object QProdutoSkyhubConsESP_VOLTAGEM: TStringField
      FieldName = 'ESP_VOLTAGEM'
      Size = 30
    end
    object QProdutoSkyhubConsVAL_PESO: TFloatField
      FieldName = 'VAL_PESO'
    end
    object QProdutoSkyhubConsCOD_CATEGORIA_ML: TStringField
      FieldName = 'COD_CATEGORIA_ML'
      Size = 10
    end
    object QProdutoSkyhubConsIMAGEM_1: TBlobField
      FieldName = 'IMAGEM_1'
      BlobType = ftOraBlob
    end
    object QProdutoSkyhubConsIMAGEM_2: TBlobField
      FieldName = 'IMAGEM_2'
      BlobType = ftOraBlob
    end
    object QProdutoSkyhubConsIMAGEM_3: TBlobField
      FieldName = 'IMAGEM_3'
      BlobType = ftOraBlob
    end
    object QProdutoSkyhubConsIMAGEM_4: TBlobField
      FieldName = 'IMAGEM_4'
      BlobType = ftOraBlob
    end
    object QProdutoSkyhubConsDESC_INFORMACOES_ADICIONAIS: TMemoField
      FieldName = 'DESC_INFORMACOES_ADICIONAIS'
      BlobType = ftOraClob
    end
    object QProdutoSkyhubConsDT_ATUALIZACAO_SKYHUB: TDateTimeField
      FieldName = 'DT_ATUALIZACAO_SKYHUB'
    end
    object QProdutoSkyhubConsDT_ATUALIZACAO_ML: TDateTimeField
      FieldName = 'DT_ATUALIZACAO_ML'
    end
    object QProdutoSkyhubConsDESC_CONEXAO_SKYHUB: TStringField
      FieldName = 'DESC_CONEXAO_SKYHUB'
    end
    object QProdutoSkyhubConsDESC_CONEXAO_ML: TStringField
      FieldName = 'DESC_CONEXAO_ML'
    end
    object QProdutoSkyhubConsstatus: TStringField
      FieldKind = fkCalculated
      FieldName = 'status'
      Size = 255
      Calculated = True
    end
  end
  object QVariacaoSkyhub: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_PRODUTO_SKYHUB.COD_PRODUTO_SKYHUB,'
      '  TB_PRODUTO.COD_PRODUTO AS COD_PRODUTO_SISTEMA,'
      '  TB_PRODUTO.DESC_PRODUTO AS DESC_PRODUTO_SISTEMA,'
      '  TB_PRODUTO_SKYHUB.DESC_PRODUTO AS DESC_PRODUTO_SKYHUB'
      'FROM'
      '  TB_PRODUTO_SKYHUB,'
      '  TB_PRODUTO'
      'where'
      '  TB_PRODUTO_SKYHUB.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '  AND'
      '  TB_PRODUTO_SKYHUB.COD_PRODUTO_SKYHUB_PAI IN'
      '  ('
      '    SELECT'
      '      TB_PRODUTO_SKYHUB.COD_PRODUTO'
      '    FROM'
      '      TB_PRODUTO_SKYHUB'
      '    WHERE'
      '      TB_PRODUTO_SKYHUB.COD_PRODUTO_SKYHUB = :cod_produto_skyhub'
      '  )')
    Variables.Data = {
      0300000001000000130000003A434F445F50524F4455544F5F534B5948554205
      0000000000000000000000}
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000400000012000000434F445F50524F4455544F5F534B594855420100
      0000000013000000434F445F50524F4455544F5F53495354454D410100000000
      0014000000444553435F50524F4455544F5F53495354454D4101000000000013
      000000444553435F50524F4455544F5F534B59485542010000000000}
    Master = QProdutoSkyhub
    MasterFields = 'COD_PRODUTO_SKYHUB'
    DetailFields = 'COD_PRODUTO_SKYHUB'
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 48
    Top = 88
    object QVariacaoSkyhubCOD_PRODUTO_SKYHUB: TFloatField
      FieldName = 'COD_PRODUTO_SKYHUB'
      Required = True
    end
    object QVariacaoSkyhubCOD_PRODUTO_SISTEMA: TFloatField
      FieldName = 'COD_PRODUTO_SISTEMA'
      Required = True
    end
    object QVariacaoSkyhubDESC_PRODUTO_SISTEMA: TStringField
      FieldName = 'DESC_PRODUTO_SISTEMA'
      Size = 200
    end
    object QVariacaoSkyhubDESC_PRODUTO_SKYHUB: TStringField
      FieldName = 'DESC_PRODUTO_SKYHUB'
      Size = 100
    end
  end
  object QRConexaoProdutoSkyhub: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  PRODS.COD_PRODUTO_SKYHUB,'
      '  PRODS.COD_PRODUTO,'
      '  PROD.DESC_PRODUTO,'
      '  PRODS.DESC_CONEXAO_SKYHUB,'
      '  PRODS.DESC_CONEXAO_ML'
      'FROM'
      '  TB_PRODUTO_SKYHUB PRODS,'
      '  TB_PRODUTO PROD'
      'WHERE'
      '  PROD.COD_PRODUTO = PRODS.COD_PRODUTO'
      '  AND'
      '  :CONEXAO'
      'ORDER BY'
      '  PRODS.COD_PRODUTO_SKYHUB')
    Variables.Data = {
      0300000001000000080000003A434F4E4558414F010000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000500000012000000434F445F50524F4455544F5F534B594855420100
      000000000B000000434F445F50524F4455544F0100000000000C000000444553
      435F50524F4455544F01000000000013000000444553435F434F4E4558414F5F
      534B594855420100000000000F000000444553435F434F4E4558414F5F4D4C01
      0000000000}
    Session = DMOracle.DBCemapa
    Left = 168
    Top = 88
    object QRConexaoProdutoSkyhubCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QRConexaoProdutoSkyhubDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 100
    end
    object QRConexaoProdutoSkyhubDESC_CONEXAO_SKYHUB: TStringField
      FieldName = 'DESC_CONEXAO_SKYHUB'
    end
    object QRConexaoProdutoSkyhubDESC_CONEXAO_ML: TStringField
      FieldName = 'DESC_CONEXAO_ML'
    end
    object QRConexaoProdutoSkyhubCOD_PRODUTO_SKYHUB: TFloatField
      FieldName = 'COD_PRODUTO_SKYHUB'
      Required = True
    end
  end
  object QProdutoSkyhubUrl: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_PRODUTO_SKYHUB_URL.*'
      'FROM '
      '   TB_PRODUTO_SKYHUB_URL'
      'WHERE'
      '  TB_PRODUTO_SKYHUB_URL.COD_PRODUTO_SKYHUB = :COD_PRODUTO_SKYHUB'
      '  AND'
      '  TB_PRODUTO_SKYHUB_URL.COD_FILIAL = :COD_FILIAL')
    Variables.Data = {
      0300000002000000130000003A434F445F50524F4455544F5F534B5948554203
      00000000000000000000000B0000003A434F445F46494C49414C030000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000700000016000000434F445F50524F4455544F5F534B594855425F55
      524C01000000000012000000434F445F50524F4455544F5F534B594855420100
      000000000A000000434F445F46494C49414C0100000000000D00000055524C5F
      5355424D4152494E4F0100000000000C00000055524C5F53484F5054494D4501
      00000000000E00000055524C5F414D45524943414E41530100000000000A0000
      0055524C5F4D4C49565245010000000000}
    Session = DMOracle.DBCemapa
    Left = 296
    Top = 32
    object QProdutoSkyhubUrlCOD_PRODUTO_SKYHUB_URL: TIntegerField
      FieldName = 'COD_PRODUTO_SKYHUB_URL'
      Required = True
    end
    object QProdutoSkyhubUrlCOD_PRODUTO_SKYHUB: TFloatField
      FieldName = 'COD_PRODUTO_SKYHUB'
      Required = True
    end
    object QProdutoSkyhubUrlCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QProdutoSkyhubUrlURL_SUBMARINO: TStringField
      FieldName = 'URL_SUBMARINO'
      Size = 100
    end
    object QProdutoSkyhubUrlURL_SHOPTIME: TStringField
      FieldName = 'URL_SHOPTIME'
      Size = 100
    end
    object QProdutoSkyhubUrlURL_AMERICANAS: TStringField
      FieldName = 'URL_AMERICANAS'
      Size = 100
    end
    object QProdutoSkyhubUrlURL_MLIVRE: TStringField
      FieldName = 'URL_MLIVRE'
      Size = 100
    end
  end
  object QRSincronizacoes: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  PRODUTO.COD_PRODUTO,'
      '  PRODUTO.DESC_PRODUTO,'
      '  SINC.DT_REGISTRO,'
      '  SINC.TIPO_ACAO,'
      '  SINC.IND_SINCRONIZADO,'
      '  SINC.IND_SINCRONIZADO_ML,'
      '  SINC.DT_SINCRONIZACAO,'
      '  SINC.DT_SINCRONIZACAO_ML'
      'FROM'
      '  TB_PRODUTO_SKYHUB PRODUTO,'
      '  TB_SINCRONIZACAO_SKYHUB SINC'
      'WHERE'
      '  PRODUTO.COD_PRODUTO = SINC.COD_PRODUTO'
      '  AND'
      '  (:COD_PRODUTO_SKYHUB IS NULL OR'
      '    (PRODUTO.COD_PRODUTO_SKYHUB = :COD_PRODUTO_SKYHUB))'
      '  AND'
      '  TRUNC(SINC.DT_REGISTRO) BETWEEN :DT_INICIO AND :DT_FIM'
      'ORDER BY'
      '  SINC.DT_REGISTRO DESC')
    Variables.Data = {
      03000000030000000A0000003A44545F494E4943494F0C000000000000000000
      0000070000003A44545F46494D0C0000000000000000000000130000003A434F
      445F50524F4455544F5F534B59485542030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000080000000B000000434F445F50524F4455544F0100000000000C0000
      00444553435F50524F4455544F0100000000000B00000044545F524547495354
      524F010000000000090000005449504F5F4143414F0100000000001000000049
      4E445F53494E43524F4E495A41444F01000000000013000000494E445F53494E
      43524F4E495A41444F5F4D4C0100000000001000000044545F53494E43524F4E
      495A4143414F0100000000001300000044545F53494E43524F4E495A4143414F
      5F4D4C010000000000}
    Session = DMOracle.DBCemapa
    Left = 296
    Top = 88
    object QRSincronizacoesCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QRSincronizacoesDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 100
    end
    object QRSincronizacoesDT_REGISTRO: TDateTimeField
      FieldName = 'DT_REGISTRO'
    end
    object QRSincronizacoesTIPO_ACAO: TStringField
      FieldName = 'TIPO_ACAO'
      Required = True
      Size = 6
    end
    object QRSincronizacoesIND_SINCRONIZADO: TStringField
      FieldName = 'IND_SINCRONIZADO'
      Size = 1
    end
    object QRSincronizacoesIND_SINCRONIZADO_ML: TStringField
      FieldName = 'IND_SINCRONIZADO_ML'
      Size = 1
    end
    object QRSincronizacoesDT_SINCRONIZACAO: TDateTimeField
      FieldName = 'DT_SINCRONIZACAO'
    end
    object QRSincronizacoesDT_SINCRONIZACAO_ML: TDateTimeField
      FieldName = 'DT_SINCRONIZACAO_ML'
    end
  end
end
