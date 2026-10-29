inherited FSuporteCons: TFSuporteCons
  Left = 335
  Top = 230
  Width = 853
  Height = 418
  Caption = 'Consulta de Suporte'
  DesignSize = (
    837
    379)
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Caption = 'Cliente'
  end
  inherited LblNumRegistros: TLabel
    Top = 348
  end
  object Label2: TLabel [2]
    Left = 88
    Top = 8
    Width = 39
    Height = 14
    Caption = 'Analista'
  end
  object Label3: TLabel [3]
    Left = 166
    Top = 8
    Width = 34
    Height = 14
    Caption = 'M'#243'dulo'
  end
  object Label4: TLabel [4]
    Left = 278
    Top = 8
    Width = 19
    Height = 14
    Caption = 'Tela'
  end
  object Label5: TLabel [5]
    Left = 390
    Top = 8
    Width = 36
    Height = 14
    Caption = 'Fun'#231#227'o'
  end
  object Label6: TLabel [6]
    Left = 424
    Top = 48
    Width = 58
    Height = 14
    Caption = 'Abertura de'
  end
  object Label7: TLabel [7]
    Left = 497
    Top = 48
    Width = 17
    Height = 14
    Caption = 'At'#233
  end
  object Label8: TLabel [8]
    Left = 8
    Top = 48
    Width = 44
    Height = 14
    Caption = 'Problema'
  end
  object Label9: TLabel [9]
    Left = 257
    Top = 48
    Width = 61
    Height = 14
    Caption = 'Tipo Suporte'
  end
  object Label10: TLabel [10]
    Left = 566
    Top = 48
    Width = 74
    Height = 14
    Caption = 'Fechamento de'
  end
  object Label11: TLabel [11]
    Left = 644
    Top = 48
    Width = 17
    Height = 14
    Caption = 'At'#233
  end
  object Label12: TLabel [12]
    Left = 465
    Top = 9
    Width = 42
    Height = 14
    Caption = 'Situa'#231#227'o'
  end
  inherited BtOk: TBitBtn
    Left = 747
    Top = 347
    TabOrder = 18
  end
  inherited BtCancela: TBitBtn
    Left = 659
    Top = 347
    TabOrder = 19
  end
  inherited BtProcurar: TBitBtn
    Left = 712
    Top = 56
    Width = 117
    Height = 29
    TabOrder = 16
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Width = 45
    EditMask = '######'
    MaxLength = 6
    Text = '      '
    OnChange = METextoChange
  end
  inherited DBGrid1: TDBGrid
    Top = 96
    Width = 821
    Height = 246
    TabOrder = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'NOME_USUARIO'
        Title.Caption = 'Analista'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_CLIENTE'
        Title.Caption = 'Cliente'
        Width = 157
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_PROBLEMA'
        Title.Caption = 'Problema'
        Width = 218
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_SITUACAO'
        Title.Caption = 'Situa'#231#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_ABERTURA'
        Title.Caption = 'Abertura'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_FECHAMENTO'
        Title.Caption = 'Fechamento'
        Visible = True
      end>
  end
  object BtConsCadastro: TBitBtn [18]
    Left = 55
    Top = 23
    Width = 24
    Height = 24
    TabOrder = 1
    OnClick = BtConsCadastroClick
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
  end
  object MEAnalista: TMaskEdit [19]
    Left = 88
    Top = 24
    Width = 44
    Height = 22
    EditMask = '######'
    MaxLength = 6
    TabOrder = 2
    Text = '      '
    OnChange = MEAnalistaChange
  end
  object BTAnalista: TBitBtn [20]
    Left = 132
    Top = 23
    Width = 24
    Height = 24
    TabOrder = 3
    OnClick = BTAnalistaClick
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
  end
  object MEModulo: TMaskEdit [21]
    Left = 166
    Top = 24
    Width = 104
    Height = 22
    TabOrder = 4
    OnChange = MEModuloChange
  end
  object METela: TMaskEdit [22]
    Left = 278
    Top = 24
    Width = 104
    Height = 22
    TabOrder = 5
    OnChange = METelaChange
  end
  object BTFuncao: TBitBtn [23]
    Left = 434
    Top = 23
    Width = 23
    Height = 24
    TabOrder = 7
    OnClick = BTFuncaoClick
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
  end
  object MEFuncao: TMaskEdit [24]
    Left = 390
    Top = 24
    Width = 44
    Height = 22
    EditMask = '######'
    MaxLength = 6
    TabOrder = 6
    Text = '      '
    OnChange = MEFuncaoChange
  end
  object MEDtInicial: TMaskEdit [25]
    Left = 424
    Top = 64
    Width = 64
    Height = 22
    EditMask = '!99/99/00##;1;_'
    MaxLength = 10
    TabOrder = 12
    Text = '  /  /    '
  end
  object MEDtFinal: TMaskEdit [26]
    Left = 494
    Top = 64
    Width = 64
    Height = 22
    EditMask = '!99/99/00##;1;_'
    MaxLength = 10
    TabOrder = 13
    Text = '  /  /    '
  end
  object MEProblema: TMaskEdit [27]
    Left = 8
    Top = 64
    Width = 241
    Height = 22
    TabOrder = 10
    OnChange = MEProblemaChange
  end
  object CBTipoSuporte: TComboBox [28]
    Left = 257
    Top = 64
    Width = 161
    Height = 22
    ItemHeight = 14
    TabOrder = 11
    OnChange = CBTipoSuporteChange
    Items.Strings = (
      ''
      'Ajuda / Treinamento'
      'Problema do Sistema'
      'Problema no Banco de Dados'
      'Problema de Impress'#227'o'
      'Instala'#231#227'o Sistema'
      'Altera'#231#227'o de Funcionalidade'
      'Cria'#231#227'o de Funcionalidade'
      'Homologa'#231#227'o de Boletos'
      'Melhoramento de Funcionalidade')
  end
  object MEFechamentoInicial: TMaskEdit [29]
    Left = 566
    Top = 64
    Width = 63
    Height = 22
    EditMask = '!99/99/00##;1;_'
    MaxLength = 10
    TabOrder = 14
    Text = '  /  /    '
  end
  object MEFechamentoFinal: TMaskEdit [30]
    Left = 636
    Top = 64
    Width = 64
    Height = 22
    EditMask = '!99/99/00##;1;_'
    MaxLength = 10
    TabOrder = 15
    Text = '  /  /    '
  end
  object RGPrioridade: TRadioGroup [31]
    Left = 594
    Top = 11
    Width = 237
    Height = 36
    Caption = 'Prioridade'
    Columns = 4
    ItemIndex = 3
    Items.Strings = (
      'ALTA'
      'M'#201'DIA'
      'BAIXA'
      'TODAS')
    TabOrder = 9
    OnClick = RGPrioridadeClick
  end
  object CBSituacao: TComboBox [32]
    Left = 465
    Top = 25
    Width = 123
    Height = 22
    ItemHeight = 14
    TabOrder = 8
    Text = 'ABERTO'
    OnChange = CBTipoSuporteChange
    Items.Strings = (
      ''
      'ABERTO'
      'RESOLVIDO'
      'N'#195'O RESOLVIDO'
      'RESOLVIDO E ENVIADO')
  end
  inherited DSConsulta: TDataSource
    DataSet = DMSuporte.QSuporteCons
    Left = 648
    Top = 0
  end
  inherited PopupMenu1: TPopupMenu
    Left = 616
    Top = 0
  end
end
