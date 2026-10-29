inherited FNCMMargemClasse: TFNCMMargemClasse
  Left = 392
  Top = 189
  Caption = 'Altera NCM/Margem por Classe'
  ClientHeight = 345
  ClientWidth = 491
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel [0]
    Left = 48
    Top = 120
    Width = 22
    Height = 14
    Caption = 'NCM'
  end
  inherited Panel1: TPanel
    Width = 491
    Visible = False
    inherited sbEnviarSMS: TSpeedButton
      Left = 547
    end
  end
  inherited StBLongHint: TStatusBar
    Top = 326
    Width = 491
  end
  inline FmSubClasse: TFmSubClasse [3]
    Left = 48
    Top = 72
    Width = 385
    Height = 37
    TabOrder = 1
    inherited Label1: TLabel
      Width = 33
      Height = 14
    end
    inherited Label2: TLabel
      Width = 52
      Height = 14
    end
    inherited MeClasse: TMaskEdit
      Height = 22
    end
    inherited BtClasse: TBitBtn
      TabOrder = 2
    end
    inherited EdClasse: TEdit
      Width = 257
      Height = 22
      TabOrder = 3
    end
    inherited MeSubClasse: TMaskEdit
      Height = 22
      TabOrder = 1
    end
  end
  object MeNcm: TMaskEdit [4]
    Left = 48
    Top = 136
    Width = 97
    Height = 22
    MaxLength = 8
    TabOrder = 2
  end
  object BtNcm: TBitBtn [5]
    Left = 150
    Top = 134
    Width = 25
    Height = 24
    TabOrder = 6
    TabStop = False
    OnClick = BtNcmClick
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
  object GroupBox1: TGroupBox [6]
    Left = 46
    Top = 208
    Width = 145
    Height = 73
    Caption = 'Margem de venda'
    TabOrder = 4
    object Label2: TLabel
      Left = 8
      Top = 16
      Width = 41
      Height = 14
      Caption = 'Atacado'
    end
    object Label3: TLabel
      Left = 96
      Top = 16
      Width = 31
      Height = 14
      Caption = 'Varejo'
    end
    object MeAtacado: TMaskEdit
      Left = 8
      Top = 32
      Width = 57
      Height = 22
      TabOrder = 0
    end
    object MeVarejo: TMaskEdit
      Left = 80
      Top = 32
      Width = 57
      Height = 22
      TabOrder = 1
    end
  end
  object BitBtn1: TBitBtn [7]
    Left = 48
    Top = 289
    Width = 105
    Height = 33
    TabOrder = 7
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn [8]
    Left = 216
    Top = 290
    Width = 97
    Height = 33
    Caption = 'Cancelar'
    TabOrder = 8
    Kind = bkCancel
  end
  inline Fm1Marca: TFmMarca [9]
    Left = 47
    Top = 162
    Width = 267
    Height = 40
    TabOrder = 3
    inherited Label1: TLabel
      Height = 14
    end
    inherited MeMarca: TMaskEdit
      Height = 22
    end
    inherited EdMarca: TEdit
      Height = 22
    end
  end
  inherited MMCadSimples: TMainMenu [10]
    Left = 416
  end
  inherited DSPrimario: TDataSource [11]
    Left = 448
  end
  inherited ILBotao: TImageList [12]
    Left = 376
  end
  inherited ALCadastro: TActionList
    Left = 392
  end
end
