inherited FOficinaOrcamentoCons: TFOficinaOrcamentoCons
  Left = 197
  Top = 104
  Width = 725
  Height = 544
  Caption = 'Consulta de Or'#231'amento'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Left = 312
    Width = 30
    Caption = 'Marca'
  end
  object SBMarcaCons: TSpeedButton [1]
    Left = 377
    Top = 24
    Width = 23
    Height = 22
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000010000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
      55555575555555775F55509999999901055557F55555557F75F5001111111101
      105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
      01105777F555557F75F75500FFFFFF0FF0105577F555FF7F57575550FF700008
      8F0055575FF7777555775555000888888F005555777FFFFFFF77555550000000
      0F055555577777777F7F555550FFFFFF0F05555557F5FFF57F7F555550F000FF
      0005555557F777557775555550FFFFFF0555555557F555FF7F55555550FF7000
      05555555575FF777755555555500055555555555557775555555}
    NumGlyphs = 2
    OnClick = SBMarcaConsClick
  end
  inherited BtOk: TBitBtn
    Left = 628
    Top = 435
    TabOrder = 7
  end
  inherited BtCancela: TBitBtn
    Left = 628
    Top = 475
    TabOrder = 8
  end
  inherited BtProcurar: TBitBtn
    Left = 628
    TabOrder = 4
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Left = 312
    Width = 65
    TabOrder = 1
    Text = ''
    OnExit = METextoExit
    OnKeyPress = METextoKeyPress
  end
  inherited DBGrid1: TDBGrid
    Top = 120
    Width = 700
    Height = 249
    TabOrder = 6
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_OFICINA_ORCAMENTO_CAB'
        Title.Caption = 'C'#243'digo'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_CADASTRO'
        Title.Caption = 'Cliente'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Cliente'
        Width = 213
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_MARCA'
        Title.Caption = 'Marca'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DESC_MARCA'
        Title.Caption = 'Marca'
        Width = 186
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_SERVICO'
        Title.Caption = 'Servi'#231'o'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NUM_PLACA'
        Title.Caption = 'Ve'#237'culo'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_ORCAMENTO'
        Title.Caption = 'Data'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_FILIAL'
        Title.Caption = 'Filial'
        Width = 138
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid [7]
    Left = 8
    Top = 384
    Width = 609
    Height = 120
    Anchors = [akLeft, akRight, akBottom]
    DataSource = DSItens
    TabOrder = 9
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_OFICINA_ORCAMENTO_ITEM'
        Title.Caption = 'C'#243'digo'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_OFICINA_ORCAMENTO_CAB'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'COD_PRODUTO'
        Title.Caption = 'Produto'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DESC_PRODUTO'
        Title.Caption = 'Produto'
        Width = 171
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_COMPLEMENTO'
        Title.Caption = 'Complemento'
        Width = 137
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QT_QUANTIDADE'
        Title.Caption = 'Quantidade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_UNITARIO'
        Title.Caption = 'Vlr Unitario'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_TOTAL'
        Title.Caption = 'Vlr Total'
        Width = 72
        Visible = True
      end>
  end
  inline FmCadastro: TFmCadastro [8]
    Left = 8
    Top = 8
    Width = 265
    Height = 41
    TabOrder = 0
    TabStop = True
    inherited Label1: TLabel
      Width = 32
      Height = 14
      Caption = 'Cliente'
    end
    inherited MeCadastro: TMaskEdit
      Height = 22
    end
    inherited EdCadastro: TEdit
      Height = 22
    end
  end
  inline FmFilial: TFmFilial
    Left = 240
    Top = 64
    Width = 265
    Height = 41
    TabOrder = 3
    inherited Label1: TLabel
      Height = 14
    end
    inherited MeFilial: TMaskEdit
      Height = 22
    end
    inherited EdFilial: TEdit
      Height = 22
    end
  end
  inline FmDatas: TFmDatas
    Left = 8
    Top = 56
    Width = 177
    Height = 57
    TabOrder = 2
    inherited GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 177
      inherited Label1: TLabel
        Width = 26
        Height = 14
      end
      inherited Label2: TLabel
        Height = 14
      end
      inherited MeDtInicial: TMaskEdit
        Height = 22
      end
      inherited MeDtFinal: TMaskEdit
        Height = 22
      end
    end
  end
  object MEDescMarca: TMaskEdit
    Left = 400
    Top = 24
    Width = 161
    Height = 22
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 5
  end
  inherited DSConsulta: TDataSource
    DataSet = DMOficina.QOficinaOrcamentoCons
    Left = 600
    Top = 304
  end
  object DSItens: TDataSource
    DataSet = DMOficina.QOficinaOrcamentoItemCons
    Left = 640
    Top = 304
  end
end
