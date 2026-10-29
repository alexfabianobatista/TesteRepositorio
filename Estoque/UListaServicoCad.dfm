inherited FListaServicoCad: TFListaServicoCad
  Left = 332
  Top = 199
  Caption = 'Cadastro da Lista de Servi'#231'os'
  ClientHeight = 192
  ClientWidth = 475
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel [0]
    Left = 24
    Top = 56
    Width = 33
    Height = 14
    Caption = 'C'#243'digo'
    FocusControl = DBEdit1
  end
  object Label2: TLabel [1]
    Left = 24
    Top = 104
    Width = 49
    Height = 14
    Caption = 'Descri'#231#227'o'
    FocusControl = DBEdit2
  end
  inherited Panel1: TPanel
    Width = 475
    TabOrder = 2
    inherited SBConsulta: TSpeedButton
      Left = 446
    end
    inherited lbPesquisaCodigo: TLabel
      Left = 342
    end
    inherited MELocaliza: TMaskEdit
      Left = 398
    end
    inherited pnSeparador2: TPanel
      Left = 330
    end
  end
  object DBEdit1: TDBEdit [4]
    Left = 24
    Top = 72
    Width = 105
    Height = 22
    DataField = 'COD_LISTA_SERVICO'
    DataSource = DSPrimario
    TabOrder = 0
  end
  object DBEdit2: TDBEdit [5]
    Left = 24
    Top = 120
    Width = 369
    Height = 22
    DataField = 'DESC_LISTA_SERVICO'
    DataSource = DSPrimario
    TabOrder = 1
  end
  inherited StBLongHint: TStatusBar
    Top = 173
    Width = 475
  end
  inherited MMCadSimples: TMainMenu
    Left = 408
  end
  inherited DSPrimario: TDataSource
    DataSet = DMProduto.QListaServico
    Left = 440
  end
  inherited ILBotao: TImageList
    Left = 376
  end
end
