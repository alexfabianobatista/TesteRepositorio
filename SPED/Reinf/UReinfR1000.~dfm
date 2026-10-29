inherited FReinfR1000: TFReinfR1000
  Left = 269
  Top = 46
  BorderStyle = bsSingle
  Caption = 'Reinf R-1000 - Informa'#231#245'es do Contribuinte'
  ClientHeight = 615
  ClientWidth = 882
  PixelsPerInch = 96
  TextHeight = 14
  object Label7: TLabel [1]
    Left = 310
    Top = 123
    Width = 83
    Height = 14
    Caption = 'In'#237'cio da Validade'
  end
  object Label8: TLabel [2]
    Left = 454
    Top = 123
    Width = 75
    Height = 14
    Caption = 'Fim da Validade'
  end
  object Label1: TLabel [3]
    Left = 11
    Top = 165
    Width = 102
    Height = 14
    Caption = 'Situa'#231#227'o da empresa'
  end
  object Label4: TLabel [4]
    Left = 611
    Top = 81
    Width = 73
    Height = 14
    Caption = 'Tipo de R-1000'
  end
  object Label5: TLabel [5]
    Left = 310
    Top = 83
    Width = 113
    Height = 14
    Caption = 'Classifica'#231#227'o Tribut'#225'ria'
  end
  object Label2: TLabel [6]
    Left = 11
    Top = 45
    Width = 33
    Height = 14
    Caption = 'C'#243'digo'
  end
  inherited Panel1: TPanel
    Width = 882
    inherited lbPesquisaCodigo: TLabel
      Left = 740
    end
    inherited SBConsulta: TSpeedButton
      Left = 847
    end
    inherited pnSeparador2: TPanel
      Left = 731
    end
    inherited MELocaliza: TMaskEdit
      Left = 798
      Enabled = False
      Visible = False
    end
  end
  inherited StBLongHint: TStatusBar
    Top = 596
    Width = 882
  end
  object dbgReinfR1000: TDBGrid [9]
    Left = 7
    Top = 240
    Width = 865
    Height = 345
    DataSource = DMReinf.DSReinfR1000Cons
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    OnCellClick = dbgReinfR1000CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_FILIAL'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DESC_FILIAL'
        Title.Caption = 'Filial'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Contato'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_CGC_CPF'
        Title.Caption = 'CPF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_TELEFONE'
        Title.Caption = 'Telefone'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_CELULAR'
        Title.Caption = 'Celular'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_E_MAIL'
        Title.Caption = 'E-mail'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_INC_ALT_EXC'
        Title.Caption = 'Tipo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_CLASSIFICACAO_TRIBUTARIA'
        Title.Caption = 'Classifica'#231#227'o Tribut'#225'ria'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_INI_VALIDADE'
        Title.Caption = 'In'#237'cio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_FIM_VALIDADE'
        Title.Caption = 'Fim'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_ECD'
        Title.Caption = 'Obrigado a ECD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_DESONERACAO_FOLHA'
        Title.Caption = 'Desonera'#231#227'o CPRB'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_USUARIO'
        Title.Caption = 'Usu'#225'rio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_USUARIO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'IND_PRODUCAO_HOMOLOGACAO'
        Title.Caption = 'Ambiente Envio'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_REINF_R1000'
        Visible = False
      end>
  end
  inline FmFilialR1000: TFmFilial [10]
    Left = 11
    Top = 85
    Width = 278
    Height = 37
    TabOrder = 3
    inherited Label1: TLabel
      Height = 14
    end
    inherited MeFilial: TMaskEdit
      Left = 1
      Height = 22
      OnExit = FmFilialR1000MeFilialExit
    end
    inherited BtFilial: TBitBtn
      Top = 11
      OnClick = FmFilial1BtFilialClick
    end
    inherited EdFilial: TEdit
      Width = 202
      Height = 22
    end
  end
  inline FmCadastroR1000: TFmCadastro [11]
    Left = 11
    Top = 125
    Width = 278
    Height = 37
    TabOrder = 4
    inherited Label1: TLabel
      Width = 44
      Height = 14
    end
    inherited MeCadastro: TMaskEdit
      Height = 22
      OnExit = FmCadastroR1000MeCadastroExit
    end
    inherited BtCadastro: TBitBtn
      Top = 11
      OnClick = FmCadastroR1000BtCadastroClick
    end
    inherited EdCadastro: TEdit
      Width = 202
      Height = 22
    end
  end
  object dtpkDataInicio: TDateTimePicker [12]
    Left = 310
    Top = 139
    Width = 135
    Height = 22
    Date = 44385.714316006950000000
    Time = 44385.714316006950000000
    TabOrder = 5
  end
  object dtpkDataFim: TDateTimePicker [13]
    Left = 454
    Top = 139
    Width = 135
    Height = 22
    Date = 44385.714640266200000000
    Time = 44385.714640266200000000
    TabOrder = 6
  end
  object cbSituacaoEmpresa: TComboBox [14]
    Left = 11
    Top = 184
    Width = 145
    Height = 22
    ItemHeight = 14
    ItemIndex = 0
    TabOrder = 7
    Text = '0 - Situa'#231#227'o Normal'
    Items.Strings = (
      '0 - Situa'#231#227'o Normal'
      '1 - Extin'#231#227'o'
      '2 - Fus'#227'o'
      '3 - Cis'#227'o'
      '4 - Incorpora'#231#227'o')
  end
  object cbTipoR1000: TComboBox [15]
    Left = 611
    Top = 98
    Width = 145
    Height = 22
    ItemHeight = 14
    ItemIndex = 1
    TabOrder = 8
    Text = 'ALTERACAO'
    Items.Strings = (
      'INCLUSAO'
      'ALTERACAO'
      'EXCLUSAO')
  end
  object dblcbsituacaoTributaria: TDBLookupComboBox [16]
    Left = 310
    Top = 99
    Width = 291
    Height = 22
    DataField = 'COD_CLASSIFICACAO_TRIBUTARIA'
    DataSource = DSPrimario
    KeyField = 'COD_CLASSIFICACAO_TRIBUTARIA'
    ListField = 'DESC_CLASSIFICACAO_TRIBUTARIA'
    ListSource = DMReinf.DSClassificacaoTributaria
    TabOrder = 9
  end
  object dbcbDesoneraFolhaCPRB: TDBCheckBox [17]
    Left = 171
    Top = 208
    Width = 129
    Height = 17
    Caption = 'Desonera Folha CPRB'
    DataField = 'IND_DESONERACAO_FOLHA'
    DataSource = DSPrimario
    TabOrder = 10
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object dbcbObrigaEcd: TDBCheckBox [18]
    Left = 171
    Top = 184
    Width = 97
    Height = 17
    Caption = 'Obriga ECD'
    DataField = 'IND_ECD'
    DataSource = DSPrimario
    TabOrder = 11
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object cbFimValidade: TCheckBox [19]
    Left = 455
    Top = 165
    Width = 113
    Height = 17
    Caption = 'Inclui fim validade'
    TabOrder = 12
    OnClick = cbFimValidadeClick
  end
  object btnGerarEvento: TButton [20]
    Left = 759
    Top = 205
    Width = 107
    Height = 25
    Caption = 'Gerar Evento'
    TabOrder = 13
    OnClick = btnGerarEventoClick
  end
  object GroupBox4: TGroupBox [21]
    Left = 456
    Top = 195
    Width = 281
    Height = 41
    Caption = 'Legenda'
    TabOrder = 14
    object Label13: TLabel
      Left = 25
      Top = 15
      Width = 27
      Height = 14
      Caption = 'Salvo'
    end
    object Label14: TLabel
      Left = 94
      Top = 15
      Width = 36
      Height = 14
      Caption = 'Gerado'
    end
    object Label16: TLabel
      Left = 233
      Top = 15
      Width = 38
      Height = 14
      Caption = 'Enviado'
    end
    object Label15: TLabel
      Left = 163
      Top = 15
      Width = 20
      Height = 14
      Caption = 'Erro'
    end
    object Panel2: TPanel
      Left = 5
      Top = 15
      Width = 17
      Height = 17
      BorderStyle = bsSingle
      Color = clBtnHighlight
      TabOrder = 0
    end
    object Panel3: TPanel
      Left = 75
      Top = 15
      Width = 17
      Height = 17
      BorderStyle = bsSingle
      Color = clYellow
      TabOrder = 1
    end
    object Panel4: TPanel
      Left = 145
      Top = 15
      Width = 17
      Height = 17
      BorderStyle = bsSingle
      Color = clRed
      TabOrder = 2
    end
    object Panel5: TPanel
      Left = 215
      Top = 15
      Width = 17
      Height = 17
      BorderStyle = bsSingle
      Color = clBlue
      TabOrder = 3
    end
  end
  object dbcbAcordoMulta: TDBCheckBox [22]
    Left = 304
    Top = 181
    Width = 97
    Height = 17
    Caption = 'Acordo Multa'
    DataField = 'IND_ACORDO_MULTA'
    DataSource = DSPrimario
    TabOrder = 15
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object DBEdit1: TDBEdit [23]
    Left = 12
    Top = 60
    Width = 91
    Height = 22
    DataField = 'COD_REINF_R1000'
    DataSource = DSPrimario
    Enabled = False
    TabOrder = 16
  end
  inherited MMCadSimples: TMainMenu [24]
    Left = 436
    Top = 61
  end
  inherited DSPrimario: TDataSource [25]
    DataSet = DMReinf.QReinfR1000
    Left = 350
    Top = 61
  end
  inherited ILBotao: TImageList [26]
    Left = 379
    Top = 61
  end
  inherited ALCadastro: TActionList
    Left = 405
    Top = 61
  end
  inherited IdHTTP1: TIdHTTP
    Left = 464
    Top = 61
  end
end
