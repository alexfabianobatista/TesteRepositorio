inherited FEntregaCons: TFEntregaCons
  Left = 155
  Top = 99
  Width = 1184
  Height = 599
  Caption = 'Consulta Entregas'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Width = 69
    Caption = 'Dt. Cria'#231#227'o Ini.'
  end
  inherited LblNumRegistros: TLabel
    Top = 529
  end
  object Label2: TLabel [2]
    Left = 96
    Top = 8
    Width = 72
    Height = 14
    Caption = 'Dt. Cria'#231#227'o Fim'
  end
  object Label3: TLabel [3]
    Left = 9
    Top = 51
    Width = 69
    Height = 14
    Caption = 'Dt. Entrega Ini.'
  end
  object Label4: TLabel [4]
    Left = 97
    Top = 51
    Width = 78
    Height = 14
    Caption = 'Dt. Entregue Fim'
  end
  object Label5: TLabel [5]
    Left = 392
    Top = 51
    Width = 72
    Height = 14
    Caption = 'N'#250'mero Pedido'
  end
  inherited BtOk: TBitBtn
    Left = 1078
    Top = 533
    TabOrder = 12
  end
  inherited BtCancela: TBitBtn
    Left = 990
    Top = 533
    TabOrder = 11
  end
  inherited BtProcurar: TBitBtn
    Left = 1079
    TabOrder = 9
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Top = 22
    Width = 69
    EditMask = '!99/99/00##;1;_'
    MaxLength = 10
    Text = '  /  /    '
  end
  inherited DBGrid1: TDBGrid
    Top = 96
    Width = 1152
    Height = 434
    TabOrder = 10
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_FILIAL'
        Title.Caption = 'Cod. Filial'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'filial'
        Title.Caption = 'Filial'
        Width = 177
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nomecadastro'
        Title.Caption = 'Cliente'
        Width = 272
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_PEDIDO'
        Title.Caption = 'N'#186' Pedido'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_ENTREGA_CAB'
        Title.Caption = 'Cod. Entrega'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_CRIACAO'
        Title.Caption = 'Dt. Cria'#231#227'o'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_ENTREGA'
        Title.Caption = 'Dt. Entrega'
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMEENTREGADOR'
        Title.Caption = 'Entregador'
        Width = 208
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_SITUACAO'
        Title.Caption = 'Situa'#231#227'o'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_ENTREGADOR'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DT_ULT_ALTERACAO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'COD_ENTREGA_ITEM'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'COD_NOTA_CAB'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'COD_PEDIDO_CAB'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DESC_ENDERECO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DESC_BAIRRO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DESC_CEP'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DESC_COMPLEMENTO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'COD_CIDADE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DESC_OBS_ENTREGA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DESC_OBS_ENTREGADOR'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DT_CRIACAO_ITEM'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DT_ENTREGA_PREV'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DT_ALTERACAO_ITEM'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'COD_CADASTRO'
        Visible = False
      end>
  end
  object MEDtFim: TMaskEdit [11]
    Left = 97
    Top = 22
    Width = 69
    Height = 22
    EditMask = '!99/99/00##;1;_'
    MaxLength = 10
    TabOrder = 1
    Text = '  /  /    '
  end
  inline FmFilial1: TFmFilial [12]
    Left = 193
    Top = 7
    Width = 177
    Height = 37
    TabOrder = 2
    inherited Label1: TLabel
      Height = 14
    end
    inherited MeFilial: TMaskEdit
      Height = 22
    end
    inherited EdFilial: TEdit
      Width = 101
      Height = 22
    end
  end
  object MeDtEntregaIni: TMaskEdit [13]
    Left = 9
    Top = 65
    Width = 68
    Height = 22
    EditMask = '!99/99/00##;1;_'
    MaxLength = 10
    TabOrder = 4
    Text = '  /  /    '
  end
  object MeDtEntregaFim: TMaskEdit [14]
    Left = 98
    Top = 65
    Width = 69
    Height = 22
    EditMask = '!99/99/00##;1;_'
    MaxLength = 10
    TabOrder = 5
    Text = '  /  /    '
  end
  inline FmCadastro1: TFmCadastro [15]
    Left = 192
    Top = 50
    Width = 178
    Height = 37
    TabOrder = 6
    inherited Label1: TLabel
      Width = 44
      Height = 14
    end
    inherited MeCadastro: TMaskEdit
      Height = 22
    end
    inherited EdCadastro: TEdit
      Width = 102
      Height = 22
    end
  end
  inline FmEntregador: TFmCadastro
    Left = 392
    Top = 7
    Width = 159
    Height = 37
    TabOrder = 3
    inherited Label1: TLabel
      Width = 53
      Height = 14
      Caption = 'Entregador'
    end
    inherited MeCadastro: TMaskEdit
      Height = 22
    end
    inherited BtCadastro: TBitBtn
      Left = 45
      OnClick = FmEntregadorBtCadastroClick
    end
    inherited EdCadastro: TEdit
      Left = 68
      Width = 83
      Height = 22
    end
  end
  object EdNumPedido: TEdit
    Left = 392
    Top = 65
    Width = 73
    Height = 22
    TabOrder = 7
  end
  object RgSituacao: TRadioGroup
    Left = 554
    Top = 2
    Width = 185
    Height = 86
    Caption = 'Situa'#231#227'o da Entrega'
    Columns = 2
    ItemIndex = 4
    Items.Strings = (
      'Pendente'
      'Cancelada'
      'Entregue'
      'Recusada'
      'Todas')
    TabOrder = 8
  end
  inherited DSConsulta: TDataSource
    DataSet = DMPedido.QEntregaCons
    Left = 856
    Top = 0
  end
  inherited PopupMenu1: TPopupMenu
    Left = 824
    Top = 0
  end
end
