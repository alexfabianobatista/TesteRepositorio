inherited FNotaRefenciadaCad: TFNotaRefenciadaCad
  Left = 435
  Top = 159
  Caption = 'Refer'#234'ncia de Nota de Produtor'
  ClientHeight = 184
  ClientWidth = 376
  PixelsPerInch = 96
  TextHeight = 14
  object LbModelo: TLabel [0]
    Left = 191
    Top = 54
    Width = 34
    Height = 14
    Caption = 'Modelo'
  end
  inherited Panel1: TPanel
    Width = 376
    inherited SBHelp: TSpeedButton
      Visible = False
    end
    inherited SBConsulta: TSpeedButton
      Visible = False
    end
    inherited sbEnviarSMS: TSpeedButton [8]
      Left = 347
      Visible = False
    end
    inherited BtCopia: TSpeedButton [9]
    end
    inherited MELocaliza: TMaskEdit
      Enabled = False
      Visible = False
    end
  end
  inherited StBLongHint: TStatusBar
    Top = 165
    Width = 376
  end
  object DBPNumDocumento: TDBPanel [3]
    Left = 23
    Top = 56
    Width = 89
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    CodigoTabStop = True
    DataField = 'NUM_NOTA'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'NUM_NOTA'
    ForeignKey = False
    LCaption = 'Num. Documento'
    ReadOnly = False
    Required = False
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object DBPDataEmissao: TDBPanel [4]
    Left = 266
    Top = 56
    Width = 79
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    CodigoTabStop = True
    DataField = 'DT_EMISSAO'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'DT_EMISSAO'
    ForeignKey = False
    LCaption = 'Data Emiss'#227'o'
    ReadOnly = False
    Required = True
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object DBPSerie: TDBPanel [5]
    Left = 128
    Top = 56
    Width = 49
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    CodigoTabStop = True
    DataField = 'COD_SERIE'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'COD_SERIE'
    ForeignKey = False
    LCaption = 'S'#233'rie'
    ReadOnly = False
    Required = True
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object DBCbModelo: TDBComboBox [6]
    Left = 191
    Top = 70
    Width = 57
    Height = 22
    Style = csDropDownList
    DataField = 'COD_SERIE_MODELO'
    DataSource = DSPrimario
    ItemHeight = 14
    Items.Strings = (
      '01'
      '04'
      '55')
    TabOrder = 3
  end
  object DBPProdutor: TDBPanel [7]
    Left = 23
    Top = 104
    Width = 322
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    CodigoTabStop = True
    DataField = 'COD_CADASTRO'
    DataSource = DSPrimario
    DefineByForm = DBPProdutorDefineByForm
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
    WidthCodigo = 20.000000000000000000
  end
  inherited DSPrimario: TDataSource
    DataSet = DMNotaEntrada.QNotaReferenciada
    Left = 391
  end
end
