object FMenu: TFMenu
  Left = 242
  Top = 159
  Width = 714
  Height = 462
  Caption = 'Sistema de Pizzaria'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 706
    Height = 397
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 0
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 397
    Width = 706
    Height = 19
    Panels = <>
  end
  object MainMenu1: TMainMenu
    Left = 424
    Top = 240
    object C1: TMenuItem
      Caption = 'Cadastros'
      object Clientes1: TMenuItem
        Caption = 'Clientes'
        OnClick = Clientes1Click
      end
      object Operadores1: TMenuItem
        Caption = 'Operadores'
        OnClick = Operadores1Click
      end
      object iposdeProdutos1: TMenuItem
        Caption = 'Tipos de Produtos'
        OnClick = iposdeProdutos1Click
      end
      object r6d4t6s1: TMenuItem
        Caption = 'Produtos'
        OnClick = r6d4t6s1Click
      end
      object Sabores1: TMenuItem
        Caption = 'Sabores'
        OnClick = Sabores1Click
      end
    end
    object Movimentao1: TMenuItem
      Caption = 'Movimenta'#231#227'o'
      object Venda1: TMenuItem
        Caption = 'Venda'
        OnClick = Venda1Click
      end
    end
    object Consultas1: TMenuItem
      Caption = 'Consultas'
      object Vendas1: TMenuItem
        Caption = 'Vendas'
        OnClick = Vendas1Click
      end
    end
    object Configurao1: TMenuItem
      Caption = 'Configura'#231#227'o'
      object ParmetrosdoSistema1: TMenuItem
        Caption = 'Par'#226'metros do Sistema'
        OnClick = ParmetrosdoSistema1Click
      end
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
      OnClick = Sair1Click
    end
  end
end
