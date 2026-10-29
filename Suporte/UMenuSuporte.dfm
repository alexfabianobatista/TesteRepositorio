inherited FMenuSuporte: TFMenuSuporte
  Left = 913
  Top = 575
  Width = 317
  Height = 126
  Caption = 'Suporte Sistema Cemapa'
  Position = poDefaultPosOnly
  PixelsPerInch = 96
  TextHeight = 14
  inherited Panel1: TPanel
    Width = 301
    Height = 43
  end
  inherited StatusBar1: TStatusBar
    Top = 43
    Width = 301
  end
  inherited MMCadSimples: TMainMenu
    object Manuteno1: TMenuItem [0]
      Caption = '&Manuten'#231#227'o'
      object Suporte1: TMenuItem
        Caption = '&Suporte'
        OnClick = Suporte1Click
      end
    end
  end
end
