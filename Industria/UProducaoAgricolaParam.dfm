inherited FProducaoAgricolaParam: TFProducaoAgricolaParam
  Left = 302
  Top = 199
  Width = 461
  Height = 351
  Caption = 'Par'#226'metros'
  PixelsPerInch = 96
  TextHeight = 14
  inherited PGRelatorio: TPageControl
    Width = 453
    Height = 247
    ActivePage = TabSheet3
    object TabSheet1: TTabSheet
      Caption = 'Produ'#231#227'o Materia Prima'
      inline FmFilial1: TFmFilial
        Left = 0
        Top = 2
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
      inline FmTurno1: TFmTurno
        Left = 0
        Top = 44
        Width = 265
        Height = 37
        TabOrder = 1
        inherited Label1: TLabel
          Height = 14
        end
        inherited MeTurno: TMaskEdit
          Height = 22
        end
        inherited BtTurno: TBitBtn
          OnClick = FmTurno1BtTurnoClick
        end
        inherited EdTurno: TEdit
          Height = 22
        end
      end
      inline FmProduto1: TFmProduto
        Left = 0
        Top = 89
        Width = 265
        Height = 37
        TabOrder = 2
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
      object GroupBox1: TGroupBox
        Left = 0
        Top = 136
        Width = 193
        Height = 49
        Caption = 'Emiss'#227'o'
        TabOrder = 3
        object Label1: TLabel
          Left = 87
          Top = 20
          Width = 17
          Height = 14
          Caption = 'At'#233
        end
        object MeData_I: TMaskEdit
          Left = 7
          Top = 16
          Width = 72
          Height = 22
          EditMask = '!99/99/0000;1;_'
          MaxLength = 10
          TabOrder = 0
          Text = '  /  /    '
        end
        object MeData_F: TMaskEdit
          Left = 110
          Top = 16
          Width = 72
          Height = 22
          EditMask = '!99/99/0000;1;_'
          MaxLength = 10
          TabOrder = 1
          Text = '  /  /    '
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Produto Acabado'
      ImageIndex = 1
      inline FmFilial2: TFmFilial
        Left = 0
        Top = 2
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
      inline FmTurno2: TFmTurno
        Left = 0
        Top = 44
        Width = 265
        Height = 37
        TabOrder = 1
        inherited Label1: TLabel
          Height = 14
        end
        inherited MeTurno: TMaskEdit
          Height = 22
        end
        inherited EdTurno: TEdit
          Height = 22
        end
      end
      inline FmProduto2: TFmProduto
        Left = 0
        Top = 89
        Width = 265
        Height = 37
        TabOrder = 2
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
      object GroupBox2: TGroupBox
        Left = 0
        Top = 136
        Width = 193
        Height = 49
        Caption = 'Emiss'#227'o'
        TabOrder = 3
        object Label2: TLabel
          Left = 87
          Top = 20
          Width = 17
          Height = 14
          Caption = 'At'#233
        end
        object Me2Dt_I: TMaskEdit
          Left = 7
          Top = 16
          Width = 72
          Height = 22
          EditMask = '!99/99/0000;1;_'
          MaxLength = 10
          TabOrder = 0
          Text = '  /  /    '
        end
        object Me2Dt_F: TMaskEdit
          Left = 110
          Top = 16
          Width = 72
          Height = 22
          EditMask = '!99/99/0000;1;_'
          MaxLength = 10
          TabOrder = 1
          Text = '  /  /    '
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Relat'#243'rio Produ'#231#227'o'
      ImageIndex = 2
      inline FmFilial3: TFmFilial
        Left = 0
        Top = 2
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
      inline FmTurno3: TFmTurno
        Left = 0
        Top = 44
        Width = 265
        Height = 37
        TabOrder = 1
        inherited Label1: TLabel
          Height = 14
        end
        inherited MeTurno: TMaskEdit
          Height = 22
        end
        inherited EdTurno: TEdit
          Height = 22
        end
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 118
        Width = 193
        Height = 49
        Caption = 'Emiss'#227'o'
        TabOrder = 3
        object Label3: TLabel
          Left = 87
          Top = 20
          Width = 17
          Height = 14
          Caption = 'At'#233
        end
        object Me3Data_I: TMaskEdit
          Left = 7
          Top = 16
          Width = 72
          Height = 22
          EditMask = '!99/99/0000;1;_'
          MaxLength = 10
          TabOrder = 0
          Text = '  /  /    '
        end
        object Me3Data_F: TMaskEdit
          Left = 110
          Top = 16
          Width = 72
          Height = 22
          EditMask = '!99/99/0000;1;_'
          MaxLength = 10
          TabOrder = 1
          Text = '  /  /    '
        end
      end
      object CBXTurno3: TCheckBox
        Left = 0
        Top = 93
        Width = 113
        Height = 17
        Caption = 'Quebra por Turno'
        TabOrder = 2
      end
    end
  end
  inherited BtOk: TBitBtn
    Top = 288
  end
  inherited BtCancela: TBitBtn
    Top = 288
  end
  inherited RGPreview: TRadioGroup
    Top = 256
  end
end
