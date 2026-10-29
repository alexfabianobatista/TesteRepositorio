inherited FConsultaProcessoR1070: TFConsultaProcessoR1070
  Left = 492
  Top = 213
  Width = 605
  Height = 365
  Caption = 'Consulta Processo R1070'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Width = 46
    Caption = 'Processo'
  end
  inherited LblNumRegistros: TLabel
    Top = 295
  end
  object Label2: TLabel [2]
    Left = 336
    Top = 8
    Width = 20
    Height = 14
    Caption = 'Tipo'
  end
  object Label3: TLabel [3]
    Left = 8
    Top = 48
    Width = 28
    Height = 14
    Caption = 'Entre:'
  end
  object Label4: TLabel [4]
    Left = 216
    Top = 48
    Width = 6
    Height = 14
    Caption = 'e'
  end
  object Label5: TLabel [5]
    Left = 176
    Top = 6
    Width = 44
    Height = 14
    Caption = 'Cadastro'
  end
  object Label6: TLabel [6]
    Left = 418
    Top = 48
    Width = 23
    Height = 14
    Caption = 'Vara'
  end
  inherited BtOk: TBitBtn
    Left = 499
    Top = 299
  end
  inherited BtCancela: TBitBtn
    Left = 411
    Top = 299
  end
  inherited BtProcurar: TBitBtn
    Left = 500
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Width = 161
    EditMask = '!999999999999999999999;1;_'
    MaxLength = 21
    Text = '                     '
  end
  inherited DBGrid1: TDBGrid
    Top = 96
    Width = 573
    Height = 200
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_REINF_R1070'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NUM_PROCESSO'
        Title.Caption = 'Processo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_PROCESSO'
        Title.Caption = 'Tipo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_VARA'
        Title.Caption = 'Vara'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_INI_VALIDADE'
        Title.Caption = 'Inicio Validade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_FIM_VALIDADE'
        Title.Caption = 'Final Validade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Cadastro'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_CIDADE'
        Title.Caption = 'Cidade Processo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_ESTADO'
        Title.Caption = 'Estado Processo'
        Visible = True
      end>
  end
  object cbTipoProcesso: TComboBox [12]
    Left = 336
    Top = 24
    Width = 145
    Height = 22
    ItemHeight = 14
    ItemIndex = 0
    TabOrder = 5
    Items.Strings = (
      ''
      'Administrativo'
      'Judicial')
  end
  object EdtCadastro: TEdit [13]
    Left = 176
    Top = 24
    Width = 153
    Height = 22
    TabOrder = 6
  end
  object DtInicio: TDateTimePicker [14]
    Left = 8
    Top = 64
    Width = 186
    Height = 22
    Date = 44425.004955405090000000
    Time = 44425.004955405090000000
    TabOrder = 7
  end
  object DtFim: TDateTimePicker [15]
    Left = 216
    Top = 63
    Width = 186
    Height = 22
    Date = 44425.005024872680000000
    Time = 44425.005024872680000000
    TabOrder = 8
  end
  object MEVara: TMaskEdit [16]
    Left = 416
    Top = 63
    Width = 120
    Height = 22
    EditMask = '!99999;1;_'
    MaxLength = 5
    TabOrder = 9
    Text = '     '
  end
  inherited DSConsulta: TDataSource
    DataSet = DMReinf.QProcessoR1070Cons
    Left = 400
  end
  inherited PopupMenu1: TPopupMenu
    Left = 368
  end
end
