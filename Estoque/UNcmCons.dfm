inherited FNcmCons: TFNcmCons
  Left = 530
  Top = 274
  Width = 590
  Caption = 'Consulta de NCM'
  DesignSize = (
    574
    262)
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Left = 120
    Width = 49
    Caption = 'Descri'#231#227'o'
  end
  object Label2: TLabel [1]
    Left = 8
    Top = 8
    Width = 33
    Height = 14
    Caption = 'C'#243'digo'
  end
  inherited BtOk: TBitBtn
    Left = 484
    Top = 235
  end
  inherited BtCancela: TBitBtn
    Left = 396
    Top = 235
  end
  inherited BtProcurar: TBitBtn
    Left = 485
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Left = 120
    Width = 361
  end
  inherited DBGrid1: TDBGrid
    Width = 558
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_NCM'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_NCM'
        Title.Caption = 'Descri'#231#227'o'
        Width = 357
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_UN_MEDIDA'
        Title.Caption = 'Unidade de Medida'
        Visible = True
      end>
  end
  object MECodigo: TMaskEdit [7]
    Left = 8
    Top = 24
    Width = 80
    Height = 22
    EditMask = '########;1;_'
    MaxLength = 8
    TabOrder = 5
    Text = '        '
  end
  inherited DSConsulta: TDataSource
    DataSet = DMNcm.QNcmCons
  end
end
