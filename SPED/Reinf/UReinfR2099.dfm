inherited FReinfR2099: TFReinfR2099
  Left = 290
  Top = 63
  Caption = 'Reinf R-2099 - Fechamento'
  ClientHeight = 614
  ClientWidth = 882
  PixelsPerInch = 96
  TextHeight = 14
  object Label7: TLabel [1]
    Left = 22
    Top = 195
    Width = 72
    Height = 14
    Caption = 'Data Apura'#231#227'o'
  end
  object Label1: TLabel [2]
    Left = 27
    Top = 64
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
    end
  end
  inherited StBLongHint: TStatusBar
    Top = 595
    Width = 882
  end
  object GroupBox1: TGroupBox [5]
    Left = 320
    Top = 104
    Width = 209
    Height = 137
    Caption = 'Eventos Enviados'
    TabOrder = 2
    object dbcbR2010: TDBCheckBox
      Left = 16
      Top = 24
      Width = 73
      Height = 17
      Caption = 'R-2010'
      DataField = 'IND_EVT_R2010'
      DataSource = DSPrimario
      TabOrder = 0
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object dbcbR2020: TDBCheckBox
      Left = 16
      Top = 48
      Width = 65
      Height = 17
      Caption = 'R-2020'
      DataField = 'IND_EVT_R2020'
      DataSource = DSPrimario
      TabOrder = 1
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object dbcbR2030: TDBCheckBox
      Left = 16
      Top = 72
      Width = 65
      Height = 17
      Caption = 'R-2030'
      DataField = 'IND_EVT_R2030'
      DataSource = DSPrimario
      TabOrder = 2
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object dbcbR2040: TDBCheckBox
      Left = 16
      Top = 96
      Width = 73
      Height = 17
      Caption = 'R-2040'
      DataField = 'IND_EVT_R2040'
      DataSource = DSPrimario
      TabOrder = 3
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object dbcbR2050: TDBCheckBox
      Left = 112
      Top = 24
      Width = 81
      Height = 17
      Caption = 'R-2050'
      DataField = 'IND_EVT_R2050'
      DataSource = DSPrimario
      TabOrder = 4
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object dbcbR2055: TDBCheckBox
      Left = 112
      Top = 48
      Width = 81
      Height = 17
      Caption = 'R-2055'
      DataField = 'IND_EVT_R2055'
      DataSource = DSPrimario
      TabOrder = 5
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object dbcbR2060: TDBCheckBox
      Left = 112
      Top = 72
      Width = 81
      Height = 17
      Caption = 'R-2060'
      DataField = 'IND_EVT_R2060'
      DataSource = DSPrimario
      TabOrder = 6
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object dbcbPagamentos: TDBCheckBox
      Left = 112
      Top = 96
      Width = 81
      Height = 17
      Caption = 'Pagamentos'
      DataField = 'IND_EVT_PAGAMENTOS'
      DataSource = DSPrimario
      TabOrder = 7
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
  end
  inline FmCadastroR2099: TFmCadastro [6]
    Left = 24
    Top = 149
    Width = 278
    Height = 37
    TabOrder = 3
    inherited Label1: TLabel
      Width = 44
      Height = 14
    end
    inherited MeCadastro: TMaskEdit
      Height = 22
      OnExit = FmCadastroR2099MeCadastroExit
    end
    inherited BtCadastro: TBitBtn
      Top = 11
    end
    inherited EdCadastro: TEdit
      Width = 202
      Height = 22
    end
  end
  inline FmFilialR2099: TFmFilial [7]
    Left = 25
    Top = 109
    Width = 278
    Height = 37
    TabOrder = 4
    inherited Label1: TLabel
      Height = 14
    end
    inherited MeFilial: TMaskEdit
      Left = 1
      Height = 22
      OnExit = FmFilialR2099MeFilialExit
    end
    inherited BtFilial: TBitBtn
      Top = 11
      OnClick = FmFilialR2099BtFilialClick
    end
    inherited EdFilial: TEdit
      Width = 202
      Height = 22
    end
  end
  object dtpkDataApuracao: TDateTimePicker [8]
    Left = 22
    Top = 211
    Width = 135
    Height = 22
    Date = 44385.714316006950000000
    Time = 44385.714316006950000000
    TabOrder = 5
  end
  object dbgReinfR2099: TDBGrid [9]
    Left = 7
    Top = 240
    Width = 865
    Height = 345
    DataSource = DMReinf.DSReinfR2099Cons
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 6
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    OnCellClick = dbgReinfR2099CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'DT_PERIODO_APURACAO'
        Title.Caption = 'Per'#237'odo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_TIPO_APLICATIVO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'COD_FILIAL'
        Title.Caption = 'Filial'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_CADASTRO'
        Title.Caption = 'Respons'#225'vel'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_EVT_R2010'
        Title.Caption = 'R-2010'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_EVT_R2020'
        Title.Caption = 'R-2020'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_EVT_R2030'
        Title.Caption = 'R-2030'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_EVT_R2040'
        Title.Caption = 'R-2040'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_EVT_R2050'
        Title.Caption = 'R-2050'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_EVT_R2055'
        Title.Caption = 'R-2055'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_EVT_R2060'
        Title.Caption = 'R-2060'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_EVT_PAGAMENTOS'
        Title.Caption = 'Pagamentos'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMP_SEM_MOVIMENTO'
        Title.Caption = 'Sem Movimento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_PRODUCAO_HOMOLOGACAO'
        Title.Caption = 'Ambiente envio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_RETIFCACAO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'COD_USUARIO'
        Title.Caption = 'Usu'#225'rio'
        Visible = True
      end>
  end
  object btnGerarEvento: TButton [10]
    Left = 759
    Top = 205
    Width = 107
    Height = 25
    Caption = 'Gerar Evento'
    TabOrder = 7
    OnClick = btnGerarEventoClick
  end
  object DBEdit1: TDBEdit [11]
    Left = 26
    Top = 80
    Width = 121
    Height = 22
    DataField = 'COD_REINF_R2099'
    DataSource = DSPrimario
    TabOrder = 8
  end
  inherited MMCadSimples: TMainMenu [12]
  end
  inherited DSPrimario: TDataSource [13]
    DataSet = DMReinf.QReinfR2099
  end
  inherited ILBotao: TImageList [14]
  end
end
