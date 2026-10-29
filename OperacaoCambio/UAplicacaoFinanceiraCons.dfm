inherited FAplicacaoFinanceiraCons: TFAplicacaoFinanceiraCons
  Left = 140
  Top = 197
  Width = 837
  Height = 445
  Caption = 'Consulta de Aplica'#231#245'es Financeiras'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Left = 13
    Top = 6
    Width = 73
    Caption = 'Conta Corrente'
  end
  object SBDepartamentoCons: TSpeedButton [1]
    Left = 330
    Top = 21
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
    OnClick = SBDepartamentoConsClick
  end
  object Label2: TLabel [2]
    Left = 278
    Top = 6
    Width = 67
    Height = 14
    Caption = 'Departamento'
  end
  object SBContaCorrenteCons: TSpeedButton [3]
    Left = 65
    Top = 21
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
    OnClick = SBContaCorrenteConsClick
  end
  object SBHistoricoCons: TSpeedButton [4]
    Left = 66
    Top = 69
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
    OnClick = SBHistoricoConsClick
  end
  object Label9: TLabel [5]
    Left = 14
    Top = 54
    Width = 42
    Height = 14
    Caption = 'Hist'#243'rico'
  end
  inherited BtOk: TBitBtn
    Left = 232
    Top = 376
  end
  inherited BtCancela: TBitBtn
    Left = 392
    Top = 376
  end
  inherited BtProcurar: TBitBtn
    Left = 736
    Top = 8
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Left = 129
    Top = 22
    Width = 49
  end
  inherited DBGrid1: TDBGrid
    Top = 120
    Width = 809
    Height = 244
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_APLICACAO_FINANCEIRA'
        Title.Caption = 'C'#243'digo'
        Width = 42
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'NUM_TITULO'
        Title.Caption = 'T'#237'tulo'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_BANCO_AGENCIA'
        Title.Caption = 'Banco'
        Width = 148
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_CONTA_CORRENTE'
        Title.Caption = 'Num. C/C'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_CONTA_CORRENTE'
        Title.Caption = 'Conta Corrente'
        Width = 156
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_APLICACAO'
        Title.Caption = 'Data'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_ORIGINAL'
        Title.Caption = 'Valor Original'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_APLICADO'
        Title.Caption = 'Valor Aplicado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_TAXA'
        Title.Caption = 'Taxa'
        Visible = True
      end>
  end
  object MEDepartamentoCons: TMaskEdit [11]
    Left = 278
    Top = 21
    Width = 49
    Height = 22
    TabOrder = 5
    OnExit = MEDepartamentoConsExit
  end
  object EdDepartamentoCons: TEdit [12]
    Left = 354
    Top = 21
    Width = 180
    Height = 22
    TabOrder = 6
    Text = 'Todos'
  end
  object GroupBox1: TGroupBox [13]
    Left = 539
    Top = 2
    Width = 158
    Height = 51
    Caption = 'Data Aplica'#231#227'o'
    TabOrder = 7
    object Label3: TLabel
      Left = 10
      Top = 11
      Width = 26
      Height = 14
      Caption = 'Inicial'
    end
    object Label4: TLabel
      Left = 83
      Top = 11
      Width = 22
      Height = 14
      Caption = 'Final'
    end
    object MEDt_Aplicacao_I: TMaskEdit
      Left = 10
      Top = 24
      Width = 65
      Height = 22
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 0
      Text = '  /  /    '
    end
    object MeDt_Aplicacao_F: TMaskEdit
      Left = 83
      Top = 24
      Width = 64
      Height = 22
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
    end
  end
  object GroupBox2: TGroupBox [14]
    Left = 538
    Top = 53
    Width = 160
    Height = 53
    Caption = 'Data Vencimento'
    TabOrder = 8
    object Label5: TLabel
      Left = 10
      Top = 11
      Width = 26
      Height = 14
      Caption = 'Inicial'
    end
    object Label6: TLabel
      Left = 83
      Top = 11
      Width = 22
      Height = 14
      Caption = 'Final'
    end
    object MEDt_Vencimento_I: TMaskEdit
      Left = 10
      Top = 27
      Width = 63
      Height = 22
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 0
      Text = '  /  /    '
    end
    object MEDt_Vencimento_F: TMaskEdit
      Left = 83
      Top = 27
      Width = 63
      Height = 22
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
    end
  end
  object MEContaCorrenteCons: TMaskEdit [15]
    Left = 13
    Top = 21
    Width = 49
    Height = 22
    TabOrder = 9
    OnExit = MEContaCorrenteConsExit
  end
  object EdContaCorrenteCons: TEdit [16]
    Left = 89
    Top = 21
    Width = 180
    Height = 22
    TabOrder = 10
    Text = 'Todas'
  end
  object MEHistoricoCons: TMaskEdit [17]
    Left = 14
    Top = 69
    Width = 49
    Height = 22
    TabOrder = 11
    OnExit = MEHistoricoConsExit
  end
  object EdHistoricoCons: TEdit [18]
    Left = 90
    Top = 69
    Width = 180
    Height = 22
    TabOrder = 12
    Text = 'Todos'
  end
  inherited DSConsulta: TDataSource
    DataSet = DMAplicacaoFinanceira.QAplicacaoFinanceiraCons
    Left = 784
    Top = 40
  end
end
