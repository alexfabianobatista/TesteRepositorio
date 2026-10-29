object FIntegracaoMGMobile: TFIntegracaoMGMobile
  Left = 283
  Top = 117
  Width = 425
  Height = 237
  Caption = 'Integra'#231#227'o MGMobile'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 409
    Height = 198
    Align = alClient
    TabOrder = 0
    object GBExportar: TGroupBox
      Left = 16
      Top = 8
      Width = 185
      Height = 169
      Caption = 'Exportar'
      TabOrder = 0
      object BTExportarClientes: TBitBtn
        Left = 22
        Top = 29
        Width = 139
        Height = 25
        Caption = 'Clientes'
        TabOrder = 0
        OnClick = BTExportarClientesClick
      end
      object BTExportarProdutos: TBitBtn
        Left = 22
        Top = 61
        Width = 139
        Height = 25
        Caption = 'Produtos'
        TabOrder = 1
        OnClick = BTExportarProdutosClick
      end
      object BTExportarDuplicatas: TBitBtn
        Left = 22
        Top = 93
        Width = 139
        Height = 25
        Caption = 'Duplicatas'
        TabOrder = 2
        OnClick = BTExportarDuplicatasClick
      end
      object BTExportarPrazos: TBitBtn
        Left = 22
        Top = 125
        Width = 139
        Height = 25
        Caption = 'Condi'#231#245'es de Pagamento'
        TabOrder = 3
        OnClick = BTExportarPrazosClick
      end
    end
    object GBImportar: TGroupBox
      Left = 210
      Top = 8
      Width = 185
      Height = 169
      Caption = 'Importar'
      TabOrder = 1
      object BTImportarPedidos: TBitBtn
        Left = 22
        Top = 29
        Width = 139
        Height = 25
        Caption = 'Pedidos'
        TabOrder = 0
        OnClick = BTImportarPedidosClick
      end
      object BTImportarClientes: TBitBtn
        Left = 22
        Top = 61
        Width = 139
        Height = 25
        Caption = 'Clientes'
        TabOrder = 1
        OnClick = BTImportarClientesClick
      end
    end
  end
end
