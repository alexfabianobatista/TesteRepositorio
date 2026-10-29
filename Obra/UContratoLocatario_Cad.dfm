inherited FContratoLocatario_Cad: TFContratoLocatario_Cad
  Left = 361
  Top = 133
  Caption = 'Cadastro Contrato Locador'
  ClientHeight = 358
  ClientWidth = 520
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel [0]
    Left = 32
    Top = 56
    Width = 33
    Height = 14
    Caption = 'C'#243'digo'
    FocusControl = DBEdit1
  end
  object Label3: TLabel [1]
    Left = 32
    Top = 178
    Width = 56
    Height = 14
    Caption = 'Dt. Emiss'#227'o'
    FocusControl = DBEdit3
  end
  object Label4: TLabel [2]
    Left = 152
    Top = 178
    Width = 52
    Height = 14
    Caption = 'Dia Vencto'
    FocusControl = DBEdit4
  end
  object Label6: TLabel [3]
    Left = 32
    Top = 226
    Width = 57
    Height = 14
    Caption = 'Vl. Contrato'
    FocusControl = DBEdit6
  end
  object Label2: TLabel [4]
    Left = 216
    Top = 178
    Width = 90
    Height = 14
    Caption = 'Dt. Inicio Cobran'#231'a'
    FocusControl = DBEdit2
  end
  object Label5: TLabel [5]
    Left = 32
    Top = 272
    Width = 33
    Height = 14
    Caption = '%Taxa'
    FocusControl = DBEdit5
  end
  inherited Panel1: TPanel
    Width = 520
    TabOrder = 7
    inherited SBConsulta: TSpeedButton
      Left = 484
    end
    inherited sbEnviarSMS: TSpeedButton
      Left = 252
    end
    inherited lbPesquisaCodigo: TLabel
      Left = 380
    end
    inherited MELocaliza: TMaskEdit
      Left = 436
    end
    inherited pnSeparador2: TPanel
      Left = 368
    end
  end
  object DBEdit1: TDBEdit [8]
    Left = 32
    Top = 72
    Width = 65
    Height = 22
    DataField = 'COD_CONTRATO_LOCATARIO'
    DataSource = DSPrimario
    TabOrder = 0
  end
  object DBEdit3: TDBEdit [9]
    Left = 32
    Top = 194
    Width = 105
    Height = 22
    DataField = 'DT_EMISSAO'
    DataSource = DSPrimario
    TabOrder = 3
  end
  object DBEdit4: TDBEdit [10]
    Left = 152
    Top = 194
    Width = 49
    Height = 22
    DataField = 'DIA_VENCIMENTO'
    DataSource = DSPrimario
    TabOrder = 4
  end
  object DBEdit6: TDBEdit [11]
    Left = 32
    Top = 242
    Width = 105
    Height = 22
    DataField = 'VL_CONTRATO'
    DataSource = DSPrimario
    TabOrder = 6
  end
  object DBPanel1: TDBPanel [12]
    Left = 32
    Top = 98
    Width = 305
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    CodigoTabStop = True
    DataField = 'COD_IMOVEL'
    DataSource = DSPrimario
    DefineByForm = DBPanel1DefineByForm
    fkCache = False
    fkCampo = 'desc_Imovel'
    fkChave = 'COD_IMOVEL'
    fkTabela = 'tb_Imovel'
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
    LCaption = 'Im'#243'vel'
    ReadOnly = False
    Required = True
    ValidateOnExit = False
    VisibleComponents = [dbpcCodigo, dbpcBusca, dbpcDescricao]
    WidthCodigo = 20.000000000000000000
  end
  object DBPanel2: TDBPanel [13]
    Left = 32
    Top = 139
    Width = 305
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    CodigoTabStop = True
    DataField = 'COD_FILIAL'
    DataSource = DSPrimario
    DefineByForm = DBPanel2DefineByForm
    fkCache = False
    fkCampo = 'desc_filial'
    fkChave = 'COD_FILIAL'
    fkTabela = 'tb_filial'
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
    WidthCodigo = 20.000000000000000000
  end
  object DBRadioGroup1: TDBRadioGroup [14]
    Left = 160
    Top = 232
    Width = 178
    Height = 33
    Caption = 'Situa'#231#227'o'
    Columns = 2
    DataField = 'IND_SITUACAO'
    DataSource = DSPrimario
    Items.Strings = (
      'Ativo'
      'Desativado')
    TabOrder = 9
    Values.Strings = (
      'A'
      'D')
  end
  object DBEdit2: TDBEdit [15]
    Left = 216
    Top = 194
    Width = 121
    Height = 22
    DataField = 'DT_INICIO_COBRANCA'
    DataSource = DSPrimario
    TabOrder = 5
  end
  object DBEdit5: TDBEdit [16]
    Left = 32
    Top = 288
    Width = 57
    Height = 22
    DataField = 'PERC_TAXA_ADM'
    DataSource = DSPrimario
    TabOrder = 10
  end
  inherited StBLongHint: TStatusBar
    Top = 339
    Width = 520
  end
  inherited MMCadSimples: TMainMenu
    Left = 429
    inherited Relatrios1: TMenuItem
      object EmissoContrato1: TMenuItem
        Caption = 'Emiss'#227'o Contrato'
        OnClick = EmissoContrato1Click
      end
      object Extrato1: TMenuItem
        Caption = 'Extrato'
        OnClick = Extrato1Click
      end
      object RelatrioComissoImobiliria1: TMenuItem
        Caption = 'Relat'#243'rio Comiss'#227'o Imobili'#225'ria'
        OnClick = RelatrioComissoImobiliria1Click
      end
    end
    object Opo1: TMenuItem
      Caption = 'Op'#231#227'o'
      object GerarContasPagar1: TMenuItem
        Caption = 'Gerar Contas Pagar'
        OnClick = GerarContasPagar1Click
      end
    end
  end
  inherited DSPrimario: TDataSource
    DataSet = DMImobiliaria.QLocatario_Cad
    Left = 487
  end
  inherited ILBotao: TImageList
    Left = 372
  end
  inherited ALCadastro: TActionList
    Left = 398
  end
  inherited IdHTTP1: TIdHTTP
    Left = 457
  end
end
