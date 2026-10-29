inherited FReinfR1070: TFReinfR1070
  Left = 360
  Top = 103
  BorderStyle = bsSingle
  Caption = 'Reinf R-1070 - Processo Administrativos/Judiciais'
  ClientHeight = 615
  ClientWidth = 880
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel [1]
    Left = 290
    Top = 67
    Width = 84
    Height = 14
    Caption = 'Tipo de Processo'
  end
  object Label2: TLabel [2]
    Left = 290
    Top = 107
    Width = 73
    Height = 14
    Caption = 'Num. Processo'
    FocusControl = dbeNumProcesso
  end
  object Label3: TLabel [3]
    Left = 13
    Top = 193
    Width = 83
    Height = 14
    Caption = 'In'#237'cio da Validade'
  end
  object Label4: TLabel [4]
    Left = 155
    Top = 197
    Width = 75
    Height = 14
    Caption = 'Fim da Validade'
  end
  object Label5: TLabel [5]
    Left = 288
    Top = 153
    Width = 73
    Height = 14
    Caption = 'Tipo de R-1070'
  end
  object Label6: TLabel [6]
    Left = 450
    Top = 113
    Width = 75
    Height = 14
    Caption = 'Ind. Suspens'#227'o'
  end
  object Label7: TLabel [7]
    Left = 446
    Top = 69
    Width = 23
    Height = 14
    Caption = 'Vara'
  end
  inherited Panel1: TPanel
    Width = 880
    inherited lbPesquisaCodigo: TLabel
      Left = 738
    end
    inherited SBConsulta: TSpeedButton
      Left = 845
    end
    inherited pnSeparador2: TPanel
      Left = 729
    end
    inherited MELocaliza: TMaskEdit
      Left = 796
    end
  end
  inherited StBLongHint: TStatusBar
    Top = 596
    Width = 880
  end
  object dbgReinfR1070: TDBGrid [10]
    Left = 8
    Top = 256
    Width = 865
    Height = 329
    DataSource = DMReinf.DSReinfR1070Cons
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    OnCellClick = dbgReinfR1070CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_REINF_R1070'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'COD_FILIAL'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DESC_FILIAL'
        Title.Caption = 'Filial'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Contato'
        Width = 250
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
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_INC_ALT_EXC'
        Title.Caption = 'Tipo Evento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_PROCESSO'
        Title.Caption = 'Num. Processo'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_INI_VALIDADE'
        Title.Caption = 'Data In'#237'cio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_FIM_VALIDADE'
        Title.Caption = 'Data Fim'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_AUTORIA_PROCESSO'
        Title.Caption = 'Autoria'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'COD_ESTADO'
        Title.Caption = 'UF'
        Width = 22
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_CIDADE'
        Title.Caption = 'Cod. Cidade'
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
        FieldName = 'IND_PRODUCAO_HOMOLOGACAO'
        Title.Caption = 'Ambiente'
        Visible = True
      end>
  end
  inline FmFilialR1070: TFmFilial [11]
    Left = 9
    Top = 71
    Width = 265
    Height = 37
    Hint = 'Filial'
    TabOrder = 3
    inherited Label1: TLabel
      Height = 14
    end
    inherited MeFilial: TMaskEdit
      Height = 22
      OnExit = FmFilialR1070MeFilialExit
    end
    inherited BtFilial: TBitBtn
      OnClick = FmFilialR1070BtFilialClick
    end
    inherited EdFilial: TEdit
      Height = 22
    end
  end
  inline FmCadastroR1070: TFmCadastro [12]
    Left = 9
    Top = 111
    Width = 265
    Height = 37
    Hint = 'Cadastro'
    TabOrder = 4
    inherited Label1: TLabel
      Width = 44
      Height = 14
    end
    inherited MeCadastro: TMaskEdit
      Height = 22
      OnExit = FmCadastroR1070MeCadastroExit
    end
    inherited BtCadastro: TBitBtn
      OnClick = FmCadastroR1070BtCadastroClick
    end
    inherited EdCadastro: TEdit
      Height = 22
    end
  end
  inline FmCidadeR1070: TFmCidade [13]
    Left = 9
    Top = 151
    Width = 272
    Height = 40
    Hint = 'Cidade'
    TabOrder = 5
    inherited Label1: TLabel
      Height = 14
    end
    inherited MeCidade: TMaskEdit
      Height = 22
      OnExit = FmCidadeR1070MeCidadeExit
    end
    inherited BtCidade: TBitBtn
      OnClick = FmCidadeR1070BtCidadeClick
    end
    inherited EdCidade: TEdit
      Width = 189
      Height = 22
    end
  end
  object dbeNumProcesso: TDBEdit [14]
    Left = 290
    Top = 123
    Width = 143
    Height = 22
    DataField = 'NUM_PROCESSO'
    DataSource = DSPrimario
    TabOrder = 6
  end
  object cbTipoProcesso: TComboBox [15]
    Left = 290
    Top = 83
    Width = 145
    Height = 22
    ItemHeight = 14
    TabOrder = 7
    OnChange = cbTipoProcessoChange
    Items.Strings = (
      ''
      '1 - Administrativo'
      '2 - Judicial')
  end
  object dtpkDataInicio: TDateTimePicker [16]
    Left = 11
    Top = 212
    Width = 135
    Height = 22
    Date = 44389.952728321760000000
    Time = 44389.952728321760000000
    TabOrder = 8
  end
  object dtpkDataFim: TDateTimePicker [17]
    Left = 155
    Top = 212
    Width = 135
    Height = 22
    Date = 44389.952767280090000000
    Time = 44389.952767280090000000
    TabOrder = 9
  end
  object cbTipoR1070: TComboBox [18]
    Left = 288
    Top = 170
    Width = 145
    Height = 22
    ItemHeight = 14
    ItemIndex = 0
    TabOrder = 10
    Text = 'INCLUSAO'
    Items.Strings = (
      'INCLUSAO'
      'ALTERACAO'
      'EXCLUSAO')
  end
  object cbFimValidade: TCheckBox [19]
    Left = 156
    Top = 239
    Width = 113
    Height = 17
    Caption = 'Inclui fim validade'
    TabOrder = 11
    OnClick = cbFimValidadeClick
  end
  object dbgIndSuspR1070: TDBGrid [20]
    Left = 448
    Top = 128
    Width = 417
    Height = 89
    DataSource = DMReinf.DSReinfSuspProcR1070Cons
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 12
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_IND_SUSPENSAO'
        Title.Caption = 'Cod. Ind. Suspens'#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_DECISAO'
        Title.Caption = 'Dt. Decis'#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_DEPOSITO'
        Title.Caption = 'Dep'#243'sito Integral?'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_SUSPENSAO'
        Title.Caption = 'Ind. Suspens'#227'o'
        Visible = True
      end>
  end
  object btnAddSusp: TButton [21]
    Left = 552
    Top = 216
    Width = 49
    Height = 25
    Caption = '+'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 13
    OnClick = btnAddSuspClick
  end
  object btnRemSusp: TButton [22]
    Left = 608
    Top = 216
    Width = 49
    Height = 25
    Caption = '-'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 14
    OnClick = btnRemSuspClick
  end
  object bdeNumVara: TDBEdit [23]
    Left = 445
    Top = 83
    Width = 121
    Height = 22
    DataField = 'NUM_VARA'
    DataSource = DSPrimario
    TabOrder = 15
  end
  object btnGerarEvento: TButton [24]
    Left = 759
    Top = 224
    Width = 107
    Height = 25
    Caption = 'Gerar Evento'
    TabOrder = 16
    OnClick = btnGerarEventoClick
  end
  object dbckAutoria: TDBCheckBox [25]
    Left = 296
    Top = 216
    Width = 97
    Height = 17
    Caption = 'Autoria Pr'#243'pria'
    DataField = 'IND_AUTORIA_PROCESSO'
    DataSource = DSPrimario
    TabOrder = 17
    ValueChecked = '1'
    ValueUnchecked = '2'
  end
  inherited MMCadSimples: TMainMenu [26]
    Left = 797
  end
  inherited DSPrimario: TDataSource [27]
    DataSet = DMReinf.QReinfR1070
    Left = 711
  end
  inherited ILBotao: TImageList
    Left = 740
  end
  inherited ALCadastro: TActionList
    Left = 766
  end
  inherited IdHTTP1: TIdHTTP
    Left = 825
  end
end
