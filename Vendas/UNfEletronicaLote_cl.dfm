object DMNfEletronicaLote: TDMNfEletronicaLote
  OldCreateOrder = False
  Left = 526
  Top = 182
  Height = 319
  Width = 245
  object QNfeLote: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  L.ROWID,'
      '  L.*'
      'FROM'
      '  TB_NF_ELETRONICA_LOTE L'
      'WHERE'
      '  L.ID_LOTE = :PK')
    Variables.Data = {0300000001000000030000003A504B050000000000000000000000}
    SequenceField.Field = 'ID_LOTE'
    SequenceField.Sequence = 'SQLOTE_NFE'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      04000000070000000700000049445F4C4F54450100000000000C000000494E44
      5F534954554143414F0100000000000A00000044545F4352494143414F010000
      0000000800000044545F454E56494F0100000000000A000000434F445F46494C
      49414C0100000000000A0000004E554D5F52454349424F0100000000000E0000
      00444553435F50524F544F434F4C4F010000000000}
    RefreshOptions = [roBeforeEdit, roAllFields]
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    AfterInsert = QNfeLoteAfterInsert
    Left = 40
    Top = 8
    object QNfeLoteID_LOTE: TFloatField
      FieldName = 'ID_LOTE'
      Required = True
    end
    object QNfeLoteIND_SITUACAO: TIntegerField
      FieldName = 'IND_SITUACAO'
    end
    object QNfeLoteDT_CRIACAO: TDateTimeField
      FieldName = 'DT_CRIACAO'
    end
    object QNfeLoteDT_ENVIO: TDateTimeField
      FieldName = 'DT_ENVIO'
    end
    object QNfeLoteCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QNfeLoteNUM_RECIBO: TFloatField
      FieldName = 'NUM_RECIBO'
    end
    object QNfeLoteDESC_PROTOCOLO: TStringField
      FieldName = 'DESC_PROTOCOLO'
      Size = 50
    end
  end
  object QNfeLoteCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  L.ID_LOTE,'
      '  L.IND_SITUACAO,'
      '  L.DT_CRIACAO,'
      '  L.DT_ENVIO,'
      '  L.COD_FILIAL,'
      '  L.DESC_PROTOCOLO,'
      '  F.DESC_REPOSITORIO_NFE,'
      '  F.DESC_FILIAL,'
      '  F.NUM_CGC CGC_FILIAL,'
      '  F.DESC_INSCRICAO_MUNICIPAL,'
      '  TO_NUMBER('#39'0'#39' || F.IND_CONTINGENCIA) AS IND_CONTINGENCIA,'
      '  E.COD_UF_IBGE,'
      '  0 AS CONT_SELECIONADO,'
      '  0 AS COD_USUARIO,'
      '  '#39#39' AS DESC_IMPRESSORA_DANFE,'
      '  E.COD_UF_IBGE || C.COD_CIDADE_IBGE AS COD_IBGE_CIDADE'
      'FROM'
      '  TB_NF_ELETRONICA_LOTE L'
      'LEFT JOIN'
      '  TB_FILIAL F ON L.COD_FILIAL = F.COD_FILIAL'
      'LEFT JOIN'
      '  TB_CIDADE C ON F.COD_CIDADE = C.COD_CIDADE'
      'LEFT JOIN'
      '  TB_ESTADO E ON F.COD_ESTADO = E.COD_ESTADO'
      'LEFT JOIN'
      '  TB_NF_ELETRONICA NF ON L.ID_LOTE = NF.ID_LOTE  '
      'WHERE'
      '      (:ID_LOTE IS NULL OR L.ID_LOTE = :ID_LOTE)'
      '  AND (:FILIAL IS NULL OR L.COD_FILIAL = :FILIAL)'
      '  AND (:DT_CRIACAO_I IS NULL OR L.DT_CRIACAO >= :DT_CRIACAO_I)'
      '  AND (:DT_CRIACAO_F IS NULL OR L.DT_CRIACAO <= :DT_CRIACAO_F)'
      '  AND (:DT_ENVIO_I IS NULL OR L.DT_ENVIO >= :DT_ENVIO_I)'
      '  AND (:DT_ENVIO_F IS NULL OR L.DT_ENVIO <= :DT_ENVIO_F)'
      '  AND (:SITUACAO IS NULL OR L.IND_SITUACAO = :SITUACAO)'
      '  AND (:USUARIO IS NULL OR :USUARIO IS NOT NULL)'
      '  -- NOVA L'#211'GICA DE FILTRO PARA NOTA CAB --'
      '  AND (:NOTA_CAB IS NULL OR EXISTS ('
      '      SELECT 1'
      '      FROM TB_NF_ELETRONICA NFE'
      '      WHERE NFE.ID_LOTE = L.ID_LOTE'
      '      AND NFE.COD_NOTA_CAB = :NOTA_CAB'
      '  ))'
      ''
      'ORDER BY'
      '  L.DT_CRIACAO,'
      '  L.DT_ENVIO')
    Variables.Data = {
      0300000009000000080000003A49445F4C4F5445030000000000000000000000
      0D0000003A44545F4352494143414F5F490C00000000000000000000000D0000
      003A44545F4352494143414F5F460C00000000000000000000000B0000003A44
      545F454E56494F5F490C00000000000000000000000B0000003A44545F454E56
      494F5F460C0000000000000000000000090000003A4E4F54415F434142030000
      0004000000ECD3080000000000090000003A534954554143414F030000000000
      000000000000080000003A5553554152494F0300000000000000000000000700
      00003A46494C49414C03000000040000000200000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000100000000700000049445F4C4F54450100000000000C000000494E44
      5F534954554143414F0100000000000A00000044545F4352494143414F010000
      0000000800000044545F454E56494F0100000000000A000000434F445F46494C
      49414C01000000000014000000444553435F5245504F5349544F52494F5F4E46
      450100000000000B000000434F445F55465F494247450100000000000B000000
      444553435F46494C49414C0100000000000A0000004347435F46494C49414C01
      000000000010000000434F4E545F53454C4543494F4E41444F01000000000015
      000000444553435F494D50524553534F52415F44414E46450100000000001000
      0000494E445F434F4E54494E47454E4349410100000000000B000000434F445F
      5553554152494F0100000000000E000000444553435F50524F544F434F4C4F01
      000000000018000000444553435F494E5343524943414F5F4D554E4943495041
      4C0100000000000F000000434F445F494247455F434944414445010000000000}
    ReadOnly = True
    RefreshOptions = [roBeforeEdit, roAllFields]
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    BeforeOpen = QNfeLoteConsBeforeOpen
    AfterOpen = QNfeLoteConsAfterOpen
    BeforeClose = QNfeLoteConsBeforeClose
    OnCalcFields = QNfeLoteConsCalcFields
    Left = 40
    Top = 56
    object QNfeLoteConsID_LOTE: TFloatField
      FieldName = 'ID_LOTE'
      Required = True
    end
    object QNfeLoteConsIND_SITUACAO: TIntegerField
      FieldName = 'IND_SITUACAO'
    end
    object QNfeLoteConsDT_CRIACAO: TDateTimeField
      FieldName = 'DT_CRIACAO'
    end
    object QNfeLoteConsDT_ENVIO: TDateTimeField
      FieldName = 'DT_ENVIO'
    end
    object QNfeLoteConsCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QNfeLoteConsDESC_REPOSITORIO_NFE: TStringField
      FieldName = 'DESC_REPOSITORIO_NFE'
      Size = 60
    end
    object QNfeLoteConsCOD_UF_IBGE: TIntegerField
      FieldName = 'COD_UF_IBGE'
    end
    object QNfeLoteConsDESC_FILIAL: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
    object QNfeLoteConsCGC_FILIAL: TStringField
      FieldName = 'CGC_FILIAL'
      Size = 18
    end
    object QNfeLoteConsCONT_SELECIONADO: TFloatField
      FieldName = 'CONT_SELECIONADO'
    end
    object QNfeLoteConsDESC_IMPRESSORA_DANFE: TStringField
      FieldName = 'DESC_IMPRESSORA_DANFE'
      Size = 200
    end
    object QNfeLoteConsIND_CONTINGENCIA: TFloatField
      FieldName = 'IND_CONTINGENCIA'
    end
    object QNfeLoteConsdesc_situacao: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_situacao'
      Calculated = True
    end
    object QNfeLoteConsDESC_PROTOCOLO: TStringField
      FieldName = 'DESC_PROTOCOLO'
      Size = 50
    end
    object QNfeLoteConsDESC_INSCRICAO_MUNICIPAL: TStringField
      FieldName = 'DESC_INSCRICAO_MUNICIPAL'
      Size = 15
    end
    object QNfeLoteConsCOD_IBGE_CIDADE: TStringField
      FieldName = 'COD_IBGE_CIDADE'
      Size = 45
    end
    object QNfeLoteConsCOD_USUARIO: TFloatField
      FieldName = 'COD_USUARIO'
    end
  end
  object QNfeLoteItemCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  NFE.ID_LOTE,'
      '  NFE.DESC_CHAVE_ACESSO,'
      '  NFE.DESC_MSG_CANCELAMENTO,'
      '  NFE.DESC_MSG_VALIDACAO,'
      '  NFE.DESC_MSG_VALIDACAO_LOTE,'
      '  NFE.DESC_PROT_AUTORIZACAO,'
      '  NFE.DESC_PROT_CANCELAMENTO,'
      '  NFE.DESC_RETORNO_CANCELAMENTO,'
      '  NFE.DESC_RETORNO_PROCESSAMENTO,'
      '  NFE.IND_NFSE,'
      '  NFE.DESC_XML_NFE,'
      '  NFE.DESC_XML_RETORNO,'
      '  NFE_CANC.ID_LOTE AS LOTE_CANC,'
      
        '  DECODE(NFE.DESC_RETORNO_CANCELAMENTO, '#39'101'#39', NFE.DESC_RETORNO_' +
        'CANCELAMENTO,'
      '      NFE.DESC_RETORNO_PROCESSAMENTO) AS STATUS,'
      '  N.DT_EMISSAO,'
      '  N.COD_SERIE,'
      '  N.COD_SERIE_MODELO,'
      '  N.COD_NOTA_CAB,'
      '  N.NUM_NOTA,'
      '  N.NUM_NFSE,'
      '  N.IND_ENTRADA_SAIDA,'
      '  N.IND_CONTINGENCIA,'
      '  NFE.IND_AMBIENTE_NFE,'
      '  N.COD_CADASTRO || '#39' - '#39' || C.NOME AS CADASTRO,'
      '  C.NUM_CGC_CPF,'
      '  C.NOME AS NOME_CADASTRO,'
      '  C.DESC_INSCRICAO_MUNICIPAL,'
      ''
      '  -- ALTERACAO FEITA PARA NOTA AUTOM'#193'TICA'
      '  CASE'
      '    WHEN PARAM.IND_NOTA_AUTOMATICA_WEB = '#39'SIM'#39' THEN'
      '      DECODE(V.DESC_E_MAIL, NULL, C.DESC_E_MAIL,'
      
        '        DECODE(C.DESC_E_MAIL, NULL, V.DESC_E_MAIL, C.DESC_E_MAIL' +
        ' || '#39';'#39' || V.DESC_E_MAIL)'
      '      )'
      '    ELSE'
      
        '      DECODE(T.DESC_E_MAIL,'#39#39',C.DESC_E_MAIL,DECODE(C.DESC_E_MAIL' +
        ','#39#39','#39#39',C.DESC_E_MAIL || '#39'; '#39') || T.DESC_E_MAIL)'
      '  END AS DESC_EMAIL,'
      ''
      '  '#39'N'#39' AS EMAIL_XML,'
      '  '#39'N'#39' AS EMAIL_PDF,'
      '  '#39'N'#39' AS IND_SELECIONADO,'
      '  RPAD('#39' '#39', 255, '#39' '#39') AS DESC_JUST_CANCELA,'
      '  F.NUM_VIAS_DANFE,'
      '  F.NUM_VIAS_DANFE_NFCE,'
      '  U.DESC_IMPRESSORA_DANFE,'
      '  U.DESC_IMPRESSORA_DANFE_NFCE,'
      '  PAIS.COD_PAIS_IBGE'
      'FROM'
      '  TB_PARAM_SISTEMA PARAM,'
      '  TB_NF_ELETRONICA NFE'
      'LEFT JOIN'
      '  TB_NOTA_CAB N'
      'ON'
      '  ((('#39'NFe'#39'||NFE.DESC_CHAVE_ACESSO) = N.DESC_CHAVE_ACESSO)'
      '  AND'
      '  (NFE.COD_FILIAL = N.COD_FILIAL)'
      '  AND'
      
        '  (NFE.COD_NOTA_CAB IS NULL OR NFE.COD_NOTA_CAB = N.COD_NOTA_CAB' +
        '))'
      'LEFT JOIN'
      '  TB_CADASTRO C'
      'ON'
      '  N.COD_CADASTRO = C.COD_CADASTRO'
      'LEFT JOIN'
      '  TB_PAIS PAIS'
      'ON'
      '  PAIS.COD_PAIS = C.COD_PAIS'
      'LEFT JOIN'
      '  TB_CADASTRO T'
      'ON'
      '  N.COD_TRANSPORTADOR = T.COD_CADASTRO'
      'LEFT JOIN'
      '  TB_NF_ELETRONICA_LOTE NFEL'
      'ON'
      '  NFE.ID_LOTE = NFEL.ID_LOTE'
      'LEFT JOIN'
      '  TB_FILIAL F'
      'ON'
      '  N.COD_FILIAL = F.COD_FILIAL'
      'LEFT JOIN'
      '  TB_USUARIO U'
      'ON'
      '  (:COD_USUARIO = U.COD_USUARIO)'
      'LEFT JOIN'
      '  TB_NF_ELETRONICA_CANC NFE_CANC'
      'ON'
      '  NFE_CANC.DESC_CHAVE_ACESSO = NFE.DESC_CHAVE_ACESSO'
      'LEFT JOIN '
      '  TB_VENDEDOR V'
      'ON'
      '  N.COD_VENDEDOR = V.COD_VENDEDOR'
      'WHERE'
      '  NFE.ID_LOTE = :ID_LOTE')
    Variables.Data = {
      0300000002000000080000003A49445F4C4F544503000000040000001EA60A00
      000000000C0000003A434F445F5553554152494F030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000250000000700000049445F4C4F544501000000000011000000444553
      435F43484156455F41434553534F0100000000000A00000044545F454D495353
      414F010000000000080000004E554D5F4E4F544101000000000011000000494E
      445F454E54524144415F53414944410100000000000800000043414441535452
      4F010000000000060000005354415455530100000000000F000000494E445F53
      454C4543494F4E41444F0100000000000A000000444553435F454D41494C0100
      0000000009000000434F445F534552494501000000000009000000454D41494C
      5F584D4C01000000000009000000454D41494C5F504446010000000000100000
      00494E445F434F4E54494E47454E43494101000000000010000000494E445F41
      4D4249454E54455F4E464501000000000012000000444553435F4D53475F5641
      4C49444143414F00000000000017000000444553435F4D53475F56414C494441
      43414F5F4C4F54450000000000000C000000434F445F4E4F54415F4341420100
      0000000015000000444553435F4D53475F43414E43454C414D454E544F010000
      00000019000000444553435F5245544F524E4F5F43414E43454C414D454E544F
      0100000000001A000000444553435F5245544F524E4F5F50524F43455353414D
      454E544F01000000000015000000444553435F50524F545F4155544F52495A41
      43414F01000000000016000000444553435F50524F545F43414E43454C414D45
      4E544F01000000000011000000444553435F4A5553545F43414E43454C410100
      000000000E0000004E554D5F564941535F44414E464501000000000015000000
      444553435F494D50524553534F52415F44414E46450100000000000800000049
      4E445F4E4653450100000000000D0000004E4F4D455F434144415354524F0100
      000000000B0000004E554D5F4347435F43504601000000000018000000444553
      435F494E5343524943414F5F4D554E49434950414C010000000000080000004E
      554D5F4E4653450100000000000C000000444553435F584D4C5F4E4645000000
      00000010000000444553435F584D4C5F5245544F524E4F000000000000090000
      004C4F54455F43414E4301000000000010000000434F445F53455249455F4D4F
      44454C4F010000000000130000004E554D5F564941535F44414E46455F4E4643
      450100000000001A000000444553435F494D50524553534F52415F44414E4645
      5F4E4643450100000000000D000000434F445F504149535F4942474501000000
      0000}
    Master = QNfeLoteCons
    MasterFields = 'ID_LOTE'
    DetailFields = 'ID_LOTE'
    ReadOnly = True
    RefreshOptions = [roBeforeEdit, roAllFields]
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    BeforeOpen = QNfeLoteItemConsBeforeOpen
    Left = 144
    Top = 56
    object QNfeLoteItemConsIND_SELECIONADO: TStringField
      FieldName = 'IND_SELECIONADO'
      Size = 1
    end
    object QNfeLoteItemConsID_LOTE: TFloatField
      FieldName = 'ID_LOTE'
      Required = True
    end
    object QNfeLoteItemConsDESC_CHAVE_ACESSO: TStringField
      FieldName = 'DESC_CHAVE_ACESSO'
      Required = True
      Size = 44
    end
    object QNfeLoteItemConsDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object QNfeLoteItemConsCOD_SERIE: TStringField
      FieldName = 'COD_SERIE'
      Size = 3
    end
    object QNfeLoteItemConsNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
      Required = True
    end
    object QNfeLoteItemConsIND_ENTRADA_SAIDA: TStringField
      FieldName = 'IND_ENTRADA_SAIDA'
      Size = 1
    end
    object QNfeLoteItemConsCADASTRO: TStringField
      FieldName = 'CADASTRO'
      Size = 93
    end
    object QNfeLoteItemConsDESC_EMAIL: TStringField
      FieldName = 'DESC_EMAIL'
      Size = 140
    end
    object QNfeLoteItemConsSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 4
    end
    object QNfeLoteItemConsEMAIL_XML: TStringField
      FieldName = 'EMAIL_XML'
      Size = 1
    end
    object QNfeLoteItemConsEMAIL_PDF: TStringField
      FieldName = 'EMAIL_PDF'
      Size = 1
    end
    object QNfeLoteItemConsIND_CONTINGENCIA: TStringField
      FieldName = 'IND_CONTINGENCIA'
      Size = 1
    end
    object QNfeLoteItemConsIND_AMBIENTE_NFE: TIntegerField
      FieldName = 'IND_AMBIENTE_NFE'
    end
    object QNfeLoteItemConsDESC_MSG_VALIDACAO: TMemoField
      FieldName = 'DESC_MSG_VALIDACAO'
      BlobType = ftOraClob
    end
    object QNfeLoteItemConsDESC_MSG_VALIDACAO_LOTE: TMemoField
      FieldName = 'DESC_MSG_VALIDACAO_LOTE'
      BlobType = ftOraClob
    end
    object QNfeLoteItemConsCOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
    end
    object QNfeLoteItemConsDESC_MSG_CANCELAMENTO: TStringField
      FieldName = 'DESC_MSG_CANCELAMENTO'
      Size = 200
    end
    object QNfeLoteItemConsDESC_RETORNO_CANCELAMENTO: TStringField
      FieldName = 'DESC_RETORNO_CANCELAMENTO'
      Size = 4
    end
    object QNfeLoteItemConsDESC_RETORNO_PROCESSAMENTO: TStringField
      FieldName = 'DESC_RETORNO_PROCESSAMENTO'
      Size = 4
    end
    object QNfeLoteItemConsDESC_PROT_AUTORIZACAO: TStringField
      FieldName = 'DESC_PROT_AUTORIZACAO'
      Size = 15
    end
    object QNfeLoteItemConsDESC_PROT_CANCELAMENTO: TStringField
      FieldName = 'DESC_PROT_CANCELAMENTO'
      Size = 15
    end
    object QNfeLoteItemConsDESC_JUST_CANCELA: TStringField
      FieldName = 'DESC_JUST_CANCELA'
      Size = 255
    end
    object QNfeLoteItemConsNUM_VIAS_DANFE: TIntegerField
      FieldName = 'NUM_VIAS_DANFE'
    end
    object QNfeLoteItemConsDESC_IMPRESSORA_DANFE: TStringField
      FieldName = 'DESC_IMPRESSORA_DANFE'
      Size = 200
    end
    object QNfeLoteItemConsIND_NFSE: TStringField
      FieldName = 'IND_NFSE'
      Size = 3
    end
    object QNfeLoteItemConsNOME_CADASTRO: TStringField
      FieldName = 'NOME_CADASTRO'
      Size = 60
    end
    object QNfeLoteItemConsNUM_CGC_CPF: TStringField
      FieldName = 'NUM_CGC_CPF'
      Size = 18
    end
    object QNfeLoteItemConsDESC_INSCRICAO_MUNICIPAL: TStringField
      FieldName = 'DESC_INSCRICAO_MUNICIPAL'
      Size = 15
    end
    object QNfeLoteItemConsNUM_NFSE: TStringField
      FieldName = 'NUM_NFSE'
      Size = 15
    end
    object QNfeLoteItemConsDESC_XML_NFE: TMemoField
      FieldName = 'DESC_XML_NFE'
      Required = True
      BlobType = ftOraClob
    end
    object QNfeLoteItemConsDESC_XML_RETORNO: TMemoField
      FieldName = 'DESC_XML_RETORNO'
      BlobType = ftOraClob
    end
    object QNfeLoteItemConsLOTE_CANC: TFloatField
      FieldName = 'LOTE_CANC'
    end
    object QNfeLoteItemConsCOD_SERIE_MODELO: TStringField
      FieldName = 'COD_SERIE_MODELO'
      Size = 2
    end
    object QNfeLoteItemConsNUM_VIAS_DANFE_NFCE: TIntegerField
      FieldName = 'NUM_VIAS_DANFE_NFCE'
    end
    object QNfeLoteItemConsDESC_IMPRESSORA_DANFE_NFCE: TStringField
      FieldName = 'DESC_IMPRESSORA_DANFE_NFCE'
      Size = 200
    end
    object QNfeLoteItemConsCOD_PAIS_IBGE: TIntegerField
      FieldName = 'COD_PAIS_IBGE'
    end
  end
  object QNfeLoteItem: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  NFE.ROWID,'
      '  NFE.ID_LOTE,'
      '  NFE.DESC_CHAVE_ACESSO,'
      '  NFE.COD_FILIAL,'
      '  NFE.DESC_SERIE,'
      '  NFE.NUM_NF_ELETRONICA,'
      '  NFE.DESC_XML_NFE,'
      '  NFE.DESC_XML_RPS,'
      '  NFE.DESC_CERTIFICADO,'
      '  NFE.DESC_LOGOTIPO,'
      '  NFE.IND_AMBIENTE_NFE,'
      '  NFE.COD_NOTA_CAB,'
      '  NFE.DESC_IMPRESSORA,'
      '  NFE.IND_NFSE,'
      '  NFE.IND_DANFE_IMPRESSA,'
      '  NFE.IND_CONTINGENCIA,'
      '  NFE.DT_CONTINGENCIA,'
      '  NFE.DESC_JUST_CONTINGENCIA'
      'FROM'
      '  TB_NF_ELETRONICA NFE'
      'WHERE'
      '  (:ID_LOTE IS NULL OR NFE.ID_LOTE = :ID_LOTE)'
      ''
      'AND'
      '  (:COD_NOTA_CAB IS NULL OR NFE.COD_NOTA_CAB = :COD_NOTA_CAB)'
      '')
    Variables.Data = {
      0300000002000000080000003A49445F4C4F5445030000000000000000000000
      0D0000003A434F445F4E4F54415F434142030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000110000000700000049445F4C4F544501000000000011000000444553
      435F43484156455F41434553534F0100000000000C000000434F445F4E4F5441
      5F4341420100000000000A000000434F445F46494C49414C0100000000000A00
      0000444553435F5345524945010000000000110000004E554D5F4E465F454C45
      54524F4E4943410100000000000C000000444553435F584D4C5F4E4645000000
      00000010000000444553435F434552544946494341444F0100000000000D0000
      00444553435F4C4F474F5449504F01000000000010000000494E445F414D4249
      454E54455F4E46450100000000000C000000444553435F584D4C5F5250530000
      0000000008000000494E445F4E4653450100000000000F000000444553435F49
      4D50524553534F524101000000000012000000494E445F44414E46455F494D50
      524553534101000000000010000000494E445F434F4E54494E47454E43494101
      00000000000F00000044545F434F4E54494E47454E4349410100000000001600
      0000444553435F4A5553545F434F4E54494E47454E434941010000000000}
    RefreshOptions = [roBeforeEdit, roAllFields]
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 144
    Top = 8
    object QNfeLoteItemID_LOTE: TFloatField
      FieldName = 'ID_LOTE'
    end
    object QNfeLoteItemDESC_CHAVE_ACESSO: TStringField
      FieldName = 'DESC_CHAVE_ACESSO'
      Required = True
      Size = 44
    end
    object QNfeLoteItemCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QNfeLoteItemDESC_SERIE: TStringField
      FieldName = 'DESC_SERIE'
      Required = True
      Size = 3
    end
    object QNfeLoteItemNUM_NF_ELETRONICA: TIntegerField
      FieldName = 'NUM_NF_ELETRONICA'
      Required = True
    end
    object QNfeLoteItemDESC_XML_NFE: TMemoField
      FieldName = 'DESC_XML_NFE'
      Required = True
      BlobType = ftOraClob
    end
    object QNfeLoteItemDESC_CERTIFICADO: TStringField
      FieldName = 'DESC_CERTIFICADO'
      Size = 200
    end
    object QNfeLoteItemDESC_LOGOTIPO: TStringField
      FieldName = 'DESC_LOGOTIPO'
      Size = 200
    end
    object QNfeLoteItemIND_AMBIENTE_NFE: TIntegerField
      FieldName = 'IND_AMBIENTE_NFE'
    end
    object QNfeLoteItemCOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
    end
    object QNfeLoteItemDESC_XML_RPS: TMemoField
      FieldName = 'DESC_XML_RPS'
      BlobType = ftOraClob
    end
    object QNfeLoteItemIND_NFSE: TStringField
      FieldName = 'IND_NFSE'
      Size = 3
    end
    object QNfeLoteItemDESC_IMPRESSORA: TStringField
      FieldName = 'DESC_IMPRESSORA'
      Size = 200
    end
    object QNfeLoteItemIND_DANFE_IMPRESSA: TStringField
      FieldName = 'IND_DANFE_IMPRESSA'
      Size = 1
    end
    object QNfeLoteItemIND_CONTINGENCIA: TStringField
      FieldName = 'IND_CONTINGENCIA'
      Size = 1
    end
    object QNfeLoteItemDT_CONTINGENCIA: TDateTimeField
      FieldName = 'DT_CONTINGENCIA'
    end
    object QNfeLoteItemDESC_JUST_CONTINGENCIA: TStringField
      FieldName = 'DESC_JUST_CONTINGENCIA'
      Size = 255
    end
  end
  object CDSNfeLoteItemCons: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_LOTE'
    MasterFields = 'ID_LOTE'
    MasterSource = DSNfeLoteCons
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
    ProviderName = 'DSPNfeLoteItemCons'
    AfterOpen = CDSNfeLoteItemConsAfterOpen
    AfterInsert = CDSNfeLoteItemConsAfterInsert
    OnCalcFields = CDSNfeLoteItemConsCalcFields
    Left = 136
    Top = 168
    object CDSNfeLoteItemConsID_LOTE: TFloatField
      FieldName = 'ID_LOTE'
      Required = True
    end
    object CDSNfeLoteItemConsIND_SELECIONADO: TStringField
      FieldName = 'IND_SELECIONADO'
      Size = 1
    end
    object CDSNfeLoteItemConsDESC_CHAVE_ACESSO: TStringField
      FieldName = 'DESC_CHAVE_ACESSO'
      Required = True
      Size = 44
    end
    object CDSNfeLoteItemConsDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object CDSNfeLoteItemConsCOD_SERIE: TStringField
      FieldName = 'COD_SERIE'
      Size = 3
    end
    object CDSNfeLoteItemConsNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
      Required = True
    end
    object CDSNfeLoteItemConsIND_ENTRADA_SAIDA: TStringField
      FieldName = 'IND_ENTRADA_SAIDA'
      Size = 1
    end
    object CDSNfeLoteItemConsCADASTRO: TStringField
      FieldName = 'CADASTRO'
      Size = 93
    end
    object CDSNfeLoteItemConsSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 4
    end
    object CDSNfeLoteItemConsDESC_EMAIL: TStringField
      FieldName = 'DESC_EMAIL'
      Size = 140
    end
    object CDSNfeLoteItemConsEMAIL_XML: TStringField
      FieldName = 'EMAIL_XML'
      Size = 1
    end
    object CDSNfeLoteItemConsEMAIL_PDF: TStringField
      FieldName = 'EMAIL_PDF'
      Size = 1
    end
    object CDSNfeLoteItemConsIND_CONTINGENCIA: TStringField
      FieldName = 'IND_CONTINGENCIA'
      Size = 1
    end
    object CDSNfeLoteItemConsIND_AMBIENTE_NFE: TIntegerField
      FieldName = 'IND_AMBIENTE_NFE'
    end
    object CDSNfeLoteItemConsDESC_MSG_VALIDACAO: TMemoField
      FieldName = 'DESC_MSG_VALIDACAO'
      BlobType = ftOraClob
    end
    object CDSNfeLoteItemConsDESC_MSG_VALIDACAO_LOTE: TMemoField
      FieldName = 'DESC_MSG_VALIDACAO_LOTE'
      BlobType = ftOraClob
    end
    object CDSNfeLoteItemConsDESC_MSG_CANCELAMENTO: TStringField
      FieldName = 'DESC_MSG_CANCELAMENTO'
      Size = 200
    end
    object CDSNfeLoteItemConsDESC_RETORNO_CANCELAMENTO: TStringField
      FieldName = 'DESC_RETORNO_CANCELAMENTO'
      Size = 4
    end
    object CDSNfeLoteItemConsDESC_RETORNO_PROCESSAMENTO: TStringField
      FieldName = 'DESC_RETORNO_PROCESSAMENTO'
      Size = 4
    end
    object CDSNfeLoteItemConsCOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
    end
    object CDSNfeLoteItemConsDESC_PROT_AUTORIZACAO: TStringField
      FieldName = 'DESC_PROT_AUTORIZACAO'
      Size = 15
    end
    object CDSNfeLoteItemConsDESC_PROT_CANCELAMENTO: TStringField
      FieldName = 'DESC_PROT_CANCELAMENTO'
      Size = 15
    end
    object CDSNfeLoteItemConsDESC_JUST_CANCELA: TStringField
      FieldName = 'DESC_JUST_CANCELA'
      Size = 255
    end
    object CDSNfeLoteItemConsNUM_VIAS_DANFE: TIntegerField
      FieldName = 'NUM_VIAS_DANFE'
    end
    object CDSNfeLoteItemConsDESC_IMPRESSORA_DANFE: TStringField
      FieldName = 'DESC_IMPRESSORA_DANFE'
      Size = 200
    end
    object CDSNfeLoteItemConsdesc_tipo_nota: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_tipo_nota'
      Size = 10
      Calculated = True
    end
    object CDSNfeLoteItemConsretorno_sefaz: TStringField
      FieldKind = fkCalculated
      FieldName = 'retorno_sefaz'
      Size = 150
      Calculated = True
    end
    object CDSNfeLoteItemConsdesc_assunto_email: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_assunto_email'
      Size = 50
      Calculated = True
    end
    object CDSNfeLoteItemConsdesc_corpo_email: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_corpo_email'
      Size = 600
      Calculated = True
    end
    object CDSNfeLoteItemConsdesc_anexo_email: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_anexo_email'
      Size = 50
      Calculated = True
    end
    object CDSNfeLoteItemConsind_autorizado: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'ind_autorizado'
      Calculated = True
    end
    object CDSNfeLoteItemConsind_cancelado: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'ind_cancelado'
      Calculated = True
    end
    object CDSNfeLoteItemConsind_denegado: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'ind_denegado'
      Calculated = True
    end
    object CDSNfeLoteItemConsind_pendente: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'ind_pendente'
      Calculated = True
    end
    object CDSNfeLoteItemConsNUM_CGC_CPF: TStringField
      FieldName = 'NUM_CGC_CPF'
      Size = 18
    end
    object CDSNfeLoteItemConsDESC_INSCRICAO_MUNICIPAL: TStringField
      FieldName = 'DESC_INSCRICAO_MUNICIPAL'
      Size = 15
    end
    object CDSNfeLoteItemConsIND_NFSE: TStringField
      FieldName = 'IND_NFSE'
      Size = 3
    end
    object CDSNfeLoteItemConsNOME_CADASTRO: TStringField
      FieldName = 'NOME_CADASTRO'
      Size = 60
    end
    object CDSNfeLoteItemConsNUM_NFSE: TStringField
      FieldName = 'NUM_NFSE'
      Size = 15
    end
    object CDSNfeLoteItemConsDESC_XML_NFE: TMemoField
      FieldName = 'DESC_XML_NFE'
      Required = True
      BlobType = ftOraClob
    end
    object CDSNfeLoteItemConsDESC_XML_RETORNO: TMemoField
      FieldName = 'DESC_XML_RETORNO'
      BlobType = ftOraClob
    end
    object CDSNfeLoteItemConsLOTE_CANC: TFloatField
      FieldName = 'LOTE_CANC'
    end
    object CDSNfeLoteItemConsCOD_SERIE_MODELO: TStringField
      FieldName = 'COD_SERIE_MODELO'
      Size = 2
    end
    object CDSNfeLoteItemConsNUM_VIAS_DANFE_NFCE: TIntegerField
      FieldName = 'NUM_VIAS_DANFE_NFCE'
    end
    object CDSNfeLoteItemConsDESC_IMPRESSORA_DANFE_NFCE: TStringField
      FieldName = 'DESC_IMPRESSORA_DANFE_NFCE'
      Size = 200
    end
    object CDSNfeLoteItemConsCOD_PAIS_IBGE: TIntegerField
      FieldName = 'COD_PAIS_IBGE'
    end
  end
  object DSPNfeLoteItemCons: TDataSetProvider
    DataSet = QNfeLoteItemCons
    Left = 152
    Top = 104
  end
  object DSNfeLoteCons: TDataSource
    DataSet = QNfeLoteCons
    Left = 40
    Top = 104
  end
  object QNFeLoteConsOld: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  L.ID_LOTE,'
      '  L.IND_SITUACAO,'
      '  L.DT_CRIACAO,'
      '  L.DT_ENVIO,'
      '  L.COD_FILIAL,'
      '  L.DESC_PROTOCOLO,'
      '  F.DESC_REPOSITORIO_NFE,'
      '  F.DESC_FILIAL,'
      '  F.NUM_CGC CGC_FILIAL,'
      '  F.DESC_INSCRICAO_MUNICIPAL,'
      '  TO_NUMBER('#39'0'#39' || F.IND_CONTINGENCIA) AS IND_CONTINGENCIA,'
      '  E.COD_UF_IBGE,'
      '  0 AS CONT_SELECIONADO,'
      '  0 as COD_USUARIO,'
      '  '#39#39' AS DESC_IMPRESSORA_DANFE,'
      '--  U.COD_USUARIO,'
      '--  U.DESC_IMPRESSORA_DANFE AS DESC_IMPRESSORA_DANFE,'
      '  E.COD_UF_IBGE || C.COD_CIDADE_IBGE AS COD_IBGE_CIDADE'
      'FROM'
      '  TB_NF_ELETRONICA_LOTE L'
      'LEFT JOIN'
      '  TB_FILIAL F'
      'ON'
      '  L.COD_FILIAL = F.COD_FILIAL'
      'LEFT JOIN'
      '  TB_CIDADE C'
      'ON'
      '  F.COD_CIDADE = C.COD_CIDADE'
      'LEFT JOIN'
      '  TB_ESTADO E'
      'ON'
      '  F.COD_ESTADO = E.COD_ESTADO'
      'LEFT JOIN'
      '  TB_NF_ELETRONICA NFE'
      'ON'
      '  NFE.ID_LOTE = L.ID_LOTE'
      '/*LEFT JOIN'
      '  TB_NOTA_CAB NC'
      'ON'
      '/*  '#39'NFe'#39' || nfe.desc_chave_acesso = NC.desc_chave_acesso*/'
      '--  NFE.COD_NOTA_CAB = NC.COD_NOTA_CAB'
      '/* LEFT JOIN'
      '  TB_USUARIO U'
      'ON'
      '  (:USUARIO = U.COD_USUARIO) */'
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
      '  /*(:NOTA_CAB IS NULL OR L.ID_LOTE IN'
      '    (SELECT ID_LOTE FROM TB_NF_ELETRONICA'
      '     WHERE COD_NOTA_CAB = :NOTA_CAB))*/'
      '  (:NOTA_CAB IS NULL OR'
      '  NFE.COD_NOTA_CAB = :NOTA_CAB)'
      'AND'
      '  (:USUARIO IS NULL OR :USUARIO IS NOT NULL)'
      'AND'
      '  (:SITUACAO IS NULL OR L.IND_SITUACAO = :SITUACAO)'
      'ORDER BY'
      '  L.DT_CRIACAO,'
      '  L.DT_ENVIO')
    Variables.Data = {
      0300000009000000080000003A49445F4C4F5445030000000000000000000000
      0D0000003A44545F4352494143414F5F490C00000000000000000000000D0000
      003A44545F4352494143414F5F460C00000000000000000000000B0000003A44
      545F454E56494F5F490C00000000000000000000000B0000003A44545F454E56
      494F5F460C0000000000000000000000090000003A4E4F54415F434142030000
      0004000000EA93000000000000090000003A534954554143414F030000000000
      000000000000080000003A5553554152494F0300000000000000000000000700
      00003A46494C49414C03000000040000000200000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000100000000700000049445F4C4F54450100000000000C000000494E44
      5F534954554143414F0100000000000A00000044545F4352494143414F010000
      0000000800000044545F454E56494F0100000000000A000000434F445F46494C
      49414C01000000000014000000444553435F5245504F5349544F52494F5F4E46
      450100000000000B000000434F445F55465F494247450100000000000B000000
      444553435F46494C49414C0100000000000A0000004347435F46494C49414C01
      000000000010000000434F4E545F53454C4543494F4E41444F01000000000015
      000000444553435F494D50524553534F52415F44414E46450100000000001000
      0000494E445F434F4E54494E47454E4349410100000000000B000000434F445F
      5553554152494F0100000000000E000000444553435F50524F544F434F4C4F01
      000000000018000000444553435F494E5343524943414F5F4D554E4943495041
      4C0100000000000F000000434F445F494247455F434944414445010000000000}
    ReadOnly = True
    RefreshOptions = [roBeforeEdit, roAllFields]
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    BeforeOpen = QNfeLoteConsBeforeOpen
    AfterOpen = QNfeLoteConsAfterOpen
    BeforeClose = QNfeLoteConsBeforeClose
    OnCalcFields = QNfeLoteConsCalcFields
    Left = 40
    Top = 163
    object FloatField1: TFloatField
      FieldName = 'ID_LOTE'
      Required = True
    end
    object IntegerField1: TIntegerField
      FieldName = 'IND_SITUACAO'
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DT_CRIACAO'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'DT_ENVIO'
    end
    object IntegerField2: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'DESC_REPOSITORIO_NFE'
      Size = 60
    end
    object IntegerField3: TIntegerField
      FieldName = 'COD_UF_IBGE'
    end
    object StringField2: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
    object StringField3: TStringField
      FieldName = 'CGC_FILIAL'
      Size = 18
    end
    object FloatField2: TFloatField
      FieldName = 'CONT_SELECIONADO'
    end
    object StringField4: TStringField
      FieldName = 'DESC_IMPRESSORA_DANFE'
      Size = 200
    end
    object FloatField3: TFloatField
      FieldName = 'IND_CONTINGENCIA'
    end
    object StringField5: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_situacao'
      Calculated = True
    end
    object StringField6: TStringField
      FieldName = 'DESC_PROTOCOLO'
      Size = 50
    end
    object StringField7: TStringField
      FieldName = 'DESC_INSCRICAO_MUNICIPAL'
      Size = 15
    end
    object StringField8: TStringField
      FieldName = 'COD_IBGE_CIDADE'
      Size = 45
    end
    object FloatField4: TFloatField
      FieldName = 'COD_USUARIO'
    end
  end
end
