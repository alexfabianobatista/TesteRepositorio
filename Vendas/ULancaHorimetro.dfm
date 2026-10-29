object FLancaHorimetro: TFLancaHorimetro
  Left = 484
  Top = 184
  Width = 602
  Height = 327
  Caption = 'Lan'#231'a Receita por Hor'#237'metro'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 26
    Width = 37
    Height = 13
    Caption = 'Ve'#237'culo'
  end
  object Label2: TLabel
    Left = 24
    Top = 72
    Width = 37
    Height = 13
    Caption = 'Produto'
  end
  object Label3: TLabel
    Left = 97
    Top = 117
    Width = 51
    Height = 13
    Caption = 'Hora Inicio'
  end
  object Label4: TLabel
    Left = 171
    Top = 117
    Width = 42
    Height = 13
    Caption = 'Hora Fim'
  end
  object Label8: TLabel
    Left = 249
    Top = 117
    Width = 55
    Height = 13
    Caption = 'Quantidade'
  end
  object SBVeiculo: TSpeedButton
    Left = 87
    Top = 44
    Width = 23
    Height = 21
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
    OnClick = SBVeiculoClick
  end
  object Label5: TLabel
    Left = 24
    Top = 117
    Width = 50
    Height = 13
    Caption = 'Hora Atual'
  end
  object Label6: TLabel
    Left = 438
    Top = 28
    Width = 16
    Height = 13
    Caption = 'KM'
  end
  object Label7: TLabel
    Left = 321
    Top = 117
    Width = 61
    Height = 13
    Caption = 'Valor unit'#225'rio'
  end
  object BtAvancar: TButton
    Left = 240
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Avan'#231'ar'
    TabOrder = 0
    OnClick = BtAvancarClick
  end
  object MEPlaca: TMaskEdit
    Left = 116
    Top = 44
    Width = 65
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 1
  end
  object MEDescVeiculo: TMaskEdit
    Left = 183
    Top = 44
    Width = 250
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 2
  end
  object MEKm: TMaskEdit
    Left = 437
    Top = 44
    Width = 65
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 3
  end
  object MEDescProduto: TMaskEdit
    Left = 97
    Top = 88
    Width = 422
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 4
  end
  object MEHoraAtual: TMaskEdit
    Left = 25
    Top = 132
    Width = 65
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 5
  end
  object DBEVeiculo: TDBEdit
    Left = 24
    Top = 44
    Width = 57
    Height = 21
    DataField = 'COD_VEICULO'
    DataSource = DSLancaHorimetro
    TabOrder = 6
    OnExit = DBEVeiculoExit
  end
  object DBEdit1: TDBEdit
    Left = 96
    Top = 132
    Width = 67
    Height = 21
    DataField = 'NUM_HORA_INICIO'
    DataSource = DSLancaHorimetro
    TabOrder = 7
  end
  object DBEdit2: TDBEdit
    Left = 168
    Top = 132
    Width = 73
    Height = 21
    DataField = 'NUM_HORA_FIM'
    DataSource = DSLancaHorimetro
    TabOrder = 8
    OnExit = DBEdit2Exit
  end
  object DBEdit3: TDBEdit
    Left = 248
    Top = 132
    Width = 65
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'QT_QUANTIDADE'
    DataSource = DSLancaHorimetro
    ReadOnly = True
    TabOrder = 9
  end
  object DBEProduto: TDBEdit
    Left = 24
    Top = 88
    Width = 66
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'COD_PRODUTO'
    DataSource = DSLancaHorimetro
    ReadOnly = True
    TabOrder = 10
  end
  object DBEdit4: TDBEdit
    Left = 320
    Top = 132
    Width = 67
    Height = 21
    DataField = 'VL_UNITARIO'
    DataSource = DSLancaHorimetro
    TabOrder = 11
  end
  object DSLancaHorimetro: TDataSource
    DataSet = DMDespesaRecup.QLancaHorimetro
    Left = 24
    Top = 264
  end
end
