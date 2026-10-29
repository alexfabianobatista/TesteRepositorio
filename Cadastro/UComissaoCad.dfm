inherited FComissaoCad: TFComissaoCad
  Caption = 'Cadastro de Comiss'#227'o'
  ClientHeight = 154
  ClientWidth = 574
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel [0]
    Left = 8
    Top = 64
    Width = 33
    Height = 14
    Caption = 'C'#243'digo'
    FocusControl = DBEdit1
  end
  object Label2: TLabel [1]
    Left = 168
    Top = 64
    Width = 49
    Height = 14
    Caption = 'Descri'#231#227'o'
    FocusControl = DBEdit2
  end
  inherited Panel1: TPanel
    Width = 574
    inherited SBConsulta: TSpeedButton
      Left = 541
    end
    inherited lbPesquisaCodigo: TLabel
      Left = 437
    end
    inherited MELocaliza: TMaskEdit
      Left = 493
    end
    inherited pnSeparador2: TPanel
      Left = 425
    end
  end
  object DBEdit1: TDBEdit [4]
    Left = 8
    Top = 80
    Width = 144
    Height = 22
    DataField = 'COD_COMISSAO'
    DataSource = DSPrimario
    TabOrder = 2
  end
  object DBEdit2: TDBEdit [5]
    Left = 168
    Top = 80
    Width = 393
    Height = 22
    DataField = 'DESC_COMISSAO'
    DataSource = DSPrimario
    TabOrder = 3
  end
  inherited StBLongHint: TStatusBar
    Top = 135
    Width = 574
  end
  inherited DSPrimario: TDataSource
    DataSet = DMComissao.QComissao
  end
end
