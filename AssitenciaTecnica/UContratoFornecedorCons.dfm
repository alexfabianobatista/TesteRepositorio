inherited FContratoFornecedorCons: TFContratoFornecedorCons
  Left = 353
  Top = 206
  Width = 676
  Height = 462
  Caption = 'Consulta Contrato de Fornecedores'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Width = 20
    Caption = 'Filial'
  end
  inherited LblNumRegistros: TLabel
    Top = 321
  end
  inherited BtOk: TBitBtn
    Left = 302
    Top = 395
  end
  inherited BtCancela: TBitBtn
    Left = 462
    Top = 395
  end
  inherited BtProcurar: TBitBtn
    Left = 575
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Width = 48
    EditMask = '######'
    MaxLength = 6
    Text = '      '
  end
  object BtConsFilial: TBitBtn [6]
    Left = 59
    Top = 24
    Width = 25
    Height = 23
    TabOrder = 5
    TabStop = False
    OnClick = BtConsFilialClick
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
  end
  inherited DBGrid1: TDBGrid
    Top = 65
    Width = 652
    Height = 323
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_CONTRATO_FORNECEDOR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_FILIAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_MENSALIDADE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_DIA_VENCTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_SITUACAO'
        Visible = True
      end>
  end
  inherited DSConsulta: TDataSource
    DataSet = DMOrdemServico.QContratoFornecedorCons
    Left = 352
    Top = 0
  end
end
