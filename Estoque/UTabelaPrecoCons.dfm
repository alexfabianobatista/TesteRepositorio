inherited FTabelaPrecoCons: TFTabelaPrecoCons
  Left = 313
  Top = 147
  Width = 923
  Height = 538
  Caption = 'Consulta de Tabela de Pre'#231'os'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Left = 10
    Width = 49
    Caption = 'Descri'#231#227'o'
  end
  object Label2: TLabel [1]
    Left = 10
    Top = 56
    Width = 77
    Height = 14
    Caption = 'Tabela de pre'#231'o'
  end
  object Label3: TLabel [2]
    Left = 416
    Top = 56
    Width = 136
    Height = 14
    Caption = 'Produtos da tabela de pre'#231'o'
  end
  inherited LblNumRegistros: TLabel
    Top = 265
  end
  object LbValorTabelaPreco: TLabel [4]
    Left = 683
    Top = 451
    Width = 129
    Height = 16
    Anchors = [akRight, akBottom]
    Caption = 'LbValorTabelaPreco'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  inherited BtOk: TBitBtn
    Left = 809
    Top = 470
  end
  inherited BtCancela: TBitBtn
    Left = 721
    Top = 470
  end
  inherited BtProcurar: TBitBtn
    Left = 814
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Left = 10
    Text = ''
  end
  object DBGrid2: TDBGrid [9]
    Left = 412
    Top = 72
    Width = 483
    Height = 379
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DsTabelaPrecoItensCons
    TabOrder = 5
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_PRODUTO'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_PRODUTO'
        Title.Caption = 'Desci'#231#227'o'
        Width = 207
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_PRECO'
        Title.Caption = 'Pre'#231'o'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QT_QUANTIDADE'
        Title.Caption = 'Qtd'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'VAL_TOTAL_ITEM'
        Title.Caption = 'Total'
        Visible = False
      end>
  end
  inherited DBGrid1: TDBGrid
    Left = 10
    Top = 72
    Width = 391
    Height = 379
    Anchors = [akLeft, akTop, akBottom]
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_TABELA_PRECO_CAB'
        Title.Caption = 'C'#243'digo'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_TABELA_PRECO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 217
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_SITUACAO'
        Title.Caption = 'Situa'#231#227'o'
        Width = 87
        Visible = True
      end>
  end
  inherited DSConsulta: TDataSource
    DataSet = DMTabelaPreco.QTabelaPrecoCons
    Left = 624
  end
  inherited PopupMenu1: TPopupMenu
    Left = 592
  end
  object DsTabelaPrecoItensCons: TDataSource
    DataSet = DMTabelaPreco.QTabelaPrecoItensCons
    Left = 656
    Top = 8
  end
end
