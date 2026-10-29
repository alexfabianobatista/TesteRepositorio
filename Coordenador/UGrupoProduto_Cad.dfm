inherited FGrupoProduto_Cad: TFGrupoProduto_Cad
  Left = 230
  Top = 62
  Caption = 'Cadastro Grupo Produto'
  ClientHeight = 554
  ClientWidth = 579
  PixelsPerInch = 96
  TextHeight = 14
  inherited Panel1: TPanel
    Width = 579
  end
  inherited StBLongHint: TStatusBar
    Top = 535
    Width = 579
  end
  object PageControl1: TPageControl [2]
    Left = 0
    Top = 41
    Width = 579
    Height = 494
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 2
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = 'Grupo'
      object Label1: TLabel
        Left = 16
        Top = 32
        Width = 33
        Height = 14
        Caption = 'C'#243'digo'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 16
        Top = 112
        Width = 49
        Height = 14
        Caption = 'Descri'#231#227'o'
        FocusControl = DBEdit2
      end
      object Label24: TLabel
        Left = 16
        Top = 72
        Width = 30
        Height = 14
        Caption = 'Grupo'
        FocusControl = DBEdit24
      end
      object Label25: TLabel
        Left = 88
        Top = 72
        Width = 20
        Height = 14
        Caption = 'Ano'
        FocusControl = DBEdit25
      end
      object Label26: TLabel
        Left = 146
        Top = 72
        Width = 20
        Height = 14
        Caption = 'M'#234's'
        FocusControl = DBEdit26
      end
      object DBEdit1: TDBEdit
        Left = 16
        Top = 48
        Width = 65
        Height = 22
        TabStop = False
        Color = clBtnFace
        DataField = 'COD_GRUPO_PRODUTO'
        DataSource = DSPrimario
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 17
        Top = 128
        Width = 424
        Height = 22
        DataField = 'DESC_GRUPO_PRODUTO'
        DataSource = DSPrimario
        TabOrder = 4
      end
      object DBEdit24: TDBEdit
        Left = 16
        Top = 88
        Width = 65
        Height = 22
        DataField = 'COD_GRUPO'
        DataSource = DSPrimario
        TabOrder = 1
      end
      object DBEdit25: TDBEdit
        Left = 88
        Top = 88
        Width = 45
        Height = 22
        DataField = 'NUM_ANO'
        DataSource = DSPrimario
        TabOrder = 2
      end
      object DBEdit26: TDBEdit
        Left = 144
        Top = 88
        Width = 49
        Height = 22
        DataField = 'NUM_MES'
        DataSource = DSPrimario
        TabOrder = 3
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Itens'
      ImageIndex = 1
      object Label4: TLabel
        Left = 16
        Top = 87
        Width = 39
        Height = 14
        Caption = 'Meta Kg'
        FocusControl = DBEdit4
      end
      object Label5: TLabel
        Left = 112
        Top = 87
        Width = 85
        Height = 14
        Caption = 'Meta Pre'#231'o M'#233'dio'
        FocusControl = DBEdit5
      end
      object Label29: TLabel
        Left = 16
        Top = 47
        Width = 33
        Height = 14
        Caption = 'Classe'
        FocusControl = DBEdit29
      end
      object BtConsClasse: TSpeedButton
        Left = 71
        Top = 63
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
        OnClick = BtConsClasseClick
      end
      object Label23: TLabel
        Left = 16
        Top = 8
        Width = 53
        Height = 14
        Caption = 'Supervisor'
        FocusControl = DBEdit22
      end
      object SbSupervisor: TSpeedButton
        Left = 70
        Top = 24
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
        OnClick = SbSupervisorClick
      end
      object DBEdit4: TDBEdit
        Left = 16
        Top = 103
        Width = 89
        Height = 22
        DataField = 'QT_META_KG'
        DataSource = DsGrupoProdutoItens
        TabOrder = 2
      end
      object DBEdit5: TDBEdit
        Left = 112
        Top = 103
        Width = 89
        Height = 22
        DataField = 'VAL_META_PRECO_MEDIO'
        DataSource = DsGrupoProdutoItens
        TabOrder = 3
      end
      object GroupBox1: TGroupBox
        Left = 16
        Top = 127
        Width = 321
        Height = 169
        TabOrder = 4
        object Label3: TLabel
          Left = 8
          Top = 40
          Width = 13
          Height = 14
          Caption = 'De'
          FocusControl = DBEdit3
        end
        object Label6: TLabel
          Left = 78
          Top = 40
          Width = 17
          Height = 14
          Caption = 'At'#233
          FocusControl = DBEdit6
        end
        object Label7: TLabel
          Left = 146
          Top = 40
          Width = 22
          Height = 14
          Caption = 'Nota'
          FocusControl = DBEdit7
        end
        object Label8: TLabel
          Left = 78
          Top = 71
          Width = 17
          Height = 14
          Caption = 'At'#233
          FocusControl = DBEdit9
        end
        object Label10: TLabel
          Left = 8
          Top = 71
          Width = 13
          Height = 14
          Caption = 'De'
          FocusControl = DBEdit8
        end
        object Label11: TLabel
          Left = 78
          Top = 109
          Width = 17
          Height = 14
          Caption = 'At'#233
          FocusControl = DBEdit12
        end
        object Label13: TLabel
          Left = 8
          Top = 109
          Width = 13
          Height = 14
          Caption = 'De'
          FocusControl = DBEdit11
        end
        object Label14: TLabel
          Left = 78
          Top = 139
          Width = 17
          Height = 14
          Caption = 'At'#233
          FocusControl = DBEdit15
        end
        object Label16: TLabel
          Left = 8
          Top = 139
          Width = 13
          Height = 14
          Caption = 'De'
          FocusControl = DBEdit14
        end
        object Label9: TLabel
          Left = 146
          Top = 72
          Width = 22
          Height = 14
          Caption = 'Nota'
          FocusControl = DBEdit10
        end
        object Label12: TLabel
          Left = 146
          Top = 109
          Width = 22
          Height = 14
          Caption = 'Nota'
          FocusControl = DBEdit13
        end
        object Label15: TLabel
          Left = 146
          Top = 139
          Width = 22
          Height = 14
          Caption = 'Nota'
          FocusControl = DBEdit16
        end
        object Label17: TLabel
          Left = 176
          Top = 21
          Width = 39
          Height = 14
          Caption = 'Meta Kg'
        end
        object Label18: TLabel
          Left = 234
          Top = 40
          Width = 22
          Height = 14
          Caption = 'Nota'
          FocusControl = DBEdit17
        end
        object Label19: TLabel
          Left = 234
          Top = 72
          Width = 22
          Height = 14
          Caption = 'Nota'
          FocusControl = DBEdit18
        end
        object Label20: TLabel
          Left = 234
          Top = 109
          Width = 22
          Height = 14
          Caption = 'Nota'
          FocusControl = DBEdit19
        end
        object Label21: TLabel
          Left = 234
          Top = 139
          Width = 22
          Height = 14
          Caption = 'Nota'
          FocusControl = DBEdit20
        end
        object Label22: TLabel
          Left = 253
          Top = 21
          Width = 54
          Height = 14
          Caption = 'Meta Pre'#231'o'
        end
        object DBEdit3: TDBEdit
          Left = 26
          Top = 37
          Width = 43
          Height = 22
          DataField = 'VAL_FAIXA_DE1'
          DataSource = DsGrupoProdutoItens
          TabOrder = 0
        end
        object DBEdit6: TDBEdit
          Left = 101
          Top = 37
          Width = 39
          Height = 22
          DataField = 'VAL_FAIXA_ATE1'
          DataSource = DsGrupoProdutoItens
          TabOrder = 1
        end
        object DBEdit7: TDBEdit
          Left = 171
          Top = 37
          Width = 50
          Height = 22
          DataField = 'NOTA_FAIXA_KG1'
          DataSource = DsGrupoProdutoItens
          TabOrder = 2
        end
        object DBEdit8: TDBEdit
          Left = 26
          Top = 69
          Width = 43
          Height = 22
          DataField = 'VAL_FAIXA_DE2'
          DataSource = DsGrupoProdutoItens
          TabOrder = 4
        end
        object DBEdit9: TDBEdit
          Left = 101
          Top = 69
          Width = 39
          Height = 22
          DataField = 'VAL_FAIXA_ATE2'
          DataSource = DsGrupoProdutoItens
          TabOrder = 5
        end
        object DBEdit11: TDBEdit
          Left = 27
          Top = 103
          Width = 43
          Height = 22
          DataField = 'VAL_FAIXA_DE3'
          DataSource = DsGrupoProdutoItens
          TabOrder = 8
        end
        object DBEdit12: TDBEdit
          Left = 101
          Top = 103
          Width = 39
          Height = 22
          DataField = 'VAL_FAIXA_ATE3'
          DataSource = DsGrupoProdutoItens
          TabOrder = 9
        end
        object DBEdit14: TDBEdit
          Left = 27
          Top = 135
          Width = 43
          Height = 22
          DataField = 'VAL_FAIXA_DE4'
          DataSource = DsGrupoProdutoItens
          TabOrder = 12
        end
        object DBEdit15: TDBEdit
          Left = 101
          Top = 135
          Width = 39
          Height = 22
          DataField = 'VAL_FAIXA_ATE4'
          DataSource = DsGrupoProdutoItens
          TabOrder = 13
        end
        object DBEdit10: TDBEdit
          Left = 171
          Top = 69
          Width = 50
          Height = 22
          DataField = 'NOTA_FAIXA_KG2'
          DataSource = DsGrupoProdutoItens
          TabOrder = 6
        end
        object DBEdit13: TDBEdit
          Left = 171
          Top = 103
          Width = 50
          Height = 22
          DataField = 'NOTA_FAIXA_KG3'
          DataSource = DsGrupoProdutoItens
          TabOrder = 10
        end
        object DBEdit16: TDBEdit
          Left = 171
          Top = 135
          Width = 50
          Height = 22
          DataField = 'NOTA_FAIXA_KG4'
          DataSource = DsGrupoProdutoItens
          TabOrder = 14
        end
        object DBEdit17: TDBEdit
          Left = 259
          Top = 37
          Width = 50
          Height = 22
          DataField = 'NOTA_FAIXA_PRECO1'
          DataSource = DsGrupoProdutoItens
          TabOrder = 3
        end
        object DBEdit18: TDBEdit
          Left = 259
          Top = 69
          Width = 50
          Height = 22
          DataField = 'NOTA_FAIXA_PRECO2'
          DataSource = DsGrupoProdutoItens
          TabOrder = 7
        end
        object DBEdit19: TDBEdit
          Left = 259
          Top = 103
          Width = 50
          Height = 22
          DataField = 'NOTA_FAIXA_PRECO3'
          DataSource = DsGrupoProdutoItens
          TabOrder = 11
        end
        object DBEdit20: TDBEdit
          Left = 259
          Top = 135
          Width = 50
          Height = 22
          DataField = 'NOTA_FAIXA_PRECO4'
          DataSource = DsGrupoProdutoItens
          TabOrder = 15
        end
      end
      object DBEdit29: TDBEdit
        Left = 16
        Top = 63
        Width = 53
        Height = 22
        DataField = 'COD_CLASSE'
        DataSource = DsGrupoProdutoItens
        TabOrder = 1
      end
      object DBNavigator1: TDBNavigator
        Left = 208
        Top = 101
        Width = 294
        Height = 25
        DataSource = DsGrupoProdutoItens
        VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
        TabOrder = 5
      end
      object DBGrid1: TDBGrid
        Left = 16
        Top = 303
        Width = 489
        Height = 153
        DataSource = DsGrupoProdutoItens
        ReadOnly = True
        TabOrder = 6
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Arial'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'COD_CLASSE'
            Title.Caption = 'C'#243'digo '
            Width = 41
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome_vendedor'
            Title.Caption = 'Vendedor'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'desc_classe'
            Title.Caption = 'Classe'
            Width = 178
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QT_META_KG'
            Title.Caption = 'Meta Kg'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VAL_META_PRECO_MEDIO'
            Title.Caption = 'Meta Pre'#231'o M'#233'dio'
            Visible = True
          end>
      end
      object DBEdit21: TDBEdit
        Left = 96
        Top = 63
        Width = 405
        Height = 22
        TabStop = False
        Color = clBtnFace
        DataField = 'desc_classe'
        DataSource = DsGrupoProdutoItens
        ReadOnly = True
        TabOrder = 7
      end
      object DBEdit22: TDBEdit
        Left = 16
        Top = 24
        Width = 53
        Height = 22
        DataField = 'COD_VENDEDOR'
        DataSource = DsGrupoProdutoItens
        TabOrder = 0
      end
      object DBEdit23: TDBEdit
        Left = 96
        Top = 24
        Width = 404
        Height = 22
        TabStop = False
        Color = clBtnFace
        DataField = 'nome_vendedor'
        DataSource = DsGrupoProdutoItens
        ReadOnly = True
        TabOrder = 8
      end
    end
  end
  inherited MMCadSimples: TMainMenu
    inherited Relatrios1: TMenuItem
      object RelatrioPremioMetas1: TMenuItem
        Caption = 'Relat'#243'rio Premio Metas'
        OnClick = RelatrioPremioMetas1Click
      end
      object RelGrupoProduto1: TMenuItem
        Caption = 'Rel Grupo Produto'
        OnClick = RelGrupoProduto1Click
      end
      object RelatrioValoresPremio1: TMenuItem
        Caption = 'Relat'#243'rio Valores Premio'
        OnClick = RelatrioValoresPremio1Click
      end
    end
    object Opes1: TMenuItem
      Caption = '&Op'#231#245'es'
      object Reaproveitamentodegrupos1: TMenuItem
        Caption = 'Reaproveitamento de grupos'
        OnClick = Reaproveitamentodegrupos1Click
      end
    end
  end
  inherited DSPrimario: TDataSource
    DataSet = DMGrupoProduto.QGrupoProduto_Cad
    Left = 520
  end
  object DsGrupoProdutoItens: TDataSource
    DataSet = DMGrupoProduto.QGrupoProdutoItem_Cad
    OnStateChange = DsGrupoProdutoItensStateChange
    Left = 456
    Top = 8
  end
end
