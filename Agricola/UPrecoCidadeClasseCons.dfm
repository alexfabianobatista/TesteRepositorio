inherited FPrecoCidadeClasseCons: TFPrecoCidadeClasseCons
  Left = 301
  Top = 194
  Width = 370
  Caption = 'Consulta Pre'#231'o P/ Cidade'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Top = 9
    Width = 33
    Caption = 'Cidade'
  end
  object SbClasseCons: TSpeedButton [1]
    Left = 121
    Top = 24
    Width = 23
    Height = 22
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
    OnClick = SbClasseConsClick
  end
  object SbCidadeCons: TSpeedButton [2]
    Left = 48
    Top = 24
    Width = 23
    Height = 22
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
    OnClick = SbCidadeConsClick
  end
  object Label2: TLabel [3]
    Left = 82
    Top = 9
    Width = 33
    Height = 14
    Caption = 'Classe'
  end
  object Label3: TLabel [4]
    Left = 155
    Top = 9
    Width = 66
    Height = 14
    Caption = 'Dt.Refer'#234'ncia'
  end
  inherited BtOk: TBitBtn
    Top = 243
    TabOrder = 4
  end
  inherited BtCancela: TBitBtn
    Top = 243
    TabOrder = 5
  end
  inherited BtProcurar: TBitBtn
    TabOrder = 3
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Width = 41
    Text = ''
  end
  inherited DBGrid1: TDBGrid
    Top = 64
    TabOrder = 6
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_PRECO_CIDADE_CLASSE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_REFERENCIA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_PRECO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_CIDADE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_CLASSE'
        Visible = True
      end>
  end
  object MeClasse: TMaskEdit [10]
    Left = 80
    Top = 24
    Width = 41
    Height = 22
    TabOrder = 1
  end
  object MeData: TMaskEdit [11]
    Left = 152
    Top = 24
    Width = 78
    Height = 22
    EditMask = '!99/99/##00;1;_'
    MaxLength = 10
    TabOrder = 2
    Text = '  /  /    '
  end
  inherited DSConsulta: TDataSource
    DataSet = DMPrecoCidadeClasse.QPrecoCidadeClasseCons
    Left = 296
    Top = 240
  end
end
