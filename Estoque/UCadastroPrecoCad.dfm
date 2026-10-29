inherited FCadastroPrecoCad: TFCadastroPrecoCad
  Left = 558
  Top = 233
  Caption = 'Cadastro de Pre'#231'o de Produtos por Cadastro'
  ClientHeight = 252
  ClientWidth = 486
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel [0]
    Left = 16
    Top = 56
    Width = 33
    Height = 14
    Caption = 'C'#243'digo'
    FocusControl = DBEdit1
  end
  object Label4: TLabel [1]
    Left = 16
    Top = 176
    Width = 28
    Height = 14
    Caption = 'Pre'#231'o'
    FocusControl = DBEdit4
  end
  object Label18: TLabel [2]
    Left = 16
    Top = 96
    Width = 44
    Height = 14
    Caption = 'Cadastro'
    FocusControl = DBEdit18
  end
  object BtnFabricante: TSpeedButton [3]
    Left = 79
    Top = 112
    Width = 27
    Height = 23
    Enabled = False
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
    OnClick = BtnFabricanteClick
  end
  object Label2: TLabel [4]
    Left = 16
    Top = 136
    Width = 37
    Height = 14
    Caption = 'Produto'
    FocusControl = DBEdit2
  end
  object BtnProduto: TSpeedButton [5]
    Left = 79
    Top = 152
    Width = 27
    Height = 23
    Enabled = False
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
    OnClick = BtnProdutoClick
  end
  inherited Panel1: TPanel
    Width = 486
  end
  inherited StBLongHint: TStatusBar
    Top = 233
    Width = 486
  end
  object DBEdit1: TDBEdit [8]
    Left = 16
    Top = 72
    Width = 105
    Height = 22
    Color = clBtnFace
    DataField = 'COD_CADASTRO_PRECO'
    DataSource = DSPrimario
    ReadOnly = True
    TabOrder = 2
  end
  object DBEdit4: TDBEdit [9]
    Left = 16
    Top = 192
    Width = 121
    Height = 22
    DataField = 'VAL_PRECO'
    DataSource = DSPrimario
    TabOrder = 3
  end
  object DBEdit18: TDBEdit [10]
    Left = 16
    Top = 112
    Width = 61
    Height = 22
    DataField = 'COD_CADASTRO'
    DataSource = DSPrimario
    TabOrder = 4
  end
  object DBDirceu2: TDBDirceu [11]
    Left = 108
    Top = 112
    Width = 233
    Height = 22
    DataField = 'COD_CADASTRO'
    DataSource = DSPrimario
    ParentColor = True
    ReadOnly = True
    TabOrder = 5
    TabStop = False
    diTabela = 'TB_CADASTRO'
    diCampo = 'NOME'
    diChave = 'COD_CADASTRO'
    diCache = False
  end
  object DBEdit2: TDBEdit [12]
    Left = 16
    Top = 152
    Width = 61
    Height = 22
    DataField = 'COD_PRODUTO'
    DataSource = DSPrimario
    TabOrder = 6
  end
  object DBDirceu1: TDBDirceu [13]
    Left = 108
    Top = 152
    Width = 233
    Height = 22
    DataField = 'COD_PRODUTO'
    DataSource = DSPrimario
    ParentColor = True
    ReadOnly = True
    TabOrder = 7
    TabStop = False
    diTabela = 'TB_PRODUTO'
    diCampo = 'DESC_PRODUTO'
    diChave = 'COD_PRODUTO'
    diCache = False
  end
  inherited MMCadSimples: TMainMenu
    Left = 448
  end
  inherited DSPrimario: TDataSource
    DataSet = DMProduto.QCadastroPreco
    Left = 384
    Top = 48
  end
  inherited ILBotao: TImageList
    Left = 384
  end
  inherited ALCadastro: TActionList
    Left = 416
  end
end
