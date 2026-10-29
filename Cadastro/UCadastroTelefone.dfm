object FCadastroTelefone: TFCadastroTelefone
  Left = 423
  Top = 117
  Width = 490
  Height = 436
  Caption = 'Escolha o Cliente'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  DesignSize = (
    482
    409)
  PixelsPerInch = 96
  TextHeight = 13
  object LBCadastroTelefone: TListBox
    Left = 0
    Top = 0
    Width = 482
    Height = 361
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 0
    OnDblClick = LBCadastroTelefoneDblClick
  end
  object BtOk: TBitBtn
    Left = 0
    Top = 360
    Width = 241
    Height = 49
    Anchors = [akLeft, akBottom]
    TabOrder = 1
    Kind = bkOK
  end
  object BtCancel: TBitBtn
    Left = 240
    Top = 360
    Width = 241
    Height = 49
    Anchors = [akRight, akBottom]
    Caption = 'Cancelar'
    TabOrder = 2
    Kind = bkCancel
  end
end
