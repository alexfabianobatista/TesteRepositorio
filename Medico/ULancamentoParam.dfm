inherited FLancamentoParam: TFLancamentoParam
  Left = 247
  Top = 160
  Width = 593
  Height = 313
  Caption = 'Par'#226'metros p/ Relat'#243'rio de Lan'#231'amentos'
  PixelsPerInch = 96
  TextHeight = 14
  inherited PGRelatorio: TPageControl
    Width = 585
    ActivePage = TabSheet2
    object TabSheet1: TTabSheet
      Caption = 'Lan'#231'amentos'
      OnShow = TabSheet1Show
      object Bevel1: TBevel
        Left = 0
        Top = 0
        Width = 577
        Height = 171
      end
      inline FmMedico1: TFmMedico
        Left = 7
        Top = 6
        Width = 265
        Height = 37
        TabOrder = 0
        inherited LblMedico: TLabel
          Width = 34
          Height = 14
        end
        inherited MeMedico: TMaskEdit
          Height = 22
        end
        inherited EdMedico: TEdit
          Height = 22
        end
      end
      inline FmConvenio1: TFmConvenio
        Left = 8
        Top = 48
        Width = 265
        Height = 37
        TabOrder = 1
        inherited LblConvenio: TLabel
          Height = 14
        end
        inherited MeConvenio: TMaskEdit
          Height = 22
        end
        inherited EdConvenio: TEdit
          Height = 22
        end
      end
      object RgTipoPagamento1: TRadioGroup
        Left = 286
        Top = 5
        Width = 97
        Height = 80
        Caption = 'Tipo Pagamento'
        ItemIndex = 0
        Items.Strings = (
          'Conv'#234'nio'
          'Particular'
          'Todos')
        TabOrder = 2
        OnClick = RgTipoPagamento1Click
      end
      inline FmDatasLancamento1: TFmDatas
        Left = 6
        Top = 92
        Width = 195
        Height = 62
        TabOrder = 3
        inherited GroupBox1: TGroupBox
          Left = 2
          Top = 1
          Width = 177
          Height = 58
          Caption = 'Dt.Lan'#231'amento'
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
      inline FmDatasPagamento1: TFmDatas
        Left = 203
        Top = 93
        Width = 190
        Height = 60
        TabOrder = 4
        inherited GroupBox1: TGroupBox
          Left = 4
          Top = 1
          Width = 177
          Caption = 'Dt.Pagamento'
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
      object RgQuebra1: TRadioGroup
        Left = 392
        Top = 5
        Width = 89
        Height = 146
        Caption = 'Quebrar por:'
        ItemIndex = 1
        Items.Strings = (
          'Lan'#231'amento'
          'Pagamento')
        TabOrder = 5
      end
      object RGSituacao1: TRadioGroup
        Left = 483
        Top = 5
        Width = 82
        Height = 145
        Caption = 'Situa'#231#227'o'
        ItemIndex = 2
        Items.Strings = (
          #192' Pagar'
          'Pago'
          'Todos')
        TabOrder = 6
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Recibo'
      ImageIndex = 1
      OnShow = TabSheet2Show
      object Bevel2: TBevel
        Left = 0
        Top = 0
        Width = 489
        Height = 171
      end
      inline FmMedico2: TFmMedico
        Left = 7
        Top = 6
        Width = 265
        Height = 37
        TabOrder = 0
        inherited LblMedico: TLabel
          Width = 34
          Height = 14
        end
        inherited MeMedico: TMaskEdit
          Height = 22
          OnExit = FmMedico2MeMedicoExit
        end
        inherited EdMedico: TEdit
          Height = 22
          Text = 'Selecione um Medico'
        end
      end
      inline FmDatasPagamento2: TFmDatas
        Left = 8
        Top = 93
        Width = 185
        Height = 68
        TabOrder = 3
        inherited GroupBox1: TGroupBox
          Left = 0
          Top = 0
          Width = 177
          Height = 58
          Caption = 'Dt.Pagamento'
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
      inline FmConvenio2: TFmConvenio
        Left = 8
        Top = 48
        Width = 265
        Height = 37
        TabOrder = 1
        inherited LblConvenio: TLabel
          Height = 14
        end
        inherited MeConvenio: TMaskEdit
          Height = 22
        end
        inherited EdConvenio: TEdit
          Height = 22
        end
      end
      object RgTipoPagamento2: TRadioGroup
        Left = 286
        Top = 5
        Width = 97
        Height = 80
        Caption = 'Tipo Pagamento'
        ItemIndex = 0
        Items.Strings = (
          'Conv'#234'nio'
          'Particular'
          'Todos')
        TabOrder = 2
        OnClick = RgTipoPagamento2Click
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Pagamentos Sint'#233'tico'
      ImageIndex = 2
      OnShow = TabSheet3Show
      object Bevel3: TBevel
        Left = 0
        Top = 0
        Width = 489
        Height = 171
      end
      inline FmDatasPagamento3: TFmDatas
        Left = 8
        Top = 85
        Width = 185
        Height = 68
        TabOrder = 0
        inherited GroupBox1: TGroupBox
          Left = 0
          Width = 177
          Height = 58
          Caption = 'Dt.Pagamento'
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
      object RgTipoPagamento3: TRadioGroup
        Left = 286
        Top = 5
        Width = 97
        Height = 80
        Caption = 'Tipo Pagamento'
        ItemIndex = 0
        Items.Strings = (
          'Conv'#234'nio'
          'Particular'
          'Todos')
        TabOrder = 1
        OnClick = RgTipoPagamento3Click
      end
      inline FmConvenio3: TFmConvenio
        Left = 8
        Top = 48
        Width = 265
        Height = 37
        TabOrder = 2
        inherited LblConvenio: TLabel
          Height = 14
        end
        inherited MeConvenio: TMaskEdit
          Height = 22
        end
        inherited EdConvenio: TEdit
          Height = 22
        end
      end
      inline FmMedico3: TFmMedico
        Left = 7
        Top = 6
        Width = 265
        Height = 37
        TabOrder = 3
        inherited LblMedico: TLabel
          Width = 34
          Height = 14
        end
        inherited MeMedico: TMaskEdit
          Height = 22
        end
        inherited EdMedico: TEdit
          Height = 22
        end
      end
    end
  end
end
