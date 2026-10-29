inherited FIncentivo_Cad: TFIncentivo_Cad
  Left = 295
  Top = 181
  Caption = 'Cadastro de Incentivo'
  ClientHeight = 268
  ClientWidth = 431
  PixelsPerInch = 96
  TextHeight = 14
  inherited Panel1: TPanel
    Width = 431
  end
  inherited StBLongHint: TStatusBar
    Top = 249
    Width = 431
  end
  object DBPanel1: TDBPanel [2]
    Left = 24
    Top = 64
    Width = 65
    Height = 37
    BevelOuter = bvNone
    Enabled = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    CodigoTabStop = True
    DataField = 'COD_INCENTIVO'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'COD_INCENTIVO'
    ForeignKey = False
    LCaption = 'C'#243'digo'
    ReadOnly = False
    Required = True
    WidthCodigo = 20.000000000000000000
  end
  object DBPanel2: TDBPanel [3]
    Left = 23
    Top = 104
    Width = 353
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
    fkCampo = 'nome'
    fkChave = 'COD_CADASTRO'
    fkTabela = 'tb_cadastro'
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
    Left = 24
    Top = 152
    Width = 73
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    CodigoTabStop = True
    DataField = 'DT_INICIO_INCENTIVO'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'DT_INICIO_INCENTIVO'
    ForeignKey = False
    LCaption = 'Dt. Inicio'
    ReadOnly = False
    Required = True
    WidthCodigo = 20.000000000000000000
  end
  object DBPanel4: TDBPanel [5]
    Left = 120
    Top = 152
    Width = 97
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    CodigoTabStop = True
    DataField = 'DT_FINAL_INCENTIVO'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'DT_FINAL_INCENTIVO'
    ForeignKey = False
    LCaption = 'Dt. Final'
    ReadOnly = False
    Required = True
    WidthCodigo = 20.000000000000000000
  end
  object DBPanel5: TDBPanel [6]
    Left = 24
    Top = 200
    Width = 113
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    CodigoTabStop = True
    DataField = 'VAL_INCENTIVO'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'VAL_INCENTIVO'
    ForeignKey = False
    LCaption = 'Valor Incentivo'
    ReadOnly = False
    Required = True
    WidthCodigo = 20.000000000000000000
  end
  inherited DSPrimario: TDataSource
    DataSet = DMIncentivo.QIncentivo_Cad
  end
end
