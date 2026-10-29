inherited FPadraoProdutoCad: TFPadraoProdutoCad
  Left = 536
  Top = 223
  Caption = 'Cadastro Padr'#227'o Produto'
  ClientHeight = 186
  ClientWidth = 438
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel [0]
    Left = 8
    Top = 56
    Width = 33
    Height = 14
    Caption = 'C'#243'digo'
    FocusControl = DBEdit1
  end
  object Label2: TLabel [1]
    Left = 8
    Top = 96
    Width = 49
    Height = 14
    Caption = 'Descri'#231#227'o'
    FocusControl = DBEdit2
  end
  inherited Panel1: TPanel
    Width = 438
    inherited SBConsulta: TSpeedButton
      Left = 404
    end
    inherited BtCopia: TSpeedButton
      Left = 222
    end
    inherited sbEnviarSMS: TSpeedButton
      Left = 250
    end
    inherited lbPesquisaCodigo: TLabel
      Left = 300
    end
    inherited MELocaliza: TMaskEdit
      Left = 356
    end
    inherited pnSeparador2: TPanel
      Left = 288
    end
  end
  object DBEdit1: TDBEdit [4]
    Left = 8
    Top = 72
    Width = 71
    Height = 22
    Color = clBtnFace
    DataField = 'COD_PADRAO_PRODUTO'
    DataSource = DSPrimario
    Enabled = False
    TabOrder = 2
  end
  object DBEdit2: TDBEdit [5]
    Left = 8
    Top = 112
    Width = 393
    Height = 22
    DataField = 'DESC_PADRAO_PRODUTO'
    DataSource = DSPrimario
    TabOrder = 3
  end
  inherited StBLongHint: TStatusBar
    Top = 167
    Width = 438
  end
  inherited MMCadSimples: TMainMenu
    Left = 272
    Top = 56
  end
  inherited DSPrimario: TDataSource
    DataSet = DMPadraoProduto.QPadraoProduto
    Left = 344
    Top = 56
  end
  inherited ILBotao: TImageList
    Left = 368
  end
  inherited ALCadastro: TActionList
    Left = 294
  end
end
