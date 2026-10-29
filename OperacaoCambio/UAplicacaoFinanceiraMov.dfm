object FAplicacaoFinanceiraMov: TFAplicacaoFinanceiraMov
  Left = 204
  Top = 153
  Width = 489
  Height = 175
  Caption = 'Baixa de Aplica'#231#245'es Financeiras'
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
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 77
    Height = 13
    Caption = 'C'#243'd. Movimento'
  end
  object Label2: TLabel
    Left = 103
    Top = 16
    Width = 72
    Height = 13
    Caption = 'C'#243'd. Aplica'#231#227'o'
  end
  object Label3: TLabel
    Left = 195
    Top = 16
    Width = 23
    Height = 13
    Caption = 'Data'
  end
  object Label4: TLabel
    Left = 287
    Top = 64
    Width = 24
    Height = 13
    Caption = 'Valor'
  end
  object Label5: TLabel
    Left = 287
    Top = 16
    Width = 81
    Height = 13
    Caption = 'Disp. p/ Resgate'
  end
  object Label6: TLabel
    Left = 16
    Top = 65
    Width = 70
    Height = 13
    Caption = 'Hist'#243'rico Baixa'
  end
  object SBHistoricoMov: TSpeedButton
    Left = 76
    Top = 80
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
    OnClick = SBHistoricoMovClick
  end
  object DBEdit1: TDBEdit
    Left = 16
    Top = 32
    Width = 78
    Height = 21
    TabStop = False
    AutoSize = False
    Color = clBtnFace
    DataField = 'COD_APLICACAO_FINANCEIRA_MOV'
    DataSource = DMAplicacaoFinanceira.DSAplicacaoFinanceiraMov
    ReadOnly = True
    TabOrder = 6
  end
  object MEValorResgate: TMaskEdit
    Left = 288
    Top = 31
    Width = 89
    Height = 21
    TabStop = False
    AutoSize = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 7
  end
  object BitBtn1: TBitBtn
    Left = 184
    Top = 113
    Width = 97
    Height = 26
    Caption = 'Processar'
    ModalResult = 1
    TabOrder = 5
    OnClick = BitBtn1Click
  end
  object MECodAplicacao: TMaskEdit
    Left = 104
    Top = 32
    Width = 71
    Height = 21
    TabStop = False
    AutoSize = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 0
  end
  object MEValor: TMaskEdit
    Left = 288
    Top = 80
    Width = 89
    Height = 21
    AutoSize = False
    TabOrder = 3
  end
  object MEDataBaixa: TMaskEdit
    Left = 195
    Top = 32
    Width = 71
    Height = 21
    AutoSize = False
    EditMask = '!99/99/##00;1;_'
    MaxLength = 10
    TabOrder = 1
    Text = '  /  /    '
  end
  object MEHistoricoMov: TMaskEdit
    Left = 16
    Top = 80
    Width = 57
    Height = 21
    AutoSize = False
    TabOrder = 2
    OnExit = MEHistoricoMovExit
  end
  object EdHistoricoMov: TEdit
    Left = 100
    Top = 80
    Width = 179
    Height = 21
    TabStop = False
    AutoSize = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 8
  end
  object RGTipoMov: TRadioGroup
    Left = 383
    Top = 18
    Width = 91
    Height = 84
    Caption = 'Tipo Movimento'
    Items.Strings = (
      'Baixa'
      'Rendimento')
    TabOrder = 4
    TabStop = True
  end
end
