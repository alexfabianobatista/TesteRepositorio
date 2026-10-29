inherited FAnpCad: TFAnpCad
  Left = 435
  Top = 201
  Caption = 'Cadastro C'#243'digo ANP'
  ClientHeight = 301
  ClientWidth = 552
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel [1]
    Left = 6
    Top = 49
    Width = 56
    Height = 14
    Caption = 'C'#243'digo ANP'
    FocusControl = DBEdit1
  end
  object Label2: TLabel [2]
    Left = 6
    Top = 91
    Width = 72
    Height = 14
    Caption = 'Descri'#231#227'o ANP'
    FocusControl = DBEdit2
  end
  inherited Panel1: TPanel
    Width = 552
    inherited lbPesquisaCodigo: TLabel
      Left = 410
    end
    inherited SBConsulta: TSpeedButton
      Left = 517
    end
    inherited pnSeparador2: TPanel
      Left = 401
    end
    inherited MELocaliza: TMaskEdit
      Left = 468
    end
  end
  inherited StBLongHint: TStatusBar
    Top = 282
    Width = 552
  end
  object DBEdit1: TDBEdit [5]
    Left = 6
    Top = 65
    Width = 130
    Height = 22
    DataField = 'COD_ANP'
    DataSource = DSPrimario
    TabOrder = 2
  end
  object DBEdit2: TDBEdit [6]
    Left = 6
    Top = 107
    Width = 307
    Height = 22
    DataField = 'DESC_ANP'
    DataSource = DSPrimario
    TabOrder = 3
  end
  inherited DSPrimario: TDataSource
    DataSet = DMAnp.QAnp
  end
end
