object FLancaParcelamento: TFLancaParcelamento
  Left = 547
  Top = 214
  Width = 405
  Height = 512
  Caption = 'Lan'#231'a Parcelamento'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 23
    Top = 109
    Width = 48
    Height = 13
    Caption = 'Finalidade'
  end
  object Label3: TLabel
    Left = 254
    Top = 240
    Width = 68
    Height = 13
    Caption = 'Primeiro Venc.'
  end
  object Label4: TLabel
    Left = 96
    Top = 240
    Width = 66
    Height = 13
    Caption = 'Num.Parcelas'
  end
  object Label5: TLabel
    Left = 24
    Top = 240
    Width = 51
    Height = 13
    Caption = 'Num.Titulo'
  end
  object Label8: TLabel
    Left = 176
    Top = 240
    Width = 54
    Height = 13
    Caption = 'Val.Parcela'
  end
  object SB1Finalidade: TSpeedButton
    Left = 71
    Top = 123
    Width = 23
    Height = 22
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
      55555575555555775F55509999999901055557F55555557F75F5001111111101
      105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
      01105777F555557F75F75500FFFFFF0FF0105577F555FF7F57575550FF700008
      8F0055575FF7777555775555000888888F005555777FFFFFFF77555550000000
      0F055555577777777F7F555550FFFFFF0F05555557F5FFF57F7F555550F000FF
      0005555557F777557775555550FFFFFF0555555557F555FF7F55555550FF7000
      05555555575FF777755555555500055555555555557775555555}
    NumGlyphs = 2
    OnClick = SB1FinalidadeClick
  end
  object SBConfirma: TSpeedButton
    Left = 120
    Top = 375
    Width = 129
    Height = 22
    Caption = 'Lan'#231'ar'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
      00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
      70E337F3333F333337F3E0F33303333370E337F3337FF33337F3E0F333003333
      70E337F33377FF3337F3E0F33300033370E337F333777FF337F3E0F333000033
      70E337F33377773337F3E0F33300033370E337F33377733337F3E0F333003333
      70E337F33377333337F3E0F33303333370E337F33373333337F3E0F333333333
      70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
      00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
    NumGlyphs = 2
    OnClick = SBConfirmaClick
  end
  object Label1: TLabel
    Left = 25
    Top = 286
    Width = 65
    Height = 13
    Caption = 'Data Emiss'#227'o'
  end
  object Label6: TLabel
    Left = 104
    Top = 285
    Width = 116
    Height = 13
    Caption = 'N'#250'mero Primeira Parcela'
  end
  object Label7: TLabel
    Left = 26
    Top = 323
    Width = 58
    Height = 13
    Caption = 'Observa'#231#227'o'
  end
  object ME1NumTitulo: TMaskEdit
    Left = 24
    Top = 256
    Width = 58
    Height = 21
    EditMask = '########'
    MaxLength = 8
    TabOrder = 5
    Text = '        '
  end
  object ME1Finalidade: TMaskEdit
    Left = 23
    Top = 123
    Width = 43
    Height = 21
    EditMask = '######'
    MaxLength = 6
    TabOrder = 2
    Text = '      '
    OnExit = ME1FinalidadeExit
  end
  object ME1ValParcela: TMaskEdit
    Left = 176
    Top = 256
    Width = 64
    Height = 21
    TabOrder = 8
  end
  object ME1NumParcela: TMaskEdit
    Left = 96
    Top = 256
    Width = 64
    Height = 21
    EditMask = '###'
    MaxLength = 3
    TabOrder = 7
    Text = '   '
  end
  object ME1PrimVencimento: TMaskEdit
    Left = 254
    Top = 256
    Width = 72
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 9
    Text = '  /  /    '
  end
  object Ed1Finalidade: TEdit
    Left = 99
    Top = 123
    Width = 226
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 6
    Text = 'Todas'
  end
  inline FmFilial1: TFmFilial
    Left = 22
    Top = 20
    Width = 314
    Height = 38
    TabOrder = 0
    inherited EdFilial: TEdit
      Width = 226
      TabStop = False
    end
  end
  inline FmCadastro1: TFmCadastro
    Left = 22
    Top = 66
    Width = 307
    Height = 42
    TabOrder = 1
    inherited MeCadastro: TMaskEdit
      TabOrder = 1
    end
    inherited BtCadastro: TBitBtn
      TabOrder = 0
    end
    inherited EdCadastro: TEdit
      Width = 226
      TabStop = False
    end
  end
  inline FmDepartamento1: TFmDepartamento
    Left = 24
    Top = 152
    Width = 303
    Height = 43
    TabOrder = 3
    inherited Label1: TLabel
      Left = 1
    end
    inherited MeDepartamento: TMaskEdit
      TabOrder = 2
    end
    inherited BtDepartamento: TBitBtn
      TabOrder = 0
    end
    inherited EdDepartamento: TEdit
      Width = 226
      TabStop = False
      TabOrder = 1
    end
  end
  object ME1Dtemissao: TMaskEdit
    Left = 24
    Top = 301
    Width = 74
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 10
    Text = '  /  /    '
  end
  object Me1PrimeiraParc: TMaskEdit
    Left = 104
    Top = 301
    Width = 73
    Height = 21
    EditMask = '###'
    MaxLength = 3
    TabOrder = 11
    Text = '   '
  end
  inline FmContaCorrente1: TFmContaCorrente
    Left = 24
    Top = 198
    Width = 303
    Height = 37
    TabOrder = 4
    inherited EdContaCorrente: TEdit
      Width = 226
    end
  end
  object MeObservacaoLancamento: TMaskEdit
    Left = 24
    Top = 338
    Width = 305
    Height = 21
    TabOrder = 12
  end
end
