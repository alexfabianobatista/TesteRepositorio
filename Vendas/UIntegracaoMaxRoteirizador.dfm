object FIntegracaoMaxRoteirizador: TFIntegracaoMaxRoteirizador
  Left = 413
  Top = 173
  Width = 735
  Height = 507
  Caption = 'Exporta'#231#227'o Max Roterizador e SIG SISTEM'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 20
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 719
    Height = 468
    Align = alClient
    TabOrder = 0
    DesignSize = (
      719
      468)
    object GBExportar: TGroupBox
      Left = 16
      Top = 3
      Width = 687
      Height = 458
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'Exportar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object GroupBox2: TGroupBox
        Left = 8
        Top = 242
        Width = 657
        Height = 193
        Caption = 'SIG SISTEM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object BitBtn1: TBitBtn
          Left = 8
          Top = 80
          Width = 633
          Height = 41
          Caption = 'Fornecedores'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = BitBtn1Click
        end
        object BitBtn2: TBitBtn
          Left = 8
          Top = 24
          Width = 633
          Height = 41
          Caption = 'Clientes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = BitBtn2Click
        end
        object BitBtn3: TBitBtn
          Left = 8
          Top = 136
          Width = 633
          Height = 41
          Caption = 'Usu'#225'rios'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = BitBtn3Click
        end
      end
      object GroupBox3: TGroupBox
        Left = 8
        Top = 32
        Width = 657
        Height = 114
        Caption = 'M'#225'xima'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        DesignSize = (
          657
          114)
        object BTExportarPedidos: TBitBtn
          Left = 8
          Top = 28
          Width = 642
          Height = 31
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Pedidos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = BTExportarPedidosClick
        end
        object BTExportarNotas: TBitBtn
          Left = 8
          Top = 73
          Width = 642
          Height = 31
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Notas Fiscais'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = BTExportarNotasClick
        end
        object BTExportarAuxiliares: TBitBtn
          Left = 8
          Top = 113
          Width = 642
          Height = 32
          Anchors = [akLeft, akTop, akRight]
          Caption = 
            'Clientes, Cidades, Regi'#245'es, Ve'#237'culos, Vendedores, Filiais, Ativi' +
            'dades, Produtos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Visible = False
          OnClick = BTExportarAuxiliaresClick
        end
      end
    end
    object GroupBox1: TGroupBox
      Left = 24
      Top = 152
      Width = 657
      Height = 89
      Caption = 'Importar'
      TabOrder = 1
      Visible = False
      DesignSize = (
        657
        89)
      object BTImportarRetorno: TBitBtn
        Left = 8
        Top = 31
        Width = 638
        Height = 31
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Embarques'
        TabOrder = 0
        OnClick = BTImportarRetornoClick
      end
    end
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'csv'
    Filter = 'Arquivo CSV'
    InitialDir = 'c:\'
    Left = 496
    Top = 16
  end
end
