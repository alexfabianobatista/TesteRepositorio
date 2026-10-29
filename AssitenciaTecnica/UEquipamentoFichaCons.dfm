inherited FEquipamentoCons: TFEquipamentoCons
  Left = 463
  Top = 336
  Width = 605
  Caption = 'Consultar Equipamento de Inspe'#231#227'o'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Left = 104
    Width = 61
    Caption = 'Equipamento'
  end
  object Label2: TLabel [2]
    Left = 8
    Top = 8
    Width = 33
    Height = 14
    Caption = 'C'#243'digo'
  end
  inherited BtOk: TBitBtn
    Left = 499
  end
  inherited BtCancela: TBitBtn
    Left = 411
  end
  inherited BtProcurar: TBitBtn
    Left = 500
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Left = 104
  end
  inherited DBGrid1: TDBGrid
    Width = 573
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_EQUIPAMENTO_FICHA'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_EQUIPAMENTO_FICHA'
        Title.Caption = 'Equipamento'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_TIPO_EQUIPAMENTO_FICHA'
        Title.Caption = 'Tipo de Equipamento'
        Width = 220
        Visible = True
      end>
  end
  object MECodigo: TMaskEdit [8]
    Left = 8
    Top = 24
    Width = 80
    Height = 22
    EditMask = '######'
    MaxLength = 6
    TabOrder = 5
    Text = '      '
  end
  object CBTipoEquipamento: TComboBox [9]
    Left = 272
    Top = 24
    Width = 145
    Height = 22
    ItemHeight = 14
    TabOrder = 6
    Items.Strings = (
      'SITUA'#199#195'O EXTERNA'
      'EQUIPAMENTO'
      'MOTOR')
  end
  inherited DSConsulta: TDataSource
    DataSet = DMOrdemServico.QEquipamentoFichaCons
    Left = 448
    Top = 0
  end
  inherited PopupMenu1: TPopupMenu
    Left = 416
    Top = 0
  end
end
