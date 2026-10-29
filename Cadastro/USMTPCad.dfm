inherited FSMTPCad: TFSMTPCad
  Left = 415
  Top = 92
  Caption = 'Cadastro de SMTP'
  ClientHeight = 528
  ClientWidth = 494
  PixelsPerInch = 96
  TextHeight = 14
  inherited Panel1: TPanel
    Width = 494
    inherited lbPesquisaCodigo: TLabel
      Left = 352
    end
    inherited SBConsulta: TSpeedButton
      Left = 459
    end
    inherited pnSeparador2: TPanel
      Left = 343
    end
    inherited MELocaliza: TMaskEdit
      Left = 410
    end
  end
  inherited StBLongHint: TStatusBar
    Top = 509
    Width = 494
  end
  object PageControl1: TPageControl [3]
    Left = 0
    Top = 41
    Width = 494
    Height = 468
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'Cabe'#231'alho'
      DesignSize = (
        486
        439)
      object GroupBox1: TGroupBox
        Left = 8
        Top = 0
        Width = 469
        Height = 432
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = 'Principal'
        TabOrder = 0
        object Label1: TLabel
          Left = 24
          Top = 272
          Width = 93
          Height = 14
          Caption = 'Tipo de criptografia'
        end
        object DBPanel1: TDBPanel
          Left = 24
          Top = 32
          Width = 113
          Height = 37
          BevelOuter = bvNone
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          CodigoTabStop = False
          DataField = 'COD_SMTP'
          DataSource = DSPrimario
          fkCache = False
          fkChave = 'COD_SMTP'
          ForeignKey = False
          LCaption = 'C'#243'digo'
          ReadOnly = True
          Required = False
          ValidateOnExit = False
          WidthCodigo = 20.000000000000000000
        end
        object DBPEmail: TDBPanel
          Left = 24
          Top = 80
          Width = 360
          Height = 37
          BevelOuter = bvNone
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          CodigoTabStop = True
          DataField = 'DESC_EMAIL'
          DataSource = DSPrimario
          fkCache = False
          fkChave = 'DESC_EMAIL'
          ForeignKey = False
          LCaption = 'E-mail'
          ReadOnly = False
          Required = True
          ValidateOnExit = False
          WidthCodigo = 20.000000000000000000
        end
        object DBPSenha: TDBPanel
          Left = 24
          Top = 128
          Width = 360
          Height = 37
          BevelOuter = bvNone
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          CodigoTabStop = True
          DataField = 'DESC_SENHA'
          DataSource = DSPrimario
          fkCache = False
          fkChave = 'DESC_SENHA'
          ForeignKey = False
          LCaption = 'Senha'
          PasswordChar = '*'
          ReadOnly = False
          Required = True
          ValidateOnExit = False
          WidthCodigo = 20.000000000000000000
        end
        object DBPSMTP: TDBPanel
          Left = 24
          Top = 176
          Width = 360
          Height = 37
          BevelOuter = bvNone
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          CodigoTabStop = True
          DataField = 'DESC_SMTP'
          DataSource = DSPrimario
          fkCache = False
          fkChave = 'DESC_SMTP'
          ForeignKey = False
          LCaption = 'SMTP'
          ReadOnly = False
          Required = True
          ValidateOnExit = False
          WidthCodigo = 20.000000000000000000
        end
        object DBPanel4: TDBPanel
          Left = 24
          Top = 224
          Width = 81
          Height = 37
          BevelOuter = bvNone
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          CodigoTabStop = True
          DataField = 'DESC_PORT'
          DataSource = DSPrimario
          fkCache = False
          fkChave = 'DESC_PORT'
          ForeignKey = False
          LCaption = 'Porta'
          ReadOnly = False
          Required = True
          ValidateOnExit = False
          WidthCodigo = 20.000000000000000000
        end
        object DBRadioGroup4: TDBRadioGroup
          Left = 24
          Top = 328
          Width = 105
          Height = 49
          Caption = 'Autentica'#231#227'o'
          Columns = 2
          DataField = 'IND_AUTENTICACAO'
          DataSource = DSPrimario
          Items.Strings = (
            'Sim'
            'N'#227'o')
          TabOrder = 6
          Values.Strings = (
            'S'
            'N')
        end
        object DBComboBox1: TDBComboBox
          Left = 24
          Top = 288
          Width = 145
          Height = 22
          DataField = 'DESC_TIPO_CRIPTOGRAFIA'
          DataSource = DSPrimario
          ItemHeight = 14
          Items.Strings = (
            'NENHUM'
            'SSL'
            'TLS')
          TabOrder = 5
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Envio'
      ImageIndex = 1
      DesignSize = (
        486
        439)
      object GroupBox2: TGroupBox
        Left = 8
        Top = 8
        Width = 467
        Height = 233
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Configura'#231#245'es de envio'
        TabOrder = 0
        object DBPanel5: TDBPanel
          Left = 24
          Top = 32
          Width = 177
          Height = 37
          BevelOuter = bvNone
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          CodigoTabStop = True
          DataField = 'QT_EMAIL'
          DataSource = DSPrimario
          fkCache = False
          fkChave = 'QT_EMAIL'
          ForeignKey = False
          LCaption = 'Quantidade de e-mails por intervalo'
          ReadOnly = False
          Required = False
          ValidateOnExit = False
          WidthCodigo = 20.000000000000000000
        end
        object DBPanel6: TDBPanel
          Left = 24
          Top = 80
          Width = 177
          Height = 37
          BevelOuter = bvNone
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          CodigoTabStop = True
          DataField = 'QT_HORAS'
          DataSource = DSPrimario
          fkCache = False
          fkChave = 'QT_HORAS'
          ForeignKey = False
          LCaption = 'Quantidade de horas por intervalo'
          ReadOnly = False
          Required = False
          ValidateOnExit = False
          WidthCodigo = 20.000000000000000000
        end
        object DBPanel2: TDBPanel
          Left = 24
          Top = 128
          Width = 193
          Height = 37
          BevelOuter = bvNone
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          CodigoTabStop = True
          DataField = 'QT_ENVIOS_VEZ'
          DataSource = DSPrimario
          fkCache = False
          fkChave = 'QT_ENVIOS_VEZ'
          ForeignKey = False
          LCaption = 'Quantidade de e-mails enviados por vez'
          ReadOnly = False
          Required = False
          ValidateOnExit = False
          WidthCodigo = 20.000000000000000000
        end
      end
      object GroupBox3: TGroupBox
        Left = 8
        Top = 248
        Width = 465
        Height = 177
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = 'Informa'#231#245'es'
        TabOrder = 1
        object DBPanel7: TDBPanel
          Left = 24
          Top = 36
          Width = 97
          Height = 37
          BevelOuter = bvNone
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          CodigoTabStop = False
          DataField = 'QT_ENVIOS_ATUAL'
          DataSource = DSPrimario
          fkCache = False
          fkChave = 'QT_ENVIOS_ATUAL'
          ForeignKey = False
          LCaption = 'Envios atualmente'
          ReadOnly = True
          Required = False
          ValidateOnExit = False
          WidthCodigo = 20.000000000000000000
        end
        object DBPanel9: TDBPanel
          Left = 24
          Top = 84
          Width = 185
          Height = 37
          BevelOuter = bvNone
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          CodigoTabStop = False
          DataField = 'DT_INICIO_ENVIO'
          DataSource = DSPrimario
          fkCache = False
          fkChave = 'DT_INICIO_ENVIO'
          ForeignKey = False
          LCaption = 'Inicio da contagem de envios'
          ReadOnly = True
          Required = False
          ValidateOnExit = False
          WidthCodigo = 20.000000000000000000
        end
      end
    end
  end
  inherited MMCadSimples: TMainMenu
    Left = 428
  end
  inherited DSPrimario: TDataSource
    DataSet = DMMalaDireta.QSMTP
    Left = 342
  end
  inherited ILBotao: TImageList
    Left = 371
  end
  inherited ALCadastro: TActionList
    Left = 397
  end
  inherited IdHTTP1: TIdHTTP
    Left = 456
  end
end
