object FTransferenciaCaixaBanco: TFTransferenciaCaixaBanco
  Left = 491
  Top = 178
  Width = 433
  Height = 426
  Caption = 'Transfer'#234'ncia Caixa/Banco'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  DesignSize = (
    417
    387)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 59
    Top = 294
    Width = 105
    Height = 13
    Caption = 'Data Lan'#231'amento:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 180
    Top = 293
    Width = 30
    Height = 13
    Caption = 'Valor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 58
    Top = 252
    Width = 76
    Height = 13
    Caption = 'Complemento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inline FmHistoricoCaixa: TFmHistorico
    Left = 58
    Top = 47
    Width = 292
    Height = 37
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    inherited Label1: TLabel
      Left = 5
      Top = 0
      Width = 124
      Caption = 'Hist'#243'rico Sa'#237'da Caixa'
    end
    inherited MeHistorico: TMaskEdit
      Width = 51
    end
    inherited BtHistorico: TBitBtn
      Left = 54
    end
    inherited EdHistorico: TEdit
      Left = 83
      Width = 178
    end
  end
  inline FmHistoricoBanco: TFmHistorico
    Left = 58
    Top = 94
    Width = 287
    Height = 37
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    inherited Label1: TLabel
      Width = 139
      Caption = 'Hist'#243'rico Entrada Banco'
    end
    inherited MeHistorico: TMaskEdit
      Width = 51
    end
    inherited BtHistorico: TBitBtn
      Left = 54
    end
    inherited EdHistorico: TEdit
      Left = 83
      Width = 178
    end
  end
  inline FmFilial1: TFmFilial
    Left = 58
    Top = 0
    Width = 291
    Height = 37
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    inherited Label1: TLabel
      Width = 27
    end
    inherited MeFilial: TMaskEdit
      Width = 51
    end
    inherited BtFilial: TBitBtn
      Left = 54
    end
    inherited EdFilial: TEdit
      Left = 83
      Width = 178
    end
  end
  object MeDtLancamento: TMaskEdit
    Left = 63
    Top = 318
    Width = 77
    Height = 21
    EditMask = '!99/99/9999;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 10
    ParentFont = False
    TabOrder = 7
    Text = '  /  /    '
  end
  object MeValor: TMaskEdit
    Left = 176
    Top = 318
    Width = 101
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
  end
  inline FmDepartamento1: TFmDepartamento
    Left = 58
    Top = 180
    Width = 303
    Height = 37
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    inherited Label1: TLabel
      Width = 80
    end
    inherited MeDepartamento: TMaskEdit
      Width = 51
    end
    inherited BtDepartamento: TBitBtn
      Left = 54
    end
    inherited EdDepartamento: TEdit
      Left = 83
      Width = 178
    end
  end
  object BtOk: TBitBtn
    Left = 65
    Top = 353
    Width = 85
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    TabOrder = 9
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
  object BtCancela: TBitBtn
    Left = 189
    Top = 353
    Width = 85
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cancelar'
    TabOrder = 10
    OnClick = BtCancelaClick
    Kind = bkCancel
  end
  inline FmContaCorrente1: TFmContaCorrente
    Left = 58
    Top = 136
    Width = 291
    Height = 37
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    inherited Label1: TLabel
      Width = 86
    end
    inherited MeContaCorrente: TMaskEdit
      Width = 51
    end
    inherited BtContaCorrente: TBitBtn
      Left = 54
    end
    inherited EdContaCorrente: TEdit
      Left = 83
      Width = 178
    end
  end
  object MeComplemento: TMaskEdit
    Left = 56
    Top = 265
    Width = 321
    Height = 21
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
  end
  inline FmCadastro1: TFmCadastro
    Left = 58
    Top = 217
    Width = 265
    Height = 37
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    inherited Label1: TLabel
      Width = 109
      Caption = 'Motorista/Cadastro'
    end
    inherited MeCadastro: TMaskEdit
      Width = 50
    end
    inherited BtCadastro: TBitBtn
      Left = 53
    end
    inherited EdCadastro: TEdit
      Left = 80
      Width = 185
    end
  end
end
