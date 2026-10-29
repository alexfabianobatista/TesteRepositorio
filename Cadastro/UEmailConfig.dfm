inherited FEmailConfig: TFEmailConfig
  Left = 408
  Top = 173
  Caption = 'Configura'#231#227'o Email'
  ClientHeight = 365
  ClientWidth = 461
  PixelsPerInch = 96
  TextHeight = 14
  object Label9: TLabel [0]
    Left = 201
    Top = 56
    Width = 52
    Height = 14
    Caption = 'Mensagem'
  end
  inherited Panel1: TPanel
    Width = 461
    TabOrder = 12
    inherited BtCopia: TSpeedButton
      Left = 219
    end
    inherited lbPesquisaCodigo: TLabel
      Left = 321
    end
    inherited SBConsulta: TSpeedButton
      Left = 428
    end
    inherited pnSeparador2: TPanel
      Left = 312
    end
    inherited MELocaliza: TMaskEdit
      Left = 379
    end
  end
  object DBMemo1: TDBMemo [3]
    Left = 200
    Top = 70
    Width = 233
    Height = 235
    DataField = 'DESC_MENSAGEM'
    DataSource = DSPrimario
    TabOrder = 11
  end
  object DBPEmail: TDBPanel [4]
    Left = 8
    Top = 96
    Width = 185
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
    LCaption = 'E-Mail'
    ReadOnly = False
    Required = True
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object DBPSenha: TDBPanel [5]
    Left = 8
    Top = 136
    Width = 185
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
  object DBPSmtp: TDBPanel [6]
    Left = 8
    Top = 176
    Width = 148
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
  object DBPPortaSmtp: TDBPanel [7]
    Left = 160
    Top = 176
    Width = 33
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    CodigoTabStop = True
    DataField = 'NUM_PORTA_SMTP'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'NUM_PORTA_SMTP'
    ForeignKey = False
    LCaption = 'Porta'
    ReadOnly = False
    Required = True
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object DBPPop3: TDBPanel [8]
    Left = 8
    Top = 216
    Width = 148
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    CodigoTabStop = True
    DataField = 'DESC_POP3'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'DESC_POP3'
    ForeignKey = False
    LCaption = 'POP3'
    ReadOnly = False
    Required = True
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object DBPPortaPop3: TDBPanel [9]
    Left = 160
    Top = 216
    Width = 33
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    CodigoTabStop = True
    DataField = 'NUM_PORTA_POP3'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'NUM_PORTA_POP3'
    ForeignKey = False
    LCaption = 'Porta'
    ReadOnly = False
    Required = True
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object DBPCodigo: TDBPanel [10]
    Left = 8
    Top = 56
    Width = 65
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    CodigoTabStop = False
    DataField = 'COD_EMAIL'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'COD_EMAIL'
    ForeignKey = False
    LCaption = 'C'#243'digo'
    ReadOnly = True
    Required = False
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object DBPHomePage: TDBPanel [11]
    Left = 8
    Top = 295
    Width = 185
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    CodigoTabStop = True
    DataField = 'DESC_HOME_PAGE'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'DESC_HOME_PAGE'
    ForeignKey = False
    LCaption = 'Home Page'
    ReadOnly = False
    Required = False
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object DBCBSSL: TDBCheckBox [12]
    Left = 200
    Top = 311
    Width = 233
    Height = 17
    Caption = 'Utiliza conex'#227'o com SSL'
    DataField = 'IND_SSL'
    DataSource = DSPrimario
    TabOrder = 10
    ValueChecked = 'S'
    ValueUnchecked = 'N'
  end
  inherited StBLongHint: TStatusBar
    Top = 346
    Width = 461
  end
  object DBPImap: TDBPanel [14]
    Left = 8
    Top = 256
    Width = 148
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    CodigoTabStop = True
    DataField = 'DESC_IMAP'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'DESC_IMAP'
    ForeignKey = False
    LCaption = 'IMAP'
    ReadOnly = False
    Required = False
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object DBPanel2: TDBPanel [15]
    Left = 159
    Top = 255
    Width = 33
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    CodigoTabStop = True
    DataField = 'NUM_PORTA_IMAP'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'NUM_PORTA_IMAP'
    ForeignKey = False
    LCaption = 'Porta'
    ReadOnly = False
    Required = False
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  inherited MMCadSimples: TMainMenu
    Left = 380
    Top = 41
  end
  inherited DSPrimario: TDataSource
    DataSet = DMCadastro.QCadastroEmail
    Left = 405
    Top = 41
  end
  inherited ILBotao: TImageList
    Left = 351
    Top = 41
  end
  inherited ALCadastro: TActionList
    Left = 323
    Top = 41
  end
end
