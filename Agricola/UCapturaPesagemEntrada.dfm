object FCapturaPesagemEntrada: TFCapturaPesagemEntrada
  Left = 434
  Top = 162
  Width = 813
  Height = 561
  Caption = 'PesagemEntrada'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inline Frame_Video1: TFrame1
    Left = 0
    Top = 0
    Width = 377
    Height = 452
    Align = alCustom
    TabOrder = 0
    inherited Panel_Top: TPanel
      Width = 377
      DesignSize = (
        377
        104)
      inherited SpeedButton_RunVideo: TSpeedButton
        OnClick = Frame_Video1SpeedButton_RunVideoClick
      end
      inherited SpeedButton_Stop: TSpeedButton
        OnClick = Frame_Video1SpeedButton_StopClick
      end
      inherited Bevel1: TBevel
        Width = 258
      end
    end
    inherited Panel_Bottom: TPanel
      Width = 377
      Height = 348
      DesignSize = (
        377
        348)
      inherited PaintBox_Video1: TPaintBox
        Left = 360
        Top = -8
        Width = 17
        Height = 41
      end
      inherited Image1: TImage
        Left = 8
        Top = 32
        Width = 345
        Center = True
        Stretch = True
      end
    end
  end
  inline Frame_Video2: TFrame1
    Left = 406
    Top = 0
    Width = 371
    Height = 452
    Align = alCustom
    TabOrder = 1
    inherited Panel_Top: TPanel
      Width = 371
      DesignSize = (
        371
        104)
      inherited Label_Cameras: TLabel
        Caption = 'Camera #2'
      end
      inherited SpeedButton_RunVideo: TSpeedButton
        OnClick = Frame_Video2SpeedButton_RunVideoClick
      end
      inherited SpeedButton_Stop: TSpeedButton
        OnClick = Frame_Video2SpeedButton_StopClick
      end
      inherited Bevel1: TBevel
        Width = 252
      end
    end
    inherited Panel_Bottom: TPanel
      Width = 371
      Height = 348
      DesignSize = (
        371
        348)
      inherited PaintBox_Video1: TPaintBox
        Left = 344
        Width = -6
        Height = 52
      end
      inherited Image1: TImage
        Width = 345
        Center = True
        Stretch = True
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 456
    Width = 777
    Height = 65
    TabOrder = 2
    DesignSize = (
      777
      65)
    object btnCapturar: TBitBtn
      Left = 150
      Top = 12
      Width = 146
      Height = 39
      Anchors = []
      Caption = 'Capturar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ModalResult = 1
      ParentFont = False
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 461
      Top = 12
      Width = 146
      Height = 39
      Anchors = []
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ModalResult = 2
      ParentFont = False
      TabOrder = 1
      TabStop = False
    end
  end
end
