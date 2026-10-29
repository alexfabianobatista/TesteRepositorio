object FImpressaoEtiqueta: TFImpressaoEtiqueta
  Left = 310
  Top = 179
  Width = 203
  Height = 163
  Caption = 'Impress'#227'o Etiquetas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 16
    Top = 8
    Width = 25
    Height = 13
    Caption = 'Pe'#231'a'
  end
  object Label3: TLabel
    Left = 16
    Top = 49
    Width = 31
    Height = 13
    Caption = 'Chapa'
  end
  object SBImpCalculo: TSpeedButton
    Left = 48
    Top = 96
    Width = 65
    Height = 22
    Caption = 'OK'
    OnClick = SBImpCalculoClick
  end
  object SBImpPeca: TSpeedButton
    Left = 118
    Top = 96
    Width = 23
    Height = 22
    Caption = 'OK'
    OnClick = SBImpPecaClick
  end
  object SBImpChapa: TSpeedButton
    Left = 144
    Top = 96
    Width = 23
    Height = 22
    Caption = 'OK'
    OnClick = SBImpChapaClick
  end
  object MEPeca: TMaskEdit
    Left = 16
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object MeChapa: TMaskEdit
    Left = 16
    Top = 65
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object OpenDialog1: TOpenDialog
    Left = 152
    Top = 24
  end
end
