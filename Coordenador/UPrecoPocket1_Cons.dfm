inherited FPrecoPocket1_Cons: TFPrecoPocket1_Cons
  Left = 351
  Top = 246
  Width = 478
  Height = 392
  Caption = 'Consulta Tabela de Pre'#231'os'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Width = 62
    Caption = 'Nome Tabela'
  end
  inherited BtOk: TBitBtn
    Left = 96
    Top = 328
  end
  inherited BtCancela: TBitBtn
    Left = 256
    Top = 328
  end
  inherited BtProcurar: TBitBtn
    Left = 376
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Width = 201
  end
  inherited DBGrid1: TDBGrid
    Top = 54
    Width = 449
    Height = 265
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_TABELA_POCKET'
        Title.Caption = 'Tabela'
        Width = 58
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
    DataSet = DMPrecoPocket1.QPrecoPocket_Cons
    Left = 344
  end
end
