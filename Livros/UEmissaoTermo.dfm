object FEmissaoTermo: TFEmissaoTermo
  Left = 405
  Top = 171
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Emiss'#227'o de Termos de Abertura/Encerramento'
  ClientHeight = 153
  ClientWidth = 353
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyPress = FormKeyPress
  DesignSize = (
    353
    153)
  PixelsPerInch = 96
  TextHeight = 13
  object BtApuracaoIcms: TBitBtn
    Left = 70
    Top = 24
    Width = 209
    Height = 25
    Anchors = [akTop]
    Caption = 'Apura'#231#227'o de ICMS'
    TabOrder = 0
    OnClick = BtApuracaoIcmsClick
  end
  object BtEntrada: TBitBtn
    Left = 70
    Top = 64
    Width = 209
    Height = 25
    Anchors = [akTop]
    Caption = 'Entradas'
    TabOrder = 1
    OnClick = BtEntradaClick
  end
  object BtSaida: TBitBtn
    Left = 70
    Top = 104
    Width = 209
    Height = 25
    Anchors = [akTop]
    Caption = 'Sa'#237'das'
    TabOrder = 2
    OnClick = BtSaidaClick
  end
end
