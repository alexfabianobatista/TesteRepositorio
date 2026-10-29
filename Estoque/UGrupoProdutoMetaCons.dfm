inherited FGrupoProdutoMetaCons: TFGrupoProdutoMetaCons
  Left = 387
  Top = 242
  Width = 387
  Height = 328
  Caption = 'Consulta Grupo Produto Meta'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Width = 70
    Caption = 'Grupo Produto'
  end
  inherited BtOk: TBitBtn
    Left = 98
    Top = 267
  end
  inherited BtCancela: TBitBtn
    Left = 218
    Top = 267
  end
  inherited BtProcurar: TBitBtn
    Left = 282
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Text = ''
  end
  inherited DBGrid1: TDBGrid
    Width = 355
    Height = 196
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_GRUPO_PRODUTO_META'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_GRUPO_PRODUTO_META'
        Title.Caption = 'Grupo de Produto'
        Visible = True
      end>
  end
  inherited DSConsulta: TDataSource
    Left = 312
    Top = 264
  end
end
