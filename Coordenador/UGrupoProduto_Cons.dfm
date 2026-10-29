inherited FGrupoProduto_Cons: TFGrupoProduto_Cons
  Left = 314
  Top = 195
  Caption = 'Consulta Grupo Produto'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Width = 20
    Caption = 'Ano'
  end
  object Label2: TLabel [1]
    Left = 80
    Top = 8
    Width = 20
    Height = 14
    Caption = 'M'#234's'
  end
  inherited BtProcurar: TBitBtn
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Width = 59
    EditMask = '####'
    MaxLength = 4
    Text = '    '
  end
  inherited DBGrid1: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_GRUPO_PRODUTO'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_GRUPO_PRODUTO'
        Title.Caption = 'Descri'#231#227'o'
        Visible = True
      end>
  end
  object MeMes: TMaskEdit [7]
    Left = 78
    Top = 24
    Width = 35
    Height = 22
    EditMask = '##'
    MaxLength = 2
    TabOrder = 5
    Text = '  '
  end
  inherited DSConsulta: TDataSource
    DataSet = DMGrupoProduto.QGrupoProduto_Cons
  end
end
