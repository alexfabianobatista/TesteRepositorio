object DMManifesto: TDMManifesto
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 476
  Top = 213
  Height = 253
  Width = 547
  object QManifestoCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '   M.COD_MANIFESTO,'
      '   M.NUM_MANIFESTO,'
      '   M.DT_EMISSAO,'
      '   F.DESC_FILIAL,'
      '   M.DESC_CHAVE_ACESSO,'
      '   M.COD_FILIAL,'
      '   M.COD_SERIE,'
      '   M.COD_BANCO_AGENCIA'
      'FROM'
      '   TB_MANIFESTO M,'
      '   TB_FILIAL F'
      'WHERE'
      '   M.COD_FILIAL = F.COD_FILIAL'
      '   AND'
      '   (:COD_FILIAL IS NULL'
      '    OR'
      '     M.COD_FILIAL=:COD_FILIAL)'
      '   AND'
      '   (:SITUACAO IS NULL'
      '    OR'
      '     M.IND_SITUACAO =:SITUACAO)'
      '   AND'
      '   (:NUM_MANIFESTO IS NULL'
      '    OR'
      '     M.NUM_MANIFESTO= :NUM_MANIFESTO)'
      '   AND'
      '   (:DT_EMISSAO_INI IS NULL OR'
      '    M.DT_EMISSAO >= :DT_EMISSAO_INI)'
      '   AND'
      '   (:DT_EMISSAO_FIM IS NULL OR'
      '    M.DT_EMISSAO <= :DT_EMISSAO_FIM)'
      'ORDER BY NUM_MANIFESTO')
    Variables.Data = {
      03000000050000000B0000003A434F445F46494C49414C030000000000000000
      000000090000003A534954554143414F0500000000000000000000000F000000
      3A44545F454D495353414F5F494E490C00000000000000000000000F0000003A
      44545F454D495353414F5F46494D0C00000000000000000000000E0000003A4E
      554D5F4D414E49464553544F030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000080000000A00000044545F454D495353414F0100000000000B000000
      444553435F46494C49414C0100000000000A000000434F445F46494C49414C01
      000000000009000000434F445F53455249450100000000000D000000434F445F
      4D414E49464553544F0100000000000D0000004E554D5F4D414E49464553544F
      01000000000011000000444553435F43484156455F41434553534F0100000000
      0011000000434F445F42414E434F5F4147454E434941010000000000}
    Session = DMOracle.DBCemapa
    Left = 103
    Top = 9
    object QManifestoConsCOD_MANIFESTO: TIntegerField
      FieldName = 'COD_MANIFESTO'
      Required = True
    end
    object QManifestoConsNUM_MANIFESTO: TIntegerField
      FieldName = 'NUM_MANIFESTO'
      Required = True
    end
    object QManifestoConsDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
    object QManifestoConsDESC_FILIAL: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
    object QManifestoConsDESC_CHAVE_ACESSO: TStringField
      FieldName = 'DESC_CHAVE_ACESSO'
      Size = 47
    end
    object QManifestoConsCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QManifestoConsCOD_SERIE: TStringField
      FieldName = 'COD_SERIE'
      Required = True
      Size = 3
    end
    object QManifestoConsCOD_BANCO_AGENCIA: TIntegerField
      FieldName = 'COD_BANCO_AGENCIA'
    end
  end
  object QVeiculoMDFe: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_VEICULO_MDFE.*'
      'FROM'
      '  TB_VEICULO_MDFE'
      'where cod_manifesto = :cod_manifesto')
    Variables.Data = {
      03000000010000000E0000003A434F445F4D414E49464553544F030000000000
      000000000000}
    SequenceField.Field = 'COD_VEICULO_MDFE'
    SequenceField.Sequence = 'SQVEICULO_MDFE'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      04000000030000000A000000444553435F504C41434101000000000010000000
      434F445F56454943554C4F5F4D4446450100000000000D000000434F445F4D41
      4E49464553544F010000000000}
    Master = QManifesto
    MasterFields = 'COD_MANIFESTO'
    DetailFields = 'COD_MANIFESTO'
    RefreshOptions = [roBeforeEdit, roAllFields]
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    BeforeInsert = QVeiculoMDFeBeforeEdit
    AfterInsert = QVeiculoMDFeAfterInsert
    BeforeEdit = QVeiculoMDFeBeforeEdit
    AfterPost = QVeiculoMDFeAfterPost
    BeforeDelete = QVeiculoMDFeBeforeDelete
    OnCalcFields = QVeiculoMDFeCalcFields
    Left = 25
    Top = 58
    object QVeiculoMDFeCOD_VEICULO_MDFE: TIntegerField
      FieldName = 'COD_VEICULO_MDFE'
      Required = True
    end
    object QVeiculoMDFeCOD_MANIFESTO: TIntegerField
      FieldName = 'COD_MANIFESTO'
      Required = True
    end
    object QVeiculoMDFeDESC_PLACA: TStringField
      FieldName = 'DESC_PLACA'
      Required = True
      Size = 8
    end
    object QVeiculoMDFedesc_veiculo: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_veiculo'
      Size = 60
      Calculated = True
    end
  end
  object QCondutorMDFe: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_CONDUTOR_MDFE.*'
      'FROM'
      '  TB_CONDUTOR_MDFE'
      'where COD_MANIFESTO = :COD_MANIFESTO')
    Variables.Data = {
      03000000010000000E0000003A434F445F4D414E49464553544F030000000000
      000000000000}
    SequenceField.Field = 'COD_CONDUTOR_MDFE'
    SequenceField.Sequence = 'SQCONDUTOR_MDFE'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      04000000030000000C000000434F445F434144415354524F0100000000001100
      0000434F445F434F4E4455544F525F4D4446450100000000000D000000434F44
      5F4D414E49464553544F010000000000}
    Master = QManifesto
    MasterFields = 'COD_MANIFESTO'
    DetailFields = 'COD_MANIFESTO'
    RefreshOptions = [roBeforeEdit, roAllFields]
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    BeforeInsert = QVeiculoMDFeBeforeEdit
    AfterInsert = QCondutorMDFeAfterInsert
    BeforeEdit = QVeiculoMDFeBeforeEdit
    AfterPost = QCondutorMDFeAfterPost
    BeforeDelete = QCondutorMDFeBeforeDelete
    OnCalcFields = QCondutorMDFeCalcFields
    Left = 104
    Top = 58
    object QCondutorMDFeCOD_CONDUTOR_MDFE: TIntegerField
      FieldName = 'COD_CONDUTOR_MDFE'
      Required = True
    end
    object QCondutorMDFeCOD_MANIFESTO: TIntegerField
      FieldName = 'COD_MANIFESTO'
      Required = True
    end
    object QCondutorMDFeCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
    end
    object QCondutorMDFenome: TStringField
      FieldKind = fkCalculated
      FieldName = 'nome'
      Calculated = True
    end
    object QCondutorMDFedesc_cpf: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_cpf'
      Calculated = True
    end
  end
  object QCidadeCarrega: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  CC.ROWID,'
      '  CC.COD_CIDADE_CARREGA,'
      '  CC.COD_MANIFESTO,'
      '  CC.COD_CIDADE,'
      '  CID.DESC_CIDADE,'
      '  CID.COD_CIDADE_IBGE,'
      '  CID.COD_ESTADO'
      'FROM'
      '  TB_CIDADE_CARREGA CC'
      'LEFT JOIN'
      '  TB_CIDADE CID'
      'ON'
      '  CID.COD_CIDADE = CC.COD_CIDADE'
      'where cod_manifesto = :cod_manifesto')
    Variables.Data = {
      03000000010000000E0000003A434F445F4D414E49464553544F030000000000
      000000000000}
    SequenceField.Field = 'COD_CIDADE_CARREGA'
    SequenceField.Sequence = 'SQCIDADE_CARREGA'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      04000000060000000D000000434F445F4D414E49464553544F01000000000012
      000000434F445F4349444144455F434152524547410100000000000A00000043
      4F445F4349444144450100000000000B000000444553435F4349444144450100
      000000000F000000434F445F4349444144455F494247450100000000000A0000
      00434F445F45535441444F010000000000}
    Master = QManifesto
    MasterFields = 'COD_MANIFESTO'
    DetailFields = 'COD_MANIFESTO'
    RefreshOptions = [roBeforeEdit, roAllFields]
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    BeforeInsert = QVeiculoMDFeBeforeEdit
    AfterInsert = QCidadeCarregaAfterInsert
    BeforeEdit = QVeiculoMDFeBeforeEdit
    AfterPost = QCidadeCarregaAfterPost
    BeforeDelete = QCidadeCarregaBeforeDelete
    Left = 193
    Top = 10
    object QCidadeCarregaCOD_CIDADE_CARREGA: TIntegerField
      FieldName = 'COD_CIDADE_CARREGA'
      Required = True
    end
    object QCidadeCarregaCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
      Required = True
    end
    object QCidadeCarregaCOD_MANIFESTO: TIntegerField
      FieldName = 'COD_MANIFESTO'
      Required = True
    end
    object QCidadeCarregaDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      Size = 50
    end
    object QCidadeCarregaCOD_CIDADE_IBGE: TStringField
      FieldName = 'COD_CIDADE_IBGE'
      Size = 5
    end
    object QCidadeCarregaCOD_ESTADO: TStringField
      FieldName = 'COD_ESTADO'
      Size = 2
    end
  end
  object QCidadeDescarga: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  CD.ROWID,'
      '  CD.COD_CIDADE_DESCARGA,'
      '  CD.COD_MANIFESTO,'
      '  CD.COD_CIDADE,'
      '  CID.DESC_CIDADE,'
      '  CID.COD_CIDADE_IBGE,'
      '  CID.COD_ESTADO'
      'FROM'
      '  TB_CIDADE_DESCARGA CD'
      'LEFT JOIN'
      '  TB_CIDADE CID'
      'ON'
      '  CID.COD_CIDADE = CD.COD_CIDADE'
      'where cod_manifesto = :cod_manifesto'
      '  AND'
      '  (:COD_CIDADE IS NULL OR'
      '   :COD_CIDADE = CD.COD_CIDADE)')
    Variables.Data = {
      03000000020000000E0000003A434F445F4D414E49464553544F030000000000
      0000000000000B0000003A434F445F4349444144450300000000000000000000
      00}
    SequenceField.Field = 'COD_CIDADE_DESCARGA'
    SequenceField.Sequence = 'SQCIDADE_DESCARGA'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      04000000060000000D000000434F445F4D414E49464553544F0100000000000A
      000000434F445F43494441444501000000000013000000434F445F4349444144
      455F44455343415247410100000000000B000000444553435F43494441444501
      00000000000F000000434F445F4349444144455F494247450100000000000A00
      0000434F445F45535441444F010000000000}
    Master = QManifesto
    MasterFields = 'COD_MANIFESTO'
    DetailFields = 'COD_MANIFESTO'
    RefreshOptions = [roBeforeEdit, roAllFields]
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    BeforeInsert = QVeiculoMDFeBeforeEdit
    AfterInsert = QCidadeDescargaAfterInsert
    BeforeEdit = QVeiculoMDFeBeforeEdit
    AfterPost = QCidadeDescargaAfterPost
    BeforeDelete = QCidadeDescargaBeforeDelete
    AfterScroll = QCidadeDescargaAfterScroll
    Left = 193
    Top = 58
    object QCidadeDescargaCOD_CIDADE_DESCARGA: TIntegerField
      FieldName = 'COD_CIDADE_DESCARGA'
      Required = True
    end
    object QCidadeDescargaCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
      Required = True
    end
    object QCidadeDescargaCOD_MANIFESTO: TIntegerField
      FieldName = 'COD_MANIFESTO'
      Required = True
    end
    object QCidadeDescargaDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      Size = 50
    end
    object QCidadeDescargaCOD_CIDADE_IBGE: TStringField
      FieldName = 'COD_CIDADE_IBGE'
      Size = 5
    end
    object QCidadeDescargaCOD_ESTADO: TStringField
      FieldName = 'COD_ESTADO'
      Size = 2
    end
  end
  object QInfDoc: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      '  ROWID,'
      '  TB_INF_DOC.*'
      'FROM'
      '  TB_INF_DOC'
      'where cod_cidade_descarga = :cod_cidade_descarga')
    Variables.Data = {
      0300000001000000140000003A434F445F4349444144455F4445534341524741
      030000000000000000000000}
    SequenceField.Field = 'COD_INF_DOC'
    SequenceField.Sequence = 'SQINF_DOC'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      04000000130000000B000000434F445F494E465F444F43010000000000130000
      00434F445F4349444144455F44455343415247410100000000000C000000494E
      445F5449504F5F444F4301000000000011000000444553435F43484156455F41
      434553534F01000000000012000000444553435F5345475F434F445F42415252
      41010000000000070000004E554D5F444F430100000000000A00000044455343
      5F53455249450100000000000D000000444553435F5355425345524945010000
      0000000A00000044545F454D495353414F0100000000000900000056414C5F43
      415247410100000000000E000000444553435F434E504A5F454D495401000000
      00000B000000434F445F55465F444553540100000000000600000056414C5F4E
      4601000000000010000000444553435F50494E5F53554652414D410100000000
      000F000000494E445F534F4D415F544F54414953010000000000080000004E55
      4D5F5045534F01000000000010000000434F445F434F4E484543494D454E544F
      010000000000140000004E554D5F4350465F434E504A5F544F4D41444F520100
      0000000009000000444553435F43494F54010000000000}
    Master = QCidadeDescarga
    MasterFields = 'COD_CIDADE_DESCARGA'
    DetailFields = 'COD_CIDADE_DESCARGA'
    RefreshOptions = [roBeforeEdit, roAllFields]
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    AfterInsert = QInfDocAfterInsert
    BeforePost = QInfDocBeforePost
    OnCalcFields = QInfDocCalcFields
    Left = 265
    Top = 11
    object QInfDocCOD_INF_DOC: TIntegerField
      FieldName = 'COD_INF_DOC'
      Required = True
    end
    object QInfDocCOD_CIDADE_DESCARGA: TIntegerField
      FieldName = 'COD_CIDADE_DESCARGA'
      Required = True
    end
    object QInfDocIND_TIPO_DOC: TStringField
      FieldName = 'IND_TIPO_DOC'
      Required = True
      Size = 2
    end
    object QInfDocDESC_CHAVE_ACESSO: TStringField
      FieldName = 'DESC_CHAVE_ACESSO'
      Size = 44
    end
    object QInfDocDESC_SEG_COD_BARRA: TStringField
      FieldName = 'DESC_SEG_COD_BARRA'
      Size = 100
    end
    object QInfDocNUM_DOC: TStringField
      FieldName = 'NUM_DOC'
    end
    object QInfDocDESC_SERIE: TStringField
      FieldName = 'DESC_SERIE'
      Size = 3
    end
    object QInfDocDESC_SUBSERIE: TStringField
      FieldName = 'DESC_SUBSERIE'
      Size = 2
    end
    object QInfDocDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
    object QInfDocVAL_CARGA: TFloatField
      FieldName = 'VAL_CARGA'
    end
    object QInfDocDESC_CNPJ_EMIT: TStringField
      FieldName = 'DESC_CNPJ_EMIT'
      Size = 14
    end
    object QInfDocCOD_UF_DEST: TStringField
      FieldName = 'COD_UF_DEST'
      Size = 2
    end
    object QInfDocVAL_NF: TFloatField
      FieldName = 'VAL_NF'
    end
    object QInfDocDESC_PIN_SUFRAMA: TStringField
      FieldName = 'DESC_PIN_SUFRAMA'
      Size = 9
    end
    object QInfDocdesc_cidade_descarga: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_cidade_descarga'
      Size = 100
      Calculated = True
    end
    object QInfDocNUM_PESO: TFloatField
      FieldName = 'NUM_PESO'
    end
    object QInfDocCOD_CONHECIMENTO: TIntegerField
      FieldName = 'COD_CONHECIMENTO'
    end
    object QInfDocIND_SOMA_TOTAIS: TStringField
      FieldName = 'IND_SOMA_TOTAIS'
      Size = 1
    end
    object QInfDocNUM_CPF_CNPJ_TOMADOR: TStringField
      FieldName = 'NUM_CPF_CNPJ_TOMADOR'
      Size = 18
    end
    object QInfDocDESC_CIOT: TStringField
      FieldName = 'DESC_CIOT'
      Size = 16
    end
  end
  object DsInfDoc: TDataSource
    DataSet = QInfDoc
    Left = 272
    Top = 64
  end
  object QUFPercurso: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  UFPER.ROWID,'
      '  UFPER.COD_ESTADO,'
      '  UFPER.COD_UF_PERCURSO,'
      '  UFPER.COD_MANIFESTO'
      'FROM'
      '  TB_UF_PERCURSO UFPER'
      'where cod_manifesto = :cod_manifesto'
      'order by COD_UF_PERCURSO')
    Variables.Data = {
      03000000010000000E0000003A434F445F4D414E49464553544F030000000000
      000000000000}
    SequenceField.Field = 'COD_UF_PERCURSO'
    SequenceField.Sequence = 'SQUF_PERCURSO'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      04000000030000000A000000434F445F45535441444F0100000000000F000000
      434F445F55465F504552435552534F0100000000000D000000434F445F4D414E
      49464553544F010000000000}
    Master = QManifesto
    MasterFields = 'COD_MANIFESTO'
    RefreshOptions = [roBeforeEdit, roAllFields]
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    BeforeInsert = QVeiculoMDFeBeforeEdit
    AfterInsert = QUFPercursoAfterInsert
    BeforeEdit = QVeiculoMDFeBeforeEdit
    AfterPost = QUFPercursoAfterPost
    BeforeDelete = QUFPercursoBeforeDelete
    Left = 33
    Top = 114
    object QUFPercursoCOD_ESTADO: TStringField
      FieldName = 'COD_ESTADO'
      Required = True
      Size = 2
    end
    object QUFPercursoCOD_UF_PERCURSO: TIntegerField
      FieldName = 'COD_UF_PERCURSO'
      Required = True
    end
    object QUFPercursoCOD_MANIFESTO: TIntegerField
      FieldName = 'COD_MANIFESTO'
      Required = True
    end
  end
  object QSeguroMDFe: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  SEG.ROWID,'
      '  SEG.*'
      'FROM'
      '  TB_SEGURO_MDFE SEG'
      'where SEG.cod_manifesto = :cod_manifesto')
    Variables.Data = {
      03000000010000000E0000003A434F445F4D414E49464553544F030000000000
      000000000000}
    SequenceField.Field = 'COD_SEGURO_MDFE'
    SequenceField.Sequence = 'SQSEGURO_MDFE'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      04000000070000000D000000434F445F4D414E49464553544F0100000000000F
      000000434F445F53454755524F5F4D4446450100000000000F000000494E445F
      524553505F53454755524F010000000000120000004E554D5F41504F4C494345
      5F53454755524F010000000000140000004E554D5F41564552424143414F5F53
      454755524F0100000000000E000000434F445F534547555241444F5241010000
      0000000F000000434F445F524553505F53454755524F010000000000}
    Master = QManifesto
    MasterFields = 'COD_MANIFESTO'
    DetailFields = 'COD_MANIFESTO'
    RefreshOptions = [roBeforeEdit, roAllFields]
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    BeforeInsert = QVeiculoMDFeBeforeEdit
    AfterInsert = QSeguroMDFeAfterInsert
    BeforeEdit = QVeiculoMDFeBeforeEdit
    AfterPost = QSeguroMDFeAfterPost
    BeforeDelete = QSeguroMDFeBeforeDelete
    OnCalcFields = QSeguroMDFeCalcFields
    Left = 105
    Top = 114
    object QSeguroMDFeCOD_SEGURO_MDFE: TIntegerField
      FieldName = 'COD_SEGURO_MDFE'
      Required = True
    end
    object QSeguroMDFeCOD_MANIFESTO: TIntegerField
      FieldName = 'COD_MANIFESTO'
      Required = True
    end
    object QSeguroMDFeIND_RESP_SEGURO: TIntegerField
      FieldName = 'IND_RESP_SEGURO'
      Required = True
    end
    object QSeguroMDFedesc_seguradora: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_seguradora'
      Size = 50
      Calculated = True
    end
    object QSeguroMDFeresp_seguro: TStringField
      FieldKind = fkCalculated
      FieldName = 'resp_seguro'
      Size = 40
      Calculated = True
    end
    object QSeguroMDFeCOD_RESP_SEGURO: TIntegerField
      FieldName = 'COD_RESP_SEGURO'
    end
    object QSeguroMDFedesc_contratante: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_contratante'
      Size = 100
      Calculated = True
    end
    object QSeguroMDFeNUM_APOLICE_SEGURO: TStringField
      FieldName = 'NUM_APOLICE_SEGURO'
      Required = True
    end
    object QSeguroMDFeCOD_SEGURADORA: TIntegerField
      FieldName = 'COD_SEGURADORA'
      Required = True
    end
    object QSeguroMDFeNUM_AVERBACAO_SEGURO: TStringField
      FieldName = 'NUM_AVERBACAO_SEGURO'
      Required = True
      Size = 40
    end
  end
  object QCidadeCarregaCons: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  CC.ROWID,'
      '  CC.COD_CIDADE_CARREGA,'
      '  CC.COD_MANIFESTO,'
      '  CC.COD_CIDADE,'
      '  CID.DESC_CIDADE,'
      '  CID.COD_CIDADE_IBGE,'
      '  CID.COD_ESTADO'
      'FROM'
      '  TB_CIDADE_CARREGA CC'
      'LEFT JOIN'
      '  TB_CIDADE CID'
      'ON'
      '  CID.COD_CIDADE = CC.COD_CIDADE'
      'where cod_manifesto = :cod_manifesto'
      'AND'
      '  (:COD_CIDADE_IBGE IS NULL OR'
      '   :COD_CIDADE_IBGE = CID.COD_CIDADE_IBGE)')
    Variables.Data = {
      03000000020000000E0000003A434F445F4D414E49464553544F030000000000
      000000000000100000003A434F445F4349444144455F49424745050000000000
      000000000000}
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      04000000060000000D000000434F445F4D414E49464553544F01000000000012
      000000434F445F4349444144455F434152524547410100000000000A00000043
      4F445F4349444144450100000000000B000000444553435F4349444144450100
      000000000F000000434F445F4349444144455F494247450100000000000A0000
      00434F445F45535441444F010000000000}
    Master = QManifestoCons
    MasterFields = 'COD_MANIFESTO'
    DetailFields = 'COD_MANIFESTO'
    RefreshOptions = [roBeforeEdit, roAllFields]
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 353
    Top = 10
    object QCidadeCarregaConsCOD_CIDADE_CARREGA: TIntegerField
      FieldName = 'COD_CIDADE_CARREGA'
      Required = True
    end
    object QCidadeCarregaConsCOD_MANIFESTO: TIntegerField
      FieldName = 'COD_MANIFESTO'
      Required = True
    end
    object QCidadeCarregaConsCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
      Required = True
    end
    object QCidadeCarregaConsDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      Size = 50
    end
    object QCidadeCarregaConsCOD_CIDADE_IBGE: TStringField
      FieldName = 'COD_CIDADE_IBGE'
      Size = 5
    end
    object QCidadeCarregaConsCOD_ESTADO: TStringField
      FieldName = 'COD_ESTADO'
      Size = 2
    end
  end
  object QCidadeDescargaCons: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  CD.ROWID,'
      '  CD.COD_CIDADE_DESCARGA,'
      '  CD.COD_MANIFESTO,'
      '  CD.COD_CIDADE,'
      '  CID.DESC_CIDADE,'
      '  CID.COD_CIDADE_IBGE,'
      '  CID.COD_ESTADO'
      'FROM'
      '  TB_CIDADE_DESCARGA CD'
      'LEFT JOIN'
      '  TB_CIDADE CID'
      'ON'
      '  CID.COD_CIDADE = CD.COD_CIDADE'
      'where cod_manifesto = :cod_manifesto'
      '  AND'
      '  (:COD_CIDADE IS NULL OR'
      '   :COD_CIDADE = CD.COD_CIDADE)'
      'AND'
      '  (:COD_CIDADE_IBGE IS NULL OR'
      '   :COD_CIDADE_IBGE = CID.COD_CIDADE_IBGE)')
    Variables.Data = {
      03000000030000000E0000003A434F445F4D414E49464553544F030000000000
      0000000000000B0000003A434F445F4349444144450300000000000000000000
      00100000003A434F445F4349444144455F494247450500000000000000000000
      00}
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      04000000060000000D000000434F445F4D414E49464553544F0100000000000A
      000000434F445F43494441444501000000000013000000434F445F4349444144
      455F44455343415247410100000000000B000000444553435F43494441444501
      00000000000F000000434F445F4349444144455F494247450100000000000A00
      0000434F445F45535441444F010000000000}
    Master = QManifestoCons
    MasterFields = 'COD_MANIFESTO'
    DetailFields = 'COD_MANIFESTO'
    RefreshOptions = [roBeforeEdit, roAllFields]
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 353
    Top = 58
    object QCidadeDescargaConsCOD_CIDADE_DESCARGA: TIntegerField
      FieldName = 'COD_CIDADE_DESCARGA'
      Required = True
    end
    object QCidadeDescargaConsCOD_MANIFESTO: TIntegerField
      FieldName = 'COD_MANIFESTO'
      Required = True
    end
    object QCidadeDescargaConsCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
      Required = True
    end
    object QCidadeDescargaConsDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      Size = 50
    end
    object QCidadeDescargaConsCOD_CIDADE_IBGE: TStringField
      FieldName = 'COD_CIDADE_IBGE'
      Size = 5
    end
    object QCidadeDescargaConsCOD_ESTADO: TStringField
      FieldName = 'COD_ESTADO'
      Size = 2
    end
  end
  object QManifesto: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_MANIFESTO.*'
      'FROM'
      '  TB_MANIFESTO'
      'WHERE'
      '  TB_MANIFESTO.COD_MANIFESTO=:PK')
    Variables.Data = {0300000001000000030000003A504B050000000000000000000000}
    SequenceField.Field = 'COD_MANIFESTO'
    SequenceField.Sequence = 'SQMANIFESTO'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000001C0000000D000000434F445F4D414E49464553544F0100000000000D
      0000004E554D5F4D414E49464553544F01000000000011000000494E445F414D
      4249454E54455F4D44464501000000000011000000494E445F5449504F5F454D
      4954454E544501000000000009000000434F445F534552494501000000000010
      000000434F445F53455249455F4D4F44454C4F01000000000009000000494E44
      5F4D4F44414C0100000000000A00000044545F454D495353414F010000000000
      0E000000434F445F55465F4341525245474101000000000011000000434F445F
      55465F4445534341525245474101000000000011000000444553435F43484156
      455F41434553534F0100000000000A000000434F445F46494C49414C01000000
      00000B000000434F445F5553554152494F0100000000000C000000494E445F53
      4954554143414F01000000000008000000444553435F4F425300000000000009
      00000056414C5F4341524741010000000000080000004E554D5F5045534F0100
      000000000B000000444553435F4C41435245530000000000000E000000494E44
      5F5449504F5F43415247410100000000000B000000434F445F50524F4455544F
      0100000000000B000000494E445F4C4F544143414F0100000000001000000044
      4553435F4345505F4341525245474101000000000013000000444553435F4345
      505F4445534341525245474101000000000015000000444553435F4C41544954
      5544455F4341525245474101000000000016000000444553435F4C4F4E474954
      5544455F4341525245474101000000000018000000444553435F4C4154495455
      44455F4445534341525245474101000000000019000000444553435F4C4F4E47
      49545544455F4445534341525245474101000000000011000000434F445F4241
      4E434F5F4147454E434941010000000000}
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    AfterInsert = QManifestoAfterInsert
    AfterEdit = QManifestoAfterEdit
    BeforePost = QManifestoBeforePost
    AfterPost = QManifestoAfterPost
    AfterCancel = QManifestoAfterCancel
    BeforeDelete = QManifestoBeforeDelete
    AfterDelete = QManifestoAfterDelete
    OnCalcFields = QManifestoCalcFields
    OnDeleteError = QManifestoDeleteError
    Left = 24
    Top = 8
    object QManifestoCOD_MANIFESTO: TIntegerField
      FieldName = 'COD_MANIFESTO'
      Required = True
    end
    object QManifestoNUM_MANIFESTO: TIntegerField
      FieldName = 'NUM_MANIFESTO'
      Required = True
    end
    object QManifestoIND_AMBIENTE_MDFE: TIntegerField
      FieldName = 'IND_AMBIENTE_MDFE'
    end
    object QManifestoIND_TIPO_EMITENTE: TIntegerField
      FieldName = 'IND_TIPO_EMITENTE'
    end
    object QManifestoCOD_SERIE: TStringField
      FieldName = 'COD_SERIE'
      Required = True
      Size = 3
    end
    object QManifestoCOD_SERIE_MODELO: TStringField
      FieldName = 'COD_SERIE_MODELO'
      Required = True
      Size = 2
    end
    object QManifestoIND_MODAL: TIntegerField
      FieldName = 'IND_MODAL'
    end
    object QManifestoDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
    object QManifestoCOD_UF_CARREGA: TStringField
      FieldName = 'COD_UF_CARREGA'
      Required = True
      Size = 2
    end
    object QManifestoCOD_UF_DESCARREGA: TStringField
      FieldName = 'COD_UF_DESCARREGA'
      Required = True
      Size = 2
    end
    object QManifestoDESC_CHAVE_ACESSO: TStringField
      FieldName = 'DESC_CHAVE_ACESSO'
      Size = 48
    end
    object QManifestoCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QManifestoCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
    object QManifestoIND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Size = 1
    end
    object QManifestoDESC_OBS: TMemoField
      FieldName = 'DESC_OBS'
      BlobType = ftOraClob
    end
    object QManifestoVAL_CARGA: TFloatField
      FieldName = 'VAL_CARGA'
      DisplayFormat = '#,##0.00'
    end
    object QManifestoNUM_PESO: TFloatField
      FieldName = 'NUM_PESO'
      DisplayFormat = '#,##0.00'
    end
    object QManifestoDESC_LACRES: TMemoField
      FieldName = 'DESC_LACRES'
      BlobType = ftOraClob
    end
    object QManifestodesc_situacao: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_situacao'
      Calculated = True
    end
    object QManifestodesc_situacao_sefaz: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_situacao_sefaz'
      Size = 200
      Calculated = True
    end
    object QManifestocod_estado: TStringField
      FieldKind = fkCalculated
      FieldName = 'cod_estado'
      Calculated = True
    end
    object QManifestoIND_TIPO_CARGA: TIntegerField
      FieldName = 'IND_TIPO_CARGA'
    end
    object QManifestoCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
    end
    object QManifestoIND_LOTACAO: TStringField
      FieldName = 'IND_LOTACAO'
      Size = 3
    end
    object QManifestoDESC_CEP_CARREGA: TStringField
      FieldName = 'DESC_CEP_CARREGA'
      Size = 10
    end
    object QManifestoDESC_CEP_DESCARREGA: TStringField
      FieldName = 'DESC_CEP_DESCARREGA'
      Size = 10
    end
    object QManifestoCOD_BANCO_AGENCIA: TIntegerField
      FieldName = 'COD_BANCO_AGENCIA'
    end
    object QManifestoDESC_LONGITUDE_CARREGA: TStringField
      FieldName = 'DESC_LONGITUDE_CARREGA'
      Size = 10
    end
    object QManifestoDESC_LONGITUDE_DESCARREGA: TStringField
      FieldName = 'DESC_LONGITUDE_DESCARREGA'
      Size = 10
    end
    object QManifestoDESC_LATITUDE_CARREGA: TStringField
      FieldName = 'DESC_LATITUDE_CARREGA'
      Size = 10
    end
    object QManifestoDESC_LATITUDE_DESCARREGA: TStringField
      FieldName = 'DESC_LATITUDE_DESCARREGA'
      Size = 10
    end
  end
  object QValePedagio: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  VALE_PEDAGIO.ROWID,'
      '  VALE_PEDAGIO.*'
      'FROM'
      '  TB_VALE_PEDAGIO VALE_PEDAGIO'
      'where VALE_PEDAGIO.cod_manifesto = :cod_manifesto')
    Variables.Data = {
      03000000010000000E0000003A434F445F4D414E49464553544F030000000000
      000000000000}
    SequenceField.Field = 'COD_VALE_PEDAGIO'
    SequenceField.Sequence = 'SQVALE_PEDAGIO'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      04000000080000000D000000434F445F4D414E49464553544F01000000000010
      000000434F445F56414C455F5045444147494F010000000000130000004E554D
      5F434E504A5F464F524E454345444F52010000000000140000004E554D5F4350
      465F434E504A5F544F4D41444F520100000000000A0000004E554D5F434F4D50
      52410100000000001000000056414C5F56414C455F5045444147494F01000000
      000015000000494E445F5449504F5F56414C455F5045444147494F0100000000
      0017000000494E445F434F4D42494E4143414F5F56454943554C415201000000
      0000}
    Master = QManifesto
    MasterFields = 'COD_MANIFESTO'
    DetailFields = 'COD_MANIFESTO'
    RefreshOptions = [roBeforeEdit, roAllFields]
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    BeforeInsert = QVeiculoMDFeBeforeEdit
    AfterInsert = QValePedagioAfterInsert
    BeforeEdit = QVeiculoMDFeBeforeEdit
    AfterPost = QValePedagioAfterPost
    BeforeDelete = QValePedagioBeforeDelete
    Left = 193
    Top = 114
    object QValePedagioCOD_VALE_PEDAGIO: TIntegerField
      FieldName = 'COD_VALE_PEDAGIO'
      Required = True
    end
    object QValePedagioNUM_CNPJ_FORNECEDOR: TStringField
      FieldName = 'NUM_CNPJ_FORNECEDOR'
      Required = True
      Size = 18
    end
    object QValePedagioNUM_COMPRA: TStringField
      FieldName = 'NUM_COMPRA'
      Required = True
    end
    object QValePedagioVAL_VALE_PEDAGIO: TFloatField
      FieldName = 'VAL_VALE_PEDAGIO'
      Required = True
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object QValePedagioCOD_MANIFESTO: TIntegerField
      FieldName = 'COD_MANIFESTO'
      Required = True
    end
    object QValePedagioNUM_CPF_CNPJ_TOMADOR: TStringField
      FieldName = 'NUM_CPF_CNPJ_TOMADOR'
    end
    object QValePedagioIND_TIPO_VALE_PEDAGIO: TStringField
      FieldName = 'IND_TIPO_VALE_PEDAGIO'
      Size = 2
    end
    object QValePedagioIND_COMBINACAO_VEICULAR: TStringField
      FieldName = 'IND_COMBINACAO_VEICULAR'
      Size = 2
    end
  end
  object CdsTipoValePedagio: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 117
    object CdsTipoValePedagioCOD_TIPO_VALE_PEDAGIO: TStringField
      FieldName = 'COD_TIPO_VALE_PEDAGIO'
      Size = 2
    end
    object CdsTipoValePedagioTIPO_VALE_PEDAGIO: TStringField
      FieldName = 'TIPO_VALE_PEDAGIO'
    end
  end
  object CdsCombinacaoVeicular: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 352
    Top = 117
    object CdsCombinacaoVeicularCOD_COMB_VEICULAR: TStringField
      FieldName = 'COD_COMB_VEICULAR'
      Size = 2
    end
    object CdsCombinacaoVeicularCOMB_VEICULAR: TStringField
      FieldName = 'COMB_VEICULAR'
      Size = 100
    end
  end
  object DsTipoValePedagio: TDataSource
    DataSet = CdsTipoValePedagio
    Left = 448
    Top = 16
  end
  object DsCombinacaoVeicular: TDataSource
    DataSet = CdsCombinacaoVeicular
    Left = 464
    Top = 64
  end
  object QRManifesto: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  NUM_MANIFESTO,'
      '  TB_MANIFESTO.COD_MANIFESTO,'
      '  TB_FILIAL.DESC_FILIAL,'
      '  TB_MANIFESTO.COD_UF_CARREGA,'
      '  TB_MANIFESTO.COD_UF_DESCARREGA,'
      '  TB_MANIFESTO.DT_EMISSAO,'
      '  C4.DESC_PLACA,'
      '  DECODE(TB_MANIFESTO.IND_SITUACAO,'
      '    1, '#39'DIGITADO'#39', '
      '    2, '#39'CONFIRMADO'#39', '
      '    3, '#39'CANCELADO'#39', '
      '    5, '#39'ENCERRADO'#39', '#39'N'#195'O AUTORIZADO'#39') AS STATUS_MDFE'
      'FROM '
      '  TB_MANIFESTO,'
      '  TB_FILIAL,'
      '  TB_VEICULO_MDFE C4'
      'WHERE'
      '  TB_MANIFESTO.COD_MANIFESTO = C4.COD_MANIFESTO (+)'
      'AND'
      '  TB_MANIFESTO.COD_FILIAL = TB_FILIAL.COD_FILIAL'
      'AND'
      '  (:COD_FILIAL IS NULL'
      '  OR'
      '   TB_MANIFESTO.COD_FILIAL = :COD_FILIAL)'
      'AND'
      '  (:VEICULO IS NULL'
      
        '  OR TB_MANIFESTO.COD_MANIFESTO IN (SELECT C5.COD_MANIFESTO FROM' +
        ' '
      ''
      'TB_VEICULO_MDFE C5 WHERE C5.DESC_PLACA = :VEICULO))'
      'AND'
      ' (:SITUACAO IS NULL'
      ' OR TB_MANIFESTO.IND_SITUACAO = :SITUACAO)'
      'AND '
      '  TB_MANIFESTO.DT_EMISSAO >= :DT_EMISSAO_I'
      'AND '
      '  TB_MANIFESTO.DT_EMISSAO <= :DT_EMISSAO_F  '
      'ORDER BY TB_MANIFESTO.DT_EMISSAO')
    Variables.Data = {
      03000000050000000B0000003A434F445F46494C49414C030000000000000000
      000000080000003A56454943554C4F0500000000000000000000000D0000003A
      44545F454D495353414F5F490C00000000000000000000000D0000003A44545F
      454D495353414F5F460C0000000000000000000000090000003A534954554143
      414F050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000080000000D0000004E554D5F4D414E49464553544F0100000000000D
      000000434F445F4D414E49464553544F0100000000000B000000444553435F46
      494C49414C0100000000000A00000044545F454D495353414F0100000000000A
      000000444553435F504C4143410100000000000B0000005354415455535F4D44
      46450100000000000E000000434F445F55465F43415252454741010000000000
      11000000434F445F55465F44455343415252454741010000000000}
    Session = DMOracle.DBCemapa
    Left = 448
    Top = 120
    object QRManifestoNUM_MANIFESTO: TIntegerField
      FieldName = 'NUM_MANIFESTO'
      Required = True
    end
    object QRManifestoCOD_MANIFESTO: TIntegerField
      FieldName = 'COD_MANIFESTO'
      Required = True
    end
    object QRManifestoDESC_FILIAL: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
    object QRManifestoDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
    object QRManifestoDESC_PLACA: TStringField
      FieldName = 'DESC_PLACA'
      Size = 8
    end
    object QRManifestoSTATUS_MDFE: TStringField
      FieldName = 'STATUS_MDFE'
      Size = 14
    end
    object QRManifestoCOD_UF_CARREGA: TStringField
      FieldName = 'COD_UF_CARREGA'
      Required = True
      Size = 2
    end
    object QRManifestoCOD_UF_DESCARREGA: TStringField
      FieldName = 'COD_UF_DESCARREGA'
      Required = True
      Size = 2
    end
  end
end
