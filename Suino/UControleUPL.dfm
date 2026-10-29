inherited FControleUPL: TFControleUPL
  Left = 290
  Top = 162
  Caption = 'Controle de UPL'
  ClientHeight = 374
  ClientWidth = 615
  PixelsPerInch = 96
  TextHeight = 14
  inherited Panel1: TPanel
    Width = 615
  end
  inherited StBLongHint: TStatusBar
    Top = 355
    Width = 615
  end
  inherited MMCadSimples: TMainMenu
    inherited Relatrios1: TMenuItem
      object RelatoriodeUPL1: TMenuItem
        Caption = 'Relatorio de UPL'
        OnClick = RelatoriodeUPL1Click
      end
    end
  end
end
