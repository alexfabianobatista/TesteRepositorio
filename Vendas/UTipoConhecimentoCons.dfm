inherited FTipoConhecimentoCons: TFTipoConhecimentoCons
  Height = 321
  Caption = 'FTipoConhecimentoCons'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Width = 91
    Caption = 'Tipo Conhecimento'
  end
  inherited BtOk: TBitBtn
    Top = 227
  end
  inherited BtCancela: TBitBtn
    Top = 227
  end
  inherited BtProcurar: TBitBtn
    OnClick = BtProcurarClick
  end
  inherited DBGrid1: TDBGrid
    Height = 161
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_TIPO_CONHECIMENTO'
        Title.Alignment = taRightJustify
        Title.Caption = 'C'#243'digo'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_TIPO_CONHECIMENTO'
        Title.Caption = 'N'#250'mero'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_TIPO_CONHECIMENTO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 206
        Visible = True
      end>
  end
  object StatusBar1: TStatusBar [6]
    Left = 0
    Top = 264
    Width = 362
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  inherited DSConsulta: TDataSource
    DataSet = DMNotaSaida.QTipoConhecimentoCons
  end
  object ActionList1: TActionList
    Left = 8
    Top = 216
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 49222
      OnExecute = Action1Execute
    end
  end
end
