object FReinf: TFReinf
  Left = 593
  Top = 245
  Width = 1060
  Height = 626
  Caption = 'SPED-Reinf'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1044
    Height = 587
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 53
      Height = 13
      Caption = 'Data Inicial'
    end
    object Label2: TLabel
      Left = 205
      Top = 24
      Width = 48
      Height = 13
      Caption = 'Data Final'
    end
    object Label3: TLabel
      Left = 810
      Top = 248
      Width = 89
      Height = 13
      Caption = 'Ambiente de Envio'
    end
    object Label4: TLabel
      Left = 379
      Top = 47
      Width = 132
      Height = 13
      Caption = 'Informa'#231#245'es do Contribuinte'
    end
    object Label5: TLabel
      Left = 376
      Top = 111
      Width = 143
      Height = 13
      Caption = 'Proc: Administrativos/Judiciais'
    end
    object Label18: TLabel
      Left = 377
      Top = 172
      Width = 130
      Height = 13
      Caption = 'Suspens'#245'es dos Processos'
    end
    object MCalendarInicio: TMonthCalendar
      Left = 16
      Top = 48
      Width = 169
      Height = 153
      Date = 44348.018204340270000000
      TabOrder = 0
    end
    object MCalendarFim: TMonthCalendar
      Left = 199
      Top = 43
      Width = 162
      Height = 161
      Date = 44383.018204340270000000
      TabOrder = 1
    end
    object DBGrid1: TDBGrid
      Left = 8
      Top = 296
      Width = 1025
      Height = 257
      DataSource = DMReinf.DSReinfPeriodo
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
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
          Visible = False
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
          Title.Caption = 'Mensagem Erro'
          Width = 100
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
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_GERACAO_REINF'
          Title.Caption = 'Data da Gera'#231#227'o'
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
    object btnFiltrar: TButton
      Left = 8
      Top = 264
      Width = 75
      Height = 25
      Caption = 'Filtrar'
      TabOrder = 3
      OnClick = btnFiltrarClick
    end
    object cbAmbienteEnvio: TComboBox
      Left = 810
      Top = 264
      Width = 207
      Height = 21
      ItemHeight = 13
      ItemIndex = 1
      TabOrder = 4
      Text = '2 - Produ'#231#227'o restrita - Homologa'#231#227'o'
      Items.Strings = (
        '1 - Produ'#231#227'o'
        '2 - Produ'#231#227'o restrita - Homologa'#231#227'o')
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
      TabOrder = 5
      OnClick = btnR100Click
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
      TabOrder = 6
      OnClick = btnR1070Click
    end
    object GroupBox1: TGroupBox
      Left = 521
      Top = 40
      Width = 169
      Height = 201
      Caption = 'Contribui'#231#227'o Previdenci'#225'ria'
      TabOrder = 7
      object Label6: TLabel
        Left = 16
        Top = 12
        Width = 88
        Height = 13
        Caption = 'Servi'#231'os Tomados'
      end
      object Label7: TLabel
        Left = 16
        Top = 73
        Width = 91
        Height = 13
        Caption = 'Servi'#231'os Prestados'
      end
      object Label10: TLabel
        Left = 16
        Top = 133
        Width = 29
        Height = 13
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
      end
      object btnR2020: TBitBtn
        Left = 16
        Top = 89
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
        Top = 149
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
    object GroupBox2: TGroupBox
      Left = 695
      Top = 40
      Width = 169
      Height = 201
      Caption = 'Produ'#231#227'o Rural/Agr'#237'cola'
      TabOrder = 8
      object Label8: TLabel
        Left = 16
        Top = 30
        Width = 77
        Height = 13
        Caption = 'Comercializa'#231#227'o'
      end
      object Label9: TLabel
        Left = 16
        Top = 102
        Width = 110
        Height = 13
        Caption = 'Aquisi'#231#227'o de Produ'#231#227'o'
      end
      object BitBtn1: TBitBtn
        Left = 16
        Top = 49
        Width = 137
        Height = 41
        Caption = 'R-2050'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object BitBtn2: TBitBtn
        Left = 16
        Top = 121
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
    end
    object GroupBox3: TGroupBox
      Left = 870
      Top = 40
      Width = 169
      Height = 201
      Caption = 'Eventos'
      TabOrder = 9
      object Label11: TLabel
        Left = 16
        Top = 13
        Width = 53
        Height = 13
        Caption = 'Reabertura'
      end
      object Label12: TLabel
        Left = 16
        Top = 72
        Width = 59
        Height = 13
        Caption = 'Fechamento'
      end
      object Label17: TLabel
        Left = 16
        Top = 133
        Width = 43
        Height = 13
        Caption = 'Exclus'#227'o'
      end
      object btnR2098: TBitBtn
        Left = 16
        Top = 27
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
      end
      object btnR9000: TBitBtn
        Left = 16
        Top = 149
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
    object GroupBox4: TGroupBox
      Left = 96
      Top = 254
      Width = 281
      Height = 41
      Caption = 'Legenda'
      TabOrder = 10
      object Label13: TLabel
        Left = 25
        Top = 15
        Width = 27
        Height = 13
        Caption = 'Salvo'
      end
      object Label14: TLabel
        Left = 94
        Top = 15
        Width = 35
        Height = 13
        Caption = 'Gerado'
      end
      object Label16: TLabel
        Left = 233
        Top = 15
        Width = 39
        Height = 13
        Caption = 'Enviado'
      end
      object Label15: TLabel
        Left = 163
        Top = 15
        Width = 19
        Height = 13
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
    object btnSuspensao: TBitBtn
      Left = 376
      Top = 184
      Width = 137
      Height = 41
      Caption = 'Suspens'#245'es'
      TabOrder = 11
      OnClick = btnSuspensaoClick
    end
  end
end
