inherited FFormaRecebimentoCons: TFFormaRecebimentoCons
  Left = 537
  Top = 155
  Width = 478
  Height = 332
  Caption = 'Consulta de Formas de Recebimento'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Width = 49
    Caption = 'Descri'#231#227'o'
  end
  inherited BtOk: TBitBtn
    Left = 372
    Top = 264
  end
  inherited BtCancela: TBitBtn
    Left = 276
    Top = 264
  end
  inherited BtProcurar: TBitBtn
    Left = 377
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Width = 321
  end
  inherited DBGrid1: TDBGrid
    Width = 454
    Height = 199
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_FORMA_RECEBIMENTO'
        Title.Alignment = taRightJustify
        Title.Caption = 'C'#243'digo'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_FORMA_RECEBIMENTO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 292
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_EXIGIR_BANCO'
        Title.Caption = 'Dados banco'
        Visible = False
      end>
  end
  inherited DSConsulta: TDataSource
    DataSet = DmFormaRecebimento.QFormaRecebimentoCons
  end
end
