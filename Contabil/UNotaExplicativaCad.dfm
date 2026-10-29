inherited FNotaExplicativaCad: TFNotaExplicativaCad
  Left = 304
  Top = 69
  Caption = 'Cadastro de Nota Explicativa para Balan'#231'o Patrimonial'
  ClientHeight = 541
  ClientWidth = 1008
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel [0]
    Left = 8
    Top = 48
    Width = 101
    Height = 14
    Caption = 'C'#243'd. Nota Explicativa'
    FocusControl = DBEdit1
  end
  object Label3: TLabel [1]
    Left = 375
    Top = 83
    Width = 20
    Height = 14
    Caption = 'Ano'
    FocusControl = DBEdit3
  end
  object Label4: TLabel [2]
    Left = 8
    Top = 125
    Width = 143
    Height = 14
    Caption = 'Nota Explicativa para Balan'#231'o'
  end
  inherited Panel1: TPanel
    Width = 1008
    inherited sbEnviarSMS: TSpeedButton
      Left = 251
    end
    inherited lbPesquisaCodigo: TLabel
      Left = 864
    end
    inherited SBConsulta: TSpeedButton
      Left = 968
    end
    inherited pnSeparador2: TPanel
      Left = 852
    end
    inherited MELocaliza: TMaskEdit
      Left = 920
    end
  end
  object DBEdit1: TDBEdit [5]
    Left = 8
    Top = 64
    Width = 56
    Height = 22
    Color = clBtnFace
    DataField = 'COD_NOTA_EXPLICATIVA'
    DataSource = DSPrimario
    Enabled = False
    TabOrder = 3
  end
  object DBPanelFilial: TDBPanel [6]
    Left = 8
    Top = 85
    Width = 361
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    CodigoTabStop = True
    DataField = 'COD_FILIAL'
    DataSource = DSPrimario
    DefineByForm = DBPanelFilialDefineByForm
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
  object DBEdit3: TDBEdit [7]
    Left = 375
    Top = 98
    Width = 53
    Height = 22
    DataField = 'NUM_ANO'
    DataSource = DSPrimario
    MaxLength = 4
    TabOrder = 4
  end
  object dbmNotaExplicativa: TDBMemo [8]
    Left = 8
    Top = 144
    Width = 992
    Height = 370
    DataField = 'DESC_NOTA_EXPLICATIVA'
    DataSource = DSPrimario
    ScrollBars = ssVertical
    TabOrder = 5
  end
  inherited StBLongHint: TStatusBar
    Top = 522
    Width = 1008
  end
  inherited MMCadSimples: TMainMenu
    inherited Relatrios1: TMenuItem
      object NotaExplicativa1: TMenuItem
        Caption = '&Nota Explicativa'
        OnClick = NotaExplicativa1Click
      end
    end
  end
  inherited DSPrimario: TDataSource
    DataSet = DMPlanilha.QNotaExplicativa
  end
end
