inherited FLancamentoCons: TFLancamentoCons
  Left = 259
  Top = 166
  Width = 629
  Height = 401
  Caption = 'Consulta de Lan'#231'amentos'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Left = 291
    Top = 13
    Width = 86
    Caption = 'Nome do Paci'#234'nte'
  end
  object Bevel1: TBevel [1]
    Left = 8
    Top = 8
    Width = 601
    Height = 161
  end
  inherited BtOk: TBitBtn
    Left = 192
    Top = 336
    TabOrder = 6
  end
  inherited BtCancela: TBitBtn
    Left = 304
    Top = 336
    TabOrder = 7
  end
  inherited BtProcurar: TBitBtn
    Left = 520
    TabOrder = 2
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Left = 290
    Top = 29
    Width = 220
    TabOrder = 3
  end
  inherited DBGrid1: TDBGrid
    Top = 176
    Width = 601
    Height = 145
    TabOrder = 5
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_LANCAMENTO'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_LANCAMENTO'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_PAGAMENTO'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_PAGAMENTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_PAGAMENTO'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_CONVENIO'
        Width = 121
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_MEDICO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_PACIENTE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_CONVENIO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'IND_TIPO_PAGAMENTO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'COD_MEDICO'
        Visible = False
      end>
  end
  object RgTipoPagamento: TRadioGroup [7]
    Left = 392
    Top = 104
    Width = 209
    Height = 57
    Caption = 'Tipo Pagamento'
    Columns = 3
    ItemIndex = 2
    Items.Strings = (
      'Conv'#234'nio'
      'Particular'
      'Todos')
    TabOrder = 4
  end
  inline FmMedico: TFmMedico [8]
    Left = 16
    Top = 16
    Width = 265
    Height = 37
    TabOrder = 0
    inherited LblMedico: TLabel
      Width = 34
      Height = 14
    end
    inherited MeMedico: TMaskEdit
      Height = 22
    end
    inherited EdMedico: TEdit
      Height = 22
    end
  end
  inline FmDatasLancamento: TFmDatas
    Left = 10
    Top = 97
    Width = 191
    Height = 71
    TabOrder = 8
    inherited GroupBox1: TGroupBox
      Top = 7
      Width = 177
      Caption = 'Dt. Lan'#231'amento'
      inherited Label1: TLabel
        Width = 26
        Height = 14
      end
      inherited Label2: TLabel
        Height = 14
      end
      inherited MeDtInicial: TMaskEdit
        Height = 22
      end
      inherited MeDtFinal: TMaskEdit
        Height = 22
      end
    end
  end
  inline FmConvenio: TFmConvenio
    Left = 16
    Top = 56
    Width = 265
    Height = 37
    TabOrder = 1
    inherited LblConvenio: TLabel
      Height = 14
    end
    inherited MeConvenio: TMaskEdit
      Height = 22
    end
    inherited EdConvenio: TEdit
      Height = 22
    end
  end
  inline FmDatasPagamento: TFmDatas
    Left = 199
    Top = 96
    Width = 193
    Height = 71
    TabOrder = 9
    inherited GroupBox1: TGroupBox
      Width = 177
      Caption = 'Dt.Pagamento'
      inherited Label1: TLabel
        Width = 26
        Height = 14
      end
      inherited Label2: TLabel
        Height = 14
      end
      inherited MeDtInicial: TMaskEdit
        Height = 22
      end
      inherited MeDtFinal: TMaskEdit
        Height = 22
      end
    end
  end
  object RGSituacaoCons: TRadioGroup
    Left = 290
    Top = 56
    Width = 222
    Height = 41
    Caption = 'Situa'#231#227'o'
    Columns = 3
    Items.Strings = (
      #192' pagar'
      'Pago'
      'Todos')
    TabOrder = 10
  end
  inherited DSConsulta: TDataSource
    DataSet = DMLancamento.QLancamentoCons
    Left = 8
    Top = 336
  end
end
