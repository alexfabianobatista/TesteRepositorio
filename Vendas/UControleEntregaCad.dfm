inherited FControleEntregaCad: TFControleEntregaCad
  Left = 339
  Top = 14
  Caption = 'Controle de Entrega'
  ClientHeight = 631
  ClientWidth = 886
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel [1]
    Left = 8
    Top = 43
    Width = 73
    Height = 14
    Caption = 'C'#243'digo Entrega'
    FocusControl = DBEdit1
  end
  object Label4: TLabel [2]
    Left = 817
    Top = 43
    Width = 62
    Height = 14
    Caption = 'Dt. Altera'#231#227'o'
    FocusControl = DBEdit4
  end
  object Label7: TLabel [3]
    Left = 359
    Top = 256
    Width = 47
    Height = 14
    Caption = 'Cod. Nota'
    Enabled = False
    FocusControl = DBEdit7
    Visible = False
  end
  object Label8: TLabel [4]
    Left = 459
    Top = 256
    Width = 57
    Height = 14
    Caption = 'Cod. Pedido'
    FocusControl = DBEdit8
  end
  object Label9: TLabel [5]
    Left = 8
    Top = 127
    Width = 33
    Height = 14
    Caption = 'Cidade'
  end
  object Label10: TLabel [6]
    Left = 639
    Top = 87
    Width = 29
    Height = 14
    Caption = 'Bairro'
  end
  object Label11: TLabel [7]
    Left = 532
    Top = 88
    Width = 19
    Height = 14
    Caption = 'CEP'
  end
  object Label12: TLabel [8]
    Left = 8
    Top = 87
    Width = 46
    Height = 14
    Caption = 'Endere'#231'o'
  end
  object Label13: TLabel [9]
    Left = 7
    Top = 166
    Width = 115
    Height = 14
    Caption = 'Observa'#231#227'o da Entrega'
  end
  object Label14: TLabel [10]
    Left = 8
    Top = 212
    Width = 131
    Height = 14
    Caption = 'Observa'#231#227'o do Entregador'
  end
  object Label15: TLabel [11]
    Left = 279
    Top = 257
    Width = 53
    Height = 14
    Caption = 'Dt. Cria'#231#227'o'
  end
  object Label16: TLabel [12]
    Left = 8
    Top = 257
    Width = 65
    Height = 14
    Caption = 'Dt. Altera'#231#227'o '
  end
  object Label17: TLabel [13]
    Left = 89
    Top = 257
    Width = 53
    Height = 14
    Caption = 'Dt. Entrega'
  end
  object Label18: TLabel [14]
    Left = 168
    Top = 257
    Width = 95
    Height = 14
    Caption = 'Dt. Prevista Entrega'
  end
  object Label20: TLabel [15]
    Left = 736
    Top = 43
    Width = 56
    Height = 14
    Caption = 'Dt. Emiss'#227'o'
    FocusControl = DBEdit20
  end
  object Label3: TLabel [16]
    Left = 532
    Top = 127
    Width = 113
    Height = 14
    Caption = 'Complemento Endere'#231'o'
  end
  object Label2: TLabel [17]
    Left = 480
    Top = 127
    Width = 33
    Height = 14
    Caption = 'Estado'
  end
  object ImgEntrega: TImage [18]
    Left = 8
    Top = 304
    Width = 355
    Height = 307
    Cursor = crHandPoint
    ParentShowHint = False
    ShowHint = False
    Stretch = True
  end
  inherited Panel1: TPanel
    Width = 886
    TabOrder = 15
    inherited lbPesquisaCodigo: TLabel
      Left = 744
    end
    inherited SBConsulta: TSpeedButton
      Left = 851
    end
    inherited pnSeparador2: TPanel
      Left = 735
    end
    inherited MELocaliza: TMaskEdit
      Left = 802
    end
  end
  inherited StBLongHint: TStatusBar
    Top = 613
    Width = 886
    Height = 18
  end
  object DBEdit1: TDBEdit [21]
    Left = 8
    Top = 59
    Width = 80
    Height = 22
    Color = clBtnFace
    DataField = 'COD_ENTREGA_CAB'
    DataSource = DSPrimario
    ReadOnly = True
    TabOrder = 0
  end
  object DBEdit4: TDBEdit [22]
    Left = 817
    Top = 59
    Width = 63
    Height = 22
    Color = clBtnFace
    DataField = 'DT_ULT_ALTERACAO'
    DataSource = DSPrimario
    TabOrder = 13
  end
  object DBEdit7: TDBEdit [23]
    Left = 358
    Top = 272
    Width = 84
    Height = 22
    Color = clBtnFace
    DataField = 'COD_NOTA_CAB'
    DataSource = DSEntregaItem
    Enabled = False
    ReadOnly = True
    TabOrder = 16
    Visible = False
  end
  object DBEdit8: TDBEdit [24]
    Left = 455
    Top = 272
    Width = 92
    Height = 22
    Color = clBtnFace
    DataField = 'COD_PEDIDO_CAB'
    DataSource = DSEntregaItem
    ReadOnly = True
    TabOrder = 17
  end
  object DBEdit20: TDBEdit [25]
    Left = 736
    Top = 59
    Width = 70
    Height = 22
    Color = clBtnFace
    DataField = 'DT_CRIACAO'
    DataSource = DSPrimario
    TabOrder = 14
  end
  object DBGrid1: TDBGrid [26]
    Left = 632
    Top = 326
    Width = 569
    Height = 131
    DataSource = DSEntregaItem
    TabOrder = 19
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    Visible = False
  end
  object EdCidade: TEdit [27]
    Left = 101
    Top = 142
    Width = 372
    Height = 22
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 20
  end
  inline FmFilial1: TFmFilial [28]
    Left = 101
    Top = 44
    Width = 341
    Height = 37
    TabOrder = 1
    inherited Label1: TLabel
      Height = 14
    end
    inherited MeFilial: TMaskEdit
      Height = 22
    end
    inherited EdFilial: TEdit
      Width = 265
      Height = 22
    end
  end
  object RgSituacao: TRadioGroup [29]
    Left = 560
    Top = 249
    Width = 174
    Height = 64
    Caption = 'Situa'#231#227'o da Entrega'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Pendente'
      'Cancelada'
      'Entregue'
      'Recusada')
    TabOrder = 12
  end
  object EdObsEntrega: TEdit [30]
    Left = 8
    Top = 186
    Width = 882
    Height = 22
    TabOrder = 8
  end
  object EdObsEntregador: TEdit [31]
    Left = 8
    Top = 228
    Width = 882
    Height = 22
    TabOrder = 9
  end
  object EdEndereco: TEdit [32]
    Left = 8
    Top = 102
    Width = 515
    Height = 22
    TabOrder = 3
  end
  object MEDtAlteracao: TMaskEdit [33]
    Left = 8
    Top = 272
    Width = 62
    Height = 22
    Color = clBtnFace
    EditMask = '99/99/9999;1;_'
    MaxLength = 10
    ReadOnly = True
    TabOrder = 21
    Text = '  /  /    '
  end
  object MEDtEntrega: TMaskEdit [34]
    Left = 88
    Top = 272
    Width = 81
    Height = 22
    EditMask = '99/99/9999;1;_'
    MaxLength = 10
    TabOrder = 10
    Text = '  /  /    '
  end
  object MEDtEntregaPrevista: TMaskEdit [35]
    Left = 173
    Top = 272
    Width = 70
    Height = 22
    EditMask = '99/99/9999;1;_'
    MaxLength = 10
    TabOrder = 11
    Text = '  /  /    '
  end
  object MEDtCriacao: TMaskEdit [36]
    Left = 280
    Top = 272
    Width = 62
    Height = 22
    Color = clBtnFace
    EditMask = '99/99/9999;1;_'
    MaxLength = 10
    ReadOnly = True
    TabOrder = 22
    Text = '  /  /    '
  end
  object EdCodCidade: TEdit [37]
    Left = 8
    Top = 142
    Width = 80
    Height = 22
    TabOrder = 6
  end
  object EdBairro: TEdit [38]
    Left = 639
    Top = 101
    Width = 250
    Height = 22
    TabOrder = 5
  end
  object EdCep: TEdit [39]
    Left = 532
    Top = 101
    Width = 88
    Height = 22
    TabOrder = 4
  end
  object EdComplementoEndereco: TEdit [40]
    Left = 532
    Top = 143
    Width = 357
    Height = 22
    TabOrder = 7
  end
  inline FmEntregador: TFmCadastro [41]
    Left = 453
    Top = 44
    Width = 269
    Height = 37
    TabOrder = 2
    inherited Label1: TLabel
      Left = 4
      Width = 53
      Height = 14
      Caption = 'Entregador'
    end
    inherited MeCadastro: TMaskEdit
      Left = 2
      Height = 22
    end
    inherited BtCadastro: TBitBtn
      Left = 49
      OnClick = FmEntregadorBtCadastroClick
    end
    inherited EdCadastro: TEdit
      Left = 78
      Width = 194
      Height = 22
    end
  end
  object EdEstado: TEdit [42]
    Left = 480
    Top = 142
    Width = 41
    Height = 22
    Color = clBtnFace
    TabOrder = 23
  end
  inherited MMCadSimples: TMainMenu [43]
    Left = 709
    Top = 8
    inherited Relatrios1: TMenuItem
      object EntregasporEntregador1: TMenuItem
        Caption = 'Entregas por Entregador'
        OnClick = EntregasporEntregador1Click
      end
    end
  end
  inherited DSPrimario: TDataSource [44]
    DataSet = DMPedido.QEntrega
    OnDataChange = DSPrimarioDataChange
    Left = 623
    Top = 8
  end
  inherited ILBotao: TImageList [45]
    Left = 652
    Top = 8
  end
  inherited ALCadastro: TActionList
    Left = 678
    Top = 8
  end
  inherited IdHTTP1: TIdHTTP
    Left = 737
    Top = 8
  end
  object DSEntregaItem: TDataSource
    AutoEdit = False
    DataSet = DMPedido.QEntregaItem
    Left = 592
    Top = 8
  end
end
