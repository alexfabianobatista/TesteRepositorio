inherited FReinfGeral: TFReinfGeral
  Left = 302
  Top = 42
  Caption = 'SPED-Reinf'
  ClientHeight = 625
  ClientWidth = 1052
  PixelsPerInch = 96
  TextHeight = 14
  inherited Panel1: TPanel
    Width = 1052
    inherited lbPesquisaCodigo: TLabel
      Left = 910
    end
    inherited SBConsulta: TSpeedButton
      Left = 1017
    end
    inherited pnSeparador2: TPanel
      Left = 901
    end
    inherited MELocaliza: TMaskEdit
      Left = 968
    end
  end
  inherited StBLongHint: TStatusBar
    Top = 606
    Width = 1052
  end
  object Panel2: TPanel [3]
    Left = 0
    Top = 41
    Width = 1052
    Height = 565
    Align = alClient
    BorderStyle = bsSingle
    TabOrder = 2
    object Label5: TLabel
      Left = 376
      Top = 111
      Width = 145
      Height = 14
      Caption = 'Proc: Administrativos/Judiciais'
    end
    object Label4: TLabel
      Left = 379
      Top = 47
      Width = 135
      Height = 14
      Caption = 'Informa'#231#245'es do Contribuinte'
    end
    object Label2: TLabel
      Left = 205
      Top = 24
      Width = 47
      Height = 14
      Caption = 'Data Final'
    end
    object Label18: TLabel
      Left = 377
      Top = 172
      Width = 137
      Height = 14
      Caption = 'Suspens'#245'es dos Processos'
    end
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 51
      Height = 14
      Caption = 'Data Inicial'
    end
    object MCalendarInicio: TMonthCalendar
      Left = 19
      Top = 43
      Width = 169
      Height = 163
      Date = 0.948447974536975400
      TabOrder = 0
    end
    object MCalendarFim: TMonthCalendar
      Left = 199
      Top = 43
      Width = 162
      Height = 161
      Date = 0.948447974536975400
      TabOrder = 1
    end
    object GroupBox4: TGroupBox
      Left = 104
      Top = 254
      Width = 217
      Height = 41
      Caption = 'Legenda'
      TabOrder = 2
      object Label14: TLabel
        Left = 30
        Top = 15
        Width = 36
        Height = 14
        Caption = 'Gerado'
      end
      object Label16: TLabel
        Left = 169
        Top = 15
        Width = 38
        Height = 14
        Caption = 'Enviado'
      end
      object Label15: TLabel
        Left = 99
        Top = 15
        Width = 20
        Height = 14
        Caption = 'Erro'
      end
      object Panel4: TPanel
        Left = 11
        Top = 15
        Width = 17
        Height = 17
        BorderStyle = bsSingle
        Color = clYellow
        TabOrder = 0
      end
      object Panel5: TPanel
        Left = 81
        Top = 15
        Width = 17
        Height = 17
        BorderStyle = bsSingle
        Color = clRed
        TabOrder = 1
      end
      object Panel6: TPanel
        Left = 151
        Top = 15
        Width = 17
        Height = 17
        BorderStyle = bsSingle
        Color = clMoneyGreen
        TabOrder = 2
      end
    end
    object GroupBox3: TGroupBox
      Left = 870
      Top = 40
      Width = 169
      Height = 201
      Caption = 'Eventos'
      TabOrder = 3
      object Label11: TLabel
        Left = 16
        Top = 12
        Width = 54
        Height = 14
        Caption = 'Reabertura'
      end
      object Label12: TLabel
        Left = 16
        Top = 72
        Width = 59
        Height = 14
        Caption = 'Fechamento'
        Transparent = False
      end
      object Label17: TLabel
        Left = 16
        Top = 132
        Width = 44
        Height = 14
        Caption = 'Exclus'#227'o'
      end
      object btnR2098: TBitBtn
        Left = 16
        Top = 28
        Width = 137
        Height = 41
        Caption = 'R-2098'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = btnR2098Click
      end
      object btnR2099: TBitBtn
        Left = 16
        Top = 88
        Width = 137
        Height = 41
        Caption = 'R-2099'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnR2099Click
      end
      object btnR9000: TBitBtn
        Left = 16
        Top = 148
        Width = 137
        Height = 41
        Caption = 'R-9000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
    end
    object GroupBox2: TGroupBox
      Left = 695
      Top = 40
      Width = 169
      Height = 201
      Caption = 'Produ'#231#227'o Rural/Agr'#237'cola'
      TabOrder = 4
      object Label8: TLabel
        Left = 16
        Top = 72
        Width = 48
        Height = 14
        Caption = 'Aquisi'#231#227'o'
        Transparent = False
      end
      object Label9: TLabel
        Left = 16
        Top = 12
        Width = 79
        Height = 14
        Caption = 'Comercializa'#231#227'o'
      end
      object btnR2055: TBitBtn
        Left = 16
        Top = 88
        Width = 137
        Height = 41
        Caption = 'R-2055'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = btnR2055Click
      end
      object btnR2050: TBitBtn
        Left = 16
        Top = 28
        Width = 137
        Height = 41
        Caption = 'R-2050'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnR2050Click
      end
    end
    object GroupBox1: TGroupBox
      Left = 521
      Top = 40
      Width = 169
      Height = 201
      Caption = 'Contribui'#231#227'o Previdenci'#225'ria'
      TabOrder = 5
      object Label6: TLabel
        Left = 16
        Top = 12
        Width = 89
        Height = 14
        Caption = 'Servi'#231'os Tomados'
      end
      object Label7: TLabel
        Left = 16
        Top = 72
        Width = 95
        Height = 14
        Caption = 'Servi'#231'os Prestados'
        Transparent = False
      end
      object Label10: TLabel
        Left = 16
        Top = 132
        Width = 27
        Height = 14
        Caption = 'CPRB'
      end
      object btnR2010: TBitBtn
        Left = 16
        Top = 28
        Width = 137
        Height = 41
        Caption = 'R-2010'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = btnR2010Click
      end
      object btnR2020: TBitBtn
        Left = 16
        Top = 88
        Width = 137
        Height = 41
        Caption = 'R-2020'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object BitBtn3: TBitBtn
        Left = 16
        Top = 148
        Width = 137
        Height = 41
        Caption = 'R-2060'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
    end
    object DBGReinfPeriodo: TDBGrid
      Left = 8
      Top = 296
      Width = 1025
      Height = 257
      DataSource = DSPrimario
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = PopupMouseClick
      ReadOnly = True
      TabOrder = 6
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Arial'
      TitleFont.Style = []
      OnCellClick = DBGReinfPeriodoCellClick
      OnDrawColumnCell = DBGReinfPeriodoDrawColumnCell
      OnMouseDown = DBGReinfPeriodoMouseDown
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_REINF_PERIODO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DESC_EVENTO_REINF'
          Title.Caption = 'Evento'
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_EVENTO_REINF'
          Title.Caption = 'Cod. Evento Reinf'
          Width = 97
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_FILIAL'
          Title.Caption = 'Filial'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_INI_EVENTO'
          Title.Caption = 'Data Inicial'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_FIM_EVENTO'
          Title.Caption = 'Data Final'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESC_XML_ID'
          Title.Caption = 'ID Gerado'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESC_XML_EVENTO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DESC_COD_ERRO_ENVIO'
          Title.Caption = 'Cod. Erro'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESC_MSG_RETORNO'
          Title.Caption = 'Mensagem Retorno'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESC_XML_ID_RETORNO'
          Title.Caption = 'ID Retorno'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESC_XML_RETORNO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DESC_XML_HASH_RETORNO'
          Title.Caption = 'Hash Retorno'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESC_XML_PROTOCOLO'
          Title.Caption = 'Protocolo'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_GERACAO_REINF'
          Title.Caption = 'Data da Gera'#231#227'o'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_USUARIO'
          Title.Caption = 'Usu'#225'rio'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'IND_SITUACAO'
          Title.Caption = 'Situa'#231#227'o'
          Visible = True
        end>
    end
    object btnSuspensao: TBitBtn
      Left = 376
      Top = 184
      Width = 137
      Height = 41
      Caption = 'Suspens'#245'es'
      TabOrder = 7
      OnClick = btnSuspensaoClick
    end
    object btnR1070: TBitBtn
      Left = 376
      Top = 125
      Width = 137
      Height = 41
      Caption = 'R-1070'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      OnClick = btnR1070Click
    end
    object btnR100: TBitBtn
      Left = 376
      Top = 61
      Width = 137
      Height = 41
      Caption = 'R-1000'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
      OnClick = btnR100Click
    end
    object btnFiltrar: TButton
      Left = 8
      Top = 264
      Width = 75
      Height = 25
      Caption = 'Filtrar'
      TabOrder = 10
      OnClick = btnFiltrarClick
    end
  end
  inherited MMCadSimples: TMainMenu
    inherited Relatrios1: TMenuItem
      object ConciliaoR20551: TMenuItem
        Caption = 'Concilia'#231#227'o R-2055'
        OnClick = ConciliaoR20551Click
      end
    end
    object Gerao1: TMenuItem
      Caption = 'Gera'#231#227'o'
      object AquisioporPerodo1: TMenuItem
        Caption = 'Aquisi'#231#227'o por Per'#237'odo'
        OnClick = AquisioporPerodo1Click
      end
      object EncerrarPerodo1: TMenuItem
        Caption = 'Encerrar Per'#237'odo'
        OnClick = EncerrarPerodo1Click
      end
    end
  end
  inherited DSPrimario: TDataSource
    DataSet = DMReinf.QReinfPeriodo
  end
  object PopupMouseClick: TPopupMenu
    Left = 896
    Top = 545
    object SalvarXML1: TMenuItem
      Caption = 'Salvar XML'
      OnClick = SalvarXML1Click
    end
    object DownAction1: TMenuItem
      Caption = 'Reenvio'
      OnClick = Reenviar1Click
    end
  end
  object SaveXMLDlg: TSaveDialog
    DefaultExt = 'XML'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Selecione onde salvar.'
    Left = 928
    Top = 545
  end
end
