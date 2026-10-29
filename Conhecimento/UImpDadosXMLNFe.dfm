object FImpDadosXMLNFe: TFImpDadosXMLNFe
  Left = 441
  Top = 262
  Width = 481
  Height = 290
  Caption = 'Importa dados do XML da NF-e'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  DesignSize = (
    465
    251)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 24
    Width = 107
    Height = 13
    Caption = 'Informe o arquivo XML'
  end
  object sbArquivoCons: TSpeedButton
    Left = 405
    Top = 39
    Width = 27
    Height = 22
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
      55555575555555775F55509999999901055557F55555557F75F5001111111101
      105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
      01105777F555557F75F75500FFFFFF0FF0105577F555FF7F57575550FF700008
      8F0055575FF7777555775555000888888F005555777FFFFFFF77555550000000
      0F055555577777777F7F555550FFFFFF0F05555557F5FFF57F7F555550F000FF
      0005555557F777557775555550FFFFFF0555555557F555FF7F55555550FF7000
      05555555575FF777755555555500055555555555557775555555}
    NumGlyphs = 2
    OnClick = sbArquivoConsClick
  end
  object BtOk: TBitBtn
    Left = 272
    Top = 217
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    TabOrder = 0
    Kind = bkOK
  end
  object BtCancela: TBitBtn
    Left = 356
    Top = 217
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    TabOrder = 1
    Kind = bkCancel
  end
  object LBArquivo: TListBox
    Left = 32
    Top = 40
    Width = 369
    Height = 161
    ItemHeight = 13
    TabOrder = 2
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Arquivos XML|*.xml'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Left = 32
    Top = 208
  end
  object XMLDocument1: TXMLDocument
    Left = 64
    Top = 208
    DOMVendorDesc = 'MSXML'
  end
end
