inherited FLimpezaNotas: TFLimpezaNotas
  Left = 340
  Top = 182
  Caption = 'Limpeza Notas Fiscais'
  ClientHeight = 411
  PixelsPerInch = 96
  TextHeight = 14
  inherited Panel1: TPanel
    TabOrder = 7
    Visible = False
  end
  inline FmFilial: TFmFilial [2]
    Left = 88
    Top = 72
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
  inline FmDatas: TFmDatas [3]
    Left = 88
    Top = 257
    Width = 205
    Height = 65
    TabOrder = 4
    inherited GroupBox1: TGroupBox
      Top = 1
      Width = 193
      Height = 61
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
    Left = 64
    Top = 323
    Width = 137
    Height = 25
    Caption = 'Efetuar Limpeza'
    Default = True
    TabOrder = 5
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
    Left = 224
    Top = 323
    Width = 137
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 6
    Kind = bkCancel
  end
  inline FmOperacao: TFmOperacao [6]
    Left = 88
    Top = 122
    Width = 377
    Height = 37
    TabOrder = 1
    inherited Label1: TLabel
      Width = 48
      Height = 14
    end
    inherited MeOperacao: TMaskEdit
      Height = 22
    end
    inherited EdOperacao: TEdit
      Width = 301
      Height = 22
    end
  end
  object RGTipoPagamento: TRadioGroup [7]
    Left = 87
    Top = 204
    Width = 274
    Height = 49
    Caption = 'Tipo de Pagamento'
    Columns = 4
    ItemIndex = 0
    Items.Strings = (
      'A vista'
      'A prazo'
      'Outros'
      'Todos')
    TabOrder = 3
  end
  inherited StBLongHint: TStatusBar [8]
    Top = 392
  end
  inline FmCadastro1: TFmCadastro [9]
    Left = 88
    Top = 162
    Width = 377
    Height = 37
    TabOrder = 2
    inherited Label1: TLabel
      Width = 44
      Height = 14
    end
    inherited MeCadastro: TMaskEdit
      Height = 22
    end
    inherited EdCadastro: TEdit
      Width = 301
      Height = 22
    end
  end
  inherited DSPrimario: TDataSource [10]
  end
  inherited MMCadSimples: TMainMenu
    inherited Manuteno1: TMenuItem
      Visible = False
    end
    inherited Relatrios1: TMenuItem
      Visible = False
    end
  end
end
