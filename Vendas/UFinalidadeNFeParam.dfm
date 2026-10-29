object FFinalidadeNFeParam: TFFinalidadeNFeParam
  Left = 486
  Top = 208
  BorderStyle = bsSingle
  Caption = 'Par'#226'metros'
  ClientHeight = 164
  ClientWidth = 287
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    287
    164)
  PixelsPerInch = 96
  TextHeight = 13
  object RGFinalidade: TRadioGroup
    Left = 24
    Top = 24
    Width = 241
    Height = 89
    Caption = 'Finalidade da NF-e'
    ItemIndex = 0
    Items.Strings = (
      'NF-e Normal'
      'NF-e de Complemento'
      'NF-e de Ajuste'
      'Devolu'#231#227'o de Mercadoria')
    TabOrder = 0
  end
  object BtOk: TBitBtn
    Left = 40
    Top = 126
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    TabOrder = 1
    Kind = bkOK
  end
  object BtCancela: TBitBtn
    Left = 172
    Top = 126
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    TabOrder = 2
    Kind = bkCancel
  end
end
