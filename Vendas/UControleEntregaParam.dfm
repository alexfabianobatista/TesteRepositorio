inherited FControleEntregaParam: TFControleEntregaParam
  Left = 490
  Top = 165
  Width = 480
  Height = 532
  Caption = 'FControleEntregaParam'
  PixelsPerInch = 96
  TextHeight = 14
  inherited PGRelatorio: TPageControl
    Width = 464
    Height = 416
    ActivePage = TabSheet1
    object TabSheet1: TTabSheet
      Caption = 'Entregas por Entregador'
      inline FmFilial1: TFmFilial
        Left = 8
        Top = 4
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
      inline FmCadastro1: TFmCadastro
        Left = 8
        Top = 52
        Width = 265
        Height = 37
        TabOrder = 1
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
      object GBDtEmissao1: TGroupBox
        Left = 8
        Top = 102
        Width = 185
        Height = 81
        Caption = 'Data de Emiss'#227'o'
        TabOrder = 2
        object Label114: TLabel
          Left = 10
          Top = 19
          Width = 26
          Height = 14
          Caption = 'Inicial'
        end
        object Label115: TLabel
          Left = 98
          Top = 19
          Width = 22
          Height = 14
          Caption = 'Final'
        end
        object Me1DtEmissaoFinal: TMaskEdit
          Left = 98
          Top = 35
          Width = 72
          Height = 22
          EditMask = '!99/99/##00;1;_'
          MaxLength = 10
          TabOrder = 1
          Text = '  /  /    '
        end
        object Me1DtEmissaoInicial: TMaskEdit
          Left = 3
          Top = 35
          Width = 72
          Height = 22
          EditMask = '!99/99/##00;1;_'
          MaxLength = 10
          TabOrder = 0
          Text = '  /  /    '
        end
      end
      object GBDtFaturamento1: TGroupBox
        Left = 208
        Top = 101
        Width = 185
        Height = 81
        Caption = 'Data de Entrega'
        TabOrder = 3
        object Label111: TLabel
          Left = 10
          Top = 19
          Width = 26
          Height = 14
          Caption = 'Inicial'
        end
        object Label112: TLabel
          Left = 98
          Top = 19
          Width = 22
          Height = 14
          Caption = 'Final'
        end
        object Me1DtEntregaFinal: TMaskEdit
          Left = 98
          Top = 35
          Width = 72
          Height = 22
          EditMask = '!99/99/##00;1;_'
          MaxLength = 10
          TabOrder = 1
          Text = '  /  /    '
        end
        object Me1DtEntregaInicial: TMaskEdit
          Left = 3
          Top = 35
          Width = 72
          Height = 22
          EditMask = '!99/99/##00;1;_'
          MaxLength = 10
          TabOrder = 0
          Text = '  /  /    '
        end
      end
      object RG1Situacao: TRadioGroup
        Left = 8
        Top = 192
        Width = 428
        Height = 49
        Caption = 'Situacao da Entrega'
        Columns = 5
        ItemIndex = 4
        Items.Strings = (
          'Pendente'
          'Cancelada'
          'Entregue'
          'Recusada'
          'Todas')
        TabOrder = 4
      end
    end
  end
  inherited BtOk: TBitBtn
    Left = 284
    Top = 463
  end
  inherited BtCancela: TBitBtn
    Left = 380
    Top = 463
  end
  inherited RGPreview: TRadioGroup
    Top = 431
  end
end
