object FEmissaoEtiquetas: TFEmissaoEtiquetas
  Left = 494
  Top = 182
  Width = 463
  Height = 337
  Caption = 'Emiss'#227'o de Etiquetas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 18
    Top = 112
    Width = 67
    Height = 19
    Caption = 'Descri'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 18
    Top = 80
    Width = 77
    Height = 19
    Caption = 'Quantidade'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 18
    Top = 144
    Width = 38
    Height = 19
    Caption = 'Pre'#231'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 18
    Top = 204
    Width = 93
    Height = 19
    Caption = 'Nr. Etiquetas:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 48
    Top = 24
    Width = 360
    Height = 31
    Caption = 'NAPOLI CASA DAS MASSAS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 18
    Top = 173
    Width = 79
    Height = 19
    Caption = 'Un. Medida'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object MeCodigo: TMaskEdit
    Left = 111
    Top = 80
    Width = 88
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object MeDescricao: TMaskEdit
    Left = 111
    Top = 112
    Width = 317
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
  end
  object MePreco: TMaskEdit
    Left = 111
    Top = 144
    Width = 89
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 2
  end
  object MeQuantidade: TMaskEdit
    Left = 111
    Top = 204
    Width = 57
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 4
  end
  object BitBtn1: TBitBtn
    Left = 123
    Top = 252
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 5
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
    Left = 227
    Top = 252
    Width = 75
    Height = 25
    TabOrder = 6
    OnClick = BitBtn2Click
    Kind = bkCancel
  end
  object MeDesc_Unidade: TMaskEdit
    Left = 111
    Top = 173
    Width = 55
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 3
    Text = 'KG'
  end
end
