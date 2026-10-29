inherited FTabelaPrecoCad: TFTabelaPrecoCad
  Left = 372
  Top = 33
  Caption = 'Cadastro de Tabela de Pre'#231'os'
  ClientHeight = 613
  ClientWidth = 654
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 14
  object Label29: TLabel [0]
    Left = 26
    Top = 127
    Width = 42
    Height = 14
    Caption = 'Situa'#231#227'o'
  end
  inherited Panel1: TPanel
    Width = 654
    inherited sbEnviarSMS: TSpeedButton
      Left = 249
    end
    inherited lbPesquisaCodigo: TLabel
      Left = 512
    end
    inherited SBConsulta: TSpeedButton
      Left = 616
    end
    inherited pnSeparador2: TPanel
      Left = 500
    end
    inherited MELocaliza: TMaskEdit
      Left = 568
    end
  end
  object DBPanel1: TDBPanel [3]
    Left = 24
    Top = 48
    Width = 71
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    CodigoTabStop = False
    DataField = 'COD_TABELA_PRECO_CAB'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'COD_TABELA_PRECO_CAB'
    ForeignKey = False
    LCaption = 'C'#243'd.Tabela'
    ReadOnly = True
    Required = False
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object DBPanel2: TDBPanel [4]
    Left = 24
    Top = 88
    Width = 625
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    CodigoTabStop = True
    DataField = 'DESC_TABELA_PRECO'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'DESC_TABELA_PRECO'
    ForeignKey = False
    LCaption = 'Descri'#231#227'o'
    ReadOnly = False
    Required = True
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object DBComboBox3: TDBComboBox [5]
    Left = 25
    Top = 141
    Width = 146
    Height = 22
    Style = csDropDownList
    CharCase = ecUpperCase
    DataField = 'IND_SITUACAO'
    DataSource = DSPrimario
    ItemHeight = 14
    Items.Strings = (
      'ATIVO'
      'DESATIVADO')
    TabOrder = 3
    TabStop = False
  end
  object DBCBloqueiaDesconto: TDBCheckBox [6]
    Left = 178
    Top = 145
    Width = 111
    Height = 17
    Hint = 'N'#227'o permite dar desconto nos itens de pedidos e notas'
    Caption = 'Bloqueia Desconto'
    DataField = 'IND_BLOQUEIA_DESCONTO'
    DataSource = DSPrimario
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    ValueChecked = 'SIM'
    ValueUnchecked = 'NAO'
  end
  inherited StBLongHint: TStatusBar
    Top = 594
    Width = 654
  end
  object GroupBox2: TGroupBox [8]
    Left = 24
    Top = 176
    Width = 625
    Height = 409
    Caption = 'Produtos'
    TabOrder = 7
    DesignSize = (
      625
      409)
    object Label1: TLabel
      Left = 447
      Top = 21
      Width = 28
      Height = 14
      Caption = 'Pre'#231'o'
      FocusControl = DBEPreco
    end
    object LbQuantidade: TLabel
      Left = 537
      Top = 21
      Width = 55
      Height = 14
      Caption = 'Quantidade'
      FocusControl = DBEQuantidade
      Visible = False
    end
    object GroupBox1: TGroupBox
      Left = 514
      Top = 104
      Width = 105
      Height = 289
      Anchors = [akLeft, akTop, akBottom]
      Caption = 'Pre'#231'os'
      TabOrder = 5
      object btnAplicaPercentual: TBitBtn
        Left = 8
        Top = 24
        Width = 89
        Height = 25
        Hint = 'Informar percentual ao pre'#231'o atual do produto'
        Caption = 'Aplicar %'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        OnClick = btnAplicaPercentualClick
      end
      object btnPrecoEstoque: TBitBtn
        Left = 8
        Top = 56
        Width = 89
        Height = 25
        Hint = 'Buscar pre'#231'o atual em estoque'
        Caption = 'Pre'#231'o estoque'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
        OnClick = btnPrecoEstoqueClick
      end
      object btnZerar: TBitBtn
        Left = 8
        Top = 88
        Width = 89
        Height = 25
        Hint = 'Zerar pre'#231'o'
        Caption = 'Zerar'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 2
        OnClick = btnZerarClick
      end
    end
    object DBPCodProduto: TDBPanel
      Left = 86
      Top = 23
      Width = 353
      Height = 37
      BevelOuter = bvNone
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      CodigoTabStop = True
      DataField = 'COD_PRODUTO'
      DataSource = DsTabelaPrecoitem
      DefineByForm = DBPCodProdutoDefineByForm
      fkCache = False
      fkCampo = 'DESC_PRODUTO'
      fkChave = 'COD_PRODUTO'
      fkTabela = 'TB_PRODUTO'
      ForeignKey = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
        55555575555555775F55509999999901055557F55555557F75F5001111111101
        105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
        01105777F555557F75F75500FFFFFF0FF0105577F555FF7F57575550FF700008
        8F0055575FF7777555775555000888888F005555777FFFFFFF77555550000000
        0F055555577777777F7F555550FFFFFF0F05555557F5FFF57F7F555550F000FF
        0005555557F777557775555550FFFFFF0555555557F555FF7F55555550FF7000
        05555555575FF777755555555500055555555555557775555555}
      LCaption = 'Produto'
      OnCodigoChange = DBPCodProdutoCodigoChange
      OnCodigoExit = DBPCodProdutoCodigoExit
      ReadOnly = False
      Required = True
      ValidateOnExit = False
      VisibleComponents = [dbpcCodigo, dbpcBusca, dbpcDescricao]
      WidthCodigo = 20.000000000000000000
    end
    object DBEPreco: TDBEdit
      Left = 444
      Top = 37
      Width = 87
      Height = 22
      DataField = 'VAL_PRECO'
      DataSource = DsTabelaPrecoitem
      TabOrder = 2
      OnKeyPress = DBEPrecoKeyPress
    end
    object DBGItens: TDBGrid
      Left = 16
      Top = 104
      Width = 496
      Height = 289
      TabStop = False
      Anchors = [akLeft, akTop, akBottom]
      DataSource = DsTabelaPrecoitem
      TabOrder = 4
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Arial'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'descricao'
          Title.Caption = 'Produto'
          Width = 306
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VAL_PRECO'
          Title.Caption = 'Pre'#231'o'
          Width = 81
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QT_QUANTIDADE'
          Title.Caption = 'Qtd'
          Visible = False
        end>
    end
    object ONavigator: TOracleNavigator
      Left = 17
      Top = 66
      Width = 260
      Height = 31
      DataSource = DsTabelaPrecoitem
      VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
      Enabled = False
      TabOrder = 3
    end
    object DBPanel3: TDBPanel
      Left = 16
      Top = 24
      Width = 65
      Height = 37
      BevelOuter = bvNone
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      CodigoTabStop = False
      DataField = 'COD_TABELA_PRECO_ITEM'
      DataSource = DsTabelaPrecoitem
      fkCache = False
      fkChave = 'COD_TABELA_PRECO_ITEM'
      ForeignKey = False
      LCaption = 'C'#243'd.Item'
      ReadOnly = True
      Required = False
      ValidateOnExit = False
      WidthCodigo = 20.000000000000000000
    end
    object DBEQuantidade: TDBEdit
      Left = 534
      Top = 37
      Width = 66
      Height = 22
      DataField = 'QT_QUANTIDADE'
      DataSource = DsTabelaPrecoitem
      TabOrder = 6
      Visible = False
      OnKeyPress = DBEPrecoKeyPress
    end
  end
  object btnAplicarPercentualTudo: TBitBtn [9]
    Left = 460
    Top = 136
    Width = 187
    Height = 33
    Caption = 'Aplicar % em toda tabela'
    TabOrder = 5
    OnClick = btnAplicarPercentualTudoClick
    NumGlyphs = 2
  end
  inherited MMCadSimples: TMainMenu
    inherited Relatrios1: TMenuItem
      OnClick = Relatrios1Click
    end
    object Opes1: TMenuItem
      Caption = 'Op'#231#245'es'
      object AjustaPrecoporPercentual: TMenuItem
        Caption = 'Reajustar Tabela de Pre'#231'o'
        OnClick = AjustaPrecoporPercentualClick
      end
    end
  end
  inherited DSPrimario: TDataSource
    DataSet = DMTabelaPreco.QTabelaPrecoCab
  end
  object DsTabelaPrecoitem: TDataSource
    DataSet = DMTabelaPreco.QTabelaPrecoItem
    OnStateChange = DSPrimarioStateChange
    Left = 503
    Top = 48
  end
  object ActionList1: TActionList
    Left = 544
    Top = 48
    object AInsertItens: TAction
      Caption = 'AInsertItens'
      ShortCut = 45
      OnExecute = AInsertItensExecute
    end
    object ADeleteItens: TAction
      Caption = 'ADeleteItens'
      ShortCut = 46
      OnExecute = ADeleteItensExecute
    end
  end
end
