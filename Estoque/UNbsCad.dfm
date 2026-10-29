inherited FNbsCad: TFNbsCad
  Left = 909
  Top = 191
  Caption = 'Cadastro de NBS'
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel [1]
    Left = 8
    Top = 64
    Width = 57
    Height = 14
    Caption = 'C'#243'digo NBS'
    FocusControl = DBEdit1
  end
  object Label2: TLabel [2]
    Left = 8
    Top = 104
    Width = 88
    Height = 14
    Caption = 'Descri'#231#227'o do NBS'
    FocusControl = DBEdit2
  end
  object Label3: TLabel [3]
    Left = 8
    Top = 144
    Width = 123
    Height = 14
    Caption = 'Perc. Tributa'#231#227'o Nacional'
    FocusControl = DBEdit3
  end
  object Label4: TLabel [4]
    Left = 8
    Top = 184
    Width = 129
    Height = 14
    Caption = 'Perc. Tributa'#231#227'o Importado'
    FocusControl = DBEdit4
  end
  inherited Panel1: TPanel
    TabOrder = 4
  end
  object DBEdit1: TDBEdit [7]
    Left = 8
    Top = 80
    Width = 144
    Height = 22
    DataField = 'COD_NBS'
    DataSource = DataSource1
    TabOrder = 0
  end
  object DBEdit2: TDBEdit [8]
    Left = 8
    Top = 120
    Width = 569
    Height = 22
    DataField = 'DESC_NBS'
    DataSource = DataSource1
    TabOrder = 1
  end
  object DBEdit3: TDBEdit [9]
    Left = 8
    Top = 160
    Width = 144
    Height = 22
    DataField = 'PERC_TRIBUTO_NACIONAL'
    DataSource = DataSource1
    TabOrder = 2
  end
  object DBEdit4: TDBEdit [10]
    Left = 8
    Top = 200
    Width = 144
    Height = 22
    DataField = 'PERC_TRIBUTO_IMPORTADO'
    DataSource = DataSource1
    TabOrder = 3
  end
  object GroupBox1: TGroupBox [11]
    Left = 272
    Top = 152
    Width = 305
    Height = 161
    Caption = 'Reforma Tribut'#225'ria'
    TabOrder = 6
    object Label5: TLabel
      Left = 14
      Top = 19
      Width = 49
      Height = 14
      Caption = 'Perc. CBS'
      FocusControl = DBEdit5
    end
    object Label6: TLabel
      Left = 13
      Top = 62
      Width = 69
      Height = 14
      Caption = 'In'#237'cio Vig'#234'ncia'
      FocusControl = DBEdit6
    end
    object Label7: TLabel
      Left = 13
      Top = 102
      Width = 61
      Height = 14
      Caption = 'Fim Vig'#234'ncia'
      FocusControl = DBEdit7
    end
    object DBEdit5: TDBEdit
      Left = 13
      Top = 35
      Width = 144
      Height = 22
      DataField = 'PERC_CBS'
      DataSource = DSPrimario
      TabOrder = 0
    end
    object DBEdit6: TDBEdit
      Left = 13
      Top = 78
      Width = 256
      Height = 22
      DataField = 'DT_VIGENCIA_INI'
      DataSource = DSPrimario
      TabOrder = 1
    end
    object DBEdit7: TDBEdit
      Left = 13
      Top = 118
      Width = 256
      Height = 22
      DataField = 'DT_VIGENCIA_FIM'
      DataSource = DSPrimario
      TabOrder = 2
    end
  end
  inherited DSPrimario: TDataSource
    DataSet = DMNbs.QNBS_Cad
  end
  object DataSource1: TDataSource
    DataSet = DMNbs.QNBS_Cad
    Left = 502
    Top = 48
  end
end
