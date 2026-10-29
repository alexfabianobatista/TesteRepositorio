object FAplicacaoFinanceiraVoltaMov: TFAplicacaoFinanceiraVoltaMov
  Left = 329
  Top = 185
  Width = 415
  Height = 176
  Caption = 'Volta do Movimento de Aplica'#231#227'o Financeira'
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
  object SBAplicacaoMovCons: TSpeedButton
    Left = 169
    Top = 26
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
    OnClick = SBAplicacaoMovConsClick
  end
  object Label1: TLabel
    Left = 9
    Top = 10
    Width = 72
    Height = 13
    Caption = 'C'#243'd. Aplica'#231#227'o'
  end
  object Label2: TLabel
    Left = 97
    Top = 10
    Width = 77
    Height = 13
    Caption = 'C'#243'd. Movimento'
  end
  object Label3: TLabel
    Left = 8
    Top = 65
    Width = 50
    Height = 13
    Caption = 'Data Mov.'
  end
  object Label4: TLabel
    Left = 80
    Top = 65
    Width = 24
    Height = 13
    Caption = 'Valor'
  end
  object Label5: TLabel
    Left = 168
    Top = 65
    Width = 41
    Height = 13
    Caption = 'Hist'#243'rico'
  end
  object SBVoltaMovimento: TSpeedButton
    Left = 160
    Top = 120
    Width = 81
    Height = 22
    Caption = 'Voltar'
    OnClick = SBVoltaMovimentoClick
  end
  object MECodAplicacao: TMaskEdit
    Left = 9
    Top = 26
    Width = 73
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 1
  end
  object MECodMovimento: TMaskEdit
    Left = 97
    Top = 26
    Width = 73
    Height = 21
    TabOrder = 0
  end
  object MEDataMov: TMaskEdit
    Left = 8
    Top = 81
    Width = 65
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 2
  end
  object MEValorMov: TMaskEdit
    Left = 80
    Top = 81
    Width = 80
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 3
  end
  object MEHistoricoMov: TMaskEdit
    Left = 168
    Top = 81
    Width = 57
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 4
  end
  object EdHistoricoMov: TEdit
    Left = 227
    Top = 81
    Width = 172
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 5
  end
  object RGTipoMov: TRadioGroup
    Left = 199
    Top = 11
    Width = 185
    Height = 39
    Caption = 'Tipo Movimento'
    Columns = 2
    Items.Strings = (
      'Baixa'
      'Rendimento')
    TabOrder = 6
  end
end
