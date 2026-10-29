object FConhecimento_CR: TFConhecimento_CR
  Left = 383
  Top = 138
  Width = 428
  Height = 352
  Caption = 'Conta a Receber'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object LBDtVencimento: TLabel
    Left = 49
    Top = 208
    Width = 73
    Height = 13
    Caption = 'Dt. Vencimento'
  end
  inline FmFinalidade: TFmFinalidade
    Left = 48
    Top = 16
    Width = 321
    Height = 37
    TabOrder = 0
    inherited EdFinalidade: TEdit
      Width = 245
    end
  end
  inline FMBanco: TFMBanco
    Left = 48
    Top = 64
    Width = 321
    Height = 37
    TabOrder = 1
    DesignSize = (
      321
      37)
    inherited EdBanco: TEdit
      Width = 245
    end
  end
  inline FmDepartamento: TFmDepartamento
    Left = 48
    Top = 112
    Width = 321
    Height = 37
    TabOrder = 2
    inherited EdDepartamento: TEdit
      Width = 245
    end
  end
  inline FmContaCorrente: TFmContaCorrente
    Left = 48
    Top = 160
    Width = 321
    Height = 37
    TabOrder = 3
    inherited EdContaCorrente: TEdit
      Width = 244
    end
  end
  object MEDtVencimento: TMaskEdit
    Left = 50
    Top = 224
    Width = 70
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 4
    Text = '  /  /    '
  end
  object BitBtn1: TBitBtn
    Left = 72
    Top = 272
    Width = 129
    Height = 25
    TabOrder = 5
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 208
    Top = 272
    Width = 129
    Height = 25
    TabOrder = 6
    Kind = bkCancel
  end
end
