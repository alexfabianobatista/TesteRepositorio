inherited FReceitaParam: TFReceitaParam
  Left = 433
  Top = 188
  Caption = 'Par'#226'metros para Relat'#243'rios'
  PixelsPerInch = 96
  TextHeight = 14
  inherited PGRelatorio: TPageControl
    ActivePage = TabSheet1
    object TabSheet1: TTabSheet
      Caption = 'Receitas'
      inline FmAgronomo1: TFmAgronomo
        Left = 8
        Top = 16
        Width = 265
        Height = 37
        TabOrder = 0
        inherited Label1: TLabel
          Width = 50
          Height = 14
        end
        inherited MeAgronomo: TMaskEdit
          Height = 22
        end
        inherited EdAgronomo: TEdit
          Height = 22
        end
      end
      inline FmDatas1: TFmDatas
        Left = 8
        Top = 73
        Width = 178
        Height = 60
        TabOrder = 1
        inherited GroupBox1: TGroupBox
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
    end
  end
end
