object FCarregando: TFCarregando
  Left = 533
  Top = 260
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Aguarde'
  ClientHeight = 176
  ClientWidth = 254
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    254
    176)
  PixelsPerInch = 96
  TextHeight = 13
  object LAguarde: TLabel
    Left = 78
    Top = 9
    Width = 99
    Height = 29
    Alignment = taCenter
    Caption = 'Aguarde'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LProcessando: TLabel
    Left = 96
    Top = 49
    Width = 62
    Height = 13
    Alignment = taCenter
    Caption = 'Processando'
  end
  object GProgresso: TGauge
    Left = 7
    Top = 88
    Width = 241
    Height = 20
    Progress = 0
  end
  object LMensagem: TLabel
    Left = 8
    Top = 73
    Width = 241
    Height = 13
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Visible = False
  end
  object BtnCancelar: TBitBtn
    Left = 83
    Top = 120
    Width = 89
    Height = 33
    Caption = 'Cancelar'
    Enabled = False
    TabOrder = 0
    Visible = False
    OnClick = BtnCancelarClick
  end
  object TMensagem: TTimer
    Enabled = False
    OnTimer = TMensagemTimer
    Left = 176
    Top = 40
  end
end
