inherited FSuinoParam: TFSuinoParam
  Left = 399
  Top = 206
  Caption = 'Par'#226'metros do Sistema de Controle de Su'#237'nos'
  PixelsPerInch = 96
  TextHeight = 14
  inherited PGRelatorio: TPageControl
    ActivePage = TabSheet1
    object TabSheet1: TTabSheet
      Caption = 'Receitas/Despesas'
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 51
        Height = 14
        Caption = 'Data Inicial'
      end
      object Label2: TLabel
        Left = 80
        Top = 8
        Width = 47
        Height = 14
        Caption = 'Data Final'
      end
      inline Fm0Cadastro: TFmCadastro
        Left = 8
        Top = 56
        Width = 303
        Height = 37
        TabOrder = 2
        inherited Label1: TLabel
          Width = 44
          Height = 14
        end
        inherited MeCadastro: TMaskEdit
          Height = 22
        end
        inherited EdCadastro: TEdit
          Width = 227
          Height = 22
        end
      end
      object Me0DataIni: TMaskEdit
        Left = 8
        Top = 24
        Width = 64
        Height = 22
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 0
        Text = '  /  /    '
      end
      object Me0DataFin: TMaskEdit
        Left = 80
        Top = 24
        Width = 65
        Height = 22
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 1
        Text = '  /  /    '
      end
      inline Fm0Filial: TFmFilial
        Left = 8
        Top = 104
        Width = 305
        Height = 37
        TabOrder = 3
        inherited Label1: TLabel
          Height = 14
        end
        inherited MeFilial: TMaskEdit
          Height = 22
        end
        inherited EdFilial: TEdit
          Width = 229
          Height = 22
        end
      end
    end
  end
end
