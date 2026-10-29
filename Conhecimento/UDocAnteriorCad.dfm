inherited FDocAnteriorCad: TFDocAnteriorCad
  Left = 435
  Top = 159
  Caption = 'Documento Anterior'
  ClientHeight = 164
  ClientWidth = 481
  PixelsPerInch = 96
  TextHeight = 14
  object LbModelo: TLabel [0]
    Left = 224
    Top = 54
    Width = 34
    Height = 14
    Caption = 'Modelo'
  end
  inherited Panel1: TPanel
    Width = 481
    inherited SBHelp: TSpeedButton
      Visible = False
    end
    inherited SBConsulta: TSpeedButton
      Visible = False
    end
    inherited sbEnviarSMS: TSpeedButton
      Left = 452
    end
    inherited MELocaliza: TMaskEdit
      Enabled = False
      Visible = False
    end
  end
  inherited StBLongHint: TStatusBar
    Top = 145
    Width = 481
  end
  object DBPChaveAcesso: TDBPanel [3]
    Left = 16
    Top = 98
    Width = 329
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    CodigoTabStop = True
    DataField = 'DESC_CHAVE_ACESSO'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'DESC_CHAVE_ACESSO'
    ForeignKey = False
    LCaption = 'Chave de Acesso'
    ReadOnly = False
    Required = False
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object DBPNumDocumento: TDBPanel [4]
    Left = 16
    Top = 56
    Width = 89
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    CodigoTabStop = True
    DataField = 'NUM_DOCUMENTO'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'NUM_DOCUMENTO'
    ForeignKey = False
    LCaption = 'Num. Documento'
    ReadOnly = False
    Required = False
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object DBPDataEmissao: TDBPanel [5]
    Left = 384
    Top = 98
    Width = 81
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    CodigoTabStop = True
    DataField = 'DT_EMISSAO'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'DT_EMISSAO'
    ForeignKey = False
    LCaption = 'Data Emiss'#227'o'
    ReadOnly = False
    Required = False
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object DBPSerie: TDBPanel [6]
    Left = 112
    Top = 56
    Width = 49
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    CodigoTabStop = True
    DataField = 'COD_SERIE'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'COD_SERIE'
    ForeignKey = False
    LCaption = 'S'#233'rie'
    ReadOnly = False
    Required = False
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object DBPSubSerie: TDBPanel [7]
    Left = 168
    Top = 56
    Width = 49
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    CodigoTabStop = True
    DataField = 'COD_SUB_SERIE'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'COD_SUB_SERIE'
    ForeignKey = False
    LCaption = 'Subs'#233'rie'
    ReadOnly = False
    Required = False
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object CMBTipoDoc: TComboBox [8]
    Left = 224
    Top = 70
    Width = 241
    Height = 22
    Style = csDropDownList
    ItemHeight = 14
    ItemIndex = 13
    TabOrder = 7
    Text = '57 - Conhecimento de Transporte Eletr'#244'nico'
    OnChange = CMBTipoDocChange
    Items.Strings = (
      '00 - CTRC'
      '01 - CTAC'
      '02 - ACT'
      '03 - NF Modelo 7'
      '04 - NF Modelo 27'
      '05 - Conhecimento A'#233'reo Nacional'
      '06 - CTMC'
      '07 - ATRE'
      '08 - DTA (Despacho de Transito Aduaneiro)'
      '09 - Conhecimento A'#233'reo Internacional'
      '10 '#8211' Conhecimento - Carta de Porte Internacional'
      '11 '#8211' Conhecimento Avulso'
      '12 - TIF (Transporte Internacional Ferrovi'#225'rio)'
      '57 - Conhecimento de Transporte Eletr'#244'nico'
      '99 - outros')
  end
  inherited DSPrimario: TDataSource
    DataSet = DMConhecimento.QDocAnterior
    Left = 391
  end
end
