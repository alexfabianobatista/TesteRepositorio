inherited FControleViagemCons: TFControleViagemCons
  Left = 440
  Top = 199
  Width = 609
  Height = 369
  Caption = 'FControleViagemCons'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Width = 35
    Caption = 'Veiculo'
  end
  object SBVeiculoCons: TSpeedButton [1]
    Left = 100
    Top = 24
    Width = 23
    Height = 22
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
    OnClick = SBVeiculoConsClick
  end
  object SBMotoristaCons: TSpeedButton [2]
    Left = 196
    Top = 24
    Width = 23
    Height = 22
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
    OnClick = SBMotoristaConsClick
  end
  inherited LblNumRegistros: TLabel
    Top = 298
  end
  object Label2: TLabel [4]
    Left = 128
    Top = 8
    Width = 44
    Height = 14
    Caption = 'Motorista'
  end
  object Label3: TLabel [5]
    Left = 312
    Top = 8
    Width = 26
    Height = 14
    Caption = 'Inicial'
  end
  object Label4: TLabel [6]
    Left = 384
    Top = 8
    Width = 22
    Height = 14
    Caption = 'Final'
  end
  inherited BtOk: TBitBtn
    Left = 208
    Top = 301
  end
  inherited BtCancela: TBitBtn
    Left = 368
    Top = 301
  end
  inherited BtProcurar: TBitBtn
    Left = 496
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Left = 597
    Top = 89
    Width = 17
    Visible = False
  end
  object EdVeiculoCons: TEdit [11]
    Left = 8
    Top = 24
    Width = 89
    Height = 22
    TabOrder = 5
  end
  object MeMotoristaCons: TMaskEdit [12]
    Left = 128
    Top = 24
    Width = 65
    Height = 22
    TabOrder = 6
    OnExit = MeMotoristaConsExit
  end
  object EdMotoristaCons: TEdit [13]
    Left = 223
    Top = 24
    Width = 81
    Height = 22
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 7
  end
  inherited DBGrid1: TDBGrid
    Width = 577
    Height = 233
    Columns = <
      item
        Expanded = False
        FieldName = 'DESC_DESTINO'
        Title.Caption = 'Destino'
        Width = 163
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_PLACA'
        Title.Caption = 'Placa'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_SAIDA'
        Title.Caption = 'Saida'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_CHEGADA'
        Title.Caption = 'Chegada'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_CUSTO_KM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_COMBUSTIVEL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_REFEICAO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QT_COMBUSTIVEL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_CHAPA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_PEDAGIO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_DIVERSOS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_MANUTENCAO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_SALARIO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_SEGURO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_COMBUSTIVEL_CAMARA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_OBS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QT_PESO_CLIENTE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_CLIENTE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QT_PESO_DISTRIBUIDOR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_DISTRIBUIDOR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QT_PESO_OUTRO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_OUTRO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_DIVERSOS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QT_KM_SAIDA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_CONTROLE_VIAGEM_CAB'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QT_KM_CHEGADA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QT_KM_ENTRE_ENTREGAS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_RETORNO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QT_PESO_RETORNO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_RETORNO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_BRUTO_RETORNO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_MOTORISTA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_COMISSAO_RETORNO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_SAIDA_RETORNO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_CHEGADA_RETORNO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PERC_COMISSAO_CLIENTE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_ENTREGA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_VEICULO'
        Visible = True
      end>
  end
  object MeDtInicial: TMaskEdit [15]
    Left = 312
    Top = 24
    Width = 64
    Height = 22
    EditMask = '!99/99/##00;1;_'
    MaxLength = 10
    TabOrder = 8
    Text = '  /  /    '
  end
  object MeDtFinal: TMaskEdit [16]
    Left = 384
    Top = 24
    Width = 65
    Height = 22
    EditMask = '!99/99/##00;1;_'
    MaxLength = 10
    TabOrder = 9
    Text = '  /  /    '
  end
  inherited DSConsulta: TDataSource
    DataSet = DMConhecimento.QControleViagemCons
    Left = 456
  end
  inherited PopupMenu1: TPopupMenu
    Left = 496
  end
end
