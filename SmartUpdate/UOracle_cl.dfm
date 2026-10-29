object DMOracle: TDMOracle
  OldCreateOrder = False
  Left = 477
  Top = 274
  Height = 268
  Width = 404
  object conOracle: TOracleSession
    LogonUsername = 'sistema'
    LogonPassword = 'karitec'
    LogonDatabase = 'ORA'
    Left = 35
    Top = 9
  end
  object QOrdemServicoCab: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      ' OS.ROWID,'
      ' OS.COD_ORDEM_SERVICO_CAB,'
      ' OS.DESC_EQUIPAMENTO,'
      ' OS.IND_NIR_SYNC_SITE,'
      ' OS.DT_ENTRADA,'
      ' OS.DESC_SOLICITACAO,'
      ' OS.DT_SAIDA,'
      ' OS.DESC_OBS,'
      ' OS.DT_ENTRADA_MANUTENCAO,'
      ' OS.DT_SAIDA_MANUTENCAO,'
      ' VEN.NOME AS TECNICO,'
      ' CAD.NOME AS CLIENTE,'
      ' CAD.NUM_CGC_CPF AS CPF'
      'FROM'
      '  TB_ORDEM_SERVICO_CAB OS,'
      '  TB_CADASTRO CAD,'
      '  TB_VENDEDOR VEN'
      'WHERE'
      '  OS.COD_CADASTRO = CAD.COD_CADASTRO'
      'AND'
      '  VEN.COD_VENDEDOR = OS.COD_TECNICO'
      'AND'
      '  OS.IND_NIR_SYNC_SITE = '#39'N'#39
      'AND'
      '  ROWNUM <= 100'
      'ORDER BY'
      '  OS.COD_ORDEM_SERVICO_CAB ASC')
    QBEDefinition.QBEFieldDefs = {
      040000000C00000015000000434F445F4F5244454D5F5345525649434F5F4341
      4201000000000010000000444553435F4551554950414D454E544F0100000000
      0011000000494E445F4E49525F53594E435F534954450100000000000A000000
      44545F454E545241444101000000000010000000444553435F534F4C49434954
      4143414F0100000000000800000044545F534149444101000000000007000000
      5445434E49434F01000000000007000000434C49454E54450100000000000300
      000043504601000000000008000000444553435F4F4253000000000000150000
      0044545F454E54524144415F4D414E5554454E43414F01000000000013000000
      44545F53414944415F4D414E5554454E43414F010000000000}
    Session = conOracle
    Left = 120
    Top = 8
    object QOrdemServicoCabCOD_ORDEM_SERVICO_CAB: TIntegerField
      FieldName = 'COD_ORDEM_SERVICO_CAB'
      Required = True
    end
    object QOrdemServicoCabDESC_EQUIPAMENTO: TStringField
      FieldName = 'DESC_EQUIPAMENTO'
      Required = True
      Size = 300
    end
    object QOrdemServicoCabIND_NIR_SYNC_SITE: TStringField
      FieldName = 'IND_NIR_SYNC_SITE'
      Size = 2
    end
    object QOrdemServicoCabDT_ENTRADA: TDateTimeField
      FieldName = 'DT_ENTRADA'
      Required = True
    end
    object QOrdemServicoCabDESC_SOLICITACAO: TStringField
      FieldName = 'DESC_SOLICITACAO'
      Required = True
      Size = 1000
    end
    object QOrdemServicoCabDT_SAIDA: TDateTimeField
      FieldName = 'DT_SAIDA'
    end
    object QOrdemServicoCabTECNICO: TStringField
      FieldName = 'TECNICO'
      Required = True
      Size = 40
    end
    object QOrdemServicoCabCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Required = True
      Size = 60
    end
    object QOrdemServicoCabCPF: TStringField
      FieldName = 'CPF'
      Size = 18
    end
    object QOrdemServicoCabDESC_OBS: TMemoField
      FieldName = 'DESC_OBS'
      BlobType = ftMemo
    end
    object QOrdemServicoCabDT_ENTRADA_MANUTENCAO: TDateTimeField
      FieldName = 'DT_ENTRADA_MANUTENCAO'
    end
    object QOrdemServicoCabDT_SAIDA_MANUTENCAO: TDateTimeField
      FieldName = 'DT_SAIDA_MANUTENCAO'
    end
  end
  object QProduto: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  P.ROWID,'
      '  P.COD_PRODUTO,'
      '  P.DESC_PRODUTO,'
      '  NVL(P.VAL_VAREJO, 0) AS VAL_VAREJO,'
      '  NVL(E.QT_QUANTIDADE, 0) AS QT_QUANTIDADE,'
      '  P.IND_NIR_SYNC_SITE,'
      '  P.DT_ALTERACAO_PRECO'
      'FROM'
      ' TB_PRODUTO P,'
      '  TB_ESTOQUE E'
      'WHERE'
      '  E.COD_PRODUTO = P.COD_PRODUTO'
      'AND'
      '  (E.COD_FILIAL = 1 or'
      '  E.COD_FILIAL = 3)'
      'AND'
      '  E.COD_LOTE_TIPO = 1'
      'AND'
      '  P.VAL_VAREJO > 0'
      'AND'
      '  P.IND_NIR_SYNC_SITE = '#39'N'#39
      'AND'
      '  ROWNUM <= 100'
      'ORDER BY'
      '  P.COD_PRODUTO'
      '')
    QBEDefinition.QBEFieldDefs = {
      04000000060000000B000000434F445F50524F4455544F0100000000000C0000
      00444553435F50524F4455544F0100000000000A00000056414C5F564152454A
      4F0100000000000D00000051545F5155414E5449444144450100000000001100
      0000494E445F4E49525F53594E435F534954450100000000001200000044545F
      414C5445524143414F5F505245434F010000000000}
    Session = conOracle
    Left = 208
    Top = 8
    object QProdutoCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QProdutoDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 200
    end
    object QProdutoVAL_VAREJO: TFloatField
      FieldName = 'VAL_VAREJO'
    end
    object QProdutoQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
    end
    object QProdutoIND_NIR_SYNC_SITE: TStringField
      FieldName = 'IND_NIR_SYNC_SITE'
      Size = 2
    end
    object QProdutoDT_ALTERACAO_PRECO: TDateTimeField
      FieldName = 'DT_ALTERACAO_PRECO'
    end
  end
  object QTriggers: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TRIGGER_NAME,'
      '  STATUS'
      'FROM'
      '  USER_TRIGGERS'
      'WHERE'
      
        '  TRIGGER_NAME IN ('#39'TRG_NIR_PRODUTO_A'#39','#39'TRG_NIR_PRODUTO_B'#39','#39'TRG_' +
        'NIR_ORDEM_SERVICO_A'#39') ')
    QBEDefinition.QBEFieldDefs = {
      04000000020000000C000000545249474745525F4E414D450100000000000600
      0000535441545553010000000000}
    Session = conOracle
    Left = 35
    Top = 64
    object QTriggersTRIGGER_NAME: TStringField
      FieldName = 'TRIGGER_NAME'
      Size = 30
    end
    object QTriggersSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 8
    end
  end
  object QTriggerOS: TOracleDataSet1
    SQL.Strings = (
      'create or replace'
      'TRIGGER "SISTEMA"."TRG_NIR_ORDEM_SERVICO_A" '
      
        'BEFORE UPDATE OF COD_CADASTRO,DESC_EQUIPAMENTO,DT_ENTRADA,DESC_S' +
        'OLICITACAO,DT_SAIDA,COD_TECNICO,DT_SAIDA_MANUTENCAO,DT_ENTRADA_M' +
        'ANUTENCAO ON TB_ORDEM_SERVICO_CAB '
      'FOR EACH ROW'
      'DECLARE'
      
        '/***************************************************************' +
        '*'
      '*CRIADO POR   : GIANCARLO VISENTIN'
      '*DATA         : 27/07/2017'
      '*ALTERADO POR : '
      '*DATA         : '
      
        '*DESCRICAO    : ATUALIZA O CAMPO IND_NIR_SYNC_SITE DA TB_ORDEM_S' +
        'ERVICO_CAB,'
      '                PARA SINCRONIZAR COM O SITE ATRAVES DO PROGRAMA'
      '                SMARTUPDATE RODANDO NO SERVIDOR'
      '*OBS.         :'
      
        '****************************************************************' +
        '*/'
      'BEGIN'
      ''
      '  :NEW.IND_NIR_SYNC_SITE := '#39'N'#39';'
      'END;')
    QBEDefinition.QBEFieldDefs = {
      04000000020000000C000000545249474745525F4E414D450100000000000600
      0000535441545553010000000000}
    Session = conOracle
    Left = 120
    Top = 63
  end
  object QTriggerProdutoA: TOracleDataSet1
    SQL.Strings = (
      'create or replace'
      'TRIGGER "SISTEMA"."TRG_NIR_PRODUTO_A" '
      'BEFORE UPDATE OF VAL_VAREJO ON TB_PRODUTO'
      'FOR EACH ROW'
      'DECLARE'
      
        '/***************************************************************' +
        '*'
      '*CRIADO POR   : GIANCARLO VISENTIN'
      '*DATA         : 27/07/2017'
      '*ALTERADO POR : '
      '*DATA         : '
      
        '*DESCRICAO    : ATUALIZA O CAMPO IND_NIR_SYNC_SITE DA TB_PRODUTO' +
        ','
      '                PARA SINCRONIZAR COM O SITE ATRAVES DO PROGRAMA'
      '                SMARTUPDATE RODANDO NO SERVIDOR'
      '*OBS.         :'
      
        '****************************************************************' +
        '*/'
      'BEGIN'
      '  :NEW.IND_NIR_SYNC_SITE := '#39'N'#39';'
      'END;')
    QBEDefinition.QBEFieldDefs = {
      04000000020000000C000000545249474745525F4E414D450100000000000600
      0000535441545553010000000000}
    Session = conOracle
    Left = 208
    Top = 63
  end
  object QTriggerProdutoB: TOracleDataSet1
    SQL.Strings = (
      'create or replace'
      'TRIGGER "SISTEMA"."TRG_NIR_PRODUTO_B" '
      'BEFORE UPDATE OF QT_QUANTIDADE ON TB_ESTOQUE'
      'FOR EACH ROW'
      'DECLARE'
      
        '/***************************************************************' +
        '*'
      '*CRIADO POR   : GIANCARLO VISENTIN'
      '*DATA         : 27/07/2017'
      '*ALTERADO POR : '
      '*DATA         : '
      
        '*DESCRICAO    : ATUALIZA O CAMPO IND_NIR_SYNC_SITE DA TB_PRODUTO' +
        ','
      '                PARA SINCRONIZAR COM O SITE ATRAVES DO PROGRAMA'
      '                SMARTUPDATE RODANDO NO SERVIDOR'
      '*OBS.         :'
      
        '****************************************************************' +
        '*/'
      'BEGIN'
      '  UPDATE TB_PRODUTO'
      '  SET TB_PRODUTO.IND_NIR_SYNC_SITE = '#39'N'#39
      '  WHERE'
      '  COD_PRODUTO = :NEW.COD_PRODUTO;'
      'END;')
    QBEDefinition.QBEFieldDefs = {
      04000000020000000C000000545249474745525F4E414D450100000000000600
      0000535441545553010000000000}
    Session = conOracle
    Left = 307
    Top = 62
  end
end
