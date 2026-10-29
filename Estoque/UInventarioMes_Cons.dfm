inherited FInventarioMes_Cons: TFInventarioMes_Cons
  Left = 378
  Top = 159
  Width = 677
  Height = 412
  Caption = 'Consulta Invent'#225'rio M'#234's'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Top = 9
    Width = 37
    Caption = 'Produto'
  end
  object Label8: TLabel [1]
    Left = 102
    Top = 9
    Width = 21
    Height = 14
    Caption = 'Lote'
  end
  object SpeedButton8: TSpeedButton [2]
    Left = 140
    Top = 24
    Width = 25
    Height = 23
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
    OnClick = SpeedButton8Click
  end
  object SpeedButton7: TSpeedButton [3]
    Left = 66
    Top = 23
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
    OnClick = SpeedButton7Click
  end
  object Label6: TLabel [4]
    Left = 177
    Top = 9
    Width = 23
    Height = 14
    Caption = 'Filial '
  end
  object SpeedButton6: TSpeedButton [5]
    Left = 215
    Top = 24
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
    OnClick = SpeedButton6Click
  end
  object Label2: TLabel [6]
    Left = 248
    Top = 9
    Width = 20
    Height = 14
    Caption = 'Ano'
  end
  object Label3: TLabel [7]
    Left = 312
    Top = 9
    Width = 20
    Height = 14
    Caption = 'M'#234's'
  end
  inherited BtOk: TBitBtn
    Left = 200
    Top = 352
    TabOrder = 7
  end
  inherited BtCancela: TBitBtn
    Left = 360
    Top = 352
    TabOrder = 8
  end
  inherited BtProcurar: TBitBtn
    Left = 544
    Top = 16
    TabOrder = 5
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Width = 57
    Text = ''
  end
  object MECodLote: TMaskEdit [13]
    Left = 99
    Top = 24
    Width = 40
    Height = 22
    TabOrder = 1
  end
  object MECodFilial: TMaskEdit [14]
    Left = 174
    Top = 24
    Width = 40
    Height = 22
    TabOrder = 2
  end
  object MeAno: TMaskEdit [15]
    Left = 248
    Top = 24
    Width = 46
    Height = 22
    TabOrder = 3
  end
  object MeMes: TMaskEdit [16]
    Left = 312
    Top = 24
    Width = 40
    Height = 22
    TabOrder = 4
  end
  inherited DBGrid1: TDBGrid
    Width = 649
    Height = 289
    TabOrder = 6
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_FILIAL'
        Title.Caption = 'Filial'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_PRODUTO'
        Title.Caption = 'Produto'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_PRODUTO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 199
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_LOTE_TIPO'
        Title.Caption = 'Lote'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_ANO'
        Title.Caption = 'Ano'
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_MES'
        Title.Caption = 'Mes'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QT_QUANTIDADE'
        Title.Caption = 'Quantidade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_CUSTO_MEDIO'
        Title.Caption = 'Custo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_TIPO_PRODUTO'
        Title.Caption = 'Tipo Produto'
        Visible = True
      end>
  end
  inherited DSConsulta: TDataSource
    AutoEdit = False
    DataSet = DMInventarioMes.QInventarioMes_Cons
    Left = 568
    Top = 352
  end
  inherited PopupMenu1: TPopupMenu
    Left = 368
  end
end
