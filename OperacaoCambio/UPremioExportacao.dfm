inherited FPremioExportacao: TFPremioExportacao
  Left = 333
  Top = 76
  Caption = 'Pr'#234'mio de Exporta'#231#227'o'
  ClientHeight = 502
  ClientWidth = 408
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel [0]
    Left = 24
    Top = 48
    Width = 33
    Height = 14
    Caption = 'C'#243'digo'
    FocusControl = DBEdit1
  end
  object Label2: TLabel [1]
    Left = 24
    Top = 91
    Width = 41
    Height = 14
    Caption = 'Contrato'
    FocusControl = DBEdit2
  end
  object Label3: TLabel [2]
    Left = 117
    Top = 91
    Width = 22
    Height = 14
    Caption = 'Data'
    FocusControl = DBEdit3
  end
  object Label4: TLabel [3]
    Left = 24
    Top = 307
    Width = 73
    Height = 14
    Caption = 'Conta Corrente'
    FocusControl = DBEdit4
  end
  object Label5: TLabel [4]
    Left = 117
    Top = 135
    Width = 42
    Height = 14
    Caption = 'Valor U$'
    FocusControl = DBEdit5
  end
  object Label6: TLabel [5]
    Left = 24
    Top = 135
    Width = 40
    Height = 14
    Caption = 'Taxa U$'
    FocusControl = DBEdit6
  end
  object Label7: TLabel [6]
    Left = 24
    Top = 178
    Width = 42
    Height = 14
    Caption = 'Valor R$'
    FocusControl = DBEdit7
  end
  object Label8: TLabel [7]
    Left = 24
    Top = 222
    Width = 53
    Height = 14
    Caption = 'Comprador'
    FocusControl = DBEdit8
  end
  object Label9: TLabel [8]
    Left = 24
    Top = 434
    Width = 27
    Height = 14
    Caption = 'Navio'
    FocusControl = DBEdit9
  end
  object Label10: TLabel [9]
    Left = 117
    Top = 178
    Width = 31
    Height = 14
    Caption = 'Fatura'
    FocusControl = DBEdit10
  end
  object SbComprador: TSpeedButton [10]
    Left = 92
    Top = 235
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
  object SbContaCorrente: TSpeedButton [11]
    Left = 92
    Top = 321
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
    OnClick = SbContaCorrenteClick
  end
  object Label11: TLabel [12]
    Left = 24
    Top = 351
    Width = 42
    Height = 14
    Caption = 'Hist'#243'rico'
    FocusControl = DBEdit11
  end
  object SbHistorico: TSpeedButton [13]
    Left = 92
    Top = 364
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
    OnClick = SbHistoricoClick
  end
  object Label12: TLabel [14]
    Left = 24
    Top = 394
    Width = 67
    Height = 14
    Caption = 'Departamento'
    FocusControl = DBEdit12
  end
  object SbDepartamento: TSpeedButton [15]
    Left = 92
    Top = 407
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
    OnClick = SbDepartamentoClick
  end
  object Label13: TLabel [16]
    Left = 24
    Top = 265
    Width = 20
    Height = 14
    Caption = 'Filial'
    FocusControl = DBEdit13
  end
  object SBFilial: TSpeedButton [17]
    Left = 92
    Top = 278
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
    OnClick = SBFilialClick
  end
  inherited Panel1: TPanel
    Width = 408
    TabOrder = 13
  end
  inherited StBLongHint: TStatusBar
    Top = 483
    Width = 408
  end
  object DBEdit1: TDBEdit [20]
    Left = 24
    Top = 64
    Width = 66
    Height = 22
    TabStop = False
    Color = clBtnFace
    DataField = 'COD_PREMIO_EXPORTACAO'
    DataSource = DSPrimario
    Enabled = False
    TabOrder = 0
  end
  object DBEdit2: TDBEdit [21]
    Left = 24
    Top = 106
    Width = 66
    Height = 22
    DataField = 'DESC_CONTRATO'
    DataSource = DSPrimario
    TabOrder = 1
  end
  object DBEdit3: TDBEdit [22]
    Left = 117
    Top = 106
    Width = 66
    Height = 22
    DataField = 'DT_CONTRATO'
    DataSource = DSPrimario
    TabOrder = 2
  end
  object DBEdit4: TDBEdit [23]
    Left = 24
    Top = 321
    Width = 66
    Height = 22
    DataField = 'COD_CONTA_CORRENTE'
    DataSource = DSPrimario
    TabOrder = 9
  end
  object DBEdit5: TDBEdit [24]
    Left = 117
    Top = 149
    Width = 66
    Height = 22
    DataField = 'VAL_DOLAR'
    DataSource = DSPrimario
    TabOrder = 4
  end
  object DBEdit6: TDBEdit [25]
    Left = 24
    Top = 149
    Width = 66
    Height = 22
    DataField = 'VAL_TAXA_DOLAR'
    DataSource = DSPrimario
    TabOrder = 3
  end
  object DBEdit7: TDBEdit [26]
    Left = 24
    Top = 192
    Width = 66
    Height = 22
    DataField = 'VAL_REAL'
    DataSource = DSPrimario
    TabOrder = 5
  end
  object DBEdit8: TDBEdit [27]
    Left = 24
    Top = 235
    Width = 66
    Height = 22
    DataField = 'COD_CADASTRO'
    DataSource = DSPrimario
    TabOrder = 7
  end
  object DBEdit9: TDBEdit [28]
    Left = 24
    Top = 450
    Width = 281
    Height = 22
    DataField = 'DESC_NAVIO'
    DataSource = DSPrimario
    TabOrder = 12
  end
  object DBEdit10: TDBEdit [29]
    Left = 117
    Top = 192
    Width = 66
    Height = 22
    DataField = 'DESC_FATURA'
    DataSource = DSPrimario
    TabOrder = 6
  end
  object DBEdit11: TDBEdit [30]
    Left = 24
    Top = 364
    Width = 66
    Height = 22
    DataField = 'COD_HISTORICO'
    DataSource = DSPrimario
    TabOrder = 10
  end
  object DBDirceu1: TDBDirceu [31]
    Left = 117
    Top = 364
    Width = 188
    Height = 22
    DataField = 'COD_HISTORICO'
    DataSource = DSPrimario
    ParentColor = True
    ReadOnly = True
    TabOrder = 15
    TabStop = False
    diTabela = 'TB_HISTORICO'
    diCampo = 'DESC_HISTORICO'
    diChave = 'COD_HISTORICO'
    diCache = True
  end
  object DBDirceu2: TDBDirceu [32]
    Left = 117
    Top = 321
    Width = 188
    Height = 22
    DataField = 'COD_CONTA_CORRENTE'
    DataSource = DSPrimario
    ParentColor = True
    ReadOnly = True
    TabOrder = 16
    TabStop = False
    diTabela = 'TB_CONTA_CORRENTE'
    diCampo = 'DESC_CONTA_CORRENTE'
    diChave = 'COD_CONTA_CORRENTE'
    diCache = True
  end
  object DBDirceu3: TDBDirceu [33]
    Left = 117
    Top = 235
    Width = 188
    Height = 22
    DataField = 'COD_CADASTRO'
    DataSource = DSPrimario
    ParentColor = True
    ReadOnly = True
    TabOrder = 17
    TabStop = False
    diTabela = 'TB_CADASTRO'
    diCampo = 'NOME'
    diChave = 'COD_CADASTRO'
    diCache = True
  end
  object DBEdit12: TDBEdit [34]
    Left = 24
    Top = 407
    Width = 66
    Height = 22
    DataField = 'COD_DEPARTAMENTO'
    DataSource = DSPrimario
    TabOrder = 11
  end
  object DBDirceu4: TDBDirceu [35]
    Left = 117
    Top = 407
    Width = 188
    Height = 22
    DataField = 'COD_DEPARTAMENTO'
    DataSource = DSPrimario
    ParentColor = True
    ReadOnly = True
    TabOrder = 18
    TabStop = False
    diTabela = 'TB_DEPARTAMENTO'
    diCampo = 'DESC_DEPARTAMENTO'
    diChave = 'COD_DEPARTAMENTO'
    diCache = True
  end
  object DBEdit13: TDBEdit [36]
    Left = 24
    Top = 278
    Width = 66
    Height = 22
    DataField = 'COD_FILIAL'
    DataSource = DSPrimario
    TabOrder = 8
  end
  object DBDirceu5: TDBDirceu [37]
    Left = 117
    Top = 278
    Width = 188
    Height = 22
    DataField = 'COD_FILIAL'
    DataSource = DSPrimario
    ParentColor = True
    ReadOnly = True
    TabOrder = 19
    TabStop = False
    diTabela = 'TB_FILIAL'
    diCampo = 'DESC_FILIAL'
    diChave = 'COD_FILIAL'
    diCache = True
  end
  inherited MMCadSimples: TMainMenu
    Left = 344
    Top = 72
    inherited Relatrios1: TMenuItem
      object RelPrmioExportao1: TMenuItem
        Caption = 'Rel. Pr'#234'mio Exporta'#231#227'o'
        OnClick = RelPrmioExportao1Click
      end
    end
  end
  inherited DSPrimario: TDataSource
    DataSet = DMPremioExportacao.QPremioExportacao
    Left = 344
    Top = 104
  end
  inherited ILBotao: TImageList
    Left = 344
    Top = 40
  end
end
