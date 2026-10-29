inherited FTipoContratoCons: TFTipoContratoCons
  Left = 368
  Top = 149
  Width = 371
  Caption = 'Consulta Tipo Contrato'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Width = 49
    Caption = 'Descri'#231#227'o'
  end
  object lblValorMensal: TLabel [1]
    Left = 144
    Top = 8
    Width = 63
    Height = 14
    Caption = 'Valor Mensal'
  end
  inherited BtProcurar: TBitBtn
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Width = 121
  end
  inherited DBGrid1: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_TIPO_CONTRATO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_TIPO_CONTRATO'
        Width = 166
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_MENSAL'
        Visible = True
      end>
  end
  object MeValorMensal: TMaskEdit [7]
    Left = 144
    Top = 24
    Width = 121
    Height = 22
    TabOrder = 5
  end
  inherited DSConsulta: TDataSource
    DataSet = DMTipoContrato.QTipoContratoCons
    Left = 8
    Top = 240
  end
end
