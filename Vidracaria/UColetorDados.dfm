object FColetorDados: TFColetorDados
  Left = 415
  Top = 152
  Width = 524
  Height = 431
  Caption = 'Coletor de Dados'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 32
    Top = 24
    Width = 145
    Height = 57
    Caption = 'Embarque'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 32
    Top = 96
    Width = 145
    Height = 57
    Caption = 'Forno'
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 32
    Top = 168
    Width = 145
    Height = 57
    Caption = 'Marca'#231#227'o'
    TabOrder = 2
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 32
    Top = 240
    Width = 145
    Height = 57
    Caption = 'Usinagem'
    TabOrder = 3
    OnClick = BitBtn4Click
  end
  object BitBtn5: TBitBtn
    Left = 32
    Top = 312
    Width = 145
    Height = 57
    Caption = 'Corte'
    TabOrder = 4
    OnClick = BitBtn5Click
  end
  object EdCaminho: TEdit
    Left = 184
    Top = 56
    Width = 305
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 5
  end
  object OpenDialog1: TOpenDialog
    Left = 456
    Top = 16
  end
end
