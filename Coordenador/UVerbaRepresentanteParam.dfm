inherited FVerbaRepresentanteParam: TFVerbaRepresentanteParam
  Left = 359
  Top = 281
  Caption = 'Par'#226'metros'
  PixelsPerInch = 96
  TextHeight = 14
  inherited PGRelatorio: TPageControl
    ActivePage = TabSheet1
    object TabSheet1: TTabSheet
      Caption = 'Verba Representante'
      object Label61: TLabel
        Left = 9
        Top = 10
        Width = 71
        Height = 14
        Caption = 'Representante'
      end
      object Label1: TLabel
        Left = 10
        Top = 57
        Width = 20
        Height = 14
        Caption = 'M'#234's'
      end
      object Label2: TLabel
        Left = 46
        Top = 56
        Width = 20
        Height = 14
        Caption = 'Ano'
      end
      object Me1Representante: TMaskEdit
        Left = 9
        Top = 27
        Width = 44
        Height = 22
        EditMask = '######'
        MaxLength = 6
        TabOrder = 0
        Text = '      '
        OnExit = Me1RepresentanteExit
      end
      object Bt1Representante: TBitBtn
        Left = 55
        Top = 27
        Width = 25
        Height = 24
        TabOrder = 3
        TabStop = False
        OnClick = Bt1RepresentanteClick
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
      object Ed1DescRepresentante: TEdit
        Left = 81
        Top = 27
        Width = 234
        Height = 22
        TabStop = False
        ParentColor = True
        ReadOnly = True
        TabOrder = 4
        Text = 'Todas'
      end
      object Me1Mes: TMaskEdit
        Left = 10
        Top = 75
        Width = 24
        Height = 22
        EditMask = '##'
        MaxLength = 2
        TabOrder = 1
        Text = '  '
      end
      object Me1Ano: TMaskEdit
        Left = 45
        Top = 75
        Width = 46
        Height = 22
        EditMask = '####'
        MaxLength = 4
        TabOrder = 2
        Text = '    '
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Verba Vendedor'
      ImageIndex = 1
      object Label3: TLabel
        Left = 10
        Top = 56
        Width = 20
        Height = 14
        Caption = 'M'#234's'
      end
      object Label4: TLabel
        Left = 46
        Top = 56
        Width = 20
        Height = 14
        Caption = 'Ano'
      end
      object Label5: TLabel
        Left = 9
        Top = 10
        Width = 71
        Height = 14
        Caption = 'Representante'
      end
      object Me2Mes: TMaskEdit
        Left = 10
        Top = 74
        Width = 23
        Height = 22
        EditMask = '##'
        MaxLength = 2
        TabOrder = 1
        Text = '  '
      end
      object Me2Ano: TMaskEdit
        Left = 45
        Top = 74
        Width = 46
        Height = 22
        EditMask = '####'
        MaxLength = 4
        TabOrder = 2
        Text = '    '
      end
      object Me2Representante: TMaskEdit
        Left = 9
        Top = 27
        Width = 44
        Height = 22
        EditMask = '######'
        MaxLength = 6
        TabOrder = 0
        Text = '      '
        OnExit = Me2RepresentanteExit
      end
      object Bt2Representante: TBitBtn
        Left = 55
        Top = 27
        Width = 25
        Height = 24
        TabOrder = 3
        TabStop = False
        OnClick = Bt2RepresentanteClick
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
      object Ed2DescRepresentante: TEdit
        Left = 81
        Top = 27
        Width = 234
        Height = 22
        TabStop = False
        ParentColor = True
        ReadOnly = True
        TabOrder = 4
        Text = 'Todas'
      end
    end
  end
end
