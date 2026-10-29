inherited FReinfR2098: TFReinfR2098
  Left = 372
  Top = 134
  Caption = 'Reinf R-2098'
  ClientHeight = 513
  ClientWidth = 680
  PixelsPerInch = 96
  TextHeight = 14
  inherited Panel1: TPanel
    Width = 680
    inherited lbPesquisaCodigo: TLabel
      Left = 538
    end
    inherited SBConsulta: TSpeedButton
      Left = 645
    end
    inherited pnSeparador2: TPanel
      Left = 529
    end
    inherited MELocaliza: TMaskEdit
      Left = 596
    end
  end
  inherited StBLongHint: TStatusBar
    Top = 494
    Width = 680
  end
  object Panel2: TPanel [3]
    Left = 0
    Top = 41
    Width = 680
    Height = 453
    Align = alClient
    TabOrder = 2
    object Label1: TLabel
      Left = 25
      Top = 23
      Width = 33
      Height = 14
      Caption = 'C'#243'digo'
    end
    inline FmFilialR2098: TFmFilial
      Left = 24
      Top = 64
      Width = 225
      Height = 37
      Hint = 'Filial'
      TabOrder = 0
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
    object DBGReinfR2098: TDBGrid
      Left = 3
      Top = 208
      Width = 671
      Height = 241
      DataSource = DMReinf.DSReinfR2098Cons
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Arial'
      TitleFont.Style = []
      OnCellClick = DBGReinfR2098CellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_REINF_R2098'
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IND_RETIFCACAO'
          Visible = False
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
          Visible = False
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
          FieldName = 'COD_USUARIO'
          Title.Caption = 'Usu'#225'rio'
          Visible = True
        end>
    end
    object dtpkDataReferencia: TDateTimePicker
      Left = 24
      Top = 133
      Width = 137
      Height = 23
      Date = 44434.995394131950000000
      Time = 44434.995394131950000000
      TabOrder = 2
    end
    object DBECodigo: TDBEdit
      Left = 24
      Top = 40
      Width = 121
      Height = 22
      DataField = 'COD_REINF_R2098'
      DataSource = DSPrimario
      TabOrder = 3
    end
  end
  object btnGerarEvento: TButton [4]
    Left = 549
    Top = 213
    Width = 107
    Height = 25
    Caption = 'Gerar Evento'
    TabOrder = 3
    OnClick = btnGerarEventoClick
  end
  inherited DSPrimario: TDataSource
    DataSet = DMReinf.QReinfR2098
    OnStateChange = nil
  end
end
