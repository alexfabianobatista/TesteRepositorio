inherited FGrupoFiscalParam: TFGrupoFiscalParam
  Left = 457
  Top = 205
  Width = 432
  Height = 408
  Caption = 'Par'#226'metros Grupos Fiscais'
  PixelsPerInch = 96
  TextHeight = 14
  inherited PGRelatorio: TPageControl
    Width = 424
    Height = 321
    ActivePage = TabSheet2
    object TabSheet1: TTabSheet
      Caption = 'Valores Grupo Fiscal'
      object GroupBox1: TGroupBox
        Left = 4
        Top = 45
        Width = 191
        Height = 54
        Caption = 'Natureza de Opera'#231#227'o'
        TabOrder = 1
        object Label1: TLabel
          Left = 88
          Top = 32
          Width = 15
          Height = 14
          Caption = 'at'#233
        end
        object ME1NatOperacao_I: TMaskEdit
          Left = 7
          Top = 24
          Width = 77
          Height = 22
          EditMask = '!999999;1;_'
          MaxLength = 6
          TabOrder = 0
          Text = '      '
        end
        object ME1NatOperacao_F: TMaskEdit
          Left = 106
          Top = 24
          Width = 77
          Height = 22
          EditMask = '!999999;1;_'
          MaxLength = 6
          TabOrder = 1
          Text = '      '
        end
      end
      object GroupBox3: TGroupBox
        Left = 4
        Top = 103
        Width = 191
        Height = 60
        Caption = 'Per'#237'odo'
        TabOrder = 2
        object Label4: TLabel
          Left = 7
          Top = 14
          Width = 24
          Height = 14
          Caption = 'Inicio'
        end
        object Label5: TLabel
          Left = 103
          Top = 14
          Width = 16
          Height = 14
          Caption = 'Fim'
        end
        object ME1Data_I: TMaskEdit
          Left = 7
          Top = 30
          Width = 80
          Height = 22
          EditMask = '!99/99/0000;1;_'
          MaxLength = 10
          TabOrder = 0
          Text = '  /  /    '
        end
        object ME1Data_F: TMaskEdit
          Left = 103
          Top = 30
          Width = 80
          Height = 22
          EditMask = '!99/99/0000;1;_'
          MaxLength = 10
          TabOrder = 1
          Text = '  /  /    '
        end
      end
      inline FmFilial1: TFmFilial
        Left = 4
        Top = 4
        Width = 265
        Height = 37
        TabOrder = 0
        inherited Label1: TLabel
          Height = 14
        end
        inherited MeFilial: TMaskEdit
          Height = 22
        end
        inherited EdFilial: TEdit
          Height = 22
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Arquivo DFC'
      ImageIndex = 1
      object Label122: TLabel
        Left = 6
        Top = 86
        Width = 302
        Height = 14
        Caption = 'Opera'#231#227'o - Somente opera'#231#245'es de compra produtos primarios'
      end
      object Label8: TLabel
        Left = 4
        Top = 126
        Width = 130
        Height = 14
        Caption = 'Grupo 823 (Estoque Inicial)'
      end
      object Label9: TLabel
        Left = 4
        Top = 166
        Width = 126
        Height = 14
        Caption = 'Grupo 921 (Estoque Final)'
      end
      object GroupBox2: TGroupBox
        Left = 207
        Top = 149
        Width = 188
        Height = 58
        Caption = 'Per'#237'odo'
        TabOrder = 5
        object Label2: TLabel
          Left = 9
          Top = 15
          Width = 24
          Height = 14
          Caption = 'Inicio'
        end
        object Label3: TLabel
          Left = 105
          Top = 15
          Width = 16
          Height = 14
          Caption = 'Fim'
        end
        object ME2DtInicial: TMaskEdit
          Left = 9
          Top = 31
          Width = 80
          Height = 22
          EditMask = '!99/99/0000;1;_'
          MaxLength = 10
          TabOrder = 0
          Text = '  /  /    '
        end
        object ME2DtFinal: TMaskEdit
          Left = 105
          Top = 31
          Width = 80
          Height = 22
          EditMask = '!99/99/0000;1;_'
          MaxLength = 10
          TabOrder = 1
          Text = '  /  /    '
        end
      end
      inline FmFilial2: TFmFilial
        Left = 4
        Top = 4
        Width = 397
        Height = 37
        TabOrder = 0
        inherited Label1: TLabel
          Height = 14
        end
        inherited MeFilial: TMaskEdit
          Height = 22
        end
        inherited EdFilial: TEdit
          Width = 317
          Height = 22
        end
      end
      inline FmCadastro1: TFmCadastro
        Left = 5
        Top = 45
        Width = 399
        Height = 37
        TabOrder = 1
        inherited Label1: TLabel
          Top = -2
          Width = 168
          Height = 14
          Caption = 'Cadastro Contabilista Respons'#225'vel'
        end
        inherited MeCadastro: TMaskEdit
          Height = 22
        end
        inherited EdCadastro: TEdit
          Width = 317
          Height = 22
        end
      end
      object MeOperacao9: TMaskEdit
        Left = 5
        Top = 101
        Width = 364
        Height = 22
        TabOrder = 2
      end
      object BtOperacoes3: TBitBtn
        Left = 372
        Top = 99
        Width = 25
        Height = 24
        TabOrder = 7
        TabStop = False
        OnClick = BtOperacoes3Click
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
      end
      object ME823: TMaskEdit
        Left = 5
        Top = 141
        Width = 145
        Height = 22
        TabOrder = 3
      end
      object ME921: TMaskEdit
        Left = 5
        Top = 181
        Width = 145
        Height = 22
        TabOrder = 4
      end
      object Rg9TipoDocumento: TRadioGroup
        Left = 5
        Top = 216
        Width = 388
        Height = 73
        Caption = 'Tipo Documento'
        ItemIndex = 0
        Items.Strings = (
          'DFC Normal'
          'DFC de Retifica'#231#227'o'
          'DFC de Baixa')
        TabOrder = 6
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Relat'#243'rio DFC'
      ImageIndex = 2
      inline FmFilial3: TFmFilial
        Left = 4
        Top = 4
        Width = 265
        Height = 37
        TabOrder = 0
        inherited Label1: TLabel
          Height = 14
        end
        inherited MeFilial: TMaskEdit
          Height = 22
        end
        inherited EdFilial: TEdit
          Height = 22
        end
      end
      object GroupBox4: TGroupBox
        Left = 4
        Top = 45
        Width = 191
        Height = 60
        Caption = 'Per'#237'odo'
        TabOrder = 1
        object Label6: TLabel
          Left = 7
          Top = 14
          Width = 24
          Height = 14
          Caption = 'Inicio'
        end
        object Label7: TLabel
          Left = 103
          Top = 14
          Width = 16
          Height = 14
          Caption = 'Fim'
        end
        object Me3Data_I: TMaskEdit
          Left = 7
          Top = 30
          Width = 80
          Height = 22
          EditMask = '!99/99/0000;1;_'
          MaxLength = 10
          TabOrder = 0
          Text = '  /  /    '
        end
        object Me3Data_F: TMaskEdit
          Left = 103
          Top = 30
          Width = 80
          Height = 22
          EditMask = '!99/99/0000;1;_'
          MaxLength = 10
          TabOrder = 1
          Text = '  /  /    '
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Arquivo G.I.'
      ImageIndex = 3
      object Label10: TLabel
        Left = 6
        Top = 86
        Width = 302
        Height = 14
        Caption = 'Opera'#231#227'o - Somente opera'#231#245'es de compra produtos primarios'
      end
      inline FmFilial4: TFmFilial
        Left = 4
        Top = 4
        Width = 397
        Height = 38
        TabOrder = 0
        inherited Label1: TLabel
          Height = 14
        end
        inherited MeFilial: TMaskEdit
          Top = 16
          Height = 22
        end
        inherited EdFilial: TEdit
          Width = 317
          Height = 22
        end
      end
      inline FmCadastro2: TFmCadastro
        Left = 3
        Top = 45
        Width = 399
        Height = 37
        TabOrder = 1
        inherited Label1: TLabel
          Top = -2
          Width = 168
          Height = 14
          Caption = 'Cadastro Contabilista Respons'#225'vel'
        end
        inherited MeCadastro: TMaskEdit
          Height = 22
        end
        inherited BtCadastro: TBitBtn
          OnClick = FmCadastro2BtCadastroClick
        end
        inherited EdCadastro: TEdit
          Width = 317
          Height = 22
        end
      end
      object MeOperacao4: TMaskEdit
        Left = 5
        Top = 101
        Width = 364
        Height = 22
        TabOrder = 2
      end
      object BtOperacoes4: TBitBtn
        Left = 372
        Top = 99
        Width = 25
        Height = 24
        TabOrder = 3
        TabStop = False
        OnClick = BtOperacoes4Click
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
      end
      object GroupBox5: TGroupBox
        Left = 207
        Top = 149
        Width = 188
        Height = 58
        Caption = 'Per'#237'odo'
        TabOrder = 4
        object Label11: TLabel
          Left = 9
          Top = 15
          Width = 24
          Height = 14
          Caption = 'Inicio'
        end
        object Label12: TLabel
          Left = 105
          Top = 15
          Width = 16
          Height = 14
          Caption = 'Fim'
        end
        object ME4DtInicial: TMaskEdit
          Left = 9
          Top = 31
          Width = 80
          Height = 22
          EditMask = '!99/99/0000;1;_'
          MaxLength = 10
          TabOrder = 0
          Text = '  /  /    '
        end
        object ME4DtFinal: TMaskEdit
          Left = 105
          Top = 31
          Width = 80
          Height = 22
          EditMask = '!99/99/0000;1;_'
          MaxLength = 10
          TabOrder = 1
          Text = '  /  /    '
        end
      end
    end
  end
  inherited BtOk: TBitBtn
    Left = 236
    Top = 354
  end
  inherited BtCancela: TBitBtn
    Left = 332
    Top = 354
  end
  inherited RGPreview: TRadioGroup
    Top = 322
  end
  object SDlgGrupoFiscal: TSaveDialog
    DefaultExt = 'Txt'
    Filter = 'Texto|txt'
    Left = 208
    Top = 48
  end
end
