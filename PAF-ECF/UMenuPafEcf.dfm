inherited FMenuPafEcf: TFMenuPafEcf
  Left = 386
  Top = 213
  Caption = 'Sistema PAF-ECF'
  PixelsPerInch = 96
  TextHeight = 14
  inherited StatusBar1: TStatusBar
    Panels = <
      item
        Bevel = pbNone
        Style = psOwnerDraw
        Width = 25
      end
      item
        Width = 300
      end
      item
        Width = 250
      end
      item
        Text = 'MENU FISCAL -> CTRL + ALT + F'
        Width = 100
      end>
  end
  inherited MMCadSimples: TMainMenu
    object Manuteno1: TMenuItem [0]
      Caption = '&Manuten'#231#227'o'
      object MenuFiscal1: TMenuItem
        Caption = 'Menu &Fiscal'
        OnClick = MenuFiscal1Click
      end
      object CupomFiscal1: TMenuItem
        Caption = '&Cupom Fiscal'
        OnClick = CupomFiscal1Click
      end
      object ConsultadeProduto1: TMenuItem
        Caption = 'Consulta de &Produto'
        OnClick = ConsultadeProduto1Click
      end
      object RecebimentodeTtulo1: TMenuItem
        Caption = '&Recebimento de T'#237'tulo'
        OnClick = RecebimentodeTtulo1Click
      end
    end
    inherited Opes1: TMenuItem
      Enabled = False
      Visible = False
      inherited TrocaLogin1: TMenuItem
        Enabled = False
        Visible = False
      end
      inherited MonitorSistema1: TMenuItem
        Enabled = False
        Visible = False
      end
    end
  end
  object ActionList1: TActionList
    Left = 232
    Top = 8
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 49222
      OnExecute = Action1Execute
    end
  end
end
