object FContratoMensalReajuste: TFContratoMensalReajuste
  Left = 371
  Top = 206
  Width = 345
  Height = 294
  Caption = 'Reajuste Contrato'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label89: TLabel
    Left = 19
    Top = 16
    Width = 20
    Height = 13
    Caption = 'Filial'
  end
  object SpeedButton51: TSpeedButton
    Left = 75
    Top = 32
    Width = 23
    Height = 22
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
    NumGlyphs = 2
    OnClick = SpeedButton51Click
  end
  object Label1: TLabel
    Left = 19
    Top = 60
    Width = 42
    Height = 13
    Caption = 'Cadastro'
  end
  object SpeedButton1: TSpeedButton
    Left = 74
    Top = 75
    Width = 25
    Height = 23
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
    NumGlyphs = 2
    OnClick = SpeedButton1Click
  end
  object Label2: TLabel
    Left = 19
    Top = 104
    Width = 68
    Height = 13
    Caption = 'Data Reajuste'
  end
  object Label3: TLabel
    Left = 117
    Top = 104
    Width = 97
    Height = 13
    Caption = 'M'#234's Ultimo Reajuste'
  end
  object Label4: TLabel
    Left = 20
    Top = 152
    Width = 57
    Height = 13
    Caption = 'Perc. '#205'ndice'
  end
  object MeFilial: TMaskEdit
    Left = 19
    Top = 32
    Width = 56
    Height = 21
    TabOrder = 0
    OnChange = MeFilialChange
  end
  object EdFilial: TMaskEdit
    Left = 99
    Top = 32
    Width = 206
    Height = 21
    TabStop = False
    ParentColor = True
    ReadOnly = True
    TabOrder = 1
    Text = 'Todas'
  end
  object MeCadastro: TMaskEdit
    Left = 18
    Top = 75
    Width = 57
    Height = 21
    TabOrder = 2
    OnChange = MeCadastroChange
  end
  object EdCadastro: TMaskEdit
    Left = 100
    Top = 75
    Width = 206
    Height = 21
    TabStop = False
    ParentColor = True
    ReadOnly = True
    TabOrder = 3
    Text = 'Todos'
  end
  object MeData: TMaskEdit
    Left = 19
    Top = 120
    Width = 70
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 4
    Text = '  /  /    '
  end
  object MeMes: TMaskEdit
    Left = 117
    Top = 120
    Width = 34
    Height = 21
    EditMask = '##'
    MaxLength = 2
    TabOrder = 5
    Text = '  '
  end
  object MeIndice: TMaskEdit
    Left = 20
    Top = 168
    Width = 50
    Height = 21
    TabOrder = 6
  end
  object BtOk: TBitBtn
    Left = 79
    Top = 213
    Width = 75
    Height = 25
    Caption = '&Confirma'
    TabOrder = 7
    OnClick = BtOkClick
    Kind = bkOK
  end
  object BtCancela: TBitBtn
    Left = 176
    Top = 213
    Width = 75
    Height = 25
    Caption = 'C&ancela'
    TabOrder = 8
    Kind = bkCancel
  end
end
