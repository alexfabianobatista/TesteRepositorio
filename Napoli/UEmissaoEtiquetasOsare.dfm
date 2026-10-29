object FEmissaoEtiquetasOsare: TFEmissaoEtiquetasOsare
  Left = 494
  Top = 182
  Width = 508
  Height = 283
  Caption = 'Emiss'#227'o de Etiquetas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 56
    Top = 68
    Width = 48
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object Label2: TLabel
    Left = 56
    Top = 36
    Width = 36
    Height = 13
    Caption = 'C'#243'digo:'
  end
  object Label3: TLabel
    Left = 56
    Top = 100
    Width = 24
    Height = 13
    Caption = 'Valor'
  end
  object Label4: TLabel
    Left = 56
    Top = 132
    Width = 70
    Height = 13
    Caption = 'Qtd. Etiquetas:'
  end
  object Label5: TLabel
    Left = 184
    Top = 24
    Width = 100
    Height = 32
    Caption = 'OSARE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object MeCodigo: TMaskEdit
    Left = 113
    Top = 36
    Width = 88
    Height = 21
    TabOrder = 0
  end
  object MeDescricao: TMaskEdit
    Left = 112
    Top = 68
    Width = 297
    Height = 21
    TabOrder = 1
  end
  object MePreco: TMaskEdit
    Left = 134
    Top = 97
    Width = 90
    Height = 21
    TabOrder = 2
  end
  object MeQuantidade: TMaskEdit
    Left = 134
    Top = 128
    Width = 57
    Height = 21
    TabOrder = 3
  end
  object BitBtn1: TBitBtn
    Left = 152
    Top = 197
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
    Left = 264
    Top = 197
    Width = 75
    Height = 25
    TabOrder = 5
    OnClick = BitBtn2Click
    Kind = bkCancel
  end
  object RGTipoValor: TRadioGroup
    Left = 296
    Top = 92
    Width = 114
    Height = 62
    Caption = 'Tipo de Valor'
    ItemIndex = 0
    Items.Strings = (
      'Valor'
      'Porcentagem')
    TabOrder = 6
  end
end
