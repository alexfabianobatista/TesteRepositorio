inherited FCondominio_Cons: TFCondominio_Cons
  Left = 335
  Top = 190
  Caption = 'Consulta Condominio'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Width = 49
    Caption = 'Descri'#231#227'o'
  end
  inherited BtOk: TBitBtn
    Top = 236
  end
  inherited BtCancela: TBitBtn
    Top = 236
  end
  inherited BtProcurar: TBitBtn
    OnClick = BtProcurarClick
  end
  inherited DBGrid1: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_CONDOMINIO'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_CONDOMINIO'
        Title.Caption = 'Descri'#231#227'o'
        Visible = True
      end>
  end
  inherited DSConsulta: TDataSource
    DataSet = DMImobiliaria.QCondominio_Cons
  end
end
