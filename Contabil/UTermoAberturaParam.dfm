inherited FTermoAberturaParam: TFTermoAberturaParam
  Left = 289
  Top = 98
  Height = 475
  Caption = 'Par'#226'metros'
  PixelsPerInch = 96
  TextHeight = 14
  inherited PGRelatorio: TPageControl
    Height = 359
    ActivePage = TabSheet1
    object TabSheet1: TTabSheet
      Caption = 'Termo Abertura/Fechamento'
      object Label1: TLabel
        Left = 8
        Top = 56
        Width = 92
        Height = 14
        Caption = #211'rg'#227'o de Inscri'#231#227'o'
      end
      object Label2: TLabel
        Left = 176
        Top = 56
        Width = 121
        Height = 14
        Caption = 'N'#176' da Inscri'#231#227'o do '#211'rg'#227'o'
      end
      object Label3: TLabel
        Left = 112
        Top = 104
        Width = 57
        Height = 14
        Caption = 'P'#225'gina Final'
      end
      object Label4: TLabel
        Left = 8
        Top = 104
        Width = 61
        Height = 14
        Caption = 'P'#225'gina Inicial'
      end
      object Label5: TLabel
        Left = 208
        Top = 104
        Width = 67
        Height = 14
        Caption = 'Data Abertura'
      end
      object Label6: TLabel
        Left = 296
        Top = 104
        Width = 84
        Height = 14
        Caption = 'Data Fechamento'
      end
      object Label7: TLabel
        Left = 312
        Top = 56
        Width = 55
        Height = 14
        Caption = 'Data '#211'rg'#227'o'
      end
      object Label8: TLabel
        Left = 9
        Top = 200
        Width = 72
        Height = 14
        Caption = 'N'#250'mero Ordem'
      end
      inline Fm1Filial: TFmFilial
        Left = 8
        Top = 8
        Width = 377
        Height = 37
        TabOrder = 0
        inherited Label1: TLabel
          Height = 14
        end
        inherited MeFilial: TMaskEdit
          Width = 41
          Height = 22
        end
        inherited EdFilial: TEdit
          Width = 301
          Height = 22
        end
      end
      object ME1Orgao: TMaskEdit
        Left = 8
        Top = 72
        Width = 153
        Height = 22
        TabOrder = 1
      end
      object ME1NumInscricao: TMaskEdit
        Left = 176
        Top = 72
        Width = 121
        Height = 22
        TabOrder = 2
      end
      object ME1PagFinal: TMaskEdit
        Left = 112
        Top = 120
        Width = 65
        Height = 22
        TabOrder = 5
        OnKeyPress = ME1PagInicialKeyPress
      end
      object ME1PagInicial: TMaskEdit
        Left = 8
        Top = 120
        Width = 65
        Height = 22
        TabOrder = 4
        OnKeyPress = ME1PagInicialKeyPress
      end
      object ME1DataAbertura: TMaskEdit
        Left = 208
        Top = 120
        Width = 71
        Height = 22
        EditMask = '!99/99/00##;1;_'
        MaxLength = 10
        TabOrder = 6
        Text = '  /  /    '
      end
      object ME1DataFechamento: TMaskEdit
        Left = 296
        Top = 120
        Width = 87
        Height = 22
        EditMask = '!99/99/00##;1;_'
        MaxLength = 10
        TabOrder = 7
        Text = '  /  /    '
      end
      object RG1Termo: TRadioGroup
        Left = 8
        Top = 152
        Width = 377
        Height = 41
        Caption = 'Emitir Termo'
        Columns = 3
        ItemIndex = 2
        Items.Strings = (
          'Abertura'
          'Fechamento'
          'Ambos')
        TabOrder = 8
      end
      object RG1DiarioRazao: TRadioGroup
        Left = 8
        Top = 244
        Width = 377
        Height = 41
        Caption = 'Emitir Termo'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Diario'
          'Razao')
        TabOrder = 9
      end
      object MEDtOrgao: TMaskEdit
        Left = 312
        Top = 72
        Width = 71
        Height = 22
        EditMask = '!99/99/00##;1;_'
        MaxLength = 10
        TabOrder = 3
        Text = '  /  /    '
      end
      object Me1NumeroOrdem: TMaskEdit
        Left = 8
        Top = 216
        Width = 81
        Height = 22
        TabOrder = 10
      end
    end
  end
  inherited BtOk: TBitBtn
    Top = 406
  end
  inherited BtCancela: TBitBtn
    Top = 406
  end
  inherited RGPreview: TRadioGroup
    Top = 374
  end
end
