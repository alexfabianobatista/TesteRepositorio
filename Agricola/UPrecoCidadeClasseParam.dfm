inherited FPrecoCidadeClasseParam: TFPrecoCidadeClasseParam
  Left = 345
  Top = 183
  Caption = 'Par'#226'metros para Relat'#243'rio'
  PixelsPerInch = 96
  TextHeight = 14
  inherited PGRelatorio: TPageControl
    ActivePage = TabSheet1
    object TabSheet1: TTabSheet
      Caption = 'Pre'#231'o P/ Cidade'
      inline FmCidade1: TFmCidade
        Left = 7
        Top = 13
        Width = 265
        Height = 37
        TabOrder = 0
        inherited Label1: TLabel
          Height = 14
        end
        inherited MeCidade: TMaskEdit
          Height = 22
        end
        inherited EdCidade: TEdit
          Height = 22
        end
      end
      inline FmClasse1: TFmClasse
        Left = 7
        Top = 56
        Width = 265
        Height = 37
        TabOrder = 1
        inherited Label1: TLabel
          Width = 33
          Height = 14
        end
        inherited MeClasse: TMaskEdit
          Height = 22
        end
        inherited EdClasse: TEdit
          Height = 22
        end
      end
      object GroupBox14: TGroupBox
        Left = 7
        Top = 101
        Width = 170
        Height = 66
        Caption = 'Data Refer'#234'ncia'
        TabOrder = 2
        object Label118: TLabel
          Left = 9
          Top = 17
          Width = 13
          Height = 14
          Caption = 'De'
        end
        object Label119: TLabel
          Left = 95
          Top = 17
          Width = 17
          Height = 14
          Caption = 'At'#233
        end
        object Me1DtInicial: TMaskEdit
          Left = 9
          Top = 34
          Width = 65
          Height = 22
          EditMask = '!99/99/00##;1;_'
          MaxLength = 10
          TabOrder = 0
          Text = '  /  /    '
        end
        object Me1DtFinal: TMaskEdit
          Left = 95
          Top = 34
          Width = 65
          Height = 22
          EditMask = '!99/99/00##;1;_'
          MaxLength = 10
          TabOrder = 1
          Text = '  /  /    '
        end
      end
    end
  end
end
