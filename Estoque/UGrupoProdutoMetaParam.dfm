inherited FGrupoProdutoMetaParam: TFGrupoProdutoMetaParam
  Height = 445
  Caption = 'Par'#226'metros'
  PixelsPerInch = 96
  TextHeight = 14
  inherited PGRelatorio: TPageControl
    Height = 329
    ActivePage = TabSheet1
    object TabSheet1: TTabSheet
      Caption = 'Relat'#243'rio de Grupos de Produtos'
      inline Fm0Produto: TFmProduto
        Left = 16
        Top = 8
        Width = 265
        Height = 37
        TabOrder = 0
        inherited Label1: TLabel
          Height = 14
        end
        inherited MeProduto: TMaskEdit
          Height = 22
        end
        inherited EdProduto: TEdit
          Height = 22
        end
      end
      inline Fm0GrupoProdutoMeta: TFmGrupoProdutoMeta
        Left = 16
        Top = 56
        Width = 265
        Height = 37
        TabOrder = 1
        inherited Label1: TLabel
          Width = 85
          Height = 14
        end
        inherited MeGrupoProdutoMeta: TMaskEdit
          Height = 22
        end
        inherited EdGrupoProdutoMeta: TEdit
          Height = 22
        end
      end
    end
  end
  inherited BtOk: TBitBtn
    Top = 376
  end
  inherited BtCancela: TBitBtn
    Top = 376
  end
  inherited RGPreview: TRadioGroup
    Top = 344
  end
end
