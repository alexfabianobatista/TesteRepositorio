object DMMdfeLote: TDMMdfeLote
  OldCreateOrder = False
  Left = 704
  Top = 167
  Height = 270
  Width = 241
  object QMdfeLote: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  L.ROWID,'
      '  L.*'
      'FROM'
      '  TB_MDFE_LOTE L'
      'WHERE'
      '  L.ID_LOTE = :PK')
    Variables.Data = {0300000001000000030000003A504B050000000000000000000000}
    SequenceField.Field = 'ID_LOTE'
    SequenceField.Sequence = 'SQLOTE_MDFE'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      04000000060000000700000049445F4C4F54450100000000000C000000494E44
      5F534954554143414F0100000000000A00000044545F4352494143414F010000
      0000000800000044545F454E56494F0100000000000A000000434F445F46494C
      49414C0100000000000A0000004E554D5F52454349424F010000000000}
    RefreshOptions = [roBeforeEdit, roAllFields]
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    AfterInsert = QMdfeLoteAfterInsert
    Left = 40
    Top = 8
    object QMdfeLoteID_LOTE: TFloatField
      FieldName = 'ID_LOTE'
      Required = True
    end
    object QMdfeLoteIND_SITUACAO: TIntegerField
      FieldName = 'IND_SITUACAO'
    end
    object QMdfeLoteDT_CRIACAO: TDateTimeField
      FieldName = 'DT_CRIACAO'
    end
    object QMdfeLoteDT_ENVIO: TDateTimeField
      FieldName = 'DT_ENVIO'
    end
    object QMdfeLoteCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QMdfeLoteNUM_RECIBO: TFloatField
      FieldName = 'NUM_RECIBO'
    end
  end
  object QMdfeLoteCons: TOracleDataSet1
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
      '  E.COD_UF_IBGE,'
      '  0 AS CONT_SELECIONADO,'
      '  U.COD_USUARIO,'
      '  U.DESC_IMPRESSORA_DACTE'
      'FROM'
      '  TB_MDFE_LOTE L'
      'LEFT JOIN'
      '  TB_FILIAL F'
      'ON'
      '  L.COD_FILIAL = F.COD_FILIAL'
      'LEFT JOIN'
      '  TB_ESTADO E'
      'ON'
      '  F.COD_ESTADO = E.COD_ESTADO'
      'LEFT JOIN'
      '  TB_MDFE MDFE'
      'ON'
      '  MDFE.ID_LOTE = L.ID_LOTE'
      'LEFT JOIN'
      '  TB_MANIFESTO CT'
      'ON'
      '  MDFE.COD_MANIFESTO = CT.COD_MANIFESTO'
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
      '  (:COD_MANIFESTO IS NULL OR CT.COD_MANIFESTO = :COD_MANIFESTO)'
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
      494F5F460C00000000000000000000000E0000003A434F445F4D414E49464553
      544F0300000004000000EA93000000000000090000003A534954554143414F03
      0000000000000000000000080000003A5553554152494F030000000000000000
      000000070000003A46494C49414C03000000040000000200000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000C0000000700000049445F4C4F54450100000000000C000000494E44
      5F534954554143414F0100000000000A00000044545F4352494143414F010000
      0000000800000044545F454E56494F0100000000000A000000434F445F46494C
      49414C01000000000014000000444553435F5245504F5349544F52494F5F4E46
      450100000000000B000000434F445F55465F494247450100000000000B000000
      444553435F46494C49414C0100000000000A0000004347435F46494C49414C01
      000000000010000000434F4E545F53454C4543494F4E41444F0100000000000B
      000000434F445F5553554152494F01000000000015000000444553435F494D50
      524553534F52415F4441435445010000000000}
    ReadOnly = True
    RefreshOptions = [roBeforeEdit, roAllFields]
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    BeforeOpen = QMdfeLoteConsBeforeOpen
    AfterOpen = QMdfeLoteConsAfterOpen
    BeforeClose = QMdfeLoteConsBeforeClose
    OnCalcFields = QMdfeLoteConsCalcFields
    Left = 40
    Top = 56
    object QMdfeLoteConsdesc_situacao: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_situacao'
      Calculated = True
    end
    object QMdfeLoteConscod_uf_ibge_envio: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'cod_uf_ibge_envio'
      Calculated = True
    end
    object QMdfeLoteConsID_LOTE: TFloatField
      FieldName = 'ID_LOTE'
      Required = True
    end
    object QMdfeLoteConsIND_SITUACAO: TIntegerField
      FieldName = 'IND_SITUACAO'
    end
    object QMdfeLoteConsDT_CRIACAO: TDateTimeField
      FieldName = 'DT_CRIACAO'
    end
    object QMdfeLoteConsDT_ENVIO: TDateTimeField
      FieldName = 'DT_ENVIO'
    end
    object QMdfeLoteConsCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QMdfeLoteConsDESC_REPOSITORIO_NFE: TStringField
      FieldName = 'DESC_REPOSITORIO_NFE'
      Size = 60
    end
    object QMdfeLoteConsDESC_FILIAL: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
    object QMdfeLoteConsCGC_FILIAL: TStringField
      FieldName = 'CGC_FILIAL'
      Size = 18
    end
    object QMdfeLoteConsCOD_UF_IBGE: TIntegerField
      FieldName = 'COD_UF_IBGE'
    end
    object QMdfeLoteConsCONT_SELECIONADO: TFloatField
      FieldName = 'CONT_SELECIONADO'
    end
    object QMdfeLoteConsCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
    object QMdfeLoteConsDESC_IMPRESSORA_DACTE: TStringField
      FieldName = 'DESC_IMPRESSORA_DACTE'
      Size = 100
    end
  end
  object QMdfeLoteItemCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  MDFE.ID_LOTE,'
      '  MDFE.DESC_CHAVE_ACESSO,'
      '  MDFE.DESC_MSG_CANCELAMENTO,'
      '  MDFE.DESC_MSG_VALIDACAO,'
      '  MDFE.DESC_MSG_VALIDACAO_LOTE,'
      '  MDFE.DESC_PROT_AUTORIZACAO,'
      '  MDFE.DESC_PROT_CANCELAMENTO,'
      '  MDFE.DESC_RETORNO_CANCELAMENTO,'
      '  MDFE.DESC_RETORNO_PROCESSAMENTO,'
      '  MDFE.DESC_RETORNO_ENCERRAMENTO,'
      '  MDFE.DESC_XML_MDFE,'
      '  MDFE.DESC_XML_RETORNO,'
      
        '  DECODE(MDFE.DESC_RETORNO_CANCELAMENTO, '#39'101'#39', MDFE.DESC_RETORN' +
        'O_CANCELAMENTO,'
      '      MDFE.DESC_RETORNO_PROCESSAMENTO) AS STATUS,'
      '  MT.DT_EMISSAO,'
      '  MT.COD_SERIE,'
      '  MT.COD_MANIFESTO,'
      '  MT.NUM_MANIFESTO,'
      '  MT.IND_AMBIENTE_MDFE,'
      '  '#39'N'#39' AS EMAIL_XML,'
      '  '#39'N'#39' AS EMAIL_PDF,'
      '  '#39'N'#39' AS IND_SELECIONADO,'
      '  F.NUM_VIAS_DAMDFE,'
      '  U.DESC_IMPRESSORA_DACTE,'
      '  NULL AS DESC_EMAIL,'
      '  ENCERRAMENTO.DESC_XML_RETORNO XML_RETORNO_ENCERRAMENTO,'
      '  ENCERRAMENTO.DESC_XML_EVENTO XML_EVENTO_ENCERRAMENTO'
      'FROM'
      '  TB_MDFE MDFE'
      'LEFT JOIN'
      '  TB_MANIFESTO MT'
      'ON'
      '  MDFE.COD_MANIFESTO = MT.COD_MANIFESTO'
      'LEFT JOIN'
      '  TB_MDFE_LOTE MDFEL'
      'ON'
      '  MDFE.ID_LOTE = MDFEL.ID_LOTE'
      'LEFT JOIN'
      '  TB_MDFE_EVENTO ENCERRAMENTO'
      'ON'
      
        '  ENCERRAMENTO.DESC_CHAVE_ACESSO = MDFE.DESC_CHAVE_ACESSO AND EN' +
        'CERRAMENTO.TP_EVENTO = 110112'
      'LEFT JOIN'
      '  TB_FILIAL F'
      'ON'
      '  MDFEL.COD_FILIAL = F.COD_FILIAL'
      'LEFT JOIN'
      '  TB_USUARIO U'
      'ON'
      '  (:COD_USUARIO = U.COD_USUARIO)'
      'WHERE'
      '  MDFE.ID_LOTE = :ID_LOTE')
    Variables.Data = {
      0300000002000000080000003A49445F4C4F5445030000000000000000000000
      0C0000003A434F445F5553554152494F030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001A0000000700000049445F4C4F544501000000000011000000444553
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
      414D454E544F01000000000010000000444553435F584D4C5F5245544F524E4F
      00000000000015000000444553435F494D50524553534F52415F444143544501
      00000000000D000000444553435F584D4C5F4D4446450000000000000D000000
      434F445F4D414E49464553544F0100000000000D0000004E554D5F4D414E4946
      4553544F01000000000011000000494E445F414D4249454E54455F4D44464501
      00000000000F0000004E554D5F564941535F44414D4446450100000000000A00
      0000444553435F454D41494C01000000000019000000444553435F5245544F52
      4E4F5F454E43455252414D454E544F01000000000018000000584D4C5F524554
      4F524E4F5F454E43455252414D454E544F00000000000017000000584D4C5F45
      56454E544F5F454E43455252414D454E544F000000000000}
    Master = QMdfeLoteCons
    MasterFields = 'ID_LOTE'
    DetailFields = 'ID_LOTE'
    ReadOnly = True
    RefreshOptions = [roBeforeEdit, roAllFields]
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    BeforeOpen = QMdfeLoteItemConsBeforeOpen
    Left = 144
    Top = 56
    object QMdfeLoteItemConsID_LOTE: TFloatField
      FieldName = 'ID_LOTE'
    end
    object QMdfeLoteItemConsDESC_CHAVE_ACESSO: TStringField
      FieldName = 'DESC_CHAVE_ACESSO'
      Required = True
      Size = 44
    end
    object QMdfeLoteItemConsDESC_MSG_CANCELAMENTO: TStringField
      FieldName = 'DESC_MSG_CANCELAMENTO'
      Size = 200
    end
    object QMdfeLoteItemConsDESC_MSG_VALIDACAO: TMemoField
      FieldName = 'DESC_MSG_VALIDACAO'
      BlobType = ftOraClob
    end
    object QMdfeLoteItemConsDESC_MSG_VALIDACAO_LOTE: TMemoField
      FieldName = 'DESC_MSG_VALIDACAO_LOTE'
      BlobType = ftOraClob
    end
    object QMdfeLoteItemConsDESC_PROT_AUTORIZACAO: TStringField
      FieldName = 'DESC_PROT_AUTORIZACAO'
      Size = 15
    end
    object QMdfeLoteItemConsDESC_PROT_CANCELAMENTO: TStringField
      FieldName = 'DESC_PROT_CANCELAMENTO'
      Size = 15
    end
    object QMdfeLoteItemConsDESC_RETORNO_CANCELAMENTO: TStringField
      FieldName = 'DESC_RETORNO_CANCELAMENTO'
      Size = 4
    end
    object QMdfeLoteItemConsDESC_RETORNO_PROCESSAMENTO: TStringField
      FieldName = 'DESC_RETORNO_PROCESSAMENTO'
      Size = 4
    end
    object QMdfeLoteItemConsDESC_XML_RETORNO: TMemoField
      FieldName = 'DESC_XML_RETORNO'
      BlobType = ftOraClob
    end
    object QMdfeLoteItemConsSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 4
    end
    object QMdfeLoteItemConsDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
    object QMdfeLoteItemConsCOD_SERIE: TStringField
      FieldName = 'COD_SERIE'
      Size = 3
    end
    object QMdfeLoteItemConsEMAIL_XML: TStringField
      FieldName = 'EMAIL_XML'
      Size = 1
    end
    object QMdfeLoteItemConsEMAIL_PDF: TStringField
      FieldName = 'EMAIL_PDF'
      Size = 1
    end
    object QMdfeLoteItemConsIND_SELECIONADO: TStringField
      FieldName = 'IND_SELECIONADO'
      Size = 1
    end
    object QMdfeLoteItemConsDESC_IMPRESSORA_DACTE: TStringField
      FieldName = 'DESC_IMPRESSORA_DACTE'
      Size = 100
    end
    object QMdfeLoteItemConsDESC_XML_MDFE: TMemoField
      FieldName = 'DESC_XML_MDFE'
      Required = True
      BlobType = ftOraClob
    end
    object QMdfeLoteItemConsCOD_MANIFESTO: TIntegerField
      FieldName = 'COD_MANIFESTO'
    end
    object QMdfeLoteItemConsNUM_MANIFESTO: TIntegerField
      FieldName = 'NUM_MANIFESTO'
    end
    object QMdfeLoteItemConsIND_AMBIENTE_MDFE: TIntegerField
      FieldName = 'IND_AMBIENTE_MDFE'
    end
    object QMdfeLoteItemConsNUM_VIAS_DAMDFE: TIntegerField
      FieldName = 'NUM_VIAS_DAMDFE'
    end
    object QMdfeLoteItemConsDESC_EMAIL: TStringField
      FieldName = 'DESC_EMAIL'
      Size = 160
    end
    object QMdfeLoteItemConsDESC_RETORNO_ENCERRAMENTO: TStringField
      FieldName = 'DESC_RETORNO_ENCERRAMENTO'
      Size = 4
    end
    object QMdfeLoteItemConsXML_RETORNO_ENCERRAMENTO: TMemoField
      FieldName = 'XML_RETORNO_ENCERRAMENTO'
      BlobType = ftOraClob
    end
    object QMdfeLoteItemConsXML_EVENTO_ENCERRAMENTO: TMemoField
      FieldName = 'XML_EVENTO_ENCERRAMENTO'
      BlobType = ftOraClob
    end
  end
  object QMdfeLoteItem: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  MDFE.ROWID,'
      '  MDFE.ID_LOTE,'
      '  MDFE.DESC_CHAVE_ACESSO,'
      '  MDFE.COD_FILIAL,'
      '  MDFE.DESC_SERIE,'
      '  MDFE.NUM_MDFE,'
      '  MDFE.DESC_XML_MDFE,'
      '  MDFE.IND_AMBIENTE_MDFE,'
      '  MDFE.COD_MANIFESTO'
      'FROM'
      '  TB_MDFE MDFE'
      'WHERE'
      '  (:ID_LOTE IS NULL OR MDFE.ID_LOTE = :ID_LOTE)'
      'AND'
      
        '  (:COD_MANIFESTO IS NULL OR MDFE.COD_MANIFESTO = :COD_MANIFESTO' +
        ')'
      '')
    Variables.Data = {
      0300000002000000080000003A49445F4C4F5445030000000000000000000000
      0E0000003A434F445F4D414E49464553544F030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000080000000700000049445F4C4F544501000000000011000000444553
      435F43484156455F41434553534F0100000000000A000000434F445F46494C49
      414C0100000000000A000000444553435F534552494501000000000008000000
      4E554D5F4D4446450100000000000D000000444553435F584D4C5F4D44464500
      000000000011000000494E445F414D4249454E54455F4D444645010000000000
      0D000000434F445F4D414E49464553544F010000000000}
    RefreshOptions = [roBeforeEdit, roAllFields]
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 144
    Top = 8
    object QMdfeLoteItemID_LOTE: TFloatField
      FieldName = 'ID_LOTE'
    end
    object QMdfeLoteItemDESC_CHAVE_ACESSO: TStringField
      FieldName = 'DESC_CHAVE_ACESSO'
      Required = True
      Size = 44
    end
    object QMdfeLoteItemCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QMdfeLoteItemDESC_SERIE: TStringField
      FieldName = 'DESC_SERIE'
      Required = True
      Size = 3
    end
    object QMdfeLoteItemNUM_MDFE: TIntegerField
      FieldName = 'NUM_MDFE'
      Required = True
    end
    object QMdfeLoteItemDESC_XML_MDFE: TMemoField
      FieldName = 'DESC_XML_MDFE'
      Required = True
      BlobType = ftOraClob
    end
    object QMdfeLoteItemIND_AMBIENTE_MDFE: TIntegerField
      FieldName = 'IND_AMBIENTE_MDFE'
    end
    object QMdfeLoteItemCOD_MANIFESTO: TIntegerField
      FieldName = 'COD_MANIFESTO'
    end
  end
  object CDSMdfeLoteItemCons: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_LOTE'
    MasterFields = 'ID_LOTE'
    MasterSource = DSMdfeLoteCons
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
    ProviderName = 'DSPMdfeLoteItemCons'
    AfterOpen = CDSMdfeLoteItemConsAfterOpen
    AfterInsert = CDSMdfeLoteItemConsAfterInsert
    OnCalcFields = CDSMdfeLoteItemConsCalcFields
    Left = 136
    Top = 168
    object CDSMdfeLoteItemConsdesc_tipo_nota: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_tipo_nota'
      Size = 10
      Calculated = True
    end
    object CDSMdfeLoteItemConsretorno_sefaz: TStringField
      FieldKind = fkCalculated
      FieldName = 'retorno_sefaz'
      Size = 150
      Calculated = True
    end
    object CDSMdfeLoteItemConsdesc_assunto_email: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_assunto_email'
      Size = 50
      Calculated = True
    end
    object CDSMdfeLoteItemConsdesc_corpo_email: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_corpo_email'
      Size = 300
      Calculated = True
    end
    object CDSMdfeLoteItemConsdesc_anexo_email: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_anexo_email'
      Size = 50
      Calculated = True
    end
    object CDSMdfeLoteItemConsind_autorizado: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'ind_autorizado'
      Calculated = True
    end
    object CDSMdfeLoteItemConsind_cancelado: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'ind_cancelado'
      Calculated = True
    end
    object CDSMdfeLoteItemConsind_denegado: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'ind_denegado'
      Calculated = True
    end
    object CDSMdfeLoteItemConsind_pendente: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'ind_pendente'
      Calculated = True
    end
    object CDSMdfeLoteItemConsID_LOTE: TFloatField
      FieldName = 'ID_LOTE'
    end
    object CDSMdfeLoteItemConsDESC_CHAVE_ACESSO: TStringField
      FieldName = 'DESC_CHAVE_ACESSO'
      Required = True
      Size = 44
    end
    object CDSMdfeLoteItemConsDESC_MSG_CANCELAMENTO: TStringField
      FieldName = 'DESC_MSG_CANCELAMENTO'
      Size = 200
    end
    object CDSMdfeLoteItemConsDESC_MSG_VALIDACAO: TMemoField
      FieldName = 'DESC_MSG_VALIDACAO'
      BlobType = ftOraClob
    end
    object CDSMdfeLoteItemConsDESC_MSG_VALIDACAO_LOTE: TMemoField
      FieldName = 'DESC_MSG_VALIDACAO_LOTE'
      BlobType = ftOraClob
    end
    object CDSMdfeLoteItemConsDESC_PROT_AUTORIZACAO: TStringField
      FieldName = 'DESC_PROT_AUTORIZACAO'
      Size = 15
    end
    object CDSMdfeLoteItemConsDESC_PROT_CANCELAMENTO: TStringField
      FieldName = 'DESC_PROT_CANCELAMENTO'
      Size = 15
    end
    object CDSMdfeLoteItemConsDESC_RETORNO_CANCELAMENTO: TStringField
      FieldName = 'DESC_RETORNO_CANCELAMENTO'
      Size = 4
    end
    object CDSMdfeLoteItemConsDESC_RETORNO_PROCESSAMENTO: TStringField
      FieldName = 'DESC_RETORNO_PROCESSAMENTO'
      Size = 4
    end
    object CDSMdfeLoteItemConsDESC_XML_RETORNO: TMemoField
      FieldName = 'DESC_XML_RETORNO'
      BlobType = ftOraClob
    end
    object CDSMdfeLoteItemConsSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 4
    end
    object CDSMdfeLoteItemConsDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
    object CDSMdfeLoteItemConsCOD_SERIE: TStringField
      FieldName = 'COD_SERIE'
      Size = 3
    end
    object CDSMdfeLoteItemConsEMAIL_XML: TStringField
      FieldName = 'EMAIL_XML'
      Size = 1
    end
    object CDSMdfeLoteItemConsEMAIL_PDF: TStringField
      FieldName = 'EMAIL_PDF'
      Size = 1
    end
    object CDSMdfeLoteItemConsIND_SELECIONADO: TStringField
      FieldName = 'IND_SELECIONADO'
      Size = 1
    end
    object CDSMdfeLoteItemConsDESC_IMPRESSORA_DACTE: TStringField
      FieldName = 'DESC_IMPRESSORA_DACTE'
      Size = 100
    end
    object CDSMdfeLoteItemConsDESC_XML_MDFE: TMemoField
      FieldName = 'DESC_XML_MDFE'
      Required = True
      BlobType = ftOraClob
    end
    object CDSMdfeLoteItemConsCOD_MANIFESTO: TIntegerField
      FieldName = 'COD_MANIFESTO'
    end
    object CDSMdfeLoteItemConsNUM_MANIFESTO: TIntegerField
      FieldName = 'NUM_MANIFESTO'
    end
    object CDSMdfeLoteItemConsIND_AMBIENTE_MDFE: TIntegerField
      FieldName = 'IND_AMBIENTE_MDFE'
    end
    object CDSMdfeLoteItemConsNUM_VIAS_DAMDFE: TIntegerField
      FieldName = 'NUM_VIAS_DAMDFE'
    end
    object CDSMdfeLoteItemConsDESC_EMAIL: TStringField
      FieldName = 'DESC_EMAIL'
      Size = 160
    end
    object CDSMdfeLoteItemConsind_encerrado: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'ind_encerrado'
      Calculated = True
    end
    object CDSMdfeLoteItemConsDESC_RETORNO_ENCERRAMENTO: TStringField
      FieldName = 'DESC_RETORNO_ENCERRAMENTO'
      Size = 4
    end
    object CDSMdfeLoteItemConsXML_RETORNO_ENCERRAMENTO: TMemoField
      FieldName = 'XML_RETORNO_ENCERRAMENTO'
      BlobType = ftOraClob
    end
    object CDSMdfeLoteItemConsXML_EVENTO_ENCERRAMENTO: TMemoField
      FieldName = 'XML_EVENTO_ENCERRAMENTO'
      BlobType = ftOraClob
    end
  end
  object DSPMdfeLoteItemCons: TDataSetProvider
    DataSet = QMdfeLoteItemCons
    Left = 152
    Top = 104
  end
  object DSMdfeLoteCons: TDataSource
    DataSet = QMdfeLoteCons
    Left = 40
    Top = 104
  end
end
