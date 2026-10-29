inherited FRegistroTipo60DCons: TFRegistroTipo60DCons
  Left = 339
  Top = 175
  Width = 783
  Height = 422
  Caption = 'Consulta Registro Tipo 60 di'#225'rio'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Width = 80
    Caption = 'Data de Emiss'#227'o'
  end
  inherited BtOk: TBitBtn
    Left = 677
    Top = 357
  end
  inherited BtCancela: TBitBtn
    Left = 589
    Top = 357
  end
  inherited BtProcurar: TBitBtn
    Left = 678
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Width = 152
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    Text = '  /  /    '
  end
  inherited DBGrid1: TDBGrid
    Width = 751
    Height = 297
    Columns = <
      item
        Expanded = False
        FieldName = 'DT_EMISSAO'
        Title.Caption = 'Emiss'#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_SERIE'
        Title.Caption = 'S'#233'rie ECF'
        Width = 162
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_COD_BARRA'
        Title.Caption = 'C'#243'digo Produto'
        Width = 149
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QT_QUANTIDADE'
        Title.Caption = 'Quantidade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_ST'
        Title.Caption = 'ST / Aliq'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_BASE_ICMS'
        Title.Caption = 'Base ICMS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_ICMS'
        Title.Caption = 'Valor ICMS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_TOTAL'
        Title.Caption = 'Valor Total'
        Visible = True
      end>
  end
  inherited DSConsulta: TDataSource
    DataSet = DMImpressoraFiscal.QReg60DCons
  end
end
