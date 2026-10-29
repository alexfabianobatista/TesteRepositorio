inherited FLancamentoCad: TFLancamentoCad
  Left = 280
  Top = 181
  Caption = 'Cadastro de Lan'#231'amentos para Repasse'
  ClientHeight = 281
  ClientWidth = 510
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object Bevel1: TBevel [0]
    Left = 8
    Top = 48
    Width = 497
    Height = 209
  end
  object Label1: TLabel [1]
    Left = 24
    Top = 64
    Width = 33
    Height = 14
    Caption = 'C'#243'digo'
    FocusControl = DBEdit1
  end
  object Label2: TLabel [2]
    Left = 24
    Top = 112
    Width = 34
    Height = 14
    Caption = 'M'#233'dico'
    FocusControl = DBEdit2
  end
  object Label3: TLabel [3]
    Left = 24
    Top = 160
    Width = 45
    Height = 14
    Caption = 'Conv'#234'nio'
    FocusControl = DBEdit3
  end
  object Label4: TLabel [4]
    Left = 88
    Top = 64
    Width = 75
    Height = 14
    Caption = 'Dt. Lan'#231'amento'
    FocusControl = DBEdit4
  end
  object Label5: TLabel [5]
    Left = 184
    Top = 64
    Width = 69
    Height = 14
    Caption = 'Dt. Pagamento'
    FocusControl = DBEdit5
  end
  object Label6: TLabel [6]
    Left = 280
    Top = 160
    Width = 26
    Height = 14
    Caption = 'Valor'
    FocusControl = DBEdit6
  end
  object Label8: TLabel [7]
    Left = 24
    Top = 208
    Width = 86
    Height = 14
    Caption = 'Nome do Paciente'
    FocusControl = DBEdit8
  end
  object SbBuscaMedico: TSpeedButton [8]
    Left = 73
    Top = 128
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
    OnClick = SbBuscaMedicoClick
  end
  object SbBuscaConvenio: TSpeedButton [9]
    Left = 73
    Top = 176
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
    OnClick = SbBuscaConvenioClick
  end
  inherited Panel1: TPanel
    Width = 510
  end
  inherited StBLongHint: TStatusBar
    Top = 262
    Width = 510
  end
  object DBEdit1: TDBEdit [12]
    Left = 24
    Top = 80
    Width = 49
    Height = 22
    TabStop = False
    Color = clBtnFace
    DataField = 'COD_LANCAMENTO'
    DataSource = DSPrimario
    Enabled = False
    TabOrder = 9
  end
  object DBEdit2: TDBEdit [13]
    Left = 24
    Top = 128
    Width = 49
    Height = 22
    DataField = 'COD_MEDICO'
    DataSource = DSPrimario
    TabOrder = 4
  end
  object DBEdit3: TDBEdit [14]
    Left = 24
    Top = 176
    Width = 49
    Height = 22
    DataField = 'COD_CONVENIO'
    DataSource = DSPrimario
    TabOrder = 5
  end
  object DBEdit4: TDBEdit [15]
    Left = 88
    Top = 80
    Width = 81
    Height = 22
    DataField = 'DT_LANCAMENTO'
    DataSource = DSPrimario
    TabOrder = 1
  end
  object DBEdit5: TDBEdit [16]
    Left = 184
    Top = 80
    Width = 81
    Height = 22
    DataField = 'DT_PAGAMENTO'
    DataSource = DSPrimario
    TabOrder = 2
  end
  object DBEdit6: TDBEdit [17]
    Left = 280
    Top = 176
    Width = 97
    Height = 22
    DataField = 'VAL_PAGAMENTO'
    DataSource = DSPrimario
    TabOrder = 6
  end
  object DBEdit8: TDBEdit [18]
    Left = 24
    Top = 224
    Width = 353
    Height = 22
    DataField = 'NOME_PACIENTE'
    DataSource = DSPrimario
    TabOrder = 7
  end
  object DBRGTipoPgto: TDBRadioGroup [19]
    Left = 280
    Top = 64
    Width = 97
    Height = 89
    Caption = 'Tipo Pagamento'
    DataField = 'IND_TIPO_PAGAMENTO'
    DataSource = DSPrimario
    Items.Strings = (
      'Conv'#234'nio'
      'Particular')
    TabOrder = 3
    Values.Strings = (
      'C'
      'P')
    OnChange = DBRGTipoPgtoChange
  end
  object DBDirceuMedico: TDBDirceu [20]
    Left = 96
    Top = 128
    Width = 169
    Height = 22
    DataField = 'COD_MEDICO'
    DataSource = DSPrimario
    ParentColor = True
    ReadOnly = True
    TabOrder = 10
    TabStop = False
    diTabela = 'TB_MEDICO'
    diCampo = 'NOME'
    diChave = 'COD_MEDICO'
    diCache = False
  end
  object DBDirceuConvenio: TDBDirceu [21]
    Left = 96
    Top = 176
    Width = 169
    Height = 22
    DataField = 'COD_CONVENIO'
    DataSource = DSPrimario
    Enabled = False
    ParentColor = True
    ReadOnly = True
    TabOrder = 11
    TabStop = False
    diTabela = 'TB_CONVENIO'
    diCampo = 'DESC_CONVENIO'
    diChave = 'COD_CONVENIO'
    diCache = False
  end
  object DBRadioGroup1: TDBRadioGroup [22]
    Left = 386
    Top = 64
    Width = 83
    Height = 89
    Caption = 'Situa'#231#227'o'
    DataField = 'IND_SITUACAO'
    DataSource = DSPrimario
    Items.Strings = (
      #192' pagar'
      'Pago')
    TabOrder = 12
    Values.Strings = (
      'N'
      'P')
  end
  inherited MMCadSimples: TMainMenu
    Left = 368
    inherited Relatrios1: TMenuItem
      object Lanamentos1: TMenuItem
        Caption = '&Lan'#231'amentos'
        OnClick = Lanamentos1Click
      end
      object EmissodeRecibo1: TMenuItem
        Caption = '&Emiss'#227'o de Recibo'
        OnClick = EmissodeRecibo1Click
      end
      object LanamentosSinttico1: TMenuItem
        Caption = 'Pagamentos Sint'#233'tico'
        OnClick = LanamentosSinttico1Click
      end
    end
  end
  inherited DSPrimario: TDataSource
    DataSet = DMLancamento.QLancamento
    Left = 320
  end
end
