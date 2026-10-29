object DMMalaDireta: TDMMalaDireta
  OldCreateOrder = False
  Left = 357
  Top = 130
  Height = 522
  Width = 679
  object QMalaDireta: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_MALA_DIRETA_CAB.*'
      'FROM'
      '  TB_MALA_DIRETA_CAB'
      'WHERE'
      '  TB_MALA_DIRETA_CAB.COD_MALA_DIRETA_CAB = :PK')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_MALA_DIRETA_CAB'
    SequenceField.Sequence = 'SQMALA_DIRETA_CAB'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000500000013000000434F445F4D414C415F4449524554415F43414201
      00000000000B000000444553435F5354415455530100000000000B0000004454
      5F434144415354524F01000000000017000000434F445F4D454E534147454D5F
      454C4554524F4E4943410100000000000E000000444553435F44455343524943
      414F010000000000}
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    AfterOpen = QMalaDiretaAfterOpen
    BeforeInsert = QMalaDiretaBeforeInsert
    AfterPost = QMalaDiretaAfterPost
    AfterCancel = QMalaDiretaAfterCancel
    BeforeDelete = QMalaDiretaBeforeDelete
    AfterDelete = QMalaDiretaAfterDelete
    OnCalcFields = QMalaDiretaCalcFields
    Left = 64
    Top = 40
    object QMalaDiretaCOD_MALA_DIRETA_CAB: TIntegerField
      FieldName = 'COD_MALA_DIRETA_CAB'
      Required = True
    end
    object QMalaDiretaCOD_MENSAGEM_ELETRONICA: TIntegerField
      FieldName = 'COD_MENSAGEM_ELETRONICA'
      Required = True
    end
    object QMalaDiretaDESC_STATUS: TStringField
      FieldName = 'DESC_STATUS'
      Size = 10
    end
    object QMalaDiretaDT_CADASTRO: TDateTimeField
      FieldName = 'DT_CADASTRO'
    end
    object QMalaDiretaDESC_DESCRICAO: TStringField
      FieldName = 'DESC_DESCRICAO'
      Size = 60
    end
    object QMalaDiretadesc_situacao: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_situacao'
      Calculated = True
    end
  end
  object QMalaDiretaSMTP: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_MALA_DIRETA_SMTP.*'
      'FROM'
      '  TB_MALA_DIRETA_SMTP'
      'where cod_mala_direta_cab = :cod_mala_direta_cab')
    Variables.Data = {
      0300000001000000140000003A434F445F4D414C415F4449524554415F434142
      030000000000000000000000}
    SequenceField.Field = 'COD_MALA_DIRETA_SMTP'
    SequenceField.Sequence = 'SQMALA_DIRETA_SMTP'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000300000014000000434F445F4D414C415F4449524554415F534D5450
      01000000000013000000434F445F4D414C415F4449524554415F434142010000
      00000008000000434F445F534D5450010000000000}
    Master = QMalaDireta
    MasterFields = 'COD_MALA_DIRETA_CAB'
    DetailFields = 'COD_MALA_DIRETA_CAB'
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    OnCalcFields = QMalaDiretaSMTPCalcFields
    Left = 64
    Top = 280
    object QMalaDiretaSMTPCOD_MALA_DIRETA_SMTP: TIntegerField
      FieldName = 'COD_MALA_DIRETA_SMTP'
      Required = True
    end
    object QMalaDiretaSMTPCOD_MALA_DIRETA_CAB: TIntegerField
      FieldName = 'COD_MALA_DIRETA_CAB'
      Required = True
    end
    object QMalaDiretaSMTPCOD_SMTP: TIntegerField
      FieldName = 'COD_SMTP'
      Required = True
    end
    object QMalaDiretaSMTPdesc_email: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_email'
      Size = 100
      Calculated = True
    end
    object QMalaDiretaSMTPdesc_intervalo: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_intervalo'
      Size = 50
      Calculated = True
    end
  end
  object QMensagemEletronica: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_MENSAGEM_ELETRONICA.*'
      'FROM'
      '  TB_MENSAGEM_ELETRONICA'
      'WHERE'
      '  TB_MENSAGEM_ELETRONICA.COD_MENSAGEM_ELETRONICA = :PK')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_MENSAGEM_ELETRONICA'
    SequenceField.Sequence = 'SQMENSAGEM_ELETRONICA'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      04000000070000000E000000444553435F44455343524943414F010000000000
      0B000000444553435F544954554C4F0100000000000A000000444553435F434F
      52504F0000000000000E000000444553435F52454D4554454E54450100000000
      0017000000434F445F4D454E534147454D5F454C4554524F4E49434101000000
      00000D000000424B505F414C5445524143414F00000000000010000000424143
      4B55505F414C5445524143414F000000000000}
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    AfterInsert = QMensagemEletronicaAfterInsert
    AfterPost = QMensagemEletronicaAfterPost
    AfterCancel = QMensagemEletronicaAfterCancel
    AfterDelete = QMensagemEletronicaAfterDelete
    Left = 408
    Top = 40
    object QMensagemEletronicaCOD_MENSAGEM_ELETRONICA: TIntegerField
      FieldName = 'COD_MENSAGEM_ELETRONICA'
      Required = True
    end
    object QMensagemEletronicaDESC_DESCRICAO: TStringField
      FieldName = 'DESC_DESCRICAO'
      Required = True
      Size = 40
    end
    object QMensagemEletronicaDESC_TITULO: TStringField
      FieldName = 'DESC_TITULO'
      Required = True
      Size = 150
    end
    object QMensagemEletronicaDESC_CORPO: TMemoField
      FieldName = 'DESC_CORPO'
      BlobType = ftMemo
    end
    object QMensagemEletronicaDESC_REMETENTE: TStringField
      FieldName = 'DESC_REMETENTE'
      Size = 40
    end
    object QMensagemEletronicaBACKUP_ALTERACAO: TMemoField
      FieldName = 'BACKUP_ALTERACAO'
      BlobType = ftOraClob
    end
  end
  object QMalaDiretaDestino: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_MALA_DIRETA_DESTINO.*'
      'FROM'
      '  TB_MALA_DIRETA_DESTINO'
      'where cod_mala_direta_cab = :cod_mala_direta_cab')
    Variables.Data = {
      0300000001000000140000003A434F445F4D414C415F4449524554415F434142
      030000000000000000000000}
    SequenceField.Field = 'COD_MALA_DIRETA_DESTINO'
    SequenceField.Sequence = 'SQMALA_DIRETA_DESTINO'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000600000017000000434F445F4D414C415F4449524554415F44455354
      494E4F01000000000013000000434F445F4D414C415F4449524554415F434142
      01000000000012000000444553435F454D41494C5F44455354494E4F01000000
      000011000000444553435F4E4F4D455F44455354494E4F010000000000090000
      00494E445F454E56494F0100000000000F000000444553435F4552524F5F454E
      56494F010000000000}
    Master = QMalaDireta
    MasterFields = 'COD_MALA_DIRETA_CAB'
    DetailFields = 'COD_MALA_DIRETA_CAB'
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    OnCalcFields = QMalaDiretaDestinoCalcFields
    Left = 64
    Top = 216
    object QMalaDiretaDestinoCOD_MALA_DIRETA_DESTINO: TIntegerField
      FieldName = 'COD_MALA_DIRETA_DESTINO'
      Required = True
    end
    object QMalaDiretaDestinoCOD_MALA_DIRETA_CAB: TIntegerField
      FieldName = 'COD_MALA_DIRETA_CAB'
      Required = True
    end
    object QMalaDiretaDestinoDESC_EMAIL_DESTINO: TStringField
      FieldName = 'DESC_EMAIL_DESTINO'
      Size = 100
    end
    object QMalaDiretaDestinoDESC_NOME_DESTINO: TStringField
      FieldName = 'DESC_NOME_DESTINO'
      Size = 100
    end
    object QMalaDiretaDestinoIND_ENVIO: TStringField
      FieldName = 'IND_ENVIO'
      Size = 1
    end
    object QMalaDiretaDestinostatus_envio: TStringField
      FieldKind = fkCalculated
      FieldName = 'status_envio'
      Size = 50
      Calculated = True
    end
    object QMalaDiretaDestinoDESC_ERRO_ENVIO: TStringField
      FieldName = 'DESC_ERRO_ENVIO'
      Size = 100
    end
  end
  object QSMTP: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_SMTP.*'
      'FROM'
      '  TB_SMTP'
      'WHERE'
      '  TB_SMTP.COD_SMTP = :PK')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_SMTP'
    SequenceField.Sequence = 'SQSMTP'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000C00000008000000434F445F534D54500100000000000A0000004445
      53435F454D41494C01000000000009000000444553435F534D54500100000000
      0009000000444553435F504F52540100000000000A000000444553435F53454E
      48410100000000000800000051545F454D41494C010000000000080000005154
      5F484F5241530100000000000F00000044545F494E4943494F5F454E56494F01
      000000000010000000494E445F415554454E5449434143414F01000000000016
      000000444553435F5449504F5F43524950544F4752414649410100000000000F
      00000051545F454E56494F535F415455414C0100000000000D00000051545F45
      4E56494F535F56455A010000000000}
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    AfterInsert = QSMTPAfterInsert
    BeforePost = QSMTPBeforePost
    AfterPost = QSMTPAfterPost
    AfterCancel = QSMTPAfterCancel
    AfterDelete = QSMTPAfterDelete
    Left = 240
    Top = 40
    object QSMTPCOD_SMTP: TIntegerField
      FieldName = 'COD_SMTP'
      Required = True
    end
    object QSMTPDESC_EMAIL: TStringField
      FieldName = 'DESC_EMAIL'
      Required = True
      Size = 100
    end
    object QSMTPDESC_SMTP: TStringField
      FieldName = 'DESC_SMTP'
      Required = True
      Size = 100
    end
    object QSMTPDESC_PORT: TIntegerField
      FieldName = 'DESC_PORT'
      Required = True
    end
    object QSMTPDESC_SENHA: TStringField
      FieldName = 'DESC_SENHA'
      Required = True
      Size = 100
    end
    object QSMTPQT_EMAIL: TIntegerField
      FieldName = 'QT_EMAIL'
    end
    object QSMTPQT_HORAS: TIntegerField
      FieldName = 'QT_HORAS'
    end
    object QSMTPDT_INICIO_ENVIO: TDateTimeField
      FieldName = 'DT_INICIO_ENVIO'
    end
    object QSMTPIND_AUTENTICACAO: TStringField
      FieldName = 'IND_AUTENTICACAO'
      Size = 1
    end
    object QSMTPDESC_TIPO_CRIPTOGRAFIA: TStringField
      FieldName = 'DESC_TIPO_CRIPTOGRAFIA'
    end
    object QSMTPQT_ENVIOS_ATUAL: TIntegerField
      FieldName = 'QT_ENVIOS_ATUAL'
    end
    object QSMTPQT_ENVIOS_VEZ: TIntegerField
      FieldName = 'QT_ENVIOS_VEZ'
    end
  end
  object QMalaDiretaCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  COD_MALA_DIRETA_CAB,'
      '  COD_MENSAGEM_ELETRONICA,'
      '  DESC_DESCRICAO,'
      '  DESC_STATUS,'
      '  DT_CADASTRO'
      'FROM'
      '  TB_MALA_DIRETA_CAB'
      'WHERE'
      '  TB_MALA_DIRETA_CAB.DESC_DESCRICAO LIKE :DESC_DESCRICAO')
    Variables.Data = {
      03000000010000000F0000003A444553435F44455343524943414F0500000000
      00000000000000}
    SequenceField.Field = 'COD_MALA_DIRETA_CAB'
    SequenceField.Sequence = 'SQMALA_DIRETA_CAB'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000500000013000000434F445F4D414C415F4449524554415F43414201
      00000000000B00000044545F434144415354524F01000000000017000000434F
      445F4D454E534147454D5F454C4554524F4E4943410100000000000E00000044
      4553435F44455343524943414F0100000000000B000000444553435F53544154
      5553010000000000}
    Session = DMOracle.DBCemapa
    OnCalcFields = QMalaDiretaConsCalcFields
    Left = 64
    Top = 112
    object QMalaDiretaConsCOD_MALA_DIRETA_CAB: TIntegerField
      FieldName = 'COD_MALA_DIRETA_CAB'
      Required = True
    end
    object QMalaDiretaConsCOD_MENSAGEM_ELETRONICA: TIntegerField
      FieldName = 'COD_MENSAGEM_ELETRONICA'
      Required = True
    end
    object QMalaDiretaConsDESC_DESCRICAO: TStringField
      FieldName = 'DESC_DESCRICAO'
      Size = 60
    end
    object QMalaDiretaConsDT_CADASTRO: TDateTimeField
      FieldName = 'DT_CADASTRO'
    end
    object QMalaDiretaConsDESC_STATUS: TStringField
      FieldName = 'DESC_STATUS'
      Size = 10
    end
    object QMalaDiretaConsdesc_situacao: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_situacao'
      Calculated = True
    end
  end
  object QMensagemEletronicaCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  COD_MENSAGEM_ELETRONICA,'
      '  DESC_DESCRICAO,'
      '  DESC_TITULO,'
      '  DESC_REMETENTE'
      'FROM'
      '  TB_MENSAGEM_ELETRONICA'
      'WHERE'
      '  TB_MENSAGEM_ELETRONICA.DESC_DESCRICAO LIKE :DESC_DESCRICAO')
    Variables.Data = {
      03000000010000000F0000003A444553435F44455343524943414F0500000000
      00000000000000}
    SequenceField.Field = 'COD_MENSAGEM_ELETRONICA'
    SequenceField.Sequence = 'SQMENSAGEM_ELETRONICA'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      04000000040000000E000000444553435F44455343524943414F010000000000
      0B000000444553435F544954554C4F0100000000000E000000444553435F5245
      4D4554454E544501000000000017000000434F445F4D454E534147454D5F454C
      4554524F4E494341010000000000}
    Session = DMOracle.DBCemapa
    Left = 408
    Top = 104
    object QMensagemEletronicaConsCOD_MENSAGEM_ELETRONICA: TIntegerField
      FieldName = 'COD_MENSAGEM_ELETRONICA'
      Required = True
    end
    object QMensagemEletronicaConsDESC_DESCRICAO: TStringField
      FieldName = 'DESC_DESCRICAO'
      Required = True
      Size = 40
    end
    object QMensagemEletronicaConsDESC_TITULO: TStringField
      FieldName = 'DESC_TITULO'
      Required = True
      Size = 150
    end
    object QMensagemEletronicaConsDESC_REMETENTE: TStringField
      FieldName = 'DESC_REMETENTE'
      Size = 40
    end
  end
  object QSMTPCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  COD_SMTP,'
      '  DESC_SMTP,'
      '  DESC_EMAIL,'
      '  QT_EMAIL,'
      '  QT_HORAS,'
      '  QT_ENVIOS_VEZ'
      'FROM'
      '  TB_SMTP'
      'WHERE'
      '  TB_SMTP.DESC_EMAIL LIKE :DESC_EMAIL')
    Variables.Data = {
      03000000010000000B0000003A444553435F454D41494C050000000000000000
      000000}
    SequenceField.Field = 'COD_SMTP'
    SequenceField.Sequence = 'SQSMTP'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000600000008000000434F445F534D54500100000000000A0000004445
      53435F454D41494C01000000000009000000444553435F534D54500100000000
      000800000051545F454D41494C0100000000000800000051545F484F52415301
      00000000000D00000051545F454E56494F535F56455A010000000000}
    Session = DMOracle.DBCemapa
    Left = 240
    Top = 104
    object QSMTPConsCOD_SMTP: TIntegerField
      FieldName = 'COD_SMTP'
      Required = True
    end
    object QSMTPConsDESC_SMTP: TStringField
      FieldName = 'DESC_SMTP'
      Required = True
      Size = 100
    end
    object QSMTPConsDESC_EMAIL: TStringField
      FieldName = 'DESC_EMAIL'
      Required = True
      Size = 100
    end
    object QSMTPConsQT_EMAIL: TIntegerField
      FieldName = 'QT_EMAIL'
    end
    object QSMTPConsQT_HORAS: TIntegerField
      FieldName = 'QT_HORAS'
    end
    object QSMTPConsQT_ENVIOS_VEZ: TIntegerField
      FieldName = 'QT_ENVIOS_VEZ'
    end
  end
  object CDSDestinos: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'EMAIL_DESTINO'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'NOME_DESTINO'
        DataType = ftString
        Size = 150
      end>
    IndexDefs = <
      item
        Name = 'CDSDestinosIndex1'
        Fields = 'EMAIL_DESTINO'
        Options = [ixUnique]
      end>
    IndexName = 'CDSDestinosIndex1'
    Params = <>
    StoreDefs = True
    Left = 240
    Top = 216
    Data = {
      5D0000009619E0BD0100000018000000020000000000030000005D000D454D41
      494C5F44455354494E4F01004900000001000557494454480200020096000C4E
      4F4D455F44455354494E4F010049000000010005574944544802000200960000
      00}
    object CDSDestinosEMAIL_DESTINO: TStringField
      FieldName = 'EMAIL_DESTINO'
      Size = 150
    end
    object CDSDestinosNOME_DESTINO: TStringField
      FieldName = 'NOME_DESTINO'
      Size = 150
    end
  end
  object CDSSMTP: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 240
    Top = 296
    Data = {
      A50000009619E0BD010000001800000006000000000003000000A50005454D41
      494C0100490000000100055749445448020002009600085345525649444F5201
      0049000000010005574944544802000200960009494E54455256414C4F010049
      000000010005574944544802000200320006434F4449474F0400010000000000
      0B454D41494C535F484F524104000100000000000A454D41494C535F56455A04
      000100000000000000}
    object CDSSMTPEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 150
    end
    object CDSSMTPSERVIDOR: TStringField
      FieldName = 'SERVIDOR'
      Size = 150
    end
    object CDSSMTPINTERVALO: TStringField
      FieldName = 'INTERVALO'
      Size = 50
    end
    object CDSSMTPCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object CDSSMTPEMAILS_HORA: TIntegerField
      FieldName = 'EMAILS_HORA'
    end
  end
end
