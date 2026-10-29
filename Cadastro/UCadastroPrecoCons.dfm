inherited FCadastroPrecoCons: TFCadastroPrecoCons
  Left = 416
  Top = 212
  Width = 652
  Height = 345
  Caption = 'Consulta de Pre'#231'o de Produtos por Cadastro'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Left = 312
    Visible = False
  end
  inherited BtOk: TBitBtn
    Left = 546
    Top = 284
  end
  inherited BtCancela: TBitBtn
    Left = 458
    Top = 284
  end
  inherited BtProcurar: TBitBtn
    Left = 547
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Left = 312
    Width = 33
    Visible = False
  end
  inherited DBGrid1: TDBGrid
    Width = 620
    Height = 213
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_CADASTRO_PRECO'
        Title.Alignment = taRightJustify
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'COD_CADASTRO'
        Title.Alignment = taRightJustify
        Title.Caption = 'Cadastro'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome'
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_PRODUTO'
        Title.Alignment = taRightJustify
        Title.Caption = 'Produto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_PRODUTO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_PRECO'
        Title.Alignment = taRightJustify
        Title.Caption = 'Pre'#231'o'
        Width = 92
        Visible = True
      end>
  end
  inline FmCadastro: TFmCadastro [6]
    Left = 7
    Top = 11
    Width = 290
    Height = 37
    TabOrder = 5
    inherited Label1: TLabel
      Width = 44
      Height = 14
    end
    inherited MeCadastro: TMaskEdit
      Height = 22
    end
    inherited EdCadastro: TEdit
      Width = 214
      Height = 22
    end
  end
  inherited DSConsulta: TDataSource [7]
    DataSet = DMProduto.QCadastroPrecoCons
  end
end
