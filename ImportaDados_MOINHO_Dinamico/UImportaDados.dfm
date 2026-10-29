object FImportaDados: TFImportaDados
  Left = 606
  Top = 183
  Width = 277
  Height = 87
  Caption = 'FImportaDados'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object BtnExportarSyngenta: TBitBtn
    Left = 16
    Top = 16
    Width = 75
    Height = 25
    Caption = 'SKU'
    TabOrder = 0
    OnClick = BtnExportarSyngentaClick
  end
  object BitBtn18: TBitBtn
    Left = 96
    Top = 16
    Width = 75
    Height = 25
    Caption = 'DFU'
    TabOrder = 1
    OnClick = BitBtn18Click
  end
  object BitBtn19: TBitBtn
    Left = 176
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Exclus'#227'o NF'
    TabOrder = 2
    OnClick = BitBtn19Click
  end
end
