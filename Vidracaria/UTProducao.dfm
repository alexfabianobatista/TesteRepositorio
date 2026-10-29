object FTProducao: TFTProducao
  Left = 464
  Top = 141
  Width = 781
  Height = 531
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Produ'#231#227'o'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    765
    493)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 64
    Height = 27
    Caption = 'Pe'#231'a'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Lucida Console'
    Font.Style = []
    ParentFont = False
  end
  object SbOK: TSpeedButton
    Left = 408
    Top = 24
    Width = 41
    Height = 41
    Caption = 'OK'
    OnClick = SbOKClick
  end
  object LMensagem: TLabel
    Left = 456
    Top = 8
    Width = 256
    Height = 57
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -20
    Font.Name = 'Lucida Console'
    Font.Style = []
    ParentFont = False
    Transparent = False
    WordWrap = True
  end
  object Label2: TLabel
    Left = 344
    Top = 8
    Width = 48
    Height = 27
    Caption = 'S'#233'r'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Lucida Console'
    Font.Style = []
    ParentFont = False
  end
  object SbQuebra: TSpeedButton
    Left = 719
    Top = 24
    Width = 41
    Height = 41
    Anchors = [akTop, akRight]
    Caption = '&Quebra'
    OnClick = SbQuebraClick
  end
  object EPeca: TEdit
    Tag = 99999
    Left = 16
    Top = 40
    Width = 329
    Height = 26
    AutoSize = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Lucida Console'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnChange = EPecaChange
    OnKeyPress = EPecaKeyPress
  end
  object GbProducao: TGroupBox
    Left = 16
    Top = 72
    Width = 744
    Height = 418
    Anchors = [akLeft, akTop, akRight, akBottom]
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 2
    object DbGProducao: TDBGrid
      Left = 2
      Top = 15
      Width = 740
      Height = 401
      TabStop = False
      Align = alClient
      BorderStyle = bsNone
      Ctl3D = True
      DataSource = DsProducao
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object CbSerie: TComboBox
    Left = 344
    Top = 40
    Width = 57
    Height = 26
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Lucida Console'
    Font.Style = []
    ItemHeight = 18
    ParentFont = False
    TabOrder = 1
    TabStop = False
  end
  object BitBtn1: TBitBtn
    Left = 112
    Top = 8
    Width = 89
    Height = 25
    Caption = '&Coletor de Dados'
    TabOrder = 3
    Visible = False
    OnClick = BitBtn1Click
  end
  object DsProducao: TDataSource
    DataSet = DMPedido.QItensProducaoCons
    Left = 232
    Top = 8
  end
  object ODColetor: TOpenDialog
    Left = 704
    Top = 312
  end
end
