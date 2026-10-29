inherited FNotaItensCons: TFNotaItensCons
  Left = 200
  Top = 135
  Width = 572
  Height = 442
  Caption = 'Consulta Itens Nota Fiscal'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Width = 40
    Caption = 'Emiss'#227'o'
  end
  object Label2: TLabel [1]
    Left = 120
    Top = 8
    Width = 48
    Height = 14
    Caption = 'Vendedor'
  end
  object Label3: TLabel [2]
    Left = 184
    Top = 8
    Width = 42
    Height = 14
    Caption = 'Tp.Pagto'
  end
  inherited BtOk: TBitBtn
    Left = 160
    Top = 376
  end
  inherited BtCancela: TBitBtn
    Left = 320
    Top = 376
  end
  inherited BtProcurar: TBitBtn
    Left = 8
    Top = 376
    Visible = False
  end
  inherited METexto: TMaskEdit
    Width = 105
    TabStop = False
    ReadOnly = True
  end
  inherited DBGrid1: TDBGrid
    Width = 545
    Height = 305
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_PRODUTO'
        Title.Caption = 'Produto'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_PRODUTO'
        Title.Caption = 'Produto'
        Width = 267
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QT_QUANTIDADE'
        Title.Caption = 'Quantidade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_TOTAL'
        Title.Caption = 'Vl. Total'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_DESCONTO'
        Title.Caption = 'Vl. Desconto'
        Visible = True
      end>
  end
  object MeVendedor: TMaskEdit [8]
    Left = 120
    Top = 24
    Width = 49
    Height = 22
    TabStop = False
    ReadOnly = True
    TabOrder = 5
  end
  object MePagto: TMaskEdit [9]
    Left = 184
    Top = 24
    Width = 49
    Height = 22
    TabStop = False
    ReadOnly = True
    TabOrder = 6
  end
  inherited DSConsulta: TDataSource
    DataSet = DMNotaSaida.QItemNfCons
    Left = 504
    Top = 376
  end
end
