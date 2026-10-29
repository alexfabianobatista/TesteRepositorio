object Form1: TForm1
  Left = 476
  Top = 185
  Width = 348
  Height = 410
  Caption = 'Configur'#231#245'es do PAF-ECF'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  DesignSize = (
    332
    372)
  PixelsPerInch = 96
  TextHeight = 13
  object pcConfig: TPageControl
    Left = 4
    Top = 8
    Width = 324
    Height = 360
    ActivePage = TSDadosECF
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    OnChanging = pcConfigChanging
    object TSDadosECF: TTabSheet
      Caption = 'Dados do ECF'
      object Label1: TLabel
        Left = 24
        Top = 48
        Width = 62
        Height = 13
        Caption = 'Grande Total'
      end
      object Label8: TLabel
        Left = 16
        Top = 286
        Width = 187
        Height = 13
        Caption = 'MD5 dos arquivos fontes e execut'#225'veis'
      end
      object GroupBox1: TGroupBox
        Left = 16
        Top = 88
        Width = 281
        Height = 193
        Caption = 'ECFs Autorizados'
        TabOrder = 0
        object LBECFs: TListBox
          Left = 40
          Top = 16
          Width = 193
          Height = 137
          ItemHeight = 13
          TabOrder = 0
        end
        object BitBtn1: TBitBtn
          Left = 40
          Top = 160
          Width = 75
          Height = 25
          Caption = 'Adicionar'
          TabOrder = 1
          OnClick = BitBtn1Click
        end
        object BitBtn2: TBitBtn
          Left = 158
          Top = 160
          Width = 75
          Height = 25
          Caption = 'Remover'
          TabOrder = 2
          OnClick = BitBtn2Click
        end
      end
      object bt0Novo: TBitBtn
        Left = 0
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Novo Arquivo'
        TabOrder = 1
        OnClick = bt0NovoClick
      end
      object bt0Abrir: TBitBtn
        Left = 80
        Top = 8
        Width = 73
        Height = 25
        Caption = 'Abrir arquivo'
        TabOrder = 2
        OnClick = bt0AbrirClick
      end
      object bt0Gravar: TBitBtn
        Left = 160
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Gravar'
        Enabled = False
        TabOrder = 3
        OnClick = bt0GravarClick
      end
      object bt0Cancelar: TBitBtn
        Left = 241
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Cancelar'
        Enabled = False
        TabOrder = 4
        OnClick = bt0CancelarClick
      end
      object edGrandeTotal: TMaskEdit
        Left = 24
        Top = 64
        Width = 145
        Height = 21
        EditMask = '999999999999999999;1;_'
        MaxLength = 18
        TabOrder = 5
        Text = '                  '
        OnEnter = edGrandeTotalEnter
        OnExit = edGrandeTotal1Exit
      end
      object EdMD5: TEdit
        Left = 16
        Top = 300
        Width = 281
        Height = 21
        AutoSize = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 6
      end
    end
    object TSDadosEmpresa: TTabSheet
      Caption = 'Empresa Desenvolvedora'
      ImageIndex = 1
      object Label2: TLabel
        Left = 16
        Top = 48
        Width = 123
        Height = 13
        Caption = 'CNPJ da Desenvolvedora'
      end
      object Label3: TLabel
        Left = 16
        Top = 88
        Width = 183
        Height = 13
        Caption = 'Inscri'#231#227'o Estadual da Desenvolvedora'
      end
      object Label4: TLabel
        Left = 16
        Top = 128
        Width = 187
        Height = 13
        Caption = 'Inscri'#231#227'o Municipal da Desenvolvedora'
      end
      object Label5: TLabel
        Left = 16
        Top = 168
        Width = 162
        Height = 13
        Caption = 'Denomina'#231#227'o da Desenvolvedora'
      end
      object Label6: TLabel
        Left = 16
        Top = 208
        Width = 89
        Height = 13
        Caption = 'Nome do PAF-ECF'
      end
      object Label7: TLabel
        Left = 16
        Top = 248
        Width = 94
        Height = 13
        Caption = 'Vers'#227'o do PAF-ECF'
      end
      object edCNPJ: TEdit
        Left = 16
        Top = 64
        Width = 193
        Height = 21
        TabOrder = 0
      end
      object edIE: TEdit
        Left = 16
        Top = 104
        Width = 193
        Height = 21
        TabOrder = 1
      end
      object edIM: TEdit
        Left = 16
        Top = 144
        Width = 193
        Height = 21
        TabOrder = 2
      end
      object edDenominacao: TEdit
        Left = 16
        Top = 184
        Width = 193
        Height = 21
        TabOrder = 3
      end
      object edNomePaf: TEdit
        Left = 16
        Top = 224
        Width = 193
        Height = 21
        TabOrder = 4
      end
      object edVersaoPAF: TEdit
        Left = 16
        Top = 264
        Width = 193
        Height = 21
        TabOrder = 5
      end
      object bt1Novo: TBitBtn
        Left = 0
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Novo Arquivo'
        TabOrder = 6
        OnClick = bt1NovoClick
      end
      object bt1Abrir: TBitBtn
        Left = 80
        Top = 8
        Width = 73
        Height = 25
        Caption = 'Abrir arquivo'
        TabOrder = 7
        OnClick = bt1AbrirClick
      end
      object bt1Gravar: TBitBtn
        Left = 160
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Gravar'
        Enabled = False
        TabOrder = 8
        OnClick = bt1GravarClick
      end
      object bt1Cancelar: TBitBtn
        Left = 241
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Cancelar'
        Enabled = False
        TabOrder = 9
        OnClick = bt1CancelarClick
      end
    end
  end
  object sdArquivoConfig: TSaveDialog
    FileName = 'config.txt'
    Filter = 'ArquivoTexto|config.txt'
    InitialDir = 'C:\'
    Options = [ofHideReadOnly, ofNoChangeDir, ofNoNetworkButton, ofEnableSizing]
    Left = 264
    Top = 74
  end
  object odAbrirArquivoConfig: TOpenDialog
    FileName = 'Config.txt'
    Filter = 'Arquivo texto|Config.txt'
    InitialDir = 'C:\'
    Options = [ofHideReadOnly, ofNoChangeDir, ofPathMustExist, ofFileMustExist, ofNoNetworkButton, ofEnableSizing]
    Left = 232
    Top = 72
  end
end
