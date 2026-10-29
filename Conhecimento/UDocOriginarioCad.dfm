inherited FDocOriginarioCad: TFDocOriginarioCad
  Left = 296
  Top = 289
  Caption = 'Documento Origin'#225'rio'
  ClientHeight = 265
  ClientWidth = 471
  PixelsPerInch = 96
  TextHeight = 14
  object LbModelo: TLabel [0]
    Left = 200
    Top = 54
    Width = 34
    Height = 14
    Caption = 'Modelo'
  end
  inherited Panel1: TPanel
    Width = 471
    inherited sbEnviarSMS: TSpeedButton
      Left = 299
    end
    inherited lbPesquisaCodigo: TLabel
      Left = 361
    end
    inherited SBConsulta: TSpeedButton
      Left = 530
      Anchors = []
      Visible = False
    end
    inherited pnSeparador2: TPanel
      Left = 341
    end
    inherited MELocaliza: TMaskEdit
      Left = 493
      Enabled = False
      Visible = False
    end
  end
  object DBPChaveAcesso: TDBPanel [3]
    Left = 120
    Top = 104
    Width = 327
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
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
  object DBPCfop: TDBPanel [5]
    Left = 280
    Top = 56
    Width = 55
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    CodigoTabStop = True
    DataField = 'NUM_CFOP'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'NUM_CFOP'
    ForeignKey = False
    LCaption = 'CFOP'
    ReadOnly = False
    Required = False
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object DBPanel4: TDBPanel [6]
    Left = 16
    Top = 104
    Width = 55
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    CodigoTabStop = True
    DataField = 'NUM_PESO'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'NUM_PESO'
    ForeignKey = False
    LCaption = 'Peso'
    ReadOnly = False
    Required = False
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object DBPanel5: TDBPanel [7]
    Left = 16
    Top = 152
    Width = 94
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    CodigoTabStop = True
    DataField = 'VAL_BASE_ICMS'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'VAL_BASE_ICMS'
    ForeignKey = False
    LCaption = 'Base ICMS'
    ReadOnly = False
    Required = False
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object DBPanel6: TDBPanel [8]
    Left = 16
    Top = 194
    Width = 94
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    CodigoTabStop = True
    DataField = 'VAL_BASE_ICMS_SUBST'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'VAL_BASE_ICMS_SUBST'
    ForeignKey = False
    LCaption = 'Base ICMS Subst.'
    ReadOnly = False
    Required = False
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object DBPanel7: TDBPanel [9]
    Left = 120
    Top = 152
    Width = 93
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    CodigoTabStop = True
    DataField = 'VAL_ICMS'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'VAL_ICMS'
    ForeignKey = False
    LCaption = 'Valor ICMS'
    ReadOnly = False
    Required = False
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object DBPanel8: TDBPanel [10]
    Left = 120
    Top = 194
    Width = 93
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
    CodigoTabStop = True
    DataField = 'VAL_ICMS_SUBST'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'VAL_ICMS_SUBST'
    ForeignKey = False
    LCaption = 'Valor ICMS Subst.'
    ReadOnly = False
    Required = False
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object DBPTotalNota: TDBPanel [11]
    Left = 352
    Top = 194
    Width = 95
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
    CodigoTabStop = True
    DataField = 'VAL_TOTAL'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'VAL_TOTAL'
    ForeignKey = False
    LCaption = 'Total Nota'
    ReadOnly = False
    Required = False
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object DBPTotalProdutos: TDBPanel [12]
    Left = 248
    Top = 194
    Width = 79
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
    CodigoTabStop = True
    DataField = 'VAL_TOTAL_PRODUTOS'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'VAL_TOTAL_PRODUTOS'
    ForeignKey = False
    LCaption = 'Total Produtos'
    ReadOnly = False
    Required = False
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object DBPDataEmissao: TDBPanel [13]
    Left = 368
    Top = 56
    Width = 79
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
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
  object DBPSerie: TDBPanel [14]
    Left = 120
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
  object DBCbModelo: TDBComboBox [15]
    Left = 200
    Top = 70
    Width = 57
    Height = 22
    Style = csDropDownList
    DataField = 'COD_SERIE_MODELO'
    DataSource = DSPrimario
    ItemHeight = 14
    Items.Strings = (
      '01'
      '04'
      '55'
      '00'
      '10'
      '99')
    TabOrder = 3
    OnChange = DBCbModeloChange
  end
  inherited StBLongHint: TStatusBar
    Top = 246
    Width = 471
  end
  inherited DSPrimario: TDataSource
    DataSet = DMConhecimento.QDocOriginario
    Left = 391
  end
  inherited ILBotao: TImageList
    Left = 428
  end
end
