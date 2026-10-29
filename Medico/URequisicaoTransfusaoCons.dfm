inherited FRequisicaoTransfusaoCons: TFRequisicaoTransfusaoCons
  Left = 294
  Top = 199
  Width = 606
  Height = 400
  Caption = 'Consulta'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Width = 44
    Caption = 'Cadastro'
    Transparent = True
    Visible = False
  end
  inherited BtOk: TBitBtn
    Left = 216
    Top = 328
    TabOrder = 4
  end
  inherited BtCancela: TBitBtn
    Left = 344
    Top = 328
    TabOrder = 5
  end
  inherited BtProcurar: TBitBtn
    Left = 424
    Top = 16
    TabOrder = 2
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    TabOrder = 1
    Visible = False
  end
  inherited DBGrid1: TDBGrid
    Left = 18
    Top = 124
    Width = 567
    Height = 193
    TabOrder = 3
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_REQUISICAO_TRANSFUSAO'
        Title.Caption = 'C'#243'd.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_CADASTRO'
        Title.Caption = 'C'#243'd.Paciente'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Paciente'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_TIPO_REQUISICAO'
        Title.Caption = 'Tipo Requisi'#231#227'o'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_HEMOCOMPONENTE'
        Title.Caption = 'Hemoc.'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NUM_BOLSA_SUS'
        Title.Caption = 'Num.Bolsa SUS'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NUM_DOACAO'
        Title.Caption = 'Num. Doa'#231#227'o'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DESC_INICIAIS'
        Title.Caption = 'Iniciais'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DESC_TA'
        Title.Caption = 'T.A.'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DESC_COOMBS'
        Title.Caption = 'COOMBS'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DESC_RESULTADO'
        Title.Caption = 'Res.'
        Visible = False
      end
      item
        Expanded = False
        Title.Caption = 'Teste Hemolise'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DESC_ORIGEM'
        Title.Caption = 'Origem'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DT_COLETA'
        Title.Caption = 'Data Coleta'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_TIPO_SANGUINEO'
        Title.Caption = 'ABO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'IND_RH'
        Title.Caption = 'Rh'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'IND_PAI'
        Title.Caption = 'Pai'
        Visible = False
      end>
  end
  inline FmCadastro1: TFmCadastro [6]
    Left = 8
    Top = 8
    Width = 267
    Height = 55
    TabOrder = 0
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
  object RG0Tipo: TRadioGroup
    Left = 288
    Top = 8
    Width = 112
    Height = 70
    Caption = 'Tipo Requisi'#231#227'o'
    Items.Strings = (
      'EMERG'#202'NCIA'
      'URG'#202'NCIA'
      'ROTINA')
    TabOrder = 6
  end
  object GB0DataColeta: TGroupBox
    Left = 16
    Top = 56
    Width = 180
    Height = 61
    Caption = 'Data coleta'
    TabOrder = 7
    object Label2: TLabel
      Left = 10
      Top = 16
      Width = 24
      Height = 14
      Caption = 'Inicio'
    end
    object Label3: TLabel
      Left = 97
      Top = 16
      Width = 16
      Height = 14
      Caption = 'Fim'
    end
    object ME0DtInicial: TMaskEdit
      Left = 8
      Top = 32
      Width = 75
      Height = 22
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 0
      Text = '  /  /    '
    end
    object ME0DtFinal: TMaskEdit
      Left = 95
      Top = 32
      Width = 75
      Height = 22
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
    end
  end
  inherited DSConsulta: TDataSource
    DataSet = DMRequisicaoTransfusao.QRequisicaoTransfusaoCons
    Left = 448
    Top = 56
  end
end
