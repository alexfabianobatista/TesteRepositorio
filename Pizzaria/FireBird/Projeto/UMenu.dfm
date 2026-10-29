object FMenu: TFMenu
  Left = 217
  Top = 62
  Width = 870
  Height = 500
  Caption = 'LocaCar'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 862
    Height = 427
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 0
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 427
    Width = 862
    Height = 19
    Panels = <>
  end
  object MainMenu1: TMainMenu
    Left = 424
    Top = 240
    object C1: TMenuItem
      Caption = 'Cadastros'
      object Clientes1: TMenuItem
        Caption = 'Cliente'
        OnClick = Clientes1Click
      end
      object Endereos1: TMenuItem
        Caption = 'Endere'#231'o'
        OnClick = Endereos1Click
      end
      object Bairro1: TMenuItem
        Caption = 'Bairro'
        OnClick = Bairro1Click
      end
      object Cidade1: TMenuItem
        Caption = 'Cidade'
        OnClick = Cidade1Click
      end
      object Estado1: TMenuItem
        Caption = 'Estado'
        OnClick = Estado1Click
      end
      object Cor1: TMenuItem
        Caption = 'Cor'
        OnClick = Cor1Click
      end
      object Marca1: TMenuItem
        Caption = 'Marca'
        OnClick = Marca1Click
      end
      object Veculo1: TMenuItem
        Caption = 'Ve'#237'culo'
        OnClick = Veculo1Click
      end
      object Vendedor1: TMenuItem
        Caption = 'Vendedor'
        OnClick = Vendedor1Click
      end
    end
    object Movimentao1: TMenuItem
      Caption = 'Movimenta'#231#227'o'
      object Compra1: TMenuItem
        Caption = 'Compra'
        OnClick = Compra1Click
      end
      object Venda1: TMenuItem
        Caption = 'Venda'
        OnClick = Venda1Click
      end
    end
    object Consultas1: TMenuItem
      Caption = 'Consultas'
      object Clientes2: TMenuItem
        Caption = 'Clientes'
        OnClick = Clientes2Click
      end
      object Veculos1: TMenuItem
        Caption = 'Ve'#237'culos'
        OnClick = Veculos1Click
      end
      object Funcionrios1: TMenuItem
        Caption = 'Vendedores'
        OnClick = Funcionrios1Click
      end
      object Vendas1: TMenuItem
        Caption = 'Vendas'
        OnClick = Vendas1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Clientesquemaiscompraram1: TMenuItem
        Caption = 'Clientes que Mais Compraram'
        OnClick = Clientesquemaiscompraram1Click
      end
      object ClientesqueCompraramemDeterminadoMs1: TMenuItem
        Caption = 'Clientes que Compraram em Determinado M'#234's'
        OnClick = ClientesqueCompraramemDeterminadoMs1Click
      end
      object ClientescomCompraeVenda1: TMenuItem
        Caption = 'Clientes com Compra e Venda'
        OnClick = ClientescomCompraeVenda1Click
      end
      object VeculosCompradoseVendidosnoMesmoMs1: TMenuItem
        Caption = 'Ve'#237'culos Comprados e Vendidos no Mesmo M'#234's'
        OnClick = VeculosCompradoseVendidosnoMesmoMs1Click
      end
      object VeculosporCliente1: TMenuItem
        Caption = 'Vendas por Cliente'
        OnClick = VeculosporCliente1Click
      end
      object Comisses1: TMenuItem
        Caption = 'Vendas e Comiss'#245'es por Vendedor'
        OnClick = Comisses1Click
      end
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
      OnClick = Sair1Click
    end
  end
end
