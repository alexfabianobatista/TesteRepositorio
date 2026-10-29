inherited FPadraoProdutoCons: TFPadraoProdutoCons
  Left = 397
  Top = 171
  Height = 357
  Caption = 'Consulta Padr'#227'o Produto'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Left = 10
    Width = 49
    Caption = 'Descri'#231#227'o'
  end
  inherited BtOk: TBitBtn
    Left = 82
    Top = 299
  end
  inherited BtCancela: TBitBtn
    Left = 210
    Top = 299
  end
  inherited BtProcurar: TBitBtn
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Left = 10
    Width = 223
    Text = ''
  end
  inherited DBGrid1: TDBGrid
    Left = 10
    Height = 233
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_PADRAO_PRODUTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_PADRAO_PRODUTO'
        Width = 247
        Visible = True
      end>
  end
  inherited DSConsulta: TDataSource
    DataSet = DMPadraoProduto.QPadraoProdutoCons
    Left = 240
    Top = 16
  end
end
