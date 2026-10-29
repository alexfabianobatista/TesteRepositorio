inherited FOficinaOrcamento: TFOficinaOrcamento
  Left = 245
  Top = 75
  Caption = 'Or'#231'amento'
  ClientHeight = 586
  ClientWidth = 703
  KeyPreview = True
  Position = poDesigned
  WindowState = wsMaximized
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 14
  inherited Panel1: TPanel
    Width = 703
  end
  inherited StBLongHint: TStatusBar
    Top = 567
    Width = 703
  end
  object PageControl1: TPageControl [2]
    Left = 0
    Top = 48
    Width = 703
    Height = 519
    ActivePage = TSOficinaOrcamento
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    object TSOficinaOrcamento: TTabSheet
      Caption = 'Or'#231'amento'
      DesignSize = (
        695
        490)
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 33
        Height = 14
        Caption = 'C'#243'digo'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 16
        Top = 56
        Width = 32
        Height = 14
        Caption = 'Cliente'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 272
        Top = 8
        Width = 30
        Height = 14
        Caption = 'Marca'
        FocusControl = DBEdit3
      end
      object Label4: TLabel
        Left = 16
        Top = 144
        Width = 66
        Height = 14
        Caption = 'Observa'#231#245'es'
      end
      object Label5: TLabel
        Left = 16
        Top = 104
        Width = 35
        Height = 14
        Caption = 'Ve'#237'culo'
        FocusControl = DBEdit5
      end
      object Label7: TLabel
        Left = 176
        Top = 8
        Width = 22
        Height = 14
        Caption = 'Data'
        FocusControl = DBEdit7
      end
      object SBCadastroCons: TSpeedButton
        Left = 81
        Top = 72
        Width = 23
        Height = 22
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
        OnClick = SBCadastroConsClick
      end
      object SBMarcaCons: TSpeedButton
        Left = 345
        Top = 24
        Width = 23
        Height = 22
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
        OnClick = SBMarcaConsClick
      end
      object SBVeiculoCons: TSpeedButton
        Left = 81
        Top = 120
        Width = 23
        Height = 22
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
        OnClick = SBVeiculoConsClick
      end
      object Label6: TLabel
        Left = 16
        Top = 392
        Width = 33
        Height = 14
        Anchors = [akLeft, akBottom]
        Caption = 'C'#243'digo'
        FocusControl = DBEdit4
      end
      object Label9: TLabel
        Left = 104
        Top = 392
        Width = 37
        Height = 14
        Anchors = [akLeft, akBottom]
        Caption = 'Produto'
        FocusControl = DBEProduto
      end
      object Label10: TLabel
        Left = 16
        Top = 440
        Width = 64
        Height = 14
        Anchors = [akLeft, akBottom]
        Caption = 'Complemento'
        FocusControl = DBEdit9
      end
      object Label11: TLabel
        Left = 600
        Top = 392
        Width = 55
        Height = 14
        Anchors = [akRight, akBottom]
        Caption = 'Quantidade'
        FocusControl = DBEdit10
      end
      object Label12: TLabel
        Left = 352
        Top = 440
        Width = 64
        Height = 14
        Anchors = [akRight, akBottom]
        Caption = 'Valor Unit'#225'rio'
        FocusControl = DBEdit11
      end
      object Label13: TLabel
        Left = 512
        Top = 440
        Width = 62
        Height = 14
        Anchors = [akRight, akBottom]
        Caption = 'Valor do Item'
        FocusControl = DBEdit12
      end
      object SBProdutoCons: TSpeedButton
        Left = 177
        Top = 408
        Width = 23
        Height = 22
        Anchors = [akLeft, akBottom]
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
        OnClick = SBProdutoConsClick
      end
      object Label8: TLabel
        Left = 376
        Top = 104
        Width = 20
        Height = 14
        Anchors = [akTop, akRight]
        Caption = 'Filial'
        FocusControl = DBEdit6
      end
      object SBFilialCons: TSpeedButton
        Left = 433
        Top = 120
        Width = 23
        Height = 22
        Anchors = [akTop, akRight]
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
        OnClick = SBFilialConsClick
      end
      object Label14: TLabel
        Left = 432
        Top = 440
        Width = 59
        Height = 14
        Anchors = [akRight, akBottom]
        Caption = '% Desconto'
        FocusControl = DBEdit8
      end
      object Label15: TLabel
        Left = 96
        Top = 8
        Width = 37
        Height = 14
        Caption = 'N'#250'mero'
        FocusControl = DBEdit13
      end
      object Label16: TLabel
        Left = 448
        Top = 56
        Width = 98
        Height = 14
        Anchors = [akTop, akRight]
        Caption = 'Vlr. Desconto Pe'#231'as'
        FocusControl = DBEdit14
      end
      object Label17: TLabel
        Left = 560
        Top = 56
        Width = 111
        Height = 14
        Anchors = [akTop, akRight]
        Caption = 'Vlr. Desconto Servi'#231'os'
        FocusControl = DBEdit15
      end
      object Label18: TLabel
        Left = 619
        Top = 440
        Width = 50
        Height = 14
        Anchors = [akRight, akBottom]
        Caption = 'Valor Total'
        FocusControl = DBEdit16
      end
      object DBEdit1: TDBEdit
        Left = 16
        Top = 24
        Width = 65
        Height = 22
        TabStop = False
        Color = clBtnFace
        DataField = 'COD_OFICINA_ORCAMENTO_CAB'
        DataSource = DSPrimario
        ReadOnly = True
        TabOrder = 22
      end
      object DBEdit2: TDBEdit
        Left = 16
        Top = 72
        Width = 65
        Height = 22
        DataField = 'COD_CADASTRO'
        DataSource = DSPrimario
        TabOrder = 4
      end
      object DBEdit3: TDBEdit
        Left = 272
        Top = 24
        Width = 73
        Height = 22
        DataField = 'COD_MARCA'
        DataSource = DSPrimario
        TabOrder = 2
      end
      object DBEdit5: TDBEdit
        Left = 16
        Top = 120
        Width = 65
        Height = 22
        DataField = 'COD_VEICULO'
        DataSource = DSPrimario
        TabOrder = 8
      end
      object DBEdit7: TDBEdit
        Left = 176
        Top = 24
        Width = 81
        Height = 22
        DataField = 'DT_ORCAMENTO'
        DataSource = DSPrimario
        TabOrder = 1
      end
      object DBMemo1: TDBMemo
        Left = 16
        Top = 160
        Width = 657
        Height = 41
        Anchors = [akLeft, akTop, akRight]
        DataField = 'DESC_SERVICO'
        DataSource = DSPrimario
        TabOrder = 12
      end
      object DBDirceu2: TDBDirceu
        Left = 368
        Top = 24
        Width = 145
        Height = 22
        DataField = 'COD_MARCA'
        DataSource = DSPrimario
        ParentColor = True
        ReadOnly = True
        TabOrder = 3
        TabStop = False
        diTabela = 'TB_MARCA'
        diCampo = 'DESC_MARCA'
        diChave = 'COD_MARCA'
        diCache = False
      end
      object DBEdit4: TDBEdit
        Left = 16
        Top = 408
        Width = 73
        Height = 22
        TabStop = False
        Anchors = [akLeft, akBottom]
        Color = clBtnFace
        DataField = 'COD_OFICINA_ORCAMENTO_ITEM'
        DataSource = DSItens
        ReadOnly = True
        TabOrder = 23
      end
      object DBEProduto: TDBEdit
        Left = 104
        Top = 408
        Width = 73
        Height = 22
        Anchors = [akLeft, akBottom]
        DataField = 'COD_PRODUTO'
        DataSource = DSItens
        TabOrder = 13
        OnExit = DBEProdutoExit
      end
      object DBEdit9: TDBEdit
        Left = 16
        Top = 456
        Width = 313
        Height = 22
        Anchors = [akLeft, akRight, akBottom]
        DataField = 'DESC_COMPLEMENTO'
        DataSource = DSItens
        TabOrder = 16
      end
      object DBEdit10: TDBEdit
        Left = 600
        Top = 408
        Width = 73
        Height = 22
        Anchors = [akRight, akBottom]
        DataField = 'QT_QUANTIDADE'
        DataSource = DSItens
        TabOrder = 15
      end
      object DBEdit11: TDBEdit
        Left = 352
        Top = 456
        Width = 65
        Height = 22
        Anchors = [akRight, akBottom]
        DataField = 'VAL_UNITARIO'
        DataSource = DSItens
        TabOrder = 17
      end
      object DBEdit12: TDBEdit
        Left = 504
        Top = 456
        Width = 73
        Height = 22
        TabStop = False
        Anchors = [akRight, akBottom]
        Color = clBtnFace
        DataField = 'val_item'
        DataSource = DSItens
        ReadOnly = True
        TabOrder = 19
      end
      object DBDirceu3: TDBDirceu
        Left = 200
        Top = 408
        Width = 377
        Height = 22
        Anchors = [akLeft, akRight, akBottom]
        DataField = 'COD_PRODUTO'
        DataSource = DSItens
        ParentColor = True
        ReadOnly = True
        TabOrder = 14
        TabStop = False
        diTabela = 'TB_PRODUTO'
        diCampo = 'DESC_PRODUTO'
        diChave = 'COD_PRODUTO'
        diCache = False
      end
      object DBGrid1: TDBGrid
        Left = 16
        Top = 224
        Width = 657
        Height = 129
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = DSItens
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 21
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Arial'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'COD_OFICINA_ORCAMENTO_ITEM'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'COD_OFICINA_ORCAMENTO_CAB'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'COD_PRODUTO'
            Title.Caption = 'Cod. Produto'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'desc_produto'
            Title.Caption = 'Produto'
            Width = 176
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESC_COMPLEMENTO'
            Title.Caption = 'Complemento'
            Width = 164
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QT_QUANTIDADE'
            Title.Caption = 'Quantidade'
            Width = 58
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VAL_UNITARIO'
            Title.Caption = 'Valor Unitario'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'val_item'
            Title.Caption = 'Valor Total'
            Width = 66
            Visible = True
          end>
      end
      object OracleNavigator1: TOracleNavigator
        Left = 56
        Top = 352
        Width = 576
        Height = 25
        DataSource = DSItens
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
        Anchors = [akBottom]
        Hints.Strings = (
          'Primeiro'
          'Anterior'
          'Pr'#243'ximo'
          #218'ltimo'
          'Adicionar'
          'Excluir'
          'Editar'
          'Confirmar'
          'Cancelar')
        ParentShowHint = False
        ShowHint = True
        TabOrder = 24
      end
      object Panel2: TPanel
        Left = 16
        Top = 208
        Width = 657
        Height = 9
        Anchors = [akLeft, akTop, akRight]
        BevelOuter = bvLowered
        TabOrder = 25
      end
      object DBEdit6: TDBEdit
        Left = 376
        Top = 120
        Width = 57
        Height = 22
        Anchors = [akTop, akRight]
        DataField = 'COD_FILIAL'
        DataSource = DSPrimario
        TabOrder = 10
      end
      object DBDirceu4: TDBDirceu
        Left = 456
        Top = 120
        Width = 217
        Height = 22
        Anchors = [akTop, akRight]
        DataField = 'COD_FILIAL'
        DataSource = DSPrimario
        ParentColor = True
        ReadOnly = True
        TabOrder = 11
        TabStop = False
        diTabela = 'TB_FILIAL'
        diCampo = 'DESC_FILIAL'
        diChave = 'COD_FILIAL'
        diCache = False
      end
      object DBEdit8: TDBEdit
        Left = 432
        Top = 456
        Width = 57
        Height = 22
        Anchors = [akRight, akBottom]
        DataField = 'PERC_DESCONTO'
        DataSource = DSItens
        TabOrder = 18
        OnExit = DBEdit8Exit
      end
      object DBEdit13: TDBEdit
        Left = 96
        Top = 24
        Width = 73
        Height = 22
        DataField = 'NUM_ORCAMENTO'
        DataSource = DSPrimario
        TabOrder = 0
      end
      object DBEdit14: TDBEdit
        Left = 448
        Top = 72
        Width = 97
        Height = 22
        Anchors = [akTop, akRight]
        DataField = 'VAL_DESCONTO_PECAS'
        DataSource = DSPrimario
        TabOrder = 6
      end
      object DBEdit15: TDBEdit
        Left = 560
        Top = 72
        Width = 113
        Height = 22
        Anchors = [akTop, akRight]
        DataField = 'VAL_DESCONTO_SERVICOS'
        DataSource = DSPrimario
        TabOrder = 7
      end
      object DBEdit16: TDBEdit
        Left = 600
        Top = 456
        Width = 73
        Height = 22
        TabStop = False
        Anchors = [akRight, akBottom]
        Color = clBtnFace
        DataField = 'VAL_TOTAL'
        DataSource = DSSomaItemOrcamento
        ReadOnly = True
        TabOrder = 20
      end
      object DBEdit17: TDBEdit
        Left = 104
        Top = 120
        Width = 257
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        DataField = 'DESC_VEICULO'
        DataSource = DSPrimario
        TabOrder = 9
      end
      object DBEdit18: TDBEdit
        Left = 104
        Top = 72
        Width = 329
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        DataField = 'DESC_CADASTRO'
        DataSource = DSPrimario
        TabOrder = 5
      end
      object DBEdit19: TDBEdit
        Left = 520
        Top = 24
        Width = 81
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        DataField = 'DESC_COMPL_MARCA'
        DataSource = DSPrimario
        TabOrder = 26
      end
      object DBCheckBox1: TDBCheckBox
        Left = 608
        Top = 24
        Width = 65
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'Substituir'
        DataField = 'IND_DESCRICAO_MARCA'
        DataSource = DSPrimario
        TabOrder = 27
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
    end
  end
  inherited MMCadSimples: TMainMenu
    Left = 416
    inherited Relatrios1: TMenuItem
      object ImprimirOramento1: TMenuItem
        Caption = 'Imprimir &Or'#231'amento'
        OnClick = ImprimirOramento1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object RelatriodeOramentos1: TMenuItem
        Caption = '&Relat'#243'rio de Or'#231'amentos'
        OnClick = RelatriodeOramentos1Click
      end
    end
  end
  inherited DSPrimario: TDataSource
    DataSet = DMOficina.QOficinaOrcamentoCad
    Left = 480
  end
  inherited ILBotao: TImageList
    Left = 384
  end
  object DSItens: TDataSource
    AutoEdit = False
    DataSet = DMOficina.QOficinaOrcamentoItem
    OnStateChange = DSItensStateChange
    Left = 512
    Top = 8
  end
  object DSSomaItemOrcamento: TDataSource
    AutoEdit = False
    DataSet = DMOficina.QSomaItemOrcamento
    Left = 544
    Top = 8
  end
end
