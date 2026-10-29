object FExportaLancamentosContabeis: TFExportaLancamentosContabeis
  Left = 376
  Top = 214
  Width = 635
  Height = 237
  Caption = 'Exporta'#231#227'o de Lan'#231'amentos Cont'#225'beis'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 20
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 619
    Height = 198
    Align = alClient
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 604
      Height = 177
      TabOrder = 0
      DesignSize = (
        604
        177)
      object BTExportarLancamentosContabeis: TBitBtn
        Left = 168
        Top = 119
        Width = 284
        Height = 31
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Exportar Lan'#231'amentos Cont'#225'beis'
        TabOrder = 2
        OnClick = BTExportarLancamentosContabeisClick
      end
      inline FmFilial1: TFmFilial
        Left = 9
        Top = 30
        Width = 353
        Height = 44
        TabOrder = 0
        inherited Label1: TLabel
          Left = 0
          Top = -4
          Width = 31
          Height = 20
        end
        inherited MeFilial: TMaskEdit
          Height = 28
        end
        inherited EdFilial: TEdit
          Width = 271
          Height = 28
        end
      end
      object GroupBox2: TGroupBox
        Left = 376
        Top = 16
        Width = 219
        Height = 81
        Caption = 'Data de Lanc.'
        TabOrder = 1
        object Label10: TLabel
          Left = 12
          Top = 21
          Width = 48
          Height = 20
          Caption = 'Inicial :'
        end
        object Label11: TLabel
          Left = 114
          Top = 21
          Width = 42
          Height = 20
          Caption = 'Final :'
        end
        object MEDtInicial: TMaskEdit
          Left = 12
          Top = 38
          Width = 90
          Height = 28
          EditMask = '!99/99/9999;1;_'
          MaxLength = 10
          TabOrder = 0
          Text = '  /  /    '
        end
        object MEDtFinal: TMaskEdit
          Left = 114
          Top = 38
          Width = 93
          Height = 28
          EditMask = '!99/99/9999;1;_'
          MaxLength = 10
          TabOrder = 1
          Text = '  /  /    '
        end
      end
    end
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Arquivo Texto|*.txt'
    Left = 528
    Top = 120
  end
end
