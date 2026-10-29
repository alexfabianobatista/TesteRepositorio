inherited FPecaRetornoParam: TFPecaRetornoParam
  Height = 441
  Caption = 'Relat'#243'rios'
  PixelsPerInch = 96
  TextHeight = 14
  inherited PGRelatorio: TPageControl
    Height = 325
    ActivePage = TabSheet1
    object TabSheet1: TTabSheet
      Caption = 'Relat'#243'rio de Pe'#231'as de Retorno'
      inline Fm0Data: TFmDatas
        Left = 16
        Top = 224
        Width = 178
        Height = 60
        TabOrder = 1
        inherited GroupBox1: TGroupBox
          Top = -1
          Height = 61
          Caption = 'Data'
          inherited Label1: TLabel
            Width = 26
            Height = 14
          end
          inherited Label2: TLabel
            Height = 14
          end
          inherited MeDtInicial: TMaskEdit
            Height = 22
          end
          inherited MeDtFinal: TMaskEdit
            Height = 22
          end
        end
      end
      inline Fm0Produto: TFmProduto
        Left = 16
        Top = 16
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
      inline Fm0Cadastro: TFmCadastro
        Left = 16
        Top = 64
        Width = 265
        Height = 37
        TabOrder = 2
        inherited Label1: TLabel
          Width = 44
          Height = 14
        end
        inherited MeCadastro: TMaskEdit
          Height = 22
        end
        inherited EdCadastro: TEdit
          Height = 22
        end
      end
      inline Fm0Regiao: TFmRegiao
        Left = 16
        Top = 112
        Width = 265
        Height = 37
        TabOrder = 3
        inherited Label1: TLabel
          Width = 33
          Height = 14
        end
        inherited MeRegiao: TMaskEdit
          Height = 22
        end
        inherited EdRegiao: TEdit
          Height = 22
        end
      end
    end
  end
  inherited BtOk: TBitBtn
    Top = 372
  end
  inherited BtCancela: TBitBtn
    Top = 372
  end
  inherited RGPreview: TRadioGroup
    Top = 340
  end
  object RGSituacaoPeca: TRadioGroup
    Left = 19
    Top = 183
    Width = 268
    Height = 57
    Caption = 'Situa'#231#227'o da Pe'#231'a'
    Columns = 3
    ItemIndex = 2
    Items.Strings = (
      'Retornar'
      'Devolvida'
      'Todos')
    TabOrder = 4
  end
end
