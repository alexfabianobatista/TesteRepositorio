inherited FCondominio_Cad: TFCondominio_Cad
  Left = 311
  Top = 182
  Caption = 'Cadastro de Condominio'
  ClientHeight = 237
  ClientWidth = 575
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel [0]
    Left = 40
    Top = 64
    Width = 33
    Height = 14
    Caption = 'C'#243'digo'
    FocusControl = DBEdit1
  end
  object Label2: TLabel [1]
    Left = 40
    Top = 104
    Width = 49
    Height = 14
    Caption = 'Descri'#231#227'o'
    FocusControl = DBEdit2
  end
  inherited Panel1: TPanel
    Width = 575
  end
  inherited StBLongHint: TStatusBar
    Top = 218
    Width = 575
  end
  object DBEdit1: TDBEdit [4]
    Left = 40
    Top = 80
    Width = 65
    Height = 22
    DataField = 'COD_CONDOMINIO'
    DataSource = DSPrimario
    TabOrder = 2
  end
  object DBEdit2: TDBEdit [5]
    Left = 40
    Top = 120
    Width = 424
    Height = 22
    DataField = 'DESC_CONDOMINIO'
    DataSource = DSPrimario
    TabOrder = 3
  end
  inherited MMCadSimples: TMainMenu
    inherited Relatrios1: TMenuItem
      object FechamentoMensal1: TMenuItem
        Caption = 'Fechamento Mensal'
        OnClick = FechamentoMensal1Click
      end
    end
  end
  inherited DSPrimario: TDataSource
    DataSet = DMImobiliaria.QCondominio_Cad
  end
end
