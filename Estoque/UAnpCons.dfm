inherited FAnpCons: TFAnpCons
  Left = 624
  Top = 166
  Width = 593
  Height = 321
  Caption = 'Consulta de ANP'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Left = 144
    Width = 49
    Caption = 'Descri'#231#227'o'
  end
  object Label2: TLabel [1]
    Left = 16
    Top = 8
    Width = 33
    Height = 14
    Caption = 'C'#243'digo'
  end
  inherited BtOk: TBitBtn
    Left = 487
    Top = 256
  end
  inherited BtCancela: TBitBtn
    Left = 399
    Top = 256
  end
  inherited BtProcurar: TBitBtn
    Left = 488
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Left = 144
    Width = 217
    Text = '%'
  end
  object MECodigo: TMaskEdit [7]
    Left = 16
    Top = 24
    Width = 89
    Height = 22
    EditMask = '#########;1;_'
    MaxLength = 9
    TabOrder = 5
    Text = '         '
  end
  inherited DBGrid1: TDBGrid
    Width = 561
    Height = 193
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_ANP'
        Title.Caption = 'C'#243'digo'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_ANP'
        Title.Caption = 'Descri'#231#227'o'
        Width = 460
        Visible = True
      end>
  end
  inherited DSConsulta: TDataSource
    DataSet = DMAnp.QAnpCons
    Top = 0
  end
  inherited PopupMenu1: TPopupMenu
    Top = 0
  end
end
