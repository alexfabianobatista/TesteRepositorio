inherited FPrecoPrazoVendedorCad: TFPrecoPrazoVendedorCad
  Left = 441
  Top = 189
  Caption = 'Cadastro de Pre'#231'o por Prazo/Estado'
  ClientHeight = 318
  ClientWidth = 438
  OnCreate = nil
  PixelsPerInch = 96
  TextHeight = 14
  inherited Panel1: TPanel
    Width = 438
    TabOrder = 5
    inherited SBConsulta: TSpeedButton
      Left = 403
    end
    inherited lbPesquisaCodigo: TLabel
      Left = 299
    end
    inherited MELocaliza: TMaskEdit
      Left = 355
    end
    inherited pnSeparador2: TPanel
      Left = 287
    end
  end
  object DBPanel4: TDBPanel [2]
    Left = 17
    Top = 55
    Width = 89
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    CodigoTabStop = True
    DataField = 'COD_PRECO_PRAZO_VENDEDOR'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'COD_PRECO_PRAZO_VENDEDOR'
    ForeignKey = False
    LCaption = 'C'#243'digo'
    ReadOnly = False
    Required = True
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object DBPanel2: TDBPanel [3]
    Left = 16
    Top = 196
    Width = 369
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    CodigoTabStop = True
    DataField = 'COD_ESTADO'
    DataSource = DSPrimario
    DefineByForm = DBPanel2DefineByForm
    fkCache = False
    fkCampo = 'DESC_ESTADO'
    fkChave = 'COD_ESTADO'
    fkTabela = 'TB_ESTADO'
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
    LCaption = 'Estado'
    ReadOnly = False
    Required = True
    ValidateOnExit = False
    VisibleComponents = [dbpcCodigo, dbpcBusca, dbpcDescricao]
    WidthCodigo = 20.000000000000000000
  end
  object DBPanel3: TDBPanel [4]
    Left = 16
    Top = 102
    Width = 369
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    CodigoTabStop = True
    DataField = 'COD_PRODUTO'
    DataSource = DSPrimario
    DefineByForm = DBPanel3DefineByForm
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
    Required = True
    ValidateOnExit = False
    VisibleComponents = [dbpcCodigo, dbpcBusca, dbpcDescricao]
    WidthCodigo = 20.000000000000000000
  end
  object DBPanel1: TDBPanel [5]
    Left = 16
    Top = 149
    Width = 369
    Height = 40
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    CodigoTabStop = True
    DataField = 'COD_PRAZO_VENCIMENTO'
    DataSource = DSPrimario
    DefineByForm = DBPanel1DefineByForm
    fkCache = False
    fkCampo = 'DESC_PRAZO_VENCIMENTO'
    fkChave = 'COD_PRAZO_VENCIMENTO'
    fkTabela = 'TB_PRAZO_VENCIMENTO'
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
    LCaption = 'Prazo Vencimento'
    ReadOnly = False
    Required = True
    ValidateOnExit = False
    VisibleComponents = [dbpcCodigo, dbpcBusca, dbpcDescricao]
    WidthCodigo = 20.000000000000000000
  end
  object DBPanel5: TDBPanel [6]
    Left = 16
    Top = 244
    Width = 89
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    CodigoTabStop = True
    DataField = 'VAL_PRODUTO'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'VAL_PRODUTO'
    ForeignKey = False
    LCaption = 'Pre'#231'o'
    ReadOnly = False
    Required = False
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  inherited StBLongHint: TStatusBar
    Top = 299
    Width = 438
  end
  inherited MMCadSimples: TMainMenu
    Left = 309
    object Opes1: TMenuItem
      Caption = '&Op'#231#245'es'
      object ReajustedePreos1: TMenuItem
        Caption = '&Reajuste de Pre'#231'os'
        OnClick = ReajustedePreos1Click
      end
    end
  end
  inherited DSPrimario: TDataSource
    DataSet = DMPrecoPrazoVendedor.QPrecoPrazoVendedor
    Left = 367
  end
  inherited ILBotao: TImageList
    Left = 252
  end
  inherited ALCadastro: TActionList
    Left = 278
  end
  inherited IdHTTP1: TIdHTTP
    Left = 337
  end
end
