inherited FMarcaPneuCad: TFMarcaPneuCad
  Left = 600
  Top = 208
  Caption = 'Marca de Pneu'
  ClientHeight = 201
  ClientWidth = 431
  OnClose = nil
  OnCreate = nil
  PixelsPerInch = 96
  TextHeight = 14
  inherited Panel1: TPanel
    Width = 431
    inherited lbPesquisaCodigo: TLabel
      Left = 289
    end
    inherited SBConsulta: TSpeedButton
      Left = 396
    end
    inherited pnSeparador2: TPanel
      Left = 280
    end
    inherited MELocaliza: TMaskEdit
      Left = 347
    end
  end
  inherited StBLongHint: TStatusBar
    Top = 182
    Width = 431
  end
  object Panel2: TPanel [3]
    Left = 0
    Top = 40
    Width = 432
    Height = 144
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    object DBPCodMarcaPneu: TDBPanel
      Left = 16
      Top = 24
      Width = 65
      Height = 37
      BevelOuter = bvNone
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      CodigoTabStop = False
      DataField = 'COD_MARCA_PNEU'
      DataSource = DSPrimario
      fkCache = False
      fkChave = 'COD_MARCA_PNEU'
      ForeignKey = False
      LCaption = 'C'#243'digo'
      ReadOnly = True
      Required = False
      ValidateOnExit = False
      WidthCodigo = 20.000000000000000000
    end
    object DBPanel1: TDBPanel
      Left = 16
      Top = 64
      Width = 393
      Height = 37
      BevelOuter = bvNone
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      CodigoTabStop = True
      DataField = 'DESC_MARCA_PNEU'
      DataSource = DSPrimario
      fkCache = False
      fkChave = 'DESC_MARCA_PNEU'
      ForeignKey = False
      LCaption = 'Descri'#231#227'o'
      ReadOnly = False
      Required = False
      ValidateOnExit = False
      WidthCodigo = 20.000000000000000000
    end
  end
  inherited MMCadSimples: TMainMenu
    Left = 277
    Top = 40
  end
  inherited DSPrimario: TDataSource
    DataSet = DMMarcaPneu.QMarcaPneu
    Left = 191
    Top = 40
  end
  inherited ILBotao: TImageList
    Left = 220
    Top = 40
  end
  inherited ALCadastro: TActionList
    Left = 246
    Top = 40
  end
  inherited IdHTTP1: TIdHTTP
    Left = 161
    Top = 40
  end
end
