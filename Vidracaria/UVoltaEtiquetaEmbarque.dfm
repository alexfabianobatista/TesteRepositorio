object FVoltaEtiquetaEmbarque: TFVoltaEtiquetaEmbarque
  Left = 298
  Top = 158
  Width = 354
  Height = 179
  Caption = 'Volta Etiqueta Embarque'
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
    Left = 4
    Top = 56
    Width = 39
    Height = 13
    Caption = 'Etiqueta'
  end
  object Label2: TLabel
    Left = 99
    Top = 56
    Width = 37
    Height = 13
    Caption = 'Produto'
  end
  object MEVoltaEtiqueta: TMaskEdit
    Left = 1
    Top = 74
    Width = 94
    Height = 21
    TabOrder = 0
    OnExit = MEVoltaEtiquetaExit
  end
  object EdVoltaEtiqueta: TEdit
    Left = 96
    Top = 74
    Width = 236
    Height = 21
    TabStop = False
    AutoSize = False
    Color = clBtnFace
    TabOrder = 1
    Text = 'Informe a Etiqueta do Produto'
  end
  object BitBtn1: TBitBtn
    Left = 176
    Top = 120
    Width = 75
    Height = 25
    Caption = '&Sair'
    TabOrder = 2
    TabStop = False
    Kind = bkClose
  end
  object Button1: TButton
    Left = 72
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Confirma'
    TabOrder = 3
    OnClick = Button1Click
  end
  object RadioGroup1: TRadioGroup
    Left = 5
    Top = 8
    Width = 328
    Height = 41
    Caption = 'Escolha uma op'#231#227'o'
    Columns = 2
    Items.Strings = (
      'Voltar Embarque'
      'Voltar 1 Produto')
    TabOrder = 4
    OnClick = RadioGroup1Click
  end
end
