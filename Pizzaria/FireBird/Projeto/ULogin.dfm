object FLogin: TFLogin
  Left = 513
  Top = 311
  Width = 300
  Height = 278
  Caption = 'Login'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 292
    Height = 244
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 16
    Width = 145
    Height = 25
    Caption = 'Selecionar Banco de Dados'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
end
