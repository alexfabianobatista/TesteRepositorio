inherited FDetExportCad: TFDetExportCad
  Left = 435
  Top = 159
  Caption = 'Informa'#231#245'es de Exporta'#231#227'o Para o Item'
  ClientHeight = 289
  ClientWidth = 402
  PixelsPerInch = 96
  TextHeight = 14
  inherited Panel1: TPanel
    Width = 402
    inherited SBHelp: TSpeedButton
      Visible = False
    end
    inherited SBConsulta: TSpeedButton
      Visible = False
    end
    inherited sbEnviarSMS: TSpeedButton
      Left = 373
    end
    inherited MELocaliza: TMaskEdit
      Enabled = False
      Visible = False
    end
  end
  inherited StBLongHint: TStatusBar
    Top = 270
    Width = 402
  end
  object DBPDrawBack: TDBPanel [2]
    Left = 50
    Top = 56
    Width = 89
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    CodigoTabStop = True
    DataField = 'DESC_NUM_DRAW'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'DESC_NUM_DRAW'
    ForeignKey = False
    LCaption = 'N'#186' Drawback'
    ReadOnly = False
    Required = False
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object DBPNumRE: TDBPanel [3]
    Left = 148
    Top = 56
    Width = 89
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    CodigoTabStop = True
    DataField = 'DESC_NUM_RE'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'DESC_NUM_RE'
    ForeignKey = False
    LCaption = 'Reg. Exporta'#231#227'o'
    ReadOnly = False
    Required = False
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object DBPChaveAcesso: TDBPanel [4]
    Left = 50
    Top = 96
    Width = 305
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    CodigoTabStop = True
    DataField = 'DESC_CHAVE_ACESSO'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'DESC_CHAVE_ACESSO'
    ForeignKey = False
    LCaption = 'Chave de Acesso'
    ReadOnly = False
    Required = False
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object DBPQuantidadeExportada: TDBPanel [5]
    Left = 247
    Top = 56
    Width = 108
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    CodigoTabStop = True
    DataField = 'QT_QUANTIDADE_EXPORTADA'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'QT_QUANTIDADE_EXPORTADA'
    ForeignKey = False
    LCaption = 'Quantidade Exportada'
    ReadOnly = False
    Required = False
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object DBGrid1: TDBGrid [6]
    Left = 31
    Top = 144
    Width = 345
    Height = 120
    DataSource = DSPrimario
    TabOrder = 6
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DESC_NUM_DRAW'
        Title.Caption = 'DrawBack'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_NUM_RE'
        Title.Caption = 'Regi. Exporta'#231#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QT_QUANTIDADE_EXPORTADA'
        Title.Caption = 'Quant. Exportada'
        Visible = True
      end>
  end
  inherited DSPrimario: TDataSource
    DataSet = DMNotaSaida.QNfeExport
    Left = 351
  end
end
