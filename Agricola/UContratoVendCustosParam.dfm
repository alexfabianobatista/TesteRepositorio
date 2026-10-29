inherited FContratoVendCustosParam: TFContratoVendCustosParam
  Left = 300
  Caption = 'Par'#226'metros de Relat'#243'rio'
  PixelsPerInch = 96
  TextHeight = 14
  inherited PGRelatorio: TPageControl
    ActivePage = TabSheet1
    object TabSheet1: TTabSheet
      Caption = 'Custos de Controle de Venda'
      object Label2: TLabel
        Left = 7
        Top = 84
        Width = 51
        Height = 14
        Caption = 'Data Inicial'
      end
      object Label3: TLabel
        Left = 7
        Top = 123
        Width = 47
        Height = 14
        Caption = 'Data Final'
      end
      inline FmFilial1: TFmFilial
        Left = 7
        Top = 5
        Width = 265
        Height = 37
        TabOrder = 0
        inherited Label1: TLabel
          Height = 14
        end
        inherited MeFilial: TMaskEdit
          Height = 22
        end
        inherited EdFilial: TEdit
          Height = 22
        end
      end
      inline FmProduto1: TFmProduto
        Left = 7
        Top = 43
        Width = 265
        Height = 37
        TabOrder = 1
        inherited Label1: TLabel
          Height = 14
        end
        inherited MeProduto: TMaskEdit
          Height = 22
        end
        inherited EdProduto: TEdit
          Height = 22
        end
      end
      object Me1Data_I: TMaskEdit
        Left = 7
        Top = 100
        Width = 80
        Height = 22
        EditMask = '!99/99/##00;1;_'
        MaxLength = 10
        TabOrder = 2
        Text = '  /  /    '
      end
      object Me1Data_F: TMaskEdit
        Left = 7
        Top = 139
        Width = 81
        Height = 22
        EditMask = '!99/99/##00;1;_'
        MaxLength = 10
        TabOrder = 3
        Text = '  /  /    '
      end
      object Rg1Opcao: TRadioGroup
        Left = 104
        Top = 88
        Width = 169
        Height = 73
        Caption = 'Lan'#231'ado Contrato Venda'
        Columns = 3
        ItemIndex = 2
        Items.Strings = (
          'Sim'
          'N'#227'o'
          'Todos')
        TabOrder = 4
      end
    end
  end
end
