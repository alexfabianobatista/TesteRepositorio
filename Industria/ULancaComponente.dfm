object FLancaComponente: TFLancaComponente
  Left = 294
  Top = 208
  Width = 394
  Height = 130
  Caption = 'Lan'#231'amento de Componentes no Estoque'
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
    Left = 290
    Top = 15
    Width = 35
    Height = 13
    Caption = 'Qtdade'
  end
  object SBConfirma: TSpeedButton
    Left = 136
    Top = 72
    Width = 97
    Height = 22
    Caption = 'Confirma'
    OnClick = SBConfirmaClick
  end
  inline FmProduto1: TFmProduto
    Left = 16
    Top = 16
    Width = 265
    Height = 37
    TabOrder = 0
    inherited BtProduto: TBitBtn
      OnClick = FmProduto1BtProdutoClick
    end
  end
  object EdQtdade: TEdit
    Left = 289
    Top = 30
    Width = 48
    Height = 21
    TabOrder = 1
  end
end
