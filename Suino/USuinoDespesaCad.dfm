inherited FSuinoDespesaCad: TFSuinoDespesaCad
  Left = 320
  Top = 168
  Caption = 'Despesas com Su'#237'nos'
  ClientHeight = 324
  ClientWidth = 412
  PixelsPerInch = 96
  TextHeight = 14
  inherited Panel1: TPanel
    Width = 412
  end
  inherited StBLongHint: TStatusBar
    Top = 305
    Width = 412
  end
  object DBPanel1: TDBPanel [2]
    Left = 16
    Top = 56
    Width = 81
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    CodigoTabStop = False
    DataField = 'COD_SUINO_DESPESA'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'COD_SUINO_DESPESA'
    ForeignKey = False
    LCaption = 'C'#243'digo'
    ReadOnly = True
    Required = False
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object DBPanel2: TDBPanel [3]
    Left = 16
    Top = 96
    Width = 297
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    CodigoTabStop = True
    DataField = 'COD_CADASTRO'
    DataSource = DSPrimario
    DefineByForm = DBPanel2DefineByForm
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
    ValidateOnChange = False
    ValidateOnExit = False
    VisibleComponents = [dbpcCodigo, dbpcBusca, dbpcDescricao]
    WidthCodigo = 20.000000000000000000
  end
  object DBPanel3: TDBPanel [4]
    Left = 16
    Top = 136
    Width = 297
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    CodigoTabStop = True
    DataField = 'COD_HISTORICO'
    DataSource = DSPrimario
    DefineByForm = DBPanel3DefineByForm
    fkCache = False
    fkCampo = 'DESC_HISTORICO'
    fkChave = 'COD_HISTORICO'
    fkTabela = 'TB_HISTORICO'
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
    LCaption = 'Hist'#243'rico'
    ReadOnly = False
    Required = True
    ValidateOnChange = False
    ValidateOnExit = False
    VisibleComponents = [dbpcCodigo, dbpcBusca, dbpcDescricao]
    WidthCodigo = 20.000000000000000000
  end
  object DBPanel4: TDBPanel [5]
    Left = 16
    Top = 176
    Width = 89
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    CodigoTabStop = True
    DataField = 'DT_DESPESA'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'DT_DESPESA'
    ForeignKey = False
    LCaption = 'Data'
    ReadOnly = False
    Required = True
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object DBPanel5: TDBPanel [6]
    Left = 16
    Top = 216
    Width = 129
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    CodigoTabStop = True
    DataField = 'VAL_DESPESA'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'VAL_DESPESA'
    ForeignKey = False
    LCaption = 'Valor'
    ReadOnly = False
    Required = True
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object DBPanel6: TDBPanel [7]
    Left = 16
    Top = 256
    Width = 377
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    CodigoTabStop = True
    DataField = 'DESC_OBS'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'DESC_OBS'
    ForeignKey = False
    LCaption = 'Observa'#231#227'o'
    ReadOnly = False
    Required = False
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  inherited MMCadSimples: TMainMenu
    Left = 312
    Top = 32
    inherited Relatrios1: TMenuItem
      OnClick = Relatrios1Click
    end
  end
  inherited DSPrimario: TDataSource
    DataSet = DmSuino.QSuinoDespesa
    Left = 360
    Top = 32
  end
  inherited ILBotao: TImageList
    Left = 248
    Top = 32
  end
  inherited ALCadastro: TActionList
    Left = 280
    Top = 32
  end
end
