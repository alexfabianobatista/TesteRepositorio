object FVisualizaAmplia: TFVisualizaAmplia
  Left = 360
  Top = 123
  BorderStyle = bsDialog
  Caption = 'Visualizar Imagem'
  ClientHeight = 511
  ClientWidth = 967
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 967
    Height = 511
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      967
      511)
    object Image1: TImage
      Left = 16
      Top = 96
      Width = 932
      Height = 382
      Anchors = [akLeft, akTop, akRight, akBottom]
      Stretch = True
    end
    object Label1: TLabel
      Left = 568
      Top = 16
      Width = 96
      Height = 37
      Caption = 'ZOOM'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -32
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Button1: TButton
      Left = 544
      Top = 56
      Width = 41
      Height = 25
      Caption = '+'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 592
      Top = 56
      Width = 41
      Height = 25
      Caption = '-'
      TabOrder = 1
      OnClick = Button2Click
    end
    object EdtPerc: TEdit
      Left = 640
      Top = 60
      Width = 57
      Height = 21
      TabOrder = 2
      Text = '10'
    end
    object Panel2: TPanel
      Left = 504
      Top = 720
      Width = 212
      Height = 41
      BevelOuter = bvNone
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
    end
  end
end
