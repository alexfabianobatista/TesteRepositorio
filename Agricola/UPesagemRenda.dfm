object FPesagemRenda: TFPesagemRenda
  Left = 393
  Top = 219
  Width = 611
  Height = 407
  Caption = 'Cadastro de Pesagem - Renda'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  DesignSize = (
    595
    369)
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 288
    Top = 88
    Width = 15
    Height = 13
    Caption = 'ou'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBText1: TDBText
    Left = 8
    Top = 11
    Width = 59
    Height = 18
    AutoSize = True
    DataField = 'DESC_PLACA'
    DataSource = DMRomaneioAgricola.DsBalanca
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 152
    Width = 577
    Height = 152
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DMRomaneioAgricola.DSPesagemRenda
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_PESAGEM_RENDA'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QT_PESO_RENDA'
        Title.Caption = 'PESO (em gramas)'
        Width = 128
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'DT_PESAGEM'
        Title.Alignment = taRightJustify
        Width = 311
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 312
    Top = 64
    Width = 273
    Height = 73
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvNone
    Color = clSilver
    TabOrder = 1
    object Label1: TLabel
      Left = 52
      Top = 8
      Width = 177
      Height = 13
      Caption = 'Informe o peso manualmente (em KG)'
    end
    object lbMensagem: TLabel
      Left = 4
      Top = 59
      Width = 181
      Height = 13
      Caption = '* Op'#231#227'o desabilitada por configura'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object MEPeso: TMaskEdit
      Left = 60
      Top = 36
      Width = 75
      Height = 21
      TabOrder = 0
    end
    object btCadastraPeso: TBitBtn
      Left = 147
      Top = 35
      Width = 75
      Height = 25
      Caption = 'Ok'
      TabOrder = 1
      OnClick = btCadastraPesoClick
    end
  end
  object Panel2: TPanel
    Left = 8
    Top = 64
    Width = 273
    Height = 73
    BevelOuter = bvNone
    Color = clSilver
    TabOrder = 0
    object Label2: TLabel
      Left = 68
      Top = 8
      Width = 146
      Height = 13
      Caption = 'Leia direto da balan'#231'a (em KG)'
    end
    object lbPeso: TLabel
      Left = 8
      Top = 35
      Width = 87
      Height = 20
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'lbPeso'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object BtLerPeso: TBitBtn
      Left = 183
      Top = 35
      Width = 75
      Height = 25
      Caption = 'Gravar'
      TabOrder = 1
      OnClick = BtLerPesoClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333FFFFFFFFFFFFF3344444444444443337777777777777F334CCCCCCCCCC
        C43337777777777777F33444881B188444333777F3737337773333308881FF70
        33333337F3373337F3333330888BF770333333373F33F337333333330881F703
        3333333373F73F7333333333308B703333333333373F77333333333333080333
        3333333333777FF333333333301F103333333333377777FF3333333301B1F103
        333333337737777FF3333330881BFB7033333337F3737F77F333333088881F70
        333333F7F3337777FFF334448888888444333777FFFFFFF777F334CCCCCCCCCC
        C43337777777777777F334444444444444333777777777777733}
      NumGlyphs = 2
    end
    object btPesoLeitura: TBitBtn
      Left = 104
      Top = 35
      Width = 75
      Height = 25
      Caption = 'Ler Peso'
      TabOrder = 0
      OnClick = btPesoLeituraClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333FF3333333333333744333333333333F773333333333337
        44473333333333F777F3333333333744444333333333F7733733333333374444
        4433333333F77333733333333744444447333333F7733337F333333744444444
        433333F77333333733333744444444443333377FFFFFFF7FFFFF999999999999
        9999733777777777777333CCCCCCCCCC33333773FF333373F3333333CCCCCCCC
        C333333773FF3337F333333333CCCCCCC33333333773FF373F3333333333CCCC
        CC333333333773FF73F33333333333CCCCC3333333333773F7F3333333333333
        CCC333333333333777FF33333333333333CC3333333333333773}
      NumGlyphs = 2
    end
  end
  object BtExcluir: TBitBtn
    Left = 512
    Top = 311
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Excluir'
    TabOrder = 3
    OnClick = BtExcluirClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333333333333333333FFF33FF333FFF339993370733
      999333777FF37FF377733339993000399933333777F777F77733333399970799
      93333333777F7377733333333999399933333333377737773333333333990993
      3333333333737F73333333333331013333333333333777FF3333333333910193
      333333333337773FF3333333399000993333333337377737FF33333399900099
      93333333773777377FF333399930003999333337773777F777FF339993370733
      9993337773337333777333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 350
    Width = 595
    Height = 19
    Panels = <>
  end
  object ComPort1: TComPort
    BaudRate = br9600
    Port = 'COM1'
    Parity.Bits = prNone
    StopBits = sbOneStopBit
    DataBits = dbEight
    Events = [evTxEmpty, evRxFlag, evRing, evBreak, evCTS, evDSR, evError, evRLSD, evRx80Full]
    FlowControl.OutCTSFlow = False
    FlowControl.OutDSRFlow = False
    FlowControl.ControlDTR = dtrDisable
    FlowControl.ControlRTS = rtsDisable
    FlowControl.XonXoffOut = False
    FlowControl.XonXoffIn = False
    OnRxChar = ComPort1RxChar
    Left = 8
    Top = 312
  end
end
