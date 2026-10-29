object FPesagem: TFPesagem
  Left = 585
  Top = 285
  Width = 228
  Height = 211
  Caption = 'Balan'#231'a'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblPeso: TLabel
    Left = 40
    Top = 48
    Width = 108
    Height = 37
    Caption = '000000'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -33
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 160
    Top = 64
    Width = 15
    Height = 13
    Caption = 'KG'
  end
  object lblConfirmado: TLabel
    Left = 48
    Top = 96
    Width = 71
    Height = 13
    Caption = 'Peso recebido.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object btnOk: TButton
    Left = 112
    Top = 120
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 0
    OnClick = btnOkClick
  end
  object btnPesar: TButton
    Left = 32
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Pesar'
    TabOrder = 1
  end
  object tmrBalanca: TTimer
    Enabled = False
    Interval = 200
    OnTimer = tmrBalancaTimer
    Left = 32
  end
  object rdBal: TReadWeight
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 144
    Top = 8
  end
end
