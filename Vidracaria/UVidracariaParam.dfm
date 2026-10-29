inherited FVidracariaParam: TFVidracariaParam
  Left = 339
  Top = 132
  Width = 429
  Height = 438
  Caption = 'Par'#226'metros de Vidra'#231'aria'
  PixelsPerInch = 96
  TextHeight = 14
  inherited PGRelatorio: TPageControl
    Width = 421
    Height = 322
    ActivePage = TabSheet3
    object TabSheet1: TTabSheet
      Caption = 'Relat'#243'rio de Produ'#231#227'o'
      OnShow = TabSheet1Show
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 26
        Height = 14
        Caption = 'Setor'
      end
      object Label3: TLabel
        Left = 8
        Top = 48
        Width = 77
        Height = 14
        Caption = 'Hora/Data Inicial'
      end
      object Label2: TLabel
        Left = 128
        Top = 48
        Width = 73
        Height = 14
        Caption = 'Hora/Data Final'
      end
      object CbSetor1: TComboBox
        Left = 8
        Top = 24
        Width = 105
        Height = 22
        Style = csDropDownList
        ItemHeight = 14
        TabOrder = 0
        Items.Strings = (
          'CORTE'
          'USINAGEM'
          'MARCACAO'
          'FORNO'
          'EMBARQUE'
          'LAMINADO'
          'CONFERENCIA'
          'GERAL')
      end
      object MeDataIni1: TMaskEdit
        Left = 48
        Top = 64
        Width = 65
        Height = 22
        EditMask = '!99/99/##00;1;_'
        MaxLength = 10
        TabOrder = 2
        Text = '  /  /    '
      end
      object MeHoraIni1: TMaskEdit
        Left = 8
        Top = 64
        Width = 41
        Height = 22
        EditMask = '!99:99;1;_'
        MaxLength = 5
        TabOrder = 1
        Text = '  :  '
      end
      object MeDataFin1: TMaskEdit
        Left = 168
        Top = 64
        Width = 64
        Height = 22
        EditMask = '!99/99/##00;1;_'
        MaxLength = 10
        TabOrder = 4
        Text = '  /  /    '
      end
      object MeHoraFin1: TMaskEdit
        Left = 128
        Top = 64
        Width = 41
        Height = 22
        EditMask = '!99:99;1;_'
        MaxLength = 5
        TabOrder = 3
        Text = '  :  '
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Rel.Quebras por Setor'
      ImageIndex = 1
      object Label4: TLabel
        Left = 24
        Top = 40
        Width = 26
        Height = 14
        Caption = 'Setor'
      end
      object GB2Periodo: TGroupBox
        Left = 25
        Top = 83
        Width = 173
        Height = 61
        Caption = 'Periodo'
        TabOrder = 0
        object Label53: TLabel
          Left = 9
          Top = 17
          Width = 13
          Height = 14
          Caption = 'De'
        end
        object Label56: TLabel
          Left = 86
          Top = 17
          Width = 17
          Height = 14
          Caption = 'At'#233
        end
        object Me2DtInicial: TMaskEdit
          Left = 9
          Top = 34
          Width = 70
          Height = 22
          EditMask = '!99/99/00##;1;_'
          MaxLength = 10
          TabOrder = 0
          Text = '  /  /    '
        end
        object Me2DtFinal: TMaskEdit
          Left = 86
          Top = 34
          Width = 70
          Height = 22
          EditMask = '!99/99/00##;1;_'
          MaxLength = 10
          TabOrder = 1
          Text = '  /  /    '
        end
      end
      object CBSetor2: TComboBox
        Left = 24
        Top = 56
        Width = 105
        Height = 22
        Style = csDropDownList
        ItemHeight = 14
        TabOrder = 1
        Items.Strings = (
          'CORTE'
          'USINAGEM'
          'MARCACAO'
          'FORNO'
          'EMBARQUE'
          'LAMINADO'
          'CONFERENCIA'
          'GERAL'
          '   '
          '   ')
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Rel.Rastreamento'
      ImageIndex = 2
      inline Fm2Lote: TFmLote
        Left = 16
        Top = 57
        Width = 304
        Height = 48
        TabOrder = 1
        inherited Label1: TLabel
          Height = 14
        end
        inherited MeLote: TMaskEdit
          Height = 22
        end
        inherited EdLote: TEdit
          Width = 228
          Height = 22
        end
      end
      inline Fm2Produto: TFmProduto
        Left = 16
        Top = 13
        Width = 304
        Height = 37
        TabOrder = 0
        inherited Label1: TLabel
          Height = 14
        end
        inherited MeProduto: TMaskEdit
          Height = 22
        end
        inherited EdProduto: TEdit
          Width = 228
          Height = 22
        end
      end
    end
  end
  inherited BtOk: TBitBtn
    Left = 233
    Top = 369
  end
  inherited BtCancela: TBitBtn
    Left = 329
    Top = 369
  end
  inherited RGPreview: TRadioGroup
    Top = 337
  end
end
