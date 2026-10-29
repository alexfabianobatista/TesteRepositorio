inherited FGuiaTransito_Cons: TFGuiaTransito_Cons
  Left = 359
  Top = 190
  Width = 447
  Height = 386
  Caption = 'Consulta Guia de Tr'#226'nsito'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Width = 16
    Caption = 'De '
  end
  object Label2: TLabel [1]
    Left = 104
    Top = 8
    Width = 17
    Height = 14
    Caption = 'At'#233
  end
  inherited BtOk: TBitBtn
    Left = 80
    Top = 320
  end
  inherited BtCancela: TBitBtn
    Left = 240
    Top = 320
  end
  inherited BtProcurar: TBitBtn
    Left = 336
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Width = 79
    EditMask = '!99/99/##00;1;_'
    MaxLength = 10
    Text = '  /  /    '
  end
  inherited DBGrid1: TDBGrid
    Width = 425
    Height = 249
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_GUIA_TRANSITO'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_GUIA_TRANSITO'
        Title.Caption = 'Numero'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_SERIE'
        Title.Caption = 'Serie'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_EMISSAO'
        Title.Caption = 'Dt. Emissao'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_NOTA_CAB'
        Title.Caption = 'Nota'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_CONSIGNATARIO'
        Title.Caption = 'Consignat'#225'rio'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_HORA'
        Title.Caption = 'Hora'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_DESTINO'
        Title.Caption = 'Destino'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_LACRE'
        Title.Caption = 'Lacre'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_TEMPERATURA'
        Title.Caption = 'Temperatura'
        Width = 64
        Visible = True
      end>
  end
  object MeDtFim: TMaskEdit [7]
    Left = 104
    Top = 24
    Width = 79
    Height = 22
    EditMask = '!99/99/##00;1;_'
    MaxLength = 10
    TabOrder = 5
    Text = '  /  /    '
  end
  inherited DSConsulta: TDataSource
    DataSet = DMGuiaTransito.QGuiaTransito_Cons
    Left = 360
    Top = 320
  end
end
