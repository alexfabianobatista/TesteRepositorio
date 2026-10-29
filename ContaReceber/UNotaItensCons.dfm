inherited FNotaItensCons: TFNotaItensCons
  Left = 384
  Top = 139
  Width = 597
  Height = 450
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
    Width = 47
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
  object Label4: TLabel [3]
    Left = 243
    Top = 9
    Width = 106
    Height = 14
    Caption = 'Observa'#231#245'es da Nota'
  end
  inherited BtOk: TBitBtn
    Left = 185
    Top = 384
  end
  inherited BtCancela: TBitBtn
    Left = 345
    Top = 384
  end
  inherited BtProcurar: TBitBtn
    Left = 33
    Top = 376
    Visible = False
  end
  inherited METexto: TMaskEdit
    Width = 105
    TabStop = False
    ReadOnly = True
  end
  inherited DBGrid1: TDBGrid
    Width = 570
    Height = 313
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
        FieldName = 'NUM_FABRICANTE'
        Title.Caption = 'Num.Fabricante'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DESC_PRODUTO'
        Title.Caption = 'Produto'
        Width = 240
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
        FieldName = 'VAL_UNITARIO'
        Title.Caption = 'Val. Unit'#225'rio'
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
  object MeVendedor: TMaskEdit [9]
    Left = 120
    Top = 24
    Width = 49
    Height = 22
    TabStop = False
    ReadOnly = True
    TabOrder = 5
  end
  object MePagto: TMaskEdit [10]
    Left = 184
    Top = 24
    Width = 49
    Height = 22
    TabStop = False
    ReadOnly = True
    TabOrder = 6
  end
  object DBEdit1: TDBEdit [11]
    Left = 243
    Top = 24
    Width = 334
    Height = 22
    DataField = 'OBS'
    DataSource = DSConsulta
    TabOrder = 7
  end
  inherited DSConsulta: TDataSource
    DataSet = DMNotaSaida.QItemNfCons
    Left = 504
    Top = 376
  end
end
