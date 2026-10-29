inherited FViagemCad: TFViagemCad
  Left = 541
  Top = 186
  Caption = 'Cadastro de viagem'
  ClientHeight = 407
  ClientWidth = 518
  PixelsPerInch = 96
  TextHeight = 14
  inherited Panel1: TPanel
    Width = 518
    inherited lbPesquisaCodigo: TLabel
      Left = 373
    end
    inherited SBConsulta: TSpeedButton
      Left = 477
    end
    inherited pnSeparador2: TPanel
      Left = 361
    end
    inherited MELocaliza: TMaskEdit
      Left = 429
    end
  end
  inherited StBLongHint: TStatusBar
    Top = 388
    Width = 518
  end
  object PageControl1: TPageControl [3]
    Left = 0
    Top = 40
    Width = 521
    Height = 353
    ActivePage = tbsControleViagem
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    object tbsCabecalho: TTabSheet
      Caption = 'Cabe'#231'alho'
      DesignSize = (
        513
        324)
      object Label8: TLabel
        Left = 535
        Top = 5
        Width = 108
        Height = 14
        Caption = '* Campos Obrigat'#243'rios'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object DBPPlaca: TDBPanel
        Left = 16
        Top = 88
        Width = 377
        Height = 37
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        CodigoTabStop = True
        DataField = 'DESC_PLACA'
        DataSource = DSPrimario
        DefineByForm = DBPPlacaDefineByForm
        fkCache = False
        fkCampo = 'DESC_VEICULO'
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
        LCaption = 'Placa do ve'#237'culo'
        ReadOnly = False
        Required = True
        ValidateOnExit = False
        VisibleComponents = [dbpcCodigo, dbpcBusca, dbpcDescricao]
        WidthCodigo = 20.000000000000000000
      end
      object GroupBox1: TGroupBox
        Left = 16
        Top = 176
        Width = 494
        Height = 81
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Valores de frete'
        TabOrder = 5
        object DBPFreteSaida: TDBPanel
          Left = 6
          Top = 24
          Width = 71
          Height = 37
          BevelOuter = bvNone
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          CodigoTabStop = True
          DataField = 'VL_FRETE_IDA'
          DataSource = DSPrimario
          fkCache = False
          fkChave = 'VL_FRETE_IDA'
          ForeignKey = False
          LCaption = 'Ida'
          OnCodigoExit = DBPFreteSaidaCodigoExit
          ReadOnly = False
          Required = False
          ValidateOnExit = False
          WidthCodigo = 20.000000000000000000
        end
        object DBPFreteVolta: TDBPanel
          Left = 81
          Top = 24
          Width = 71
          Height = 37
          BevelOuter = bvNone
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          CodigoTabStop = True
          DataField = 'VL_FRETE_VOLTA'
          DataSource = DSPrimario
          fkCache = False
          fkChave = 'VL_FRETE_VOLTA'
          ForeignKey = False
          LCaption = 'Retorno'
          OnCodigoExit = DBPFreteVoltaCodigoExit
          ReadOnly = False
          Required = False
          ValidateOnExit = False
          WidthCodigo = 20.000000000000000000
        end
        object DBPFreteTotal: TDBPanel
          Left = 156
          Top = 24
          Width = 71
          Height = 37
          BevelOuter = bvNone
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          CodigoTabStop = True
          DataField = 'VL_FRETE_TOTAL'
          DataSource = DSPrimario
          fkCache = False
          fkChave = 'VL_FRETE_TOTAL'
          ForeignKey = False
          LCaption = 'Total'
          ReadOnly = False
          Required = False
          ValidateOnExit = False
          WidthCodigo = 20.000000000000000000
        end
        object DBPComissao: TDBPanel
          Left = 230
          Top = 24
          Width = 71
          Height = 37
          BevelOuter = bvNone
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          CodigoTabStop = True
          DataField = 'VL_COMISSAO'
          DataSource = DSPrimario
          fkCache = False
          fkChave = 'VL_COMISSAO'
          ForeignKey = False
          LCaption = 'Comiss'#227'o'
          ReadOnly = False
          Required = False
          ValidateOnExit = False
          WidthCodigo = 20.000000000000000000
        end
        object DBPAdiantamento: TDBPanel
          Left = 305
          Top = 24
          Width = 71
          Height = 37
          BevelOuter = bvNone
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          CodigoTabStop = True
          DataField = 'VL_ADIANTAMENTO'
          DataSource = DSPrimario
          fkCache = False
          fkChave = 'VL_ADIANTAMENTO'
          ForeignKey = False
          LCaption = 'Adiantamento'
          ReadOnly = False
          Required = False
          ValidateOnExit = False
          WidthCodigo = 20.000000000000000000
        end
        object DBPSaldoReceber: TDBPanel
          Left = 386
          Top = 24
          Width = 98
          Height = 37
          BevelOuter = bvNone
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          CodigoTabStop = False
          DataField = 'sval_saldo_receber'
          DataSource = DSPrimario
          fkCache = False
          fkChave = 'sval_saldo_receber'
          ForeignKey = False
          LCaption = 'Saldo a receber'
          ReadOnly = True
          Required = False
          ValidateOnExit = False
          WidthCodigo = 20.000000000000000000
        end
      end
      object DBPCodigo: TDBPanel
        Left = 16
        Top = 8
        Width = 65
        Height = 37
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        CodigoTabStop = False
        DataField = 'COD_VIAGEM'
        DataSource = DSPrimario
        fkCache = False
        fkChave = 'COD_VIAGEM'
        ForeignKey = False
        LCaption = 'C'#243'digo'
        ReadOnly = True
        Required = False
        ValidateOnExit = False
        WidthCodigo = 20.000000000000000000
      end
      object DBPData: TDBPanel
        Left = 88
        Top = 8
        Width = 73
        Height = 37
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        CodigoTabStop = True
        DataField = 'DT_VIAGEM'
        DataSource = DSPrimario
        fkCache = False
        fkChave = 'DT_VIAGEM'
        ForeignKey = False
        LCaption = 'Data'
        ReadOnly = False
        Required = True
        ValidateOnExit = False
        WidthCodigo = 20.000000000000000000
      end
      object DBPDescricao: TDBPanel
        Left = 16
        Top = 128
        Width = 377
        Height = 37
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        CodigoTabStop = True
        DataField = 'DESC_VIAGEM'
        DataSource = DSPrimario
        fkCache = False
        fkChave = 'DESC_VIAGEM'
        ForeignKey = False
        LCaption = 'Descri'#231#227'o'
        ReadOnly = False
        Required = False
        ValidateOnExit = False
        WidthCodigo = 20.000000000000000000
      end
      object DBPFilial: TDBPanel
        Left = 17
        Top = 47
        Width = 376
        Height = 37
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        CodigoTabStop = True
        DataField = 'COD_FILIAL'
        DataSource = DSPrimario
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
    end
    object tbsControleViagem: TTabSheet
      Caption = 'Controle de Viagem'
      ImageIndex = 1
      object Label1: TLabel
        Left = 16
        Top = 248
        Width = 59
        Height = 14
        Caption = 'Qtd. Viagem'
      end
      object Label2: TLabel
        Left = 88
        Top = 248
        Width = 69
        Height = 14
        Caption = 'Qtde Produtos'
      end
      object Label3: TLabel
        Left = 168
        Top = 248
        Width = 64
        Height = 14
        Caption = 'Valor Unit'#225'rio'
      end
      object Label4: TLabel
        Left = 248
        Top = 248
        Width = 50
        Height = 14
        Caption = 'Valor Total'
      end
      object DBPanel1: TDBPanel
        Left = 16
        Top = 8
        Width = 65
        Height = 37
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        CodigoTabStop = False
        DataField = 'COD_VIAGEM'
        DataSource = DSPrimario
        fkCache = False
        fkChave = 'COD_VIAGEM'
        ForeignKey = False
        LCaption = 'C'#243'digo'
        ReadOnly = True
        Required = False
        ValidateOnExit = False
        WidthCodigo = 20.000000000000000000
      end
      object DBPanel2: TDBPanel
        Left = 88
        Top = 8
        Width = 69
        Height = 37
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        CodigoTabStop = True
        DataField = 'DT_VIAGEM'
        DataSource = DSPrimario
        fkCache = False
        fkChave = 'DT_VIAGEM'
        ForeignKey = False
        LCaption = 'Data'
        ReadOnly = False
        Required = True
        ValidateOnExit = False
        WidthCodigo = 20.000000000000000000
      end
      object DBPanel3: TDBPanel
        Left = 17
        Top = 84
        Width = 385
        Height = 37
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        CodigoTabStop = True
        DataField = 'COD_FILIAL'
        DataSource = DSPrimario
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
      object DBPanel4: TDBPanel
        Left = 16
        Top = 45
        Width = 385
        Height = 37
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        CodigoTabStop = True
        DataField = 'DESC_PLACA'
        DataSource = DSPrimario
        DefineByForm = DBPPlacaDefineByForm
        fkCache = False
        fkCampo = 'DESC_VEICULO'
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
        LCaption = 'Placa do ve'#237'culo'
        ReadOnly = False
        Required = True
        ValidateOnExit = False
        VisibleComponents = [dbpcCodigo, dbpcBusca, dbpcDescricao]
        WidthCodigo = 20.000000000000000000
      end
      object DBPanel5: TDBPanel
        Left = 16
        Top = 124
        Width = 385
        Height = 37
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        CodigoTabStop = True
        DataField = 'COD_CADASTRO_ORIGEM'
        DataSource = DSPrimario
        DefineByForm = DBPanel5DefineByForm
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
        LCaption = 'Origem'
        ReadOnly = False
        Required = False
        ValidateOnExit = False
        VisibleComponents = [dbpcCodigo, dbpcBusca, dbpcDescricao]
        WidthCodigo = 20.000000000000000000
      end
      object DBPanel6: TDBPanel
        Left = 16
        Top = 162
        Width = 385
        Height = 37
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        CodigoTabStop = True
        DataField = 'COD_CADASTRO_DESTINO'
        DataSource = DSPrimario
        DefineByForm = DBPanel6DefineByForm
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
        LCaption = 'Destino'
        ReadOnly = False
        Required = False
        ValidateOnExit = False
        VisibleComponents = [dbpcCodigo, dbpcBusca, dbpcDescricao]
        WidthCodigo = 20.000000000000000000
      end
      object DBPanel7: TDBPanel
        Left = 16
        Top = 203
        Width = 385
        Height = 37
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        CodigoTabStop = True
        DataField = 'COD_MOTORISTA'
        DataSource = DSPrimario
        DefineByForm = DBPanel7DefineByForm
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
        Required = False
        ValidateOnExit = False
        VisibleComponents = [dbpcCodigo, dbpcBusca, dbpcDescricao]
        WidthCodigo = 20.000000000000000000
      end
      object DBEdit1: TDBEdit
        Left = 16
        Top = 268
        Width = 65
        Height = 22
        DataField = 'QT_VIAGEM'
        DataSource = DSPrimario
        TabOrder = 7
      end
      object DBEdit2: TDBEdit
        Left = 88
        Top = 268
        Width = 73
        Height = 22
        DataField = 'QT_QUANTIDADE'
        DataSource = DSPrimario
        TabOrder = 8
      end
      object DBEdit3: TDBEdit
        Left = 168
        Top = 268
        Width = 65
        Height = 22
        DataField = 'VL_UNITARIO'
        DataSource = DSPrimario
        TabOrder = 9
      end
      object DBEdit4: TDBEdit
        Left = 248
        Top = 268
        Width = 65
        Height = 22
        DataField = 'VL_TOTAL'
        DataSource = DSPrimario
        Enabled = False
        TabOrder = 10
      end
    end
  end
  inherited MMCadSimples: TMainMenu
    Left = 373
    Top = 8
    inherited Relatrios1: TMenuItem
      object Viagem1: TMenuItem
        Caption = 'Viagem'
        OnClick = Viagem1Click
      end
      object ControledeViagem1: TMenuItem
        Caption = 'Controle de Viagem'
        OnClick = ControledeViagem1Click
      end
    end
  end
  inherited DSPrimario: TDataSource
    DataSet = DMViagem.QViagemCad
    Left = 287
    Top = 8
  end
  inherited ILBotao: TImageList
    Left = 316
    Top = 8
  end
  inherited ALCadastro: TActionList
    Left = 342
    Top = 8
  end
  inherited IdHTTP1: TIdHTTP
    Left = 401
    Top = 8
  end
end
