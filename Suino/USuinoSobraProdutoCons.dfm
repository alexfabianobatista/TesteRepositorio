inherited FSuinoSobraProdutoCons: TFSuinoSobraProdutoCons
  Left = 388
  Top = 284
  Width = 783
  Height = 349
  Caption = 'Consulta de Sobra de Produto'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Visible = False
  end
  object Label2: TLabel [1]
    Left = 280
    Top = 8
    Width = 51
    Height = 14
    Caption = 'Data Inicial'
  end
  object Label3: TLabel [2]
    Left = 352
    Top = 8
    Width = 47
    Height = 14
    Caption = 'Data Final'
  end
  inherited BtOk: TBitBtn
    Left = 677
    Top = 295
  end
  inherited BtCancela: TBitBtn
    Left = 589
    Top = 295
  end
  inherited BtProcurar: TBitBtn
    Left = 670
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Visible = False
  end
  inherited DBGrid1: TDBGrid
    Width = 751
    Height = 224
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_SUINO_SOBRA_PRODUTO'
        Title.Alignment = taRightJustify
        Title.Caption = 'C'#243'digo'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_CADASTRO'
        Title.Alignment = taRightJustify
        Title.Caption = 'Cadastro'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome'
        Width = 148
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_PRODUTO'
        Title.Alignment = taRightJustify
        Title.Caption = 'Produto'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_PRODUTO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 185
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QT_SOBRA'
        Title.Alignment = taRightJustify
        Title.Caption = 'Quantidade'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_CUSTO'
        Title.Alignment = taRightJustify
        Title.Caption = 'Valor Custo'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_SOBRA'
        Title.Caption = 'Data'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_TIPO'
        Title.Caption = 'Tipo'
        Visible = True
      end>
  end
  inline FmProduto: TFmProduto [8]
    Left = 8
    Top = 8
    Width = 265
    Height = 37
    TabOrder = 5
    inherited Label1: TLabel
      Height = 14
    end
    inherited MeProduto: TMaskEdit
      Height = 22
    end
    inherited EdProduto: TEdit
      Height = 22
    end
  end
  object MeDataIni: TMaskEdit [9]
    Left = 280
    Top = 24
    Width = 64
    Height = 22
    EditMask = '!99/99/9999;1;_'
    MaxLength = 10
    TabOrder = 6
    Text = '  /  /    '
  end
  object MeDataFin: TMaskEdit [10]
    Left = 352
    Top = 24
    Width = 65
    Height = 22
    EditMask = '!99/99/9999;1;_'
    MaxLength = 10
    TabOrder = 7
    Text = '  /  /    '
  end
  inherited DSConsulta: TDataSource [11]
    DataSet = DmSuino.QSobraCons
  end
end
