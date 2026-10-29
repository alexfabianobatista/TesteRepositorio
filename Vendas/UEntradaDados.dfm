object FEntradaDados: TFEntradaDados
  Left = 548
  Top = 349
  BorderIcons = []
  BorderStyle = bsDialog
  ClientHeight = 104
  ClientWidth = 325
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 24
  object LbNome: TLabel
    Left = 14
    Top = 2
    Width = 47
    Height = 20
    Caption = 'Nome'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label2: TLabel
    Left = 14
    Top = 39
    Width = 54
    Height = 24
    Caption = 'Cart'#227'o'
    Visible = False
  end
  object MeDados: TMaskEdit
    Left = 73
    Top = 34
    Width = 195
    Height = 32
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnChange = MeDadosChange
    OnKeyDown = MeDadosKeyDown
  end
  object MeNome: TMaskEdit
    Left = 73
    Top = 1
    Width = 195
    Height = 32
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Visible = False
    OnChange = MeDadosChange
    OnKeyDown = MeDadosKeyDown
  end
end
