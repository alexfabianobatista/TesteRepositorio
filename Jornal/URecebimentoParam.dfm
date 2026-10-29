inherited FRecebimentoParam: TFRecebimentoParam
  Left = 488
  Top = 228
  Caption = 'Par'#226'metros para relat'#243'rios'
  PixelsPerInch = 96
  TextHeight = 14
  inherited PGRelatorio: TPageControl
    ActivePage = TabSheet1
    object TabSheet1: TTabSheet
      Caption = 'Recebimento de assinantes'
      object Label307: TLabel
        Left = 13
        Top = 85
        Width = 32
        Height = 14
        Caption = 'Ordem'
      end
      inline FmDatas1: TFmDatas
        Left = 12
        Top = 20
        Width = 178
        Height = 60
        TabOrder = 0
        inherited GroupBox1: TGroupBox
          Top = -1
          Caption = 'Data de Vencimento'
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
      object Cb1Ordem: TComboBox
        Left = 14
        Top = 103
        Width = 170
        Height = 22
        ItemHeight = 14
        ItemIndex = 0
        TabOrder = 1
        Text = 'Vendedor'
        Items.Strings = (
          'Vendedor'
          'Data de Vencimento')
      end
    end
  end
end
