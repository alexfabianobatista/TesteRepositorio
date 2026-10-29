inherited FContratoJornalParam: TFContratoJornalParam
  Left = 373
  Top = 194
  Height = 427
  Caption = 'Par'#226'metros para relat'#243'rios'
  PixelsPerInch = 96
  TextHeight = 14
  inherited PGRelatorio: TPageControl
    Height = 311
    ActivePage = TSContratoJornalRel
    object TSContratoJornalRel: TTabSheet
      Caption = 'Relat'#243'rio de Contratos'
      OnShow = TSContratoJornalRelShow
      object Label1: TLabel
        Left = 8
        Top = 120
        Width = 99
        Height = 14
        Caption = 'Apenas edi'#231#227'o num.'
      end
      object Label2: TLabel
        Left = 152
        Top = 120
        Width = 107
        Height = 14
        Caption = 'Contendo edi'#231#227'o num.'
      end
      object Label3: TLabel
        Left = 329
        Top = 119
        Width = 20
        Height = 14
        Caption = 'Tipo'
      end
      inline FM0Filial: TFmFilial
        Left = 8
        Top = 0
        Width = 377
        Height = 37
        TabOrder = 0
        inherited Label1: TLabel
          Left = 1
          Height = 14
        end
        inherited MeFilial: TMaskEdit
          Height = 22
        end
        inherited EdFilial: TEdit
          Width = 301
          Height = 22
        end
      end
      inline FM0Cadastro: TFmCadastro
        Left = 8
        Top = 40
        Width = 377
        Height = 37
        TabOrder = 1
        inherited Label1: TLabel
          Left = 1
          Width = 32
          Height = 14
          Caption = 'Cliente'
        end
        inherited MeCadastro: TMaskEdit
          Height = 22
        end
        inherited EdCadastro: TEdit
          Width = 301
          Height = 22
        end
      end
      inline FM0Vendedor: TFmVendedor
        Left = 8
        Top = 80
        Width = 379
        Height = 37
        TabOrder = 2
        inherited Label1: TLabel
          Left = 1
          Width = 47
          Height = 14
        end
        inherited MeVendedor: TMaskEdit
          Height = 22
        end
        inherited EdVendedor: TEdit
          Width = 301
          Height = 22
        end
      end
      inline FM0DtContrato: TFmDatas
        Left = 8
        Top = 208
        Width = 178
        Height = 60
        TabOrder = 8
        inherited GroupBox1: TGroupBox
          Caption = 'Data do contrato'
          inherited Label1: TLabel
            Width = 26
            Height = 14
          end
          inherited Label2: TLabel
            Height = 14
          end
          inherited MeDtInicial: TMaskEdit
            Height = 22
          end
          inherited MeDtFinal: TMaskEdit
            Height = 22
          end
        end
      end
      inline FM0DtVencimento: TFmDatas
        Left = 208
        Top = 208
        Width = 178
        Height = 60
        TabOrder = 9
        inherited GroupBox1: TGroupBox
          Caption = 'Per'#237'odo  de vencimento'
          inherited Label1: TLabel
            Width = 26
            Height = 14
          end
          inherited Label2: TLabel
            Height = 14
          end
          inherited MeDtInicial: TMaskEdit
            Height = 22
          end
          inherited MeDtFinal: TMaskEdit
            Height = 22
          end
        end
      end
      object RG0Situacao: TRadioGroup
        Left = 8
        Top = 160
        Width = 177
        Height = 49
        Caption = 'Situa'#231#227'o do contrato'
        Columns = 2
        ItemIndex = 2
        Items.Strings = (
          'Todos'
          'Aberto'
          'Fechado'
          'Cancelado')
        TabOrder = 6
      end
      object ME0Edicao: TMaskEdit
        Left = 8
        Top = 136
        Width = 97
        Height = 22
        TabOrder = 3
      end
      object RG0SituacaoCR: TRadioGroup
        Left = 208
        Top = 160
        Width = 177
        Height = 49
        Caption = 'Situa'#231#227'o Contas '#224' Receber'
        Columns = 2
        ItemIndex = 2
        Items.Strings = (
          'Abertas'
          'Baixadas'
          'Todas')
        TabOrder = 7
      end
      object ME0ComEdicao: TMaskEdit
        Left = 152
        Top = 136
        Width = 105
        Height = 22
        TabOrder = 4
      end
      object CB0Tipo: TComboBox
        Left = 328
        Top = 136
        Width = 57
        Height = 22
        ItemHeight = 14
        TabOrder = 5
      end
    end
  end
  inherited BtOk: TBitBtn
    Top = 358
  end
  inherited BtCancela: TBitBtn
    Top = 358
  end
  inherited RGPreview: TRadioGroup
    Top = 326
  end
end
