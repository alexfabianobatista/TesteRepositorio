inherited FPrecoPocket1_Cad: TFPrecoPocket1_Cad
  Left = 164
  Top = 198
  Caption = 'Cadastro Tabela de Pre'#231'os'
  ClientHeight = 382
  ClientWidth = 609
  PixelsPerInch = 96
  TextHeight = 14
  inherited Panel1: TPanel
    Width = 609
  end
  inherited StBLongHint: TStatusBar
    Top = 363
    Width = 609
  end
  object PageControl1: TPageControl [2]
    Left = 0
    Top = 41
    Width = 609
    Height = 322
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 2
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = 'Tabela'
      object Label1: TLabel
        Left = 40
        Top = 8
        Width = 33
        Height = 14
        Caption = 'C'#243'digo'
        FocusControl = DBEdit1
      end
      object Label3: TLabel
        Left = 40
        Top = 48
        Width = 49
        Height = 14
        Caption = 'Descri'#231#227'o'
        FocusControl = DBEdit3
      end
      object Label5: TLabel
        Left = 40
        Top = 91
        Width = 67
        Height = 14
        Caption = 'Prazo M'#225'ximo'
        FocusControl = DBEdit5
      end
      object Label6: TLabel
        Left = 120
        Top = 93
        Width = 57
        Height = 14
        Caption = '%Comiss'#227'o'
        FocusControl = DBEdit6
      end
      object Label8: TLabel
        Left = 39
        Top = 134
        Width = 62
        Height = 14
        Caption = 'Qt.Minimo Cx'
        FocusControl = DBEdit8
      end
      object Label9: TLabel
        Left = 120
        Top = 134
        Width = 95
        Height = 14
        Caption = '% desconto a Vista'
        FocusControl = DBEdit9
      end
      object DBEdit1: TDBEdit
        Left = 40
        Top = 24
        Width = 57
        Height = 22
        DataField = 'COD_TABELA_POCKET'
        DataSource = DSPrimario
        TabOrder = 0
      end
      object DBEdit3: TDBEdit
        Left = 40
        Top = 64
        Width = 337
        Height = 22
        DataField = 'DESC_TABELA'
        DataSource = DSPrimario
        TabOrder = 1
      end
      object DBEdit5: TDBEdit
        Left = 40
        Top = 107
        Width = 57
        Height = 22
        DataField = 'NUM_PRAZO_MAXIMO'
        DataSource = DSPrimario
        TabOrder = 2
      end
      object DBEdit6: TDBEdit
        Left = 120
        Top = 107
        Width = 57
        Height = 22
        DataField = 'PERC_COMISSAO'
        DataSource = DSPrimario
        TabOrder = 3
      end
      object DBRadioGroup1: TDBRadioGroup
        Left = 192
        Top = 92
        Width = 185
        Height = 41
        Caption = 'Situa'#231#227'o'
        Columns = 2
        DataField = 'IND_SITUACAO'
        DataSource = DSPrimario
        Items.Strings = (
          'Ativa'
          'Desativada')
        TabOrder = 4
        Values.Strings = (
          'ATIVO'
          'DESATIVADO')
      end
      object DBEdit8: TDBEdit
        Left = 39
        Top = 150
        Width = 62
        Height = 22
        DataField = 'QT_MINIMO_CAIXAS'
        DataSource = DSPrimario
        TabOrder = 5
      end
      object DBEdit9: TDBEdit
        Left = 120
        Top = 150
        Width = 62
        Height = 22
        DataField = 'PERC_DESC_AVISTA'
        DataSource = DSPrimario
        TabOrder = 6
      end
      object GB_RelPrecos: TGroupBox
        Left = 31
        Top = 177
        Width = 474
        Height = 105
        Caption = 'Depend'#234'ncia de tabela de pre'#231'os'
        TabOrder = 7
        object Label10: TLabel
          Left = 10
          Top = 16
          Width = 32
          Height = 14
          Caption = 'Tabela'
          FocusControl = DBEdit10
        end
        object BtConsPrecoPocket: TSpeedButton
          Left = 92
          Top = 32
          Width = 25
          Height = 22
          Enabled = False
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
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
          NumGlyphs = 2
          OnClick = BtConsPrecoPocketClick
        end
        object Label11: TLabel
          Left = 10
          Top = 58
          Width = 55
          Height = 14
          Caption = '% varia'#231#227'o'
          FocusControl = DBEdit11
        end
        object DBEdit10: TDBEdit
          Left = 10
          Top = 32
          Width = 81
          Height = 22
          DataField = 'NUM_COD_TBL_PAI'
          DataSource = DSPrimario
          TabOrder = 0
          OnChange = DBEdit10Change
        end
        object DBDirceu2: TDBDirceu
          Left = 119
          Top = 32
          Width = 316
          Height = 22
          DataField = 'NUM_COD_TBL_PAI'
          DataSource = DSPrimario
          ParentColor = True
          ReadOnly = True
          TabOrder = 1
          TabStop = False
          diTabela = 'tb_tabela_pocket'
          diCampo = 'desc_tabela'
          diChave = 'cod_tabela_pocket'
          diCache = False
        end
        object DBEdit11: TDBEdit
          Left = 10
          Top = 74
          Width = 62
          Height = 22
          DataField = 'PERC_VARIACAO'
          DataSource = DSPrimario
          TabOrder = 2
        end
        object DBRG_Operacao: TDBRadioGroup
          Left = 120
          Top = 58
          Width = 185
          Height = 41
          Caption = 'Opera'#231#227'o'
          Columns = 2
          DataField = 'DES_OPERACAO'
          DataSource = DSPrimario
          Items.Strings = (
            'Acr'#233'scimo'
            'Desconto')
          TabOrder = 3
          Values.Strings = (
            'A'
            'D')
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Pre'#231'os'
      ImageIndex = 1
      object Label2: TLabel
        Left = 24
        Top = 24
        Width = 37
        Height = 14
        Caption = 'Produto'
        FocusControl = DBEdit2
      end
      object BtConsProduto: TSpeedButton
        Left = 106
        Top = 40
        Width = 25
        Height = 22
        Enabled = False
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
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
        NumGlyphs = 2
        OnClick = BtConsProdutoClick
      end
      object Label4: TLabel
        Left = 128
        Top = 72
        Width = 56
        Height = 14
        Caption = 'Val. a Vista'
        FocusControl = DBEdit4
      end
      object Label7: TLabel
        Left = 24
        Top = 72
        Width = 59
        Height = 14
        Caption = 'Val. a Prazo'
        FocusControl = DBEdit7
      end
      object DBEdit2: TDBEdit
        Left = 24
        Top = 40
        Width = 81
        Height = 22
        DataField = 'COD_PRODUTO'
        DataSource = DsPrecoPocket_Item
        TabOrder = 0
      end
      object DBDirceu1: TDBDirceu
        Left = 133
        Top = 40
        Width = 316
        Height = 22
        DataField = 'COD_PRODUTO'
        DataSource = DsPrecoPocket_Item
        ParentColor = True
        ReadOnly = True
        TabOrder = 1
        TabStop = False
        diTabela = 'tb_produto'
        diCampo = 'desc_produto'
        diChave = 'cod_produto'
        diCache = False
      end
      object DBEdit4: TDBEdit
        Left = 128
        Top = 88
        Width = 97
        Height = 22
        DataField = 'VAL_PRECO_AVISTA'
        DataSource = DsPrecoPocket_Item
        TabOrder = 3
      end
      object DBEdit7: TDBEdit
        Left = 24
        Top = 88
        Width = 97
        Height = 22
        DataField = 'VAL_PRECO_APRAZO'
        DataSource = DsPrecoPocket_Item
        TabOrder = 2
        OnExit = DBEdit7Exit
      end
      object DBGrid1: TDBGrid
        Left = 24
        Top = 112
        Width = 424
        Height = 169
        DataSource = DsPrecoPocket_Item
        ReadOnly = True
        TabOrder = 4
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Arial'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'COD_TABELA_POCKET'
            Title.Caption = 'Tabela'
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
            FieldName = 'VAL_PRECO_APRAZO'
            Title.Caption = 'A Prazo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VAL_PRECO_AVISTA'
            Title.Caption = 'A Vista'
            Visible = True
          end>
      end
      object DBNavigator1: TDBNavigator
        Left = 232
        Top = 84
        Width = 216
        Height = 25
        DataSource = DsPrecoPocket_Item
        VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
        TabOrder = 5
      end
    end
  end
  inherited MMCadSimples: TMainMenu
    inherited Relatrios1: TMenuItem
      object abeladePreos1: TMenuItem
        Caption = 'Tabela de Pre'#231'os'
        OnClick = abeladePreos1Click
      end
    end
    object Opes1: TMenuItem
      Caption = '&Op'#231#245'es'
      object Recalcularlistadepreos1: TMenuItem
        Caption = 'Recalcular lista de pre'#231'os'
        OnClick = Recalcularlistadepreos1Click
      end
      object Importarlistadepreos1: TMenuItem
        Caption = 'Importar lista de pre'#231'os'
        OnClick = Importarlistadepreos1Click
      end
      object Atualizarlistadepreos1: TMenuItem
        Caption = 'Atualizar lista de pre'#231'os'
        OnClick = Atualizarlistadepreos1Click
      end
    end
  end
  inherited DSPrimario: TDataSource
    DataSet = DMPrecoPocket1.QPrecoPocket_Cad
  end
  object DsPrecoPocket_Item: TDataSource
    DataSet = DMPrecoPocket1.QPrecoPocket_Item
    OnStateChange = DsPrecoPocket_ItemStateChange
    Left = 568
    Top = 8
  end
end
