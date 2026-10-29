inherited FPragaParam: TFPragaParam
  Height = 449
  Caption = 'Par'#226'metros'
  PixelsPerInch = 96
  TextHeight = 14
  inherited PGRelatorio: TPageControl
    Height = 333
    ActivePage = TabSheet1
    object TabSheet1: TTabSheet
      Caption = 'Receitu'#225'rio e vendas'
      inline Fm0Data: TFmDatas
        Left = 16
        Top = 56
        Width = 178
        Height = 60
        TabOrder = 1
        inherited GroupBox1: TGroupBox
          Caption = 'Datas'
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
      inline Fm0Filial: TFmFilial
        Left = 16
        Top = 16
        Width = 265
        Height = 37
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
    Top = 380
  end
  inherited BtCancela: TBitBtn
    Top = 380
  end
  inherited RGPreview: TRadioGroup
    Top = 348
  end
end
