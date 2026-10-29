inherited FPercPisCofinsCons: TFPercPisCofinsCons
  Width = 762
  Caption = 'Consulta Percentuais de PIS/COFINS'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Width = 20
    Caption = 'M'#234's'
  end
  object Label231: TLabel [1]
    Left = 40
    Top = 8
    Width = 20
    Height = 14
    Caption = 'Ano'
  end
  inherited BtOk: TBitBtn
    TabOrder = 4
  end
  inherited BtCancela: TBitBtn
    TabOrder = 5
  end
  inherited BtProcurar: TBitBtn
    Left = 656
    TabOrder = 2
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Width = 25
    EditMask = '!99;1;_'
    MaxLength = 2
    Text = '  '
  end
  inherited DBGrid1: TDBGrid
    Width = 730
    TabOrder = 3
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_PERC_PIS_COFINS'
        Title.Alignment = taRightJustify
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NUM_MES'
        Title.Alignment = taRightJustify
        Title.Caption = 'M'#234's'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_ANO'
        Title.Alignment = taRightJustify
        Title.Caption = 'Ano'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PERC_PIS_EXP'
        Title.Alignment = taRightJustify
        Title.Caption = 'PIS Exp'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PERC_PIS_TRIB'
        Title.Alignment = taRightJustify
        Title.Caption = 'PIS Int Trib'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PERC_PIS_NAO_TRIB'
        Title.Alignment = taRightJustify
        Title.Caption = 'PIS Int N'#227'o Trib'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PERC_COFINS_EXP'
        Title.Alignment = taRightJustify
        Title.Caption = 'COFINS Exp'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PERC_COFINS_TRIB'
        Title.Alignment = taRightJustify
        Title.Caption = 'COFINS Int Trib'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PERC_COFINS_NAO_TRIB'
        Title.Alignment = taRightJustify
        Title.Caption = 'COFINS Int N'#227'o Trib'
        Width = 80
        Visible = True
      end>
  end
  object MeAno: TMaskEdit [7]
    Left = 40
    Top = 24
    Width = 41
    Height = 22
    EditMask = '!9999;1;_'
    MaxLength = 4
    TabOrder = 1
    Text = '    '
  end
  inherited DSConsulta: TDataSource
    DataSet = DMLivroFiscal.QPercPisCofinsCons
  end
end
