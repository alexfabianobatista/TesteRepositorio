object FAtualizadataassinatura: TFAtualizadataassinatura
  Left = 553
  Top = 205
  Width = 388
  Height = 202
  Caption = 'FAtualizadataassinatura'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 64
    Top = 18
    Width = 248
    Height = 26
    Caption = 'Atualizar data de vencimento'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 128
    Top = 50
    Width = 128
    Height = 26
    Caption = 'da assinatura ?'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object SBSend: TSpeedButton
    Left = 78
    Top = 129
    Width = 81
    Height = 25
    Caption = 'Enviar'
    OnClick = SBSendClick
  end
  object SBCancel: TSpeedButton
    Left = 208
    Top = 129
    Width = 81
    Height = 25
    Caption = 'Cancelar'
    OnClick = SBCancelClick
  end
  object CBInput: TCheckBox
    Left = 52
    Top = 94
    Width = 97
    Height = 17
    Caption = '6 meses'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = CBInputClick
  end
  object CBInput2: TCheckBox
    Left = 143
    Top = 94
    Width = 97
    Height = 17
    Caption = '1 ano'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = CBInput2Click
  end
  object CBInput3: TCheckBox
    Left = 244
    Top = 94
    Width = 97
    Height = 17
    Caption = '2 anos'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = CBInput3Click
  end
end
