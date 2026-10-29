inherited FRegistro60MestreCons: TFRegistro60MestreCons
  Width = 439
  Height = 354
  Caption = 'Consulta Registro Tipo 60 Mestre'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Width = 33
    Caption = 'C'#243'digo'
  end
  inherited BtOk: TBitBtn
    Left = 110
    Top = 293
  end
  inherited BtCancela: TBitBtn
    Left = 270
    Top = 293
  end
  inherited BtProcurar: TBitBtn
    Left = 334
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Width = 152
    EditMask = '!99/99/##00;1;_'
    MaxLength = 10
    Text = '  /  /    '
  end
  inherited DBGrid1: TDBGrid
    Width = 407
    Height = 222
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_REGISTRO_MESTRE'
        Title.Alignment = taRightJustify
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_EMISSAO'
        Title.Caption = 'Emiss'#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_SERIE'
        Title.Caption = 'S'#233'rie'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_SEQUENCIAL'
        Title.Alignment = taRightJustify
        Title.Caption = 'Sequencial'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_MODELO'
        Title.Caption = 'Modelo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_COO_INI'
        Title.Alignment = taRightJustify
        Title.Caption = 'COO Inicial'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_COO_FIN'
        Title.Alignment = taRightJustify
        Title.Caption = 'COO Final'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_CONTADOR_REDUCAOZ'
        Title.Alignment = taRightJustify
        Title.Caption = 'Cont. Red. Z'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_REINICIO_OPRERACAO'
        Title.Alignment = taRightJustify
        Title.Caption = 'Cont. Rei. Oper.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_VENDA_BRUTA'
        Title.Alignment = taRightJustify
        Title.Caption = 'Val. Venda'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_TOTAL_GERAL'
        Title.Alignment = taRightJustify
        Title.Caption = 'Val. Total'
        Visible = True
      end>
  end
  inherited DSConsulta: TDataSource
    DataSet = DMLivroFiscal.QTipo60MestreCons
  end
end
