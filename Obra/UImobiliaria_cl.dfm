object DMImobiliaria: TDMImobiliaria
  OldCreateOrder = False
  Left = 324
  Top = 127
  Height = 462
  Width = 456
  object QCondominio_Cad: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Rowid,'
      '  Tb_Condominio.*'
      'From'
      '  Tb_Condominio'
      'Where'
      '  Cod_Condominio = :PK')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_CONDOMINIO'
    SequenceField.Sequence = 'SQCONDOMINIO'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      04000000020000000E000000434F445F434F4E444F4D494E494F010000000000
      0F000000444553435F434F4E444F4D494E494F010000000000}
    Session = DMOracle.DBCemapa
    AfterPost = QCondominio_CadAfterPost
    Left = 48
    Top = 16
    object QCondominio_CadCOD_CONDOMINIO: TIntegerField
      FieldName = 'COD_CONDOMINIO'
      Required = True
    end
    object QCondominio_CadDESC_CONDOMINIO: TStringField
      FieldName = 'DESC_CONDOMINIO'
      Required = True
      Size = 30
    end
  end
  object QCondominio_Cons: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '   *'
      'From'
      '  Tb_Condominio'
      'Where'
      '  Desc_Condominio >= :Descricao'
      'Order by'
      '  Desc_Condominio')
    Variables.Data = {
      03000000010000000A0000003A44455343524943414F05000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      04000000020000000E000000434F445F434F4E444F4D494E494F010000000000
      0F000000444553435F434F4E444F4D494E494F010000000000}
    Session = DMOracle.DBCemapa
    Left = 160
    Top = 16
    object QCondominio_ConsCOD_CONDOMINIO: TIntegerField
      FieldName = 'COD_CONDOMINIO'
      Required = True
    end
    object QCondominio_ConsDESC_CONDOMINIO: TStringField
      FieldName = 'DESC_CONDOMINIO'
      Required = True
      Size = 30
    end
  end
  object QImovel_Cad: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Rowid,'
      '  Tb_Imovel.*'
      'From'
      '  Tb_Imovel'
      'Where'
      '  Cod_Imovel = :PK')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_IMOVEL'
    SequenceField.Sequence = 'SQIMOVEL'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      04000000080000000A000000434F445F494D4F56454C0100000000000E000000
      434F445F434F4E444F4D494E494F0100000000000B000000444553435F494D4F
      56454C01000000000010000000434F445F50524F50524945544152494F010000
      0000000D000000444553435F454E44455245434F0100000000000B0000004445
      53435F42414952524F0100000000000A000000434F445F434944414445010000
      00000008000000444553435F434550010000000000}
    Session = DMOracle.DBCemapa
    AfterPost = QImovel_CadAfterPost
    Left = 48
    Top = 80
    object QImovel_CadCOD_IMOVEL: TIntegerField
      FieldName = 'COD_IMOVEL'
      Required = True
    end
    object QImovel_CadCOD_CONDOMINIO: TIntegerField
      FieldName = 'COD_CONDOMINIO'
      Required = True
    end
    object QImovel_CadDESC_IMOVEL: TStringField
      FieldName = 'DESC_IMOVEL'
      Required = True
      Size = 30
    end
    object QImovel_CadCOD_PROPRIETARIO: TIntegerField
      FieldName = 'COD_PROPRIETARIO'
      Required = True
    end
    object QImovel_CadDESC_ENDERECO: TStringField
      FieldName = 'DESC_ENDERECO'
      Size = 40
    end
    object QImovel_CadDESC_BAIRRO: TStringField
      FieldName = 'DESC_BAIRRO'
      Size = 30
    end
    object QImovel_CadCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
    end
    object QImovel_CadDESC_CEP: TStringField
      FieldName = 'DESC_CEP'
      Size = 9
    end
  end
  object QImovel_Cons: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  tb_Imovel.Cod_Imovel,'
      '  tb_Imovel.Desc_Imovel,'
      '  tb_Imovel.Desc_Endereco,'
      '  tb_Cadastro.Nome,'
      '  Tb_Condominio.Desc_Condominio,'
      '  Tb_Cidade.Desc_Cidade'
      'From'
      '  Tb_Imovel,'
      '  Tb_Cadastro,'
      '  Tb_Condominio,'
      '  Tb_Cidade'
      'Where'
      '  Tb_Imovel.cod_Proprietario = Tb_Cadastro.Cod_Cadastro'
      '  And'
      '  Tb_Imovel.Cod_Condominio = Tb_Condominio.Cod_Condominio'
      '  And'
      '  Tb_Imovel.Cod_Cidade = Tb_Cidade.Cod_Cidade'
      '  And'
      '  (:Desc_Imovel is Null'
      '   Or'
      '    Tb_Imovel.Desc_Imovel Like :Desc_Imovel || '#39'%'#39')'
      '  And'
      '  (:Cod_Proprietario is Null'
      '   Or'
      '    Tb_Imovel.Cod_Proprietario = :Cod_Proprietario)'
      '  And'
      '  (:Cod_Condominio is Null'
      '   Or'
      '    Tb_Imovel.Cod_Condominio = :Cod_Condominio)'
      '  And'
      '  (:cod_Cidade is Null'
      '   Or'
      '    Tb_Imovel.Cod_Cidade = :Cod_Cidade)'
      'Order by'
      '  Desc_Imovel')
    Variables.Data = {
      03000000040000000C0000003A444553435F494D4F56454C0500000000000000
      00000000110000003A434F445F50524F50524945544152494F03000000000000
      00000000000F0000003A434F445F434F4E444F4D494E494F0300000000000000
      000000000B0000003A434F445F434944414445030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000060000000B000000444553435F494D4F56454C0100000000000D0000
      00444553435F454E44455245434F010000000000040000004E4F4D4501000000
      00000F000000444553435F434F4E444F4D494E494F0100000000000B00000044
      4553435F4349444144450100000000000A000000434F445F494D4F56454C0100
      00000000}
    Session = DMOracle.DBCemapa
    Left = 160
    Top = 80
    object QImovel_ConsDESC_IMOVEL: TStringField
      FieldName = 'DESC_IMOVEL'
      Required = True
      Size = 30
    end
    object QImovel_ConsDESC_ENDERECO: TStringField
      FieldName = 'DESC_ENDERECO'
      Size = 40
    end
    object QImovel_ConsNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object QImovel_ConsDESC_CONDOMINIO: TStringField
      FieldName = 'DESC_CONDOMINIO'
      Required = True
      Size = 30
    end
    object QImovel_ConsDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      Required = True
      Size = 50
    end
    object QImovel_ConsCOD_IMOVEL: TIntegerField
      FieldName = 'COD_IMOVEL'
      Required = True
    end
  end
  object QLocatario_Cad: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Rowid,'
      '  Tb_Contrato_Locatario.*'
      'From'
      '  Tb_Contrato_Locatario'
      'Where'
      '  Cod_Contrato_Locatario = :PK')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_CONTRATO_LOCATARIO'
    SequenceField.Sequence = 'SQCONTRATO_LOCATARIO'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000900000016000000434F445F434F4E545241544F5F4C4F4341544152
      494F0100000000000A000000434F445F494D4F56454C0100000000000A000000
      44545F454D495353414F0100000000000E0000004449415F56454E43494D454E
      544F0100000000000B000000564C5F434F4E545241544F0100000000000A0000
      00434F445F46494C49414C0100000000000C000000494E445F53495455414341
      4F0100000000001200000044545F494E4943494F5F434F4252414E4341010000
      0000000D000000504552435F544158415F41444D010000000000}
    Session = DMOracle.DBCemapa
    AfterInsert = QLocatario_CadAfterInsert
    AfterPost = QLocatario_CadAfterPost
    Left = 48
    Top = 144
    object QLocatario_CadCOD_CONTRATO_LOCATARIO: TIntegerField
      FieldName = 'COD_CONTRATO_LOCATARIO'
      Required = True
    end
    object QLocatario_CadCOD_IMOVEL: TIntegerField
      FieldName = 'COD_IMOVEL'
      Required = True
    end
    object QLocatario_CadDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object QLocatario_CadDIA_VENCIMENTO: TIntegerField
      FieldName = 'DIA_VENCIMENTO'
      Required = True
    end
    object QLocatario_CadVL_CONTRATO: TFloatField
      FieldName = 'VL_CONTRATO'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object QLocatario_CadCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QLocatario_CadIND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Size = 1
    end
    object QLocatario_CadDT_INICIO_COBRANCA: TDateTimeField
      FieldName = 'DT_INICIO_COBRANCA'
      EditMask = '!99/99/##00;1;_'
    end
    object QLocatario_CadPERC_TAXA_ADM: TFloatField
      FieldName = 'PERC_TAXA_ADM'
      DisplayFormat = '#,##0.00'
    end
  end
  object QLocatario_Cons: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Cod_Contrato_Locatario,'
      '  Dt_Emissao,'
      '  Dia_Vencimento,'
      '  Vl_Contrato,'
      '  Nome,'
      '  Desc_Imovel'
      'From'
      '  Tb_Contrato_Locatario,'
      '  Tb_Imovel,'
      '  Tb_Cadastro'
      'Where'
      '  Tb_Contrato_Locatario.Cod_Imovel = tb_Imovel.Cod_Imovel'
      '  And'
      '  Tb_Imovel.Cod_Proprietario = Tb_Cadastro.Cod_Cadastro'
      '  And'
      '  (:Cod_Proprietario is Null'
      '   Or'
      '    Tb_Imovel.Cod_Proprietario = :Cod_Proprietario)'
      '  And'
      '  (:Cod_Condominio is Null'
      '   Or'
      '    Tb_Imovel.Cod_Condominio = :Cod_Condominio)'
      'Order By'
      '  Nome,'
      '  Desc_Imovel'
      '')
    Variables.Data = {
      0300000002000000110000003A434F445F50524F50524945544152494F030000
      0000000000000000000F0000003A434F445F434F4E444F4D494E494F03000000
      0000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000600000016000000434F445F434F4E545241544F5F4C4F4341544152
      494F0100000000000A00000044545F454D495353414F0100000000000E000000
      4449415F56454E43494D454E544F0100000000000B000000564C5F434F4E5452
      41544F010000000000040000004E4F4D450100000000000B000000444553435F
      494D4F56454C010000000000}
    Session = DMOracle.DBCemapa
    Left = 160
    Top = 144
    object QLocatario_ConsCOD_CONTRATO_LOCATARIO: TIntegerField
      FieldName = 'COD_CONTRATO_LOCATARIO'
      Required = True
    end
    object QLocatario_ConsDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object QLocatario_ConsDIA_VENCIMENTO: TIntegerField
      FieldName = 'DIA_VENCIMENTO'
      Required = True
    end
    object QLocatario_ConsVL_CONTRATO: TFloatField
      FieldName = 'VL_CONTRATO'
      Required = True
    end
    object QLocatario_ConsNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object QLocatario_ConsDESC_IMOVEL: TStringField
      FieldName = 'DESC_IMOVEL'
      Required = True
      Size = 30
    end
  end
  object QLocador_Cad: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Rowid,'
      '  Tb_Contrato_Locador.*'
      'From'
      '  Tb_Contrato_Locador'
      'Where'
      '  Cod_Contrato_Locador = :PK')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_CONTRATO_LOCADOR'
    SequenceField.Sequence = 'SQCONTRATO_LOCADOR'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000001200000014000000434F445F434F4E545241544F5F4C4F4341444F52
      0100000000000A000000434F445F494D4F56454C0100000000000A0000004454
      5F454D495353414F0100000000000E0000004449415F56454E43494D454E544F
      0100000000000B000000564C5F434F4E545241544F0100000000000D00000056
      4C5F434F4E444F4D494E494F0100000000000A000000434F445F46494C49414C
      0100000000000C000000434F445F434144415354524F0100000000000A000000
      434F445F464941444F520100000000000C000000494E445F534954554143414F
      0100000000000B000000434F445F464941444F52310100000000000900000056
      4C5F43415543414F0100000000000F000000494E445F5449504F5F4341554341
      4F0100000000000B000000564C5F474152414E5449410100000000000D000000
      444553435F474152414E5449410100000000001200000044545F494E4943494F
      5F434F4252414E43410100000000000F00000044545F46494D5F434F4252414E
      43410100000000000E000000444553435F50524F46495353414F010000000000}
    Session = DMOracle.DBCemapa
    AfterInsert = QLocador_CadAfterInsert
    AfterPost = QLocador_CadAfterPost
    Left = 48
    Top = 224
    object QLocador_CadCOD_CONTRATO_LOCADOR: TIntegerField
      FieldName = 'COD_CONTRATO_LOCADOR'
      Required = True
    end
    object QLocador_CadCOD_IMOVEL: TIntegerField
      FieldName = 'COD_IMOVEL'
      Required = True
    end
    object QLocador_CadDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Required = True
      EditMask = '!99/99/##00;1;_'
    end
    object QLocador_CadDIA_VENCIMENTO: TIntegerField
      FieldName = 'DIA_VENCIMENTO'
      Required = True
    end
    object QLocador_CadVL_CONTRATO: TFloatField
      FieldName = 'VL_CONTRATO'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object QLocador_CadVL_CONDOMINIO: TFloatField
      FieldName = 'VL_CONDOMINIO'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object QLocador_CadCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QLocador_CadCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QLocador_CadCOD_FIADOR: TIntegerField
      FieldName = 'COD_FIADOR'
    end
    object QLocador_CadIND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Size = 1
    end
    object QLocador_CadCOD_FIADOR1: TIntegerField
      FieldName = 'COD_FIADOR1'
    end
    object QLocador_CadVL_CAUCAO: TFloatField
      FieldName = 'VL_CAUCAO'
      DisplayFormat = '#,##0.00'
    end
    object QLocador_CadIND_TIPO_CAUCAO: TStringField
      FieldName = 'IND_TIPO_CAUCAO'
      Size = 10
    end
    object QLocador_CadVL_GARANTIA: TFloatField
      FieldName = 'VL_GARANTIA'
      DisplayFormat = '#,##0.00'
    end
    object QLocador_CadDESC_GARANTIA: TStringField
      FieldName = 'DESC_GARANTIA'
      Size = 100
    end
    object QLocador_CadDT_INICIO_COBRANCA: TDateTimeField
      FieldName = 'DT_INICIO_COBRANCA'
      EditMask = '!99/99/##00;1;_'
    end
    object QLocador_CadDT_FIM_COBRANCA: TDateTimeField
      FieldName = 'DT_FIM_COBRANCA'
      EditMask = '!99/99/##00;1;_'
    end
    object QLocador_CadDESC_PROFISSAO: TStringField
      FieldName = 'DESC_PROFISSAO'
      Size = 100
    end
  end
  object QLocador_Cons: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Cod_Contrato_Locador,'
      '  Dt_Emissao,'
      '  Vl_Contrato,'
      '  Vl_Condominio,'
      '  Tb_Cadastro.Nome,'
      '  tb_Cadastro_Fiador.Nome as Nome_Fiador'
      'From'
      '  Tb_Contrato_Locador,'
      '  Tb_Cadastro,'
      '  Tb_Cadastro tb_Cadastro_Fiador'
      'Where'
      '  Tb_Contrato_Locador.Cod_Cadastro = Tb_Cadastro.Cod_Cadastro'
      '  And'
      
        '  Tb_Contrato_Locador.Cod_Fiador = Tb_Cadastro_Fiador.Cod_Cadast' +
        'ro(+)'
      '  And'
      '  (:Cod_Cadastro Is Null'
      '   Or'
      '    Tb_Contrato_Locador.Cod_Cadastro = :Cod_Cadastro)'
      '  And'
      '  (:Cod_Imovel Is Null'
      '   Or'
      '    Tb_Contrato_Locador.Cod_Imovel = :Cod_Imovel)'
      '')
    Variables.Data = {
      03000000020000000D0000003A434F445F434144415354524F03000000000000
      00000000000B0000003A434F445F494D4F56454C030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000600000014000000434F445F434F4E545241544F5F4C4F4341444F52
      0100000000000A00000044545F454D495353414F0100000000000B000000564C
      5F434F4E545241544F0100000000000D000000564C5F434F4E444F4D494E494F
      010000000000040000004E4F4D450100000000000B0000004E4F4D455F464941
      444F52010000000000}
    Session = DMOracle.DBCemapa
    Left = 160
    Top = 224
    object QLocador_ConsCOD_CONTRATO_LOCADOR: TIntegerField
      FieldName = 'COD_CONTRATO_LOCADOR'
      Required = True
    end
    object QLocador_ConsDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object QLocador_ConsVL_CONTRATO: TFloatField
      FieldName = 'VL_CONTRATO'
      Required = True
    end
    object QLocador_ConsVL_CONDOMINIO: TFloatField
      FieldName = 'VL_CONDOMINIO'
      Required = True
    end
    object QLocador_ConsNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object QLocador_ConsNOME_FIADOR: TStringField
      FieldName = 'NOME_FIADOR'
      Size = 60
    end
  end
  object QImagem_Imovel_Cad: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Rowid,'
      '  Tb_Imovel_Imagem.*'
      'From'
      '  Tb_Imovel_Imagem'
      'where cod_imovel = :cod_imovel')
    Variables.Data = {
      03000000010000000B0000003A434F445F494D4F56454C030000000000000000
      000000}
    SequenceField.Field = 'COD_IMOVEL_IMAGEM'
    SequenceField.Sequence = 'SQIMOVEL_IMAGEM'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000C00000011000000434F445F494D4F56454C5F494D4147454D010000
      0000000A000000434F445F494D4F56454C0100000000000C000000494D475F49
      4D4147454D30310000000000000C000000494D475F494D4147454D3032000000
      0000000C000000494D475F494D4147454D30330000000000000C000000494D47
      5F494D4147454D30340000000000000C000000494D475F494D4147454D303500
      00000000000C000000494D475F494D4147454D30360000000000000C00000049
      4D475F494D4147454D30370000000000000C000000494D475F494D4147454D30
      380000000000000C000000494D475F494D4147454D30390000000000000C0000
      00494D475F494D4147454D3130000000000000}
    Master = QImovel_Cad
    MasterFields = 'COD_IMOVEL'
    DetailFields = 'COD_IMOVEL'
    Session = DMOracle.DBCemapa
    Left = 264
    Top = 80
    object QImagem_Imovel_CadCOD_IMOVEL_IMAGEM: TIntegerField
      FieldName = 'COD_IMOVEL_IMAGEM'
      Required = True
    end
    object QImagem_Imovel_CadCOD_IMOVEL: TIntegerField
      FieldName = 'COD_IMOVEL'
      Required = True
    end
    object QImagem_Imovel_CadIMG_IMAGEM01: TBlobField
      FieldName = 'IMG_IMAGEM01'
      BlobType = ftOraBlob
    end
    object QImagem_Imovel_CadIMG_IMAGEM02: TBlobField
      FieldName = 'IMG_IMAGEM02'
      BlobType = ftOraBlob
    end
    object QImagem_Imovel_CadIMG_IMAGEM03: TBlobField
      FieldName = 'IMG_IMAGEM03'
      BlobType = ftOraBlob
    end
    object QImagem_Imovel_CadIMG_IMAGEM04: TBlobField
      FieldName = 'IMG_IMAGEM04'
      BlobType = ftOraBlob
    end
    object QImagem_Imovel_CadIMG_IMAGEM05: TBlobField
      FieldName = 'IMG_IMAGEM05'
      BlobType = ftOraBlob
    end
    object QImagem_Imovel_CadIMG_IMAGEM06: TBlobField
      FieldName = 'IMG_IMAGEM06'
      BlobType = ftOraBlob
    end
    object QImagem_Imovel_CadIMG_IMAGEM07: TBlobField
      FieldName = 'IMG_IMAGEM07'
      BlobType = ftOraBlob
    end
    object QImagem_Imovel_CadIMG_IMAGEM08: TBlobField
      FieldName = 'IMG_IMAGEM08'
      BlobType = ftOraBlob
    end
    object QImagem_Imovel_CadIMG_IMAGEM09: TBlobField
      FieldName = 'IMG_IMAGEM09'
      BlobType = ftOraBlob
    end
    object QImagem_Imovel_CadIMG_IMAGEM10: TBlobField
      FieldName = 'IMG_IMAGEM10'
      BlobType = ftOraBlob
    end
  end
  object QContaPagar_Locatario: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Cod_Proprietario,'
      '  Cod_Contrato_Locatario,'
      '  Dia_Vencimento,'
      '  Cod_Filial,'
      '  Cod_Imovel,'
      
        '  Sum(Vl_Contrato - Val_Movimento - Val_Taxa_ADM) + 0.00 as Val_' +
        'Conta_Pagar'
      'From'
      '('
      '  Select'
      '    Tb_Imovel.Cod_Proprietario,'
      '    Tb_Contrato_Locatario.Cod_Contrato_Locatario,'
      '    Tb_Contrato_Locatario.Dia_Vencimento,'
      '    Tb_Contrato_Locatario.Vl_Contrato,'
      
        '    Tb_Contrato_Locatario.Vl_Contrato * Tb_Contrato_Locatario.Pe' +
        'rc_Taxa_Adm / 100 as Val_Taxa_Adm,'
      '    Tb_Contrato_Locatario.Cod_Filial,'
      '    Tb_Contrato_Locatario.Cod_Imovel,'
      '    0 as Val_Movimento'
      '  From'
      '    Tb_Contrato_Locatario,'
      '    Tb_Imovel'
      '  Where'
      '    Tb_Contrato_Locatario.Cod_Imovel = Tb_Imovel.Cod_Imovel'
      '    And'
      '    Tb_Contrato_Locatario.Ind_Situacao = '#39'A'#39
      '    And'
      '    Tb_Contrato_Locatario.Dt_Inicio_Cobranca <= :Dt_Referencia'
      '    And'
      '    Tb_Contrato_Locatario.Cod_Filial = :Cod_Filial'
      ''
      '  UNION ALL'
      ''
      '  Select'
      '    Tb_Imovel.Cod_Proprietario,'
      '    Tb_Contrato_Locatario.Cod_Contrato_Locatario,'
      '    Tb_Contrato_Locatario.Dia_Vencimento,'
      '    0 as Vl_Contrato,'
      '    0 as Val_Taxa_Adm,'
      '    Tb_Contrato_Locatario.Cod_Filial,'
      '    Tb_Contrato_Locatario.Cod_Imovel,'
      '    Sum(Tb_Caixa_Mov.Val_Movimento) as Val_Movimento'
      '  From'
      '    Tb_Contrato_Locatario,'
      '    Tb_Imovel,'
      '    Tb_Caixa_Mov'
      '  Where'
      '    Tb_Contrato_Locatario.Cod_Imovel = Tb_Imovel.Cod_Imovel'
      '    And'
      '    Tb_Contrato_Locatario.Ind_Situacao = '#39'A'#39
      '    And'
      '    Tb_Caixa_Mov.Cod_Imovel = Tb_Contrato_Locatario.Cod_Imovel'
      '    And'
      '    Tb_Caixa_Mov.Ind_Desconta_Locatario =  '#39'S'#39
      '    And'
      '    Tb_Caixa_Mov.Dt_Movimento >= :Dt_Inicio'
      '    And'
      '    Tb_Caixa_Mov.Dt_Movimento <= :Dt_Final'
      '    And'
      '    Tb_Caixa_Mov.Cod_Filial = :Cod_Filial'
      '  Group By'
      '    Tb_Imovel.Cod_Proprietario,'
      '    Tb_Contrato_Locatario.Cod_Contrato_Locatario,'
      '    Tb_Contrato_Locatario.Dia_Vencimento,'
      '    Tb_Contrato_Locatario.Cod_Filial,'
      '    Tb_Contrato_Locatario.Cod_Imovel'
      ')'
      'Group By'
      '  Cod_Proprietario,'
      '  Cod_Contrato_Locatario,'
      '  Dia_Vencimento,'
      '  Cod_Filial,'
      '  Cod_Imovel')
    Variables.Data = {
      03000000040000000B0000003A434F445F46494C49414C030000000000000000
      0000000A0000003A44545F494E4943494F0C0000000000000000000000090000
      003A44545F46494E414C0C00000000000000000000000E0000003A44545F5245
      464552454E4349410C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000600000010000000434F445F50524F50524945544152494F01000000
      00000E0000004449415F56454E43494D454E544F0100000000000A000000434F
      445F46494C49414C0100000000000A000000434F445F494D4F56454C01000000
      00000F00000056414C5F434F4E54415F50414741520100000000001600000043
      4F445F434F4E545241544F5F4C4F4341544152494F010000000000}
    Session = DMOracle.DBCemapa
    Left = 272
    Top = 144
    object QContaPagar_LocatarioCOD_PROPRIETARIO: TIntegerField
      FieldName = 'COD_PROPRIETARIO'
    end
    object QContaPagar_LocatarioDIA_VENCIMENTO: TIntegerField
      FieldName = 'DIA_VENCIMENTO'
    end
    object QContaPagar_LocatarioCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
    end
    object QContaPagar_LocatarioCOD_IMOVEL: TIntegerField
      FieldName = 'COD_IMOVEL'
    end
    object QContaPagar_LocatarioVAL_CONTA_PAGAR: TFloatField
      FieldName = 'VAL_CONTA_PAGAR'
    end
    object QContaPagar_LocatarioCOD_CONTRATO_LOCATARIO: TIntegerField
      FieldName = 'COD_CONTRATO_LOCATARIO'
    end
  end
  object QContaReceber_Locador: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Tb_Contrato_Locador.Cod_Contrato_Locador,'
      '  Tb_Contrato_Locador.Dia_Vencimento,'
      '  Tb_Contrato_Locador.Cod_Cadastro,'
      '  Tb_Contrato_Locador.Vl_Contrato,'
      '  Tb_Contrato_Locador.Vl_Condominio,'
      '  Tb_Contrato_Locador.Cod_Filial,'
      '  Tb_Contrato_Locador.Cod_Imovel'
      'From'
      '  Tb_Contrato_Locador'
      'Where'
      '  Tb_Contrato_Locador.Ind_Situacao = '#39'A'#39
      '  And'
      '  Tb_Contrato_Locador.Dt_Inicio_Cobranca <= :Dt_Referencia'
      '  And'
      '  Tb_Contrato_Locador.Cod_Filial = :Cod_Filial'
      ''
      '')
    Variables.Data = {
      03000000020000000B0000003A434F445F46494C49414C030000000000000000
      0000000E0000003A44545F5245464552454E4349410C00000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      04000000070000000E0000004449415F56454E43494D454E544F010000000000
      0A000000434F445F46494C49414C0100000000000A000000434F445F494D4F56
      454C0100000000000B000000564C5F434F4E545241544F0100000000000D0000
      00564C5F434F4E444F4D494E494F0100000000000C000000434F445F43414441
      5354524F01000000000014000000434F445F434F4E545241544F5F4C4F434144
      4F52010000000000}
    Session = DMOracle.DBCemapa
    Left = 272
    Top = 224
    object QContaReceber_LocadorDIA_VENCIMENTO: TIntegerField
      FieldName = 'DIA_VENCIMENTO'
      Required = True
    end
    object QContaReceber_LocadorVL_CONTRATO: TFloatField
      FieldName = 'VL_CONTRATO'
      Required = True
    end
    object QContaReceber_LocadorVL_CONDOMINIO: TFloatField
      FieldName = 'VL_CONDOMINIO'
      Required = True
    end
    object QContaReceber_LocadorCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QContaReceber_LocadorCOD_IMOVEL: TIntegerField
      FieldName = 'COD_IMOVEL'
      Required = True
    end
    object QContaReceber_LocadorCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QContaReceber_LocadorCOD_CONTRATO_LOCADOR: TIntegerField
      FieldName = 'COD_CONTRATO_LOCADOR'
      Required = True
    end
  end
  object QRContrato_Locador: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  DT_EMISSAO,'
      '  VL_CONTRATO,'
      '  VL_CONDOMINIO,'
      '  DIA_VENCIMENTO,'
      '  Tb_Cadastro.Nome,'
      '  Tb_Condominio.Desc_Condominio,'
      '  Tb_Imovel.Desc_Imovel'
      'From'
      '  Tb_Contrato_Locador,'
      '  Tb_Cadastro,'
      '  Tb_Imovel,'
      '  Tb_Condominio'
      'Where'
      '  Tb_Contrato_Locador.Cod_Cadastro = Tb_Cadastro.Cod_Cadastro'
      '  And'
      '  Tb_Contrato_Locador.Cod_Imovel = Tb_Imovel.Cod_Imovel'
      '  And'
      '  Tb_Imovel.Cod_Condominio = Tb_Condominio.Cod_Condominio(+)'
      '  And'
      '  Tb_Contrato_Locador.Ind_Situacao = '#39'A'#39
      '  And'
      '  (:Cod_Condominio Is null'
      '   Or'
      '    Tb_Imovel.Cod_Condominio = :Cod_Condominio)'
      '  And'
      '  (:Cod_Proprietario Is Null'
      '   Or'
      '    Tb_Imovel.Cod_Proprietario = :Cod_Proprietario)'
      '  And'
      '  (:Cod_Filial Is Null'
      '   Or'
      '    Tb_Contrato_Locador.Cod_Filial = :Cod_Filial)'
      'Order by'
      '  Tb_Condominio.Desc_Condominio')
    Variables.Data = {
      03000000030000000F0000003A434F445F434F4E444F4D494E494F0300000000
      00000000000000110000003A434F445F50524F50524945544152494F03000000
      00000000000000000B0000003A434F445F46494C49414C030000000000000000
      000000}
    QBEDefinition.QBEFieldDefs = {
      04000000070000000A00000044545F454D495353414F0100000000000B000000
      564C5F434F4E545241544F0100000000000D000000564C5F434F4E444F4D494E
      494F0100000000000E0000004449415F56454E43494D454E544F010000000000
      040000004E4F4D450100000000000F000000444553435F434F4E444F4D494E49
      4F0100000000000B000000444553435F494D4F56454C010000000000}
    Session = DMOracle.DBCemapa
    Left = 40
    Top = 288
    object QRContrato_LocadorDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object QRContrato_LocadorVL_CONTRATO: TFloatField
      FieldName = 'VL_CONTRATO'
      Required = True
    end
    object QRContrato_LocadorVL_CONDOMINIO: TFloatField
      FieldName = 'VL_CONDOMINIO'
      Required = True
    end
    object QRContrato_LocadorDIA_VENCIMENTO: TIntegerField
      FieldName = 'DIA_VENCIMENTO'
      Required = True
    end
    object QRContrato_LocadorNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object QRContrato_LocadorDESC_CONDOMINIO: TStringField
      FieldName = 'DESC_CONDOMINIO'
      Size = 30
    end
    object QRContrato_LocadorDESC_IMOVEL: TStringField
      FieldName = 'DESC_IMOVEL'
      Required = True
      Size = 30
    end
  end
  object QRFinanceiro: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  *'
      'From'
      '('
      '  Select'
      '    '#39'Conta Pagar'#39' as Ind_Tipo,'
      '    Tb_Condominio.Desc_Condominio,'
      '    Tb_Imovel.Desc_Imovel,'
      '    Tb_Imovel.Cod_Proprietario,'
      '    Tb_Cadastro.Nome,'
      '    Tb_Conta_Pagar_Cab.Dt_Emissao,'
      '    Tb_Conta_Pagar_Cab.Dt_Vencimento,'
      '    Tb_Conta_Pagar_Cab.Val_Titulo,'
      '    Tb_Conta_Pagar_Cab.Val_Original,'
      '    Tb_Conta_Pagar_Cab.Val_Titulo as val_titulo_cp,'
      '    Tb_Conta_Pagar_Cab.Val_Original as val_original_cp,'
      '    0 as val_titulo_cr,'
      '    0 as val_original_cr'
      '  From'
      '    Tb_Contrato_Locatario,'
      '    Tb_Condominio,'
      '    Tb_Imovel,'
      '    Tb_Conta_Pagar_Cab,'
      '    Tb_Cadastro'
      '  Where'
      '    Tb_Contrato_Locatario.Cod_Imovel = Tb_Imovel.Cod_Imovel'
      '    And'
      '    Tb_Imovel.Cod_Condominio = Tb_Condominio.Cod_Condominio'
      '    And'
      
        '    Tb_Contrato_Locatario.Cod_Contrato_Locatario = Tb_Conta_Paga' +
        'r_Cab.Cod_Contrato_Locatario'
      '    And'
      '    Tb_Imovel.Cod_Proprietario = Tb_Cadastro.Cod_Cadastro'
      '    And'
      '    (:Cod_Condominio is Null'
      '     Or'
      '      Tb_Condominio.Cod_Condominio = :Cod_Condominio)'
      '    And'
      '    (:Cod_Imovel is Null'
      '     Or'
      '      Tb_Imovel.Cod_Imovel = :Cod_Imovel)'
      '    And'
      '    (:Cod_Proprietario is Null'
      '     Or'
      '      Tb_Imovel.Cod_Proprietario = :Cod_Proprietario)'
      '    And'
      '    (Tb_Conta_Pagar_Cab.Dt_Emissao >= :Dt_Inicio)'
      '    And'
      '    (Tb_Conta_Pagar_Cab.Dt_Emissao <= :Dt_Final)'
      ''
      '  Union all'
      ''
      '  Select'
      '    '#39'Conta Receber'#39' as Ind_Tipo,'
      '    Tb_Condominio.Desc_Condominio,'
      '    Tb_Imovel.Desc_Imovel,'
      '    Tb_Imovel.Cod_Proprietario,'
      '    Tb_Cadastro.Nome,'
      '    Tb_Conta_Receber_Cab.Dt_Emissao,'
      '    Tb_Conta_Receber_Cab.Dt_Vencimento,'
      '    Tb_Conta_Receber_Cab.Val_Titulo,'
      '    Tb_Conta_Receber_Cab.Val_Original,'
      '    0 as val_titulo_cp,'
      '    0 as val_original_cp,'
      '    Tb_Conta_Receber_Cab.Val_Titulo as val_titulo_cr,'
      '    Tb_Conta_Receber_Cab.Val_Original as val_original_cr'
      '  From'
      '    Tb_Contrato_Locador,'
      '    Tb_Condominio,'
      '    Tb_Imovel,'
      '    Tb_Conta_Receber_Cab,'
      '    Tb_Cadastro'
      '  Where'
      '    Tb_Contrato_Locador.Cod_Imovel = Tb_Imovel.Cod_Imovel'
      '    And'
      '    Tb_Imovel.Cod_Condominio = Tb_Condominio.Cod_Condominio'
      '    And'
      
        '    Tb_Contrato_Locador.Cod_Contrato_Locador = Tb_Conta_Receber_' +
        'Cab.Cod_Contrato_Locador'
      '    And'
      '    Tb_Contrato_Locador.Cod_Cadastro = Tb_Cadastro.Cod_Cadastro'
      '    And'
      '    (:Cod_Condominio is Null'
      '     Or'
      '      Tb_Condominio.Cod_Condominio = :Cod_Condominio)'
      '    And'
      '    (:Cod_Imovel is Null'
      '     Or'
      '      Tb_Imovel.Cod_Imovel = :Cod_Imovel)'
      '    And'
      '    (:Cod_Proprietario is Null'
      '     Or'
      '      Tb_Imovel.Cod_Proprietario = :Cod_Proprietario)'
      '    And'
      '    (Tb_Conta_Receber_Cab.Dt_Emissao >= :Dt_Inicio)'
      '    And'
      '    (Tb_Conta_Receber_Cab.Dt_Emissao <= :Dt_Final)'
      ')'
      'Order by'
      '  Desc_Condominio,'
      '  Ind_Tipo,'
      '  Desc_Imovel,'
      '  Dt_Vencimento')
    Variables.Data = {
      03000000050000000F0000003A434F445F434F4E444F4D494E494F0300000000
      000000000000000B0000003A434F445F494D4F56454C03000000000000000000
      0000110000003A434F445F50524F50524945544152494F030000000000000000
      0000000A0000003A44545F494E4943494F0C0000000000000000000000090000
      003A44545F46494E414C0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000D0000000F000000444553435F434F4E444F4D494E494F0100000000
      000B000000444553435F494D4F56454C01000000000010000000434F445F5052
      4F50524945544152494F010000000000040000004E4F4D450100000000000A00
      000044545F454D495353414F0100000000000D00000044545F56454E43494D45
      4E544F0100000000000A00000056414C5F544954554C4F0100000000000C0000
      0056414C5F4F524947494E414C01000000000008000000494E445F5449504F01
      00000000000D00000056414C5F544954554C4F5F43500100000000000F000000
      56414C5F4F524947494E414C5F43500100000000000D00000056414C5F544954
      554C4F5F43520100000000000F00000056414C5F4F524947494E414C5F435201
      0000000000}
    Session = DMOracle.DBCemapa
    Left = 48
    Top = 352
    object QRFinanceiroDESC_CONDOMINIO: TStringField
      FieldName = 'DESC_CONDOMINIO'
      Required = True
      Size = 30
    end
    object QRFinanceiroDESC_IMOVEL: TStringField
      FieldName = 'DESC_IMOVEL'
      Required = True
      Size = 30
    end
    object QRFinanceiroCOD_PROPRIETARIO: TIntegerField
      FieldName = 'COD_PROPRIETARIO'
      Required = True
    end
    object QRFinanceiroNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object QRFinanceiroDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
    object QRFinanceiroDT_VENCIMENTO: TDateTimeField
      FieldName = 'DT_VENCIMENTO'
    end
    object QRFinanceiroVAL_TITULO: TFloatField
      FieldName = 'VAL_TITULO'
    end
    object QRFinanceiroVAL_ORIGINAL: TFloatField
      FieldName = 'VAL_ORIGINAL'
    end
    object QRFinanceiroIND_TIPO: TStringField
      FieldName = 'IND_TIPO'
      Size = 13
    end
    object QRFinanceiroVAL_TITULO_CP: TFloatField
      FieldName = 'VAL_TITULO_CP'
    end
    object QRFinanceiroVAL_ORIGINAL_CP: TFloatField
      FieldName = 'VAL_ORIGINAL_CP'
    end
    object QRFinanceiroVAL_TITULO_CR: TFloatField
      FieldName = 'VAL_TITULO_CR'
    end
    object QRFinanceiroVAL_ORIGINAL_CR: TFloatField
      FieldName = 'VAL_ORIGINAL_CR'
    end
  end
  object QrExtrato: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  *'
      'From'
      '('
      '  Select'
      '    '#39'Receita'#39' as Ind_Tipo,'
      '    Tb_Imovel.Desc_Imovel,'
      '    Tb_Imovel.Cod_Proprietario,'
      '    Tb_Cadastro.Nome,'
      '    Tb_Contrato_Locatario.Vl_Contrato,'
      '    '#39' '#39' as Desc_Historico,'
      '    0  as Val_Movimento'
      '  From'
      '    Tb_Contrato_Locatario,'
      '    Tb_Imovel,'
      '    Tb_Cadastro'
      '  Where'
      '    Tb_Contrato_Locatario.Cod_Imovel = Tb_Imovel.Cod_Imovel'
      '    And'
      '    Tb_Imovel.Cod_Proprietario = Tb_Cadastro.Cod_Cadastro'
      '    And'
      '    Tb_Contrato_Locatario.Ind_Situacao = '#39'A'#39
      '    And'
      '    (:Cod_Imovel is Null'
      '     Or'
      '      Tb_Imovel.Cod_Imovel = :Cod_Imovel)'
      '    And'
      '    (:Cod_Proprietario is Null'
      '     Or'
      '      Tb_Imovel.Cod_Proprietario = :Cod_Proprietario)'
      ''
      '  Union all'
      ''
      '  Select'
      '    '#39'Despesas'#39' as Ind_Tipo,'
      '    Tb_Imovel.Desc_Imovel,'
      '    Tb_Imovel.Cod_Proprietario,'
      '    Tb_Cadastro.Nome,'
      '    0 Vl_Contrato,'
      '    '#39'Taxa Administrativa'#39' as Desc_Historico,'
      
        '    Tb_Contrato_Locatario.Vl_Contrato * Tb_Contrato_Locatario.Pe' +
        'rc_Taxa_Adm / 100 as Val_Movimento'
      '  From'
      '    Tb_Contrato_Locatario,'
      '    Tb_Imovel,'
      '    Tb_Cadastro'
      '  Where'
      '    Tb_Contrato_Locatario.Cod_Imovel = Tb_Imovel.Cod_Imovel'
      '    And'
      '    Tb_Imovel.Cod_Proprietario = Tb_Cadastro.Cod_Cadastro'
      '    And'
      '    Tb_Contrato_Locatario.Ind_Situacao = '#39'A'#39
      '    And'
      '    Tb_Contrato_Locatario.Perc_Taxa_Adm > 0'
      '    And'
      '    (:Cod_Imovel is Null'
      '     Or'
      '      Tb_Imovel.Cod_Imovel = :Cod_Imovel)'
      '    And'
      '    (:Cod_Proprietario is Null'
      '     Or'
      '      Tb_Imovel.Cod_Proprietario = :Cod_Proprietario)'
      ''
      '  Union all'
      ''
      '  Select'
      '    '#39'Despesas'#39' as Ind_Tipo,'
      '    Tb_Imovel.Desc_Imovel,'
      '    Tb_Imovel.Cod_Proprietario,'
      '    Tb_Cadastro.Nome,'
      '    0 as Vl_Contrato,'
      '    tb_historico.Desc_Historico,'
      '    Sum(Tb_Caixa_Mov.Val_Movimento) as Val_Movimento'
      '  From'
      '    Tb_Imovel,'
      '    Tb_Cadastro,'
      '    Tb_Caixa_Mov,'
      '    Tb_Historico'
      '  Where'
      '    Tb_Caixa_Mov.Cod_Imovel = Tb_Imovel.Cod_Imovel'
      '    And'
      '    Tb_Imovel.Cod_Proprietario = Tb_Cadastro.Cod_Cadastro'
      '    And'
      '    Tb_Caixa_Mov.Cod_Historico = Tb_Historico.Cod_Historico'
      '    And'
      '    Tb_Caixa_Mov.Ind_Desconta_Locatario =  '#39'S'#39
      '    And'
      '    Tb_Caixa_Mov.Dt_Movimento >= :Dt_Inicio'
      '    And'
      '    Tb_Caixa_Mov.Dt_Movimento <= :Dt_Final'
      '    And'
      '    (:Cod_Filial is Null'
      '     or'
      '      Tb_Caixa_Mov.Cod_Filial = :Cod_Filial)'
      '  Group By'
      '    Tb_Imovel.Desc_Imovel,'
      '    Tb_Imovel.Cod_Proprietario,'
      '    Tb_Cadastro.Nome,'
      '    tb_historico.Desc_Historico'
      ')'
      'Order by'
      '    Nome,'
      '    Desc_Imovel,'
      '    Cod_Proprietario,'
      '    Desc_Historico'
      '')
    Variables.Data = {
      03000000050000000B0000003A434F445F494D4F56454C030000000000000000
      000000110000003A434F445F50524F50524945544152494F0300000000000000
      000000000A0000003A44545F494E4943494F0C00000000000000000000000900
      00003A44545F46494E414C0C00000000000000000000000B0000003A434F445F
      46494C49414C050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000070000000B000000444553435F494D4F56454C010000000000100000
      00434F445F50524F50524945544152494F010000000000040000004E4F4D4501
      000000000008000000494E445F5449504F0100000000000B000000564C5F434F
      4E545241544F0100000000000E000000444553435F484953544F5249434F0100
      000000000D00000056414C5F4D4F56494D454E544F010000000000}
    Session = DMOracle.DBCemapa
    Left = 152
    Top = 352
    object QrExtratoIND_TIPO: TStringField
      FieldName = 'IND_TIPO'
      Size = 8
    end
    object QrExtratoDESC_IMOVEL: TStringField
      FieldName = 'DESC_IMOVEL'
      Size = 30
    end
    object QrExtratoCOD_PROPRIETARIO: TIntegerField
      FieldName = 'COD_PROPRIETARIO'
    end
    object QrExtratoNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object QrExtratoVL_CONTRATO: TFloatField
      FieldName = 'VL_CONTRATO'
    end
    object QrExtratoDESC_HISTORICO: TStringField
      FieldName = 'DESC_HISTORICO'
      Size = 30
    end
    object QrExtratoVAL_MOVIMENTO: TFloatField
      FieldName = 'VAL_MOVIMENTO'
    end
  end
  object QRComissao: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Tb_Imovel.Cod_Proprietario,'
      '  Tb_Cadastro.Nome,'
      
        '  Sum(Tb_Contrato_Locatario.VL_CONTRATO * Tb_Contrato_Locatario.' +
        'PERC_TAXA_ADM / 100) as Val_Comissao'
      'From'
      '  Tb_Contrato_Locatario,'
      '  Tb_Imovel,'
      '  Tb_Cadastro'
      'Where'
      '  Tb_Contrato_Locatario.Cod_Imovel = Tb_Imovel.Cod_Imovel'
      '  And'
      '  Tb_Imovel.Cod_Proprietario = Tb_Cadastro.Cod_Cadastro'
      '  And'
      '  Tb_Contrato_Locatario.Ind_Situacao = '#39'A'#39
      '  And'
      '  (:Cod_Proprietario is Null'
      '   Or'
      '    Tb_Imovel.Cod_Proprietario = :Cod_Proprietario)'
      '  And'
      '  (:Cod_Filial is Null'
      '   Or'
      '    Tb_Contrato_Locatario.Cod_Filial = :Cod_Filial)'
      'Group By'
      '  Tb_Imovel.Cod_Proprietario,'
      '  Tb_Cadastro.Nome'
      'Order By'
      '  Tb_Cadastro.Nome'
      '')
    Variables.Data = {
      0300000002000000110000003A434F445F50524F50524945544152494F030000
      0000000000000000000B0000003A434F445F46494C49414C0300000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      040000000300000010000000434F445F50524F50524945544152494F01000000
      0000040000004E4F4D450100000000000C00000056414C5F434F4D495353414F
      010000000000}
    Session = DMOracle.DBCemapa
    Left = 256
    Top = 352
    object QRComissaoCOD_PROPRIETARIO: TIntegerField
      FieldName = 'COD_PROPRIETARIO'
      Required = True
    end
    object QRComissaoNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object QRComissaoVAL_COMISSAO: TFloatField
      FieldName = 'VAL_COMISSAO'
    end
  end
  object QRContrato_Resumos: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Desc_Condominio,'
      '  Desc_Imovel,'
      '  Cod_Proprietario,'
      '  Nome,'
      '  nome_Locador,'
      '  Sum(Vl_Contrato) as Vl_Contrato,'
      '  Sum(Vl_Comissao) as Vl_Comissao,'
      '  Sum(Vl_Condominio) as Vl_Condominio,'
      '  Sum(Val_Movimento) as Vl_Despesas_Proprietario'
      'From'
      '  ('
      '  Select'
      '    Tb_Condominio.Desc_Condominio,'
      '    Tb_Imovel.Desc_Imovel,'
      '    Tb_Imovel.Cod_Proprietario,'
      '    Tb_Cadastro.Nome,'
      '    Tb_Cadastro_Locador.nome as nome_Locador,'
      '    Tb_Contrato_Locatario.Vl_Contrato,'
      
        '    Tb_Contrato_Locatario.Vl_Contrato * Tb_Contrato_Locatario.Pe' +
        'rc_Taxa_Adm / 100 as Vl_Comissao,'
      '    0 As Vl_Condominio,'
      '    0 As Val_Movimento'
      '  From'
      '    Tb_Contrato_Locatario,'
      '    Tb_Condominio,'
      '    Tb_Imovel,'
      '    Tb_Cadastro,'
      '    Tb_Contrato_Locador,'
      '    Tb_Cadastro tb_cadastro_locador'
      '  Where'
      '    Tb_Contrato_Locatario.Cod_Imovel = Tb_Imovel.Cod_Imovel'
      '    And'
      '    Tb_Imovel.Cod_Condominio = Tb_Condominio.Cod_Condominio'
      '    And'
      '    Tb_Imovel.Cod_Proprietario = Tb_Cadastro.Cod_Cadastro'
      '    And'
      '    tb_imovel.Cod_Imovel = Tb_Contrato_Locador.Cod_Imovel(+)'
      '    And'
      
        '    Tb_Contrato_Locador.Cod_Cadastro = Tb_cadastro_locador.cod_c' +
        'adastro(+)'
      '    And'
      '    (:Cod_Condominio is Null'
      '     Or'
      '      Tb_Condominio.Cod_Condominio = :Cod_Condominio)'
      '    And'
      '    (:Cod_Imovel is Null'
      '     Or'
      '      Tb_Imovel.Cod_Imovel = :Cod_Imovel)'
      '    And'
      '    (:Cod_Proprietario is Null'
      '     Or'
      '      Tb_Imovel.Cod_Proprietario = :Cod_Proprietario)'
      ''
      '  Union all'
      ''
      '  Select'
      '    Tb_Condominio.Desc_Condominio,'
      '    Tb_Imovel.Desc_Imovel,'
      '    Tb_Imovel.Cod_Proprietario,'
      '    Tb_Cadastro.Nome,'
      '    Tb_Cadastro_Locador.nome as nome_Locador,'
      '    0 As Vl_Contrato,'
      '    0 As Vl_Comissao,'
      '    0 As Vl_Condominio,'
      '    Tb_Caixa_Mov.Val_Movimento'
      '  From'
      '    Tb_Contrato_Locador,'
      '    Tb_Condominio,'
      '    Tb_Imovel,'
      '    Tb_Cadastro,'
      '    Tb_Caixa_Mov,'
      '    Tb_Cadastro Tb_Cadastro_Locador'
      '  Where'
      '    Tb_Caixa_Mov.Cod_Imovel = Tb_Imovel.Cod_Imovel'
      '    And'
      '    Tb_Imovel.Cod_Imovel = Tb_Contrato_Locador.Cod_Imovel(+)'
      '    And'
      
        '    Tb_Contrato_Locador.Cod_Cadastro = Tb_Cadastro_Locador.Cod_C' +
        'adastro(+)'
      '    And'
      '    Tb_Imovel.Cod_Condominio = Tb_Condominio.Cod_Condominio'
      '    And'
      '    Tb_Imovel.Cod_Proprietario = Tb_Cadastro.Cod_Cadastro'
      '    And'
      '    (:Cod_Condominio is Null'
      '     Or'
      '      Tb_Condominio.Cod_Condominio = :Cod_Condominio)'
      '    And'
      '    (:Cod_Imovel is Null'
      '     Or'
      '      Tb_Imovel.Cod_Imovel = :Cod_Imovel)'
      '    And'
      '    (:Cod_Proprietario is Null'
      '     Or'
      '      Tb_Caixa_Mov.Cod_Cadastro = :Cod_Proprietario)'
      ')'
      'Group By'
      '  Desc_Condominio,'
      '  Desc_Imovel,'
      '  Cod_Proprietario,'
      '  Nome,'
      '  nome_Locador'
      'Order By'
      '  Nome,'
      '  Cod_Proprietario,'
      '  Desc_Imovel'
      '')
    Variables.Data = {
      03000000030000000F0000003A434F445F434F4E444F4D494E494F0300000000
      000000000000000B0000003A434F445F494D4F56454C03000000000000000000
      0000110000003A434F445F50524F50524945544152494F030000000000000000
      000000}
    QBEDefinition.QBEFieldDefs = {
      04000000090000000F000000444553435F434F4E444F4D494E494F0100000000
      000B000000444553435F494D4F56454C01000000000010000000434F445F5052
      4F50524945544152494F010000000000040000004E4F4D450100000000000B00
      0000564C5F434F4E545241544F0100000000000B000000564C5F434F4D495353
      414F0100000000000D000000564C5F434F4E444F4D494E494F01000000000018
      000000564C5F44455350455341535F50524F50524945544152494F0100000000
      000C0000004E4F4D455F4C4F4341444F52010000000000}
    Session = DMOracle.DBCemapa
    Left = 160
    Top = 288
    object QRContrato_ResumosDESC_CONDOMINIO: TStringField
      FieldName = 'DESC_CONDOMINIO'
      Size = 30
    end
    object QRContrato_ResumosDESC_IMOVEL: TStringField
      FieldName = 'DESC_IMOVEL'
      Size = 30
    end
    object QRContrato_ResumosCOD_PROPRIETARIO: TIntegerField
      FieldName = 'COD_PROPRIETARIO'
    end
    object QRContrato_ResumosNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object QRContrato_ResumosVL_CONTRATO: TFloatField
      FieldName = 'VL_CONTRATO'
    end
    object QRContrato_ResumosVL_COMISSAO: TFloatField
      FieldName = 'VL_COMISSAO'
    end
    object QRContrato_ResumosVL_CONDOMINIO: TFloatField
      FieldName = 'VL_CONDOMINIO'
    end
    object QRContrato_ResumosVL_DESPESAS_PROPRIETARIO: TFloatField
      FieldName = 'VL_DESPESAS_PROPRIETARIO'
    end
    object QRContrato_ResumosNOME_LOCADOR: TStringField
      FieldName = 'NOME_LOCADOR'
      Size = 60
    end
  end
end
