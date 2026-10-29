inherited FGeneroProdutoCad: TFGeneroProdutoCad
  Left = 300
  Top = 223
  Caption = 'Cadastro de G'#234'neros de Produtos'
  ClientHeight = 176
  ClientWidth = 531
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel [0]
    Left = 16
    Top = 56
    Width = 33
    Height = 14
    Caption = 'C'#243'digo'
    FocusControl = DBEdit1
  end
  object Label2: TLabel [1]
    Left = 16
    Top = 96
    Width = 49
    Height = 14
    Caption = 'Descri'#231#227'o'
    FocusControl = DBEdit2
  end
  inherited Panel1: TPanel
    Width = 531
    inherited SBConsulta: TSpeedButton
      Left = 496
    end
    inherited lbPesquisaCodigo: TLabel
      Left = 392
    end
    inherited MELocaliza: TMaskEdit
      Left = 448
    end
    inherited pnSeparador2: TPanel
      Left = 380
    end
  end
  object DBEdit1: TDBEdit [4]
    Left = 16
    Top = 72
    Width = 64
    Height = 22
    TabStop = False
    Color = clBtnFace
    DataField = 'COD_GENERO_PRODUTO'
    DataSource = DSPrimario
    ReadOnly = True
    TabOrder = 2
  end
  object DBEdit2: TDBEdit [5]
    Left = 16
    Top = 112
    Width = 497
    Height = 22
    DataField = 'DESC_GENERO_PRODUTO'
    DataSource = DSPrimario
    TabOrder = 3
  end
  inherited StBLongHint: TStatusBar
    Top = 157
    Width = 531
  end
  inherited DSPrimario: TDataSource
    DataSet = DMProduto.QGeneroProduto
  end
end
