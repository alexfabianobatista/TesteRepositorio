inherited FReceitaConsulta: TFReceitaConsulta
  Left = 368
  Top = 129
  Width = 545
  Height = 402
  Caption = 'Consulta Receita '
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Width = 76
    Caption = 'N'#250'mero Receita'
  end
  inherited LblNumRegistros: TLabel
    Top = 291
  end
  inherited BtOk: TBitBtn
    Left = 332
    Top = 332
  end
  inherited BtCancela: TBitBtn
    Left = 436
    Top = 332
  end
  inherited BtProcurar: TBitBtn
    Left = 441
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Width = 177
    Text = ''
  end
  inherited DBGrid1: TDBGrid
    Left = 6
    Top = 120
    Width = 517
    Height = 197
    Columns = <
      item
        Expanded = False
        FieldName = 'NUM_RECEITA'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_NOTA'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_CADASTRO'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Width = 122
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_PRODUTO'
        Width = 148
        Visible = True
      end>
  end
  inline FmDatas1: TFmDatas [7]
    Left = 8
    Top = 50
    Width = 178
    Height = 60
    TabOrder = 5
    inherited GroupBox1: TGroupBox
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
  inherited DSConsulta: TDataSource [8]
    DataSet = DMReceita.QReceitaConsulta
    Left = 56
    Top = 264
  end
  inherited PopupMenu1: TPopupMenu
    Left = 16
    Top = 264
  end
end
