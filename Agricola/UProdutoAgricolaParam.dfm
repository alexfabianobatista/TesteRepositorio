inherited FProdutoAgricolaParam: TFProdutoAgricolaParam
  Left = 347
  Top = 147
  Width = 410
  Height = 385
  Caption = 'Par'#226'metros de produtos agr'#237'colas'
  PixelsPerInch = 96
  TextHeight = 14
  inherited PGRelatorio: TPageControl
    Width = 402
    Height = 249
  end
  inherited BtOk: TBitBtn
    Top = 312
  end
  inherited BtCancela: TBitBtn
    Top = 312
  end
  inherited RGPreview: TRadioGroup
    Top = 280
  end
  inline Fm0Produto: TFmProduto
    Left = 16
    Top = 24
    Width = 265
    Height = 41
    TabOrder = 4
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
  inline Fm0Tributacao: TFmTributacao
    Left = 16
    Top = 80
    Width = 265
    Height = 41
    TabOrder = 5
    inherited Label1: TLabel
      Left = 0
      Height = 14
    end
    inherited MeTributacao: TMaskEdit
      Height = 22
    end
    inherited EdTributacao: TEdit
      Height = 22
    end
  end
end
