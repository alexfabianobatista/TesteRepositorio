inherited FComissaoCons: TFComissaoCons
  Caption = 'Consulta de Comiss'#245'es'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Width = 49
    Caption = 'Descri'#231#227'o'
  end
  inherited BtProcurar: TBitBtn
    OnClick = BtProcurarClick
  end
  inherited DBGrid1: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_COMISSAO'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_COMISSAO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 238
        Visible = True
      end>
  end
  inherited DSConsulta: TDataSource
    DataSet = DMComissao.QComissaoCons
  end
end
