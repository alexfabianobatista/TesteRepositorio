inherited FLimpezaRomaneio: TFLimpezaRomaneio
  Left = 382
  Top = 184
  Caption = 'Limpeza Romaneio Agricola'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Panel1: TPanel
    Visible = False
  end
  inline FmFilial1: TFmFilial [2]
    Left = 56
    Top = 64
    Width = 369
    Height = 37
    TabOrder = 2
    inherited Label1: TLabel
      Height = 14
    end
    inherited MeFilial: TMaskEdit
      Height = 22
    end
    inherited EdFilial: TEdit
      Width = 293
      Height = 22
    end
  end
  inline FmDatas1: TFmDatas [3]
    Left = 56
    Top = 157
    Width = 178
    Height = 60
    TabOrder = 3
    inherited GroupBox1: TGroupBox
      Top = 1
      inherited Label1: TLabel
        Width = 26
        Height = 14
      end
      inherited Label2: TLabel
        Height = 14
      end
      inherited MeDtInicial: TMaskEdit
        Height = 22
      end
      inherited MeDtFinal: TMaskEdit
        Height = 22
      end
    end
  end
  object BitBtn1: TBitBtn [4]
    Left = 128
    Top = 248
    Width = 137
    Height = 25
    Caption = 'Efetuar Limpeza'
    Default = True
    TabOrder = 4
    OnClick = BitBtn1Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000010000000000000000000
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
  object BitBtn2: TBitBtn [5]
    Left = 280
    Top = 248
    Width = 137
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 5
    Kind = bkCancel
  end
  object RgTipoRomaneio: TRadioGroup [6]
    Left = 248
    Top = 112
    Width = 185
    Height = 105
    Caption = 'Tipo'
    ItemIndex = 0
    Items.Strings = (
      'Todos'
      'Romaneio'
      'Pesagem Entrada'
      'Pesagem Saida'
      'Diversos'
      'Transf. Entrada'
      'Transf. Sa'#237'da')
    TabOrder = 6
  end
  inherited MMCadSimples: TMainMenu [7]
  end
  inherited DSPrimario: TDataSource [8]
  end
  inherited ILBotao: TImageList [9]
  end
end
