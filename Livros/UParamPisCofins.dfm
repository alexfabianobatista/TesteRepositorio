inherited FParamPisCofins: TFParamPisCofins
  Left = 496
  Top = 141
  Caption = 'Par'#226'metros de PIS/COFINS'
  ClientHeight = 379
  ClientWidth = 415
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel [0]
    Left = 24
    Top = 56
    Width = 33
    Height = 14
    Caption = 'C'#243'digo'
    FocusControl = DBEdit1
  end
  object Label3: TLabel [1]
    Left = 24
    Top = 136
    Width = 22
    Height = 14
    Caption = 'NCM'
    FocusControl = DBEdit3
  end
  object Label9: TLabel [2]
    Left = 24
    Top = 96
    Width = 48
    Height = 14
    Caption = 'Opera'#231#227'o'
    FocusControl = EdOperacao
  end
  inherited Panel1: TPanel
    Width = 415
  end
  inherited StBLongHint: TStatusBar
    Top = 360
    Width = 415
  end
  object DBEdit1: TDBEdit [5]
    Left = 24
    Top = 72
    Width = 144
    Height = 22
    TabStop = False
    Color = clBtnFace
    DataField = 'COD_PARAM_PIS_COFINS'
    DataSource = DSPrimario
    ReadOnly = True
    TabOrder = 2
  end
  object DBEdit3: TDBEdit [6]
    Left = 24
    Top = 152
    Width = 116
    Height = 22
    DataField = 'NUM_NCM'
    DataSource = DSPrimario
    TabOrder = 6
  end
  object EdOperacao: TDBEdit [7]
    Left = 24
    Top = 112
    Width = 53
    Height = 22
    DataField = 'COD_OPERACAO'
    DataSource = DSPrimario
    TabOrder = 3
  end
  object BtConsOperacao: TBitBtn [8]
    Left = 78
    Top = 112
    Width = 25
    Height = 24
    TabOrder = 4
    TabStop = False
    OnClick = BtConsOperacaoClick
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
  end
  object DBDirceu1: TDBDirceu [9]
    Left = 104
    Top = 113
    Width = 217
    Height = 22
    DataField = 'COD_OPERACAO'
    DataSource = DSPrimario
    ParentColor = True
    ReadOnly = True
    TabOrder = 5
    TabStop = False
    diTabela = 'TB_OPERACAO'
    diCampo = 'DESC_OPERACAO'
    diChave = 'COD_OPERACAO'
    diCache = False
  end
  object GbPis: TGroupBox [10]
    Left = 24
    Top = 184
    Width = 177
    Height = 153
    Caption = 'PIS/PASEP'
    TabOrder = 7
    object Label5: TLabel
      Left = 16
      Top = 56
      Width = 39
      Height = 14
      Caption = 'Al'#237'quota'
      FocusControl = DBEdit5
    end
    object Label6: TLabel
      Left = 16
      Top = 96
      Width = 78
      Height = 14
      Caption = 'Base de C'#225'lculo'
      FocusControl = DBEdit6
    end
    object Label4: TLabel
      Left = 16
      Top = 16
      Width = 20
      Height = 14
      Caption = 'CST'
      FocusControl = DBEdit4
    end
    object DBEdit5: TDBEdit
      Left = 16
      Top = 72
      Width = 144
      Height = 22
      DataField = 'VAL_ALIQ_PIS'
      DataSource = DSPrimario
      TabOrder = 1
    end
    object DBEdit6: TDBEdit
      Left = 16
      Top = 112
      Width = 144
      Height = 22
      DataField = 'VAL_BC_PIS'
      DataSource = DSPrimario
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 16
      Top = 32
      Width = 32
      Height = 22
      DataField = 'COD_CST_PIS'
      DataSource = DSPrimario
      TabOrder = 0
    end
  end
  object GbCofins: TGroupBox [11]
    Left = 216
    Top = 184
    Width = 177
    Height = 153
    Caption = 'COFINS'
    TabOrder = 8
    object Label2: TLabel
      Left = 16
      Top = 56
      Width = 39
      Height = 14
      Caption = 'Al'#237'quota'
      FocusControl = DBEdit2
    end
    object Label10: TLabel
      Left = 16
      Top = 96
      Width = 78
      Height = 14
      Caption = 'Base de C'#225'lculo'
      FocusControl = DBEdit9
    end
    object Label7: TLabel
      Left = 16
      Top = 16
      Width = 20
      Height = 14
      Caption = 'CST'
      FocusControl = DBEdit7
    end
    object DBEdit2: TDBEdit
      Left = 16
      Top = 72
      Width = 144
      Height = 22
      DataField = 'VAL_ALIQ_COFINS'
      DataSource = DSPrimario
      TabOrder = 1
    end
    object DBEdit9: TDBEdit
      Left = 16
      Top = 112
      Width = 144
      Height = 22
      DataField = 'VAL_BC_COFINS'
      DataSource = DSPrimario
      TabOrder = 2
    end
    object DBEdit7: TDBEdit
      Left = 16
      Top = 32
      Width = 32
      Height = 22
      DataField = 'COD_CST_COFINS'
      DataSource = DSPrimario
      TabOrder = 0
    end
  end
  inherited MMCadSimples: TMainMenu
    Left = 304
    Top = 48
    object Opes1: TMenuItem
      Caption = 'Op'#231#245'es'
      object PercentuaisdePISCOFINS1: TMenuItem
        Caption = 'Percentuais de PIS/COFINS'
        OnClick = PercentuaisdePISCOFINS1Click
      end
    end
  end
  inherited DSPrimario: TDataSource
    DataSet = DMLivroFiscal.QParamPisCofins
    Left = 352
    Top = 48
  end
  inherited ILBotao: TImageList
    Left = 240
    Top = 48
  end
end
