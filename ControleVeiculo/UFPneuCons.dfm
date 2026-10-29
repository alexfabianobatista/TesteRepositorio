inherited FPneuCons: TFPneuCons
  Left = 489
  Top = 210
  Width = 613
  Height = 359
  Caption = 'FPneuCons'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Width = 49
    Caption = 'Descri'#231#227'o'
  end
  inherited BtOk: TBitBtn
    Left = 316
    Top = 293
  end
  inherited BtCancela: TBitBtn
    Left = 228
    Top = 293
  end
  inherited BtProcurar: TBitBtn
    Left = 508
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Width = 194
  end
  inherited DBGrid1: TDBGrid
    Top = 82
    Width = 581
    Height = 204
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_PNEU'
        Title.Caption = 'C'#243'digo'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_DESCRICAO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_SERIE'
        Title.Caption = 'Num. S'#233'rie'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_COMPRA'
        Title.Caption = 'Dt. Compra'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_SITUACAO'
        Title.Caption = 'Situa'#231#227'o'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_RECAPAGEM'
        Title.Caption = 'Recapado'
        Width = 60
        Visible = True
      end>
  end
  object RGSituacao: TRadioGroup [6]
    Left = 213
    Top = 17
    Width = 130
    Height = 63
    Caption = 'Situa'#231#227'o'
    ItemIndex = 2
    Items.Strings = (
      'Ativado'
      'Desativado'
      'Todos')
    TabOrder = 5
  end
  inherited DSConsulta: TDataSource
    DataSet = DMPneu.QPneuCons
    Left = 344
    Top = 88
  end
  inherited PopupMenu1: TPopupMenu
    Left = 312
    Top = 88
  end
end
