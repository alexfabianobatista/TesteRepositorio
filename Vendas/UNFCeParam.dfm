inherited FNFCeParam: TFNFCeParam
  Left = 526
  Top = 259
  Height = 236
  Caption = 'Informe os Dados do Consumidor'
  PixelsPerInch = 96
  TextHeight = 14
  inherited RGPreview: TRadioGroup [0]
    Top = 135
    Width = 105
    TabOrder = 1
    Visible = False
  end
  inherited PGRelatorio: TPageControl [1]
    Height = 131
    ActivePage = TabSheet1
    object TabSheet1: TTabSheet
      Caption = 'Dados do Consumidor'
      ImageIndex = 1
      object Label1: TLabel
        Left = 10
        Top = 8
        Width = 53
        Height = 14
        Caption = 'CPF / CNPJ'
      end
      object leCGCCPF: TComboBox
        Left = 8
        Top = 24
        Width = 169
        Height = 22
        DropDownCount = 12
        ItemHeight = 14
        TabOrder = 0
        OnExit = leCGCCPFExit
      end
      object leNome: TLabeledEdit
        Left = 8
        Top = 72
        Width = 369
        Height = 22
        CharCase = ecUpperCase
        EditLabel.Width = 27
        EditLabel.Height = 14
        EditLabel.Caption = 'Nome'
        TabOrder = 1
      end
    end
  end
  inherited BtOk: TBitBtn [2]
    Left = 118
    Top = 167
    ModalResult = 0
    TabOrder = 2
    Kind = bkCustom
  end
  inherited BtCancela: TBitBtn [3]
    Left = 199
    Top = 167
    Width = 99
    Caption = 'N'#227'o Informar'
    TabOrder = 3
  end
  object BtAborta: TBitBtn
    Left = 304
    Top = 167
    Width = 89
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Sair'
    ModalResult = 3
    TabOrder = 4
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
      03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
      0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
      0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
      0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
      0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
      0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
      0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
      0333337F777FFFFF7F3333000000000003333377777777777333}
    NumGlyphs = 2
  end
end
