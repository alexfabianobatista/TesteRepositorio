inherited FConhecimentoAduaneiroCons: TFConhecimentoAduaneiroCons
  Caption = 'Consulta Declara'#231#227'o de Tr'#226'nsito Aduaneiro - MIC/DTA'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Left = 208
    Visible = False
  end
  object Label3: TLabel [1]
    Left = 8
    Top = 8
    Width = 51
    Height = 14
    Caption = 'Data Inicial'
  end
  object Label11: TLabel [2]
    Left = 89
    Top = 8
    Width = 47
    Height = 14
    Caption = 'Data Final'
  end
  inherited BtOk: TBitBtn
    TabOrder = 5
  end
  inherited BtCancela: TBitBtn
    TabOrder = 6
  end
  inherited BtProcurar: TBitBtn
    TabOrder = 3
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Left = 208
    Width = 41
    TabOrder = 2
    Visible = False
  end
  inherited DBGrid1: TDBGrid
    TabOrder = 4
    Columns = <
      item
        Expanded = False
        FieldName = 'DT_EMISSAO'
        Title.Caption = 'Emiss'#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_PLACA'
        Title.Caption = 'Placa'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_PLACA_REBOQUE'
        Title.Caption = 'Reboque'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_MOTORISTA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'COD_CIDADE_ORIGEM'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'COD_CIDADE_DESTINO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'COD_CONHECIMENTO_ADUANEIRO'
        Visible = False
      end>
  end
  object MEDTini: TMaskEdit [8]
    Left = 8
    Top = 24
    Width = 67
    Height = 22
    EditMask = '!99/99/##00;1;_'
    MaxLength = 10
    TabOrder = 0
    Text = '  /  /    '
  end
  object MeDtFim: TMaskEdit [9]
    Left = 89
    Top = 24
    Width = 68
    Height = 22
    EditMask = '!99/99/##00;1;_'
    MaxLength = 10
    TabOrder = 1
    Text = '  /  /    '
  end
  inherited DSConsulta: TDataSource
    DataSet = DMConhecimento.QConhecimentoAduaneiroCons
  end
end
