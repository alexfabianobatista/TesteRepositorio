object FImprimirNota: TFImprimirNota
  Left = 374
  Top = 283
  Width = 225
  Height = 89
  Caption = 'Imprimir Nota'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 24
    Top = 16
    Width = 65
    Height = 25
    Caption = 'Sim'
    ModalResult = 1
    TabOrder = 1
  end
  object BitBtn2: TBitBtn
    Left = 120
    Top = 16
    Width = 75
    Height = 25
    Caption = 'N'#227'o'
    ModalResult = 2
    TabOrder = 0
  end
end
