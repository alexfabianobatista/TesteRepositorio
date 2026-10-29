inherited FMedicoCad: TFMedicoCad
  Left = 276
  Top = 162
  Caption = 'Cadastro de M'#233'dicos'
  ClientHeight = 227
  ClientWidth = 377
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel [0]
    Left = 16
    Top = 59
    Width = 33
    Height = 14
    Caption = 'C'#243'digo'
    FocusControl = DBEdit1
  end
  object Label2: TLabel [1]
    Left = 17
    Top = 104
    Width = 27
    Height = 14
    Caption = 'Nome'
    FocusControl = DBEdit2
  end
  object Label3: TLabel [2]
    Left = 273
    Top = 104
    Width = 22
    Height = 14
    Caption = 'CRM'
    FocusControl = DBEdit3
  end
  object Label4: TLabel [3]
    Left = 17
    Top = 152
    Width = 19
    Height = 14
    Caption = 'CPF'
  end
  object Bevel1: TBevel [4]
    Left = 8
    Top = 48
    Width = 361
    Height = 153
  end
  object Label5: TLabel [5]
    Left = 192
    Top = 152
    Width = 25
    Height = 14
    Caption = 'CNPJ'
    FocusControl = DBEdit5
  end
  inherited Panel1: TPanel
    Width = 377
    TabOrder = 5
  end
  inherited StBLongHint: TStatusBar
    Top = 208
    Width = 377
  end
  object DBEdit1: TDBEdit [8]
    Left = 16
    Top = 75
    Width = 49
    Height = 22
    TabStop = False
    Color = clBtnFace
    DataField = 'COD_MEDICO'
    DataSource = DSPrimario
    Enabled = False
    TabOrder = 4
  end
  object DBEdit2: TDBEdit [9]
    Left = 16
    Top = 120
    Width = 249
    Height = 22
    DataField = 'NOME'
    DataSource = DSPrimario
    TabOrder = 0
  end
  object DBEdit3: TDBEdit [10]
    Left = 272
    Top = 120
    Width = 89
    Height = 22
    DataField = 'DESC_CRM'
    DataSource = DSPrimario
    TabOrder = 1
  end
  object DBEdit5: TDBEdit [11]
    Left = 192
    Top = 168
    Width = 169
    Height = 22
    DataField = 'DESC_CNPJ'
    DataSource = DSPrimario
    TabOrder = 3
  end
  object DBEdit4: TDBEdit [12]
    Left = 16
    Top = 168
    Width = 169
    Height = 22
    DataField = 'DESC_CPF'
    DataSource = DSPrimario
    TabOrder = 2
  end
  inherited MMCadSimples: TMainMenu
    Left = 408
    inherited Relatrios1: TMenuItem
      OnClick = Relatrios1Click
    end
  end
  inherited DSPrimario: TDataSource
    DataSet = DMMedico.QMedico
    Left = 328
  end
  inherited ILBotao: TImageList
    Left = 376
  end
end
