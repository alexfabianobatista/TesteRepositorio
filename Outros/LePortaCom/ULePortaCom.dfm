object FLePorta: TFLePorta
  Left = 526
  Top = 301
  Width = 495
  Height = 339
  Caption = 'FLePorta'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblLePorta: TLabel
    Left = 8
    Top = 24
    Width = 47
    Height = 13
    Caption = 'lblLePorta'
  end
  object lblQtdChar: TLabel
    Left = 8
    Top = 40
    Width = 49
    Height = 13
    Caption = 'lblQtdChar'
  end
  object Button1: TButton
    Left = 8
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Ler porta'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 5
    Top = 128
    Width = 468
    Height = 168
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object cbPortaCom: TComboBox
    Left = 96
    Top = 8
    Width = 169
    Height = 21
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 2
    Text = 'COM1'
    Items.Strings = (
      'COM1'
      'COM2'
      'COM3'
      'COM4')
  end
  object RadioGroup1: TRadioGroup
    Left = 96
    Top = 32
    Width = 169
    Height = 89
    Caption = 'Balan'#231'a'
    ItemIndex = 0
    Items.Strings = (
      'Filizola'
      'Toledo'
      'WT3000')
    TabOrder = 3
  end
  object gbConfiguracoes: TGroupBox
    Left = 272
    Top = 24
    Width = 201
    Height = 97
    Caption = 'Configura'#231#245'es da Porta'
    Enabled = False
    TabOrder = 4
    object Label1: TLabel
      Left = 7
      Top = 16
      Width = 51
      Height = 13
      Caption = 'Baud Rate'
    end
    object Label2: TLabel
      Left = 7
      Top = 56
      Width = 72
      Height = 13
      Caption = 'Tamanho(Byte)'
    end
    object Label3: TLabel
      Left = 118
      Top = 15
      Width = 42
      Height = 13
      Caption = 'Paridade'
    end
    object Label4: TLabel
      Left = 118
      Top = 55
      Width = 42
      Height = 13
      Caption = 'StopBits '
    end
    object cbBaudRate: TComboBox
      Left = 5
      Top = 30
      Width = 76
      Height = 21
      ItemHeight = 13
      ItemIndex = 2
      TabOrder = 0
      Text = '9600'
      Items.Strings = (
        '2400'
        '4800'
        '9600'
        '14400'
        '19200')
    end
    object cbByteSize: TComboBox
      Left = 5
      Top = 70
      Width = 76
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 1
      Text = '8'
      Items.Strings = (
        '8'
        '16'
        '24'
        '32'
        '40')
    end
    object cbParity: TComboBox
      Left = 117
      Top = 29
      Width = 76
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 2
      Text = '0'
      Items.Strings = (
        '0'
        '1'
        '2')
    end
    object cbStopBits: TComboBox
      Left = 117
      Top = 69
      Width = 76
      Height = 21
      ItemHeight = 13
      TabOrder = 3
      Text = '0'
      Items.Strings = (
        '0'
        '1')
    end
  end
  object cbForcaConfig: TCheckBox
    Left = 273
    Top = 8
    Width = 137
    Height = 17
    Caption = 'For'#231'ar Configura'#231#245'es'
    TabOrder = 5
    OnClick = cbForcaConfigClick
  end
end
