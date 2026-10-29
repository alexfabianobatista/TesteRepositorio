object FTitulosFaturamento: TFTitulosFaturamento
  Left = 339
  Top = 184
  Width = 968
  Height = 623
  Caption = 'Sele'#231#227'o de T'#237'tulos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 952
    Height = 584
    Align = alClient
    TabOrder = 0
    DesignSize = (
      952
      584)
    inline FmFilial: TFmFilial
      Left = 16
      Top = 8
      Width = 417
      Height = 37
      TabOrder = 0
      inherited BtFilial: TBitBtn
        OnClick = FmFilialBtFilialClick
      end
      inherited EdFilial: TEdit
        Width = 341
      end
    end
    inline FmCadastro: TFmCadastro
      Left = 16
      Top = 56
      Width = 417
      Height = 37
      TabOrder = 1
      inherited BtCadastro: TBitBtn
        OnClick = FmCadastroBtCadastroClick
      end
      inherited EdCadastro: TEdit
        Width = 341
      end
    end
    inline FmDatasRef: TFmDatas
      Left = 465
      Top = 20
      Width = 185
      Height = 69
      TabOrder = 2
      inherited GroupBox1: TGroupBox
        Height = 65
      end
    end
    object Button1: TButton
      Left = 656
      Top = 64
      Width = 89
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 3
      OnClick = Button1Click
    end
    object DBGrid1: TDBGrid
      Left = 16
      Top = 104
      Width = 905
      Height = 214
      Anchors = [akLeft, akTop, akRight]
      DataSource = DSTitulosFaturamento
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = DBGrid1CellClick
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnMouseMove = DBGrid1MouseMove
      Columns = <
        item
          Expanded = False
          FieldName = 'X'
          Width = 16
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_NOTA_CAB'
          Title.Caption = 'Cod. Nota'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_FILIAL'
          Title.Caption = 'Filial'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_CADASTRO'
          Title.Caption = 'Cliente'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUM_NOTA'
          Title.Caption = 'Num. T'#237'tulo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_EMISSAO'
          Title.Caption = 'Emiss'#227'o'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_SERIE'
          Title.Caption = 'S'#233'rie'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IND_CONDICAO_PAGTO'
          Title.Caption = 'Condi'#231#227'o Pagto'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTD_ITENS'
          Title.Caption = 'Qtd. Itens'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_TOTAL'
          Title.Caption = 'Total'
          Visible = True
        end>
    end
    inline FmSerie: TFmSerie
      Left = 667
      Top = 22
      Width = 265
      Height = 37
      TabOrder = 5
      inherited BtSerie: TBitBtn
        OnClick = FmSerieBtSerieClick
      end
    end
    object Button2: TButton
      Left = 560
      Top = 528
      Width = 169
      Height = 41
      Anchors = [akLeft, akBottom]
      Caption = 'Gerar T'#237'tulo'
      TabOrder = 6
    end
    object DBGrid2: TDBGrid
      Left = 16
      Top = 325
      Width = 849
      Height = 201
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = DSItens
      TabOrder = 7
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ROWNUM'
          Width = 33
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_NOTA_ITEM'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_PRODUTO'
          Title.Caption = 'C'#243'd. Produto'
          Width = 73
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESC_PRODUTO'
          Width = 359
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QT_QUANTIDADE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VAL_UNITARIO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VAL_TOTAL'
          Visible = True
        end>
    end
  end
  object DSTitulosFaturamento: TDataSource
    DataSet = DMNotaSaida.QTituloFaturamento
    Left = 416
    Top = 544
  end
  object DSItens: TDataSource
    DataSet = DMNotaSaida.QTituloFaturamentoItens
    Left = 456
    Top = 544
  end
end
