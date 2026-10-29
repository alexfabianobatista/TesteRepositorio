object DmImportaMySQL: TDmImportaMySQL
  OldCreateOrder = False
  Left = 304
  Top = 109
  Height = 354
  Width = 483
  object ZConn: TZConnection
    Protocol = 'mysqld-5'
    HostName = '127.0.0.1'
    Database = 'mdebona3'
    User = 'root'
    Password = 'server'
    Connected = True
    Left = 24
    Top = 8
  end
  object ZQuery: TZQuery
    Connection = ZConn
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '  USUARIOS')
    Params = <>
    Left = 80
    Top = 8
    object ZQueryUsr_Login: TStringField
      FieldName = 'Usr_Login'
      Required = True
    end
    object ZQueryUsr_Nome: TStringField
      FieldName = 'Usr_Nome'
      Size = 50
    end
    object ZQueryUsr_Senha: TStringField
      FieldName = 'Usr_Senha'
      Size = 50
    end
    object ZQueryUsr_DigPro: TIntegerField
      FieldName = 'Usr_DigPro'
    end
    object ZQueryFil_Codigo: TIntegerField
      FieldName = 'Fil_Codigo'
    end
    object ZQueryUsr_SupervisorResp: TStringField
      FieldName = 'Usr_SupervisorResp'
      Size = 15
    end
    object ZQueryUsr_Supervisor: TStringField
      FieldName = 'Usr_Supervisor'
      Size = 1
    end
    object ZQuerySer_Codigo: TStringField
      FieldName = 'Ser_Codigo'
      Size = 3
    end
    object ZQueryUsr_Email: TStringField
      FieldName = 'Usr_Email'
      Size = 100
    end
    object ZQueryUsr_ServRequerAutentic: TStringField
      FieldName = 'Usr_ServRequerAutentic'
      Size = 1
    end
    object ZQueryUsr_ServRequerSSL: TStringField
      FieldName = 'Usr_ServRequerSSL'
      Size = 1
    end
    object ZQueryUsr_UsrEmail: TStringField
      FieldName = 'Usr_UsrEmail'
      Size = 100
    end
    object ZQueryUsr_UsrEmailSenha: TStringField
      FieldName = 'Usr_UsrEmailSenha'
      Size = 50
    end
    object ZQueryUsr_SMTP: TStringField
      FieldName = 'Usr_SMTP'
      Size = 50
    end
    object ZQueryUsr_SMTPPorta: TStringField
      FieldName = 'Usr_SMTPPorta'
      Size = 6
    end
    object ZQueryUsr_HostProxy: TStringField
      FieldName = 'Usr_HostProxy'
      Size = 50
    end
    object ZQueryUsr_UsrProxy: TStringField
      FieldName = 'Usr_UsrProxy'
      Size = 25
    end
    object ZQueryUsr_SenhaProxy: TStringField
      FieldName = 'Usr_SenhaProxy'
      Size = 50
    end
    object ZQueryUsr_Situacao: TStringField
      FieldName = 'Usr_Situacao'
      Size = 1
    end
    object ZQueryUsr_UtilCxDiario: TStringField
      FieldName = 'Usr_UtilCxDiario'
      Size = 1
    end
    object ZQueryVen_Codigo: TIntegerField
      FieldName = 'Ven_Codigo'
    end
  end
  object CdMapCidade: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 56
    Data = {
      430000009619E0BD01000000180000000200000000000300000043000A434F44
      5F43494441444504000100000000000D434F445F4349444144455F4939040001
      00000000000000}
    object CdMapCidadeCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
    end
    object CdMapCidadeCOD_CIDADE_I9: TIntegerField
      FieldName = 'COD_CIDADE_I9'
    end
  end
  object QCidades: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  COD_CIDADE,'
      '  DESC_CIDADE,'
      '  COD_ESTADO'
      'FROM'
      '  TB_CIDADE')
    QBEDefinition.QBEFieldDefs = {
      04000000030000000A000000434F445F4349444144450100000000000B000000
      444553435F4349444144450100000000000A000000434F445F45535441444F01
      0000000000}
    Session = DMOracle.DBCemapa
    Left = 152
    Top = 104
    object QCidadesCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
      Required = True
    end
    object QCidadesDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      Required = True
      Size = 50
    end
    object QCidadesCOD_ESTADO: TStringField
      FieldName = 'COD_ESTADO'
      Required = True
      Size = 2
    end
  end
  object ZCidade: TZQuery
    Connection = ZConn
    SQL.Strings = (
      'SELECT'
      '  CID_CODIGO'
      'FROM'
      '  CIDADES'
      'WHERE'
      '  UPPER(TRIM(CID_ESTADO)) = UPPER(TRIM(:COD_ESTADO))'
      'AND'
      '  UPPER(TRIM(CID_NOME)) = UPPER(TRIM(:DESC_CIDADE))')
    Params = <
      item
        DataType = ftString
        Name = 'COD_ESTADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DESC_CIDADE'
        ParamType = ptUnknown
      end>
    Left = 200
    Top = 104
    ParamData = <
      item
        DataType = ftString
        Name = 'COD_ESTADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DESC_CIDADE'
        ParamType = ptUnknown
      end>
    object ZCidadeCID_CODIGO: TIntegerField
      FieldName = 'CID_CODIGO'
      Required = True
    end
  end
  object QCadastro: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_CADASTRO.ROWID,'
      '  TB_CADASTRO.*'
      'FROM'
      '  TB_CADASTRO')
    QBEDefinition.QBEFieldDefs = {
      040000008C0000000A000000434F445F4349444144450100000000000B000000
      444553435F4349444144450100000000000A000000434F445F45535441444F01
      00000000000C000000434F445F434144415354524F0100000000000A00000043
      4F445F4D4F5449564F01000000000011000000434F445F5449504F5F43414441
      5354524F0100000000000A000000434F445F52454749414F0100000000000800
      0000434F445F5041495301000000000010000000434F445F45535441444F5F43
      4956494C01000000000008000000434F445F52414D4F01000000000004000000
      4E4F4D450100000000000D000000444553435F454E44455245434F0100000000
      0008000000444553435F4345500100000000000B0000004E554D5F4347435F43
      50460100000000000D0000004E554D5F494E5343524943414F0100000000000B
      00000044545F434144415354524F01000000000012000000494E445F5345584F
      5F43415445474F524941010000000000100000004E554D5F43414958415F504F
      5354414C0100000000000F00000044545F43414E43454C414D454E544F010000
      0000000D000000444553435F54454C45464F4E450100000000000C0000004445
      53435F43454C554C41520100000000000C0000004E4F4D455F434F4E5441544F
      0100000000000D00000044545F4E415343494D454E544F0100000000000B0000
      00444553435F42414952524F0100000000000D000000504552435F46554E5255
      52414C0100000000000A00000056414C5F4C494D4954450100000000000D0000
      00444553435F46414E544153494101000000000014000000444553435F434944
      4144455F434F4252414E434101000000000016000000444553435F454E444552
      45434F5F434F4252414E434101000000000014000000444553435F4553544144
      4F5F434F4252414E434101000000000011000000444553435F4345505F434F42
      52414E434101000000000017000000444553435F54454C45464F4E455F434F4D
      45524349414C010000000000090000004E554D5F4A554E54410100000000000B
      00000044545F46554E444143414F0100000000000800000044545F4A554E5441
      01000000000008000000444553435F464158010000000000080000004E4F4D45
      5F4D4145010000000000080000004E4F4D455F50414901000000000011000000
      444553435F4E41545552414C494441444501000000000013000000444553435F
      45535441444F5F4E41545552414C0100000000001700000044545F4558504544
      4943414F5F4944454E5449444144450100000000000B000000444553435F455F
      4D41494C01000000000011000000444553435F4641585F434F4252414E434101
      000000000011000000494E445F534550524F435F53494D4E414F010000000000
      18000000444553435F494E5343524943414F5F4D554E49434950414C01000000
      00000C0000004E4F4D455F434F4E4A5547450100000000001000000044455343
      5F4350465F434F4E4A55474501000000000017000000444553435F4944454E54
      49444144455F434F4E4A55474501000000000012000000434F445F434C415353
      5F434144415354524F01000000000011000000434F445F42414E434F5F414745
      4E4349410100000000000F000000434F445F4F5045524143414F5F4343010000
      0000001500000044545F4E415343494D454E544F5F434F4E5441544F01000000
      00000D0000004E4F4D455F434F4E5441544F320100000000000E00000044545F
      4E415343494D454E544F320100000000000C000000434F445F56454E4445444F
      520100000000000D000000504552435F434F4D495353414F0100000000001000
      0000444553435F434F4D504C454D454E544F01000000000013000000494E445F
      4649534943415F4A5552494449434101000000000015000000444553435F454E
      44455245434F5F454E545245474101000000000013000000444553435F434944
      4144455F454E545245474101000000000013000000444553435F42414952524F
      5F454E545245474101000000000008000000444553435F4F4253010000000000
      09000000444553435F4F42533101000000000009000000444553435F4F425332
      01000000000011000000444553435F464F524D415F434F4D5052410100000000
      000B000000434F445F5553554152494F01000000000013000000444553435F52
      45465F434F4D45524349414C3101000000000013000000444553435F5245465F
      434F4D45524349414C3201000000000013000000444553435F5245465F434F4D
      45524349414C330100000000000F000000444553435F5245465F42414E434F31
      0100000000000F000000444553435F5245465F42414E434F320100000000000F
      000000444553435F5245465F42414E434F330100000000001500000044455343
      5F5245465F504152454E54455F4E4F4D4501000000000019000000444553435F
      5245465F504152454E54455F454E44455245434F010000000000170000004445
      53435F5245465F504152454E54455F4349444144450100000000001900000044
      4553435F5245465F504152454E54455F54454C45464F4E450100000000000F00
      0000444553435F5245465F4F555452415301000000000011000000434F445F43
      4144415354524F5F4E4F564F01000000000012000000444553435F4F5247414F
      5F454D4953534F5201000000000013000000444553435F494E5343524943414F
      5F494E53530100000000000D000000444553435F434152544549524101000000
      00001500000044545F45585045444943414F5F43415254454952410100000000
      0015000000434F445F56454E4445444F525F505245504F53544F010000000000
      10000000494E445F4C49424552415F56454E444101000000000013000000494E
      445F524547494D455F455350454349414C0100000000000B000000444553435F
      484F424249450100000000000D000000444553435F444553545249544F010000
      00000013000000444553435F434F4E54415F434F5252454E5445010000000000
      10000000434F445F4F5045524143414F5F43433101000000000010000000434F
      445F4F5045524143414F5F4343320100000000000A000000444553435F504C41
      43410100000000000D000000504552435F444553434F4E544F01000000000013
      000000494E445F4C49424552415F424C4F515545544F01000000000014000000
      44545F434F4E53554C54415F53494E5452454741010000000000140000004454
      5F434F4E53554C54415F53494E54454752410100000000001600000044455343
      5F50524F46495353414F5F434F4E4A5547450100000000001500000044545F4E
      415343494D454E544F5F434F4E4A55474501000000000014000000444553435F
      454D50524553415F434F4E4A55474501000000000012000000564C5F53414C41
      52494F5F434F4E4A5547450100000000000B000000444553435F46554E43414F
      0100000000000C000000444553435F454D505245534101000000000011000000
      444553435F464F4E455F454D50524553410100000000000A000000444553435F
      54454D504F01000000000013000000444553435F504C4143415F434152524554
      413101000000000013000000444553435F504C4143415F434152524554413201
      000000000014000000444553435F42414952524F5F434F4252414E4341010000
      0000000B00000056414C5F53414C4152494F0100000000000C00000044455343
      5F4147454E4349410100000000000E000000444553435F474152414E54494153
      010000000000100000004E4F4D455F4155544F52495A41444F31010000000000
      100000004E4F4D455F4155544F52495A41444F32010000000000100000004E4F
      4D455F4155544F52495A41444F3301000000000014000000444553435F435046
      5F4155544F52495A41444F3101000000000014000000444553435F4350465F41
      55544F52495A41444F3201000000000014000000444553435F4350465F415554
      4F52495A41444F3301000000000014000000444553435F4F55545241535F4752
      414E5449415301000000000015000000444553435F474152414E544941535F4F
      55545241530100000000000E0000004E554D5F4449415F564953495441010000
      00000016000000444553435F4652455155454E4349415F564953495441010000
      0000000F0000004E554D5F484F52415F5649534954410100000000000E000000
      4E554D5F4449415F56454E43544F0100000000000C0000004E4F4D455F544954
      554C41520100000000000C00000044545F534550524F4341444F010000000000
      09000000504552435F4D45544101000000000014000000434F445F5052415A4F
      5F56454E43494D454E544F0100000000001B000000494E445F534F4A4943554C
      544F525F5041525449434950414E544501000000000019000000444553435F43
      4F4D504C454D454E544F5F53494E544547524101000000000008000000444553
      435F4352430100000000000C000000444553435F53554652414D410100000000
      0011000000444553435F5155414C494649434143414F01000000000012000000
      504552435F455350454349414C5F504543410100000000001500000050455243
      5F455350454349414C5F5345525649434F0100000000000C00000044545F414C
      5445524143414F01000000000012000000494E445F4154414341444F5F564152
      454A4F0100000000001000000044545F554C545F414C5445524143414F010000
      0000000A000000504552435F53454E4152010000000000110000004E554D5F4C
      49424552415F4C494D4954450100000000000F000000444553435F494E544547
      524143414F0100000000000A000000444553435F42414E434F01000000000015
      000000444553435F4147454E4349415F54454C45464F4E45010000000000}
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 24
    Top = 152
    object QCadastroCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QCadastroCOD_MOTIVO: TIntegerField
      FieldName = 'COD_MOTIVO'
    end
    object QCadastroCOD_TIPO_CADASTRO: TIntegerField
      FieldName = 'COD_TIPO_CADASTRO'
      Required = True
    end
    object QCadastroCOD_REGIAO: TIntegerField
      FieldName = 'COD_REGIAO'
    end
    object QCadastroCOD_PAIS: TIntegerField
      FieldName = 'COD_PAIS'
    end
    object QCadastroCOD_ESTADO_CIVIL: TIntegerField
      FieldName = 'COD_ESTADO_CIVIL'
    end
    object QCadastroCOD_RAMO: TIntegerField
      FieldName = 'COD_RAMO'
    end
    object QCadastroCOD_ESTADO: TStringField
      FieldName = 'COD_ESTADO'
      Size = 2
    end
    object QCadastroNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object QCadastroDESC_ENDERECO: TStringField
      FieldName = 'DESC_ENDERECO'
      Size = 40
    end
    object QCadastroDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      Size = 30
    end
    object QCadastroDESC_CEP: TStringField
      FieldName = 'DESC_CEP'
      Size = 9
    end
    object QCadastroNUM_CGC_CPF: TStringField
      FieldName = 'NUM_CGC_CPF'
      Size = 18
    end
    object QCadastroNUM_INSCRICAO: TStringField
      FieldName = 'NUM_INSCRICAO'
    end
    object QCadastroDT_CADASTRO: TDateTimeField
      FieldName = 'DT_CADASTRO'
      Required = True
    end
    object QCadastroIND_SEXO_CATEGORIA: TStringField
      FieldName = 'IND_SEXO_CATEGORIA'
      Required = True
      Size = 1
    end
    object QCadastroNUM_CAIXA_POSTAL: TIntegerField
      FieldName = 'NUM_CAIXA_POSTAL'
    end
    object QCadastroDT_CANCELAMENTO: TDateTimeField
      FieldName = 'DT_CANCELAMENTO'
    end
    object QCadastroDESC_TELEFONE: TStringField
      FieldName = 'DESC_TELEFONE'
      Size = 12
    end
    object QCadastroDESC_CELULAR: TStringField
      FieldName = 'DESC_CELULAR'
      Size = 12
    end
    object QCadastroNOME_CONTATO: TStringField
      FieldName = 'NOME_CONTATO'
      Size = 30
    end
    object QCadastroDT_NASCIMENTO: TDateTimeField
      FieldName = 'DT_NASCIMENTO'
    end
    object QCadastroDESC_BAIRRO: TStringField
      FieldName = 'DESC_BAIRRO'
    end
    object QCadastroPERC_FUNRURAL: TFloatField
      FieldName = 'PERC_FUNRURAL'
    end
    object QCadastroVAL_LIMITE: TFloatField
      FieldName = 'VAL_LIMITE'
    end
    object QCadastroDESC_FANTASIA: TStringField
      FieldName = 'DESC_FANTASIA'
      Size = 30
    end
    object QCadastroDESC_CIDADE_COBRANCA: TStringField
      FieldName = 'DESC_CIDADE_COBRANCA'
      Size = 30
    end
    object QCadastroDESC_ENDERECO_COBRANCA: TStringField
      FieldName = 'DESC_ENDERECO_COBRANCA'
      Size = 40
    end
    object QCadastroDESC_ESTADO_COBRANCA: TStringField
      FieldName = 'DESC_ESTADO_COBRANCA'
      Size = 2
    end
    object QCadastroDESC_CEP_COBRANCA: TStringField
      FieldName = 'DESC_CEP_COBRANCA'
      Size = 9
    end
    object QCadastroDESC_TELEFONE_COMERCIAL: TStringField
      FieldName = 'DESC_TELEFONE_COMERCIAL'
      Size = 12
    end
    object QCadastroNUM_JUNTA: TIntegerField
      FieldName = 'NUM_JUNTA'
    end
    object QCadastroDT_FUNDACAO: TDateTimeField
      FieldName = 'DT_FUNDACAO'
    end
    object QCadastroDT_JUNTA: TDateTimeField
      FieldName = 'DT_JUNTA'
    end
    object QCadastroDESC_FAX: TStringField
      FieldName = 'DESC_FAX'
      Size = 12
    end
    object QCadastroNOME_MAE: TStringField
      FieldName = 'NOME_MAE'
      Size = 40
    end
    object QCadastroNOME_PAI: TStringField
      FieldName = 'NOME_PAI'
      Size = 40
    end
    object QCadastroDESC_NATURALIDADE: TStringField
      FieldName = 'DESC_NATURALIDADE'
      Size = 30
    end
    object QCadastroDESC_ESTADO_NATURAL: TStringField
      FieldName = 'DESC_ESTADO_NATURAL'
      Size = 2
    end
    object QCadastroDT_EXPEDICAO_IDENTIDADE: TDateTimeField
      FieldName = 'DT_EXPEDICAO_IDENTIDADE'
    end
    object QCadastroDESC_E_MAIL: TStringField
      FieldName = 'DESC_E_MAIL'
      Size = 40
    end
    object QCadastroDESC_FAX_COBRANCA: TStringField
      FieldName = 'DESC_FAX_COBRANCA'
      Size = 12
    end
    object QCadastroIND_SEPROC_SIMNAO: TStringField
      FieldName = 'IND_SEPROC_SIMNAO'
      Size = 1
    end
    object QCadastroDESC_INSCRICAO_MUNICIPAL: TStringField
      FieldName = 'DESC_INSCRICAO_MUNICIPAL'
      Size = 15
    end
    object QCadastroNOME_CONJUGE: TStringField
      FieldName = 'NOME_CONJUGE'
      Size = 40
    end
    object QCadastroDESC_CPF_CONJUGE: TStringField
      FieldName = 'DESC_CPF_CONJUGE'
      Size = 15
    end
    object QCadastroDESC_IDENTIDADE_CONJUGE: TStringField
      FieldName = 'DESC_IDENTIDADE_CONJUGE'
      Size = 15
    end
    object QCadastroCOD_CLASS_CADASTRO: TIntegerField
      FieldName = 'COD_CLASS_CADASTRO'
    end
    object QCadastroCOD_BANCO_AGENCIA: TIntegerField
      FieldName = 'COD_BANCO_AGENCIA'
    end
    object QCadastroCOD_OPERACAO_CC: TIntegerField
      FieldName = 'COD_OPERACAO_CC'
    end
    object QCadastroDT_NASCIMENTO_CONTATO: TDateTimeField
      FieldName = 'DT_NASCIMENTO_CONTATO'
    end
    object QCadastroNOME_CONTATO2: TStringField
      FieldName = 'NOME_CONTATO2'
      Size = 30
    end
    object QCadastroDT_NASCIMENTO2: TDateTimeField
      FieldName = 'DT_NASCIMENTO2'
    end
    object QCadastroCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object QCadastroPERC_COMISSAO: TFloatField
      FieldName = 'PERC_COMISSAO'
    end
    object QCadastroDESC_COMPLEMENTO: TStringField
      FieldName = 'DESC_COMPLEMENTO'
      Size = 40
    end
    object QCadastroIND_FISICA_JURIDICA: TStringField
      FieldName = 'IND_FISICA_JURIDICA'
      Size = 1
    end
    object QCadastroDESC_ENDERECO_ENTREGA: TStringField
      FieldName = 'DESC_ENDERECO_ENTREGA'
      Size = 40
    end
    object QCadastroDESC_CIDADE_ENTREGA: TStringField
      FieldName = 'DESC_CIDADE_ENTREGA'
      Size = 30
    end
    object QCadastroDESC_BAIRRO_ENTREGA: TStringField
      FieldName = 'DESC_BAIRRO_ENTREGA'
    end
    object QCadastroDESC_OBS: TStringField
      FieldName = 'DESC_OBS'
      Size = 60
    end
    object QCadastroDESC_OBS1: TStringField
      FieldName = 'DESC_OBS1'
      Size = 60
    end
    object QCadastroDESC_OBS2: TStringField
      FieldName = 'DESC_OBS2'
      Size = 60
    end
    object QCadastroDESC_FORMA_COMPRA: TStringField
      FieldName = 'DESC_FORMA_COMPRA'
      Size = 15
    end
    object QCadastroCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
    object QCadastroDESC_REF_COMERCIAL1: TStringField
      FieldName = 'DESC_REF_COMERCIAL1'
      Size = 40
    end
    object QCadastroDESC_REF_COMERCIAL2: TStringField
      FieldName = 'DESC_REF_COMERCIAL2'
      Size = 40
    end
    object QCadastroDESC_REF_COMERCIAL3: TStringField
      FieldName = 'DESC_REF_COMERCIAL3'
      Size = 40
    end
    object QCadastroDESC_REF_BANCO1: TStringField
      FieldName = 'DESC_REF_BANCO1'
      Size = 40
    end
    object QCadastroDESC_REF_BANCO2: TStringField
      FieldName = 'DESC_REF_BANCO2'
      Size = 40
    end
    object QCadastroDESC_REF_BANCO3: TStringField
      FieldName = 'DESC_REF_BANCO3'
      Size = 40
    end
    object QCadastroDESC_REF_PARENTE_NOME: TStringField
      FieldName = 'DESC_REF_PARENTE_NOME'
      Size = 40
    end
    object QCadastroDESC_REF_PARENTE_ENDERECO: TStringField
      FieldName = 'DESC_REF_PARENTE_ENDERECO'
      Size = 40
    end
    object QCadastroDESC_REF_PARENTE_CIDADE: TStringField
      FieldName = 'DESC_REF_PARENTE_CIDADE'
      Size = 40
    end
    object QCadastroDESC_REF_PARENTE_TELEFONE: TStringField
      FieldName = 'DESC_REF_PARENTE_TELEFONE'
      Size = 15
    end
    object QCadastroDESC_REF_OUTRAS: TStringField
      FieldName = 'DESC_REF_OUTRAS'
      Size = 400
    end
    object QCadastroCOD_CADASTRO_NOVO: TIntegerField
      FieldName = 'COD_CADASTRO_NOVO'
    end
    object QCadastroDESC_ORGAO_EMISSOR: TStringField
      FieldName = 'DESC_ORGAO_EMISSOR'
      Size = 7
    end
    object QCadastroDESC_INSCRICAO_INSS: TStringField
      FieldName = 'DESC_INSCRICAO_INSS'
      Size = 15
    end
    object QCadastroDESC_CARTEIRA: TStringField
      FieldName = 'DESC_CARTEIRA'
      Size = 15
    end
    object QCadastroDT_EXPEDICAO_CARTEIRA: TDateTimeField
      FieldName = 'DT_EXPEDICAO_CARTEIRA'
    end
    object QCadastroCOD_VENDEDOR_PREPOSTO: TIntegerField
      FieldName = 'COD_VENDEDOR_PREPOSTO'
    end
    object QCadastroCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
    end
    object QCadastroIND_LIBERA_VENDA: TStringField
      FieldName = 'IND_LIBERA_VENDA'
      Size = 3
    end
    object QCadastroIND_REGIME_ESPECIAL: TStringField
      FieldName = 'IND_REGIME_ESPECIAL'
      Size = 3
    end
    object QCadastroDESC_HOBBIE: TStringField
      FieldName = 'DESC_HOBBIE'
      Size = 40
    end
    object QCadastroDESC_DESTRITO: TStringField
      FieldName = 'DESC_DESTRITO'
      Size = 30
    end
    object QCadastroDESC_CONTA_CORRENTE: TStringField
      FieldName = 'DESC_CONTA_CORRENTE'
      Size = 10
    end
    object QCadastroCOD_OPERACAO_CC1: TIntegerField
      FieldName = 'COD_OPERACAO_CC1'
    end
    object QCadastroCOD_OPERACAO_CC2: TIntegerField
      FieldName = 'COD_OPERACAO_CC2'
    end
    object QCadastroDESC_PLACA: TStringField
      FieldName = 'DESC_PLACA'
      Size = 8
    end
    object QCadastroPERC_DESCONTO: TFloatField
      FieldName = 'PERC_DESCONTO'
    end
    object QCadastroIND_LIBERA_BLOQUETO: TStringField
      FieldName = 'IND_LIBERA_BLOQUETO'
      Size = 3
    end
    object QCadastroDT_CONSULTA_SINTREGA: TDateTimeField
      FieldName = 'DT_CONSULTA_SINTREGA'
    end
    object QCadastroDT_CONSULTA_SINTEGRA: TDateTimeField
      FieldName = 'DT_CONSULTA_SINTEGRA'
    end
    object QCadastroDESC_PROFISSAO_CONJUGE: TStringField
      FieldName = 'DESC_PROFISSAO_CONJUGE'
      Size = 30
    end
    object QCadastroDT_NASCIMENTO_CONJUGE: TDateTimeField
      FieldName = 'DT_NASCIMENTO_CONJUGE'
    end
    object QCadastroDESC_EMPRESA_CONJUGE: TStringField
      FieldName = 'DESC_EMPRESA_CONJUGE'
      Size = 30
    end
    object QCadastroVL_SALARIO_CONJUGE: TFloatField
      FieldName = 'VL_SALARIO_CONJUGE'
    end
    object QCadastroDESC_FUNCAO: TStringField
      FieldName = 'DESC_FUNCAO'
      Size = 30
    end
    object QCadastroDESC_EMPRESA: TStringField
      FieldName = 'DESC_EMPRESA'
      Size = 30
    end
    object QCadastroDESC_FONE_EMPRESA: TStringField
      FieldName = 'DESC_FONE_EMPRESA'
      Size = 12
    end
    object QCadastroDESC_TEMPO: TStringField
      FieldName = 'DESC_TEMPO'
      Size = 10
    end
    object QCadastroDESC_PLACA_CARRETA1: TStringField
      FieldName = 'DESC_PLACA_CARRETA1'
      Size = 8
    end
    object QCadastroDESC_PLACA_CARRETA2: TStringField
      FieldName = 'DESC_PLACA_CARRETA2'
      Size = 8
    end
    object QCadastroDESC_BAIRRO_COBRANCA: TStringField
      FieldName = 'DESC_BAIRRO_COBRANCA'
    end
    object QCadastroVAL_SALARIO: TFloatField
      FieldName = 'VAL_SALARIO'
    end
    object QCadastroDESC_AGENCIA: TStringField
      FieldName = 'DESC_AGENCIA'
      Size = 10
    end
    object QCadastroDESC_GARANTIAS: TStringField
      FieldName = 'DESC_GARANTIAS'
      Size = 10
    end
    object QCadastroNOME_AUTORIZADO1: TStringField
      FieldName = 'NOME_AUTORIZADO1'
      Size = 30
    end
    object QCadastroNOME_AUTORIZADO2: TStringField
      FieldName = 'NOME_AUTORIZADO2'
      Size = 30
    end
    object QCadastroNOME_AUTORIZADO3: TStringField
      FieldName = 'NOME_AUTORIZADO3'
      Size = 30
    end
    object QCadastroDESC_CPF_AUTORIZADO1: TStringField
      FieldName = 'DESC_CPF_AUTORIZADO1'
      Size = 11
    end
    object QCadastroDESC_CPF_AUTORIZADO2: TStringField
      FieldName = 'DESC_CPF_AUTORIZADO2'
      Size = 11
    end
    object QCadastroDESC_CPF_AUTORIZADO3: TStringField
      FieldName = 'DESC_CPF_AUTORIZADO3'
      Size = 11
    end
    object QCadastroDESC_OUTRAS_GRANTIAS: TStringField
      FieldName = 'DESC_OUTRAS_GRANTIAS'
    end
    object QCadastroDESC_GARANTIAS_OUTRAS: TStringField
      FieldName = 'DESC_GARANTIAS_OUTRAS'
    end
    object QCadastroNUM_DIA_VISITA: TIntegerField
      FieldName = 'NUM_DIA_VISITA'
    end
    object QCadastroDESC_FREQUENCIA_VISITA: TStringField
      FieldName = 'DESC_FREQUENCIA_VISITA'
      Size = 1
    end
    object QCadastroNUM_HORA_VISITA: TIntegerField
      FieldName = 'NUM_HORA_VISITA'
    end
    object QCadastroNUM_DIA_VENCTO: TIntegerField
      FieldName = 'NUM_DIA_VENCTO'
    end
    object QCadastroNOME_TITULAR: TStringField
      FieldName = 'NOME_TITULAR'
      Size = 30
    end
    object QCadastroDT_SEPROCADO: TDateTimeField
      FieldName = 'DT_SEPROCADO'
    end
    object QCadastroPERC_META: TFloatField
      FieldName = 'PERC_META'
    end
    object QCadastroCOD_PRAZO_VENCIMENTO: TIntegerField
      FieldName = 'COD_PRAZO_VENCIMENTO'
    end
    object QCadastroIND_SOJICULTOR_PARTICIPANTE: TStringField
      FieldName = 'IND_SOJICULTOR_PARTICIPANTE'
      Size = 1
    end
    object QCadastroDESC_COMPLEMENTO_SINTEGRA: TStringField
      FieldName = 'DESC_COMPLEMENTO_SINTEGRA'
      Size = 15
    end
    object QCadastroDESC_CRC: TStringField
      FieldName = 'DESC_CRC'
      Size = 10
    end
    object QCadastroDESC_SUFRAMA: TStringField
      FieldName = 'DESC_SUFRAMA'
      Size = 9
    end
    object QCadastroDESC_QUALIFICACAO: TStringField
      FieldName = 'DESC_QUALIFICACAO'
      Size = 100
    end
    object QCadastroPERC_ESPECIAL_PECA: TFloatField
      FieldName = 'PERC_ESPECIAL_PECA'
    end
    object QCadastroPERC_ESPECIAL_SERVICO: TFloatField
      FieldName = 'PERC_ESPECIAL_SERVICO'
    end
    object QCadastroDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
    end
    object QCadastroIND_ATACADO_VAREJO: TStringField
      FieldName = 'IND_ATACADO_VAREJO'
      Size = 1
    end
    object QCadastroDT_ULT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ULT_ALTERACAO'
    end
    object QCadastroPERC_SENAR: TFloatField
      FieldName = 'PERC_SENAR'
    end
    object QCadastroNUM_LIBERA_LIMITE: TIntegerField
      FieldName = 'NUM_LIBERA_LIMITE'
    end
    object QCadastroDESC_INTEGRACAO: TStringField
      FieldName = 'DESC_INTEGRACAO'
      Size = 100
    end
    object QCadastroDESC_BANCO: TStringField
      FieldName = 'DESC_BANCO'
      Size = 30
    end
    object QCadastroDESC_AGENCIA_TELEFONE: TStringField
      FieldName = 'DESC_AGENCIA_TELEFONE'
      Size = 30
    end
  end
  object ZClientes: TZQuery
    Connection = ZConn
    SQL.Strings = (
      'SELECT'
      '  CLIENTES.*,'
      '  F.CLFS_RG,'
      '  F.CLFS_CPF,'
      '  F.CLFS_SEXO,'
      '  F.CLFS_CADPRODUTOR,'
      '  J.CLJR_CNPJ,'
      '  J.CLJR_INSCEST,'
      '  C.CID_ESTADO,'
      '  C.CID_NOME,'
      '  C.Cid_CodIBGE,'
      '  substr(C.cid_codibge, 1, 2) as COD_IBGE_ESTADO,'
      '  substr(C.cid_codibge, 3, 5) as COD_IBGE_CIDADE'
      'FROM'
      '  CLIENTES'
      'LEFT JOIN CLIENTESFISICA F ON F.CLI_CODIGO = CLIENTES.CLI_CODIGO'
      
        'LEFT JOIN CLIENTESJURIDICA J ON J.CLI_CODIGO = CLIENTES.CLI_CODI' +
        'GO'
      'LEFT JOIN CIDADES C ON C.CID_CODIGO = CLIENTES.CID_CODIGO')
    Params = <>
    Left = 80
    Top = 152
    object ZClientesCli_Codigo: TIntegerField
      FieldName = 'Cli_Codigo'
      Required = True
    end
    object ZClientesCli_Nome: TStringField
      FieldName = 'Cli_Nome'
      Size = 50
    end
    object ZClientesCli_NomeFant: TStringField
      FieldName = 'Cli_NomeFant'
      Size = 50
    end
    object ZClientesCli_Endereco: TStringField
      FieldName = 'Cli_Endereco'
      Size = 50
    end
    object ZClientesCli_Bairro: TStringField
      FieldName = 'Cli_Bairro'
      Size = 50
    end
    object ZClientesCli_CEP: TStringField
      FieldName = 'Cli_CEP'
      Size = 8
    end
    object ZClientesCli_Fone: TStringField
      FieldName = 'Cli_Fone'
      Size = 25
    end
    object ZClientesCli_FAX: TStringField
      FieldName = 'Cli_FAX'
      Size = 25
    end
    object ZClientesCli_Email: TStringField
      FieldName = 'Cli_Email'
      Size = 100
    end
    object ZClientesCli_CxPostal: TIntegerField
      FieldName = 'Cli_CxPostal'
    end
    object ZClientesCli_FisicaJuridica: TStringField
      FieldName = 'Cli_FisicaJuridica'
      Size = 1
    end
    object ZClientesCli_ConsumFinal: TStringField
      FieldName = 'Cli_ConsumFinal'
      Size = 1
    end
    object ZClientesCli_LimiteCredito: TFloatField
      FieldName = 'Cli_LimiteCredito'
    end
    object ZClientesCli_DataUltCompra: TDateField
      FieldName = 'Cli_DataUltCompra'
    end
    object ZClientesCli_VlrMaiorCompra: TFloatField
      FieldName = 'Cli_VlrMaiorCompra'
    end
    object ZClientesCli_MaiorAtraso: TIntegerField
      FieldName = 'Cli_MaiorAtraso'
    end
    object ZClientesCli_Observacoes: TBlobField
      FieldName = 'Cli_Observacoes'
    end
    object ZClientesCli_Serasa: TBlobField
      FieldName = 'Cli_Serasa'
    end
    object ZClientesCli_Situacao: TStringField
      FieldName = 'Cli_Situacao'
      Size = 1
    end
    object ZClientesCli_CodContabil: TIntegerField
      FieldName = 'Cli_CodContabil'
    end
    object ZClientesCli_IntegradoCx: TStringField
      FieldName = 'Cli_IntegradoCx'
      Size = 1
    end
    object ZClientesCli_CodContEntr: TIntegerField
      FieldName = 'Cli_CodContEntr'
    end
    object ZClientesCli_DataCad: TDateField
      FieldName = 'Cli_DataCad'
    end
    object ZClientesCli_DataUltAlter: TDateField
      FieldName = 'Cli_DataUltAlter'
    end
    object ZClientesCtCx_Codigo: TIntegerField
      FieldName = 'CtCx_Codigo'
    end
    object ZClientesOcp_Codigo: TIntegerField
      FieldName = 'Ocp_Codigo'
    end
    object ZClientesCid_Codigo: TIntegerField
      FieldName = 'Cid_Codigo'
    end
    object ZClientesPrt_Codigo: TIntegerField
      FieldName = 'Prt_Codigo'
    end
    object ZClientesSet_Codigo: TIntegerField
      FieldName = 'Set_Codigo'
    end
    object ZClientesCnd_Codigo: TIntegerField
      FieldName = 'Cnd_Codigo'
    end
    object ZClientesTabF_Codigo: TIntegerField
      FieldName = 'TabF_Codigo'
    end
    object ZClientesTPrc_Codigo: TIntegerField
      FieldName = 'TPrc_Codigo'
    end
    object ZClientesAss_Codigo: TIntegerField
      FieldName = 'Ass_Codigo'
    end
    object ZClientesMot_Codigo: TIntegerField
      FieldName = 'Mot_Codigo'
    end
    object ZClientesCli_FormaBloqueio: TStringField
      FieldName = 'Cli_FormaBloqueio'
      Size = 1
    end
    object ZClientesCli_IEFisica: TStringField
      FieldName = 'Cli_IEFisica'
      Size = 1
    end
    object ZClientesCli_IRRF: TFloatField
      FieldName = 'Cli_IRRF'
    end
    object ZClientesCli_RefComerciais: TBlobField
      FieldName = 'Cli_RefComerciais'
    end
    object ZClientesCli_HoraUltCompra: TTimeField
      FieldName = 'Cli_HoraUltCompra'
    end
    object ZClientesCli_NFUltCompra: TIntegerField
      FieldName = 'Cli_NFUltCompra'
    end
    object ZClientesCli_FilUltCompra: TIntegerField
      FieldName = 'Cli_FilUltCompra'
    end
    object ZClientesCli_SerUltCompra: TStringField
      FieldName = 'Cli_SerUltCompra'
      Size = 3
    end
    object ZClientesCli_DescMax: TFloatField
      FieldName = 'Cli_DescMax'
    end
    object ZClientesCli_Complemento: TStringField
      FieldName = 'Cli_Complemento'
      Size = 50
    end
    object ZClientesCli_EndNumero: TStringField
      FieldName = 'Cli_EndNumero'
      Size = 10
    end
    object ZClientesCli_CodANP: TStringField
      FieldName = 'Cli_CodANP'
      Size = 7
    end
    object ZClientesCLFS_RG: TStringField
      FieldName = 'CLFS_RG'
    end
    object ZClientesCLFS_CPF: TStringField
      FieldName = 'CLFS_CPF'
    end
    object ZClientesCLFS_SEXO: TStringField
      FieldName = 'CLFS_SEXO'
      Size = 1
    end
    object ZClientesCLFS_CADPRODUTOR: TStringField
      FieldName = 'CLFS_CADPRODUTOR'
      Size = 30
    end
    object ZClientesCLJR_CNPJ: TStringField
      FieldName = 'CLJR_CNPJ'
    end
    object ZClientesCLJR_INSCEST: TStringField
      FieldName = 'CLJR_INSCEST'
    end
    object ZClientesCID_ESTADO: TStringField
      FieldName = 'CID_ESTADO'
      Size = 2
    end
    object ZClientesCID_NOME: TStringField
      FieldName = 'CID_NOME'
      Size = 50
    end
    object ZClientesCid_CodIBGE: TIntegerField
      FieldName = 'Cid_CodIBGE'
    end
    object ZClientesCOD_IBGE_ESTADO: TStringField
      FieldName = 'COD_IBGE_ESTADO'
      ReadOnly = True
      Size = 2
    end
    object ZClientesCOD_IBGE_CIDADE: TStringField
      FieldName = 'COD_IBGE_CIDADE'
      ReadOnly = True
      Size = 5
    end
  end
  object QSeq: TOracleDataSet1
    SQL.Strings = (
      'SELECT (:SEQ.NEXTVAL) AS VALOR FROM DUAL')
    Variables.Data = {0300000001000000040000003A534551010000000000000000000000}
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000E0000000A000000434F445F434C415353450100000000000B000000
      434F445F50524F4455544F0100000000000C000000444553435F50524F445554
      4F01000000000009000000434F445F4D415243410100000000000E000000434F
      445F5452494255544143414F01000000000010000000494E445F5449504F5F50
      524F4455544F01000000000008000000504552435F4953530100000000000900
      0000504552435F494E53530100000000000C000000444553435F554E49444144
      450100000000000D0000004E554D5F454D42414C4147454D0100000000000E00
      00004E554D5F464142524943414E54450100000000000E0000004E554D5F4745
      4E45524F5F4E434D0100000000000E0000004E554D5F5045534F5F425255544F
      010000000000100000004E554D5F5045534F5F4C49515549444F010000000000}
    Session = DMOracle.DBCemapa
    Left = 208
    Top = 8
    object QSeqVALOR: TFloatField
      FieldName = 'VALOR'
    end
  end
  object QCidade: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_CIDADE.COD_CIDADE,'
      '  TB_CIDADE.DESC_CIDADE,'
      '  TB_CIDADE.COD_ESTADO'
      'FROM'
      '  TB_CIDADE'
      
        'INNER JOIN TB_ESTADO ON TB_ESTADO.COD_ESTADO = TB_CIDADE.COD_EST' +
        'ADO'
      'WHERE'
      '  TB_CIDADE.COD_CIDADE_IBGE = :COD_CIDADE_IBGE'
      'AND'
      '  TB_ESTADO.COD_UF_IBGE = :COD_UF_IBGE'
      ''
      '/*'
      'WHERE'
      '  UPPER(TRIM(TB_CIDADE.COD_ESTADO)) = UPPER(TRIM(:COD_ESTADO))'
      'AND'
      '  UPPER(TRIM(TB_CIDADE.DESC_CIDADE)) = UPPER(TRIM(:DESC_CIDADE))'
      '*/')
    Variables.Data = {
      0300000002000000100000003A434F445F4349444144455F4942474505000000
      00000000000000000C0000003A434F445F55465F494247450500000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      04000000030000000A000000434F445F4349444144450100000000000B000000
      444553435F4349444144450100000000000A000000434F445F45535441444F01
      0000000000}
    Session = DMOracle.DBCemapa
    Left = 24
    Top = 104
    object QCidadeCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
      Required = True
    end
    object QCidadeDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      Required = True
      Size = 50
    end
    object QCidadeCOD_ESTADO: TStringField
      FieldName = 'COD_ESTADO'
      Required = True
      Size = 2
    end
  end
  object QCidadeNome: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_CIDADE.COD_CIDADE,'
      '  TB_CIDADE.DESC_CIDADE,'
      '  TB_CIDADE.COD_ESTADO'
      'FROM'
      '  TB_CIDADE'
      'WHERE'
      '  UPPER(TRIM(TB_CIDADE.COD_ESTADO)) = UPPER(TRIM(:COD_ESTADO))'
      'AND'
      '  UPPER(TRIM(TB_CIDADE.DESC_CIDADE)) = UPPER(TRIM(:DESC_CIDADE))')
    Variables.Data = {
      03000000020000000B0000003A434F445F45535441444F050000000000000000
      0000000C0000003A444553435F434944414445050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000030000000A000000434F445F4349444144450100000000000B000000
      444553435F4349444144450100000000000A000000434F445F45535441444F01
      0000000000}
    Session = DMOracle.DBCemapa
    Left = 88
    Top = 104
    object QCidadeNomeCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
      Required = True
    end
    object QCidadeNomeDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      Required = True
      Size = 50
    end
    object QCidadeNomeCOD_ESTADO: TStringField
      FieldName = 'COD_ESTADO'
      Required = True
      Size = 2
    end
  end
  object ZCR: TZQuery
    Connection = ZConn
    SQL.Strings = (
      'SELECT'
      '  titulosreceber.*'
      'FROM'
      '  titulosreceber')
    Params = <>
    Left = 80
    Top = 200
    object ZCRFil_Codigo: TIntegerField
      FieldName = 'Fil_Codigo'
      Required = True
    end
    object ZCRSer_Codigo: TStringField
      FieldName = 'Ser_Codigo'
      Required = True
      Size = 3
    end
    object ZCRTit_Titulo: TIntegerField
      FieldName = 'Tit_Titulo'
      Required = True
    end
    object ZCRTit_Parcela: TIntegerField
      FieldName = 'Tit_Parcela'
      Required = True
    end
    object ZCRTit_DataLcto: TDateField
      FieldName = 'Tit_DataLcto'
    end
    object ZCRTit_DataVcto: TDateField
      FieldName = 'Tit_DataVcto'
    end
    object ZCRTit_DataNota: TDateField
      FieldName = 'Tit_DataNota'
    end
    object ZCRTit_NrNF: TIntegerField
      FieldName = 'Tit_NrNF'
    end
    object ZCRTit_VlrNota: TFloatField
      FieldName = 'Tit_VlrNota'
    end
    object ZCRTit_VlrTitulo: TFloatField
      FieldName = 'Tit_VlrTitulo'
    end
    object ZCRTit_Saldo: TFloatField
      FieldName = 'Tit_Saldo'
    end
    object ZCRTit_VlrDesc: TFloatField
      FieldName = 'Tit_VlrDesc'
    end
    object ZCRTit_VlrMulta: TFloatField
      FieldName = 'Tit_VlrMulta'
    end
    object ZCRTit_VlrDespCart: TFloatField
      FieldName = 'Tit_VlrDespCart'
    end
    object ZCRTit_VlrJurosDia: TFloatField
      FieldName = 'Tit_VlrJurosDia'
    end
    object ZCRTit_DiasProtesto: TIntegerField
      FieldName = 'Tit_DiasProtesto'
    end
    object ZCRTit_Obs: TStringField
      FieldName = 'Tit_Obs'
      Size = 250
    end
    object ZCRTit_DevDuv: TStringField
      FieldName = 'Tit_DevDuv'
      Size = 1
    end
    object ZCRTit_Descontado: TStringField
      FieldName = 'Tit_Descontado'
      Size = 1
    end
    object ZCRTit_Capres: TStringField
      FieldName = 'Tit_Capres'
      Size = 1
    end
    object ZCRTit_AvisoCob: TStringField
      FieldName = 'Tit_AvisoCob'
      Size = 1
    end
    object ZCRTit_NrCNAB: TStringField
      FieldName = 'Tit_NrCNAB'
    end
    object ZCRTit_Situacao: TStringField
      FieldName = 'Tit_Situacao'
      Size = 1
    end
    object ZCRCli_Codigo: TIntegerField
      FieldName = 'Cli_Codigo'
    end
    object ZCRPrt_Codigo: TIntegerField
      FieldName = 'Prt_Codigo'
    end
    object ZCRTit_Impresso: TStringField
      FieldName = 'Tit_Impresso'
      Size = 1
    end
    object ZCRTit_OcorrCNAB: TStringField
      FieldName = 'Tit_OcorrCNAB'
      Size = 2
    end
    object ZCRTit_DataRemCNAB: TDateField
      FieldName = 'Tit_DataRemCNAB'
    end
    object ZCRTit_CNABEnviado: TStringField
      FieldName = 'Tit_CNABEnviado'
      Size = 2
    end
    object ZCRTit_Vendedores: TStringField
      FieldName = 'Tit_Vendedores'
      Size = 30
    end
    object ZCRTit_PercComiss: TFloatField
      FieldName = 'Tit_PercComiss'
    end
    object ZCRTit_VlrComiss: TFloatField
      FieldName = 'Tit_VlrComiss'
    end
    object ZCRTit_InstrCobranca: TStringField
      FieldName = 'Tit_InstrCobranca'
      Size = 10
    end
    object ZCRTit_PercJuros: TFloatField
      FieldName = 'Tit_PercJuros'
    end
    object ZCRTit_DataBaixa: TDateField
      FieldName = 'Tit_DataBaixa'
    end
  end
  object QCR: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_CONTA_RECEBER_CAB.ROWID,'
      '  TB_CONTA_RECEBER_CAB.*'
      'FROM'
      '  TB_CONTA_RECEBER_CAB')
    QBEDefinition.QBEFieldDefs = {
      040000002A0000000C000000434F445F434144415354524F0100000000001100
      0000434F445F42414E434F5F4147454E4349410100000000000C000000434F44
      5F56454E4445444F520100000000000D000000504552435F434F4D495353414F
      01000000000008000000444553435F4F425301000000000015000000434F445F
      434F4E54415F524543454245525F4341420100000000000E000000434F445F46
      494E414C49444144450100000000000A000000434F445F46494C49414C010000
      0000000A0000004E554D5F544954554C4F0100000000000B0000004E554D5F50
      415243454C4101000000000013000000444553435F5449504F5F444F43554D45
      4E544F0100000000000C00000044545F4D4F56494D454E544F01000000000008
      00000044545F42414958410100000000000D00000044545F56454E43494D454E
      544F0100000000000A00000044545F454D495353414F01000000000010000000
      44545F4341504954414C495A4143414F0100000000000A00000056414C5F5449
      54554C4F0100000000000B00000056414C5F4E45474F43494F0100000000000A
      000000494E445F4143454954450100000000000C000000494E445F5349545541
      43414F0100000000000F000000444553435F4F42534552564143414F01000000
      00000C000000434F445F4E4F54415F4341420100000000000C00000056414C5F
      4F524947494E414C01000000000010000000434F445F4E4F53534F5F4E554D45
      524F0100000000000900000056414C5F4A55524F530100000000001000000043
      4F445F444550415254414D454E544F01000000000011000000434F445F434F4E
      545241544F5F56454E440100000000000E000000444553435F4156414C495354
      41310100000000000E000000444553435F4156414C4953544132010000000000
      1600000044545F4341504954414C495A4143414F5F4D4F454441010000000000
      0F00000056414C5F50524F4D4953534F52494101000000000011000000494E44
      5F454E564941444F5F42414E434F01000000000012000000434F445F434F4E54
      415F434F5252454E544501000000000014000000434F445F4F5244454D5F434F
      4D5052415F43414201000000000011000000434F445F4F4252415F434F4E5452
      41544F01000000000011000000494E445F454D495449444F5F4341524E450100
      0000000015000000434F445F4F4252415F434F4E545241544F5F4D4F56010000
      000000060000004E554D5F4F5301000000000015000000434F445F4F5244454D
      5F5345525649434F5F4341420100000000000D000000434F445F56454E444544
      4F52310100000000000E000000504552435F434F4D495353414F310100000000
      000F000000434F445F4F464943494E415F434142010000000000}
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 24
    Top = 200
    object QCRCOD_CONTA_RECEBER_CAB: TIntegerField
      FieldName = 'COD_CONTA_RECEBER_CAB'
      Required = True
    end
    object QCRCOD_FINALIDADE: TIntegerField
      FieldName = 'COD_FINALIDADE'
    end
    object QCRCOD_BANCO_AGENCIA: TIntegerField
      FieldName = 'COD_BANCO_AGENCIA'
    end
    object QCRCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
    end
    object QCRNUM_TITULO: TFloatField
      FieldName = 'NUM_TITULO'
    end
    object QCRNUM_PARCELA: TIntegerField
      FieldName = 'NUM_PARCELA'
    end
    object QCRDESC_TIPO_DOCUMENTO: TStringField
      FieldName = 'DESC_TIPO_DOCUMENTO'
      Size = 3
    end
    object QCRDT_MOVIMENTO: TDateTimeField
      FieldName = 'DT_MOVIMENTO'
    end
    object QCRDT_BAIXA: TDateTimeField
      FieldName = 'DT_BAIXA'
    end
    object QCRDT_VENCIMENTO: TDateTimeField
      FieldName = 'DT_VENCIMENTO'
      Required = True
    end
    object QCRDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
    object QCRDT_CAPITALIZACAO: TDateTimeField
      FieldName = 'DT_CAPITALIZACAO'
    end
    object QCRVAL_TITULO: TFloatField
      FieldName = 'VAL_TITULO'
    end
    object QCRVAL_NEGOCIO: TFloatField
      FieldName = 'VAL_NEGOCIO'
    end
    object QCRIND_ACEITE: TStringField
      FieldName = 'IND_ACEITE'
      Size = 3
    end
    object QCRIND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Size = 13
    end
    object QCRDESC_OBSERVACAO: TStringField
      FieldName = 'DESC_OBSERVACAO'
      Size = 50
    end
    object QCRCOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
    end
    object QCRCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QCRVAL_ORIGINAL: TFloatField
      FieldName = 'VAL_ORIGINAL'
    end
    object QCRCOD_NOSSO_NUMERO: TStringField
      FieldName = 'COD_NOSSO_NUMERO'
      Size = 17
    end
    object QCRVAL_JUROS: TFloatField
      FieldName = 'VAL_JUROS'
    end
    object QCRCOD_DEPARTAMENTO: TIntegerField
      FieldName = 'COD_DEPARTAMENTO'
      Required = True
    end
    object QCRCOD_CONTRATO_VEND: TIntegerField
      FieldName = 'COD_CONTRATO_VEND'
    end
    object QCRDESC_AVALISTA1: TStringField
      FieldName = 'DESC_AVALISTA1'
      Size = 40
    end
    object QCRDESC_AVALISTA2: TStringField
      FieldName = 'DESC_AVALISTA2'
      Size = 40
    end
    object QCRCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object QCRPERC_COMISSAO: TFloatField
      FieldName = 'PERC_COMISSAO'
      Required = True
    end
    object QCRDT_CAPITALIZACAO_MOEDA: TDateTimeField
      FieldName = 'DT_CAPITALIZACAO_MOEDA'
    end
    object QCRVAL_PROMISSORIA: TFloatField
      FieldName = 'VAL_PROMISSORIA'
    end
    object QCRIND_ENVIADO_BANCO: TStringField
      FieldName = 'IND_ENVIADO_BANCO'
      Size = 3
    end
    object QCRCOD_CONTA_CORRENTE: TIntegerField
      FieldName = 'COD_CONTA_CORRENTE'
    end
    object QCRCOD_ORDEM_COMPRA_CAB: TIntegerField
      FieldName = 'COD_ORDEM_COMPRA_CAB'
    end
    object QCRCOD_OBRA_CONTRATO: TIntegerField
      FieldName = 'COD_OBRA_CONTRATO'
    end
    object QCRIND_EMITIDO_CARNE: TStringField
      FieldName = 'IND_EMITIDO_CARNE'
      Size = 3
    end
    object QCRCOD_OBRA_CONTRATO_MOV: TIntegerField
      FieldName = 'COD_OBRA_CONTRATO_MOV'
    end
    object QCRNUM_OS: TIntegerField
      FieldName = 'NUM_OS'
    end
    object QCRCOD_ORDEM_SERVICO_CAB: TIntegerField
      FieldName = 'COD_ORDEM_SERVICO_CAB'
    end
    object QCRDESC_OBS: TStringField
      FieldName = 'DESC_OBS'
      Size = 1000
    end
    object QCRCOD_VENDEDOR1: TIntegerField
      FieldName = 'COD_VENDEDOR1'
    end
    object QCRPERC_COMISSAO1: TFloatField
      FieldName = 'PERC_COMISSAO1'
      Required = True
    end
    object QCRCOD_OFICINA_CAB: TIntegerField
      FieldName = 'COD_OFICINA_CAB'
    end
  end
  object ZCRMov: TZQuery
    Connection = ZConn
    SQL.Strings = (
      'SELECT'
      '  movimentoreceber.*'
      'FROM'
      '  movimentoreceber'
      'INNER JOIN titulosreceber ON ('
      '  titulosreceber.fil_codigo = movimentoreceber.fil_codigo'
      '  titulosreceber.ser_codigo = movimentoreceber.ser_codigo'
      '  titulosreceber.tit_titulo = movimentoreceber.tit_titulo'
      '  titulosreceber.tit_parcela = movimentoreceber.tit_parcela'
      '  )'
      'WHERE'
      '  titulosreceber.tit_codigo = :tit_codigo')
    Params = <
      item
        DataType = ftUnknown
        Name = 'tit_codigo'
        ParamType = ptUnknown
      end>
    Left = 80
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tit_codigo'
        ParamType = ptUnknown
      end>
    object ZCRMovMov_Codigo: TIntegerField
      FieldName = 'Mov_Codigo'
      Required = True
    end
    object ZCRMovMov_DataLcto: TDateField
      FieldName = 'Mov_DataLcto'
    end
    object ZCRMovMov_Valor: TFloatField
      FieldName = 'Mov_Valor'
    end
    object ZCRMovFil_Codigo: TIntegerField
      FieldName = 'Fil_Codigo'
    end
    object ZCRMovSer_Codigo: TStringField
      FieldName = 'Ser_Codigo'
      Size = 3
    end
    object ZCRMovTit_Titulo: TIntegerField
      FieldName = 'Tit_Titulo'
    end
    object ZCRMovTit_Parcela: TIntegerField
      FieldName = 'Tit_Parcela'
    end
    object ZCRMovHsRc_Codigo: TIntegerField
      FieldName = 'HsRc_Codigo'
    end
    object ZCRMovMov_VlrJuro: TFloatField
      FieldName = 'Mov_VlrJuro'
    end
    object ZCRMovMov_VlrMulta: TFloatField
      FieldName = 'Mov_VlrMulta'
    end
    object ZCRMovMov_VlrDesc: TFloatField
      FieldName = 'Mov_VlrDesc'
    end
    object ZCRMovMov_VlrDespCart: TFloatField
      FieldName = 'Mov_VlrDespCart'
    end
    object ZCRMovMov_Estornado: TStringField
      FieldName = 'Mov_Estornado'
      Size = 1
    end
    object ZCRMovMov_ObsEst: TStringField
      FieldName = 'Mov_ObsEst'
      Size = 150
    end
    object ZCRMovMov_Caixa: TIntegerField
      FieldName = 'Mov_Caixa'
    end
    object ZCRMovMov_Obs: TBlobField
      FieldName = 'Mov_Obs'
    end
    object ZCRMovMov_MovVinculados: TIntegerField
      FieldName = 'Mov_MovVinculados'
    end
    object ZCRMovCtBn_Codigo: TIntegerField
      FieldName = 'CtBn_Codigo'
    end
    object ZCRMovMov_Banco: TIntegerField
      FieldName = 'Mov_Banco'
    end
  end
  object QCRMov: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_CONTA_RECEBER_MOV.ROWID,'
      '  TB_CONTA_RECEBER_MOV.*'
      'FROM'
      '  TB_CONTA_RECEBER_MOV')
    QBEDefinition.QBEFieldDefs = {
      040000001100000015000000434F445F434F4E54415F524543454245525F4341
      420100000000000C00000044545F4D4F56494D454E544F0100000000000F0000
      00444553435F4F42534552564143414F0100000000000C000000434F445F4E4F
      54415F43414201000000000015000000434F445F434F4E54415F524543454245
      525F4D4F560100000000000D00000056414C5F4D4F56494D454E544F01000000
      00000B000000434F445F5553554152494F0100000000000A00000044545F5553
      554152494F01000000000012000000494E445F5449504F5F4D4F56494D454E54
      4F01000000000011000000434F445F42434F5F4D4F56494D454E544F01000000
      00000D000000434F445F43414958415F4D4F5601000000000018000000434F44
      5F4C414E43544F5F434F4E544142494C5F435245440100000000001700000043
      4F445F4C414E43544F5F434F4E544142494C5F4445420100000000000D000000
      494E445F4445564F4C5543414F01000000000013000000494E445F464F524D41
      5F504147414D454E544F01000000000009000000494E445F54524F4341010000
      00000010000000434F445F414449414E54414D454E544F010000000000}
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 24
    Top = 248
    object QCRMovCOD_CONTA_RECEBER_MOV: TIntegerField
      FieldName = 'COD_CONTA_RECEBER_MOV'
      Required = True
    end
    object QCRMovCOD_CONTA_RECEBER_CAB: TIntegerField
      FieldName = 'COD_CONTA_RECEBER_CAB'
    end
    object QCRMovDT_MOVIMENTO: TDateTimeField
      FieldName = 'DT_MOVIMENTO'
    end
    object QCRMovVAL_MOVIMENTO: TFloatField
      FieldName = 'VAL_MOVIMENTO'
    end
    object QCRMovDESC_OBSERVACAO: TStringField
      FieldName = 'DESC_OBSERVACAO'
      Size = 50
    end
    object QCRMovCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
    object QCRMovDT_USUARIO: TDateTimeField
      FieldName = 'DT_USUARIO'
    end
    object QCRMovIND_TIPO_MOVIMENTO: TStringField
      FieldName = 'IND_TIPO_MOVIMENTO'
      Required = True
    end
    object QCRMovCOD_BCO_MOVIMENTO: TIntegerField
      FieldName = 'COD_BCO_MOVIMENTO'
    end
    object QCRMovCOD_CAIXA_MOV: TIntegerField
      FieldName = 'COD_CAIXA_MOV'
    end
    object QCRMovCOD_LANCTO_CONTABIL_CRED: TIntegerField
      FieldName = 'COD_LANCTO_CONTABIL_CRED'
    end
    object QCRMovCOD_LANCTO_CONTABIL_DEB: TIntegerField
      FieldName = 'COD_LANCTO_CONTABIL_DEB'
    end
    object QCRMovCOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
    end
    object QCRMovIND_DEVOLUCAO: TStringField
      FieldName = 'IND_DEVOLUCAO'
      Size = 3
    end
    object QCRMovIND_FORMA_PAGAMENTO: TStringField
      FieldName = 'IND_FORMA_PAGAMENTO'
      Size = 8
    end
    object QCRMovIND_TROCA: TStringField
      FieldName = 'IND_TROCA'
      Size = 3
    end
    object QCRMovCOD_ADIANTAMENTO: TIntegerField
      FieldName = 'COD_ADIANTAMENTO'
    end
  end
end
