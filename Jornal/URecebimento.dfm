inherited FRecebimento: TFRecebimento
  Left = 455
  Top = 174
  Caption = 'Recebimento de Assinantes'
  ClientHeight = 463
  ClientWidth = 537
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel [0]
    Left = 24
    Top = 48
    Width = 33
    Height = 14
    Anchors = [akLeft, akTop, akRight]
    Caption = 'C'#243'digo'
    FocusControl = DBEdit1
  end
  object Label5: TLabel [1]
    Left = 400
    Top = 88
    Width = 69
    Height = 14
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Data Cadastro'
    FocusControl = DBEdit5
  end
  object Label2: TLabel [2]
    Left = 24
    Top = 237
    Width = 42
    Height = 14
    Caption = 'Parcelas'
  end
  inherited Panel1: TPanel
    Width = 537
    TabOrder = 7
  end
  inherited StBLongHint: TStatusBar
    Top = 444
    Width = 537
  end
  object DBEdit1: TDBEdit [5]
    Left = 24
    Top = 64
    Width = 113
    Height = 22
    Color = clBtnFace
    DataField = 'COD_RECEBIMENTO_JORNAL'
    DataSource = DSPrimario
    Enabled = False
    TabOrder = 10
  end
  object DBEdit5: TDBEdit [6]
    Left = 400
    Top = 104
    Width = 113
    Height = 22
    Anchors = [akLeft, akTop, akRight]
    Color = clBtnFace
    DataField = 'DT_CADASTRO'
    DataSource = DSPrimario
    Enabled = False
    TabOrder = 11
  end
  object DBPCadastro: TDBPanel [7]
    Left = 24
    Top = 161
    Width = 489
    Height = 37
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    CodigoTabStop = True
    DataField = 'COD_CADASTRO'
    DataSource = DSPrimario
    DefineByForm = DBPCadastroDefineByForm
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
    LCaption = 'Cliente'
    ReadOnly = False
    Required = True
    ValidateOnExit = False
    VisibleComponents = [dbpcCodigo, dbpcBusca, dbpcDescricao]
    WidthCodigo = 21.000000000000000000
  end
  object DBGrid1: TDBGrid [8]
    Left = 24
    Top = 251
    Width = 489
    Height = 162
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DMRecebimento.DSRecebimentoJornalItem
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NUM_PARCELA'
        Title.Caption = 'Parcela'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_PAGO'
        Title.Caption = 'Valor Pago'
        Width = 152
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_PAGAMENTO'
        Title.Caption = 'Data Pagamento'
        Width = 166
        Visible = True
      end>
  end
  object BTPagar: TBitBtn [9]
    Left = 354
    Top = 416
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Pagar'
    TabOrder = 6
    OnClick = BTPagarClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      555555555555555555555555555555555555555555FF55555555555559055555
      55555555577FF5555555555599905555555555557777F5555555555599905555
      555555557777FF5555555559999905555555555777777F555555559999990555
      5555557777777FF5555557990599905555555777757777F55555790555599055
      55557775555777FF5555555555599905555555555557777F5555555555559905
      555555555555777FF5555555555559905555555555555777FF55555555555579
      05555555555555777FF5555555555557905555555555555777FF555555555555
      5990555555555555577755555555555555555555555555555555}
    NumGlyphs = 2
  end
  object DBPanel1: TDBPanel [10]
    Left = 24
    Top = 87
    Width = 113
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    CodigoTabStop = True
    DataField = 'NUM_ANO'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'NUM_ANO'
    ForeignKey = False
    LCaption = 'Ano'
    ReadOnly = False
    Required = True
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object DBPanel2: TDBPanel [11]
    Left = 149
    Top = 87
    Width = 113
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    CodigoTabStop = True
    DataField = 'DT_VENCIMENTO'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'DT_VENCIMENTO'
    ForeignKey = False
    LCaption = 'Vencimento'
    ReadOnly = False
    Required = True
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object DBPanel3: TDBPanel [12]
    Left = 274
    Top = 88
    Width = 113
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    CodigoTabStop = True
    DataField = 'VAL_TOTAL'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'VAL_TOTAL'
    ForeignKey = False
    LCaption = 'Valor Total'
    ReadOnly = False
    Required = True
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object DBPanel4: TDBPanel [13]
    Left = 24
    Top = 200
    Width = 489
    Height = 37
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    CodigoTabStop = False
    DataField = 'cidade'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'cidade'
    ForeignKey = False
    LCaption = 'Cidade'
    ReadOnly = True
    Required = False
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object btExcluir: TBitBtn [14]
    Left = 438
    Top = 416
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 12
    OnClick = btExcluirClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
      33333337777FF377FF3333993370739993333377FF373F377FF3399993000339
      993337777F777F3377F3393999707333993337F77737333337FF993399933333
      399377F3777FF333377F993339903333399377F33737FF33377F993333707333
      399377F333377FF3377F993333101933399377F333777FFF377F993333000993
      399377FF3377737FF7733993330009993933373FF3777377F7F3399933000399
      99333773FF777F777733339993707339933333773FF7FFF77333333999999999
      3333333777333777333333333999993333333333377777333333}
    NumGlyphs = 2
  end
  object DBPanel5: TDBPanel [15]
    Left = 24
    Top = 123
    Width = 489
    Height = 37
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    CodigoTabStop = True
    DataField = 'COD_VENDEDOR'
    DataSource = DSPrimario
    DefineByForm = DBPanel5DefineByForm
    fkCache = False
    fkCampo = 'NOME'
    fkChave = 'COD_VENDEDOR'
    fkTabela = 'TB_VENDEDOR'
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
    LCaption = 'Vendedor'
    ReadOnly = False
    Required = False
    ValidateOnExit = False
    VisibleComponents = [dbpcCodigo, dbpcBusca, dbpcDescricao]
    WidthCodigo = 21.000000000000000000
  end
  inherited MMCadSimples: TMainMenu
    inherited Relatrios1: TMenuItem
      object RecebimentodeAssinantes1: TMenuItem
        Caption = '&Recebimento de Assinantes'
        OnClick = RecebimentodeAssinantes1Click
      end
    end
  end
  inherited DSPrimario: TDataSource
    DataSet = DMRecebimento.QRecebimentoJornalCad
    Left = 384
  end
end
