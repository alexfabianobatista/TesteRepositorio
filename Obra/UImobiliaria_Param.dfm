inherited FImobiliaria_Param: TFImobiliaria_Param
  Left = 402
  Top = 136
  Width = 428
  Height = 400
  Caption = 'Parametros Relat'#243'rios'
  PixelsPerInch = 96
  TextHeight = 14
  inherited PGRelatorio: TPageControl
    Width = 412
    Height = 284
    ActivePage = TabSheet5
    object TabSheet1: TTabSheet
      Caption = 'Contratos Locatario'
      inline Fm1Condominio: TFmCondominio
        Left = 16
        Top = 16
        Width = 337
        Height = 36
        TabOrder = 0
        inherited Label1: TLabel
          Height = 14
        end
        inherited MeCondominio: TMaskEdit
          Height = 22
        end
        inherited EdCondominio: TEdit
          Width = 257
          Height = 22
        end
      end
      inline Fm1Cadastro: TFmCadastro
        Left = 16
        Top = 64
        Width = 337
        Height = 37
        TabOrder = 1
        inherited Label1: TLabel
          Width = 55
          Height = 14
          Caption = 'Propriet'#225'rio'
        end
        inherited MeCadastro: TMaskEdit
          Height = 22
        end
        inherited EdCadastro: TEdit
          Width = 261
          Height = 22
        end
      end
      inline Fm1Filial: TFmFilial
        Left = 16
        Top = 112
        Width = 337
        Height = 37
        TabOrder = 2
        inherited Label1: TLabel
          Height = 14
        end
        inherited MeFilial: TMaskEdit
          Height = 22
        end
        inherited EdFilial: TEdit
          Width = 261
          Height = 22
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Relat'#243'rio Financeiro'
      ImageIndex = 1
      inline Fm2Condominio: TFmCondominio
        Left = 16
        Top = 16
        Width = 337
        Height = 36
        TabOrder = 0
        inherited Label1: TLabel
          Height = 14
        end
        inherited MeCondominio: TMaskEdit
          Height = 22
        end
        inherited EdCondominio: TEdit
          Width = 257
          Height = 22
        end
      end
      inline Fm2Cadastro: TFmCadastro
        Left = 16
        Top = 64
        Width = 337
        Height = 37
        TabOrder = 1
        inherited Label1: TLabel
          Width = 55
          Height = 14
          Caption = 'Propriet'#225'rio'
        end
        inherited MeCadastro: TMaskEdit
          Height = 22
        end
        inherited EdCadastro: TEdit
          Width = 261
          Height = 22
        end
      end
      inline Fm2Datas: TFmDatas
        Left = 16
        Top = 165
        Width = 178
        Height = 60
        TabOrder = 3
        inherited GroupBox1: TGroupBox
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
      inline Fm2Imovel: TFmImovel
        Left = 16
        Top = 112
        Width = 337
        Height = 40
        TabOrder = 2
        inherited Label1: TLabel
          Width = 30
          Height = 14
        end
        inherited MeImovel: TMaskEdit
          Height = 22
        end
        inherited EdImovel: TEdit
          Width = 258
          Height = 22
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Extrato'
      ImageIndex = 2
      inline Fm3Cadastro: TFmCadastro
        Left = 16
        Top = 71
        Width = 337
        Height = 37
        TabOrder = 1
        inherited Label1: TLabel
          Width = 55
          Height = 14
          Caption = 'Propriet'#225'rio'
        end
        inherited MeCadastro: TMaskEdit
          Height = 22
        end
        inherited EdCadastro: TEdit
          Width = 261
          Height = 22
        end
      end
      inline Fm3Datas: TFmDatas
        Left = 16
        Top = 172
        Width = 178
        Height = 60
        TabOrder = 3
        inherited GroupBox1: TGroupBox
          Caption = 'Dt.Refer'#234'ncia Despesas'
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
      inline Fm3Imovel: TFmImovel
        Left = 16
        Top = 119
        Width = 337
        Height = 40
        TabOrder = 2
        inherited Label1: TLabel
          Width = 30
          Height = 14
        end
        inherited MeImovel: TMaskEdit
          Height = 22
        end
        inherited EdImovel: TEdit
          Width = 258
          Height = 22
        end
      end
      inline Fm3Filial: TFmFilial
        Left = 16
        Top = 27
        Width = 337
        Height = 37
        TabOrder = 0
        inherited Label1: TLabel
          Height = 14
        end
        inherited MeFilial: TMaskEdit
          Height = 22
        end
        inherited EdFilial: TEdit
          Width = 261
          Height = 22
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Comiss'#227'o'
      ImageIndex = 3
      inline Fm4Filial: TFmFilial
        Left = 16
        Top = 27
        Width = 337
        Height = 37
        TabOrder = 0
        inherited Label1: TLabel
          Height = 14
        end
        inherited MeFilial: TMaskEdit
          Height = 22
        end
        inherited EdFilial: TEdit
          Width = 261
          Height = 22
        end
      end
      inline Fm4Cadastro: TFmCadastro
        Left = 16
        Top = 71
        Width = 337
        Height = 37
        TabOrder = 1
        inherited Label1: TLabel
          Width = 55
          Height = 14
          Caption = 'Propriet'#225'rio'
        end
        inherited MeCadastro: TMaskEdit
          Height = 22
        end
        inherited EdCadastro: TEdit
          Width = 261
          Height = 22
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Fechamento Mensal'
      ImageIndex = 4
      inline Fm5Condominio: TFmCondominio
        Left = 11
        Top = 41
        Width = 337
        Height = 36
        TabOrder = 0
        inherited Label1: TLabel
          Height = 14
        end
        inherited MeCondominio: TMaskEdit
          Height = 22
        end
        inherited EdCondominio: TEdit
          Width = 257
          Height = 22
        end
      end
      inline Fm5Cadastro: TFmCadastro
        Left = 11
        Top = 89
        Width = 337
        Height = 37
        TabOrder = 1
        inherited Label1: TLabel
          Width = 55
          Height = 14
          Caption = 'Propriet'#225'rio'
        end
        inherited MeCadastro: TMaskEdit
          Height = 22
        end
        inherited EdCadastro: TEdit
          Width = 261
          Height = 22
        end
      end
      inline Fm5Imovel: TFmImovel
        Left = 11
        Top = 137
        Width = 337
        Height = 40
        TabOrder = 2
        inherited Label1: TLabel
          Width = 30
          Height = 14
        end
        inherited MeImovel: TMaskEdit
          Height = 22
        end
        inherited EdImovel: TEdit
          Width = 258
          Height = 22
        end
      end
      inline Fm5Datas: TFmDatas
        Left = 11
        Top = 184
        Width = 178
        Height = 60
        TabOrder = 3
        inherited GroupBox1: TGroupBox
          Caption = 'Data Para Despesas Propriet'#225'rio'
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
    Left = 232
    Top = 331
  end
  inherited BtCancela: TBitBtn
    Left = 328
    Top = 331
  end
  inherited RGPreview: TRadioGroup
    Top = 299
  end
end
