inherited FContagemEstoqueCodBarra: TFContagemEstoqueCodBarra
  Left = 354
  Top = 73
  Caption = 'Contagem de Estoque com C'#243'digo de Barras'
  ClientHeight = 552
  ClientWidth = 831
  PixelsPerInch = 96
  TextHeight = 14
  inherited SBHelp: TSpeedButton
    Left = 432
    Top = 208
  end
  object Label1: TLabel [1]
    Left = 16
    Top = 48
    Width = 84
    Height = 14
    Caption = 'C'#243'digo de Barras'
  end
  object Label2: TLabel [2]
    Left = 200
    Top = 48
    Width = 148
    Height = 14
    Caption = 'Retirar 1 unidade da Contagem'
  end
  inherited Panel1: TPanel
    Width = 831
    Visible = False
    inherited lbPesquisaCodigo: TLabel
      Left = 689
    end
    inherited SBConsulta: TSpeedButton
      Left = 796
    end
    inherited pnSeparador2: TPanel
      Left = 680
    end
    inherited MELocaliza: TMaskEdit
      Left = 747
    end
  end
  inherited StBLongHint: TStatusBar
    Top = 533
    Width = 831
  end
  object DBGrid1: TDBGrid [5]
    Left = 16
    Top = 96
    Width = 793
    Height = 433
    DataSource = DSPrimario
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_CONTAGEM_ESTOQUE_CODBARRA'
        Title.Caption = 'Sequ'#234'ncia'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_PRODUTO'
        Title.Caption = 'Produto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_LOTE_TIPO'
        Title.Caption = 'Lote'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_PRODUTO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 400
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QT_QUANTIDADE'
        Title.Caption = 'Estoque Contagem'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QT_ESTOQUE_ATUAL'
        Title.Caption = 'Estoque Atual'
        Visible = True
      end>
  end
  object MECodBarra: TMaskEdit [6]
    Left = 16
    Top = 64
    Width = 121
    Height = 22
    TabOrder = 3
    OnExit = MECodBarraExit
  end
  object MERetira: TMaskEdit [7]
    Left = 200
    Top = 64
    Width = 121
    Height = 22
    TabOrder = 4
    OnExit = MERetiraExit
  end
  inherited MMCadSimples: TMainMenu
    Left = 741
    inherited Manuteno1: TMenuItem
      Visible = False
    end
    inherited Relatrios1: TMenuItem
      object ContagemdeEstoqueporCdigodeBarras1: TMenuItem
        Caption = 'Contagem Estoque C'#243'd. Barras'
        OnClick = ContagemdeEstoqueporCdigodeBarras1Click
      end
    end
    object Opes1: TMenuItem
      Caption = 'Op'#231#245'es'
      Enabled = False
      object ImplantarContagem1: TMenuItem
        Caption = 'Implantar Contagem Total'
        Hint = 'Zera todos os itens do estoque e implanta a  contagem'
        OnClick = ImplantarContagem1Click
      end
      object ZerarContagem1: TMenuItem
        Caption = 'Zerar Contagem'
        OnClick = ZerarContagem1Click
      end
      object ImplantarContagemParcial1: TMenuItem
        Caption = 'Implantar Contagem Parcial'
        Hint = 'Zera somente os itens da contagem e implanta a contagem'
        OnClick = ImplantarContagemParcial1Click
      end
    end
  end
  inherited DSPrimario: TDataSource
    DataSet = DMEstoque.QContagemEstoque
    Left = 655
  end
  inherited ILBotao: TImageList
    Left = 684
  end
  inherited ALCadastro: TActionList
    Left = 710
  end
  inherited IdHTTP1: TIdHTTP
    Left = 769
  end
end
