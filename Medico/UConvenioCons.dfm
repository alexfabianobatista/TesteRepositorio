inherited FConvenioCons: TFConvenioCons
  Left = 369
  Top = 194
  Width = 374
  Height = 334
  Caption = 'Consulta de Conv'#234'nio'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Left = 96
    Top = 19
    Width = 45
    Caption = 'Conv'#234'nio'
  end
  object Bevel1: TBevel [1]
    Left = 8
    Top = 8
    Width = 345
    Height = 65
  end
  object LblCodigo: TLabel [2]
    Left = 16
    Top = 20
    Width = 33
    Height = 14
    Caption = 'C'#243'digo'
  end
  inherited BtOk: TBitBtn
    Left = 88
    Top = 264
  end
  inherited BtCancela: TBitBtn
    Left = 200
    Top = 264
  end
  inherited BtProcurar: TBitBtn
    Left = 264
    Top = 32
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Left = 96
    Top = 35
  end
  inherited DBGrid1: TDBGrid
    Top = 80
    Height = 177
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_CONVENIO'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_CONVENIO'
        Width = 276
        Visible = True
      end>
  end
  object MeCodigo: TMaskEdit [8]
    Left = 16
    Top = 35
    Width = 65
    Height = 22
    TabOrder = 5
  end
  inherited DSConsulta: TDataSource
    DataSet = DMConvenio.QConvenioCons
    Left = 8
    Top = 264
  end
end
