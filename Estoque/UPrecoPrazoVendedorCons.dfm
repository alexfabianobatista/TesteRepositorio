inherited FPrecoPrazoVendedorCons: TFPrecoPrazoVendedorCons
  Left = 362
  Top = 132
  Width = 798
  Height = 431
  Caption = 'Consuta Pre'#231'o / Prazo / Vendedor'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Left = 648
    Visible = False
  end
  inherited BtOk: TBitBtn
    Left = 688
    Top = 364
    TabOrder = 4
  end
  inherited BtCancela: TBitBtn
    Left = 600
    Top = 364
    TabOrder = 5
  end
  inherited BtProcurar: TBitBtn
    Left = 693
    TabOrder = 2
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Left = 648
    Width = 41
    Visible = False
  end
  inherited DBGrid1: TDBGrid
    Width = 766
    Height = 303
    TabOrder = 3
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_PRECO_PRAZO_VENDEDOR'
        Title.Caption = 'C'#243'digo'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_PRODUTO'
        Title.Caption = 'Produto'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_PRAZO_VENCIMENTO'
        Title.Caption = 'Prazo'
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_ESTADO'
        Title.Caption = 'Estado'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_PRODUTO'
        Title.Caption = 'Pre'#231'o'
        Width = 80
        Visible = True
      end>
  end
  inline FmProduto1: TFmProduto [6]
    Left = 8
    Top = 8
    Width = 265
    Height = 37
    TabOrder = 1
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
  inline FmEstado1: TFmEstado [7]
    Left = 280
    Top = 8
    Width = 265
    Height = 37
    TabOrder = 6
    inherited Label1: TLabel
      Height = 14
    end
    inherited MeEstado: TMaskEdit
      Height = 22
    end
    inherited EdEstado: TEdit
      Height = 22
    end
  end
  inherited DSConsulta: TDataSource
    DataSet = DMPrecoPrazoVendedor.QPrecoPrazoVendedorCons
  end
end
