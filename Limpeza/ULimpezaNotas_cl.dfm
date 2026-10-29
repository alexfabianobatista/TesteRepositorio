object DMLimpezaNotas: TDMLimpezaNotas
  OldCreateOrder = False
  Left = 562
  Top = 72
  Height = 591
  Width = 639
  object QLimpezaNotaCab: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Rowid,'
      '  Cod_Nota_Cab,'
      '  Ind_Entrada_Saida,'
      '  Ind_Condicao_Pagto'
      'From'
      '  Tb_Nota_Cab'
      'Where'
      '  Dt_Recebimento >= :Dt_Inicial'
      '  And'
      '  Dt_Recebimento <= :Dt_Final'
      '  And'
      '  Cod_Operacao = :Cod_Operacao'
      '  And'
      '  (:Cod_Filial is Null'
      '   Or'
      '    COD_FILIAL = :COD_FILIAL)'
      '  AND'
      '  (:IND_PAGAMENTO IS NULL'
      '   OR'
      '    IND_CONDICAO_PAGTO = :IND_PAGAMENTO)'
      '  AND'
      '  (:COD_CADASTRO IS NULL'
      '   OR '
      '     COD_CADASTRO = :COD_CADASTRO)')
    Variables.Data = {
      03000000060000000B0000003A44545F494E494349414C0C0000000000000000
      000000090000003A44545F46494E414C0C00000000000000000000000D000000
      3A434F445F4F5045524143414F0300000000000000000000000B0000003A434F
      445F46494C49414C0300000000000000000000000E0000003A494E445F504147
      414D454E544F0300000000000000000000000D0000003A434F445F4341444153
      54524F030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000030000000C000000434F445F4E4F54415F4341420100000000001100
      0000494E445F454E54524144415F534149444101000000000012000000494E44
      5F434F4E444943414F5F504147544F010000000000}
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 48
    Top = 24
    object QLimpezaNotaCabCOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
      Required = True
    end
    object QLimpezaNotaCabIND_ENTRADA_SAIDA: TStringField
      FieldName = 'IND_ENTRADA_SAIDA'
      Size = 1
    end
    object QLimpezaNotaCabIND_CONDICAO_PAGTO: TStringField
      FieldName = 'IND_CONDICAO_PAGTO'
      Required = True
      Size = 1
    end
  end
  object QLimpezaNotaItem: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Rowid,'
      '  Cod_nota_cab,'
      '  Cod_nota_item'
      'From'
      '  Tb_Nota_item'
      'where cod_nota_cab = :cod_nota_cab')
    Variables.Data = {
      03000000010000000D0000003A434F445F4E4F54415F43414203000000000000
      0000000000}
    Master = QLimpezaNotaCab
    MasterFields = 'COD_NOTA_CAB'
    DetailFields = 'COD_NOTA_CAB'
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 48
    Top = 96
  end
  object QContaReceberCab: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Rowid,'
      '  Cod_Conta_Receber_Cab'
      'From'
      '  Tb_Conta_Receber_Cab'
      'where cod_nota_cab = :cod_nota_cab')
    Variables.Data = {
      03000000010000000D0000003A434F445F4E4F54415F43414203000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000100000015000000434F445F434F4E54415F524543454245525F4341
      42010000000000}
    Master = QLimpezaNotaCab
    MasterFields = 'COD_NOTA_CAB'
    DetailFields = 'COD_NOTA_CAB'
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 216
    Top = 24
    object QContaReceberCabCOD_CONTA_RECEBER_CAB: TIntegerField
      FieldName = 'COD_CONTA_RECEBER_CAB'
      Required = True
    end
  end
  object QContaReceberMov: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Rowid,'
      '  Cod_Conta_Receber_Mov,'
      '  Cod_Caixa_Mov,'
      '  Cod_Bco_Movimento'
      'From'
      '  Tb_Conta_Receber_Mov'
      'where cod_conta_receber_cab = :cod_conta_receber_cab')
    Variables.Data = {
      0300000001000000160000003A434F445F434F4E54415F524543454245525F43
      4142030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000300000015000000434F445F434F4E54415F524543454245525F4D4F
      560100000000000D000000434F445F43414958415F4D4F560100000000001100
      0000434F445F42434F5F4D4F56494D454E544F010000000000}
    Master = QContaReceberCab
    MasterFields = 'COD_CONTA_RECEBER_CAB'
    DetailFields = 'COD_CONTA_RECEBER_CAB'
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 216
    Top = 88
    object QContaReceberMovCOD_CONTA_RECEBER_MOV: TIntegerField
      FieldName = 'COD_CONTA_RECEBER_MOV'
      Required = True
    end
    object QContaReceberMovCOD_CAIXA_MOV: TIntegerField
      FieldName = 'COD_CAIXA_MOV'
    end
    object QContaReceberMovCOD_BCO_MOVIMENTO: TIntegerField
      FieldName = 'COD_BCO_MOVIMENTO'
    end
  end
  object QCaixa_Mov_CR: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Rowid,'
      '  Cod_Caixa_mov'
      'From'
      '  Tb_Caixa_Mov'
      'Where'
      '  Cod_Caixa_Mov = :Cod_Caixa_Mov')
    Variables.Data = {
      03000000010000000E0000003A434F445F43414958415F4D4F56030000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {04000000010000000D000000434F445F43414958415F4D4F56010000000000}
    Master = QContaReceberMov
    MasterFields = 'Cod_Caixa_mov'
    DetailFields = 'Cod_Caixa_mov'
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 216
    Top = 152
    object QCaixa_Mov_CRCOD_CAIXA_MOV: TIntegerField
      FieldName = 'COD_CAIXA_MOV'
      Required = True
    end
  end
  object QBanco_Mov_CR: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Rowid,'
      '  Cod_Bco_Movimento'
      'From'
      '  Tb_Bco_Movimento'
      'Where'
      '  Cod_Bco_Movimento = :Cod_Bco_Movimento')
    Variables.Data = {
      0300000001000000120000003A434F445F42434F5F4D4F56494D454E544F0300
      00000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000100000011000000434F445F42434F5F4D4F56494D454E544F010000
      000000}
    Master = QContaReceberMov
    MasterFields = 'Cod_Bco_Movimento'
    DetailFields = 'Cod_Bco_Movimento'
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 216
    Top = 216
    object QBanco_Mov_CRCOD_BCO_MOVIMENTO: TIntegerField
      FieldName = 'COD_BCO_MOVIMENTO'
      Required = True
    end
  end
  object QCaixaNotaCab: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Rowid,'
      '  Cod_Caixa_Mov'
      'From'
      '  Tb_Caixa_mov'
      'where cod_nota_cab = :cod_nota_cab')
    Variables.Data = {
      03000000010000000D0000003A434F445F4E4F54415F43414203000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {04000000010000000D000000434F445F43414958415F4D4F56010000000000}
    Master = QLimpezaNotaCab
    MasterFields = 'COD_NOTA_CAB'
    DetailFields = 'COD_NOTA_CAB'
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 48
    Top = 168
    object QCaixaNotaCabCOD_CAIXA_MOV: TIntegerField
      FieldName = 'COD_CAIXA_MOV'
      Required = True
    end
  end
  object QBaixaPedido_Item: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  ROWID,'
      '  Cod_Nota_Item'
      'From'
      '  Tb_Baixa_Pedido'
      'where cod_nota_item = :cod_nota_item')
    Variables.Data = {
      03000000010000000E0000003A434F445F4E4F54415F4954454D030000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {04000000010000000D000000434F445F4E4F54415F4954454D010000000000}
    Master = QLimpezaNotaItem
    MasterFields = 'COD_NOTA_ITEM'
    DetailFields = 'COD_NOTA_ITEM'
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 48
    Top = 240
    object QBaixaPedido_ItemCOD_NOTA_ITEM: TIntegerField
      FieldName = 'COD_NOTA_ITEM'
      Required = True
    end
  end
  object QContaPagarCab: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Rowid,'
      '  Cod_Conta_Pagar_Cab'
      'From'
      '  Tb_Conta_Pagar_Cab'
      'where cod_nota_cab = :cod_nota_cab')
    Variables.Data = {
      03000000010000000D0000003A434F445F4E4F54415F43414203000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000100000013000000434F445F434F4E54415F50414741525F43414201
      0000000000}
    Master = QLimpezaNotaCab
    MasterFields = 'COD_NOTA_CAB'
    DetailFields = 'COD_NOTA_CAB'
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 368
    Top = 24
    object QContaPagarCabCOD_CONTA_PAGAR_CAB: TIntegerField
      FieldName = 'COD_CONTA_PAGAR_CAB'
      Required = True
    end
  end
  object QContaPagarMov: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Rowid,'
      '  Cod_Conta_Pagar_Mov,'
      '  Cod_Caixa_Mov,'
      '  Cod_Bco_Movimento'
      'From'
      '  Tb_Conta_Pagar_Mov'
      'where cod_conta_pagar_cab = :cod_conta_pagar_cab')
    Variables.Data = {
      0300000001000000140000003A434F445F434F4E54415F50414741525F434142
      030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000030000000D000000434F445F43414958415F4D4F5601000000000011
      000000434F445F42434F5F4D4F56494D454E544F01000000000013000000434F
      445F434F4E54415F50414741525F4D4F56010000000000}
    Master = QContaPagarCab
    MasterFields = 'COD_CONTA_PAGAR_CAB'
    DetailFields = 'COD_CONTA_PAGAR_CAB'
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 368
    Top = 88
    object IntegerField2: TIntegerField
      FieldName = 'COD_CAIXA_MOV'
    end
    object IntegerField3: TIntegerField
      FieldName = 'COD_BCO_MOVIMENTO'
    end
    object QContaPagarMovCOD_CONTA_PAGAR_MOV: TIntegerField
      FieldName = 'COD_CONTA_PAGAR_MOV'
      Required = True
    end
  end
  object QCaixa_Mov_CP: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Rowid,'
      '  Cod_Caixa_mov'
      'From'
      '  Tb_Caixa_Mov'
      'Where'
      '  Cod_Caixa_Mov = :Cod_Caixa_Mov')
    Variables.Data = {
      03000000010000000E0000003A434F445F43414958415F4D4F56030000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {04000000010000000D000000434F445F43414958415F4D4F56010000000000}
    Master = QContaPagarMov
    MasterFields = 'Cod_Caixa_mov'
    DetailFields = 'Cod_Caixa_mov'
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 368
    Top = 152
    object IntegerField4: TIntegerField
      FieldName = 'COD_CAIXA_MOV'
      Required = True
    end
  end
  object QBanco_Mov_Cp: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Rowid,'
      '  Cod_Bco_Movimento'
      'From'
      '  Tb_Bco_Movimento'
      'Where'
      '  Cod_Bco_Movimento = :Cod_Bco_Movimento')
    Variables.Data = {
      0300000001000000120000003A434F445F42434F5F4D4F56494D454E544F0300
      00000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000100000011000000434F445F42434F5F4D4F56494D454E544F010000
      000000}
    Master = QContaPagarMov
    MasterFields = 'cod_bco_movimento'
    DetailFields = 'cod_bco_movimento'
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 368
    Top = 216
    object IntegerField5: TIntegerField
      FieldName = 'COD_BCO_MOVIMENTO'
      Required = True
    end
  end
  object QBaixaOC: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  ROWID,'
      '  Cod_Nota_Item'
      'From'
      '  Tb_Baixa_OC'
      'where cod_nota_item = :cod_nota_item')
    Variables.Data = {
      03000000010000000E0000003A434F445F4E4F54415F4954454D030000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {04000000010000000D000000434F445F4E4F54415F4954454D010000000000}
    Master = QLimpezaNotaItem
    MasterFields = 'COD_NOTA_ITEM'
    DetailFields = 'COD_NOTA_ITEM'
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 48
    Top = 304
    object QBaixaOCCOD_NOTA_ITEM: TIntegerField
      FieldName = 'COD_NOTA_ITEM'
      Required = True
    end
  end
  object QLimpezaCaixa_Banco_CP: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Rowid,'
      '  Cod_Caixa_Mov'
      'From'
      '  Tb_Caixa_Mov'
      'where cod_bco_movimento = :cod_bco_movimento')
    Variables.Data = {
      0300000001000000120000003A434F445F42434F5F4D4F56494D454E544F0300
      00000000000000000000}
    QBEDefinition.QBEFieldDefs = {04000000010000000D000000434F445F43414958415F4D4F56010000000000}
    Master = QBanco_Mov_Cp
    MasterFields = 'COD_BCO_MOVIMENTO'
    DetailFields = 'COD_BCO_MOVIMENTO'
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 375
    Top = 280
    object IntegerField9: TIntegerField
      FieldName = 'COD_CAIXA_MOV'
      Required = True
    end
  end
  object QLimpezaCaixa_Banco_CR: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Rowid,'
      '  Cod_Caixa_Mov'
      'From'
      '  Tb_Caixa_Mov'
      'where cod_bco_movimento = :cod_bco_movimento')
    Variables.Data = {
      0300000001000000120000003A434F445F42434F5F4D4F56494D454E544F0300
      00000000000000000000}
    QBEDefinition.QBEFieldDefs = {04000000010000000D000000434F445F43414958415F4D4F56010000000000}
    Master = QBanco_Mov_CR
    MasterFields = 'COD_BCO_MOVIMENTO'
    DetailFields = 'COD_BCO_MOVIMENTO'
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 223
    Top = 280
    object IntegerField1: TIntegerField
      FieldName = 'COD_CAIXA_MOV'
      Required = True
    end
  end
  object QNome_Nota: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Rowid,'
      '  cod_nota_cab,'
      '  nome'
      'From'
      '  tb_nome_nota'
      'where cod_nota_cab = :cod_nota_cab')
    Variables.Data = {
      03000000010000000D0000003A434F445F4E4F54415F43414203000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000020000000C000000434F445F4E4F54415F4341420100000000000400
      00004E4F4D45010000000000}
    Master = QLimpezaNotaCab
    MasterFields = 'COD_NOTA_CAB'
    DetailFields = 'COD_NOTA_CAB'
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 48
    Top = 384
    object QNome_NotaCOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
      Required = True
    end
    object QNome_NotaNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 40
    end
  end
end
