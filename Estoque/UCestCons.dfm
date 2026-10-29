inherited FCestCons: TFCestCons
  Left = 427
  Top = 161
  Width = 690
  Height = 356
  Caption = 'Consulta CEST'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Width = 22
    Caption = 'NCM'
  end
  object Label2: TLabel [1]
    Left = 128
    Top = 8
    Width = 26
    Height = 14
    Caption = 'CEST'
  end
  object Label3: TLabel [2]
    Left = 248
    Top = 8
    Width = 78
    Height = 14
    Caption = 'Descri'#231#227'o CEST'
  end
  inherited BtOk: TBitBtn
    Left = 581
    Top = 286
    TabOrder = 6
  end
  inherited BtCancela: TBitBtn
    Left = 493
    Top = 286
    TabOrder = 5
  end
  inherited BtProcurar: TBitBtn
    Left = 585
    TabOrder = 3
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Width = 105
    Text = ''
    OnChange = METextoChange
  end
  inherited DBGrid1: TDBGrid
    Width = 658
    Height = 225
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnMouseUp = DBGrid1MouseUp
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_CEST'
        Title.Caption = 'CEST'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_NCM'
        Title.Caption = 'NCM'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_CEST'
        Title.Caption = 'Descri'#231#227'o do CEST'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORDEM'
        Visible = False
      end>
  end
  object MECest: TMaskEdit [8]
    Left = 128
    Top = 24
    Width = 105
    Height = 22
    TabOrder = 1
    OnChange = MECestChange
  end
  object MEDesc: TMaskEdit [9]
    Left = 248
    Top = 24
    Width = 321
    Height = 22
    TabOrder = 2
    OnChange = MEDescChange
  end
  inherited DSConsulta: TDataSource
    DataSet = DMProduto.QCestCons
    Left = 40
    Top = 288
  end
  inherited PopupMenu1: TPopupMenu
    Left = 8
    Top = 288
  end
end
