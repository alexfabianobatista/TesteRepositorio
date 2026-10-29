object FBaixaSemEmbarque: TFBaixaSemEmbarque
  Left = 293
  Top = 103
  Width = 594
  Height = 190
  Caption = 'Baixa Sem Embarque'
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
    Left = 256
    Top = 8
    Width = 24
    Height = 13
    Caption = 'Peso'
  end
  object Label2: TLabel
    Left = 16
    Top = 80
    Width = 37
    Height = 13
    Caption = 'Produto'
  end
  object EdCodBarra: TEdit
    Left = 16
    Top = 30
    Width = 217
    Height = 45
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -35
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnChange = EdCodBarraChange
  end
  object EdProduto: TEdit
    Left = 8
    Top = 96
    Width = 561
    Height = 45
    TabStop = False
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -35
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
  end
  object EdPeso: TEdit
    Left = 256
    Top = 30
    Width = 209
    Height = 45
    TabStop = False
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -35
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
end
