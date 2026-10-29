object FAtualizaPrecoMarca: TFAtualizaPrecoMarca
  Left = 421
  Top = 198
  Width = 302
  Height = 284
  Caption = 'Atualiza Pre'#231'o por Marca'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  DesignSize = (
    286
    246)
  PixelsPerInch = 96
  TextHeight = 13
  object LblPorcentagem: TLabel
    Left = 8
    Top = 8
    Width = 119
    Height = 13
    Caption = 'Percentual Reajuste (%) :'
  end
  object MePorcentagem: TMaskEdit
    Left = 8
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 0
    Text = '0'
    OnKeyPress = MePorcentagemKeyPress
  end
  object BtOk: TBitBtn
    Left = 107
    Top = 209
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    TabOrder = 4
    OnClick = BtOkClick
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
  object BtCancelar: TBitBtn
    Left = 195
    Top = 209
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cancelar'
    TabOrder = 5
    Kind = bkCancel
  end
  inline FmClasse: TFmClasse
    Left = 8
    Top = 56
    Width = 265
    Height = 41
    TabOrder = 1
    inherited MeClasse: TMaskEdit
      OnExit = FmClasseMeClasseExit
    end
    inherited BtClasse: TBitBtn
      OnClick = FmClasseBtClasseClick
    end
  end
  inline FmProduto: TFmProduto
    Left = 8
    Top = 104
    Width = 265
    Height = 41
    TabOrder = 2
  end
  inline FmMarca: TFmMarca
    Left = 8
    Top = 152
    Width = 268
    Height = 41
    TabOrder = 3
  end
end
