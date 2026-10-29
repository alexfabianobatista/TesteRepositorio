inherited FUnidadeDosagemCons: TFUnidadeDosagemCons
  Caption = 'Consulta de unidades de dosagem'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Left = 104
    Width = 49
    Caption = 'Descri'#231#227'o'
  end
  object Label2: TLabel [1]
    Left = 8
    Top = 8
    Width = 33
    Height = 14
    Caption = 'C'#243'digo'
  end
  inherited BtProcurar: TBitBtn
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Left = 104
  end
  inherited DBGrid1: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_UNIDADE_DOSAGEM'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_UNIDADE_DOSAGEM'
        Title.Caption = 'Unidade'
        Width = 254
        Visible = True
      end>
  end
  object MECodigo: TMaskEdit [7]
    Left = 8
    Top = 24
    Width = 81
    Height = 22
    TabOrder = 5
  end
  inherited DSConsulta: TDataSource
    DataSet = DMPraga.QUnidadeDosagemCons
  end
end
