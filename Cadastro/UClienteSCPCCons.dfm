inherited FClienteSCPCCons: TFClienteSCPCCons
  Left = 304
  Top = 123
  Width = 473
  Height = 424
  Caption = 'FClienteSCPCCons'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Left = 7
    Caption = 'Cliente'
  end
  object Label2: TLabel [1]
    Left = 7
    Top = 48
    Width = 50
    Height = 14
    Caption = 'CGC / CPF'
  end
  object SBCliente: TSpeedButton [2]
    Left = 135
    Top = 24
    Width = 27
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
    OnClick = SBClienteClick
  end
  object Autorizado: TLabel [3]
    Left = 185
    Top = 8
    Width = 53
    Height = 14
    Caption = 'Autorizado'
  end
  object Label4: TLabel [4]
    Left = 185
    Top = 48
    Width = 75
    Height = 14
    Caption = 'CPF Autorizado'
  end
  inherited BtOk: TBitBtn
    Left = 144
    Top = 362
    TabOrder = 7
  end
  inherited BtCancela: TBitBtn
    Left = 240
    Top = 362
    TabOrder = 8
  end
  inherited BtProcurar: TBitBtn
    Left = 376
    TabOrder = 5
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Left = 7
    Width = 127
    Text = ''
  end
  inherited DBGrid1: TDBGrid
    Left = 7
    Top = 167
    Width = 450
    Height = 188
    TabOrder = 6
    Columns = <
      item
        Expanded = False
        FieldName = 'DESC_CONTRATO'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Width = 199
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_VALOR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_VENCIMENTO'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_EMISSAO'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ind_baixado'
        Visible = True
      end>
  end
  object MeCPF: TMaskEdit [10]
    Left = 7
    Top = 64
    Width = 154
    Height = 22
    TabOrder = 1
  end
  object GroupBox1: TGroupBox [11]
    Left = 7
    Top = 90
    Width = 197
    Height = 69
    Caption = 'Data Registro'
    TabOrder = 4
    object Label3: TLabel
      Left = 89
      Top = 32
      Width = 17
      Height = 14
      Caption = 'At'#233
    end
    object MeData_I: TMaskEdit
      Left = 4
      Top = 27
      Width = 80
      Height = 22
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 0
      Text = '  /  /    '
    end
    object MeData_F: TMaskEdit
      Left = 112
      Top = 27
      Width = 80
      Height = 22
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
    end
  end
  object MeAutorizado: TMaskEdit [12]
    Left = 185
    Top = 24
    Width = 127
    Height = 22
    TabOrder = 2
  end
  object MeCPFAutorizado: TMaskEdit [13]
    Left = 185
    Top = 64
    Width = 127
    Height = 22
    TabOrder = 3
  end
  inherited DSConsulta: TDataSource
    DataSet = DMCadastro.QClienteSCPCCons
    Left = 416
    Top = 56
  end
end
