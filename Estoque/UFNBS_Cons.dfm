inherited FNBS_Cons: TFNBS_Cons
  Left = 399
  Top = 162
  Width = 885
  Height = 624
  Caption = 'Consulta de NBS'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Width = 49
    Caption = 'Descri'#231#227'o'
  end
  inherited LblNumRegistros: TLabel
    Top = 554
  end
  inherited BtOk: TBitBtn
    Left = 355
    Top = 558
  end
  inherited BtCancela: TBitBtn
    Left = 267
    Top = 558
  end
  inherited BtProcurar: TBitBtn
    Left = 780
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Width = 289
    Text = '%'
    OnChange = METextoChange
  end
  inherited DBGrid1: TDBGrid
    Width = 853
    Height = 497
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_NBS'
        Title.Caption = 'C'#243'd. NBS'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_NBS'
        Title.Caption = 'Descri'#231#227'o NBS'
        Width = 684
        Visible = True
      end>
  end
  inherited DSConsulta: TDataSource
    DataSet = DMNbs.QNBS_Cons
    Left = 608
  end
  inherited PopupMenu1: TPopupMenu
    Left = 576
  end
end
