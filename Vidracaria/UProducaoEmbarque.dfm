object FProducaoEmbarque: TFProducaoEmbarque
  Left = 139
  Top = 68
  Width = 1113
  Height = 607
  Caption = 'Embarque'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  DesignSize = (
    1097
    568)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 8
    Width = 48
    Height = 13
    Caption = 'Embarque'
  end
  object SBEmbarque: TSpeedButton
    Left = 96
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
    OnClick = SBEmbarqueClick
  end
  object Label2: TLabel
    Left = 35
    Top = 52
    Width = 81
    Height = 13
    Caption = 'C'#243'digo de Barras'
  end
  object SBVisualizar: TSpeedButton
    Left = 706
    Top = 16
    Width = 62
    Height = 23
    Caption = 'Visualizar'
    OnClick = SBVisualizarClick
  end
  object SpeedButton1: TSpeedButton
    Left = 704
    Top = 48
    Width = 65
    Height = 22
    Caption = 'Relat'#243'rio'
    OnClick = SpeedButton1Click
  end
  object SBVoltaPeca: TSpeedButton
    Left = 798
    Top = 17
    Width = 89
    Height = 22
    Caption = 'Voltar Pe'#231'a'
    Enabled = False
    Visible = False
    OnClick = SBVoltaPecaClick
  end
  object SBVoltaPedido: TSpeedButton
    Left = 798
    Top = 48
    Width = 89
    Height = 22
    Caption = 'Volta Pedido'
    Enabled = False
    Visible = False
    OnClick = SBVoltaPedidoClick
  end
  object SBAbertoNaoForno: TSpeedButton
    Left = 920
    Top = 72
    Width = 127
    Height = 22
    Caption = 'Aberto q n'#227'o foi p/ Forno'
    Enabled = False
    Visible = False
    OnClick = SBAbertoNaoFornoClick
  end
  object SBFaturadoNaoEmbarcado: TSpeedButton
    Left = 920
    Top = 49
    Width = 127
    Height = 22
    Caption = 'Fat. N'#227'o Embarcado'
    Enabled = False
    Visible = False
    OnClick = SBFaturadoNaoEmbarcadoClick
  end
  object SBPedidoAberto: TSpeedButton
    Left = 920
    Top = 2
    Width = 127
    Height = 22
    Caption = 'Pedidos Abertos'
    Enabled = False
    Visible = False
    OnClick = SBPedidoAbertoClick
  end
  object SBMostraEmbarque: TSpeedButton
    Left = 920
    Top = 26
    Width = 127
    Height = 22
    Caption = 'Mostra Embarque'
    Enabled = False
    Visible = False
    OnClick = SBMostraEmbarqueClick
  end
  object DBGrid8: TDBGrid
    Left = 16
    Top = 96
    Width = 1047
    Height = 476
    TabStop = False
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DMEmbarque.DSAcompanhaEmbarque
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = DBGrid8CellClick
    OnColEnter = DBGrid8ColEnter
    OnDrawColumnCell = DBGrid8DrawColumnCell
    OnDragOver = DBGrid8DragOver
    OnEndDock = DBGrid8EndDock
    OnMouseMove = DBGrid8MouseMove
    Columns = <
      item
        Expanded = False
        FieldName = 'NUM_LINHA'
        Title.Alignment = taRightJustify
        Title.Caption = 'Ordem'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_CADASTRO'
        Title.Caption = 'Cliente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_PRODUTO'
        Title.Caption = 'Produto'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_PEDIDO_CAB'
        Title.Caption = 'Pedido'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_PECA'
        Title.Caption = 'Pe'#231'a'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_LARGURA'
        Title.Alignment = taRightJustify
        Title.Caption = 'Largura'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_ALTURA'
        Title.Alignment = taRightJustify
        Title.Caption = 'Altura'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_TIPO'
        Title.Caption = 'Tipo'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_CALCULO'
        Title.Caption = 'C'#225'lculo'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_CORTE'
        Title.Caption = 'Corte'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_USINAGEM'
        Title.Caption = 'Usinagem'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_MARCACAO'
        Title.Caption = 'Marca'#231#227'o'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_FORNO'
        Title.Caption = 'Forno'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_EMBARQUE'
        Title.Caption = 'Embarque'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_QUEBRAS'
        Title.Caption = 'Quebra'
        Width = 39
        Visible = True
      end>
  end
  inline FmCadastro1: TFmCadastro
    Left = 372
    Top = 8
    Width = 317
    Height = 37
    TabOrder = 1
    inherited MeCadastro: TMaskEdit
      TabStop = False
      OnChange = FmCadastro1MeCadastroChange
      OnExit = FmCadastro1MeCadastroExit
    end
    inherited BtCadastro: TBitBtn
      OnClick = FmCadastro1BtCadastroClick
    end
    inherited EdCadastro: TEdit
      Width = 241
    end
  end
  object EdEmbarque: TEdit
    Left = 120
    Top = 24
    Width = 233
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 3
  end
  object MEEmbarque: TMaskEdit
    Left = 32
    Top = 24
    Width = 59
    Height = 21
    TabStop = False
    TabOrder = 0
    OnExit = MEEmbarqueExit
  end
  object EdCodBarra: TEdit
    Left = 33
    Top = 67
    Width = 121
    Height = 21
    TabOrder = 4
    OnChange = EdCodBarraChange
  end
end
