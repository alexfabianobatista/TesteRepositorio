inherited FReinfR2050: TFReinfR2050
  Left = 241
  Top = 22
  BorderStyle = bsSingle
  Caption = 'FReinfR2050'
  ClientHeight = 614
  ClientWidth = 884
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel [1]
    Left = 8
    Top = 120
    Width = 119
    Height = 14
    Caption = 'Receita Bruta no Periodo'
    FocusControl = dbeRecBrutaPer
  end
  object Label2: TLabel [2]
    Left = 8
    Top = 160
    Width = 131
    Height = 14
    Caption = 'Contribui'#231#227'o Previdenci'#225'ria'
    FocusControl = dbeContriPrevApur
  end
  object Label3: TLabel [3]
    Left = 8
    Top = 200
    Width = 170
    Height = 14
    Caption = 'Contribui'#231#227'o Previdenci'#225'ria GILRAT'
    FocusControl = dbeContriPrevRAT
  end
  object Label4: TLabel [4]
    Left = 8
    Top = 240
    Width = 98
    Height = 14
    Caption = 'Contribui'#231#227'o SENAR'
    FocusControl = dbeContriSenar
  end
  object Label5: TLabel [5]
    Left = 8
    Top = 280
    Width = 183
    Height = 14
    Caption = 'Contribui'#231#227'o Previdenci'#225'ria Suspensa'
    FocusControl = dbeContriSuspe
  end
  object Label6: TLabel [6]
    Left = 8
    Top = 320
    Width = 150
    Height = 14
    Caption = 'Contribui'#231#227'o SENAR Suspensa'
    FocusControl = dbeContriSenarSusp
  end
  object Label7: TLabel [7]
    Left = 384
    Top = 79
    Width = 117
    Height = 14
    Caption = 'Tipo de Comercializa'#231#227'o'
  end
  object Label8: TLabel [8]
    Left = 537
    Top = 128
    Width = 153
    Height = 14
    Caption = 'Processos por Comercializa'#231#227'o'
  end
  object Label9: TLabel [9]
    Left = 256
    Top = 79
    Width = 65
    Height = 14
    Caption = 'Receita Bruta'
  end
  object Label10: TLabel [10]
    Left = 248
    Top = 321
    Width = 53
    Height = 14
    Caption = 'Refer'#234'ncia'
  end
  inherited Panel1: TPanel
    Width = 884
    inherited lbPesquisaCodigo: TLabel
      Left = 742
    end
    inherited SBConsulta: TSpeedButton
      Left = 849
    end
    inherited pnSeparador2: TPanel
      Left = 733
    end
    inherited MELocaliza: TMaskEdit
      Left = 800
    end
  end
  inherited StBLongHint: TStatusBar
    Top = 595
    Width = 884
  end
  inline FmFilialR2050: TFmFilial [13]
    Left = 8
    Top = 80
    Width = 225
    Height = 37
    TabOrder = 2
    inherited Label1: TLabel
      Height = 14
    end
    inherited MeFilial: TMaskEdit
      Height = 22
    end
    inherited EdFilial: TEdit
      Width = 149
      Height = 22
    end
  end
  object dbgR2050: TDBGrid [14]
    Left = 7
    Top = 368
    Width = 866
    Height = 219
    DataSource = DMReinf.DSReinfR2050Cos
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 3
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    OnCellClick = dbgR2050CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_REINF_R2050'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_PERIODO_APURACAO'
        Title.Caption = 'Per'#237'odo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_PRODUCAO_HOMOLOGACAO'
        Title.Caption = 'Ambiente'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'IND_TIPO_APLICATIVO'
        Title.Caption = 'Tipo Aplicativo'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'COD_FILIAL'
        Title.Caption = 'CodFilial'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DESC_FILIAL'
        Title.Caption = 'Filial'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_REC_BRUTA_TOTAL'
        Title.Caption = 'Receita Bruta Total'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_CPA_APUR'
        Title.Caption = 'Contribui'#231#227'o Previdenci'#225'ria'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_RAT_APUR'
        Title.Caption = 'GILRAT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_SENAR_APUR'
        Title.Caption = 'SENAR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_CP_SUSP_TOTAL'
        Title.Caption = 'Contr. Prev. Suspensa'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_SENAR_SUSPE_TOTAL'
        Title.Caption = 'SENAT Suspensa'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_USUARIO'
        Title.Caption = 'Usu'#225'rio'
        Visible = True
      end>
  end
  object dbeRecBrutaPer: TDBEdit [15]
    Left = 8
    Top = 136
    Width = 225
    Height = 22
    DataField = 'VAL_REC_BRUTA_TOTAL'
    DataSource = DSPrimario
    TabOrder = 4
  end
  object dbeContriPrevApur: TDBEdit [16]
    Left = 8
    Top = 176
    Width = 225
    Height = 22
    DataField = 'VAL_CPA_APUR'
    DataSource = DSPrimario
    TabOrder = 5
  end
  object dbeContriPrevRAT: TDBEdit [17]
    Left = 8
    Top = 216
    Width = 225
    Height = 22
    DataField = 'VAL_RAT_APUR'
    DataSource = DSPrimario
    TabOrder = 6
  end
  object dbeContriSenar: TDBEdit [18]
    Left = 8
    Top = 256
    Width = 225
    Height = 22
    DataField = 'VAL_SENAR_APUR'
    DataSource = DSPrimario
    TabOrder = 7
  end
  object dbeContriSuspe: TDBEdit [19]
    Left = 8
    Top = 296
    Width = 225
    Height = 22
    DataField = 'VAL_CP_SUSP_TOTAL'
    DataSource = DSPrimario
    TabOrder = 8
  end
  object dbeContriSenarSusp: TDBEdit [20]
    Left = 8
    Top = 336
    Width = 225
    Height = 22
    DataField = 'VAL_SENAR_SUSPE_TOTAL'
    DataSource = DSPrimario
    TabOrder = 9
  end
  object dbgTipoComercializacao: TDBGrid [21]
    Left = 256
    Top = 126
    Width = 273
    Height = 171
    DataSource = DMReinf.DSComercializacaoR2050Cons
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 10
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    OnCellClick = dbgTipoComercializacaoCellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'IND_COMERCIALIZACAO'
        Title.Caption = 'Tipo Comercializa'#231#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_REC_BRUTA'
        Title.Caption = 'Receita Bruta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_TIPO_COMERCIALIZACAO'
        Visible = False
      end>
  end
  object dbgProcessos: TDBGrid [22]
    Left = 535
    Top = 144
    Width = 338
    Height = 153
    DataSource = DMReinf.DSTipoComerXR1070Cons
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 11
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NUM_PROCESSO'
        Title.Caption = 'Processo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_PROCESSO'
        Title.Caption = 'Tipo de Processo'
        Visible = True
      end>
  end
  object cbTipoComercializacao: TComboBox [23]
    Left = 384
    Top = 96
    Width = 321
    Height = 22
    ItemHeight = 14
    TabOrder = 12
    Items.Strings = (
      '1 Comercializa'#231#227'o por produtor rural PJ/agroind'#250'stria'
      '7 Comercializa'#231#227'o com isen'#231#227'o de contribui'#231#227'o previdenci'#225'ria'
      '8 Comercializa'#231#227'o para entidade executora do PAA'
      '9 Comercializa'#231#227'o no mercado externo')
  end
  object btnAdicionaComer: TButton [24]
    Left = 340
    Top = 300
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
    OnClick = btnAdicionaComerClick
  end
  object btnRemoveComer: TButton [25]
    Left = 396
    Top = 298
    Width = 49
    Height = 27
    Caption = '-'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 14
    OnClick = btnRemoveComerClick
  end
  object btnAdicionaProc: TButton [26]
    Left = 657
    Top = 298
    Width = 49
    Height = 25
    Caption = '+'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 15
    OnClick = btnAdicionaProcClick
  end
  object btnRemoveProc: TButton [27]
    Left = 713
    Top = 298
    Width = 49
    Height = 25
    Caption = '-'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 16
    OnClick = btnRemoveProcClick
  end
  object btnGerarEvento: TButton [28]
    Left = 767
    Top = 331
    Width = 107
    Height = 25
    Caption = 'Gerar Evento'
    TabOrder = 17
  end
  object dtpkPerApur: TDateTimePicker [29]
    Left = 248
    Top = 336
    Width = 186
    Height = 22
    Date = 44424.972081261570000000
    Time = 44424.972081261570000000
    TabOrder = 18
  end
  object edtValRecBruta: TEdit [30]
    Left = 256
    Top = 96
    Width = 121
    Height = 22
    TabOrder = 19
    OnKeyPress = edtValRecBrutaKeyPress
  end
  inherited MMCadSimples: TMainMenu [31]
  end
  inherited DSPrimario: TDataSource [32]
    DataSet = DMReinf.QReinfR2050
    OnStateChange = nil
  end
  inherited ILBotao: TImageList [33]
  end
  inherited ALCadastro: TActionList [34]
  end
end
