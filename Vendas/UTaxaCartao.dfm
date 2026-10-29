object FTaxaCartao: TFTaxaCartao
  Left = 582
  Top = 168
  Width = 220
  Height = 287
  Caption = 'Calculo de taxa de pagamento no cart'#227'o'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  DesignSize = (
    204
    248)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 205
    Height = 249
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    DesignSize = (
      205
      249)
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 24
      Height = 13
      Caption = 'Taxa'
    end
    object Label2: TLabel
      Left = 16
      Top = 96
      Width = 41
      Height = 13
      Caption = 'Parcelas'
    end
    object Label3: TLabel
      Left = 16
      Top = 136
      Width = 24
      Height = 13
      Caption = 'Valor'
    end
    object Label4: TLabel
      Left = 16
      Top = 192
      Width = 54
      Height = 13
      Caption = 'Parcelas:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbPorParcela: TLabel
      Left = 88
      Top = 192
      Width = 35
      Height = 13
      Caption = 'R$0,00'
    end
    object Label5: TLabel
      Left = 16
      Top = 56
      Width = 80
      Height = 13
      Caption = 'Taxa por parcela'
    end
    object Label7: TLabel
      Left = 16
      Top = 208
      Width = 63
      Height = 13
      Caption = 'Valor total:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbTotal: TLabel
      Left = 88
      Top = 208
      Width = 35
      Height = 13
      Caption = 'R$0,00'
    end
    object METaxa: TMaskEdit
      Left = 16
      Top = 32
      Width = 160
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Enabled = False
      TabOrder = 0
      Text = '0'
    end
    object MEParcelas: TMaskEdit
      Left = 16
      Top = 112
      Width = 160
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Text = '0'
      OnExit = MEParcelasExit
    end
    object MEValor: TMaskEdit
      Left = 16
      Top = 152
      Width = 160
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      Text = '0'
      OnExit = MEValorExit
    end
    object METaxaParcela: TMaskEdit
      Left = 16
      Top = 72
      Width = 160
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Enabled = False
      TabOrder = 1
      Text = '0'
    end
  end
end
