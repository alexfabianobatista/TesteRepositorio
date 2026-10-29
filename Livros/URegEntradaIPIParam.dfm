inherited FRegEntradaIPIParam: TFRegEntradaIPIParam
  Left = 429
  Top = 171
  Caption = 'Par'#226'metros'
  PixelsPerInch = 96
  TextHeight = 14
  inherited PGRelatorio: TPageControl
    ActivePage = TabSheet1
    object TabSheet1: TTabSheet
      Caption = 'Registro de Entradas IPI'
      object Label6: TLabel
        Left = 9
        Top = 0
        Width = 20
        Height = 14
        Caption = 'Filial'
      end
      object Label7: TLabel
        Left = 10
        Top = 52
        Width = 110
        Height = 14
        Caption = 'Natureza de Operacao'
      end
      object Me0CodFilial: TMaskEdit
        Left = 9
        Top = 17
        Width = 44
        Height = 22
        EditMask = '######'
        MaxLength = 6
        TabOrder = 0
        Text = '      '
        OnExit = Me0CodFilialExit
      end
      object Bt0FilialCons: TBitBtn
        Left = 54
        Top = 16
        Width = 27
        Height = 23
        TabOrder = 1
        TabStop = False
        OnClick = Bt0FilialConsClick
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
      object Ed0DescFilial: TEdit
        Left = 82
        Top = 17
        Width = 233
        Height = 22
        TabStop = False
        ParentColor = True
        ReadOnly = True
        TabOrder = 2
        Text = 'Todos'
      end
      object Me0NatOperacao: TMaskEdit
        Left = 10
        Top = 69
        Width = 44
        Height = 22
        EditMask = '####'
        MaxLength = 4
        TabOrder = 3
        Text = '    '
      end
      object GroupBox1: TGroupBox
        Left = 9
        Top = 97
        Width = 190
        Height = 70
        Caption = 'Entrada'
        TabOrder = 4
        object Label8: TLabel
          Left = 9
          Top = 17
          Width = 13
          Height = 14
          Caption = 'De'
        end
        object Label9: TLabel
          Left = 95
          Top = 17
          Width = 17
          Height = 14
          Caption = 'At'#233
        end
        object Me0DtInicial: TMaskEdit
          Left = 9
          Top = 34
          Width = 78
          Height = 22
          EditMask = '!99/99/00##;1;_'
          MaxLength = 10
          TabOrder = 0
          Text = '  /  /    '
        end
        object Me0DtFinal: TMaskEdit
          Left = 95
          Top = 34
          Width = 78
          Height = 22
          EditMask = '!99/99/00##;1;_'
          MaxLength = 10
          TabOrder = 1
          Text = '  /  /    '
        end
      end
      object RGTipo: TRadioGroup
        Left = 215
        Top = 97
        Width = 102
        Height = 70
        Caption = 'Tipo do Relat'#243'rio'
        ItemIndex = 0
        Items.Strings = (
          'Sint'#233'tico'
          'Anal'#237'tico')
        TabOrder = 5
      end
    end
  end
end
