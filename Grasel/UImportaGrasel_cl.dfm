object DMImportaGrasel: TDMImportaGrasel
  OldCreateOrder = False
  Left = 197
  Top = 95
  Height = 602
  Width = 715
  object IBQCadastro: TIBQuery
    Database = DMConexao.IBInterbase
    Transaction = DMConexao.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select '
      '   cliente.*,'
      '   CIDADE.ESTADO,'
      '   CIDADE.CIDADE AS DESC_CIDADE'
      'from'
      '   CLIENTE,'
      '   CIDADE'
      'WHERE'
      '   CLIENTE.CIDADE = CIDADE.CODIGO')
    Left = 40
    Top = 24
    object IBQCadastroCODIGOCLIENTE: TIntegerField
      FieldName = 'CODIGOCLIENTE'
      Origin = 'CLIENTE.CODIGOCLIENTE'
      Required = True
    end
    object IBQCadastroNOME: TIBStringField
      FieldName = 'NOME'
      Origin = 'CLIENTE.NOME'
      Required = True
      Size = 60
    end
    object IBQCadastroAPELIDO: TIBStringField
      FieldName = 'APELIDO'
      Origin = 'CLIENTE.APELIDO'
      Required = True
      Size = 60
    end
    object IBQCadastroENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Origin = 'CLIENTE.ENDERECO'
      Required = True
      Size = 60
    end
    object IBQCadastroENDERECONUMERORUA: TIBStringField
      FieldName = 'ENDERECONUMERORUA'
      Origin = 'CLIENTE.ENDERECONUMERORUA'
      Size = 8
    end
    object IBQCadastroENDERECOBAIRRO: TIBStringField
      FieldName = 'ENDERECOBAIRRO'
      Origin = 'CLIENTE.ENDERECOBAIRRO'
      Size = 60
    end
    object IBQCadastroENDERECOCXPOSTAL: TIntegerField
      FieldName = 'ENDERECOCXPOSTAL'
      Origin = 'CLIENTE.ENDERECOCXPOSTAL'
    end
    object IBQCadastroENDERECOCOMPLEMENTO: TIBStringField
      FieldName = 'ENDERECOCOMPLEMENTO'
      Origin = 'CLIENTE.ENDERECOCOMPLEMENTO'
      Size = 40
    end
    object IBQCadastroENDERECOANTERIOR: TIBStringField
      FieldName = 'ENDERECOANTERIOR'
      Origin = 'CLIENTE.ENDERECOANTERIOR'
      Size = 60
    end
    object IBQCadastroCIDADE: TIntegerField
      FieldName = 'CIDADE'
      Origin = 'CLIENTE.CIDADE'
    end
    object IBQCadastroRESIDENCIALFONE: TIBStringField
      FieldName = 'RESIDENCIALFONE'
      Origin = 'CLIENTE.RESIDENCIALFONE'
      Size = 16
    end
    object IBQCadastroRESIDENCIALFAX: TIBStringField
      FieldName = 'RESIDENCIALFAX'
      Origin = 'CLIENTE.RESIDENCIALFAX'
      Size = 16
    end
    object IBQCadastroCOMERCIALFONE: TIBStringField
      FieldName = 'COMERCIALFONE'
      Origin = 'CLIENTE.COMERCIALFONE'
      Size = 16
    end
    object IBQCadastroCOMERCIALFAX: TIBStringField
      FieldName = 'COMERCIALFAX'
      Origin = 'CLIENTE.COMERCIALFAX'
      Size = 16
    end
    object IBQCadastroCONTATO: TIBStringField
      FieldName = 'CONTATO'
      Origin = 'CLIENTE.CONTATO'
      Size = 30
    end
    object IBQCadastroCONTATOCELULAR: TIBStringField
      FieldName = 'CONTATOCELULAR'
      Origin = 'CLIENTE.CONTATOCELULAR'
      Size = 16
    end
    object IBQCadastroPESSOAFISICAJURIDICA: TIBStringField
      FieldName = 'PESSOAFISICAJURIDICA'
      Origin = 'CLIENTE.PESSOAFISICAJURIDICA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object IBQCadastroCONSUMIDORFINAL: TSmallintField
      FieldName = 'CONSUMIDORFINAL'
      Origin = 'CLIENTE.CONSUMIDORFINAL'
      Required = True
    end
    object IBQCadastroCPFCNPJ: TIBStringField
      FieldName = 'CPFCNPJ'
      Origin = 'CLIENTE.CPFCNPJ'
      Size = 18
    end
    object IBQCadastroRGIE: TIBStringField
      FieldName = 'RGIE'
      Origin = 'CLIENTE.RGIE'
      Size = 14
    end
    object IBQCadastroDATANASCIMENTO: TDateField
      FieldName = 'DATANASCIMENTO'
      Origin = 'CLIENTE.DATANASCIMENTO'
    end
    object IBQCadastroEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'CLIENTE.EMAIL'
      Size = 60
    end
    object IBQCadastroHOMEPAGE: TIBStringField
      FieldName = 'HOMEPAGE'
      Origin = 'CLIENTE.HOMEPAGE'
      Size = 60
    end
    object IBQCadastroNOMEPAI: TIBStringField
      FieldName = 'NOMEPAI'
      Origin = 'CLIENTE.NOMEPAI'
      Size = 60
    end
    object IBQCadastroNOMEMAE: TIBStringField
      FieldName = 'NOMEMAE'
      Origin = 'CLIENTE.NOMEMAE'
      Size = 60
    end
    object IBQCadastroNATURALIDADE: TIntegerField
      FieldName = 'NATURALIDADE'
      Origin = 'CLIENTE.NATURALIDADE'
      Required = True
    end
    object IBQCadastroESTADOCIVIL: TIBStringField
      FieldName = 'ESTADOCIVIL'
      Origin = 'CLIENTE.ESTADOCIVIL'
      Required = True
      FixedChar = True
      Size = 1
    end
    object IBQCadastroSEXO: TIBStringField
      FieldName = 'SEXO'
      Origin = 'CLIENTE.SEXO'
      FixedChar = True
      Size = 1
    end
    object IBQCadastroCODIGOPROFISSAO: TIntegerField
      FieldName = 'CODIGOPROFISSAO'
      Origin = 'CLIENTE.CODIGOPROFISSAO'
      Required = True
    end
    object IBQCadastroCODIGOCLASSIFICACAO: TIntegerField
      FieldName = 'CODIGOCLASSIFICACAO'
      Origin = 'CLIENTE.CODIGOCLASSIFICACAO'
      Required = True
    end
    object IBQCadastroCODIGOREGIAO: TIntegerField
      FieldName = 'CODIGOREGIAO'
      Origin = 'CLIENTE.CODIGOREGIAO'
      Required = True
    end
    object IBQCadastroREFERENCIABANCARIA: TMemoField
      FieldName = 'REFERENCIABANCARIA'
      Origin = 'CLIENTE.REFERENCIABANCARIA'
      BlobType = ftMemo
      Size = 8
    end
    object IBQCadastroREFERENCIALIMITECREDITO: TFloatField
      FieldName = 'REFERENCIALIMITECREDITO'
      Origin = 'CLIENTE.REFERENCIALIMITECREDITO'
    end
    object IBQCadastroREFERENCIASERASA: TMemoField
      FieldName = 'REFERENCIASERASA'
      Origin = 'CLIENTE.REFERENCIASERASA'
      BlobType = ftMemo
      Size = 8
    end
    object IBQCadastroREFERENCIACOMERCIAL: TMemoField
      FieldName = 'REFERENCIACOMERCIAL'
      Origin = 'CLIENTE.REFERENCIACOMERCIAL'
      BlobType = ftMemo
      Size = 8
    end
    object IBQCadastroSALARIO: TFloatField
      FieldName = 'SALARIO'
      Origin = 'CLIENTE.SALARIO'
    end
    object IBQCadastroTRABALHOLOCAL: TIBStringField
      FieldName = 'TRABALHOLOCAL'
      Origin = 'CLIENTE.TRABALHOLOCAL'
      Size = 40
    end
    object IBQCadastroTRABALHOENDERECO: TIBStringField
      FieldName = 'TRABALHOENDERECO'
      Origin = 'CLIENTE.TRABALHOENDERECO'
      Size = 60
    end
    object IBQCadastroTRABALHOFONE: TIBStringField
      FieldName = 'TRABALHOFONE'
      Origin = 'CLIENTE.TRABALHOFONE'
      Size = 16
    end
    object IBQCadastroTRABALHOCIDADE: TIntegerField
      FieldName = 'TRABALHOCIDADE'
      Origin = 'CLIENTE.TRABALHOCIDADE'
      Required = True
    end
    object IBQCadastroCODIGOCARGO: TIntegerField
      FieldName = 'CODIGOCARGO'
      Origin = 'CLIENTE.CODIGOCARGO'
      Required = True
    end
    object IBQCadastroCONJUGE: TIBStringField
      FieldName = 'CONJUGE'
      Origin = 'CLIENTE.CONJUGE'
      Size = 60
    end
    object IBQCadastroCONJUGEDATANASCIMENTO: TDateField
      FieldName = 'CONJUGEDATANASCIMENTO'
      Origin = 'CLIENTE.CONJUGEDATANASCIMENTO'
    end
    object IBQCadastroRESTRICAOMOTIVO: TMemoField
      FieldName = 'RESTRICAOMOTIVO'
      Origin = 'CLIENTE.RESTRICAOMOTIVO'
      BlobType = ftMemo
      Size = 8
    end
    object IBQCadastroREFERENCIASPC: TMemoField
      FieldName = 'REFERENCIASPC'
      Origin = 'CLIENTE.REFERENCIASPC'
      BlobType = ftMemo
      Size = 8
    end
    object IBQCadastroRESTRICAODECREDITO: TIntegerField
      FieldName = 'RESTRICAODECREDITO'
      Origin = 'CLIENTE.RESTRICAODECREDITO'
    end
    object IBQCadastroRESTRICAODEDEBITO: TIntegerField
      FieldName = 'RESTRICAODEDEBITO'
      Origin = 'CLIENTE.RESTRICAODEDEBITO'
    end
    object IBQCadastroFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'CLIENTE.FOTO'
      Size = 8
    end
    object IBQCadastroBLOQUEARVENDA: TSmallintField
      FieldName = 'BLOQUEARVENDA'
      Origin = 'CLIENTE.BLOQUEARVENDA'
      Required = True
    end
    object IBQCadastroDATAASSOCIACAO: TDateField
      FieldName = 'DATAASSOCIACAO'
      Origin = 'CLIENTE.DATAASSOCIACAO'
    end
    object IBQCadastroCREDENCIAL: TIBStringField
      FieldName = 'CREDENCIAL'
      Origin = 'CLIENTE.CREDENCIAL'
      Size = 60
    end
    object IBQCadastroCEP: TIBStringField
      FieldName = 'CEP'
      Origin = 'CLIENTE.CEP'
      Size = 9
    end
    object IBQCadastroATIVO: TSmallintField
      FieldName = 'ATIVO'
      Origin = 'CLIENTE.ATIVO'
      Required = True
    end
    object IBQCadastroSIMPLESFEDERAL: TSmallintField
      FieldName = 'SIMPLESFEDERAL'
      Origin = 'CLIENTE.SIMPLESFEDERAL'
      Required = True
    end
    object IBQCadastroCOFINS: TSmallintField
      FieldName = 'COFINS'
      Origin = 'CLIENTE.COFINS'
      Required = True
    end
    object IBQCadastroPIS: TSmallintField
      FieldName = 'PIS'
      Origin = 'CLIENTE.PIS'
      Required = True
    end
    object IBQCadastroCSLL: TSmallintField
      FieldName = 'CSLL'
      Origin = 'CLIENTE.CSLL'
      Required = True
    end
    object IBQCadastroSIMPLESFEDERAL_MOTIVO: TIBStringField
      FieldName = 'SIMPLESFEDERAL_MOTIVO'
      Origin = 'CLIENTE.SIMPLESFEDERAL_MOTIVO'
      Size = 60
    end
    object IBQCadastroEMITIR_NF_APOS_CF: TIntegerField
      FieldName = 'EMITIR_NF_APOS_CF'
      Origin = 'CLIENTE.EMITIR_NF_APOS_CF'
    end
    object IBQCadastroINSCRICAOMUNICIPAL: TIBStringField
      FieldName = 'INSCRICAOMUNICIPAL'
      Origin = 'CLIENTE.INSCRICAOMUNICIPAL'
      Size = 14
    end
    object IBQCadastroCPFCNPJ_CONJUGUE: TIBStringField
      FieldName = 'CPFCNPJ_CONJUGUE'
      Origin = 'CLIENTE.CPFCNPJ_CONJUGUE'
      Size = 18
    end
    object IBQCadastroRGIE_CONJUGUE: TIBStringField
      FieldName = 'RGIE_CONJUGUE'
      Origin = 'CLIENTE.RGIE_CONJUGUE'
      Size = 14
    end
    object IBQCadastroDATAULTATUA: TDateField
      FieldName = 'DATAULTATUA'
      Origin = 'CLIENTE.DATAULTATUA'
    end
    object IBQCadastroCONJUGECONTATO: TIBStringField
      FieldName = 'CONJUGECONTATO'
      Origin = 'CLIENTE.CONJUGECONTATO'
    end
    object IBQCadastroCONJUGETRABALHOLOCAL: TIBStringField
      FieldName = 'CONJUGETRABALHOLOCAL'
      Origin = 'CLIENTE.CONJUGETRABALHOLOCAL'
      Size = 40
    end
    object IBQCadastroCARTAOSENHA: TIBStringField
      FieldName = 'CARTAOSENHA'
      Origin = 'CLIENTE.CARTAOSENHA'
      Size = 8
    end
    object IBQCadastroCARTAOVALIDADE: TDateField
      FieldName = 'CARTAOVALIDADE'
      Origin = 'CLIENTE.CARTAOVALIDADE'
    end
    object IBQCadastroBLOQUEARVENDAVEICULO: TSmallintField
      FieldName = 'BLOQUEARVENDAVEICULO'
      Origin = 'CLIENTE.BLOQUEARVENDAVEICULO'
      Required = True
    end
    object IBQCadastroREPRESENTANTE: TIntegerField
      FieldName = 'REPRESENTANTE'
      Origin = 'CLIENTE.REPRESENTANTE'
    end
    object IBQCadastroCARTAOHABILITADO: TSmallintField
      FieldName = 'CARTAOHABILITADO'
      Origin = 'CLIENTE.CARTAOHABILITADO'
      Required = True
    end
    object IBQCadastroCARTAOPERMITEVENDASEM: TSmallintField
      FieldName = 'CARTAOPERMITEVENDASEM'
      Origin = 'CLIENTE.CARTAOPERMITEVENDASEM'
      Required = True
    end
    object IBQCadastroMSN: TIBStringField
      FieldName = 'MSN'
      Origin = 'CLIENTE.MSN'
      Size = 60
    end
    object IBQCadastroTRABALHOENDERECONUMERORUA: TIntegerField
      FieldName = 'TRABALHOENDERECONUMERORUA'
      Origin = 'CLIENTE.TRABALHOENDERECONUMERORUA'
    end
    object IBQCadastroTRABALHOCAIXAPOSTAL: TIntegerField
      FieldName = 'TRABALHOCAIXAPOSTAL'
      Origin = 'CLIENTE.TRABALHOCAIXAPOSTAL'
    end
    object IBQCadastroTRABALHOCEP: TIBStringField
      FieldName = 'TRABALHOCEP'
      Origin = 'CLIENTE.TRABALHOCEP'
      Size = 9
    end
    object IBQCadastroTRABALHOBAIRRO: TIBStringField
      FieldName = 'TRABALHOBAIRRO'
      Origin = 'CLIENTE.TRABALHOBAIRRO'
      Size = 30
    end
    object IBQCadastroCODIGONOBANCO: TIntegerField
      FieldName = 'CODIGONOBANCO'
      Origin = 'CLIENTE.CODIGONOBANCO'
    end
    object IBQCadastroCONTRIBUINTEICMS: TSmallintField
      FieldName = 'CONTRIBUINTEICMS'
      Origin = 'CLIENTE.CONTRIBUINTEICMS'
      Required = True
    end
    object IBQCadastroPOSICAO: TIntegerField
      FieldName = 'POSICAO'
      Origin = 'CLIENTE.POSICAO'
    end
    object IBQCadastroDATAVALIDADECREDENCIAL: TDateField
      FieldName = 'DATAVALIDADECREDENCIAL'
      Origin = 'CLIENTE.DATAVALIDADECREDENCIAL'
    end
    object IBQCadastroCODIGOOPERACAO: TIntegerField
      FieldName = 'CODIGOOPERACAO'
      Origin = 'CLIENTE.CODIGOOPERACAO'
    end
    object IBQCadastroLIBERACAO: TIntegerField
      FieldName = 'LIBERACAO'
      Origin = 'CLIENTE.LIBERACAO'
    end
    object IBQCadastroCONTRIBUINTEIPI: TSmallintField
      FieldName = 'CONTRIBUINTEIPI'
      Origin = 'CLIENTE.CONTRIBUINTEIPI'
      Required = True
    end
    object IBQCadastroORGAOEMISSORRG: TIBStringField
      FieldName = 'ORGAOEMISSORRG'
      Origin = 'CLIENTE.ORGAOEMISSORRG'
      Size = 10
    end
    object IBQCadastroDATAEMISSAORRG: TDateField
      FieldName = 'DATAEMISSAORRG'
      Origin = 'CLIENTE.DATAEMISSAORRG'
    end
    object IBQCadastroTIPOPRECO: TSmallintField
      FieldName = 'TIPOPRECO'
      Origin = 'CLIENTE.TIPOPRECO'
      Required = True
    end
    object IBQCadastroESTADO: TIBStringField
      FieldName = 'ESTADO'
      Origin = 'CIDADE.ESTADO'
      Required = True
      Size = 2
    end
    object IBQCadastroDESC_CIDADE: TIBStringField
      FieldName = 'DESC_CIDADE'
      Origin = 'CIDADE.CIDADE'
      Required = True
      Size = 30
    end
  end
  object DsCadastro: TDataSource
    DataSet = IBQCadastro
    Left = 40
    Top = 80
  end
  object QCadastro_Cad: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Rowid,'
      '  tb_cadastro.*'
      'From '
      '  Tb_Cadastro'
      'Where '
      '  cod_Cadastro = :pk')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_CADASTRO'
    SequenceField.Sequence = 'SQCADASTRO'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000007D0000000C000000434F445F434144415354524F0100000000000A00
      0000434F445F4D4F5449564F01000000000011000000434F445F5449504F5F43
      4144415354524F0100000000000A000000434F445F52454749414F0100000000
      0008000000434F445F5041495301000000000010000000434F445F4553544144
      4F5F434956494C01000000000008000000434F445F52414D4F0100000000000A
      000000434F445F45535441444F010000000000040000004E4F4D450100000000
      000D000000444553435F454E44455245434F0100000000000B00000044455343
      5F43494441444501000000000008000000444553435F4345500100000000000B
      0000004E554D5F4347435F4350460100000000000D0000004E554D5F494E5343
      524943414F0100000000000B00000044545F434144415354524F010000000000
      12000000494E445F5345584F5F43415445474F52494101000000000010000000
      4E554D5F43414958415F504F5354414C0100000000000F00000044545F43414E
      43454C414D454E544F0100000000000D000000444553435F54454C45464F4E45
      0100000000000C000000444553435F43454C554C41520100000000000C000000
      4E4F4D455F434F4E5441544F0100000000000D00000044545F4E415343494D45
      4E544F0100000000000B000000444553435F42414952524F0100000000000D00
      0000504552435F46554E525552414C0100000000000A00000056414C5F4C494D
      4954450100000000000D000000444553435F46414E5441534941010000000000
      14000000444553435F4349444144455F434F4252414E43410100000000001600
      0000444553435F454E44455245434F5F434F4252414E43410100000000001400
      0000444553435F45535441444F5F434F4252414E434101000000000011000000
      444553435F4345505F434F4252414E434101000000000017000000444553435F
      54454C45464F4E455F434F4D45524349414C010000000000090000004E554D5F
      4A554E54410100000000000B00000044545F46554E444143414F010000000000
      0800000044545F4A554E544101000000000008000000444553435F4641580100
      00000000080000004E4F4D455F4D4145010000000000080000004E4F4D455F50
      414901000000000011000000444553435F4E41545552414C4944414445010000
      00000013000000444553435F45535441444F5F4E41545552414C010000000000
      1700000044545F45585045444943414F5F4944454E5449444144450100000000
      000B000000444553435F455F4D41494C01000000000011000000444553435F46
      41585F434F4252414E434101000000000011000000494E445F534550524F435F
      53494D4E414F01000000000018000000444553435F494E5343524943414F5F4D
      554E49434950414C0100000000000C0000004E4F4D455F434F4E4A5547450100
      0000000010000000444553435F4350465F434F4E4A5547450100000000001700
      0000444553435F4944454E5449444144455F434F4E4A55474501000000000012
      000000434F445F434C4153535F434144415354524F0100000000001100000043
      4F445F42414E434F5F4147454E4349410100000000000F000000434F445F4F50
      45524143414F5F43430100000000001500000044545F4E415343494D454E544F
      5F434F4E5441544F0100000000000D0000004E4F4D455F434F4E5441544F3201
      00000000000E00000044545F4E415343494D454E544F320100000000000C0000
      00434F445F56454E4445444F520100000000000D000000504552435F434F4D49
      5353414F01000000000010000000444553435F434F4D504C454D454E544F0100
      0000000013000000494E445F4649534943415F4A555249444943410100000000
      0015000000444553435F454E44455245434F5F454E5452454741010000000000
      13000000444553435F4349444144455F454E5452454741010000000000130000
      00444553435F42414952524F5F454E5452454741010000000000080000004445
      53435F4F425301000000000009000000444553435F4F42533101000000000009
      000000444553435F4F42533201000000000011000000444553435F464F524D41
      5F434F4D5052410100000000000B000000434F445F5553554152494F01000000
      000013000000444553435F5245465F434F4D45524349414C3101000000000013
      000000444553435F5245465F434F4D45524349414C3201000000000013000000
      444553435F5245465F434F4D45524349414C330100000000000F000000444553
      435F5245465F42414E434F310100000000000F000000444553435F5245465F42
      414E434F320100000000000F000000444553435F5245465F42414E434F330100
      0000000015000000444553435F5245465F504152454E54455F4E4F4D45010000
      00000019000000444553435F5245465F504152454E54455F454E44455245434F
      01000000000017000000444553435F5245465F504152454E54455F4349444144
      4501000000000019000000444553435F5245465F504152454E54455F54454C45
      464F4E450100000000000F000000444553435F5245465F4F5554524153010000
      00000011000000434F445F434144415354524F5F4E4F564F0100000000001200
      0000444553435F4F5247414F5F454D4953534F52010000000000130000004445
      53435F494E5343524943414F5F494E53530100000000000D000000444553435F
      43415254454952410100000000001500000044545F45585045444943414F5F43
      4152544549524101000000000010000000494E445F4C49424552415F56454E44
      4101000000000015000000434F445F56454E4445444F525F505245504F53544F
      01000000000013000000494E445F524547494D455F455350454349414C010000
      0000000A000000434F445F4349444144450100000000000B000000444553435F
      484F424249450100000000000D000000444553435F444553545249544F010000
      0000000C000000444553435F4147454E43494101000000000013000000444553
      435F434F4E54415F434F5252454E544501000000000010000000434F445F4F50
      45524143414F5F43433101000000000010000000434F445F4F5045524143414F
      5F4343320100000000000A000000444553435F504C4143410100000000000D00
      0000504552435F444553434F4E544F01000000000013000000494E445F4C4942
      4552415F424C4F515545544F0100000000001400000044545F434F4E53554C54
      415F53494E544547524101000000000016000000444553435F50524F46495353
      414F5F434F4E4A5547450100000000001500000044545F4E415343494D454E54
      4F5F434F4E4A55474501000000000014000000444553435F454D50524553415F
      434F4E4A55474501000000000012000000564C5F53414C4152494F5F434F4E4A
      5547450100000000000B000000444553435F46554E43414F0100000000000C00
      0000444553435F454D505245534101000000000011000000444553435F464F4E
      455F454D50524553410100000000000A000000444553435F54454D504F010000
      0000000B00000056414C5F53414C4152494F0100000000001300000044455343
      5F504C4143415F434152524554413101000000000013000000444553435F504C
      4143415F434152524554413201000000000014000000444553435F4241495252
      4F5F434F4252414E43410100000000000E000000444553435F474152414E5449
      4153010000000000100000004E4F4D455F4155544F52495A41444F3101000000
      0000100000004E4F4D455F4155544F52495A41444F3201000000000010000000
      4E4F4D455F4155544F52495A41444F3301000000000014000000444553435F43
      50465F4155544F52495A41444F3101000000000014000000444553435F435046
      5F4155544F52495A41444F3201000000000014000000444553435F4350465F41
      55544F52495A41444F3301000000000015000000444553435F474152414E5449
      41535F4F555452415301000000000019000000444553435F434F4D504C454D45
      4E544F5F53494E54454752410100000000000C00000044545F534550524F4341
      444F01000000000009000000504552435F4D4554410100000000001400000043
      4F445F5052415A4F5F56454E43494D454E544F0100000000001B000000494E44
      5F534F4A4943554C544F525F5041525449434950414E54450100000000000E00
      00004E554D5F4449415F56495349544101000000000016000000444553435F46
      52455155454E4349415F5649534954410100000000000F0000004E554D5F484F
      52415F5649534954410100000000000E0000004E554D5F4449415F56454E4354
      4F0100000000000C0000004E4F4D455F544954554C4152010000000000}
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 160
    Top = 24
    object QCadastro_CadCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QCadastro_CadCOD_MOTIVO: TIntegerField
      FieldName = 'COD_MOTIVO'
    end
    object QCadastro_CadCOD_TIPO_CADASTRO: TIntegerField
      FieldName = 'COD_TIPO_CADASTRO'
      Required = True
    end
    object QCadastro_CadCOD_REGIAO: TIntegerField
      FieldName = 'COD_REGIAO'
    end
    object QCadastro_CadCOD_PAIS: TIntegerField
      FieldName = 'COD_PAIS'
    end
    object QCadastro_CadCOD_ESTADO_CIVIL: TIntegerField
      FieldName = 'COD_ESTADO_CIVIL'
    end
    object QCadastro_CadCOD_RAMO: TIntegerField
      FieldName = 'COD_RAMO'
    end
    object QCadastro_CadCOD_ESTADO: TStringField
      FieldName = 'COD_ESTADO'
      Size = 2
    end
    object QCadastro_CadNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object QCadastro_CadDESC_ENDERECO: TStringField
      FieldName = 'DESC_ENDERECO'
      Size = 40
    end
    object QCadastro_CadDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      Size = 30
    end
    object QCadastro_CadDESC_CEP: TStringField
      FieldName = 'DESC_CEP'
      Size = 9
    end
    object QCadastro_CadNUM_CGC_CPF: TStringField
      FieldName = 'NUM_CGC_CPF'
      Size = 18
    end
    object QCadastro_CadNUM_INSCRICAO: TStringField
      FieldName = 'NUM_INSCRICAO'
    end
    object QCadastro_CadDT_CADASTRO: TDateTimeField
      FieldName = 'DT_CADASTRO'
      Required = True
    end
    object QCadastro_CadIND_SEXO_CATEGORIA: TStringField
      FieldName = 'IND_SEXO_CATEGORIA'
      Required = True
      Size = 1
    end
    object QCadastro_CadNUM_CAIXA_POSTAL: TIntegerField
      FieldName = 'NUM_CAIXA_POSTAL'
    end
    object QCadastro_CadDT_CANCELAMENTO: TDateTimeField
      FieldName = 'DT_CANCELAMENTO'
    end
    object QCadastro_CadDESC_TELEFONE: TStringField
      FieldName = 'DESC_TELEFONE'
      Size = 12
    end
    object QCadastro_CadDESC_CELULAR: TStringField
      FieldName = 'DESC_CELULAR'
      Size = 12
    end
    object QCadastro_CadNOME_CONTATO: TStringField
      FieldName = 'NOME_CONTATO'
      Size = 30
    end
    object QCadastro_CadDT_NASCIMENTO: TDateTimeField
      FieldName = 'DT_NASCIMENTO'
    end
    object QCadastro_CadDESC_BAIRRO: TStringField
      FieldName = 'DESC_BAIRRO'
    end
    object QCadastro_CadPERC_FUNRURAL: TFloatField
      FieldName = 'PERC_FUNRURAL'
    end
    object QCadastro_CadVAL_LIMITE: TFloatField
      FieldName = 'VAL_LIMITE'
    end
    object QCadastro_CadDESC_FANTASIA: TStringField
      FieldName = 'DESC_FANTASIA'
      Size = 30
    end
    object QCadastro_CadDESC_CIDADE_COBRANCA: TStringField
      FieldName = 'DESC_CIDADE_COBRANCA'
      Size = 30
    end
    object QCadastro_CadDESC_ENDERECO_COBRANCA: TStringField
      FieldName = 'DESC_ENDERECO_COBRANCA'
      Size = 40
    end
    object QCadastro_CadDESC_ESTADO_COBRANCA: TStringField
      FieldName = 'DESC_ESTADO_COBRANCA'
      Size = 2
    end
    object QCadastro_CadDESC_CEP_COBRANCA: TStringField
      FieldName = 'DESC_CEP_COBRANCA'
      Size = 9
    end
    object QCadastro_CadDESC_TELEFONE_COMERCIAL: TStringField
      FieldName = 'DESC_TELEFONE_COMERCIAL'
      Size = 12
    end
    object QCadastro_CadNUM_JUNTA: TIntegerField
      FieldName = 'NUM_JUNTA'
    end
    object QCadastro_CadDT_FUNDACAO: TDateTimeField
      FieldName = 'DT_FUNDACAO'
    end
    object QCadastro_CadDT_JUNTA: TDateTimeField
      FieldName = 'DT_JUNTA'
    end
    object QCadastro_CadDESC_FAX: TStringField
      FieldName = 'DESC_FAX'
      Size = 12
    end
    object QCadastro_CadNOME_MAE: TStringField
      FieldName = 'NOME_MAE'
      Size = 40
    end
    object QCadastro_CadNOME_PAI: TStringField
      FieldName = 'NOME_PAI'
      Size = 40
    end
    object QCadastro_CadDESC_NATURALIDADE: TStringField
      FieldName = 'DESC_NATURALIDADE'
      Size = 30
    end
    object QCadastro_CadDESC_ESTADO_NATURAL: TStringField
      FieldName = 'DESC_ESTADO_NATURAL'
      Size = 2
    end
    object QCadastro_CadDT_EXPEDICAO_IDENTIDADE: TDateTimeField
      FieldName = 'DT_EXPEDICAO_IDENTIDADE'
    end
    object QCadastro_CadDESC_E_MAIL: TStringField
      FieldName = 'DESC_E_MAIL'
      Size = 40
    end
    object QCadastro_CadDESC_FAX_COBRANCA: TStringField
      FieldName = 'DESC_FAX_COBRANCA'
      Size = 12
    end
    object QCadastro_CadIND_SEPROC_SIMNAO: TStringField
      FieldName = 'IND_SEPROC_SIMNAO'
      Size = 1
    end
    object QCadastro_CadDESC_INSCRICAO_MUNICIPAL: TStringField
      FieldName = 'DESC_INSCRICAO_MUNICIPAL'
      Size = 15
    end
    object QCadastro_CadNOME_CONJUGE: TStringField
      FieldName = 'NOME_CONJUGE'
      Size = 40
    end
    object QCadastro_CadDESC_CPF_CONJUGE: TStringField
      FieldName = 'DESC_CPF_CONJUGE'
      Size = 15
    end
    object QCadastro_CadDESC_IDENTIDADE_CONJUGE: TStringField
      FieldName = 'DESC_IDENTIDADE_CONJUGE'
      Size = 15
    end
    object QCadastro_CadCOD_CLASS_CADASTRO: TIntegerField
      FieldName = 'COD_CLASS_CADASTRO'
    end
    object QCadastro_CadCOD_BANCO_AGENCIA: TIntegerField
      FieldName = 'COD_BANCO_AGENCIA'
    end
    object QCadastro_CadCOD_OPERACAO_CC: TIntegerField
      FieldName = 'COD_OPERACAO_CC'
    end
    object QCadastro_CadDT_NASCIMENTO_CONTATO: TDateTimeField
      FieldName = 'DT_NASCIMENTO_CONTATO'
    end
    object QCadastro_CadNOME_CONTATO2: TStringField
      FieldName = 'NOME_CONTATO2'
      Size = 30
    end
    object QCadastro_CadDT_NASCIMENTO2: TDateTimeField
      FieldName = 'DT_NASCIMENTO2'
    end
    object QCadastro_CadCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object QCadastro_CadPERC_COMISSAO: TFloatField
      FieldName = 'PERC_COMISSAO'
    end
    object QCadastro_CadDESC_COMPLEMENTO: TStringField
      FieldName = 'DESC_COMPLEMENTO'
      Size = 40
    end
    object QCadastro_CadIND_FISICA_JURIDICA: TStringField
      FieldName = 'IND_FISICA_JURIDICA'
      Size = 1
    end
    object QCadastro_CadDESC_ENDERECO_ENTREGA: TStringField
      FieldName = 'DESC_ENDERECO_ENTREGA'
      Size = 40
    end
    object QCadastro_CadDESC_CIDADE_ENTREGA: TStringField
      FieldName = 'DESC_CIDADE_ENTREGA'
      Size = 30
    end
    object QCadastro_CadDESC_BAIRRO_ENTREGA: TStringField
      FieldName = 'DESC_BAIRRO_ENTREGA'
    end
    object QCadastro_CadDESC_OBS: TStringField
      FieldName = 'DESC_OBS'
      Size = 60
    end
    object QCadastro_CadDESC_OBS1: TStringField
      FieldName = 'DESC_OBS1'
      Size = 60
    end
    object QCadastro_CadDESC_OBS2: TStringField
      FieldName = 'DESC_OBS2'
      Size = 60
    end
    object QCadastro_CadDESC_FORMA_COMPRA: TStringField
      FieldName = 'DESC_FORMA_COMPRA'
      Size = 15
    end
    object QCadastro_CadCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
    object QCadastro_CadDESC_REF_COMERCIAL1: TStringField
      FieldName = 'DESC_REF_COMERCIAL1'
      Size = 40
    end
    object QCadastro_CadDESC_REF_COMERCIAL2: TStringField
      FieldName = 'DESC_REF_COMERCIAL2'
      Size = 40
    end
    object QCadastro_CadDESC_REF_COMERCIAL3: TStringField
      FieldName = 'DESC_REF_COMERCIAL3'
      Size = 40
    end
    object QCadastro_CadDESC_REF_BANCO1: TStringField
      FieldName = 'DESC_REF_BANCO1'
      Size = 40
    end
    object QCadastro_CadDESC_REF_BANCO2: TStringField
      FieldName = 'DESC_REF_BANCO2'
      Size = 40
    end
    object QCadastro_CadDESC_REF_BANCO3: TStringField
      FieldName = 'DESC_REF_BANCO3'
      Size = 40
    end
    object QCadastro_CadDESC_REF_PARENTE_NOME: TStringField
      FieldName = 'DESC_REF_PARENTE_NOME'
      Size = 40
    end
    object QCadastro_CadDESC_REF_PARENTE_ENDERECO: TStringField
      FieldName = 'DESC_REF_PARENTE_ENDERECO'
      Size = 40
    end
    object QCadastro_CadDESC_REF_PARENTE_CIDADE: TStringField
      FieldName = 'DESC_REF_PARENTE_CIDADE'
      Size = 40
    end
    object QCadastro_CadDESC_REF_PARENTE_TELEFONE: TStringField
      FieldName = 'DESC_REF_PARENTE_TELEFONE'
      Size = 15
    end
    object QCadastro_CadDESC_REF_OUTRAS: TStringField
      FieldName = 'DESC_REF_OUTRAS'
      Size = 400
    end
    object QCadastro_CadCOD_CADASTRO_NOVO: TIntegerField
      FieldName = 'COD_CADASTRO_NOVO'
    end
    object QCadastro_CadDESC_ORGAO_EMISSOR: TStringField
      FieldName = 'DESC_ORGAO_EMISSOR'
      Size = 7
    end
    object QCadastro_CadDESC_INSCRICAO_INSS: TStringField
      FieldName = 'DESC_INSCRICAO_INSS'
      Size = 15
    end
    object QCadastro_CadDESC_CARTEIRA: TStringField
      FieldName = 'DESC_CARTEIRA'
      Size = 15
    end
    object QCadastro_CadDT_EXPEDICAO_CARTEIRA: TDateTimeField
      FieldName = 'DT_EXPEDICAO_CARTEIRA'
    end
    object QCadastro_CadIND_LIBERA_VENDA: TStringField
      FieldName = 'IND_LIBERA_VENDA'
      Size = 3
    end
    object QCadastro_CadCOD_VENDEDOR_PREPOSTO: TIntegerField
      FieldName = 'COD_VENDEDOR_PREPOSTO'
    end
    object QCadastro_CadIND_REGIME_ESPECIAL: TStringField
      FieldName = 'IND_REGIME_ESPECIAL'
      Size = 3
    end
    object QCadastro_CadCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
    end
    object QCadastro_CadDESC_HOBBIE: TStringField
      FieldName = 'DESC_HOBBIE'
      Size = 40
    end
    object QCadastro_CadDESC_DESTRITO: TStringField
      FieldName = 'DESC_DESTRITO'
      Size = 30
    end
    object QCadastro_CadDESC_AGENCIA: TStringField
      FieldName = 'DESC_AGENCIA'
      Size = 7
    end
    object QCadastro_CadDESC_CONTA_CORRENTE: TStringField
      FieldName = 'DESC_CONTA_CORRENTE'
      Size = 10
    end
    object QCadastro_CadCOD_OPERACAO_CC1: TIntegerField
      FieldName = 'COD_OPERACAO_CC1'
    end
    object QCadastro_CadCOD_OPERACAO_CC2: TIntegerField
      FieldName = 'COD_OPERACAO_CC2'
    end
    object QCadastro_CadDESC_PLACA: TStringField
      FieldName = 'DESC_PLACA'
      Size = 8
    end
    object QCadastro_CadPERC_DESCONTO: TFloatField
      FieldName = 'PERC_DESCONTO'
    end
    object QCadastro_CadIND_LIBERA_BLOQUETO: TStringField
      FieldName = 'IND_LIBERA_BLOQUETO'
      Size = 3
    end
    object QCadastro_CadDT_CONSULTA_SINTEGRA: TDateTimeField
      FieldName = 'DT_CONSULTA_SINTEGRA'
    end
    object QCadastro_CadDESC_PROFISSAO_CONJUGE: TStringField
      FieldName = 'DESC_PROFISSAO_CONJUGE'
      Size = 30
    end
    object QCadastro_CadDT_NASCIMENTO_CONJUGE: TDateTimeField
      FieldName = 'DT_NASCIMENTO_CONJUGE'
    end
    object QCadastro_CadDESC_EMPRESA_CONJUGE: TStringField
      FieldName = 'DESC_EMPRESA_CONJUGE'
      Size = 30
    end
    object QCadastro_CadVL_SALARIO_CONJUGE: TFloatField
      FieldName = 'VL_SALARIO_CONJUGE'
    end
    object QCadastro_CadDESC_FUNCAO: TStringField
      FieldName = 'DESC_FUNCAO'
      Size = 30
    end
    object QCadastro_CadDESC_EMPRESA: TStringField
      FieldName = 'DESC_EMPRESA'
      Size = 30
    end
    object QCadastro_CadDESC_FONE_EMPRESA: TStringField
      FieldName = 'DESC_FONE_EMPRESA'
      Size = 12
    end
    object QCadastro_CadDESC_TEMPO: TStringField
      FieldName = 'DESC_TEMPO'
      Size = 10
    end
    object QCadastro_CadVAL_SALARIO: TFloatField
      FieldName = 'VAL_SALARIO'
    end
    object QCadastro_CadDESC_PLACA_CARRETA1: TStringField
      FieldName = 'DESC_PLACA_CARRETA1'
      Size = 8
    end
    object QCadastro_CadDESC_PLACA_CARRETA2: TStringField
      FieldName = 'DESC_PLACA_CARRETA2'
      Size = 8
    end
    object QCadastro_CadDESC_BAIRRO_COBRANCA: TStringField
      FieldName = 'DESC_BAIRRO_COBRANCA'
    end
    object QCadastro_CadDESC_GARANTIAS: TStringField
      FieldName = 'DESC_GARANTIAS'
      Size = 10
    end
    object QCadastro_CadNOME_AUTORIZADO1: TStringField
      FieldName = 'NOME_AUTORIZADO1'
      Size = 30
    end
    object QCadastro_CadNOME_AUTORIZADO2: TStringField
      FieldName = 'NOME_AUTORIZADO2'
      Size = 30
    end
    object QCadastro_CadNOME_AUTORIZADO3: TStringField
      FieldName = 'NOME_AUTORIZADO3'
      Size = 30
    end
    object QCadastro_CadDESC_CPF_AUTORIZADO1: TStringField
      FieldName = 'DESC_CPF_AUTORIZADO1'
      Size = 11
    end
    object QCadastro_CadDESC_CPF_AUTORIZADO2: TStringField
      FieldName = 'DESC_CPF_AUTORIZADO2'
      Size = 11
    end
    object QCadastro_CadDESC_CPF_AUTORIZADO3: TStringField
      FieldName = 'DESC_CPF_AUTORIZADO3'
      Size = 11
    end
    object QCadastro_CadDESC_GARANTIAS_OUTRAS: TStringField
      FieldName = 'DESC_GARANTIAS_OUTRAS'
    end
    object QCadastro_CadDESC_COMPLEMENTO_SINTEGRA: TStringField
      FieldName = 'DESC_COMPLEMENTO_SINTEGRA'
      Size = 14
    end
    object QCadastro_CadDT_SEPROCADO: TDateTimeField
      FieldName = 'DT_SEPROCADO'
    end
    object QCadastro_CadPERC_META: TFloatField
      FieldName = 'PERC_META'
    end
    object QCadastro_CadCOD_PRAZO_VENCIMENTO: TIntegerField
      FieldName = 'COD_PRAZO_VENCIMENTO'
    end
    object QCadastro_CadIND_SOJICULTOR_PARTICIPANTE: TStringField
      FieldName = 'IND_SOJICULTOR_PARTICIPANTE'
      Size = 3
    end
    object QCadastro_CadNUM_DIA_VISITA: TIntegerField
      FieldName = 'NUM_DIA_VISITA'
    end
    object QCadastro_CadDESC_FREQUENCIA_VISITA: TStringField
      FieldName = 'DESC_FREQUENCIA_VISITA'
      Size = 1
    end
    object QCadastro_CadNUM_HORA_VISITA: TIntegerField
      FieldName = 'NUM_HORA_VISITA'
    end
    object QCadastro_CadNUM_DIA_VENCTO: TIntegerField
      FieldName = 'NUM_DIA_VENCTO'
    end
    object QCadastro_CadNOME_TITULAR: TStringField
      FieldName = 'NOME_TITULAR'
      Size = 30
    end
  end
  object QCidades_Cad: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Rowid,'
      '  Tb_Cidade.*'
      'From '
      '  Tb_Cidade'
      'Where'
      '  Cod_Cidade = :PK')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000060000000A000000434F445F4349444144450100000000000B000000
      444553435F4349444144450100000000000A000000434F445F45535441444F01
      000000000009000000434F445F505241434101000000000007000000434F445F
      44464301000000000010000000434F445F4D554E49434950494F5F5343010000
      000000}
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 160
    Top = 144
    object QCidades_CadCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
      Required = True
    end
    object QCidades_CadDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      Required = True
      Size = 50
    end
    object QCidades_CadCOD_ESTADO: TStringField
      FieldName = 'COD_ESTADO'
      Required = True
      Size = 2
    end
    object QCidades_CadCOD_PRACA: TStringField
      FieldName = 'COD_PRACA'
      Size = 6
    end
    object QCidades_CadCOD_DFC: TIntegerField
      FieldName = 'COD_DFC'
    end
    object QCidades_CadCOD_MUNICIPIO_SC: TIntegerField
      FieldName = 'COD_MUNICIPIO_SC'
    end
  end
  object IBQCidades: TIBQuery
    Database = DMConexao.IBInterbase
    Transaction = DMConexao.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from CIDADE')
    Left = 48
    Top = 144
    object IBQCidadesCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CIDADE.CODIGO'
      Required = True
    end
    object IBQCidadesCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE.CIDADE'
      Required = True
      Size = 30
    end
    object IBQCidadesCEP: TIBStringField
      FieldName = 'CEP'
      Origin = 'CIDADE.CEP'
      Required = True
      Size = 9
    end
    object IBQCidadesESTADO: TIBStringField
      FieldName = 'ESTADO'
      Origin = 'CIDADE.ESTADO'
      Required = True
      Size = 2
    end
  end
  object DsCidades: TDataSource
    DataSet = IBQCidades
    Left = 40
    Top = 200
  end
  object IBQEstado: TIBQuery
    Database = DMConexao.IBInterbase
    Transaction = DMConexao.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from ESTADO')
    Left = 56
    Top = 264
    object IBQEstadoSIGLA: TIBStringField
      FieldName = 'SIGLA'
      Origin = 'ESTADO.SIGLA'
      Required = True
      Size = 2
    end
    object IBQEstadoESTADO: TIBStringField
      FieldName = 'ESTADO'
      Origin = 'ESTADO.ESTADO'
      Required = True
      Size = 30
    end
    object IBQEstadoPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'ESTADO.PAIS'
      Required = True
      Size = 30
    end
    object IBQEstadoREGIAOTRIBUTARIA: TIntegerField
      FieldName = 'REGIAOTRIBUTARIA'
      Origin = 'ESTADO.REGIAOTRIBUTARIA'
      Required = True
    end
    object IBQEstadoCODIGOUF: TIBStringField
      FieldName = 'CODIGOUF'
      Origin = 'ESTADO.CODIGOUF'
      Size = 5
    end
  end
  object DsEstado: TDataSource
    DataSet = IBQEstado
    Left = 48
    Top = 320
  end
  object QEstado_Cad: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Rowid,'
      '  Tb_Estado.*'
      'From'
      '  Tb_Estado'
      'Where'
      '  Cod_Estado = :pk')
    Variables.Data = {0300000001000000030000003A504B050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000A0000000A000000434F445F45535441444F0100000000000B000000
      444553435F45535441444F0100000000000F000000504552435F545249425554
      4143414F01000000000011000000444553435F5349474C415F45535441444F01
      00000000000A000000504552435F465245544501000000000014000000504552
      435F494D504F53544F5F5245445543414F01000000000012000000504552435F
      494D504F53544F5F43455354410100000000000F000000504552435F42415345
      5F53554253540100000000000F000000504552435F414C49515F535542535401
      000000000014000000444553435F494E5343524943414F5F5355425354010000
      000000}
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 152
    Top = 264
    object QEstado_CadCOD_ESTADO: TStringField
      FieldName = 'COD_ESTADO'
      Required = True
      Size = 2
    end
    object QEstado_CadDESC_ESTADO: TStringField
      FieldName = 'DESC_ESTADO'
      Required = True
      Size = 30
    end
    object QEstado_CadPERC_TRIBUTACAO: TFloatField
      FieldName = 'PERC_TRIBUTACAO'
    end
    object QEstado_CadDESC_SIGLA_ESTADO: TStringField
      FieldName = 'DESC_SIGLA_ESTADO'
      Required = True
      Size = 2
    end
    object QEstado_CadPERC_FRETE: TFloatField
      FieldName = 'PERC_FRETE'
    end
    object QEstado_CadPERC_IMPOSTO_REDUCAO: TFloatField
      FieldName = 'PERC_IMPOSTO_REDUCAO'
    end
    object QEstado_CadPERC_IMPOSTO_CESTA: TFloatField
      FieldName = 'PERC_IMPOSTO_CESTA'
    end
    object QEstado_CadPERC_BASE_SUBST: TFloatField
      FieldName = 'PERC_BASE_SUBST'
    end
    object QEstado_CadPERC_ALIQ_SUBST: TFloatField
      FieldName = 'PERC_ALIQ_SUBST'
    end
    object QEstado_CadDESC_INSCRICAO_SUBST: TStringField
      FieldName = 'DESC_INSCRICAO_SUBST'
      Size = 15
    end
  end
  object IBQFornecedor: TIBQuery
    Database = DMConexao.IBInterbase
    Transaction = DMConexao.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select '
      '  FORNECEDOR.*,'
      '  CIDADE.CIDADE AS DESC_CIDADE,'
      '  CIDADE.ESTADO'
      'from '
      '  FORNECEDOR,'
      '  CIDADE'
      'WHERE '
      '  FORNECEDOR.CIDADE = CIDADE.CODIGO'
      'order by FORNECEDOR.codigo')
    Left = 280
    Top = 24
    object IBQFornecedorCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'FORNECEDOR.CODIGO'
      Required = True
    end
    object IBQFornecedorNOME: TIBStringField
      FieldName = 'NOME'
      Origin = 'FORNECEDOR.NOME'
      Required = True
      Size = 60
    end
    object IBQFornecedorAPELIDO: TIBStringField
      FieldName = 'APELIDO'
      Origin = 'FORNECEDOR.APELIDO'
      Required = True
      Size = 60
    end
    object IBQFornecedorENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Origin = 'FORNECEDOR.ENDERECO'
      Required = True
      Size = 60
    end
    object IBQFornecedorENDERECONUMERORUA: TIBStringField
      FieldName = 'ENDERECONUMERORUA'
      Origin = 'FORNECEDOR.ENDERECONUMERORUA'
      Size = 8
    end
    object IBQFornecedorENDERECOBAIRRO: TIBStringField
      FieldName = 'ENDERECOBAIRRO'
      Origin = 'FORNECEDOR.ENDERECOBAIRRO'
      Size = 60
    end
    object IBQFornecedorENDERECOCXPOSTAL: TIntegerField
      FieldName = 'ENDERECOCXPOSTAL'
      Origin = 'FORNECEDOR.ENDERECOCXPOSTAL'
    end
    object IBQFornecedorENDERECOCOMPLEMENTO: TIBStringField
      FieldName = 'ENDERECOCOMPLEMENTO'
      Origin = 'FORNECEDOR.ENDERECOCOMPLEMENTO'
      Size = 40
    end
    object IBQFornecedorENDERECOANTERIOR: TIBStringField
      FieldName = 'ENDERECOANTERIOR'
      Origin = 'FORNECEDOR.ENDERECOANTERIOR'
      Size = 60
    end
    object IBQFornecedorCIDADE: TIntegerField
      FieldName = 'CIDADE'
      Origin = 'FORNECEDOR.CIDADE'
    end
    object IBQFornecedorCOMERCIALFONE: TIBStringField
      FieldName = 'COMERCIALFONE'
      Origin = 'FORNECEDOR.COMERCIALFONE'
      Size = 16
    end
    object IBQFornecedorCOMERCIALFAX: TIBStringField
      FieldName = 'COMERCIALFAX'
      Origin = 'FORNECEDOR.COMERCIALFAX'
      Size = 16
    end
    object IBQFornecedorCONTATO: TIBStringField
      FieldName = 'CONTATO'
      Origin = 'FORNECEDOR.CONTATO'
    end
    object IBQFornecedorCONTATOCELULAR: TIBStringField
      FieldName = 'CONTATOCELULAR'
      Origin = 'FORNECEDOR.CONTATOCELULAR'
      Size = 16
    end
    object IBQFornecedorPESSOAFISICAJURIDICA: TIBStringField
      FieldName = 'PESSOAFISICAJURIDICA'
      Origin = 'FORNECEDOR.PESSOAFISICAJURIDICA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object IBQFornecedorCPFCNPJ: TIBStringField
      FieldName = 'CPFCNPJ'
      Origin = 'FORNECEDOR.CPFCNPJ'
      Size = 18
    end
    object IBQFornecedorRGIE: TIBStringField
      FieldName = 'RGIE'
      Origin = 'FORNECEDOR.RGIE'
      Size = 14
    end
    object IBQFornecedorEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'FORNECEDOR.EMAIL'
      Size = 60
    end
    object IBQFornecedorHOMEPAGE: TIBStringField
      FieldName = 'HOMEPAGE'
      Origin = 'FORNECEDOR.HOMEPAGE'
      Size = 60
    end
    object IBQFornecedorBANCO: TIBStringField
      FieldName = 'BANCO'
      Origin = 'FORNECEDOR.BANCO'
    end
    object IBQFornecedorBANCOCONTA: TIBStringField
      FieldName = 'BANCOCONTA'
      Origin = 'FORNECEDOR.BANCOCONTA'
      Size = 10
    end
    object IBQFornecedorBANCOAGENCIA: TIBStringField
      FieldName = 'BANCOAGENCIA'
      Origin = 'FORNECEDOR.BANCOAGENCIA'
      Size = 10
    end
    object IBQFornecedorPRACAPAGAMENTO: TIBStringField
      FieldName = 'PRACAPAGAMENTO'
      Origin = 'FORNECEDOR.PRACAPAGAMENTO'
      Size = 60
    end
    object IBQFornecedorLOGOMARCA: TBlobField
      FieldName = 'LOGOMARCA'
      Origin = 'FORNECEDOR.LOGOMARCA'
      Size = 8
    end
    object IBQFornecedorATIVIDADE: TIBStringField
      FieldName = 'ATIVIDADE'
      Origin = 'FORNECEDOR.ATIVIDADE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object IBQFornecedorREGIMEFEDERALSIMPLES: TSmallintField
      FieldName = 'REGIMEFEDERALSIMPLES'
      Origin = 'FORNECEDOR.REGIMEFEDERALSIMPLES'
      Required = True
    end
    object IBQFornecedorREGIMEESTADUALSIMPLES: TSmallintField
      FieldName = 'REGIMEESTADUALSIMPLES'
      Origin = 'FORNECEDOR.REGIMEESTADUALSIMPLES'
      Required = True
    end
    object IBQFornecedorCODIGOCLASSIFICACAO: TIntegerField
      FieldName = 'CODIGOCLASSIFICACAO'
      Origin = 'FORNECEDOR.CODIGOCLASSIFICACAO'
      Required = True
    end
    object IBQFornecedorREPRESENTANTE: TIBStringField
      FieldName = 'REPRESENTANTE'
      Origin = 'FORNECEDOR.REPRESENTANTE'
      Size = 60
    end
    object IBQFornecedorREPRESENTANTEFONE: TIBStringField
      FieldName = 'REPRESENTANTEFONE'
      Origin = 'FORNECEDOR.REPRESENTANTEFONE'
      Size = 16
    end
    object IBQFornecedorCEP: TIBStringField
      FieldName = 'CEP'
      Origin = 'FORNECEDOR.CEP'
      Size = 9
    end
    object IBQFornecedorATIVO: TSmallintField
      FieldName = 'ATIVO'
      Origin = 'FORNECEDOR.ATIVO'
      Required = True
    end
    object IBQFornecedorOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Origin = 'FORNECEDOR.OBSERVACAO'
      BlobType = ftMemo
      Size = 8
    end
    object IBQFornecedorNOMETRANSFERENCIA: TIBStringField
      FieldName = 'NOMETRANSFERENCIA'
      Origin = 'FORNECEDOR.NOMETRANSFERENCIA'
      Size = 15
    end
    object IBQFornecedorDESC_CIDADE: TIBStringField
      FieldName = 'DESC_CIDADE'
      Origin = 'CIDADE.CIDADE'
      Required = True
      Size = 30
    end
    object IBQFornecedorESTADO: TIBStringField
      FieldName = 'ESTADO'
      Origin = 'CIDADE.ESTADO'
      Required = True
      Size = 2
    end
  end
  object DsFornecedor: TDataSource
    DataSet = IBQFornecedor
    Left = 280
    Top = 80
  end
  object QProduto_Cad: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Rowid,'
      '  Tb_Produto.*'
      'From'
      '  Tb_Produto'
      'Where'
      '  Cod_Produto = :PK')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000320000000B000000434F445F50524F4455544F0100000000000A0000
      00434F445F434C415353450100000000000E000000434F445F54524942555441
      43414F0100000000000C000000444553435F50524F4455544F0100000000000D
      0000004E554D5F454D42414C4147454D0100000000000C000000444553435F55
      4E4944414445010000000000160000004E554D5F545249425F5452414E534645
      52454E4349410100000000000A00000056414C5F564152454A4F010000000000
      0B00000056414C5F4154414341444F01000000000014000000504552435F4445
      53434F4E544F5F4D4158494D4F01000000000008000000504552435F49504901
      000000000011000000444553435F434C4153535F46495343414C010000000000
      10000000494E445F5449504F5F50524F4455544F010000000000120000004454
      5F414C5445524143414F5F505245434F0100000000000E0000004E554D5F4641
      42524943414E54450100000000000C000000434F445F434144415354524F0100
      000000000D000000504552435F434F4D495353414F0100000000000800000050
      4552435F49535301000000000009000000504552435F494E5353010000000000
      0E000000505245434F5F50524F4D4F43414F0100000000001000000044545F50
      5245434F5F50524F5F494E490100000000001000000044545F505245434F5F50
      524F5F46494E0100000000000C000000494E445F534954554143414F01000000
      000019000000444553435F434F4D504C454D454E544F5F50524F4D4F43414F01
      000000000010000000444553435F434F4D504C454D454E544F0100000000000D
      000000434F445F50524F4455544F5F420100000000000E000000494E445F434C
      415353455F544F580100000000000F000000444553435F464F524D554C414341
      4F01000000000012000000444553435F475255504F5F5155494D49434F010000
      0000000B0000004E554D5F564F4C554D455301000000000010000000494E445F
      43455354415F424153494341010000000000120000004E554D5F4D4554524F53
      5F43554249434F5301000000000012000000494E445F5449504F5F454D42414C
      4147454D01000000000012000000444553435F434F4D504C454D454E544F5F32
      01000000000012000000494E445F5449504F5F564153494C48414D4501000000
      00000F000000505245434F5F50524F4D4F43414F310100000000000D00000049
      4E445F4553544F46415249410100000000000B000000494E445F50494E545552
      410100000000000F00000056414C5F505245434F5F4652455445010000000000
      0E000000494E445F5245544F524E4156454C0100000000000D0000004E554D5F
      43585F50414C45544501000000000006000000494E445F4B4D01000000000009
      000000434F445F4D415243410100000000000F00000044545F56454E43544F5F
      505245434F0100000000000D000000434F445F4C4F54455F5449504F01000000
      00000A000000434F445F4E424D5F534801000000000013000000494E445F5355
      4253544954554943414F5F524A01000000000012000000504552435F4D415247
      454D5F564152454A4F01000000000013000000504552435F4D415247454D5F41
      54414341444F0100000000000900000051545F54454349444F010000000000}
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 488
    Top = 24
    object QProduto_CadCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QProduto_CadCOD_CLASSE: TIntegerField
      FieldName = 'COD_CLASSE'
      Required = True
    end
    object QProduto_CadCOD_TRIBUTACAO: TIntegerField
      FieldName = 'COD_TRIBUTACAO'
      Required = True
    end
    object QProduto_CadDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
    object QProduto_CadNUM_EMBALAGEM: TFloatField
      FieldName = 'NUM_EMBALAGEM'
    end
    object QProduto_CadDESC_UNIDADE: TStringField
      FieldName = 'DESC_UNIDADE'
      Size = 3
    end
    object QProduto_CadNUM_TRIB_TRANSFERENCIA: TIntegerField
      FieldName = 'NUM_TRIB_TRANSFERENCIA'
    end
    object QProduto_CadVAL_VAREJO: TFloatField
      FieldName = 'VAL_VAREJO'
    end
    object QProduto_CadVAL_ATACADO: TFloatField
      FieldName = 'VAL_ATACADO'
    end
    object QProduto_CadPERC_DESCONTO_MAXIMO: TFloatField
      FieldName = 'PERC_DESCONTO_MAXIMO'
    end
    object QProduto_CadPERC_IPI: TFloatField
      FieldName = 'PERC_IPI'
    end
    object QProduto_CadDESC_CLASS_FISCAL: TStringField
      FieldName = 'DESC_CLASS_FISCAL'
      Size = 3
    end
    object QProduto_CadIND_TIPO_PRODUTO: TStringField
      FieldName = 'IND_TIPO_PRODUTO'
      Required = True
      Size = 10
    end
    object QProduto_CadDT_ALTERACAO_PRECO: TDateTimeField
      FieldName = 'DT_ALTERACAO_PRECO'
    end
    object QProduto_CadNUM_FABRICANTE: TStringField
      FieldName = 'NUM_FABRICANTE'
      Size = 15
    end
    object QProduto_CadCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
    end
    object QProduto_CadPERC_COMISSAO: TFloatField
      FieldName = 'PERC_COMISSAO'
    end
    object QProduto_CadPERC_ISS: TFloatField
      FieldName = 'PERC_ISS'
      Required = True
    end
    object QProduto_CadPERC_INSS: TFloatField
      FieldName = 'PERC_INSS'
      Required = True
    end
    object QProduto_CadPRECO_PROMOCAO: TFloatField
      FieldName = 'PRECO_PROMOCAO'
    end
    object QProduto_CadDT_PRECO_PRO_INI: TDateTimeField
      FieldName = 'DT_PRECO_PRO_INI'
    end
    object QProduto_CadDT_PRECO_PRO_FIN: TDateTimeField
      FieldName = 'DT_PRECO_PRO_FIN'
    end
    object QProduto_CadIND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Size = 15
    end
    object QProduto_CadDESC_COMPLEMENTO_PROMOCAO: TStringField
      FieldName = 'DESC_COMPLEMENTO_PROMOCAO'
      Size = 10
    end
    object QProduto_CadDESC_COMPLEMENTO: TStringField
      FieldName = 'DESC_COMPLEMENTO'
      Size = 50
    end
    object QProduto_CadCOD_PRODUTO_B: TFloatField
      FieldName = 'COD_PRODUTO_B'
    end
    object QProduto_CadIND_CLASSE_TOX: TStringField
      FieldName = 'IND_CLASSE_TOX'
      Size = 3
    end
    object QProduto_CadDESC_FORMULACAO: TStringField
      FieldName = 'DESC_FORMULACAO'
      Size = 50
    end
    object QProduto_CadDESC_GRUPO_QUIMICO: TStringField
      FieldName = 'DESC_GRUPO_QUIMICO'
      Size = 30
    end
    object QProduto_CadNUM_VOLUMES: TFloatField
      FieldName = 'NUM_VOLUMES'
    end
    object QProduto_CadIND_CESTA_BASICA: TStringField
      FieldName = 'IND_CESTA_BASICA'
      Size = 3
    end
    object QProduto_CadNUM_METROS_CUBICOS: TFloatField
      FieldName = 'NUM_METROS_CUBICOS'
    end
    object QProduto_CadIND_TIPO_EMBALAGEM: TStringField
      FieldName = 'IND_TIPO_EMBALAGEM'
      Size = 1
    end
    object QProduto_CadDESC_COMPLEMENTO_2: TStringField
      FieldName = 'DESC_COMPLEMENTO_2'
      Size = 30
    end
    object QProduto_CadIND_TIPO_VASILHAME: TStringField
      FieldName = 'IND_TIPO_VASILHAME'
      Size = 1
    end
    object QProduto_CadPRECO_PROMOCAO1: TFloatField
      FieldName = 'PRECO_PROMOCAO1'
    end
    object QProduto_CadIND_ESTOFARIA: TStringField
      FieldName = 'IND_ESTOFARIA'
      Size = 3
    end
    object QProduto_CadIND_PINTURA: TStringField
      FieldName = 'IND_PINTURA'
      Size = 3
    end
    object QProduto_CadVAL_PRECO_FRETE: TFloatField
      FieldName = 'VAL_PRECO_FRETE'
    end
    object QProduto_CadIND_RETORNAVEL: TStringField
      FieldName = 'IND_RETORNAVEL'
      Size = 3
    end
    object QProduto_CadNUM_CX_PALETE: TIntegerField
      FieldName = 'NUM_CX_PALETE'
    end
    object QProduto_CadIND_KM: TStringField
      FieldName = 'IND_KM'
      Size = 1
    end
    object QProduto_CadCOD_MARCA: TIntegerField
      FieldName = 'COD_MARCA'
    end
    object QProduto_CadDT_VENCTO_PRECO: TDateTimeField
      FieldName = 'DT_VENCTO_PRECO'
    end
    object QProduto_CadCOD_LOTE_TIPO: TIntegerField
      FieldName = 'COD_LOTE_TIPO'
    end
    object QProduto_CadCOD_NBM_SH: TStringField
      FieldName = 'COD_NBM_SH'
      Size = 12
    end
    object QProduto_CadIND_SUBSTITUICAO_RJ: TStringField
      FieldName = 'IND_SUBSTITUICAO_RJ'
      Size = 1
    end
    object QProduto_CadPERC_MARGEM_VAREJO: TFloatField
      FieldName = 'PERC_MARGEM_VAREJO'
    end
    object QProduto_CadPERC_MARGEM_ATACADO: TFloatField
      FieldName = 'PERC_MARGEM_ATACADO'
    end
    object QProduto_CadQT_TECIDO: TFloatField
      FieldName = 'QT_TECIDO'
    end
  end
  object IBQProduto: TIBQuery
    Database = DMConexao.IBInterbase
    Transaction = DMConexao.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from PRODUTO')
    Left = 384
    Top = 24
    object IBQProdutoCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = 'PRODUTO.CODIGO'
      Required = True
      Size = 50
    end
    object IBQProdutoCODIGOORIGINAL: TIBStringField
      FieldName = 'CODIGOORIGINAL'
      Origin = 'PRODUTO.CODIGOORIGINAL'
      Size = 30
    end
    object IBQProdutoNOME: TIBStringField
      FieldName = 'NOME'
      Origin = 'PRODUTO.NOME'
      Required = True
      Size = 60
    end
    object IBQProdutoUNIDADE: TIBStringField
      FieldName = 'UNIDADE'
      Origin = 'PRODUTO.UNIDADE'
      Required = True
      Size = 3
    end
    object IBQProdutoUNIDADE1: TIBStringField
      FieldName = 'UNIDADE1'
      Origin = 'PRODUTO.UNIDADE1'
      Size = 3
    end
    object IBQProdutoLOCAL: TIntegerField
      FieldName = 'LOCAL'
      Origin = 'PRODUTO.LOCAL'
      Required = True
    end
    object IBQProdutoCLASSIFICACAO: TIntegerField
      FieldName = 'CLASSIFICACAO'
      Origin = 'PRODUTO.CLASSIFICACAO'
      Required = True
    end
    object IBQProdutoLINHA: TIntegerField
      FieldName = 'LINHA'
      Origin = 'PRODUTO.LINHA'
      Required = True
    end
    object IBQProdutoPESO: TFloatField
      FieldName = 'PESO'
      Origin = 'PRODUTO.PESO'
    end
    object IBQProdutoTRIBUTACAOICMS: TIBStringField
      FieldName = 'TRIBUTACAOICMS'
      Origin = 'PRODUTO.TRIBUTACAOICMS'
      Size = 6
    end
    object IBQProdutoTRIBUTACAOIPI: TIBStringField
      FieldName = 'TRIBUTACAOIPI'
      Origin = 'PRODUTO.TRIBUTACAOIPI'
      Size = 6
    end
    object IBQProdutoFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'PRODUTO.FOTO'
      Size = 8
    end
    object IBQProdutoCODIGONCM: TIBStringField
      FieldName = 'CODIGONCM'
      Origin = 'PRODUTO.CODIGONCM'
      Size = 30
    end
    object IBQProdutoNUMEROVOLUME: TFloatField
      FieldName = 'NUMEROVOLUME'
      Origin = 'PRODUTO.NUMEROVOLUME'
    end
    object IBQProdutoORIGEMPRODUTO: TIBStringField
      FieldName = 'ORIGEMPRODUTO'
      Origin = 'PRODUTO.ORIGEMPRODUTO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object IBQProdutoAPLICACAO: TMemoField
      FieldName = 'APLICACAO'
      Origin = 'PRODUTO.APLICACAO'
      BlobType = ftMemo
      Size = 8
    end
    object IBQProdutoARTIGOLEGISLACAO: TIntegerField
      FieldName = 'ARTIGOLEGISLACAO'
      Origin = 'PRODUTO.ARTIGOLEGISLACAO'
    end
    object IBQProdutoARTIGOLEGISLACAOSUBSTITUICAO: TIntegerField
      FieldName = 'ARTIGOLEGISLACAOSUBSTITUICAO'
      Origin = 'PRODUTO.ARTIGOLEGISLACAOSUBSTITUICAO'
    end
    object IBQProdutoARTIGOLEGISLACAOSUBSTITUTO: TIntegerField
      FieldName = 'ARTIGOLEGISLACAOSUBSTITUTO'
      Origin = 'PRODUTO.ARTIGOLEGISLACAOSUBSTITUTO'
    end
    object IBQProdutoCONTROLADOPORSERIE: TIntegerField
      FieldName = 'CONTROLADOPORSERIE'
      Origin = 'PRODUTO.CONTROLADOPORSERIE'
    end
    object IBQProdutoLUBRIFICANTE: TSmallintField
      FieldName = 'LUBRIFICANTE'
      Origin = 'PRODUTO.LUBRIFICANTE'
      Required = True
    end
    object IBQProdutoCREDITOPISCOFINS: TFloatField
      FieldName = 'CREDITOPISCOFINS'
      Origin = 'PRODUTO.CREDITOPISCOFINS'
    end
    object IBQProdutoCODIGOFINAME: TIBStringField
      FieldName = 'CODIGOFINAME'
      Origin = 'PRODUTO.CODIGOFINAME'
      Size = 30
    end
    object IBQProdutoPAUTAICMSINTERNA: TIntegerField
      FieldName = 'PAUTAICMSINTERNA'
      Origin = 'PRODUTO.PAUTAICMSINTERNA'
    end
    object IBQProdutoPAUTAICMSEXTERNA: TIntegerField
      FieldName = 'PAUTAICMSEXTERNA'
      Origin = 'PRODUTO.PAUTAICMSEXTERNA'
    end
    object IBQProdutoPAUTAICMSSUBSTITUTOVALOR: TIntegerField
      FieldName = 'PAUTAICMSSUBSTITUTOVALOR'
      Origin = 'PRODUTO.PAUTAICMSSUBSTITUTOVALOR'
    end
    object IBQProdutoPAUTAICMSSUBSTITUTOPERC: TIntegerField
      FieldName = 'PAUTAICMSSUBSTITUTOPERC'
      Origin = 'PRODUTO.PAUTAICMSSUBSTITUTOPERC'
    end
    object IBQProdutoPAUTAIPIVALOR: TIntegerField
      FieldName = 'PAUTAIPIVALOR'
      Origin = 'PRODUTO.PAUTAIPIVALOR'
    end
    object IBQProdutoCODIGODUN14: TIBStringField
      FieldName = 'CODIGODUN14'
      Origin = 'PRODUTO.CODIGODUN14'
      Size = 15
    end
    object IBQProdutoTARAPRIMARIA: TFloatField
      FieldName = 'TARAPRIMARIA'
      Origin = 'PRODUTO.TARAPRIMARIA'
    end
    object IBQProdutoTARASECUNDARIA: TFloatField
      FieldName = 'TARASECUNDARIA'
      Origin = 'PRODUTO.TARASECUNDARIA'
    end
    object IBQProdutoDESCRICAOLINHA1: TIBStringField
      FieldName = 'DESCRICAOLINHA1'
      Origin = 'PRODUTO.DESCRICAOLINHA1'
      Size = 67
    end
    object IBQProdutoDESCRICAOLINHA2: TIBStringField
      FieldName = 'DESCRICAOLINHA2'
      Origin = 'PRODUTO.DESCRICAOLINHA2'
      Size = 67
    end
    object IBQProdutoREGISTROSIF: TIBStringField
      FieldName = 'REGISTROSIF'
      Origin = 'PRODUTO.REGISTROSIF'
      Size = 8
    end
    object IBQProdutoVALIDADERESFRIADO: TIntegerField
      FieldName = 'VALIDADERESFRIADO'
      Origin = 'PRODUTO.VALIDADERESFRIADO'
    end
    object IBQProdutoVALIDADECONGELADO: TIntegerField
      FieldName = 'VALIDADECONGELADO'
      Origin = 'PRODUTO.VALIDADECONGELADO'
    end
    object IBQProdutoTIPOPRODUTO: TIBStringField
      FieldName = 'TIPOPRODUTO'
      Origin = 'PRODUTO.TIPOPRODUTO'
      FixedChar = True
      Size = 1
    end
    object IBQProdutoGRUPO: TIntegerField
      FieldName = 'GRUPO'
      Origin = 'PRODUTO.GRUPO'
      Required = True
    end
    object IBQProdutoPRECOPAUTAFISCAL: TFloatField
      FieldName = 'PRECOPAUTAFISCAL'
      Origin = 'PRODUTO.PRECOPAUTAFISCAL'
    end
    object IBQProdutoPRECOPAUTAFISCALINTERESTADUAL: TFloatField
      FieldName = 'PRECOPAUTAFISCALINTERESTADUAL'
      Origin = 'PRODUTO.PRECOPAUTAFISCALINTERESTADUAL'
    end
  end
  object DSProduto: TDataSource
    DataSet = IBQProduto
    Left = 384
    Top = 80
  end
  object IBQDesconto: TIBQuery
    Database = DMConexao.IBInterbase
    Transaction = DMConexao.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from CRUMIDADESDESCONTOS')
    Left = 272
    Top = 152
    object IBQDescontoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CRUMIDADESDESCONTOS.CODIGO'
      Required = True
    end
    object IBQDescontoCODIGOPRODUTO: TIBStringField
      FieldName = 'CODIGOPRODUTO'
      Origin = 'CRUMIDADESDESCONTOS.CODIGOPRODUTO'
      Required = True
      Size = 15
    end
    object IBQDescontoUMIDADE: TFloatField
      FieldName = 'UMIDADE'
      Origin = 'CRUMIDADESDESCONTOS.UMIDADE'
    end
    object IBQDescontoDESCONTO: TFloatField
      FieldName = 'DESCONTO'
      Origin = 'CRUMIDADESDESCONTOS.DESCONTO'
    end
  end
  object DsDesconto: TDataSource
    DataSet = IBQDesconto
    Left = 272
    Top = 208
  end
  object QDesconto_Agricola: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Rowid,'
      '  Tb_Desconto_Agricola.*'
      'From'
      '  Tb_Desconto_Agricola'
      'Where'
      '  Cod_Produto = :pk')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000040000000B000000434F445F50524F4455544F0100000000000C0000
      00504552435F554D49444144450100000000000D000000504552435F44455343
      4F4E544F0100000000000A000000434F445F46494C49414C010000000000}
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 368
    Top = 160
    object QDesconto_AgricolaCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QDesconto_AgricolaPERC_UMIDADE: TFloatField
      FieldName = 'PERC_UMIDADE'
      Required = True
    end
    object QDesconto_AgricolaPERC_DESCONTO: TFloatField
      FieldName = 'PERC_DESCONTO'
    end
    object QDesconto_AgricolaCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
    end
  end
  object QContaPagarCab: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_CONTA_PAGAR_CAB.*'
      'FROM '
      '  TB_CONTA_PAGAR_CAB'
      'WHERE'
      '  COD_CONTA_PAGAR_CAB = :PK')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_CONTA_PAGAR_CAB'
    SequenceField.Sequence = 'SQCONTA_PAGAR'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000002A00000013000000434F445F434F4E54415F50414741525F43414201
      00000000000E000000434F445F46494E414C4944414445010000000000110000
      00434F445F42414E434F5F4147454E4349410100000000000C000000434F445F
      434144415354524F0100000000000A000000434F445F46494C49414C01000000
      00000A0000004E554D5F544954554C4F0100000000000B0000004E554D5F5041
      5243454C4101000000000013000000444553435F5449504F5F444F43554D454E
      544F0100000000000C00000044545F4D4F56494D454E544F0100000000000800
      000044545F42414958410100000000000D00000044545F56454E43494D454E54
      4F0100000000000A00000044545F454D495353414F0100000000001000000044
      545F4341504954414C495A4143414F0100000000000A00000056414C5F544954
      554C4F0100000000000C000000434F445F4E4F54415F4341420100000000000F
      000000444553435F4F42534552564143414F0100000000000A000000494E445F
      4143454954450100000000000C000000494E445F534954554143414F01000000
      00000C00000056414C5F4F524947494E414C0100000000000C00000056414C5F
      494E44455841444F01000000000010000000434F445F444550415254414D454E
      544F0100000000000C000000434F445F434F4E545241544F0100000000000F00
      0000434F445F434F4E545241544F5F475001000000000011000000434F445F43
      4F4E545241544F5F56454E4401000000000012000000434F445F434F4E545241
      544F5F4152524F5A01000000000016000000434F445F434F4E484543494D454E
      544F5F46524554450100000000001800000044545F56454E43494D454E544F5F
      50524F52524F4741444F01000000000007000000434F445F5250410100000000
      0010000000434F445F4F4252415F5245515F4341420100000000000B00000043
      4F445F455354414449410100000000000900000044545F414345495445010000
      00000016000000434F445F434F4E545241544F5F504A55524944494341010000
      00000015000000504552435F444553435F414E54454349504143414F01000000
      000016000000504552435F444553435F504F4E5455414C494441444501000000
      000012000000434F445F434F4E54415F434F5252454E54450100000000001200
      0000434F445F5553554152494F5F4143454954450100000000000E000000434F
      445F42414E434F5F5047544F0100000000000B000000434F445F4147454E4349
      4101000000000017000000434F445F434F4E54415F434F5252454E54455F5047
      544F01000000000012000000444553435F434E504A5F4350465F5047544F0100
      0000000017000000444553435F4E4F4D455F544954554C41525F434F4E544101
      000000000013000000494E445F464F524D415F504147414D454E544F01000000
      0000}
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 592
    Top = 80
    object QContaPagarCabCOD_CONTA_PAGAR_CAB: TIntegerField
      FieldName = 'COD_CONTA_PAGAR_CAB'
      Required = True
    end
    object QContaPagarCabCOD_FINALIDADE: TIntegerField
      FieldName = 'COD_FINALIDADE'
      Required = True
    end
    object QContaPagarCabCOD_BANCO_AGENCIA: TIntegerField
      FieldName = 'COD_BANCO_AGENCIA'
    end
    object QContaPagarCabCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QContaPagarCabCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QContaPagarCabNUM_TITULO: TIntegerField
      FieldName = 'NUM_TITULO'
    end
    object QContaPagarCabNUM_PARCELA: TIntegerField
      FieldName = 'NUM_PARCELA'
    end
    object QContaPagarCabDESC_TIPO_DOCUMENTO: TStringField
      FieldName = 'DESC_TIPO_DOCUMENTO'
      Size = 3
    end
    object QContaPagarCabDT_MOVIMENTO: TDateTimeField
      FieldName = 'DT_MOVIMENTO'
    end
    object QContaPagarCabDT_BAIXA: TDateTimeField
      FieldName = 'DT_BAIXA'
    end
    object QContaPagarCabDT_VENCIMENTO: TDateTimeField
      FieldName = 'DT_VENCIMENTO'
    end
    object QContaPagarCabDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
    object QContaPagarCabDT_CAPITALIZACAO: TDateTimeField
      FieldName = 'DT_CAPITALIZACAO'
    end
    object QContaPagarCabVAL_TITULO: TFloatField
      FieldName = 'VAL_TITULO'
    end
    object QContaPagarCabCOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
    end
    object QContaPagarCabDESC_OBSERVACAO: TStringField
      FieldName = 'DESC_OBSERVACAO'
      Size = 200
    end
    object QContaPagarCabIND_ACEITE: TStringField
      FieldName = 'IND_ACEITE'
      Size = 3
    end
    object QContaPagarCabIND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Size = 13
    end
    object QContaPagarCabVAL_ORIGINAL: TFloatField
      FieldName = 'VAL_ORIGINAL'
    end
    object QContaPagarCabVAL_INDEXADO: TFloatField
      FieldName = 'VAL_INDEXADO'
    end
    object QContaPagarCabCOD_DEPARTAMENTO: TIntegerField
      FieldName = 'COD_DEPARTAMENTO'
      Required = True
    end
    object QContaPagarCabCOD_CONTRATO: TIntegerField
      FieldName = 'COD_CONTRATO'
    end
    object QContaPagarCabCOD_CONTRATO_GP: TIntegerField
      FieldName = 'COD_CONTRATO_GP'
    end
    object QContaPagarCabCOD_CONTRATO_VEND: TIntegerField
      FieldName = 'COD_CONTRATO_VEND'
    end
    object QContaPagarCabCOD_CONTRATO_ARROZ: TIntegerField
      FieldName = 'COD_CONTRATO_ARROZ'
    end
    object QContaPagarCabCOD_CONHECIMENTO_FRETE: TIntegerField
      FieldName = 'COD_CONHECIMENTO_FRETE'
    end
    object QContaPagarCabDT_VENCIMENTO_PRORROGADO: TDateTimeField
      FieldName = 'DT_VENCIMENTO_PRORROGADO'
    end
    object QContaPagarCabCOD_RPA: TIntegerField
      FieldName = 'COD_RPA'
    end
    object QContaPagarCabCOD_OBRA_REQ_CAB: TIntegerField
      FieldName = 'COD_OBRA_REQ_CAB'
    end
    object QContaPagarCabCOD_ESTADIA: TIntegerField
      FieldName = 'COD_ESTADIA'
    end
    object QContaPagarCabDT_ACEITE: TDateTimeField
      FieldName = 'DT_ACEITE'
    end
    object QContaPagarCabCOD_CONTRATO_PJURIDICA: TIntegerField
      FieldName = 'COD_CONTRATO_PJURIDICA'
    end
    object QContaPagarCabPERC_DESC_ANTECIPACAO: TFloatField
      FieldName = 'PERC_DESC_ANTECIPACAO'
    end
    object QContaPagarCabPERC_DESC_PONTUALIDADE: TFloatField
      FieldName = 'PERC_DESC_PONTUALIDADE'
    end
    object QContaPagarCabCOD_CONTA_CORRENTE: TIntegerField
      FieldName = 'COD_CONTA_CORRENTE'
    end
    object QContaPagarCabCOD_USUARIO_ACEITE: TIntegerField
      FieldName = 'COD_USUARIO_ACEITE'
    end
    object QContaPagarCabCOD_BANCO_PGTO: TIntegerField
      FieldName = 'COD_BANCO_PGTO'
    end
    object QContaPagarCabCOD_AGENCIA: TStringField
      FieldName = 'COD_AGENCIA'
      Size = 6
    end
    object QContaPagarCabCOD_CONTA_CORRENTE_PGTO: TStringField
      FieldName = 'COD_CONTA_CORRENTE_PGTO'
      Size = 10
    end
    object QContaPagarCabDESC_CNPJ_CPF_PGTO: TStringField
      FieldName = 'DESC_CNPJ_CPF_PGTO'
      Size = 18
    end
    object QContaPagarCabDESC_NOME_TITULAR_CONTA: TStringField
      FieldName = 'DESC_NOME_TITULAR_CONTA'
      Size = 30
    end
    object QContaPagarCabIND_FORMA_PAGAMENTO: TStringField
      FieldName = 'IND_FORMA_PAGAMENTO'
      Size = 8
    end
  end
  object IBQContaPagarCab: TIBQuery
    Database = DMConexao.IBInterbase
    Transaction = DMConexao.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from CONTAPAGAR')
    Left = 480
    Top = 80
    object IBQContaPagarCabNUMERODUPLICATA: TIntegerField
      FieldName = 'NUMERODUPLICATA'
      Origin = 'CONTAPAGAR.NUMERODUPLICATA'
      Required = True
    end
    object IBQContaPagarCabNUMEROPARCELA: TIntegerField
      FieldName = 'NUMEROPARCELA'
      Origin = 'CONTAPAGAR.NUMEROPARCELA'
      Required = True
    end
    object IBQContaPagarCabNUMERODOCUMENTO: TIntegerField
      FieldName = 'NUMERODOCUMENTO'
      Origin = 'CONTAPAGAR.NUMERODOCUMENTO'
    end
    object IBQContaPagarCabCODIGOFORNECEDOR: TIntegerField
      FieldName = 'CODIGOFORNECEDOR'
      Origin = 'CONTAPAGAR.CODIGOFORNECEDOR'
      Required = True
    end
    object IBQContaPagarCabDATAEMISSAO: TDateField
      FieldName = 'DATAEMISSAO'
      Origin = 'CONTAPAGAR.DATAEMISSAO'
      Required = True
    end
    object IBQContaPagarCabDATAVENCIMENTO: TDateField
      FieldName = 'DATAVENCIMENTO'
      Origin = 'CONTAPAGAR.DATAVENCIMENTO'
      Required = True
    end
    object IBQContaPagarCabDATAVENCIMENTOPROTESTO: TDateField
      FieldName = 'DATAVENCIMENTOPROTESTO'
      Origin = 'CONTAPAGAR.DATAVENCIMENTOPROTESTO'
    end
    object IBQContaPagarCabVALORDUPLICATA: TFloatField
      FieldName = 'VALORDUPLICATA'
      Origin = 'CONTAPAGAR.VALORDUPLICATA'
      Required = True
    end
    object IBQContaPagarCabVALORDOCUMENTO: TFloatField
      FieldName = 'VALORDOCUMENTO'
      Origin = 'CONTAPAGAR.VALORDOCUMENTO'
      Required = True
    end
    object IBQContaPagarCabVALORSALDO: TFloatField
      FieldName = 'VALORSALDO'
      Origin = 'CONTAPAGAR.VALORSALDO'
      Required = True
    end
    object IBQContaPagarCabVALORJUROACUMULADO: TFloatField
      FieldName = 'VALORJUROACUMULADO'
      Origin = 'CONTAPAGAR.VALORJUROACUMULADO'
      Required = True
    end
    object IBQContaPagarCabJUROCALCULADOATE: TDateField
      FieldName = 'JUROCALCULADOATE'
      Origin = 'CONTAPAGAR.JUROCALCULADOATE'
    end
    object IBQContaPagarCabSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'CONTAPAGAR.STATUS'
      Required = True
      FixedChar = True
      Size = 1
    end
    object IBQContaPagarCabCODIGOCOBRANCA: TIntegerField
      FieldName = 'CODIGOCOBRANCA'
      Origin = 'CONTAPAGAR.CODIGOCOBRANCA'
      Required = True
    end
    object IBQContaPagarCabQUITADA: TSmallintField
      FieldName = 'QUITADA'
      Origin = 'CONTAPAGAR.QUITADA'
      Required = True
    end
    object IBQContaPagarCabOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Origin = 'CONTAPAGAR.OBSERVACAO'
      BlobType = ftMemo
      Size = 8
    end
    object IBQContaPagarCabCODIGOFUNCIONARIO: TIntegerField
      FieldName = 'CODIGOFUNCIONARIO'
      Origin = 'CONTAPAGAR.CODIGOFUNCIONARIO'
      Required = True
    end
    object IBQContaPagarCabCODIGOPEDIDO: TIntegerField
      FieldName = 'CODIGOPEDIDO'
      Origin = 'CONTAPAGAR.CODIGOPEDIDO'
    end
    object IBQContaPagarCabCODIGONF: TIntegerField
      FieldName = 'CODIGONF'
      Origin = 'CONTAPAGAR.CODIGONF'
    end
    object IBQContaPagarCabCNPJ: TIBStringField
      FieldName = 'CNPJ'
      Origin = 'CONTAPAGAR.CNPJ'
      Required = True
      Size = 18
    end
  end
  object DsContaPagarCab: TDataSource
    DataSet = IBQContaPagarCab
    Left = 480
    Top = 136
  end
  object QContaPagarMov: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Rowid,'
      '  Tb_Conta_Pagar_Mov.*'
      'From'
      '  Tb_Conta_pagar_mov'
      'Where'
      '  Cod_Conta_Pagar_Mov = :PK')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_CONTA_PAGAR_MOV'
    SequenceField.Sequence = 'SQCONTA_PAGAR_MOV'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000001000000013000000434F445F434F4E54415F50414741525F4D4F5601
      000000000013000000434F445F434F4E54415F50414741525F43414201000000
      00000C00000044545F4D4F56494D454E544F0100000000000D00000056414C5F
      4D4F56494D454E544F0100000000000F000000444553435F4F42534552564143
      414F01000000000012000000494E445F5449504F5F4D4F56494D454E544F0100
      000000000A00000044545F5553554152494F0100000000000B000000434F445F
      5553554152494F01000000000011000000434F445F42434F5F4D4F56494D454E
      544F0100000000000D000000434F445F43414958415F4D4F5601000000000018
      000000434F445F4C414E43544F5F434F4E544142494C5F435245440100000000
      0017000000434F445F4C414E43544F5F434F4E544142494C5F44454201000000
      000007000000434F445F41555801000000000013000000494E445F464F524D41
      5F504147414D454E544F0100000000000D000000494E445F4445564F4C554341
      4F01000000000010000000434F445F414449414E54414D454E544F0100000000
      00}
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 592
    Top = 192
    object QContaPagarMovCOD_CONTA_PAGAR_MOV: TIntegerField
      FieldName = 'COD_CONTA_PAGAR_MOV'
      Required = True
    end
    object QContaPagarMovCOD_CONTA_PAGAR_CAB: TIntegerField
      FieldName = 'COD_CONTA_PAGAR_CAB'
      Required = True
    end
    object QContaPagarMovDT_MOVIMENTO: TDateTimeField
      FieldName = 'DT_MOVIMENTO'
    end
    object QContaPagarMovVAL_MOVIMENTO: TFloatField
      FieldName = 'VAL_MOVIMENTO'
    end
    object QContaPagarMovDESC_OBSERVACAO: TStringField
      FieldName = 'DESC_OBSERVACAO'
      Size = 60
    end
    object QContaPagarMovIND_TIPO_MOVIMENTO: TStringField
      FieldName = 'IND_TIPO_MOVIMENTO'
      Required = True
    end
    object QContaPagarMovDT_USUARIO: TDateTimeField
      FieldName = 'DT_USUARIO'
      Required = True
    end
    object QContaPagarMovCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Required = True
    end
    object QContaPagarMovCOD_BCO_MOVIMENTO: TIntegerField
      FieldName = 'COD_BCO_MOVIMENTO'
    end
    object QContaPagarMovCOD_CAIXA_MOV: TIntegerField
      FieldName = 'COD_CAIXA_MOV'
    end
    object QContaPagarMovCOD_LANCTO_CONTABIL_CRED: TIntegerField
      FieldName = 'COD_LANCTO_CONTABIL_CRED'
    end
    object QContaPagarMovCOD_LANCTO_CONTABIL_DEB: TIntegerField
      FieldName = 'COD_LANCTO_CONTABIL_DEB'
    end
    object QContaPagarMovCOD_AUX: TIntegerField
      FieldName = 'COD_AUX'
    end
    object QContaPagarMovIND_FORMA_PAGAMENTO: TStringField
      FieldName = 'IND_FORMA_PAGAMENTO'
      Size = 8
    end
    object QContaPagarMovIND_DEVOLUCAO: TStringField
      FieldName = 'IND_DEVOLUCAO'
      Size = 3
    end
    object QContaPagarMovCOD_ADIANTAMENTO: TIntegerField
      FieldName = 'COD_ADIANTAMENTO'
    end
  end
  object IBQContaPagarMov: TIBQuery
    Database = DMConexao.IBInterbase
    Transaction = DMConexao.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from CONTAPAGARPARCIAL')
    Left = 480
    Top = 192
    object IBQContaPagarMovCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CONTAPAGARPARCIAL.CODIGO'
      Required = True
    end
    object IBQContaPagarMovNUMERODUPLICATA: TIntegerField
      FieldName = 'NUMERODUPLICATA'
      Origin = 'CONTAPAGARPARCIAL.NUMERODUPLICATA'
      Required = True
    end
    object IBQContaPagarMovNUMEROPARCELA: TIntegerField
      FieldName = 'NUMEROPARCELA'
      Origin = 'CONTAPAGARPARCIAL.NUMEROPARCELA'
      Required = True
    end
    object IBQContaPagarMovDATAPAGAMENTO: TDateField
      FieldName = 'DATAPAGAMENTO'
      Origin = 'CONTAPAGARPARCIAL.DATAPAGAMENTO'
      Required = True
    end
    object IBQContaPagarMovVALORDESCONTO: TFloatField
      FieldName = 'VALORDESCONTO'
      Origin = 'CONTAPAGARPARCIAL.VALORDESCONTO'
    end
    object IBQContaPagarMovVALORJUROS: TFloatField
      FieldName = 'VALORJUROS'
      Origin = 'CONTAPAGARPARCIAL.VALORJUROS'
    end
    object IBQContaPagarMovVALORPAGO: TFloatField
      FieldName = 'VALORPAGO'
      Origin = 'CONTAPAGARPARCIAL.VALORPAGO'
      Required = True
    end
    object IBQContaPagarMovSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'CONTAPAGARPARCIAL.STATUS'
      Required = True
      FixedChar = True
      Size = 1
    end
    object IBQContaPagarMovNUMERORECIBO: TIntegerField
      FieldName = 'NUMERORECIBO'
      Origin = 'CONTAPAGARPARCIAL.NUMERORECIBO'
    end
    object IBQContaPagarMovCODIGOLANCAMENTO: TIntegerField
      FieldName = 'CODIGOLANCAMENTO'
      Origin = 'CONTAPAGARPARCIAL.CODIGOLANCAMENTO'
    end
    object IBQContaPagarMovCODIGOLANCAMENTOBANCO: TIntegerField
      FieldName = 'CODIGOLANCAMENTOBANCO'
      Origin = 'CONTAPAGARPARCIAL.CODIGOLANCAMENTOBANCO'
      Required = True
    end
    object IBQContaPagarMovVALORDUPLICATA_ANT_PGTO: TFloatField
      FieldName = 'VALORDUPLICATA_ANT_PGTO'
      Origin = 'CONTAPAGARPARCIAL.VALORDUPLICATA_ANT_PGTO'
      Required = True
    end
    object IBQContaPagarMovVALORJURO_ANT_PGTO: TFloatField
      FieldName = 'VALORJURO_ANT_PGTO'
      Origin = 'CONTAPAGARPARCIAL.VALORJURO_ANT_PGTO'
      Required = True
    end
    object IBQContaPagarMovNAOCOBRARJURO: TSmallintField
      FieldName = 'NAOCOBRARJURO'
      Origin = 'CONTAPAGARPARCIAL.NAOCOBRARJURO'
      Required = True
    end
    object IBQContaPagarMovOBSERVACAOBAIXA: TIBStringField
      FieldName = 'OBSERVACAOBAIXA'
      Origin = 'CONTAPAGARPARCIAL.OBSERVACAOBAIXA'
      Size = 60
    end
    object IBQContaPagarMovPAGAMENTOINTEGRAL: TSmallintField
      FieldName = 'PAGAMENTOINTEGRAL'
      Origin = 'CONTAPAGARPARCIAL.PAGAMENTOINTEGRAL'
      Required = True
    end
    object IBQContaPagarMovCODIGOFUNCIONARIO: TIntegerField
      FieldName = 'CODIGOFUNCIONARIO'
      Origin = 'CONTAPAGARPARCIAL.CODIGOFUNCIONARIO'
      Required = True
    end
    object IBQContaPagarMovCODIGOCAIXAABERTURA: TIntegerField
      FieldName = 'CODIGOCAIXAABERTURA'
      Origin = 'CONTAPAGARPARCIAL.CODIGOCAIXAABERTURA'
      Required = True
    end
    object IBQContaPagarMovCODIGOVINCULO: TIntegerField
      FieldName = 'CODIGOVINCULO'
      Origin = 'CONTAPAGARPARCIAL.CODIGOVINCULO'
    end
    object IBQContaPagarMovCNPJ: TIBStringField
      FieldName = 'CNPJ'
      Origin = 'CONTAPAGARPARCIAL.CNPJ'
      Required = True
      Size = 18
    end
    object IBQContaPagarMovCNPJCONTAPAGAR: TIBStringField
      FieldName = 'CNPJCONTAPAGAR'
      Origin = 'CONTAPAGARPARCIAL.CNPJCONTAPAGAR'
      Required = True
      Size = 18
    end
    object IBQContaPagarMovCNPJCAIXAABERTURA: TIBStringField
      FieldName = 'CNPJCAIXAABERTURA'
      Origin = 'CONTAPAGARPARCIAL.CNPJCAIXAABERTURA'
      Required = True
      Size = 18
    end
  end
  object DsContaPagarMov: TDataSource
    DataSet = IBQContaPagarMov
    Left = 480
    Top = 248
  end
  object IBQContaReceberCab: TIBQuery
    Database = DMConexao.IBInterbase
    Transaction = DMConexao.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from CONTARECEBER')
    Left = 488
    Top = 312
    object IBQContaReceberCabNUMERODUPLICATA: TIntegerField
      FieldName = 'NUMERODUPLICATA'
      Origin = 'CONTARECEBER.NUMERODUPLICATA'
      Required = True
    end
    object IBQContaReceberCabNUMEROPARCELA: TIntegerField
      FieldName = 'NUMEROPARCELA'
      Origin = 'CONTARECEBER.NUMEROPARCELA'
      Required = True
    end
    object IBQContaReceberCabNUMERODOCUMENTO: TIntegerField
      FieldName = 'NUMERODOCUMENTO'
      Origin = 'CONTARECEBER.NUMERODOCUMENTO'
    end
    object IBQContaReceberCabCODIGOCLIENTE: TIntegerField
      FieldName = 'CODIGOCLIENTE'
      Origin = 'CONTARECEBER.CODIGOCLIENTE'
      Required = True
    end
    object IBQContaReceberCabDATAEMISSAO: TDateField
      FieldName = 'DATAEMISSAO'
      Origin = 'CONTARECEBER.DATAEMISSAO'
      Required = True
    end
    object IBQContaReceberCabDATAVENCIMENTO: TDateField
      FieldName = 'DATAVENCIMENTO'
      Origin = 'CONTARECEBER.DATAVENCIMENTO'
      Required = True
    end
    object IBQContaReceberCabDATAVENCIMENTOPROTESTO: TDateField
      FieldName = 'DATAVENCIMENTOPROTESTO'
      Origin = 'CONTARECEBER.DATAVENCIMENTOPROTESTO'
    end
    object IBQContaReceberCabVALORDUPLICATA: TFloatField
      FieldName = 'VALORDUPLICATA'
      Origin = 'CONTARECEBER.VALORDUPLICATA'
      Required = True
    end
    object IBQContaReceberCabVALORDOCUMENTO: TFloatField
      FieldName = 'VALORDOCUMENTO'
      Origin = 'CONTARECEBER.VALORDOCUMENTO'
      Required = True
    end
    object IBQContaReceberCabVALORSALDO: TFloatField
      FieldName = 'VALORSALDO'
      Origin = 'CONTARECEBER.VALORSALDO'
      Required = True
    end
    object IBQContaReceberCabVALORJUROACUMULADO: TFloatField
      FieldName = 'VALORJUROACUMULADO'
      Origin = 'CONTARECEBER.VALORJUROACUMULADO'
      Required = True
    end
    object IBQContaReceberCabJUROCALCULADOATE: TDateField
      FieldName = 'JUROCALCULADOATE'
      Origin = 'CONTARECEBER.JUROCALCULADOATE'
    end
    object IBQContaReceberCabSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'CONTARECEBER.STATUS'
      Required = True
      FixedChar = True
      Size = 1
    end
    object IBQContaReceberCabCODIGOCOBRANCA: TIntegerField
      FieldName = 'CODIGOCOBRANCA'
      Origin = 'CONTARECEBER.CODIGOCOBRANCA'
      Required = True
    end
    object IBQContaReceberCabQUITADA: TSmallintField
      FieldName = 'QUITADA'
      Origin = 'CONTARECEBER.QUITADA'
      Required = True
    end
    object IBQContaReceberCabOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Origin = 'CONTARECEBER.OBSERVACAO'
      BlobType = ftMemo
      Size = 8
    end
    object IBQContaReceberCabOBSERVACAOFATURA: TIBStringField
      FieldName = 'OBSERVACAOFATURA'
      Origin = 'CONTARECEBER.OBSERVACAOFATURA'
      Size = 30
    end
    object IBQContaReceberCabCODIGOFUNCIONARIO: TIntegerField
      FieldName = 'CODIGOFUNCIONARIO'
      Origin = 'CONTARECEBER.CODIGOFUNCIONARIO'
      Required = True
    end
    object IBQContaReceberCabNOSSONUMERO: TIBStringField
      FieldName = 'NOSSONUMERO'
      Origin = 'CONTARECEBER.NOSSONUMERO'
      Size = 60
    end
    object IBQContaReceberCabCODIGONF: TIntegerField
      FieldName = 'CODIGONF'
      Origin = 'CONTARECEBER.CODIGONF'
      Required = True
    end
    object IBQContaReceberCabCODIGOPEDIDO: TIntegerField
      FieldName = 'CODIGOPEDIDO'
      Origin = 'CONTARECEBER.CODIGOPEDIDO'
    end
    object IBQContaReceberCabCONTRATOJORNAL: TIntegerField
      FieldName = 'CONTRATOJORNAL'
      Origin = 'CONTARECEBER.CONTRATOJORNAL'
    end
    object IBQContaReceberCabTIPOCONTRATO: TIBStringField
      FieldName = 'TIPOCONTRATO'
      Origin = 'CONTARECEBER.TIPOCONTRATO'
      FixedChar = True
      Size = 2
    end
    object IBQContaReceberCabIRRF: TSmallintField
      FieldName = 'IRRF'
      Origin = 'CONTARECEBER.IRRF'
    end
    object IBQContaReceberCabGERARCOBRANCA: TSmallintField
      FieldName = 'GERARCOBRANCA'
      Origin = 'CONTARECEBER.GERARCOBRANCA'
      Required = True
    end
    object IBQContaReceberCabCNPJ: TIBStringField
      FieldName = 'CNPJ'
      Origin = 'CONTARECEBER.CNPJ'
      Required = True
      Size = 18
    end
  end
  object DsContaReceberCab: TDataSource
    DataSet = IBQContaReceberCab
    Left = 488
    Top = 368
  end
  object QContaReceberCab: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Rowid,'
      '  Tb_Conta_Receber_Cab.*'
      'From'
      '  Tb_Conta_Receber_Cab'
      'Where'
      '  Cod_Conta_Receber_Cab =  :PK')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_CONTA_RECEBER_CAB'
    SequenceField.Sequence = 'SQCONTA_RECEBER'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000002900000015000000434F445F434F4E54415F524543454245525F4341
      420100000000000E000000434F445F46494E414C494441444501000000000011
      000000434F445F42414E434F5F4147454E4349410100000000000A000000434F
      445F46494C49414C0100000000000A0000004E554D5F544954554C4F01000000
      00000B0000004E554D5F50415243454C4101000000000013000000444553435F
      5449504F5F444F43554D454E544F0100000000000C00000044545F4D4F56494D
      454E544F0100000000000800000044545F42414958410100000000000D000000
      44545F56454E43494D454E544F0100000000000A00000044545F454D49535341
      4F0100000000001000000044545F4341504954414C495A4143414F0100000000
      000A00000056414C5F544954554C4F0100000000000B00000056414C5F4E4547
      4F43494F0100000000000A000000494E445F4143454954450100000000000C00
      0000494E445F534954554143414F0100000000000F000000444553435F4F4253
      4552564143414F0100000000000C000000434F445F4E4F54415F434142010000
      0000000C000000434F445F434144415354524F0100000000000C00000056414C
      5F4F524947494E414C01000000000010000000434F445F4E4F53534F5F4E554D
      45524F0100000000000900000056414C5F4A55524F5301000000000010000000
      434F445F444550415254414D454E544F01000000000011000000434F445F434F
      4E545241544F5F56454E440100000000000E000000444553435F4156414C4953
      5441310100000000000E000000444553435F4156414C49535441320100000000
      000C000000434F445F56454E4445444F520100000000000D000000504552435F
      434F4D495353414F0100000000001600000044545F4341504954414C495A4143
      414F5F4D4F4544410100000000000F00000056414C5F50524F4D4953534F5249
      4101000000000011000000494E445F454E564941444F5F42414E434F01000000
      000012000000434F445F434F4E54415F434F5252454E54450100000000001400
      0000434F445F4F5244454D5F434F4D5052415F43414201000000000011000000
      434F445F4F4252415F434F4E545241544F01000000000011000000494E445F45
      4D495449444F5F4341524E4501000000000015000000434F445F4F4252415F43
      4F4E545241544F5F4D4F56010000000000060000004E554D5F4F530100000000
      0015000000434F445F4F5244454D5F5345525649434F5F434142010000000000
      08000000444553435F4F42530100000000000D000000434F445F56454E444544
      4F52310100000000000E000000504552435F434F4D495353414F310100000000
      00}
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 600
    Top = 312
    object QContaReceberCabCOD_CONTA_RECEBER_CAB: TIntegerField
      FieldName = 'COD_CONTA_RECEBER_CAB'
      Required = True
    end
    object QContaReceberCabCOD_FINALIDADE: TIntegerField
      FieldName = 'COD_FINALIDADE'
    end
    object QContaReceberCabCOD_BANCO_AGENCIA: TIntegerField
      FieldName = 'COD_BANCO_AGENCIA'
    end
    object QContaReceberCabCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
    end
    object QContaReceberCabNUM_TITULO: TIntegerField
      FieldName = 'NUM_TITULO'
    end
    object QContaReceberCabNUM_PARCELA: TIntegerField
      FieldName = 'NUM_PARCELA'
    end
    object QContaReceberCabDESC_TIPO_DOCUMENTO: TStringField
      FieldName = 'DESC_TIPO_DOCUMENTO'
      Size = 3
    end
    object QContaReceberCabDT_MOVIMENTO: TDateTimeField
      FieldName = 'DT_MOVIMENTO'
    end
    object QContaReceberCabDT_BAIXA: TDateTimeField
      FieldName = 'DT_BAIXA'
    end
    object QContaReceberCabDT_VENCIMENTO: TDateTimeField
      FieldName = 'DT_VENCIMENTO'
      Required = True
    end
    object QContaReceberCabDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
    object QContaReceberCabDT_CAPITALIZACAO: TDateTimeField
      FieldName = 'DT_CAPITALIZACAO'
    end
    object QContaReceberCabVAL_TITULO: TFloatField
      FieldName = 'VAL_TITULO'
    end
    object QContaReceberCabVAL_NEGOCIO: TFloatField
      FieldName = 'VAL_NEGOCIO'
    end
    object QContaReceberCabIND_ACEITE: TStringField
      FieldName = 'IND_ACEITE'
      Size = 3
    end
    object QContaReceberCabIND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Size = 13
    end
    object QContaReceberCabDESC_OBSERVACAO: TStringField
      FieldName = 'DESC_OBSERVACAO'
      Size = 50
    end
    object QContaReceberCabCOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
    end
    object QContaReceberCabCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QContaReceberCabVAL_ORIGINAL: TFloatField
      FieldName = 'VAL_ORIGINAL'
    end
    object QContaReceberCabCOD_NOSSO_NUMERO: TStringField
      FieldName = 'COD_NOSSO_NUMERO'
      Size = 15
    end
    object QContaReceberCabVAL_JUROS: TFloatField
      FieldName = 'VAL_JUROS'
    end
    object QContaReceberCabCOD_DEPARTAMENTO: TIntegerField
      FieldName = 'COD_DEPARTAMENTO'
      Required = True
    end
    object QContaReceberCabCOD_CONTRATO_VEND: TIntegerField
      FieldName = 'COD_CONTRATO_VEND'
    end
    object QContaReceberCabDESC_AVALISTA1: TStringField
      FieldName = 'DESC_AVALISTA1'
      Size = 40
    end
    object QContaReceberCabDESC_AVALISTA2: TStringField
      FieldName = 'DESC_AVALISTA2'
      Size = 40
    end
    object QContaReceberCabCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object QContaReceberCabPERC_COMISSAO: TFloatField
      FieldName = 'PERC_COMISSAO'
      Required = True
    end
    object QContaReceberCabDT_CAPITALIZACAO_MOEDA: TDateTimeField
      FieldName = 'DT_CAPITALIZACAO_MOEDA'
    end
    object QContaReceberCabVAL_PROMISSORIA: TFloatField
      FieldName = 'VAL_PROMISSORIA'
    end
    object QContaReceberCabIND_ENVIADO_BANCO: TStringField
      FieldName = 'IND_ENVIADO_BANCO'
      Size = 3
    end
    object QContaReceberCabCOD_CONTA_CORRENTE: TIntegerField
      FieldName = 'COD_CONTA_CORRENTE'
    end
    object QContaReceberCabCOD_ORDEM_COMPRA_CAB: TIntegerField
      FieldName = 'COD_ORDEM_COMPRA_CAB'
    end
    object QContaReceberCabCOD_OBRA_CONTRATO: TIntegerField
      FieldName = 'COD_OBRA_CONTRATO'
    end
    object QContaReceberCabIND_EMITIDO_CARNE: TStringField
      FieldName = 'IND_EMITIDO_CARNE'
      Size = 3
    end
    object QContaReceberCabCOD_OBRA_CONTRATO_MOV: TIntegerField
      FieldName = 'COD_OBRA_CONTRATO_MOV'
    end
    object QContaReceberCabNUM_OS: TIntegerField
      FieldName = 'NUM_OS'
    end
    object QContaReceberCabCOD_ORDEM_SERVICO_CAB: TIntegerField
      FieldName = 'COD_ORDEM_SERVICO_CAB'
    end
    object QContaReceberCabDESC_OBS: TStringField
      FieldName = 'DESC_OBS'
      Size = 1000
    end
    object QContaReceberCabCOD_VENDEDOR1: TIntegerField
      FieldName = 'COD_VENDEDOR1'
    end
    object QContaReceberCabPERC_COMISSAO1: TFloatField
      FieldName = 'PERC_COMISSAO1'
      Required = True
    end
  end
  object QContaReceberMov: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Rowid,'
      '  Tb_Conta_Receber_Mov.*'
      'From'
      '  Tb_Conta_Receber_Mov'
      'Where'
      '  Cod_Conta_Receber_Mov = :PK')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_CONTA_RECEBER_MOV'
    SequenceField.Sequence = 'SQCONTA_RECEBER_MOV'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000001000000015000000434F445F434F4E54415F524543454245525F4D4F
      5601000000000015000000434F445F434F4E54415F524543454245525F434142
      0100000000000C00000044545F4D4F56494D454E544F0100000000000D000000
      56414C5F4D4F56494D454E544F0100000000000F000000444553435F4F425345
      52564143414F0100000000000B000000434F445F5553554152494F0100000000
      000A00000044545F5553554152494F01000000000012000000494E445F544950
      4F5F4D4F56494D454E544F01000000000011000000434F445F42434F5F4D4F56
      494D454E544F0100000000000D000000434F445F43414958415F4D4F56010000
      00000018000000434F445F4C414E43544F5F434F4E544142494C5F4352454401
      000000000017000000434F445F4C414E43544F5F434F4E544142494C5F444542
      0100000000000C000000434F445F4E4F54415F4341420100000000000D000000
      494E445F4445564F4C5543414F01000000000013000000494E445F464F524D41
      5F504147414D454E544F01000000000009000000494E445F54524F4341010000
      000000}
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 608
    Top = 424
    object QContaReceberMovCOD_CONTA_RECEBER_MOV: TIntegerField
      FieldName = 'COD_CONTA_RECEBER_MOV'
      Required = True
    end
    object QContaReceberMovCOD_CONTA_RECEBER_CAB: TIntegerField
      FieldName = 'COD_CONTA_RECEBER_CAB'
    end
    object QContaReceberMovDT_MOVIMENTO: TDateTimeField
      FieldName = 'DT_MOVIMENTO'
    end
    object QContaReceberMovVAL_MOVIMENTO: TFloatField
      FieldName = 'VAL_MOVIMENTO'
    end
    object QContaReceberMovDESC_OBSERVACAO: TStringField
      FieldName = 'DESC_OBSERVACAO'
      Size = 50
    end
    object QContaReceberMovCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
    object QContaReceberMovDT_USUARIO: TDateTimeField
      FieldName = 'DT_USUARIO'
    end
    object QContaReceberMovIND_TIPO_MOVIMENTO: TStringField
      FieldName = 'IND_TIPO_MOVIMENTO'
      Required = True
    end
    object QContaReceberMovCOD_BCO_MOVIMENTO: TIntegerField
      FieldName = 'COD_BCO_MOVIMENTO'
    end
    object QContaReceberMovCOD_CAIXA_MOV: TIntegerField
      FieldName = 'COD_CAIXA_MOV'
    end
    object QContaReceberMovCOD_LANCTO_CONTABIL_CRED: TIntegerField
      FieldName = 'COD_LANCTO_CONTABIL_CRED'
    end
    object QContaReceberMovCOD_LANCTO_CONTABIL_DEB: TIntegerField
      FieldName = 'COD_LANCTO_CONTABIL_DEB'
    end
    object QContaReceberMovCOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
    end
    object QContaReceberMovIND_DEVOLUCAO: TStringField
      FieldName = 'IND_DEVOLUCAO'
      Size = 3
    end
    object QContaReceberMovIND_FORMA_PAGAMENTO: TStringField
      FieldName = 'IND_FORMA_PAGAMENTO'
      Size = 8
    end
    object QContaReceberMovIND_TROCA: TStringField
      FieldName = 'IND_TROCA'
      Size = 3
    end
  end
  object IBQContaReceberMov: TIBQuery
    Database = DMConexao.IBInterbase
    Transaction = DMConexao.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from CONTARECEBERPARCIAL')
    Left = 488
    Top = 424
    object IBQContaReceberMovCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CONTARECEBERPARCIAL.CODIGO'
      Required = True
    end
    object IBQContaReceberMovNUMERODUPLICATA: TIntegerField
      FieldName = 'NUMERODUPLICATA'
      Origin = 'CONTARECEBERPARCIAL.NUMERODUPLICATA'
      Required = True
    end
    object IBQContaReceberMovNUMEROPARCELA: TIntegerField
      FieldName = 'NUMEROPARCELA'
      Origin = 'CONTARECEBERPARCIAL.NUMEROPARCELA'
      Required = True
    end
    object IBQContaReceberMovDATAPAGAMENTO: TDateField
      FieldName = 'DATAPAGAMENTO'
      Origin = 'CONTARECEBERPARCIAL.DATAPAGAMENTO'
      Required = True
    end
    object IBQContaReceberMovVALORDESCONTO: TFloatField
      FieldName = 'VALORDESCONTO'
      Origin = 'CONTARECEBERPARCIAL.VALORDESCONTO'
      Required = True
    end
    object IBQContaReceberMovVALORJUROS: TFloatField
      FieldName = 'VALORJUROS'
      Origin = 'CONTARECEBERPARCIAL.VALORJUROS'
      Required = True
    end
    object IBQContaReceberMovVALORPAGO: TFloatField
      FieldName = 'VALORPAGO'
      Origin = 'CONTARECEBERPARCIAL.VALORPAGO'
      Required = True
    end
    object IBQContaReceberMovSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'CONTARECEBERPARCIAL.STATUS'
      Required = True
      FixedChar = True
      Size = 1
    end
    object IBQContaReceberMovNUMERORECIBO: TIntegerField
      FieldName = 'NUMERORECIBO'
      Origin = 'CONTARECEBERPARCIAL.NUMERORECIBO'
    end
    object IBQContaReceberMovCODIGOLANCAMENTO: TIntegerField
      FieldName = 'CODIGOLANCAMENTO'
      Origin = 'CONTARECEBERPARCIAL.CODIGOLANCAMENTO'
    end
    object IBQContaReceberMovCODIGOLANCAMENTOBANCO: TIntegerField
      FieldName = 'CODIGOLANCAMENTOBANCO'
      Origin = 'CONTARECEBERPARCIAL.CODIGOLANCAMENTOBANCO'
      Required = True
    end
    object IBQContaReceberMovVALORDUPLICATA_ANT_PGTO: TFloatField
      FieldName = 'VALORDUPLICATA_ANT_PGTO'
      Origin = 'CONTARECEBERPARCIAL.VALORDUPLICATA_ANT_PGTO'
      Required = True
    end
    object IBQContaReceberMovVALORJURO_ANT_PGTO: TFloatField
      FieldName = 'VALORJURO_ANT_PGTO'
      Origin = 'CONTARECEBERPARCIAL.VALORJURO_ANT_PGTO'
      Required = True
    end
    object IBQContaReceberMovNAOCOBRARJURO: TSmallintField
      FieldName = 'NAOCOBRARJURO'
      Origin = 'CONTARECEBERPARCIAL.NAOCOBRARJURO'
      Required = True
    end
    object IBQContaReceberMovOBSERVACAOBAIXA: TIBStringField
      FieldName = 'OBSERVACAOBAIXA'
      Origin = 'CONTARECEBERPARCIAL.OBSERVACAOBAIXA'
      Size = 60
    end
    object IBQContaReceberMovPAGAMENTOINTEGRAL: TSmallintField
      FieldName = 'PAGAMENTOINTEGRAL'
      Origin = 'CONTARECEBERPARCIAL.PAGAMENTOINTEGRAL'
      Required = True
    end
    object IBQContaReceberMovCODIGOFUNCIONARIO: TIntegerField
      FieldName = 'CODIGOFUNCIONARIO'
      Origin = 'CONTARECEBERPARCIAL.CODIGOFUNCIONARIO'
      Required = True
    end
    object IBQContaReceberMovCODIGOCAIXAABERTURA: TIntegerField
      FieldName = 'CODIGOCAIXAABERTURA'
      Origin = 'CONTARECEBERPARCIAL.CODIGOCAIXAABERTURA'
      Required = True
    end
    object IBQContaReceberMovVALORIRRF: TFloatField
      FieldName = 'VALORIRRF'
      Origin = 'CONTARECEBERPARCIAL.VALORIRRF'
      Required = True
    end
    object IBQContaReceberMovCNPJ: TIBStringField
      FieldName = 'CNPJ'
      Origin = 'CONTARECEBERPARCIAL.CNPJ'
      Required = True
      Size = 18
    end
    object IBQContaReceberMovCNPJCONTARECEBER: TIBStringField
      FieldName = 'CNPJCONTARECEBER'
      Origin = 'CONTARECEBERPARCIAL.CNPJCONTARECEBER'
      Required = True
      Size = 18
    end
    object IBQContaReceberMovCNPJCAIXAABERTURA: TIBStringField
      FieldName = 'CNPJCAIXAABERTURA'
      Origin = 'CONTARECEBERPARCIAL.CNPJCAIXAABERTURA'
      Required = True
      Size = 18
    end
  end
  object DSContaReceberMov: TDataSource
    DataSet = IBQContaReceberMov
    Left = 488
    Top = 480
  end
end
