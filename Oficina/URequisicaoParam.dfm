inherited FRequisicaoParam: TFRequisicaoParam
  Left = 315
  Top = 129
  Width = 417
  Height = 425
  Caption = 'Par'#226'metros para Relat'#243'rios'
  PixelsPerInch = 96
  TextHeight = 14
  inherited PGRelatorio: TPageControl
    Width = 409
    Height = 309
    ActivePage = TabSheet1
    Anchors = [akLeft, akTop, akRight, akBottom]
    object TabSheet1: TTabSheet
      Caption = 'Movimenta'#231#227'o de Produtos'
      inline FmProduto1: TFmProduto
        Left = 16
        Top = 72
        Width = 265
        Height = 41
        TabOrder = 1
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
      inline FmDatas1: TFmDatas
        Left = 8
        Top = 120
        Width = 209
        Height = 81
        TabOrder = 2
        inherited GroupBox1: TGroupBox
          Width = 177
          Height = 65
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
      inline FmFilial1: TFmFilial
        Left = 16
        Top = 24
        Width = 265
        Height = 41
        TabOrder = 0
        inherited Label1: TLabel
          Height = 14
        end
        inherited MeFilial: TMaskEdit
          Height = 22
        end
        inherited EdFilial: TEdit
          Height = 22
        end
      end
    end
  end
  inherited BtOk: TBitBtn
    Left = 221
    Top = 356
    Anchors = [akRight, akBottom]
  end
  inherited BtCancela: TBitBtn
    Left = 317
    Top = 356
    Anchors = [akRight, akBottom]
  end
  inherited RGPreview: TRadioGroup
    Top = 324
    Anchors = [akLeft, akBottom]
  end
end
