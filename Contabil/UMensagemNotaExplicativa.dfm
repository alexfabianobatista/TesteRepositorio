object FMensagemNotaExplicativa: TFMensagemNotaExplicativa
  Left = 408
  Top = 156
  Width = 545
  Height = 272
  Caption = 'Mensagem Nota Explicativa'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    537
    245)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 151
    Height = 13
    Caption = 'Digite aqui as notas explicativas'
  end
  object Memo1: TMemo
    Left = 8
    Top = 24
    Width = 521
    Height = 185
    TabOrder = 0
  end
  object BtOk: TBitBtn
    Left = 441
    Top = 216
    Width = 85
    Height = 25
    Anchors = [akRight, akBottom]
    TabOrder = 1
    Kind = bkOK
  end
  object BtCancela: TBitBtn
    Left = 353
    Top = 216
    Width = 85
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cancelar'
    TabOrder = 2
    Kind = bkCancel
  end
end
