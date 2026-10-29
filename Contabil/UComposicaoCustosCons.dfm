inherited FComposicaoCustosCons: TFComposicaoCustosCons
  Left = 542
  Top = 289
  Caption = 'Consulta Composi'#231#227'o de Custos'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Width = 80
    Caption = 'Descri'#231#227'o Custo'
  end
  inherited BtProcurar: TBitBtn
    OnClick = BtProcurarClick
  end
  inherited DBGrid1: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_COMPOSICAO_CUSTOS'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_COMPOSICAO_CUSTOS'
        Title.Caption = 'Descri'#231#227'o'
        Width = 600
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_ATIVO'
        Title.Caption = 'Ativo'
        Visible = True
      end>
  end
  inherited DSConsulta: TDataSource
    DataSet = DMComposicaoCustos.QComposicaoCustosCons
  end
end
