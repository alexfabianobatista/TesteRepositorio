inherited FControleViagemCad: TFControleViagemCad
  Left = 400
  Top = 124
  Caption = 'Cadastro Controle de  Viagem'
  ClientHeight = 418
  ClientWidth = 686
  PixelsPerInch = 96
  TextHeight = 14
  inherited Panel1: TPanel
    Width = 686
    inherited SBConsulta: TSpeedButton
      Left = 649
    end
    inherited lbPesquisaCodigo: TLabel
      Left = 545
    end
    inherited MELocaliza: TMaskEdit
      Left = 601
    end
    inherited pnSeparador2: TPanel
      Left = 533
    end
  end
  object PageControl1: TPageControl [2]
    Left = 0
    Top = 48
    Width = 690
    Height = 354
    ActivePage = TabSheet1
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'Viagem'
      object Label1: TLabel
        Left = 19
        Top = 3
        Width = 61
        Height = 14
        Caption = 'C'#243'd. Viagem'
      end
      object Label4: TLabel
        Left = 18
        Top = 198
        Width = 52
        Height = 14
        Caption = 'Data Sa'#237'da'
      end
      object Label5: TLabel
        Left = 99
        Top = 198
        Width = 68
        Height = 14
        Caption = 'Data Chegada'
      end
      object Label6: TLabel
        Left = 20
        Top = 132
        Width = 36
        Height = 14
        Caption = 'Destino'
      end
      object Label7: TLabel
        Left = 428
        Top = 238
        Width = 63
        Height = 14
        Caption = 'Prim. a Ultima'
      end
      object Label9: TLabel
        Left = 19
        Top = 238
        Width = 45
        Height = 14
        Caption = 'Km Sa'#237'da'
      end
      object Label26: TLabel
        Left = 100
        Top = 238
        Width = 61
        Height = 14
        Caption = 'Km Chegada'
      end
      object Label37: TLabel
        Left = 346
        Top = 238
        Width = 28
        Height = 14
        Caption = 'M'#233'dia'
      end
      object Label19: TLabel
        Left = 182
        Top = 238
        Width = 40
        Height = 14
        Caption = 'Km Total'
      end
      object Label8: TLabel
        Left = 264
        Top = 239
        Width = 74
        Height = 14
        Caption = 'Qtde. Combust.'
      end
      object Label25: TLabel
        Left = 99
        Top = 278
        Width = 53
        Height = 14
        Caption = 'Valor Frete'
      end
      object Label42: TLabel
        Left = 17
        Top = 278
        Width = 66
        Height = 14
        Caption = 'Adiantamento'
      end
      object DBEdit1: TDBEdit
        Left = 19
        Top = 19
        Width = 86
        Height = 22
        TabStop = False
        Color = clBtnFace
        DataField = 'COD_CONTROLE_VIAGEM_CAB'
        DataSource = DSPrimario
        ReadOnly = True
        TabOrder = 0
      end
      object DBEDataSaida: TDBEdit
        Left = 17
        Top = 213
        Width = 78
        Height = 22
        DataField = 'DT_SAIDA'
        DataSource = DSPrimario
        TabOrder = 5
      end
      object DBEDataChegada: TDBEdit
        Left = 99
        Top = 213
        Width = 78
        Height = 22
        DataField = 'DT_CHEGADA'
        DataSource = DSPrimario
        TabOrder = 6
      end
      object DBEDestino: TDBEdit
        Left = 18
        Top = 172
        Width = 647
        Height = 22
        DataField = 'DESC_DESTINO'
        DataSource = DSPrimario
        TabOrder = 4
      end
      object DBEPrimUltima: TDBEdit
        Left = 427
        Top = 253
        Width = 78
        Height = 22
        DataField = 'QT_KM_ENTRE_ENTREGAS'
        DataSource = DSPrimario
        TabOrder = 12
      end
      object DBEKmSaida: TDBEdit
        Left = 17
        Top = 253
        Width = 78
        Height = 22
        AutoSize = False
        DataField = 'QT_KM_SAIDA'
        DataSource = DSPrimario
        TabOrder = 7
        OnExit = DBEKmSaidaExit
      end
      object DBEKmChegada: TDBEdit
        Left = 99
        Top = 253
        Width = 78
        Height = 22
        AutoSize = False
        DataField = 'QT_KM_CHEGADA'
        DataSource = DSPrimario
        TabOrder = 8
        OnExit = DBEKmSaidaExit
      end
      object DBEMedia: TDBEdit
        Left = 345
        Top = 253
        Width = 78
        Height = 22
        DataField = 'VL_MEDIA'
        DataSource = DSPrimario
        TabOrder = 11
      end
      object DBPVeiculo: TDBPanel
        Left = 19
        Top = 88
        Width = 406
        Height = 37
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        CodigoTabStop = True
        DataField = 'DESC_PLACA'
        DataSource = DSPrimario
        DefineByForm = DBPVeiculoDefineByForm
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
        LCaption = 'Ve'#237'culo'
        ReadOnly = False
        Required = True
        ValidateOnExit = False
        VisibleComponents = [dbpcCodigo, dbpcBusca, dbpcDescricao]
        WidthCodigo = 20.000000000000000000
      end
      object DBPMotorista: TDBPanel
        Left = 19
        Top = 129
        Width = 409
        Height = 37
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        CodigoTabStop = True
        DataField = 'COD_MOTORISTA'
        DataSource = DSPrimario
        DefineByForm = DBPMotoristaDefineByForm
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
      object DBEKMTotal: TDBEdit
        Left = 181
        Top = 253
        Width = 78
        Height = 22
        DataField = 'VL_TOTAL_KM'
        DataSource = DSPrimario
        TabOrder = 9
      end
      object DBEQtCombustivel: TDBEdit
        Left = 263
        Top = 254
        Width = 78
        Height = 22
        DataField = 'QT_COMBUSTIVEL'
        DataSource = DSPrimario
        TabOrder = 10
        OnExit = DBEQtCombustivelExit
      end
      object DBEValorFrete: TDBEdit
        Left = 98
        Top = 293
        Width = 78
        Height = 22
        DataField = 'VAL_FRETE'
        DataSource = DSPrimario
        TabOrder = 14
      end
      object DBEAdiantamento: TDBEdit
        Left = 16
        Top = 293
        Width = 78
        Height = 22
        DataField = 'VL_ADIANTAMENTO'
        DataSource = DSPrimario
        TabOrder = 13
      end
      object DBPFilial: TDBPanel
        Left = 19
        Top = 48
        Width = 406
        Height = 37
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        CodigoTabStop = True
        DataField = 'COD_FILIAL'
        DataSource = DSPrimario
        DefineByForm = DBPFilialDefineByForm
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
        LCaption = 'F'#237'lial'
        ReadOnly = False
        Required = True
        ValidateOnExit = False
        VisibleComponents = [dbpcCodigo, dbpcBusca, dbpcDescricao]
        WidthCodigo = 20.000000000000000000
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Despesas'
      ImageIndex = 1
      object Label10: TLabel
        Left = 14
        Top = 10
        Width = 75
        Height = 14
        Caption = 'Vlr Combust'#237'vel'
      end
      object Label11: TLabel
        Left = 99
        Top = 10
        Width = 65
        Height = 14
        Caption = 'Vlr. Refei'#231#227'o '
      end
      object Label12: TLabel
        Left = 179
        Top = 10
        Width = 50
        Height = 14
        Caption = 'Vlr. Chapa'
      end
      object Label14: TLabel
        Left = 346
        Top = 12
        Width = 57
        Height = 14
        Caption = 'Vlr. Ped'#225'gio'
      end
      object Label15: TLabel
        Left = 15
        Top = 53
        Width = 75
        Height = 14
        Caption = 'Vlr.Manuten'#231#227'o'
      end
      object Label16: TLabel
        Left = 95
        Top = 53
        Width = 52
        Height = 14
        Caption = 'Vlr. Sal'#225'rio'
      end
      object Label18: TLabel
        Left = 260
        Top = 53
        Width = 70
        Height = 14
        Caption = 'Comb. Camara'
      end
      object Label17: TLabel
        Left = 178
        Top = 53
        Width = 54
        Height = 14
        Caption = 'Vlr. Seguro'
      end
      object Label13: TLabel
        Left = 262
        Top = 10
        Width = 62
        Height = 14
        Caption = 'Vlr. Diversos'
      end
      object Label27: TLabel
        Left = 16
        Top = 146
        Width = 95
        Height = 14
        Caption = 'Descri'#231#227'o Diversos'
      end
      object Label2: TLabel
        Left = 266
        Top = 193
        Width = 47
        Height = 14
        Caption = 'Comiss'#227'o'
      end
      object Label3: TLabel
        Left = 166
        Top = 193
        Width = 25
        Height = 14
        Caption = 'Valor'
      end
      object Label38: TLabel
        Left = 70
        Top = 193
        Width = 24
        Height = 14
        Caption = 'Peso'
      end
      object Label39: TLabel
        Left = 18
        Top = 211
        Width = 38
        Height = 14
        Caption = 'Clientes'
      end
      object Label40: TLabel
        Left = 18
        Top = 241
        Width = 33
        Height = 14
        Caption = 'Distrib.'
      end
      object Label41: TLabel
        Left = 18
        Top = 269
        Width = 33
        Height = 14
        Caption = 'Outros'
      end
      object Label21: TLabel
        Left = 344
        Top = 53
        Width = 49
        Height = 14
        Caption = 'Vlr.Di'#225'rias'
      end
      object Label22: TLabel
        Left = 95
        Top = 93
        Width = 28
        Height = 14
        Caption = 'Troco'
      end
      object Label23: TLabel
        Left = 427
        Top = 53
        Width = 73
        Height = 14
        Caption = 'Total despesas'
      end
      object Label20: TLabel
        Left = 177
        Top = 94
        Width = 47
        Height = 14
        Caption = 'Comiss'#227'o'
      end
      object Label43: TLabel
        Left = 15
        Top = 93
        Width = 66
        Height = 14
        Caption = 'Adiantamento'
      end
      object DBEdit10: TDBEdit
        Left = 14
        Top = 25
        Width = 78
        Height = 22
        DataField = 'VAL_COMBUSTIVEL'
        DataSource = DSPrimario
        TabOrder = 0
      end
      object DBEdit11: TDBEdit
        Left = 96
        Top = 25
        Width = 78
        Height = 22
        DataField = 'VAL_REFEICAO'
        DataSource = DSPrimario
        TabOrder = 1
      end
      object DBEdit12: TDBEdit
        Left = 178
        Top = 25
        Width = 78
        Height = 22
        DataField = 'VAL_CHAPA'
        DataSource = DSPrimario
        TabOrder = 2
      end
      object DBEdit14: TDBEdit
        Left = 345
        Top = 26
        Width = 75
        Height = 22
        DataField = 'VAL_PEDAGIO'
        DataSource = DSPrimario
        TabOrder = 4
      end
      object DBEdit15: TDBEdit
        Left = 14
        Top = 68
        Width = 78
        Height = 22
        DataField = 'VAL_MANUTENCAO'
        DataSource = DSPrimario
        TabOrder = 5
      end
      object DBEdit16: TDBEdit
        Left = 96
        Top = 68
        Width = 78
        Height = 22
        DataField = 'VAL_SALARIO'
        DataSource = DSPrimario
        TabOrder = 6
      end
      object DBEdit18: TDBEdit
        Left = 260
        Top = 68
        Width = 78
        Height = 22
        DataField = 'VAL_COMBUSTIVEL_CAMARA'
        DataSource = DSPrimario
        TabOrder = 8
      end
      object DBEdit17: TDBEdit
        Left = 178
        Top = 68
        Width = 78
        Height = 22
        DataField = 'VAL_SEGURO'
        DataSource = DSPrimario
        TabOrder = 7
      end
      object DBEdit13: TDBEdit
        Left = 262
        Top = 25
        Width = 78
        Height = 22
        DataField = 'VAL_DIVERSOS'
        DataSource = DSPrimario
        TabOrder = 3
      end
      object DBEdit28: TDBEdit
        Left = 14
        Top = 161
        Width = 651
        Height = 22
        AutoSize = False
        DataField = 'DESC_DIVERSOS'
        DataSource = DSPrimario
        TabOrder = 13
      end
      object DBEdit2: TDBEdit
        Left = 265
        Top = 207
        Width = 94
        Height = 22
        DataField = 'PERC_COMISSAO_CLIENTE'
        DataSource = DSPrimario
        TabOrder = 16
      end
      object DBEdit3: TDBEdit
        Left = 167
        Top = 208
        Width = 94
        Height = 22
        DataField = 'VAL_CLIENTE'
        DataSource = DSPrimario
        TabOrder = 15
      end
      object DBEdit4: TDBEdit
        Left = 70
        Top = 208
        Width = 94
        Height = 22
        DataField = 'QT_PESO_CLIENTE'
        DataSource = DSPrimario
        TabOrder = 14
      end
      object DBEdit5: TDBEdit
        Left = 70
        Top = 266
        Width = 94
        Height = 22
        DataField = 'QT_PESO_OUTRO'
        DataSource = DSPrimario
        TabOrder = 19
      end
      object DBEdit6: TDBEdit
        Left = 70
        Top = 237
        Width = 94
        Height = 22
        DataField = 'QT_PESO_DISTRIBUIDOR'
        DataSource = DSPrimario
        TabOrder = 17
      end
      object DBEdit7: TDBEdit
        Left = 167
        Top = 237
        Width = 94
        Height = 22
        DataField = 'VAL_DISTRIBUIDOR'
        DataSource = DSPrimario
        TabOrder = 18
      end
      object DBEdit9: TDBEdit
        Left = 167
        Top = 265
        Width = 94
        Height = 22
        DataField = 'VAL_OUTRO'
        DataSource = DSPrimario
        TabOrder = 20
      end
      object DBEdit20: TDBEdit
        Left = 343
        Top = 68
        Width = 78
        Height = 22
        DataField = 'VL_DIARIAS'
        DataSource = DSPrimario
        TabOrder = 9
      end
      object DBEdit21: TDBEdit
        Left = 94
        Top = 108
        Width = 78
        Height = 22
        DataField = 'VL_TROCO'
        DataSource = DSPrimario
        TabOrder = 11
      end
      object DBEdit22: TDBEdit
        Left = 426
        Top = 68
        Width = 143
        Height = 22
        DataField = 'sval_total_despesas'
        DataSource = DSPrimario
        Enabled = False
        ReadOnly = True
        TabOrder = 10
      end
      object DBEdit19: TDBEdit
        Left = 176
        Top = 109
        Width = 78
        Height = 22
        DataField = 'VAL_COMISSAO_CLIENTE'
        DataSource = DSPrimario
        TabOrder = 12
      end
      object DBEdit8: TDBEdit
        Left = 14
        Top = 108
        Width = 78
        Height = 22
        DataField = 'VL_ADIANTAMENTO_DESPESA'
        DataSource = DSPrimario
        TabOrder = 21
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Retorno'
      ImageIndex = 2
      object Label28: TLabel
        Left = 10
        Top = 9
        Width = 90
        Height = 14
        Caption = 'Descri'#231#227'o Retorno'
      end
      object Label30: TLabel
        Left = 469
        Top = 52
        Width = 71
        Height = 14
        Caption = 'Local de Sa'#237'da'
      end
      object Label31: TLabel
        Left = 10
        Top = 54
        Width = 87
        Height = 14
        Caption = 'Local de Chegada'
      end
      object Label32: TLabel
        Left = 9
        Top = 95
        Width = 52
        Height = 14
        Caption = 'Peso Frete'
      end
      object Label33: TLabel
        Left = 132
        Top = 53
        Width = 22
        Height = 14
        Caption = 'Data'
      end
      object Label34: TLabel
        Left = 217
        Top = 56
        Width = 42
        Height = 14
        Caption = 'Vlr.Bruto'
      end
      object Label29: TLabel
        Left = 343
        Top = 56
        Width = 47
        Height = 14
        Caption = 'Comiss'#227'o'
      end
      object Label24: TLabel
        Left = 10
        Top = 147
        Width = 60
        Height = 14
        Caption = 'Observa'#231#227'o'
      end
      object Label36: TLabel
        Left = 171
        Top = 98
        Width = 75
        Height = 14
        Caption = 'Vlr.Chapa Reto.'
      end
      object Label35: TLabel
        Left = 93
        Top = 96
        Width = 70
        Height = 14
        Caption = 'Num. Entregas'
      end
      object DBEdit29: TDBEdit
        Left = 10
        Top = 25
        Width = 655
        Height = 22
        DataField = 'DESC_RETORNO'
        DataSource = DSPrimario
        TabOrder = 0
      end
      object DBEdit34: TDBEdit
        Left = 469
        Top = 68
        Width = 121
        Height = 22
        DataField = 'DESC_SAIDA_RETORNO'
        DataSource = DSPrimario
        TabOrder = 5
      end
      object DBEdit30: TDBEdit
        Left = 8
        Top = 70
        Width = 121
        Height = 22
        DataField = 'DESC_CHEGADA_RETORNO'
        DataSource = DSPrimario
        TabOrder = 1
      end
      object DBEdit35: TDBEdit
        Left = 8
        Top = 111
        Width = 81
        Height = 22
        DataField = 'QT_PESO_RETORNO'
        DataSource = DSPrimario
        TabOrder = 6
      end
      object DBEdit31: TDBEdit
        Left = 132
        Top = 69
        Width = 81
        Height = 22
        DataField = 'DT_RETORNO'
        DataSource = DSPrimario
        TabOrder = 2
      end
      object DBEdit32: TDBEdit
        Left = 217
        Top = 69
        Width = 121
        Height = 22
        DataField = 'VAL_BRUTO_RETORNO'
        DataSource = DSPrimario
        TabOrder = 3
      end
      object DBEdit33: TDBEdit
        Left = 343
        Top = 69
        Width = 121
        Height = 22
        DataField = 'VAL_COMISSAO_RETORNO'
        DataSource = DSPrimario
        TabOrder = 4
      end
      object DBEdit24: TDBEdit
        Left = 10
        Top = 165
        Width = 655
        Height = 22
        DataField = 'DESC_OBS'
        DataSource = DSPrimario
        TabOrder = 9
      end
      object DBEdit37: TDBEdit
        Left = 170
        Top = 112
        Width = 78
        Height = 22
        DataField = 'VAL_CHAPA_RETORNO'
        DataSource = DSPrimario
        TabOrder = 8
      end
      object DBEdit36: TDBEdit
        Left = 92
        Top = 111
        Width = 75
        Height = 22
        DataField = 'NUM_ENTREGA'
        DataSource = DSPrimario
        TabOrder = 7
      end
    end
  end
  inherited StBLongHint: TStatusBar
    Top = 399
    Width = 686
  end
  inherited MMCadSimples: TMainMenu
    Left = 400
    inherited Relatrios1: TMenuItem
      object RelViagem1: TMenuItem
        Caption = 'Custos de viagens'
        OnClick = RelViagem1Click
      end
    end
  end
  inherited DSPrimario: TDataSource
    DataSet = DMConhecimento.QControleViagemCab
    Left = 448
  end
  inherited ILBotao: TImageList
    Left = 368
  end
end
