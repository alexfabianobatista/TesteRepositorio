object FScpcCons: TFScpcCons
  Left = 399
  Top = 76
  Width = 708
  Height = 594
  Caption = 'Consulta SCPC'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label142: TLabel
    Left = 5
    Top = 1
    Width = 42
    Height = 13
    Caption = 'Cadastro'
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 55
    Width = 692
    Height = 500
    ActivePage = TabSheet1
    Align = alCustom
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Consulta SCPC'
      object Label1: TLabel
        Left = 8
        Top = 0
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label2: TLabel
        Left = 96
        Top = 0
        Width = 31
        Height = 13
        Caption = 'Senha'
      end
      object Label3: TLabel
        Left = 8
        Top = 40
        Width = 28
        Height = 13
        Caption = 'Nome'
      end
      object Label4: TLabel
        Left = 328
        Top = 40
        Width = 45
        Height = 13
        Caption = 'Dt. Nasc.'
      end
      object Label5: TLabel
        Left = 424
        Top = 40
        Width = 20
        Height = 13
        Caption = 'CPF'
      end
      object Label10: TLabel
        Left = 8
        Top = 80
        Width = 31
        Height = 13
        Caption = 'Banco'
      end
      object Label11: TLabel
        Left = 48
        Top = 80
        Width = 39
        Height = 13
        Caption = 'Ag'#234'ncia'
      end
      object Label12: TLabel
        Left = 96
        Top = 80
        Width = 71
        Height = 13
        Caption = 'Conta Corrente'
      end
      object Label13: TLabel
        Left = 176
        Top = 80
        Width = 14
        Height = 13
        Caption = 'Dv'
      end
      object Label14: TLabel
        Left = 198
        Top = 80
        Width = 54
        Height = 13
        Caption = 'Nr. Cheque'
      end
      object Label15: TLabel
        Left = 264
        Top = 80
        Width = 14
        Height = 13
        Caption = 'Dv'
      end
      object Label16: TLabel
        Left = 291
        Top = 80
        Width = 55
        Height = 13
        Caption = 'Vlr. Cheque'
      end
      object mmRespostaSCPC: TMemo
        Left = 0
        Top = 127
        Width = 684
        Height = 326
        Align = alCustom
        Anchors = [akLeft, akTop, akRight, akBottom]
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object meCodigo: TMaskEdit
        Left = 8
        Top = 16
        Width = 81
        Height = 21
        MaxLength = 20
        TabOrder = 1
        OnExit = meCodigoExit
      end
      object meSenha: TMaskEdit
        Left = 96
        Top = 16
        Width = 89
        Height = 21
        MaxLength = 8
        PasswordChar = '*'
        TabOrder = 2
        OnExit = meSenhaExit
      end
      object meNome: TMaskEdit
        Left = 8
        Top = 56
        Width = 313
        Height = 21
        MaxLength = 50
        TabOrder = 3
        OnExit = meNomeExit
      end
      object meDtNasc: TMaskEdit
        Left = 328
        Top = 56
        Width = 89
        Height = 21
        MaxLength = 8
        TabOrder = 4
        OnExit = meDtNascExit
      end
      object meCPF: TMaskEdit
        Left = 424
        Top = 56
        Width = 97
        Height = 21
        MaxLength = 11
        TabOrder = 5
        OnExit = meCPFExit
      end
      object StatusBar: TStatusBar
        Left = 0
        Top = 453
        Width = 684
        Height = 19
        Panels = <
          item
            Width = 50
          end
          item
            Width = 100
          end>
      end
      object btnConsultar: TBitBtn
        Left = 566
        Top = 6
        Width = 81
        Height = 25
        Hint = 'Procurar'
        Caption = '&Consultar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        OnClick = btnConsultarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333333333333333333333333333333333333333333333FF333333333333
          3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
          E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
          E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
          E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
          000033333373FF77777733333330003333333333333777333333333333333333
          3333333333333333333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
      end
      object RgTipoCadastro: TRadioGroup
        Left = 189
        Top = 2
        Width = 212
        Height = 38
        Caption = 'Tipo Cadastro'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Cadastro'
          'Conjuge')
        TabOrder = 8
        OnClick = RgTipoCadastroClick
      end
      object MeBanco: TMaskEdit
        Left = 8
        Top = 96
        Width = 27
        Height = 21
        EditMask = '###'
        MaxLength = 3
        TabOrder = 9
        Text = '   '
      end
      object MeAgencia: TMaskEdit
        Left = 48
        Top = 96
        Width = 37
        Height = 21
        EditMask = '#####'
        MaxLength = 5
        TabOrder = 10
        Text = '     '
      end
      object MeContaCorrente: TMaskEdit
        Left = 96
        Top = 96
        Width = 69
        Height = 21
        EditMask = '###############'
        MaxLength = 15
        TabOrder = 11
        Text = '               '
      end
      object MeDigito: TMaskEdit
        Left = 174
        Top = 96
        Width = 14
        Height = 21
        EditMask = '#'
        MaxLength = 1
        TabOrder = 12
        Text = ' '
      end
      object MeNumeroCheque: TMaskEdit
        Left = 198
        Top = 96
        Width = 53
        Height = 21
        EditMask = '########'
        MaxLength = 8
        TabOrder = 13
        Text = '        '
      end
      object MeDigitoCheque: TMaskEdit
        Left = 262
        Top = 96
        Width = 14
        Height = 21
        EditMask = '#'
        MaxLength = 1
        TabOrder = 14
        Text = ' '
      end
      object MeValorCheque: TMaskEdit
        Left = 283
        Top = 96
        Width = 63
        Height = 21
        TabOrder = 15
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Hist'#243'rico de Consultas'
      ImageIndex = 1
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 321
        Height = 81
        DataSource = DataSource1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'COD_CONSULTA_SCPC'
            Width = 57
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COD_CADASTRO'
            Width = 114
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_CONSULTA'
            Width = 99
            Visible = True
          end>
      end
      object GroupBox1: TGroupBox
        Left = 328
        Top = 0
        Width = 185
        Height = 81
        Caption = 'Per'#237'odo'
        TabOrder = 1
        object Label8: TLabel
          Left = 8
          Top = 24
          Width = 27
          Height = 13
          Caption = 'In'#237'cio'
        end
        object Label9: TLabel
          Left = 88
          Top = 24
          Width = 16
          Height = 13
          Caption = 'Fim'
        end
        object meDtInicio: TMaskEdit
          Left = 8
          Top = 40
          Width = 73
          Height = 21
          EditMask = '!99/99/0000;1;_'
          MaxLength = 10
          TabOrder = 0
          Text = '  /  /    '
        end
        object MEDtFim: TMaskEdit
          Left = 88
          Top = 40
          Width = 73
          Height = 21
          EditMask = '!99/99/0000;1;_'
          MaxLength = 10
          TabOrder = 1
          Text = '  /  /    '
        end
      end
      object BitBtn1: TBitBtn
        Left = 566
        Top = 6
        Width = 81
        Height = 25
        Hint = 'Procurar'
        Caption = '&Consultar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = BitBtn1Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333333333333333333333333333333333333333333333FF333333333333
          3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
          E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
          E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
          E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
          000033333373FF77777733333330003333333333333777333333333333333333
          3333333333333333333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
      end
      object DBMemo1: TDBMemo
        Left = 0
        Top = 104
        Width = 684
        Height = 368
        Align = alCustom
        Anchors = [akLeft, akTop, akRight, akBottom]
        Ctl3D = False
        DataField = 'DESC_RESULTADO'
        DataSource = DataSource1
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 3
      end
    end
  end
  object meCodCadastro: TMaskEdit
    Left = 5
    Top = 15
    Width = 51
    Height = 21
    EditMask = '######'
    MaxLength = 6
    TabOrder = 1
    Text = '      '
    OnExit = meCodCadastroExit
  end
  object edCadastro: TEdit
    Left = 56
    Top = 15
    Width = 369
    Height = 21
    TabStop = False
    ParentColor = True
    ReadOnly = True
    TabOrder = 2
    Text = 'Escolha um Cadastro'
  end
  object Sock: TTcpClient
    RemoteHost = '200.246.58.2'
    RemotePort = '9172'
    OnConnect = SockConnect
    OnDisconnect = SockDisconnect
    Left = 432
    Top = 9
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = DMScpc.QConsultaSCPCCons
    Left = 464
    Top = 9
  end
  object XMLDocument1: TXMLDocument
    Left = 616
    Top = 8
    DOMVendorDesc = 'MSXML'
  end
  object HTTPReqResp1: THTTPReqResp
    Agent = 'Borland SOAP 1.2'
    UseUTF8InHeader = False
    InvokeOptions = [soIgnoreInvalidCerts, soAutoCheckAccessPointViaUDDI]
    Left = 576
    Top = 8
  end
  object ActionList1: TActionList
    Left = 496
    Top = 8
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 49222
    end
  end
end
