object FFinanciamentoParcelas: TFFinanciamentoParcelas
  Left = 516
  Top = 113
  Width = 373
  Height = 321
  Caption = 'Gerar Parcelas do Financiamento'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  DesignSize = (
    365
    294)
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 192
    Top = 8
    Width = 88
    Height = 13
    Caption = 'Valor das Parcelas'
  end
  object Label5: TLabel
    Left = 112
    Top = 8
    Width = 70
    Height = 13
    Caption = 'N. de Parcelas'
  end
  object Label2: TLabel
    Left = 8
    Top = 8
    Width = 96
    Height = 13
    Caption = 'Primeiro Vencimento'
  end
  object MENumParcelas: TMaskEdit
    Left = 112
    Top = 24
    Width = 73
    Height = 21
    EditMask = '9999;0;_'
    MaxLength = 4
    TabOrder = 1
  end
  object MEValParcelas: TMaskEdit
    Left = 192
    Top = 24
    Width = 88
    Height = 21
    TabOrder = 2
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 56
    Width = 353
    Height = 201
    DataSource = DSParcelas
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DT_VENCIMENTO'
        Title.Caption = 'Data de Vencimento'
        Width = 127
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_PARCELA'
        Title.Caption = 'Valor da Parcela'
        Width = 115
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 288
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Simular'
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object MEPrimeiroVencimento: TMaskEdit
    Left = 8
    Top = 24
    Width = 87
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 0
    Text = '  /  /    '
  end
  object BtOk: TBitBtn
    Left = 272
    Top = 263
    Width = 85
    Height = 25
    Anchors = [akRight, akBottom]
    TabOrder = 6
    Kind = bkOK
  end
  object BtCancela: TBitBtn
    Left = 184
    Top = 263
    Width = 85
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cancelar'
    TabOrder = 5
    Kind = bkCancel
  end
  object DSParcelas: TDataSource
    DataSet = DMFinanciamento.CDSGerarParcelas
    Left = 296
    Top = 224
  end
end
