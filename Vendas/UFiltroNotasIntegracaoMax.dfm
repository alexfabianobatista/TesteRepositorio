inherited FFiltroNotasIntegraMax: TFFiltroNotasIntegraMax
  Left = 68
  Top = 123
  Width = 1303
  Height = 562
  Caption = 'Notas a exportar'
  OldCreateOrder = True
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 20
  inherited LblNumRegistros: TLabel
    Top = 441
  end
  inherited Label1: TLabel
    Top = 75
    Width = 226
    Caption = 'Registros que ser'#227'o exportados'
  end
  inherited Label2: TLabel
    Left = 1049
    Top = 442
  end
  inherited DBTValorTotal: TDBText
    Left = 1172
    Top = 440
  end
  object Label59: TLabel [4]
    Left = 448
    Top = 18
    Width = 82
    Height = 20
    Caption = 'Embarques'
  end
  object SBEmbarque: TSpeedButton [5]
    Left = 644
    Top = 40
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
  object Label7: TLabel [6]
    Left = 686
    Top = 20
    Width = 50
    Height = 20
    Caption = 'Cidade'
  end
  object SBCidade: TSpeedButton [7]
    Left = 918
    Top = 40
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
  object Label3: TLabel [8]
    Left = 113
    Top = 19
    Width = 25
    Height = 20
    Caption = 'At'#233
  end
  object Label4: TLabel [9]
    Left = 9
    Top = 19
    Width = 21
    Height = 20
    Caption = 'De'
  end
  object Label5: TLabel [10]
    Left = 215
    Top = 18
    Width = 57
    Height = 20
    Caption = 'Pedidos'
  end
  object SBPedidos: TSpeedButton [11]
    Left = 411
    Top = 40
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
    OnClick = SBPedidosClick
  end
  inherited DBGFiltro: TDBGrid
    Top = 96
    Width = 1273
    Height = 337
    TabOrder = 6
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
        Width = 503
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_CIDADE'
        Title.Caption = 'Cidade'
        Width = 234
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_NOTA'
        Title.Caption = 'Nota'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_EMISSAO'
        Title.Caption = 'Emiss'#227'o'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_PEDIDO'
        Title.Caption = 'Pedido'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_EMBARQUE'
        Title.Caption = 'Embarque'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SVAL_TOTAL'
        Title.Caption = 'Valor'
        Width = 100
        Visible = True
      end>
  end
  inherited BtCancela: TBitBtn
    Left = 1075
    Top = 473
    TabOrder = 7
  end
  inherited BtOk: TBitBtn
    Left = 1178
    Top = 473
    TabOrder = 8
  end
  object MeEmbarque: TMaskEdit [15]
    Left = 449
    Top = 40
    Width = 193
    Height = 28
    TabOrder = 3
  end
  object EdCidade: TEdit [16]
    Left = 684
    Top = 40
    Width = 232
    Height = 28
    TabOrder = 4
    OnKeyPress = EdCidadeKeyPress
  end
  object BtProcurar: TBitBtn [17]
    Left = 1073
    Top = 40
    Width = 207
    Height = 49
    Hint = 'Procurar'
    Anchors = [akTop, akRight]
    Caption = '&Procurar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
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
  object MEDtFinal: TMaskEdit [18]
    Left = 112
    Top = 40
    Width = 96
    Height = 28
    EditMask = '!99/99/00##;1;_'
    MaxLength = 10
    TabOrder = 1
    Text = '  /  /    '
  end
  object MEDtInicial: TMaskEdit [19]
    Left = 8
    Top = 40
    Width = 97
    Height = 28
    EditMask = '!99/99/00##;1;_'
    MaxLength = 10
    TabOrder = 0
    Text = '  /  /    '
  end
  object MePedidos: TMaskEdit [20]
    Left = 216
    Top = 40
    Width = 193
    Height = 28
    TabOrder = 2
  end
  inherited CbSelectAll: TCheckBox
    Top = 102
    TabOrder = 9
  end
  inherited DSPFiltroRelatorio: TDataSetProvider
    DataSet = DMNotaSaida.QNotasIntegracaoMax
  end
  inherited CDSFiltroRelatorio: TClientDataSet
    Params = <
      item
        DataType = ftDate
        Name = 'DT_INICIAL'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_FINAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CADASTRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUM_NOTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOTA_CAB'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EMBARQUES'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PEDIDOS'
        ParamType = ptInput
      end>
    OnCalcFields = CDSFiltroRelatorioCalcFields
    object CDSFiltroRelatorioCOD_NOTA_CAB: TIntegerField [2]
      FieldName = 'COD_NOTA_CAB'
      Required = True
    end
    object CDSFiltroRelatorioNOME: TStringField [3]
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object CDSFiltroRelatorioDT_EMISSAO: TDateTimeField [4]
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object CDSFiltroRelatorioNUM_NOTA: TFloatField [5]
      FieldName = 'NUM_NOTA'
    end
    object CDSFiltroRelatorioCOD_FILIAL: TIntegerField [6]
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object CDSFiltroRelatorioNUM_PEDIDO: TIntegerField [7]
      FieldName = 'NUM_PEDIDO'
    end
    object CDSFiltroRelatorioSVAL_TOTAL: TFloatField [8]
      FieldName = 'SVAL_TOTAL'
      DisplayFormat = '###,###,##0.00'
    end
    object CDSFiltroRelatorioDESC_CIDADE: TStringField [9]
      FieldName = 'DESC_CIDADE'
      Size = 30
    end
    object CDSFiltroRelatorioCOD_EMBARQUE: TFloatField [10]
      FieldName = 'COD_EMBARQUE'
    end
  end
end
