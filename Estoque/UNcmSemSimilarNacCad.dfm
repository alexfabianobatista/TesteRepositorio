inherited FNcmSemSimilarNacCad: TFNcmSemSimilarNacCad
  Left = 432
  Top = 181
  Caption = 'Cadastro de NCM sem similar nacional - Resolu'#231'ao CAMEX'
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel [0]
    Left = 16
    Top = 112
    Width = 49
    Height = 14
    Caption = 'Descri'#231#227'o'
  end
  inherited Panel1: TPanel
    inherited SBConsulta: TSpeedButton
      Left = 539
    end
    inherited lbPesquisaCodigo: TLabel
      Left = 435
    end
    inherited MELocaliza: TMaskEdit
      Left = 491
      EditMask = ''
      MaxLength = 0
      Text = ''
    end
    inherited pnSeparador2: TPanel
      Left = 423
    end
  end
  object DBPanel1: TDBPanel [3]
    Left = 16
    Top = 64
    Width = 177
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    CodigoTabStop = True
    DataField = 'NUM_NCM'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'NUM_NCM'
    ForeignKey = False
    LCaption = 'NCM'
    ReadOnly = False
    Required = True
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object DBMemo1: TDBMemo [4]
    Left = 16
    Top = 128
    Width = 545
    Height = 177
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataField = 'DESC_NCM'
    DataSource = DSPrimario
    TabOrder = 3
  end
  inherited DSPrimario: TDataSource
    DataSet = DMNcm.QNcmSemSimilarNacCad
  end
end
