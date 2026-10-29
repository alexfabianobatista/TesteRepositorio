inherited FAgendamentoCons: TFAgendamentoCons
  Left = 333
  Top = 101
  Width = 860
  Height = 606
  Caption = 'Consulta de Agendamentos'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Left = 704
    Top = 0
    Visible = False
  end
  inherited LblNumRegistros: TLabel
    Top = 283
  end
  inherited BtOk: TBitBtn
    Left = 446
    Top = 527
  end
  inherited BtCancela: TBitBtn
    Left = 334
    Top = 527
  end
  inherited BtProcurar: TBitBtn
    Left = 659
    Top = 40
    Width = 117
    Height = 41
    TabOrder = 0
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Left = 704
    Top = 16
    Width = 17
    TabOrder = 1
    Visible = False
  end
  object GBDataAgedamento: TGroupBox [6]
    Left = 300
    Top = 18
    Width = 157
    Height = 71
    Caption = 'Dt. Agendamento'
    TabOrder = 5
    object Label10: TLabel
      Left = 10
      Top = 18
      Width = 24
      Height = 14
      Caption = 'Incial'
    end
    object Label11: TLabel
      Left = 81
      Top = 18
      Width = 22
      Height = 14
      Caption = 'Final'
    end
    object MeAgendamentoIni: TMaskEdit
      Left = 8
      Top = 34
      Width = 61
      Height = 22
      EditMask = '!99/99/00##;1;_'
      MaxLength = 10
      TabOrder = 0
      Text = '  /  /    '
    end
    object MeAgendamentoFin: TMaskEdit
      Left = 80
      Top = 34
      Width = 61
      Height = 22
      EditMask = '!99/99/00##;1;_'
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
    end
  end
  inherited DBGrid1: TDBGrid
    Left = 0
    Top = 104
    Width = 848
    Height = 415
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_AGENDAMENTO'
        Title.Caption = 'C'#243'digo'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_CADASTRO'
        Title.Caption = 'Nome Cliente'
        Width = 233
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_ENTRADA'
        Title.Caption = 'Entrada'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_AGENDAMENTO'
        Title.Caption = 'Agendamento'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_OBS'
        Title.Caption = 'Modelo do Produto'
        Width = 234
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_ATRASADO'
        Title.Caption = 'Atrasado'
        Width = 59
        Visible = True
      end>
  end
  inline FmFilial1: TFmFilial [8]
    Left = 16
    Top = 10
    Width = 265
    Height = 37
    TabOrder = 7
    inherited Label1: TLabel
      Height = 14
    end
    inherited MeFilial: TMaskEdit
      Height = 22
    end
    inherited EdFilial: TEdit
      Height = 22
    end
  end
  inline FmCadastro1: TFmCadastro [9]
    Left = 16
    Top = 52
    Width = 265
    Height = 37
    TabOrder = 8
    inherited Label1: TLabel
      Width = 44
      Height = 14
    end
    inherited MeCadastro: TMaskEdit
      Height = 22
    end
    inherited EdCadastro: TEdit
      Height = 22
    end
  end
  object RGAtrasado: TRadioGroup
    Left = 476
    Top = 18
    Width = 124
    Height = 70
    Caption = 'Atrasado'
    ItemIndex = 2
    Items.Strings = (
      'Sim'
      'N'#227'o'
      'Todos')
    TabOrder = 6
  end
  inherited DSConsulta: TDataSource
    DataSet = DMCadastro.QAgendamentoCons
    Left = 760
    Top = 88
  end
  inherited PopupMenu1: TPopupMenu
    Left = 728
    Top = 88
  end
end
