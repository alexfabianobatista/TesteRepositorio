object DMMysql: TDMMysql
  OldCreateOrder = False
  Left = 365
  Top = 170
  Height = 252
  Width = 392
  object conMysql: TZConnection
    ControlsCodePage = cGET_ACP
    AutoEncodeStrings = False
    HostName = 'cemapadb.mysql.dbaas.com.br'
    Port = 0
    Database = 'cemapadb'
    User = 'cemapadb'
    Password = 'n1rc3m@p4'
    Protocol = 'mysql-5'
    Left = 24
    Top = 8
  end
  object QUpdateMysqlOS: TZQuery
    Connection = conMysql
    Params = <>
    Left = 96
    Top = 8
  end
  object QUpdateMysqlProduto: TZQuery
    Connection = conMysql
    Params = <>
    Left = 222
    Top = 8
  end
  object CdsUpdatedMysqlOS: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 96
    Top = 64
    Data = {
      280100009619E0BD010000001800000008000000000003000000280115434F44
      5F4F5244454D5F5345525649434F5F4341420100490000000100055749445448
      02000200140010444553435F4551554950414D454E544F010049000000010005
      574944544802000200140011494E445F4E49525F53594E435F53495445010049
      00000001000557494454480200020014000A44545F454E545241444101004900
      0000010005574944544802000200140010444553435F534F4C49434954414341
      4F01004900000001000557494454480200020014000844545F53414944410100
      490000000100055749445448020002001400075445434E49434F010049000000
      010005574944544802000200140007434C49454E544501004900000001000557
      494454480200020014000000}
    object CdsUpdatedMysqlOSCOD_ORDEM_SERVICO_CAB: TStringField
      FieldName = 'COD_ORDEM_SERVICO_CAB'
    end
    object CdsUpdatedMysqlOSDESC_EQUIPAMENTO: TStringField
      FieldName = 'DESC_EQUIPAMENTO'
    end
    object CdsUpdatedMysqlOSIND_NIR_SYNC_SITE: TStringField
      FieldName = 'IND_NIR_SYNC_SITE'
    end
    object CdsUpdatedMysqlOSDT_ENTRADA: TStringField
      FieldName = 'DT_ENTRADA'
    end
    object CdsUpdatedMysqlOSDESC_SOLICITACAO: TStringField
      FieldName = 'DESC_SOLICITACAO'
    end
    object CdsUpdatedMysqlOSDT_SAIDA: TStringField
      FieldName = 'DT_SAIDA'
    end
    object CdsUpdatedMysqlOSTECNICO: TStringField
      FieldName = 'TECNICO'
    end
    object CdsUpdatedMysqlOSCLIENTE: TStringField
      FieldName = 'CLIENTE'
    end
  end
  object CdsUpdatedMysqlProduto: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 64
    Data = {
      E90000009619E0BD010000001800000006000000000003000000E9000B434F44
      5F50524F4455544F01004900000001000557494454480200020014000C444553
      435F50524F4455544F01004900000001000557494454480200020014000A5641
      4C5F564152454A4F01004900000001000557494454480200020014000D51545F
      5155414E54494441444501004900000001000557494454480200020014001149
      4E445F4E49525F53594E435F5349544501004900000001000557494454480200
      020014001244545F414C5445524143414F5F505245434F010049000000010005
      57494454480200020014000000}
    object CdsUpdatedMysqlProdutoCOD_PRODUTO: TStringField
      FieldName = 'COD_PRODUTO'
    end
    object CdsUpdatedMysqlProdutoDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
    end
    object CdsUpdatedMysqlProdutoVAL_VAREJO: TStringField
      FieldName = 'VAL_VAREJO'
    end
    object CdsUpdatedMysqlProdutoQT_QUANTIDADE: TStringField
      FieldName = 'QT_QUANTIDADE'
    end
    object CdsUpdatedMysqlProdutoIND_NIR_SYNC_SITE: TStringField
      FieldName = 'IND_NIR_SYNC_SITE'
    end
    object CdsUpdatedMysqlProdutoDT_ALTERACAO_PRECO: TStringField
      FieldName = 'DT_ALTERACAO_PRECO'
    end
  end
end
