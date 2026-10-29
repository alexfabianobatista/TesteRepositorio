inherited FNcmCad: TFNcmCad
  Left = 830
  Top = 324
  Caption = 'Cadastro de G'#234'nero NCM'
  PixelsPerInch = 96
  TextHeight = 14
  object Label6: TLabel [0]
    Left = 18
    Top = 158
    Width = 131
    Height = 14
    Caption = 'Contribui'#231#227'o Previdenci'#225'ria'
  end
  object Label1: TLabel [1]
    Left = 19
    Top = 114
    Width = 91
    Height = 14
    Caption = 'Unidade de Medida'
  end
  inherited Panel1: TPanel
    TabOrder = 6
    inherited lbPesquisaCodigo: TLabel
      Left = 440
    end
    inherited SBConsulta: TSpeedButton
      Left = 544
    end
    inherited pnSeparador2: TPanel
      Left = 428
    end
    inherited MELocaliza: TMaskEdit
      Left = 496
    end
  end
  object DBDescricao: TDBPanel [4]
    Left = 106
    Top = 73
    Width = 463
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    CodigoTabStop = True
    DataField = 'DESC_NCM'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'DESC_NCM'
    ForeignKey = False
    LCaption = 'Descri'#231#227'o'
    ReadOnly = False
    Required = False
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object DBImportado: TDBPanel [5]
    Left = 17
    Top = 240
    Width = 120
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    CodigoTabStop = True
    DataField = 'PERC_TRIBUTO_IMPORTADO'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'PERC_TRIBUTO_IMPORTADO'
    ForeignKey = False
    LCaption = 'Valor Tributo Importado'
    ReadOnly = False
    Required = False
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object DBNacional: TDBPanel [6]
    Left = 17
    Top = 200
    Width = 120
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    CodigoTabStop = True
    DataField = 'PERC_TRIBUTO_NACIONAL'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'PERC_TRIBUTO_NACIONAL'
    ForeignKey = False
    LCaption = 'Valor Tributo Nacional'
    ReadOnly = False
    Required = False
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object DBUMedida: TDBComboBox [7]
    Left = 19
    Top = 128
    Width = 120
    Height = 22
    DataField = 'DESC_UN_MEDIDA'
    DataSource = DSPrimario
    ItemHeight = 14
    Items.Strings = (
      'BD'
      'BR'
      'CJ'
      'CX'
      'DS'
      'ENV'
      'FD'
      'FRC'
      'GL'
      'GR'
      'KG'
      'KIT'
      'LT'
      'MIL'
      'M'
      'M2'
      'M3'
      'PAR'
      'PC'
      'PCT'
      'SC'
      'T'
      'UN'
      'VD'
      'JG'
      'COL')
    TabOrder = 2
  end
  object DBGeneroNcm: TDBPanel [8]
    Left = 18
    Top = 73
    Width = 83
    Height = 36
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    CodigoTabStop = True
    DataField = 'COD_NCM'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'COD_NCM'
    ForeignKey = False
    LCaption = 'G'#234'nero NCM'
    OnValidate = DBGeneroNcmValidate
    ReadOnly = False
    Required = True
    ValidateOnChange = True
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object DBContribuicao: TDBComboBox [9]
    Left = 19
    Top = 176
    Width = 120
    Height = 22
    DataField = 'IND_CONTRIB_PREVIDENCIARIA'
    DataSource = DSPrimario
    ItemHeight = 14
    Items.Strings = (
      'NAO'
      'SIM')
    TabOrder = 3
  end
  object GroupBox1: TGroupBox [11]
    Left = 280
    Top = 112
    Width = 289
    Height = 185
    Caption = 'Reforma Tribut'#225'ria'
    TabOrder = 8
    object Label2: TLabel
      Left = 8
      Top = 16
      Width = 69
      Height = 14
      Caption = 'In'#237'cio Vig'#234'ncia'
      FocusControl = DBEdit1
    end
    object Label3: TLabel
      Left = 8
      Top = 56
      Width = 61
      Height = 14
      Caption = 'Fim Vig'#234'ncia'
      FocusControl = DBEdit2
    end
    object Label4: TLabel
      Left = 8
      Top = 96
      Width = 49
      Height = 14
      Caption = 'Perc. CBS'
      FocusControl = DBEdit3
    end
    object DBEdit1: TDBEdit
      Left = 8
      Top = 32
      Width = 256
      Height = 22
      DataField = 'DT_VIGENCIA_INI'
      DataSource = DSPrimario
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 8
      Top = 72
      Width = 256
      Height = 22
      DataField = 'DT_VIGENCIA_FIM'
      DataSource = DSPrimario
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 8
      Top = 112
      Width = 144
      Height = 22
      DataField = 'PERC_CBS'
      DataSource = DSPrimario
      TabOrder = 2
    end
  end
  inherited MMCadSimples: TMainMenu
    inherited Relatrios1: TMenuItem
      object NCM1: TMenuItem
        Caption = 'G'#234'nero Ncm'
        OnClick = NCM1Click
      end
    end
  end
  inherited DSPrimario: TDataSource
    DataSet = DMNcm.QNcm
  end
end
