inherited FMedicoCons: TFMedicoCons
  Left = 311
  Top = 182
  Width = 420
  Height = 330
  Caption = 'Consulta de M'#233'dico'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Left = 96
    Top = 19
    Width = 27
    Caption = 'Nome'
  end
  object Bevel1: TBevel [1]
    Left = 8
    Top = 8
    Width = 393
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
    Left = 112
    Top = 264
    TabOrder = 4
  end
  inherited BtCancela: TBitBtn
    Left = 224
    Top = 264
    TabOrder = 5
  end
  inherited BtProcurar: TBitBtn
    Left = 312
    Top = 32
    TabOrder = 2
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Left = 96
    Top = 35
    Width = 201
    TabOrder = 1
  end
  inherited DBGrid1: TDBGrid
    Top = 80
    Width = 393
    Height = 177
    TabOrder = 3
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_MEDICO'
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Width = 146
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_CRM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_CPF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_CNPJ'
        Visible = True
      end>
  end
  object MeCodigo: TMaskEdit [8]
    Left = 16
    Top = 35
    Width = 65
    Height = 22
    TabOrder = 0
  end
  inherited DSConsulta: TDataSource
    DataSet = DMMedico.QMedicoCons
    Left = 8
    Top = 264
  end
end
