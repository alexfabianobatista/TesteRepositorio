object FRegistro60: TFRegistro60
  Left = 394
  Top = 216
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Gera'#231#227'o do Arquivo Tipo 60'
  ClientHeight = 375
  ClientWidth = 332
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PnFundo: TPanel
    Left = 0
    Top = 0
    Width = 332
    Height = 375
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object BitBtn5: TBitBtn
      Left = 83
      Top = 27
      Width = 161
      Height = 41
      Hint = 'Bematech_FI_VerificaImpressoraLigada'
      Caption = 'Verifica Impressora Ligada'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BitBtn5Click
    end
    object BitBtn2: TBitBtn
      Left = 83
      Top = 67
      Width = 161
      Height = 41
      Hint = 'Bematech_FI_RelatorioTipo60Mestre'
      Caption = 'Gerar Registro Tipo 60 Mestre'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 83
      Top = 107
      Width = 161
      Height = 41
      Hint = 'Bematech_FI_RelatorioTipo60Analitico'
      Caption = 'Gerar Registro Tipo 60 Anal'#237'tico'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BitBtn3Click
    end
    object BitBtn4: TBitBtn
      Left = 83
      Top = 147
      Width = 161
      Height = 41
      Hint = 'Bematech_FI_RegistrosTipo60'
      Caption = 'Gerar Registro Tipo 60'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = BitBtn4Click
    end
    object BitBtn1: TBitBtn
      Left = 71
      Top = 195
      Width = 185
      Height = 41
      Caption = 'Gerar Tipo 60 e Importar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = BitBtn1Click
    end
    object BitBtn6: TBitBtn
      Left = 71
      Top = 309
      Width = 185
      Height = 41
      Caption = 'Exportar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = BitBtn6Click
    end
    object GroupBox2: TGroupBox
      Left = 68
      Top = 246
      Width = 190
      Height = 59
      Caption = 'Entrada'
      TabOrder = 6
      object Label3: TLabel
        Left = 14
        Top = 14
        Width = 14
        Height = 13
        Caption = 'De'
      end
      object Label4: TLabel
        Left = 100
        Top = 14
        Width = 16
        Height = 13
        Caption = 'At'#233
      end
      object MeDataIni: TMaskEdit
        Left = 14
        Top = 31
        Width = 78
        Height = 21
        EditMask = '!99/99/00##;1;_'
        MaxLength = 10
        TabOrder = 0
        Text = '  /  /    '
      end
      object MeDataFin: TMaskEdit
        Left = 100
        Top = 31
        Width = 78
        Height = 21
        EditMask = '!99/99/00##;1;_'
        MaxLength = 10
        TabOrder = 1
        Text = '  /  /    '
      end
    end
  end
  object QImportado: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      #9'dt_emissao,'
      #9'cod_registro_mestre'
      'FROM'
      #9'tb_registro_tipo60_mestre'
      'WHERE'
      #9'dt_emissao = :dt_emissao')
    Variables.Data = {
      03000000010000000B0000003A44545F454D495353414F0C0000000000000000
      000000}
    SequenceField.ApplyMoment = amOnNewRecord
    OracleDictionary.DefaultValues = True
    QBEDefinition.QBEFieldDefs = {
      04000000020000000A00000044545F454D495353414F01000000000013000000
      434F445F524547495354524F5F4D4553545245010000000000}
    RefreshOptions = [roBeforeEdit, roAllFields]
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    object QImportadoDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object QImportadoCOD_REGISTRO_MESTRE: TIntegerField
      FieldName = 'COD_REGISTRO_MESTRE'
      Required = True
    end
  end
  object QDelMestre: TOracleDataSet1
    SQL.Strings = (
      'delete from tb_registro_tipo60_mestre'
      'where dt_emissao = :dt_emissao')
    Variables.Data = {
      03000000010000000B0000003A44545F454D495353414F0C0000000000000000
      000000}
    SequenceField.ApplyMoment = amOnNewRecord
    OracleDictionary.DefaultValues = True
    RefreshOptions = [roBeforeEdit, roAllFields]
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Top = 32
  end
  object QDelAnalitico: TOracleDataSet1
    SQL.Strings = (
      'delete from tb_registro_tipo60_analitico'
      'where dt_emissao = :dt_emissao')
    Variables.Data = {
      03000000010000000B0000003A44545F454D495353414F0C0000000000000000
      000000}
    SequenceField.ApplyMoment = amOnNewRecord
    OracleDictionary.DefaultValues = True
    RefreshOptions = [roBeforeEdit, roAllFields]
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Top = 64
  end
  object QInsMestre: TOracleDataSet1
    SQL.Strings = (
      'INSERT INTO'
      #9'tb_registro_tipo60_mestre'
      #9'('
      #9#9'COD_REGISTRO_MESTRE,'
      #9#9'DT_EMISSAO,'
      #9#9'DESC_SERIE,'
      #9#9'NUM_SEQUENCIAL,'
      #9#9'DESC_MODELO,'
      #9#9'NUM_COO_INI,'
      #9#9'NUM_COO_FIN,'
      #9#9'NUM_CONTADOR_REDUCAOZ,'
      #9#9'NUM_REINICIO_OPRERACAO,'
      #9#9'VAL_VENDA_BRUTA,'
      #9#9'VAL_TOTAL_GERAL'
      #9')'
      #9'VALUES'
      #9'('
      #9#9':COD_REGISTRO_MESTRE,'
      #9#9':DT_EMISSAO,'
      #9#9':DESC_SERIE,'
      #9#9':NUM_SEQUENCIAL,'
      #9#9':DESC_MODELO,'
      #9#9':NUM_COO_INI,'
      #9#9':NUM_COO_FIN,'
      #9#9':NUM_CONTADOR_REDUCAOZ,'
      #9#9':NUM_REINICIO_OPRERACAO,'
      #9#9':VAL_VENDA_BRUTA,'
      #9#9':VAL_TOTAL_GERAL'
      #9')')
    Variables.Data = {
      030000000B000000140000003A434F445F524547495354524F5F4D4553545245
      0300000000000000000000000B0000003A44545F454D495353414F0C00000000
      000000000000000B0000003A444553435F534552494505000000000000000000
      00000F0000003A4E554D5F53455155454E4349414C0300000000000000000000
      000C0000003A444553435F4D4F44454C4F0500000000000000000000000C0000
      003A4E554D5F434F4F5F494E490300000000000000000000000C0000003A4E55
      4D5F434F4F5F46494E030000000000000000000000160000003A4E554D5F434F
      4E5441444F525F5245445543414F5A030000000000000000000000170000003A
      4E554D5F5245494E4943494F5F4F505245524143414F03000000000000000000
      0000100000003A56414C5F56454E44415F425255544104000000000000000000
      0000100000003A56414C5F544F54414C5F474552414C04000000000000000000
      0000}
    SequenceField.ApplyMoment = amOnNewRecord
    OracleDictionary.DefaultValues = True
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    OnPostError = QInsMestrePostError
    Top = 96
  end
  object QInsAnalitico: TOracleDataSet1
    SQL.Strings = (
      'INSERT INTO'
      #9'tb_registro_tipo60_analitico'
      #9'('
      #9#9'COD_REGISTRO_ANALITICO,'
      #9#9'DT_EMISSAO,'
      #9#9'DESC_SERIE,'
      #9#9'IND_SITUACAO_TRIBUTARIA,'
      #9#9'VLR_ACUMULADO_TOTAL_PARCIAL'
      #9')'
      #9'VALUES'
      #9'('
      #9#9':COD_REGISTRO_ANALITICO,'
      #9#9':DT_EMISSAO,'
      #9#9':DESC_SERIE,'
      #9#9':IND_SITUACAO_TRIBUTARIA,'
      #9#9':VLR_ACUMULADO_TOTAL_PARCIAL'
      #9')')
    Variables.Data = {
      0300000005000000170000003A434F445F524547495354524F5F414E414C4954
      49434F0300000000000000000000000B0000003A44545F454D495353414F0C00
      000000000000000000000B0000003A444553435F534552494505000000000000
      0000000000180000003A494E445F534954554143414F5F545249425554415249
      410500000000000000000000001C0000003A564C525F4143554D554C41444F5F
      544F54414C5F5041524349414C040000000000000000000000}
    SequenceField.ApplyMoment = amOnNewRecord
    OracleDictionary.DefaultValues = True
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    OnPostError = QInsAnaliticoPostError
    Top = 128
  end
  object QMaxMestre: TOracleDataSet1
    SQL.Strings = (
      'select SQREGISTRO_TIPO60_MESTRE.nextval as CODIGO from dual')
    SequenceField.ApplyMoment = amOnNewRecord
    OracleDictionary.DefaultValues = True
    QBEDefinition.QBEFieldDefs = {040000000100000006000000434F4449474F010000000000}
    RefreshOptions = [roBeforeEdit, roAllFields]
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Top = 160
    object QMaxMestreCODIGO: TFloatField
      FieldName = 'CODIGO'
    end
  end
  object QMaxAnalitico: TOracleDataSet1
    SQL.Strings = (
      'select SQREGISTRO_TIPO60_ANALITICO.nextval as CODIGO from dual')
    SequenceField.ApplyMoment = amOnNewRecord
    OracleDictionary.DefaultValues = True
    QBEDefinition.QBEFieldDefs = {040000000100000006000000434F4449474F010000000000}
    RefreshOptions = [roBeforeEdit, roAllFields]
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Top = 192
    object QMaxAnaliticoCODIGO: TFloatField
      FieldName = 'CODIGO'
    end
  end
  object QExpMestre: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      #9'*'
      'FROM'
      #9'tb_registro_tipo60_mestre'
      'WHERE'
      #9'(dt_emissao between :dt_emissao_ini and :dt_emissao_fin)')
    Variables.Data = {
      03000000020000000F0000003A44545F454D495353414F5F494E490C00000000
      000000000000000F0000003A44545F454D495353414F5F46494E0C0000000000
      000000000000}
    SequenceField.ApplyMoment = amOnNewRecord
    OracleDictionary.DefaultValues = True
    QBEDefinition.QBEFieldDefs = {
      040000000B0000000A00000044545F454D495353414F01000000000013000000
      434F445F524547495354524F5F4D45535452450100000000000A000000444553
      435F53455249450100000000000B000000444553435F4D4F44454C4F01000000
      00000B0000004E554D5F434F4F5F494E490100000000000B0000004E554D5F43
      4F4F5F46494E010000000000150000004E554D5F434F4E5441444F525F524544
      5543414F5A010000000000160000004E554D5F5245494E4943494F5F4F505245
      524143414F0100000000000F00000056414C5F56454E44415F42525554410100
      000000000F00000056414C5F544F54414C5F474552414C0100000000000E0000
      004E554D5F53455155454E4349414C010000000000}
    RefreshOptions = [roBeforeEdit, roAllFields]
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 80
    Top = 312
    object QExpMestreCOD_REGISTRO_MESTRE: TIntegerField
      FieldName = 'COD_REGISTRO_MESTRE'
      Required = True
    end
    object QExpMestreDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object QExpMestreDESC_SERIE: TStringField
      FieldName = 'DESC_SERIE'
      Required = True
    end
    object QExpMestreNUM_SEQUENCIAL: TIntegerField
      FieldName = 'NUM_SEQUENCIAL'
      Required = True
    end
    object QExpMestreDESC_MODELO: TStringField
      FieldName = 'DESC_MODELO'
      Required = True
      Size = 2
    end
    object QExpMestreNUM_COO_INI: TIntegerField
      FieldName = 'NUM_COO_INI'
      Required = True
    end
    object QExpMestreNUM_COO_FIN: TIntegerField
      FieldName = 'NUM_COO_FIN'
      Required = True
    end
    object QExpMestreNUM_CONTADOR_REDUCAOZ: TIntegerField
      FieldName = 'NUM_CONTADOR_REDUCAOZ'
      Required = True
    end
    object QExpMestreNUM_REINICIO_OPRERACAO: TIntegerField
      FieldName = 'NUM_REINICIO_OPRERACAO'
      Required = True
    end
    object QExpMestreVAL_VENDA_BRUTA: TFloatField
      FieldName = 'VAL_VENDA_BRUTA'
      Required = True
    end
    object QExpMestreVAL_TOTAL_GERAL: TFloatField
      FieldName = 'VAL_TOTAL_GERAL'
      Required = True
    end
  end
  object QExpAnalitico: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      #9'*'
      'FROM'
      #9'tb_registro_tipo60_analitico'
      'WHERE'
      #9'dt_emissao = :dt_emissao')
    Variables.Data = {
      03000000010000000B0000003A44545F454D495353414F0C0000000000000000
      000000}
    SequenceField.ApplyMoment = amOnNewRecord
    OracleDictionary.DefaultValues = True
    QBEDefinition.QBEFieldDefs = {
      04000000050000000A00000044545F454D495353414F0100000000000A000000
      444553435F534552494501000000000016000000434F445F524547495354524F
      5F414E414C495449434F01000000000017000000494E445F534954554143414F
      5F545249425554415249410100000000001B000000564C525F4143554D554C41
      444F5F544F54414C5F5041524349414C010000000000}
    RefreshOptions = [roBeforeEdit, roAllFields]
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 112
    Top = 312
    object QExpAnaliticoCOD_REGISTRO_ANALITICO: TIntegerField
      FieldName = 'COD_REGISTRO_ANALITICO'
      Required = True
    end
    object QExpAnaliticoDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object QExpAnaliticoDESC_SERIE: TStringField
      FieldName = 'DESC_SERIE'
      Required = True
    end
    object QExpAnaliticoIND_SITUACAO_TRIBUTARIA: TStringField
      FieldName = 'IND_SITUACAO_TRIBUTARIA'
      Required = True
      Size = 4
    end
    object QExpAnaliticoVLR_ACUMULADO_TOTAL_PARCIAL: TFloatField
      FieldName = 'VLR_ACUMULADO_TOTAL_PARCIAL'
      Required = True
    end
  end
end
