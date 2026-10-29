inherited FRegistroTipo60DCad: TFRegistroTipo60DCad
  Left = 392
  Top = 177
  Caption = 'Cadastro de Registro Tipo 60 Di'#225'rio'
  PixelsPerInch = 96
  TextHeight = 14
  object pgOpcoes: TPageControl [2]
    Left = 0
    Top = 48
    Width = 577
    Height = 273
    ActivePage = TabSheet1
    TabOrder = 2
    OnChanging = pgOpcoesChanging
    object TabSheet1: TTabSheet
      Caption = 'Importa'#231#227'o autom'#225'tica'
      object Label1: TLabel
        Left = 5
        Top = 52
        Width = 20
        Height = 14
        Caption = 'M'#234's'
      end
      object Label2: TLabel
        Left = 80
        Top = 52
        Width = 20
        Height = 14
        Caption = 'Ano'
      end
      inline FmFilial1: TFmFilial
        Left = 4
        Top = 8
        Width = 557
        Height = 37
        TabOrder = 0
        inherited Label1: TLabel
          Height = 14
        end
        inherited MeFilial: TMaskEdit
          Height = 22
        end
        inherited EdFilial: TEdit
          Width = 481
          Height = 22
        end
      end
      object MeMes: TMaskEdit
        Left = 5
        Top = 68
        Width = 69
        Height = 22
        EditMask = '!99;0;_'
        MaxLength = 2
        TabOrder = 1
      end
      object MeAno: TMaskEdit
        Left = 80
        Top = 68
        Width = 69
        Height = 22
        EditMask = '!9999;0;_'
        MaxLength = 4
        TabOrder = 2
      end
      object btImportar: TBitBtn
        Left = 488
        Top = 216
        Width = 75
        Height = 25
        Caption = 'Importar'
        TabOrder = 3
        OnClick = btImportarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
          FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
          00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
          F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
          00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
          F033777777777337F73309999990FFF0033377777777FFF77333099999000000
          3333777777777777333333399033333333333337773333333333333903333333
          3333333773333333333333303333333333333337333333333333}
        NumGlyphs = 2
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Cadastro manual'
      ImageIndex = 1
      object DBPanel1: TDBPanel
        Left = 8
        Top = 8
        Width = 145
        Height = 37
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        CodigoTabStop = False
        DataField = 'COD_REGISTRO_DIARIO'
        DataSource = DSPrimario
        fkCache = False
        fkChave = 'COD_REGISTRO_DIARIO'
        ForeignKey = False
        LCaption = 'C'#243'digo'
        ReadOnly = True
        Required = False
        ValidateOnExit = False
        WidthCodigo = 20.000000000000000000
      end
      object DBPanel2: TDBPanel
        Left = 8
        Top = 48
        Width = 89
        Height = 37
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        CodigoTabStop = True
        DataField = 'DT_EMISSAO'
        DataSource = DSPrimario
        fkCache = False
        fkChave = 'DT_EMISSAO'
        ForeignKey = False
        LCaption = 'Data de Emiss'#227'o'
        ReadOnly = False
        Required = False
        ValidateOnExit = False
        WidthCodigo = 20.000000000000000000
      end
      object DBPanel3: TDBPanel
        Left = 104
        Top = 48
        Width = 49
        Height = 37
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        CodigoTabStop = True
        DataField = 'DESC_SUBTIPO'
        DataSource = DSPrimario
        fkCache = False
        fkChave = 'DESC_SUBTIPO'
        ForeignKey = False
        LCaption = 'Sub Tipo'
        ReadOnly = False
        Required = False
        ValidateOnExit = False
        WidthCodigo = 20.000000000000000000
      end
      object DBPanel4: TDBPanel
        Left = 160
        Top = 48
        Width = 193
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
        LCaption = 'N'#250'mero de S'#233'rie ECF'
        ReadOnly = False
        Required = False
        ValidateOnExit = False
        WidthCodigo = 20.000000000000000000
      end
      object DBPanel5: TDBPanel
        Left = 8
        Top = 88
        Width = 89
        Height = 37
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        CodigoTabStop = True
        DataField = 'QT_QUANTIDADE'
        DataSource = DSPrimario
        fkCache = False
        fkChave = 'QT_QUANTIDADE'
        ForeignKey = False
        LCaption = 'Quantidade'
        ReadOnly = False
        Required = False
        ValidateOnExit = False
        WidthCodigo = 20.000000000000000000
      end
      object DBPanel6: TDBPanel
        Left = 160
        Top = 88
        Width = 89
        Height = 37
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        CodigoTabStop = True
        DataField = 'VAL_BASE_ICMS'
        DataSource = DSPrimario
        fkCache = False
        fkChave = 'VAL_BASE_ICMS'
        ForeignKey = False
        LCaption = 'Valor Base ICMS'
        ReadOnly = False
        Required = False
        ValidateOnExit = False
        WidthCodigo = 20.000000000000000000
      end
      object DBPanel7: TDBPanel
        Left = 256
        Top = 88
        Width = 97
        Height = 37
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        CodigoTabStop = True
        DataField = 'VAL_ICMS'
        DataSource = DSPrimario
        fkCache = False
        fkChave = 'VAL_ICMS'
        ForeignKey = False
        LCaption = 'Valor ICMS'
        ReadOnly = False
        Required = False
        ValidateOnExit = False
        WidthCodigo = 20.000000000000000000
      end
      object DBPanel8: TDBPanel
        Left = 360
        Top = 88
        Width = 193
        Height = 37
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 9
        CodigoTabStop = True
        DataField = 'VAL_TOTAL'
        DataSource = DSPrimario
        fkCache = False
        fkChave = 'VAL_TOTAL'
        ForeignKey = False
        LCaption = 'Valor Total'
        ReadOnly = False
        Required = False
        ValidateOnExit = False
        WidthCodigo = 20.000000000000000000
      end
      object DBPanel9: TDBPanel
        Left = 360
        Top = 48
        Width = 193
        Height = 37
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        CodigoTabStop = True
        DataField = 'DESC_COD_BARRA'
        DataSource = DSPrimario
        fkCache = False
        fkChave = 'DESC_COD_BARRA'
        ForeignKey = False
        LCaption = 'C'#243'digo de Barras do Produto'
        ReadOnly = False
        Required = False
        ValidateOnExit = False
        WidthCodigo = 20.000000000000000000
      end
      object DBPanel10: TDBPanel
        Left = 104
        Top = 88
        Width = 49
        Height = 37
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        CodigoTabStop = True
        DataField = 'DESC_ST'
        DataSource = DSPrimario
        fkCache = False
        fkChave = 'DESC_ST'
        ForeignKey = False
        LCaption = 'ST / Al'#237'q'
        ReadOnly = False
        Required = False
        ValidateOnExit = False
        WidthCodigo = 20.000000000000000000
      end
    end
  end
  inherited DSPrimario: TDataSource
    DataSet = DMImpressoraFiscal.QReg60D
  end
end
