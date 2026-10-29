inherited FControleBaixa: TFControleBaixa
  Left = 388
  Top = 130
  Caption = 'Controle de Baixas'
  ClientHeight = 544
  ClientWidth = 703
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel [0]
    Left = 12
    Top = 66
    Width = 131
    Height = 14
    Caption = 'Chapa '#224' Baixar do Estoque'
  end
  object Label2: TLabel [1]
    Left = 266
    Top = 65
    Width = 21
    Height = 14
    Caption = 'Lote'
  end
  object Label3: TLabel [2]
    Left = 370
    Top = 65
    Width = 26
    Height = 14
    Caption = 'Qtde.'
  end
  object Label4: TLabel [3]
    Left = 12
    Top = 104
    Width = 60
    Height = 14
    Caption = 'Chapa Inicial'
  end
  object Label5: TLabel [4]
    Left = 88
    Top = 104
    Width = 56
    Height = 14
    Caption = 'Chapa Final'
  end
  object Label6: TLabel [5]
    Left = 165
    Top = 104
    Width = 35
    Height = 14
    Caption = 'C'#225'lculo'
  end
  inherited Panel1: TPanel
    Width = 703
    Enabled = False
    TabOrder = 10
    Visible = False
  end
  inherited StBLongHint: TStatusBar
    Top = 525
    Width = 703
  end
  object DBGrid1: TDBGrid [8]
    Left = 8
    Top = 155
    Width = 673
    Height = 366
    DataSource = DSPrimario
    TabOrder = 12
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_PRODUTO'
        Title.Caption = 'C'#243'd.Produto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_PRODUTO'
        Title.Caption = 'Produto'
        Width = 280
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_LOTE_TIPO'
        Title.Caption = 'C'#243'd.Lote'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_LOTE'
        Title.Caption = 'Lote'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QT_QUANTIDADE'
        Title.Caption = 'Qtde'
        Visible = True
      end>
  end
  inline FmProduto1: TFmProduto [9]
    Left = 12
    Top = 19
    Width = 421
    Height = 37
    TabOrder = 0
    inherited Label1: TLabel
      Height = 14
    end
    inherited MeProduto: TMaskEdit
      Height = 22
      OnExit = FmProduto1MeProdutoExit
    end
    inherited EdProduto: TEdit
      Width = 345
      Height = 22
    end
  end
  object MeCodChapa: TMaskEdit [10]
    Left = 12
    Top = 81
    Width = 64
    Height = 22
    TabOrder = 1
    OnExit = MeCodChapaExit
  end
  object EdChapa: TEdit [11]
    Left = 77
    Top = 81
    Width = 177
    Height = 22
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 2
  end
  object MELote: TMaskEdit [12]
    Left = 266
    Top = 81
    Width = 87
    Height = 22
    TabOrder = 3
  end
  object MEQtde: TMaskEdit [13]
    Left = 370
    Top = 81
    Width = 63
    Height = 22
    TabOrder = 4
  end
  object BtBaixar: TBitBtn [14]
    Left = 392
    Top = 120
    Width = 153
    Height = 25
    Caption = 'Baixar e Rastrear Estoque'
    TabOrder = 9
    OnClick = BtBaixarClick
  end
  object MeChapaInicial: TMaskEdit [15]
    Left = 12
    Top = 120
    Width = 62
    Height = 22
    TabOrder = 5
  end
  object MeChapaFinal: TMaskEdit [16]
    Left = 88
    Top = 120
    Width = 62
    Height = 22
    TabOrder = 6
  end
  object MeCalculo: TMaskEdit [17]
    Left = 165
    Top = 120
    Width = 132
    Height = 22
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 7
  end
  object BtCalculo: TBitBtn [18]
    Left = 302
    Top = 119
    Width = 59
    Height = 25
    Caption = 'C'#225'lculo'
    TabOrder = 8
    OnClick = BtCalculoClick
  end
  inherited MMCadSimples: TMainMenu [19]
    inherited Manuteno1: TMenuItem
      Visible = False
    end
    inherited Relatrios1: TMenuItem
      object ConsultaRastreamento1: TMenuItem
        Caption = 'Consulta Rastreamento'
        OnClick = ConsultaRastreamento1Click
      end
      object RelatriodeRastreamento1: TMenuItem
        Caption = 'Relat'#243'rio de Rastreamento'
        OnClick = RelatriodeRastreamento1Click
      end
    end
  end
  inherited DSPrimario: TDataSource [20]
    DataSet = DmVidracaria.QControleBaixa
  end
  inherited ILBotao: TImageList [21]
  end
  inherited ALCadastro: TActionList [22]
  end
  object CdChapa: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 616
    Top = 80
    Data = {
      4B0000009619E0BD0100000018000000020000000000030000004B000A444553
      435F4348415041010049000000010005574944544802000200140009434F445F
      434841504104000100000000000000}
    object CdChapaDESC_CHAPA: TStringField
      FieldName = 'DESC_CHAPA'
    end
    object CdChapaCOD_CHAPA: TIntegerField
      FieldName = 'COD_CHAPA'
    end
  end
  object DsChapa: TDataSource
    DataSet = CdChapa
    Left = 616
    Top = 112
  end
  object DsPeca: TDataSource
    DataSet = CdPeca
    Left = 648
    Top = 112
  end
  object CdPeca: TClientDataSet
    Active = True
    Aggregates = <>
    IndexFieldNames = 'COD_CHAPA'
    MasterFields = 'COD_CHAPA'
    MasterSource = DsChapa
    PacketRecords = 0
    Params = <>
    Left = 648
    Top = 80
    Data = {
      3D0000009619E0BD0100000018000000020000000000030000003D0009434F44
      5F4348415041040001000000000008434F445F50454341040001000000000000
      00}
    object CdPecaCOD_CHAPA: TIntegerField
      FieldName = 'COD_CHAPA'
    end
    object CdPecaCOD_PECA: TIntegerField
      FieldName = 'COD_PECA'
    end
  end
  object OdArquivo: TOpenDialog
    Left = 648
    Top = 48
  end
  object dsCHAPA2: TDataSource
    DataSet = DmVidracaria.QRastreamento
    Left = 534
    Top = 78
  end
end
