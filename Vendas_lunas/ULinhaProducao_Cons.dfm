inherited FLinhaProducao_Cons: TFLinhaProducao_Cons
  Left = 329
  Top = 186
  Caption = 'Consulta Linha de Produ'#231#227'o'
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
        FieldName = 'COD_LINHA_PRODUCAO'
        Title.Caption = 'C'#243'digo'
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_LINHA_PRODUCAO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 222
        Visible = True
      end>
  end
  inherited DSConsulta: TDataSource
    DataSet = DMLinhaProducao.QLinhaProducaoCons
  end
end
