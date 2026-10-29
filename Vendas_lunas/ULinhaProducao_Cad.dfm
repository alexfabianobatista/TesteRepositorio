inherited FLinhaProducao_Cad: TFLinhaProducao_Cad
  Left = 225
  Top = 164
  Caption = 'Cadastro de Linha de Produ'#231#227'o'
  ClientHeight = 129
  ClientWidth = 479
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel [0]
    Left = 21
    Top = 56
    Width = 33
    Height = 14
    Caption = 'C'#243'digo'
  end
  object Label2: TLabel [1]
    Left = 88
    Top = 56
    Width = 127
    Height = 14
    Caption = 'Descri'#231#227'o Linha Produ'#231#227'o'
  end
  inherited Panel1: TPanel
    Width = 479
  end
  inherited StBLongHint: TStatusBar
    Top = 110
    Width = 479
  end
  object DBEdit1: TDBEdit [4]
    Left = 20
    Top = 72
    Width = 54
    Height = 22
    TabStop = False
    AutoSize = False
    Color = clBtnFace
    DataField = 'COD_LINHA_PRODUCAO'
    DataSource = DSPrimario
    ReadOnly = True
    TabOrder = 2
  end
  object DBEdit2: TDBEdit [5]
    Left = 88
    Top = 72
    Width = 273
    Height = 22
    AutoSize = False
    DataField = 'DESC_LINHA_PRODUCAO'
    DataSource = DSPrimario
    TabOrder = 3
  end
  inherited MMCadSimples: TMainMenu
    Left = 408
  end
  inherited DSPrimario: TDataSource
    DataSet = DMLinhaProducao.QLinhaProducao
    Left = 440
  end
  inherited ILBotao: TImageList
    Left = 376
  end
end
