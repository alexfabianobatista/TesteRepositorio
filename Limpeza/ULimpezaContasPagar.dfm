inherited FLimpezaContasPagar: TFLimpezaContasPagar
  Left = 308
  Top = 179
  Caption = 'Limpeza registros contas pagar'
  ClientHeight = 357
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel [0]
    Left = 88
    Top = 144
    Width = 77
    Height = 14
    Caption = 'Tipo Documento'
  end
  inherited Panel1: TPanel
    TabOrder = 5
    Visible = False
  end
  inherited StBLongHint: TStatusBar
    Top = 338
  end
  inline FmFilial: TFmFilial [3]
    Left = 88
    Top = 102
    Width = 377
    Height = 37
    TabOrder = 0
    inherited Label1: TLabel
      Height = 14
    end
    inherited MeFilial: TMaskEdit
      Height = 22
    end
    inherited EdFilial: TEdit
      Width = 301
      Height = 22
    end
  end
  inline FmDatas: TFmDatas [4]
    Left = 88
    Top = 188
    Width = 193
    Height = 65
    TabOrder = 2
    inherited GroupBox1: TGroupBox
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
  object MeTipoDocumento: TMaskEdit [5]
    Left = 88
    Top = 159
    Width = 49
    Height = 22
    TabOrder = 1
  end
  object BitBtn1: TBitBtn [6]
    Left = 88
    Top = 272
    Width = 137
    Height = 25
    Caption = 'Efetuar Limpeza'
    Default = True
    TabOrder = 3
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
  object BitBtn2: TBitBtn [7]
    Left = 256
    Top = 272
    Width = 137
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 4
    Kind = bkCancel
  end
  inherited MMCadSimples: TMainMenu [8]
    inherited Manuteno1: TMenuItem
      Visible = False
    end
    inherited Relatrios1: TMenuItem
      Visible = False
    end
  end
  inherited DSPrimario: TDataSource [9]
  end
end
