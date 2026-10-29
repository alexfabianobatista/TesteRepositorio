inherited FPremioExportacaoParam: TFPremioExportacaoParam
  Top = 174
  Height = 337
  Caption = 'Par'#226'metros Pr'#234'mio Exporta'#231#227'o'
  PixelsPerInch = 96
  TextHeight = 14
  inherited PGRelatorio: TPageControl
    Height = 233
    ActivePage = TabSheet1
    object TabSheet1: TTabSheet
      Caption = 'Pr'#234'mio Exporta'#231#227'o'
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 56
        Height = 14
        Caption = 'N'#186' Contrato'
      end
      object Label2: TLabel
        Left = 8
        Top = 48
        Width = 31
        Height = 14
        Caption = 'Fatura'
      end
      object Me1Contrato: TMaskEdit
        Left = 8
        Top = 24
        Width = 66
        Height = 22
        TabOrder = 0
      end
      inline FmCadastro1: TFmCadastro
        Left = 8
        Top = 90
        Width = 329
        Height = 37
        TabOrder = 2
        inherited Label1: TLabel
          Width = 44
          Height = 14
        end
        inherited MeCadastro: TMaskEdit
          Width = 66
          Height = 22
        end
        inherited BtCadastro: TBitBtn
          Left = 71
        end
        inherited EdCadastro: TEdit
          Left = 100
          Height = 22
        end
      end
      object Me1Fatura: TMaskEdit
        Left = 8
        Top = 64
        Width = 66
        Height = 22
        TabOrder = 1
      end
      object GroupBox1: TGroupBox
        Left = 9
        Top = 135
        Width = 193
        Height = 48
        Caption = 'Emiss'#227'o'
        TabOrder = 3
        object Label3: TLabel
          Left = 80
          Top = 20
          Width = 17
          Height = 14
          Caption = 'At'#233
        end
        object Me1Data_I: TMaskEdit
          Left = 8
          Top = 16
          Width = 65
          Height = 22
          EditMask = '!99/99/0000;1;_'
          MaxLength = 10
          TabOrder = 0
          Text = '  /  /    '
        end
        object Me1Data_F: TMaskEdit
          Left = 104
          Top = 16
          Width = 65
          Height = 22
          EditMask = '!99/99/0000;1;_'
          MaxLength = 10
          TabOrder = 1
          Text = '  /  /    '
        end
      end
    end
  end
  inherited BtOk: TBitBtn
    Top = 273
  end
  inherited BtCancela: TBitBtn
    Top = 273
  end
  inherited RGPreview: TRadioGroup
    Top = 241
  end
end
