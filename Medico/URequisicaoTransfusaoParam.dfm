inherited FRequisicaoTransfusaoParam: TFRequisicaoTransfusaoParam
  Left = 326
  Top = 177
  Width = 532
  Height = 345
  Caption = 'Par'#226'metros'
  PixelsPerInch = 96
  TextHeight = 14
  inherited PGRelatorio: TPageControl
    Width = 524
    Height = 241
    ActivePage = TabSheet1
    object TabSheet1: TTabSheet
      Caption = 'Req. Transfus'#227'o'
      inline FmCadastro1: TFmCadastro
        Left = 32
        Top = 24
        Width = 329
        Height = 41
        TabOrder = 0
        inherited Label1: TLabel
          Width = 41
          Height = 14
          Caption = 'Paciente'
        end
        inherited MeCadastro: TMaskEdit
          Height = 22
        end
        inherited EdCadastro: TEdit
          Width = 253
          Height = 22
        end
      end
      object RG0Tipo: TRadioGroup
        Left = 192
        Top = 74
        Width = 105
        Height = 86
        Caption = 'Tipo Requisi'#231#227'o'
        Items.Strings = (
          'TODOS'
          'EMERG'#202'NCIA'
          'URG'#202'NCIA'
          'ROTINA')
        TabOrder = 1
      end
      object GB0DataColeta: TGroupBox
        Left = 31
        Top = 74
        Width = 161
        Height = 86
        Caption = 'Data Coleta'
        TabOrder = 2
        object Label1: TLabel
          Left = 13
          Top = 24
          Width = 24
          Height = 14
          Caption = 'Inicio'
        end
        object Label2: TLabel
          Left = 85
          Top = 24
          Width = 16
          Height = 14
          Caption = 'Fim'
        end
        object ME0DtInicial: TMaskEdit
          Left = 13
          Top = 40
          Width = 63
          Height = 22
          EditMask = '!99/99/0000;1;_'
          MaxLength = 10
          TabOrder = 0
          Text = '  /  /    '
        end
        object ME0DtFinal: TMaskEdit
          Left = 85
          Top = 40
          Width = 63
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
    Top = 280
  end
  inherited BtCancela: TBitBtn
    Top = 280
  end
  inherited RGPreview: TRadioGroup
    Top = 248
  end
end
