inherited FVerbaVendedorCons: TFVerbaVendedorCons
  Left = 293
  Top = 235
  Height = 351
  Caption = 'FVerbaVendedorCons'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Width = 84
    Caption = 'C'#243'digo Vendedor'
  end
  object Label2: TLabel [1]
    Left = 10
    Top = 52
    Width = 20
    Height = 14
    Caption = 'Ano'
  end
  object Label3: TLabel [2]
    Left = 50
    Top = 52
    Width = 20
    Height = 14
    Caption = 'M'#234's'
  end
  inherited BtOk: TBitBtn
    Left = 72
    Top = 290
    TabOrder = 5
  end
  inherited BtCancela: TBitBtn
    Top = 290
    TabOrder = 6
  end
  inherited BtProcurar: TBitBtn
    Left = 273
    Top = 22
    TabOrder = 3
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Top = 23
    Width = 49
    EditMask = '######'
    MaxLength = 6
    Text = '      '
    OnExit = METextoExit
  end
  inherited DBGrid1: TDBGrid
    Top = 106
    TabOrder = 4
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_SUPERVISOR'
        Title.Caption = 'Supervisor'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_VENDEDOR'
        Title.Caption = 'Vendedor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_ANO'
        Title.Caption = 'Ano'
        Width = 31
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_MES'
        Title.Caption = 'M'#234's'
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_VERBA'
        Title.Caption = 'Verba'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome'
        Width = 75
        Visible = True
      end>
  end
  object EdDescRepresentante: TEdit [8]
    Left = 88
    Top = 23
    Width = 165
    Height = 22
    TabStop = False
    ParentColor = True
    ReadOnly = True
    TabOrder = 7
    Text = 'Todos'
  end
  object BtRepresentante: TBitBtn [9]
    Left = 60
    Top = 23
    Width = 25
    Height = 24
    TabOrder = 8
    TabStop = False
    OnClick = BtRepresentanteClick
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
  object MeAno: TMaskEdit [10]
    Left = 8
    Top = 69
    Width = 32
    Height = 22
    EditMask = '####'
    MaxLength = 4
    TabOrder = 1
    Text = '    '
  end
  object MeMes: TMaskEdit [11]
    Left = 48
    Top = 69
    Width = 25
    Height = 22
    EditMask = '##'
    MaxLength = 2
    TabOrder = 2
    Text = '  '
  end
  inherited DSConsulta: TDataSource
    DataSet = DMVerbaRepresentante.QVerbaVendedorCons
    Left = 240
    Top = 64
  end
end
