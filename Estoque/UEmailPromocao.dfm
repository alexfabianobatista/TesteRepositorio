object FEmailPromocao: TFEmailPromocao
  Left = 431
  Top = 120
  Width = 512
  Height = 507
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Enviar E-Mail com Promo'#231#245'es'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    504
    480)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 64
    Width = 28
    Height = 13
    Caption = 'Pre'#231'o'
  end
  object Label55: TLabel
    Left = 16
    Top = 392
    Width = 92
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Validade Promo'#231#227'o'
  end
  object Label2: TLabel
    Left = 16
    Top = 344
    Width = 76
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Email de Origem'
  end
  object Label3: TLabel
    Left = 128
    Top = 392
    Width = 98
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'T'#237'tulo da Mensagem'
  end
  inline FmProduto: TFmProduto
    Left = 16
    Top = 24
    Width = 333
    Height = 37
    TabOrder = 0
    inherited MeProduto: TMaskEdit
      OnExit = FmProdutoMeProdutoExit
    end
    inherited BtProduto: TBitBtn
      OnClick = FmProdutoBtProdutoClick
    end
    inherited EdProduto: TEdit
      Width = 257
    end
  end
  object EPreco: TEdit
    Left = 16
    Top = 80
    Width = 97
    Height = 21
    TabOrder = 1
  end
  object BtnAdicionar: TBitBtn
    Left = 272
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Adicionar'
    TabOrder = 2
    OnClick = BtnAdicionarClick
  end
  object GbProdutos: TGroupBox
    Left = 16
    Top = 112
    Width = 473
    Height = 225
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Produtos Adicionados'
    TabOrder = 3
    object DbgProdutos: TDBGrid
      Left = 2
      Top = 15
      Width = 469
      Height = 208
      Align = alClient
      DataSource = DsEmail
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgCancelOnExit]
      ParentShowHint = False
      ReadOnly = True
      ShowHint = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_PRODUTO'
          Title.Alignment = taRightJustify
          Title.Caption = 'Produto'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESC_PRODUTO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 253
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VAL_PRECO'
          Title.Alignment = taRightJustify
          Title.Caption = 'Pre'#231'o'
          Width = 93
          Visible = True
        end>
    end
  end
  object MeData: TMaskEdit
    Left = 16
    Top = 408
    Width = 105
    Height = 21
    Anchors = [akLeft, akBottom]
    EditMask = '!99/99/##00;1;_'
    MaxLength = 10
    TabOrder = 4
    Text = '  /  /    '
  end
  object BtnOK: TBitBtn
    Left = 416
    Top = 442
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    TabOrder = 5
    OnClick = BtnOKClick
  end
  object BtnCancelar: TBitBtn
    Left = 336
    Top = 442
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cancelar'
    TabOrder = 6
    OnClick = BtnCancelarClick
  end
  object EEmail: TEdit
    Left = 86
    Top = 360
    Width = 283
    Height = 21
    TabStop = False
    Anchors = [akLeft, akBottom]
    Color = clBtnFace
    Enabled = False
    ReadOnly = True
    TabOrder = 7
  end
  object BtEmail: TBitBtn
    Left = 61
    Top = 360
    Width = 24
    Height = 24
    Anchors = [akLeft, akBottom]
    TabOrder = 8
    TabStop = False
    OnClick = BtEmailClick
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
  end
  object MeEmail: TMaskEdit
    Left = 16
    Top = 360
    Width = 43
    Height = 21
    Anchors = [akLeft, akBottom]
    EditMask = '######'
    MaxLength = 6
    TabOrder = 9
    Text = '      '
    OnExit = MeEmailExit
  end
  object ETitulo: TEdit
    Left = 128
    Top = 408
    Width = 241
    Height = 21
    Anchors = [akLeft, akBottom]
    TabOrder = 10
  end
  object DsEmail: TDataSource
    DataSet = DMProduto.CdEmail
    Left = 296
    Top = 72
  end
  object iSmtp: TIdSMTP
    MaxLineAction = maException
    ReadTimeout = 0
    Port = 25
    AuthenticationType = atLogin
    Left = 440
    Top = 8
  end
  object IdMessage1: TIdMessage
    AttachmentEncoding = 'MIME'
    BccList = <>
    CCList = <>
    Encoding = meMIME
    Recipients = <>
    ReplyTo = <>
    Left = 408
    Top = 8
  end
end
