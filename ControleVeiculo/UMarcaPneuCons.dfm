inherited FMarcaPneuCons: TFMarcaPneuCons
  Left = 478
  Top = 178
  Width = 660
  Height = 288
  Caption = 'Consulta Marca de Pneu'
  OnCreate = nil
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Width = 49
    Caption = 'Descri'#231#227'o'
  end
  inherited LblNumRegistros: TLabel
    Top = 218
  end
  inherited BtOk: TBitBtn
    Left = 554
    Top = 222
  end
  inherited BtCancela: TBitBtn
    Left = 466
    Top = 222
  end
  inherited BtProcurar: TBitBtn
    Left = 552
    Width = 84
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Width = 385
    Text = ''
    OnKeyUp = METextoKeyUp
  end
  inherited DBGrid1: TDBGrid
    Width = 628
    Height = 163
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_MARCA_PNEU'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_MARCA_PNEU'
        Title.Caption = 'Descri'#231#227'o'
        Width = 429
        Visible = True
      end>
  end
  inherited DSConsulta: TDataSource
    DataSet = DMMarcaPneu.QMarcaPneuCons
    Left = 600
    Top = 0
  end
  inherited PopupMenu1: TPopupMenu
    Left = 568
    Top = 0
  end
end
