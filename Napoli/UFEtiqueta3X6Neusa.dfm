object FEtiqueta3X6Neusa: TFEtiqueta3X6Neusa
  Left = 414
  Top = 250
  Width = 476
  Height = 220
  Caption = 'Etiqueta 3X6'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 45
    Top = 24
    Width = 50
    Height = 19
    Caption = 'Linha 1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 45
    Top = 52
    Width = 50
    Height = 19
    Caption = 'Linha 2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 45
    Top = 80
    Width = 50
    Height = 19
    Caption = 'Linha 3'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 109
    Width = 88
    Height = 19
    Caption = 'Nr. Etiquetas'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object MeDescricao1: TMaskEdit
    Left = 99
    Top = 24
    Width = 334
    Height = 21
    MaxLength = 24
    TabOrder = 0
  end
  object MeDescricao2: TMaskEdit
    Left = 99
    Top = 52
    Width = 334
    Height = 21
    MaxLength = 24
    TabOrder = 1
  end
  object MeDescricao3: TMaskEdit
    Left = 99
    Top = 80
    Width = 334
    Height = 21
    MaxLength = 24
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 113
    Top = 139
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 4
    OnClick = BitBtn1Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 201
    Top = 139
    Width = 75
    Height = 25
    TabOrder = 5
    Kind = bkCancel
  end
  object MeQuantidade: TMaskEdit
    Left = 99
    Top = 109
    Width = 57
    Height = 21
    TabOrder = 3
    Text = '1'
  end
end
