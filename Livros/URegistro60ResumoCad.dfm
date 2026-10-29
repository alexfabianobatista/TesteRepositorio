inherited FRegistro60ResumoCad: TFRegistro60ResumoCad
  Left = 311
  Top = 148
  Caption = 'Arquivo Magn'#233'tico - Tipo 60 Resumo'
  ClientHeight = 308
  ClientWidth = 520
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel [0]
    Left = 56
    Top = 72
    Width = 33
    Height = 14
    Caption = 'C'#243'digo'
    FocusControl = DBEdit1
  end
  object Label2: TLabel [1]
    Left = 56
    Top = 112
    Width = 20
    Height = 14
    Caption = 'M'#234's'
    FocusControl = DBEdit2
  end
  object Label3: TLabel [2]
    Left = 112
    Top = 112
    Width = 20
    Height = 14
    Caption = 'Ano'
    FocusControl = DBEdit3
  end
  object Label5: TLabel [3]
    Left = 56
    Top = 192
    Width = 55
    Height = 14
    Caption = 'Quantidade'
    FocusControl = DBEdit5
  end
  object Label6: TLabel [4]
    Left = 160
    Top = 192
    Width = 25
    Height = 14
    Caption = 'Valor'
    FocusControl = DBEdit6
  end
  object Label7: TLabel [5]
    Left = 264
    Top = 192
    Width = 78
    Height = 14
    Caption = 'Base de C'#225'lculo'
    FocusControl = DBEdit7
  end
  object Label9: TLabel [6]
    Left = 368
    Top = 192
    Width = 39
    Height = 14
    Caption = 'Al'#237'quota'
    FocusControl = DBEdit9
  end
  object Label47: TLabel [7]
    Left = 56
    Top = 152
    Width = 59
    Height = 14
    Caption = 'Cod.Produto'
    FocusControl = DBEdit54
  end
  inherited Panel1: TPanel
    Width = 520
  end
  inherited StBLongHint: TStatusBar
    Top = 289
    Width = 520
  end
  object DBEdit1: TDBEdit [10]
    Left = 56
    Top = 88
    Width = 97
    Height = 22
    Color = clBtnFace
    DataField = 'COD_REGISTRO_RESUMO'
    DataSource = DSPrimario
    ReadOnly = True
    TabOrder = 2
  end
  object DBEdit2: TDBEdit [11]
    Left = 56
    Top = 128
    Width = 49
    Height = 22
    DataField = 'NUM_MES'
    DataSource = DSPrimario
    TabOrder = 3
  end
  object DBEdit3: TDBEdit [12]
    Left = 112
    Top = 128
    Width = 49
    Height = 22
    DataField = 'NUM_ANO'
    DataSource = DSPrimario
    TabOrder = 4
  end
  object DBEdit5: TDBEdit [13]
    Left = 56
    Top = 208
    Width = 97
    Height = 22
    DataField = 'QT_QUANTIDADE'
    DataSource = DSPrimario
    TabOrder = 7
  end
  object DBEdit6: TDBEdit [14]
    Left = 160
    Top = 208
    Width = 97
    Height = 22
    DataField = 'VAL_PRODUTO'
    DataSource = DSPrimario
    TabOrder = 8
  end
  object DBEdit7: TDBEdit [15]
    Left = 264
    Top = 208
    Width = 97
    Height = 22
    DataField = 'VAL_BASE_ICMS'
    DataSource = DSPrimario
    TabOrder = 9
  end
  object DBEdit9: TDBEdit [16]
    Left = 368
    Top = 208
    Width = 97
    Height = 22
    DataField = 'PERC_ALIQUOTA'
    DataSource = DSPrimario
    TabOrder = 10
  end
  object DBEdit54: TDBEdit [17]
    Left = 56
    Top = 168
    Width = 61
    Height = 22
    DataField = 'COD_PRODUTO'
    DataSource = DSPrimario
    TabOrder = 5
  end
  object BtConsProduto: TBitBtn [18]
    Left = 118
    Top = 167
    Width = 25
    Height = 24
    TabOrder = 6
    TabStop = False
    OnClick = BtConsProdutoClick
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
  object DBDirceu1: TDBDirceu [19]
    Left = 144
    Top = 168
    Width = 321
    Height = 22
    DataField = 'COD_PRODUTO'
    DataSource = DSPrimario
    ParentColor = True
    ReadOnly = True
    TabOrder = 11
    TabStop = False
    diTabela = 'TB_PRODUTO'
    diCampo = 'DESC_PRODUTO'
    diChave = 'COD_PRODUTO'
    diCache = False
  end
  inherited MMCadSimples: TMainMenu
    Left = 376
    object Opes1: TMenuItem
      Caption = 'Op'#231#245'es'
      object ImportardasNotas1: TMenuItem
        Caption = 'Importar Notas'
        OnClick = ImportardasNotas1Click
      end
      object Rateiodevalores1: TMenuItem
        Caption = 'Rateio de valores'
        OnClick = Rateiodevalores1Click
      end
    end
  end
  inherited DSPrimario: TDataSource
    DataSet = DMLivroFiscal.QTipo60Resumo
    Left = 400
  end
  inherited ILBotao: TImageList
    Left = 432
  end
  inherited ALCadastro: TActionList
    Left = 472
  end
end
