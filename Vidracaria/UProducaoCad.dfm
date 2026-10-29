inherited FProducaoCad: TFProducaoCad
  Left = 251
  Top = 154
  Caption = 'Produ'#231#227'o'
  ClientHeight = 357
  PixelsPerInch = 96
  TextHeight = 14
  object SBMarcacao: TSpeedButton [0]
    Left = 40
    Top = 152
    Width = 185
    Height = 35
    Caption = 'Marca'#231#227'o'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = SBMarcacaoClick
  end
  object SBForno: TSpeedButton [1]
    Left = 40
    Top = 203
    Width = 185
    Height = 35
    Caption = 'Forno'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = SBFornoClick
  end
  object SBEmbarque: TSpeedButton [2]
    Left = 40
    Top = 251
    Width = 185
    Height = 35
    Caption = 'Embarque'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = SBEmbarqueClick
  end
  object SBUsinagem: TSpeedButton [3]
    Left = 41
    Top = 100
    Width = 185
    Height = 35
    Caption = 'Usinagem'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = SBUsinagemClick
  end
  object SBCorte: TSpeedButton [4]
    Left = 40
    Top = 48
    Width = 185
    Height = 35
    Caption = 'Corte'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = SBCorteClick
  end
  object SpeedButton1: TSpeedButton [5]
    Left = 40
    Top = 298
    Width = 185
    Height = 35
    Caption = 'Reposi'#231#227'o'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = SpeedButton1Click
  end
  inherited Panel1: TPanel
    Height = 39
    Enabled = False
    Visible = False
  end
  inherited StBLongHint: TStatusBar
    Top = 338
  end
  inherited MMCadSimples: TMainMenu
    inherited Manuteno1: TMenuItem
      Visible = False
    end
    inherited Relatrios1: TMenuItem
      Visible = False
    end
  end
end
