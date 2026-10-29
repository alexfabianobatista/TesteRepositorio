object DMControleTrem: TDMControleTrem
  OldCreateOrder = False
  Left = 471
  Top = 209
  Height = 290
  Width = 318
  object QControleTremCad: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_CONTROLE_TREM.COD_CONTROLE_TREM,'
      '  TB_CONTROLE_TREM.DT_CONTROLE,'
      '  TB_CONTROLE_TREM.DESC_REMETENTE,'
      '  TB_CONTROLE_TREM.DESC_DESTINATARIO,'
      '  TB_CONTROLE_TREM.NUM_VAGAO,'
      '  TB_CONTROLE_TREM.COD_NOTA_CAB,'
      '  TB_CONTROLE_TREM.COD_EMPRESA_A,'
      '  TB_CONTROLE_TREM.NUM_FATURA_A,'
      '  TB_CONTROLE_TREM.NUM_DESPACHO_A,'
      '  TB_CONTROLE_TREM.VAL_TON_A,'
      '  TB_CONTROLE_TREM.VAL_FRETE_A,'
      '  TB_CONTROLE_TREM.DT_PGTO_A,'
      '  TB_CONTROLE_TREM.COD_EMPRESA_B,'
      '  TB_CONTROLE_TREM.NUM_FATURA_B,'
      '  TB_CONTROLE_TREM.NUM_DESPACHO_B,'
      '  TB_CONTROLE_TREM.VAL_TON_B,'
      '  TB_CONTROLE_TREM.VAL_FRETE_B,'
      '  TB_CONTROLE_TREM.DT_PGTO_B,'
      '  TB_NOTA_ITEM.QT_QUANTIDADE AS PESO_SAIDA,'
      '  TB_NOTA_ITEM.QT_CHEGADA AS PESO_CHEGADA'
      'FROM'
      '  TB_CONTROLE_TREM,'
      '  TB_NOTA_ITEM'
      'WHERE'
      '  TB_CONTROLE_TREM.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_CAB'
      '  AND'
      '  COD_CONTROLE_TREM = :PK'
      'ORDER BY'
      '  COD_CONTROLE_TREM')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001400000011000000434F445F434F4E54524F4C455F5452454D010000
      0000000B00000044545F434F4E54524F4C450100000000000E00000044455343
      5F52454D4554454E544501000000000011000000444553435F44455354494E41
      544152494F010000000000090000004E554D5F564147414F0100000000000C00
      0000434F445F4E4F54415F4341420100000000000D000000434F445F454D5052
      4553415F410100000000000C0000004E554D5F4641545552415F410100000000
      000E0000004E554D5F444553504143484F5F410100000000000B00000056414C
      5F46524554455F410100000000000900000044545F5047544F5F410100000000
      000D000000434F445F454D50524553415F420100000000000C0000004E554D5F
      4641545552415F420100000000000E0000004E554D5F444553504143484F5F42
      0100000000000B00000056414C5F46524554455F420100000000000900000044
      545F5047544F5F420100000000000A0000005045534F5F534149444101000000
      00000C0000005045534F5F434845474144410100000000000900000056414C5F
      544F4E5F410100000000000900000056414C5F544F4E5F42010000000000}
    Session = DMOracle.DBCemapa
    Left = 48
    Top = 24
    object QControleTremCadCOD_CONTROLE_TREM: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_CONTROLE_TREM'
      Required = True
    end
    object QControleTremCadDT_CONTROLE: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DT_CONTROLE'
    end
    object QControleTremCadDESC_REMETENTE: TStringField
      DisplayLabel = 'Remetente'
      FieldName = 'DESC_REMETENTE'
      Size = 40
    end
    object QControleTremCadDESC_DESTINATARIO: TStringField
      DisplayLabel = 'Destinat'#225'rio'
      FieldName = 'DESC_DESTINATARIO'
      Size = 40
    end
    object QControleTremCadNUM_VAGAO: TIntegerField
      DisplayLabel = 'Vag'#227'o'
      FieldName = 'NUM_VAGAO'
    end
    object QControleTremCadCOD_NOTA_CAB: TIntegerField
      DisplayLabel = 'Notas'
      FieldName = 'COD_NOTA_CAB'
    end
    object QControleTremCadCOD_EMPRESA_A: TStringField
      DisplayLabel = 'Empresa A'
      FieldName = 'COD_EMPRESA_A'
      Size = 10
    end
    object QControleTremCadNUM_FATURA_A: TIntegerField
      DisplayLabel = 'Fatura'
      FieldName = 'NUM_FATURA_A'
    end
    object QControleTremCadNUM_DESPACHO_A: TIntegerField
      DisplayLabel = 'Despacho'
      FieldName = 'NUM_DESPACHO_A'
    end
    object QControleTremCadVAL_FRETE_A: TFloatField
      DisplayLabel = 'Valor Frete'
      FieldName = 'VAL_FRETE_A'
    end
    object QControleTremCadDT_PGTO_A: TDateTimeField
      DisplayLabel = 'Data Pgto'
      FieldName = 'DT_PGTO_A'
    end
    object QControleTremCadCOD_EMPRESA_B: TStringField
      DisplayLabel = 'Empresa B'
      FieldName = 'COD_EMPRESA_B'
      Size = 10
    end
    object QControleTremCadNUM_FATURA_B: TIntegerField
      DisplayLabel = 'Fatura'
      FieldName = 'NUM_FATURA_B'
    end
    object QControleTremCadVAL_FRETE_B: TFloatField
      DisplayLabel = 'Valor Frete'
      FieldName = 'VAL_FRETE_B'
    end
    object QControleTremCadDT_PGTO_B: TFloatField
      DisplayLabel = 'Data Pgto'
      FieldName = 'DT_PGTO_B'
    end
    object QControleTremCadPESO_SAIDA: TFloatField
      DisplayLabel = 'Peso Sa'#237'da'
      FieldName = 'PESO_SAIDA'
      Required = True
    end
    object QControleTremCadPESO_CHEGADA: TFloatField
      DisplayLabel = 'Peso Chegada'
      FieldName = 'PESO_CHEGADA'
    end
    object QControleTremCadNUM_DESPACHO_B: TIntegerField
      DisplayLabel = 'Despacho'
      FieldName = 'NUM_DESPACHO_B'
    end
    object QControleTremCadVAL_TON_A: TFloatField
      DisplayLabel = 'R$ p/ Tonelada'
      FieldName = 'VAL_TON_A'
    end
    object QControleTremCadVAL_TON_B: TFloatField
      DisplayLabel = 'R$ p/ Tonelada'
      FieldName = 'VAL_TON_B'
    end
  end
end
