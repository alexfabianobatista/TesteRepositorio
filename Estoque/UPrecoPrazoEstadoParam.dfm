inherited FPrecoPrazoEstadoParam: TFPrecoPrazoEstadoParam
  Left = 513
  Top = 188
  Height = 360
  Caption = 'Par'#226'metros'
  PixelsPerInch = 96
  TextHeight = 14
  inherited PGRelatorio: TPageControl
    Height = 244
    ActivePage = TabSheet1
    object TabSheet1: TTabSheet
      Caption = 'Reajuste de Pre'#231'o'
      object Label1: TLabel
        Left = 8
        Top = 130
        Width = 70
        Height = 14
        Caption = '% de Reajuste'
      end
      inline FmProduto1: TFmProduto
        Left = 8
        Top = 8
        Width = 369
        Height = 37
        TabOrder = 0
        inherited Label1: TLabel
          Height = 14
        end
        inherited MeProduto: TMaskEdit
          Height = 22
        end
        inherited EdProduto: TEdit
          Width = 293
          Height = 22
        end
      end
      inline FmEstado1: TFmEstado
        Left = 8
        Top = 48
        Width = 369
        Height = 37
        TabOrder = 1
        inherited Label1: TLabel
          Height = 14
        end
        inherited MeEstado: TMaskEdit
          Height = 22
        end
        inherited EdEstado: TEdit
          Width = 293
          Height = 22
        end
      end
      object RGReajuste: TRadioGroup
        Left = 267
        Top = 128
        Width = 110
        Height = 57
        BiDiMode = bdLeftToRight
        ItemIndex = 0
        Items.Strings = (
          'Para mais'
          'Para menos')
        ParentBiDiMode = False
        TabOrder = 2
      end
      object MePercentual: TMaskEdit
        Left = 8
        Top = 145
        Width = 68
        Height = 22
        TabOrder = 3
        OnExit = MePercentualExit
      end
    end
  end
  inherited BtOk: TBitBtn
    Top = 291
  end
  inherited BtCancela: TBitBtn
    Top = 291
    TabOrder = 3
  end
  inherited RGPreview: TRadioGroup
    Top = 259
    TabOrder = 4
  end
  inline FMPrazoVencimento1: TFMPrazoVencimento
    Left = 12
    Top = 111
    Width = 369
    Height = 37
    TabOrder = 2
    inherited Label1: TLabel
      Width = 28
      Height = 14
    end
    inherited MePrazoVencimento: TMaskEdit
      Height = 22
    end
    inherited EdPrazoVencimento: TEdit
      Width = 293
      Height = 22
    end
  end
end
