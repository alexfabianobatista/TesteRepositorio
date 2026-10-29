inherited FValeProdutoCons: TFValeProdutoCons
  Left = 420
  Top = 181
  Width = 729
  Height = 406
  Caption = 'Consulta de Vales'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Caption = 'Cliente'
  end
  object Label2: TLabel [1]
    Left = 14
    Top = 200
    Width = 380
    Height = 15
    Caption = 
      '* Os vales em vermelho j'#225' foram utilizados e n'#227'o est'#227'o dispon'#237've' +
      'is.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
  end
  object Label11: TLabel [2]
    Left = 109
    Top = 9
    Width = 49
    Height = 14
    Caption = 'N'#250'm. Nota'
  end
  object Label3: TLabel [3]
    Left = 8
    Top = 50
    Width = 36
    Height = 14
    Caption = 'Per'#237'odo'
  end
  object Label4: TLabel [4]
    Left = 77
    Top = 66
    Width = 15
    Height = 14
    Caption = 'at'#233
  end
  inherited BtOk: TBitBtn
    Left = 623
    Top = 337
    TabOrder = 8
  end
  inherited BtCancela: TBitBtn
    Left = 535
    Top = 337
    TabOrder = 9
  end
  inherited BtProcurar: TBitBtn
    Left = 624
    Top = 61
    TabOrder = 6
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Width = 54
    EditMask = '######'
    MaxLength = 6
    Text = '      '
    OnKeyDown = METextoKeyDown
  end
  object BtConsCadastro: TBitBtn [10]
    Left = 63
    Top = 23
    Width = 25
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
  object MENumNota: TMaskEdit [11]
    Left = 102
    Top = 24
    Width = 65
    Height = 22
    EditMask = '######'
    MaxLength = 6
    TabOrder = 2
    Text = '      '
  end
  object MEDataIni: TMaskEdit [12]
    Left = 8
    Top = 64
    Width = 65
    Height = 22
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 3
    Text = '  /  /    '
  end
  object MEDataFin: TMaskEdit [13]
    Left = 101
    Top = 64
    Width = 66
    Height = 22
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 4
    Text = '  /  /    '
  end
  object RGSituacao: TRadioGroup [14]
    Left = 326
    Top = 18
    Width = 196
    Height = 69
    Caption = 'Situa'#231#227'o Vale-presente'
    Columns = 2
    ItemIndex = 1
    Items.Strings = (
      'N'#195'O EMITIDO'
      'EMITIDO'
      'CANCELADO'
      'TODOS')
    TabOrder = 5
  end
  object RGTipoVale: TRadioGroup [15]
    Left = 176
    Top = 18
    Width = 143
    Height = 69
    Caption = 'Tipo do Vale'
    ItemIndex = 0
    Items.Strings = (
      'VALE-COMPRAS'
      'VALE-PRESENTE')
    TabOrder = 10
  end
  inherited DBGrid1: TDBGrid
    Top = 96
    Width = 697
    Height = 233
    TabOrder = 7
    OnDrawColumnCell = DBGrid1DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_VALE_PRODUTO'
        Title.Caption = 'Vale'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_VALE_PRODUTO'
        Title.Caption = 'Valor'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_CADASTRO'
        Title.Caption = 'C'#243'd. Cliente'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome'
        Width = 231
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_EMISSAO'
        Title.Caption = 'Data'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_FILIAL'
        Title.Caption = 'Filial'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_TIPO_VALE'
        Title.Caption = 'Tipo'
        Visible = True
      end>
  end
  inherited DSConsulta: TDataSource
    DataSet = DMDevolucaoTroca.QValeProdutoCons
    Left = 592
    Top = 0
  end
  inherited PopupMenu1: TPopupMenu
    Left = 560
    Top = 0
  end
end
