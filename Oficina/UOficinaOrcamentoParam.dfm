inherited FOficinaOrcamentoParam: TFOficinaOrcamentoParam
  Left = 314
  Top = 110
  Width = 413
  Height = 427
  Caption = 'Par'#226'metros para Relat'#243'rios'
  PixelsPerInch = 96
  TextHeight = 14
  inherited PGRelatorio: TPageControl
    Width = 405
    Height = 311
    ActivePage = TabSheet1
    object TabSheet1: TTabSheet
      Caption = 'Relat'#243'rio de Or'#231'amentos'
      inline Fm0Filial: TFmFilial
        Left = 40
        Top = 8
        Width = 313
        Height = 41
        TabOrder = 0
        inherited Label1: TLabel
          Height = 14
        end
        inherited MeFilial: TMaskEdit
          Height = 22
        end
        inherited EdFilial: TEdit
          Width = 237
          Height = 22
        end
      end
      inline Fm0Cadastro: TFmCadastro
        Left = 40
        Top = 56
        Width = 313
        Height = 41
        TabOrder = 1
        inherited Label1: TLabel
          Width = 32
          Height = 14
          Caption = 'Cliente'
        end
        inherited MeCadastro: TMaskEdit
          Height = 22
        end
        inherited EdCadastro: TEdit
          Width = 237
          Height = 22
        end
      end
      inline Fm0Veiculo: TFmVeiculo
        Left = 40
        Top = 104
        Width = 313
        Height = 37
        TabOrder = 2
        inherited Label1: TLabel
          Width = 36
          Height = 14
        end
        inherited MeVeiculo: TMaskEdit
          Height = 22
          OnExit = Fm0VeiculoMeVeiculoExit
        end
        inherited BtVeiculo: TBitBtn
          OnClick = Fm0VeiculoBtVeiculoClick
        end
        inherited EdVeiculo: TEdit
          Width = 237
          Height = 22
          Text = 'Todos'
        end
      end
      inline Fm0Marca: TFmMarca
        Left = 40
        Top = 152
        Width = 313
        Height = 41
        TabOrder = 3
        inherited Label1: TLabel
          Height = 14
        end
        inherited MeMarca: TMaskEdit
          Height = 22
        end
        inherited EdMarca: TEdit
          Width = 237
          Height = 22
        end
      end
      object RGAnaliticoSintetico: TRadioGroup
        Left = 40
        Top = 208
        Width = 121
        Height = 57
        Caption = 'Tipo do Relat'#243'rio'
        ItemIndex = 0
        Items.Strings = (
          'Anal'#237'tico'
          'Sint'#233'tico')
        TabOrder = 4
      end
      inline Fm0Datas: TFmDatas
        Left = 176
        Top = 208
        Width = 201
        Height = 57
        TabOrder = 5
        inherited GroupBox1: TGroupBox
          Left = 0
          Top = 0
          Width = 177
          Caption = 'Data do Or'#231'amento'
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
    end
  end
  inherited BtOk: TBitBtn
    Left = 217
    Top = 358
  end
  inherited BtCancela: TBitBtn
    Left = 313
    Top = 358
  end
  inherited RGPreview: TRadioGroup
    Top = 326
  end
end
