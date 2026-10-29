inherited FFormaRecebimentoCad: TFFormaRecebimentoCad
  Caption = 'Cadastro de Formas de Recebimento'
  ClientHeight = 208
  ClientWidth = 510
  PixelsPerInch = 96
  TextHeight = 14
  inherited Panel1: TPanel
    Width = 510
    inherited SBConsulta: TSpeedButton
      Left = 476
    end
    inherited lbPesquisaCodigo: TLabel
      Left = 372
    end
    inherited MELocaliza: TMaskEdit
      Left = 428
    end
    inherited pnSeparador2: TPanel
      Left = 360
    end
  end
  object DBPanel1: TDBPanel [2]
    Left = 24
    Top = 64
    Width = 81
    Height = 37
    BevelOuter = bvNone
    ParentColor = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    CodigoTabStop = False
    DataField = 'COD_FORMA_RECEBIMENTO'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'COD_FORMA_RECEBIMENTO'
    ForeignKey = False
    LCaption = 'C'#243'digo'
    ReadOnly = True
    Required = False
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object DBPanel2: TDBPanel [3]
    Left = 24
    Top = 104
    Width = 465
    Height = 37
    BevelOuter = bvNone
    ParentColor = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    CodigoTabStop = True
    DataField = 'DESC_FORMA_RECEBIMENTO'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'DESC_FORMA_RECEBIMENTO'
    ForeignKey = False
    LCaption = 'Descri'#231#227'o'
    ReadOnly = False
    Required = True
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object DBCheckBox1: TDBCheckBox [4]
    Left = 24
    Top = 144
    Width = 145
    Height = 17
    Caption = 'Exigir dados banc'#225'rios'
    DataField = 'IND_EXIGIR_BANCO'
    DataSource = DSPrimario
    TabOrder = 4
    ValueChecked = 'S'
    ValueUnchecked = 'N'
  end
  inherited StBLongHint: TStatusBar
    Top = 189
    Width = 510
  end
  inherited DSPrimario: TDataSource
    DataSet = DmFormaRecebimento.QFormaRecebimento
  end
end
