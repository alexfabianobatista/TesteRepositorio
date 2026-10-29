inherited FConhecimentoCad2: TFConhecimentoCad2
  Left = 317
  Top = 32
  Caption = 'Con. Fretes Transportadora'
  ClientHeight = 619
  ClientWidth = 674
  PixelsPerInch = 96
  TextHeight = 14
  inherited Panel1: TPanel
    Width = 674
    inherited SBConsulta: TSpeedButton
      Left = 640
      Top = 10
    end
    object SBNotaCorrecao: TSpeedButton [9]
      Left = 282
      Top = 8
      Width = 25
      Height = 25
      Hint = 'Emitir Carta Corre'#231#227'o'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000055
        555557777777775F55550FFFFFFFFF0555557F5555555F7FFF5F0FEEEEEE0000
        05007F555555777775770FFFFFF0BFBFB00E7F5F5557FFF557770F0EEEE000FB
        FB0E7F75FF57775555770FF00F0FBFBFBF0E7F57757FFFF555770FE0B00000FB
        FB0E7F575777775555770FFF0FBFBFBFBF0E7F5575FFFFFFF5770FEEE0000000
        FB0E7F555777777755770FFFFF0B00BFB0007F55557577FFF7770FEEEEE0B000
        05557F555557577775550FFFFFFF0B0555557FF5F5F57575F55500F0F0F0F0B0
        555577F7F7F7F7F75F5550707070700B055557F7F7F7F7757FF5507070707050
        9055575757575757775505050505055505557575757575557555}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = SBNotaCorrecaoClick
    end
    inherited lbPesquisaCodigo: TLabel
      Left = 536
    end
    inherited MELocaliza: TMaskEdit
      Left = 592
    end
    inherited pnSeparador2: TPanel
      Left = 524
    end
  end
  object PageControl1: TPageControl [2]
    Left = 0
    Top = 48
    Width = 674
    Height = 552
    ActivePage = TabSheet1
    Align = alBottom
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'Geral'
      object Label31: TLabel
        Left = 88
        Top = 130
        Width = 48
        Height = 14
        Caption = 'QT_NOTA'
      end
      object Panel3: TPanel
        Left = 11
        Top = 338
        Width = 643
        Height = 87
        BevelOuter = bvLowered
        TabOrder = 16
        object DBPanel3: TDBPanel
          Left = 416
          Top = 8
          Width = 65
          Height = 37
          BevelOuter = bvNone
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          CodigoTabStop = True
          DataField = 'COD_MENSAGEM'
          DataSource = DSPrimario
          DefineByForm = DBPanel3DefineByForm
          fkCache = False
          fkChave = 'COD_MENSAGEM'
          fkTabela = 'TB_MENSAGEM'
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
          LCaption = 'Mensagem'
          ReadOnly = False
          Required = False
          ValidateOnExit = False
          VisibleComponents = [dbpcCodigo, dbpcBusca]
          WidthCodigo = 20.000000000000000000
        end
        object DBPanel8: TDBPanel
          Left = 488
          Top = 8
          Width = 81
          Height = 37
          BevelOuter = bvNone
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          CodigoTabStop = False
          DataField = 'VAL_SEST_SENAT'
          DataSource = DSPrimario
          fkCache = False
          fkChave = 'VAL_SEST_SENAT'
          ForeignKey = False
          LCaption = 'Sest/Senat'
          ReadOnly = True
          Required = False
          ValidateOnExit = False
          WidthCodigo = 20.000000000000000000
        end
        object DBPanel5: TDBPanel
          Left = 576
          Top = 48
          Width = 64
          Height = 37
          BevelOuter = bvNone
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
          CodigoTabStop = True
          DataField = 'VAL_ICMS'
          DataSource = DSPrimario
          fkCache = False
          fkChave = 'VAL_ICMS'
          ForeignKey = False
          LCaption = 'Icms'
          ReadOnly = False
          Required = False
          ValidateOnExit = False
          WidthCodigo = 20.000000000000000000
        end
        object DBPanel4: TDBPanel
          Left = 488
          Top = 48
          Width = 81
          Height = 37
          BevelOuter = bvNone
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          CodigoTabStop = False
          DataField = 'VAL_IRF'
          DataSource = DSPrimario
          fkCache = False
          fkChave = 'VAL_IRF'
          ForeignKey = False
          LCaption = 'I.R.'
          ReadOnly = True
          Required = False
          ValidateOnExit = False
          WidthCodigo = 20.000000000000000000
        end
        object DBPanel6: TDBPanel
          Left = 8
          Top = 48
          Width = 294
          Height = 37
          BevelOuter = bvNone
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          CodigoTabStop = True
          DataField = 'DESC_OBS2'
          DataSource = DSPrimario
          fkCache = False
          fkChave = 'DESC_OBS2'
          ForeignKey = False
          LCaption = 'DESC_OBS2'
          ReadOnly = False
          Required = False
          ValidateOnExit = False
          WidthCodigo = 20.000000000000000000
        end
        object DBPanel7: TDBPanel
          Left = 576
          Top = 8
          Width = 64
          Height = 37
          BevelOuter = bvNone
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          CodigoTabStop = False
          DataField = 'VAL_INSS_FORNECEDOR'
          DataSource = DSPrimario
          fkCache = False
          fkChave = 'VAL_INSS_FORNECEDOR'
          ForeignKey = False
          LCaption = 'Vl.Inss'
          ReadOnly = True
          Required = False
          ValidateOnExit = False
          WidthCodigo = 20.000000000000000000
        end
        object DBPanel9: TDBPanel
          Left = 312
          Top = 48
          Width = 169
          Height = 37
          BevelOuter = bvNone
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          CodigoTabStop = True
          DataField = 'DESC_CARTAO_PEDAGIO'
          DataSource = DSPrimario
          fkCache = False
          fkChave = 'DESC_CARTAO_PEDAGIO'
          ForeignKey = False
          LCaption = 'Cart'#227'o ped'#225'gio'
          ReadOnly = False
          Required = False
          ValidateOnExit = False
          WidthCodigo = 20.000000000000000000
        end
        object DBPanel2: TDBPanel
          Left = 8
          Top = 8
          Width = 400
          Height = 37
          BevelOuter = bvNone
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          CodigoTabStop = True
          DataField = 'DESC_OBS'
          DataSource = DSPrimario
          fkCache = False
          fkChave = 'DESC_OBS'
          ForeignKey = False
          LCaption = 'Observa'#231#227'o'
          ReadOnly = False
          Required = False
          ValidateOnExit = False
          WidthCodigo = 20.000000000000000000
        end
      end
      object TPanel
        Left = 331
        Top = 85
        Width = 323
        Height = 253
        BevelOuter = bvLowered
        TabOrder = 15
        object Label1: TLabel
          Left = 8
          Top = 205
          Width = 47
          Height = 14
          Caption = 'Descarga'
          FocusControl = DBEdit2
        end
        object DBPanel10: TDBPanel
          Left = 8
          Top = 8
          Width = 305
          Height = 37
          BevelOuter = bvNone
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          CodigoTabStop = True
          DataField = 'COD_CADASTRO'
          DataSource = DSPrimario
          DefineByForm = DBPanel10DefineByForm
          fkCache = False
          fkCampo = 'NOME'
          fkChave = 'COD_CADASTRO'
          fkTabela = 'TB_CADASTRO'
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
          LCaption = 'Destinat'#225'rio'
          ReadOnly = False
          Required = True
          ValidateOnExit = False
          VisibleComponents = [dbpcCodigo, dbpcBusca, dbpcDescricao]
          WidthCodigo = 20.000000000000000000
        end
        object DBPanel11: TDBPanel
          Left = 8
          Top = 88
          Width = 209
          Height = 37
          BevelOuter = bvNone
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          CodigoTabStop = True
          DataField = 'COD_TRIBUTACAO'
          DataSource = DSPrimario
          DefineByForm = DBPanel11DefineByForm
          fkCache = False
          fkCampo = 'DESC_TRIBUTACAO'
          fkChave = 'COD_TRIBUTACAO'
          fkTabela = 'TB_TRIBUTACAO'
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
          LCaption = 'Tributa'#231#227'o'
          ReadOnly = False
          Required = True
          ValidateOnExit = False
          VisibleComponents = [dbpcCodigo, dbpcBusca, dbpcDescricao]
          WidthCodigo = 20.000000000000000000
        end
        object DBPanel12: TDBPanel
          Left = 232
          Top = 128
          Width = 80
          Height = 37
          BevelOuter = bvNone
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
          CodigoTabStop = True
          DataField = 'VAL_FRETE'
          DataSource = DSPrimario
          fkCache = False
          fkChave = 'VAL_FRETE'
          ForeignKey = False
          LCaption = 'Valor Frete'
          ReadOnly = False
          Required = True
          ValidateOnExit = False
          WidthCodigo = 20.000000000000000000
        end
        object DBPanel13: TDBPanel
          Left = 96
          Top = 128
          Width = 66
          Height = 37
          BevelOuter = bvNone
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          CodigoTabStop = True
          DataField = 'PERC_DESCONTO_FRETE'
          DataSource = DSPrimario
          fkCache = False
          fkChave = 'PERC_DESCONTO_FRETE'
          ForeignKey = False
          LCaption = '%Desc.Frete'
          ReadOnly = False
          Required = False
          ValidateOnExit = False
          WidthCodigo = 20.000000000000000000
        end
        object DBPanel14: TDBPanel
          Left = 8
          Top = 168
          Width = 69
          Height = 37
          BevelOuter = bvNone
          ParentShowHint = False
          ShowHint = True
          TabOrder = 8
          CodigoTabStop = True
          DataField = 'VAL_ADIANTAMENTO'
          DataSource = DSPrimario
          fkCache = False
          fkChave = 'VAL_ADIANTAMENTO'
          ForeignKey = False
          LCaption = 'Adiantamento'
          ReadOnly = False
          Required = False
          ValidateOnExit = False
          WidthCodigo = 20.000000000000000000
        end
        object DBPanel15: TDBPanel
          Left = 8
          Top = 48
          Width = 50
          Height = 37
          BevelOuter = bvNone
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          CodigoTabStop = True
          DataField = 'PERC_TOLERANCIA'
          DataSource = DSPrimario
          fkCache = False
          fkChave = 'PERC_TOLERANCIA'
          ForeignKey = False
          LCaption = 'Toler'#226'ncia'
          ReadOnly = False
          Required = False
          ValidateOnExit = False
          WidthCodigo = 20.000000000000000000
        end
        object DBPanel16: TDBPanel
          Left = 72
          Top = 48
          Width = 241
          Height = 37
          BevelOuter = bvNone
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          CodigoTabStop = True
          DataField = 'DESC_SEGURADORA'
          DataSource = DSPrimario
          fkCache = False
          fkChave = 'DESC_SEGURADORA'
          ForeignKey = False
          LCaption = 'Seguradora'
          ReadOnly = False
          Required = False
          ValidateOnExit = False
          WidthCodigo = 20.000000000000000000
        end
        object DBPanel17: TDBPanel
          Left = 8
          Top = 128
          Width = 81
          Height = 37
          BevelOuter = bvNone
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          CodigoTabStop = True
          DataField = 'VAL_PEDAGIO'
          DataSource = DSPrimario
          fkCache = False
          fkChave = 'VAL_PEDAGIO'
          ForeignKey = False
          LCaption = 'Ped'#225'gio'
          ReadOnly = False
          Required = False
          ValidateOnExit = False
          WidthCodigo = 20.000000000000000000
        end
        object DBPanel18: TDBPanel
          Left = 88
          Top = 168
          Width = 133
          Height = 37
          BevelOuter = bvNone
          ParentShowHint = False
          ShowHint = True
          TabOrder = 9
          CodigoTabStop = True
          DataField = 'DESC_TARIFA'
          DataSource = DSPrimario
          fkCache = False
          fkChave = 'DESC_TARIFA'
          ForeignKey = False
          LCaption = 'Tarifa'
          ReadOnly = False
          Required = False
          ValidateOnExit = False
          WidthCodigo = 20.000000000000000000
        end
        object DBPanel19: TDBPanel
          Left = 232
          Top = 168
          Width = 80
          Height = 37
          BevelOuter = bvNone
          ParentShowHint = False
          ShowHint = True
          TabOrder = 10
          CodigoTabStop = True
          DataField = 'VAL_INSS_PG_OUTRAS_EMPRESAS'
          DataSource = DSPrimario
          fkCache = False
          fkChave = 'VAL_INSS_PG_OUTRAS_EMPRESAS'
          ForeignKey = False
          LCaption = 'Vl.Inss Pago '
          ReadOnly = False
          Required = False
          ValidateOnExit = False
          WidthCodigo = 20.000000000000000000
        end
        object DBPanel20: TDBPanel
          Left = 224
          Top = 88
          Width = 89
          Height = 37
          BevelOuter = bvNone
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          CodigoTabStop = True
          DataField = 'VAL_SEGURO'
          DataSource = DSPrimario
          fkCache = False
          fkChave = 'VAL_SEGURO'
          ForeignKey = False
          LCaption = 'Valor Seguro'
          ReadOnly = False
          Required = False
          ValidateOnExit = False
          WidthCodigo = 20.000000000000000000
        end
        object DBEdit1: TDBEdit
          Left = 296
          Top = 232
          Width = 18
          Height = 22
          DataField = 'IND_SITUACAO'
          DataSource = DSPrimario
          TabOrder = 11
          Visible = False
          OnChange = DBEdit1Change
        end
        object DBEdit2: TDBEdit
          Left = 8
          Top = 221
          Width = 81
          Height = 22
          DataField = 'VAL_DESCARGA'
          DataSource = DSPrimario
          TabOrder = 12
        end
      end
      object Panel2: TPanel
        Left = 11
        Top = 85
        Width = 320
        Height = 253
        BevelOuter = bvLowered
        TabOrder = 14
        object DBEdit18: TDBEdit
          Left = 88
          Top = 102
          Width = 224
          Height = 22
          TabStop = False
          Color = clBtnFace
          DataField = 'Desc_Veiculo'
          DataSource = DSPrimario
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit37: TDBEdit
          Left = 88
          Top = 142
          Width = 224
          Height = 22
          TabStop = False
          Color = clBtnFace
          DataField = 'desc_veiculo_reboque'
          DataSource = DSPrimario
          ReadOnly = True
          TabOrder = 5
        end
        object DBPanel26: TDBPanel
          Left = 8
          Top = 8
          Width = 305
          Height = 37
          BevelOuter = bvNone
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          CodigoTabStop = True
          DataField = 'COD_FILIAL'
          DataSource = DSPrimario
          DefineByForm = DBPanel26DefineByForm
          fkCache = False
          fkCampo = 'DESC_FILIAL'
          fkChave = 'COD_FILIAL'
          fkTabela = 'TB_FILIAL'
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
          LCaption = 'Filial'
          ReadOnly = False
          Required = True
          ValidateOnExit = False
          VisibleComponents = [dbpcCodigo, dbpcBusca, dbpcDescricao]
          WidthCodigo = 20.000000000000000000
        end
        object DBPanel27: TDBPanel
          Left = 8
          Top = 48
          Width = 305
          Height = 37
          BevelOuter = bvNone
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          CodigoTabStop = True
          DataField = 'COD_MOTORISTA'
          DataSource = DSPrimario
          DefineByForm = DBPanel27DefineByForm
          fkCache = False
          fkCampo = 'NOME'
          fkChave = 'COD_CADASTRO'
          fkTabela = 'TB_CADASTRO'
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
          LCaption = 'Motorista'
          ReadOnly = False
          Required = True
          ValidateOnExit = False
          VisibleComponents = [dbpcCodigo, dbpcBusca, dbpcDescricao]
          WidthCodigo = 20.000000000000000000
        end
        object DBPanel28: TDBPanel
          Left = 8
          Top = 88
          Width = 81
          Height = 37
          BevelOuter = bvNone
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          CodigoTabStop = True
          DataField = 'DESC_PLACA'
          DataSource = DSPrimario
          DefineByForm = DBPanel28DefineByForm
          fkCache = False
          fkChave = 'DESC_PLACA'
          fkTabela = 'TB_VEICULO_CONHECIMENTO'
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
          LCaption = 'Placa'
          ReadOnly = False
          Required = False
          ValidateOnExit = False
          VisibleComponents = [dbpcCodigo, dbpcBusca]
          WidthCodigo = 20.000000000000000000
        end
        object DBPanel29: TDBPanel
          Left = 8
          Top = 168
          Width = 303
          Height = 37
          BevelOuter = bvNone
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          CodigoTabStop = True
          DataField = 'DESC_LOCAL_COLETA'
          DataSource = DSPrimario
          fkCache = False
          fkChave = 'DESC_LOCAL_COLETA'
          ForeignKey = False
          LCaption = 'Local Coleta'
          ReadOnly = False
          Required = False
          ValidateOnExit = False
          WidthCodigo = 20.000000000000000000
        end
        object DBPanel30: TDBPanel
          Left = 8
          Top = 208
          Width = 303
          Height = 37
          BevelOuter = bvNone
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
          CodigoTabStop = True
          DataField = 'DESC_LOCAL_ENTREGA'
          DataSource = DSPrimario
          fkCache = False
          fkChave = 'DESC_LOCAL_ENTREGA'
          ForeignKey = False
          LCaption = 'Local Entrega'
          ReadOnly = False
          Required = False
          ValidateOnExit = False
          WidthCodigo = 20.000000000000000000
        end
        object DBPanel31: TDBPanel
          Left = 8
          Top = 128
          Width = 81
          Height = 37
          BevelOuter = bvNone
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          CodigoTabStop = True
          DataField = 'DESC_PLACA_REBOQUE'
          DataSource = DSPrimario
          DefineByForm = DBPanel31DefineByForm
          fkCache = False
          fkChave = 'DESC_PLACA'
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
          LCaption = 'Reboque'
          ReadOnly = False
          Required = False
          ValidateOnExit = False
          VisibleComponents = [dbpcCodigo, dbpcBusca]
          WidthCodigo = 20.000000000000000000
        end
      end
      object DBRadioGroup1: TDBRadioGroup
        Left = 136
        Top = 477
        Width = 185
        Height = 36
        Caption = 'Tarifa'
        Columns = 2
        DataField = 'IND_PAGAR_PAGO'
        DataSource = DSPrimario
        Items.Strings = (
          'A pagar'
          'Pago')
        TabOrder = 20
        Values.Strings = (
          'PAGAR'
          'PAGO')
      end
      object DBPNumNota: TDBPanel
        Left = 88
        Top = 0
        Width = 65
        Height = 40
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        CodigoTabStop = True
        DataField = 'NUM_NOTA'
        DataSource = DSPrimario
        fkCache = False
        fkChave = 'NUM_NOTA'
        ForeignKey = False
        LCaption = 'N'#186' Nota'
        ReadOnly = False
        Required = False
        ValidateOnExit = False
        WidthCodigo = 20.000000000000000000
      end
      object DBPanel21: TDBPanel
        Left = 8
        Top = 40
        Width = 65
        Height = 37
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        CodigoTabStop = True
        DataField = 'DT_RECEBIMENTO'
        DataSource = DSPrimario
        fkCache = False
        fkChave = 'DT_RECEBIMENTO'
        ForeignKey = False
        LCaption = 'Dt.Recebimento'
        ReadOnly = False
        Required = False
        ValidateOnExit = False
        WidthCodigo = 20.000000000000000000
      end
      object DBPanel22: TDBPanel
        Left = 528
        Top = 0
        Width = 65
        Height = 37
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        CodigoTabStop = True
        DataField = 'COD_SERIE'
        DataSource = DSPrimario
        DefineByForm = DBPanel22DefineByForm
        fkCache = False
        fkChave = 'COD_SERIE'
        fkTabela = 'TB_SERIE'
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
        LCaption = 'S'#233'rie'
        ReadOnly = False
        Required = True
        ValidateOnExit = False
        VisibleComponents = [dbpcCodigo, dbpcBusca]
        WidthCodigo = 20.000000000000000000
      end
      object DBPanel23: TDBPanel
        Left = 8
        Top = 0
        Width = 73
        Height = 37
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        CodigoTabStop = False
        DataField = 'COD_CONHECIMENTO'
        DataSource = DSPrimario
        fkCache = False
        fkChave = 'COD_CONHECIMENTO'
        ForeignKey = False
        LCaption = 'Conhecimento'
        OnCodigoChange = DBPanel23CodigoChange
        ReadOnly = True
        Required = False
        ValidateOnExit = False
        WidthCodigo = 20.000000000000000000
      end
      object DBPanel24: TDBPanel
        Left = 416
        Top = 40
        Width = 233
        Height = 37
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 13
        CodigoTabStop = True
        DataField = 'COD_OPERACAO'
        DataSource = DSPrimario
        DefineByForm = DBPanel24DefineByForm
        fkCache = False
        fkCampo = 'DESC_OPERACAO'
        fkChave = 'COD_OPERACAO'
        fkTabela = 'TB_OPERACAO'
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
        LCaption = 'Opera'#231#227'o'
        ReadOnly = False
        Required = True
        ValidateOnExit = False
        VisibleComponents = [dbpcCodigo, dbpcBusca, dbpcDescricao]
        WidthCodigo = 20.000000000000000000
      end
      object DBPanel25: TDBPanel
        Left = 424
        Top = 0
        Width = 97
        Height = 37
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        CodigoTabStop = True
        DataField = 'NUM_CONHECIMENTO'
        DataSource = DSPrimario
        fkCache = False
        fkChave = 'NUM_CONHECIMENTO'
        ForeignKey = False
        LCaption = 'N'#186' Conhecimento'
        ReadOnly = False
        Required = True
        ValidateOnExit = False
        WidthCodigo = 20.000000000000000000
      end
      object DBPanel32: TDBPanel
        Left = 80
        Top = 40
        Width = 77
        Height = 37
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        CodigoTabStop = True
        DataField = 'VAL_NOTA'
        DataSource = DSPrimario
        fkCache = False
        fkChave = 'VAL_NOTA'
        ForeignKey = False
        LCaption = 'Valor Nota'
        ReadOnly = False
        Required = False
        ValidateOnExit = False
        WidthCodigo = 20.000000000000000000
      end
      object DBPanel33: TDBPanel
        Left = 160
        Top = 40
        Width = 79
        Height = 37
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 9
        CodigoTabStop = True
        DataField = 'QT_NOTA'
        DataSource = DSPrimario
        fkCache = False
        fkChave = 'QT_NOTA'
        ForeignKey = False
        LCaption = 'Quantidade'
        OnCodigoExit = DBPanel33CodigoExit
        ReadOnly = False
        Required = False
        ValidateOnExit = False
        WidthCodigo = 20.000000000000000000
      end
      object DBPanel34: TDBPanel
        Left = 616
        Top = 0
        Width = 33
        Height = 37
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        CodigoTabStop = False
        DataField = 'IND_SITUACAO'
        DataSource = DSPrimario
        fkCache = False
        fkChave = 'IND_SITUACAO'
        ForeignKey = False
        LCaption = 'Desc_Veiculo'
        ReadOnly = True
        Required = False
        ValidateOnExit = False
        WidthCodigo = 20.000000000000000000
      end
      object DBPanel35: TDBPanel
        Left = 240
        Top = 40
        Width = 65
        Height = 37
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 10
        CodigoTabStop = True
        DataField = 'DT_EMISSAO'
        DataSource = DSPrimario
        fkCache = False
        fkChave = 'DT_EMISSAO'
        ForeignKey = False
        LCaption = 'Dt. Emiss'#227'o'
        ReadOnly = False
        Required = True
        ValidateOnExit = False
        WidthCodigo = 20.000000000000000000
      end
      object DBPanel36: TDBPanel
        Left = 16
        Top = 432
        Width = 305
        Height = 37
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 17
        CodigoTabStop = True
        DataField = 'COD_CADASTRO_REMETENTE'
        DataSource = DSPrimario
        DefineByForm = DBPanel36DefineByForm
        fkCache = False
        fkCampo = 'NOME'
        fkChave = 'COD_CADASTRO'
        fkTabela = 'TB_CADASTRO'
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
        LCaption = 'Remetente'
        ReadOnly = False
        Required = False
        ValidateOnExit = False
        VisibleComponents = [dbpcCodigo, dbpcBusca, dbpcDescricao]
        WidthCodigo = 20.000000000000000000
      end
      object DBPanel37: TDBPanel
        Left = 344
        Top = 432
        Width = 305
        Height = 37
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 18
        CodigoTabStop = True
        DataField = 'COD_CADASTRO_PAGADOR'
        DataSource = DSPrimario
        DefineByForm = DBPanel37DefineByForm
        fkCache = False
        fkCampo = 'NOME'
        fkChave = 'COD_CADASTRO'
        fkTabela = 'TB_CADASTRO'
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
        LCaption = 'Pagador'
        ReadOnly = False
        Required = False
        ValidateOnExit = False
        VisibleComponents = [dbpcCodigo, dbpcBusca, dbpcDescricao]
        WidthCodigo = 20.000000000000000000
      end
      object DBPanel38: TDBPanel
        Left = 360
        Top = 0
        Width = 57
        Height = 37
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        CodigoTabStop = True
        DataField = 'VAL_TARIFA'
        DataSource = DSPrimario
        fkCache = False
        fkChave = 'VAL_TARIFA'
        ForeignKey = False
        LCaption = 'Tarifa'
        ReadOnly = False
        Required = False
        ValidateOnExit = False
        WidthCodigo = 20.000000000000000000
      end
      object DBPanel39: TDBPanel
        Left = 16
        Top = 472
        Width = 89
        Height = 37
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 19
        CodigoTabStop = True
        DataField = 'VAL_TARIFA_PROPRIETARIO'
        DataSource = DSPrimario
        fkCache = False
        fkChave = 'VAL_TARIFA_PROPRIETARIO'
        ForeignKey = False
        LCaption = 'Tarifa Propriet'#225'rio'
        ReadOnly = False
        Required = False
        ValidateOnExit = False
        WidthCodigo = 20.000000000000000000
      end
      object DBPanel40: TDBPanel
        Left = 160
        Top = 0
        Width = 193
        Height = 37
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        CodigoTabStop = True
        DataField = 'COD_PRODUTO'
        DataSource = DSPrimario
        DefineByForm = DBPanel40DefineByForm
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
        ReadOnly = False
        Required = False
        ValidateOnExit = False
        VisibleComponents = [dbpcCodigo, dbpcBusca, dbpcDescricao]
        WidthCodigo = 30.000000000000000000
      end
      object DBPanel41: TDBPanel
        Left = 312
        Top = 40
        Width = 46
        Height = 37
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 11
        CodigoTabStop = True
        DataField = 'NUM_VOLUME'
        DataSource = DSPrimario
        fkCache = False
        fkChave = 'NUM_VOLUME'
        ForeignKey = False
        LCaption = 'Volumes'
        ReadOnly = False
        Required = False
        ValidateOnExit = False
        WidthCodigo = 20.000000000000000000
      end
      object DBPanel42: TDBPanel
        Left = 360
        Top = 40
        Width = 48
        Height = 37
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 12
        CodigoTabStop = True
        DataField = 'DESC_ESPECIE_VOLUME'
        DataSource = DSPrimario
        fkCache = False
        fkChave = 'DESC_ESPECIE_VOLUME'
        ForeignKey = False
        LCaption = 'Unid.'
        ReadOnly = False
        Required = False
        ValidateOnExit = False
        WidthCodigo = 20.000000000000000000
      end
      object DBPanel43: TDBPanel
        Left = 344
        Top = 472
        Width = 305
        Height = 37
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 21
        CodigoTabStop = True
        DataField = 'COD_CADASTRO_CONSIGNATARIO'
        DataSource = DSPrimario
        DefineByForm = DBPanel43DefineByForm
        fkCache = False
        fkCampo = 'NOME'
        fkChave = 'COD_CADASTRO'
        fkTabela = 'TB_CADASTRO'
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
        LCaption = 'Consignat'#225'rio'
        ReadOnly = False
        Required = False
        ValidateOnExit = False
        VisibleComponents = [dbpcCodigo, dbpcBusca, dbpcDescricao]
        WidthCodigo = 20.000000000000000000
      end
    end
  end
  inherited StBLongHint: TStatusBar
    Top = 600
    Width = 674
  end
  inherited MMCadSimples: TMainMenu
    inherited Relatrios1: TMenuItem
      object ImpressoCpiaConhecimento1: TMenuItem
        Caption = 'Impress'#227'o C'#243'pia Conhecimento'
        OnClick = ImpressoCpiaConhecimento1Click
      end
      object ImpressoConhecimentocConhtrato1: TMenuItem
        Caption = 'Impress'#227'o Conhecimento c/ Contrato'
        OnClick = ImpressoConhecimentocConhtrato1Click
      end
      object ImpressoConhecimentosContrato1: TMenuItem
        Caption = 'Impress'#227'o Conhecimento s/ Contrato'
        OnClick = ImpressoConhecimentosContrato1Click
      end
      object RelConhecimento1: TMenuItem
        Caption = 'Rel Conhecimento Propriet'#225'rio'
        OnClick = RelConhecimento1Click
      end
      object RelConhecimentoCarga1: TMenuItem
        Caption = 'Rel Conhecimento Carga'
        OnClick = RelConhecimentoCarga1Click
      end
      object RelConhecimentoIRF1: TMenuItem
        Caption = 'Rel Conhecimento IRF'
        OnClick = RelConhecimentoIRF1Click
      end
      object RelConhecimentoINSSRetido1: TMenuItem
        Caption = 'Rel Conhecimento INSS Retido'
        OnClick = RelConhecimentoINSSRetido1Click
      end
      object EmitirMICDTA1: TMenuItem
        Caption = 'Emitir MIC/DTA'
        Visible = False
        OnClick = EmitirMICDTA1Click
      end
    end
    object Operaes1: TMenuItem
      Caption = '&Opera'#231#245'es'
      object Confirma1: TMenuItem
        Caption = 'Confirma'
        OnClick = Confirma1Click
      end
      object VoltarConfirmao1: TMenuItem
        Caption = 'Voltar Confirma'#231#227'o'
        OnClick = VoltarConfirmao1Click
      end
      object Cancela1: TMenuItem
        Caption = 'Cancela'
        OnClick = Cancela1Click
      end
      object VoltarCancelamento1: TMenuItem
        Caption = 'Voltar Cancelamento'
        OnClick = VoltarCancelamento1Click
      end
    end
  end
  inherited DSPrimario: TDataSource
    DataSet = DMConhecimento.QConhecimentoCad
  end
end
