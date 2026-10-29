inherited FClienteSCPCParam: TFClienteSCPCParam
  Left = 360
  Top = 160
  Caption = 'Cliente SCPC Param'
  PixelsPerInch = 96
  TextHeight = 14
  inherited PGRelatorio: TPageControl
    ActivePage = TabSheet1
    object TabSheet1: TTabSheet
      Caption = 'Cliente SCPC'
      inline FmCadastro1: TFmCadastro
        Left = 1
        Top = 5
        Width = 265
        Height = 37
        TabOrder = 0
        inherited Label1: TLabel
          Width = 44
          Height = 14
        end
        inherited MeCadastro: TMaskEdit
          Height = 22
        end
        inherited EdCadastro: TEdit
          Height = 22
        end
      end
      object GroupBox1: TGroupBox
        Left = 1
        Top = 53
        Width = 187
        Height = 47
        Caption = 'Data Registro'
        TabOrder = 1
        object Label3: TLabel
          Left = 80
          Top = 20
          Width = 17
          Height = 14
          Caption = 'At'#233
        end
        object Me1Data_I: TMaskEdit
          Left = 3
          Top = 15
          Width = 72
          Height = 22
          EditMask = '!99/99/0000;1;_'
          MaxLength = 10
          TabOrder = 0
          Text = '  /  /    '
        end
        object Me1Data_F: TMaskEdit
          Left = 103
          Top = 15
          Width = 80
          Height = 22
          EditMask = '!99/99/0000;1;_'
          MaxLength = 10
          TabOrder = 1
          Text = '  /  /    '
        end
      end
    end
  end
end
