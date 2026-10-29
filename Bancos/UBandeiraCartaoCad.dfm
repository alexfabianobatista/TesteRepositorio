inherited FBandeiraCartaoCad: TFBandeiraCartaoCad
  Left = 539
  Top = 226
  Caption = 'Cadastro Bandeira de Cart'#245'es de Cr'#233'dito'
  ClientHeight = 213
  ClientWidth = 494
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel [1]
    Left = 24
    Top = 64
    Width = 33
    Height = 14
    Caption = 'C'#243'digo'
    FocusControl = DBEdit1
  end
  object Label2: TLabel [2]
    Left = 24
    Top = 104
    Width = 49
    Height = 14
    Caption = 'Descri'#231#227'o'
    FocusControl = DBEdit2
  end
  inherited Panel1: TPanel
    Width = 494
    inherited lbPesquisaCodigo: TLabel
      Left = 352
    end
    inherited SBConsulta: TSpeedButton
      Left = 459
    end
    inherited pnSeparador2: TPanel
      Left = 343
    end
    inherited MELocaliza: TMaskEdit
      Left = 410
    end
  end
  inherited StBLongHint: TStatusBar
    Top = 194
    Width = 494
  end
  object DBEdit1: TDBEdit [5]
    Left = 24
    Top = 80
    Width = 49
    Height = 22
    DataField = 'COD_BANDEIRA_CARTAO'
    DataSource = DSPrimario
    Enabled = False
    TabOrder = 2
  end
  object DBEdit2: TDBEdit [6]
    Left = 24
    Top = 120
    Width = 273
    Height = 22
    DataField = 'DESC_BANDEIRA_CARTAO'
    DataSource = DSPrimario
    TabOrder = 3
  end
  inherited MMCadSimples: TMainMenu
    Left = 325
    inherited Relatrios1: TMenuItem
      object ListagemdasBandeirasCadastradas1: TMenuItem
        Caption = 'Listagem das Bandeiras Cadastradas'
        OnClick = ListagemdasBandeirasCadastradas1Click
      end
    end
  end
  inherited DSPrimario: TDataSource
    DataSet = DMBandeiraCartao.QBandeiraCartaoCad
    Left = 239
  end
  inherited ILBotao: TImageList
    Left = 268
  end
  inherited ALCadastro: TActionList
    Left = 294
  end
  inherited IdHTTP1: TIdHTTP
    Left = 353
  end
end
