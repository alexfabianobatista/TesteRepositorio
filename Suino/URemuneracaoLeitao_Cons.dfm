inherited FRemuneracaoLeitao_Cons: TFRemuneracaoLeitao_Cons
  Left = 314
  Top = 213
  Width = 726
  Height = 321
  Caption = 'Consulta Remunera'#231#227'o Leit'#227'o'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Visible = False
  end
  inherited BtOk: TBitBtn
    Left = 620
    Top = 267
  end
  inherited BtCancela: TBitBtn
    Left = 532
    Top = 267
  end
  inherited BtProcurar: TBitBtn
    Left = 621
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Visible = False
  end
  inherited DBGrid1: TDBGrid
    Width = 694
    Height = 196
    Columns = <
      item
        Expanded = False
        FieldName = 'DESC_TIPO_PARCERIA'
        Title.Caption = 'Tipo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QT_PESO_REFERENCIA'
        Title.Caption = 'Peso Refer'#234'ncia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QT_INCREMENTO_REFERENCIA'
        Title.Caption = 'Incremento Refer'#234'ncia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_PESO_REFERENCIA'
        Title.Caption = 'Vl. Peso Refer'#234'ncia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_INCREMENTO_REFERENCIA'
        Title.Caption = 'Vl. Incremento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QT_CONVERSAO_REFERENICIA'
        Title.Caption = 'Qt.Convers'#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QT_CONVERSAO_INCREMENTO'
        Title.Caption = 'Qt. Incremento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_CONVERSAO_INCREMENTO'
        Title.Caption = 'Vl. Incremento'
        Visible = True
      end>
  end
  inherited DSConsulta: TDataSource
    DataSet = DMRemuneracaoLeitao.QRemuneracaoLeitao_Cons
  end
end
