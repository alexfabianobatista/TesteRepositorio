object FOrdemCompraDadosAdicionais: TFOrdemCompraDadosAdicionais
  Left = 379
  Top = 251
  Width = 322
  Height = 216
  Caption = 'Dados Adicionais'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 51
    Width = 117
    Height = 13
    Caption = 'Condi'#231#227'o de Pagamento'
  end
  object Label2: TLabel
    Left = 0
    Top = 99
    Width = 89
    Height = 13
    Caption = 'Contato Financeiro'
  end
  object Label3: TLabel
    Left = 0
    Top = 4
    Width = 48
    Height = 13
    Caption = 'N'#186' Pedido'
  end
  object MeCondicao: TMaskEdit
    Left = 0
    Top = 67
    Width = 313
    Height = 21
    TabOrder = 0
  end
  object MeContato: TMaskEdit
    Left = 0
    Top = 115
    Width = 313
    Height = 21
    TabOrder = 1
  end
  object BtCancela: TBitBtn
    Left = 165
    Top = 154
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkCancel
  end
  object BtOk: TBitBtn
    Left = 70
    Top = 154
    Width = 75
    Height = 25
    TabOrder = 3
    Kind = bkOK
  end
  object MePedido: TMaskEdit
    Left = 0
    Top = 21
    Width = 121
    Height = 21
    TabOrder = 4
  end
end
