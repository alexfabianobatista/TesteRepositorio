inherited FReinfR2010: TFReinfR2010
  Left = 210
  Top = 41
  BorderStyle = bsSingle
  Caption = 'Reinf R-2010 - Servi'#231'os Tomados'
  ClientHeight = 615
  ClientWidth = 881
  PixelsPerInch = 96
  TextHeight = 14
  object lblCnpjCno: TLabel [1]
    Left = 8
    Top = 200
    Width = 50
    Height = 14
    Caption = 'CNPJ/CNO'
  end
  object Label1: TLabel [2]
    Left = 248
    Top = 72
    Width = 51
    Height = 14
    Caption = 'Total Bruto'
  end
  object Label2: TLabel [3]
    Left = 248
    Top = 111
    Width = 99
    Height = 14
    Caption = 'Total Base Reten'#231#227'o'
  end
  object Label3: TLabel [4]
    Left = 248
    Top = 150
    Width = 98
    Height = 14
    Caption = 'Total Retido Principal'
  end
  object Label4: TLabel [5]
    Left = 248
    Top = 190
    Width = 101
    Height = 14
    Caption = 'Total Retido Adicional'
  end
  object Label5: TLabel [6]
    Left = 247
    Top = 229
    Width = 120
    Height = 14
    Caption = 'Total N'#227'o Retido Principal'
  end
  object Label6: TLabel [7]
    Left = 247
    Top = 268
    Width = 123
    Height = 14
    Caption = 'Total N'#227'o Retido Adicional'
  end
  object Label7: TLabel [8]
    Left = 400
    Top = 88
    Width = 83
    Height = 14
    Caption = 'Notas do Servi'#231'o'
  end
  object Label8: TLabel [9]
    Left = 552
    Top = 312
    Width = 53
    Height = 14
    Caption = 'Refer'#234'ncia'
  end
  object lblRetif: TLabel [10]
    Left = 416
    Top = 312
    Width = 82
    Height = 14
    Caption = 'Recibo a retificar'
    Visible = False
  end
  inherited Panel1: TPanel
    Width = 881
    inherited lbPesquisaCodigo: TLabel
      Left = 739
    end
    inherited SBConsulta: TSpeedButton
      Left = 846
    end
    inherited pnSeparador2: TPanel
      Left = 730
    end
    inherited MELocaliza: TMaskEdit
      Left = 797
    end
  end
  inherited StBLongHint: TStatusBar
    Top = 596
    Width = 881
  end
  object dbgReinf2010: TDBGrid [13]
    Left = 8
    Top = 360
    Width = 868
    Height = 233
    DataSource = DMReinf.DSReinfR2010Cons
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    OnCellClick = dbgReinf2010CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_REINF_R2010'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO'
        Title.Caption = 'Tipo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_NUM_RECIBO'
        Title.Caption = 'Recibo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_FILIAL'
        Title.Caption = 'Filial'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTRATANTE'
        Title.Caption = 'Contratante'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRESTADOR'
        Title.Caption = 'Prestador'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_OBRA'
        Title.Caption = #201' Obra?'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_ESTAB_CNPJ_CNO'
        Title.Caption = 'C'#243'digo Estabelecimento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_TP_CNPJ_CNO'
        Title.Caption = 'Tipo C'#243'digo Estabelecimento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_TOTAL_BRUTO'
        Title.Caption = 'Total Bruto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_TOTAL_BASE_RETENCAO'
        Title.Caption = 'Total Base Reten'#231#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_TOTAL_RETIDO_PRINCIPAL'
        Title.Caption = 'Total Retido Principal'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_TOTAL_RETIDO_ADICIONAL'
        Title.Caption = 'Total Retido Adicional'
        Visible = True
      end>
  end
  inline FmFilialR2010: TFmFilial [14]
    Left = 8
    Top = 80
    Width = 225
    Height = 37
    TabOrder = 3
    inherited Label1: TLabel
      Height = 14
    end
    inherited MeFilial: TMaskEdit
      Height = 22
      OnExit = FmFilialR2010MeFilialExit
    end
    inherited BtFilial: TBitBtn
      OnClick = FmFilialR2020BtFilialClick
    end
    inherited EdFilial: TEdit
      Width = 149
      Height = 22
    end
  end
  inline FmCadastroPresR2010: TFmCadastro [15]
    Left = 8
    Top = 120
    Width = 225
    Height = 37
    TabOrder = 4
    inherited Label1: TLabel
      Width = 44
      Height = 14
    end
    inherited MeCadastro: TMaskEdit
      Height = 22
      OnExit = FmCadastroPresR2010MeCadastroExit
    end
    inherited BtCadastro: TBitBtn
      OnClick = FmCadastroPresR2010BtCadastroClick
    end
    inherited EdCadastro: TEdit
      Width = 149
      Height = 22
    end
  end
  inline FmCadastroTomR2010: TFmCadastro [16]
    Left = 8
    Top = 160
    Width = 225
    Height = 37
    TabOrder = 5
    inherited Label1: TLabel
      Width = 44
      Height = 14
    end
    inherited MeCadastro: TMaskEdit
      Height = 22
      OnExit = FmCadastroTomR2010MeCadastroExit
    end
    inherited BtCadastro: TBitBtn
      OnClick = FmCadastroTomR2010BtCadastroClick
    end
    inherited EdCadastro: TEdit
      Width = 149
      Height = 22
    end
  end
  object dbeCnpjCno: TDBEdit [17]
    Left = 7
    Top = 214
    Width = 138
    Height = 22
    DataField = 'COD_ESTAB_CNPJ_CNO'
    DataSource = DSPrimario
    TabOrder = 6
  end
  object cbCnpjCno: TCheckBox [18]
    Left = 8
    Top = 239
    Width = 97
    Height = 17
    Caption = 'Usar CNO'
    TabOrder = 7
    OnClick = cbCnpjCnoClick
  end
  object dbeTotalBruto: TDBEdit [19]
    Left = 248
    Top = 86
    Width = 137
    Height = 22
    DataField = 'VAL_TOTAL_BRUTO'
    DataSource = DSPrimario
    TabOrder = 8
  end
  object dbeBaseRetencao: TDBEdit [20]
    Left = 248
    Top = 124
    Width = 137
    Height = 22
    DataField = 'VAL_TOTAL_BASE_RETENCAO'
    DataSource = DSPrimario
    TabOrder = 9
  end
  object dbeTotRetidoPrincipal: TDBEdit [21]
    Left = 248
    Top = 163
    Width = 137
    Height = 22
    DataField = 'VAL_TOTAL_RETIDO_PRINCIPAL'
    DataSource = DSPrimario
    TabOrder = 10
  end
  object dbeTotRetidoAdicional: TDBEdit [22]
    Left = 248
    Top = 204
    Width = 137
    Height = 22
    DataField = 'VAL_TOTAL_RETIDO_ADICIONAL'
    DataSource = DSPrimario
    TabOrder = 11
  end
  object dbeTotNaoRetidoPrincipal: TDBEdit [23]
    Left = 247
    Top = 242
    Width = 137
    Height = 22
    DataField = 'VAL_TOT_NAO_RET_PRINCIPAL'
    DataSource = DSPrimario
    TabOrder = 12
  end
  object dbeTotNaoRetidoAdicional: TDBEdit [24]
    Left = 247
    Top = 281
    Width = 137
    Height = 22
    DataField = 'VAL_TOT_NAO_RET_ADICIONAL'
    DataSource = DSPrimario
    TabOrder = 13
  end
  object dbcbDesoneraFolhaCPRB: TDBCheckBox [25]
    Left = 105
    Top = 240
    Width = 129
    Height = 17
    Caption = 'Prestador CPRB'
    DataField = 'IND_CPRB'
    DataSource = DSPrimario
    TabOrder = 14
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object dbgNotasR2010: TDBGrid [26]
    Left = 400
    Top = 105
    Width = 472
    Height = 177
    DataSource = DMReinf.DsNotasReinf2010
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 15
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_NOTA_X_REGISTRO_REINF'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NUM_NOTA'
        Title.Caption = 'N'#250'mero'
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
        FieldName = 'DT_EMISSAO'
        Title.Caption = 'Emiss'#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_SERIE'
        Title.Caption = 'S'#233'rie'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_BRUTO'
        Title.Caption = 'Valor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBS'
        Visible = True
      end>
  end
  object btnAdiciona: TButton [27]
    Left = 760
    Top = 283
    Width = 49
    Height = 25
    Caption = '+'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 16
    OnClick = btnAdicionaClick
  end
  object btnRemove: TButton [28]
    Left = 816
    Top = 283
    Width = 49
    Height = 25
    Caption = '-'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 17
  end
  object dbrTipoServico: TDBRadioGroup [29]
    Left = 10
    Top = 262
    Width = 223
    Height = 81
    Caption = 'Tipo de Servi'#231'o'
    DataField = 'IND_OBRA'
    DataSource = DSPrimario
    Items.Strings = (
      '0 - N'#227'o '#233' obra.'
      '1 - '#201' obra: empreitada total;'
      '2 - '#201' obra: empreitada parcial.')
    TabOrder = 18
    Values.Strings = (
      '0'
      '1'
      '2')
  end
  object dbcbRetificacao: TDBCheckBox [30]
    Left = 248
    Top = 308
    Width = 97
    Height = 17
    Caption = 'Retifica'#231#227'o'
    DataField = 'IND_RETIFCACAO'
    DataSource = DSPrimario
    TabOrder = 19
    ValueChecked = '2'
    ValueUnchecked = '1'
    OnClick = dbcbRetificacaoClick
  end
  object dbeObsNota: TDBEdit [31]
    Left = 408
    Top = 288
    Width = 305
    Height = 22
    DataField = 'DESC_OBS'
    DataSource = DMReinf.DSNotaxReinf
    TabOrder = 20
  end
  object dtpcDataReferencia: TDateTimePicker [32]
    Left = 552
    Top = 328
    Width = 186
    Height = 22
    Date = 44417.078582083330000000
    Time = 44417.078582083330000000
    TabOrder = 21
  end
  object btnGerarEvento: TButton [33]
    Left = 759
    Top = 328
    Width = 107
    Height = 25
    Caption = 'Gerar Evento'
    TabOrder = 22
  end
  object dbeReciboRetif: TDBEdit [34]
    Left = 248
    Top = 328
    Width = 257
    Height = 22
    DataField = 'DESC_NUM_RECIBO'
    DataSource = DSPrimario
    TabOrder = 23
    Visible = False
  end
  inherited MMCadSimples: TMainMenu [35]
  end
  inherited DSPrimario: TDataSource [36]
    DataSet = DMReinf.QReinfR2010
  end
end
