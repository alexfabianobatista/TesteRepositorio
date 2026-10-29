object FmDatas: TFmDatas
  Left = 0
  Top = 0
  Width = 178
  Height = 60
  TabOrder = 0
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 177
    Height = 57
    Caption = 'Dt.Refer'#234'ncia'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 27
      Height = 13
      Caption = 'Inicial'
    end
    object Label2: TLabel
      Left = 96
      Top = 16
      Width = 22
      Height = 13
      Caption = 'Final'
    end
    object MeDtInicial: TMaskEdit
      Left = 8
      Top = 32
      Width = 73
      Height = 21
      EditMask = '!99/99/##00;1;_'
      MaxLength = 10
      TabOrder = 0
      Text = '  /  /    '
    end
    object MeDtFinal: TMaskEdit
      Left = 96
      Top = 32
      Width = 73
      Height = 21
      EditMask = '!99/99/##00;1;_'
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
    end
  end
end
