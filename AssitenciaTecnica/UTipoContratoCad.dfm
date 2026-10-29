inherited FTipoContratoCad: TFTipoContratoCad
  Left = 512
  Top = 186
  Caption = 'Cadastro de Tipo de Contrato'
  ClientHeight = 172
  ClientWidth = 437
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel [0]
    Left = 8
    Top = 56
    Width = 33
    Height = 14
    Caption = 'C'#243'digo'
    FocusControl = DBEdit1
  end
  object Label2: TLabel [1]
    Left = 8
    Top = 97
    Width = 49
    Height = 14
    Caption = 'Descri'#231#227'o'
    FocusControl = DBEdit2
  end
  object Label3: TLabel [2]
    Left = 225
    Top = 56
    Width = 62
    Height = 14
    Caption = 'Valor Mensal'
    FocusControl = DBEdit3
  end
  inherited Panel1: TPanel
    Width = 437
    inherited SBConsulta: TSpeedButton
      Left = 401
    end
    inherited lbPesquisaCodigo: TLabel
      Left = 297
    end
    inherited MELocaliza: TMaskEdit
      Left = 353
    end
    inherited pnSeparador2: TPanel
      Left = 285
    end
  end
  object DBEdit1: TDBEdit [5]
    Left = 8
    Top = 72
    Width = 89
    Height = 22
    TabStop = False
    Color = clBtnFace
    DataField = 'COD_TIPO_CONTRATO'
    DataSource = DSPrimario
    Enabled = False
    ReadOnly = True
    TabOrder = 1
  end
  object DBEdit2: TDBEdit [6]
    Left = 8
    Top = 113
    Width = 361
    Height = 22
    DataField = 'DESC_TIPO_CONTRATO'
    DataSource = DSPrimario
    TabOrder = 2
  end
  object DBEdit3: TDBEdit [7]
    Left = 225
    Top = 72
    Width = 144
    Height = 22
    DataField = 'VAL_MENSAL'
    DataSource = DSPrimario
    TabOrder = 4
  end
  inherited StBLongHint: TStatusBar
    Top = 153
    Width = 437
  end
  inherited MMCadSimples: TMainMenu
    Left = 400
    inherited Relatrios1: TMenuItem
      OnClick = Relatrios1Click
    end
  end
  inherited DSPrimario: TDataSource
    DataSet = DMTipoContrato.QTipoContrato
    Left = 152
  end
  inherited ILBotao: TImageList
    Left = 376
  end
end
