inherited FGraficoParam: TFGraficoParam
  Left = 318
  Top = 222
  Height = 286
  Caption = 'FGraficoParam'
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 14
  inherited PGRelatorio: TPageControl
    Width = 393
    ActivePage = TabSheet1
    object TabSheet1: TTabSheet
      Caption = 'Vendas Vendedor'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 8
        Width = 241
        Height = 153
        DataSource = DMGrafico.DSVendedorCons
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Arial'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NOME'
            Visible = True
          end>
      end
      object BitBtn1: TBitBtn
        Left = 256
        Top = 136
        Width = 75
        Height = 25
        Caption = 'BitBtn1'
        TabOrder = 1
        OnClick = BitBtn1Click
      end
    end
  end
  inherited BtOk: TBitBtn
    Top = 216
  end
  inherited BtCancela: TBitBtn
    Top = 216
  end
end
