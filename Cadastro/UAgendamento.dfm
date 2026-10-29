inherited FAgendamento: TFAgendamento
  Left = 471
  Top = 198
  Caption = 'Agendamento'
  ClientHeight = 330
  ClientWidth = 492
  PixelsPerInch = 96
  TextHeight = 14
  inherited Panel1: TPanel
    Width = 492
    TabOrder = 7
    inherited lbPesquisaCodigo: TLabel
      Left = 347
    end
    inherited SBConsulta: TSpeedButton
      Left = 451
    end
    inherited pnSeparador2: TPanel
      Left = 335
    end
    inherited MELocaliza: TMaskEdit
      Left = 403
    end
  end
  object DBPanel1: TDBPanel [2]
    Left = 16
    Top = 56
    Width = 63
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    CodigoTabStop = False
    DataField = 'COD_AGENDAMENTO'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'COD_AGENDAMENTO'
    ForeignKey = False
    LCaption = 'C'#243'digo'
    ReadOnly = True
    Required = False
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object DbDtEntrada: TDBPanel [3]
    Left = 115
    Top = 56
    Width = 85
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    CodigoTabStop = False
    DataField = 'DT_ENTRADA'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'DT_ENTRADA'
    ForeignKey = False
    LCaption = 'Dt. Lanc.'
    ReadOnly = True
    Required = False
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object DBPanel8: TDBPanel [4]
    Left = 207
    Top = 56
    Width = 166
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    CodigoTabStop = False
    DataField = 'COD_USUARIO'
    DataSource = DSPrimario
    fkCache = False
    fkCampo = 'NOME'
    fkChave = 'COD_USUARIO'
    fkTabela = 'TB_USUARIO'
    ForeignKey = True
    LCaption = 'Usu'#225'rio'
    ReadOnly = True
    Required = False
    ValidateOnExit = False
    VisibleComponents = [dbpcCodigo, dbpcDescricao]
    WidthCodigo = 20.000000000000000000
  end
  object DBPanel9: TDBPanel [5]
    Left = 17
    Top = 224
    Width = 100
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    CodigoTabStop = True
    DataField = 'DT_AGENDAMENTO'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'DT_AGENDAMENTO'
    ForeignKey = False
    LCaption = 'Data Agendamento'
    ReadOnly = False
    Required = True
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object DBPanel6: TDBPanel [6]
    Left = 16
    Top = 96
    Width = 358
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    CodigoTabStop = True
    DataField = 'COD_FILIAL'
    DataSource = DSPrimario
    DefineByForm = DBPanel6DefineByForm
    fkCache = False
    fkCampo = 'DESC_FILIAL'
    fkChave = 'COD_FILIAL'
    fkTabela = 'TB_FILIAL'
    ForeignKey = True
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
    LCaption = 'Filial'
    ReadOnly = False
    Required = True
    ValidateOnExit = False
    VisibleComponents = [dbpcCodigo, dbpcBusca, dbpcDescricao]
    WidthCodigo = 22.000000000000000000
  end
  inherited StBLongHint: TStatusBar
    Top = 311
    Width = 492
  end
  object DBPanel10: TDBPanel [8]
    Left = 16
    Top = 137
    Width = 358
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    CodigoTabStop = True
    DataField = 'COD_CADASTRO'
    DataSource = DSPrimario
    DefineByForm = DBPanel10DefineByForm
    fkCache = False
    fkCampo = 'NOME'
    fkChave = 'COD_CADASTRO'
    fkTabela = 'TB_CADASTRO'
    ForeignKey = True
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
    LCaption = 'Cadastro'
    ReadOnly = False
    Required = True
    ValidateOnExit = False
    VisibleComponents = [dbpcCodigo, dbpcBusca, dbpcDescricao]
    WidthCodigo = 22.000000000000000000
  end
  object DBPanel2: TDBPanel [9]
    Left = 424
    Top = 230
    Width = 358
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    Visible = False
    CodigoTabStop = True
    DataField = 'COD_PRODUTO'
    DataSource = DSPrimario
    DefineByForm = DBPanel2DefineByForm
    fkCache = False
    fkCampo = 'DESC_PRODUTO'
    fkChave = 'COD_PRODUTO'
    fkTabela = 'TB_PRODUTO'
    ForeignKey = True
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
    LCaption = 'Produto'
    ReadOnly = False
    Required = False
    ValidateOnExit = False
    VisibleComponents = [dbpcCodigo, dbpcBusca, dbpcDescricao]
    WidthCodigo = 22.000000000000000000
  end
  object DBPanel3: TDBPanel [10]
    Left = 16
    Top = 181
    Width = 358
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    CodigoTabStop = True
    DataField = 'DESC_OBS'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'DESC_OBS'
    ForeignKey = False
    LCaption = 'Modelo Produto'
    ReadOnly = False
    Required = False
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object DBPanel4: TDBPanel [11]
    Left = 129
    Top = 225
    Width = 100
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    CodigoTabStop = True
    DataField = 'DT_ULTIMA_TROCA'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'DT_ULTIMA_TROCA'
    ForeignKey = False
    LCaption = 'Data Ult. Troca'
    ReadOnly = False
    Required = False
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object DBCAtrasado: TDBCheckBox [12]
    Left = 239
    Top = 239
    Width = 65
    Height = 19
    Caption = 'Atrasado'
    DataField = 'IND_ATRASADO'
    DataSource = DSPrimario
    TabOrder = 11
    ValueChecked = 'SIM'
    ValueUnchecked = 'NAO'
  end
  object DBPanel5: TDBPanel [13]
    Left = 16
    Top = 269
    Width = 358
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
    CodigoTabStop = True
    DataField = 'DESC_OBS_OUTROS'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'DESC_OBS_OUTROS'
    ForeignKey = False
    LCaption = 'Observa'#231#227'o'
    ReadOnly = False
    Required = False
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  inherited MMCadSimples: TMainMenu
    Left = 349
    Top = 8
    inherited Relatrios1: TMenuItem
      object Agendamentos1: TMenuItem
        Caption = 'Agendamentos'
        OnClick = Agendamentos1Click
      end
    end
  end
  inherited DSPrimario: TDataSource
    DataSet = DMCadastro.QAgendamento
    Left = 415
    Top = 8
  end
  inherited ILBotao: TImageList
    Left = 292
    Top = 8
  end
  inherited ALCadastro: TActionList
    Left = 318
    Top = 8
  end
  inherited IdHTTP1: TIdHTTP
    Left = 377
    Top = 8
  end
end
