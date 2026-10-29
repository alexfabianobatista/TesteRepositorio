inherited FGeraR2055: TFGeraR2055
  Left = 580
  Top = 182
  Width = 419
  Height = 402
  Caption = 'SPED Reinf'
  PixelsPerInch = 96
  TextHeight = 14
  inherited PGRelatorio: TPageControl
    Width = 411
    Height = 286
    ActivePage = R2055
    object R2055: TTabSheet
      Caption = 'R2055 Aquisi'#231#227'o'
      object Label10: TLabel
        Left = 16
        Top = 16
        Width = 51
        Height = 14
        Caption = 'Data Inicial'
      end
      object Label11: TLabel
        Left = 96
        Top = 16
        Width = 47
        Height = 14
        Caption = 'Data Final'
      end
      object Label1: TLabel
        Left = 16
        Top = 168
        Width = 53
        Height = 14
        Caption = 'ATEN'#199#195'O!!'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 16
        Top = 184
        Width = 343
        Height = 56
        Caption = 
          'Este processo ir'#225' gerar os XML'#39's para emiss'#227'o do Sped Reinf.  Ca' +
          'so o processo seja interrompido, deve-se verificar as emiss'#245'es e' +
          ' envios para inserir as informa'#231#245'es de forma manual ou alterar o' +
          's registros gerados.'
        WordWrap = True
      end
      object MeDataIniReinf: TMaskEdit
        Left = 16
        Top = 32
        Width = 65
        Height = 22
        EditMask = '!99/99/0000;1;_'
        MaxLength = 10
        TabOrder = 0
        Text = '01/01/2011'
      end
      object MeDataFinReinf: TMaskEdit
        Left = 96
        Top = 32
        Width = 68
        Height = 22
        EditMask = '!99/99/0000;1;_'
        MaxLength = 10
        TabOrder = 1
        Text = '31/01/2011'
      end
      inline FmFilialReinf: TFmFilial
        Left = 16
        Top = 64
        Width = 261
        Height = 40
        TabOrder = 2
        inherited Label1: TLabel
          Height = 14
        end
        inherited MeFilial: TMaskEdit
          Width = 42
          Height = 22
          EditMask = '!999999;0;_'
          Text = ''
        end
        inherited EdFilial: TEdit
          Width = 185
          Height = 22
          Text = ''
        end
      end
    end
    object ConciliacaoR2055: TTabSheet
      Caption = 'Concilia'#231#227'o R-2055'
      ImageIndex = 1
      object Label3: TLabel
        Left = 96
        Top = 16
        Width = 47
        Height = 14
        Caption = 'Data Final'
      end
      object Label4: TLabel
        Left = 16
        Top = 16
        Width = 51
        Height = 14
        Caption = 'Data Inicial'
      end
      inline FmFilial1: TFmFilial
        Left = 16
        Top = 64
        Width = 257
        Height = 40
        TabOrder = 2
        inherited Label1: TLabel
          Height = 14
        end
        inherited MeFilial: TMaskEdit
          Width = 42
          Height = 22
          EditMask = '!999999;0;_'
          Text = ''
        end
        inherited EdFilial: TEdit
          Width = 181
          Height = 22
          Text = ''
        end
      end
      object MEDataIni1: TMaskEdit
        Left = 16
        Top = 32
        Width = 63
        Height = 22
        EditMask = '!99/99/0000;1;_'
        MaxLength = 10
        TabOrder = 0
        Text = '01/01/2011'
      end
      object MEDataFim1: TMaskEdit
        Left = 96
        Top = 32
        Width = 68
        Height = 22
        EditMask = '!99/99/0000;1;_'
        MaxLength = 10
        TabOrder = 1
        Text = '31/01/2011'
      end
    end
  end
  inherited BtOk: TBitBtn
    Left = 223
    Top = 333
  end
  inherited BtCancela: TBitBtn
    Left = 319
    Top = 333
  end
  inherited RGPreview: TRadioGroup
    Top = 301
  end
end
