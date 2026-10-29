inherited FCupomFiscalParam: TFCupomFiscalParam
  Left = 526
  Top = 259
  Caption = 'Par'#226'metros de cupom fiscal'
  PixelsPerInch = 96
  TextHeight = 14
  inherited PGRelatorio: TPageControl
    ActivePage = TabSheet2
    object TabSheet1: TTabSheet
      Caption = 'Cupom Fiscal'
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 54
        Height = 14
        Caption = 'Impressora'
      end
      object Label2: TLabel
        Left = 8
        Top = 48
        Width = 87
        Height = 14
        Caption = 'N'#250'mero do cupom'
      end
      inline Fm1Datas: TFmDatas
        Left = 8
        Top = 110
        Width = 178
        Height = 60
        TabOrder = 0
        inherited GroupBox1: TGroupBox
          Left = 1
          Top = -3
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
      object Me1Cupom: TMaskEdit
        Left = 8
        Top = 64
        Width = 248
        Height = 22
        EditMask = '999999;0;_'
        MaxLength = 6
        TabOrder = 1
      end
      object db1NumSerieECF: TDBLookupComboBox
        Left = 8
        Top = 24
        Width = 248
        Height = 22
        KeyField = 'NUM_SERIE'
        ListField = 'NUM_SERIE'
        ListSource = DMImpressoraFiscal.DSECFCons
        TabOrder = 2
        OnDropDown = db1NumSerieECFDropDown
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      OnShow = TabSheet2Show
      object leNome: TLabeledEdit
        Left = 8
        Top = 72
        Width = 369
        Height = 22
        CharCase = ecUpperCase
        EditLabel.Width = 27
        EditLabel.Height = 14
        EditLabel.Caption = 'Nome'
        TabOrder = 1
      end
      object leEndereco: TLabeledEdit
        Left = 8
        Top = 112
        Width = 313
        Height = 22
        CharCase = ecUpperCase
        EditLabel.Width = 46
        EditLabel.Height = 14
        EditLabel.Caption = 'Endere'#231'o'
        TabOrder = 2
      end
      object leNumero: TLabeledEdit
        Left = 328
        Top = 112
        Width = 49
        Height = 22
        CharCase = ecUpperCase
        EditLabel.Width = 37
        EditLabel.Height = 14
        EditLabel.Caption = 'N'#250'mero'
        TabOrder = 3
      end
      object leCGCCPF: TLabeledEdit
        Left = 8
        Top = 32
        Width = 169
        Height = 22
        CharCase = ecUpperCase
        EditLabel.Width = 151
        EditLabel.Height = 14
        EditLabel.Caption = 'CNPJ / CPF (Somente n'#250'meros)'
        TabOrder = 0
        OnExit = leCGCCPFExit
      end
    end
  end
  inherited RGPreview: TRadioGroup
    Visible = False
  end
  object ActionList1: TActionList
    Left = 360
    Top = 208
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 49222
      OnExecute = Action1Execute
    end
  end
end
