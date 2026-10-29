inherited FConvenioCad: TFConvenioCad
  Left = 259
  Top = 159
  Caption = 'Cadastro de Conv'#234'nio'
  ClientHeight = 145
  ClientWidth = 385
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object Bevel1: TBevel [0]
    Left = 8
    Top = 48
    Width = 369
    Height = 73
  end
  object Label1: TLabel [1]
    Left = 24
    Top = 67
    Width = 33
    Height = 14
    Caption = 'C'#243'digo'
    FocusControl = DBEdit1
  end
  object Label2: TLabel [2]
    Left = 80
    Top = 67
    Width = 49
    Height = 14
    Caption = 'Descri'#231#227'o'
    FocusControl = DBEdit2
  end
  inherited Panel1: TPanel
    Width = 385
  end
  inherited StBLongHint: TStatusBar
    Top = 126
    Width = 385
  end
  object DBEdit1: TDBEdit [5]
    Left = 24
    Top = 83
    Width = 41
    Height = 22
    TabStop = False
    Color = clBtnFace
    DataField = 'COD_CONVENIO'
    DataSource = DSPrimario
    Enabled = False
    TabOrder = 2
  end
  object DBEdit2: TDBEdit [6]
    Left = 80
    Top = 83
    Width = 281
    Height = 22
    DataField = 'DESC_CONVENIO'
    DataSource = DSPrimario
    TabOrder = 3
  end
  inherited MMCadSimples: TMainMenu
    Left = 408
    inherited Relatrios1: TMenuItem
      OnClick = Relatrios1Click
    end
  end
  inherited DSPrimario: TDataSource
    DataSet = DMConvenio.QConvenio
    Left = 328
  end
  inherited ILBotao: TImageList
    Left = 376
  end
end
