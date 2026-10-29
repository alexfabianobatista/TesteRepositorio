object FDocOriginarioParam: TFDocOriginarioParam
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
  object RGNotaFiscal: TRadioGroup
    Left = 24
    Top = 24
    Width = 241
    Height = 89
    Caption = 'Nota Fiscal'
    ItemIndex = 0
    Items.Strings = (
      'Importar arquivo XML'
      'Buscar nota fiscal no sistema'
      'Informar dados manualmente')
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
