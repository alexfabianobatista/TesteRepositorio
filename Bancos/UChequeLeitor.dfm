object FChequeLeitor: TFChequeLeitor
  Left = 392
  Top = 238
  Width = 219
  Height = 141
  Caption = 'Leitor de Cheque'
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
    Left = 8
    Top = 8
    Width = 122
    Height = 13
    Caption = 'Passe o Cheque no Leitor'
  end
  object MeChequeLeitor: TMaskEdit
    Left = 8
    Top = 27
    Width = 185
    Height = 21
    TabOrder = 0
  end
  object BtConfirmar: TBitBtn
    Left = 64
    Top = 71
    Width = 75
    Height = 25
    Caption = 'Confirmar'
    ModalResult = 1
    TabOrder = 1
  end
end
