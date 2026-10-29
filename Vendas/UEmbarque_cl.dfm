object DMEmbarque: TDMEmbarque
  OldCreateOrder = False
  Left = 424
  Top = 165
  Height = 595
  Width = 989
  object DSEmbarque: TDataSource
    DataSet = QEmbarque
    Left = 56
    Top = 64
  end
  object DSEmbarqueItem: TDataSource
    DataSet = QEmbarqueItem
    Left = 152
    Top = 56
  end
  object QREmbarque_Rota: TOracleDataSet1
    SQL.Strings = (
      'SELECT DISTINCT'
      '  Tb_cadastro.NOME,'
      '  Tb_cadastro.DESC_TELEFONE,'
      '  Tb_cadastro.DESC_FANTASIA,'
      '  Tb_cadastro.DESC_CIDADE,'
      '  Tb_cadastro.DESC_BAIRRO,'
      '  TB_CADASTRO.DESC_CEP,'
      '  Tb_nota_cab.NR_ROTA,'
      '  Tb_nota_cab.COD_SERIE,'
      '  Tb_nota_cab.NUM_NOTA,'
      '  Tb_Embarque_Item.NUM_SEQUENCIAL,'
      '  TB_EMBARQUE.NOME_MOTORISTA,'
      '  SUM(TB_NOTA_ITEM.QT_QUANTIDADE) AS QT_TOTAL'
      'FROM'
      '  TB_NOTA_CAB,'
      '  TB_NOTA_ITEM,'
      '  TB_PEDIDO_CAB,'
      '  TB_EMBARQUE,'
      '  TB_EMBARQUE_ITEM,'
      '  TB_BAIXA_PEDIDO,'
      '  TB_PEDIDO_ITEM,'
      '  TB_CADASTRO,'
      '  TB_OPERACAO'
      'WHERE'
      '  (Tb_nota_cab.COD_NOTA_CAB = Tb_nota_item.COD_NOTA_CAB)'
      '   AND'
      '  (Tb_embarque.COD_EMBARQUE = Tb_embarque_item.COD_EMBARQUE)'
      '   AND'
      
        '  (Tb_embarque_item.COD_PEDIDO_CAB = Tb_pedido_cab.COD_PEDIDO_CA' +
        'B)'
      '   AND'
      
        '  (Tb_baixa_pedido.COD_PEDIDO_ITEM = Tb_pedido_item.COD_PEDIDO_I' +
        'TEM)'
      '   AND'
      '  (Tb_pedido_item.COD_PEDIDO_CAB = Tb_pedido_cab.COD_PEDIDO_CAB)'
      '   AND'
      '  (Tb_baixa_pedido.COD_NOTA_ITEM = Tb_nota_item.COD_NOTA_ITEM)'
      '   AND'
      '  (Tb_nota_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO)'
      '   AND'
      '  (Tb_nota_cab.IND_SITUACAO = '#39'2'#39')'
      '   AND'
      '  (TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO)'
      '   AND'
      '  (:IND_LIVRO_FISCAL Is Null'
      '   Or'
      '    Tb_operacao.IND_LIVRO_FISCAL = :IND_LIVRO_FISCAL)'
      '   AND'
      '   ((Tb_embarque.COD_EMBARQUE = :COD_EMBARQUE1)'
      '     OR'
      '    (Tb_embarque.COD_EMBARQUE = :COD_EMBARQUE2)'
      '     OR'
      '    (Tb_embarque.COD_EMBARQUE = :COD_EMBARQUE3)'
      '     OR'
      '    (Tb_embarque.COD_EMBARQUE = :COD_EMBARQUE4))'
      'GROUP BY'
      '  Tb_nota_cab.NR_ROTA,'
      '  Tb_Embarque_Item.NUM_SEQUENCIAL,'
      '  Tb_cadastro.NOME,'
      '  Tb_cadastro.DESC_TELEFONE,'
      '  Tb_cadastro.DESC_FANTASIA,'
      '  Tb_cadastro.DESC_CIDADE,'
      '  Tb_nota_cab.COD_SERIE,'
      '  Tb_nota_cab.NUM_NOTA,'
      '  TB_EMBARQUE.NOME_MOTORISTA,'
      '  Tb_cadastro.DESC_BAIRRO,'
      '    TB_CADASTRO.DESC_CEP'
      ''
      ''
      ' '
      ' ')
    Variables.Data = {
      03000000050000000E0000003A434F445F454D42415251554531030000000000
      0000000000000E0000003A434F445F454D424152515545320300000000000000
      000000000E0000003A434F445F454D4241525155453303000000000000000000
      00000E0000003A434F445F454D42415251554534030000000000000000000000
      110000003A494E445F4C4956524F5F46495343414C0500000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      040000000C000000040000004E4F4D450100000000000D000000444553435F54
      454C45464F4E450100000000000D000000444553435F46414E54415349410100
      000000000B000000444553435F434944414445010000000000070000004E525F
      524F5441010000000000080000004E554D5F4E4F54410100000000000E000000
      4E554D5F53455155454E4349414C01000000000009000000434F445F53455249
      450100000000000800000051545F544F54414C0100000000000E0000004E4F4D
      455F4D4F544F52495354410100000000000B000000444553435F42414952524F
      01000000000008000000444553435F434550010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    Left = 270
    Top = 120
    object QREmbarque_RotaNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object QREmbarque_RotaDESC_TELEFONE: TStringField
      FieldName = 'DESC_TELEFONE'
      Size = 12
    end
    object QREmbarque_RotaDESC_FANTASIA: TStringField
      FieldName = 'DESC_FANTASIA'
      Size = 30
    end
    object QREmbarque_RotaDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      Size = 30
    end
    object QREmbarque_RotaNR_ROTA: TIntegerField
      FieldName = 'NR_ROTA'
    end
    object QREmbarque_RotaNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
      Required = True
    end
    object QREmbarque_RotaNUM_SEQUENCIAL: TIntegerField
      FieldName = 'NUM_SEQUENCIAL'
    end
    object QREmbarque_RotaCOD_SERIE: TStringField
      FieldName = 'COD_SERIE'
      Required = True
      Size = 3
    end
    object QREmbarque_RotaQT_TOTAL: TFloatField
      FieldName = 'QT_TOTAL'
    end
    object QREmbarque_RotaNOME_MOTORISTA: TStringField
      FieldName = 'NOME_MOTORISTA'
      Size = 50
    end
    object QREmbarque_RotaDESC_BAIRRO: TStringField
      FieldName = 'DESC_BAIRRO'
    end
    object QREmbarque_RotaDESC_CEP: TStringField
      FieldName = 'DESC_CEP'
      Size = 9
    end
  end
  object QrAcertoCondPagto: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  Tb_nota_cab.COD_CADASTRO,'
      '  Tb_nota_cab.NUM_NOTA,'
      '  Tb_nota_cab.COD_NOTA_CAB,'
      '  Tb_embarque.COD_EMBARQUE,'
      '  Tb_embarque.NOME_MOTORISTA,'
      '  Tb_embarque.DT_EMBARQUE,'
      '  Tb_Cadastro.Nome,'
      
        '  SUM(Tb_nota_item.VAL_TOTAL - Tb_nota_item.Val_Desconto) AS SVA' +
        'L_TOTAL,'
      '  SUM(Tb_nota_item.QT_QUANTIDADE) AS SQT_QUANTIDADE,'
      '  TB_EMBARQUE.NUM_EMBARQUE'
      'FROM'
      '  TB_BAIXA_PEDIDO,'
      '  TB_PEDIDO_CAB,'
      '  TB_PEDIDO_ITEM,'
      '  TB_EMBARQUE,'
      '  TB_EMBARQUE_ITEM,'
      '  TB_NOTA_CAB,'
      '  TB_NOTA_ITEM,'
      '  TB_CADASTRO'
      'WHERE'
      '  (Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB)'
      '  AND'
      '  (Tb_baixa_pedido.COD_NOTA_ITEM = Tb_nota_item.COD_NOTA_ITEM)'
      '  AND'
      
        '  (Tb_pedido_item.COD_PEDIDO_ITEM = Tb_baixa_pedido.COD_PEDIDO_I' +
        'TEM)'
      '  AND'
      '  (Tb_pedido_item.COD_PEDIDO_CAB = Tb_pedido_cab.COD_PEDIDO_CAB)'
      '  AND'
      '  (Tb_embarque.COD_EMBARQUE = Tb_embarque_item.COD_EMBARQUE)'
      '  AND'
      
        '  (Tb_embarque_item.COD_PEDIDO_CAB = Tb_pedido_cab.COD_PEDIDO_CA' +
        'B)'
      '  AND'
      '  (Tb_nota_Cab.COD_CADASTRO = Tb_CADASTRO.COD_CADASTRO)'
      '  AND'
      '  (TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39')'
      '  AND'
      '  (TB_EMBARQUE.COD_EMBARQUE = :EMBARQUE)'
      '  AND'
      '  (:IND_COND_PAGTO IS NULL'
      '   OR'
      '    TB_NOTA_CAB.IND_CONDICAO_PAGTO = :IND_COND_PAGTO)'
      'GROUP BY'
      '  Tb_nota_cab.COD_CADASTRO,'
      '  Tb_nota_cab.NUM_NOTA,'
      '  Tb_nota_cab.COD_NOTA_CAB,'
      '  Tb_embarque.COD_EMBARQUE,'
      '   Tb_embarque.DT_EMBARQUE,'
      '  Tb_embarque.NOME_MOTORISTA,'
      '  Tb_cadastro.NOME,'
      '  TB_EMBARQUE.NUM_EMBARQUE'
      'ORDER BY'
      '  Tb_nota_cab.NUM_NOTA'
      ' '
      ' ')
    QBEDefinition.QBEFieldDefs = {
      040000000A0000000C000000434F445F434144415354524F0100000000000800
      00004E554D5F4E4F54410100000000000C000000434F445F454D424152515545
      0100000000000E0000004E4F4D455F4D4F544F52495354410100000000000B00
      000044545F454D424152515545010000000000040000004E4F4D450100000000
      000A0000005356414C5F544F54414C0100000000000E0000005351545F515541
      4E5449444144450100000000000C000000434F445F4E4F54415F434142010000
      0000000C0000004E554D5F454D424152515545010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    OnCalcFields = QrAcertoCondPagtoCalcFields
    Left = 384
    Top = 208
    object QrAcertoCondPagtoCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QrAcertoCondPagtoNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
      Required = True
    end
    object QrAcertoCondPagtoCOD_EMBARQUE: TIntegerField
      FieldName = 'COD_EMBARQUE'
      Required = True
    end
    object QrAcertoCondPagtoNOME_MOTORISTA: TStringField
      FieldName = 'NOME_MOTORISTA'
      Size = 50
    end
    object QrAcertoCondPagtoDT_EMBARQUE: TDateTimeField
      FieldName = 'DT_EMBARQUE'
      Required = True
    end
    object QrAcertoCondPagtoNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object QrAcertoCondPagtoSVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
    end
    object QrAcertoCondPagtoSQT_QUANTIDADE: TFloatField
      FieldName = 'SQT_QUANTIDADE'
    end
    object QrAcertoCondPagtoCOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
      Required = True
    end
    object QrAcertoCondPagtodesc_sigla: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_sigla'
      Size = 3
      Calculated = True
    end
    object QrAcertoCondPagtoNUM_EMBARQUE: TIntegerField
      FieldName = 'NUM_EMBARQUE'
    end
  end
  object QrEmbarque_Ped_Nf: TOracleDataSet1
    SQL.Strings = (
      ''
      '  SELECT'
      '    Tb_nota_cab.COD_CADASTRO,'
      '    Tb_nota_cab.NUM_NOTA,'
      '    Tb_nota_cab.Dt_recebimento,'
      '    Tb_embarque.COD_EMBARQUE,'
      '    Tb_Cadastro.Nome,'
      '    Tb_Cadastro.Num_Inscricao,'
      '    Tb_Filial.NUM_CGC,'
      '    Tb_Filial.DESC_INSCRICAO,'
      '    Tb_Filial.DESC_ENDERECO,'
      
        '    SUM(Tb_nota_item.QT_QUANTIDADE+ Tb_Produto.NUM_EMBALAGEM * T' +
        'B_NOTA_ITEM.NUM_VOLUMES) AS SPESO_BRUTO,'
      
        '    SUM(Tb_nota_item.VAL_TOTAL - Tb_nota_item.Val_Desconto) AS S' +
        'VAL_TOTAL,'
      '    SUM(Tb_nota_item.QT_QUANTIDADE) AS SQT_QUANTIDADE'
      '  FROM'
      '    TB_BAIXA_PEDIDO,'
      '    TB_PEDIDO_CAB,'
      '    TB_PEDIDO_ITEM,'
      '    TB_EMBARQUE,'
      '    TB_EMBARQUE_ITEM,'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_PRODUTO,'
      '    TB_CADASTRO,'
      '    TB_OPERACAO,'
      '    TB_FILIAL'
      '  WHERE'
      '    (Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB)'
      '    AND'
      '    (Tb_baixa_pedido.COD_NOTA_ITEM = Tb_nota_item.COD_NOTA_ITEM)'
      '    AND'
      
        '    (Tb_pedido_item.COD_PEDIDO_ITEM = Tb_baixa_pedido.COD_PEDIDO' +
        '_ITEM)'
      '    AND'
      
        '    (Tb_pedido_item.COD_PEDIDO_CAB = Tb_pedido_cab.COD_PEDIDO_CA' +
        'B)'
      '    AND'
      '    (Tb_embarque.COD_EMBARQUE = Tb_embarque_item.COD_EMBARQUE)'
      '    AND'
      
        '    (Tb_embarque_item.COD_PEDIDO_CAB = Tb_pedido_cab.COD_PEDIDO_' +
        'CAB)'
      '    AND'
      '    TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '    AND'
      '    (Tb_nota_Cab.COD_CADASTRO = Tb_CADASTRO.COD_CADASTRO)'
      '    AND'
      '    (Tb_nota_Cab.COD_OPERACAO = Tb_Operacao.COD_OPERACAO)'
      '    AND'
      '    (Tb_nota_Cab.COD_FILIAL = Tb_Filial.COD_FILIAL)'
      '    AND'
      '    (TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39')'
      '    AND'
      '    (TB_EMBARQUE.COD_EMBARQUE = :EMBARQUE'
      '     or'
      '      :EMBARQUE IS NULL)'
      '    AND'
      '    (Tb_nota_Cab.COD_FILIAL = :COD_FILIAL'
      '     or'
      '      :COD_FILIAL IS NULL)'
      '    AND'
      '    (TB_EMBARQUE.DT_EMBARQUE >= :DT_INICIAL)'
      '    AND'
      '    (TB_EMBARQUE.DT_EMBARQUE <= :DT_FINAL)'
      '    AND'
      '    (:IND_LIVRO_FISCAL Is Null'
      '     Or'
      '      Tb_operacao.IND_LIVRO_FISCAL = :IND_LIVRO_FISCAL)'
      '    AND'
      '    (:COD_VENDEDOR IS NULL'
      '     OR'
      '      TB_NOTA_CAB.COD_VENDEDOR = :COD_VENDEDOR)'
      '  GROUP BY'
      '    Tb_nota_cab.COD_CADASTRO,'
      '    Tb_nota_cab.NUM_NOTA,'
      '    Tb_nota_cab.Dt_recebimento,'
      '    Tb_embarque.COD_EMBARQUE,'
      '    Tb_Cadastro.Nome,'
      '    Tb_Cadastro.Num_Inscricao,'
      '    Tb_Filial.NUM_CGC,'
      '    Tb_Filial.DESC_INSCRICAO,'
      '    Tb_Filial.DESC_ENDERECO'
      'ORDER BY'
      '  Tb_embarque.COD_EMBARQUE,'
      '  Tb_nota_cab.NUM_NOTA'
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Variables.Data = {
      0300000006000000090000003A454D4241525155450300000000000000000000
      000D0000003A434F445F56454E4445444F520300000000000000000000001100
      00003A494E445F4C4956524F5F46495343414C0500000000000000000000000B
      0000003A44545F494E494349414C0C0000000000000000000000090000003A44
      545F46494E414C0C00000000000000000000000B0000003A434F445F46494C49
      414C030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000C000000040000004E4F4D450100000000000A0000005356414C5F54
      4F54414C0100000000000E0000005351545F5155414E54494441444501000000
      00000E00000044545F5245434542494D454E544F0100000000000C000000434F
      445F434144415354524F010000000000080000004E554D5F4E4F544101000000
      00000C000000434F445F454D4241525155450100000000000D0000004E554D5F
      494E5343524943414F010000000000070000004E554D5F434743010000000000
      0E000000444553435F494E5343524943414F0100000000000D00000044455343
      5F454E44455245434F0100000000000B000000535045534F5F425255544F0100
      00000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    Left = 272
    Top = 176
    object QrEmbarque_Ped_NfCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QrEmbarque_Ped_NfNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
      Required = True
    end
    object QrEmbarque_Ped_NfDT_RECEBIMENTO: TDateTimeField
      FieldName = 'DT_RECEBIMENTO'
    end
    object QrEmbarque_Ped_NfCOD_EMBARQUE: TIntegerField
      FieldName = 'COD_EMBARQUE'
      Required = True
    end
    object QrEmbarque_Ped_NfNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object QrEmbarque_Ped_NfNUM_INSCRICAO: TStringField
      FieldName = 'NUM_INSCRICAO'
    end
    object QrEmbarque_Ped_NfNUM_CGC: TStringField
      FieldName = 'NUM_CGC'
      Size = 18
    end
    object QrEmbarque_Ped_NfDESC_INSCRICAO: TStringField
      FieldName = 'DESC_INSCRICAO'
      Size = 12
    end
    object QrEmbarque_Ped_NfDESC_ENDERECO: TStringField
      FieldName = 'DESC_ENDERECO'
      Size = 30
    end
    object QrEmbarque_Ped_NfSVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
    end
    object QrEmbarque_Ped_NfSQT_QUANTIDADE: TFloatField
      FieldName = 'SQT_QUANTIDADE'
    end
    object QrEmbarque_Ped_NfSPESO_BRUTO: TFloatField
      FieldName = 'SPESO_BRUTO'
    end
  end
  object QrAchaNrNota: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  Tb_nota_cab.NUM_NOTA,'
      '  Tb_nota_cab.DESC_TRANSPORTADORA'
      'FROM'
      
        '  TB_NOTA_CAB Tb_nota_cab, TB_NOTA_ITEM Tb_nota_item, TB_BAIXA_P' +
        'EDIDO Tb_baixa_pedido, TB_PEDIDO_ITEM Tb_pedido_item'
      'WHERE'
      '  (Tb_nota_cab.COD_NOTA_CAB = Tb_nota_item.COD_NOTA_CAB)'
      '  AND'
      '  (Tb_nota_item.COD_NOTA_ITEM = Tb_baixa_pedido.COD_NOTA_ITEM)'
      '  AND'
      
        '  (Tb_baixa_pedido.COD_PEDIDO_ITEM = Tb_pedido_item.COD_PEDIDO_I' +
        'TEM)'
      '  AND'
      '  (Tb_Pedido_Item.Cod_Pedido_item = :PK)')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000002000000080000004E554D5F4E4F5441010000000000130000004445
      53435F5452414E53504F525441444F5241010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    Left = 384
    Top = 160
    object QrAchaNrNotaNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
      Required = True
    end
    object QrAchaNrNotaDESC_TRANSPORTADORA: TStringField
      FieldName = 'DESC_TRANSPORTADORA'
      Size = 50
    end
  end
  object QRNFs: TOracleDataSet1
    SQL.Strings = (
      'SELECT DISTINCT'
      '  TB_NOTA_CAB.COD_CADASTRO,'
      '  TB_CADASTRO.NOME,'
      '  TB_CADASTRO.DESC_CIDADE,'
      '  TB_CADASTRO.COD_ESTADO,'
      '  TB_NOTA_CAB.NUM_NOTA'
      'FROM'
      '  TB_BAIXA_PEDIDO,'
      '  TB_PEDIDO_CAB,'
      '  TB_PEDIDO_ITEM,'
      '  TB_EMBARQUE,'
      '  TB_EMBARQUE_ITEM,'
      '  TB_NOTA_CAB,'
      '  TB_NOTA_ITEM,'
      '  TB_OPERACAO,'
      '  TB_CADASTRO'
      'WHERE'
      '  Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '  AND'
      '  Tb_baixa_pedido.COD_NOTA_ITEM = Tb_nota_item.COD_NOTA_ITEM'
      '  AND'
      
        '  Tb_pedido_item.COD_PEDIDO_ITEM = Tb_baixa_pedido.COD_PEDIDO_IT' +
        'EM'
      '  AND'
      '  Tb_pedido_item.COD_PEDIDO_CAB = Tb_pedido_cab.COD_PEDIDO_CAB'
      '  AND'
      '  Tb_embarque.COD_EMBARQUE = Tb_embarque_item.COD_EMBARQUE'
      '  AND'
      '  Tb_embarque_item.COD_PEDIDO_CAB = Tb_pedido_cab.COD_PEDIDO_CAB'
      '  AND'
      '  TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
      '  AND'
      '  TB_NOTA_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
      '  AND'
      '  (:IND_LIVRO_FISCAL Is Null'
      '   Or'
      '   Tb_operacao.IND_LIVRO_FISCAL = :IND_LIVRO_FISCAL)'
      '  AND'
      '  TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '  AND'
      '  TB_EMBARQUE.COD_EMBARQUE = :EMBARQUE')
    Variables.Data = {
      0300000002000000090000003A454D4241525155450300000000000000000000
      00110000003A494E445F4C4956524F5F46495343414C05000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      0400000005000000080000004E554D5F4E4F54410100000000000C000000434F
      445F434144415354524F010000000000040000004E4F4D450100000000000B00
      0000444553435F4349444144450100000000000A000000434F445F4553544144
      4F010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    Left = 270
    Top = 64
    object QRNFsNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
      Required = True
    end
    object QRNFsCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QRNFsNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object QRNFsDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      Size = 30
    end
    object QRNFsCOD_ESTADO: TStringField
      FieldName = 'COD_ESTADO'
      Size = 2
    end
  end
  object QREmbarque2: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  DESC_CLASSE,'
      '  Cod_Embarque,'
      '  NUM_EMBARQUE,'
      '  Dt_Embarque,'
      '  NOME_MOTORISTA,'
      '  NUM_KILOMETRAGEM,'
      '  DESC_OBS,'
      '  DESC_OBS1,'
      '  COD_TRANSPORTADOR,'
      '  NOME_TRANSPORTADOR,'
      '  COD_PRODUTO,'
      '  DESC_PRODUTO,'
      '  NUM_EMBALAGEM,'
      '  NUM_PESO_BRUTO,'
      '  NUM_PESO_LIQUIDO,'
      '  DESC_UNIDADE,'
      '  NUM_VOLUMES,'
      '  DESC_LOTE,'
      '  COD_LOTE_TIPO,'
      '  QT_EMBALAGEM,'
      '  ('
      '    SELECT SUM(EST.QT_QUANTIDADE)'
      '    FROM TB_ESTOQUE EST '
      '    WHERE EST.COD_PRODUTO = q.COD_PRODUTO'
      '  ) AS SQT_ESTOQUE,'
      '  SUM(SQT_METROS) AS SQT_METROS,'
      
        '  SUM(SQT_PEDIDO) AS SQT_PEDIDO,        /* ESTES CALCULOS '#201' DEVI' +
        'DO AO PERCENTUAL DO SUBFATURADO QUE SAIA TUDO JUNTO */'
      
        '  SUM(DECODE(:IND_LIVRO_FISCAL,'#39'S'#39',SQT_VALOR - (SQT_VALOR * PERC' +
        '_SUB / 100),DECODE(:IND_LIVRO_FISCAL,'#39'N'#39',SQT_VALOR * PERC_SUB / ' +
        '100,SQT_VALOR))) AS SQT_VALOR,'
      
        '  SUM(DECODE(:IND_LIVRO_FISCAL,'#39'S'#39',SQT_VALOR_COM_ST - (SQT_VALOR' +
        ' * PERC_SUB / 100),DECODE(:IND_LIVRO_FISCAL,'#39'N'#39',SQT_VALOR * PERC' +
        '_SUB / 100,SQT_VALOR))) AS SQT_VALOR_COM_ST,'
      
        '  SUM(DECODE(:IND_LIVRO_FISCAL,'#39'S'#39',SVL_BRINDE - (SVL_BRINDE * PE' +
        'RC_SUB / 100),DECODE(:IND_LIVRO_FISCAL,'#39'N'#39',SVL_BRINDE * PERC_SUB' +
        ' / 100,SVL_BRINDE))) AS SVL_BRINDE,'
      
        '  SUM(DECODE(:IND_LIVRO_FISCAL,'#39'S'#39',SVL_BONIFICACAO - (SVL_BONIFI' +
        'CACAO * PERC_SUB / 100),DECODE(:IND_LIVRO_FISCAL,'#39'N'#39',SVL_BONIFIC' +
        'ACAO * PERC_SUB / 100,SVL_BONIFICACAO))) AS SVL_BONIFICACAO'
      'FROM'
      '('
      '  SELECT'
      
        '    DECODE(TB_PARAM_SISTEMA.COD_EMPRESA,'#39'CGS'#39','#39'GERAL'#39',Tb_Classe.' +
        'DESC_CLASSE) AS DESC_CLASSE,'
      '    Tb_Embarque.Cod_Embarque,'
      '    TB_EMBARQUE.NUM_EMBARQUE,'
      '    Tb_Embarque.Dt_Embarque,'
      '    Tb_Embarque.NOME_MOTORISTA,'
      '    Tb_Embarque.NUM_KILOMETRAGEM,'
      '    Tb_Embarque.DESC_OBS,'
      '    Tb_Embarque.DESC_OBS1,'
      '    Tb_Embarque.COD_TRANSPORTADOR,'
      '    TB_CADASTRO.NOME AS NOME_TRANSPORTADOR,'
      '    Tb_produto.COD_PRODUTO,'
      '    Tb_produto.DESC_PRODUTO,'
      '    Tb_Produto.NUM_EMBALAGEM,'
      '    TB_PRODUTO.NUM_PESO_BRUTO,'
      '    TB_PRODUTO.NUM_PESO_LIQUIDO,'
      '    Tb_Produto.DESC_UNIDADE,'
      '    Tb_Produto.NUM_VOLUMES,'
      '    Tb_Lote_Tipo.DESC_LOTE,'
      '    TB_LOTE_TIPO.COD_LOTE_TIPO,'
      
        '    DECODE(TB_PARAM_SISTEMA.COD_EMPRESA,'#39'POLLYANA'#39',TB_PEDIDO_ITE' +
        'M.QT_EMBALAGEM,'#39#39') AS QT_EMBALAGEM,'
      '    NVL(Tb_Pedido_Cab.PERC_SUB,0) AS PERC_SUB,'
      
        '    SUM((Tb_pedido_item.QT_PEDIDO-Tb_pedido_item.QT_CANCELADO) *' +
        ' Tb_Produto.NUM_METROS_CUBICOS) AS SQT_METROS,'
      
        '    SUM(Tb_pedido_item.QT_PEDIDO-Tb_pedido_item.QT_CANCELADO) AS' +
        ' SQT_PEDIDO,'
      
        '    SUM(((TB_PEDIDO_ITEM.VAL_UNITARIO * (1-TB_PEDIDO_ITEM.perc_d' +
        'esconto/100)) * (TB_PEDIDO_ITEM.QT_PEDIDO-TB_PEDIDO_ITEM.QT_CANC' +
        'ELADO) * '
      '    (1-nvl(TB_PEDIDO_ITEM.perc_desconto1,0)/100) * '
      '    (1-nvl(TB_PEDIDO_ITEM.perc_desconto2,0)/100) *'
      '    (1+nvl(TB_PEDIDO_ITEM.perc_acrescimo,0)/100)) -'
      
        '  (NVL(TB_PEDIDO_CAB.VAL_DESCONTO, 0) / (SELECT SUM((PI.VAL_UNIT' +
        'ARIO * (1-PI.perc_desconto/100)) * (PI.QT_PEDIDO-PI.QT_CANCELADO' +
        ') * '
      '    (1-nvl(PI.perc_desconto1,0)/100) * '
      '    (1-nvl(PI.perc_desconto2,0)/100) *'
      
        '    (1+nvl(PI.perc_acrescimo,0)/100)) FROM TB_PEDIDO_ITEM PI WHE' +
        'RE PI.COD_PEDIDO_CAB = TB_PEDIDO_CAB.COD_PEDIDO_CAB) * '
      
        '  ((TB_PEDIDO_ITEM.VAL_UNITARIO * (1-TB_PEDIDO_ITEM.perc_descont' +
        'o/100)) * (TB_PEDIDO_ITEM.QT_PEDIDO-TB_PEDIDO_ITEM.QT_CANCELADO)' +
        ' * '
      '    (1-nvl(TB_PEDIDO_ITEM.perc_desconto1,0)/100) * '
      '    (1-nvl(TB_PEDIDO_ITEM.perc_desconto2,0)/100) *'
      '    (1+nvl(TB_PEDIDO_ITEM.perc_acrescimo,0)/100))) +'
      
        '  (NVL(TB_PEDIDO_CAB.VAL_DESPESAS, 0) / (SELECT SUM((PI.VAL_UNIT' +
        'ARIO * (1-PI.perc_desconto/100)) * (PI.QT_PEDIDO-PI.QT_CANCELADO' +
        ') * '
      '    (1-nvl(PI.perc_desconto1,0)/100) * '
      '    (1-nvl(PI.perc_desconto2,0)/100) *'
      
        '    (1+nvl(PI.perc_acrescimo,0)/100)) FROM TB_PEDIDO_ITEM PI WHE' +
        'RE PI.COD_PEDIDO_CAB = TB_PEDIDO_CAB.COD_PEDIDO_CAB) * '
      
        '  ((TB_PEDIDO_ITEM.VAL_UNITARIO * (1-TB_PEDIDO_ITEM.perc_descont' +
        'o/100)) * (TB_PEDIDO_ITEM.QT_PEDIDO-TB_PEDIDO_ITEM.QT_CANCELADO)' +
        ' * '
      '    (1-nvl(TB_PEDIDO_ITEM.perc_desconto1,0)/100) * '
      '    (1-nvl(TB_PEDIDO_ITEM.perc_desconto2,0)/100) *'
      
        '    (1+nvl(TB_PEDIDO_ITEM.perc_acrescimo,0)/100)))) AS SQT_VALOR' +
        ','
      
        '    SUM(((TB_PEDIDO_ITEM.VAL_UNITARIO * (1-TB_PEDIDO_ITEM.perc_d' +
        'esconto/100)) * (TB_PEDIDO_ITEM.QT_PEDIDO-TB_PEDIDO_ITEM.QT_CANC' +
        'ELADO) * '
      '    (1-nvl(TB_PEDIDO_ITEM.perc_desconto1,0)/100) * '
      '    (1-nvl(TB_PEDIDO_ITEM.perc_desconto2,0)/100) *'
      '    (1+nvl(TB_PEDIDO_ITEM.perc_acrescimo,0)/100)) -'
      
        '  (NVL(TB_PEDIDO_CAB.VAL_DESCONTO, 0) / (SELECT SUM((PI.VAL_UNIT' +
        'ARIO * (1-PI.perc_desconto/100)) * (PI.QT_PEDIDO-PI.QT_CANCELADO' +
        ') * '
      '    (1-nvl(PI.perc_desconto1,0)/100) * '
      '    (1-nvl(PI.perc_desconto2,0)/100) *'
      
        '    (1+nvl(PI.perc_acrescimo,0)/100)) FROM TB_PEDIDO_ITEM PI WHE' +
        'RE PI.COD_PEDIDO_CAB = TB_PEDIDO_CAB.COD_PEDIDO_CAB) * '
      
        '  ((TB_PEDIDO_ITEM.VAL_UNITARIO * (1-TB_PEDIDO_ITEM.perc_descont' +
        'o/100)) * (TB_PEDIDO_ITEM.QT_PEDIDO-TB_PEDIDO_ITEM.QT_CANCELADO)' +
        ' * '
      '    (1-nvl(TB_PEDIDO_ITEM.perc_desconto1,0)/100) * '
      '    (1-nvl(TB_PEDIDO_ITEM.perc_desconto2,0)/100) *'
      '    (1+nvl(TB_PEDIDO_ITEM.perc_acrescimo,0)/100))) +'
      
        '  (NVL(TB_PEDIDO_CAB.VAL_DESPESAS, 0) / (SELECT SUM((PI.VAL_UNIT' +
        'ARIO * (1-PI.perc_desconto/100)) * (PI.QT_PEDIDO-PI.QT_CANCELADO' +
        ') * '
      '    (1-nvl(PI.perc_desconto1,0)/100) * '
      '    (1-nvl(PI.perc_desconto2,0)/100) *'
      
        '    (1+nvl(PI.perc_acrescimo,0)/100)) FROM TB_PEDIDO_ITEM PI WHE' +
        'RE PI.COD_PEDIDO_CAB = TB_PEDIDO_CAB.COD_PEDIDO_CAB) * '
      
        '  ((TB_PEDIDO_ITEM.VAL_UNITARIO * (1-TB_PEDIDO_ITEM.perc_descont' +
        'o/100)) * (TB_PEDIDO_ITEM.QT_PEDIDO-TB_PEDIDO_ITEM.QT_CANCELADO)' +
        ' * '
      '    (1-nvl(TB_PEDIDO_ITEM.perc_desconto1,0)/100) * '
      '    (1-nvl(TB_PEDIDO_ITEM.perc_desconto2,0)/100) *'
      
        '    (1+nvl(TB_PEDIDO_ITEM.perc_acrescimo,0)/100)))) + tb_pedido_' +
        'item.val_icms_subst AS SQT_VALOR_COM_ST,'
      
        '    SUM(DECODE(TB_OPERACAO.IND_BRINDE,'#39'S'#39',DECODE(Tb_pedido_item.' +
        'QT_PEDIDO,0,Tb_pedido_item.VAL_UNITARIO,((TB_PEDIDO_ITEM.VAL_UNI' +
        'TARIO * (1-TB_PEDIDO_ITEM.perc_desconto/100)) * (TB_PEDIDO_ITEM.' +
        'QT_PEDIDO-TB_PEDIDO_ITEM.QT_CANCELADO) * '
      '    (1-nvl(TB_PEDIDO_ITEM.perc_desconto1,0)/100) * '
      '    (1-nvl(TB_PEDIDO_ITEM.perc_desconto2,0)/100) *'
      '    (1+nvl(TB_PEDIDO_ITEM.perc_acrescimo,0)/100)) -'
      
        '  (NVL(TB_PEDIDO_CAB.VAL_DESCONTO, 0) / (SELECT SUM((PI.VAL_UNIT' +
        'ARIO * (1-PI.perc_desconto/100)) * (PI.QT_PEDIDO-PI.QT_CANCELADO' +
        ') * '
      '    (1-nvl(PI.perc_desconto1,0)/100) * '
      '    (1-nvl(PI.perc_desconto2,0)/100) *'
      
        '    (1+nvl(PI.perc_acrescimo,0)/100)) FROM TB_PEDIDO_ITEM PI WHE' +
        'RE PI.COD_PEDIDO_CAB = TB_PEDIDO_CAB.COD_PEDIDO_CAB) * '
      
        '  ((TB_PEDIDO_ITEM.VAL_UNITARIO * (1-TB_PEDIDO_ITEM.perc_descont' +
        'o/100)) * (TB_PEDIDO_ITEM.QT_PEDIDO-TB_PEDIDO_ITEM.QT_CANCELADO)' +
        ' * '
      '    (1-nvl(TB_PEDIDO_ITEM.perc_desconto1,0)/100) * '
      '    (1-nvl(TB_PEDIDO_ITEM.perc_desconto2,0)/100) *'
      '    (1+nvl(TB_PEDIDO_ITEM.perc_acrescimo,0)/100))) +'
      
        '  (NVL(TB_PEDIDO_CAB.VAL_DESPESAS, 0) / (SELECT SUM((PI.VAL_UNIT' +
        'ARIO * (1-PI.perc_desconto/100)) * (PI.QT_PEDIDO-PI.QT_CANCELADO' +
        ') * '
      '    (1-nvl(PI.perc_desconto1,0)/100) * '
      '    (1-nvl(PI.perc_desconto2,0)/100) *'
      
        '    (1+nvl(PI.perc_acrescimo,0)/100)) FROM TB_PEDIDO_ITEM PI WHE' +
        'RE PI.COD_PEDIDO_CAB = TB_PEDIDO_CAB.COD_PEDIDO_CAB) * '
      
        '  ((TB_PEDIDO_ITEM.VAL_UNITARIO * (1-TB_PEDIDO_ITEM.perc_descont' +
        'o/100)) * (TB_PEDIDO_ITEM.QT_PEDIDO-TB_PEDIDO_ITEM.QT_CANCELADO)' +
        ' * '
      '    (1-nvl(TB_PEDIDO_ITEM.perc_desconto1,0)/100) * '
      '    (1-nvl(TB_PEDIDO_ITEM.perc_desconto2,0)/100) *'
      
        '    (1+nvl(TB_PEDIDO_ITEM.perc_acrescimo,0)/100)))))) AS SVL_BRI' +
        'NDE,'
      
        '    SUM(DECODE(TB_OPERACAO.IND_BONIFICACAO,'#39'S'#39',DECODE(Tb_pedido_' +
        'item.QT_PEDIDO,0,Tb_pedido_item.VAL_UNITARIO,((TB_PEDIDO_ITEM.VA' +
        'L_UNITARIO * (1-TB_PEDIDO_ITEM.perc_desconto/100)) * (TB_PEDIDO_' +
        'ITEM.QT_PEDIDO-TB_PEDIDO_ITEM.QT_CANCELADO) * '
      '    (1-nvl(TB_PEDIDO_ITEM.perc_desconto1,0)/100) * '
      '    (1-nvl(TB_PEDIDO_ITEM.perc_desconto2,0)/100) *'
      '    (1+nvl(TB_PEDIDO_ITEM.perc_acrescimo,0)/100)) -'
      
        '  (NVL(TB_PEDIDO_CAB.VAL_DESCONTO, 0) / (SELECT SUM((PI.VAL_UNIT' +
        'ARIO * (1-PI.perc_desconto/100)) * (PI.QT_PEDIDO-PI.QT_CANCELADO' +
        ') * '
      '    (1-nvl(PI.perc_desconto1,0)/100) * '
      '    (1-nvl(PI.perc_desconto2,0)/100) *'
      
        '    (1+nvl(PI.perc_acrescimo,0)/100)) FROM TB_PEDIDO_ITEM PI WHE' +
        'RE PI.COD_PEDIDO_CAB = TB_PEDIDO_CAB.COD_PEDIDO_CAB) * '
      
        '  ((TB_PEDIDO_ITEM.VAL_UNITARIO * (1-TB_PEDIDO_ITEM.perc_descont' +
        'o/100)) * (TB_PEDIDO_ITEM.QT_PEDIDO-TB_PEDIDO_ITEM.QT_CANCELADO)' +
        ' * '
      '    (1-nvl(TB_PEDIDO_ITEM.perc_desconto1,0)/100) * '
      '    (1-nvl(TB_PEDIDO_ITEM.perc_desconto2,0)/100) *'
      '    (1+nvl(TB_PEDIDO_ITEM.perc_acrescimo,0)/100))) +'
      
        '  (NVL(TB_PEDIDO_CAB.VAL_DESPESAS, 0) / (SELECT SUM((PI.VAL_UNIT' +
        'ARIO * (1-PI.perc_desconto/100)) * (PI.QT_PEDIDO-PI.QT_CANCELADO' +
        ') * '
      '    (1-nvl(PI.perc_desconto1,0)/100) * '
      '    (1-nvl(PI.perc_desconto2,0)/100) *'
      
        '    (1+nvl(PI.perc_acrescimo,0)/100)) FROM TB_PEDIDO_ITEM PI WHE' +
        'RE PI.COD_PEDIDO_CAB = TB_PEDIDO_CAB.COD_PEDIDO_CAB) * '
      
        '  ((TB_PEDIDO_ITEM.VAL_UNITARIO * (1-TB_PEDIDO_ITEM.perc_descont' +
        'o/100)) * (TB_PEDIDO_ITEM.QT_PEDIDO-TB_PEDIDO_ITEM.QT_CANCELADO)' +
        ' * '
      '    (1-nvl(TB_PEDIDO_ITEM.perc_desconto1,0)/100) * '
      '    (1-nvl(TB_PEDIDO_ITEM.perc_desconto2,0)/100) *'
      
        '    (1+nvl(TB_PEDIDO_ITEM.perc_acrescimo,0)/100)))))) AS SVL_BON' +
        'IFICACAO'
      '  FROM'
      '    TB_EMBARQUE,'
      '    TB_EMBARQUE_ITEM,'
      '    TB_PEDIDO_CAB,'
      '    TB_PEDIDO_ITEM,'
      '    TB_CADASTRO,'
      '    TB_PRODUTO,'
      '    TB_LOTE_TIPO,'
      '    TB_OPERACAO,'
      '    TB_CLASSE,'
      '    TB_PARAM_SISTEMA'
      '  WHERE'
      '    Tb_embarque_item.COD_EMBARQUE = Tb_embarque.COD_EMBARQUE'
      '    AND'
      
        '    Tb_embarque_item.COD_PEDIDO_CAB = Tb_pedido_cab.COD_PEDIDO_C' +
        'AB'
      '    AND'
      '    Tb_pedido_cab.COD_PEDIDO_CAB = Tb_pedido_item.COD_PEDIDO_CAB'
      '    AND'
      '    Tb_Embarque.COD_TRANSPORTADOR = Tb_cadastro.COD_CADASTRO(+)'
      '    AND'
      '    Tb_pedido_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '    AND'
      '    Tb_pedido_item.COD_LOTE_TIPO = Tb_lote_tipo.COD_LOTE_TIPO'
      '    AND'
      '    Tb_pedido_cab.COD_OPERACAO = Tb_Operacao.COD_OPERACAO'
      '    AND'
      '    Tb_produto.COD_CLASSE = Tb_classe.COD_CLASSE'
      '    AND'
      '    ((:IND_LIVRO_FISCAL Is Null'
      '     Or'
      '      Tb_operacao.IND_LIVRO_FISCAL = :IND_LIVRO_FISCAL)'
      '     Or'
      
        '      ((:IND_LIVRO_FISCAL = '#39'N'#39') AND (TB_PEDIDO_CAB.PERC_SUB > 0' +
        ')))'
      '    AND'
      '    (:IND_PINTURA IS NULL'
      '     OR'
      '      Tb_produto.IND_PINTURA = :IND_PINTURA)'
      '    AND'
      '    (:IND_ESTOFARIA IS NULL'
      '     OR'
      '      Tb_produto.IND_ESTOFARIA = :IND_ESTOFARIA)'
      '    AND'
      '    (:COD_OPERACAO_NULLO IS NULL'
      '      OR'
      '      Tb_pedido_cab.COD_OPERACAO = :COD_OPERACAO1'
      '      OR'
      '      Tb_pedido_cab.COD_OPERACAO = :COD_OPERACAO2'
      '      OR'
      '      Tb_pedido_cab.COD_OPERACAO = :COD_OPERACAO3'
      '      OR'
      '      Tb_pedido_cab.COD_OPERACAO = :COD_OPERACAO4)'
      '    AND'
      '    (:EMBARQUE = TB_EMBARQUE.COD_EMBARQUE) '
      '    AND'
      '    (:CLASSE IS NULL'
      '     OR'
      '      TB_CLASSE.NUM_CLASSE =:CLASSE)'
      
        '  GROUP BY DECODE(TB_PARAM_SISTEMA.COD_EMPRESA,'#39'CGS'#39','#39'GERAL'#39',Tb_' +
        'Classe.DESC_CLASSE), Tb_Embarque.Cod_Embarque, TB_EMBARQUE.NUM_E' +
        'MBARQUE, Tb_Embarque.Dt_Embarque, Tb_Embarque.NOME_MOTORISTA, Tb' +
        '_Embarque.NUM_KILOMETRAGEM, Tb_Embarque.DESC_OBS, Tb_Embarque.DE' +
        'SC_OBS1, Tb_Embarque.COD_TRANSPORTADOR, TB_CADASTRO.NOME, Tb_pro' +
        'duto.COD_PRODUTO, Tb_produto.DESC_PRODUTO, Tb_Produto.NUM_EMBALA' +
        'GEM, TB_PRODUTO.NUM_PESO_BRUTO, TB_PRODUTO.NUM_PESO_LIQUIDO, Tb_' +
        'Produto.DESC_UNIDADE, Tb_Produto.NUM_VOLUMES, Tb_Lote_Tipo.DESC_' +
        'LOTE, TB_LOTE_TIPO.COD_LOTE_TIPO, DECODE(TB_PARAM_SISTEMA.COD_EM' +
        'PRESA,'#39'POLLYANA'#39',TB_PEDIDO_ITEM.QT_EMBALAGEM,'#39#39'), NVL(Tb_Pedido_' +
        'Cab.PERC_SUB,0), tb_pedido_item.val_icms_subst'
      ') q'
      'GROUP BY '
      '  DESC_CLASSE,'
      '  Cod_Embarque,'
      '  NUM_EMBARQUE,'
      '  Dt_Embarque,'
      '  NOME_MOTORISTA,'
      '  NUM_KILOMETRAGEM,'
      '  DESC_OBS,'
      '  DESC_OBS1,'
      '  COD_TRANSPORTADOR,'
      '  NOME_TRANSPORTADOR,'
      '  COD_PRODUTO,'
      '  DESC_PRODUTO,'
      '  NUM_EMBALAGEM,'
      '  NUM_PESO_BRUTO,'
      '  NUM_PESO_LIQUIDO,'
      '  DESC_UNIDADE,'
      '  NUM_VOLUMES,'
      '  DESC_LOTE,'
      '  COD_LOTE_TIPO,'
      '  QT_EMBALAGEM,  '
      '  COD_LOTE_TIPO'
      'ORDER BY'
      '    DESC_CLASSE, DESC_UNIDADE, DESC_PRODUTO, DESC_LOTE')
    Variables.Data = {
      030000000A000000090000003A454D4241525155450300000000000000000000
      00110000003A494E445F4C4956524F5F46495343414C05000000000000000000
      00000C0000003A494E445F50494E545552410500000000000000000000000E00
      00003A494E445F4553544F46415249410500000000000000000000000E000000
      3A434F445F4F5045524143414F310300000000000000000000000E0000003A43
      4F445F4F5045524143414F320300000000000000000000000E0000003A434F44
      5F4F5045524143414F33030000000000000000000000130000003A434F445F4F
      5045524143414F5F4E554C4C4F050000000000000000000000070000003A434C
      415353450300000000000000000000000E0000003A434F445F4F504552414341
      4F34030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000190000000C000000434F445F454D4241525155450100000000000B00
      000044545F454D4241525155450100000000000E0000004E4F4D455F4D4F544F
      5249535441010000000000100000004E554D5F4B494C4F4D4554524147454D01
      000000000008000000444553435F4F425301000000000011000000434F445F54
      52414E53504F525441444F52010000000000120000004E4F4D455F5452414E53
      504F525441444F520100000000000B000000434F445F50524F4455544F010000
      0000000C000000444553435F50524F4455544F01000000000009000000444553
      435F4C4F54450100000000000A0000005351545F50454449444F010000000000
      090000005351545F56414C4F520100000000000A0000005351545F4D4554524F
      530100000000000D0000004E554D5F454D42414C4147454D0100000000000B00
      00004E554D5F564F4C554D45530100000000000B000000444553435F434C4153
      53450100000000000C0000004E554D5F454D4241525155450100000000000C00
      0000444553435F554E49444144450100000000000A00000053564C5F4252494E
      44450100000000000F00000053564C5F424F4E494649434143414F0100000000
      0009000000444553435F4F4253310100000000000E0000004E554D5F5045534F
      5F425255544F0100000000000C00000051545F454D42414C4147454D01000000
      0000100000004E554D5F5045534F5F4C49515549444F0100000000000B000000
      5351545F4553544F515545010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    OnCalcFields = QREmbarque2CalcFields
    Left = 384
    Top = 56
    object QREmbarque2COD_EMBARQUE: TIntegerField
      FieldName = 'COD_EMBARQUE'
      Required = True
    end
    object QREmbarque2DT_EMBARQUE: TDateTimeField
      FieldName = 'DT_EMBARQUE'
      Required = True
    end
    object QREmbarque2NOME_MOTORISTA: TStringField
      FieldName = 'NOME_MOTORISTA'
      Size = 50
    end
    object QREmbarque2NUM_KILOMETRAGEM: TStringField
      FieldName = 'NUM_KILOMETRAGEM'
      Size = 8
    end
    object QREmbarque2COD_TRANSPORTADOR: TIntegerField
      FieldName = 'COD_TRANSPORTADOR'
    end
    object QREmbarque2NOME_TRANSPORTADOR: TStringField
      FieldName = 'NOME_TRANSPORTADOR'
      Required = True
      Size = 50
    end
    object QREmbarque2COD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QREmbarque2DESC_LOTE: TStringField
      FieldName = 'DESC_LOTE'
    end
    object QREmbarque2SQT_VALOR: TFloatField
      FieldName = 'SQT_VALOR'
    end
    object QREmbarque2SQT_PEDIDO: TFloatField
      FieldName = 'SQT_PEDIDO'
    end
    object QREmbarque2SQT_METROS: TFloatField
      FieldName = 'SQT_METROS'
    end
    object QREmbarque2NUM_EMBALAGEM: TFloatField
      FieldName = 'NUM_EMBALAGEM'
    end
    object QREmbarque2NUM_VOLUMES: TFloatField
      FieldName = 'NUM_VOLUMES'
    end
    object QREmbarque2sqt_embalagem: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sqt_embalagem'
      Calculated = True
    end
    object QREmbarque2DESC_CLASSE: TStringField
      FieldName = 'DESC_CLASSE'
      Size = 30
    end
    object QREmbarque2NUM_EMBARQUE: TIntegerField
      FieldName = 'NUM_EMBARQUE'
    end
    object QREmbarque2DESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 75
    end
    object QREmbarque2sqt_embalagem_liq: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sqt_embalagem_liq'
      Calculated = True
    end
    object QREmbarque2DESC_UNIDADE: TStringField
      FieldName = 'DESC_UNIDADE'
      Size = 3
    end
    object QREmbarque2SVL_BRINDE: TFloatField
      FieldName = 'SVL_BRINDE'
    end
    object QREmbarque2SVL_BONIFICACAO: TFloatField
      FieldName = 'SVL_BONIFICACAO'
    end
    object QREmbarque2DESC_OBS: TStringField
      FieldName = 'DESC_OBS'
      Size = 100
    end
    object QREmbarque2DESC_OBS1: TStringField
      FieldName = 'DESC_OBS1'
      Size = 100
    end
    object QREmbarque2NUM_PESO_BRUTO: TFloatField
      FieldName = 'NUM_PESO_BRUTO'
    end
    object QREmbarque2QT_EMBALAGEM: TFloatField
      FieldName = 'QT_EMBALAGEM'
    end
    object QREmbarque2NUM_PESO_LIQUIDO: TFloatField
      FieldName = 'NUM_PESO_LIQUIDO'
    end
    object QREmbarque2SQT_ESTOQUE: TFloatField
      FieldName = 'SQT_ESTOQUE'
    end
  end
  object QREmbarque: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  Tb_cadastro.COD_CADASTRO,'
      '  Tb_cadastro.NOME,'
      '  Tb_cadastro.DESC_ENDERECO,'
      '  Tb_cadastro.DESC_BAIRRO,'
      '  Tb_Cadastro.DESC_CEP,'
      '  Tb_cadastro.DESC_CIDADE,'
      '  Tb_cadastro.COD_ESTADO,'
      '  Tb_cadastro.NUM_CGC_CPF,'
      '  Tb_cadastro.NUM_INSCRICAO,'
      '  tb_cadastro.desc_fantasia,'
      '  Tb_pedido_cab.COD_VENDEDOR,'
      '  Tb_pedido_cab.DT_EMISSAO,'
      '  Tb_pedido_cab.DESC_OBSERVACAO,'
      '  Tb_pedido_cab.DESC_COMPLEMENTO_OBS,'
      '  Tb_pedido_cab.IND_TIPO_PAGAMENTO,'
      '  Tb_Pedido_cab.COD_PEDIDO_CAB,'
      '  Tb_pedido_cab.NUM_PEDIDO,'
      '  Tb_pedido_cab.DESC_TECIDO,'
      '  Tb_pedido_cab.DESC_VEICULO,'
      '  Tb_pedido_cab.DESC_CHASSI,'
      '  TB_PEDIDO_CAB.COD_PRAZO_VENCIMENTO,'
      '  TB_PEDIDO_CAB.COD_OPERACAO,'
      '  Tb_produto.COD_PRODUTO,'
      '  Tb_produto.DESC_PRODUTO,'
      '  Tb_Lote_Tipo.Desc_Lote,'
      '  Tb_pedido_item.Cod_Pedido_Item,'
      
        '  Tb_pedido_item.QT_PEDIDO-Tb_pedido_item.QT_CANCELADO AS SQT_PE' +
        'DIDO,'
      '  Tb_pedido_item.VAL_UNITARIO,'
      
        '  ((TB_PEDIDO_ITEM.VAL_UNITARIO * (1-TB_PEDIDO_ITEM.perc_descont' +
        'o/100)) * (TB_PEDIDO_ITEM.QT_PEDIDO-TB_PEDIDO_ITEM.QT_CANCELADO)' +
        ' * '
      '    (1-nvl(TB_PEDIDO_ITEM.perc_desconto1,0)/100) * '
      '    (1-nvl(TB_PEDIDO_ITEM.perc_desconto2,0)/100) *'
      '    (1+nvl(TB_PEDIDO_ITEM.perc_acrescimo,0)/100)) -'
      
        '  (NVL(TB_PEDIDO_CAB.VAL_DESCONTO, 0) / (SELECT SUM((PI.VAL_UNIT' +
        'ARIO * (1-PI.perc_desconto/100)) * (PI.QT_PEDIDO-PI.QT_CANCELADO' +
        ') * '
      '    (1-nvl(PI.perc_desconto1,0)/100) * '
      '    (1-nvl(PI.perc_desconto2,0)/100) *'
      
        '    (1+nvl(PI.perc_acrescimo,0)/100)) FROM TB_PEDIDO_ITEM PI WHE' +
        'RE PI.COD_PEDIDO_CAB = TB_PEDIDO_CAB.COD_PEDIDO_CAB) * '
      
        '  ((TB_PEDIDO_ITEM.VAL_UNITARIO * (1-TB_PEDIDO_ITEM.perc_descont' +
        'o/100)) * (TB_PEDIDO_ITEM.QT_PEDIDO-TB_PEDIDO_ITEM.QT_CANCELADO)' +
        ' * '
      '    (1-nvl(TB_PEDIDO_ITEM.perc_desconto1,0)/100) * '
      '    (1-nvl(TB_PEDIDO_ITEM.perc_desconto2,0)/100) *'
      '    (1+nvl(TB_PEDIDO_ITEM.perc_acrescimo,0)/100))) +'
      
        '  (NVL(TB_PEDIDO_CAB.VAL_DESPESAS, 0) / (SELECT SUM((PI.VAL_UNIT' +
        'ARIO * (1-PI.perc_desconto/100)) * (PI.QT_PEDIDO-PI.QT_CANCELADO' +
        ') * '
      '    (1-nvl(PI.perc_desconto1,0)/100) * '
      '    (1-nvl(PI.perc_desconto2,0)/100) *'
      
        '    (1+nvl(PI.perc_acrescimo,0)/100)) FROM TB_PEDIDO_ITEM PI WHE' +
        'RE PI.COD_PEDIDO_CAB = TB_PEDIDO_CAB.COD_PEDIDO_CAB) * '
      
        '  ((TB_PEDIDO_ITEM.VAL_UNITARIO * (1-TB_PEDIDO_ITEM.perc_descont' +
        'o/100)) * (TB_PEDIDO_ITEM.QT_PEDIDO-TB_PEDIDO_ITEM.QT_CANCELADO)' +
        ' * '
      '    (1-nvl(TB_PEDIDO_ITEM.perc_desconto1,0)/100) * '
      '    (1-nvl(TB_PEDIDO_ITEM.perc_desconto2,0)/100) *'
      '    (1+nvl(TB_PEDIDO_ITEM.perc_acrescimo,0)/100))) AS VAL_TOTAL,'
      '  TB_PEDIDO_ITEM.QT_QUANTIDADE_AUX,'
      '  TB_PEDIDO_ITEM.QT_EMBALAGEM,'
      '  Tb_Embarque_Item.COD_EMBARQUE,'
      '  Tb_Embarque_Item.Qt_Pes,'
      '  Tb_Embarque_Item.Qt_Vidros,'
      '  Tb_Embarque.Nome_Motorista,'
      '  Tb_Embarque.DT_PREV_RETORNO,'
      '  TB_EMBARQUE.IND_CONFERIDO_MOTORISTA,'
      '  TB_EMBARQUE.DT_EMBARQUE,'
      '  Tb_Embarque_Item.Num_Sequencial,'
      '  Tb_Vendedor.NOME AS NOME_VENDEDOR,'
      
        '  TB_EMBARQUE.DESC_OBS || '#39' - '#39' || TB_EMBARQUE.DESC_OBS1 || '#39' - ' +
        #39' || TB_EMBARQUE.DESC_OBS2 || '#39' - '#39' || TB_EMBARQUE.DESC_OBS3 || ' +
        #39' - '#39' || TB_EMBARQUE.DESC_OBS4 AS DESC_OBS_EMBARQUE,'
      '  TB_IMAGEM_PEDIDO.IMG_IMAGEM,'
      '  TB_PRAZO_VENCIMENTO.DESC_PRAZO_VENCIMENTO,'
      '  tb_pedido_item.val_icms_subst,'
      '  tb_pedido_item.cod_tributacao'
      'FROM'
      '  TB_EMBARQUE,'
      '  TB_EMBARQUE_ITEM,'
      '  TB_PEDIDO_CAB,'
      '  TB_PEDIDO_ITEM,'
      '  TB_CADASTRO,'
      '  TB_PRODUTO,'
      '  TB_LOTE_TIPO,'
      '  TB_OPERACAO,'
      '  TB_VENDEDOR,'
      '  TB_IMAGEM_PEDIDO,'
      '  TB_PRAZO_VENCIMENTO'
      'WHERE'
      '  Tb_embarque_item.COD_EMBARQUE = Tb_embarque.COD_EMBARQUE'
      '  AND'
      '  Tb_embarque_item.COD_PEDIDO_CAB = Tb_pedido_cab.COD_PEDIDO_CAB'
      '  AND'
      '  Tb_pedido_cab.COD_PEDIDO_CAB = Tb_pedido_item.COD_PEDIDO_CAB'
      '  AND'
      '  Tb_pedido_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO'
      '  AND'
      '  Tb_pedido_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '  AND'
      '  Tb_pedido_item.COD_LOTE_TIPO = Tb_Lote_Tipo.COD_LOTE_TIPO'
      '  AND'
      '  Tb_pedido_cab.COD_OPERACAO = Tb_Operacao.COD_OPERACAO'
      '  AND'
      '  Tb_pedido_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR(+)'
      '  AND'
      
        '  TB_PEDIDO_CAB.COD_PEDIDO_CAB = TB_IMAGEM_PEDIDO.COD_PEDIDO_CAB' +
        '(+)'
      '  AND'
      
        '  TB_PEDIDO_CAB.COD_PRAZO_VENCIMENTO = TB_PRAZO_VENCIMENTO.COD_P' +
        'RAZO_VENCIMENTO(+)'
      '  AND'
      '  ((:IND_LIVRO_FISCAL Is Null'
      '   Or'
      '    Tb_operacao.IND_LIVRO_FISCAL = :IND_LIVRO_FISCAL)'
      '   Or'
      
        '    ((:IND_LIVRO_FISCAL = '#39'N'#39') AND (TB_PEDIDO_CAB.PERC_SUB > 0))' +
        ')'
      '  AND'
      '  (:IND_PINTURA IS NULL'
      '   OR'
      '    Tb_produto.IND_PINTURA = :IND_PINTURA)'
      '  AND'
      '  (:IND_ESTOFARIA IS NULL'
      '   OR'
      '    Tb_produto.IND_ESTOFARIA = :IND_ESTOFARIA)'
      '  AND'
      '  (:COD_OPERACAO_NULLO IS NULL'
      '    OR'
      '    Tb_pedido_cab.COD_OPERACAO = :COD_OPERACAO1'
      '    OR'
      '    Tb_pedido_cab.COD_OPERACAO = :COD_OPERACAO2'
      '    OR'
      '    Tb_pedido_cab.COD_OPERACAO = :COD_OPERACAO3'
      '    OR'
      '    Tb_pedido_cab.COD_OPERACAO = :COD_OPERACAO4)'
      '  AND'
      '  (:EMBARQUE = TB_EMBARQUE.COD_EMBARQUE)'
      'order by cod_pedido_cab')
    Variables.Data = {
      030000000A000000090000003A454D4241525155450300000000000000000000
      00110000003A494E445F4C4956524F5F46495343414C05000000000000000000
      00000C0000003A494E445F50494E545552410500000000000000000000000E00
      00003A494E445F4553544F46415249410500000000000000000000000E000000
      3A434F445F4F5045524143414F310300000000000000000000000E0000003A43
      4F445F4F5045524143414F320300000000000000000000000E0000003A434F44
      5F4F5045524143414F330300000000000000000000000E0000003A434F445F4F
      5045524143414F34030000000000000000000000130000003A434F445F4F5045
      524143414F5F4E554C4C4F050000000000000000000000060000003A4F524445
      4D010000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000002F0000000E000000434F445F50454449444F5F434142010000000000
      0A0000004E554D5F50454449444F0100000000000C000000434F445F43414441
      5354524F010000000000040000004E4F4D450100000000000800000044455343
      5F4345500100000000000C000000434F445F56454E4445444F52010000000000
      0A00000044545F454D495353414F0100000000000B000000444553435F434944
      4144450100000000000A000000434F445F45535441444F0100000000000F0000
      00444553435F4F42534552564143414F0100000000000B000000434F445F5052
      4F4455544F0100000000000C000000444553435F50524F4455544F0100000000
      0009000000444553435F4C4F54450100000000000F000000434F445F50454449
      444F5F4954454D0100000000000A0000005351545F50454449444F0100000000
      000600000051545F5045530100000000000900000051545F564944524F530100
      000000000E0000004E4F4D455F4D4F544F52495354410100000000000E000000
      4E554D5F53455155454E4349414C0100000000000B0000004E554D5F4347435F
      4350460100000000000D0000004E554D5F494E5343524943414F010000000000
      12000000494E445F5449504F5F504147414D454E544F01000000000014000000
      444553435F434F4D504C454D454E544F5F4F42530100000000000C0000005641
      4C5F554E49544152494F0100000000000900000056414C5F544F54414C010000
      0000000D000000444553435F454E44455245434F0100000000000B0000004445
      53435F42414952524F0100000000001100000051545F5155414E544944414445
      5F4155580100000000000C00000051545F454D42414C4147454D010000000000
      0C000000434F445F454D42415251554501000000000017000000494E445F434F
      4E46455249444F5F4D4F544F52495354410100000000000B000000444553435F
      54454349444F0100000000000D0000004E4F4D455F56454E4445444F52010000
      0000000F00000044545F505245565F5245544F524E4F0100000000000B000000
      44545F454D4241525155450100000000000C000000444553435F56454943554C
      4F0100000000000B000000444553435F43484153534901000000000011000000
      444553435F4F42535F454D4241525155450100000000000A000000494D475F49
      4D4147454D0000000000000D000000444553435F46414E544153494101000000
      000014000000434F445F5052415A4F5F56454E43494D454E544F010000000000
      15000000444553435F5052415A4F5F56454E43494D454E544F0100000000000E
      00000056414C5F49434D535F53554253540100000000000C000000434F445F4F
      5045524143414F0100000000000E000000434F445F5452494255544143414F01
      00000000000C00000056414C5F444553434F4E544F0100000000000C00000056
      414C5F4445535045534153010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    Left = 384
    Top = 8
    object QREmbarqueCOD_PEDIDO_CAB: TIntegerField
      FieldName = 'COD_PEDIDO_CAB'
      Required = True
    end
    object QREmbarqueNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object QREmbarqueCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QREmbarqueNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object QREmbarqueDESC_ENDERECO: TStringField
      FieldName = 'DESC_ENDERECO'
      Size = 40
    end
    object QREmbarqueDESC_CEP: TStringField
      FieldName = 'DESC_CEP'
      Size = 9
    end
    object QREmbarqueCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object QREmbarqueDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
    object QREmbarqueDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      Size = 30
    end
    object QREmbarqueCOD_ESTADO: TStringField
      FieldName = 'COD_ESTADO'
      Size = 2
    end
    object QREmbarqueDESC_OBSERVACAO: TStringField
      FieldName = 'DESC_OBSERVACAO'
      Size = 60
    end
    object QREmbarqueCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QREmbarqueDESC_LOTE: TStringField
      FieldName = 'DESC_LOTE'
    end
    object QREmbarqueCOD_PEDIDO_ITEM: TIntegerField
      FieldName = 'COD_PEDIDO_ITEM'
      Required = True
    end
    object QREmbarqueSQT_PEDIDO: TFloatField
      FieldName = 'SQT_PEDIDO'
      DisplayFormat = '###,###,##0.00'
    end
    object QREmbarqueQT_PES: TIntegerField
      FieldName = 'QT_PES'
    end
    object QREmbarqueQT_VIDROS: TIntegerField
      FieldName = 'QT_VIDROS'
    end
    object QREmbarqueNOME_MOTORISTA: TStringField
      FieldName = 'NOME_MOTORISTA'
      Size = 50
    end
    object QREmbarqueNUM_SEQUENCIAL: TIntegerField
      FieldName = 'NUM_SEQUENCIAL'
    end
    object QREmbarqueNUM_CGC_CPF: TStringField
      FieldName = 'NUM_CGC_CPF'
      Size = 18
    end
    object QREmbarqueNUM_INSCRICAO: TStringField
      FieldName = 'NUM_INSCRICAO'
    end
    object QREmbarqueIND_TIPO_PAGAMENTO: TStringField
      FieldName = 'IND_TIPO_PAGAMENTO'
      Size = 10
    end
    object QREmbarqueDESC_COMPLEMENTO_OBS: TStringField
      FieldName = 'DESC_COMPLEMENTO_OBS'
      Size = 60
    end
    object QREmbarqueVAL_UNITARIO: TFloatField
      FieldName = 'VAL_UNITARIO'
      Required = True
    end
    object QREmbarqueVAL_TOTAL: TFloatField
      FieldName = 'VAL_TOTAL'
    end
    object QREmbarqueDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
    object QREmbarqueDESC_BAIRRO: TStringField
      FieldName = 'DESC_BAIRRO'
    end
    object QREmbarqueQT_QUANTIDADE_AUX: TFloatField
      FieldName = 'QT_QUANTIDADE_AUX'
    end
    object QREmbarqueQT_EMBALAGEM: TFloatField
      FieldName = 'QT_EMBALAGEM'
    end
    object QREmbarqueCOD_EMBARQUE: TIntegerField
      FieldName = 'COD_EMBARQUE'
      Required = True
    end
    object QREmbarqueIND_CONFERIDO_MOTORISTA: TStringField
      FieldName = 'IND_CONFERIDO_MOTORISTA'
      Size = 1
    end
    object QREmbarqueDESC_TECIDO: TStringField
      FieldName = 'DESC_TECIDO'
      Size = 100
    end
    object QREmbarqueNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 40
    end
    object QREmbarqueDT_PREV_RETORNO: TDateTimeField
      FieldName = 'DT_PREV_RETORNO'
    end
    object QREmbarqueDT_EMBARQUE: TDateTimeField
      FieldName = 'DT_EMBARQUE'
      Required = True
    end
    object QREmbarqueDESC_VEICULO: TStringField
      FieldName = 'DESC_VEICULO'
      Size = 100
    end
    object QREmbarqueDESC_CHASSI: TStringField
      FieldName = 'DESC_CHASSI'
      Size = 50
    end
    object QREmbarqueDESC_OBS_EMBARQUE: TStringField
      FieldName = 'DESC_OBS_EMBARQUE'
      Size = 512
    end
    object QREmbarqueDESC_FANTASIA: TStringField
      FieldName = 'DESC_FANTASIA'
      Size = 30
    end
    object QREmbarqueCOD_PRAZO_VENCIMENTO: TIntegerField
      FieldName = 'COD_PRAZO_VENCIMENTO'
    end
    object QREmbarqueDESC_PRAZO_VENCIMENTO: TStringField
      FieldName = 'DESC_PRAZO_VENCIMENTO'
      Size = 30
    end
    object QREmbarqueVAL_ICMS_SUBST: TFloatField
      FieldName = 'VAL_ICMS_SUBST'
    end
    object QREmbarqueCOD_OPERACAO: TIntegerField
      FieldName = 'COD_OPERACAO'
    end
    object QREmbarqueCOD_TRIBUTACAO: TIntegerField
      FieldName = 'COD_TRIBUTACAO'
    end
    object QREmbarqueIMG_IMAGEM: TBlobField
      FieldName = 'IMG_IMAGEM'
      BlobType = ftOraBlob
    end
  end
  object QREmbarque3: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  DESC_CIDADE,'
      '  SUM(SQT_BONIFICACAO) AS SQT_BONIFICACAO,'
      '  SUM(SQT_BRINDE) AS SQT_BRINDE,'
      '  SUM(SQT_VENDA) AS SQT_VENDA,'
      '  SUM(SQTDE_CIDADE) AS SQTDE_CIDADE'
      'FROM'
      ' ('
      '  SELECT'
      '    Tb_cadastro.DESC_CIDADE,'
      '    0 AS SQT_BONIFICACAO,'
      '    0 AS SQT_BRINDE,'
      '    0 AS SQT_VENDA,'
      '    COUNT(*) AS SQTDE_CIDADE'
      '  FROM'
      '    TB_EMBARQUE,'
      '    TB_EMBARQUE_ITEM,'
      '    TB_PEDIDO_CAB,'
      '    TB_CADASTRO,'
      '    TB_OPERACAO'
      '  WHERE'
      '    Tb_embarque.COD_EMBARQUE = Tb_embarque_item.COD_EMBARQUE'
      '    AND'
      
        '    Tb_embarque_item.COD_PEDIDO_CAB = Tb_pedido_cab.COD_PEDIDO_C' +
        'AB'
      '    AND'
      '    Tb_pedido_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO'
      '    AND'
      '    Tb_pedido_cab.COD_OPERACAO = Tb_Operacao.COD_OPERACAO'
      '    AND'
      '    (:IND_LIVRO_FISCAL Is Null'
      '     Or'
      '      Tb_operacao.IND_LIVRO_FISCAL = :IND_LIVRO_FISCAL)'
      '    AND'
      '    (:COD_OPERACAO_NULLO IS NULL'
      '      OR'
      '      Tb_pedido_cab.COD_OPERACAO = :COD_OPERACAO1'
      '      OR'
      '      Tb_pedido_cab.COD_OPERACAO = :COD_OPERACAO2'
      '      OR'
      '      Tb_pedido_cab.COD_OPERACAO = :COD_OPERACAO3'
      '      OR'
      '      Tb_pedido_cab.COD_OPERACAO = :COD_OPERACAO4)'
      '    AND'
      '    (:EMBARQUE = TB_EMBARQUE.COD_EMBARQUE)'
      '  GROUP BY'
      '    Tb_cadastro.DESC_CIDADE'
      ''
      '  UNION ALL'
      ''
      '  SELECT'
      '    Tb_cadastro.DESC_CIDADE,'
      
        '    SUM(Decode(Tb_Operacao.ind_bonificacao,'#39'S'#39',Tb_pedido_item.QT' +
        '_PEDIDO-Tb_pedido_item.QT_CANCELADO,0)) AS SQT_BONIFICACAO,'
      
        '    SUM(Decode(Tb_Operacao.ind_brinde,'#39'S'#39',Tb_pedido_item.QT_PEDI' +
        'DO-Tb_pedido_item.QT_CANCELADO,0)) AS SQT_BRINDE,'
      
        '    SUM(Decode(Tb_Operacao.ind_vendas,'#39'V'#39',Tb_pedido_item.QT_PEDI' +
        'DO-Tb_pedido_item.QT_CANCELADO,0)) AS SQT_VENDA,'
      '    0 AS SQTDE_CIDADE'
      '  FROM'
      '    TB_EMBARQUE,'
      '    TB_EMBARQUE_ITEM,'
      '    TB_PEDIDO_CAB,'
      '    TB_PEDIDO_ITEM,'
      '    TB_CADASTRO,'
      '    TB_OPERACAO'
      '  WHERE'
      '    Tb_embarque.COD_EMBARQUE = Tb_embarque_item.COD_EMBARQUE'
      '    AND'
      
        '    Tb_embarque_item.COD_PEDIDO_CAB = Tb_pedido_cab.COD_PEDIDO_C' +
        'AB'
      '    AND'
      '    Tb_pedido_cab.COD_PEDIDO_CAB = Tb_pedido_item.COD_PEDIDO_CAB'
      '    AND'
      '    Tb_pedido_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO'
      '    AND'
      '    Tb_pedido_cab.COD_OPERACAO = Tb_Operacao.COD_OPERACAO'
      '    AND'
      '    (:IND_LIVRO_FISCAL Is Null'
      '     Or'
      '      Tb_operacao.IND_LIVRO_FISCAL = :IND_LIVRO_FISCAL)'
      '    AND'
      '    (:COD_OPERACAO_NULLO IS NULL'
      '      OR'
      '      Tb_pedido_cab.COD_OPERACAO = :COD_OPERACAO1'
      '      OR'
      '      Tb_pedido_cab.COD_OPERACAO = :COD_OPERACAO2'
      '      OR'
      '      Tb_pedido_cab.COD_OPERACAO = :COD_OPERACAO3'
      '      OR'
      '      Tb_pedido_cab.COD_OPERACAO = :COD_OPERACAO4)'
      '    AND'
      '    (:EMBARQUE = TB_EMBARQUE.COD_EMBARQUE)'
      '  GROUP BY'
      '    Tb_cadastro.DESC_CIDADE'
      '  )'
      '  GROUP BY'
      '    DESC_CIDADE'
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Variables.Data = {
      0300000007000000090000003A454D4241525155450300000000000000000000
      00110000003A494E445F4C4956524F5F46495343414C05000000000000000000
      00000E0000003A434F445F4F5045524143414F31030000000000000000000000
      0E0000003A434F445F4F5045524143414F320300000000000000000000000E00
      00003A434F445F4F5045524143414F330300000000000000000000000E000000
      3A434F445F4F5045524143414F34030000000000000000000000130000003A43
      4F445F4F5045524143414F5F4E554C4C4F050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000050000000C00000053515444455F4349444144450100000000000B00
      0000444553435F4349444144450100000000000F0000005351545F424F4E4946
      49434143414F0100000000000A0000005351545F4252494E4445010000000000
      090000005351545F56454E4441010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    Left = 384
    Top = 104
    object QREmbarque3SQTDE_CIDADE: TFloatField
      FieldName = 'SQTDE_CIDADE'
    end
    object QREmbarque3DESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      Size = 30
    end
    object QREmbarque3SQT_BONIFICACAO: TFloatField
      FieldName = 'SQT_BONIFICACAO'
    end
    object QREmbarque3SQT_BRINDE: TFloatField
      FieldName = 'SQT_BRINDE'
    end
    object QREmbarque3SQT_VENDA: TFloatField
      FieldName = 'SQT_VENDA'
    end
  end
  object QEmbarqueCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  DISTINCT E.COD_EMBARQUE,'
      '  E.DT_EMBARQUE,'
      '  E.NOME_MOTORISTA,'
      '  E.COD_TRANSPORTADOR,'
      '  E.DESC_PLACA,'
      '  E.DESC_OBS,'
      '  C.NOME,'
      '  E.NUM_EMBARQUE'
      'FROM'
      '  TB_EMBARQUE E'
      'LEFT JOIN'
      '  TB_CADASTRO C'
      'ON'
      '  C.COD_CADASTRO = E.COD_TRANSPORTADOR'
      'LEFT JOIN'
      '  TB_EMBARQUE_ITEM E_ITEM'
      'ON'
      '  E_ITEM.COD_EMBARQUE = E.COD_EMBARQUE'
      'LEFT JOIN'
      '  TB_PEDIDO_CAB P'
      'ON'
      '  P.COD_PEDIDO_CAB = E_ITEM.COD_PEDIDO_CAB'
      'WHERE'
      '  E.DT_EMBARQUE >= :DATA_I'
      '  AND'
      '  E.DT_EMBARQUE <= :DATA_F'
      '  AND'
      '  (:TRANSPORTADOR IS NULL OR'
      '   :TRANSPORTADOR = E.COD_TRANSPORTADOR)'
      '  AND'
      '  (:DESC_CHASSI IS NULL OR'
      '   :DESC_CHASSI = P.DESC_CHASSI)'
      'ORDER BY'
      '  E.DT_EMBARQUE,'
      '  E.COD_EMBARQUE'
      '  '
      '')
    Variables.Data = {
      0300000004000000070000003A444154415F490C000000000000000000000007
      0000003A444154415F460C00000000000000000000000E0000003A5452414E53
      504F525441444F520300000000000000000000000C0000003A444553435F4348
      41535349050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000080000000C000000434F445F454D4241525155450100000000000B00
      000044545F454D4241525155450100000000000E0000004E4F4D455F4D4F544F
      524953544101000000000011000000434F445F5452414E53504F525441444F52
      010000000000040000004E4F4D450100000000000A000000444553435F504C41
      434101000000000008000000444553435F4F42530100000000000C0000004E55
      4D5F454D424152515545010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    Left = 262
    Top = 8
    object QEmbarqueConsCOD_EMBARQUE: TIntegerField
      FieldName = 'COD_EMBARQUE'
      Required = True
    end
    object QEmbarqueConsDT_EMBARQUE: TDateTimeField
      FieldName = 'DT_EMBARQUE'
      Required = True
    end
    object QEmbarqueConsNOME_MOTORISTA: TStringField
      FieldName = 'NOME_MOTORISTA'
      Size = 50
    end
    object QEmbarqueConsCOD_TRANSPORTADOR: TIntegerField
      FieldName = 'COD_TRANSPORTADOR'
    end
    object QEmbarqueConsNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object QEmbarqueConsDESC_PLACA: TStringField
      FieldName = 'DESC_PLACA'
      Size = 8
    end
    object QEmbarqueConsDESC_OBS: TStringField
      FieldName = 'DESC_OBS'
      Size = 100
    end
    object QEmbarqueConsNUM_EMBARQUE: TIntegerField
      FieldName = 'NUM_EMBARQUE'
    end
  end
  object QEmbarqueItem: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  COD_EMBARQUE,'
      '  COD_PEDIDO_CAB,'
      '  QT_PES,'
      '  QT_VIDROS,'
      '  NUM_SEQUENCIAL'
      'FROM'
      '  TB_EMBARQUE_ITEM'
      'WHERE'
      '  COD_EMBARQUE = :COD_EMBARQUE'
      ''
      'ORDER BY'
      '  NUM_SEQUENCIAL'
      '')
    Variables.Data = {
      03000000010000000D0000003A434F445F454D42415251554503000000000000
      0000000000}
    OracleDictionary.DefaultValues = True
    QBEDefinition.QBEFieldDefs = {
      04000000050000000C000000434F445F454D4241525155450100000000000E00
      0000434F445F50454449444F5F4341420100000000000600000051545F504553
      0100000000000900000051545F564944524F530100000000000E0000004E554D
      5F53455155454E4349414C010000000000}
    Master = QEmbarque
    MasterFields = 'COD_EMBARQUE'
    DetailFields = 'COD_EMBARQUE'
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    BeforeInsert = QEmbarqueItemBeforeInsert
    AfterInsert = QEmbarqueItemAfterInsert
    BeforeEdit = QEmbarqueItemBeforeEdit
    BeforePost = QEmbarqueItemBeforePost
    AfterPost = QEmbarqueItemAfterPost
    BeforeDelete = QEmbarqueItemBeforeDelete
    OnCalcFields = QEmbarqueItemCalcFields
    Left = 152
    Top = 8
    object QEmbarqueItemCOD_EMBARQUE: TIntegerField
      FieldName = 'COD_EMBARQUE'
      Required = True
    end
    object QEmbarqueItemCOD_PEDIDO_CAB: TIntegerField
      FieldName = 'COD_PEDIDO_CAB'
      Required = True
      OnChange = QEmbarqueItemCOD_PEDIDO_CABChange
    end
    object QEmbarqueItemQT_PES: TIntegerField
      FieldName = 'QT_PES'
    end
    object QEmbarqueItemQT_VIDROS: TIntegerField
      FieldName = 'QT_VIDROS'
    end
    object QEmbarqueItemNUM_SEQUENCIAL: TIntegerField
      FieldName = 'NUM_SEQUENCIAL'
    end
    object QEmbarqueItemnome_cliente: TStringField
      FieldKind = fkCalculated
      FieldName = 'nome_cliente'
      Size = 40
      Calculated = True
    end
    object QEmbarqueItemnum_pedido: TStringField
      FieldKind = fkCalculated
      FieldName = 'num_pedido'
      Size = 30
      Calculated = True
    end
    object QEmbarqueItemcidade_cliente: TStringField
      FieldKind = fkCalculated
      FieldName = 'cidade_cliente'
      Size = 30
      Calculated = True
    end
  end
  object QEmbarque: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_EMBARQUE.*'
      'FROM'
      '  TB_EMBARQUE'
      'WHERE'
      '  TB_EMBARQUE.COD_EMBARQUE = :PK')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_EMBARQUE'
    SequenceField.Sequence = 'SQEMBARQUE'
    SequenceField.ApplyMoment = amOnNewRecord
    OracleDictionary.DefaultValues = True
    QBEDefinition.QBEFieldDefs = {
      040000002D0000000C000000434F445F454D4241525155450100000000000B00
      000044545F454D4241525155450100000000000E0000004E4F4D455F4D4F544F
      524953544101000000000011000000434F445F5452414E53504F525441444F52
      010000000000100000004E554D5F4B494C4F4D4554524147454D010000000000
      08000000444553435F4F42530100000000000C000000494E445F534954554143
      414F01000000000014000000494E445F415455414C495A415F4553544F515545
      0100000000001300000044545F415455414C495A415F4553544F515545010000
      0000000C0000004E554D5F454D4241525155450100000000000A000000444553
      435F504C4143410100000000000D000000494E445F424C4F51554541444F0100
      000000000D000000434F445F4D4F544F52495354410100000000001000000049
      4E445F5449504F5F56454943554C4F01000000000012000000444553435F4445
      5354494E4F5F4652455445010000000000180000004E554D5F4B494C4F4D4554
      524147454D5F434845474144410100000000000F00000056414C5F414A554441
      5F435553544F0100000000000E00000056414C5F4144544F5F46524554450100
      000000000600000056414C5F4B4D01000000000013000000434F445F434F4E54
      415F50414741525F4341420100000000000D00000044545F56454E43494D454E
      544F0100000000000B000000434F445F5553554152494F0100000000000A0000
      0044545F5553554152494F0100000000000900000056414C5F46524554450100
      000000000F00000056414C5F544F54414C5F4652455445010000000000100000
      00494E445F41434552544F5F46524554450100000000001200000056414C5F43
      4F4E545241544F5F46524554450100000000000F00000044545F505245565F52
      45544F524E4F010000000000130000004E554D5F505245565F4B4D5F5245544F
      524E4F0100000000000B00000056414C5F5045444147494F0100000000001B00
      0000434F445F434F4E54415F50414741525F4341425F5045444147494F010000
      00000018000000434F445F434F4E54415F50414741525F4341425F4144544F01
      00000000000800000056414C5F49434D5301000000000018000000434F445F43
      4F4E54415F50414741525F4341425F49434D530100000000001500000056414C
      5F46524554455F434F4D504C454D454E544F01000000000019000000434F445F
      434F4E54415F50414741525F4341425F434F4D504C0100000000000D0000004E
      554D5F4D414E49464553544F0100000000000D00000056414C5F4D414E494645
      53544F01000000000017000000494E445F434F4E46455249444F5F4D4F544F52
      4953544101000000000009000000444553435F4F425331010000000000090000
      00444553435F4F42533201000000000009000000444553435F4F425333010000
      00000009000000444553435F4F42533401000000000019000000494E445F5349
      4E435F4D41585F524F54454952495A41444F520100000000001400000044545F
      46454348414D454E544F5F4D4158494D41010000000000}
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    AfterOpen = QEmbarqueAfterOpen
    BeforeInsert = QEmbarqueBeforeInsert
    AfterInsert = QEmbarqueAfterInsert
    BeforeEdit = QEmbarqueBeforeEdit
    AfterEdit = QEmbarqueAfterEdit
    BeforePost = QEmbarqueBeforePost
    AfterPost = QEmbarqueAfterPost
    AfterCancel = QEmbarqueAfterCancel
    BeforeDelete = QEmbarqueBeforeDelete
    AfterDelete = QEmbarqueAfterDelete
    OnCalcFields = QEmbarqueCalcFields
    OnDeleteError = QEmbarqueDeleteError
    Left = 48
    Top = 8
    object QEmbarquenome_transportador: TStringField
      FieldKind = fkCalculated
      FieldName = 'nome_transportador'
      Size = 40
      Calculated = True
    end
    object QEmbarquenum_km_diferenca: TFloatField
      FieldKind = fkCalculated
      FieldName = 'num_km_diferenca'
      DisplayFormat = '#,##0'
      Calculated = True
    end
    object QEmbarqueCOD_EMBARQUE: TIntegerField
      FieldName = 'COD_EMBARQUE'
      Required = True
    end
    object QEmbarqueDT_EMBARQUE: TDateTimeField
      FieldName = 'DT_EMBARQUE'
      Required = True
      EditMask = '!99/99/##00;1;_'
    end
    object QEmbarqueNOME_MOTORISTA: TStringField
      FieldName = 'NOME_MOTORISTA'
      Size = 50
    end
    object QEmbarqueCOD_TRANSPORTADOR: TIntegerField
      FieldName = 'COD_TRANSPORTADOR'
    end
    object QEmbarqueNUM_KILOMETRAGEM: TStringField
      FieldName = 'NUM_KILOMETRAGEM'
      Size = 8
    end
    object QEmbarqueIND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Size = 10
    end
    object QEmbarqueIND_ATUALIZA_ESTOQUE: TStringField
      FieldName = 'IND_ATUALIZA_ESTOQUE'
      Size = 3
    end
    object QEmbarqueDT_ATUALIZA_ESTOQUE: TDateTimeField
      FieldName = 'DT_ATUALIZA_ESTOQUE'
    end
    object QEmbarqueNUM_EMBARQUE: TIntegerField
      FieldName = 'NUM_EMBARQUE'
    end
    object QEmbarqueDESC_PLACA: TStringField
      FieldName = 'DESC_PLACA'
      Size = 8
    end
    object QEmbarqueIND_BLOQUEADO: TStringField
      FieldName = 'IND_BLOQUEADO'
      Size = 1
    end
    object QEmbarqueCOD_MOTORISTA: TIntegerField
      FieldName = 'COD_MOTORISTA'
    end
    object QEmbarqueIND_TIPO_VEICULO: TStringField
      FieldName = 'IND_TIPO_VEICULO'
      Size = 10
    end
    object QEmbarqueDESC_DESTINO_FRETE: TStringField
      FieldName = 'DESC_DESTINO_FRETE'
    end
    object QEmbarqueNUM_KILOMETRAGEM_CHEGADA: TStringField
      FieldName = 'NUM_KILOMETRAGEM_CHEGADA'
      Size = 8
    end
    object QEmbarqueVAL_AJUDA_CUSTO: TFloatField
      FieldName = 'VAL_AJUDA_CUSTO'
      DisplayFormat = '#,##0.00'
    end
    object QEmbarqueVAL_ADTO_FRETE: TFloatField
      FieldName = 'VAL_ADTO_FRETE'
      DisplayFormat = '#,##0.00'
    end
    object QEmbarqueVAL_KM: TFloatField
      FieldName = 'VAL_KM'
    end
    object QEmbarqueCOD_CONTA_PAGAR_CAB: TIntegerField
      FieldName = 'COD_CONTA_PAGAR_CAB'
    end
    object QEmbarqueDT_VENCIMENTO: TDateTimeField
      FieldName = 'DT_VENCIMENTO'
      EditMask = '!99/99/##00;1;_'
    end
    object QEmbarqueVAL_FRETE: TFloatField
      FieldName = 'VAL_FRETE'
      DisplayFormat = '#,##0.00'
    end
    object QEmbarqueCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
    object QEmbarqueDT_USUARIO: TDateTimeField
      FieldName = 'DT_USUARIO'
    end
    object QEmbarqueVAL_TOTAL_FRETE: TFloatField
      FieldName = 'VAL_TOTAL_FRETE'
      DisplayFormat = '#,##0.00'
    end
    object QEmbarqueDT_PREV_RETORNO: TDateTimeField
      FieldName = 'DT_PREV_RETORNO'
      EditMask = '!99/99/##00;1;_'
    end
    object QEmbarqueIND_ACERTO_FRETE: TStringField
      FieldName = 'IND_ACERTO_FRETE'
      Size = 1
    end
    object QEmbarqueVAL_CONTRATO_FRETE: TFloatField
      FieldName = 'VAL_CONTRATO_FRETE'
      DisplayFormat = '#,##0.00'
    end
    object QEmbarqueNUM_PREV_KM_RETORNO: TIntegerField
      FieldName = 'NUM_PREV_KM_RETORNO'
    end
    object QEmbarqueVAL_PEDAGIO: TFloatField
      FieldName = 'VAL_PEDAGIO'
      DisplayFormat = '#,##0.00'
    end
    object QEmbarqueCOD_CONTA_PAGAR_CAB_PEDAGIO: TIntegerField
      FieldName = 'COD_CONTA_PAGAR_CAB_PEDAGIO'
    end
    object QEmbarqueCOD_CONTA_PAGAR_CAB_ADTO: TIntegerField
      FieldName = 'COD_CONTA_PAGAR_CAB_ADTO'
    end
    object QEmbarqueVAL_ICMS: TFloatField
      FieldName = 'VAL_ICMS'
      DisplayFormat = '#,##0.00'
    end
    object QEmbarqueCOD_CONTA_PAGAR_CAB_ICMS: TIntegerField
      FieldName = 'COD_CONTA_PAGAR_CAB_ICMS'
    end
    object QEmbarqueVAL_FRETE_COMPLEMENTO: TFloatField
      FieldName = 'VAL_FRETE_COMPLEMENTO'
      DisplayFormat = '#,##0.00'
    end
    object QEmbarqueCOD_CONTA_PAGAR_CAB_COMPL: TIntegerField
      FieldName = 'COD_CONTA_PAGAR_CAB_COMPL'
    end
    object QEmbarqueNUM_MANIFESTO: TIntegerField
      FieldName = 'NUM_MANIFESTO'
    end
    object QEmbarqueVAL_MANIFESTO: TFloatField
      FieldName = 'VAL_MANIFESTO'
      DisplayFormat = '#,##0.00'
    end
    object QEmbarqueIND_CONFERIDO_MOTORISTA: TStringField
      FieldName = 'IND_CONFERIDO_MOTORISTA'
      Size = 1
    end
    object QEmbarqueDESC_OBS: TStringField
      FieldName = 'DESC_OBS'
      Size = 100
    end
    object QEmbarqueDESC_OBS1: TStringField
      FieldName = 'DESC_OBS1'
      Size = 100
    end
    object QEmbarqueDESC_OBS2: TStringField
      FieldName = 'DESC_OBS2'
      Size = 100
    end
    object QEmbarqueDESC_OBS3: TStringField
      FieldName = 'DESC_OBS3'
      Size = 100
    end
    object QEmbarqueDESC_OBS4: TStringField
      FieldName = 'DESC_OBS4'
      Size = 100
    end
    object QEmbarqueDT_FECHAMENTO_MAXIMA: TDateTimeField
      FieldName = 'DT_FECHAMENTO_MAXIMA'
    end
  end
  object QSomaNF: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  Tb_embarque.COD_EMBARQUE,'
      
        '  SUM(Tb_nota_item.VAL_TOTAL - Tb_nota_item.Val_Desconto) AS SVA' +
        'L_TOTAL,'
      '  SUM(Tb_nota_item.QT_QUANTIDADE) AS SQUANTIDADE,'
      
        '  SUM(DECODE(TB_NOTA_CAB.COD_ESTADO,'#39'BA'#39',Tb_nota_item.VAL_ICM,0)' +
        ') AS SVAL_IMPOSTO'
      'FROM'
      '  TB_BAIXA_PEDIDO,'
      '  TB_PEDIDO_CAB,'
      '  TB_PEDIDO_ITEM,'
      '  TB_EMBARQUE,'
      '  TB_EMBARQUE_ITEM,'
      '  TB_NOTA_CAB,'
      '  TB_NOTA_ITEM,'
      '  TB_OPERACAO'
      'WHERE'
      '  Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '  AND'
      '  Tb_baixa_pedido.COD_NOTA_ITEM = Tb_nota_item.COD_NOTA_ITEM'
      '  AND'
      
        '  Tb_pedido_item.COD_PEDIDO_ITEM = Tb_baixa_pedido.COD_PEDIDO_IT' +
        'EM'
      '  AND'
      '  Tb_pedido_item.COD_PEDIDO_CAB = Tb_pedido_cab.COD_PEDIDO_CAB'
      '  AND'
      '  Tb_embarque.COD_EMBARQUE = Tb_embarque_item.COD_EMBARQUE'
      '  AND'
      '  Tb_embarque_item.COD_PEDIDO_CAB = Tb_pedido_cab.COD_PEDIDO_CAB'
      '  AND'
      '  TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '  AND'
      '  TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
      '  AND'
      '  (:IND_LIVRO_FISCAL Is Null'
      '   Or'
      '    Tb_operacao.IND_LIVRO_FISCAL = :IND_LIVRO_FISCAL)'
      '  AND'
      '  TB_EMBARQUE.COD_EMBARQUE = :EMBARQUE'
      'GROUP BY'
      '  Tb_embarque.COD_EMBARQUE'
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Variables.Data = {
      0300000002000000090000003A454D4241525155450300000000000000000000
      00110000003A494E445F4C4956524F5F46495343414C05000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      04000000040000000C000000434F445F454D4241525155450100000000000A00
      00005356414C5F544F54414C0100000000000C0000005356414C5F494D504F53
      544F0100000000000B000000535155414E544944414445010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    Left = 152
    Top = 112
    object QSomaNFCOD_EMBARQUE: TIntegerField
      FieldName = 'COD_EMBARQUE'
      Required = True
    end
    object QSomaNFSVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
      DisplayFormat = '#,##0.00'
    end
    object QSomaNFSVAL_IMPOSTO: TFloatField
      FieldName = 'SVAL_IMPOSTO'
    end
    object QSomaNFSQUANTIDADE: TFloatField
      FieldName = 'SQUANTIDADE'
    end
  end
  object QSomaNF2: TOracleDataSet1
    SQL.Strings = (
      '  SELECT'
      '    Tb_embarque.COD_EMBARQUE,'
      '    SUM(Tb_nota_Cab.NUM_VOLUMES) AS NUM_VOLUMES,'
      
        '    SUM(decode(TB_NOTA_CAB.IND_CONDICAO_PAGTO,1,Tb_nota_item.VAL' +
        '_TOTAL - Tb_nota_item.VAL_DESCONTO + Tb_nota_item.VAL_DESPESAS,0' +
        ')) AS VAL_AVISTA,'
      
        '    SUM(decode(TB_NOTA_CAB.IND_CONDICAO_PAGTO,2,Tb_nota_item.VAL' +
        '_TOTAL - Tb_nota_item.VAL_DESCONTO + Tb_nota_item.VAL_DESPESAS,0' +
        ')) AS VAL_APRAZO,'
      
        '    SUM(decode(TB_NOTA_CAB.IND_CONDICAO_PAGTO,3,Tb_nota_item.VAL' +
        '_TOTAL - Tb_nota_item.VAL_DESCONTO + Tb_nota_item.VAL_DESPESAS,0' +
        ')) AS VAL_OUTROS'
      '  FROM'
      '    TB_BAIXA_PEDIDO,'
      '    TB_PEDIDO_CAB,'
      '    TB_PEDIDO_ITEM,'
      '    TB_EMBARQUE,'
      '    TB_EMBARQUE_ITEM,'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_OPERACAO'
      '  WHERE'
      '    Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '    AND'
      '    Tb_baixa_pedido.COD_NOTA_ITEM = Tb_nota_item.COD_NOTA_ITEM'
      '    AND'
      
        '    Tb_pedido_item.COD_PEDIDO_ITEM = Tb_baixa_pedido.COD_PEDIDO_' +
        'ITEM'
      '    AND'
      '    Tb_pedido_item.COD_PEDIDO_CAB = Tb_pedido_cab.COD_PEDIDO_CAB'
      '    AND'
      '    Tb_embarque.COD_EMBARQUE = Tb_embarque_item.COD_EMBARQUE'
      '    AND'
      
        '    Tb_embarque_item.COD_PEDIDO_CAB = Tb_pedido_cab.COD_PEDIDO_C' +
        'AB'
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
      '    AND'
      '    TB_OPERACAO.IND_VENDAS = '#39'V'#39
      '    AND'
      '    (:IND_LIVRO_FISCAL Is Null'
      '     Or'
      '     Tb_operacao.IND_LIVRO_FISCAL = :IND_LIVRO_FISCAL)'
      '    AND'
      '    TB_EMBARQUE.COD_EMBARQUE = :EMBARQUE'
      'GROUP BY'
      '    Tb_embarque.COD_EMBARQUE'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Variables.Data = {
      0300000002000000090000003A454D4241525155450300000000000000000000
      00110000003A494E445F4C4956524F5F46495343414C05000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      04000000050000000C000000434F445F454D4241525155450100000000000B00
      00004E554D5F564F4C554D45530100000000000A00000056414C5F4156495354
      410100000000000A00000056414C5F415052415A4F0100000000000A00000056
      414C5F4F5554524F53010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    OnCalcFields = QSomaNF2CalcFields
    Left = 152
    Top = 168
    object QSomaNF2COD_EMBARQUE: TIntegerField
      FieldName = 'COD_EMBARQUE'
      Required = True
    end
    object QSomaNF2NUM_VOLUMES: TFloatField
      FieldName = 'NUM_VOLUMES'
    end
    object QSomaNF2VAL_AVISTA: TFloatField
      FieldName = 'VAL_AVISTA'
      DisplayFormat = '#,##0.00'
    end
    object QSomaNF2VAL_APRAZO: TFloatField
      FieldName = 'VAL_APRAZO'
      DisplayFormat = '#,##0.00'
    end
    object QSomaNF2VAL_OUTROS: TFloatField
      FieldName = 'VAL_OUTROS'
      DisplayFormat = '#,##0.00'
    end
    object QSomaNF2sval_total: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sval_total'
      Calculated = True
    end
  end
  object QREmbarqueImposto: TOracleDataSet1
    SQL.Strings = (
      '  SELECT'
      '    Tb_Cadastro.Nome,'
      '    Tb_Cadastro.COD_CADASTRO,'
      '    Tb_nota_cab.NUM_NOTA,'
      '    Tb_nota_cab.DT_EMISSAO,'
      '    Tb_nota_cab.COD_ESTADO,'
      '    Tb_Cadastro.NUM_INSCRICAO,'
      '    0 sPerc_Imposto,'
      
        '    SUM(Tb_nota_item.VAL_TOTAL - Tb_nota_item.Val_Desconto) sVal' +
        '_total,'
      '    Sum(Calcula_Imposto(Tb_operacao.IND_VENDAS,'
      '                        COD_EMPRESA,'
      '                        TB_NOTA_CAB.COD_ESTADO,'
      '                        COD_CLASSE,'
      
        '                        TB_NOTA_ITEM.VAL_TOTAL - TB_NOTA_ITEM.VA' +
        'L_DESCONTO,'
      '                        Tb_nota_item.VAL_ICMS_SUBST,'
      '                        TB_PRODUTO.IND_SUBSTITUICAO_RJ,'
      '                        Tb_operacao.IND_LIVRO_FISCAL,'
      
        '                        Tb_Cadastro.IND_REGIME_ESPECIAL)) as Sva' +
        'l_Imposto'
      
        '/*    SUM(DECODE(Tb_operacao.IND_VENDAS,'#39'V'#39',DECODE(COD_EMPRESA,'#39 +
        'FAVILLE'#39','
      '        DECODE(TB_NOTA_CAB.COD_ESTADO,'#39'BA'#39','
      
        '        DECODE(COD_CLASSE,231,0,(TB_NOTA_ITEM.VAL_TOTAL - TB_NOT' +
        'A_ITEM.VAL_DESCONTO)*0.1765)'
      
        '        ,Tb_nota_item.VAL_ICMS_SUBST),Tb_nota_item.VAL_ICMS_SUBS' +
        'T),Tb_nota_item.VAL_ICMS_SUBST)) AS SVAL_IMPOSTO  */'
      '  FROM'
      '    TB_BAIXA_PEDIDO,'
      '    TB_PEDIDO_CAB,'
      '    TB_PEDIDO_ITEM,'
      '    TB_EMBARQUE,'
      '    TB_EMBARQUE_ITEM,'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_CADASTRO,'
      '    TB_OPERACAO,'
      '    TB_PRODUTO,'
      '    TB_PARAM_SISTEMA'
      '  WHERE'
      '    (Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB)'
      '    AND'
      '    (Tb_baixa_pedido.COD_NOTA_ITEM = Tb_nota_item.COD_NOTA_ITEM)'
      '    AND'
      
        '    (Tb_pedido_item.COD_PEDIDO_ITEM = Tb_baixa_pedido.COD_PEDIDO' +
        '_ITEM)'
      '    AND'
      
        '    (Tb_pedido_item.COD_PEDIDO_CAB = Tb_pedido_cab.COD_PEDIDO_CA' +
        'B)'
      '    AND'
      '    (Tb_embarque.COD_EMBARQUE = Tb_embarque_item.COD_EMBARQUE)'
      '    AND'
      
        '    (Tb_embarque_item.COD_PEDIDO_CAB = Tb_pedido_cab.COD_PEDIDO_' +
        'CAB)'
      '    AND'
      '    (Tb_nota_Cab.COD_CADASTRO = Tb_CADASTRO.COD_CADASTRO)'
      '    AND'
      '    (Tb_nota_item.COD_PRODUTO = tb_produto.COD_PRODUTO)'
      '    AND'
      '    (Tb_cadastro.IND_REGIME_ESPECIAL = '#39'NAO'#39')'
      '    AND'
      '    (TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39')'
      '    AND'
      '    TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
      '    AND'
      '    Tb_operacao.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    (:COD_FILIAL IS NULL'
      '     OR'
      '      TB_NOTA_CAB.COD_FILIAL = :COD_FILIAL)'
      '    AND'
      '    (TB_EMBARQUE.COD_EMBARQUE = :COD_EMBARQUE)'
      '    AND'
      '    (TB_NOTA_CAB.COD_ESTADO = :COD_ESTADO)'
      '  GROUP BY'
      '    Tb_Cadastro.Nome,'
      '    Tb_Cadastro.COD_CADASTRO,'
      '    Tb_nota_cab.NUM_NOTA,'
      '    Tb_nota_cab.DT_EMISSAO,'
      '    Tb_nota_cab.COD_ESTADO,'
      '    Tb_Cadastro.NUM_INSCRICAO'
      'ORDER BY'
      '  Tb_nota_cab.NUM_NOTA'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Variables.Data = {
      03000000030000000B0000003A434F445F45535441444F050000000000000000
      0000000B0000003A434F445F46494C49414C0300000000000000000000000D00
      00003A434F445F454D424152515545030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000009000000040000004E4F4D450100000000000C000000434F445F4341
      44415354524F0100000000000A00000044545F454D495353414F010000000000
      0A000000434F445F45535441444F0100000000000A0000005356414C5F544F54
      414C0100000000000D0000004E554D5F494E5343524943414F0100000000000D
      00000053504552435F494D504F53544F0100000000000C0000005356414C5F49
      4D504F53544F010000000000080000004E554D5F4E4F5441010000000000}
    Session = DMOracle.DBCemapa
    Left = 272
    Top = 232
    object QREmbarqueImpostoNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object QREmbarqueImpostoCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QREmbarqueImpostoNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
      Required = True
    end
    object QREmbarqueImpostoDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object QREmbarqueImpostoCOD_ESTADO: TStringField
      FieldName = 'COD_ESTADO'
      Required = True
      Size = 2
    end
    object QREmbarqueImpostoNUM_INSCRICAO: TStringField
      FieldName = 'NUM_INSCRICAO'
    end
    object QREmbarqueImpostoSPERC_IMPOSTO: TFloatField
      FieldName = 'SPERC_IMPOSTO'
    end
    object QREmbarqueImpostoSVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
    end
    object QREmbarqueImpostoSVAL_IMPOSTO: TFloatField
      FieldName = 'SVAL_IMPOSTO'
    end
  end
  object QEmbarque_EmiteNota: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_PEDIDO_CAB.COD_PEDIDO_CAB,'
      '  TB_PEDIDO_CAB.COD_FILIAL,'
      '  TB_PEDIDO_CAB.COD_OPERACAO,'
      '  TB_PEDIDO_CAB.COD_VENDEDOR,'
      '  TB_PEDIDO_CAB.COD_CADASTRO,'
      '  TB_PEDIDO_CAB.COD_BANCO_AGENCIA,'
      '  TB_PEDIDO_CAB.COD_CONTA_CORRENTE,'
      '  TB_PEDIDO_CAB.DESC_OBSERVACAO ,'
      
        '  TB_PEDIDO_CAB.DESC_COMPLEMENTO_OBS || '#39' Embarque:'#39' || Tb_embar' +
        'que.COD_EMBARQUE as DESC_COMPLEMENTO_OBS,'
      '  TB_PEDIDO_CAB.PERC_COMISSAO AS PERC_COMISSAO_NOTA,'
      '  TB_PEDIDO_CAB.IND_TIPO_PAGAMENTO,'
      '  TB_PEDIDO_CAB.NR_DIAS_CHEQUE,'
      '  TB_PEDIDO_CAB.NR_DIAS_CHEQUE1,'
      '  TB_PEDIDO_CAB.NR_DIAS_CHEQUE2,'
      '  TB_PEDIDO_CAB.NR_DIAS_CHEQUE3,'
      '  TB_PEDIDO_CAB.NR_DIAS_CHEQUE4,'
      '  TB_PEDIDO_CAB.COD_PRAZO_VENCIMENTO,'
      '  TB_PEDIDO_CAB.IND_TIPO_FRETE,'
      '  TB_PEDIDO_CAB.VAL_DESCONTO,'
      '  TB_PEDIDO_CAB.NUM_PEDIDO,'
      '  TB_PEDIDO_CAB.COD_DEPARTAMENTO,'
      '  TB_PEDIDO_CAB.COD_MENSAGEM,'
      '  TB_PEDIDO_CAB.PERC_SUB,'
      '  TB_PEDIDO_CAB.IND_CONSUMIDOR_FINAL,'
      '  TB_PEDIDO_ITEM.COD_PRODUTO,'
      '  TB_PEDIDO_ITEM.COD_CULTURA,'
      '  TB_PEDIDO_ITEM.VAL_UNITARIO,'
      '  TB_PEDIDO_ITEM.COD_TRIBUTACAO,'
      '  TB_PEDIDO_ITEM.COD_LOTE_TIPO,'
      
        '  (TB_PEDIDO_ITEM.QT_PEDIDO - TB_PEDIDO_ITEM.QT_ATENDIDO - TB_PE' +
        'DIDO_ITEM.QT_CANCELADO) AS QT_PEDIDO,'
      '  TB_PEDIDO_ITEM.COD_PEDIDO_ITEM,'
      '  TB_PEDIDO_ITEM.PERC_DESCONTO PERC_DESCONTO_ITEM,'
      '  TB_PEDIDO_ITEM.PERC_DESCONTO1,'
      '  TB_PEDIDO_ITEM.PERC_DESCONTO2,'
      '  TB_PEDIDO_ITEM.PERC_ACRESCIMO,'
      '  TB_PEDIDO_ITEM.PERC_COMISSAO AS PERC_COMISSAO_ITENS,'
      '  TB_PEDIDO_ITEM.COD_CFOP,'
      '  TB_PEDIDO_ITEM.QT_EMBALAGEM,'
      '  TB_EMBARQUE.COD_TRANSPORTADOR,'
      '  TB_EMBARQUE_ITEM.NUM_SEQUENCIAL,'
      
        '  DECODE(TB_OPERACAO.COD_CST_PIS, NULL, TB_PRODUTO.COD_CST_PIS,T' +
        'B_OPERACAO.COD_CST_PIS) AS COD_CST_PIS,'
      
        '  DECODE(TB_OPERACAO.COD_CST_COFINS, null, TB_PRODUTO.COD_CST_CO' +
        'FINS,TB_OPERACAO.COD_CST_COFINS) as COD_CST_COFINS'
      'FROM'
      '  TB_PEDIDO_CAB,'
      '  TB_PEDIDO_ITEM,'
      '  TB_EMBARQUE,'
      '  TB_EMBARQUE_ITEM,'
      '  TB_OPERACAO,'
      '  TB_PRODUTO'
      'WHERE'
      '  (Tb_embarque.COD_EMBARQUE = Tb_embarque_item.COD_EMBARQUE)'
      '  AND'
      
        '  (Tb_embarque_item.COD_PEDIDO_CAB = Tb_pedido_cab.COD_PEDIDO_CA' +
        'B)'
      '  AND'
      '  (Tb_pedido_cab.COD_PEDIDO_CAB = Tb_pedido_item.COD_PEDIDO_CAB)'
      '  AND'
      '  (TB_PEDIDO_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO)'
      '  AND'
      '  (TB_PEDIDO_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO)'
      '  AND'
      '  (:COD_OPERACAO is null'
      '   Or'
      '     Tb_pedido_cab.COD_OPERACAO = :COD_OPERACAO)'
      '  AND'
      '  (:IND_LIVRO_FISCAL Is Null'
      '   Or'
      '    Tb_operacao.IND_LIVRO_FISCAL = :IND_LIVRO_FISCAL)'
      '  AND'
      '  (TB_EMBARQUE.COD_EMBARQUE = :EMBARQUE)'
      '  AND'
      '  (:QT_ZEROS IS NULL'
      '   OR'
      
        '    (Tb_pedido_item.QT_PEDIDO - Tb_pedido_item.QT_ATENDIDO - Tb_' +
        'pedido_item.QT_CANCELADO) > 0)'
      
        'ORDER BY TB_EMBARQUE_ITEM.NUM_SEQUENCIAL, TB_PEDIDO_CAB.COD_OPER' +
        'ACAO, TB_PEDIDO_CAB.COD_CADASTRO,TB_PEDIDO_CAB.NUM_PEDIDO,TB_PED' +
        'IDO_CAB.IND_TIPO_PAGAMENTO')
    Variables.Data = {
      0300000004000000090000003A454D4241525155450300000000000000000000
      00110000003A494E445F4C4956524F5F46495343414C05000000000000000000
      0000090000003A51545F5A45524F530500000000000000000000000D0000003A
      434F445F4F5045524143414F030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000002A0000000E000000434F445F50454449444F5F434142010000000000
      0B000000434F445F50524F4455544F0100000000000A000000434F445F46494C
      49414C0100000000000C000000434F445F4F5045524143414F0100000000000C
      000000434F445F56454E4445444F520100000000000C000000434F445F434144
      415354524F01000000000014000000444553435F434F4D504C454D454E544F5F
      4F425301000000000012000000494E445F5449504F5F504147414D454E544F01
      00000000000E0000004E525F444941535F4348455155450100000000000F0000
      004E525F444941535F434845515545310100000000000F0000004E525F444941
      535F434845515545320100000000000F0000004E525F444941535F4348455155
      453301000000000014000000434F445F5052415A4F5F56454E43494D454E544F
      0100000000000F000000434F445F50454449444F5F4954454D0100000000000E
      000000434F445F5452494255544143414F0100000000000900000051545F5045
      4449444F0100000000000C00000056414C5F554E49544152494F010000000000
      0D000000434F445F4C4F54455F5449504F01000000000012000000504552435F
      434F4D495353414F5F4E4F544101000000000013000000504552435F434F4D49
      5353414F5F4954454E5301000000000011000000434F445F5452414E53504F52
      5441444F520100000000000E000000494E445F5449504F5F4652455445010000
      0000000C00000056414C5F444553434F4E544F0100000000000E0000004E554D
      5F53455155454E4349414C0100000000000A0000004E554D5F50454449444F01
      000000000012000000504552435F444553434F4E544F5F4954454D0100000000
      000F000000444553435F4F42534552564143414F0100000000000F0000004E52
      5F444941535F4348455155453401000000000010000000434F445F4445504152
      54414D454E544F0100000000000C000000434F445F4D454E534147454D010000
      00000011000000434F445F42414E434F5F4147454E4349410100000000001200
      0000434F445F434F4E54415F434F5252454E54450100000000000B000000434F
      445F43554C545552410100000000000E000000504552435F444553434F4E544F
      310100000000000E000000504552435F444553434F4E544F320100000000000E
      000000504552435F414352455343494D4F01000000000008000000504552435F
      53554201000000000008000000434F445F43464F500100000000000B00000043
      4F445F4353545F5049530100000000000E000000434F445F4353545F434F4649
      4E530100000000000C00000051545F454D42414C4147454D0100000000001400
      0000494E445F434F4E53554D49444F525F46494E414C010000000000}
    Session = DMOracle.DBCemapa
    OnCalcFields = QEmbarque_EmiteNotaCalcFields
    Left = 50
    Top = 120
    object QEmbarque_EmiteNotaCOD_PEDIDO_CAB: TIntegerField
      FieldName = 'COD_PEDIDO_CAB'
      Required = True
    end
    object QEmbarque_EmiteNotaCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
    end
    object QEmbarque_EmiteNotaCOD_OPERACAO: TIntegerField
      FieldName = 'COD_OPERACAO'
    end
    object QEmbarque_EmiteNotaCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object QEmbarque_EmiteNotaCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
    end
    object QEmbarque_EmiteNotaPERC_COMISSAO_NOTA: TFloatField
      FieldName = 'PERC_COMISSAO_NOTA'
    end
    object QEmbarque_EmiteNotaIND_TIPO_PAGAMENTO: TStringField
      FieldName = 'IND_TIPO_PAGAMENTO'
      Size = 10
    end
    object QEmbarque_EmiteNotaNR_DIAS_CHEQUE: TIntegerField
      FieldName = 'NR_DIAS_CHEQUE'
    end
    object QEmbarque_EmiteNotaNR_DIAS_CHEQUE1: TIntegerField
      FieldName = 'NR_DIAS_CHEQUE1'
    end
    object QEmbarque_EmiteNotaNR_DIAS_CHEQUE2: TIntegerField
      FieldName = 'NR_DIAS_CHEQUE2'
    end
    object QEmbarque_EmiteNotaNR_DIAS_CHEQUE3: TIntegerField
      FieldName = 'NR_DIAS_CHEQUE3'
    end
    object QEmbarque_EmiteNotaCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
    end
    object QEmbarque_EmiteNotaVAL_UNITARIO: TFloatField
      FieldName = 'VAL_UNITARIO'
      Required = True
    end
    object QEmbarque_EmiteNotaCOD_TRIBUTACAO: TIntegerField
      FieldName = 'COD_TRIBUTACAO'
    end
    object QEmbarque_EmiteNotaCOD_LOTE_TIPO: TIntegerField
      FieldName = 'COD_LOTE_TIPO'
    end
    object QEmbarque_EmiteNotaQT_PEDIDO: TFloatField
      FieldName = 'QT_PEDIDO'
    end
    object QEmbarque_EmiteNotaCOD_PEDIDO_ITEM: TIntegerField
      FieldName = 'COD_PEDIDO_ITEM'
      Required = True
    end
    object QEmbarque_EmiteNotaPERC_COMISSAO_ITENS: TFloatField
      FieldName = 'PERC_COMISSAO_ITENS'
    end
    object QEmbarque_EmiteNotacod_prazo_vencimento: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'cod_prazo_vencimento'
      Calculated = True
    end
    object QEmbarque_EmiteNotaCOD_TRANSPORTADOR: TIntegerField
      FieldName = 'COD_TRANSPORTADOR'
    end
    object QEmbarque_EmiteNotaIND_TIPO_FRETE: TStringField
      FieldName = 'IND_TIPO_FRETE'
      Size = 3
    end
    object QEmbarque_EmiteNotaVAL_DESCONTO: TFloatField
      FieldName = 'VAL_DESCONTO'
    end
    object QEmbarque_EmiteNotaNUM_SEQUENCIAL: TIntegerField
      FieldName = 'NUM_SEQUENCIAL'
    end
    object QEmbarque_EmiteNotaNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object QEmbarque_EmiteNotaPERC_DESCONTO_ITEM: TFloatField
      FieldName = 'PERC_DESCONTO_ITEM'
      Required = True
    end
    object QEmbarque_EmiteNotaNR_DIAS_CHEQUE4: TIntegerField
      FieldName = 'NR_DIAS_CHEQUE4'
    end
    object QEmbarque_EmiteNotaCOD_DEPARTAMENTO: TIntegerField
      FieldName = 'COD_DEPARTAMENTO'
    end
    object QEmbarque_EmiteNotaCOD_MENSAGEM: TIntegerField
      FieldName = 'COD_MENSAGEM'
    end
    object QEmbarque_EmiteNotaCOD_BANCO_AGENCIA: TIntegerField
      FieldName = 'COD_BANCO_AGENCIA'
    end
    object QEmbarque_EmiteNotaCOD_CONTA_CORRENTE: TIntegerField
      FieldName = 'COD_CONTA_CORRENTE'
    end
    object QEmbarque_EmiteNotaCOD_CULTURA: TIntegerField
      FieldName = 'COD_CULTURA'
    end
    object QEmbarque_EmiteNotaPERC_DESCONTO1: TFloatField
      FieldName = 'PERC_DESCONTO1'
    end
    object QEmbarque_EmiteNotaPERC_DESCONTO2: TFloatField
      FieldName = 'PERC_DESCONTO2'
    end
    object QEmbarque_EmiteNotaPERC_ACRESCIMO: TFloatField
      FieldName = 'PERC_ACRESCIMO'
    end
    object QEmbarque_EmiteNotaPERC_SUB: TFloatField
      FieldName = 'PERC_SUB'
    end
    object QEmbarque_EmiteNotaDESC_OBSERVACAO: TStringField
      FieldName = 'DESC_OBSERVACAO'
      Size = 60
    end
    object QEmbarque_EmiteNotaDESC_COMPLEMENTO_OBS: TStringField
      FieldName = 'DESC_COMPLEMENTO_OBS'
      Size = 110
    end
    object QEmbarque_EmiteNotaCOD_CFOP: TIntegerField
      FieldName = 'COD_CFOP'
    end
    object QEmbarque_EmiteNotaCOD_CST_PIS: TStringField
      FieldName = 'COD_CST_PIS'
      Size = 2
    end
    object QEmbarque_EmiteNotaCOD_CST_COFINS: TStringField
      FieldName = 'COD_CST_COFINS'
      Size = 2
    end
    object QEmbarque_EmiteNotaQT_EMBALAGEM: TFloatField
      FieldName = 'QT_EMBALAGEM'
    end
    object QEmbarque_EmiteNotaIND_CONSUMIDOR_FINAL: TStringField
      FieldName = 'IND_CONSUMIDOR_FINAL'
      Size = 1
    end
  end
  object QSomaImposto: TOracleDataSet1
    SQL.Strings = (
      '  SELECT'
      '    Sum(Calcula_Imposto(Tb_operacao.IND_VENDAS,'
      '                        COD_EMPRESA,TB_NOTA_CAB.COD_ESTADO,'
      '                        COD_CLASSE,'
      
        '                        TB_NOTA_ITEM.VAL_TOTAL - TB_NOTA_ITEM.VA' +
        'L_DESCONTO,'
      '                        Tb_nota_item.VAL_ICMS_SUBST,'
      '                        TB_PRODUTO.IND_SUBSTITUICAO_RJ,'
      '                        Tb_operacao.IND_LIVRO_FISCAL,'
      
        '                        Tb_Cadastro.IND_REGIME_ESPECIAL)) as Sva' +
        'l_Imposto'
      '  FROM'
      '    TB_BAIXA_PEDIDO,'
      '    TB_PEDIDO_CAB,'
      '    TB_PEDIDO_ITEM,'
      '    TB_EMBARQUE,'
      '    TB_EMBARQUE_ITEM,'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_CADASTRO,'
      '    TB_OPERACAO,'
      '    TB_PRODUTO,'
      '    TB_PARAM_SISTEMA'
      '  WHERE'
      '    (Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB)'
      '    AND'
      '    (Tb_baixa_pedido.COD_NOTA_ITEM = Tb_nota_item.COD_NOTA_ITEM)'
      '    AND'
      
        '    (Tb_pedido_item.COD_PEDIDO_ITEM = Tb_baixa_pedido.COD_PEDIDO' +
        '_ITEM)'
      '    AND'
      
        '    (Tb_pedido_item.COD_PEDIDO_CAB = Tb_pedido_cab.COD_PEDIDO_CA' +
        'B)'
      '    AND'
      '    (Tb_embarque.COD_EMBARQUE = Tb_embarque_item.COD_EMBARQUE)'
      '    AND'
      
        '    (Tb_embarque_item.COD_PEDIDO_CAB = Tb_pedido_cab.COD_PEDIDO_' +
        'CAB)'
      '    AND'
      '    (Tb_nota_Cab.COD_CADASTRO = Tb_CADASTRO.COD_CADASTRO)'
      '    AND'
      '    TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
      '    AND'
      '    TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '    AND'
      '    (:IND_LIVRO_FISCAL Is Null'
      '     Or'
      '      Tb_operacao.IND_LIVRO_FISCAL = :IND_LIVRO_FISCAL)'
      '     AND'
      '    Tb_operacao.IND_EMITE = '#39'F'#39
      '    AND'
      '    (Tb_cadastro.IND_REGIME_ESPECIAL = '#39'NAO'#39')'
      '    AND'
      '    (TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39')'
      '    AND'
      '    (TB_OPERACAO.IND_VENDAS = '#39'V'#39')'
      '    AND'
      '    (TB_EMBARQUE.COD_EMBARQUE = :COD_EMBARQUE)'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' ')
    Variables.Data = {
      03000000020000000D0000003A434F445F454D42415251554503000000000000
      0000000000110000003A494E445F4C4956524F5F46495343414C050000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {04000000010000000C0000005356414C5F494D504F53544F010000000000}
    Session = DMOracle.DBCemapa
    Left = 56
    Top = 176
    object QSomaImpostoSVAL_IMPOSTO: TFloatField
      FieldName = 'SVAL_IMPOSTO'
    end
  end
  object QNotaEmbarque: TOracleDataSet1
    SQL.Strings = (
      'SELECT DISTINCT'
      ' TB_EMBARQUE.COD_EMBARQUE'
      'FROM'
      '  TB_EMBARQUE,'
      '  TB_EMBARQUE_ITEM,'
      '  TB_NOTA_CAB,'
      '  TB_NOTA_ITEM,'
      '  TB_BAIXA_PEDIDO,'
      '  TB_PEDIDO_ITEM'
      'WHERE'
      '  TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_CAB'
      '  AND'
      '  TB_NOTA_ITEM.COD_NOTA_ITEM = TB_BAIXA_PEDIDO.COD_NOTA_ITEM'
      '  AND'
      
        '  TB_BAIXA_PEDIDO.COD_PEDIDO_ITEM = TB_PEDIDO_ITEM.COD_PEDIDO_IT' +
        'EM'
      '  AND'
      
        '  TB_PEDIDO_ITEM.COD_PEDIDO_CAB = TB_EMBARQUE_ITEM.COD_PEDIDO_CA' +
        'B'
      '  AND'
      '  TB_EMBARQUE.COD_EMBARQUE = TB_EMBARQUE_ITEM.COD_EMBARQUE'
      '  AND'
      '  TB_NOTA_CAB.NUM_NOTA = :NOTA'
      '  AND'
      '  TB_NOTA_CAB.DT_RECEBIMENTO >= :DT_RECEBIMENTO')
    Variables.Data = {
      0300000002000000050000003A4E4F54410300000000000000000000000F0000
      003A44545F5245434542494D454E544F0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {04000000010000000C000000434F445F454D424152515545010000000000}
    Session = DMOracle.DBCemapa
    Left = 384
    Top = 256
    object QNotaEmbarqueCOD_EMBARQUE: TIntegerField
      FieldName = 'COD_EMBARQUE'
      Required = True
    end
  end
  object QEmbarqueItensPed: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  TB_PEDIDO_ITEM.COD_PEDIDO_ITEM,'
      '  TB_PEDIDO_ITEM.QT_ATENDIDO,'
      '  TB_PEDIDO_ITEM.QT_QUANTIDADE_AUX,'
      '  TB_PEDIDO_ITEM.COD_PRODUTO,'
      '  TB_PEDIDO_ITEM.COD_LOTE_TIPO,'
      '  TB_PEDIDO_ITEM.QT_PEDIDO,'
      '  TB_PEDIDO_CAB.COD_FILIAL,'
      '  TB_PEDIDO_ITEM.COD_PEDIDO_CAB'
      'FROM'
      '  TB_PEDIDO_ITEM,'
      '  TB_EMBARQUE_ITEM,'
      '  TB_PEDIDO_CAB'
      'WHERE'
      
        '  TB_EMBARQUE_ITEM.COD_PEDIDO_CAB = TB_PEDIDO_ITEM.COD_PEDIDO_CA' +
        'B'
      '  AND'
      '  TB_PEDIDO_ITEM.COD_PEDIDO_CAB = TB_PEDIDO_CAB.COD_PEDIDO_CAB'
      '  AND'
      '  (:COD_PRODUTO IS NULL OR'
      '  TB_PEDIDO_ITEM.COD_PRODUTO = :COD_PRODUTO)'
      '  AND'
      '  (:COD_PEDIDO_CAB IS NULL OR'
      '  TB_PEDIDO_ITEM.COD_PEDIDO_CAB = :COD_PEDIDO_CAB)'
      '  AND'
      '  TB_EMBARQUE_ITEM.COD_EMBARQUE = :COD_EMBARQUE'
      ' ')
    Variables.Data = {
      03000000030000000C0000003A434F445F50524F4455544F0300000000000000
      000000000D0000003A434F445F454D4241525155450300000000000000000000
      000F0000003A434F445F50454449444F5F434142050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000080000000F000000434F445F50454449444F5F4954454D0100000000
      000B00000051545F4154454E4449444F0100000000000B000000434F445F5052
      4F4455544F0100000000000D000000434F445F4C4F54455F5449504F01000000
      00000900000051545F50454449444F0100000000000A000000434F445F46494C
      49414C0100000000001100000051545F5155414E5449444144455F4155580100
      000000000E000000434F445F50454449444F5F434142010000000000}
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 504
    Top = 8
    object QEmbarqueItensPedCOD_PEDIDO_ITEM: TIntegerField
      FieldName = 'COD_PEDIDO_ITEM'
      Required = True
    end
    object QEmbarqueItensPedQT_ATENDIDO: TFloatField
      FieldName = 'QT_ATENDIDO'
      Required = True
    end
    object QEmbarqueItensPedCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
    end
    object QEmbarqueItensPedCOD_LOTE_TIPO: TIntegerField
      FieldName = 'COD_LOTE_TIPO'
    end
    object QEmbarqueItensPedQT_PEDIDO: TFloatField
      FieldName = 'QT_PEDIDO'
      Required = True
    end
    object QEmbarqueItensPedCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
    end
    object QEmbarqueItensPedQT_QUANTIDADE_AUX: TFloatField
      FieldName = 'QT_QUANTIDADE_AUX'
    end
    object QEmbarqueItensPedCOD_PEDIDO_CAB: TIntegerField
      FieldName = 'COD_PEDIDO_CAB'
    end
  end
  object QREmbarqueCarga: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_EMBARQUE.DT_EMBARQUE AS DT_EMISSAO,'
      '  TB_EMBARQUE.COD_EMBARQUE,'
      '  TB_EMBARQUE.NUM_EMBARQUE,'
      '  TB_EMBARQUE.NOME_MOTORISTA,'
      '  TB_NOTA_CAB.DESC_PLACA,'
      '  TB_EMBARQUE.DESC_OBS,'
      
        '  SUM(DECODE(IND_CONDICAO_PAGTO,'#39'1'#39',TB_NOTA_ITEM.VAL_TOTAL - TB_' +
        'NOTA_ITEM.VAL_DESCONTO + TB_NOTA_ITEM.VAL_DESPESAS,0)) AS VAL_AV' +
        'ISTA_NF,'
      
        '  SUM(DECODE(IND_CONDICAO_PAGTO,'#39'2'#39',TB_NOTA_ITEM.VAL_TOTAL - TB_' +
        'NOTA_ITEM.VAL_DESCONTO,0)) AS VAL_BANCOS_NF,'
      
        '  SUM(DECODE(IND_CONDICAO_PAGTO,'#39'3'#39',TB_NOTA_ITEM.VAL_TOTAL - TB_' +
        'NOTA_ITEM.VAL_DESCONTO,0)) AS VAL_APRAZO_NF,'
      '  Sum(Calcula_Imposto(Tb_operacao.IND_VENDAS,'
      '                      COD_EMPRESA,'
      '                      TB_NOTA_CAB.COD_ESTADO,'
      '                      COD_CLASSE,'
      
        '                      TB_NOTA_ITEM.VAL_TOTAL - TB_NOTA_ITEM.VAL_' +
        'DESCONTO,'
      '                      Tb_nota_item.VAL_ICMS_SUBST,'
      '                      TB_PRODUTO.IND_SUBSTITUICAO_RJ,'
      '                      Tb_operacao.IND_LIVRO_FISCAL,'
      
        '                      Tb_Cadastro.IND_REGIME_ESPECIAL)) as Sval_' +
        'Imposto_nf'
      'FROM'
      '  TB_NOTA_CAB,'
      '  TB_NOTA_ITEM,'
      '  TB_PEDIDO_CAB,'
      '  TB_PEDIDO_ITEM,'
      '  TB_EMBARQUE,'
      '  TB_EMBARQUE_ITEM,'
      '  TB_BAIXA_PEDIDO,'
      '  TB_CADASTRO,'
      '  TB_PRODUTO,'
      '  TB_ESTADO,'
      '  TB_OPERACAO,'
      '  TB_PARAM_SISTEMA'
      'WHERE'
      '  (Tb_embarque.COD_EMBARQUE = Tb_embarque_item.COD_EMBARQUE)'
      '  AND'
      
        '  (Tb_embarque_item.COD_PEDIDO_CAB = Tb_pedido_cab.COD_PEDIDO_CA' +
        'B)'
      '  AND'
      
        '  (Tb_embarque_item.COD_PEDIDO_CAB = Tb_pedido_item.COD_PEDIDO_C' +
        'AB)'
      '  AND'
      
        '  (Tb_pedido_item.COD_PEDIDO_ITEM = Tb_baixa_pedido.COD_PEDIDO_I' +
        'TEM)'
      '  AND'
      '  (Tb_baixa_pedido.COD_NOTA_ITEM = Tb_nota_item.COD_NOTA_ITEM)'
      '  AND'
      '  (Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB)'
      '  AND'
      '  (Tb_nota_Cab.COD_CADASTRO = Tb_CADASTRO.COD_CADASTRO)'
      '  AND'
      '  (Tb_pedido_item.COD_PRODUTO = Tb_produto.COD_PRODUTO)'
      '  AND'
      '  (Tb_nota_Cab.COD_ESTADO = Tb_ESTADO.COD_ESTADO)'
      '  AND'
      '  TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
      '  AND'
      '  (TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39')'
      '  AND'
      '  (TB_OPERACAO.IND_VENDAS = '#39'V'#39')'
      '  AND'
      '  (:IND_SITUACAO IS NULL'
      '   OR'
      '    TB_EMBARQUE.IND_SITUACAO = :IND_SITUACAO)'
      '  AND'
      '  (TB_EMBARQUE.DT_EMBARQUE >= :DT_INICIAL)'
      '  AND'
      '  (TB_EMBARQUE.DT_EMBARQUE <= :DT_FINAL)'
      'GROUP BY'
      '  TB_EMBARQUE.DT_EMBARQUE,'
      '  TB_EMBARQUE.COD_EMBARQUE,'
      '  TB_EMBARQUE.NUM_EMBARQUE,'
      '  TB_EMBARQUE.NOME_MOTORISTA,'
      '  TB_NOTA_CAB.DESC_PLACA,'
      '  TB_EMBARQUE.DESC_OBS'
      ' '
      ' '
      ' ')
    Variables.Data = {
      03000000030000000D0000003A494E445F534954554143414F05000000000000
      00000000000B0000003A44545F494E494349414C0C0000000000000000000000
      090000003A44545F46494E414C0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000A0000000C000000434F445F454D4241525155450100000000000D00
      000056414C5F4156495354415F4E460100000000000D00000056414C5F415052
      415A4F5F4E460100000000000F0000005356414C5F494D504F53544F5F4E4601
      00000000000E0000004E4F4D455F4D4F544F52495354410100000000000D0000
      0056414C5F42414E434F535F4E460100000000000C0000004E554D5F454D4241
      525155450100000000000A00000044545F454D495353414F0100000000000A00
      0000444553435F504C41434101000000000008000000444553435F4F42530100
      00000000}
    Session = DMOracle.DBCemapa
    Left = 496
    Top = 72
    object QREmbarqueCargaCOD_EMBARQUE: TIntegerField
      FieldName = 'COD_EMBARQUE'
      Required = True
    end
    object QREmbarqueCargaVAL_AVISTA_NF: TFloatField
      FieldName = 'VAL_AVISTA_NF'
      DisplayFormat = '#,##0.00'
    end
    object QREmbarqueCargaVAL_APRAZO_NF: TFloatField
      FieldName = 'VAL_APRAZO_NF'
      DisplayFormat = '#,##0.00'
    end
    object QREmbarqueCargaSVAL_IMPOSTO_NF: TFloatField
      FieldName = 'SVAL_IMPOSTO_NF'
      DisplayFormat = '#,##0.00'
    end
    object QREmbarqueCargaNOME_MOTORISTA: TStringField
      FieldName = 'NOME_MOTORISTA'
      Size = 50
    end
    object QREmbarqueCargaVAL_BANCOS_NF: TFloatField
      FieldName = 'VAL_BANCOS_NF'
    end
    object QREmbarqueCargaNUM_EMBARQUE: TIntegerField
      FieldName = 'NUM_EMBARQUE'
    end
    object QREmbarqueCargaDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
    object QREmbarqueCargaDESC_PLACA: TStringField
      FieldName = 'DESC_PLACA'
      Size = 8
    end
    object QREmbarqueCargaDESC_OBS: TStringField
      FieldName = 'DESC_OBS'
      Size = 100
    end
  end
  object QEmbarqueItensNota: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_PEDIDO_CAB.Cod_Filial,'
      '  TB_PEDIDO_ITEM.Cod_Produto,'
      '  SUM(TB_PEDIDO_ITEM.Qt_PEDIDO) AS Qt_Quantidade'
      'FROM'
      '  TB_PEDIDO_CAB,'
      '  TB_PEDIDO_ITEM,'
      '  TB_EMBARQUE,'
      '  TB_EMBARQUE_ITEM'
      'WHERE'
      '  (Tb_embarque.COD_EMBARQUE = Tb_embarque_item.COD_EMBARQUE)'
      '  AND'
      
        '  (Tb_embarque_item.COD_PEDIDO_CAB = Tb_pedido_cab.COD_PEDIDO_CA' +
        'B)'
      '  AND'
      '  (Tb_pedido_cab.COD_PEDIDO_CAB = Tb_pedido_item.COD_PEDIDO_CAB)'
      '  AND'
      '  (TB_EMBARQUE.COD_EMBARQUE = :COD_EMBARQUE)'
      'Group By'
      '  Tb_pedido_cab.Cod_Filial,'
      '  TB_PEDIDO_ITEM.Cod_Produto'
      '')
    Variables.Data = {
      03000000010000000D0000003A434F445F454D42415251554503000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000030000000A000000434F445F46494C49414C0100000000000B000000
      434F445F50524F4455544F0100000000000D00000051545F5155414E54494441
      4445010000000000}
    Session = DMOracle.DBCemapa
    Left = 496
    Top = 136
    object QEmbarqueItensNotaCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QEmbarqueItensNotaCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
    end
    object QEmbarqueItensNotaQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
    end
  end
  object QEmbarqueSoma: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      
        '  SUM(TB_PEDIDO_ITEM.QT_PEDIDO - TB_PEDIDO_ITEM.QT_CANCELADO) AS' +
        ' QT_EMBARQUE'
      'FROM'
      '  TB_EMBARQUE_ITEM,'
      '  TB_PEDIDO_ITEM'
      'where '
      
        '  TB_EMBARQUE_ITEM.COD_PEDIDO_CAB = TB_PEDIDO_ITEM.COD_PEDIDO_CA' +
        'B'
      '  AND'
      '  cod_embarque = :cod_embarque'
      '')
    Variables.Data = {
      03000000010000000D0000003A434F445F454D42415251554503000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {04000000010000000B00000051545F454D424152515545010000000000}
    Master = QEmbarque
    MasterFields = 'COD_EMBARQUE'
    DetailFields = 'COD_EMBARQUE'
    Session = DMOracle.DBCemapa
    Left = 48
    Top = 240
    object QEmbarqueSomaQT_EMBARQUE: TFloatField
      FieldName = 'QT_EMBARQUE'
    end
  end
  object QREmbarquePedido: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  Tb_cadastro.COD_CADASTRO,'
      '  Tb_cadastro.NOME,'
      '  Tb_pedido_cab.DT_EMISSAO,'
      '  Tb_pedido_cab.DESC_OBSERVACAO,'
      '  Tb_pedido_cab.NUM_PEDIDO,'
      '  Tb_pedido_cab.DT_FATURAMENTO,'
      '  Tb_produto.DESC_PRODUTO,'
      
        '  Tb_pedido_item.QT_PEDIDO-Tb_pedido_item.QT_CANCELADO AS SQT_PE' +
        'DIDO,'
      '  Tb_pedido_item.VAL_UNITARIO,'
      '  Tb_pedido_item.PERC_DESCONTO,'
      '  Tb_pedido_item.PERC_DESCONTO1,'
      '  Tb_pedido_item.PERC_DESCONTO2,'
      '  Tb_pedido_item.PERC_ACRESCIMO'
      'FROM'
      '  TB_EMBARQUE,'
      '  TB_EMBARQUE_ITEM,'
      '  TB_PEDIDO_CAB,'
      '  TB_PEDIDO_ITEM,'
      '  TB_CADASTRO,'
      '  TB_PRODUTO'
      'WHERE'
      '  Tb_embarque_item.COD_EMBARQUE = Tb_embarque.COD_EMBARQUE'
      '  AND'
      '  Tb_embarque_item.COD_PEDIDO_CAB = Tb_pedido_cab.COD_PEDIDO_CAB'
      '  AND'
      '  Tb_pedido_cab.COD_PEDIDO_CAB = Tb_pedido_item.COD_PEDIDO_CAB'
      '  AND'
      '  Tb_pedido_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO'
      '  AND'
      '  Tb_pedido_item.COD_PRODUTO = Tb_produto.COD_PRODUTO '
      '  AND'
      '  (:EMBARQUE = TB_EMBARQUE.COD_EMBARQUE)'
      '  AND'
      '  (:COD_CADASTRO IS NULL'
      '   OR'
      '    TB_PEDIDO_CAB.COD_CADASTRO = :COD_CADASTRO)'
      ''
      ''
      ' ')
    Variables.Data = {
      0300000002000000090000003A454D4241525155450300000000000000000000
      000D0000003A434F445F434144415354524F030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000D0000000C000000434F445F434144415354524F0100000000000400
      00004E4F4D450100000000000A00000044545F454D495353414F010000000000
      0F000000444553435F4F42534552564143414F0100000000000A0000004E554D
      5F50454449444F0100000000000C000000444553435F50524F4455544F010000
      0000000A0000005351545F50454449444F0100000000000C00000056414C5F55
      4E49544152494F0100000000000D000000504552435F444553434F4E544F0100
      000000000E000000504552435F444553434F4E544F310100000000000E000000
      504552435F444553434F4E544F320100000000000E000000504552435F414352
      455343494D4F0100000000000E00000044545F4641545552414D454E544F0100
      00000000}
    Session = DMOracle.DBCemapa
    OnCalcFields = QREmbarquePedidoCalcFields
    Left = 496
    Top = 192
    object QREmbarquePedidoCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QREmbarquePedidoNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object QREmbarquePedidoDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
    object QREmbarquePedidoDESC_OBSERVACAO: TStringField
      FieldName = 'DESC_OBSERVACAO'
      Size = 60
    end
    object QREmbarquePedidoNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object QREmbarquePedidoSQT_PEDIDO: TFloatField
      FieldName = 'SQT_PEDIDO'
    end
    object QREmbarquePedidoVAL_UNITARIO: TFloatField
      FieldName = 'VAL_UNITARIO'
      Required = True
    end
    object QREmbarquePedidoPERC_DESCONTO: TFloatField
      FieldName = 'PERC_DESCONTO'
      Required = True
    end
    object QREmbarquePedidoPERC_DESCONTO1: TFloatField
      FieldName = 'PERC_DESCONTO1'
    end
    object QREmbarquePedidoPERC_DESCONTO2: TFloatField
      FieldName = 'PERC_DESCONTO2'
    end
    object QREmbarquePedidoPERC_ACRESCIMO: TFloatField
      FieldName = 'PERC_ACRESCIMO'
    end
    object QREmbarquePedidoval_total: TFloatField
      FieldKind = fkCalculated
      FieldName = 'val_total'
      Calculated = True
    end
    object QREmbarquePedidoDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
    object QREmbarquePedidoDT_FATURAMENTO: TDateTimeField
      FieldName = 'DT_FATURAMENTO'
    end
  end
  object QREmbarqueBaixado: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_EMBARQUE.COD_EMBARQUE,'
      '  TB_EMBARQUE.DT_ATUALIZA_ESTOQUE,'
      '  TB_EMBARQUE.NUM_EMBARQUE'
      'FROM'
      '  TB_EMBARQUE'
      'WHERE'
      '  TB_EMBARQUE.IND_ATUALIZA_ESTOQUE = '#39'SIM'#39
      '  AND'
      '  TB_EMBARQUE.DT_ATUALIZA_ESTOQUE >= :DT_INICIAL'
      '  AND'
      '  TB_EMBARQUE.DT_ATUALIZA_ESTOQUE <= :DT_FINAL'
      '  AND'
      '  (:EMBARQUE IS NULL'
      '  OR'
      '  TB_EMBARQUE.COD_EMBARQUE =:EMBARQUE)'
      'ORDER BY'
      '  TB_EMBARQUE.COD_EMBARQUE'
      ' ')
    Variables.Data = {
      03000000030000000B0000003A44545F494E494349414C0C0000000000000000
      000000090000003A44545F46494E414C0C000000000000000000000009000000
      3A454D424152515545030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000030000000C000000434F445F454D4241525155450100000000001300
      000044545F415455414C495A415F4553544F5155450100000000000C0000004E
      554D5F454D424152515545010000000000}
    Session = DMOracle.DBCemapa
    Left = 496
    Top = 264
    object QREmbarqueBaixadoCOD_EMBARQUE: TIntegerField
      FieldName = 'COD_EMBARQUE'
      Required = True
    end
    object QREmbarqueBaixadoDT_ATUALIZA_ESTOQUE: TDateTimeField
      FieldName = 'DT_ATUALIZA_ESTOQUE'
    end
    object QREmbarqueBaixadoNUM_EMBARQUE: TIntegerField
      FieldName = 'NUM_EMBARQUE'
    end
  end
  object QRProdutoEmbarcado: TOracleDataSet1
    SQL.Strings = (
      '/*SELECT'
      '  Tb_Nota_Cab.Cod_Filial,'
      '  Tb_Nota_Item.Cod_Produto,'
      '  TB_PRODUTO.DESC_PRODUTO,'
      '  TB_PRODUTO.COD_CLASSE,'
      '  TB_CLASSE.DESC_CLASSE,'
      '  SUM(Tb_nota_item.Qt_Quantidade) AS Qt_Quantidade'
      'FROM'
      '  TB_BAIXA_PEDIDO,'
      '  TB_PEDIDO_CAB,'
      '  TB_PEDIDO_ITEM,'
      '  TB_EMBARQUE,'
      '  TB_EMBARQUE_ITEM,'
      '  TB_NOTA_CAB,'
      '  TB_NOTA_ITEM,'
      '  TB_PRODUTO,'
      '  TB_CLASSE'
      'WHERE'
      '  (Tb_embarque.COD_EMBARQUE = Tb_embarque_item.COD_EMBARQUE)'
      '  AND'
      
        '  (Tb_embarque_item.COD_PEDIDO_CAB = Tb_pedido_cab.COD_PEDIDO_CA' +
        'B)'
      '  AND'
      '  (Tb_pedido_cab.COD_PEDIDO_CAB = Tb_pedido_item.COD_PEDIDO_CAB)'
      '  AND'
      
        '  (Tb_pedido_item.COD_PEDIDO_ITEM = Tb_baixa_pedido.COD_PEDIDO_I' +
        'TEM)'
      '  AND'
      '  (Tb_baixa_pedido.COD_NOTA_ITEM = Tb_nota_item.COD_NOTA_ITEM)'
      '  AND'
      '  (Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB)'
      '  AND'
      '  TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '  AND'
      '  (TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39')'
      '  AND'
      '  TB_PRODUTO.COD_CLASSE = TB_CLASSE.COD_CLASSE'
      '  AND'
      '  (:COD_CLASSE IS NULL'
      '   OR'
      '    TB_CLASSE.NUM_CLASSE = :COD_CLASSE)'
      '  AND'
      '  (TB_EMBARQUE.DT_ATUALIZA_ESTOQUE >= :DATA_I)'
      '  AND'
      '  (TB_EMBARQUE.DT_ATUALIZA_ESTOQUE <=  :DATA_F)'
      'Group By '
      '  Tb_Nota_Cab.Cod_Filial,'
      '  TB_PRODUTO.COD_CLASSE, '
      '  Tb_Nota_Item.Cod_Produto,'
      '  TB_PRODUTO.DESC_PRODUTO, '
      '  TB_CLASSE.DESC_CLASSE       */'
      ''
      '  SELECT'
      
        '/*  TB_PEDIDO_CAB.COD_FILIAL,*/ /*Retirado para agrupar por prod' +
        'uto j'#225' que n'#227'o aparece a filial - Junior 04/10/2017 (Big Metal)*' +
        '/'
      '  TB_PEDIDO_ITEM.COD_PRODUTO,'
      '  TB_PRODUTO.DESC_PRODUTO,'
      '  TB_PRODUTO.COD_CLASSE,'
      '  TB_CLASSE.DESC_CLASSE,'
      '  SUM(TB_PEDIDO_ITEM.QT_PEDIDO) AS QT_QUANTIDADE'
      'FROM'
      '  TB_PEDIDO_CAB,'
      '  TB_PEDIDO_ITEM,'
      '  TB_PRODUTO,'
      '  TB_CLASSE,'
      '  TB_EMBARQUE,'
      '  TB_EMBARQUE_ITEM'
      'WHERE'
      '  TB_PEDIDO_CAB.COD_PEDIDO_CAB = TB_PEDIDO_ITEM.COD_PEDIDO_CAB'
      '  AND'
      '  TB_PEDIDO_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '  AND'
      '  TB_PRODUTO.COD_CLASSE = TB_CLASSE.COD_CLASSE'
      '  AND'
      '  (TB_EMBARQUE.COD_EMBARQUE = TB_EMBARQUE_ITEM.COD_EMBARQUE)'
      '  AND'
      
        '  (TB_EMBARQUE_ITEM.COD_PEDIDO_CAB = TB_PEDIDO_CAB.COD_PEDIDO_CA' +
        'B)'
      '  AND'
      '  (TB_EMBARQUE.DT_EMBARQUE >= :DATA_I)'
      '  AND'
      '  (TB_EMBARQUE.DT_EMBARQUE <= :DATA_F)'
      '  AND'
      '  (:COD_CLASSE IS NULL'
      '   OR'
      '    TB_CLASSE.NUM_CLASSE = :COD_CLASSE)'
      'GROUP BY'
      '/*  TB_PEDIDO_CAB.COD_FILIAL,*/'
      '  TB_PEDIDO_ITEM.COD_PRODUTO,'
      '  TB_PRODUTO.DESC_PRODUTO,'
      '  TB_PRODUTO.COD_CLASSE,'
      '  TB_CLASSE.DESC_CLASSE'
      'ORDER BY TB_PRODUTO.COD_CLASSE, TB_PRODUTO.DESC_PRODUTO')
    Variables.Data = {
      0300000003000000070000003A444154415F490C000000000000000000000007
      0000003A444154415F460C00000000000000000000000B0000003A434F445F43
      4C41535345030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000060000000A000000434F445F46494C49414C0100000000000B000000
      434F445F50524F4455544F0100000000000C000000444553435F50524F445554
      4F0100000000000D00000051545F5155414E5449444144450100000000000A00
      0000434F445F434C415353450100000000000B000000444553435F434C415353
      45010000000000}
    Session = DMOracle.DBCemapa
    Left = 48
    Top = 304
    object QRProdutoEmbarcadoCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
    end
    object QRProdutoEmbarcadoDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 200
    end
    object QRProdutoEmbarcadoCOD_CLASSE: TIntegerField
      FieldName = 'COD_CLASSE'
      Required = True
    end
    object QRProdutoEmbarcadoDESC_CLASSE: TStringField
      FieldName = 'DESC_CLASSE'
      Size = 30
    end
    object QRProdutoEmbarcadoQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
    end
  end
  object QPedidoAberto: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_PEDIDO_CAB.COD_VENDEDOR,'
      '  TB_PEDIDO_CAB.COD_PEDIDO_CAB,'
      '  TB_PEDIDO_CAB.COD_CADASTRO,'
      '  TB_PEDIDO_CAB.COD_OPERACAO,'
      '  TB_PEDIDO_CAB.DT_EMISSAO,'
      '  TB_PEDIDO_CAB.DESC_OBSERVACAO,'
      '  TB_CADASTRO.DESC_CIDADE AS DESC_REGIAO,'
      '  TB_CADASTRO.NOME,'
      '  TB_CADASTRO.DESC_BAIRRO,'
      '  TB_CADASTRO.DT_CANCELAMENTO,'
      '  SUM(TB_PEDIDO_ITEM.QT_PEDIDO-TB_PEDIDO_ITEM.QT_CANCELADO'
      '      - TB_PEDIDO_ITEM.QT_ATENDIDO) AS TOTAL_CAIXAS,'
      '  SUM((TB_PEDIDO_ITEM.QT_PEDIDO-TB_PEDIDO_ITEM.QT_CANCELADO'
      
        '      - TB_PEDIDO_ITEM.QT_ATENDIDO) * TB_PRODUTO.NUM_METROS_CUBI' +
        'COS) AS VOLUME,'
      '  SUM((TB_PEDIDO_ITEM.QT_PEDIDO-TB_PEDIDO_ITEM.QT_CANCELADO'
      
        '      - TB_PEDIDO_ITEM.QT_ATENDIDO) * TB_PRODUTO.NUM_VOLUMES) AS' +
        ' PESO,'
      
        '  SUM(DECODE(Tb_pedido_item.QT_PEDIDO,0,Tb_pedido_item.VAL_UNITA' +
        'RIO,(Tb_pedido_item.QT_PEDIDO'
      
        '      -Tb_pedido_item.QT_CANCELADO) * Tb_pedido_item.VAL_UNITARI' +
        'O)) AS VAL_TOTAL'
      'FROM'
      '  TB_PEDIDO_ITEM,'
      '  TB_PEDIDO_CAB,'
      '  TB_CADASTRO,'
      '  TB_PRODUTO,'
      '  TB_VENDEDOR'
      'WHERE'
      '  TB_PEDIDO_ITEM.COD_PEDIDO_CAB = TB_PEDIDO_CAB.COD_PEDIDO_CAB'
      '  AND'
      '  TB_CADASTRO.COD_CADASTRO = TB_PEDIDO_CAB.COD_CADASTRO'
      '  AND'
      '  TB_PEDIDO_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '  AND'
      '  TB_PEDIDO_CAB.COD_VENDEDOR = TB_VENDEDOR.COD_VENDEDOR'
      '  AND'
      
        '/* (TB_PEDIDO_ITEM.QT_PEDIDO -TB_PEDIDO_ITEM.QT_ATENDIDO - TB_PE' +
        'DIDO_ITEM.QT_CANCELADO) > 0'
      '  AND  */'
      '  TB_PEDIDO_ITEM.QT_ATENDIDO = 0'
      '  AND'
      '  TB_PEDIDO_ITEM.QT_CANCELADO = 0'
      '  AND'
      '  TB_PEDIDO_CAB.IND_EMBARQUE = '#39'N'#39
      '  AND'
      '  TB_PEDIDO_CAB.IND_SITUACAO <> '#39'2'#39
      '  AND'
      '  TB_PEDIDO_CAB.IND_LIBERADO = '#39'SIM'#39
      '  AND'
      '  (TB_PEDIDO_CAB.DT_ENTREGA IS NULL'
      '   OR'
      '    TB_PEDIDO_CAB.DT_ENTREGA <= :DT_ENTREGA)'
      '  AND'
      '  (:COD_FILIAL IS NULL'
      '    OR'
      '    TB_PEDIDO_CAB.COD_FILIAL = :COD_FILIAL)'
      '  AND'
      '  (:COD_VENDEDOR IS NULL'
      '    OR'
      '    TB_PEDIDO_CAB.COD_VENDEDOR = :COD_VENDEDOR)'
      '  AND'
      '  TB_PEDIDO_CAB.DT_EMISSAO >= '#39'01/09/2004'#39
      '  AND'
      '  (:COD_ESTADO IS NULL'
      '    OR TB_CADASTRO.COD_ESTADO = :COD_ESTADO)'
      ''
      ''
      '/*  AND'
      '   TB_PEDIDO_ITEM.COD_PEDIDO_ITEM NOT IN'
      '        (SELECT'
      '           COD_PEDIDO_ITEM'
      '         FROM'
      '           TB_BAIXA_PEDIDO'
      '         WHERE'
      
        '           TB_BAIXA_PEDIDO.COD_PEDIDO_ITEM = TB_PEDIDO_ITEM.COD_' +
        'PEDIDO_ITEM)  */'
      'GROUP BY'
      '  TB_PEDIDO_CAB.COD_VENDEDOR,'
      '  TB_CADASTRO.DESC_CIDADE,'
      '  TB_CADASTRO.DESC_BAIRRO,'
      '  TB_CADASTRO.NOME,'
      '  TB_PEDIDO_CAB.COD_CADASTRO,'
      '  TB_PEDIDO_CAB.COD_OPERACAO,'
      '  TB_PEDIDO_CAB.DT_EMISSAO,'
      '  TB_PEDIDO_CAB.COD_PEDIDO_CAB,'
      '  TB_CADASTRO.DT_CANCELAMENTO,'
      '  TB_PEDIDO_CAB.DESC_OBSERVACAO'
      'ORDER BY'
      '  TB_CADASTRO.DESC_CIDADE,'
      '  TB_CADASTRO.NOME,'
      '  TB_PEDIDO_CAB.COD_VENDEDOR,'
      '  TB_CADASTRO.DESC_CIDADE,'
      '  TB_CADASTRO.DESC_BAIRRO,'
      '  TB_PEDIDO_CAB.COD_CADASTRO,'
      '  TB_PEDIDO_CAB.DT_EMISSAO'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Variables.Data = {
      03000000040000000D0000003A434F445F56454E4445444F5203000000000000
      00000000000B0000003A434F445F46494C49414C030000000000000000000000
      0B0000003A434F445F45535441444F0500000000000000000000000B0000003A
      44545F454E54524547410C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000E0000000C000000544F54414C5F4341495841530100000000000600
      0000564F4C554D45010000000000040000005045534F0100000000000B000000
      444553435F52454749414F0100000000000900000056414C5F544F54414C0100
      000000000C000000434F445F56454E4445444F520100000000000E000000434F
      445F50454449444F5F4341420100000000000C000000434F445F434144415354
      524F0100000000000A00000044545F454D495353414F0100000000000F000000
      44545F43414E43454C414D454E544F0100000000000F000000444553435F4F42
      534552564143414F0100000000000C000000434F445F4F5045524143414F0100
      00000000040000004E4F4D450100000000000B000000444553435F4241495252
      4F010000000000}
    Session = DMOracle.DBCemapa
    Left = 168
    Top = 296
    object QPedidoAbertoTOTAL_CAIXAS: TFloatField
      FieldName = 'TOTAL_CAIXAS'
    end
    object QPedidoAbertoVOLUME: TFloatField
      FieldName = 'VOLUME'
      DisplayFormat = '#,##0.00'
    end
    object QPedidoAbertoPESO: TFloatField
      FieldName = 'PESO'
      DisplayFormat = '#,##0.00'
    end
    object QPedidoAbertoDESC_REGIAO: TStringField
      FieldName = 'DESC_REGIAO'
      Required = True
      Size = 30
    end
    object QPedidoAbertoVAL_TOTAL: TFloatField
      FieldName = 'VAL_TOTAL'
      DisplayFormat = '#,##0.00'
    end
    object QPedidoAbertoCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object QPedidoAbertoCOD_PEDIDO_CAB: TIntegerField
      FieldName = 'COD_PEDIDO_CAB'
      Required = True
    end
    object QPedidoAbertoCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
    end
    object QPedidoAbertoDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
    object QPedidoAbertoDT_CANCELAMENTO: TDateTimeField
      FieldName = 'DT_CANCELAMENTO'
    end
    object QPedidoAbertoDESC_OBSERVACAO: TStringField
      FieldName = 'DESC_OBSERVACAO'
      Size = 60
    end
    object QPedidoAbertoCOD_OPERACAO: TIntegerField
      FieldName = 'COD_OPERACAO'
    end
    object QPedidoAbertoNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object QPedidoAbertoDESC_BAIRRO: TStringField
      FieldName = 'DESC_BAIRRO'
    end
  end
  object QListaCaminhoes: TOracleDataSet1
    SQL.Strings = (
      'select'
      '  desc_placa'
      'from'
      '  tb_veiculo_conhecimento'
      'order by'
      '  desc_placa')
    QBEDefinition.QBEFieldDefs = {04000000010000000A000000444553435F504C414341010000000000}
    Session = DMOracle.DBCemapa
    Left = 272
    Top = 307
    object QListaCaminhoesDESC_PLACA: TStringField
      FieldName = 'DESC_PLACA'
      Required = True
      Size = 8
    end
  end
  object OPEmbarque: TOraclePackage
    Session = DMOracle.DBCemapa
    PackageName = 'PCK_VENDA'
    Left = 384
    Top = 309
  end
  object QSimuladorEstoque: TOracleDataSet1
    SQL.Strings = (
      'select'
      '  tb_pedido_cab.cod_filial,'
      '  tb_pedido_item.cod_produto,'
      
        '  (tb_pedido_item.qt_pedido - tb_pedido_item.qt_atendido - tb_pe' +
        'dido_item.qt_cancelado) as qt_pedido'
      'from'
      '  tb_pedido_cab,'
      '  tb_pedido_item'
      'where'
      '  tb_pedido_cab.cod_pedido_cab = tb_pedido_item.cod_pedido_cab'
      '  and'
      '  tb_pedido_cab.cod_pedido_cab = :cod_pedido_cab')
    Variables.Data = {
      03000000010000000F0000003A434F445F50454449444F5F4341420300000000
      00000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000030000000A000000434F445F46494C49414C0100000000000B000000
      434F445F50524F4455544F0100000000000900000051545F50454449444F0100
      00000000}
    Session = DMOracle.DBCemapa
    Left = 386
    Top = 360
    object QSimuladorEstoqueCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
    end
    object QSimuladorEstoqueCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
    end
    object QSimuladorEstoqueQT_PEDIDO: TFloatField
      FieldName = 'QT_PEDIDO'
    end
  end
  object QRPedido_Vendedor: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_PEDIDO_CAB.COD_VENDEDOR,'
      '  TB_VENDEDOR.COD_SUPERVISOR,'
      '  TB_VENDEDOR.NOME,'
      '  TB_VENDEDOR.DESC_CIDADE AS DESC_REGIAO,'
      
        '  SUM(DECODE(DT_CANCELAMENTO,NULL,TB_PEDIDO_ITEM.QT_PEDIDO-TB_PE' +
        'DIDO_ITEM.QT_CANCELADO'
      '      - TB_PEDIDO_ITEM.QT_ATENDIDO,0)) AS TOTAL_CAIXAS,'
      
        '  SUM(DECODE(DT_CANCELAMENTO,NULL,0,TB_PEDIDO_ITEM.QT_PEDIDO-TB_' +
        'PEDIDO_ITEM.QT_CANCELADO'
      '      - TB_PEDIDO_ITEM.QT_ATENDIDO)) AS TOTAL_PENDENTE'
      'FROM'
      '  TB_PEDIDO_ITEM,'
      '  TB_PEDIDO_CAB,'
      '  TB_PRODUTO,'
      '  TB_CADASTRO,'
      '  TB_VENDEDOR'
      'WHERE'
      '  TB_PEDIDO_ITEM.COD_PEDIDO_CAB = TB_PEDIDO_CAB.COD_PEDIDO_CAB'
      '  AND'
      '  TB_PEDIDO_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '  AND'
      '  TB_PEDIDO_CAB.COD_VENDEDOR = TB_VENDEDOR.COD_VENDEDOR'
      '  AND'
      '  TB_PEDIDO_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
      '  AND'
      
        ' (TB_PEDIDO_ITEM.QT_PEDIDO -TB_PEDIDO_ITEM.QT_ATENDIDO - TB_PEDI' +
        'DO_ITEM.QT_CANCELADO) > 0'
      '  AND'
      '  TB_PEDIDO_CAB.IND_LIBERADO = '#39'SIM'#39
      '  AND'
      '  TB_PEDIDO_CAB.IND_EMBARQUE = '#39'N'#39
      '  AND'
      '  TB_PEDIDO_CAB.DT_EMISSAO >= '#39'01/09/2004'#39
      '  AND'
      '  (:COD_VENDEDOR IS NULL'
      '    OR'
      '    TB_PEDIDO_CAB.COD_VENDEDOR = :COD_VENDEDOR)'
      '  AND'
      '  (:COD_FILIAL IS NULL'
      '    OR'
      '    TB_PEDIDO_CAB.COD_FILIAL = :COD_FILIAL)'
      '  AND'
      '  (:COD_REGIAO IS NULL'
      '    OR'
      '     TB_VENDEDOR.COD_VENDEDOR IN'
      '     ('
      '       SELECT COD_VENDEDOR'
      '       FROM   TB_VENDEDOR_REGIAO'
      '       WHERE  COD_REGIAO = :COD_REGIAO'
      '     )'
      '  )'
      '  AND'
      '   TB_PEDIDO_ITEM.COD_PEDIDO_ITEM NOT IN'
      '        (SELECT'
      '           COD_PEDIDO_ITEM'
      '         FROM'
      '           TB_BAIXA_PEDIDO'
      '         WHERE'
      
        '           TB_BAIXA_PEDIDO.COD_PEDIDO_ITEM = TB_PEDIDO_ITEM.COD_' +
        'PEDIDO_ITEM)'
      '   AND'
      '   (:COD_SUPERVISOR IS NULL'
      '     OR'
      '     TB_VENDEDOR.COD_SUPERVISOR = :COD_SUPERVISOR)'
      ''
      'GROUP BY'
      '  TB_VENDEDOR.COD_SUPERVISOR,'
      '  TB_PEDIDO_CAB.COD_VENDEDOR,'
      '  TB_VENDEDOR.DESC_CIDADE,'
      '  TB_VENDEDOR.NOME'
      ''
      ''
      ' ')
    Variables.Data = {
      03000000040000000B0000003A434F445F46494C49414C030000000000000000
      0000000D0000003A434F445F56454E4445444F52030000000000000000000000
      0F0000003A434F445F53555045525649534F520300000000000000000000000B
      0000003A434F445F52454749414F030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000060000000C000000434F445F56454E4445444F520100000000000B00
      0000444553435F52454749414F0100000000000C000000544F54414C5F434149
      584153010000000000040000004E4F4D450100000000000E000000434F445F53
      555045525649534F520100000000000E000000544F54414C5F50454E44454E54
      45010000000000}
    Session = DMOracle.DBCemapa
    OnCalcFields = QRPedido_VendedorCalcFields
    Left = 496
    Top = 328
    object QRPedido_VendedorCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object QRPedido_VendedorNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 40
    end
    object QRPedido_VendedorDESC_REGIAO: TStringField
      FieldName = 'DESC_REGIAO'
      Size = 30
    end
    object QRPedido_VendedorTOTAL_CAIXAS: TFloatField
      FieldName = 'TOTAL_CAIXAS'
    end
    object QRPedido_VendedorCOD_SUPERVISOR: TIntegerField
      FieldName = 'COD_SUPERVISOR'
    end
    object QRPedido_Vendedornome_supervisor: TStringField
      FieldKind = fkCalculated
      FieldName = 'nome_supervisor'
      Size = 40
      Calculated = True
    end
    object QRPedido_VendedorTOTAL_PENDENTE: TFloatField
      FieldName = 'TOTAL_PENDENTE'
    end
  end
  object QRPedidoEmbarque: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_PEDIDO_CAB.COD_VENDEDOR,'
      '  TB_PEDIDO_CAB.COD_PEDIDO_CAB,'
      '  TB_CADASTRO.DESC_CIDADE AS DESC_REGIAO,'
      '  SUM(TB_PEDIDO_ITEM.QT_PEDIDO-TB_PEDIDO_ITEM.QT_CANCELADO'
      '      - TB_PEDIDO_ITEM.QT_ATENDIDO) AS TOTAL_CAIXAS,'
      '  SUM((TB_PEDIDO_ITEM.QT_PEDIDO-TB_PEDIDO_ITEM.QT_CANCELADO'
      
        '      - TB_PEDIDO_ITEM.QT_ATENDIDO) * TB_PRODUTO.NUM_METROS_CUBI' +
        'COS) AS VOLUME,'
      '  SUM((TB_PEDIDO_ITEM.QT_PEDIDO-TB_PEDIDO_ITEM.QT_CANCELADO'
      
        '      - TB_PEDIDO_ITEM.QT_ATENDIDO) * TB_PRODUTO.NUM_VOLUMES) AS' +
        ' PESO,'
      '  SUM((TB_PEDIDO_ITEM.QT_PEDIDO-TB_PEDIDO_ITEM.QT_CANCELADO'
      
        '      - TB_PEDIDO_ITEM.QT_ATENDIDO) * TB_PEDIDO_ITEM.VAL_UNITARI' +
        'O) AS VAL_TOTAL'
      'FROM'
      '  TB_PEDIDO_ITEM,'
      '  TB_PEDIDO_CAB,'
      '  TB_EMBARQUE,'
      '  TB_EMBARQUE_ITEM,'
      '  TB_CADASTRO,'
      '  TB_PRODUTO'
      'WHERE'
      '  TB_PEDIDO_ITEM.COD_PEDIDO_CAB = TB_PEDIDO_CAB.COD_PEDIDO_CAB'
      '  AND'
      '  TB_CADASTRO.COD_CADASTRO = TB_PEDIDO_CAB.COD_CADASTRO'
      '  AND'
      '  TB_PEDIDO_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '  AND'
      '  TB_EMBARQUE.COD_EMBARQUE = TB_EMBARQUE_ITEM.COD_EMBARQUE'
      '  AND'
      '  TB_EMBARQUE_ITEM.COD_PEDIDO_CAB = TB_PEDIDO_CAB.COD_PEDIDO_CAB'
      '  AND'
      '  TB_EMBARQUE.COD_EMBARQUE = :EMBARQUE'
      '  AND'
      '  TB_PEDIDO_CAB.DT_EMISSAO >= '#39'01/09/2004'#39
      'GROUP BY'
      '  TB_PEDIDO_CAB.COD_VENDEDOR,'
      '  TB_CADASTRO.DESC_CIDADE,'
      '  TB_PEDIDO_CAB.COD_PEDIDO_CAB'
      ' ')
    Variables.Data = {
      0300000001000000090000003A454D4241525155450300000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      04000000070000000C000000434F445F56454E4445444F520100000000000E00
      0000434F445F50454449444F5F4341420100000000000B000000444553435F52
      454749414F0100000000000C000000544F54414C5F4341495841530100000000
      0006000000564F4C554D45010000000000040000005045534F01000000000009
      00000056414C5F544F54414C010000000000}
    Session = DMOracle.DBCemapa
    Left = 48
    Top = 368
    object QRPedidoEmbarqueCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object QRPedidoEmbarqueCOD_PEDIDO_CAB: TIntegerField
      FieldName = 'COD_PEDIDO_CAB'
      Required = True
    end
    object QRPedidoEmbarqueDESC_REGIAO: TStringField
      FieldName = 'DESC_REGIAO'
      Size = 30
    end
    object QRPedidoEmbarqueTOTAL_CAIXAS: TFloatField
      FieldName = 'TOTAL_CAIXAS'
    end
    object QRPedidoEmbarqueVOLUME: TFloatField
      FieldName = 'VOLUME'
    end
    object QRPedidoEmbarquePESO: TFloatField
      FieldName = 'PESO'
    end
    object QRPedidoEmbarqueVAL_TOTAL: TFloatField
      FieldName = 'VAL_TOTAL'
    end
  end
  object QREmbarqueCliente: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_EMBARQUE.COD_EMBARQUE,'
      '  TB_EMBARQUE.DT_EMBARQUE,'
      '  TB_EMBARQUE.NOME_MOTORISTA,'
      '  TB_EMBARQUE.DESC_PLACA'
      'FROM'
      '  TB_EMBARQUE'
      'WHERE '
      '  TB_EMBARQUE.DT_EMBARQUE >= :DT_INICIAL'
      '  AND'
      '  TB_EMBARQUE.DT_EMBARQUE <= :DT_FINAL'
      'ORDER BY'
      '  TB_EMBARQUE.DT_EMBARQUE ')
    Variables.Data = {
      03000000020000000B0000003A44545F494E494349414C0C0000000000000000
      000000090000003A44545F46494E414C0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000040000000C000000434F445F454D4241525155450100000000000B00
      000044545F454D4241525155450100000000000E0000004E4F4D455F4D4F544F
      52495354410100000000000A000000444553435F504C414341010000000000}
    Session = DMOracle.DBCemapa
    Left = 496
    Top = 392
    object QREmbarqueClienteCOD_EMBARQUE: TIntegerField
      FieldName = 'COD_EMBARQUE'
      Required = True
    end
    object QREmbarqueClienteDT_EMBARQUE: TDateTimeField
      FieldName = 'DT_EMBARQUE'
      Required = True
    end
    object QREmbarqueClienteNOME_MOTORISTA: TStringField
      FieldName = 'NOME_MOTORISTA'
      Size = 50
    end
    object QREmbarqueClienteDESC_PLACA: TStringField
      FieldName = 'DESC_PLACA'
      Size = 8
    end
  end
  object QREstoqueEmbarque: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_PEDIDO_ITEM.COD_PRODUTO,'
      '  TB_PRODUTO.DESC_PRODUTO,'
      
        '  SUM(TB_PEDIDO_ITEM.QT_PEDIDO /*- TB_PEDIDO_ITEM.QT_ATENDIDO*/ ' +
        '- TB_PEDIDO_ITEM.QT_CANCELADO) AS QT_PEDIDO,'
      
        '/*  DECODE(TB_PEDIDO_CAB.COD_FILIAL,1,TB_ESTOQUE.QT_QUANTIDADE,0' +
        ') AS QT_QUANTIDADE,'
      
        '  SUM(TB_ESTOQUE.QT_QUANTIDADE) - SUM(TB_PEDIDO_ITEM.QT_PEDIDO -' +
        ' TB_PEDIDO_ITEM.QT_CANCELADO) AS QT_SALDO,  */'
      
        '  SUM(DECODE(CS_EMBARQUE.ROWNUM_EMBARQUE - :ROWNUM_EMBARQUE + 1,' +
        ' 1,  TB_PEDIDO_ITEM.QT_PEDIDO /*- TB_PEDIDO_ITEM.QT_ATENDIDO*/ -' +
        ' TB_PEDIDO_ITEM.QT_CANCELADO,0)) AS QT_EMBARQUE1,'
      
        '  SUM(DECODE(CS_EMBARQUE.ROWNUM_EMBARQUE - :ROWNUM_EMBARQUE + 1,' +
        ' 2,  TB_PEDIDO_ITEM.QT_PEDIDO /*- TB_PEDIDO_ITEM.QT_ATENDIDO*/ -' +
        ' TB_PEDIDO_ITEM.QT_CANCELADO,0)) AS QT_EMBARQUE2,'
      
        '  SUM(DECODE(CS_EMBARQUE.ROWNUM_EMBARQUE - :ROWNUM_EMBARQUE + 1,' +
        ' 3,  TB_PEDIDO_ITEM.QT_PEDIDO /*- TB_PEDIDO_ITEM.QT_ATENDIDO*/ -' +
        ' TB_PEDIDO_ITEM.QT_CANCELADO,0)) AS QT_EMBARQUE3,'
      
        '  SUM(DECODE(CS_EMBARQUE.ROWNUM_EMBARQUE - :ROWNUM_EMBARQUE + 1,' +
        ' 4,  TB_PEDIDO_ITEM.QT_PEDIDO /*- TB_PEDIDO_ITEM.QT_ATENDIDO*/ -' +
        ' TB_PEDIDO_ITEM.QT_CANCELADO,0)) AS QT_EMBARQUE4,'
      
        '  SUM(DECODE(CS_EMBARQUE.ROWNUM_EMBARQUE - :ROWNUM_EMBARQUE + 1,' +
        ' 5,  TB_PEDIDO_ITEM.QT_PEDIDO /*- TB_PEDIDO_ITEM.QT_ATENDIDO*/ -' +
        ' TB_PEDIDO_ITEM.QT_CANCELADO,0)) AS QT_EMBARQUE5,'
      
        '  SUM(DECODE(CS_EMBARQUE.ROWNUM_EMBARQUE - :ROWNUM_EMBARQUE + 1,' +
        ' 6,  TB_PEDIDO_ITEM.QT_PEDIDO /*- TB_PEDIDO_ITEM.QT_ATENDIDO*/ -' +
        ' TB_PEDIDO_ITEM.QT_CANCELADO,0)) AS QT_EMBARQUE6,'
      
        '  SUM(DECODE(CS_EMBARQUE.ROWNUM_EMBARQUE - :ROWNUM_EMBARQUE + 1,' +
        ' 7,  TB_PEDIDO_ITEM.QT_PEDIDO /*- TB_PEDIDO_ITEM.QT_ATENDIDO*/ -' +
        ' TB_PEDIDO_ITEM.QT_CANCELADO,0)) AS QT_EMBARQUE7,'
      
        '  SUM(DECODE(CS_EMBARQUE.ROWNUM_EMBARQUE - :ROWNUM_EMBARQUE + 1,' +
        ' 8,  TB_PEDIDO_ITEM.QT_PEDIDO /*- TB_PEDIDO_ITEM.QT_ATENDIDO*/ -' +
        ' TB_PEDIDO_ITEM.QT_CANCELADO,0)) AS QT_EMBARQUE8,'
      
        '  SUM(DECODE(CS_EMBARQUE.ROWNUM_EMBARQUE - :ROWNUM_EMBARQUE + 1,' +
        ' 9,  TB_PEDIDO_ITEM.QT_PEDIDO /*- TB_PEDIDO_ITEM.QT_ATENDIDO*/ -' +
        ' TB_PEDIDO_ITEM.QT_CANCELADO,0)) AS QT_EMBARQUE9,'
      
        '  SUM(DECODE(CS_EMBARQUE.ROWNUM_EMBARQUE - :ROWNUM_EMBARQUE + 1,' +
        ' 10, TB_PEDIDO_ITEM.QT_PEDIDO /*- TB_PEDIDO_ITEM.QT_ATENDIDO*/ -' +
        ' TB_PEDIDO_ITEM.QT_CANCELADO,0)) AS QT_EMBARQUE10,'
      
        '  SUM(DECODE(CS_EMBARQUE.ROWNUM_EMBARQUE - :ROWNUM_EMBARQUE + 1,' +
        ' 11, TB_PEDIDO_ITEM.QT_PEDIDO /*- TB_PEDIDO_ITEM.QT_ATENDIDO*/ -' +
        ' TB_PEDIDO_ITEM.QT_CANCELADO,0)) AS QT_EMBARQUE11,'
      
        '  SUM(DECODE(CS_EMBARQUE.ROWNUM_EMBARQUE - :ROWNUM_EMBARQUE + 1,' +
        ' 12, TB_PEDIDO_ITEM.QT_PEDIDO /*- TB_PEDIDO_ITEM.QT_ATENDIDO*/ -' +
        ' TB_PEDIDO_ITEM.QT_CANCELADO,0)) AS QT_EMBARQUE12,'
      
        '  SUM(DECODE(CS_EMBARQUE.ROWNUM_EMBARQUE - :ROWNUM_EMBARQUE + 1,' +
        ' 13, TB_PEDIDO_ITEM.QT_PEDIDO /*- TB_PEDIDO_ITEM.QT_ATENDIDO*/ -' +
        ' TB_PEDIDO_ITEM.QT_CANCELADO,0)) AS QT_EMBARQUE13,'
      
        '  SUM(DECODE(CS_EMBARQUE.ROWNUM_EMBARQUE - :ROWNUM_EMBARQUE + 1,' +
        ' 14, TB_PEDIDO_ITEM.QT_PEDIDO /*- TB_PEDIDO_ITEM.QT_ATENDIDO*/ -' +
        ' TB_PEDIDO_ITEM.QT_CANCELADO,0)) AS QT_EMBARQUE14,'
      
        '  SUM(DECODE(CS_EMBARQUE.ROWNUM_EMBARQUE - :ROWNUM_EMBARQUE + 1,' +
        ' 15, TB_PEDIDO_ITEM.QT_PEDIDO /*- TB_PEDIDO_ITEM.QT_ATENDIDO*/ -' +
        ' TB_PEDIDO_ITEM.QT_CANCELADO,0)) AS QT_EMBARQUE15,'
      
        '  SUM(DECODE(CS_EMBARQUE.ROWNUM_EMBARQUE - :ROWNUM_EMBARQUE + 1,' +
        ' 16, TB_PEDIDO_ITEM.QT_PEDIDO /*- TB_PEDIDO_ITEM.QT_ATENDIDO*/ -' +
        ' TB_PEDIDO_ITEM.QT_CANCELADO,0)) AS QT_EMBARQUE16,'
      
        '  SUM(DECODE(CS_EMBARQUE.ROWNUM_EMBARQUE - :ROWNUM_EMBARQUE + 1,' +
        ' 17, TB_PEDIDO_ITEM.QT_PEDIDO /*- TB_PEDIDO_ITEM.QT_ATENDIDO*/ -' +
        ' TB_PEDIDO_ITEM.QT_CANCELADO,0)) AS QT_EMBARQUE17,'
      
        '  SUM(DECODE(CS_EMBARQUE.ROWNUM_EMBARQUE - :ROWNUM_EMBARQUE + 1,' +
        ' 18, TB_PEDIDO_ITEM.QT_PEDIDO /*- TB_PEDIDO_ITEM.QT_ATENDIDO*/ -' +
        ' TB_PEDIDO_ITEM.QT_CANCELADO,0)) AS QT_EMBARQUE18,'
      
        '  SUM(DECODE(CS_EMBARQUE.ROWNUM_EMBARQUE - :ROWNUM_EMBARQUE + 1,' +
        ' 19, TB_PEDIDO_ITEM.QT_PEDIDO /*- TB_PEDIDO_ITEM.QT_ATENDIDO*/ -' +
        ' TB_PEDIDO_ITEM.QT_CANCELADO,0)) AS QT_EMBARQUE19,'
      
        '  SUM(DECODE(CS_EMBARQUE.ROWNUM_EMBARQUE - :ROWNUM_EMBARQUE + 1,' +
        ' 20, TB_PEDIDO_ITEM.QT_PEDIDO /*- TB_PEDIDO_ITEM.QT_ATENDIDO*/ -' +
        ' TB_PEDIDO_ITEM.QT_CANCELADO,0)) AS QT_EMBARQUE20'
      'FROM'
      '  TB_EMBARQUE,'
      '  TB_FILIAL,'
      '  TB_EMBARQUE_ITEM,'
      '  TB_PEDIDO_CAB,'
      '  TB_PEDIDO_ITEM,'
      '  TB_PRODUTO,'
      '/*  TB_ESTOQUE,  retirado pelo c'#233'sar */'
      '  ('
      '    SELECT'
      '      COD_EMBARQUE,'
      
        '      ROWNUM AS ROWNUM_EMBARQUE /*gera um numero sequencial inic' +
        'iando em 1 para cada embarque*/'
      '    FROM ('
      '      SELECT DISTINCT'
      '        TB_EMBARQUE.COD_EMBARQUE'
      '      FROM'
      '        TB_EMBARQUE,'
      '        TB_EMBARQUE_ITEM,'
      '        TB_PEDIDO_CAB,'
      '        TB_PEDIDO_ITEM,'
      '        TB_PRODUTO  /*,'
      '        TB_ESTOQUE      */'
      '      WHERE'
      
        '        TB_PEDIDO_CAB.COD_PEDIDO_CAB = TB_PEDIDO_ITEM.COD_PEDIDO' +
        '_CAB'
      '        AND'
      
        '        TB_PEDIDO_ITEM.COD_PEDIDO_CAB = TB_EMBARQUE_ITEM.COD_PED' +
        'IDO_CAB'
      '        AND'
      '        TB_EMBARQUE_ITEM.COD_EMBARQUE = TB_EMBARQUE.COD_EMBARQUE'
      '        AND'
      '        TB_PEDIDO_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '        AND'
      '        TB_PRODUTO.IND_TIPO_PRODUTO = '#39'COMERCIAL'#39
      '        AND'
      
        '        (TB_PEDIDO_ITEM.QT_PEDIDO /*-TB_PEDIDO_ITEM.QT_ATENDIDO*' +
        '/ - TB_PEDIDO_ITEM.QT_CANCELADO) > 0'
      '        AND'
      '        TB_EMBARQUE.DT_EMBARQUE >= :DT_REFERENCIA'
      '        AND'
      '        TB_EMBARQUE.DT_EMBARQUE <= :DT_REFERENCIA_FINAL'
      '        AND'
      '        TB_EMBARQUE.IND_ATUALIZA_ESTOQUE = '#39'NAO'#39
      '        AND'
      '        (:FILIAL IS NULL'
      '         OR'
      '          TB_PEDIDO_CAB.COD_FILIAL = :FILIAL)'
      '    )'
      
        '  ) CS_EMBARQUE /*essa sql gera um numero sequencial iniciando e' +
        'm 1 para cada embarque, isso foi necessario para poder ser feito' +
        ' o decode acima*/'
      'WHERE'
      '  TB_PEDIDO_CAB.COD_FILIAL = TB_FILIAL.COD_FILIAL'
      '  AND'
      '  TB_PEDIDO_CAB.COD_PEDIDO_CAB = TB_PEDIDO_ITEM.COD_PEDIDO_CAB'
      '  AND'
      
        '  TB_PEDIDO_ITEM.COD_PEDIDO_CAB = TB_EMBARQUE_ITEM.COD_PEDIDO_CA' +
        'B'
      '  AND'
      '  TB_EMBARQUE_ITEM.COD_EMBARQUE = TB_EMBARQUE.COD_EMBARQUE'
      '  AND'
      '  TB_PEDIDO_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '  AND'
      '  TB_EMBARQUE.COD_EMBARQUE = CS_EMBARQUE.COD_EMBARQUE'
      '  AND'
      
        '  (TB_PEDIDO_ITEM.QT_PEDIDO /*- TB_PEDIDO_ITEM.QT_ATENDIDO*/ - T' +
        'B_PEDIDO_ITEM.QT_CANCELADO) > 0'
      '  AND'
      '  TB_EMBARQUE.DT_EMBARQUE >= :DT_REFERENCIA'
      '  AND'
      '  TB_EMBARQUE.DT_EMBARQUE <= :DT_REFERENCIA_FINAL'
      '  AND'
      '  TB_EMBARQUE.IND_ATUALIZA_ESTOQUE = '#39'NAO'#39
      '  AND'
      '  (:FILIAL IS NULL'
      '   OR'
      '    TB_PEDIDO_CAB.COD_FILIAL = :FILIAL)'
      '  AND'
      '  TB_EMBARQUE.COD_EMBARQUE NOT IN (:LISTA_EMBARQUE)'
      ''
      'GROUP BY'
      '  TB_PEDIDO_ITEM.COD_PRODUTO,'
      '  TB_PRODUTO.DESC_PRODUTO'
      ''
      ''
      ' ')
    Variables.Data = {
      0300000005000000070000003A46494C49414C0300000000000000000000000E
      0000003A44545F5245464552454E4349410C0000000000000000000000140000
      003A44545F5245464552454E4349415F46494E414C0C00000000000000000000
      00100000003A524F574E554D5F454D4241525155450300000000000000000000
      000F0000003A4C495354415F454D424152515545010000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000170000000B000000434F445F50524F4455544F0100000000000C0000
      00444553435F50524F4455544F0100000000000900000051545F50454449444F
      0100000000000C00000051545F454D424152515545310100000000000C000000
      51545F454D424152515545320100000000000C00000051545F454D4241525155
      45330100000000000C00000051545F454D424152515545340100000000000C00
      000051545F454D424152515545350100000000000C00000051545F454D424152
      515545360100000000000C00000051545F454D42415251554537010000000000
      0C00000051545F454D424152515545380100000000000C00000051545F454D42
      4152515545390100000000000D00000051545F454D4241525155453130010000
      0000000D00000051545F454D42415251554531310100000000000D0000005154
      5F454D42415251554531320100000000000D00000051545F454D424152515545
      31330100000000000D00000051545F454D42415251554531340100000000000D
      00000051545F454D42415251554531350100000000000D00000051545F454D42
      415251554531360100000000000D00000051545F454D42415251554531370100
      000000000D00000051545F454D42415251554531380100000000000D00000051
      545F454D42415251554531390100000000000D00000051545F454D4241525155
      453230010000000000}
    Session = DMOracle.DBCemapa
    OnCalcFields = QREstoqueEmbarqueCalcFields
    Left = 384
    Top = 416
    object QREstoqueEmbarqueCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
    end
    object QREstoqueEmbarqueDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
    object QREstoqueEmbarqueQT_PEDIDO: TFloatField
      FieldName = 'QT_PEDIDO'
    end
    object QREstoqueEmbarqueQT_EMBARQUE1: TFloatField
      FieldName = 'QT_EMBARQUE1'
      DisplayFormat = '####'
    end
    object QREstoqueEmbarqueQT_EMBARQUE2: TFloatField
      FieldName = 'QT_EMBARQUE2'
      DisplayFormat = '####'
    end
    object QREstoqueEmbarqueQT_EMBARQUE3: TFloatField
      FieldName = 'QT_EMBARQUE3'
      DisplayFormat = '####'
    end
    object QREstoqueEmbarqueQT_EMBARQUE4: TFloatField
      FieldName = 'QT_EMBARQUE4'
      DisplayFormat = '####'
    end
    object QREstoqueEmbarqueQT_EMBARQUE5: TFloatField
      FieldName = 'QT_EMBARQUE5'
      DisplayFormat = '####'
    end
    object QREstoqueEmbarqueQT_EMBARQUE6: TFloatField
      FieldName = 'QT_EMBARQUE6'
      DisplayFormat = '####'
    end
    object QREstoqueEmbarqueQT_EMBARQUE7: TFloatField
      FieldName = 'QT_EMBARQUE7'
      DisplayFormat = '####'
    end
    object QREstoqueEmbarqueQT_EMBARQUE8: TFloatField
      FieldName = 'QT_EMBARQUE8'
      DisplayFormat = '####'
    end
    object QREstoqueEmbarqueQT_EMBARQUE9: TFloatField
      FieldName = 'QT_EMBARQUE9'
      DisplayFormat = '####'
    end
    object QREstoqueEmbarqueQT_EMBARQUE10: TFloatField
      FieldName = 'QT_EMBARQUE10'
      DisplayFormat = '####'
    end
    object QREstoqueEmbarqueQT_EMBARQUE11: TFloatField
      FieldName = 'QT_EMBARQUE11'
      DisplayFormat = '####'
    end
    object QREstoqueEmbarqueQT_EMBARQUE12: TFloatField
      FieldName = 'QT_EMBARQUE12'
      DisplayFormat = '####'
    end
    object QREstoqueEmbarqueQT_EMBARQUE13: TFloatField
      FieldName = 'QT_EMBARQUE13'
      DisplayFormat = '####'
    end
    object QREstoqueEmbarqueQT_EMBARQUE14: TFloatField
      FieldName = 'QT_EMBARQUE14'
      DisplayFormat = '####'
    end
    object QREstoqueEmbarqueQT_EMBARQUE15: TFloatField
      FieldName = 'QT_EMBARQUE15'
      DisplayFormat = '####'
    end
    object QREstoqueEmbarqueQT_EMBARQUE16: TFloatField
      FieldName = 'QT_EMBARQUE16'
      DisplayFormat = '####'
    end
    object QREstoqueEmbarqueQT_EMBARQUE17: TFloatField
      FieldName = 'QT_EMBARQUE17'
      DisplayFormat = '####'
    end
    object QREstoqueEmbarqueQT_EMBARQUE19: TFloatField
      FieldName = 'QT_EMBARQUE19'
      DisplayFormat = '####'
    end
    object QREstoqueEmbarqueQT_EMBARQUE18: TFloatField
      FieldName = 'QT_EMBARQUE18'
      DisplayFormat = '####'
    end
    object QREstoqueEmbarqueQT_EMBARQUE20: TFloatField
      FieldName = 'QT_EMBARQUE20'
      DisplayFormat = '####'
    end
    object QREstoqueEmbarqueqt_quantidade: TFloatField
      FieldKind = fkCalculated
      FieldName = 'qt_quantidade'
      Calculated = True
    end
    object QREstoqueEmbarqueqt_saldo: TFloatField
      FieldKind = fkCalculated
      FieldName = 'qt_saldo'
      Calculated = True
    end
  end
  object QCalculaValorCarga: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      
        '  SUM(DECODE(Tb_pedido_item.QT_PEDIDO,0,Tb_pedido_item.VAL_UNITA' +
        'RIO,(Tb_pedido_item.QT_PEDIDO'
      
        '      -Tb_pedido_item.QT_CANCELADO) * Tb_pedido_item.VAL_UNITARI' +
        'O)) AS VAL_CARGA'
      
        '/*      -(((Tb_pedido_item.QT_PEDIDO-Tb_pedido_item.QT_CANCELADO' +
        ') * Tb_pedido_item.VAL_UNITARIO)*Tb_pedido_item.perc_desconto/10' +
        '0))'
      
        '      -((Tb_pedido_item.QT_PEDIDO-Tb_pedido_item.QT_CANCELADO) *' +
        ' Tb_pedido_item.Val_Desconto)) AS VAL_CARGA  */'
      'FROM'
      '  TB_EMBARQUE,'
      '  TB_EMBARQUE_ITEM,'
      '  TB_PEDIDO_CAB,'
      '  TB_PEDIDO_ITEM,'
      '  TB_OPERACAO'
      'WHERE'
      '  Tb_embarque_item.COD_EMBARQUE = Tb_embarque.COD_EMBARQUE'
      '  AND'
      '  Tb_embarque_item.COD_PEDIDO_CAB = Tb_pedido_cab.COD_PEDIDO_CAB'
      '  AND'
      '  Tb_pedido_cab.COD_PEDIDO_CAB = Tb_pedido_item.COD_PEDIDO_CAB'
      '  AND'
      '  Tb_pedido_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO'
      '  AND'
      '  Tb_operacao.IND_VENDAS = '#39'V'#39
      '  AND'
      '  TB_EMBARQUE.COD_EMBARQUE = :COD_EMBARQUE'
      ' '
      ' ')
    Variables.Data = {
      03000000010000000D0000003A434F445F454D42415251554503000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {04000000010000000900000056414C5F4341524741010000000000}
    Master = QEmbarque
    MasterFields = 'COD_EMBARQUE'
    DetailFields = 'COD_EMBARQUE'
    Session = DMOracle.DBCemapa
    Left = 152
    Top = 232
    object QCalculaValorCargaVAL_CARGA: TFloatField
      FieldName = 'VAL_CARGA'
      DisplayFormat = '#,##0.00'
    end
  end
  object DSCalculaValorCarga: TDataSource
    AutoEdit = False
    DataSet = QCalculaValorCarga
    Left = 160
    Top = 368
  end
  object QRFretes: TOracleDataSet1
    SQL.Strings = (
      ' SELECT'
      '  COD_EMBARQUE,'
      '  DESC_DESTINO_FRETE,'
      '  DT_EMBARQUE,'
      '  NOME_MOTORISTA,'
      '  VAL_TOTAL_FRETE,'
      '  DECODE('
      '     IND_ACERTO_FRETE,'#39'N'#39','
      '     VAL_CONTRATO_FRETE,'
      
        '    (nvl(VAL_TOTAL_FRETE,0)+nvl(VAL_AJUDA_CUSTO,0)+nvl(VAL_PEDAG' +
        'IO,0)+NVL(VAL_FRETE_COMPLEMENTO,0))'
      '         ) as VAL_ACERTO,'
      '  VAL_CONTRATO_FRETE,'
      '  IND_ACERTO_FRETE,'
      '  DT_PREV_RETORNO,'
      '  NUM_PREV_KM_RETORNO'
      'FROM'
      '  TB_EMBARQUE'
      'WHERE'
      '   TB_EMBARQUE.DT_EMBARQUE >=  :DATA_I'
      '   AND'
      '   TB_EMBARQUE.DT_EMBARQUE <= :DATA_F'
      '   AND'
      '   (NVL(VAL_CONTRATO_FRETE, 0) <> 0'
      '    OR'
      '    NVL(VAL_FRETE, 0) <> 0'
      '    OR'
      '    NVL(VAL_ADTO_FRETE, 0) <> 0)'
      '   AND'
      '   (:TIPO_VEICULO IS NULL'
      '     OR'
      '     IND_TIPO_VEICULO = :TIPO_VEICULO)'
      '   AND'
      '   (:TRANSPORTADOR IS NULL'
      '     OR'
      '      COD_TRANSPORTADOR = :TRANSPORTADOR)'
      '   AND'
      '   (:IND_ACERTO_FRETE IS NULL'
      '     OR'
      '      IND_ACERTO_FRETE = :IND_ACERTO_FRETE)'
      ''
      ''
      '/*SELECT DISTINCT'
      '  TB_EMBARQUE.COD_EMBARQUE,'
      '  TB_EMBARQUE.DESC_DESTINO_FRETE,'
      '  TB_EMBARQUE.DT_EMBARQUE,'
      '  TB_EMBARQUE.NOME_MOTORISTA,'
      '  TB_EMBARQUE.VAL_TOTAL_FRETE,'
      '  DECODE('
      '     TB_EMBARQUE.IND_ACERTO_FRETE,'#39'N'#39','
      '     TB_EMBARQUE.VAL_CONTRATO_FRETE,'
      
        '    (nvl(TB_EMBARQUE.VAL_TOTAL_FRETE,0)+TB_EMBARQUE.VAL_AJUDA_CU' +
        'STO+TB_EMBARQUE.VAL_PEDAGIO)'
      '         ) as VAL_ACERTO,'
      '  TB_EMBARQUE.VAL_CONTRATO_FRETE,'
      '  TB_EMBARQUE.IND_ACERTO_FRETE,'
      '  TB_EMBARQUE.DT_PREV_RETORNO,'
      '  TB_EMBARQUE.NUM_PREV_KM_RETORNO'
      'FROM'
      '  TB_BAIXA_PEDIDO,'
      '  TB_PEDIDO_CAB,'
      '  TB_PEDIDO_ITEM,'
      '  TB_EMBARQUE,'
      '  TB_EMBARQUE_ITEM,'
      '  TB_NOTA_CAB,'
      '  TB_NOTA_ITEM'
      'WHERE'
      '  (Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB)'
      '  AND'
      '  (Tb_baixa_pedido.COD_NOTA_ITEM = Tb_nota_item.COD_NOTA_ITEM)'
      '  AND'
      
        '  (Tb_pedido_item.COD_PEDIDO_ITEM = Tb_baixa_pedido.COD_PEDIDO_I' +
        'TEM)'
      '  AND'
      '  (Tb_pedido_item.COD_PEDIDO_CAB = Tb_pedido_cab.COD_PEDIDO_CAB)'
      '  AND'
      '  (Tb_embarque.COD_EMBARQUE = Tb_embarque_item.COD_EMBARQUE)'
      '  AND'
      
        '  (Tb_embarque_item.COD_PEDIDO_CAB = Tb_pedido_cab.COD_PEDIDO_CA' +
        'B)'
      '  AND'
      '  (TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39')'
      '  AND'
      '  (Tb_nota_cab.DT_EMISSAO >= :DATA_I)'
      '  AND'
      '  (Tb_nota_cab.DT_EMISSAO <= :DATA_F)'
      '  AND'
      '  (NVL(TB_EMBARQUE.VAL_CONTRATO_FRETE, 0) <> 0'
      '   OR'
      '   NVL(TB_EMBARQUE.VAL_FRETE, 0) <> 0'
      '   OR'
      '   NVL(TB_EMBARQUE.VAL_ADTO_FRETE, 0) <> 0)'
      '  AND'
      '  (:TIPO_VEICULO IS NULL'
      '   OR'
      '    TB_EMBARQUE.IND_TIPO_VEICULO = :TIPO_VEICULO)'
      '  AND'
      '  (:TRANSPORTADOR IS NULL'
      '   OR'
      '    TB_EMBARQUE.COD_TRANSPORTADOR = :TRANSPORTADOR)'
      '  AND'
      '  (:IND_ACERTO_FRETE IS NULL'
      '   OR'
      '    TB_EMBARQUE.IND_ACERTO_FRETE = :IND_ACERTO_FRETE)'
      ' '
      ' */'
      ' '
      ' '
      ' '
      ' ')
    Variables.Data = {
      0300000005000000070000003A444154415F490C000000000000000000000007
      0000003A444154415F460C00000000000000000000000D0000003A5449504F5F
      56454943554C4F0500000000000000000000000E0000003A5452414E53504F52
      5441444F52030000000000000000000000110000003A494E445F41434552544F
      5F4652455445050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000A0000000C000000434F445F454D4241525155450100000000001200
      0000444553435F44455354494E4F5F46524554450100000000000B0000004454
      5F454D4241525155450100000000000F00000056414C5F544F54414C5F465245
      54450100000000001200000056414C5F434F4E545241544F5F46524554450100
      000000000E0000004E4F4D455F4D4F544F52495354410100000000000A000000
      56414C5F41434552544F01000000000010000000494E445F41434552544F5F46
      524554450100000000000F00000044545F505245565F5245544F524E4F010000
      000000130000004E554D5F505245565F4B4D5F5245544F524E4F010000000000}
    Session = DMOracle.DBCemapa
    OnCalcFields = QRFretesCalcFields
    Left = 624
    Top = 8
    object QRFretesCOD_EMBARQUE: TIntegerField
      FieldName = 'COD_EMBARQUE'
      Required = True
    end
    object QRFretesDESC_DESTINO_FRETE: TStringField
      FieldName = 'DESC_DESTINO_FRETE'
    end
    object QRFretesDT_EMBARQUE: TDateTimeField
      FieldName = 'DT_EMBARQUE'
      Required = True
    end
    object QRFretesVAL_TOTAL_FRETE: TFloatField
      FieldName = 'VAL_TOTAL_FRETE'
      DisplayFormat = '#,##0.00'
    end
    object QRFretesVAL_CONTRATO_FRETE: TFloatField
      FieldName = 'VAL_CONTRATO_FRETE'
      DisplayFormat = '#,##0.00'
    end
    object QRFretesqt_entregas: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'qt_entregas'
      Calculated = True
    end
    object QRFretesval_carga: TFloatField
      FieldKind = fkCalculated
      FieldName = 'val_carga'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
    object QRFretesNOME_MOTORISTA: TStringField
      FieldName = 'NOME_MOTORISTA'
      Size = 50
    end
    object QRFretesVAL_ACERTO: TFloatField
      FieldName = 'VAL_ACERTO'
      DisplayFormat = '#,##0.00'
    end
    object QRFretesIND_ACERTO_FRETE: TStringField
      FieldName = 'IND_ACERTO_FRETE'
      Size = 1
    end
    object QRFretesDT_PREV_RETORNO: TDateTimeField
      FieldName = 'DT_PREV_RETORNO'
    end
    object QRFretesNUM_PREV_KM_RETORNO: TIntegerField
      FieldName = 'NUM_PREV_KM_RETORNO'
    end
  end
  object QREtiqCodBarraProducao: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_EMBARQUE_ITEM.COD_EMBARQUE,'
      '  TB_PEDIDO_ITEM.COD_PRODUTO,'
      '  TB_PRODUTO.DESC_PRODUTO,'
      '  TB_PEDIDO_ITEM.QT_PEDIDO,'
      '  TB_PRODUTO.NUM_VOLUMES'
      'FROM'
      '  TB_EMBARQUE_ITEM,'
      '  TB_PEDIDO_CAB,'
      '  TB_PEDIDO_ITEM,'
      '  TB_PRODUTO,'
      '  TB_CLASSE'
      'WHERE'
      '  TB_PEDIDO_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '  AND'
      '  TB_EMBARQUE_ITEM.COD_PEDIDO_CAB = TB_PEDIDO_CAB.COD_PEDIDO_CAB'
      '  AND'
      '  TB_PEDIDO_CAB.COD_PEDIDO_CAB = TB_PEDIDO_ITEM.COD_PEDIDO_CAB'
      '  AND'
      '  TB_PRODUTO.COD_CLASSE = TB_CLASSE.COD_CLASSE'
      '  AND'
      '  (:CLASSE IS NULL'
      '   OR'
      '    TB_CLASSE.NUM_CLASSE = :CLASSE)'
      '  AND'
      '  (TB_EMBARQUE_ITEM.COD_EMBARQUE = :EMBARQUE)'
      'ORDER BY'
      '  TB_PRODUTO.DESC_PRODUTO'
      ''
      ''
      ''
      '/*SELECT'
      '  COD_EMBARQUE,'
      '  COD_PRODUTO,'
      '  DESC_PRODUTO,'
      '  SUM(QT_PEDIDO) AS QT_PEDIDO,'
      '  SUM(QT_QUANTIDADE) AS QT_QUANTIDADE,'
      '  SUM(QT_PEDIDO - QT_QUANTIDADE) AS TOTAL'
      'FROM('
      '    SELECT'
      '      TB_EMBARQUE_ITEM.COD_EMBARQUE,'
      '      TB_PEDIDO_ITEM.COD_PRODUTO,'
      '      TB_PRODUTO.DESC_PRODUTO,'
      '      TB_PEDIDO_ITEM.QT_PEDIDO,'
      '      0 AS QT_QUANTIDADE,'
      '      0 AS TOTAL'
      '    FROM'
      '      TB_EMBARQUE_ITEM,'
      '      TB_PEDIDO_CAB,'
      '      TB_PEDIDO_ITEM,'
      '      TB_PRODUTO'
      '    WHERE'
      '      TB_PEDIDO_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '      AND'
      
        '      TB_EMBARQUE_ITEM.COD_PEDIDO_CAB = TB_PEDIDO_CAB.COD_PEDIDO' +
        '_CAB'
      '      AND'
      
        '      TB_PEDIDO_CAB.COD_PEDIDO_CAB = TB_PEDIDO_ITEM.COD_PEDIDO_C' +
        'AB'
      '      AND'
      '      (TB_EMBARQUE_ITEM.COD_EMBARQUE = :EMBARQUE)'
      ''
      '    UNION'
      ''
      '    SELECT'
      '      TB_EMBARQUE_ITEM.COD_EMBARQUE,'
      '      TB_PEDIDO_ITEM.COD_PRODUTO,'
      '      TB_PRODUTO.DESC_PRODUTO,'
      '      0 AS QT_PEDIDO,'
      '      TB_ESTOQUE.QT_QUANTIDADE,'
      '      0 AS TOTAL'
      '    FROM'
      '      TB_EMBARQUE_ITEM,'
      '      TB_PEDIDO_CAB,'
      '      TB_PEDIDO_ITEM,'
      '      TB_PRODUTO,'
      '      TB_ESTOQUE'
      '    WHERE  '
      '      TB_PEDIDO_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '      AND'
      
        '      TB_EMBARQUE_ITEM.COD_PEDIDO_CAB = TB_PEDIDO_CAB.COD_PEDIDO' +
        '_CAB'
      '      AND'
      
        '      TB_PEDIDO_CAB.COD_PEDIDO_CAB = TB_PEDIDO_ITEM.COD_PEDIDO_C' +
        'AB '
      '      AND'
      '      TB_PRODUTO.COD_PRODUTO = TB_ESTOQUE.COD_PRODUTO'
      '      AND'
      '      (TB_EMBARQUE_ITEM.COD_EMBARQUE = :EMBARQUE)'
      '    )'
      'GROUP BY'
      '  COD_EMBARQUE,'
      '  COD_PRODUTO,'
      '  DESC_PRODUTO'
      'ORDER BY'
      '  DESC_PRODUTO     */'
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    Variables.Data = {
      0300000002000000090000003A454D4241525155450300000000000000000000
      00070000003A434C41535345030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000050000000C000000434F445F454D4241525155450100000000000B00
      0000434F445F50524F4455544F0100000000000C000000444553435F50524F44
      55544F0100000000000900000051545F50454449444F0100000000000B000000
      4E554D5F564F4C554D4553010000000000}
    Session = DMOracle.DBCemapa
    Left = 624
    Top = 72
    object QREtiqCodBarraProducaoCOD_EMBARQUE: TIntegerField
      FieldName = 'COD_EMBARQUE'
      Required = True
    end
    object QREtiqCodBarraProducaoCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
    end
    object QREtiqCodBarraProducaoDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
    object QREtiqCodBarraProducaoQT_PEDIDO: TFloatField
      FieldName = 'QT_PEDIDO'
      Required = True
    end
    object QREtiqCodBarraProducaoNUM_VOLUMES: TFloatField
      FieldName = 'NUM_VOLUMES'
    end
  end
  object QEtiqueta: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_ETIQUETA_CB.Etiqueta1,'
      '  TB_ETIQUETA_CB.Etiqueta2,'
      '  TB_ETIQUETA_CB.Etiqueta3,'
      '  TB_ETIQUETA_CB.Etiqueta4,'
      '  TB_ETIQUETA_CB.Etiqueta5'
      'FROM'
      '  TB_ETIQUETA_CB')
    QBEDefinition.QBEFieldDefs = {
      0400000005000000090000004554495155455441310100000000000900000045
      5449515545544132010000000000090000004554495155455441330100000000
      0009000000455449515545544134010000000000090000004554495155455441
      35010000000000}
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 624
    Top = 192
    object QEtiquetaETIQUETA1: TStringField
      FieldName = 'ETIQUETA1'
      Size = 15
    end
    object QEtiquetaETIQUETA2: TStringField
      FieldName = 'ETIQUETA2'
      Size = 15
    end
    object QEtiquetaETIQUETA3: TStringField
      FieldName = 'ETIQUETA3'
      Size = 15
    end
    object QEtiquetaETIQUETA4: TStringField
      FieldName = 'ETIQUETA4'
      Size = 15
    end
    object QEtiquetaETIQUETA5: TStringField
      FieldName = 'ETIQUETA5'
      Size = 15
    end
    object QEtiquetadesc_produto1: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_produto1'
      Size = 50
      Calculated = True
    end
    object QEtiquetadesc_produto2: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_produto2'
      Size = 50
      Calculated = True
    end
    object QEtiquetadesc_produto3: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_produto3'
      Size = 50
      Calculated = True
    end
    object QEtiquetadesc_produto4: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_produto4'
      Size = 50
      Calculated = True
    end
    object QEtiquetadesc_produto5: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_produto5'
      Size = 50
      Calculated = True
    end
  end
  object QBaixaEstoqueLeitor: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_PEDIDO_ITEM.COD_PEDIDO_ITEM,'
      '  TB_PEDIDO_ITEM.QT_PEDIDO,'
      '  TB_PEDIDO_ITEM.QT_QUANTIDADE_AUX,'
      '  NVL(TB_PEDIDO_ITEM.QT_EMBALAGEM,0)AS QT_EMBALAGEM'
      'FROM'
      '  TB_PEDIDO_CAB,'
      '  TB_PEDIDO_ITEM,'
      '  TB_EMBARQUE_ITEM,'
      '  TB_PRODUTO'
      'WHERE'
      '  TB_PEDIDO_CAB.COD_PEDIDO_CAB = TB_PEDIDO_ITEM.COD_PEDIDO_CAB'
      '  AND'
      '  TB_PEDIDO_CAB.COD_PEDIDO_CAB = TB_EMBARQUE_ITEM.COD_PEDIDO_CAB'
      '  AND'
      '  TB_PEDIDO_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '  AND'
      '  (TB_EMBARQUE_ITEM.COD_EMBARQUE =:EMBARQUE)'
      '  AND'
      '  (:PRODUTO IS NULL OR'
      '  TB_PEDIDO_ITEM.COD_PRODUTO =:PRODUTO)'
      '  AND'
      '  (TB_PEDIDO_CAB.COD_PEDIDO_CAB =:COD_PEDIDO)'
      ''
      ''
      ''
      ' '
      ''
      ''
      '')
    Variables.Data = {
      0300000003000000090000003A454D4241525155450300000000000000000000
      00080000003A50524F4455544F0300000000000000000000000B0000003A434F
      445F50454449444F030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000040000000F000000434F445F50454449444F5F4954454D0100000000
      000900000051545F50454449444F0100000000001100000051545F5155414E54
      49444144455F4155580100000000000C00000051545F454D42414C4147454D01
      0000000000}
    Session = DMOracle.DBCemapa
    Left = 632
    Top = 248
    object QBaixaEstoqueLeitorCOD_PEDIDO_ITEM: TIntegerField
      FieldName = 'COD_PEDIDO_ITEM'
      Required = True
    end
    object QBaixaEstoqueLeitorQT_PEDIDO: TFloatField
      FieldName = 'QT_PEDIDO'
      Required = True
    end
    object QBaixaEstoqueLeitorQT_QUANTIDADE_AUX: TFloatField
      FieldName = 'QT_QUANTIDADE_AUX'
    end
    object QBaixaEstoqueLeitorQT_EMBALAGEM: TFloatField
      FieldName = 'QT_EMBALAGEM'
    end
  end
  object QRBaixaEstoqueLeitor: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_PEDIDO_ITEM.COD_PRODUTO,'
      '  TB_PEDIDO_ITEM.COD_PEDIDO_CAB,'
      '  TB_PRODUTO.DESC_PRODUTO,'
      '  TB_PRODUTO.NUM_VOLUMES,'
      '  SUM(TB_PEDIDO_ITEM.QT_PEDIDO) AS QT_PEDIDO,'
      
        '  SUM(NVL(TB_PEDIDO_ITEM.QT_QUANTIDADE_AUX,0)) AS QT_QUANTIDADE_' +
        'AUX,'
      '  SUM(NVL(TB_PEDIDO_ITEM.QT_EMBALAGEM,0)) AS QT_EMBALAGEM'
      'FROM'
      '  TB_PEDIDO_CAB,'
      '  TB_PEDIDO_ITEM,'
      '  TB_EMBARQUE_ITEM,'
      '  TB_PRODUTO'
      'WHERE'
      '  TB_PEDIDO_CAB.COD_PEDIDO_CAB = TB_PEDIDO_ITEM.COD_PEDIDO_CAB'
      '  AND'
      '  TB_PEDIDO_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '  AND'
      '  TB_EMBARQUE_ITEM.COD_PEDIDO_CAB = TB_PEDIDO_CAB.COD_PEDIDO_CAB'
      '  AND'
      '  (:EMBARQUE IS NULL'
      '  OR'
      '    TB_EMBARQUE_ITEM.COD_EMBARQUE =:EMBARQUE)'
      '  AND'
      '  (:COD_PEDIDO IS NULL'
      '  OR'
      '    TB_PEDIDO_CAB.COD_PEDIDO_CAB = :COD_PEDIDO)'
      'GROUP BY'
      '  TB_PEDIDO_ITEM.COD_PRODUTO,'
      '  TB_PEDIDO_ITEM.COD_PEDIDO_CAB,'
      '  TB_PRODUTO.DESC_PRODUTO,'
      '  TB_PRODUTO.NUM_VOLUMES'
      'ORDER BY  TB_PEDIDO_ITEM.COD_PRODUTO')
    Variables.Data = {
      0300000002000000090000003A454D4241525155450300000000000000000000
      000B0000003A434F445F50454449444F030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000070000000B000000434F445F50524F4455544F0100000000000C0000
      00444553435F50524F4455544F0100000000000900000051545F50454449444F
      0100000000001100000051545F5155414E5449444144455F4155580100000000
      000C00000051545F454D42414C4147454D0100000000000B0000004E554D5F56
      4F4C554D45530100000000000E000000434F445F50454449444F5F4341420100
      00000000}
    Session = DMOracle.DBCemapa
    OnCalcFields = QRBaixaEstoqueLeitorCalcFields
    Left = 600
    Top = 312
    object QRBaixaEstoqueLeitorCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
    end
    object QRBaixaEstoqueLeitorCOD_PEDIDO_CAB: TIntegerField
      FieldName = 'COD_PEDIDO_CAB'
    end
    object QRBaixaEstoqueLeitorDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
    object QRBaixaEstoqueLeitorQT_PEDIDO: TFloatField
      FieldName = 'QT_PEDIDO'
      DisplayFormat = '#,##0'
    end
    object QRBaixaEstoqueLeitorQT_QUANTIDADE_AUX: TFloatField
      FieldName = 'QT_QUANTIDADE_AUX'
      DisplayFormat = '#,##0'
    end
    object QRBaixaEstoqueLeitorQT_EMBALAGEM: TFloatField
      FieldName = 'QT_EMBALAGEM'
    end
    object QRBaixaEstoqueLeitorNUM_VOLUMES: TFloatField
      FieldName = 'NUM_VOLUMES'
    end
    object QRBaixaEstoqueLeitorpeso_medio: TFloatField
      FieldKind = fkCalculated
      FieldName = 'peso_medio'
      Calculated = True
    end
    object QRBaixaEstoqueLeitorind_situacao: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ind_situacao'
      Calculated = True
    end
    object QRBaixaEstoqueLeitortotal_vol: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'total_vol'
      DisplayFormat = '#,##0'
      Calculated = True
    end
  end
  object QREtiqCodBarraEmbarque: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_ESTOQUE_PRODUCAO.COD_ESTOQUE_PRODUCAO,'
      '  TB_ESTOQUE_PRODUCAO.COD_PRODUTO,'
      '  TB_ESTOQUE_PRODUCAO.NUM_CONTROLE,'
      '  TB_ESTOQUE_PRODUCAO.NUM_LINHA,'
      '  TB_PRODUTO.NUM_VOLUMES'
      'FROM'
      '  TB_ESTOQUE_PRODUCAO,'
      '  TB_PRODUTO'
      'WHERE'
      '  TB_ESTOQUE_PRODUCAO.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '  AND'
      '  TB_ESTOQUE_PRODUCAO.NUM_LINHA = '#39'1'#39
      '  AND'
      '  TB_ESTOQUE_PRODUCAO.IND_TURNO = '#39'N'#39
      '  AND'
      '  TB_ESTOQUE_PRODUCAO.COD_PRODUTO = :PRODUTO'
      ''
      ' '
      ' '
      ' ')
    Variables.Data = {
      0300000001000000080000003A50524F4455544F030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000050000000B000000434F445F50524F4455544F0100000000000C0000
      004E554D5F434F4E54524F4C45010000000000090000004E554D5F4C494E4841
      01000000000014000000434F445F4553544F5155455F50524F445543414F0100
      000000000B0000004E554D5F564F4C554D4553010000000000}
    Session = DMOracle.DBCemapa
    Left = 632
    Top = 136
    object QREtiqCodBarraEmbarqueCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QREtiqCodBarraEmbarqueNUM_CONTROLE: TIntegerField
      FieldName = 'NUM_CONTROLE'
    end
    object QREtiqCodBarraEmbarqueNUM_LINHA: TIntegerField
      FieldName = 'NUM_LINHA'
    end
    object QREtiqCodBarraEmbarqueCOD_ESTOQUE_PRODUCAO: TIntegerField
      FieldName = 'COD_ESTOQUE_PRODUCAO'
      Required = True
    end
    object QREtiqCodBarraEmbarqueNUM_VOLUMES: TFloatField
      FieldName = 'NUM_VOLUMES'
    end
  end
  object QREstoqueEmbarqueSub: TOracleDataSet1
    SQL.Strings = (
      
        '/*essa sql gera um numero sequencial iniciando em 1 para cada em' +
        'barque, essa sql '#233' a mesma que a subsql que est'#225' na outra query*' +
        '/'
      ''
      '    SELECT'
      '      COD_EMBARQUE,'
      '      TOT_PESO_LIQ,'
      '      TOT_PESO_BRUTO,'
      
        '      ROWNUM AS ROWNUM_EMBARQUE /*gera um numero sequencial inic' +
        'iando em 1 para cada embarque*/'
      '    FROM ('
      '      SELECT'
      '        TB_EMBARQUE.COD_EMBARQUE,'
      
        '        SUM((TB_PEDIDO_ITEM.QT_PEDIDO /*- TB_PEDIDO_ITEM.QT_ATEN' +
        'DIDO*/ - TB_PEDIDO_ITEM.QT_CANCELADO) * TB_PRODUTO.NUM_EMBALAGEM' +
        ') AS TOT_PESO_LIQ,'
      
        '        SUM((TB_PEDIDO_ITEM.QT_PEDIDO /*- TB_PEDIDO_ITEM.QT_ATEN' +
        'DIDO*/ - TB_PEDIDO_ITEM.QT_CANCELADO) * TB_PRODUTO.NUM_VOLUMES) ' +
        'AS TOT_PESO_BRUTO'
      '      FROM'
      '        TB_EMBARQUE,'
      '        TB_EMBARQUE_ITEM,'
      '        TB_PEDIDO_CAB,'
      '        TB_PEDIDO_ITEM,'
      '        TB_PRODUTO,'
      '        TB_ESTOQUE'
      '      WHERE'
      
        '        TB_PEDIDO_CAB.COD_PEDIDO_CAB = TB_PEDIDO_ITEM.COD_PEDIDO' +
        '_CAB'
      '        AND'
      
        '        TB_PEDIDO_ITEM.COD_PEDIDO_CAB = TB_EMBARQUE_ITEM.COD_PED' +
        'IDO_CAB'
      '        AND'
      '        TB_EMBARQUE_ITEM.COD_EMBARQUE = TB_EMBARQUE.COD_EMBARQUE'
      '        AND'
      '        TB_PEDIDO_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '--        AND'
      '--        TB_PRODUTO.IND_TIPO_PRODUTO = '#39'COMERCIAL'#39
      '        AND'
      '        TB_PRODUTO.COD_PRODUTO = TB_ESTOQUE.COD_PRODUTO'
      '        AND'
      '        TB_PEDIDO_ITEM.COD_LOTE_TIPO = TB_ESTOQUE.COD_LOTE_TIPO'
      '--        AND'
      '--        TB_PEDIDO_CAB.IND_EMBARQUE = '#39'S'#39
      '        AND'
      
        '        (TB_PEDIDO_ITEM.QT_PEDIDO /*- TB_PEDIDO_ITEM.QT_ATENDIDO' +
        '*/ - TB_PEDIDO_ITEM.QT_CANCELADO) > 0'
      '        AND'
      '        TB_EMBARQUE.DT_EMBARQUE >= :DT_REFERENCIA'
      '        AND'
      '        TB_EMBARQUE.DT_EMBARQUE <= :DT_REFERENCIA_FINAL'
      '        AND'
      '        TB_EMBARQUE.IND_ATUALIZA_ESTOQUE = '#39'NAO'#39
      '        AND'
      
        '        TB_EMBARQUE.IND_SITUACAO <> '#39'ESTOQUE'#39' /* OPCAO PARA NAO ' +
        'LISTAR CARGAS QUE NAO VAO BAIXAR O ESTOQUE NO MOMENTO RODRIGO SO' +
        'LICITOU*/'
      '        AND'
      '        (:FILIAL IS NULL'
      '         OR'
      '          TB_ESTOQUE.COD_FILIAL = :FILIAL)'
      '        AND'
      '        (:FILIAL IS NULL'
      '         OR'
      '          TB_PEDIDO_CAB.COD_FILIAL = :FILIAL)'
      '        AND'
      '         TB_EMBARQUE.COD_EMBARQUE NOT IN (:LISTA_EMBARQUE)'
      '      GROUP BY'
      '        TB_EMBARQUE.COD_EMBARQUE'
      '    )'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Variables.Data = {
      03000000040000000E0000003A44545F5245464552454E4349410C0000000000
      000000000000140000003A44545F5245464552454E4349415F46494E414C0C00
      00000000000000000000070000003A46494C49414C0300000000000000000000
      000F0000003A4C495354415F454D424152515545010000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000040000000C000000434F445F454D4241525155450100000000000F00
      0000524F574E554D5F454D4241525155450100000000000C000000544F545F50
      45534F5F4C49510100000000000E000000544F545F5045534F5F425255544F01
      0000000000}
    Session = DMOracle.DBCemapa
    Left = 384
    Top = 464
    object QREstoqueEmbarqueSubCOD_EMBARQUE: TIntegerField
      FieldName = 'COD_EMBARQUE'
      Required = True
    end
    object QREstoqueEmbarqueSubROWNUM_EMBARQUE: TFloatField
      FieldName = 'ROWNUM_EMBARQUE'
    end
    object QREstoqueEmbarqueSubTOT_PESO_LIQ: TFloatField
      FieldName = 'TOT_PESO_LIQ'
      DisplayFormat = '#,##0.00'
    end
    object QREstoqueEmbarqueSubTOT_PESO_BRUTO: TFloatField
      FieldName = 'TOT_PESO_BRUTO'
      DisplayFormat = '#,##0.00'
    end
  end
  object QRParamSistema: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  NUM_SEQUENCIAL,'
      '  COD_EMPRESA'
      'FROM'
      
        '  (SELECT '#39'1a'#39' AS NUM_SEQUENCIAL,COD_EMPRESA FROM TB_PARAM_SISTE' +
        'MA'
      '   UNION'
      
        '   SELECT '#39'2o'#39' AS NUM_SEQUENCIAL,COD_EMPRESA FROM TB_PARAM_SISTE' +
        'MA)'
      ''
      
        '/* ESTA QUERY SOMENTE PORQUE PRECISA QUE RETORNA-SE 2 LINHAS PAR' +
        'A A IMPRESSAO DO RECIBO DE FRETE NO EMBARQUE */'
      ' '
      ' ')
    QBEDefinition.QBEFieldDefs = {
      04000000020000000B000000434F445F454D50524553410100000000000E0000
      004E554D5F53455155454E4349414C010000000000}
    Session = DMOracle.DBCemapa
    Left = 632
    Top = 376
    object QRParamSistemaCOD_EMPRESA: TStringField
      FieldName = 'COD_EMPRESA'
      Size = 10
    end
    object QRParamSistemaNUM_SEQUENCIAL: TStringField
      FieldName = 'NUM_SEQUENCIAL'
      Size = 2
    end
  end
  object QBaixaComponente: TOracleDataSet1
    SQL.Strings = (
      'SELECT '
      '  TB_FORMULA_ITEM.COD_PRODUTO,'
      '  TB_FORMULA_ITEM.QT_ITEM,'
      '  TB_FORMULA_ITEM.COD_LOTE_TIPO'
      'FROM'
      '  TB_FORMULA,'
      '  TB_FORMULA_ITEM'
      'WHERE'
      '  TB_FORMULA.COD_FORMULA = TB_FORMULA_ITEM.COD_FORMULA'
      '  AND'
      '  TB_FORMULA.COD_PRODUTO = :COD_PRODUTO')
    Variables.Data = {
      03000000010000000C0000003A434F445F50524F4455544F0300000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      04000000030000000B000000434F445F50524F4455544F010000000000070000
      0051545F4954454D0100000000000D000000434F445F4C4F54455F5449504F01
      0000000000}
    Session = DMOracle.DBCemapa
    Left = 640
    Top = 424
    object QBaixaComponenteCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QBaixaComponenteQT_ITEM: TFloatField
      FieldName = 'QT_ITEM'
      Required = True
    end
    object QBaixaComponenteCOD_LOTE_TIPO: TIntegerField
      FieldName = 'COD_LOTE_TIPO'
      Required = True
    end
  end
  object QRControleCargas: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '    Tb_Embarque.Cod_Embarque,'
      '    TB_EMBARQUE.NUM_EMBARQUE,'
      '    Tb_Embarque.Dt_Embarque,'
      '    Tb_Embarque.NOME_MOTORISTA,'
      '    Tb_Embarque.COD_TRANSPORTADOR,'
      '    Tb_Embarque.DESC_PLACA,'
      '    Tb_Embarque.DESC_DESTINO_FRETE,'
      
        '    SUM(DECODE(Tb_pedido_item.QT_PEDIDO,0,Tb_pedido_item.VAL_UNI' +
        'TARIO,(Tb_pedido_item.QT_PEDIDO'
      
        '        -Tb_pedido_item.QT_CANCELADO) * Tb_pedido_item.VAL_UNITA' +
        'RIO'
      
        '        -(((Tb_pedido_item.QT_PEDIDO-Tb_pedido_item.QT_CANCELADO' +
        ') * Tb_pedido_item.VAL_UNITARIO)*Tb_pedido_item.perc_desconto/10' +
        '0))'
      
        '        -((Tb_pedido_item.QT_PEDIDO-Tb_pedido_item.QT_CANCELADO)' +
        ' * Tb_pedido_item.Val_Desconto)) AS SQT_VALOR,'
      
        '    SUM(DECODE(TB_OPERACAO.IND_BRINDE,'#39'S'#39',DECODE(Tb_pedido_item.' +
        'QT_PEDIDO,0,Tb_pedido_item.VAL_UNITARIO,(Tb_pedido_item.QT_PEDID' +
        'O'
      
        '        -Tb_pedido_item.QT_CANCELADO) * Tb_pedido_item.VAL_UNITA' +
        'RIO'
      
        '        -(((Tb_pedido_item.QT_PEDIDO-Tb_pedido_item.QT_CANCELADO' +
        ') * Tb_pedido_item.VAL_UNITARIO)*Tb_pedido_item.perc_desconto/10' +
        '0))'
      
        '        -((Tb_pedido_item.QT_PEDIDO-Tb_pedido_item.QT_CANCELADO)' +
        ' * Tb_pedido_item.Val_Desconto),0)) AS SVL_BRINDE,'
      
        '    SUM(DECODE(TB_OPERACAO.IND_BONIFICACAO,'#39'S'#39',DECODE(Tb_pedido_' +
        'item.QT_PEDIDO,0,Tb_pedido_item.VAL_UNITARIO,(Tb_pedido_item.QT_' +
        'PEDIDO'
      
        '        -Tb_pedido_item.QT_CANCELADO) * Tb_pedido_item.VAL_UNITA' +
        'RIO'
      
        '        -(((Tb_pedido_item.QT_PEDIDO-Tb_pedido_item.QT_CANCELADO' +
        ') * Tb_pedido_item.VAL_UNITARIO)*Tb_pedido_item.perc_desconto/10' +
        '0))'
      
        '        -((Tb_pedido_item.QT_PEDIDO-Tb_pedido_item.QT_CANCELADO)' +
        ' * Tb_pedido_item.Val_Desconto),0)) AS SVL_BONIFICACAO'
      '  '
      'FROM'
      '  TB_EMBARQUE,'
      '  TB_EMBARQUE_ITEM,'
      '  TB_PEDIDO_CAB,'
      '  TB_PEDIDO_ITEM,'
      '  TB_OPERACAO'
      ''
      'WHERE'
      '  Tb_embarque_item.COD_EMBARQUE = Tb_embarque.COD_EMBARQUE'
      '  AND'
      '  Tb_embarque_item.COD_PEDIDO_CAB = Tb_pedido_cab.COD_PEDIDO_CAB'
      '  AND'
      '  Tb_pedido_cab.COD_PEDIDO_CAB = Tb_pedido_item.COD_PEDIDO_CAB'
      '  AND'
      '  Tb_pedido_cab.COD_OPERACAO = Tb_Operacao.COD_OPERACAO'
      '  AND'
      '  TB_EMBARQUE.COD_EMBARQUE = :EMBARQUE'
      ''
      'GROUP BY'
      '  Tb_Embarque.Cod_Embarque,'
      '  TB_EMBARQUE.NUM_EMBARQUE,'
      '  Tb_Embarque.Dt_Embarque,'
      '  Tb_Embarque.NOME_MOTORISTA,'
      '  Tb_Embarque.DESC_PLACA,'
      '  Tb_Embarque.DESC_DESTINO_FRETE,'
      '  Tb_Embarque.COD_TRANSPORTADOR'
      ''
      'UNION ALL'
      'SELECT'
      '  Tb_Embarque.Cod_Embarque,'
      '  TB_EMBARQUE.NUM_EMBARQUE,'
      '  Tb_Embarque.Dt_Embarque,'
      '  Tb_Embarque.NOME_MOTORISTA,'
      '  Tb_Embarque.COD_TRANSPORTADOR,'
      '  Tb_Embarque.DESC_PLACA,'
      '  Tb_Embarque.DESC_DESTINO_FRETE,'
      
        '  SUM(DECODE(Tb_pedido_item.QT_PEDIDO,0,Tb_pedido_item.VAL_UNITA' +
        'RIO,(Tb_pedido_item.QT_PEDIDO'
      
        '      -Tb_pedido_item.QT_CANCELADO) * Tb_pedido_item.VAL_UNITARI' +
        'O'
      
        '      -(((Tb_pedido_item.QT_PEDIDO-Tb_pedido_item.QT_CANCELADO) ' +
        '* Tb_pedido_item.VAL_UNITARIO)*Tb_pedido_item.perc_desconto/100)' +
        ')'
      
        '      -((Tb_pedido_item.QT_PEDIDO-Tb_pedido_item.QT_CANCELADO) *' +
        ' Tb_pedido_item.Val_Desconto)) AS SQT_VALOR,'
      
        '  SUM(DECODE(TB_OPERACAO.IND_BRINDE,'#39'S'#39',DECODE(Tb_pedido_item.QT' +
        '_PEDIDO,0,Tb_pedido_item.VAL_UNITARIO,(Tb_pedido_item.QT_PEDIDO'
      
        '      -Tb_pedido_item.QT_CANCELADO) * Tb_pedido_item.VAL_UNITARI' +
        'O'
      
        '      -(((Tb_pedido_item.QT_PEDIDO-Tb_pedido_item.QT_CANCELADO) ' +
        '* Tb_pedido_item.VAL_UNITARIO)*Tb_pedido_item.perc_desconto/100)' +
        ')'
      
        '      -((Tb_pedido_item.QT_PEDIDO-Tb_pedido_item.QT_CANCELADO) *' +
        ' Tb_pedido_item.Val_Desconto),0)) AS SVL_BRINDE,'
      
        '  SUM(DECODE(TB_OPERACAO.IND_BONIFICACAO,'#39'S'#39',DECODE(Tb_pedido_it' +
        'em.QT_PEDIDO,0,Tb_pedido_item.VAL_UNITARIO,(Tb_pedido_item.QT_PE' +
        'DIDO'
      
        '      -Tb_pedido_item.QT_CANCELADO) * Tb_pedido_item.VAL_UNITARI' +
        'O'
      
        '      -(((Tb_pedido_item.QT_PEDIDO-Tb_pedido_item.QT_CANCELADO) ' +
        '* Tb_pedido_item.VAL_UNITARIO)*Tb_pedido_item.perc_desconto/100)' +
        ')'
      
        '      -((Tb_pedido_item.QT_PEDIDO-Tb_pedido_item.QT_CANCELADO) *' +
        ' Tb_pedido_item.Val_Desconto),0)) AS SVL_BONIFICACAO'
      '  '
      'FROM'
      '  TB_EMBARQUE,'
      '  TB_EMBARQUE_ITEM,'
      '  TB_PEDIDO_CAB,'
      '  TB_PEDIDO_ITEM,'
      '  TB_OPERACAO'
      ''
      'WHERE'
      '  Tb_embarque_item.COD_EMBARQUE = Tb_embarque.COD_EMBARQUE'
      '  AND'
      '  Tb_embarque_item.COD_PEDIDO_CAB = Tb_pedido_cab.COD_PEDIDO_CAB'
      '  AND'
      '  Tb_pedido_cab.COD_PEDIDO_CAB = Tb_pedido_item.COD_PEDIDO_CAB'
      '  AND'
      '  Tb_pedido_cab.COD_OPERACAO = Tb_Operacao.COD_OPERACAO'
      '  AND'
      '  TB_EMBARQUE.COD_EMBARQUE = :EMBARQUE'
      ''
      'GROUP BY'
      '  Tb_Embarque.Cod_Embarque,'
      '  TB_EMBARQUE.NUM_EMBARQUE,'
      '  Tb_Embarque.Dt_Embarque,'
      '  Tb_Embarque.NOME_MOTORISTA,'
      '  Tb_Embarque.DESC_PLACA,'
      '  Tb_Embarque.DESC_DESTINO_FRETE,'
      '  Tb_Embarque.COD_TRANSPORTADOR'
      ' ')
    Variables.Data = {
      0300000001000000090000003A454D4241525155450300000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      040000000A0000000C000000434F445F454D4241525155450100000000000B00
      000044545F454D4241525155450100000000000E0000004E4F4D455F4D4F544F
      524953544101000000000011000000434F445F5452414E53504F525441444F52
      010000000000090000005351545F56414C4F520100000000000C0000004E554D
      5F454D4241525155450100000000000A00000053564C5F4252494E4445010000
      0000000F00000053564C5F424F4E494649434143414F0100000000000A000000
      444553435F504C41434101000000000012000000444553435F44455354494E4F
      5F4652455445010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    Left = 496
    Top = 448
    object QRControleCargasCOD_EMBARQUE: TFloatField
      FieldName = 'COD_EMBARQUE'
    end
    object QRControleCargasNUM_EMBARQUE: TFloatField
      FieldName = 'NUM_EMBARQUE'
    end
    object QRControleCargasDT_EMBARQUE: TDateTimeField
      FieldName = 'DT_EMBARQUE'
    end
    object QRControleCargasNOME_MOTORISTA: TStringField
      FieldName = 'NOME_MOTORISTA'
      Size = 50
    end
    object QRControleCargasCOD_TRANSPORTADOR: TFloatField
      FieldName = 'COD_TRANSPORTADOR'
    end
    object QRControleCargasDESC_PLACA: TStringField
      FieldName = 'DESC_PLACA'
      Size = 8
    end
    object QRControleCargasDESC_DESTINO_FRETE: TStringField
      FieldName = 'DESC_DESTINO_FRETE'
    end
    object QRControleCargasSQT_VALOR: TFloatField
      FieldName = 'SQT_VALOR'
    end
    object QRControleCargasSVL_BRINDE: TFloatField
      FieldName = 'SVL_BRINDE'
    end
    object QRControleCargasSVL_BONIFICACAO: TFloatField
      FieldName = 'SVL_BONIFICACAO'
    end
  end
  object QRPedido_Vendedor_Estado: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_CADASTRO.COD_ESTADO,'
      '  TB_CADASTRO.DESC_CIDADE,'
      
        '  SUM(DECODE(DT_CANCELAMENTO,NULL,TB_PEDIDO_ITEM.QT_PEDIDO-TB_PE' +
        'DIDO_ITEM.QT_CANCELADO'
      '      - TB_PEDIDO_ITEM.QT_ATENDIDO,0)) AS TOTAL_CAIXAS,'
      
        '  SUM(DECODE(DT_CANCELAMENTO,NULL,(TB_PEDIDO_ITEM.QT_PEDIDO-TB_P' +
        'EDIDO_ITEM.QT_CANCELADO'
      
        '      - TB_PEDIDO_ITEM.QT_ATENDIDO)*TB_PRODUTO.NUM_METROS_CUBICO' +
        'S,0)) AS TOTAL_METROS'
      'FROM'
      '  TB_PEDIDO_ITEM,'
      '  TB_PEDIDO_CAB,'
      '  TB_CADASTRO,'
      '  TB_PRODUTO,'
      '  TB_VENDEDOR'
      'WHERE'
      '  TB_PEDIDO_ITEM.COD_PEDIDO_CAB = TB_PEDIDO_CAB.COD_PEDIDO_CAB'
      '  AND'
      '  TB_PEDIDO_CAB.COD_VENDEDOR = TB_VENDEDOR.COD_VENDEDOR'
      '  AND'
      '  TB_PEDIDO_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
      '  AND'
      '  TB_PEDIDO_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '  AND'
      '  TB_PEDIDO_ITEM.QT_ATENDIDO = 0'
      '  AND'
      '  TB_PEDIDO_ITEM.QT_CANCELADO = 0'
      '  AND'
      '  TB_PEDIDO_CAB.IND_SITUACAO <> '#39'2'#39
      '  AND'
      '  TB_PEDIDO_CAB.IND_LIBERADO = '#39'SIM'#39
      '  AND'
      '  TB_PEDIDO_CAB.IND_EMBARQUE = '#39'N'#39
      '  AND'
      '  TB_PEDIDO_CAB.DT_EMISSAO >= '#39'01/09/2004'#39
      '  AND'
      '  (:COD_VENDEDOR IS NULL'
      '    OR'
      '    TB_PEDIDO_CAB.COD_VENDEDOR = :COD_VENDEDOR)'
      '  AND'
      '  (:COD_FILIAL IS NULL'
      '    OR'
      '    TB_PEDIDO_CAB.COD_FILIAL = :COD_FILIAL)'
      '   AND'
      '   (:COD_SUPERVISOR IS NULL'
      '     OR'
      '     TB_VENDEDOR.COD_SUPERVISOR = :COD_SUPERVISOR)'
      '   AND'
      '   (:COD_ESTADO IS NULL'
      '     OR'
      '     TB_CADASTRO.COD_ESTADO = :COD_ESTADO)'
      ''
      'GROUP BY'
      '  TB_CADASTRO.DESC_CIDADE,'
      '  TB_CADASTRO.COD_ESTADO'
      'ORDER BY'
      '  TB_CADASTRO.COD_ESTADO,'
      '  TB_CADASTRO.DESC_CIDADE'
      ''
      ''
      ''
      '')
    Variables.Data = {
      03000000040000000D0000003A434F445F56454E4445444F5203000000000000
      00000000000B0000003A434F445F46494C49414C030000000000000000000000
      0F0000003A434F445F53555045525649534F520300000000000000000000000B
      0000003A434F445F45535441444F050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000040000000A000000434F445F45535441444F0100000000000C000000
      544F54414C5F4341495841530100000000000B000000444553435F4349444144
      450100000000000C000000544F54414C5F4D4554524F53010000000000}
    Session = DMOracle.DBCemapa
    Left = 272
    Top = 352
    object QRPedido_Vendedor_EstadoCOD_ESTADO: TStringField
      FieldName = 'COD_ESTADO'
      Size = 2
    end
    object QRPedido_Vendedor_EstadoDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      Size = 30
    end
    object QRPedido_Vendedor_EstadoTOTAL_CAIXAS: TFloatField
      FieldName = 'TOTAL_CAIXAS'
    end
    object QRPedido_Vendedor_EstadoTOTAL_METROS: TFloatField
      FieldName = 'TOTAL_METROS'
    end
  end
  object QRProdutoEmbarcado2: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_ESTOQUE_EMBARCADO.COD_EMBARQUE,'
      '  TB_EMBARQUE.DT_EMBARQUE,'
      '  TB_EMBARQUE.NOME_MOTORISTA,'
      '  TB_ESTOQUE_EMBARCADO.COD_PRODUTO,'
      '  TB_PRODUTO.DESC_PRODUTO,'
      '  TB_ESTOQUE_EMBARCADO.COD_PEDIDO_CAB,'
      '  TB_ESTOQUE_EMBARCADO.NUM_CONTROLE,'
      '  TB_PEDIDO_CAB.COD_CADASTRO,'
      '  TB_CADASTRO.NOME,'
      '  TB_PESAGEM_PRODUCAO.DT_FABRICACAO,'
      '  TB_PESAGEM_PRODUCAO.COD_LOTE_TIPO,'
      '  SUM(TB_ESTOQUE_EMBARCADO.QT_EMBARCADO) AS QT_EMBARCADO,'
      '  SUM(TB_ESTOQUE_EMBARCADO.QT_PESO_EMBARCADO) AS QT_PESO'
      'FROM'
      '  TB_ESTOQUE_EMBARCADO,'
      '  TB_PESAGEM_PRODUCAO,'
      '  TB_EMBARQUE,'
      '  TB_PEDIDO_CAB,'
      '  TB_CADASTRO,'
      '  TB_PRODUTO,'
      '  TB_CLASSE,'
      '  TB_PARAM_SISTEMA'
      'WHERE'
      '  TB_ESTOQUE_EMBARCADO.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '  AND'
      '  TB_ESTOQUE_EMBARCADO.COD_EMBARQUE = TB_EMBARQUE.COD_EMBARQUE'
      '  AND'
      '  TB_PRODUTO.COD_CLASSE = TB_CLASSE.COD_CLASSE'
      '  AND'
      
        '  TB_ESTOQUE_EMBARCADO.COD_PEDIDO_CAB = TB_PEDIDO_CAB.COD_PEDIDO' +
        '_CAB'
      '  AND'
      '  TB_PEDIDO_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
      '  AND'
      
        '  TB_ESTOQUE_EMBARCADO.NUM_CONTROLE = TB_PESAGEM_PRODUCAO.COD_PE' +
        'SAGEM(+)'
      '  AND'
      '  (:NUM_CONTROLE IS NULL'
      '    OR'
      '    TB_ESTOQUE_EMBARCADO.NUM_CONTROLE = :NUM_CONTROLE)'
      '  AND'
      '  (:LOTE IS NULL'
      '    OR'
      '    TB_PESAGEM_PRODUCAO.COD_LOTE_TIPO = :LOTE)'
      '  AND'
      '  (:DT_INICIAL IS NULL'
      '   OR'
      '    TB_ESTOQUE_EMBARCADO.DT_EMBARQUE >= :DT_INICIAL)'
      '  AND'
      '  (:DT_FINAL IS NULL'
      '   OR'
      '    TB_ESTOQUE_EMBARCADO.DT_EMBARQUE <= :DT_FINAL)'
      '  AND'
      '  (:EMBARQUE IS NULL'
      '   OR'
      '    TB_ESTOQUE_EMBARCADO.COD_EMBARQUE =:EMBARQUE)'
      '  AND'
      '  (:CLASSE IS NULL'
      '   OR'
      '    TB_CLASSE.NUM_CLASSE =:CLASSE)'
      '  AND'
      '  (:PEDIDO IS NULL'
      '   OR'
      '    TB_ESTOQUE_EMBARCADO.COD_PEDIDO_CAB =:PEDIDO)'
      '  AND'
      '  (:PRODUTO IS NULL'
      '   OR'
      '    TB_ESTOQUE_EMBARCADO.COD_PRODUTO =:PRODUTO)    '
      '  AND'
      '  (:COD_CADASTRO IS NULL'
      '    OR'
      '    TB_PEDIDO_CAB.COD_CADASTRO = :COD_CADASTRO)    '
      '  AND 1=1'
      'GROUP BY'
      '  TB_ESTOQUE_EMBARCADO.COD_EMBARQUE,'
      '  TB_EMBARQUE.DT_EMBARQUE,'
      '  TB_EMBARQUE.NOME_MOTORISTA,'
      '  TB_ESTOQUE_EMBARCADO.COD_PRODUTO,'
      '  TB_PRODUTO.DESC_PRODUTO,'
      '  TB_ESTOQUE_EMBARCADO.COD_PEDIDO_CAB,'
      '  TB_ESTOQUE_EMBARCADO.NUM_CONTROLE,'
      '  TB_PEDIDO_CAB.COD_CADASTRO,'
      '  TB_CADASTRO.NOME,'
      '  TB_PESAGEM_PRODUCAO.DT_FABRICACAO,'
      '  TB_PESAGEM_PRODUCAO.COD_LOTE_TIPO'
      'ORDER BY'
      '  TB_ESTOQUE_EMBARCADO.COD_EMBARQUE,'
      '  TB_ESTOQUE_EMBARCADO.COD_PEDIDO_CAB,'
      '  TB_ESTOQUE_EMBARCADO.COD_PRODUTO')
    Variables.Data = {
      03000000090000000B0000003A44545F494E494349414C0C0000000000000000
      000000090000003A44545F46494E414C0C000000000000000000000009000000
      3A454D424152515545030000000000000000000000070000003A434C41535345
      030000000000000000000000070000003A50454449444F030000000000000000
      000000080000003A50524F4455544F0300000000000000000000000D0000003A
      434F445F434144415354524F0300000000000000000000000D0000003A4E554D
      5F434F4E54524F4C45030000000000000000000000050000003A4C4F54450300
      00000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000D0000000B000000434F445F50524F4455544F0100000000000C0000
      00444553435F50524F4455544F0100000000000C00000051545F454D42415243
      41444F0100000000000E000000434F445F50454449444F5F4341420100000000
      000C0000004E554D5F434F4E54524F4C450100000000000700000051545F5045
      534F0100000000000C000000434F445F454D4241525155450100000000000B00
      000044545F454D4241525155450100000000000E0000004E4F4D455F4D4F544F
      52495354410100000000000C000000434F445F434144415354524F0100000000
      00040000004E4F4D450100000000000D00000044545F4641425249434143414F
      0100000000000D000000434F445F4C4F54455F5449504F010000000000}
    Session = DMOracle.DBCemapa
    Left = 496
    Top = 496
    object QRProdutoEmbarcado2COD_EMBARQUE: TIntegerField
      FieldName = 'COD_EMBARQUE'
    end
    object QRProdutoEmbarcado2COD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
    end
    object QRProdutoEmbarcado2DESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
    object QRProdutoEmbarcado2COD_PEDIDO_CAB: TIntegerField
      FieldName = 'COD_PEDIDO_CAB'
    end
    object QRProdutoEmbarcado2NUM_CONTROLE: TIntegerField
      FieldName = 'NUM_CONTROLE'
    end
    object QRProdutoEmbarcado2QT_EMBARCADO: TFloatField
      FieldName = 'QT_EMBARCADO'
    end
    object QRProdutoEmbarcado2QT_PESO: TFloatField
      FieldName = 'QT_PESO'
    end
    object QRProdutoEmbarcado2DT_EMBARQUE: TDateTimeField
      FieldName = 'DT_EMBARQUE'
      Required = True
    end
    object QRProdutoEmbarcado2NOME_MOTORISTA: TStringField
      FieldName = 'NOME_MOTORISTA'
      Size = 50
    end
    object QRProdutoEmbarcado2COD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
    end
    object QRProdutoEmbarcado2NOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object QRProdutoEmbarcado2DT_FABRICACAO: TDateTimeField
      FieldName = 'DT_FABRICACAO'
      Required = True
    end
    object QRProdutoEmbarcado2COD_LOTE_TIPO: TIntegerField
      FieldName = 'COD_LOTE_TIPO'
      Required = True
    end
  end
  object QEstoqueEmbarcado: TOracleDataSet1
    SQL.Strings = (
      'SELECT '
      '  ROWID,'
      '  TB_ESTOQUE_EMBARCADO.*'
      'FROM '
      '  TB_ESTOQUE_EMBARCADO'
      'WHERE'
      '  TB_ESTOQUE_EMBARCADO.COD_ESTOQUE_EMBARCADO =:PK')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_ESTOQUE_EMBARCADO'
    SequenceField.Sequence = 'SQESTOQUE_EMBARCADO'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000A00000015000000434F445F4553544F5155455F454D424152434144
      4F0100000000000A000000434F445F46494C49414C0100000000000B00000043
      4F445F50524F4455544F0100000000000E000000434F445F50454449444F5F43
      41420100000000000F000000434F445F50454449444F5F4954454D0100000000
      000C000000434F445F454D4241525155450100000000000C00000051545F454D
      4241524341444F0100000000000C0000004E554D5F434F4E54524F4C45010000
      0000000B00000044545F454D4241525155450100000000001100000051545F50
      45534F5F454D4241524341444F010000000000}
    Session = DMOracle.DBCemapa
    Left = 640
    Top = 480
    object QEstoqueEmbarcadoCOD_ESTOQUE_EMBARCADO: TIntegerField
      FieldName = 'COD_ESTOQUE_EMBARCADO'
      Required = True
    end
    object QEstoqueEmbarcadoCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
    end
    object QEstoqueEmbarcadoCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
    end
    object QEstoqueEmbarcadoCOD_PEDIDO_CAB: TIntegerField
      FieldName = 'COD_PEDIDO_CAB'
    end
    object QEstoqueEmbarcadoCOD_PEDIDO_ITEM: TIntegerField
      FieldName = 'COD_PEDIDO_ITEM'
    end
    object QEstoqueEmbarcadoCOD_EMBARQUE: TIntegerField
      FieldName = 'COD_EMBARQUE'
    end
    object QEstoqueEmbarcadoQT_EMBARCADO: TIntegerField
      FieldName = 'QT_EMBARCADO'
    end
    object QEstoqueEmbarcadoDT_EMBARQUE: TDateTimeField
      FieldName = 'DT_EMBARQUE'
    end
    object QEstoqueEmbarcadoQT_PESO_EMBARCADO: TFloatField
      FieldName = 'QT_PESO_EMBARCADO'
    end
    object QEstoqueEmbarcadoNUM_CONTROLE: TIntegerField
      FieldName = 'NUM_CONTROLE'
    end
  end
  object QREmbarqueTemperatura: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  DISTINCT'
      '  DESC_CLASSE,'
      '  Cod_Embarque,'
      '  Dt_Embarque,'
      '  COD_PRODUTO,'
      '  DESC_PRODUTO,'
      '  NUM_EMBALAGEM,'
      '  DESC_UNIDADE,'
      '  NUM_VOLUMES,'
      '  DESC_LOTE,'
      '  desc_complemento_2  As Desc_Temperatura'
      'FROM'
      '('
      '  SELECT'
      
        '    DECODE(TB_PARAM_SISTEMA.COD_EMPRESA,'#39'CGS'#39','#39'GERAL'#39',Tb_Classe.' +
        'DESC_CLASSE) AS DESC_CLASSE,'
      '    Tb_Embarque.Cod_Embarque,'
      '    TB_EMBARQUE.NUM_EMBARQUE,'
      '    Tb_Embarque.Dt_Embarque,'
      '    Tb_Embarque.NOME_MOTORISTA,'
      '    Tb_Embarque.NUM_KILOMETRAGEM,'
      '    Tb_Embarque.DESC_OBS,'
      '    Tb_Embarque.COD_TRANSPORTADOR,'
      '    TB_CADASTRO.NOME AS NOME_TRANSPORTADOR,'
      '    Tb_produto.COD_PRODUTO,'
      '    Tb_produto.DESC_PRODUTO,'
      '    Tb_Produto.NUM_EMBALAGEM,'
      '    Tb_Produto.DESC_UNIDADE,'
      '    Tb_Produto.NUM_VOLUMES,'
      '    Tb_Lote_Tipo.DESC_LOTE,'
      '    TB_PRODUTO.DESC_COMPLEMENTO_2'
      '  FROM'
      '    TB_EMBARQUE,'
      '    TB_EMBARQUE_ITEM,'
      '    TB_PEDIDO_CAB,'
      '    TB_PEDIDO_ITEM,'
      '    TB_CADASTRO,'
      '    TB_PRODUTO,'
      '    TB_LOTE_TIPO,'
      '    TB_OPERACAO,'
      '    TB_CLASSE,'
      '    TB_PARAM_SISTEMA'
      '  WHERE'
      '    Tb_embarque_item.COD_EMBARQUE = Tb_embarque.COD_EMBARQUE'
      '    AND'
      
        '    Tb_embarque_item.COD_PEDIDO_CAB = Tb_pedido_cab.COD_PEDIDO_C' +
        'AB'
      '    AND'
      '    Tb_pedido_cab.COD_PEDIDO_CAB = Tb_pedido_item.COD_PEDIDO_CAB'
      '    AND'
      '    Tb_Embarque.COD_TRANSPORTADOR = Tb_cadastro.COD_CADASTRO(+)'
      '    AND'
      '    Tb_pedido_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '    AND'
      '    Tb_pedido_item.COD_LOTE_TIPO = Tb_lote_tipo.COD_LOTE_TIPO'
      '    AND'
      '    Tb_pedido_cab.COD_OPERACAO = Tb_Operacao.COD_OPERACAO'
      '    AND'
      '    Tb_produto.COD_CLASSE = Tb_classe.COD_CLASSE'
      '    AND'
      '    ((:IND_LIVRO_FISCAL Is Null'
      '     Or'
      '      Tb_operacao.IND_LIVRO_FISCAL = :IND_LIVRO_FISCAL)'
      '     Or'
      
        '      ((:IND_LIVRO_FISCAL = '#39'N'#39') AND (TB_PEDIDO_CAB.PERC_SUB > 0' +
        ')))'
      '    AND'
      '    (:IND_PINTURA IS NULL'
      '     OR'
      '      Tb_produto.IND_PINTURA = :IND_PINTURA)'
      '    AND'
      '    (:IND_ESTOFARIA IS NULL'
      '     OR'
      '      Tb_produto.IND_ESTOFARIA = :IND_ESTOFARIA)'
      '    AND'
      '    (:COD_OPERACAO_NULLO IS NULL'
      '      OR'
      '      Tb_pedido_cab.COD_OPERACAO = :COD_OPERACAO1'
      '      OR'
      '      Tb_pedido_cab.COD_OPERACAO = :COD_OPERACAO2'
      '      OR'
      '      Tb_pedido_cab.COD_OPERACAO = :COD_OPERACAO3'
      '      OR'
      '      Tb_pedido_cab.COD_OPERACAO = :COD_OPERACAO4)'
      '    AND'
      '    (:EMBARQUE = TB_EMBARQUE.COD_EMBARQUE) '
      '    AND'
      '    (:CLASSE IS NULL'
      '     OR'
      '      TB_CLASSE.NUM_CLASSE =:CLASSE)'
      ')'
      'ORDER BY'
      '    DESC_CLASSE, DESC_UNIDADE, COD_PRODUTO, DESC_LOTE ')
    Variables.Data = {
      030000000A000000090000003A454D4241525155450300000000000000000000
      00110000003A494E445F4C4956524F5F46495343414C05000000000000000000
      00000C0000003A494E445F50494E545552410500000000000000000000000E00
      00003A494E445F4553544F46415249410500000000000000000000000E000000
      3A434F445F4F5045524143414F310300000000000000000000000E0000003A43
      4F445F4F5045524143414F320300000000000000000000000E0000003A434F44
      5F4F5045524143414F33030000000000000000000000130000003A434F445F4F
      5045524143414F5F4E554C4C4F050000000000000000000000070000003A434C
      415353450300000000000000000000000E0000003A434F445F4F504552414341
      4F34030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000A0000000C000000434F445F454D4241525155450100000000000B00
      000044545F454D4241525155450100000000000B000000434F445F50524F4455
      544F0100000000000C000000444553435F50524F4455544F0100000000000900
      0000444553435F4C4F54450100000000000D0000004E554D5F454D42414C4147
      454D0100000000000B0000004E554D5F564F4C554D45530100000000000B0000
      00444553435F434C415353450100000000000C000000444553435F554E494441
      444501000000000010000000444553435F54454D504552415455524101000000
      0000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    Left = 272
    Top = 424
    object QREmbarqueTemperaturaDESC_CLASSE: TStringField
      FieldName = 'DESC_CLASSE'
      Size = 30
    end
    object QREmbarqueTemperaturaCOD_EMBARQUE: TIntegerField
      FieldName = 'COD_EMBARQUE'
      Required = True
    end
    object QREmbarqueTemperaturaDT_EMBARQUE: TDateTimeField
      FieldName = 'DT_EMBARQUE'
      Required = True
    end
    object QREmbarqueTemperaturaCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QREmbarqueTemperaturaDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
    object QREmbarqueTemperaturaNUM_EMBALAGEM: TFloatField
      FieldName = 'NUM_EMBALAGEM'
    end
    object QREmbarqueTemperaturaDESC_UNIDADE: TStringField
      FieldName = 'DESC_UNIDADE'
      Size = 3
    end
    object QREmbarqueTemperaturaNUM_VOLUMES: TFloatField
      FieldName = 'NUM_VOLUMES'
    end
    object QREmbarqueTemperaturaDESC_LOTE: TStringField
      FieldName = 'DESC_LOTE'
    end
    object QREmbarqueTemperaturaDESC_TEMPERATURA: TStringField
      FieldName = 'DESC_TEMPERATURA'
    end
  end
  object QRPedidoEmbarcado: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  T.COD_EMBARQUE,'
      '  T.DT_EMBARQUE,'
      '  T.COD_PEDIDO_CAB,'
      '  T.NUM_PEDIDO,'
      '  T.DT_PEDIDO,'
      '  T.CADASTRO,'
      '  T.QT_LIQ,'
      '  T.QT_BRUTO,'
      
        '  SUM(N_IT.VAL_TOTAL + N_IT.VAL_IPI - (N_IT.VAL_TOTAL*N_IT.PERC_' +
        'INSS/100) +'
      
        #9'N_IT.VAL_ICMS_SUBST + N_IT.VAL_DESPESAS - N_IT.VAL_DESCONTO) AS' +
        ' VAL_LIQ'
      'FROM'
      '  TB_NOTA_ITEM N_IT,'
      '  ('
      #9'SELECT'
      #9'  E.COD_EMBARQUE,'
      #9'  E.DT_EMBARQUE,'
      #9'  E_IT.COD_PEDIDO_CAB,'
      #9'  P.NUM_PEDIDO,'
      #9'  P.DT_EMISSAO AS DT_PEDIDO,'
      #9'  C.COD_CADASTRO || '#39' - '#39' || C.NOME AS CADASTRO,'
      #9'  SUM(EE.QT_PESO_EMBARCADO) AS QT_LIQ,'
      #9'  SUM(EE.QT_PESO_EMBARCADO + PRO.NUM_EMBALAGEM) AS QT_BRUTO'
      #9'FROM'
      #9'  TB_EMBARQUE E'
      #9'INNER JOIN'
      #9'  TB_EMBARQUE_ITEM E_IT'
      #9'ON'
      #9'  E.COD_EMBARQUE = E_IT.COD_EMBARQUE'
      #9'INNER JOIN'
      #9'  TB_PEDIDO_CAB P'
      #9'ON'
      #9'  E_IT.COD_PEDIDO_CAB = P.COD_PEDIDO_CAB'
      #9'INNER JOIN'
      #9'  TB_CADASTRO C'
      #9'ON'
      #9'  P.COD_CADASTRO = C.COD_CADASTRO'
      #9'INNER JOIN'
      #9'  TB_ESTOQUE_EMBARCADO EE'
      #9'ON'
      #9'  E_IT.COD_PEDIDO_CAB = EE.COD_PEDIDO_CAB'
      #9'AND'
      #9'  E.COD_EMBARQUE = EE.COD_EMBARQUE'
      #9'INNER JOIN'
      #9'  TB_PRODUTO PRO'
      #9'ON'
      #9'  EE.COD_PRODUTO = PRO.COD_PRODUTO'
      #9'WHERE'
      '    (:PRODUTO IS NULL OR PRO.COD_PRODUTO = :PRODUTO)'
      '  AND'
      '    (:EMBARQUE IS NULL OR E.COD_EMBARQUE = :EMBARQUE)'
      '  AND'
      '    (:CADASTRO IS NULL OR P.COD_CADASTRO = :CADASTRO)'
      '  AND'
      '    (:DT_INICIO IS NULL OR E.DT_EMBARQUE >= :DT_INICIO)'
      '  AND'
      '    (:DT_FIM IS NULL OR E.DT_EMBARQUE <= :DT_FIM)'
      '  AND'
      '    (:DT_PED_INICIO IS NULL OR P.DT_EMISSAO >= :DT_PED_INICIO)'
      '  AND'
      '    (:DT_PED_FIM IS NULL OR P.DT_EMISSAO <= :DT_PED_FIM)'
      #9'GROUP BY'
      #9'  E.COD_EMBARQUE,'
      #9'  E.DT_EMBARQUE,'
      #9'  E_IT.COD_PEDIDO_CAB,'
      #9'  P.COD_PEDIDO_CAB,'
      #9'  P.NUM_PEDIDO,'
      #9'  P.DT_EMISSAO,'
      #9'  C.COD_CADASTRO,'
      #9'  C.NOME'
      '  ) T'
      'WHERE'
      
        '  N_IT.COD_NOTA_CAB IN (SELECT COD_NOTA_CAB FROM TB_NOTA_CAB WHE' +
        'RE NUM_PEDIDO = T.NUM_PEDIDO)'
      'GROUP BY'
      '  T.COD_EMBARQUE,'
      '  T.DT_EMBARQUE,'
      '  T.COD_PEDIDO_CAB,'
      '  T.NUM_PEDIDO,'
      '  T.DT_PEDIDO,'
      '  T.CADASTRO,'
      '  T.QT_LIQ,'
      '  T.QT_BRUTO'
      'ORDER BY'
      '  T.DT_EMBARQUE,'
      '  T.COD_EMBARQUE,'
      '  T.DT_PEDIDO,'
      '  T.COD_PEDIDO_CAB'
      '')
    Variables.Data = {
      0300000007000000080000003A50524F4455544F030000000000000000000000
      090000003A434144415354524F0300000000000000000000000A0000003A4454
      5F494E4943494F0C0000000000000000000000070000003A44545F46494D0C00
      000000000000000000000E0000003A44545F5045445F494E4943494F0C000000
      00000000000000000B0000003A44545F5045445F46494D0C0000000000000000
      000000090000003A454D424152515545030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000090000000E000000434F445F50454449444F5F434142010000000000
      0C000000434F445F454D4241525155450100000000000B00000044545F454D42
      41525155450100000000000A0000004E554D5F50454449444F01000000000009
      00000044545F50454449444F0100000000000600000051545F4C495101000000
      00000800000051545F425255544F0100000000000700000056414C5F4C495101
      000000000008000000434144415354524F010000000000}
    Session = DMOracle.DBCemapa
    Left = 48
    Top = 416
    object QRPedidoEmbarcadoCOD_EMBARQUE: TIntegerField
      FieldName = 'COD_EMBARQUE'
      Required = True
    end
    object QRPedidoEmbarcadoCADASTRO: TStringField
      FieldName = 'CADASTRO'
      Size = 93
    end
    object QRPedidoEmbarcadoDT_EMBARQUE: TDateTimeField
      FieldName = 'DT_EMBARQUE'
      Required = True
    end
    object QRPedidoEmbarcadoCOD_PEDIDO_CAB: TIntegerField
      FieldName = 'COD_PEDIDO_CAB'
      Required = True
    end
    object QRPedidoEmbarcadoNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object QRPedidoEmbarcadoDT_PEDIDO: TDateTimeField
      FieldName = 'DT_PEDIDO'
    end
    object QRPedidoEmbarcadoQT_LIQ: TFloatField
      FieldName = 'QT_LIQ'
      DisplayFormat = '#,##0.00'
    end
    object QRPedidoEmbarcadoQT_BRUTO: TFloatField
      FieldName = 'QT_BRUTO'
      DisplayFormat = '#,##0.00'
    end
    object QRPedidoEmbarcadoVAL_LIQ: TFloatField
      FieldName = 'VAL_LIQ'
      DisplayFormat = '#,##0.00'
    end
  end
  object CDSCodigoBarraComando: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 464
    Data = {
      530000009619E0BD010000001800000002000000000003000000530006434F44
      49474F0100490000000100055749445448020002000E00094445534352494341
      4F01004900000001000557494454480200020032000000}
    object CDSCodigoBarraComandoCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 14
    end
    object CDSCodigoBarraComandoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
  end
  object DSBaixaEstoqueLeitor: TDataSource
    DataSet = QRBaixaEstoqueLeitor
    Left = 688
    Top = 296
  end
  object QRQtdeEntregas: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  COD_CADASTRO,'
      '  COUNT(*) AS ENTREGAS FROM'
      '  (SELECT'
      '  TB_PEDIDO_CAB.COD_CADASTRO,'
      '  Tb_Pedido_cab.COD_PEDIDO_CAB,'
      '  Tb_Embarque_Item.COD_EMBARQUE'
      'FROM'
      '  TB_EMBARQUE,'
      '  TB_EMBARQUE_ITEM,'
      '  TB_PEDIDO_CAB'
      'WHERE'
      '  Tb_embarque_item.COD_EMBARQUE = Tb_embarque.COD_EMBARQUE'
      '  AND'
      '  TB_EMBARQUE_ITEM.COD_PEDIDO_CAB = TB_PEDIDO_CAB.COD_PEDIDO_CAB'
      '  AND'
      '  (:EMBARQUE = TB_EMBARQUE.COD_EMBARQUE) '
      
        'GROUP BY TB_PEDIDO_CAB.COD_CADASTRO,TB_PEDIDO_CAB.COD_PEDIDO_CAB' +
        ', TB_EMBARQUE_ITEM.COD_EMBARQUE'
      ') '
      'GROUP BY COD_CADASTRO')
    Variables.Data = {
      0300000001000000090000003A454D4241525155450300000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      04000000020000000C000000434F445F434144415354524F0100000000000800
      0000454E545245474153010000000000}
    Session = DMOracle.DBCemapa
    Left = 752
    Top = 64
    object QRQtdeEntregasCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
    end
    object QRQtdeEntregasENTREGAS: TFloatField
      FieldName = 'ENTREGAS'
    end
  end
  object QREmbarqueRes: TOracleDataSet1
    SQL.Strings = (
      'select'
      '  COD_EMBARQUE,'
      '  NOME, '
      '  DESC_CIDADE, '
      '  NUM_PEDIDO_NOTA,'
      '  DESC_PRAZO_VENCIMENTO,'
      '  CASE '
      
        '    WHEN ((SELECT COD_EMPRESA FROM TB_PARAM_SISTEMA) IN ('#39'MARICO' +
        'TA'#39', '#39'ZAPOLI'#39')) THEN'
      '        NUM_NOTA'
      '    ELSE'
      '        NULL'
      '  END AS NUM_NOTA,'
      '  SUM(NUM_PESO_BRUTO) as NUM_PESO_BRUTO,'
      
        '  SUM(VAL_TOTAL) - NVL(VAL_DESCONTO, 0) + NVL(VAL_DESPESAS, 0) a' +
        's VAL_TOTAL'
      ' from('
      'select'
      '  TB_EMBARQUE.COD_EMBARQUE,'
      '  TB_CADASTRO.NOME,'
      '  TB_CADASTRO.DESC_CIDADE,'
      '  TB_PEDIDO_CAB.NUM_PEDIDO NUM_PEDIDO_NOTA,'
      '  TB_PRAZO_VENCIMENTO.DESC_PRAZO_VENCIMENTO,'
      
        '  TB_PRODUTO.NUM_PESO_BRUTO * (TB_PEDIDO_ITEM.QT_PEDIDO) as NUM_' +
        'PESO_BRUTO,'
      
        '  ((TB_PEDIDO_ITEM.VAL_UNITARIO * (1-TB_PEDIDO_ITEM.perc_descont' +
        'o/100)) * (TB_PEDIDO_ITEM.QT_PEDIDO-TB_PEDIDO_ITEM.QT_CANCELADO)' +
        ' * '
      '    (1-nvl(TB_PEDIDO_ITEM.perc_desconto1,0)/100) * '
      '    (1-nvl(TB_PEDIDO_ITEM.perc_desconto2,0)/100) *'
      '    (1+nvl(TB_PEDIDO_ITEM.perc_acrescimo,0)/100)) as  VAL_TOTAL,'
      
        '  (SELECT MAX(NUM_NOTA) FROM TB_NOTA_CAB WHERE COD_NOTA_CAB IN  ' +
        '  '
      '    ('
      
        '        SELECT DISTINCT COD_NOTA_CAB FROM TB_NOTA_ITEM WHERE COD' +
        '_NOTA_ITEM IN'
      '            ('
      
        '                SELECT COD_NOTA_ITEM FROM TB_BAIXA_PEDIDO WHERE ' +
        'COD_PEDIDO_ITEM IN'
      
        '                    (SELECT COD_PEDIDO_ITEM FROM TB_PEDIDO_ITEM ' +
        'WHERE COD_PEDIDO_CAB = TB_PEDIDO_CAB.COD_PEDIDO_CAB)'
      '            )'
      '    )    '
      '  ) AS NUM_NOTA,'
      '  TB_PEDIDO_CAB.VAL_DESCONTO,'
      '  TB_PEDIDO_CAB.VAL_DESPESAS'
      'from'
      '  TB_EMBARQUE,'
      '  TB_EMBARQUE_ITEM,'
      '  TB_PEDIDO_CAB,'
      '  TB_PEDIDO_ITEM,'
      '  TB_CADASTRO,'
      '  TB_PRODUTO,'
      '  TB_PRAZO_VENCIMENTO'
      'where'
      '  TB_EMBARQUE_ITEM.COD_EMBARQUE = TB_EMBARQUE.COD_EMBARQUE'
      '  and'
      '  TB_EMBARQUE_ITEM.COD_PEDIDO_CAB = TB_PEDIDO_CAB.COD_PEDIDO_CAB'
      '  and'
      '  TB_PEDIDO_CAB.COD_PEDIDO_CAB = TB_PEDIDO_ITEM.COD_PEDIDO_CAB'
      '  and'
      '  TB_PEDIDO_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
      '  and'
      '  TB_PEDIDO_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '  and'
      
        '  TB_PEDIDO_CAB.COD_PRAZO_VENCIMENTO = TB_PRAZO_VENCIMENTO.COD_P' +
        'RAZO_VENCIMENTO(+)'
      '  and'
      '  (:EMBARQUE = TB_EMBARQUE.COD_EMBARQUE)  '
      
        ') group by COD_EMBARQUE, NOME, DESC_CIDADE, NUM_PEDIDO_NOTA, DES' +
        'C_PRAZO_VENCIMENTO, NUM_NOTA, VAL_DESCONTO, VAL_DESPESAS'
      '  Order by :ORDEM')
    Variables.Data = {
      0300000002000000090000003A454D4241525155450300000000000000000000
      00060000003A4F5244454D010000000D000000434F445F454D42415251554500
      00000000}
    QBEDefinition.QBEFieldDefs = {
      0400000009000000040000004E4F4D450100000000000B000000444553435F43
      494441444501000000000015000000444553435F5052415A4F5F56454E43494D
      454E544F0100000000000E0000004E554D5F5045534F5F425255544F01000000
      00000900000056414C5F544F54414C0100000000000C000000434F445F454D42
      41525155450100000000000F0000004E554D5F50454449444F5F4E4F54410100
      00000000080000004E554D5F4E4F54410100000000000B000000434F445F5052
      4F4455544F010000000000}
    Session = DMOracle.DBCemapa
    OnCalcFields = QREmbarqueResCalcFields
    Left = 744
    Top = 16
    object QREmbarqueResCOD_EMBARQUE: TIntegerField
      FieldName = 'COD_EMBARQUE'
      Required = True
    end
    object QREmbarqueResNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object QREmbarqueResDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      Size = 30
    end
    object QREmbarqueResDESC_PRAZO_VENCIMENTO: TStringField
      FieldName = 'DESC_PRAZO_VENCIMENTO'
      Size = 30
    end
    object QREmbarqueResNUM_PESO_BRUTO: TFloatField
      FieldName = 'NUM_PESO_BRUTO'
    end
    object QREmbarqueResVAL_TOTAL: TFloatField
      FieldName = 'VAL_TOTAL'
    end
    object QREmbarqueResNUM_PEDIDO_NOTA: TIntegerField
      FieldName = 'NUM_PEDIDO_NOTA'
    end
    object QREmbarqueResNUM_NOTA: TFloatField
      FieldName = 'NUM_NOTA'
    end
  end
  object QREmbarquePrazVcto: TOracleDataSet1
    SQL.Strings = (
      'select sum(val_total) as SVAL_TOTAL,'
      '      cod_prazo_vencimento,'
      '      desc_prazo_vencimento'
      '   from ('
      'SELECT'
      '  Tb_pedido_cab.IND_TIPO_PAGAMENTO,'
      '  Tb_Pedido_cab.COD_PEDIDO_CAB,'
      '  Tb_pedido_cab.NUM_PEDIDO,'
      '  TB_PEDIDO_CAB.COD_PRAZO_VENCIMENTO,'
      
        '  Tb_pedido_item.VAL_UNITARIO * (Tb_pedido_item.QT_PEDIDO-Tb_ped' +
        'ido_item.QT_CANCELADO) AS  VAL_TOTAL,'
      '  TB_PRAZO_VENCIMENTO.DESC_PRAZO_VENCIMENTO'
      'FROM'
      '  TB_EMBARQUE,'
      '  TB_EMBARQUE_ITEM,'
      '  TB_PEDIDO_CAB,'
      '  TB_PEDIDO_ITEM,'
      '  TB_PRAZO_VENCIMENTO'
      'WHERE'
      '  Tb_embarque_item.COD_EMBARQUE = Tb_embarque.COD_EMBARQUE'
      '  AND'
      '  Tb_embarque_item.COD_PEDIDO_CAB = Tb_pedido_cab.COD_PEDIDO_CAB'
      '  AND'
      '  Tb_pedido_cab.COD_PEDIDO_CAB = Tb_pedido_item.COD_PEDIDO_CAB'
      '  AND'
      
        '  TB_PEDIDO_CAB.COD_PRAZO_VENCIMENTO = TB_PRAZO_VENCIMENTO.COD_P' +
        'RAZO_VENCIMENTO(+)'
      '  AND'
      '  (:EMBARQUE = TB_EMBARQUE.COD_EMBARQUE)'
      ') group by cod_prazo_vencimento, desc_prazo_vencimento'
      'ORDER BY'
      ' cod_prazo_vencimento, Desc_prazo_vencimento ')
    Variables.Data = {
      0300000001000000090000003A454D4241525155450300000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      04000000030000000A0000005356414C5F544F54414C01000000000014000000
      434F445F5052415A4F5F56454E43494D454E544F010000000000150000004445
      53435F5052415A4F5F56454E43494D454E544F010000000000}
    Session = DMOracle.DBCemapa
    Left = 753
    Top = 192
  end
  object QREmbarqueProduto: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  cod_produto,'
      '  DESC_PRODUTO,'
      '  COD_EMBARQUE,'
      '  DT_EMBARQUE,'
      '  NOME,'
      '  sum(qt_pedido) as qt_pedido,'
      '  SUM(NUM_PESO_BRUTO) AS NUM_PESO_BRUTO,'
      '  SUM(NUM_PESO_LIQUIDO) AS NUM_PESO_LIQUIDO,'
      '  SUM(VAL_TOTAL) AS VAL_TOTAL,'
      '  SUM(NUM_METROS_CUBICOS) AS NUM_METROS_CUBICOS '
      ' FROM('
      'SELECT'
      '  tb_produto.cod_produto,'
      '  TB_PRODUTO.DESC_PRODUTO,'
      '  TB_EMBARQUE.COD_EMBARQUE,'
      '  TB_EMBARQUE.DT_EMBARQUE,'
      '  TB_CADASTRO.NOME,'
      '  TB_PEDIDO_ITEM.QT_PEDIDO,'
      
        '  TB_PRODUTO.NUM_PESO_BRUTO * (TB_PEDIDO_ITEM.QT_PEDIDO) AS NUM_' +
        'PESO_BRUTO,'
      
        '  TB_PRODUTO.NUM_PESO_LIQUIDO * (TB_PEDIDO_ITEM.QT_PEDIDO) AS NU' +
        'M_PESO_LIQUIDO,'
      
        '  TB_PEDIDO_ITEM.VAL_UNITARIO * (TB_PEDIDO_ITEM.QT_PEDIDO-TB_PED' +
        'IDO_ITEM.QT_CANCELADO) AS  VAL_TOTAL,'
      
        '  TB_PRODUTO.NUM_METROS_CUBICOS * (TB_PEDIDO_ITEM.QT_PEDIDO - TB' +
        '_PEDIDO_ITEM.QT_CANCELADO) AS NUM_METROS_CUBICOS'
      'FROM'
      '  TB_EMBARQUE,'
      '  TB_EMBARQUE_ITEM,'
      '  TB_PEDIDO_CAB,'
      '  TB_PEDIDO_ITEM,'
      '  TB_PRODUTO,'
      '  TB_CADASTRO'
      'WHERE'
      '  TB_EMBARQUE_ITEM.COD_EMBARQUE = TB_EMBARQUE.COD_EMBARQUE'
      '  AND'
      '  TB_EMBARQUE_ITEM.COD_PEDIDO_CAB = TB_PEDIDO_CAB.COD_PEDIDO_CAB'
      '  AND'
      '  TB_PEDIDO_CAB.COD_PEDIDO_CAB = TB_PEDIDO_ITEM.COD_PEDIDO_CAB'
      '  AND'
      '  TB_PEDIDO_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '  AND'
      '  TB_EMBARQUE.COD_TRANSPORTADOR = TB_CADASTRO.COD_CADASTRO(+)'
      '  AND'
      
        '  (:EMBARQUE = TB_EMBARQUE.COD_EMBARQUE)) GROUP BY cod_produto, ' +
        'DESC_PRODUTO, COD_EMBARQUE, DT_EMBARQUE, NOME'
      'order by desc_produto')
    Variables.Data = {
      0300000001000000090000003A454D4241525155450300000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      040000000A0000000B000000434F445F50524F4455544F0100000000000C0000
      00444553435F50524F4455544F0100000000000900000051545F50454449444F
      0100000000000E0000004E554D5F5045534F5F425255544F0100000000001000
      00004E554D5F5045534F5F4C49515549444F0100000000000900000056414C5F
      544F54414C0100000000000C000000434F445F454D4241525155450100000000
      000B00000044545F454D424152515545010000000000040000004E4F4D450100
      00000000120000004E554D5F4D4554524F535F43554249434F53010000000000}
    Session = DMOracle.DBCemapa
    Left = 792
    Top = 136
    object QREmbarqueProdutoCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QREmbarqueProdutoDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 200
    end
    object QREmbarqueProdutoQT_PEDIDO: TFloatField
      FieldName = 'QT_PEDIDO'
    end
    object QREmbarqueProdutoNUM_PESO_BRUTO: TFloatField
      FieldName = 'NUM_PESO_BRUTO'
    end
    object QREmbarqueProdutoNUM_PESO_LIQUIDO: TFloatField
      FieldName = 'NUM_PESO_LIQUIDO'
    end
    object QREmbarqueProdutoVAL_TOTAL: TFloatField
      FieldName = 'VAL_TOTAL'
    end
    object QREmbarqueProdutoCOD_EMBARQUE: TIntegerField
      FieldName = 'COD_EMBARQUE'
      Required = True
    end
    object QREmbarqueProdutoDT_EMBARQUE: TDateTimeField
      FieldName = 'DT_EMBARQUE'
      Required = True
    end
    object QREmbarqueProdutoNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object QREmbarqueProdutoNUM_METROS_CUBICOS: TFloatField
      FieldName = 'NUM_METROS_CUBICOS'
    end
  end
  object QNotasEmbarque: TOracleDataSet1
    SQL.Strings = (
      'SELECT '
      '  N.COD_NOTA_CAB,'
      '  N.DESC_CHAVE_ACESSO,'
      '  N.COD_SERIE_MODELO,'
      '  N.COD_SERIE,'
      
        '  SUM(NI.VAL_TOTAL - PEGA_DESCONTO_ITEM(NI.COD_NOTA_ITEM) + NI.V' +
        'AL_DESPESAS + NI.VAL_IPI + NI.VAL_FRETE + NI.VAL_ICMS_SUBST) AS ' +
        'SVAL_TOTAL,'
      '  N.NUM_PESO_BRUTO,'
      '  C.COD_CIDADE'
      'FROM'
      '  TB_EMBARQUE E,'
      '  TB_EMBARQUE_ITEM EI,'
      '  TB_NOTA_CAB N,'
      '  TB_NOTA_ITEM NI,'
      '  TB_BAIXA_PEDIDO BP,'
      '  TB_PEDIDO_ITEM PI,'
      '  TB_CADASTRO C'
      'WHERE'
      '  N.COD_NOTA_CAB = NI.COD_NOTA_CAB'
      '  AND'
      '  NI.COD_NOTA_ITEM = BP.COD_NOTA_ITEM'
      '  AND'
      '  BP.COD_PEDIDO_ITEM = PI.COD_PEDIDO_ITEM'
      '  AND'
      '  PI.COD_PEDIDO_CAB = EI.COD_PEDIDO_CAB'
      '  AND'
      '  E.COD_EMBARQUE = EI.COD_EMBARQUE'
      '  AND'
      '  C.COD_CADASTRO = N.COD_CADASTRO'
      '  AND'
      '  E.COD_EMBARQUE = :COD_EMBARQUE '
      'GROUP BY '
      '  N.COD_NOTA_CAB, '
      '  N.DESC_CHAVE_ACESSO, '
      '  N.COD_SERIE_MODELO, '
      '  N.COD_SERIE, '
      '  N.NUM_PESO_BRUTO,'
      '  C.COD_CIDADE '
      ''
      ''
      '')
    Variables.Data = {
      03000000010000000D0000003A434F445F454D42415251554503000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000700000011000000444553435F43484156455F41434553534F010000
      00000010000000434F445F53455249455F4D4F44454C4F010000000000090000
      00434F445F53455249450100000000000C000000434F445F4E4F54415F434142
      0100000000000E0000004E554D5F5045534F5F425255544F0100000000000A00
      00005356414C5F544F54414C0100000000000A000000434F445F434944414445
      010000000000}
    Session = DMOracle.DBCemapa
    Left = 752
    Top = 248
    object QNotasEmbarqueCOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
      Required = True
    end
    object QNotasEmbarqueDESC_CHAVE_ACESSO: TStringField
      FieldName = 'DESC_CHAVE_ACESSO'
      Size = 47
    end
    object QNotasEmbarqueCOD_SERIE_MODELO: TStringField
      FieldName = 'COD_SERIE_MODELO'
      Size = 2
    end
    object QNotasEmbarqueCOD_SERIE: TStringField
      FieldName = 'COD_SERIE'
      Required = True
      Size = 3
    end
    object QNotasEmbarqueNUM_PESO_BRUTO: TFloatField
      FieldName = 'NUM_PESO_BRUTO'
    end
    object QNotasEmbarqueSVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
    end
    object QNotasEmbarqueCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
    end
  end
  object QRRelacaoProducao: TOracleDataSet1
    SQL.Strings = (
      'SELECT     '
      '  TB_FORMULA_ITEM.COD_PRODUTO,  '
      
        '  SUM(TB_FORMULA_ITEM.QT_ITEM*TB_PEDIDO_ITEM.QT_PEDIDO) AS QT_IT' +
        'EM'
      'FROM'
      '  TB_EMBARQUE,'
      '  TB_EMBARQUE_ITEM,'
      '  TB_PEDIDO_CAB,'
      '  TB_PEDIDO_ITEM,'
      '  TB_PRODUTO, '
      '  TB_FORMULA,'
      '  TB_FORMULA_ITEM   '
      'WHERE'
      '  TB_EMBARQUE.COD_EMBARQUE = TB_EMBARQUE_ITEM.COD_EMBARQUE'
      '  AND'
      '  TB_EMBARQUE_ITEM.COD_PEDIDO_CAB = TB_PEDIDO_CAB.COD_PEDIDO_CAB'
      '  AND'
      '  TB_PEDIDO_CAB.COD_PEDIDO_CAB = TB_PEDIDO_ITEM.COD_PEDIDO_CAB'
      '  AND'
      '  TB_PEDIDO_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '  AND'
      '  TB_PRODUTO.COD_PRODUTO = TB_FORMULA.COD_PRODUTO'
      '  AND'
      '  TB_FORMULA.COD_FORMULA = TB_FORMULA_ITEM.COD_FORMULA  '
      '  AND'
      '  :COD_EMBARQUE'
      'GROUP BY'
      '  TB_FORMULA_ITEM.COD_PRODUTO'
      'ORDER BY'
      '  TB_FORMULA_ITEM.COD_PRODUTO'
      '')
    Variables.Data = {
      03000000010000000D0000003A434F445F454D42415251554501000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000020000000B000000434F445F50524F4455544F010000000000070000
      0051545F4954454D010000000000}
    Session = DMOracle.DBCemapa
    OnCalcFields = QRRelacaoProducaoCalcFields
    Left = 752
    Top = 376
    object QRRelacaoProducaoCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QRRelacaoProducaoQT_ITEM: TFloatField
      FieldName = 'QT_ITEM'
    end
    object QRRelacaoProducaodesc_produto: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_produto'
      Size = 60
      Calculated = True
    end
  end
  object QRRelacaoProducaoQtdePedido: TOracleDataSet1
    SQL.Strings = (
      'SELECT     '
      '  TB_PEDIDO_ITEM.COD_PRODUTO,'
      '  TB_PRODUTO.DESC_PRODUTO,'
      '  SUM(TB_PEDIDO_ITEM.QT_PEDIDO) AS QT_ITEM'
      'FROM'
      '  TB_EMBARQUE,'
      '  TB_EMBARQUE_ITEM,'
      '  TB_PEDIDO_CAB,'
      '  TB_PEDIDO_ITEM,'
      '  TB_PRODUTO'
      'WHERE'
      '  TB_EMBARQUE.COD_EMBARQUE = TB_EMBARQUE_ITEM.COD_EMBARQUE'
      '  AND'
      '  TB_EMBARQUE_ITEM.COD_PEDIDO_CAB = TB_PEDIDO_CAB.COD_PEDIDO_CAB'
      '  AND'
      '  TB_PEDIDO_CAB.COD_PEDIDO_CAB = TB_PEDIDO_ITEM.COD_PEDIDO_CAB'
      '  AND'
      '  TB_PEDIDO_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '  AND'
      '  :COD_EMBARQUE'
      'GROUP BY'
      '  TB_PEDIDO_ITEM.COD_PRODUTO,'
      '  TB_PRODUTO.DESC_PRODUTO'
      'ORDER BY'
      '  TB_PEDIDO_ITEM.COD_PRODUTO'
      '')
    Variables.Data = {
      03000000010000000D0000003A434F445F454D42415251554501000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000030000000B000000434F445F50524F4455544F010000000000070000
      0051545F4954454D0100000000000C000000444553435F50524F4455544F0100
      00000000}
    Session = DMOracle.DBCemapa
    OnCalcFields = QRRelacaoProducaoCalcFields
    Left = 768
    Top = 432
    object QRRelacaoProducaoQtdePedidoCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
    end
    object QRRelacaoProducaoQtdePedidoDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 200
    end
    object QRRelacaoProducaoQtdePedidoQT_ITEM: TFloatField
      FieldName = 'QT_ITEM'
    end
  end
  object QCaixaEmbarque: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_CAIXA_MOV.*'
      'FROM'
      '  TB_CAIXA_MOV'
      ''
      'where cod_embarque = :cod_embarque')
    Variables.Data = {
      03000000010000000D0000003A434F445F454D42415251554503000000000000
      0000000000}
    SequenceField.Field = 'COD_CAIXA_MOV'
    SequenceField.Sequence = 'SQCAIXA_MOV'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000001E0000000D000000434F445F43414958415F4D4F560100000000000B
      000000434F445F5553554152494F0100000000000A000000434F445F46494C49
      414C01000000000010000000434F445F444550415254414D454E544F01000000
      00000D000000434F445F484953544F5249434F0100000000000C00000044545F
      4D4F56494D454E544F0100000000000D00000056414C5F4D4F56494D454E544F
      0100000000000C000000444553435F484F524152494F0100000000000C000000
      434F445F434144415354524F0100000000000C000000434F445F4E4F54415F43
      414201000000000015000000434F445F434F4E54415F524543454245525F4341
      4201000000000013000000434F445F434F4E54415F50414741525F4341420100
      000000000A00000044545F5553554152494F0100000000001000000044455343
      5F434F4D504C454D454E544F01000000000010000000434F445F434F4E545241
      544F5F4D4F5601000000000011000000434F445F42434F5F4D4F56494D454E54
      4F01000000000011000000444553435F434F4D504C454D454E544F3101000000
      00000E000000434F445F50454449444F5F43414201000000000014000000434F
      445F4F5244454D5F434F4D5052415F4341420100000000000F000000434F445F
      4F464943494E415F434142010000000000060000004E554D5F4F530100000000
      00070000004E554D5F444F430100000000000D0000004E554D5F444F43554D45
      4E544F01000000000010000000434F445F434F4E484543494D454E544F010000
      0000000A000000434F445F494D4F56454C01000000000016000000494E445F44
      4553434F4E54415F4C4F4341544152494F01000000000010000000434F445F41
      4449414E54414D454E544F01000000000010000000434F445F56414C455F5052
      4F4455544F01000000000011000000434F445F434F4E545241544F5F4F425241
      0100000000000C000000434F445F454D424152515545010000000000}
    Master = QEmbarque
    MasterFields = 'COD_EMBARQUE'
    DetailFields = 'COD_EMBARQUE'
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    BeforePost = QCaixaEmbarqueBeforePost
    Left = 768
    Top = 480
    object QCaixaEmbarqueCOD_CAIXA_MOV: TIntegerField
      FieldName = 'COD_CAIXA_MOV'
      Required = True
    end
    object QCaixaEmbarqueCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
    object QCaixaEmbarqueCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
    end
    object QCaixaEmbarqueCOD_DEPARTAMENTO: TIntegerField
      FieldName = 'COD_DEPARTAMENTO'
      Required = True
    end
    object QCaixaEmbarqueCOD_HISTORICO: TIntegerField
      FieldName = 'COD_HISTORICO'
      Required = True
    end
    object QCaixaEmbarqueDT_MOVIMENTO: TDateTimeField
      FieldName = 'DT_MOVIMENTO'
      Required = True
    end
    object QCaixaEmbarqueVAL_MOVIMENTO: TFloatField
      FieldName = 'VAL_MOVIMENTO'
      Required = True
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object QCaixaEmbarqueDESC_HORARIO: TStringField
      FieldName = 'DESC_HORARIO'
      Size = 8
    end
    object QCaixaEmbarqueCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
    end
    object QCaixaEmbarqueCOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
    end
    object QCaixaEmbarqueCOD_CONTA_RECEBER_CAB: TIntegerField
      FieldName = 'COD_CONTA_RECEBER_CAB'
    end
    object QCaixaEmbarqueCOD_CONTA_PAGAR_CAB: TIntegerField
      FieldName = 'COD_CONTA_PAGAR_CAB'
    end
    object QCaixaEmbarqueDT_USUARIO: TDateTimeField
      FieldName = 'DT_USUARIO'
      Required = True
    end
    object QCaixaEmbarqueDESC_COMPLEMENTO: TStringField
      FieldName = 'DESC_COMPLEMENTO'
      Size = 50
    end
    object QCaixaEmbarqueCOD_CONTRATO_MOV: TIntegerField
      FieldName = 'COD_CONTRATO_MOV'
    end
    object QCaixaEmbarqueCOD_BCO_MOVIMENTO: TIntegerField
      FieldName = 'COD_BCO_MOVIMENTO'
    end
    object QCaixaEmbarqueDESC_COMPLEMENTO1: TStringField
      FieldName = 'DESC_COMPLEMENTO1'
      Size = 100
    end
    object QCaixaEmbarqueCOD_PEDIDO_CAB: TIntegerField
      FieldName = 'COD_PEDIDO_CAB'
    end
    object QCaixaEmbarqueCOD_ORDEM_COMPRA_CAB: TIntegerField
      FieldName = 'COD_ORDEM_COMPRA_CAB'
    end
    object QCaixaEmbarqueCOD_OFICINA_CAB: TIntegerField
      FieldName = 'COD_OFICINA_CAB'
    end
    object QCaixaEmbarqueNUM_OS: TIntegerField
      FieldName = 'NUM_OS'
    end
    object QCaixaEmbarqueNUM_DOC: TIntegerField
      FieldName = 'NUM_DOC'
    end
    object QCaixaEmbarqueNUM_DOCUMENTO: TFloatField
      FieldName = 'NUM_DOCUMENTO'
    end
    object QCaixaEmbarqueCOD_CONHECIMENTO: TIntegerField
      FieldName = 'COD_CONHECIMENTO'
    end
    object QCaixaEmbarqueCOD_IMOVEL: TIntegerField
      FieldName = 'COD_IMOVEL'
    end
    object QCaixaEmbarqueIND_DESCONTA_LOCATARIO: TStringField
      FieldName = 'IND_DESCONTA_LOCATARIO'
      Size = 1
    end
    object QCaixaEmbarqueCOD_ADIANTAMENTO: TIntegerField
      FieldName = 'COD_ADIANTAMENTO'
    end
    object QCaixaEmbarqueCOD_VALE_PRODUTO: TIntegerField
      FieldName = 'COD_VALE_PRODUTO'
    end
    object QCaixaEmbarqueCOD_CONTRATO_OBRA: TIntegerField
      FieldName = 'COD_CONTRATO_OBRA'
    end
    object QCaixaEmbarqueCOD_EMBARQUE: TIntegerField
      FieldName = 'COD_EMBARQUE'
    end
  end
  object QREmbarquePesoCidade: TOracleDataSet1
    SQL.Strings = (
      'select'
      '  DESC_CIDADE, '
      '  SUM(NUM_PESO_BRUTO) as NUM_PESO_BRUTO'
      ' from('
      'select'
      '   TB_CADASTRO.DESC_CIDADE,'
      
        '  TB_PRODUTO.NUM_PESO_BRUTO * (TB_PEDIDO_ITEM.QT_PEDIDO) as NUM_' +
        'PESO_BRUTO'
      'from'
      '  TB_EMBARQUE,'
      '  TB_EMBARQUE_ITEM,'
      '  TB_PEDIDO_CAB,'
      '  TB_PEDIDO_ITEM,'
      '  TB_CADASTRO,'
      '  TB_PRODUTO'
      'where'
      '  TB_EMBARQUE_ITEM.COD_EMBARQUE = TB_EMBARQUE.COD_EMBARQUE'
      '  and'
      '  TB_EMBARQUE_ITEM.COD_PEDIDO_CAB = TB_PEDIDO_CAB.COD_PEDIDO_CAB'
      '  and'
      '  TB_PEDIDO_CAB.COD_PEDIDO_CAB = TB_PEDIDO_ITEM.COD_PEDIDO_CAB'
      '  and'
      '  TB_PEDIDO_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
      '  and'
      '  TB_PEDIDO_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '  and'
      '  (:EMBARQUE = TB_EMBARQUE.COD_EMBARQUE)  '
      ') group by DESC_CIDADE'
      'ORDER BY DESC_CIDADE')
    Variables.Data = {
      0300000001000000090000003A454D4241525155450300000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      04000000020000000B000000444553435F4349444144450100000000000E0000
      004E554D5F5045534F5F425255544F010000000000}
    Session = DMOracle.DBCemapa
    Left = 833
    Top = 208
    object QREmbarquePesoCidadeDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      Size = 30
    end
    object QREmbarquePesoCidadeNUM_PESO_BRUTO: TFloatField
      FieldName = 'NUM_PESO_BRUTO'
      DisplayFormat = '###,###,##0.00'
    end
  end
end
