inherited FBorderoParam: TFBorderoParam
  Left = 486
  Top = 228
  Caption = 'Par'#226'metros'
  PixelsPerInch = 96
  TextHeight = 14
  inherited PGRelatorio: TPageControl
    ActivePage = TabSheet1
    object TabSheet1: TTabSheet
      Caption = 'Relat'#243'rio de Border'#244
      OnShow = TabSheet1Show
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 42
        Height = 14
        Caption = 'Situa'#231#227'o'
      end
      inline FmDatas1: TFmDatas
        Left = 3
        Top = 104
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
      object cbSituacao: TComboBox
        Left = 8
        Top = 24
        Width = 145
        Height = 22
        ItemHeight = 14
        ItemIndex = 1
        TabOrder = 0
        Text = 'FECHADO'
        Items.Strings = (
          'ABERTO'
          'FECHADO')
      end
    end
  end
end
