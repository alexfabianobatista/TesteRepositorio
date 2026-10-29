object DMReinf: TDMReinf
  OldCreateOrder = False
  Left = 194
  Top = 88
  Height = 630
  Width = 1140
  object QRegistrosReinf: TOracleDataSet1
    SQL.Strings = (
      'SELECT '
      ' ROWID, '
      ' TB_REINF_PERIODO.*'
      'FROM'
      ' TB_REINF_PERIODO'
      'WHERE '
      ' TB_REINF_PERIODO.DT_INI_EVENTO > '#39'01/07/2021'#39
      'AND'
      '(:DT_GERACAO IS NULL '
      'OR'
      'TB_REINF_PERIODO.DT_GERACAO_REINF > :DT_GERACAO) ')
    Variables.Data = {
      03000000010000000B0000003A44545F4745524143414F0C0000000000000000
      000000}
    SequenceField.Field = 'COD_REINF_PERIODO'
    SequenceField.Sequence = 'SQREINF_PERIODO'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000001100000011000000434F445F5245494E465F504552494F444F010000
      00000011000000444553435F4556454E544F5F5245494E460100000000001000
      0000434F445F4556454E544F5F5245494E460100000000000A000000434F445F
      46494C49414C0100000000000D00000044545F494E495F4556454E544F010000
      0000000D00000044545F46494D5F4556454E544F0100000000000B0000004445
      53435F584D4C5F49440100000000000F000000444553435F584D4C5F4556454E
      544F00000000000013000000444553435F434F445F4552524F5F454E56494F01
      000000000010000000444553435F4D53475F5245544F524E4F01000000000013
      000000444553435F584D4C5F49445F5245544F524E4F01000000000010000000
      444553435F584D4C5F5245544F524E4F00000000000015000000444553435F58
      4D4C5F484153485F5245544F524E4F01000000000012000000444553435F584D
      4C5F50524F544F434F4C4F0100000000001000000044545F4745524143414F5F
      5245494E460100000000000C000000494E445F534954554143414F0100000000
      000B000000434F445F5553554152494F010000000000}
    Session = DMOracle.DBCemapa
    Left = 48
    Top = 32
    object QRegistrosReinfCOD_REINF_PERIODO: TIntegerField
      FieldName = 'COD_REINF_PERIODO'
      Required = True
    end
    object QRegistrosReinfDESC_EVENTO_REINF: TStringField
      FieldName = 'DESC_EVENTO_REINF'
      Required = True
      Size = 6
    end
    object QRegistrosReinfCOD_EVENTO_REINF: TIntegerField
      FieldName = 'COD_EVENTO_REINF'
      Required = True
    end
    object QRegistrosReinfCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
    end
    object QRegistrosReinfDT_INI_EVENTO: TDateTimeField
      FieldName = 'DT_INI_EVENTO'
    end
    object QRegistrosReinfDT_FIM_EVENTO: TDateTimeField
      FieldName = 'DT_FIM_EVENTO'
    end
    object QRegistrosReinfDESC_XML_ID: TStringField
      FieldName = 'DESC_XML_ID'
      Size = 40
    end
    object QRegistrosReinfDESC_XML_EVENTO: TMemoField
      FieldName = 'DESC_XML_EVENTO'
      BlobType = ftOraClob
    end
    object QRegistrosReinfDESC_COD_ERRO_ENVIO: TStringField
      FieldName = 'DESC_COD_ERRO_ENVIO'
      Size = 10
    end
    object QRegistrosReinfDESC_XML_ID_RETORNO: TStringField
      FieldName = 'DESC_XML_ID_RETORNO'
      Size = 40
    end
    object QRegistrosReinfDESC_XML_RETORNO: TMemoField
      FieldName = 'DESC_XML_RETORNO'
      BlobType = ftOraClob
    end
    object QRegistrosReinfDESC_XML_HASH_RETORNO: TStringField
      FieldName = 'DESC_XML_HASH_RETORNO'
      Size = 50
    end
    object QRegistrosReinfDESC_XML_PROTOCOLO: TStringField
      FieldName = 'DESC_XML_PROTOCOLO'
      Size = 30
    end
    object QRegistrosReinfDT_GERACAO_REINF: TDateTimeField
      FieldName = 'DT_GERACAO_REINF'
    end
    object QRegistrosReinfIND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Size = 10
    end
    object QRegistrosReinfCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
    object QRegistrosReinfDESC_MSG_RETORNO: TMemoField
      FieldName = 'DESC_MSG_RETORNO'
      BlobType = ftOraClob
    end
  end
  object QDadosEmpresa: TOracleDataSet1
    SQL.Strings = (
      'SELECT '
      '    '#39'1'#39' AS TPINSC,'
      '    LIMPA_CNPJ(F.NUM_CGC) AS NRINSC,'
      
        '    DECODE(F.IND_REGIME_TRIBUTARIO, 3, '#39'1'#39', '#39'0'#39') AS INDESCRITURA' +
        'CAO,'
      '    CAD.NOME AS NMCTT,'
      '    CAD.NUM_CGC_CPF AS CPFCTT,'
      '    CAD.DESC_TELEFONE AS FONEFIXO,'
      '    CAD.DESC_CELULAR AS FONECEL,'
      '    CAD.DESC_E_MAIL AS EMAIL'
      'FROM'
      '    TB_FILIAL F, TB_CADASTRO CAD'
      'WHERE'
      '    F.COD_CADASTRO_RESPONSAVEL = CAD.COD_CADASTRO'
      'AND'
      '    F.COD_FILIAL = :COD_FILIAL'
      '')
    Variables.Data = {
      03000000010000000B0000003A434F445F46494C49414C030000000000000000
      000000}
    QBEDefinition.QBEFieldDefs = {
      0400000008000000060000005450494E5343010000000000060000004E52494E
      53430100000000000F000000494E4445534352495455524143414F0100000000
      00050000004E4D43545401000000000006000000435046435454010000000000
      08000000464F4E454649584F01000000000007000000464F4E4543454C010000
      00000005000000454D41494C010000000000}
    Session = DMOracle.DBCemapa
    Left = 144
    Top = 408
    object QDadosEmpresaTPINSC: TStringField
      FieldName = 'TPINSC'
      Size = 1
    end
    object QDadosEmpresaNRINSC: TStringField
      FieldName = 'NRINSC'
      Size = 4000
    end
    object QDadosEmpresaINDESCRITURACAO: TStringField
      FieldName = 'INDESCRITURACAO'
      Size = 1
    end
    object QDadosEmpresaNMCTT: TStringField
      FieldName = 'NMCTT'
      Required = True
      Size = 60
    end
    object QDadosEmpresaCPFCTT: TStringField
      FieldName = 'CPFCTT'
      Size = 18
    end
    object QDadosEmpresaFONEFIXO: TStringField
      FieldName = 'FONEFIXO'
      Size = 15
    end
    object QDadosEmpresaFONECEL: TStringField
      FieldName = 'FONECEL'
      Size = 15
    end
    object QDadosEmpresaEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 70
    end
  end
  object DSRegistrosReinf: TDataSource
    DataSet = QRegistrosReinf
    Left = 48
    Top = 88
  end
  object DSDadosEmpresa: TDataSource
    DataSet = QDadosEmpresa
    Left = 152
    Top = 456
  end
  object QReinfPeriodo: TOracleDataSet1
    SQL.Strings = (
      'select rowid,'
      '    tb_reinf_periodo.*'
      'from '
      'tb_reinf_periodo'
      'where'
      '(:dt_inicio_evento is null'
      'or'
      
        'trunc(to_date(tb_reinf_periodo.dt_ini_evento)) = :dt_inicio_even' +
        'to)'
      'or'
      '(:dt_fim_evento is null'
      'or'
      'trunc(to_date(tb_reinf_periodo.dt_fim_evento))= :dt_fim_evento)'
      'order by'
      'dt_ini_evento,'
      'desc_evento_reinf,'
      'cod_reinf_periodo'
      '')
    Variables.Data = {
      0300000002000000110000003A44545F494E4943494F5F4556454E544F0C0000
      0000000000000000000E0000003A44545F46494D5F4556454E544F0C00000000
      00000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001100000011000000434F445F5245494E465F504552494F444F010000
      00000011000000444553435F4556454E544F5F5245494E460100000000000A00
      0000434F445F46494C49414C0100000000000D00000044545F494E495F455645
      4E544F0100000000000D00000044545F46494D5F4556454E544F010000000000
      0B000000444553435F584D4C5F49440100000000000F000000444553435F584D
      4C5F4556454E544F00000000000013000000444553435F434F445F4552524F5F
      454E56494F01000000000010000000444553435F4D53475F5245544F524E4F01
      000000000013000000444553435F584D4C5F49445F5245544F524E4F01000000
      000010000000444553435F584D4C5F5245544F524E4F00000000000015000000
      444553435F584D4C5F484153485F5245544F524E4F0100000000001200000044
      4553435F584D4C5F50524F544F434F4C4F0100000000001000000044545F4745
      524143414F5F5245494E460100000000000B000000434F445F5553554152494F
      01000000000010000000434F445F4556454E544F5F5245494E46010000000000
      0C000000494E445F534954554143414F010000000000}
    Session = DMOracle.DBCemapa
    Left = 48
    Top = 136
    object QReinfPeriodoCOD_REINF_PERIODO: TIntegerField
      FieldName = 'COD_REINF_PERIODO'
      Required = True
    end
    object QReinfPeriodoDESC_EVENTO_REINF: TStringField
      FieldName = 'DESC_EVENTO_REINF'
      Required = True
      Size = 6
    end
    object QReinfPeriodoCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
    end
    object QReinfPeriodoDT_INI_EVENTO: TDateTimeField
      FieldName = 'DT_INI_EVENTO'
    end
    object QReinfPeriodoDT_FIM_EVENTO: TDateTimeField
      FieldName = 'DT_FIM_EVENTO'
    end
    object QReinfPeriodoDESC_XML_ID: TStringField
      FieldName = 'DESC_XML_ID'
      Size = 40
    end
    object QReinfPeriodoDESC_XML_EVENTO: TMemoField
      FieldName = 'DESC_XML_EVENTO'
      BlobType = ftOraClob
    end
    object QReinfPeriodoDESC_COD_ERRO_ENVIO: TStringField
      FieldName = 'DESC_COD_ERRO_ENVIO'
      Size = 10
    end
    object QReinfPeriodoDESC_XML_ID_RETORNO: TStringField
      FieldName = 'DESC_XML_ID_RETORNO'
      Size = 40
    end
    object QReinfPeriodoDESC_XML_RETORNO: TMemoField
      FieldName = 'DESC_XML_RETORNO'
      BlobType = ftOraClob
    end
    object QReinfPeriodoDESC_XML_HASH_RETORNO: TStringField
      FieldName = 'DESC_XML_HASH_RETORNO'
      Size = 50
    end
    object QReinfPeriodoDESC_XML_PROTOCOLO: TStringField
      FieldName = 'DESC_XML_PROTOCOLO'
      Size = 30
    end
    object QReinfPeriodoDT_GERACAO_REINF: TDateTimeField
      FieldName = 'DT_GERACAO_REINF'
    end
    object QReinfPeriodoCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
    object QReinfPeriodoCOD_EVENTO_REINF: TIntegerField
      FieldName = 'COD_EVENTO_REINF'
      Required = True
    end
    object QReinfPeriodoIND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Size = 10
    end
    object QReinfPeriodoDESC_MSG_RETORNO: TMemoField
      FieldName = 'DESC_MSG_RETORNO'
      BlobType = ftOraClob
    end
  end
  object DSReinfPeriodo: TDataSource
    DataSet = QReinfPeriodo
    Left = 48
    Top = 192
  end
  object QReinfR1000: TOracleDataSet1
    SQL.Strings = (
      'select '
      '    rowid,'
      '    TB_REINF_R1000.*'
      'FROM'
      '    TB_REINF_R1000'
      'where'
      '(:DT_INICIO is null'
      'or '
      'TB_REINF_R1000.DT_INI_VALIDADE = :DT_INICIO)'
      'and'
      '(:PK IS NULL'
      'OR'
      'TB_REINF_R1000.COD_REINF_R1000 = :PK)')
    Variables.Data = {
      03000000020000000A0000003A44545F494E4943494F0C000000000000000000
      0000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_REINF_R1000'
    SequenceField.Sequence = 'SQREINF_R1000'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000E0000000F000000434F445F5245494E465F52313030300100000000
      0018000000494E445F50524F445543414F5F484F4D4F4C4F474143414F010000
      00000013000000494E445F5449504F5F41504C4943415449564F010000000000
      0A000000434F445F46494C49414C0100000000000C000000434F445F43414441
      5354524F0100000000000F000000494E445F494E435F414C545F455843010000
      0000000F00000044545F494E495F56414C49444144450100000000000F000000
      44545F46494D5F56414C494441444501000000000007000000494E445F454344
      01000000000015000000494E445F4445534F4E45524143414F5F464F4C484101
      000000000010000000494E445F41434F52444F5F4D554C544101000000000017
      000000494E445F5349545F504553534F415F4A55524944494341010000000000
      0B000000434F445F5553554152494F0100000000001C000000434F445F434C41
      5353494649434143414F5F54524942555441524941010000000000}
    Session = DMOracle.DBCemapa
    Left = 152
    Top = 32
    object QReinfR1000COD_REINF_R1000: TIntegerField
      FieldName = 'COD_REINF_R1000'
      Required = True
    end
    object QReinfR1000IND_PRODUCAO_HOMOLOGACAO: TIntegerField
      FieldName = 'IND_PRODUCAO_HOMOLOGACAO'
    end
    object QReinfR1000IND_TIPO_APLICATIVO: TIntegerField
      FieldName = 'IND_TIPO_APLICATIVO'
    end
    object QReinfR1000COD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QReinfR1000COD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QReinfR1000IND_INC_ALT_EXC: TIntegerField
      FieldName = 'IND_INC_ALT_EXC'
    end
    object QReinfR1000DT_INI_VALIDADE: TDateTimeField
      FieldName = 'DT_INI_VALIDADE'
    end
    object QReinfR1000DT_FIM_VALIDADE: TDateTimeField
      FieldName = 'DT_FIM_VALIDADE'
    end
    object QReinfR1000COD_CLASSIFICACAO_TRIBUTARIA: TIntegerField
      FieldName = 'COD_CLASSIFICACAO_TRIBUTARIA'
    end
    object QReinfR1000IND_ECD: TIntegerField
      FieldName = 'IND_ECD'
    end
    object QReinfR1000IND_DESONERACAO_FOLHA: TIntegerField
      FieldName = 'IND_DESONERACAO_FOLHA'
    end
    object QReinfR1000IND_ACORDO_MULTA: TIntegerField
      FieldName = 'IND_ACORDO_MULTA'
    end
    object QReinfR1000IND_SIT_PESSOA_JURIDICA: TIntegerField
      FieldName = 'IND_SIT_PESSOA_JURIDICA'
    end
    object QReinfR1000COD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
  end
  object QClassificacaoTributaria: TOracleDataSet1
    SQL.Strings = (
      'SELECT * '
      'FROM '
      '    TB_CLASSIFICACAO_TRIBUTARIA '
      'ORDER BY '
      '    COD_CLASSIFICACAO_TRIBUTARIA')
    QBEDefinition.QBEFieldDefs = {
      04000000020000001C000000434F445F434C415353494649434143414F5F5452
      49425554415249410100000000001D000000444553435F434C41535349464943
      4143414F5F54524942555441524941010000000000}
    Session = DMOracle.DBCemapa
    Left = 40
    Top = 408
    object QClassificacaoTributariaCOD_CLASSIFICACAO_TRIBUTARIA: TIntegerField
      FieldName = 'COD_CLASSIFICACAO_TRIBUTARIA'
      Required = True
    end
    object QClassificacaoTributariaDESC_CLASSIFICACAO_TRIBUTARIA: TStringField
      FieldName = 'DESC_CLASSIFICACAO_TRIBUTARIA'
      Size = 250
    end
  end
  object DSClassificacaoTributaria: TDataSource
    DataSet = QClassificacaoTributaria
    Left = 40
    Top = 456
  end
  object QReinfR1000Cons: TOracleDataSet1
    SQL.Strings = (
      'SELECT '
      '    TB_REINF_R1000.COD_REINF_R1000,'
      '    TB_REINF_R1000.COD_FILIAL,'
      '    TB_FILIAL.DESC_FILIAL,'
      '    TB_CADASTRO.NOME,'
      '    TB_CADASTRO.NUM_CGC_CPF,'
      '    TB_CADASTRO.DESC_TELEFONE,'
      '    TB_CADASTRO.DESC_CELULAR,'
      '    TB_CADASTRO.DESC_E_MAIL,    '
      '    TB_REINF_R1000.IND_INC_ALT_EXC,'
      '    TB_CLASSIFICACAO_TRIBUTARIA.DESC_CLASSIFICACAO_TRIBUTARIA,'
      '    TB_REINF_R1000.DT_INI_VALIDADE,'
      '    TB_REINF_R1000.DT_FIM_VALIDADE,'
      '    TB_REINF_R1000.IND_ECD,'
      '    TB_REINF_R1000.IND_DESONERACAO_FOLHA,'
      '    TB_REINF_R1000.COD_USUARIO,'
      '    TB_USUARIO.NOME AS NOME_USUARIO,'
      '    TB_REINF_R1000.IND_PRODUCAO_HOMOLOGACAO'
      'FROM'
      ' TB_REINF_R1000'
      'left JOIN TB_FILIAL'
      'ON TB_FILIAL.COD_FILIAL = TB_REINF_R1000.COD_FILIAL'
      'left JOIN TB_CADASTRO'
      'ON TB_CADASTRO.COD_CADASTRO = TB_REINF_R1000.COD_CADASTRO'
      'left JOIN TB_CLASSIFICACAO_TRIBUTARIA'
      
        'ON TB_CLASSIFICACAO_TRIBUTARIA.COD_CLASSIFICACAO_TRIBUTARIA = TB' +
        '_REINF_R1000.COD_CLASSIFICACAO_TRIBUTARIA'
      'left JOIN TB_USUARIO'
      'ON TB_USUARIO.COD_USUARIO = TB_REINF_R1000.COD_USUARIO'
      '')
    QBEDefinition.QBEFieldDefs = {
      04000000110000000A000000434F445F46494C49414C0100000000000B000000
      444553435F46494C49414C010000000000040000004E4F4D450100000000000B
      0000004E554D5F4347435F4350460100000000000D000000444553435F54454C
      45464F4E450100000000000C000000444553435F43454C554C41520100000000
      000B000000444553435F455F4D41494C0100000000000F000000494E445F494E
      435F414C545F4558430100000000001D000000444553435F434C415353494649
      434143414F5F545249425554415249410100000000000F00000044545F494E49
      5F56414C49444144450100000000000F00000044545F46494D5F56414C494441
      444501000000000007000000494E445F45434401000000000015000000494E44
      5F4445534F4E45524143414F5F464F4C48410100000000000B000000434F445F
      5553554152494F01000000000018000000494E445F50524F445543414F5F484F
      4D4F4C4F474143414F0100000000000C0000004E4F4D455F5553554152494F01
      00000000000F000000434F445F5245494E465F5231303030010000000000}
    Session = DMOracle.DBCemapa
    Left = 144
    Top = 88
    object QReinfR1000ConsCOD_REINF_R1000: TIntegerField
      FieldName = 'COD_REINF_R1000'
      Required = True
    end
    object QReinfR1000ConsCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QReinfR1000ConsDESC_FILIAL: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
    object QReinfR1000ConsNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object QReinfR1000ConsNUM_CGC_CPF: TStringField
      FieldName = 'NUM_CGC_CPF'
      Size = 18
    end
    object QReinfR1000ConsDESC_TELEFONE: TStringField
      FieldName = 'DESC_TELEFONE'
      Size = 15
    end
    object QReinfR1000ConsDESC_CELULAR: TStringField
      FieldName = 'DESC_CELULAR'
      Size = 15
    end
    object QReinfR1000ConsDESC_E_MAIL: TStringField
      FieldName = 'DESC_E_MAIL'
      Size = 70
    end
    object QReinfR1000ConsIND_INC_ALT_EXC: TIntegerField
      FieldName = 'IND_INC_ALT_EXC'
    end
    object QReinfR1000ConsDESC_CLASSIFICACAO_TRIBUTARIA: TStringField
      FieldName = 'DESC_CLASSIFICACAO_TRIBUTARIA'
      Size = 250
    end
    object QReinfR1000ConsDT_INI_VALIDADE: TDateTimeField
      FieldName = 'DT_INI_VALIDADE'
    end
    object QReinfR1000ConsDT_FIM_VALIDADE: TDateTimeField
      FieldName = 'DT_FIM_VALIDADE'
    end
    object QReinfR1000ConsIND_ECD: TIntegerField
      FieldName = 'IND_ECD'
    end
    object QReinfR1000ConsIND_DESONERACAO_FOLHA: TIntegerField
      FieldName = 'IND_DESONERACAO_FOLHA'
    end
    object QReinfR1000ConsNOME_USUARIO: TStringField
      FieldName = 'NOME_USUARIO'
      Required = True
      Size = 30
    end
    object QReinfR1000ConsCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
    object QReinfR1000ConsIND_PRODUCAO_HOMOLOGACAO: TIntegerField
      FieldName = 'IND_PRODUCAO_HOMOLOGACAO'
    end
  end
  object DSReinfR1000Cons: TDataSource
    DataSet = QReinfR1000Cons
    Left = 144
    Top = 136
  end
  object QReinfR1070: TOracleDataSet1
    SQL.Strings = (
      'select '
      '    rowid,'
      '    TB_REINF_R1070.*'
      'FROM'
      '    TB_REINF_R1070'
      'where'
      '(:DT_INICIO is null'
      'or '
      'TB_REINF_R1070.DT_INI_VALIDADE = :DT_INICIO)'
      'and'
      '(:PK IS NULL'
      'OR'
      'TB_REINF_R1070.COD_REINF_R1070 = :PK)')
    Variables.Data = {
      03000000020000000A0000003A44545F494E4943494F0C000000000000000000
      0000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_REINF_R1070'
    SequenceField.Sequence = 'SQREINF_R1070'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      04000000100000000F000000434F445F5245494E465F52313037300100000000
      0018000000494E445F50524F445543414F5F484F4D4F4C4F474143414F010000
      00000013000000494E445F5449504F5F41504C4943415449564F010000000000
      0A000000434F445F46494C49414C0100000000000C000000434F445F43414441
      5354524F0100000000000F000000494E445F494E435F414C545F455843010000
      00000011000000494E445F5449504F5F50524F434553534F0100000000000C00
      00004E554D5F50524F434553534F0100000000000F00000044545F494E495F56
      414C49444144450100000000000F00000044545F46494D5F56414C4944414445
      01000000000014000000494E445F4155544F5249415F50524F434553534F0100
      000000000A000000434F445F45535441444F0100000000000A000000434F445F
      4349444144450100000000000B000000434F445F5553554152494F0100000000
      00080000004E554D5F564152410100000000000B000000434F445F49445F5641
      5241010000000000}
    Session = DMOracle.DBCemapa
    Left = 248
    Top = 32
    object QReinfR1070COD_REINF_R1070: TIntegerField
      FieldName = 'COD_REINF_R1070'
      Required = True
    end
    object QReinfR1070IND_PRODUCAO_HOMOLOGACAO: TIntegerField
      FieldName = 'IND_PRODUCAO_HOMOLOGACAO'
    end
    object QReinfR1070IND_TIPO_APLICATIVO: TIntegerField
      FieldName = 'IND_TIPO_APLICATIVO'
    end
    object QReinfR1070COD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QReinfR1070COD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QReinfR1070IND_INC_ALT_EXC: TIntegerField
      FieldName = 'IND_INC_ALT_EXC'
    end
    object QReinfR1070IND_TIPO_PROCESSO: TIntegerField
      FieldName = 'IND_TIPO_PROCESSO'
    end
    object QReinfR1070NUM_PROCESSO: TStringField
      FieldName = 'NUM_PROCESSO'
      Size = 21
    end
    object QReinfR1070DT_INI_VALIDADE: TDateTimeField
      FieldName = 'DT_INI_VALIDADE'
    end
    object QReinfR1070DT_FIM_VALIDADE: TDateTimeField
      FieldName = 'DT_FIM_VALIDADE'
    end
    object QReinfR1070NUM_VARA: TIntegerField
      FieldName = 'NUM_VARA'
    end
    object QReinfR1070IND_AUTORIA_PROCESSO: TIntegerField
      FieldName = 'IND_AUTORIA_PROCESSO'
    end
    object QReinfR1070COD_ESTADO: TStringField
      FieldName = 'COD_ESTADO'
      Required = True
      Size = 2
    end
    object QReinfR1070COD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
      Required = True
    end
    object QReinfR1070COD_ID_VARA: TStringField
      FieldName = 'COD_ID_VARA'
      Required = True
      Size = 4
    end
    object QReinfR1070COD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
  end
  object QReinfR1070Cons: TOracleDataSet1
    SQL.Strings = (
      'SELECT '
      '    TB_REINF_R1070.COD_REINF_R1070,'
      '    TB_REINF_R1070.COD_FILIAL,'
      '    TB_FILIAL.DESC_FILIAL,'
      '    TB_CADASTRO.NOME,'
      '    TB_CADASTRO.NUM_CGC_CPF,'
      '    TB_CADASTRO.DESC_TELEFONE,'
      '    TB_CADASTRO.DESC_CELULAR,'
      '    TB_CADASTRO.DESC_E_MAIL,    '
      '    TB_REINF_R1070.IND_INC_ALT_EXC,'
      '    TB_REINF_R1070.NUM_PROCESSO,'
      '    TB_REINF_R1070.DT_INI_VALIDADE,'
      '    TB_REINF_R1070.DT_FIM_VALIDADE,'
      '    TB_REINF_R1070.IND_AUTORIA_PROCESSO,'
      '    TB_REINF_R1070.COD_ESTADO,'
      '    TB_REINF_R1070.COD_CIDADE,'
      '    TB_USUARIO.NOME AS NOME_USUARIO,'
      '    TB_REINF_R1070.IND_PRODUCAO_HOMOLOGACAO'
      'FROM'
      ' TB_REINF_R1070'
      'left JOIN TB_FILIAL'
      'ON TB_FILIAL.COD_FILIAL = TB_REINF_R1070.COD_FILIAL'
      'left JOIN TB_CADASTRO'
      'ON TB_CADASTRO.COD_CADASTRO = TB_REINF_R1070.COD_CADASTRO'
      'left JOIN TB_USUARIO'
      'ON TB_USUARIO.COD_USUARIO = TB_REINF_R1070.COD_USUARIO'
      '')
    QBEDefinition.QBEFieldDefs = {
      04000000110000000F000000434F445F5245494E465F52313037300100000000
      000A000000434F445F46494C49414C0100000000000B000000444553435F4649
      4C49414C010000000000040000004E4F4D450100000000000B0000004E554D5F
      4347435F4350460100000000000D000000444553435F54454C45464F4E450100
      000000000C000000444553435F43454C554C41520100000000000B0000004445
      53435F455F4D41494C0100000000000F000000494E445F494E435F414C545F45
      58430100000000000C0000004E554D5F50524F434553534F0100000000000F00
      000044545F494E495F56414C49444144450100000000000F00000044545F4649
      4D5F56414C494441444501000000000014000000494E445F4155544F5249415F
      50524F434553534F0100000000000A000000434F445F45535441444F01000000
      00000A000000434F445F4349444144450100000000000C0000004E4F4D455F55
      53554152494F01000000000018000000494E445F50524F445543414F5F484F4D
      4F4C4F474143414F010000000000}
    Session = DMOracle.DBCemapa
    Left = 248
    Top = 88
    object QReinfR1070ConsCOD_REINF_R1070: TIntegerField
      FieldName = 'COD_REINF_R1070'
      Required = True
    end
    object QReinfR1070ConsCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QReinfR1070ConsDESC_FILIAL: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
    object QReinfR1070ConsNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object QReinfR1070ConsNUM_CGC_CPF: TStringField
      FieldName = 'NUM_CGC_CPF'
      Size = 18
    end
    object QReinfR1070ConsDESC_TELEFONE: TStringField
      FieldName = 'DESC_TELEFONE'
      Size = 15
    end
    object QReinfR1070ConsDESC_CELULAR: TStringField
      FieldName = 'DESC_CELULAR'
      Size = 15
    end
    object QReinfR1070ConsDESC_E_MAIL: TStringField
      FieldName = 'DESC_E_MAIL'
      Size = 70
    end
    object QReinfR1070ConsIND_INC_ALT_EXC: TIntegerField
      FieldName = 'IND_INC_ALT_EXC'
    end
    object QReinfR1070ConsNUM_PROCESSO: TStringField
      FieldName = 'NUM_PROCESSO'
      Size = 21
    end
    object QReinfR1070ConsDT_INI_VALIDADE: TDateTimeField
      FieldName = 'DT_INI_VALIDADE'
    end
    object QReinfR1070ConsDT_FIM_VALIDADE: TDateTimeField
      FieldName = 'DT_FIM_VALIDADE'
    end
    object QReinfR1070ConsIND_AUTORIA_PROCESSO: TIntegerField
      FieldName = 'IND_AUTORIA_PROCESSO'
    end
    object QReinfR1070ConsCOD_ESTADO: TStringField
      FieldName = 'COD_ESTADO'
      Required = True
      Size = 6
    end
    object QReinfR1070ConsCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
      Required = True
    end
    object QReinfR1070ConsNOME_USUARIO: TStringField
      FieldName = 'NOME_USUARIO'
      Size = 30
    end
    object QReinfR1070ConsIND_PRODUCAO_HOMOLOGACAO: TIntegerField
      FieldName = 'IND_PRODUCAO_HOMOLOGACAO'
    end
  end
  object DSReinfR1070Cons: TDataSource
    DataSet = QReinfR1070Cons
    Left = 248
    Top = 136
  end
  object QReinfSuspProcesso: TOracleDataSet1
    SQL.Strings = (
      'select '
      '    rowid,'
      '    TB_SUSPENSAO_R1070.*'
      'FROM'
      '    TB_SUSPENSAO_R1070'
      'where'
      '(:PK IS NULL'
      'OR'
      'TB_SUSPENSAO_R1070.COD_SUSPENSAO_R1070 = :PK)')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_SUSPENSAO_R1070'
    SequenceField.Sequence = 'SQSUSPENSAO_R1070'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000600000013000000434F445F53555350454E53414F5F523130373001
      000000000011000000434F445F494E445F53555350454E53414F010000000000
      0D000000494E445F53555350454E53414F0100000000000A00000044545F4445
      434953414F0100000000000C000000494E445F4445504F5349544F0100000000
      000B000000434F445F5553554152494F010000000000}
    Session = DMOracle.DBCemapa
    Left = 367
    Top = 32
    object QReinfSuspProcessoCOD_SUSPENSAO_R1070: TIntegerField
      FieldName = 'COD_SUSPENSAO_R1070'
      Required = True
    end
    object QReinfSuspProcessoCOD_IND_SUSPENSAO: TFloatField
      FieldName = 'COD_IND_SUSPENSAO'
    end
    object QReinfSuspProcessoIND_SUSPENSAO: TIntegerField
      FieldName = 'IND_SUSPENSAO'
    end
    object QReinfSuspProcessoDT_DECISAO: TDateTimeField
      FieldName = 'DT_DECISAO'
    end
    object QReinfSuspProcessoIND_DEPOSITO: TStringField
      FieldName = 'IND_DEPOSITO'
      Size = 1
    end
    object QReinfSuspProcessoCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
  end
  object QReinfSuspProcessoCons: TOracleDataSet1
    SQL.Strings = (
      'select '
      '  *'
      'FROM'
      '  TB_SUSPENSAO_R1070'
      'WHERE '
      ' (:PK IS NULL'
      '  OR '
      '  TB_SUSPENSAO_R1070.IND_SUSPENSAO = :PK)'
      '  ')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000600000013000000434F445F53555350454E53414F5F523130373001
      000000000011000000434F445F494E445F53555350454E53414F010000000000
      0D000000494E445F53555350454E53414F0100000000000A00000044545F4445
      434953414F0100000000000C000000494E445F4445504F5349544F0100000000
      000B000000434F445F5553554152494F010000000000}
    Session = DMOracle.DBCemapa
    Left = 368
    Top = 88
    object QReinfSuspProcessoConsCOD_SUSPENSAO_R1070: TIntegerField
      FieldName = 'COD_SUSPENSAO_R1070'
      Required = True
    end
    object QReinfSuspProcessoConsCOD_IND_SUSPENSAO: TFloatField
      FieldName = 'COD_IND_SUSPENSAO'
    end
    object QReinfSuspProcessoConsIND_SUSPENSAO: TIntegerField
      FieldName = 'IND_SUSPENSAO'
    end
    object QReinfSuspProcessoConsDT_DECISAO: TDateTimeField
      FieldName = 'DT_DECISAO'
    end
    object QReinfSuspProcessoConsIND_DEPOSITO: TStringField
      FieldName = 'IND_DEPOSITO'
      Size = 1
    end
    object QReinfSuspProcessoConsCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
  end
  object DSReinfSuspProcessoCons: TDataSource
    DataSet = QReinfSuspProcessoCons
    Left = 369
    Top = 136
  end
  object QReinfSuspProcR1070: TOracleDataSet1
    SQL.Strings = (
      'SELECT '
      '  ROWID,'
      '  TB_R1070_X_SUSPENSAO.*'
      'FROM'
      '  TB_R1070_X_SUSPENSAO'
      'where cod_reinf_r1070 = :cod_reinf_r1070')
    Variables.Data = {
      0300000001000000100000003A434F445F5245494E465F523130373003000000
      0000000000000000}
    SequenceField.Field = 'COD_R1070_X_SUSPENSAO'
    SequenceField.Sequence = 'SQR1070_X_SUSPENSAO'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000300000015000000434F445F52313037305F585F53555350454E5341
      4F0100000000000F000000434F445F5245494E465F5231303730010000000000
      13000000434F445F53555350454E53414F5F5231303730010000000000}
    Master = QReinfR1070
    MasterFields = 'COD_REINF_R1070'
    DetailFields = 'COD_REINF_R1070'
    Session = DMOracle.DBCemapa
    Left = 248
    Top = 200
    object QReinfSuspProcR1070COD_R1070_X_SUSPENSAO: TIntegerField
      FieldName = 'COD_R1070_X_SUSPENSAO'
      Required = True
    end
    object QReinfSuspProcR1070COD_REINF_R1070: TIntegerField
      FieldName = 'COD_REINF_R1070'
      Required = True
    end
    object QReinfSuspProcR1070COD_SUSPENSAO_R1070: TIntegerField
      FieldName = 'COD_SUSPENSAO_R1070'
      Required = True
    end
  end
  object DSReinfSuspProcR1070Cons: TDataSource
    AutoEdit = False
    DataSet = QReinfSuspProcR1070Cons
    Left = 248
    Top = 296
  end
  object QReinfR2010: TOracleDataSet1
    SQL.Strings = (
      'select '
      '    rowid,'
      '    TB_REINF_R2010.*'
      'FROM'
      '    TB_REINF_R2010'
      'where'
      '(:DT_INICIO is null'
      'or '
      'TB_REINF_R2010.DT_PERIODO_APURACAO = :DT_INICIO)'
      'and'
      '(:PK IS NULL'
      'OR'
      'TB_REINF_R2010.COD_REINF_R2010 = :PK)'
      '')
    Variables.Data = {
      03000000020000000A0000003A44545F494E4943494F0C000000000000000000
      0000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_REINF_R2010'
    SequenceField.Sequence = 'SQREINF_R2010'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      04000000140000000F000000434F445F5245494E465F52323031300100000000
      000E000000494E445F5245544946434143414F0100000000000F000000444553
      435F4E554D5F52454349424F0100000000001300000044545F504552494F444F
      5F415055524143414F01000000000018000000494E445F50524F445543414F5F
      484F4D4F4C4F474143414F01000000000013000000494E445F5449504F5F4150
      4C4943415449564F0100000000000A000000434F445F46494C49414C01000000
      000018000000434F445F434144415354524F5F434F4E54524154414E54450100
      0000000008000000494E445F4F42524101000000000016000000434F445F4341
      44415354524F5F505245535441444F520100000000000F00000056414C5F544F
      54414C5F425255544F0100000000001700000056414C5F544F54414C5F424153
      455F524554454E43414F0100000000001A00000056414C5F544F54414C5F5245
      5449444F5F5052494E434950414C0100000000001A00000056414C5F544F5441
      4C5F52455449444F5F41444943494F4E414C0100000000001900000056414C5F
      544F545F4E414F5F5245545F5052494E434950414C0100000000001900000056
      414C5F544F545F4E414F5F5245545F41444943494F4E414C0100000000000800
      0000494E445F435052420100000000000B000000434F445F5553554152494F01
      00000000000F000000494E445F54505F434E504A5F434E4F0100000000001200
      0000434F445F45535441425F434E504A5F434E4F010000000000}
    Session = DMOracle.DBCemapa
    Left = 472
    Top = 32
    object QReinfR2010COD_REINF_R2010: TIntegerField
      FieldName = 'COD_REINF_R2010'
      Required = True
    end
    object QReinfR2010IND_RETIFCACAO: TIntegerField
      FieldName = 'IND_RETIFCACAO'
      Required = True
    end
    object QReinfR2010DESC_NUM_RECIBO: TStringField
      FieldName = 'DESC_NUM_RECIBO'
      Size = 52
    end
    object QReinfR2010DT_PERIODO_APURACAO: TDateTimeField
      FieldName = 'DT_PERIODO_APURACAO'
    end
    object QReinfR2010IND_PRODUCAO_HOMOLOGACAO: TIntegerField
      FieldName = 'IND_PRODUCAO_HOMOLOGACAO'
    end
    object QReinfR2010IND_TIPO_APLICATIVO: TIntegerField
      FieldName = 'IND_TIPO_APLICATIVO'
    end
    object QReinfR2010COD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QReinfR2010COD_CADASTRO_CONTRATANTE: TIntegerField
      FieldName = 'COD_CADASTRO_CONTRATANTE'
      Required = True
    end
    object QReinfR2010IND_OBRA: TIntegerField
      FieldName = 'IND_OBRA'
      Required = True
    end
    object QReinfR2010COD_CADASTRO_PRESTADOR: TIntegerField
      FieldName = 'COD_CADASTRO_PRESTADOR'
      Required = True
    end
    object QReinfR2010VAL_TOTAL_BRUTO: TFloatField
      FieldName = 'VAL_TOTAL_BRUTO'
    end
    object QReinfR2010VAL_TOTAL_BASE_RETENCAO: TFloatField
      FieldName = 'VAL_TOTAL_BASE_RETENCAO'
    end
    object QReinfR2010VAL_TOTAL_RETIDO_PRINCIPAL: TFloatField
      FieldName = 'VAL_TOTAL_RETIDO_PRINCIPAL'
    end
    object QReinfR2010VAL_TOTAL_RETIDO_ADICIONAL: TFloatField
      FieldName = 'VAL_TOTAL_RETIDO_ADICIONAL'
    end
    object QReinfR2010VAL_TOT_NAO_RET_PRINCIPAL: TFloatField
      FieldName = 'VAL_TOT_NAO_RET_PRINCIPAL'
    end
    object QReinfR2010VAL_TOT_NAO_RET_ADICIONAL: TFloatField
      FieldName = 'VAL_TOT_NAO_RET_ADICIONAL'
    end
    object QReinfR2010IND_CPRB: TIntegerField
      FieldName = 'IND_CPRB'
      Required = True
    end
    object QReinfR2010COD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
    object QReinfR2010IND_TP_CNPJ_CNO: TIntegerField
      FieldName = 'IND_TP_CNPJ_CNO'
      Required = True
    end
    object QReinfR2010COD_ESTAB_CNPJ_CNO: TStringField
      FieldName = 'COD_ESTAB_CNPJ_CNO'
      Required = True
      Size = 14
    end
  end
  object DSReinfR2010Cons: TDataSource
    DataSet = QReinfR2010Cons
    Left = 472
    Top = 136
  end
  object QNotaxReinf: TOracleDataSet1
    SQL.Strings = (
      'SELECT '
      '  ROWID,'
      '  TB_NOTA_X_REGISTRO_REINF.*'
      'FROM TB_NOTA_X_REGISTRO_REINF'
      'WHERE '
      '(:PK IS NULL '
      'OR TB_NOTA_X_REGISTRO_REINF.COD_NOTA_X_REGISTRO_REINF = :PK)'
      'and'
      'TB_NOTA_X_REGISTRO_REINF.COD_TABELA_REINF = '#39'R-2010'#39)
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_NOTA_X_REGISTRO_REINF'
    SequenceField.Sequence = 'SQNOTA_X_REGISTRO_REINF'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000500000019000000434F445F4E4F54415F585F524547495354524F5F
      5245494E4601000000000010000000434F445F544142454C415F5245494E4601
      000000000012000000434F445F524547495354524F5F5245494E460100000000
      000C000000434F445F4E4F54415F43414201000000000008000000444553435F
      4F4253010000000000}
    Session = DMOracle.DBCemapa
    Left = 473
    Top = 186
    object QNotaxReinfCOD_NOTA_X_REGISTRO_REINF: TIntegerField
      FieldName = 'COD_NOTA_X_REGISTRO_REINF'
      Required = True
    end
    object QNotaxReinfCOD_TABELA_REINF: TStringField
      FieldName = 'COD_TABELA_REINF'
      Required = True
      Size = 6
    end
    object QNotaxReinfCOD_REGISTRO_REINF: TIntegerField
      FieldName = 'COD_REGISTRO_REINF'
      Required = True
    end
    object QNotaxReinfCOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
      Required = True
    end
    object QNotaxReinfDESC_OBS: TStringField
      FieldName = 'DESC_OBS'
      Size = 250
    end
  end
  object QNotasReinf2010: TOracleDataSet1
    SQL.Strings = (
      'SELECT '
      '  TB_NOTA_X_REGISTRO_REINF.COD_NOTA_X_REGISTRO_REINF,'
      '  TB_NOTA_CAB.COD_SERIE,'
      '  TB_NOTA_CAB.NUM_NOTA,  '
      '  TB_NOTA_CAB.DT_EMISSAO,'
      
        '  (SELECT SUM(TB_NOTA_ITEM.VAL_TOTAL - TB_NOTA_ITEM.VAL_DESCONTO' +
        ' - TB_NOTA_ITEM.VAL_DESCONTO_RATEIO) '
      '                FROM TB_NOTA_ITEM '
      
        '                WHERE TB_NOTA_ITEM.COD_NOTA_CAB = TB_NOTA_CAB.CO' +
        'D_NOTA_CAB) VAL_BRUTO,'
      '  TB_NOTA_CAB.OBS,'
      '  TB_CADASTRO.NOME'
      'FROM TB_NOTA_X_REGISTRO_REINF'
      'LEFT JOIN TB_NOTA_CAB '
      
        'ON TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_X_REGISTRO_REINF.COD_NOTA_' +
        'CAB'
      'LEFT JOIN TB_REINF_R2010'
      
        'ON TB_REINF_R2010.COD_REINF_R2010 = TB_NOTA_X_REGISTRO_REINF.COD' +
        '_REGISTRO_REINF'
      'LEFT JOIN TB_CADASTRO'
      'ON TB_CADASTRO.COD_CADASTRO = TB_NOTA_CAB.COD_CADASTRO'
      'WHERE'
      'TB_NOTA_X_REGISTRO_REINF.COD_TABELA_REINF = '#39'R-2010'#39
      'and'
      '(:COD_REGISTRO_REINF IS NULL '
      'OR'
      
        'TB_NOTA_X_REGISTRO_REINF.COD_REGISTRO_REINF = :COD_REGISTRO_REIN' +
        'F)')
    Variables.Data = {
      0300000001000000130000003A434F445F524547495354524F5F5245494E4603
      0000000000000000000000}
    SequenceField.Field = 'COD_NOTA_X_REGISTRO_REINF'
    SequenceField.Sequence = 'SQNOTA_X_REGISTRO_REINF'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000700000019000000434F445F4E4F54415F585F524547495354524F5F
      5245494E46010000000000080000004E554D5F4E4F5441010000000000040000
      004E4F4D450100000000000A00000044545F454D495353414F01000000000009
      000000434F445F53455249450100000000000900000056414C5F425255544F01
      0000000000030000004F4253010000000000}
    Session = DMOracle.DBCemapa
    Left = 472
    Top = 276
    object QNotasReinf2010COD_NOTA_X_REGISTRO_REINF: TIntegerField
      FieldName = 'COD_NOTA_X_REGISTRO_REINF'
      Required = True
    end
    object QNotasReinf2010NUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
    end
    object QNotasReinf2010NOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object QNotasReinf2010DT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
    object QNotasReinf2010COD_SERIE: TStringField
      FieldName = 'COD_SERIE'
      Size = 3
    end
    object QNotasReinf2010VAL_BRUTO: TFloatField
      FieldName = 'VAL_BRUTO'
    end
    object QNotasReinf2010OBS: TStringField
      FieldName = 'OBS'
      Size = 200
    end
  end
  object DsNotasReinf2010: TDataSource
    DataSet = QNotasReinf2010
    Left = 472
    Top = 324
  end
  object DSNotaxReinf: TDataSource
    DataSet = QNotaxReinf
    Left = 472
    Top = 232
  end
  object QReinfR2050: TOracleDataSet1
    SQL.Strings = (
      'select'
      '    rowid,'
      '    TB_REINF_R2050.*'
      'from '
      'TB_REINF_R2050'
      'where'
      '(:PK IS NULL '
      'OR TB_REINF_R2050.COD_REINF_R2050 = :PK)'
      ' ')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_REINF_R2050'
    SequenceField.Sequence = 'SQREINF_R2050'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      04000000100000000F000000434F445F5245494E465F52323035300100000000
      000E000000494E445F5245544946434143414F0100000000000F000000444553
      435F4E554D5F52454349424F0100000000001300000044545F504552494F444F
      5F415055524143414F01000000000018000000494E445F50524F445543414F5F
      484F4D4F4C4F474143414F01000000000013000000494E445F5449504F5F4150
      4C4943415449564F0100000000000A000000434F445F46494C49414C01000000
      000015000000434F445F434144415354524F5F434F4D455243494F0100000000
      001300000056414C5F5245435F42525554415F544F54414C0100000000000C00
      000056414C5F4350415F415055520100000000000C00000056414C5F5241545F
      415055520100000000000E00000056414C5F53454E41525F4150555201000000
      00001100000056414C5F43505F535553505F544F54414C010000000000150000
      0056414C5F53454E41525F53555350455F544F54414C01000000000008000000
      494E445F435052420100000000000B000000434F445F5553554152494F010000
      000000}
    Session = DMOracle.DBCemapa
    Left = 568
    Top = 48
    object QReinfR2050COD_REINF_R2050: TIntegerField
      FieldName = 'COD_REINF_R2050'
      Required = True
    end
    object QReinfR2050DT_PERIODO_APURACAO: TDateTimeField
      FieldName = 'DT_PERIODO_APURACAO'
    end
    object QReinfR2050IND_PRODUCAO_HOMOLOGACAO: TIntegerField
      FieldName = 'IND_PRODUCAO_HOMOLOGACAO'
    end
    object QReinfR2050IND_TIPO_APLICATIVO: TIntegerField
      FieldName = 'IND_TIPO_APLICATIVO'
    end
    object QReinfR2050COD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QReinfR2050VAL_REC_BRUTA_TOTAL: TFloatField
      FieldName = 'VAL_REC_BRUTA_TOTAL'
    end
    object QReinfR2050VAL_CPA_APUR: TFloatField
      FieldName = 'VAL_CPA_APUR'
    end
    object QReinfR2050VAL_RAT_APUR: TFloatField
      FieldName = 'VAL_RAT_APUR'
    end
    object QReinfR2050VAL_SENAR_APUR: TFloatField
      FieldName = 'VAL_SENAR_APUR'
    end
    object QReinfR2050VAL_CP_SUSP_TOTAL: TFloatField
      FieldName = 'VAL_CP_SUSP_TOTAL'
    end
    object QReinfR2050VAL_SENAR_SUSPE_TOTAL: TFloatField
      FieldName = 'VAL_SENAR_SUSPE_TOTAL'
    end
    object QReinfR2050COD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
  end
  object QComercializacaoR2050: TOracleDataSet1
    SQL.Strings = (
      'SELECT '
      '    ROWID, '
      '    TB_TIPO_COMERCIALIZACAO_REINF.*'
      'FROM'
      'TB_TIPO_COMERCIALIZACAO_REINF'
      'WHERE '
      '(:PK IS  NULL '
      'OR TB_TIPO_COMERCIALIZACAO_REINF.COD_TIPO_COMERCIALIZACAO = :PK)')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_TIPO_COMERCIALIZACAO'
    SequenceField.Sequence = 'SQTIPO_COMERCIALIZACAO'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000500000018000000434F445F5449504F5F434F4D45524349414C495A
      4143414F01000000000010000000434F445F544142454C415F5245494E460100
      0000000012000000434F445F524547495354524F5F5245494E46010000000000
      13000000494E445F434F4D45524349414C495A4143414F0100000000000D0000
      0056414C5F5245435F4252555441010000000000}
    Session = DMOracle.DBCemapa
    Left = 568
    Top = 208
    object QComercializacaoR2050COD_TIPO_COMERCIALIZACAO: TIntegerField
      FieldName = 'COD_TIPO_COMERCIALIZACAO'
      Required = True
    end
    object QComercializacaoR2050COD_TABELA_REINF: TStringField
      FieldName = 'COD_TABELA_REINF'
      Required = True
      Size = 6
    end
    object QComercializacaoR2050COD_REGISTRO_REINF: TIntegerField
      FieldName = 'COD_REGISTRO_REINF'
      Required = True
    end
    object QComercializacaoR2050IND_COMERCIALIZACAO: TIntegerField
      FieldName = 'IND_COMERCIALIZACAO'
      Required = True
    end
    object QComercializacaoR2050VAL_REC_BRUTA: TFloatField
      FieldName = 'VAL_REC_BRUTA'
    end
  end
  object QTipoComerXR1070: TOracleDataSet1
    SQL.Strings = (
      'SELECT '
      '    ROWID,'
      '    TB_TIPO_COMER_X_R1070.* '
      'FROM TB_TIPO_COMER_X_R1070'
      'WHERE'
      '(:PK IS NULL'
      'OR TB_TIPO_COMER_X_R1070.COD_TIPO_COMER_X_R1070 = :PK)'
      '')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_TIPO_COMER_X_R1070'
    SequenceField.Sequence = 'SQTIPO_COMER_X_R1070'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000300000016000000434F445F5449504F5F434F4D45525F585F523130
      37300100000000000F000000434F445F5245494E465F52313037300100000000
      0018000000434F445F5449504F5F434F4D45524349414C495A4143414F010000
      000000}
    Master = QComercializacaoR2050Cons
    Session = DMOracle.DBCemapa
    Left = 568
    Top = 352
    object QTipoComerXR1070COD_TIPO_COMER_X_R1070: TIntegerField
      FieldName = 'COD_TIPO_COMER_X_R1070'
      Required = True
    end
    object QTipoComerXR1070COD_REINF_R1070: TIntegerField
      FieldName = 'COD_REINF_R1070'
      Required = True
    end
    object QTipoComerXR1070COD_TIPO_COMERCIALIZACAO: TIntegerField
      FieldName = 'COD_TIPO_COMERCIALIZACAO'
      Required = True
    end
  end
  object QReinfR2010Cons: TOracleDataSet1
    SQL.Strings = (
      'select    '
      '    R2010.COD_REINF_R2010,'
      
        '    DECODE(r2010.IND_RETIFCACAO, 1, '#39'ORIGINAL'#39', 2, '#39'RETIFICA'#199#195'O'#39 +
        ') TIPO,'
      '    R2010.DESC_NUM_RECIBO,'
      '    FILIAL.DESC_FILIAL,'
      '    CONTR.NOME CONTRATANTE,'
      '    PREST.NOME PRESTADOR,'
      
        '    DECODE(R2010.IND_OBRA, 0, '#39'Nao e obra'#39', 1, '#39'Empreitada total' +
        #39', 2, '#39'Empreitada parcial'#39') IND_OBRA,'
      
        '    DECODE(R2010.IND_TP_CNPJ_CNO, 1, '#39'CNPJ DECLARANTE'#39', 4, '#39'CNO ' +
        'Obra'#39') IND_TP_CNPJ_CNO,'
      '    R2010.VAL_TOTAL_BRUTO,'
      '    R2010.VAL_TOTAL_BASE_RETENCAO,'
      '    R2010.VAL_TOTAL_RETIDO_PRINCIPAL,'
      '    R2010.VAL_TOTAL_RETIDO_ADICIONAL,'
      '    R2010.COD_ESTAB_CNPJ_CNO    '
      'FROM'
      '    TB_REINF_R2010 R2010'
      'INNER JOIN TB_CADASTRO CONTR'
      'ON R2010.COD_CADASTRO_CONTRATANTE = CONTR.COD_CADASTRO'
      'INNER JOIN TB_CADASTRO PREST'
      'ON R2010.COD_CADASTRO_PRESTADOR = PREST.COD_CADASTRO'
      'INNER JOIN TB_FILIAL FILIAL'
      'ON R2010.COD_FILIAL = FILIAL.COD_FILIAL')
    QBEDefinition.QBEFieldDefs = {
      040000000D0000000F000000434F445F5245494E465F52323031300100000000
      000F000000444553435F4E554D5F52454349424F0100000000000B0000004445
      53435F46494C49414C0100000000000B000000434F4E54524154414E54450100
      0000000009000000505245535441444F5201000000000008000000494E445F4F
      4252410100000000000F000000494E445F54505F434E504A5F434E4F01000000
      00000F00000056414C5F544F54414C5F425255544F0100000000001700000056
      414C5F544F54414C5F424153455F524554454E43414F0100000000001A000000
      56414C5F544F54414C5F52455449444F5F5052494E434950414C010000000000
      1A00000056414C5F544F54414C5F52455449444F5F41444943494F4E414C0100
      0000000012000000434F445F45535441425F434E504A5F434E4F010000000000
      040000005449504F010000000000}
    Session = DMOracle.DBCemapa
    Left = 472
    Top = 88
    object QReinfR2010ConsCOD_REINF_R2010: TIntegerField
      FieldName = 'COD_REINF_R2010'
      Required = True
    end
    object QReinfR2010ConsDESC_NUM_RECIBO: TStringField
      FieldName = 'DESC_NUM_RECIBO'
      Size = 52
    end
    object QReinfR2010ConsDESC_FILIAL: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
    object QReinfR2010ConsCONTRATANTE: TStringField
      FieldName = 'CONTRATANTE'
      Required = True
      Size = 60
    end
    object QReinfR2010ConsPRESTADOR: TStringField
      FieldName = 'PRESTADOR'
      Required = True
      Size = 60
    end
    object QReinfR2010ConsIND_OBRA: TStringField
      FieldName = 'IND_OBRA'
      Size = 18
    end
    object QReinfR2010ConsIND_TP_CNPJ_CNO: TStringField
      FieldName = 'IND_TP_CNPJ_CNO'
      Size = 15
    end
    object QReinfR2010ConsVAL_TOTAL_BRUTO: TFloatField
      FieldName = 'VAL_TOTAL_BRUTO'
    end
    object QReinfR2010ConsVAL_TOTAL_BASE_RETENCAO: TFloatField
      FieldName = 'VAL_TOTAL_BASE_RETENCAO'
    end
    object QReinfR2010ConsVAL_TOTAL_RETIDO_PRINCIPAL: TFloatField
      FieldName = 'VAL_TOTAL_RETIDO_PRINCIPAL'
    end
    object QReinfR2010ConsVAL_TOTAL_RETIDO_ADICIONAL: TFloatField
      FieldName = 'VAL_TOTAL_RETIDO_ADICIONAL'
    end
    object QReinfR2010ConsCOD_ESTAB_CNPJ_CNO: TStringField
      FieldName = 'COD_ESTAB_CNPJ_CNO'
      Required = True
      Size = 14
    end
    object QReinfR2010ConsTIPO: TStringField
      FieldName = 'TIPO'
      Size = 11
    end
  end
  object QReinfR2050Cons: TOracleDataSet1
    SQL.Strings = (
      'SELECT '
      '    R2050.COD_REINF_R2050,'
      #9'R2050.DT_PERIODO_APURACAO,'
      #9'R2050.IND_PRODUCAO_HOMOLOGACAO,'
      #9'R2050.IND_TIPO_APLICATIVO,'
      #9'R2050.COD_FILIAL,'#9
      '    FILIAL.DESC_FILIAL,'
      #9'R2050.VAL_REC_BRUTA_TOTAL,'
      #9'R2050.VAL_CPA_APUR,'
      #9'R2050.VAL_RAT_APUR,'
      #9'R2050.VAL_SENAR_APUR,'
      #9'R2050.VAL_CP_SUSP_TOTAL,'
      #9'R2050.VAL_SENAR_SUSPE_TOTAL,'
      #9'R2050.COD_USUARIO'
      'FROM TB_REINF_R2050 R2050'
      'INNER JOIN TB_FILIAL FILIAL'
      'ON FILIAL.COD_FILIAL = R2050.COD_FILIAL'
      'INNER JOIN TB_USUARIO USUARIO'
      'ON USUARIO.COD_USUARIO = R2050.COD_USUARIO'
      '')
    QBEDefinition.QBEFieldDefs = {
      040000000D0000000F000000434F445F5245494E465F52323035300100000000
      001300000044545F504552494F444F5F415055524143414F0100000000001800
      0000494E445F50524F445543414F5F484F4D4F4C4F474143414F010000000000
      13000000494E445F5449504F5F41504C4943415449564F0100000000000A0000
      00434F445F46494C49414C0100000000000B000000444553435F46494C49414C
      0100000000001300000056414C5F5245435F42525554415F544F54414C010000
      0000000C00000056414C5F4350415F415055520100000000000C00000056414C
      5F5241545F415055520100000000000E00000056414C5F53454E41525F415055
      520100000000001100000056414C5F43505F535553505F544F54414C01000000
      00001500000056414C5F53454E41525F53555350455F544F54414C0100000000
      000B000000434F445F5553554152494F010000000000}
    Session = DMOracle.DBCemapa
    Left = 568
    Top = 104
    object QReinfR2050ConsCOD_REINF_R2050: TIntegerField
      FieldName = 'COD_REINF_R2050'
      Required = True
    end
    object QReinfR2050ConsDT_PERIODO_APURACAO: TDateTimeField
      FieldName = 'DT_PERIODO_APURACAO'
    end
    object QReinfR2050ConsIND_PRODUCAO_HOMOLOGACAO: TIntegerField
      FieldName = 'IND_PRODUCAO_HOMOLOGACAO'
    end
    object QReinfR2050ConsIND_TIPO_APLICATIVO: TIntegerField
      FieldName = 'IND_TIPO_APLICATIVO'
    end
    object QReinfR2050ConsCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QReinfR2050ConsDESC_FILIAL: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
    object QReinfR2050ConsVAL_REC_BRUTA_TOTAL: TFloatField
      FieldName = 'VAL_REC_BRUTA_TOTAL'
    end
    object QReinfR2050ConsVAL_CPA_APUR: TFloatField
      FieldName = 'VAL_CPA_APUR'
    end
    object QReinfR2050ConsVAL_RAT_APUR: TFloatField
      FieldName = 'VAL_RAT_APUR'
    end
    object QReinfR2050ConsVAL_SENAR_APUR: TFloatField
      FieldName = 'VAL_SENAR_APUR'
    end
    object QReinfR2050ConsVAL_CP_SUSP_TOTAL: TFloatField
      FieldName = 'VAL_CP_SUSP_TOTAL'
    end
    object QReinfR2050ConsVAL_SENAR_SUSPE_TOTAL: TFloatField
      FieldName = 'VAL_SENAR_SUSPE_TOTAL'
    end
    object QReinfR2050ConsCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
  end
  object DSReinfR2050Cos: TDataSource
    DataSet = QReinfR2050Cons
    Left = 568
    Top = 152
  end
  object QComercializacaoR2050Cons: TOracleDataSet1
    SQL.Strings = (
      'SELECT '
      '    TB_TIPO_COMERCIALIZACAO_REINF.*'
      'FROM'
      'TB_TIPO_COMERCIALIZACAO_REINF'
      'WHERE'
      'COD_TABELA_REINF = '#39'R-2050'#39
      'AND'
      'COD_REGISTRO_REINF = :COD_REGISTRO_REINF')
    Variables.Data = {
      0300000001000000130000003A434F445F524547495354524F5F5245494E4603
      0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000500000018000000434F445F5449504F5F434F4D45524349414C495A
      4143414F01000000000010000000434F445F544142454C415F5245494E460100
      0000000012000000434F445F524547495354524F5F5245494E46010000000000
      13000000494E445F434F4D45524349414C495A4143414F0100000000000D0000
      0056414C5F5245435F4252555441010000000000}
    Session = DMOracle.DBCemapa
    Left = 568
    Top = 256
    object QComercializacaoR2050ConsCOD_TIPO_COMERCIALIZACAO: TIntegerField
      FieldName = 'COD_TIPO_COMERCIALIZACAO'
      Required = True
    end
    object QComercializacaoR2050ConsCOD_TABELA_REINF: TStringField
      FieldName = 'COD_TABELA_REINF'
      Required = True
      Size = 6
    end
    object QComercializacaoR2050ConsCOD_REGISTRO_REINF: TIntegerField
      FieldName = 'COD_REGISTRO_REINF'
      Required = True
    end
    object QComercializacaoR2050ConsIND_COMERCIALIZACAO: TIntegerField
      FieldName = 'IND_COMERCIALIZACAO'
      Required = True
    end
    object QComercializacaoR2050ConsVAL_REC_BRUTA: TFloatField
      FieldName = 'VAL_REC_BRUTA'
    end
  end
  object DSComercializacaoR2050Cons: TDataSource
    DataSet = QComercializacaoR2050Cons
    Left = 568
    Top = 304
  end
  object QTipoComerXR1070Cons: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      '  R1070.NUM_PROCESSO,'
      '  DECODE(R1070.IND_TIPO_PROCESSO,'
      '            1, '#39'Administrativo'#39','
      '            2, '#39'Judicial'#39') TIPO_PROCESSO,'
      '  PROC_COMER.COD_TIPO_COMERCIALICACAO          '
      'FROM TB_TIPO_COMER_X_R1070 PROC_COMER'
      'INNER JOIN TB_REINF_R1070 R1070'
      'ON PROC_COMER.COD_REINF_R1070 = R1070.COD_REINF_R1070'
      'WHERE'
      'PROC_COMER.COD_TIPO_COMERCIALICACAO = :COD_TIPO_COMERCIALIZACAO')
    Variables.Data = {
      0300000001000000190000003A434F445F5449504F5F434F4D45524349414C49
      5A4143414F030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000030000000C0000004E554D5F50524F434553534F0100000000000D00
      00005449504F5F50524F434553534F01000000000018000000434F445F544950
      4F5F434F4D45524349414C49434143414F010000000000}
    Session = DMOracle.DBCemapa
    Left = 568
    Top = 400
    object QTipoComerXR1070ConsNUM_PROCESSO: TStringField
      FieldName = 'NUM_PROCESSO'
      Size = 21
    end
    object QTipoComerXR1070ConsTIPO_PROCESSO: TStringField
      FieldName = 'TIPO_PROCESSO'
      Size = 14
    end
    object QTipoComerXR1070ConsCOD_TIPO_COMERCIALICACAO: TIntegerField
      FieldName = 'COD_TIPO_COMERCIALICACAO'
      Required = True
    end
  end
  object DSTipoComerXR1070Cons: TDataSource
    DataSet = QTipoComerXR1070Cons
    Left = 568
    Top = 448
  end
  object QProcessoR1070Cons: TOracleDataSet1
    SQL.Strings = (
      'SELECT '
      '  R1070.COD_REINF_R1070,'
      '  R1070.NUM_PROCESSO,  '
      '  DECODE(R1070.IND_TIPO_PROCESSO,'
      '            1, '#39'Administrativo'#39','
      '            2, '#39'Judicial'#39') TIPO_PROCESSO,'
      '  SUSP1070.COD_IND_SUSPENSAO,'
      '  R1070.NUM_VARA,'
      '  R1070.DT_INI_VALIDADE,'
      '  R1070.DT_FIM_VALIDADE,'
      '  CAD.NOME,'
      '  CID.DESC_CIDADE,'
      '  CID.COD_ESTADO'
      'FROM TB_REINF_R1070 R1070'
      'INNER JOIN TB_CADASTRO CAD'
      'ON CAD.COD_CADASTRO = R1070.COD_CADASTRO'
      'INNER JOIN TB_CIDADE CID'
      'ON CID.COD_CIDADE = R1070.COD_CIDADE'
      'INNER JOIN TB_R1070_X_SUSPENSAO PROCSUSP'
      'ON PROCSUSP.COD_REINF_R1070 = R1070.COD_REINF_R1070'
      'INNER JOIN TB_SUSPENSAO_R1070 SUSP1070'
      'ON SUSP1070.COD_SUSPENSAO_R1070 = PROCSUSP.COD_SUSPENSAO_R1070'
      'WHERE'
      '(:NUM_PROCESSO IS NULL'
      'OR R1070.NUM_PROCESSO = :NUM_PROCESSO)'
      'OR'
      '(:IND_TIPO_PROCESSO IS NULL'
      'OR R1070.IND_TIPO_PROCESSO = :IND_TIPO_PROCESSO)'
      'OR'
      '(:NUM_VARA IS NULL '
      'OR R1070.NUM_VARA = :NUM_VARA)'
      'OR'
      '(:DT_INI IS NULL'
      'OR R1070.DT_INI_VALIDADE >= :DT_INI)'
      'OR'
      '(:DT_FIM IS NULL '
      'OR R1070.DT_FIM_VALIDADE <= :DT_FIM)'
      'OR'
      '(:CADASTRO IS NULL'
      'OR CAD.NOME LIKE '#39'%'#39'||:CADASTRO||'#39'%'#39')'
      '')
    Variables.Data = {
      03000000060000000D0000003A4E554D5F50524F434553534F03000000000000
      0000000000120000003A494E445F5449504F5F50524F434553534F0300000000
      00000000000000090000003A4E554D5F56415241030000000000000000000000
      070000003A44545F494E49050000000000000000000000070000003A44545F46
      494D050000000000000000000000090000003A434144415354524F0300000000
      00000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000090000000C0000004E554D5F50524F434553534F0100000000000D00
      00005449504F5F50524F434553534F010000000000080000004E554D5F564152
      410100000000000F00000044545F494E495F56414C4944414445010000000000
      0F00000044545F46494D5F56414C4944414445010000000000040000004E4F4D
      450100000000000B000000444553435F4349444144450100000000000A000000
      434F445F45535441444F0100000000000F000000434F445F5245494E465F5231
      303730010000000000}
    Session = DMOracle.DBCemapa
    Left = 248
    Top = 344
    object QProcessoR1070ConsCOD_REINF_R1070: TIntegerField
      FieldName = 'COD_REINF_R1070'
      Required = True
    end
    object QProcessoR1070ConsNUM_PROCESSO: TStringField
      FieldName = 'NUM_PROCESSO'
      Size = 21
    end
    object QProcessoR1070ConsTIPO_PROCESSO: TStringField
      FieldName = 'TIPO_PROCESSO'
      Size = 14
    end
    object QProcessoR1070ConsNUM_VARA: TIntegerField
      FieldName = 'NUM_VARA'
    end
    object QProcessoR1070ConsDT_INI_VALIDADE: TDateTimeField
      FieldName = 'DT_INI_VALIDADE'
    end
    object QProcessoR1070ConsDT_FIM_VALIDADE: TDateTimeField
      FieldName = 'DT_FIM_VALIDADE'
    end
    object QProcessoR1070ConsNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object QProcessoR1070ConsDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      Required = True
      Size = 50
    end
    object QProcessoR1070ConsCOD_ESTADO: TStringField
      FieldName = 'COD_ESTADO'
      Required = True
      Size = 2
    end
  end
  object QReinfR2055: TOracleDataSet1
    SQL.Strings = (
      'select'
      '    rowid,'
      '    TB_REINF_R2055.*'
      'from '
      'TB_REINF_R2055'
      'where'
      '(:PK IS NULL '
      'OR TB_REINF_R2055.COD_REINF_R2055 = :PK)'
      ' ')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_REINF_R2055'
    SequenceField.Sequence = 'SQREINF_R2055'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000D0000000F000000434F445F5245494E465F52323035350100000000
      000E000000494E445F5245544946434143414F0100000000000F000000444553
      435F4E554D5F52454349424F0100000000001300000044545F504552494F444F
      5F415055524143414F01000000000018000000494E445F50524F445543414F5F
      484F4D4F4C4F474143414F01000000000013000000494E445F5449504F5F4150
      4C4943415449564F010000000000120000005245465F46313235305F455F534F
      4349414C0100000000000A000000434F445F46494C49414C0100000000001700
      0000434F445F434144415354524F5F414451554952454E544501000000000015
      000000434F445F434144415354524F5F50524F4455544F520100000000000C00
      0000494E445F4F5043414F5F43500100000000000B000000434F445F55535541
      52494F0100000000000B0000004E554D5F4350465F434743010000000000}
    Session = DMOracle.DBCemapa
    Left = 688
    Top = 32
    object QReinfR2055COD_REINF_R2055: TIntegerField
      FieldName = 'COD_REINF_R2055'
      Required = True
    end
    object QReinfR2055IND_RETIFCACAO: TIntegerField
      FieldName = 'IND_RETIFCACAO'
      Required = True
    end
    object QReinfR2055DESC_NUM_RECIBO: TStringField
      FieldName = 'DESC_NUM_RECIBO'
      Size = 52
    end
    object QReinfR2055DT_PERIODO_APURACAO: TDateTimeField
      FieldName = 'DT_PERIODO_APURACAO'
    end
    object QReinfR2055IND_PRODUCAO_HOMOLOGACAO: TIntegerField
      FieldName = 'IND_PRODUCAO_HOMOLOGACAO'
    end
    object QReinfR2055IND_TIPO_APLICATIVO: TIntegerField
      FieldName = 'IND_TIPO_APLICATIVO'
    end
    object QReinfR2055REF_F1250_E_SOCIAL: TStringField
      FieldName = 'REF_F1250_E_SOCIAL'
      Size = 1
    end
    object QReinfR2055COD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QReinfR2055COD_CADASTRO_PRODUTOR: TIntegerField
      FieldName = 'COD_CADASTRO_PRODUTOR'
    end
    object QReinfR2055IND_OPCAO_CP: TStringField
      FieldName = 'IND_OPCAO_CP'
      Size = 1
    end
    object QReinfR2055COD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
    object QReinfR2055NUM_CGC_CPF: TStringField
      FieldName = 'NUM_CGC_CPF'
      Size = 18
    end
  end
  object QReinfR2055Cons: TOracleDataSet1
    SQL.Strings = (
      'select'
      '    DISTINCT'
      '    R2055.COD_REINF_R2055,'
      '    R2055.DT_PERIODO_APURACAO,'
      '    R2055.NUM_CGC_CPF,'
      '    USUARIO.NOME USUARIO'
      'from '
      'TB_REINF_R2055 R2055'
      'INNER JOIN TB_FILIAL FILIAL'
      'ON FILIAL.COD_FILIAL = R2055.COD_FILIAL'
      'INNER JOIN TB_USUARIO USUARIO'
      'ON USUARIO.COD_USUARIO = R2055.COD_USUARIO'
      'ORDER BY R2055.COD_REINF_R2055')
    QBEDefinition.QBEFieldDefs = {
      04000000040000000F000000434F445F5245494E465F52323035350100000000
      001300000044545F504552494F444F5F415055524143414F0100000000000700
      00005553554152494F0100000000000B0000004E554D5F4347435F4350460100
      00000000}
    Session = DMOracle.DBCemapa
    Left = 688
    Top = 88
    object QReinfR2055ConsCOD_REINF_R2055: TIntegerField
      FieldName = 'COD_REINF_R2055'
      Required = True
    end
    object QReinfR2055ConsDT_PERIODO_APURACAO: TDateTimeField
      FieldName = 'DT_PERIODO_APURACAO'
    end
    object QReinfR2055ConsUSUARIO: TStringField
      FieldName = 'USUARIO'
      Required = True
      Size = 30
    end
    object QReinfR2055ConsNUM_CGC_CPF: TStringField
      FieldName = 'NUM_CGC_CPF'
      Size = 18
    end
  end
  object DSReinfR2055Cons: TDataSource
    DataSet = QReinfR2055Cons
    Left = 688
    Top = 136
  end
  object QAquisicaoR2055: TOracleDataSet1
    SQL.Strings = (
      'select '
      '    rowid,'
      '    TB_R2055_X_AQUISICAO.*'
      'from TB_R2055_X_AQUISICAO'
      'where '
      'cod_registro_reinf = :cod_registro_reinf'
      'and'
      'COD_TABELA_REINF = '#39'R-2055'#39)
    Variables.Data = {
      0300000001000000130000003A434F445F524547495354524F5F5245494E4603
      0000000000000000000000}
    SequenceField.Field = 'COD_R2055_X_AQUISICAO'
    SequenceField.Sequence = 'SQR2055_X_AQUISICAO'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000800000015000000434F445F52323035355F585F4151554953494341
      4F01000000000010000000434F445F544142454C415F5245494E460100000000
      0012000000434F445F524547495354524F5F5245494E460100000000000D0000
      00494E445F41515549534943414F0100000000000900000056414C5F42525554
      4F0100000000000E00000056414C5F43505F444553435F50520100000000000F
      00000056414C5F5241545F444553435F50520100000000000E00000056414C5F
      53454E41525F44455343010000000000}
    Master = QReinfR2055
    Session = DMOracle.DBCemapa
    Left = 688
    Top = 199
    object QAquisicaoR2055COD_R2055_X_AQUISICAO: TIntegerField
      FieldName = 'COD_R2055_X_AQUISICAO'
      Required = True
    end
    object QAquisicaoR2055COD_TABELA_REINF: TStringField
      FieldName = 'COD_TABELA_REINF'
      Required = True
      Size = 6
    end
    object QAquisicaoR2055COD_REGISTRO_REINF: TIntegerField
      FieldName = 'COD_REGISTRO_REINF'
      Required = True
    end
    object QAquisicaoR2055IND_AQUISICAO: TIntegerField
      FieldName = 'IND_AQUISICAO'
    end
    object QAquisicaoR2055VAL_BRUTO: TFloatField
      FieldName = 'VAL_BRUTO'
    end
    object QAquisicaoR2055VAL_CP_DESC_PR: TFloatField
      FieldName = 'VAL_CP_DESC_PR'
    end
    object QAquisicaoR2055VAL_RAT_DESC_PR: TFloatField
      FieldName = 'VAL_RAT_DESC_PR'
    end
    object QAquisicaoR2055VAL_SENAR_DESC: TFloatField
      FieldName = 'VAL_SENAR_DESC'
    end
  end
  object QTipoAquisicaoXR1070: TOracleDataSet1
    SQL.Strings = (
      'SELECT '
      '    ROWID,'
      '    TB_R1070_X_AQUISICAO_R2055.* '
      'FROM TB_R1070_X_AQUISICAO_R2055'
      'where cod_registro_reinf = :cod_registro_reinf')
    Variables.Data = {
      0300000001000000130000003A434F445F524547495354524F5F5245494E4603
      0000000000000000000000}
    SequenceField.Field = 'COD_R1070_X_AQUISICAO_R2055'
    SequenceField.Sequence = 'SQR1070_X_AQUISICAO_R2055'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      04000000080000001B000000434F445F52313037305F585F4151554953494341
      4F5F52323035350100000000000F000000434F445F5245494E465F5231303730
      01000000000010000000434F445F544142454C415F5245494E46010000000000
      12000000434F445F524547495354524F5F5245494E460100000000000C000000
      56414C5F43505F4E5F5245540100000000000E00000056414C5F5241545F444E
      5F5245540100000000000F00000056414C5F53454E41525F4E5F524554010000
      00000013000000434F445F53555350454E53414F5F5231303730010000000000}
    Master = QAquisicaoR2055
    MasterFields = 'COD_R2055_X_AQUISICAO'
    DetailFields = 'COD_REGISTRO_REINF'
    Session = DMOracle.DBCemapa
    Left = 824
    Top = 48
    object QTipoAquisicaoXR1070COD_R1070_X_AQUISICAO_R2055: TIntegerField
      FieldName = 'COD_R1070_X_AQUISICAO_R2055'
      Required = True
    end
    object QTipoAquisicaoXR1070COD_REINF_R1070: TIntegerField
      FieldName = 'COD_REINF_R1070'
      Required = True
    end
    object QTipoAquisicaoXR1070COD_TABELA_REINF: TStringField
      FieldName = 'COD_TABELA_REINF'
      Required = True
      Size = 6
    end
    object QTipoAquisicaoXR1070COD_REGISTRO_REINF: TIntegerField
      FieldName = 'COD_REGISTRO_REINF'
      Required = True
    end
    object QTipoAquisicaoXR1070COD_SUSPENSAO_R1070: TFloatField
      FieldName = 'COD_SUSPENSAO_R1070'
    end
    object QTipoAquisicaoXR1070VAL_CP_N_RET: TFloatField
      FieldName = 'VAL_CP_N_RET'
    end
    object QTipoAquisicaoXR1070VAL_RAT_DN_RET: TFloatField
      FieldName = 'VAL_RAT_DN_RET'
    end
    object QTipoAquisicaoXR1070VAL_SENAR_N_RET: TFloatField
      FieldName = 'VAL_SENAR_N_RET'
    end
  end
  object QAquisicaoR2055Cons: TOracleDataSet1
    SQL.Strings = (
      'select '
      '    TB_R2055_X_AQUISICAO.COD_R2055_X_AQUISICAO,'
      '    DECODE(TB_R2055_X_AQUISICAO.IND_AQUISICAO, '
      
        '            1, '#39'1 - Produtor rural pessoa f'#237'sica ou segurado esp' +
        'ecial em geral'#39',  '
      
        '            2, '#39'2 - Produtor rural pessoa f'#237'sica ou segurado esp' +
        'ecial em geral por por entidade executora de PAA'#39','
      
        '            3, '#39'3 - Produtor rural pessoa jur'#237'dica por entidade ' +
        'executora do PAA'#39','
      
        '            4, '#39'4 - Produtor rural pessoa f'#237'sica ou segurado esp' +
        'ecial em geral Produ'#231#227'o isenta (Lei 13.606/2018)'#39','
      
        '            5, '#39'5 - Produtor rural pessoa f'#237'sica ou segurado esp' +
        'ecial em geral por entidade executora do PAA Produ'#231#227'o isenta'#39','
      
        '            6, '#39'6 - Produtor rural pessoa jur'#237'dica por entidade ' +
        'executora do PAA Produ'#231#227'o isenta'#39','
      
        '            7, '#39'7 - Produtor rura l pessoa f'#237'sica ou segurado es' +
        'pecial para fins de exporta'#231#227'o'#39') IND_AQUISICAO,'
      '    TB_R2055_X_AQUISICAO.VAL_BRUTO,'
      #9'TB_R2055_X_AQUISICAO.VAL_CP_DESC_PR,'
      #9'TB_R2055_X_AQUISICAO.VAL_RAT_DESC_PR,'
      #9'TB_R2055_X_AQUISICAO.VAL_SENAR_DESC            '
      'from '
      '    TB_R2055_X_AQUISICAO'
      'INNER JOIN TB_REINF_R2055'
      
        'ON TB_REINF_R2055.COD_REINF_R2055 = TB_R2055_X_AQUISICAO.COD_REG' +
        'ISTRO_REINf'
      'where '
      'TB_R2055_X_AQUISICAO.cod_registro_reinf = :cod_registro_reinf'
      'and'
      'TB_R2055_X_AQUISICAO.COD_TABELA_REINF = '#39'R-2055'#39)
    Variables.Data = {
      0300000001000000130000003A434F445F524547495354524F5F5245494E4603
      0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000600000015000000434F445F52323035355F585F4151554953494341
      4F0100000000000D000000494E445F41515549534943414F0100000000000900
      000056414C5F425255544F0100000000000E00000056414C5F43505F44455343
      5F50520100000000000F00000056414C5F5241545F444553435F505201000000
      00000E00000056414C5F53454E41525F44455343010000000000}
    Session = DMOracle.DBCemapa
    Left = 694
    Top = 288
    object QAquisicaoR2055ConsCOD_R2055_X_AQUISICAO: TIntegerField
      FieldName = 'COD_R2055_X_AQUISICAO'
      Required = True
    end
    object QAquisicaoR2055ConsIND_AQUISICAO: TStringField
      FieldName = 'IND_AQUISICAO'
      Size = 108
    end
    object QAquisicaoR2055ConsVAL_BRUTO: TFloatField
      FieldName = 'VAL_BRUTO'
    end
    object QAquisicaoR2055ConsVAL_CP_DESC_PR: TFloatField
      FieldName = 'VAL_CP_DESC_PR'
    end
    object QAquisicaoR2055ConsVAL_RAT_DESC_PR: TFloatField
      FieldName = 'VAL_RAT_DESC_PR'
    end
    object QAquisicaoR2055ConsVAL_SENAR_DESC: TFloatField
      FieldName = 'VAL_SENAR_DESC'
    end
  end
  object QValidaSituacaoEnvio: TOracleDataSet1
    SQL.Strings = (
      'SELECT * FROM TB_REINF_PERIODO '
      'WHERE '
      '  COD_EVENTO_REINF = :COD_EVENTO'
      'and'
      '  DESC_EVENTO_REINF = :DESC_EVENTO')
    Variables.Data = {
      03000000020000000B0000003A434F445F4556454E544F030000000000000000
      0000000C0000003A444553435F4556454E544F050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001100000011000000434F445F5245494E465F504552494F444F010000
      00000011000000444553435F4556454E544F5F5245494E460100000000001000
      0000434F445F4556454E544F5F5245494E460100000000000A000000434F445F
      46494C49414C0100000000000D00000044545F494E495F4556454E544F010000
      0000000D00000044545F46494D5F4556454E544F0100000000000B0000004445
      53435F584D4C5F49440100000000000F000000444553435F584D4C5F4556454E
      544F00000000000013000000444553435F434F445F4552524F5F454E56494F01
      000000000010000000444553435F4D53475F5245544F524E4F01000000000013
      000000444553435F584D4C5F49445F5245544F524E4F01000000000010000000
      444553435F584D4C5F5245544F524E4F00000000000015000000444553435F58
      4D4C5F484153485F5245544F524E4F01000000000012000000444553435F584D
      4C5F50524F544F434F4C4F0100000000001000000044545F4745524143414F5F
      5245494E460100000000000C000000494E445F534954554143414F0100000000
      000B000000434F445F5553554152494F010000000000}
    Session = DMOracle.DBCemapa
    Left = 64
    Top = 536
    object QValidaSituacaoEnvioCOD_REINF_PERIODO: TIntegerField
      FieldName = 'COD_REINF_PERIODO'
      Required = True
    end
    object QValidaSituacaoEnvioDESC_EVENTO_REINF: TStringField
      FieldName = 'DESC_EVENTO_REINF'
      Required = True
      Size = 6
    end
    object QValidaSituacaoEnvioCOD_EVENTO_REINF: TIntegerField
      FieldName = 'COD_EVENTO_REINF'
      Required = True
    end
    object QValidaSituacaoEnvioCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
    end
    object QValidaSituacaoEnvioDT_INI_EVENTO: TDateTimeField
      FieldName = 'DT_INI_EVENTO'
    end
    object QValidaSituacaoEnvioDT_FIM_EVENTO: TDateTimeField
      FieldName = 'DT_FIM_EVENTO'
    end
    object QValidaSituacaoEnvioDESC_XML_ID: TStringField
      FieldName = 'DESC_XML_ID'
      Size = 40
    end
    object QValidaSituacaoEnvioDESC_XML_EVENTO: TMemoField
      FieldName = 'DESC_XML_EVENTO'
      BlobType = ftOraClob
    end
    object QValidaSituacaoEnvioDESC_COD_ERRO_ENVIO: TStringField
      FieldName = 'DESC_COD_ERRO_ENVIO'
      Size = 10
    end
    object QValidaSituacaoEnvioDESC_MSG_RETORNO: TMemoField
      FieldName = 'DESC_MSG_RETORNO'
      BlobType = ftOraClob
    end
    object QValidaSituacaoEnvioDESC_XML_ID_RETORNO: TStringField
      FieldName = 'DESC_XML_ID_RETORNO'
      Size = 40
    end
    object QValidaSituacaoEnvioDESC_XML_RETORNO: TMemoField
      FieldName = 'DESC_XML_RETORNO'
      BlobType = ftOraClob
    end
    object QValidaSituacaoEnvioDESC_XML_HASH_RETORNO: TStringField
      FieldName = 'DESC_XML_HASH_RETORNO'
      Size = 50
    end
    object QValidaSituacaoEnvioDESC_XML_PROTOCOLO: TStringField
      FieldName = 'DESC_XML_PROTOCOLO'
      Size = 30
    end
    object QValidaSituacaoEnvioDT_GERACAO_REINF: TDateTimeField
      FieldName = 'DT_GERACAO_REINF'
    end
    object QValidaSituacaoEnvioIND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Size = 10
    end
    object QValidaSituacaoEnvioCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
  end
  object DSTipoAquisicaoXR1070: TDataSource
    DataSet = QTipoAquisicaoXR1070
    Left = 824
    Top = 96
  end
  object QR1070SuspensaoLookup: TOracleDataSet1
    SQL.Strings = (
      'SELECT '
      '    TB_REINF_R1070.COD_REINF_R1070,'
      '    TB_REINF_R1070.COD_FILIAL,'
      '    TB_FILIAL.DESC_FILIAL,'
      '    TB_REINF_R1070.IND_INC_ALT_EXC,'
      '    TB_REINF_R1070.NUM_PROCESSO,'
      '    TB_REINF_R1070.DT_INI_VALIDADE,'
      '    TB_REINF_R1070.DT_FIM_VALIDADE,'
      '    TB_REINF_R1070.IND_AUTORIA_PROCESSO,'
      '    TB_REINF_R1070.COD_ESTADO,'
      '    TB_REINF_R1070.COD_CIDADE,'
      '    TB_REINF_R1070.IND_PRODUCAO_HOMOLOGACAO,'
      '    TB_R1070_X_SUSPENSAO.COD_SUSPENSAO_R1070'
      'FROM'
      ' TB_REINF_R1070'
      'left JOIN TB_FILIAL'
      'ON TB_FILIAL.COD_FILIAL = TB_REINF_R1070.COD_FILIAL'
      'LEFT JOIN TB_R1070_X_SUSPENSAO'
      
        'ON TB_R1070_X_SUSPENSAO.COD_REINF_R1070 = TB_REINF_R1070.COD_REI' +
        'NF_R1070')
    QBEDefinition.QBEFieldDefs = {
      040000000B0000000F000000434F445F5245494E465F52313037300100000000
      000A000000434F445F46494C49414C0100000000000B000000444553435F4649
      4C49414C0100000000000F000000494E445F494E435F414C545F455843010000
      0000000C0000004E554D5F50524F434553534F0100000000000F00000044545F
      494E495F56414C49444144450100000000000F00000044545F46494D5F56414C
      494441444501000000000014000000494E445F4155544F5249415F50524F4345
      53534F0100000000000A000000434F445F45535441444F0100000000000A0000
      00434F445F43494441444501000000000018000000494E445F50524F44554341
      4F5F484F4D4F4C4F474143414F010000000000}
    Session = DMOracle.DBCemapa
    Left = 272
    Top = 408
    object QR1070SuspensaoLookupCOD_REINF_R1070: TIntegerField
      FieldName = 'COD_REINF_R1070'
      Required = True
    end
    object QR1070SuspensaoLookupCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QR1070SuspensaoLookupDESC_FILIAL: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
    object QR1070SuspensaoLookupIND_INC_ALT_EXC: TIntegerField
      FieldName = 'IND_INC_ALT_EXC'
    end
    object QR1070SuspensaoLookupNUM_PROCESSO: TStringField
      FieldName = 'NUM_PROCESSO'
      Size = 21
    end
    object QR1070SuspensaoLookupDT_INI_VALIDADE: TDateTimeField
      FieldName = 'DT_INI_VALIDADE'
    end
    object QR1070SuspensaoLookupDT_FIM_VALIDADE: TDateTimeField
      FieldName = 'DT_FIM_VALIDADE'
    end
    object QR1070SuspensaoLookupIND_AUTORIA_PROCESSO: TIntegerField
      FieldName = 'IND_AUTORIA_PROCESSO'
    end
    object QR1070SuspensaoLookupCOD_ESTADO: TStringField
      FieldName = 'COD_ESTADO'
      Required = True
      Size = 2
    end
    object QR1070SuspensaoLookupCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
      Required = True
    end
    object QR1070SuspensaoLookupIND_PRODUCAO_HOMOLOGACAO: TIntegerField
      FieldName = 'IND_PRODUCAO_HOMOLOGACAO'
    end
  end
  object QSuspensaoLookup: TOracleDataSet1
    SQL.Strings = (
      'SELECT '
      '    TB_R1070_X_SUSPENSAO.COD_R1070_X_SUSPENSAO,'
      '    TB_SUSPENSAO_R1070.COD_SUSPENSAO_R1070,'
      '    TB_SUSPENSAO_R1070.COD_IND_SUSPENSAO'
      'FROM'
      ' TB_SUSPENSAO_R1070'
      'LEFT JOIN TB_R1070_X_SUSPENSAO'
      
        'ON TB_R1070_X_SUSPENSAO.COD_SUSPENSAO_R1070 = TB_SUSPENSAO_R1070' +
        '.COD_SUSPENSAO_R1070'
      'WHERE'
      
        '  TB_R1070_X_SUSPENSAO.COD_R1070_X_SUSPENSAO = :COD_R1070_SUSPEN' +
        'SAO')
    Variables.Data = {
      0300000001000000140000003A434F445F52313037305F53555350454E53414F
      030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000300000015000000434F445F52313037305F585F53555350454E5341
      4F01000000000013000000434F445F53555350454E53414F5F52313037300100
      0000000011000000434F445F494E445F53555350454E53414F010000000000}
    Master = QR1070SuspensaoLookup
    MasterFields = 'TB_R1070_X_SUSPENSAO.COD_SUSPENSAO_R1070'
    Session = DMOracle.DBCemapa
    Left = 392
    Top = 408
    object QSuspensaoLookupCOD_R1070_X_SUSPENSAO: TIntegerField
      FieldName = 'COD_R1070_X_SUSPENSAO'
    end
    object QSuspensaoLookupCOD_SUSPENSAO_R1070: TIntegerField
      FieldName = 'COD_SUSPENSAO_R1070'
      Required = True
    end
    object QSuspensaoLookupCOD_IND_SUSPENSAO: TFloatField
      FieldName = 'COD_IND_SUSPENSAO'
    end
  end
  object DSAquisicaoR2055: TDataSource
    DataSet = QAquisicaoR2055
    Left = 693
    Top = 240
  end
  object DSAquisicaor2055Cons: TDataSource
    DataSet = QAquisicaoR2055Cons
    Left = 696
    Top = 344
  end
  object QTipoAquisicaoXR1070Cons: TOracleDataSet1
    SQL.Strings = (
      'SELECT '
      '    TB_REINF_R1070.NUM_PROCESSO,'
      '    TB_REINF_R1070.NUM_VARA,'
      '    DECODE(TB_REINF_R1070.IND_AUTORIA_PROCESSO,  '
      '        1, '#39'PR'#211'PRIO CONTRIBUINTE'#39','
      '        2, '#39'TERCEIRO'#39') IND_AUTORIA_PROCESSO,'
      '    TB_R1070_X_AQUISICAO_R2055.* '
      'FROM '
      '    TB_R1070_X_AQUISICAO_R2055'
      'INNER JOIN TB_REINF_R1070'
      
        'ON TB_R1070_X_AQUISICAO_R2055.COD_REINF_R1070 = TB_REINF_R1070.C' +
        'OD_REINF_R1070'
      'WHERE'
      'TB_R1070_X_AQUISICAO_R2055.COD_TABELA_REINF = '#39'R-2055'#39
      'AND'
      '(:PK IS NULL'
      'OR TB_R1070_X_AQUISICAO_R2055.COD_R1070_X_AQUISICAO_R2055 = :PK)')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000B0000001B000000434F445F52313037305F585F4151554953494341
      4F5F52323035350100000000000F000000434F445F5245494E465F5231303730
      01000000000010000000434F445F544142454C415F5245494E46010000000000
      12000000434F445F524547495354524F5F5245494E460100000000000C000000
      56414C5F43505F4E5F5245540100000000000E00000056414C5F5241545F444E
      5F5245540100000000000F00000056414C5F53454E41525F4E5F524554010000
      0000000C0000004E554D5F50524F434553534F010000000000080000004E554D
      5F5641524101000000000014000000494E445F4155544F5249415F50524F4345
      53534F01000000000013000000434F445F53555350454E53414F5F5231303730
      010000000000}
    Session = DMOracle.DBCemapa
    Left = 824
    Top = 144
    object QTipoAquisicaoXR1070ConsCOD_R1070_X_AQUISICAO_R2055: TIntegerField
      FieldName = 'COD_R1070_X_AQUISICAO_R2055'
      Required = True
    end
    object QTipoAquisicaoXR1070ConsCOD_REINF_R1070: TIntegerField
      FieldName = 'COD_REINF_R1070'
      Required = True
    end
    object QTipoAquisicaoXR1070ConsCOD_TABELA_REINF: TStringField
      FieldName = 'COD_TABELA_REINF'
      Required = True
      Size = 6
    end
    object QTipoAquisicaoXR1070ConsCOD_REGISTRO_REINF: TIntegerField
      FieldName = 'COD_REGISTRO_REINF'
      Required = True
    end
    object QTipoAquisicaoXR1070ConsVAL_CP_N_RET: TFloatField
      FieldName = 'VAL_CP_N_RET'
    end
    object QTipoAquisicaoXR1070ConsVAL_RAT_DN_RET: TFloatField
      FieldName = 'VAL_RAT_DN_RET'
    end
    object QTipoAquisicaoXR1070ConsVAL_SENAR_N_RET: TFloatField
      FieldName = 'VAL_SENAR_N_RET'
    end
    object QTipoAquisicaoXR1070ConsNUM_PROCESSO: TStringField
      FieldName = 'NUM_PROCESSO'
      Size = 21
    end
    object QTipoAquisicaoXR1070ConsNUM_VARA: TIntegerField
      FieldName = 'NUM_VARA'
    end
    object QTipoAquisicaoXR1070ConsCOD_SUSPENSAO_R1070: TFloatField
      FieldName = 'COD_SUSPENSAO_R1070'
    end
    object QTipoAquisicaoXR1070ConsIND_AUTORIA_PROCESSO: TStringField
      FieldName = 'IND_AUTORIA_PROCESSO'
    end
  end
  object DSTipoAquisicaoXR1070Cons: TDataSource
    DataSet = QTipoAquisicaoXR1070Cons
    Left = 829
    Top = 195
  end
  object QR2055ProcessoSuspensaoCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT '
      '    TB_REINF_R1070.NUM_PROCESSO,'
      '    TB_REINF_R1070.DT_INI_VALIDADE,'
      '    TB_REINF_R1070.DT_FIM_VALIDADE,'
      '    TB_REINF_R1070.IND_AUTORIA_PROCESSO,'
      '    TB_REINF_R1070.COD_ESTADO,'
      '    TB_REINF_R1070.COD_CIDADE,'
      '    TB_REINF_R1070.COD_REINF_R1070,'
      '    TB_REINF_R1070.COD_FILIAL,'
      '    TB_FILIAL.DESC_FILIAL,'
      '    TB_CADASTRO.NOME,'
      '    TB_CADASTRO.NUM_CGC_CPF,'
      '    TB_CADASTRO.DESC_TELEFONE,'
      '    TB_CADASTRO.DESC_CELULAR,'
      '    TB_CADASTRO.DESC_E_MAIL'
      'FROM'
      ' TB_REINF_R1070'
      'left JOIN TB_FILIAL'
      'ON TB_FILIAL.COD_FILIAL = TB_REINF_R1070.COD_FILIAL'
      'left JOIN TB_CADASTRO'
      'ON TB_CADASTRO.COD_CADASTRO = TB_REINF_R1070.COD_CADASTRO'
      'left JOIN TB_USUARIO'
      'ON TB_USUARIO.COD_USUARIO = TB_REINF_R1070.COD_USUARIO'
      'WHERE'
      'TB_REINF_R1070.NUM_PROCESSO LIKE '#39'%'#39' || :NUM_PROCESSO || '#39'%'#39
      'OR'
      'TB_FILIAL.DESC_FILIAL LIKE '#39'%'#39' || :FILIAL || '#39'%'#39
      'OR '
      'TB_CADASTRO.NOME LIKE '#39'%'#39' || :NOME || '#39'%'#39)
    Variables.Data = {
      03000000030000000D0000003A4E554D5F50524F434553534F05000000000000
      0000000000070000003A46494C49414C05000000000000000000000005000000
      3A4E4F4D45050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000E0000000C0000004E554D5F50524F434553534F0100000000000F00
      000044545F494E495F56414C49444144450100000000000F00000044545F4649
      4D5F56414C494441444501000000000014000000494E445F4155544F5249415F
      50524F434553534F0100000000000A000000434F445F45535441444F01000000
      00000A000000434F445F4349444144450100000000000F000000434F445F5245
      494E465F52313037300100000000000A000000434F445F46494C49414C010000
      0000000B000000444553435F46494C49414C010000000000040000004E4F4D45
      0100000000000B0000004E554D5F4347435F4350460100000000000D00000044
      4553435F54454C45464F4E450100000000000C000000444553435F43454C554C
      41520100000000000B000000444553435F455F4D41494C010000000000}
    Session = DMOracle.DBCemapa
    Left = 824
    Top = 256
    object QR2055ProcessoSuspensaoConsNUM_PROCESSO: TStringField
      FieldName = 'NUM_PROCESSO'
      Size = 21
    end
    object QR2055ProcessoSuspensaoConsDT_INI_VALIDADE: TDateTimeField
      FieldName = 'DT_INI_VALIDADE'
    end
    object QR2055ProcessoSuspensaoConsDT_FIM_VALIDADE: TDateTimeField
      FieldName = 'DT_FIM_VALIDADE'
    end
    object QR2055ProcessoSuspensaoConsIND_AUTORIA_PROCESSO: TIntegerField
      FieldName = 'IND_AUTORIA_PROCESSO'
    end
    object QR2055ProcessoSuspensaoConsCOD_ESTADO: TStringField
      FieldName = 'COD_ESTADO'
      Required = True
      Size = 2
    end
    object QR2055ProcessoSuspensaoConsCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
      Required = True
    end
    object QR2055ProcessoSuspensaoConsCOD_REINF_R1070: TIntegerField
      FieldName = 'COD_REINF_R1070'
      Required = True
    end
    object QR2055ProcessoSuspensaoConsCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QR2055ProcessoSuspensaoConsDESC_FILIAL: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
    object QR2055ProcessoSuspensaoConsNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object QR2055ProcessoSuspensaoConsNUM_CGC_CPF: TStringField
      FieldName = 'NUM_CGC_CPF'
      Size = 18
    end
    object QR2055ProcessoSuspensaoConsDESC_TELEFONE: TStringField
      FieldName = 'DESC_TELEFONE'
      Size = 15
    end
    object QR2055ProcessoSuspensaoConsDESC_CELULAR: TStringField
      FieldName = 'DESC_CELULAR'
      Size = 15
    end
    object QR2055ProcessoSuspensaoConsDESC_E_MAIL: TStringField
      FieldName = 'DESC_E_MAIL'
      Size = 70
    end
  end
  object QReinfSuspProcR1070Cons: TOracleDataSet1
    SQL.Strings = (
      'SELECT '
      '  PROCSUSP.COD_R1070_X_SUSPENSAO,'
      '  SUSPENSAO.COD_SUSPENSAO_R1070,'
      '  SUSPENSAO.COD_IND_SUSPENSAO,'
      '  SUSPENSAO.DT_DECISAO,'
      '  SUSPENSAO.IND_DEPOSITO,'
      '  SUSPENSAO.IND_SUSPENSAO,'
      '  PROCSUSP.COD_REINF_R1070'
      'FROM TB_SUSPENSAO_R1070 SUSPENSAO'
      'INNER JOIN TB_R1070_X_SUSPENSAO PROCSUSP'
      'ON PROCSUSP.COD_SUSPENSAO_R1070 = SUSPENSAO.COD_SUSPENSAO_R1070'
      'INNER JOIN TB_REINF_R1070 R1070'
      'ON R1070.COD_REINF_R1070 = PROCSUSP.COD_REINF_R1070'
      'WHERE'
      'R1070.COD_REINF_R1070 = :COD_REINF_R1070'
      '')
    Variables.Data = {
      0300000001000000100000003A434F445F5245494E465F523130373003000000
      0000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000700000011000000434F445F494E445F53555350454E53414F010000
      0000000A00000044545F4445434953414F0100000000000C000000494E445F44
      45504F5349544F0100000000000D000000494E445F53555350454E53414F0100
      0000000013000000434F445F53555350454E53414F5F52313037300100000000
      000F000000434F445F5245494E465F523130373001000000000015000000434F
      445F52313037305F585F53555350454E53414F010000000000}
    Master = QReinfR1070
    MasterFields = 'COD_REINF_R1070'
    DetailFields = 'COD_REINF_R1070'
    Session = DMOracle.DBCemapa
    Left = 248
    Top = 248
    object QReinfSuspProcR1070ConsCOD_SUSPENSAO_R1070: TIntegerField
      FieldName = 'COD_SUSPENSAO_R1070'
    end
    object QReinfSuspProcR1070ConsCOD_IND_SUSPENSAO: TFloatField
      FieldName = 'COD_IND_SUSPENSAO'
    end
    object QReinfSuspProcR1070ConsDT_DECISAO: TDateTimeField
      FieldName = 'DT_DECISAO'
    end
    object QReinfSuspProcR1070ConsIND_DEPOSITO: TStringField
      FieldName = 'IND_DEPOSITO'
      Size = 1
    end
    object QReinfSuspProcR1070ConsIND_SUSPENSAO: TIntegerField
      FieldName = 'IND_SUSPENSAO'
    end
    object QReinfSuspProcR1070ConsCOD_REINF_R1070: TIntegerField
      FieldName = 'COD_REINF_R1070'
      Required = True
    end
    object QReinfSuspProcR1070ConsCOD_R1070_X_SUSPENSAO: TIntegerField
      FieldName = 'COD_R1070_X_SUSPENSAO'
      Required = True
    end
  end
  object DSR2055ProcessoSuspensaoCons: TDataSource
    DataSet = QR2055ProcessoSuspensaoCons
    Left = 824
    Top = 384
  end
  object QR2055SuspensaoCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT '
      '  PROCSUSP.COD_R1070_X_SUSPENSAO,'
      '  SUSPENSAO.COD_SUSPENSAO_R1070,'
      '  SUSPENSAO.COD_IND_SUSPENSAO,'
      '  SUSPENSAO.DT_DECISAO,'
      '  SUSPENSAO.IND_DEPOSITO,'
      '  SUSPENSAO.IND_SUSPENSAO,'
      '  PROCSUSP.COD_REINF_R1070'
      'FROM TB_SUSPENSAO_R1070 SUSPENSAO'
      'INNER JOIN TB_R1070_X_SUSPENSAO PROCSUSP'
      'ON PROCSUSP.COD_SUSPENSAO_R1070 = SUSPENSAO.COD_SUSPENSAO_R1070'
      'INNER JOIN TB_REINF_R1070 R1070'
      'ON R1070.COD_REINF_R1070 = PROCSUSP.COD_REINF_R1070'
      'WHERE'
      'R1070.COD_REINF_R1070 = :COD_REINF_R1070')
    Variables.Data = {
      0300000001000000100000003A434F445F5245494E465F523130373003000000
      0000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000700000015000000434F445F52313037305F585F53555350454E5341
      4F01000000000013000000434F445F53555350454E53414F5F52313037300100
      0000000011000000434F445F494E445F53555350454E53414F0100000000000A
      00000044545F4445434953414F0100000000000C000000494E445F4445504F53
      49544F0100000000000D000000494E445F53555350454E53414F010000000000
      0F000000434F445F5245494E465F5231303730010000000000}
    Session = DMOracle.DBCemapa
    Left = 824
    Top = 320
    object QR2055SuspensaoConsCOD_R1070_X_SUSPENSAO: TIntegerField
      FieldName = 'COD_R1070_X_SUSPENSAO'
      Required = True
    end
    object QR2055SuspensaoConsCOD_SUSPENSAO_R1070: TIntegerField
      FieldName = 'COD_SUSPENSAO_R1070'
      Required = True
    end
    object QR2055SuspensaoConsCOD_IND_SUSPENSAO: TFloatField
      FieldName = 'COD_IND_SUSPENSAO'
    end
    object QR2055SuspensaoConsDT_DECISAO: TDateTimeField
      FieldName = 'DT_DECISAO'
    end
    object QR2055SuspensaoConsIND_DEPOSITO: TStringField
      FieldName = 'IND_DEPOSITO'
      Size = 1
    end
    object QR2055SuspensaoConsIND_SUSPENSAO: TIntegerField
      FieldName = 'IND_SUSPENSAO'
    end
    object QR2055SuspensaoConsCOD_REINF_R1070: TIntegerField
      FieldName = 'COD_REINF_R1070'
      Required = True
    end
  end
  object QAquisicaoR2055Check: TOracleDataSet1
    SQL.Strings = (
      'select '
      '    TB_R2055_X_AQUISICAO.COD_R2055_X_AQUISICAO,'
      '    DECODE(TB_R2055_X_AQUISICAO.IND_AQUISICAO, '
      
        '            1, '#39'1 - Produtor rural pessoa f'#237'sica ou segurado esp' +
        'ecial em geral'#39',  '
      
        '            2, '#39'2 - Produtor rural pessoa f'#237'sica ou segurado esp' +
        'ecial em geral por por entidade executora de PAA'#39','
      
        '            3, '#39'3 - Produtor rural pessoa jur'#237'dica por entidade ' +
        'executora do PAA'#39','
      
        '            4, '#39'4 - Produtor rural pessoa f'#237'sica ou segurado esp' +
        'ecial em geral Produ'#231#227'o isenta (Lei 13.606/2018)'#39','
      
        '            5, '#39'5 - Produtor rural pessoa f'#237'sica ou segurado esp' +
        'ecial em geral por entidade executora do PAA Produ'#231#227'o isenta'#39','
      
        '            6, '#39'6 - Produtor rural pessoa jur'#237'dica por entidade ' +
        'executora do PAA Produ'#231#227'o isenta'#39','
      
        '            7, '#39'7 - Produtor rura l pessoa f'#237'sica ou segurado es' +
        'pecial para fins de exporta'#231#227'o'#39') IND_AQUISICAO,'
      '    TB_R2055_X_AQUISICAO.VAL_BRUTO,'
      #9'TB_R2055_X_AQUISICAO.VAL_CP_DESC_PR,'
      #9'TB_R2055_X_AQUISICAO.VAL_RAT_DESC_PR,'
      #9'TB_R2055_X_AQUISICAO.VAL_SENAR_DESC,'
      '    TB_R2055_X_AQUISICAO.COD_TABELA_REINF,'
      '    TB_R2055_X_AQUISICAO.COD_REGISTRO_REINF'
      'from '
      '    TB_R2055_X_AQUISICAO'
      'INNER JOIN TB_REINF_R2055'
      
        'ON TB_REINF_R2055.COD_REINF_R2055 = TB_R2055_X_AQUISICAO.COD_REG' +
        'ISTRO_REINf'
      'where '
      'TB_R2055_X_AQUISICAO.cod_registro_reinf = :cod_registro_reinf'
      'and'
      'TB_R2055_X_AQUISICAO.COD_TABELA_REINF = '#39'R-2055'#39)
    Variables.Data = {
      0300000001000000130000003A434F445F524547495354524F5F5245494E4603
      0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000800000015000000434F445F52323035355F585F4151554953494341
      4F0100000000000D000000494E445F41515549534943414F0100000000000900
      000056414C5F425255544F0100000000000E00000056414C5F43505F44455343
      5F50520100000000000F00000056414C5F5241545F444553435F505201000000
      00000E00000056414C5F53454E41525F4445534301000000000010000000434F
      445F544142454C415F5245494E4601000000000012000000434F445F52454749
      5354524F5F5245494E46010000000000}
    Session = DMOracle.DBCemapa
    Left = 699
    Top = 400
    object QAquisicaoR2055CheckCOD_R2055_X_AQUISICAO: TIntegerField
      FieldName = 'COD_R2055_X_AQUISICAO'
      Required = True
    end
    object QAquisicaoR2055CheckIND_AQUISICAO: TStringField
      FieldName = 'IND_AQUISICAO'
      Size = 108
    end
    object QAquisicaoR2055CheckVAL_BRUTO: TFloatField
      FieldName = 'VAL_BRUTO'
    end
    object QAquisicaoR2055CheckVAL_CP_DESC_PR: TFloatField
      FieldName = 'VAL_CP_DESC_PR'
    end
    object QAquisicaoR2055CheckVAL_RAT_DESC_PR: TFloatField
      FieldName = 'VAL_RAT_DESC_PR'
    end
    object QAquisicaoR2055CheckVAL_SENAR_DESC: TFloatField
      FieldName = 'VAL_SENAR_DESC'
    end
    object QAquisicaoR2055CheckCOD_TABELA_REINF: TStringField
      FieldName = 'COD_TABELA_REINF'
      Required = True
      Size = 6
    end
    object QAquisicaoR2055CheckCOD_REGISTRO_REINF: TIntegerField
      FieldName = 'COD_REGISTRO_REINF'
      Required = True
    end
  end
  object QAquisicaoGeracao: TOracleDataSet1
    SQL.Strings = (
      'select '
      'config.ind_aquisicao,'
      'nota.cod_filial,'
      'cadastro.num_cgc_cpf,'
      'cad_fil.cod_cadastro cad_fil,'
      'cadastro.ind_cprb,'
      'sum(item.val_total) val_total, '
      '(cadastro.perc_funrural /100) * sum(item.val_total) as funrural,'
      'case cadastro.ind_fisica_juridica'
      '    when '#39'J'#39' then ((1.7/100) * sum(item.val_total))'
      '    when '#39'F'#39' then ((1.2/100) * sum(item.val_total))'
      'end as INSS,'
      'case cadastro.ind_fisica_juridica'
      '    when '#39'J'#39' then ((0.25/100) * sum(item.val_total))'
      '    when '#39'F'#39' then ((0.2/100) * sum(item.val_total))'
      'end as SENAR,'
      '((0.1/100) * sum(item.val_total)) as RAT,'
      'cadastro.perc_funrural'
      'from'
      'tb_nota_item item'
      'inner join tb_nota_cab nota on '
      'nota.cod_nota_cab = item.cod_nota_cab'
      'inner join tb_cadastro cadastro on'
      'cadastro.cod_cadastro = nota.cod_cadastro'
      'inner join tb_operacao operacao on'
      'operacao.cod_operacao = nota.cod_operacao'
      'inner join tb_filial filial on'
      'filial.cod_filial = nota.cod_filial'
      'inner join tb_cadastro cad_fil on'
      'cad_fil.num_cgc_cpf = filial.num_cgc'
      'inner join TB_CONFIG_AQUISICAO_OPERACAO config on'
      'config.cod_filial = nota.cod_filial'
      'where'
      'config.cod_operacao = nota.cod_operacao'
      'and'
      'nota.ind_situacao = 2'
      'and'
      'cadastro.ind_cprb = '#39'N'#39
      'and'
      'nota.dt_recebimento between :data_ini and :data_fim'
      'and'
      'nota.cod_operacao in (:operacao)'
      'and'
      'nota.cod_filial = :filial'
      'and'
      'limpa_cnpj(cadastro.num_cgc_cpf) = :num_cgc_cpf'
      'group by'
      'config.ind_aquisicao,'
      'nota.cod_filial,'
      'cad_fil.cod_cadastro,'
      'cadastro.ind_cprb,'
      'cadastro.perc_funrural,'
      'cadastro.ind_fisica_juridica,'
      'cadastro.num_cgc_cpf')
    Variables.Data = {
      0300000005000000090000003A444154415F494E490C0000000700000078790A
      0101010100000000090000003A444154415F46494D0C0000000700000078790A
      1F01010100000000090000003A4F5045524143414F0100000004000000313032
      0000000000070000003A46494C49414C03000000040000000200000000000000
      0C0000003A4E554D5F4347435F435046050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000B0000000A000000434F445F46494C49414C01000000000008000000
      494E445F435052420100000000000900000056414C5F544F54414C0100000000
      000800000046554E525552414C01000000000004000000494E53530100000000
      000500000053454E4152010000000000030000005241540100000000000D0000
      00504552435F46554E525552414C010000000000070000004341445F46494C01
      00000000000D000000494E445F41515549534943414F0100000000000B000000
      4E554D5F4347435F435046010000000000}
    Session = DMOracle.DBCemapa
    Left = 688
    Top = 544
    object QAquisicaoGeracaoIND_AQUISICAO: TIntegerField
      FieldName = 'IND_AQUISICAO'
      Required = True
    end
    object QAquisicaoGeracaoCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QAquisicaoGeracaoNUM_CGC_CPF: TStringField
      FieldName = 'NUM_CGC_CPF'
      Size = 18
    end
    object QAquisicaoGeracaoCAD_FIL: TIntegerField
      FieldName = 'CAD_FIL'
      Required = True
    end
    object QAquisicaoGeracaoIND_CPRB: TStringField
      FieldName = 'IND_CPRB'
      Size = 1
    end
    object QAquisicaoGeracaoVAL_TOTAL: TFloatField
      FieldName = 'VAL_TOTAL'
    end
    object QAquisicaoGeracaoFUNRURAL: TFloatField
      FieldName = 'FUNRURAL'
    end
    object QAquisicaoGeracaoINSS: TFloatField
      FieldName = 'INSS'
    end
    object QAquisicaoGeracaoSENAR: TFloatField
      FieldName = 'SENAR'
    end
    object QAquisicaoGeracaoRAT: TFloatField
      FieldName = 'RAT'
    end
    object QAquisicaoGeracaoPERC_FUNRURAL: TFloatField
      FieldName = 'PERC_FUNRURAL'
    end
  end
  object QConfigAquisicaoOperacao: TOracleDataSet1
    SQL.Strings = (
      'select'
      '    rowid,'
      '    TB_CONFIG_AQUISICAO_OPERACAO.*'
      'from '
      'TB_CONFIG_AQUISICAO_OPERACAO'
      'where'
      '(:PK IS NULL '
      
        'OR TB_CONFIG_AQUISICAO_OPERACAO.COD_CONFIG_AQUISICAO_OPERACAO = ' +
        ':PK)'
      ' ')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_CONFIG_AQUISICAO_OPERACAO'
    SequenceField.Sequence = 'SQAQUISICAOFILIALOPERACAO'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      04000000040000001D000000434F445F434F4E4649475F41515549534943414F
      5F4F5045524143414F0100000000000A000000434F445F46494C49414C010000
      0000000C000000434F445F4F5045524143414F0100000000000D000000494E44
      5F41515549534943414F010000000000}
    Session = DMOracle.DBCemapa
    Left = 832
    Top = 496
    object QConfigAquisicaoOperacaoCOD_CONFIG_AQUISICAO_OPERACAO: TIntegerField
      FieldName = 'COD_CONFIG_AQUISICAO_OPERACAO'
      Required = True
    end
    object QConfigAquisicaoOperacaoCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QConfigAquisicaoOperacaoCOD_OPERACAO: TIntegerField
      FieldName = 'COD_OPERACAO'
      Required = True
    end
    object QConfigAquisicaoOperacaoIND_AQUISICAO: TIntegerField
      FieldName = 'IND_AQUISICAO'
      Required = True
    end
  end
  object QConfigAquisicaoCons: TOracleDataSet1
    SQL.Strings = (
      'select * from TB_CONFIG_AQUISICAO_OPERACAO'
      'where '
      'COD_FILIAL = :FILIAL'
      'and '
      'IND_AQUISICAO = :AQUISICAO'
      '')
    Variables.Data = {
      0300000002000000070000003A46494C49414C0300000000000000000000000A
      0000003A41515549534943414F030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000040000001D000000434F445F434F4E4649475F41515549534943414F
      5F4F5045524143414F0100000000000A000000434F445F46494C49414C010000
      0000000C000000434F445F4F5045524143414F0100000000000D000000494E44
      5F41515549534943414F010000000000}
    Session = DMOracle.DBCemapa
    Left = 840
    Top = 552
    object QConfigAquisicaoConsCOD_CONFIG_AQUISICAO_OPERACAO: TIntegerField
      FieldName = 'COD_CONFIG_AQUISICAO_OPERACAO'
      Required = True
    end
    object QConfigAquisicaoConsCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QConfigAquisicaoConsCOD_OPERACAO: TIntegerField
      FieldName = 'COD_OPERACAO'
      Required = True
    end
    object QConfigAquisicaoConsIND_AQUISICAO: TIntegerField
      FieldName = 'IND_AQUISICAO'
      Required = True
    end
  end
  object QCadastroAquisicao: TOracleDataSet1
    SQL.Strings = (
      'select distinct '
      'ind_aquisicao,'
      'num_cgc_cpf,'
      'ind_cprb,'
      'sum(val_total) as val_total, '
      'sum(funrural) as funrural,'
      'sum(inss) as INSS,'
      'sum(senar) as SENAR,'
      'sum(rat) as RAT,'
      'perc_funrural,'
      'desc_versao_reinf'
      'from'
      '('
      'select '
      'config.ind_aquisicao,'
      'nota.cod_filial,'
      'limpa_cnpj(cadastro.num_cgc_cpf) as NUM_CGC_CPF,'
      'cadastro.ind_cprb,'
      'sum(item.val_total) val_total, '
      '(cadastro.perc_funrural /100) * sum(item.val_total) as funrural,'
      'case cadastro.ind_fisica_juridica'
      '    when '#39'J'#39' then ((1.7/100) * sum(item.val_total))'
      '    when '#39'F'#39' then ((1.2/100) * sum(item.val_total))'
      'end as INSS,'
      'case cadastro.ind_fisica_juridica'
      '    when '#39'J'#39' then ((0.25/100) * sum(item.val_total))'
      '    when '#39'F'#39' then ((0.2/100) * sum(item.val_total))'
      'end as SENAR,'
      '((0.1/100) * sum(item.val_total)) as RAT,'
      'cadastro.perc_funrural,'
      'filial.desc_versao_reinf'
      'from'
      'tb_nota_item item'
      'inner join tb_nota_cab nota on '
      'nota.cod_nota_cab = item.cod_nota_cab'
      'inner join tb_cadastro cadastro on'
      'cadastro.cod_cadastro = nota.cod_cadastro'
      'inner join tb_operacao operacao on'
      'operacao.cod_operacao = nota.cod_operacao'
      'inner join tb_filial filial on'
      'filial.cod_filial = nota.cod_filial'
      'inner join tb_cadastro cad_fil on'
      'cad_fil.num_cgc_cpf = filial.num_cgc'
      'inner join TB_CONFIG_AQUISICAO_OPERACAO config on'
      'config.cod_filial = nota.cod_filial'
      'where'
      'config.cod_operacao = nota.cod_operacao'
      'and'
      'nota.ind_situacao = 2'
      'and'
      'nota.dt_recebimento between :data_ini and :data_fim'
      'and'
      'cadastro.ind_cprb = '#39'N'#39
      'and'
      'nota.cod_operacao in (:operacao)'
      'and'
      'nota.cod_filial = :filial'
      'group by'
      'config.ind_aquisicao,'
      'nota.cod_filial,'
      'nota.cod_cadastro,'
      'limpa_cnpj(cadastro.num_cgc_cpf),'
      'cad_fil.cod_cadastro,'
      'cadastro.ind_cprb,'
      'cadastro.perc_funrural,'
      'cadastro.ind_fisica_juridica,'
      'cadastro.num_cgc_cpf,'
      'cadastro.desc_inscricao_municipal,'
      'filial.desc_versao_reinf'
      'order by '
      '    num_cgc_cpf,'
      '    cod_cadastro'
      ')'
      'group by '
      'ind_aquisicao,'
      'cod_filial,'
      'num_cgc_cpf,'
      'ind_cprb,'
      'perc_funrural,'
      'desc_versao_reinf'
      'order by num_cgc_cpf')
    Variables.Data = {
      0300000004000000090000003A444154415F494E49050000000B00000030312F
      30362F323032320000000000090000003A444154415F46494D050000000B0000
      0033302F30362F323032320000000000090000003A4F5045524143414F010000
      00040000003130320000000000070000003A46494C49414C0300000004000000
      0200000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000A0000000D000000494E445F41515549534943414F01000000000008
      000000494E445F435052420100000000000900000056414C5F544F54414C0100
      000000000800000046554E525552414C01000000000004000000494E53530100
      000000000500000053454E415201000000000003000000524154010000000000
      0D000000504552435F46554E525552414C01000000000011000000444553435F
      56455253414F5F5245494E460100000000000B0000004E554D5F4347435F4350
      46010000000000}
    Session = DMOracle.DBCemapa
    Left = 688
    Top = 496
    object QCadastroAquisicaoIND_AQUISICAO: TIntegerField
      FieldName = 'IND_AQUISICAO'
      Required = True
    end
    object QCadastroAquisicaoNUM_CGC_CPF: TStringField
      FieldName = 'NUM_CGC_CPF'
      Size = 18
    end
    object QCadastroAquisicaoIND_CPRB: TStringField
      FieldName = 'IND_CPRB'
      Size = 1
    end
    object QCadastroAquisicaoVAL_TOTAL: TFloatField
      FieldName = 'VAL_TOTAL'
    end
    object QCadastroAquisicaoFUNRURAL: TFloatField
      FieldName = 'FUNRURAL'
    end
    object QCadastroAquisicaoINSS: TFloatField
      FieldName = 'INSS'
    end
    object QCadastroAquisicaoSENAR: TFloatField
      FieldName = 'SENAR'
    end
    object QCadastroAquisicaoRAT: TFloatField
      FieldName = 'RAT'
    end
    object QCadastroAquisicaoPERC_FUNRURAL: TFloatField
      FieldName = 'PERC_FUNRURAL'
    end
    object QCadastroAquisicaoDESC_VERSAO_REINF: TStringField
      FieldName = 'DESC_VERSAO_REINF'
      Size = 10
    end
  end
  object QReinfR2099: TOracleDataSet1
    SQL.Strings = (
      'select  '
      '  ROWID, '
      '  TB_REINF_R2099.* '
      'from TB_REINF_R2099'
      'where '
      '(:PK IS NULL OR'
      'TB_REINF_R2099.COD_REINF_R2099 = :PK)')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_REINF_R2099'
    SequenceField.Sequence = 'SQREINF_R2099'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      04000000110000000E000000494E445F5245544946434143414F010000000000
      1300000044545F504552494F444F5F415055524143414F010000000000180000
      00494E445F50524F445543414F5F484F4D4F4C4F474143414F01000000000013
      000000494E445F5449504F5F41504C4943415449564F0100000000000A000000
      434F445F46494C49414C0100000000000B000000434F445F5553554152494F01
      00000000000F000000434F445F5245494E465F52323039390100000000000C00
      0000434F445F434144415354524F0100000000000D000000494E445F4556545F
      52323031300100000000000D000000494E445F4556545F523230323001000000
      00000D000000494E445F4556545F52323033300100000000000D000000494E44
      5F4556545F52323034300100000000000D000000494E445F4556545F52323035
      300100000000000D000000494E445F4556545F52323036300100000000000D00
      0000494E445F4556545F523230353501000000000012000000494E445F455654
      5F504147414D454E544F5301000000000012000000434F4D505F53454D5F4D4F
      56494D454E544F010000000000}
    Session = DMOracle.DBCemapa
    Left = 968
    Top = 56
    object QReinfR2099COD_REINF_R2099: TIntegerField
      FieldName = 'COD_REINF_R2099'
      Required = True
    end
    object QReinfR2099IND_RETIFCACAO: TIntegerField
      FieldName = 'IND_RETIFCACAO'
    end
    object QReinfR2099DT_PERIODO_APURACAO: TDateTimeField
      FieldName = 'DT_PERIODO_APURACAO'
    end
    object QReinfR2099IND_PRODUCAO_HOMOLOGACAO: TIntegerField
      FieldName = 'IND_PRODUCAO_HOMOLOGACAO'
    end
    object QReinfR2099IND_TIPO_APLICATIVO: TIntegerField
      FieldName = 'IND_TIPO_APLICATIVO'
    end
    object QReinfR2099COD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QReinfR2099COD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QReinfR2099IND_EVT_R2010: TStringField
      FieldName = 'IND_EVT_R2010'
      Size = 1
    end
    object QReinfR2099IND_EVT_R2020: TStringField
      FieldName = 'IND_EVT_R2020'
      Size = 1
    end
    object QReinfR2099IND_EVT_R2030: TStringField
      FieldName = 'IND_EVT_R2030'
      Size = 1
    end
    object QReinfR2099IND_EVT_R2040: TStringField
      FieldName = 'IND_EVT_R2040'
      Size = 1
    end
    object QReinfR2099IND_EVT_R2050: TStringField
      FieldName = 'IND_EVT_R2050'
      Size = 1
    end
    object QReinfR2099IND_EVT_R2060: TStringField
      FieldName = 'IND_EVT_R2060'
      Size = 1
    end
    object QReinfR2099IND_EVT_R2055: TStringField
      FieldName = 'IND_EVT_R2055'
      Size = 1
    end
    object QReinfR2099IND_EVT_PAGAMENTOS: TStringField
      FieldName = 'IND_EVT_PAGAMENTOS'
      Size = 1
    end
    object QReinfR2099COMP_SEM_MOVIMENTO: TDateTimeField
      FieldName = 'COMP_SEM_MOVIMENTO'
    end
    object QReinfR2099COD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
  end
  object QRelatorioAquisicao: TOracleDataSet1
    SQL.Strings = (
      'select '
      'ind_aquisicao,'
      'cod_filial,'
      'num_nota,'
      'desc_filial,'
      'num_cgc_cpf,'
      'nome,'
      'ind_cprb,'
      'sum(val_total) val_total, '
      'sum(funrural) funrural,'
      'sum(INSS) inss,'
      'sum(SENAR) senar,'
      'sum(RAT) rat,'
      'perc_funrural,'
      'desc_versao_reinf,'
      'cod_cadastro'
      'from'
      '('
      'select '
      'config.ind_aquisicao,'
      'nota.cod_filial,'
      'nota.num_nota,'
      'filial.desc_filial,'
      'cadastro.num_cgc_cpf,'
      'cadastro.nome,'
      'cadastro.ind_cprb,'
      'sum(item.val_total) val_total, '
      '(cadastro.perc_funrural /100) * sum(item.val_total) as funrural,'
      'case cadastro.ind_fisica_juridica'
      '    when '#39'J'#39' then ((1.7/100) * sum(item.val_total))'
      '    when '#39'F'#39' then ((1.2/100) * sum(item.val_total))'
      'end as INSS,'
      'case cadastro.ind_fisica_juridica'
      '    when '#39'J'#39' then ((0.25/100) * sum(item.val_total))'
      '    when '#39'F'#39' then ((0.2/100) * sum(item.val_total))'
      'end as SENAR,'
      '((0.1/100) * sum(item.val_total)) as RAT,'
      'cadastro.perc_funrural,'
      'filial.desc_versao_reinf,'
      'nota.cod_cadastro'
      'from'
      'tb_nota_item item'
      'inner join tb_nota_cab nota on '
      'nota.cod_nota_cab = item.cod_nota_cab'
      'inner join tb_cadastro cadastro on'
      'cadastro.cod_cadastro = nota.cod_cadastro'
      'inner join tb_operacao operacao on'
      'operacao.cod_operacao = nota.cod_operacao'
      'inner join tb_filial filial on'
      'filial.cod_filial = nota.cod_filial'
      'inner join tb_cadastro cad_fil on'
      'cad_fil.num_cgc_cpf = filial.num_cgc'
      'inner join TB_CONFIG_AQUISICAO_OPERACAO config on'
      'config.cod_filial = nota.cod_filial'
      'where'
      'config.cod_operacao = nota.cod_operacao'
      'and'
      'nota.ind_situacao = 2'
      'and'
      'nota.dt_recebimento between :data_ini and :data_fim'
      'and'
      'nota.cod_operacao in (:operacao)'
      'and'
      'nota.cod_filial = :filial'
      'and'
      'cadastro.ind_cprb = '#39'N'#39
      'group by'
      'config.ind_aquisicao,'
      'nota.cod_filial,'
      'nota.num_nota,'
      'filial.desc_filial,'
      'nota.cod_cadastro,'
      'cadastro.nome,'
      'cadastro.ind_cprb,'
      'cadastro.perc_funrural,'
      'cadastro.ind_fisica_juridica,'
      'cadastro.num_cgc_cpf,'
      'cadastro.desc_inscricao_municipal,'
      'filial.desc_versao_reinf,'
      'nota.cod_cadastro'
      'order by cadastro.num_cgc_cpf'
      ')'
      'group by'
      'ind_aquisicao,'
      'cod_filial,'
      'num_nota,'
      'desc_filial,'
      'num_cgc_cpf,'
      'nome,'
      'ind_cprb,'
      'perc_funrural,'
      'desc_versao_reinf,'
      'cod_cadastro'
      'order by num_cgc_cpf, num_nota')
    Variables.Data = {
      0300000004000000090000003A444154415F494E490C0000000700000078790A
      0101010100000000090000003A444154415F46494D0C0000000700000078790A
      1F01010100000000090000003A4F5045524143414F0100000004000000313032
      0000000000070000003A46494C49414C030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000F0000000A000000434F445F46494C49414C01000000000008000000
      494E445F435052420100000000000900000056414C5F544F54414C0100000000
      000800000046554E525552414C01000000000004000000494E53530100000000
      000500000053454E4152010000000000030000005241540100000000000D0000
      00504552435F46554E525552414C0100000000000D000000494E445F41515549
      534943414F0100000000000B000000444553435F46494C49414C010000000000
      040000004E4F4D4501000000000011000000444553435F56455253414F5F5245
      494E46010000000000080000004E554D5F4E4F54410100000000000B0000004E
      554D5F4347435F4350460100000000000C000000434F445F434144415354524F
      010000000000}
    Session = DMOracle.DBCemapa
    Left = 984
    Top = 497
    object QRelatorioAquisicaoIND_AQUISICAO: TIntegerField
      FieldName = 'IND_AQUISICAO'
      Required = True
    end
    object QRelatorioAquisicaoCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QRelatorioAquisicaoNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
      Required = True
    end
    object QRelatorioAquisicaoDESC_FILIAL: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
    object QRelatorioAquisicaoNUM_CGC_CPF: TStringField
      FieldName = 'NUM_CGC_CPF'
      Size = 18
    end
    object QRelatorioAquisicaoNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object QRelatorioAquisicaoIND_CPRB: TStringField
      FieldName = 'IND_CPRB'
      Size = 1
    end
    object QRelatorioAquisicaoVAL_TOTAL: TFloatField
      FieldName = 'VAL_TOTAL'
    end
    object QRelatorioAquisicaoFUNRURAL: TFloatField
      FieldName = 'FUNRURAL'
    end
    object QRelatorioAquisicaoINSS: TFloatField
      FieldName = 'INSS'
    end
    object QRelatorioAquisicaoSENAR: TFloatField
      FieldName = 'SENAR'
    end
    object QRelatorioAquisicaoRAT: TFloatField
      FieldName = 'RAT'
    end
    object QRelatorioAquisicaoPERC_FUNRURAL: TFloatField
      FieldName = 'PERC_FUNRURAL'
    end
    object QRelatorioAquisicaoDESC_VERSAO_REINF: TStringField
      FieldName = 'DESC_VERSAO_REINF'
      Size = 10
    end
    object QRelatorioAquisicaoCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
  end
  object QRelatorioAquisicaoNota: TOracleDataSet1
    SQL.Strings = (
      'select '
      'config.ind_aquisicao,'
      'nota.cod_filial,'
      'nota.num_nota,'
      'filial.desc_filial,'
      'cadastro.num_cgc_cpf,'
      'cadastro.nome,'
      'cadastro.ind_cprb,'
      'sum(item.val_total) val_total, '
      '(cadastro.perc_funrural /100) * sum(item.val_total) as funrural,'
      'case cadastro.ind_fisica_juridica'
      '    when '#39'J'#39' then ((1.7/100) * sum(item.val_total))'
      '    when '#39'F'#39' then ((1.2/100) * sum(item.val_total))'
      'end as INSS,'
      'case cadastro.ind_fisica_juridica'
      '    when '#39'J'#39' then ((0.25/100) * sum(item.val_total))'
      '    when '#39'F'#39' then ((0.2/100) * sum(item.val_total))'
      'end as SENAR,'
      '((0.1/100) * sum(item.val_total)) as RAT,'
      'cadastro.perc_funrural,'
      'filial.desc_versao_reinf'
      'from'
      'tb_nota_item item'
      'inner join tb_nota_cab nota on '
      'nota.cod_nota_cab = item.cod_nota_cab'
      'inner join tb_cadastro cadastro on'
      'cadastro.cod_cadastro = nota.cod_cadastro'
      'inner join tb_operacao operacao on'
      'operacao.cod_operacao = nota.cod_operacao'
      'inner join tb_filial filial on'
      'filial.cod_filial = nota.cod_filial'
      'inner join tb_cadastro cad_fil on'
      'cad_fil.num_cgc_cpf = filial.num_cgc'
      'inner join TB_CONFIG_AQUISICAO_OPERACAO config on'
      'config.cod_filial = nota.cod_filial'
      'where'
      'config.cod_operacao = nota.cod_operacao'
      'and'
      'nota.ind_situacao = 2'
      'and'
      'nota.dt_recebimento between :data_ini and :data_fim'
      'and'
      'nota.cod_operacao in (:operacao)'
      'and'
      'nota.cod_filial = :filial'
      'and'
      'cadastro.ind_cprb = '#39'N'#39
      'group by'
      'config.ind_aquisicao,'
      'nota.cod_filial,'
      'nota.num_nota,'
      'filial.desc_filial,'
      'nota.cod_cadastro,'
      'cadastro.nome,'
      'cadastro.ind_cprb,'
      'cadastro.perc_funrural,'
      'cadastro.ind_fisica_juridica,'
      'cadastro.num_cgc_cpf,'
      'cadastro.desc_inscricao_municipal,'
      'filial.desc_versao_reinf'
      'order by cadastro.num_cgc_cpf')
    Variables.Data = {
      0300000004000000090000003A444154415F494E490C0000000700000078790A
      0101010100000000090000003A444154415F46494D0C0000000700000078790A
      1F01010100000000090000003A4F5045524143414F0100000004000000313032
      0000000000070000003A46494C49414C030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000E0000000A000000434F445F46494C49414C01000000000008000000
      494E445F435052420100000000000900000056414C5F544F54414C0100000000
      000800000046554E525552414C01000000000004000000494E53530100000000
      000500000053454E4152010000000000030000005241540100000000000D0000
      00504552435F46554E525552414C0100000000000D000000494E445F41515549
      534943414F0100000000000B000000444553435F46494C49414C010000000000
      040000004E4F4D4501000000000011000000444553435F56455253414F5F5245
      494E46010000000000080000004E554D5F4E4F54410100000000000B0000004E
      554D5F4347435F435046010000000000}
    Session = DMOracle.DBCemapa
    Left = 984
    Top = 544
    object IntegerField1: TIntegerField
      FieldName = 'IND_AQUISICAO'
      Required = True
    end
    object IntegerField2: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object IntegerField3: TIntegerField
      FieldName = 'NUM_NOTA'
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
    object StringField2: TStringField
      FieldName = 'NUM_CGC_CPF'
      Size = 18
    end
    object StringField3: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object StringField4: TStringField
      FieldName = 'IND_CPRB'
      Size = 1
    end
    object FloatField1: TFloatField
      FieldName = 'VAL_TOTAL'
    end
    object FloatField2: TFloatField
      FieldName = 'FUNRURAL'
    end
    object FloatField3: TFloatField
      FieldName = 'INSS'
    end
    object FloatField4: TFloatField
      FieldName = 'SENAR'
    end
    object FloatField5: TFloatField
      FieldName = 'RAT'
    end
    object FloatField6: TFloatField
      FieldName = 'PERC_FUNRURAL'
    end
    object StringField5: TStringField
      FieldName = 'DESC_VERSAO_REINF'
      Size = 10
    end
  end
  object QReinfR2099Cons: TOracleDataSet1
    SQL.Strings = (
      'select  '
      '  TB_REINF_R2099.* '
      'from TB_REINF_R2099')
    SequenceField.Field = 'COD_REINF_R2099'
    SequenceField.Sequence = 'SQREINF_R2099'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      04000000110000000E000000494E445F5245544946434143414F010000000000
      1300000044545F504552494F444F5F415055524143414F010000000000180000
      00494E445F50524F445543414F5F484F4D4F4C4F474143414F01000000000013
      000000494E445F5449504F5F41504C4943415449564F0100000000000A000000
      434F445F46494C49414C0100000000000B000000434F445F5553554152494F01
      00000000000F000000434F445F5245494E465F52323039390100000000000C00
      0000434F445F434144415354524F0100000000000D000000494E445F4556545F
      52323031300100000000000D000000494E445F4556545F523230323001000000
      00000D000000494E445F4556545F52323033300100000000000D000000494E44
      5F4556545F52323034300100000000000D000000494E445F4556545F52323035
      300100000000000D000000494E445F4556545F52323036300100000000000D00
      0000494E445F4556545F523230353501000000000012000000494E445F455654
      5F504147414D454E544F5301000000000012000000434F4D505F53454D5F4D4F
      56494D454E544F010000000000}
    Session = DMOracle.DBCemapa
    Left = 968
    Top = 112
    object QReinfR2099ConsCOD_REINF_R2099: TIntegerField
      FieldName = 'COD_REINF_R2099'
      Required = True
    end
    object QReinfR2099ConsIND_RETIFCACAO: TIntegerField
      FieldName = 'IND_RETIFCACAO'
      Required = True
    end
    object QReinfR2099ConsDT_PERIODO_APURACAO: TDateTimeField
      FieldName = 'DT_PERIODO_APURACAO'
    end
    object QReinfR2099ConsIND_PRODUCAO_HOMOLOGACAO: TIntegerField
      FieldName = 'IND_PRODUCAO_HOMOLOGACAO'
    end
    object QReinfR2099ConsIND_TIPO_APLICATIVO: TIntegerField
      FieldName = 'IND_TIPO_APLICATIVO'
    end
    object QReinfR2099ConsCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QReinfR2099ConsCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QReinfR2099ConsIND_EVT_R2010: TStringField
      FieldName = 'IND_EVT_R2010'
      Size = 1
    end
    object QReinfR2099ConsIND_EVT_R2020: TStringField
      FieldName = 'IND_EVT_R2020'
      Size = 1
    end
    object QReinfR2099ConsIND_EVT_R2030: TStringField
      FieldName = 'IND_EVT_R2030'
      Size = 1
    end
    object QReinfR2099ConsIND_EVT_R2040: TStringField
      FieldName = 'IND_EVT_R2040'
      Size = 1
    end
    object QReinfR2099ConsIND_EVT_R2050: TStringField
      FieldName = 'IND_EVT_R2050'
      Size = 1
    end
    object QReinfR2099ConsIND_EVT_R2060: TStringField
      FieldName = 'IND_EVT_R2060'
      Size = 1
    end
    object QReinfR2099ConsIND_EVT_R2055: TStringField
      FieldName = 'IND_EVT_R2055'
      Size = 1
    end
    object QReinfR2099ConsIND_EVT_PAGAMENTOS: TStringField
      FieldName = 'IND_EVT_PAGAMENTOS'
      Size = 1
    end
    object QReinfR2099ConsCOMP_SEM_MOVIMENTO: TDateTimeField
      FieldName = 'COMP_SEM_MOVIMENTO'
    end
    object QReinfR2099ConsCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
  end
  object DSReinfR2099Cons: TDataSource
    DataSet = QReinfR2099Cons
    Left = 968
    Top = 168
  end
  object DSReinfR2098Cons: TDataSource
    DataSet = QReinfR2098Cons
    Left = 984
    Top = 408
  end
  object QReinfR2098: TOracleDataSet1
    SQL.Strings = (
      'select '
      '  rowid, '
      '  TB_REINF_R2098.* from tb_reinf_r2098'
      'where'
      '(:PK IS NULL'
      'OR'
      'TB_REINF_R2098.COD_REINF_R2098 = :PK)')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_REINF_R2098'
    SequenceField.Sequence = 'SQREINF_R2098'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      04000000070000000F000000434F445F5245494E465F52323039380100000000
      000E000000494E445F5245544946434143414F0100000000001300000044545F
      504552494F444F5F415055524143414F01000000000018000000494E445F5052
      4F445543414F5F484F4D4F4C4F474143414F01000000000013000000494E445F
      5449504F5F41504C4943415449564F0100000000000A000000434F445F46494C
      49414C0100000000000B000000434F445F5553554152494F010000000000}
    Session = DMOracle.DBCemapa
    Left = 984
    Top = 312
    object QReinfR2098COD_REINF_R2098: TIntegerField
      FieldName = 'COD_REINF_R2098'
      Required = True
    end
    object QReinfR2098IND_RETIFCACAO: TIntegerField
      FieldName = 'IND_RETIFCACAO'
      Required = True
    end
    object QReinfR2098DT_PERIODO_APURACAO: TDateTimeField
      FieldName = 'DT_PERIODO_APURACAO'
    end
    object QReinfR2098IND_PRODUCAO_HOMOLOGACAO: TIntegerField
      FieldName = 'IND_PRODUCAO_HOMOLOGACAO'
    end
    object QReinfR2098IND_TIPO_APLICATIVO: TIntegerField
      FieldName = 'IND_TIPO_APLICATIVO'
    end
    object QReinfR2098COD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QReinfR2098COD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
  end
  object QReinfR2098Cons: TOracleDataSet1
    SQL.Strings = (
      'select * from tb_reinf_r2098'
      '')
    QBEDefinition.QBEFieldDefs = {
      04000000070000000F000000434F445F5245494E465F52323039380100000000
      000E000000494E445F5245544946434143414F0100000000001300000044545F
      504552494F444F5F415055524143414F01000000000018000000494E445F5052
      4F445543414F5F484F4D4F4C4F474143414F01000000000013000000494E445F
      5449504F5F41504C4943415449564F0100000000000A000000434F445F46494C
      49414C0100000000000B000000434F445F5553554152494F010000000000}
    Session = DMOracle.DBCemapa
    Active = True
    Left = 984
    Top = 360
    object QReinfR2098ConsCOD_REINF_R2098: TIntegerField
      FieldName = 'COD_REINF_R2098'
      Required = True
    end
    object QReinfR2098ConsIND_RETIFCACAO: TIntegerField
      FieldName = 'IND_RETIFCACAO'
      Required = True
    end
    object QReinfR2098ConsDT_PERIODO_APURACAO: TDateTimeField
      FieldName = 'DT_PERIODO_APURACAO'
    end
    object QReinfR2098ConsIND_PRODUCAO_HOMOLOGACAO: TIntegerField
      FieldName = 'IND_PRODUCAO_HOMOLOGACAO'
    end
    object QReinfR2098ConsIND_TIPO_APLICATIVO: TIntegerField
      FieldName = 'IND_TIPO_APLICATIVO'
    end
    object QReinfR2098ConsCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QReinfR2098ConsCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
  end
  object QNotaReinfR2010Geracao: TOracleDataSet1
    SQL.Strings = (
      'SELECT '
      '  TB_NOTA_X_REGISTRO_REINF.COD_NOTA_X_REGISTRO_REINF,'
      '  TB_NOTA_CAB.COD_SERIE,'
      '  TB_NOTA_CAB.NUM_NOTA,  '
      '  TB_NOTA_CAB.DT_EMISSAO,'
      
        '  (SELECT SUM(TB_NOTA_ITEM.VAL_TOTAL - TB_NOTA_ITEM.VAL_DESCONTO' +
        ' - TB_NOTA_ITEM.VAL_DESCONTO_RATEIO) '
      '                FROM TB_NOTA_ITEM '
      
        '                WHERE TB_NOTA_ITEM.COD_NOTA_CAB = TB_NOTA_CAB.CO' +
        'D_NOTA_CAB) VAL_BRUTO,'
      '  TB_NOTA_CAB.OBS,'
      '  TB_CADASTRO.NOME'
      'FROM TB_NOTA_X_REGISTRO_REINF'
      'LEFT JOIN TB_NOTA_CAB '
      
        'ON TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_X_REGISTRO_REINF.COD_NOTA_' +
        'CAB'
      'LEFT JOIN TB_REINF_R2010'
      
        'ON TB_REINF_R2010.COD_REINF_R2010 = TB_NOTA_X_REGISTRO_REINF.COD' +
        '_REGISTRO_REINF'
      'LEFT JOIN TB_CADASTRO'
      'ON TB_CADASTRO.COD_CADASTRO = TB_NOTA_CAB.COD_CADASTRO'
      'WHERE'
      'TB_NOTA_X_REGISTRO_REINF.COD_TABELA_REINF = '#39'R-2010'#39
      'and'
      '(:COD_REGISTRO_REINF IS NULL '
      'OR'
      
        'TB_NOTA_X_REGISTRO_REINF.COD_REGISTRO_REINF = :COD_REGISTRO_REIN' +
        'F)'
      '')
    Variables.Data = {
      0300000001000000130000003A434F445F524547495354524F5F5245494E4605
      0000000000000000000000}
    SequenceField.Field = 'COD_NOTA_X_REGISTRO_REINF'
    SequenceField.Sequence = 'SQNOTA_X_REGISTRO_REINF'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000700000019000000434F445F4E4F54415F585F524547495354524F5F
      5245494E4601000000000009000000434F445F53455249450100000000000800
      00004E554D5F4E4F54410100000000000A00000044545F454D495353414F0100
      000000000900000056414C5F425255544F010000000000030000004F42530100
      00000000040000004E4F4D45010000000000}
    Session = DMOracle.DBCemapa
    Left = 481
    Top = 506
    object QNotaReinfR2010GeracaoCOD_NOTA_X_REGISTRO_REINF: TIntegerField
      FieldName = 'COD_NOTA_X_REGISTRO_REINF'
      Required = True
    end
    object QNotaReinfR2010GeracaoCOD_SERIE: TStringField
      FieldName = 'COD_SERIE'
      Size = 3
    end
    object QNotaReinfR2010GeracaoNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
    end
    object QNotaReinfR2010GeracaoDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
    object QNotaReinfR2010GeracaoVAL_BRUTO: TFloatField
      FieldName = 'VAL_BRUTO'
    end
    object QNotaReinfR2010GeracaoOBS: TStringField
      FieldName = 'OBS'
      Size = 200
    end
    object QNotaReinfR2010GeracaoNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
  end
  object QGeraR2099: TOracleDataSet1
    SQL.Strings = (
      'select  '
      '   distinct DESC_EVENTO_REINF, DT_INI_EVENTO, IND_SITUACAO'
      'from TB_REINF_PERIODO'
      'where '
      'DT_INI_EVENTO = :DT_INI_EVENTO'
      'AND'
      'IND_SITUACAO = '#39'ENVIADO'#39
      '')
    Variables.Data = {
      03000000010000000E0000003A44545F494E495F4556454E544F0C0000000000
      000000000000}
    SequenceField.Field = 'COD_REINF_R2099'
    SequenceField.Sequence = 'SQREINF_R2099'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000300000011000000444553435F4556454E544F5F5245494E46010000
      0000000D00000044545F494E495F4556454E544F0100000000000C000000494E
      445F534954554143414F010000000000}
    Session = DMOracle.DBCemapa
    Left = 976
    Top = 224
    object QGeraR2099DESC_EVENTO_REINF: TStringField
      FieldName = 'DESC_EVENTO_REINF'
      Required = True
      Size = 6
    end
    object QGeraR2099DT_INI_EVENTO: TDateTimeField
      FieldName = 'DT_INI_EVENTO'
    end
    object QGeraR2099IND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Size = 10
    end
  end
end
