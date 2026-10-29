inherited FControleTremCons: TFControleTremCons
  Left = 334
  Top = 85
  Width = 591
  Height = 520
  Caption = 'FControleTremCons'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Top = 48
    Width = 57
    Caption = 'Destinat'#225'rio'
  end
  object Label7: TLabel [1]
    Left = 9
    Top = 89
    Width = 37
    Height = 14
    Caption = 'Produto'
  end
  object Label2: TLabel [2]
    Left = 9
    Top = 129
    Width = 20
    Height = 14
    Caption = 'Filial'
  end
  object Label4: TLabel [3]
    Left = 8
    Top = 176
    Width = 42
    Height = 14
    Caption = 'Nr. Fluxo'
  end
  object SbBuscaCadastroOrigem: TSpeedButton [4]
    Left = 76
    Top = 23
    Width = 29
    Height = 23
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
    OnClick = SbBuscaCadastroOrigemClick
  end
  object lblOrigem: TLabel [5]
    Left = 9
    Top = 7
    Width = 34
    Height = 14
    Caption = 'Origem'
  end
  inherited BtOk: TBitBtn
    Left = 388
    Top = 429
    TabOrder = 14
  end
  inherited BtCancela: TBitBtn
    Left = 484
    Top = 429
    TabOrder = 15
  end
  inherited BtProcurar: TBitBtn
    Left = 492
    Top = 22
    TabOrder = 7
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Top = 64
    Width = 65
    TabOrder = 1
    Text = ''
    OnExit = METextoExit
  end
  inherited DBGrid1: TDBGrid
    Top = 224
    Width = 569
    Height = 193
    TabOrder = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_FLUXO_TREM'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_FLUXO'
        Width = 116
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_FILIAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_ACORDO'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_PRODUTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_TARIFA_TONELADA'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QT_QUANTIDADE'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_CADASTRO_DESTINATARIO'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_USUARIO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DT_USUARIO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'COD_MOTIVO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DESC_PRODUTO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'COD_CADASTRO_ORIGEM'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_OPERACAO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'COD_TRIBUTACAO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'IND_MODAL'
        Width = 41
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox [11]
    Left = 295
    Top = 16
    Width = 186
    Height = 57
    Caption = 'Dt. Acordo'
    TabOrder = 5
    object Label3: TLabel
      Left = 81
      Top = 25
      Width = 17
      Height = 14
      Caption = 'At'#233
    end
    object MeDTInicial: TMaskEdit
      Left = 6
      Top = 21
      Width = 64
      Height = 22
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 0
      Text = '  /  /    '
    end
    object MeDTFinal: TMaskEdit
      Left = 111
      Top = 21
      Width = 64
      Height = 22
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
    end
  end
  object BtDestinatario: TBitBtn [12]
    Left = 75
    Top = 63
    Width = 29
    Height = 23
    TabOrder = 8
    TabStop = False
    OnClick = BtDestinatarioClick
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
  object EdRemetente: TEdit [13]
    Left = 106
    Top = 63
    Width = 175
    Height = 22
    Color = clBtnFace
    Enabled = False
    TabOrder = 9
    Text = 'Todos'
  end
  object MeProduto: TMaskEdit [14]
    Left = 8
    Top = 104
    Width = 65
    Height = 22
    TabOrder = 2
    OnExit = MeProdutoExit
  end
  object BtProduto: TBitBtn [15]
    Left = 76
    Top = 104
    Width = 29
    Height = 23
    TabOrder = 10
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
  object EdProduto: TEdit [16]
    Left = 107
    Top = 104
    Width = 174
    Height = 22
    Color = clBtnFace
    Enabled = False
    TabOrder = 11
    Text = 'Todos'
  end
  object MeFilial: TMaskEdit [17]
    Left = 8
    Top = 144
    Width = 65
    Height = 22
    TabOrder = 3
    OnExit = MeFilialExit
  end
  object BtFilial: TBitBtn [18]
    Left = 76
    Top = 144
    Width = 29
    Height = 23
    TabOrder = 12
    TabStop = False
    OnClick = BtFilialClick
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
  object EdFilial: TEdit [19]
    Left = 107
    Top = 144
    Width = 174
    Height = 22
    Color = clBtnFace
    Enabled = False
    TabOrder = 13
    Text = 'Todos'
  end
  object MeFluxo: TMaskEdit [20]
    Left = 8
    Top = 192
    Width = 145
    Height = 22
    TabOrder = 4
  end
  object MeCadastroOrigem: TMaskEdit [21]
    Left = 8
    Top = 23
    Width = 65
    Height = 22
    TabOrder = 0
    OnExit = MeCadastroOrigemExit
  end
  object EdOrigem: TEdit [22]
    Left = 107
    Top = 23
    Width = 174
    Height = 22
    Color = clBtnFace
    Enabled = False
    TabOrder = 16
    Text = 'Todos'
  end
  object RgModal: TRadioGroup [23]
    Left = 295
    Top = 80
    Width = 187
    Height = 87
    Caption = 'Modal'
    ItemIndex = 2
    Items.Strings = (
      'Ferrovi'#225'rio'
      'Rodovi'#225'rio/Ferrovi'#225'rio'
      'Todos')
    TabOrder = 6
  end
  object StatusBar1: TStatusBar [24]
    Left = 0
    Top = 463
    Width = 575
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  inherited DSConsulta: TDataSource
    DataSet = DMControleTrem.QControleTremCons
    Left = 8
    Top = 424
  end
  object ActionList1: TActionList
    Left = 48
    Top = 424
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 49222
      OnExecute = Action1Execute
    end
  end
end
