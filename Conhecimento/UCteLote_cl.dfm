object DMCteLote: TDMCteLote
  OldCreateOrder = False
  Left = 924
  Top = 298
  Height = 319
  Width = 245
  object QCteLote: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  L.ROWID,'
      '  L.*'
      'FROM'
      '  TB_CTE_LOTE L'
      'WHERE'
      '  L.ID_LOTE = :PK')
    Variables.Data = {0300000001000000030000003A504B050000000000000000000000}
    SequenceField.Field = 'ID_LOTE'
    SequenceField.Sequence = 'SQLOTE_NFE'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      04000000060000000700000049445F4C4F54450100000000000C000000494E44
      5F534954554143414F0100000000000A00000044545F4352494143414F010000
      0000000800000044545F454E56494F0100000000000A000000434F445F46494C
      49414C0100000000000A0000004E554D5F52454349424F010000000000}
    RefreshOptions = [roBeforeEdit, roAllFields]
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    AfterInsert = QCteLoteAfterInsert
    Left = 40
    Top = 8
    object QCteLoteID_LOTE: TFloatField
      FieldName = 'ID_LOTE'
      Required = True
    end
    object QCteLoteIND_SITUACAO: TIntegerField
      FieldName = 'IND_SITUACAO'
    end
    object QCteLoteDT_CRIACAO: TDateTimeField
      FieldName = 'DT_CRIACAO'
    end
    object QCteLoteDT_ENVIO: TDateTimeField
      FieldName = 'DT_ENVIO'
    end
    object QCteLoteCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QCteLoteNUM_RECIBO: TFloatField
      FieldName = 'NUM_RECIBO'
    end
  end
  object QCteLoteCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  L.ID_LOTE,'
      '  L.IND_SITUACAO,'
      '  L.DT_CRIACAO,'
      '  L.DT_ENVIO,'
      '  L.COD_FILIAL,'
      '  F.DESC_REPOSITORIO_NFE,'
      '  F.DESC_FILIAL,'
      '  F.NUM_CGC CGC_FILIAL,'
      '  TO_NUMBER('#39'0'#39' || F.IND_CONTINGENCIA_CTE) AS IND_CONTINGENCIA,'
      '  E.COD_UF_IBGE,'
      '  0 AS CONT_SELECIONADO,'
      '  U.COD_USUARIO,'
      '  U.DESC_IMPRESSORA_DACTE'
      'FROM'
      '  TB_CTE_LOTE L'
      'LEFT JOIN'
      
        '  (SELECT COD_FILIAL, COD_ESTADO, DESC_REPOSITORIO_NFE,DESC_FILI' +
        'AL,NUM_CGC,IND_CONTINGENCIA_CTE FROM TB_FILIAL) F'
      'ON'
      '  L.COD_FILIAL = F.COD_FILIAL'
      'LEFT JOIN'
      '  TB_ESTADO E'
      'ON'
      '  F.COD_ESTADO = E.COD_ESTADO'
      'LEFT JOIN'
      '  TB_CTE CTE'
      'ON'
      '  CTE.ID_LOTE = L.ID_LOTE'
      'LEFT JOIN'
      '  TB_CONHECIMENTO CT'
      'ON'
      '  CTE.COD_CONHECIMENTO = CT.COD_CONHECIMENTO'
      'LEFT JOIN'
      '  TB_USUARIO U'
      'ON'
      '  (:USUARIO = U.COD_USUARIO)'
      'WHERE'
      '  (:ID_LOTE IS NULL OR L.ID_LOTE = :ID_LOTE)'
      'AND'
      '  (:FILIAL IS NULL OR L.COD_FILIAL = :FILIAL)'
      'AND'
      '  (:DT_CRIACAO_I IS NULL OR L.DT_CRIACAO >= :DT_CRIACAO_I)'
      'AND'
      '  (:DT_CRIACAO_F IS NULL OR L.DT_CRIACAO <= :DT_CRIACAO_F)'
      'AND'
      '  (:DT_ENVIO_I IS NULL OR L.DT_ENVIO >= :DT_ENVIO_I)'
      'AND'
      '  (:DT_ENVIO_F IS NULL OR L.DT_ENVIO <= :DT_ENVIO_F)'
      'AND'
      
        '  (:COD_CONHECIMENTO IS NULL OR CT.COD_CONHECIMENTO = :COD_CONHE' +
        'CIMENTO)'
      'AND'
      '  (:SITUACAO IS NULL OR L.IND_SITUACAO = :SITUACAO)'
      'ORDER BY'
      '  L.DT_CRIACAO,'
      '  L.DT_ENVIO'
      '')
    Variables.Data = {
      0300000009000000080000003A49445F4C4F5445030000000000000000000000
      0D0000003A44545F4352494143414F5F490C00000000000000000000000D0000
      003A44545F4352494143414F5F460C00000000000000000000000B0000003A44
      545F454E56494F5F490C00000000000000000000000B0000003A44545F454E56
      494F5F460C0000000000000000000000110000003A434F445F434F4E48454349
      4D454E544F0300000004000000EA93000000000000090000003A534954554143
      414F030000000000000000000000080000003A5553554152494F030000000000
      000000000000070000003A46494C49414C030000000400000002000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      040000000D0000000700000049445F4C4F54450100000000000C000000494E44
      5F534954554143414F0100000000000A00000044545F4352494143414F010000
      0000000800000044545F454E56494F0100000000000A000000434F445F46494C
      49414C01000000000014000000444553435F5245504F5349544F52494F5F4E46
      450100000000000B000000434F445F55465F494247450100000000000B000000
      444553435F46494C49414C0100000000000A0000004347435F46494C49414C01
      000000000010000000434F4E545F53454C4543494F4E41444F01000000000010
      000000494E445F434F4E54494E47454E4349410100000000000B000000434F44
      5F5553554152494F01000000000015000000444553435F494D50524553534F52
      415F4441435445010000000000}
    ReadOnly = True
    RefreshOptions = [roBeforeEdit, roAllFields]
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    BeforeOpen = QCteLoteConsBeforeOpen
    AfterOpen = QCteLoteConsAfterOpen
    BeforeClose = QCteLoteConsBeforeClose
    OnCalcFields = QCteLoteConsCalcFields
    Left = 40
    Top = 56
    object QCteLoteConsdesc_situacao: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_situacao'
      Calculated = True
    end
    object QCteLoteConsID_LOTE: TFloatField
      FieldName = 'ID_LOTE'
      Required = True
    end
    object QCteLoteConsIND_SITUACAO: TIntegerField
      FieldName = 'IND_SITUACAO'
    end
    object QCteLoteConsDT_CRIACAO: TDateTimeField
      FieldName = 'DT_CRIACAO'
    end
    object QCteLoteConsDT_ENVIO: TDateTimeField
      FieldName = 'DT_ENVIO'
    end
    object QCteLoteConsCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QCteLoteConsDESC_REPOSITORIO_NFE: TStringField
      FieldName = 'DESC_REPOSITORIO_NFE'
      Size = 60
    end
    object QCteLoteConsDESC_FILIAL: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
    object QCteLoteConsCGC_FILIAL: TStringField
      FieldName = 'CGC_FILIAL'
      Size = 18
    end
    object QCteLoteConsIND_CONTINGENCIA: TFloatField
      FieldName = 'IND_CONTINGENCIA'
    end
    object QCteLoteConsCOD_UF_IBGE: TIntegerField
      FieldName = 'COD_UF_IBGE'
    end
    object QCteLoteConsCONT_SELECIONADO: TFloatField
      FieldName = 'CONT_SELECIONADO'
    end
    object QCteLoteConsCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
    object QCteLoteConsDESC_IMPRESSORA_DACTE: TStringField
      FieldName = 'DESC_IMPRESSORA_DACTE'
      Size = 100
    end
  end
  object QCteLoteItemCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  CTE.ID_LOTE,'
      '  CTE.DESC_CHAVE_ACESSO,'
      '  CTE.DESC_MSG_CANCELAMENTO,'
      '  CTE.DESC_MSG_VALIDACAO,'
      '  CTE.DESC_MSG_VALIDACAO_LOTE,'
      '  CTE.DESC_PROT_AUTORIZACAO,'
      '  CTE.DESC_PROT_CANCELAMENTO,'
      '  CTE.DESC_RETORNO_CANCELAMENTO,'
      '  CTE.DESC_RETORNO_PROCESSAMENTO,'
      '  CTE.DESC_XML_CTE,'
      '  CTE.DESC_XML_RETORNO,'
      '  CTE.DESC_XML_RETORNO_CANCELAMENTO,'
      
        '  DECODE(CTE.DESC_RETORNO_CANCELAMENTO, '#39'101'#39', CTE.DESC_RETORNO_' +
        'CANCELAMENTO,'
      '      CTE.DESC_RETORNO_PROCESSAMENTO) AS STATUS,'
      '  CT.DT_EMISSAO,'
      '  CT.COD_SERIE,'
      '  CT.COD_CONHECIMENTO,'
      '  CT.NUM_CONHECIMENTO,'
      '  CT.IND_CONTINGENCIA_CTE,'
      '  CT.IND_AMBIENTE_CTE,'
      
        '  CT.COD_CADASTRO_DESTINATARIO || '#39' - '#39' || DEST.NOME AS DESTINAT' +
        'ARIO,'
      '  DEST.NUM_CGC_CPF AS CPF_CNPJ_DEST,'
      '  DEST.NOME AS NOME_DEST,'
      '  CT.COD_CADASTRO_REMETENTE || '#39' - '#39' || REM.NOME AS REMETENTE,'
      '  REM.NUM_CGC_CPF AS CPF_CNPJ_REM,'
      '  REM.NOME AS NOME_REM,'
      '  CT.COD_CADASTRO_EXPEDIDOR || '#39' - '#39' || EXP.NOME AS EXPEDIDOR,'
      '  EXP.NUM_CGC_CPF AS CPF_CNPJ_EXP,'
      '  DEST.NOME AS NOME_EXP,'
      '  CT.COD_CADASTRO_RECEBEDOR || '#39' - '#39' || REC.NOME AS RECEBEDOR,'
      '  REC.NUM_CGC_CPF AS CPF_CNPJ_REC,'
      '  REC.NOME AS NOME_REC,'
      '  CASE'
      
        '  WHEN INSTR(UPPER(DECODE(PARAM.IND_CTE_EMAIL_DEST,1,DECODE(DEST' +
        '.DESC_E_MAIL,'#39#39','#39#39',DEST.DESC_E_MAIL || '#39'; '#39'),'#39#39') ||'
      
        '                           DECODE(PARAM.IND_CTE_EMAIL_REM,1,DECO' +
        'DE(REM.DESC_E_MAIL,'#39#39','#39#39',REM.DESC_E_MAIL || '#39'; '#39'),'#39#39') ||'
      
        '                           DECODE(PARAM.IND_CTE_EMAIL_EXP,1,DECO' +
        'DE(EXP.DESC_E_MAIL,'#39#39','#39#39',EXP.DESC_E_MAIL || '#39'; '#39'),'#39#39') ||'
      
        '                           DECODE(PARAM.IND_CTE_EMAIL_REC,1,DECO' +
        'DE(REC.DESC_E_MAIL,'#39#39','#39#39',REC.DESC_E_MAIL || '#39'; '#39'),'#39#39') ||'
      
        #9#9#9#9'DECODE(PARAM.IND_CTE_EMAIL_FILIAL,1,DECODE(F.DESC_E_MAIL,'#39#39',' +
        #39#39',F.DESC_E_MAIL || '#39'; '#39'),'#39#39')),'
      #9#9#9#9'UPPER(TRIM(TOM.DESC_E_MAIL))) > 0 THEN'
      
        '    (DECODE(PARAM.IND_CTE_EMAIL_DEST,1,DECODE(DEST.DESC_E_MAIL,'#39 +
        #39','#39#39',DEST.DESC_E_MAIL || '#39'; '#39'),'#39#39') ||'
      
        '     DECODE(PARAM.IND_CTE_EMAIL_REM,1,DECODE(REM.DESC_E_MAIL,'#39#39',' +
        #39#39',REM.DESC_E_MAIL || '#39'; '#39'),'#39#39') ||'
      
        '     DECODE(PARAM.IND_CTE_EMAIL_EXP,1,DECODE(EXP.DESC_E_MAIL,'#39#39',' +
        #39#39',EXP.DESC_E_MAIL || '#39'; '#39'),'#39#39') ||'
      
        '     DECODE(PARAM.IND_CTE_EMAIL_REC,1,DECODE(REC.DESC_E_MAIL,'#39#39',' +
        #39#39',REC.DESC_E_MAIL || '#39'; '#39'),'#39#39') ||'
      
        '     DECODE(PARAM.IND_CTE_EMAIL_FILIAL,1,DECODE(F.DESC_E_MAIL,'#39#39 +
        ','#39#39',F.DESC_E_MAIL || '#39'; '#39'),'#39#39')   ||'
      '     DECODE(SEG.DESC_E_MAIL,'#39#39','#39#39',SEG.DESC_E_MAIL || '#39'; '#39'))'
      '  ELSE'
      
        '    (DECODE(PARAM.IND_CTE_EMAIL_DEST,1,DECODE(DEST.DESC_E_MAIL,'#39 +
        #39','#39#39',DEST.DESC_E_MAIL || '#39'; '#39'),'#39#39') ||'
      
        '     DECODE(PARAM.IND_CTE_EMAIL_REM,1,DECODE(REM.DESC_E_MAIL,'#39#39',' +
        #39#39',REM.DESC_E_MAIL || '#39'; '#39'),'#39#39') ||'
      
        '     DECODE(PARAM.IND_CTE_EMAIL_EXP,1,DECODE(EXP.DESC_E_MAIL,'#39#39',' +
        #39#39',EXP.DESC_E_MAIL || '#39'; '#39'),'#39#39') ||'
      
        '     DECODE(PARAM.IND_CTE_EMAIL_REC,1,DECODE(REC.DESC_E_MAIL,'#39#39',' +
        #39#39',REC.DESC_E_MAIL || '#39'; '#39'),'#39#39') ||'
      '     DECODE(TOM.DESC_E_MAIL,'#39#39','#39#39',TOM.DESC_E_MAIL || '#39'; '#39') ||'
      '     DECODE(SEG.DESC_E_MAIL,'#39#39','#39#39',SEG.DESC_E_MAIL || '#39'; '#39'))'
      '  END AS DESC_EMAIL,'
      '  PARAM.IND_CTE_EMAIL_DEST,'
      '  PARAM.IND_CTE_EMAIL_REM,'
      '  PARAM.IND_CTE_EMAIL_EXP,'
      '  PARAM.IND_CTE_EMAIL_REC,'
      '  PARAM.IND_CTE_EMAIL_FILIAL,'
      '  DEST.DESC_E_MAIL EMAIL_DEST,'
      '  TOM.DESC_E_MAIL EMAIL_TOM,'
      '  REM.DESC_E_MAIL EMAIL_REM,'
      '  EXP.DESC_E_MAIL EMAIL_EXP,'
      '  REC.DESC_E_MAIL EMAIL_REC,'
      '  F.DESC_E_MAIL EMAIL_FILIAL,'
      '  '#39'N'#39' AS EMAIL_XML,'
      '  '#39'N'#39' AS EMAIL_PDF,'
      '  '#39'N'#39' AS IND_SELECIONADO,'
      '  RPAD('#39' '#39', 255, '#39' '#39') AS DESC_JUST_CANCELA,'
      '  F.NUM_VIAS_DACTE,'
      '  U.DESC_IMPRESSORA_DACTE'
      'FROM'
      '  TB_CTE CTE'
      'LEFT JOIN'
      
        '  (SELECT DT_EMISSAO,COD_SERIE,COD_CONHECIMENTO,NUM_CONHECIMENTO' +
        ',IND_CONTINGENCIA_CTE,IND_AMBIENTE_CTE,'
      
        '    COD_CADASTRO_DESTINATARIO, COD_CADASTRO_REMETENTE,COD_CADAST' +
        'RO_EXPEDIDOR,COD_CADASTRO_RECEBEDOR, COD_CADASTRO_TOMADOR, COD_S' +
        'EGURADORA'
      '    FROM TB_CONHECIMENTO) CT'
      'ON'
      '  CTE.COD_CONHECIMENTO = CT.COD_CONHECIMENTO'
      'LEFT JOIN'
      
        '  (SELECT COD_CADASTRO, DESC_E_MAIL, NUM_CGC_CPF,NOME FROM TB_CA' +
        'DASTRO) DEST'
      'ON'
      '  CT.COD_CADASTRO_DESTINATARIO = DEST.COD_CADASTRO'
      'LEFT JOIN'
      
        '  (SELECT COD_CADASTRO, DESC_E_MAIL, NUM_CGC_CPF, NOME FROM TB_C' +
        'ADASTRO) REM'
      'ON'
      '  CT.COD_CADASTRO_REMETENTE = REM.COD_CADASTRO'
      'LEFT JOIN'
      
        '  (SELECT COD_CADASTRO, DESC_E_MAIL, NUM_CGC_CPF, NOME FROM TB_C' +
        'ADASTRO) EXP'
      'ON'
      '  CT.COD_CADASTRO_EXPEDIDOR = EXP.COD_CADASTRO'
      'LEFT JOIN'
      
        '  (SELECT COD_CADASTRO, DESC_E_MAIL, NUM_CGC_CPF, NOME FROM TB_C' +
        'ADASTRO) REC'
      'ON'
      '  CT.COD_CADASTRO_RECEBEDOR = REC.COD_CADASTRO'
      'LEFT JOIN'
      
        '  (SELECT COD_CADASTRO, DESC_E_MAIL, NUM_CGC_CPF, NOME FROM TB_C' +
        'ADASTRO) TOM'
      'ON'
      '  CT.COD_CADASTRO_TOMADOR = TOM.COD_CADASTRO'
      'LEFT JOIN'
      '  (SELECT COD_CADASTRO, DESC_E_MAIL FROM TB_CADASTRO) SEG'
      'ON'
      '  CT.COD_SEGURADORA = SEG.COD_CADASTRO'
      'LEFT JOIN'
      '  (SELECT ID_LOTE, COD_FILIAL FROM TB_CTE_LOTE) CTEL'
      'ON'
      '  CTE.ID_LOTE = CTEL.ID_LOTE'
      'LEFT JOIN'
      '  TB_FILIAL F'
      'ON'
      '  CTEL.COD_FILIAL = F.COD_FILIAL'
      'LEFT JOIN'
      '  TB_USUARIO U'
      'ON'
      '  (:COD_USUARIO = U.COD_USUARIO)'
      'LEFT JOIN '
      '  (SELECT IND_CTE_EMAIL_DEST,'
      '  IND_CTE_EMAIL_REM,'
      '  IND_CTE_EMAIL_EXP,'
      '  IND_CTE_EMAIL_REC,'
      '  IND_CTE_EMAIL_FILIAL FROM TB_PARAM_SISTEMA) PARAM'
      'ON 1 = 1'
      'WHERE'
      '  CTE.ID_LOTE = :ID_LOTE')
    Variables.Data = {
      0300000002000000080000003A49445F4C4F5445030000000000000000000000
      0C0000003A434F445F5553554152494F030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000310000000700000049445F4C4F544501000000000011000000444553
      435F43484156455F41434553534F0100000000000A00000044545F454D495353
      414F010000000000060000005354415455530100000000000F000000494E445F
      53454C4543494F4E41444F01000000000009000000434F445F53455249450100
      0000000009000000454D41494C5F584D4C01000000000009000000454D41494C
      5F50444601000000000012000000444553435F4D53475F56414C49444143414F
      00000000000017000000444553435F4D53475F56414C49444143414F5F4C4F54
      4500000000000015000000444553435F4D53475F43414E43454C414D454E544F
      01000000000019000000444553435F5245544F524E4F5F43414E43454C414D45
      4E544F0100000000001A000000444553435F5245544F524E4F5F50524F434553
      53414D454E544F01000000000015000000444553435F50524F545F4155544F52
      495A4143414F01000000000016000000444553435F50524F545F43414E43454C
      414D454E544F01000000000011000000444553435F4A5553545F43414E43454C
      4101000000000010000000444553435F584D4C5F5245544F524E4F0000000000
      000C000000444553435F584D4C5F43544500000000000014000000494E445F43
      4F4E54494E47454E4349415F43544501000000000010000000494E445F414D42
      49454E54455F4354450100000000000C00000044455354494E41544152494F01
      00000000000E0000004E554D5F564941535F4441435445010000000000100000
      00434F445F434F4E484543494D454E544F010000000000100000004E554D5F43
      4F4E484543494D454E544F010000000000090000004E4F4D455F444553540100
      0000000015000000444553435F494D50524553534F52415F4441435445010000
      0000000D0000004350465F434E504A5F44455354010000000000090000005245
      4D4554454E54450100000000000C0000004350465F434E504A5F52454D010000
      000000080000004E4F4D455F52454D0100000000000A000000444553435F454D
      41494C0100000000000A000000454D41494C5F44455354010000000000090000
      00454D41494C5F544F4D01000000000009000000454D41494C5F52454D010000
      00000009000000454D41494C5F45585001000000000009000000454D41494C5F
      52454301000000000012000000494E445F4354455F454D41494C5F4445535401
      000000000011000000494E445F4354455F454D41494C5F52454D010000000000
      11000000494E445F4354455F454D41494C5F4558500100000000001100000049
      4E445F4354455F454D41494C5F52454301000000000009000000455850454449
      444F520100000000000C0000004350465F434E504A5F45585001000000000008
      0000004E4F4D455F45585001000000000009000000524543454245444F520100
      000000000C0000004350465F434E504A5F524543010000000000080000004E4F
      4D455F52454301000000000014000000494E445F4354455F454D41494C5F4649
      4C49414C0100000000000C000000454D41494C5F46494C49414C010000000000
      1D000000444553435F584D4C5F5245544F524E4F5F43414E43454C414D454E54
      4F000000000000}
    Master = QCteLoteCons
    MasterFields = 'ID_LOTE'
    DetailFields = 'ID_LOTE'
    ReadOnly = True
    RefreshOptions = [roBeforeEdit, roAllFields]
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    BeforeOpen = QCteLoteItemConsBeforeOpen
    Left = 144
    Top = 56
    object QCteLoteItemConsID_LOTE: TFloatField
      FieldName = 'ID_LOTE'
    end
    object QCteLoteItemConsDESC_CHAVE_ACESSO: TStringField
      FieldName = 'DESC_CHAVE_ACESSO'
      Required = True
      Size = 44
    end
    object QCteLoteItemConsDESC_MSG_CANCELAMENTO: TStringField
      FieldName = 'DESC_MSG_CANCELAMENTO'
      Size = 200
    end
    object QCteLoteItemConsDESC_MSG_VALIDACAO: TMemoField
      FieldName = 'DESC_MSG_VALIDACAO'
      BlobType = ftOraClob
    end
    object QCteLoteItemConsDESC_MSG_VALIDACAO_LOTE: TMemoField
      FieldName = 'DESC_MSG_VALIDACAO_LOTE'
      BlobType = ftOraClob
    end
    object QCteLoteItemConsDESC_PROT_AUTORIZACAO: TStringField
      FieldName = 'DESC_PROT_AUTORIZACAO'
      Size = 15
    end
    object QCteLoteItemConsDESC_PROT_CANCELAMENTO: TStringField
      FieldName = 'DESC_PROT_CANCELAMENTO'
      Size = 15
    end
    object QCteLoteItemConsDESC_RETORNO_CANCELAMENTO: TStringField
      FieldName = 'DESC_RETORNO_CANCELAMENTO'
      Size = 4
    end
    object QCteLoteItemConsDESC_RETORNO_PROCESSAMENTO: TStringField
      FieldName = 'DESC_RETORNO_PROCESSAMENTO'
      Size = 4
    end
    object QCteLoteItemConsDESC_XML_CTE: TMemoField
      FieldName = 'DESC_XML_CTE'
      Required = True
      BlobType = ftOraClob
    end
    object QCteLoteItemConsDESC_XML_RETORNO: TMemoField
      FieldName = 'DESC_XML_RETORNO'
      BlobType = ftOraClob
    end
    object QCteLoteItemConsSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 4
    end
    object QCteLoteItemConsDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
    object QCteLoteItemConsCOD_SERIE: TStringField
      FieldName = 'COD_SERIE'
      Size = 3
    end
    object QCteLoteItemConsCOD_CONHECIMENTO: TIntegerField
      FieldName = 'COD_CONHECIMENTO'
    end
    object QCteLoteItemConsNUM_CONHECIMENTO: TIntegerField
      FieldName = 'NUM_CONHECIMENTO'
    end
    object QCteLoteItemConsIND_CONTINGENCIA_CTE: TStringField
      FieldName = 'IND_CONTINGENCIA_CTE'
      Size = 1
    end
    object QCteLoteItemConsIND_AMBIENTE_CTE: TIntegerField
      FieldName = 'IND_AMBIENTE_CTE'
    end
    object QCteLoteItemConsDESTINATARIO: TStringField
      FieldName = 'DESTINATARIO'
      Size = 103
    end
    object QCteLoteItemConsNOME_DEST: TStringField
      FieldName = 'NOME_DEST'
      Size = 60
    end
    object QCteLoteItemConsEMAIL_XML: TStringField
      FieldName = 'EMAIL_XML'
      Size = 1
    end
    object QCteLoteItemConsEMAIL_PDF: TStringField
      FieldName = 'EMAIL_PDF'
      Size = 1
    end
    object QCteLoteItemConsIND_SELECIONADO: TStringField
      FieldName = 'IND_SELECIONADO'
      Size = 1
    end
    object QCteLoteItemConsDESC_JUST_CANCELA: TStringField
      FieldName = 'DESC_JUST_CANCELA'
      Size = 255
    end
    object QCteLoteItemConsNUM_VIAS_DACTE: TIntegerField
      FieldName = 'NUM_VIAS_DACTE'
    end
    object QCteLoteItemConsDESC_IMPRESSORA_DACTE: TStringField
      FieldName = 'DESC_IMPRESSORA_DACTE'
      Size = 100
    end
    object QCteLoteItemConsCPF_CNPJ_DEST: TStringField
      FieldName = 'CPF_CNPJ_DEST'
      Size = 18
    end
    object QCteLoteItemConsREMETENTE: TStringField
      FieldName = 'REMETENTE'
      Size = 103
    end
    object QCteLoteItemConsCPF_CNPJ_REM: TStringField
      FieldName = 'CPF_CNPJ_REM'
      Size = 18
    end
    object QCteLoteItemConsNOME_REM: TStringField
      FieldName = 'NOME_REM'
      Size = 60
    end
    object QCteLoteItemConsEMAIL_DEST: TStringField
      FieldName = 'EMAIL_DEST'
      Size = 120
    end
    object QCteLoteItemConsEMAIL_TOM: TStringField
      FieldName = 'EMAIL_TOM'
      Size = 120
    end
    object QCteLoteItemConsEMAIL_REM: TStringField
      FieldName = 'EMAIL_REM'
      Size = 120
    end
    object QCteLoteItemConsEMAIL_EXP: TStringField
      FieldName = 'EMAIL_EXP'
      Size = 120
    end
    object QCteLoteItemConsEMAIL_REC: TStringField
      FieldName = 'EMAIL_REC'
      Size = 120
    end
    object QCteLoteItemConsDESC_EMAIL: TStringField
      FieldName = 'DESC_EMAIL'
      Size = 732
    end
    object QCteLoteItemConsIND_CTE_EMAIL_DEST: TIntegerField
      FieldName = 'IND_CTE_EMAIL_DEST'
    end
    object QCteLoteItemConsIND_CTE_EMAIL_REM: TIntegerField
      FieldName = 'IND_CTE_EMAIL_REM'
    end
    object QCteLoteItemConsIND_CTE_EMAIL_EXP: TIntegerField
      FieldName = 'IND_CTE_EMAIL_EXP'
    end
    object QCteLoteItemConsIND_CTE_EMAIL_REC: TIntegerField
      FieldName = 'IND_CTE_EMAIL_REC'
    end
    object QCteLoteItemConsEXPEDIDOR: TStringField
      FieldName = 'EXPEDIDOR'
      Size = 103
    end
    object QCteLoteItemConsCPF_CNPJ_EXP: TStringField
      FieldName = 'CPF_CNPJ_EXP'
      Size = 18
    end
    object QCteLoteItemConsNOME_EXP: TStringField
      FieldName = 'NOME_EXP'
      Size = 60
    end
    object QCteLoteItemConsRECEBEDOR: TStringField
      FieldName = 'RECEBEDOR'
      Size = 103
    end
    object QCteLoteItemConsCPF_CNPJ_REC: TStringField
      FieldName = 'CPF_CNPJ_REC'
      Size = 18
    end
    object QCteLoteItemConsNOME_REC: TStringField
      FieldName = 'NOME_REC'
      Size = 60
    end
    object QCteLoteItemConsIND_CTE_EMAIL_FILIAL: TIntegerField
      FieldName = 'IND_CTE_EMAIL_FILIAL'
    end
    object QCteLoteItemConsEMAIL_FILIAL: TStringField
      FieldName = 'EMAIL_FILIAL'
      Size = 40
    end
    object QCteLoteItemConsDESC_XML_RETORNO_CANCELAMENTO: TMemoField
      FieldName = 'DESC_XML_RETORNO_CANCELAMENTO'
      BlobType = ftOraClob
    end
  end
  object QCteLoteItem: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  CTE.ROWID,'
      '  CTE.ID_LOTE,'
      '  CTE.DESC_CHAVE_ACESSO,'
      '  CTE.COD_FILIAL,'
      '  CTE.DESC_SERIE,'
      '  CTE.NUM_CTE,'
      '  CTE.DESC_XML_CTE,'
      '  CTE.IND_AMBIENTE_CTE,'
      '  CTE.COD_CONHECIMENTO'
      'FROM'
      '  TB_CTE CTE'
      'WHERE'
      '  (:ID_LOTE IS NULL OR CTE.ID_LOTE = :ID_LOTE)'
      'AND'
      
        '  (:COD_CONHECIMENTO IS NULL OR CTE.COD_CONHECIMENTO = :COD_CONH' +
        'ECIMENTO)'
      '')
    Variables.Data = {
      0300000002000000080000003A49445F4C4F5445030000000000000000000000
      110000003A434F445F434F4E484543494D454E544F0300000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      04000000080000000700000049445F4C4F544501000000000011000000444553
      435F43484156455F41434553534F0100000000000A000000434F445F46494C49
      414C0100000000000A000000444553435F534552494501000000000007000000
      4E554D5F4354450100000000000C000000444553435F584D4C5F435445000000
      00000010000000494E445F414D4249454E54455F435445010000000000100000
      00434F445F434F4E484543494D454E544F010000000000}
    RefreshOptions = [roBeforeEdit, roAllFields]
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 144
    Top = 8
    object QCteLoteItemID_LOTE: TFloatField
      FieldName = 'ID_LOTE'
    end
    object QCteLoteItemDESC_CHAVE_ACESSO: TStringField
      FieldName = 'DESC_CHAVE_ACESSO'
      Required = True
      Size = 44
    end
    object QCteLoteItemCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QCteLoteItemDESC_SERIE: TStringField
      FieldName = 'DESC_SERIE'
      Required = True
      Size = 3
    end
    object QCteLoteItemNUM_CTE: TIntegerField
      FieldName = 'NUM_CTE'
      Required = True
    end
    object QCteLoteItemDESC_XML_CTE: TMemoField
      FieldName = 'DESC_XML_CTE'
      Required = True
      BlobType = ftOraClob
    end
    object QCteLoteItemIND_AMBIENTE_CTE: TIntegerField
      FieldName = 'IND_AMBIENTE_CTE'
    end
    object QCteLoteItemCOD_CONHECIMENTO: TIntegerField
      FieldName = 'COD_CONHECIMENTO'
    end
  end
  object CDSCteLoteItemCons: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_LOTE'
    MasterFields = 'ID_LOTE'
    MasterSource = DSCteLoteCons
    PacketRecords = 0
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_LOTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COD_USUARIO'
        ParamType = ptInput
      end>
    ProviderName = 'DSPCteLoteItemCons'
    AfterOpen = CDSCteLoteItemConsAfterOpen
    AfterInsert = CDSCteLoteItemConsAfterInsert
    OnCalcFields = CDSCteLoteItemConsCalcFields
    Left = 136
    Top = 168
    object CDSCteLoteItemConsdesc_tipo_nota: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_tipo_nota'
      Size = 10
      Calculated = True
    end
    object CDSCteLoteItemConsretorno_sefaz: TStringField
      FieldKind = fkCalculated
      FieldName = 'retorno_sefaz'
      Size = 150
      Calculated = True
    end
    object CDSCteLoteItemConsdesc_assunto_email: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_assunto_email'
      Size = 50
      Calculated = True
    end
    object CDSCteLoteItemConsdesc_corpo_email: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_corpo_email'
      Size = 300
      Calculated = True
    end
    object CDSCteLoteItemConsdesc_anexo_email: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_anexo_email'
      Size = 50
      Calculated = True
    end
    object CDSCteLoteItemConsind_autorizado: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'ind_autorizado'
      Calculated = True
    end
    object CDSCteLoteItemConsind_cancelado: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'ind_cancelado'
      Calculated = True
    end
    object CDSCteLoteItemConsind_denegado: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'ind_denegado'
      Calculated = True
    end
    object CDSCteLoteItemConsind_pendente: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'ind_pendente'
      Calculated = True
    end
    object CDSCteLoteItemConsID_LOTE: TFloatField
      FieldName = 'ID_LOTE'
    end
    object CDSCteLoteItemConsDESC_CHAVE_ACESSO: TStringField
      FieldName = 'DESC_CHAVE_ACESSO'
      Required = True
      Size = 44
    end
    object CDSCteLoteItemConsDESC_MSG_CANCELAMENTO: TStringField
      FieldName = 'DESC_MSG_CANCELAMENTO'
      Size = 200
    end
    object CDSCteLoteItemConsDESC_MSG_VALIDACAO: TMemoField
      FieldName = 'DESC_MSG_VALIDACAO'
      BlobType = ftOraClob
    end
    object CDSCteLoteItemConsDESC_MSG_VALIDACAO_LOTE: TMemoField
      FieldName = 'DESC_MSG_VALIDACAO_LOTE'
      BlobType = ftOraClob
    end
    object CDSCteLoteItemConsDESC_PROT_AUTORIZACAO: TStringField
      FieldName = 'DESC_PROT_AUTORIZACAO'
      Size = 15
    end
    object CDSCteLoteItemConsDESC_PROT_CANCELAMENTO: TStringField
      FieldName = 'DESC_PROT_CANCELAMENTO'
      Size = 15
    end
    object CDSCteLoteItemConsDESC_RETORNO_CANCELAMENTO: TStringField
      FieldName = 'DESC_RETORNO_CANCELAMENTO'
      Size = 4
    end
    object CDSCteLoteItemConsDESC_RETORNO_PROCESSAMENTO: TStringField
      FieldName = 'DESC_RETORNO_PROCESSAMENTO'
      Size = 4
    end
    object CDSCteLoteItemConsDESC_XML_CTE: TMemoField
      FieldName = 'DESC_XML_CTE'
      Required = True
      BlobType = ftOraClob
    end
    object CDSCteLoteItemConsDESC_XML_RETORNO: TMemoField
      FieldName = 'DESC_XML_RETORNO'
      BlobType = ftOraClob
    end
    object CDSCteLoteItemConsSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 4
    end
    object CDSCteLoteItemConsDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
    object CDSCteLoteItemConsCOD_SERIE: TStringField
      FieldName = 'COD_SERIE'
      Size = 3
    end
    object CDSCteLoteItemConsCOD_CONHECIMENTO: TIntegerField
      FieldName = 'COD_CONHECIMENTO'
    end
    object CDSCteLoteItemConsNUM_CONHECIMENTO: TIntegerField
      FieldName = 'NUM_CONHECIMENTO'
    end
    object CDSCteLoteItemConsIND_CONTINGENCIA_CTE: TStringField
      FieldName = 'IND_CONTINGENCIA_CTE'
      Size = 1
    end
    object CDSCteLoteItemConsIND_AMBIENTE_CTE: TIntegerField
      FieldName = 'IND_AMBIENTE_CTE'
    end
    object CDSCteLoteItemConsDESTINATARIO: TStringField
      FieldName = 'DESTINATARIO'
      Size = 103
    end
    object CDSCteLoteItemConsNOME_DEST: TStringField
      FieldName = 'NOME_DEST'
      Size = 60
    end
    object CDSCteLoteItemConsEMAIL_XML: TStringField
      FieldName = 'EMAIL_XML'
      Size = 1
    end
    object CDSCteLoteItemConsEMAIL_PDF: TStringField
      FieldName = 'EMAIL_PDF'
      Size = 1
    end
    object CDSCteLoteItemConsIND_SELECIONADO: TStringField
      FieldName = 'IND_SELECIONADO'
      Size = 1
    end
    object CDSCteLoteItemConsDESC_JUST_CANCELA: TStringField
      FieldName = 'DESC_JUST_CANCELA'
      Size = 255
    end
    object CDSCteLoteItemConsNUM_VIAS_DACTE: TIntegerField
      FieldName = 'NUM_VIAS_DACTE'
    end
    object CDSCteLoteItemConsDESC_IMPRESSORA_DACTE: TStringField
      FieldName = 'DESC_IMPRESSORA_DACTE'
      Size = 100
    end
    object CDSCteLoteItemConsCPF_CNPJ_DEST: TStringField
      FieldName = 'CPF_CNPJ_DEST'
      Size = 18
    end
    object CDSCteLoteItemConsREMETENTE: TStringField
      FieldName = 'REMETENTE'
      Size = 103
    end
    object CDSCteLoteItemConsCPF_CNPJ_REM: TStringField
      FieldName = 'CPF_CNPJ_REM'
      Size = 18
    end
    object CDSCteLoteItemConsNOME_REM: TStringField
      FieldName = 'NOME_REM'
      Size = 60
    end
    object CDSCteLoteItemConsDESC_EMAIL: TStringField
      FieldName = 'DESC_EMAIL'
      Size = 355
    end
    object CDSCteLoteItemConsEMAIL_DEST: TStringField
      FieldName = 'EMAIL_DEST'
      Size = 70
    end
    object CDSCteLoteItemConsEMAIL_TOM: TStringField
      FieldName = 'EMAIL_TOM'
      Size = 70
    end
    object CDSCteLoteItemConsEMAIL_REM: TStringField
      FieldName = 'EMAIL_REM'
      Size = 70
    end
    object CDSCteLoteItemConsEMAIL_EXP: TStringField
      FieldName = 'EMAIL_EXP'
      Size = 70
    end
    object CDSCteLoteItemConsEMAIL_REC: TStringField
      FieldName = 'EMAIL_REC'
      Size = 70
    end
    object CDSCteLoteItemConsIND_CTE_EMAIL_DEST: TIntegerField
      FieldName = 'IND_CTE_EMAIL_DEST'
    end
    object CDSCteLoteItemConsIND_CTE_EMAIL_REM: TIntegerField
      FieldName = 'IND_CTE_EMAIL_REM'
    end
    object CDSCteLoteItemConsIND_CTE_EMAIL_EXP: TIntegerField
      FieldName = 'IND_CTE_EMAIL_EXP'
    end
    object CDSCteLoteItemConsIND_CTE_EMAIL_REC: TIntegerField
      FieldName = 'IND_CTE_EMAIL_REC'
    end
    object CDSCteLoteItemConsEXPEDIDOR: TStringField
      FieldName = 'EXPEDIDOR'
      Size = 103
    end
    object CDSCteLoteItemConsCPF_CNPJ_EXP: TStringField
      FieldName = 'CPF_CNPJ_EXP'
      Size = 18
    end
    object CDSCteLoteItemConsNOME_EXP: TStringField
      FieldName = 'NOME_EXP'
      Size = 60
    end
    object CDSCteLoteItemConsRECEBEDOR: TStringField
      FieldName = 'RECEBEDOR'
      Size = 103
    end
    object CDSCteLoteItemConsCPF_CNPJ_REC: TStringField
      FieldName = 'CPF_CNPJ_REC'
      Size = 18
    end
    object CDSCteLoteItemConsNOME_REC: TStringField
      FieldName = 'NOME_REC'
      Size = 60
    end
    object CDSCteLoteItemConsIND_CTE_EMAIL_FILIAL: TIntegerField
      FieldName = 'IND_CTE_EMAIL_FILIAL'
    end
    object CDSCteLoteItemConsEMAIL_FILIAL: TStringField
      FieldName = 'EMAIL_FILIAL'
      Size = 40
    end
    object CDSCteLoteItemConsDESC_XML_RETORNO_CANCELAMENTO: TMemoField
      FieldName = 'DESC_XML_RETORNO_CANCELAMENTO'
      BlobType = ftOraClob
    end
  end
  object DSPCteLoteItemCons: TDataSetProvider
    DataSet = QCteLoteItemCons
    Left = 152
    Top = 104
  end
  object DSCteLoteCons: TDataSource
    DataSet = QCteLoteCons
    Left = 40
    Top = 104
  end
end
