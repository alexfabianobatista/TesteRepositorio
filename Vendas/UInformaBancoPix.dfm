object FInformaBancoPix: TFInformaBancoPix
  Left = 473
  Top = 223
  Width = 316
  Height = 189
  Align = alCustom
  BorderIcons = [biMinimize, biMaximize]
  Caption = 'Informa Banco Pix'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 132
    Width = 300
    Height = 19
    Panels = <>
  end
  object BitBtn1: TBitBtn
    Left = 10
    Top = 84
    Width = 83
    Height = 30
    TabOrder = 1
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BtCancelar: TBitBtn
    Left = 146
    Top = 84
    Width = 83
    Height = 30
    TabOrder = 2
    OnClick = BtCancelarClick
    Kind = bkCancel
  end
  inline FmContaCorrente1: TFmContaCorrente
    Left = 13
    Top = 21
    Width = 265
    Height = 37
    TabOrder = 0
    inherited BtContaCorrente: TBitBtn
      OnClick = FmContaCorrente1BtContaCorrenteClick
    end
  end
end
