inherited FPrecoPocketPai_Cons: TFPrecoPocketPai_Cons
  Left = 231
  Top = 192
  Width = 473
  Height = 370
  Caption = 'Consulta Tabela de Pre'#231'os'
  PixelsPerInch = 96
  TextHeight = 14
  inherited BtOk: TBitBtn
    Left = 120
    Top = 304
  end
  inherited BtCancela: TBitBtn
    Left = 280
    Top = 304
  end
  inherited BtProcurar: TBitBtn
    Left = 376
    OnClick = BtProcurarClick
  end
  inherited DBGrid1: TDBGrid
    Width = 449
    Height = 233
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_TABELA_POCKET'
        Title.Caption = 'Cod.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_TABELA'
        Title.Caption = 'Tabela'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_SITUACAO'
        Title.Caption = 'Situa'#231#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_PRAZO_MAXIMO'
        Title.Caption = 'Prazo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PERC_COMISSAO'
        Title.Caption = '%Comiss'#227'o'
        Visible = True
      end>
  end
  inherited DSConsulta: TDataSource
    DataSet = DMPrecoPocket1.QTabelaPocket_Cons
    Left = 328
  end
end
