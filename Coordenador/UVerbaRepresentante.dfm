inherited FVerbaRepresentante: TFVerbaRepresentante
  Left = 191
  Top = 225
  Caption = 'Cadastro Verba Representante'
  ClientHeight = 250
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
  object Label2: TLabel [1]
    Left = 24
    Top = 96
    Width = 71
    Height = 14
    Caption = 'Representante'
    FocusControl = DBEdit2
  end
  object Label3: TLabel [2]
    Left = 24
    Top = 136
    Width = 20
    Height = 14
    Caption = 'Ano'
    FocusControl = DBEdit3
  end
  object Label4: TLabel [3]
    Left = 112
    Top = 136
    Width = 20
    Height = 14
    Caption = 'M'#234's'
    FocusControl = DBEdit4
  end
  object Label5: TLabel [4]
    Left = 176
    Top = 136
    Width = 26
    Height = 14
    Caption = 'Valor'
    FocusControl = DBEdit5
  end
  object SbSupervisor: TSpeedButton [5]
    Left = 99
    Top = 113
    Width = 25
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
    OnClick = SbSupervisorClick
  end
  inherited StBLongHint: TStatusBar
    Top = 231
  end
  object DBEdit1: TDBEdit [8]
    Left = 24
    Top = 72
    Width = 73
    Height = 22
    DataField = 'COD_VERBA_REPRESENTANTE'
    DataSource = DSPrimario
    TabOrder = 2
  end
  object DBEdit2: TDBEdit [9]
    Left = 24
    Top = 112
    Width = 73
    Height = 22
    DataField = 'COD_VENDEDOR'
    DataSource = DSPrimario
    TabOrder = 3
  end
  object DBEdit3: TDBEdit [10]
    Left = 24
    Top = 152
    Width = 73
    Height = 22
    DataField = 'NUM_ANO'
    DataSource = DSPrimario
    TabOrder = 4
  end
  object DBEdit4: TDBEdit [11]
    Left = 112
    Top = 152
    Width = 57
    Height = 22
    DataField = 'NUM_MES'
    DataSource = DSPrimario
    TabOrder = 5
  end
  object DBEdit5: TDBEdit [12]
    Left = 176
    Top = 152
    Width = 144
    Height = 22
    DataField = 'VAL_VERBA'
    DataSource = DSPrimario
    TabOrder = 6
  end
  object DBDirceu1: TDBDirceu [13]
    Left = 126
    Top = 113
    Width = 195
    Height = 22
    DataField = 'COD_VENDEDOR'
    DataSource = DSPrimario
    ParentColor = True
    ReadOnly = True
    TabOrder = 7
    TabStop = False
    diTabela = 'tb_vendedor'
    diCampo = 'nome'
    diChave = 'cod_vendedor'
  end
  inherited MMCadSimples: TMainMenu
    inherited Relatrios1: TMenuItem
      object RelVerbaRepresentante1: TMenuItem
        Caption = 'Rel Verba Representante'
        OnClick = RelVerbaRepresentante1Click
      end
    end
  end
  inherited DSPrimario: TDataSource
    DataSet = DMVerbaRepresentante.QVerbaRepresentante_Cad
  end
end
