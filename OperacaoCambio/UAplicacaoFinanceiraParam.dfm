inherited FAplicacaoFinanceiraParam: TFAplicacaoFinanceiraParam
  Left = 352
  Top = 166
  Width = 446
  Height = 379
  Caption = 'Par'#226'metros'
  PixelsPerInch = 96
  TextHeight = 14
  inherited PGRelatorio: TPageControl
    Width = 438
    Height = 281
    ActivePage = TabSheet1
    object TabSheet1: TTabSheet
      Caption = 'Lista Aplica'#231#245'es'
      object Label97: TLabel
        Left = 8
        Top = 53
        Width = 73
        Height = 14
        Caption = 'Conta Corrente'
      end
      object SB1ContaCorrente: TSpeedButton
        Left = 56
        Top = 69
        Width = 25
        Height = 24
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
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
        OnClick = SB1ContaCorrenteClick
      end
      object ME1ContaCorrente: TMaskEdit
        Left = 8
        Top = 69
        Width = 43
        Height = 22
        EditMask = '######'
        MaxLength = 6
        TabOrder = 1
        Text = '      '
        OnExit = ME1ContaCorrenteExit
      end
      object Ed1ContaCorrente: TEdit
        Left = 83
        Top = 69
        Width = 189
        Height = 22
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 6
        Text = 'Todas'
      end
      object GroupBox1: TGroupBox
        Left = 8
        Top = 184
        Width = 168
        Height = 67
        Caption = 'Data da Aplica'#231#227'o'
        TabOrder = 4
        object Label5: TLabel
          Left = 7
          Top = 19
          Width = 57
          Height = 14
          Caption = 'Data Inicial :'
        end
        object Label6: TLabel
          Left = 87
          Top = 19
          Width = 53
          Height = 14
          Caption = 'Data Final :'
        end
        object ME1DtAplicacaoI: TMaskEdit
          Left = 7
          Top = 35
          Width = 73
          Height = 22
          EditMask = '!99/99/9999;1;_'
          MaxLength = 10
          TabOrder = 0
          Text = '  /  /    '
        end
        object ME1DtAplicacaoF: TMaskEdit
          Left = 87
          Top = 35
          Width = 73
          Height = 22
          EditMask = '!99/99/9999;1;_'
          MaxLength = 10
          TabOrder = 1
          Text = '  /  /    '
        end
      end
      inline FmFilial1: TFmFilial
        Left = 8
        Top = 8
        Width = 265
        Height = 37
        TabOrder = 0
        inherited Label1: TLabel
          Height = 14
        end
        inherited MeFilial: TMaskEdit
          Height = 22
        end
        inherited BtFilial: TBitBtn
          OnClick = FmFilial1BtFilialClick
        end
        inherited EdFilial: TEdit
          Height = 22
        end
      end
      inline FmHistorico1: TFmHistorico
        Left = 8
        Top = 96
        Width = 265
        Height = 37
        TabOrder = 2
        inherited Label1: TLabel
          Width = 42
          Height = 14
        end
        inherited MeHistorico: TMaskEdit
          Height = 22
        end
        inherited EdHistorico: TEdit
          Height = 22
        end
      end
      inline FmDepartamento1: TFmDepartamento
        Left = 8
        Top = 136
        Width = 265
        Height = 37
        TabOrder = 3
        inherited Label1: TLabel
          Left = 0
          Height = 14
        end
        inherited MeDepartamento: TMaskEdit
          Height = 22
        end
        inherited EdDepartamento: TEdit
          Height = 22
        end
      end
      object Rg1Opcao: TRadioGroup
        Left = 184
        Top = 184
        Width = 185
        Height = 67
        Caption = 'Op'#231#227'o'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Todos'
          'Abertos'
          'Baixados')
        TabOrder = 5
      end
    end
  end
  inherited BtOk: TBitBtn
    Top = 320
  end
  inherited BtCancela: TBitBtn
    Top = 320
  end
  inherited RGPreview: TRadioGroup
    Top = 288
  end
end
