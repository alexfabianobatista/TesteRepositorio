inherited FFinanciamentoCons: TFFinanciamentoCons
  Left = 356
  Top = 146
  Width = 657
  Height = 350
  Caption = 'Consulta de Financiamentos'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Visible = False
  end
  inherited BtOk: TBitBtn
    Left = 551
    Top = 296
  end
  inherited BtCancela: TBitBtn
    Left = 463
    Top = 296
  end
  inherited BtProcurar: TBitBtn
    Left = 552
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Visible = False
  end
  inherited DBGrid1: TDBGrid
    Width = 625
    Height = 225
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_FINANCIAMENTO_CAB'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_BANCO_AGENCIA'
        Title.Caption = 'Banco'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_EMISSAO'
        Title.Caption = 'Dt. Emiss'#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_FINANCIAMENTO'
        Title.Caption = 'Descri'#231#227'o'
        Visible = True
      end>
  end
  inherited DSConsulta: TDataSource
    DataSet = DMFinanciamento.QFinanciamentoCons
  end
end
