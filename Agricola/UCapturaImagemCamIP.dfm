object FCapturaImagemCamIP: TFCapturaImagemCamIP
  Left = 296
  Top = 87
  Width = 1157
  Height = 634
  Caption = 'Captura Imagem Pesagem'
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
  DesignSize = (
    1141
    595)
  PixelsPerInch = 96
  TextHeight = 13
  object lblRenderOn: TLabel
    Left = 148
    Top = 200
    Width = 82
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Render Video On'
    Visible = False
  end
  object lblVideoStream: TLabel
    Left = 428
    Top = 198
    Width = 63
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Video Stream'
    Visible = False
  end
  object lblSubtitleStream: TLabel
    Left = 194
    Top = 608
    Width = 71
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Subtitle Stream'
  end
  object Label1: TLabel
    Left = 644
    Top = 168
    Width = 82
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Render Video On'
    Visible = False
  end
  object Label2: TLabel
    Left = 844
    Top = 170
    Width = 63
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Video Stream'
    Visible = False
  end
  object Panel1: TPanel
    Left = 8
    Top = 1
    Width = 532
    Height = 529
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Cam1'
    TabOrder = 0
  end
  object btnOpen: TButton
    Left = 16
    Top = 7
    Width = 55
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Open'
    TabOrder = 1
    Visible = False
    OnClick = btnOpenClick
  end
  object btnURL: TButton
    Left = 70
    Top = 7
    Width = 55
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'URL'
    TabOrder = 2
    Visible = False
    OnClick = btnURLClick
  end
  object btnPause: TButton
    Left = 132
    Top = 7
    Width = 55
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Pausar'
    TabOrder = 3
    Visible = False
    OnClick = btnPauseClick
  end
  object btnStep: TButton
    Left = 186
    Top = 7
    Width = 55
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Continuar'
    TabOrder = 4
    Visible = False
    OnClick = btnStepClick
  end
  object btnStop: TButton
    Left = 240
    Top = 7
    Width = 55
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Parar'
    TabOrder = 5
    Visible = False
    OnClick = btnStopClick
  end
  object btnCapture: TButton
    Left = 198
    Top = 540
    Width = 115
    Height = 45
    Anchors = [akLeft, akBottom]
    Caption = 'Captura'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = btnCaptureClick
  end
  object chkWaterMark: TCheckBox
    Left = 64
    Top = 607
    Width = 124
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Water Mark / Logo'
    TabOrder = 7
  end
  object cboScreens: TComboBox
    Left = 147
    Top = 37
    Width = 96
    Height = 21
    Style = csDropDownList
    Anchors = [akLeft, akBottom]
    ItemHeight = 13
    TabOrder = 8
    Visible = False
    OnChange = cboScreensChange
  end
  object cboVideo: TComboBox
    Left = 66
    Top = 35
    Width = 75
    Height = 21
    Style = csDropDownList
    Anchors = [akLeft, akBottom]
    Enabled = False
    ItemHeight = 13
    TabOrder = 9
    Visible = False
  end
  object cboSubtitle: TComboBox
    Left = 272
    Top = 605
    Width = 75
    Height = 21
    Style = csDropDownList
    Anchors = [akLeft, akBottom]
    Enabled = False
    ItemHeight = 13
    TabOrder = 10
  end
  object chkVideoHook: TCheckBox
    Left = 353
    Top = 607
    Width = 121
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Video Hook (Demo)'
    TabOrder = 11
  end
  object trbHue: TTrackBar
    Left = 470
    Top = 605
    Width = 144
    Height = 25
    Anchors = [akLeft, akBottom]
    Max = 100
    Min = -100
    TabOrder = 12
    TickStyle = tsNone
  end
  object btnHue: TButton
    Left = 613
    Top = 603
    Width = 40
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Reset'
    TabOrder = 13
  end
  object chkMsgLog: TCheckBox
    Left = 744
    Top = 607
    Width = 100
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Message Log ...'
    TabOrder = 14
  end
  object Panel2: TPanel
    Left = 596
    Top = 0
    Width = 532
    Height = 529
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Cam2'
    TabOrder = 15
  end
  object btnOpen2: TButton
    Left = 600
    Top = 7
    Width = 55
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Open'
    TabOrder = 16
    Visible = False
    OnClick = btnOpen2Click
  end
  object btnURL2: TButton
    Left = 654
    Top = 7
    Width = 55
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'URL'
    TabOrder = 17
    Visible = False
    OnClick = btnURL2Click
  end
  object btnPause3: TButton
    Left = 708
    Top = 7
    Width = 55
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Pausar'
    TabOrder = 18
    Visible = False
    OnClick = btnPause3Click
  end
  object btnStep2: TButton
    Left = 762
    Top = 7
    Width = 55
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Continuar'
    TabOrder = 19
    Visible = False
    OnClick = btnStep2Click
  end
  object btnStop2: TButton
    Left = 816
    Top = 7
    Width = 55
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Parar'
    TabOrder = 20
    Visible = False
    OnClick = btnStop2Click
  end
  object btnCapture2: TButton
    Left = 838
    Top = 540
    Width = 115
    Height = 45
    Anchors = [akLeft, akBottom]
    Caption = 'Captura'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 21
    OnClick = btnCapture2Click
  end
  object cboScreens2: TComboBox
    Left = 643
    Top = 45
    Width = 96
    Height = 21
    Style = csDropDownList
    Anchors = [akLeft, akBottom]
    ItemHeight = 13
    TabOrder = 22
    Visible = False
    OnChange = cboScreens2Change
  end
  object cboVideo2: TComboBox
    Left = 818
    Top = 47
    Width = 75
    Height = 21
    Style = csDropDownList
    Anchors = [akLeft, akBottom]
    Enabled = False
    ItemHeight = 13
    TabOrder = 23
    Visible = False
  end
  object FFPlayer: TFFPlayer
    OnFileOpen = FFPlayerFileOpen
    OnFrameHook = FFPlayerFrameHook
    OnVideoHook = FFPlayerVideoHook
    Left = 64
    Top = 216
  end
  object FFLogger: TFFLogger
    Left = 64
    Top = 264
  end
  object OpenDialog1: TOpenDialog
    Left = 104
    Top = 216
  end
  object SavePictureDialog1: TSavePictureDialog
    Left = 104
    Top = 264
  end
  object FFPlayer2: TFFPlayer
    OnFileOpen = FFPlayer2FileOpen
    OnFrameHook = FFPlayer2FrameHook
    OnVideoHook = FFPlayer2VideoHook
    Left = 680
    Top = 216
  end
end
