object FProdutoTransf: TFProdutoTransf
  Left = 192
  Top = 110
  Width = 463
  Height = 203
  Caption = 'Transfere C'#243'digo Produto'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 417
    Height = 105
    Caption = 'Transferir Produto'
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 102
      Top = 18
      Width = 32
      Height = 23
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
      OnClick = SpeedButton1Click
    end
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 17
      Height = 13
      Caption = 'De:'
    end
    object Label2: TLabel
      Left = 16
      Top = 61
      Width = 25
      Height = 13
      Caption = 'Para:'
    end
    object SpeedButton2: TSpeedButton
      Left = 102
      Top = 55
      Width = 32
      Height = 23
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
      OnClick = SpeedButton2Click
    end
    object MeProdutoDe: TMaskEdit
      Left = 48
      Top = 19
      Width = 49
      Height = 21
      EditMask = '######'
      MaxLength = 6
      TabOrder = 0
      Text = '      '
      OnChange = MeProdutoDeChange
    end
    object MeProdutoPara: TMaskEdit
      Left = 48
      Top = 56
      Width = 49
      Height = 21
      EditMask = '######'
      MaxLength = 6
      TabOrder = 1
      Text = '      '
      OnChange = MeProdutoParaChange
    end
    object EdProdutoDe: TEdit
      Left = 136
      Top = 19
      Width = 241
      Height = 21
      TabStop = False
      Color = clBtnFace
      Enabled = False
      TabOrder = 2
    end
    object EdProdutoPara: TEdit
      Left = 136
      Top = 56
      Width = 241
      Height = 21
      TabStop = False
      Color = clBtnFace
      Enabled = False
      TabOrder = 3
    end
  end
  object BtOk: TBitBtn
    Left = 106
    Top = 138
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 1
    OnClick = BtOkClick
    Kind = bkOK
  end
  object BtCancela: TBitBtn
    Left = 250
    Top = 138
    Width = 75
    Height = 25
    Caption = 'Cancela'
    TabOrder = 2
    Kind = bkCancel
  end
end
