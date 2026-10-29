object FAlteraProduto: TFAlteraProduto
  Left = 355
  Top = 187
  Width = 424
  Height = 164
  Caption = 'Alterar C'#243'digo Produto'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  inline FmProduto: TFmProduto
    Left = 24
    Top = 24
    Width = 361
    Height = 37
    TabOrder = 0
    inherited EdProduto: TEdit
      Width = 285
    end
  end
  object BitBtn1: TBitBtn
    Left = 96
    Top = 88
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 200
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 2
    Kind = bkCancel
  end
end
