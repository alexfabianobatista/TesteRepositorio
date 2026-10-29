inherited FEquipamentoCad: TFEquipamentoCad
  Left = 449
  Top = 435
  Caption = 'FEquipamentoCad'
  ClientHeight = 277
  ClientWidth = 560
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel [1]
    Left = 24
    Top = 64
    Width = 33
    Height = 14
    Caption = 'C'#243'digo'
    FocusControl = DBEdit1
  end
  object Label2: TLabel [2]
    Left = 24
    Top = 168
    Width = 49
    Height = 14
    Caption = 'Descri'#231#227'o'
    FocusControl = DBEdit2
  end
  object Label3: TLabel [3]
    Left = 24
    Top = 120
    Width = 99
    Height = 14
    Caption = 'Tipo de Equipamento'
    FocusControl = DBEdit2
  end
  inherited Panel1: TPanel
    Width = 560
    inherited lbPesquisaCodigo: TLabel
      Left = 418
    end
    inherited SBConsulta: TSpeedButton
      Left = 525
    end
    inherited pnSeparador2: TPanel
      Left = 409
    end
    inherited MELocaliza: TMaskEdit
      Left = 476
    end
  end
  inherited StBLongHint: TStatusBar
    Top = 258
    Width = 560
  end
  object DBEdit1: TDBEdit [6]
    Left = 24
    Top = 80
    Width = 73
    Height = 22
    Color = clBtnFace
    DataField = 'COD_EQUIPAMENTO_FICHA'
    DataSource = DSPrimario
    Enabled = False
    TabOrder = 2
  end
  object DBEdit2: TDBEdit [7]
    Left = 24
    Top = 184
    Width = 473
    Height = 22
    DataField = 'DESC_EQUIPAMENTO_FICHA'
    DataSource = DSPrimario
    TabOrder = 3
  end
  object DBComboBox1: TDBComboBox [8]
    Left = 24
    Top = 136
    Width = 145
    Height = 22
    DataField = 'DESC_TIPO_EQUIPAMENTO_FICHA'
    DataSource = DSPrimario
    ItemHeight = 14
    Items.Strings = (
      'SITUA'#199#195'O EXTERNA'
      'EQUIPAMENTO'
      'MOTOR')
    TabOrder = 4
  end
  inherited DSPrimario: TDataSource
    DataSet = DMOrdemServico.QEquipamentoFicha
    Left = 351
  end
end
