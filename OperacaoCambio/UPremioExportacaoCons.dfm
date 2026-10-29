inherited FPremioExportacaoCons: TFPremioExportacaoCons
  Left = 289
  Top = 176
  Width = 480
  Height = 409
  Caption = 'Consulta Pr'#234'mio Exporta'#231#227'o'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Left = 9
    Width = 56
    Caption = 'N'#186' Contrato'
  end
  object Label2: TLabel [1]
    Left = 101
    Top = 8
    Width = 31
    Height = 14
    Caption = 'Fatura'
  end
  object SbComprador: TSpeedButton [2]
    Left = 258
    Top = 24
    Width = 23
    Height = 22
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
    OnClick = SbCompradorClick
  end
  object Label3: TLabel [3]
    Left = 192
    Top = 8
    Width = 53
    Height = 14
    Caption = 'Comprador'
  end
  inherited BtOk: TBitBtn
    Left = 120
    Top = 346
    TabOrder = 6
  end
  inherited BtCancela: TBitBtn
    Left = 280
    Top = 346
    TabOrder = 7
  end
  inherited BtProcurar: TBitBtn
    Left = 381
    TabOrder = 4
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Width = 66
    Text = ''
  end
  inherited DBGrid1: TDBGrid
    Top = 120
    Width = 454
    Height = 209
    TabOrder = 5
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_PREMIO_EXPORTACAO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_CONTRATO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMPRADOR'
        Width = 199
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_CONTRATO'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_DOLAR'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_TAXA_DOLAR'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_REAL'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_NAVIO'
        Width = 154
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_FATURA'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_CONTA_CORRENTE'
        Width = 68
        Visible = True
      end>
  end
  object MeFatura: TMaskEdit [9]
    Left = 99
    Top = 24
    Width = 66
    Height = 22
    TabOrder = 1
  end
  object MeComprador: TMaskEdit [10]
    Left = 191
    Top = 24
    Width = 66
    Height = 22
    TabOrder = 2
  end
  object GroupBox1: TGroupBox [11]
    Left = 8
    Top = 54
    Width = 185
    Height = 53
    Caption = 'Emiss'#227'o'
    TabOrder = 3
    object Label4: TLabel
      Left = 82
      Top = 24
      Width = 17
      Height = 14
      Caption = 'At'#233
    end
    object MeData_I: TMaskEdit
      Left = 8
      Top = 19
      Width = 65
      Height = 22
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 0
      Text = '  /  /    '
    end
    object MEData_F: TMaskEdit
      Left = 108
      Top = 19
      Width = 65
      Height = 22
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
    end
  end
  inherited DSConsulta: TDataSource
    DataSet = DMPremioExportacao.QPremioExportacaoCons
    Left = 432
    Top = 56
  end
end
