object FTEF: TFTEF
  Left = 411
  Top = 261
  BorderStyle = bsDialog
  Caption = 'T.E.F. - Transfer'#234'ncia Eletr'#244'nica de Fundos'
  ClientHeight = 87
  ClientWidth = 506
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object lbMensagem: TLabel
    Left = 0
    Top = 8
    Width = 34
    Height = 20
    Caption = 'TEF'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btIniciaTef: TBitBtn
    Left = 168
    Top = 48
    Width = 161
    Height = 33
    Caption = 'Iniciar transa'#231#227'o TEF'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = btIniciaTefClick
  end
end
