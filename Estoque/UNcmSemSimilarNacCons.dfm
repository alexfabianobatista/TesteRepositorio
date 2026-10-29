inherited FNcmSemSimilarNacCons: TFNcmSemSimilarNacCons
  Left = 332
  Top = 277
  Width = 719
  Height = 303
  Caption = 'FNcmSemSimilarNacCons'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Width = 22
    Caption = 'NCM'
  end
  inherited BtOk: TBitBtn
    Left = 613
    Top = 235
  end
  inherited BtCancela: TBitBtn
    Left = 525
    Top = 235
  end
  inherited BtProcurar: TBitBtn
    Left = 614
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Text = ''
  end
  inherited DBGrid1: TDBGrid
    Width = 687
    Height = 169
    Columns = <
      item
        Expanded = False
        FieldName = 'NUM_NCM'
        Title.Caption = 'NCM'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_NCM'
        Title.Caption = 'Descri'#231#227'o'
        Width = -1
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 606
        Visible = True
      end>
  end
  inherited DSConsulta: TDataSource
    DataSet = DMNcm.QNcmSemSimilarNacCons
  end
end
