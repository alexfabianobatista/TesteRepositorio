object FMsgPersonalizadaEmbarque: TFMsgPersonalizadaEmbarque
  Left = 240
  Top = 150
  Width = 549
  Height = 389
  Caption = 'Aten'#231#227'o'
  Color = clRed
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object lbMensagem: TLabel
    Left = 8
    Top = 28
    Width = 521
    Height = 229
    Alignment = taCenter
    AutoSize = False
    Caption = 'lbMensagem'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNone
    Font.Height = -33
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object Panel1: TPanel
    Left = 216
    Top = 283
    Width = 97
    Height = 49
    Color = clBtnHighlight
    TabOrder = 0
    object BtOk: TBitBtn
      Left = 0
      Top = 0
      Width = 97
      Height = 49
      TabOrder = 0
      OnClick = BtOkClick
      Kind = bkOK
    end
  end
end
