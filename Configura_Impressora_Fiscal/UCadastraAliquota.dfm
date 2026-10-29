object FCadastraAliquota: TFCadastraAliquota
  Left = 534
  Top = 287
  Width = 458
  Height = 237
  Caption = 'Cadastrar al'#237'quota de impressora fiscal Bematech'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 24
    Width = 40
    Height = 13
    Caption = 'Al'#237'quota'
  end
  object MeAliquota: TMaskEdit
    Left = 16
    Top = 40
    Width = 120
    Height = 21
    TabOrder = 0
    OnExit = MeAliquotaExit
  end
  object RGTipo: TRadioGroup
    Left = 16
    Top = 72
    Width = 409
    Height = 65
    Caption = 'Tipo'
    ItemIndex = 0
    Items.Strings = (
      'ICMS'
      'ISS')
    TabOrder = 1
    TabStop = True
  end
  object BtOk: TBitBtn
    Left = 270
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 2
    OnClick = BtOkClick
  end
  object BtCancel: TBitBtn
    Left = 350
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
  end
end
