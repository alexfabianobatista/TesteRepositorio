inherited FAplicacaoFinanceiraMovCons: TFAplicacaoFinanceiraMovCons
  Left = 334
  Top = 188
  Width = 559
  Caption = 'Consulta de Movimento de Aplica'#231#227'o Financeira'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Width = 73
    Caption = 'C'#243'd. Aplica'#231#227'o'
  end
  inherited BtOk: TBitBtn
    Left = 144
  end
  inherited BtCancela: TBitBtn
    Left = 304
  end
  inherited BtProcurar: TBitBtn
    Left = 456
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Width = 81
    TabStop = False
    Color = clWhite
    ReadOnly = True
    Text = ''
  end
  inherited DBGrid1: TDBGrid
    Width = 529
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_APLICACAO_FINANCEIRA_MOV'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_TIPO'
        Title.Caption = 'Tipo Movimento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_MOVIMENTO'
        Title.Caption = 'Valor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_MOVIMENTO'
        Title.Caption = 'Data'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_HISTORICO'
        Title.Caption = 'Hist'#243'rico'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_HISTORICO'
        Title.Caption = 'Descri'#231#227'o'
        Visible = True
      end>
  end
  inherited DSConsulta: TDataSource
    DataSet = DMAplicacaoFinanceira.QAplicacaoFinanceiraMovCons
    Left = 360
    Top = 0
  end
end
