object DMGuiaTransito: TDMGuiaTransito
  OldCreateOrder = False
  Left = 289
  Top = 171
  Height = 227
  Width = 359
  object QGuiaTransito_Cad: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Rowid,'
      '  Tb_Guia_Transito.*'
      'From'
      '  Tb_Guia_Transito'
      'Where'
      '  Cod_Guia_Transito = :Pk')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_GUIA_TRANSITO'
    SequenceField.Sequence = 'SQGUIATRANSITO'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000D00000011000000434F445F475549415F5452414E5349544F010000
      0000000C000000434F445F4E4F54415F43414201000000000012000000444553
      435F434F4E5349474E41544152494F01000000000009000000444553435F484F
      52410100000000000C000000444553435F44455354494E4F0100000000000A00
      0000444553435F4C4143524501000000000010000000444553435F54454D5045
      524154555241010000000000110000004E554D5F475549415F5452414E534954
      4F01000000000009000000434F445F53455249450100000000000A0000004454
      5F454D495353414F01000000000009000000444553435F4F4253310100000000
      0009000000444553435F4F42533201000000000009000000444553435F4F4253
      33010000000000}
    Session = DMOracle.DBCemapa
    AfterInsert = QGuiaTransito_CadAfterInsert
    Left = 48
    Top = 24
    object QGuiaTransito_CadCOD_GUIA_TRANSITO: TIntegerField
      FieldName = 'COD_GUIA_TRANSITO'
      Required = True
    end
    object QGuiaTransito_CadCOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
      Required = True
    end
    object QGuiaTransito_CadDESC_CONSIGNATARIO: TStringField
      FieldName = 'DESC_CONSIGNATARIO'
      Required = True
      Size = 40
    end
    object QGuiaTransito_CadDESC_HORA: TStringField
      FieldName = 'DESC_HORA'
      Required = True
      Size = 6
    end
    object QGuiaTransito_CadDESC_DESTINO: TStringField
      FieldName = 'DESC_DESTINO'
      Required = True
      Size = 40
    end
    object QGuiaTransito_CadDESC_LACRE: TStringField
      FieldName = 'DESC_LACRE'
      Required = True
      Size = 10
    end
    object QGuiaTransito_CadDESC_TEMPERATURA: TStringField
      FieldName = 'DESC_TEMPERATURA'
      Size = 10
    end
    object QGuiaTransito_CadNUM_GUIA_TRANSITO: TIntegerField
      FieldName = 'NUM_GUIA_TRANSITO'
      Required = True
    end
    object QGuiaTransito_CadCOD_SERIE: TStringField
      FieldName = 'COD_SERIE'
      Required = True
      Size = 3
    end
    object QGuiaTransito_CadDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      EditMask = '!99/99/##00;1;_'
    end
    object QGuiaTransito_CadDESC_OBS1: TStringField
      FieldName = 'DESC_OBS1'
      Size = 100
    end
    object QGuiaTransito_CadDESC_OBS2: TStringField
      FieldName = 'DESC_OBS2'
      Size = 100
    end
    object QGuiaTransito_CadDESC_OBS3: TStringField
      FieldName = 'DESC_OBS3'
      Size = 100
    end
  end
  object QGuiaTransito_Itens: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Tb_Classe.Desc_Classe,'
      '  Tb_Cultura.Desc_Cultura As Desc_Unidade,'
      '  Sum(Tb_Nota_item.Qt_Quantidade) As sQt_Peso,'
      '  Sum(Tb_Nota_item.Num_Volumes) As sNum_Volumes'
      'From'
      '  Tb_Nota_Item,'
      '  Tb_Produto,'
      '  Tb_Classe,'
      '  Tb_Cultura'
      'Where'
      '  Tb_Nota_Item.Cod_Produto = Tb_Produto.Cod_Produto'
      '  And'
      '  Tb_Nota_Item.Cod_Cultura = Tb_Cultura.Cod_Cultura'
      '  And'
      '  Tb_Produto.Cod_Classe = Tb_Classe.Cod_Classe'
      '  And'
      '  Tb_Nota_Item.Cod_nota_Cab = :Cod_nota_Cab'
      'Group by'
      '  Tb_Classe.Desc_Classe,'
      '  Tb_Cultura.Desc_Cultura'
      ''
      '')
    Variables.Data = {
      03000000010000000D0000003A434F445F4E4F54415F43414203000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000040000000B000000444553435F434C415353450100000000000C0000
      00444553435F554E4944414445010000000000080000005351545F5045534F01
      00000000000C000000534E554D5F564F4C554D4553010000000000}
    Session = DMOracle.DBCemapa
    Left = 192
    Top = 24
    object QGuiaTransito_ItensDESC_CLASSE: TStringField
      FieldName = 'DESC_CLASSE'
      Size = 30
    end
    object QGuiaTransito_ItensSQT_PESO: TFloatField
      FieldName = 'SQT_PESO'
    end
    object QGuiaTransito_ItensSNUM_VOLUMES: TFloatField
      FieldName = 'SNUM_VOLUMES'
    end
    object QGuiaTransito_ItensDESC_UNIDADE: TStringField
      FieldName = 'DESC_UNIDADE'
      Required = True
      Size = 30
    end
  end
  object QGuiaTransito_Cons: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '    Tb_Guia_Transito.*'
      'From'
      '  Tb_Guia_Transito'
      'Where'
      '  Dt_Emissao >= :Dt_Inicio'
      '  And'
      '  Dt_Emissao <= :Dt_Fim'
      ' ')
    Variables.Data = {
      03000000020000000A0000003A44545F494E4943494F0C000000000000000000
      0000070000003A44545F46494D0C0000000000000000000000}
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000A00000011000000434F445F475549415F5452414E5349544F010000
      0000000C000000434F445F4E4F54415F43414201000000000012000000444553
      435F434F4E5349474E41544152494F01000000000009000000444553435F484F
      52410100000000000C000000444553435F44455354494E4F0100000000000A00
      0000444553435F4C4143524501000000000010000000444553435F54454D5045
      524154555241010000000000110000004E554D5F475549415F5452414E534954
      4F01000000000009000000434F445F53455249450100000000000A0000004454
      5F454D495353414F010000000000}
    Session = DMOracle.DBCemapa
    Left = 48
    Top = 88
    object QGuiaTransito_ConsCOD_GUIA_TRANSITO: TIntegerField
      FieldName = 'COD_GUIA_TRANSITO'
      Required = True
    end
    object QGuiaTransito_ConsCOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
      Required = True
    end
    object QGuiaTransito_ConsDESC_CONSIGNATARIO: TStringField
      FieldName = 'DESC_CONSIGNATARIO'
      Required = True
      Size = 40
    end
    object QGuiaTransito_ConsDESC_HORA: TStringField
      FieldName = 'DESC_HORA'
      Required = True
      Size = 6
    end
    object QGuiaTransito_ConsDESC_DESTINO: TStringField
      FieldName = 'DESC_DESTINO'
      Required = True
      Size = 40
    end
    object QGuiaTransito_ConsDESC_LACRE: TStringField
      FieldName = 'DESC_LACRE'
      Required = True
      Size = 10
    end
    object QGuiaTransito_ConsDESC_TEMPERATURA: TStringField
      FieldName = 'DESC_TEMPERATURA'
      Size = 10
    end
    object QGuiaTransito_ConsNUM_GUIA_TRANSITO: TIntegerField
      FieldName = 'NUM_GUIA_TRANSITO'
      Required = True
    end
    object QGuiaTransito_ConsCOD_SERIE: TStringField
      FieldName = 'COD_SERIE'
      Required = True
      Size = 3
    end
    object QGuiaTransito_ConsDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
  end
end
