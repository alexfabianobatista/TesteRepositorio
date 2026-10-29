inherited FRegistro60ResumoCons: TFRegistro60ResumoCons
  Width = 390
  Height = 333
  Caption = 'Consulta Registro Tipo 60 Resumo'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Width = 20
    Caption = 'Ano'
  end
  object Label2: TLabel [1]
    Left = 72
    Top = 8
    Width = 20
    Height = 14
    Caption = 'M'#234's'
  end
  inherited BtOk: TBitBtn
    Left = 284
    Top = 268
    TabOrder = 4
  end
  inherited BtCancela: TBitBtn
    Left = 196
    Top = 268
    TabOrder = 5
  end
  inherited BtProcurar: TBitBtn
    Left = 285
    TabOrder = 2
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Width = 57
  end
  inherited DBGrid1: TDBGrid
    Width = 358
    Height = 208
    TabOrder = 3
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_REGISTRO_RESUMO'
        Title.Caption = 'C'#243'digo'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_MES'
        Title.Caption = 'M'#234's'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_ANO'
        Title.Caption = 'Ano'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_PRODUTO'
        Title.Caption = 'Produto'
        Width = 133
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QT_QUANTIDADE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'VAL_PRODUTO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'VAL_BASE_ICMS'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'IND_SITUACAO_TRIBUTARIA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PERC_ALIQUOTA'
        Visible = False
      end>
  end
  object MeMes: TMaskEdit [7]
    Left = 72
    Top = 24
    Width = 49
    Height = 22
    TabOrder = 1
    Text = '01'
  end
  inherited DSConsulta: TDataSource
    DataSet = DMLivroFiscal.QTipo60ResumoCons
  end
end
