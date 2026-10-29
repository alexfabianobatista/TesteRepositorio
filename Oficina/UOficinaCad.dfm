inherited FOficinaCad: TFOficinaCad
  Left = 340
  Top = 0
  Caption = 'Cadastro de OS'
  ClientHeight = 664
  ClientWidth = 789
  KeyPreview = True
  Position = poDesigned
  ShowHint = True
  WindowState = wsMaximized
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 14
  inherited Panel1: TPanel
    Width = 789
    inherited BtCopia: TSpeedButton
      Left = 368
    end
  end
  inherited StBLongHint: TStatusBar
    Top = 645
    Width = 789
  end
  object PCOficina: TPageControl [2]
    Left = 0
    Top = 46
    Width = 789
    Height = 599
    ActivePage = TSOficina
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    object TSOficina: TTabSheet
      Caption = 'Cadastro da OS'
      DesignSize = (
        781
        570)
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 33
        Height = 14
        Caption = 'C'#243'digo'
        FocusControl = DBECodOficinaCab
      end
      object Label2: TLabel
        Left = 264
        Top = 56
        Width = 20
        Height = 14
        Anchors = [akTop, akRight]
        Caption = 'Filial'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 8
        Top = 56
        Width = 47
        Height = 14
        Caption = 'Vendedor'
        FocusControl = DBEdit3
      end
      object Label5: TLabel
        Left = 68
        Top = 8
        Width = 32
        Height = 14
        Caption = 'Cliente'
        FocusControl = DBECadastro
      end
      object Label6: TLabel
        Left = 480
        Top = 144
        Width = 49
        Height = 14
        Caption = 'Descri'#231#227'o'
      end
      object Label7: TLabel
        Left = 603
        Top = 56
        Width = 35
        Height = 14
        Anchors = [akTop, akRight]
        Caption = 'Ve'#237'culo'
      end
      object Label10: TLabel
        Left = 341
        Top = 8
        Width = 77
        Height = 14
        Anchors = [akTop, akRight]
        Caption = 'Data de Entrada'
        FocusControl = DBEdit10
      end
      object Label11: TLabel
        Left = 428
        Top = 8
        Width = 67
        Height = 14
        Anchors = [akTop, akRight]
        Caption = 'Data de Sa'#237'da'
        FocusControl = DBEdit11
      end
      object Label12: TLabel
        Left = 8
        Top = 504
        Width = 75
        Height = 14
        Anchors = [akLeft, akBottom]
        Caption = '% Desc. Venda'
        FocusControl = DBEdit12
      end
      object Label13: TLabel
        Left = 96
        Top = 504
        Width = 76
        Height = 14
        Anchors = [akLeft, akBottom]
        Caption = '% Desc. Cliente'
        FocusControl = DBEdit13
      end
      object Label14: TLabel
        Left = 184
        Top = 504
        Width = 90
        Height = 14
        Anchors = [akLeft, akBottom]
        Caption = '% Desc. Mec'#226'nico'
        FocusControl = DBEdit14
      end
      object Label15: TLabel
        Left = 280
        Top = 504
        Width = 60
        Height = 14
        Anchors = [akLeft, akBottom]
        Caption = '% Comiss'#227'o'
        FocusControl = DBEdit15
      end
      object SBCadastroCons: TSpeedButton
        Left = 133
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
        OnClick = SBCadastroConsClick
      end
      object SBVendedorCons: TSpeedButton
        Left = 73
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
        OnClick = SBVendedorConsClick
      end
      object SBFilialCons: TSpeedButton
        Left = 329
        Top = 72
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
      object SBVeiculoCons: TSpeedButton
        Left = 658
        Top = 72
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
        OnClick = SBVeiculoConsClick
      end
      object Label9: TLabel
        Left = 9
        Top = 104
        Width = 30
        Height = 14
        Caption = 'Marca'
        FocusControl = DBEdit8
      end
      object SBMarcaCons: TSpeedButton
        Left = 82
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
        OnClick = SBMarcaConsClick
      end
      object Label16: TLabel
        Left = 104
        Top = 448
        Width = 37
        Height = 14
        Anchors = [akLeft, akBottom]
        Caption = 'Produto'
        FocusControl = DBEProduto
      end
      object Label17: TLabel
        Left = 529
        Top = 448
        Width = 55
        Height = 14
        Anchors = [akRight, akBottom]
        Caption = 'Quantidade'
        FocusControl = DBEdit16
      end
      object Label18: TLabel
        Left = 609
        Top = 448
        Width = 64
        Height = 14
        Anchors = [akRight, akBottom]
        Caption = 'Valor Unitario'
        FocusControl = DBEValUnitario
      end
      object SBProdutoCons: TSpeedButton
        Left = 161
        Top = 464
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
        Left = 671
        Top = 104
        Width = 99
        Height = 14
        Anchors = [akTop, akRight]
        Caption = 'Data de Fechamento'
        FocusControl = DBEdit9
      end
      object Label20: TLabel
        Left = 168
        Top = 200
        Width = 48
        Height = 14
        Caption = 'Opera'#231#227'o'
        FocusControl = DBEdit20
      end
      object SBOperacaoCons: TSpeedButton
        Left = 233
        Top = 216
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
        OnClick = SBOperacaoConsClick
      end
      object Label23: TLabel
        Left = 595
        Top = 504
        Width = 77
        Height = 14
        Anchors = [akRight, akBottom]
        Caption = 'Total Descontos'
        FocusControl = DBEdit23
      end
      object Label24: TLabel
        Left = 713
        Top = 504
        Width = 55
        Height = 14
        Anchors = [akRight, akBottom]
        Caption = 'Total da OS'
        FocusControl = DBEdit24
      end
      object Label25: TLabel
        Left = 622
        Top = 8
        Width = 37
        Height = 14
        Anchors = [akTop, akRight]
        Caption = 'N'#250'mero'
        FocusControl = DBEdit1
      end
      object Label26: TLabel
        Left = 715
        Top = 448
        Width = 51
        Height = 14
        Anchors = [akRight, akBottom]
        Caption = 'Total Bruto'
        FocusControl = DBEdit22
      end
      object DBText1: TDBText
        Left = 681
        Top = 24
        Width = 89
        Height = 17
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        DataField = 'desc_situacao'
        DataSource = DSPrimario
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText2: TDBText
        Left = 8
        Top = 544
        Width = 73
        Height = 17
        Alignment = taRightJustify
        Anchors = [akLeft, akBottom]
        DataField = 'val_desc_venda'
        DataSource = DSItens
      end
      object DBText3: TDBText
        Left = 96
        Top = 545
        Width = 73
        Height = 17
        Alignment = taRightJustify
        Anchors = [akLeft, akBottom]
        DataField = 'val_desc_cliente'
        DataSource = DSItens
      end
      object DBText4: TDBText
        Left = 184
        Top = 545
        Width = 89
        Height = 17
        Alignment = taRightJustify
        Anchors = [akLeft, akBottom]
        DataField = 'val_desc_mecanico'
        DataSource = DSItens
      end
      object Label19: TLabel
        Left = 453
        Top = 504
        Width = 51
        Height = 14
        Anchors = [akLeft, akBottom]
        Caption = 'Vlr do Item'
        FocusControl = DBEdit18
      end
      object Label22: TLabel
        Left = 351
        Top = 504
        Width = 65
        Height = 14
        Anchors = [akLeft, akBottom]
        Caption = 'Vlr. Desconto'
        FocusControl = DBEdit17
      end
      object Label31: TLabel
        Left = 8
        Top = 248
        Width = 102
        Height = 14
        Caption = 'Virabrequim - Mancal'
        FocusControl = DBEdit6
      end
      object Label32: TLabel
        Left = 128
        Top = 248
        Width = 91
        Height = 14
        Caption = 'Virabrequim - Biela'
        FocusControl = DBEdit28
      end
      object Label45: TLabel
        Left = 240
        Top = 248
        Width = 85
        Height = 14
        Caption = 'Carca'#231'a - Mancal'
        FocusControl = DBEdit29
      end
      object Label51: TLabel
        Left = 344
        Top = 248
        Width = 81
        Height = 14
        Caption = 'Carca'#231'a - Aloj. C'
        FocusControl = DBEdit30
      end
      object Label52: TLabel
        Left = 464
        Top = 248
        Width = 104
        Height = 14
        Caption = 'Compressor - Cilindro'
        FocusControl = DBEdit31
      end
      object Label53: TLabel
        Left = 584
        Top = 248
        Width = 72
        Height = 14
        Caption = 'Bloco - Cilindro'
        FocusControl = DBEdit32
      end
      object Label54: TLabel
        Left = 672
        Top = 248
        Width = 100
        Height = 14
        Caption = 'Compressor - Colo C'
        FocusControl = DBEdit33
      end
      object Label55: TLabel
        Left = 530
        Top = 504
        Width = 54
        Height = 14
        Anchors = [akRight, akBottom]
        Caption = 'Valor Bruto'
        FocusControl = DBEdit23
      end
      object Label65: TLabel
        Left = 515
        Top = 8
        Width = 25
        Height = 14
        Anchors = [akTop, akRight]
        Caption = 'S'#233'rie'
        FocusControl = DBEdit35
      end
      object Label21: TLabel
        Left = 8
        Top = 448
        Width = 74
        Height = 14
        Anchors = [akLeft, akBottom]
        Caption = 'Nro. Fabricante'
        FocusControl = DBENumFabricante
      end
      object Label4: TLabel
        Left = 568
        Top = 8
        Width = 20
        Height = 14
        Caption = 'Mod'
      end
      object DBECodOficinaCab: TDBEdit
        Left = 8
        Top = 24
        Width = 53
        Height = 22
        TabStop = False
        Color = clBtnFace
        DataField = 'COD_OFICINA_CAB'
        DataSource = DSPrimario
        ReadOnly = True
        TabOrder = 38
        OnChange = DBECodOficinaCabChange
      end
      object DBEdit2: TDBEdit
        Left = 264
        Top = 72
        Width = 65
        Height = 22
        Anchors = [akTop, akRight]
        DataField = 'COD_FILIAL'
        DataSource = DSPrimario
        TabOrder = 6
      end
      object DBEdit3: TDBEdit
        Left = 8
        Top = 72
        Width = 65
        Height = 22
        DataField = 'COD_VENDEDOR'
        DataSource = DSPrimario
        TabOrder = 5
      end
      object DBECadastro: TDBEdit
        Left = 68
        Top = 24
        Width = 65
        Height = 22
        DataField = 'COD_CADASTRO'
        DataSource = DSPrimario
        TabOrder = 0
      end
      object DBEdit10: TDBEdit
        Left = 341
        Top = 24
        Width = 81
        Height = 22
        Anchors = [akTop, akRight]
        DataField = 'DT_ENTRADA'
        DataSource = DSPrimario
        TabOrder = 1
      end
      object DBEdit11: TDBEdit
        Left = 428
        Top = 24
        Width = 81
        Height = 22
        Anchors = [akTop, akRight]
        DataField = 'DT_SAIDA'
        DataSource = DSPrimario
        TabOrder = 2
      end
      object DBEdit12: TDBEdit
        Left = 8
        Top = 520
        Width = 73
        Height = 22
        Anchors = [akLeft, akBottom]
        DataField = 'PERC_DESCONTO_VENDA'
        DataSource = DSItens
        TabOrder = 29
      end
      object DBEdit13: TDBEdit
        Left = 96
        Top = 520
        Width = 73
        Height = 22
        Anchors = [akLeft, akBottom]
        DataField = 'PERC_DESCONTO_CLIENTE'
        DataSource = DSItens
        TabOrder = 30
      end
      object DBEdit14: TDBEdit
        Left = 184
        Top = 520
        Width = 89
        Height = 22
        Anchors = [akLeft, akBottom]
        DataField = 'PERC_DESCONTO_MECANICO'
        DataSource = DSItens
        TabOrder = 31
      end
      object DBEdit15: TDBEdit
        Left = 280
        Top = 520
        Width = 57
        Height = 22
        Anchors = [akLeft, akBottom]
        DataField = 'PERC_COMISSAO'
        DataSource = DSItens
        TabOrder = 32
      end
      object DBMemo1: TDBMemo
        Left = 480
        Top = 160
        Width = 290
        Height = 79
        Anchors = [akLeft, akTop, akRight]
        DataField = 'DESC_SERVICO'
        DataSource = DSPrimario
        TabOrder = 15
      end
      object DBRadioGroup1: TDBRadioGroup
        Left = 8
        Top = 200
        Width = 153
        Height = 41
        Caption = 'Servi'#231'o Motor'
        Columns = 2
        DataField = 'IND_PARCIAL_TOTAL'
        DataSource = DSPrimario
        Items.Strings = (
          'Parcial'
          'Completo')
        TabOrder = 13
        Values.Strings = (
          'PARCIAL'
          'TOTAL')
      end
      object DBRadioGroup2: TDBRadioGroup
        Left = 288
        Top = 152
        Width = 185
        Height = 41
        Caption = 'Pagamento'
        Columns = 2
        DataField = 'IND_CONDICAO_PAGTO'
        DataSource = DSPrimario
        Items.Strings = (
          'Vista'
          'Prazo')
        TabOrder = 12
        Values.Strings = (
          '1'
          '2')
      end
      object DBDirceu1: TDBDirceu
        Left = 156
        Top = 24
        Width = 178
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        DataField = 'COD_CADASTRO'
        DataSource = DSPrimario
        ParentColor = True
        ReadOnly = True
        TabOrder = 39
        TabStop = False
        diTabela = 'TB_CADASTRO'
        diCampo = 'NOME'
        diChave = 'COD_CADASTRO'
        diCache = False
      end
      object DBDirceu2: TDBDirceu
        Left = 96
        Top = 72
        Width = 153
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        DataField = 'COD_VENDEDOR'
        DataSource = DSPrimario
        ParentColor = True
        ReadOnly = True
        TabOrder = 40
        TabStop = False
        diTabela = 'TB_VENDEDOR'
        diCampo = 'NOME'
        diChave = 'COD_VENDEDOR'
        diCache = False
      end
      object DBDirceu4: TDBDirceu
        Left = 352
        Top = 72
        Width = 225
        Height = 22
        Anchors = [akTop, akRight]
        DataField = 'COD_FILIAL'
        DataSource = DSPrimario
        ParentColor = True
        ReadOnly = True
        TabOrder = 41
        TabStop = False
        diTabela = 'TB_FILIAL'
        diCampo = 'DESC_FILIAL'
        diChave = 'COD_FILIAL'
        diCache = False
      end
      object DBEdit8: TDBEdit
        Left = 9
        Top = 120
        Width = 73
        Height = 22
        DataField = 'COD_MARCA'
        DataSource = DSPrimario
        TabOrder = 8
      end
      object DBDirceu5: TDBDirceu
        Left = 105
        Top = 120
        Width = 208
        Height = 22
        DataField = 'COD_MARCA'
        DataSource = DSPrimario
        ParentColor = True
        ReadOnly = True
        TabOrder = 42
        TabStop = False
        diTabela = 'TB_MARCA'
        diCampo = 'DESC_MARCA'
        diChave = 'COD_MARCA'
        diCache = False
      end
      object DBGItens: TDBGrid
        Left = 8
        Top = 312
        Width = 762
        Height = 105
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = DSItens
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete]
        TabOrder = 43
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Arial'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'COD_OFICINA_ITEM'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'COD_OFICINA_CAB'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'COD_PRODUTO'
            Title.Caption = 'Cod. Produto'
            Width = 71
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESC_COMPLEMENTO'
            Title.Caption = 'Produto'
            Width = 369
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QT_QUANTIDADE'
            Title.Caption = 'Quantidade'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VAL_UNITARIO'
            Title.Caption = 'Valor Unit'#225'rio'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VAL_TOTAL'
            Title.Caption = 'Vlr Bruto'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'val_item'
            Title.Caption = 'Total'
            Width = 69
            Visible = True
          end>
      end
      object DBEProduto: TDBEdit
        Left = 104
        Top = 464
        Width = 57
        Height = 22
        Anchors = [akLeft, akBottom]
        DataField = 'COD_PRODUTO'
        DataSource = DSItens
        TabOrder = 24
      end
      object DBEdit16: TDBEdit
        Left = 521
        Top = 464
        Width = 65
        Height = 22
        Anchors = [akRight, akBottom]
        DataField = 'QT_QUANTIDADE'
        DataSource = DSItens
        TabOrder = 26
      end
      object DBEValUnitario: TDBEdit
        Left = 593
        Top = 464
        Width = 81
        Height = 22
        Anchors = [akRight, akBottom]
        DataField = 'VAL_UNITARIO'
        DataSource = DSItens
        TabOrder = 27
      end
      object ONItens: TOracleNavigator
        Left = 176
        Top = 416
        Width = 414
        Height = 25
        DataSource = DSItens
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
        Anchors = [akLeft, akRight, akBottom]
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
        TabOrder = 44
        OnClick = ONItensClick
      end
      object Panel2: TPanel
        Left = 8
        Top = 296
        Width = 762
        Height = 9
        Anchors = [akLeft, akTop, akRight]
        BevelOuter = bvLowered
        TabOrder = 45
      end
      object DBEdit9: TDBEdit
        Left = 673
        Top = 120
        Width = 97
        Height = 22
        TabStop = False
        Anchors = [akTop, akRight]
        Color = clBtnFace
        DataField = 'DT_FECHAMENTO'
        DataSource = DSPrimario
        ReadOnly = True
        TabOrder = 46
      end
      object DBEdit20: TDBEdit
        Left = 168
        Top = 216
        Width = 65
        Height = 22
        DataField = 'COD_OPERACAO'
        DataSource = DSPrimario
        TabOrder = 14
      end
      object DBDirceu6: TDBDirceu
        Left = 256
        Top = 216
        Width = 217
        Height = 22
        DataField = 'COD_OPERACAO'
        DataSource = DSPrimario
        ParentColor = True
        ReadOnly = True
        TabOrder = 47
        TabStop = False
        diTabela = 'TB_OPERACAO'
        diCampo = 'DESC_OPERACAO'
        diChave = 'COD_OPERACAO'
        diCache = False
      end
      object DBEdit21: TDBEdit
        Left = 184
        Top = 464
        Width = 322
        Height = 22
        Anchors = [akLeft, akRight, akBottom]
        DataField = 'DESC_COMPLEMENTO'
        DataSource = DSItens
        TabOrder = 25
      end
      object DBEdit23: TDBEdit
        Left = 593
        Top = 520
        Width = 81
        Height = 22
        TabStop = False
        Anchors = [akRight, akBottom]
        Color = clBtnFace
        DataField = 'SVAL_DESCONTOS'
        DataSource = DSSomaItemOficina
        ReadOnly = True
        TabOrder = 36
      end
      object DBEdit24: TDBEdit
        Left = 680
        Top = 520
        Width = 89
        Height = 22
        TabStop = False
        Anchors = [akRight, akBottom]
        Color = clBtnFace
        DataField = 'SVAL_TOTAL'
        DataSource = DSSomaItemOficina
        ReadOnly = True
        TabOrder = 37
      end
      object DBEdit1: TDBEdit
        Left = 621
        Top = 24
        Width = 50
        Height = 22
        Anchors = [akTop, akRight]
        DataField = 'NUM_OFICINA_CAB'
        DataSource = DSPrimario
        TabOrder = 4
      end
      object DBEdit7: TDBEdit
        Left = 601
        Top = 72
        Width = 57
        Height = 22
        Anchors = [akTop, akRight]
        DataField = 'COD_VEICULO'
        DataSource = DSPrimario
        TabOrder = 7
      end
      object DBEdit5: TDBEdit
        Left = 264
        Top = 1072
        Width = 144
        Height = 22
        DataField = 'val_desconto'
        DataSource = DSItens
        TabOrder = 48
      end
      object DBEdit22: TDBEdit
        Left = 689
        Top = 464
        Width = 80
        Height = 22
        TabStop = False
        Anchors = [akRight, akBottom]
        Color = clBtnFace
        DataField = 'VAL_TOTAL'
        DataSource = DSItens
        ReadOnly = True
        TabOrder = 28
      end
      object GBDescFechamento: TGroupBox
        Left = 8
        Top = 152
        Width = 266
        Height = 41
        Caption = 'Descontos'
        TabOrder = 11
        object Label38: TLabel
          Left = 17
          Top = 14
          Width = 30
          Height = 14
          Caption = 'Pe'#231'as'
          FocusControl = DBEdit26
        end
        object Label39: TLabel
          Left = 137
          Top = 14
          Width = 43
          Height = 14
          Caption = 'Servi'#231'os'
          FocusControl = DBEdit27
        end
        object DBEdit26: TDBEdit
          Left = 48
          Top = 14
          Width = 57
          Height = 22
          DataField = 'VAL_DESCONTO_PECAS'
          DataSource = DSPrimario
          TabOrder = 0
        end
        object DBEdit27: TDBEdit
          Left = 184
          Top = 14
          Width = 57
          Height = 22
          DataField = 'VAL_DESCONTO_SERVICOS'
          DataSource = DSPrimario
          TabOrder = 1
        end
      end
      object DBEdit18: TDBEdit
        Left = 424
        Top = 520
        Width = 81
        Height = 22
        TabStop = False
        Anchors = [akLeft, akBottom]
        Color = clBtnFace
        DataField = 'val_item'
        DataSource = DSItens
        ReadOnly = True
        TabOrder = 34
      end
      object DBEdit17: TDBEdit
        Left = 344
        Top = 520
        Width = 73
        Height = 22
        TabStop = False
        Anchors = [akLeft, akBottom]
        Color = clBtnFace
        DataField = 'val_desconto'
        DataSource = DSItens
        ReadOnly = True
        TabOrder = 33
      end
      object DBDirceu7: TDBDirceu
        Left = 681
        Top = 72
        Width = 89
        Height = 22
        Anchors = [akTop, akRight]
        DataField = 'COD_VEICULO'
        DataSource = DSPrimario
        ParentColor = True
        ReadOnly = True
        TabOrder = 49
        TabStop = False
        diTabela = 'TB_VEICULO'
        diCampo = 'NUM_PLACA'
        diChave = 'COD_VEICULO'
        diCache = True
      end
      object DBEdit25: TDBEdit
        Left = 321
        Top = 120
        Width = 264
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        DataField = 'DESC_COMPL_MARCA'
        DataSource = DSPrimario
        TabOrder = 9
      end
      object DBEdit6: TDBEdit
        Left = 8
        Top = 264
        Width = 105
        Height = 22
        DataField = 'VAL_VIRA_MANCAL'
        DataSource = DSPrimario
        TabOrder = 16
      end
      object DBEdit28: TDBEdit
        Left = 128
        Top = 264
        Width = 97
        Height = 22
        DataField = 'VAL_VIRA_BIELA'
        DataSource = DSPrimario
        TabOrder = 17
      end
      object DBEdit29: TDBEdit
        Left = 240
        Top = 264
        Width = 89
        Height = 22
        DataField = 'VAL_CARCACA_MANCAL'
        DataSource = DSPrimario
        TabOrder = 18
      end
      object DBEdit30: TDBEdit
        Left = 344
        Top = 264
        Width = 105
        Height = 22
        DataField = 'DESC_CARCACA_ALOJ_C'
        DataSource = DSPrimario
        TabOrder = 19
      end
      object DBEdit31: TDBEdit
        Left = 464
        Top = 264
        Width = 105
        Height = 22
        DataField = 'DESC_COMPR_CILINDRO'
        DataSource = DSPrimario
        TabOrder = 20
      end
      object DBEdit32: TDBEdit
        Left = 584
        Top = 264
        Width = 73
        Height = 22
        DataField = 'DESC_BLOCO_CILINDRO'
        DataSource = DSPrimario
        TabOrder = 21
      end
      object DBEdit33: TDBEdit
        Left = 672
        Top = 264
        Width = 97
        Height = 22
        DataField = 'VAL_COLO_C'
        DataSource = DSPrimario
        TabOrder = 22
      end
      object DBEdit34: TDBEdit
        Left = 505
        Top = 520
        Width = 81
        Height = 22
        TabStop = False
        Anchors = [akRight, akBottom]
        Color = clBtnFace
        DataField = 'SVAL_S_DESCONTO'
        DataSource = DSSomaItemOficina
        ReadOnly = True
        TabOrder = 35
      end
      object DBEdit35: TDBEdit
        Left = 515
        Top = 24
        Width = 46
        Height = 22
        Anchors = [akTop, akRight]
        CharCase = ecUpperCase
        DataField = 'COD_SERIE'
        DataSource = DSPrimario
        TabOrder = 3
      end
      object DBENumFabricante: TDBEdit
        Left = 8
        Top = 464
        Width = 89
        Height = 22
        Anchors = [akLeft, akBottom]
        DataField = 'NUM_FABRICANTE'
        DataSource = DSItens
        TabOrder = 23
      end
      object DBCheckBox1: TDBCheckBox
        Left = 592
        Top = 120
        Width = 65
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'Substituir'
        DataField = 'IND_DESCRICAO_MARCA'
        DataSource = DSPrimario
        TabOrder = 10
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object DBEdit4: TDBEdit
        Left = 568
        Top = 24
        Width = 33
        Height = 22
        TabOrder = 50
      end
    end
    object TSTotal: TTabSheet
      Caption = 'Totais'
      ImageIndex = 1
      object Label56: TLabel
        Left = 16
        Top = 24
        Width = 51
        Height = 14
        Caption = 'VL-MO-B:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText17: TDBText
        Left = 72
        Top = 24
        Width = 97
        Height = 17
        Alignment = taRightJustify
        DataField = 'SVAL_SERVICO_BRUTO'
        DataSource = DSSomaItemOficina
      end
      object Label57: TLabel
        Left = 16
        Top = 40
        Width = 48
        Height = 14
        Caption = 'VL-PC-B:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText20: TDBText
        Left = 72
        Top = 40
        Width = 97
        Height = 17
        Alignment = taRightJustify
        DataField = 'SVAL_PRODUTO_BRUTO'
        DataSource = DSSomaItemOficina
      end
      object Label60: TLabel
        Left = 184
        Top = 24
        Width = 65
        Height = 14
        Caption = 'VL-MO-REC:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText21: TDBText
        Left = 256
        Top = 24
        Width = 97
        Height = 17
        Alignment = taRightJustify
        DataField = 'desc_ven_servico'
        DataSource = DSSomaItemOficina
      end
      object Label61: TLabel
        Left = 184
        Top = 40
        Width = 62
        Height = 14
        Caption = 'VL-PC-REC:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText22: TDBText
        Left = 256
        Top = 40
        Width = 97
        Height = 17
        Alignment = taRightJustify
        DataField = 'desc_ven_produto'
        DataSource = DSSomaItemOficina
      end
      object DBText18: TDBText
        Left = 360
        Top = 24
        Width = 97
        Height = 17
        Alignment = taRightJustify
        DataField = 'desc_cli_servico'
        DataSource = DSSomaItemOficina
      end
      object DBText19: TDBText
        Left = 360
        Top = 40
        Width = 97
        Height = 17
        Alignment = taRightJustify
        DataField = 'desc_cli_produto'
        DataSource = DSSomaItemOficina
      end
      object Label58: TLabel
        Left = 472
        Top = 24
        Width = 62
        Height = 14
        Caption = 'VL-MO-LIQ:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText23: TDBText
        Left = 544
        Top = 24
        Width = 89
        Height = 17
        Alignment = taRightJustify
        DataField = 'desc_mec_servico'
        DataSource = DSSomaItemOficina
      end
      object Label59: TLabel
        Left = 472
        Top = 40
        Width = 59
        Height = 14
        Caption = 'VL-PC-LIQ:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText24: TDBText
        Left = 544
        Top = 40
        Width = 89
        Height = 17
        Alignment = taRightJustify
        DataField = 'desc_mec_produto'
        DataSource = DSSomaItemOficina
      end
      object DBText25: TDBText
        Left = 640
        Top = 24
        Width = 89
        Height = 17
        Alignment = taRightJustify
        DataField = 'SVAL_SERVICO'
        DataSource = DSSomaItemOficina
      end
      object DBText26: TDBText
        Left = 640
        Top = 40
        Width = 89
        Height = 17
        Alignment = taRightJustify
        DataField = 'SVAL_PRODUTO'
        DataSource = DSSomaItemOficina
      end
      object Label62: TLabel
        Left = 16
        Top = 64
        Width = 42
        Height = 14
        Caption = 'TOTAIS:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText27: TDBText
        Left = 72
        Top = 64
        Width = 97
        Height = 17
        Alignment = taRightJustify
        DataField = 'SVAL_S_DESCONTO'
        DataSource = DSSomaItemOficina
      end
      object Label63: TLabel
        Left = 184
        Top = 64
        Width = 43
        Height = 14
        Caption = 'VL-REC:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText29: TDBText
        Left = 256
        Top = 64
        Width = 97
        Height = 17
        Alignment = taRightJustify
        DataField = 'desc_ven'
        DataSource = DSSomaItemOficina
      end
      object DBText30: TDBText
        Left = 360
        Top = 64
        Width = 97
        Height = 17
        Alignment = taRightJustify
        DataField = 'desc_cli'
        DataSource = DSSomaItemOficina
      end
      object Label64: TLabel
        Left = 472
        Top = 64
        Width = 40
        Height = 14
        Caption = 'VL-LIQ:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText31: TDBText
        Left = 544
        Top = 64
        Width = 89
        Height = 17
        Alignment = taRightJustify
        DataField = 'desc_mec'
        DataSource = DSSomaItemOficina
      end
      object DBText32: TDBText
        Left = 640
        Top = 64
        Width = 89
        Height = 17
        Alignment = taRightJustify
        DataField = 'SVAL_TOTAL'
        DataSource = DSSomaItemOficina
      end
    end
  end
  inherited MMCadSimples: TMainMenu
    Left = 608
    inherited Relatrios1: TMenuItem
      object Comisso1: TMenuItem
        Caption = '&Comiss'#227'o'
        OnClick = Comisso1Click
      end
      object EmitirCpiaOramento1: TMenuItem
        Caption = '&Emitir C'#243'pia Or'#231'amento'
        OnClick = EmitirCpiaOramento1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object OrdemdeServio1: TMenuItem
        Caption = 'Ordem de &Servi'#231'o'
        OnClick = OrdemdeServio1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object ImpressoCobrana1: TMenuItem
        Caption = 'Impress'#227'o Cobran'#231'a'
        OnClick = ImpressoCobrana1Click
      end
    end
    object Opes1: TMenuItem
      Caption = '&Op'#231#245'es'
      object Fechar1: TMenuItem
        Caption = '&Confirmar Ordem de Servi'#231'o'
        OnClick = Fechar1Click
      end
      object VoltarConfirmao1: TMenuItem
        Caption = '&Voltar Confirma'#231#227'o'
        OnClick = VoltarConfirmao1Click
      end
      object CancelarOrdemdeServio1: TMenuItem
        Caption = 'C&ancelar Ordem de Servi'#231'o'
        OnClick = CancelarOrdemdeServio1Click
      end
      object VoltarCancelamento1: TMenuItem
        Caption = 'V&oltar Cancelamento'
        OnClick = VoltarCancelamento1Click
      end
      object EmitirNFdaOrdemdeServio1: TMenuItem
        Caption = '&Emitir NF da Ordem de Servi'#231'o'
        OnClick = EmitirNFdaOrdemdeServio1Click
      end
    end
  end
  inherited DSPrimario: TDataSource
    DataSet = DMOficina.QOficinaCad
    Left = 648
  end
  inherited ILBotao: TImageList
    Left = 576
  end
  object DSItens: TDataSource
    AutoEdit = False
    DataSet = DMOficina.QOficinaItem
    OnStateChange = DSItensStateChange
    Left = 680
    Top = 8
  end
  object DSSomaItemOficina: TDataSource
    DataSet = DMOficina.QSomaItemOficina
    Left = 712
    Top = 8
  end
end
