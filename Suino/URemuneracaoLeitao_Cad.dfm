inherited FRemuneracaoLeitao_Cad: TFRemuneracaoLeitao_Cad
  Left = 317
  Top = 172
  Caption = 'Tabela de Remunera'#231#227'o de Leit'#227'o'
  ClientHeight = 255
  ClientWidth = 601
  PixelsPerInch = 96
  TextHeight = 14
  inherited Panel1: TPanel
    Width = 601
  end
  inherited StBLongHint: TStatusBar
    Top = 236
    Width = 601
  end
  object DBPanel1: TDBPanel [2]
    Left = 16
    Top = 64
    Width = 113
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    CodigoTabStop = True
    DataField = 'DESC_TIPO_PARCERIA'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'DESC_TIPO_PARCERIA'
    ForeignKey = False
    LCaption = 'Tipo Parceria'
    ReadOnly = False
    Required = True
    WidthCodigo = 20.000000000000000000
  end
  object DBPanel2: TDBPanel [3]
    Left = 16
    Top = 112
    Width = 122
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    CodigoTabStop = True
    DataField = 'QT_PESO_REFERENCIA'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'QT_PESO_REFERENCIA'
    ForeignKey = False
    LCaption = 'Peso Refer'#234'ncia'
    ReadOnly = False
    Required = True
    WidthCodigo = 20.000000000000000000
  end
  object DBPanel3: TDBPanel [4]
    Left = 143
    Top = 112
    Width = 122
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    CodigoTabStop = True
    DataField = 'QT_INCREMENTO_REFERENCIA'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'QT_INCREMENTO_REFERENCIA'
    ForeignKey = False
    LCaption = 'Incremento Refer'#234'ncia'
    ReadOnly = False
    Required = True
    WidthCodigo = 20.000000000000000000
  end
  object DBPanel4: TDBPanel [5]
    Left = 280
    Top = 112
    Width = 144
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    CodigoTabStop = True
    DataField = 'VL_PESO_REFERENCIA'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'VL_PESO_REFERENCIA'
    ForeignKey = False
    LCaption = 'Vl. Peso Refer'#234'ncia'
    ReadOnly = False
    Required = True
    WidthCodigo = 20.000000000000000000
  end
  object DBPanel5: TDBPanel [6]
    Left = 431
    Top = 112
    Width = 144
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    CodigoTabStop = True
    DataField = 'VL_INCREMENTO_REFERENCIA'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'VL_INCREMENTO_REFERENCIA'
    ForeignKey = False
    LCaption = 'Vl. Incremento Refer'#234'ncia'
    ReadOnly = False
    Required = True
    WidthCodigo = 20.000000000000000000
  end
  object DBPanel6: TDBPanel [7]
    Left = 16
    Top = 160
    Width = 121
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    CodigoTabStop = True
    DataField = 'QT_CONVERSAO_REFERENICIA'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'QT_CONVERSAO_REFERENICIA'
    ForeignKey = False
    LCaption = 'Convers'#227'o Refer'#234'ncia'
    ReadOnly = False
    Required = True
    WidthCodigo = 20.000000000000000000
  end
  object DBPanel7: TDBPanel [8]
    Left = 144
    Top = 160
    Width = 121
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    CodigoTabStop = True
    DataField = 'QT_CONVERSAO_INCREMENTO'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'QT_CONVERSAO_INCREMENTO'
    ForeignKey = False
    LCaption = 'Incremento Conver'#227'o'
    ReadOnly = False
    Required = True
    WidthCodigo = 20.000000000000000000
  end
  object DBPanel9: TDBPanel [9]
    Left = 280
    Top = 160
    Width = 144
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    CodigoTabStop = True
    DataField = 'VL_CONVERSAO_INCREMENTO'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'VL_CONVERSAO_INCREMENTO'
    ForeignKey = False
    LCaption = 'Vl. Convers'#227'o Incremento'
    ReadOnly = False
    Required = True
    WidthCodigo = 20.000000000000000000
  end
  inherited DSPrimario: TDataSource
    DataSet = DMRemuneracaoLeitao.QRemuneracaoLeitao_Cad
  end
end
