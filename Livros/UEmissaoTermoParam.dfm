inherited FEmissaoTermoParam: TFEmissaoTermoParam
  Left = 418
  Top = 108
  Width = 410
  Height = 465
  Caption = 'Par'#226'metros'
  PixelsPerInch = 96
  TextHeight = 14
  inherited PGRelatorio: TPageControl
    Width = 394
    Height = 349
    ActivePage = TabSheet1
    object TabSheet1: TTabSheet
      Caption = 'Emiss'#227'o de Termo de Abertura/Fechamento'
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
        Left = 8
        Top = 200
        Width = 72
        Height = 14
        Caption = 'N'#250'mero Ordem'
      end
      object Label9: TLabel
        Left = 8
        Top = 248
        Width = 98
        Height = 14
        Caption = 'Data InicIal do Termo'
      end
      object Label10: TLabel
        Left = 123
        Top = 248
        Width = 94
        Height = 14
        Caption = 'Data Final do Termo'
      end
      inline Fm1Filial: TFmFilial
        Left = 8
        Top = 8
        Width = 374
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
          Width = 298
          Height = 22
        end
      end
      object ME1Orgao: TMaskEdit
        Left = 8
        Top = 72
        Width = 150
        Height = 22
        TabOrder = 1
      end
      object ME1NumInscricao: TMaskEdit
        Left = 176
        Top = 72
        Width = 118
        Height = 22
        TabOrder = 2
      end
      object ME1PagFinal: TMaskEdit
        Left = 112
        Top = 120
        Width = 62
        Height = 22
        TabOrder = 5
      end
      object ME1PagInicial: TMaskEdit
        Left = 8
        Top = 120
        Width = 62
        Height = 22
        TabOrder = 4
      end
      object ME1DataAbertura: TMaskEdit
        Left = 208
        Top = 120
        Width = 69
        Height = 22
        EditMask = '!99/99/00##;1;_'
        MaxLength = 10
        TabOrder = 6
        Text = '  /  /    '
      end
      object ME1DataFechamento: TMaskEdit
        Left = 296
        Top = 120
        Width = 86
        Height = 22
        EditMask = '!99/99/00##;1;_'
        MaxLength = 10
        TabOrder = 7
        Text = '  /  /    '
      end
      object RG1Termo: TRadioGroup
        Left = 8
        Top = 152
        Width = 376
        Height = 41
        Caption = 'Emitir Termo'
        Columns = 3
        ItemIndex = 2
        Items.Strings = (
          'Abertura'
          'Encerramento'
          'Ambos')
        TabOrder = 8
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
      object Me1Numero: TMaskEdit
        Left = 10
        Top = 216
        Width = 62
        Height = 22
        TabOrder = 9
      end
      object MEDtInicioTermo: TMaskEdit
        Left = 11
        Top = 264
        Width = 69
        Height = 22
        EditMask = '!99/99/00##;1;_'
        MaxLength = 10
        TabOrder = 10
        Text = '  /  /    '
      end
      object MEDtFinalTermo: TMaskEdit
        Left = 126
        Top = 264
        Width = 69
        Height = 22
        EditMask = '!99/99/00##;1;_'
        MaxLength = 10
        TabOrder = 11
        Text = '  /  /    '
      end
    end
  end
  inherited BtOk: TBitBtn
    Left = 214
    Top = 396
  end
  inherited BtCancela: TBitBtn
    Left = 310
    Top = 396
  end
  inherited RGPreview: TRadioGroup
    Top = 364
  end
end
