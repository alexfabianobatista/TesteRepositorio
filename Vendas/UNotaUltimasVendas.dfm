object FNotaUltimasVendas: TFNotaUltimasVendas
  Left = 312
  Top = 159
  Width = 702
  Height = 330
  Caption = 'Ultimas Vendas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    686
    292)
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 691
    Height = 217
    Anchors = [akLeft, akTop, akRight]
    DataSource = DSUltimasVendas
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DT_EMISSAO'
        Title.Caption = 'Emiss'#227'o'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_OPERACAO'
        Title.Caption = 'Opera'#231#227'o'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_OPERACAO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 282
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QT_QUANTIDADE'
        Title.Caption = 'Quantidade'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_UNITARIO'
        Title.Caption = 'Vlr. Unit'#225'rio'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_DESCONTO'
        Title.Caption = 'Desconto'
        Width = 82
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 608
    Top = 240
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkOK
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 273
    Width = 686
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object DSUltimasVendas: TDataSource
    DataSet = DMNotaSaida.QUltimasVendas
    Left = 8
    Top = 240
  end
  object ActionList1: TActionList
    Left = 48
    Top = 240
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 49222
      OnExecute = Action1Execute
    end
  end
end
