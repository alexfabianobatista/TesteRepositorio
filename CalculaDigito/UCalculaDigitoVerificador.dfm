inherited FCalculaDigito: TFCalculaDigito
  Left = 314
  Top = 114
  Caption = 'FCalculaDigito'
  ClientHeight = 503
  ClientWidth = 621
  PixelsPerInch = 96
  TextHeight = 14
  inherited SBHelp: TSpeedButton
    Visible = True
  end
  object Label1: TLabel [1]
    Left = 3
    Top = 7
    Width = 79
    Height = 14
    Caption = 'Inscri'#231#227'o Parcial'
  end
  object Label2: TLabel [2]
    Left = 3
    Top = 47
    Width = 93
    Height = 14
    Caption = 'E-mail para Contato'
  end
  object Label3: TLabel [3]
    Left = 3
    Top = 87
    Width = 106
    Height = 14
    Caption = 'Telefone para Contato'
  end
  object Label4: TLabel [4]
    Left = 97
    Top = 127
    Width = 61
    Height = 14
    Caption = 'I.E. Completa'
  end
  object Label5: TLabel [5]
    Left = 468
    Top = 127
    Width = 105
    Height = 14
    Caption = 'Lista I.E. Cadastradas'
  end
  object Label6: TLabel [6]
    Left = 244
    Top = 127
    Width = 94
    Height = 14
    Caption = 'Salva I.E. Calculada'
  end
  object Label7: TLabel [7]
    Left = 366
    Top = 127
    Width = 50
    Height = 14
    Caption = 'Limpa Tela'
  end
  inherited Panel1: TPanel
    Width = 621
    Height = 9
    TabOrder = 7
    Visible = False
    inherited SBIncluir: TSpeedButton
      Visible = False
    end
    inherited SBAlterar: TSpeedButton
      Visible = False
    end
    inherited SBConfirmar: TSpeedButton
      Enabled = False
    end
    inherited BtCopia: TSpeedButton
      Enabled = False
    end
    inherited lbPesquisaCodigo: TLabel
      Left = 479
    end
    inherited SBConsulta: TSpeedButton
      Left = 586
    end
    inherited pnSeparador2: TPanel
      Left = 470
    end
    inherited MELocaliza: TMaskEdit
      Left = 537
    end
  end
  inherited StBLongHint: TStatusBar
    Top = 484
    Width = 621
  end
  object DBGrid1: TDBGrid [10]
    Left = 3
    Top = 175
    Width = 593
    Height = 303
    DataSource = DSConsulta
    TabOrder = 9
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NUMERO'
        Title.Caption = 'INSCRI'#199#195'O'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMAIL'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELEFONE'
        Width = 90
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn [11]
    Left = 3
    Top = 143
    Width = 85
    Height = 25
    Caption = 'Calcular Digito'
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object Edit3: TEdit [12]
    Left = 95
    Top = 143
    Width = 132
    Height = 25
    ReadOnly = True
    TabOrder = 10
  end
  object BitBtn2: TBitBtn [13]
    Left = 476
    Top = 143
    Width = 77
    Height = 25
    Caption = 'Consultar'
    TabOrder = 6
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn [14]
    Left = 243
    Top = 143
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 4
    OnClick = BitBtn3Click
  end
  object Edit1: TEdit [15]
    Left = 3
    Top = 23
    Width = 121
    Height = 22
    TabOrder = 0
  end
  object Edit2: TEdit [16]
    Left = 3
    Top = 64
    Width = 121
    Height = 22
    TabOrder = 1
  end
  object MaskEdit1: TMaskEdit [17]
    Left = 3
    Top = 100
    Width = 111
    Height = 22
    EditMask = '!\(999\)00000-0000;1;_'
    MaxLength = 15
    TabOrder = 2
    Text = '(   )     -    '
  end
  object BitBtn4: TBitBtn [18]
    Left = 357
    Top = 143
    Width = 77
    Height = 25
    Caption = 'Limpar'
    TabOrder = 5
    OnClick = BitBtn4Click
  end
  inherited DSPrimario: TDataSource
    DataSet = DMCalculaDigito.QCalculaDigito
  end
  object DSConsulta: TDataSource
    AutoEdit = False
    DataSet = DMCalculaDigito.QCalculaDigitoCons
    Left = 329
    Top = 49
  end
end
