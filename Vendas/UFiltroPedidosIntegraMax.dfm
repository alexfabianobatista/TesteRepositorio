inherited FFiltroPedidosIntegraMax: TFFiltroPedidosIntegraMax
  Left = 26
  Top = 130
  Width = 1347
  Caption = 'Pedidos a exportar'
  OldCreateOrder = True
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 20
  inherited Label1: TLabel
    Top = 61
    Width = 226
    Caption = 'Registros que ser'#227'o exportados'
  end
  inherited Label2: TLabel
    Left = 1093
  end
  inherited DBTValorTotal: TDBText
    Left = 1216
  end
  object Label3: TLabel [4]
    Left = 113
    Top = 11
    Width = 25
    Height = 20
    Caption = 'At'#233
  end
  object Label4: TLabel [5]
    Left = 9
    Top = 11
    Width = 21
    Height = 20
    Caption = 'De'
  end
  object Label7: TLabel [6]
    Left = 222
    Top = 12
    Width = 50
    Height = 20
    Caption = 'Cidade'
  end
  object SBCidade: TSpeedButton [7]
    Left = 454
    Top = 32
    Width = 30
    Height = 27
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
    OnClick = SBCidadeClick
  end
  object SBEmbarque: TSpeedButton [8]
    Left = 749
    Top = 32
    Width = 30
    Height = 27
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
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
    OnClick = SBEmbarqueClick
  end
  object Label59: TLabel [9]
    Left = 488
    Top = 10
    Width = 82
    Height = 20
    Caption = 'Embarques'
  end
  inherited DBGFiltro: TDBGrid
    Top = 83
    Width = 1316
    Height = 331
    TabOrder = 5
    Columns = <
      item
        Expanded = False
        FieldName = 'IND_SELECIONADO'
        Title.Caption = ' '
        Width = 27
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Cliente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_CIDADE'
        Title.Caption = 'Cidade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_PEDIDO'
        Title.Caption = 'Pedido'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_EMISSAO'
        Title.Caption = 'Emiss'#227'o'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_EMBARQUE'
        Title.Caption = 'Embarque'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_FILIAL'
        Title.Caption = 'Filial'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SVAL_TOTAL'
        Title.Caption = 'Valor'
        Width = 121
        Visible = True
      end>
  end
  inherited BtCancela: TBitBtn
    Left = 1119
    TabOrder = 6
  end
  inherited BtOk: TBitBtn
    Left = 1222
    TabOrder = 7
  end
  inherited CbSelectAll: TCheckBox
    Top = 88
    TabOrder = 8
  end
  object MEDtFinal: TMaskEdit [14]
    Left = 112
    Top = 32
    Width = 96
    Height = 28
    EditMask = '!99/99/00##;1;_'
    MaxLength = 10
    TabOrder = 1
    Text = '  /  /    '
  end
  object MEDtInicial: TMaskEdit [15]
    Left = 8
    Top = 32
    Width = 97
    Height = 28
    EditMask = '!99/99/00##;1;_'
    MaxLength = 10
    TabOrder = 0
    Text = '  /  /    '
  end
  object BtProcurar: TBitBtn [16]
    Left = 1116
    Top = 24
    Width = 207
    Height = 49
    Hint = 'Procurar'
    Anchors = [akTop, akRight]
    Caption = '&Procurar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = BtProcurarClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000010000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33333333333333333333333333333333333333333333333333FF333333333333
      3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
      E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
      E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
      E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
      000033333373FF77777733333330003333333333333777333333333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
  end
  object EdCidade: TEdit [17]
    Left = 220
    Top = 32
    Width = 232
    Height = 28
    TabOrder = 2
    OnKeyPress = EdCidadeKeyPress
  end
  object MeEmbarque: TMaskEdit [18]
    Left = 489
    Top = 32
    Width = 256
    Height = 28
    TabOrder = 3
  end
  inherited DSPFiltroRelatorio: TDataSetProvider
    DataSet = DMPedido.QPedidosIntegraMax
  end
  inherited CDSFiltroRelatorio: TClientDataSet
    Params = <
      item
        DataType = ftInteger
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CADASTRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUM_PEDIDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COD_DEPARTAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IND_SITUACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COD_CIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COD_VENDEDOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DESC_CHASSI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NUM_PLACA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA_I'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PEDIDO_CAB'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'INTEGRACAO_MAX'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA_F'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ATENDIDOS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EMBARQUES'
        ParamType = ptInput
      end>
    OnCalcFields = CDSFiltroRelatorioCalcFields
    object CDSFiltroRelatorioCOD_PEDIDO_CAB: TIntegerField [2]
      FieldName = 'COD_PEDIDO_CAB'
      Required = True
    end
    object CDSFiltroRelatorioCOD_FILIAL: TIntegerField [3]
      FieldName = 'COD_FILIAL'
    end
    object CDSFiltroRelatorioNUM_PEDIDO: TIntegerField [4]
      FieldName = 'NUM_PEDIDO'
    end
    object CDSFiltroRelatorioDT_EMISSAO: TDateTimeField [5]
      FieldName = 'DT_EMISSAO'
    end
    object CDSFiltroRelatorioNOME: TStringField [6]
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object CDSFiltroRelatorioSVAL_TOTAL: TFloatField [7]
      FieldName = 'SVAL_TOTAL'
      DisplayFormat = '###,###,##0.00'
    end
    object CDSFiltroRelatorioDESC_CIDADE: TStringField [8]
      FieldName = 'DESC_CIDADE'
      Size = 30
    end
    object CDSFiltroRelatorioCOD_EMBARQUE: TIntegerField [9]
      FieldName = 'COD_EMBARQUE'
    end
  end
end
