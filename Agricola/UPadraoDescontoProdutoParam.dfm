inherited FPadraoDescontoProdutoParam: TFPadraoDescontoProdutoParam
  Left = 384
  Top = 187
  Caption = 'Par'#226'metros'
  PixelsPerInch = 96
  TextHeight = 14
  inherited PGRelatorio: TPageControl
    ActivePage = TabSheet1
    object TabSheet1: TTabSheet
      Caption = 'Padrao Desconto Produto'
      object Label1: TLabel
        Left = 6
        Top = 8
        Width = 56
        Height = 14
        Caption = 'C'#243'd Padr'#227'o'
      end
      object Label2: TLabel
        Left = 6
        Top = 47
        Width = 59
        Height = 14
        Caption = 'C'#243'd Produto'
      end
      object ME1PadraoProduto: TMaskEdit
        Left = 6
        Top = 24
        Width = 65
        Height = 22
        TabOrder = 0
        OnExit = ME1PadraoProdutoExit
      end
      object Bt1PadraoProduto: TBitBtn
        Left = 73
        Top = 24
        Width = 25
        Height = 23
        TabOrder = 1
        TabStop = False
        OnClick = Bt1PadraoProdutoClick
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
      object Me1Produto: TMaskEdit
        Left = 6
        Top = 63
        Width = 65
        Height = 22
        TabOrder = 2
        OnExit = Me1ProdutoExit
      end
      object Bt1Produto: TBitBtn
        Left = 74
        Top = 63
        Width = 25
        Height = 23
        TabOrder = 3
        TabStop = False
        OnClick = Bt1ProdutoClick
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
      object Ed1PadraoProduto: TEdit
        Left = 100
        Top = 24
        Width = 205
        Height = 22
        Color = clBtnFace
        Enabled = False
        TabOrder = 4
        Text = 'Todos'
      end
      object Ed1Produto: TEdit
        Left = 101
        Top = 64
        Width = 205
        Height = 22
        Color = clBtnFace
        Enabled = False
        TabOrder = 5
        Text = 'Todos'
      end
    end
  end
end
