inherited FPecaRetornoCad: TFPecaRetornoCad
  Left = 318
  Top = 200
  Caption = 'Cadastro de Pe'#231'as de Retorno'
  ClientHeight = 283
  ClientWidth = 423
  PixelsPerInch = 96
  TextHeight = 14
  object Label2: TLabel [0]
    Left = 16
    Top = 160
    Width = 60
    Height = 14
    Caption = 'Observa'#231#227'o'
  end
  inherited Panel1: TPanel
    Width = 423
    TabOrder = 5
    inherited sbEnviarSMS: TSpeedButton
      Left = 570
    end
  end
  inherited StBLongHint: TStatusBar
    Top = 264
    Width = 423
  end
  object DBPanel1: TDBPanel [3]
    Left = 16
    Top = 112
    Width = 66
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    CodigoTabStop = False
    DataField = 'COD_PECA_RETORNO'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'COD_PECA_RETORNO'
    ForeignKey = False
    LCaption = 'C'#243'digo'
    ReadOnly = True
    Required = False
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object DBPanel2: TDBPanel [4]
    Left = 86
    Top = 112
    Width = 75
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    CodigoTabStop = True
    DataField = 'COD_PECA'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'COD_PECA'
    ForeignKey = False
    LCaption = 'Pe'#231'a'
    ReadOnly = False
    Required = True
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object DBPanel4: TDBPanel [5]
    Left = 254
    Top = 112
    Width = 73
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    CodigoTabStop = True
    DataField = 'DT_RETORNO'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'DT_RETORNO'
    ForeignKey = False
    LCaption = 'Data'
    ReadOnly = False
    Required = True
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object DBPanel3: TDBPanel [6]
    Left = 165
    Top = 112
    Width = 84
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    CodigoTabStop = True
    DataField = 'NUM_SERIE'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'NUM_SERIE'
    ForeignKey = False
    LCaption = 'S'#233'rie'
    ReadOnly = False
    Required = True
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object GBCodBarras: TGroupBox [7]
    Left = 8
    Top = 48
    Width = 249
    Height = 49
    Caption = 'Incluir por c'#243'digo de barras'
    TabOrder = 0
    object MECodBarras: TMaskEdit
      Left = 56
      Top = 16
      Width = 185
      Height = 22
      TabOrder = 0
      OnChange = MECodBarrasChange
      OnKeyPress = MECodBarrasKeyPress
    end
  end
  object DBEdit2: TDBEdit [8]
    Left = 16
    Top = 176
    Width = 313
    Height = 22
    DataField = 'DESC_OBSERVACAO'
    DataSource = DSPrimario
    TabOrder = 7
  end
  object DBRPeca_situacao: TDBRadioGroup [9]
    Left = 15
    Top = 208
    Width = 314
    Height = 45
    Caption = 'Situa'#231#227'o da Pe'#231'a'
    Columns = 2
    DataField = 'IND_SITUACAO'
    DataSource = DSPrimario
    Items.Strings = (
      'Retornar'
      'Devolvida')
    TabOrder = 8
    Values.Strings = (
      'R'
      'D')
  end
  inherited MMCadSimples: TMainMenu
    Left = 328
    Top = 48
    inherited Relatrios1: TMenuItem
      object PeasdeRetorno1: TMenuItem
        Caption = '&Pe'#231'as de Retorno'
        OnClick = PeasdeRetorno1Click
      end
    end
    object Opes1: TMenuItem
      Caption = 'Op'#231#245'es'
      object BaixarPea1: TMenuItem
        Caption = 'Baixar Pe'#231'a'
        OnClick = BaixarPea1Click
      end
      object DevolverPea1: TMenuItem
        Caption = 'Pe'#231'a Devolvida'
        OnClick = DevolverPea1Click
      end
      object PeaaRetornar1: TMenuItem
        Caption = 'Pe'#231'a a Retornar'
        OnClick = PeaaRetornar1Click
      end
    end
  end
  inherited DSPrimario: TDataSource
    DataSet = DMPecaRetorno.QPecaRetorno
    Left = 360
    Top = 48
  end
  inherited ILBotao: TImageList
    Left = 264
    Top = 48
  end
  inherited ALCadastro: TActionList
    Left = 296
    Top = 48
  end
end
