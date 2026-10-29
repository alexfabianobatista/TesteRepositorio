inherited FPadraoDescontoProdutoCons: TFPadraoDescontoProdutoCons
  Left = 273
  Top = 173
  Width = 573
  Height = 470
  Caption = 'Consulta Padr'#227'o Desconto Produto'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Width = 56
    Caption = 'C'#243'd Padr'#227'o'
  end
  object Label2: TLabel [1]
    Left = 8
    Top = 47
    Width = 59
    Height = 14
    Caption = 'C'#243'd Produto'
  end
  inherited BtOk: TBitBtn
    Left = 176
    Top = 408
  end
  inherited BtCancela: TBitBtn
    Left = 336
    Top = 408
  end
  inherited BtProcurar: TBitBtn
    Left = 456
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Width = 65
    Text = ''
  end
  inherited DBGrid1: TDBGrid
    Top = 93
    Width = 548
    Height = 305
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_PADRAO_DESCONTO_PRODUTO'
        Title.Caption = 'C'#243'digo'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_PADRAO_PRODUTO'
        Title.Caption = 'Padr'#227'o'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_PADRAO_PRODUTO'
        Title.Caption = 'Desc. Padr'#227'o'
        Width = 194
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_PRODUTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_PRODUTO'
        Width = 263
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_UMIDADE_TOLERANCIA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_UMIDADE_DESCONTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_IMPUREZA_TOLERANCIA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_IMPUREZA_DESCONTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_AVARIADO_TOLERANCIA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_AVARIADO_DESCONTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_QUEBRADO_TOLERANCIA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_QUEBRADO_DESCONTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_ARDIDOS_TOLERANCIA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_ARDIDOS_DESCONTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_TRIGUILHO_TOLERANCIA'
        Title.Caption = 'Tol. Triguilho'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_TRIGUILHO_DESCONTO'
        Title.Caption = '%Triguilho'
        Visible = True
      end>
  end
  object BtPadraoProduto: TBitBtn [7]
    Left = 75
    Top = 24
    Width = 25
    Height = 23
    TabOrder = 5
    TabStop = False
    OnClick = BtPadraoProdutoClick
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
  object MeProduto: TMaskEdit [8]
    Left = 8
    Top = 63
    Width = 65
    Height = 22
    TabOrder = 6
  end
  object BtProduto: TBitBtn [9]
    Left = 75
    Top = 63
    Width = 25
    Height = 23
    TabOrder = 7
    TabStop = False
    OnClick = BtProdutoClick
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
  inherited DSConsulta: TDataSource
    DataSet = DMPadraoProduto.QPadraoDescProdCons
    Left = 480
    Top = 56
  end
end
