inherited FContaReceberLocador: TFContaReceberLocador
  Left = 311
  Top = 121
  Caption = 'Contas Receber Locador'
  ClientHeight = 357
  PixelsPerInch = 96
  TextHeight = 14
  inherited Panel1: TPanel
    TabOrder = 6
    Visible = False
  end
  inherited StBLongHint: TStatusBar
    Top = 338
  end
  inline FmFilial: TFmFilial [2]
    Left = 72
    Top = 80
    Width = 377
    Height = 37
    TabOrder = 0
    inherited Label1: TLabel
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
  inline FmFinalidade1: TFmFinalidade [3]
    Left = 72
    Top = 127
    Width = 378
    Height = 37
    TabOrder = 1
    inherited Label1: TLabel
      Width = 86
      Height = 14
      Caption = 'Finalidade Aluguel'
    end
    inherited MeFinalidade: TMaskEdit
      Height = 22
    end
    inherited EdFinalidade: TEdit
      Width = 302
      Height = 22
    end
  end
  object GroupBox1: TGroupBox [4]
    Left = 72
    Top = 212
    Width = 118
    Height = 57
    Caption = 'Vencimento'
    TabOrder = 3
    object Label1: TLabel
      Left = 8
      Top = 14
      Width = 20
      Height = 14
      Caption = 'M'#234's'
    end
    object Label2: TLabel
      Left = 41
      Top = 14
      Width = 20
      Height = 14
      Caption = 'Ano'
    end
    object MeMesReferencia: TMaskEdit
      Left = 7
      Top = 28
      Width = 27
      Height = 22
      EditMask = '##'
      MaxLength = 2
      TabOrder = 0
      Text = '  '
    end
    object MeAnoReferencia: TMaskEdit
      Left = 39
      Top = 28
      Width = 40
      Height = 22
      EditMask = '####'
      MaxLength = 4
      TabOrder = 1
      Text = '    '
    end
  end
  object BitBtn1: TBitBtn [5]
    Left = 96
    Top = 280
    Width = 169
    Height = 49
    Caption = 'Confirmar'
    TabOrder = 4
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn [6]
    Left = 272
    Top = 280
    Width = 169
    Height = 49
    Caption = 'Cancelar'
    TabOrder = 5
    Kind = bkCancel
  end
  inline FmFinalidade2: TFmFinalidade [7]
    Left = 71
    Top = 170
    Width = 378
    Height = 37
    TabOrder = 2
    inherited Label1: TLabel
      Width = 106
      Height = 14
      Caption = 'Finalidade Condominio'
    end
    inherited MeFinalidade: TMaskEdit
      Height = 22
    end
    inherited EdFinalidade: TEdit
      Width = 302
      Height = 22
    end
  end
  inherited MMCadSimples: TMainMenu [8]
    inherited Manuteno1: TMenuItem
      Visible = False
    end
    inherited Relatrios1: TMenuItem
      Visible = False
    end
  end
  inherited DSPrimario: TDataSource [9]
  end
end
