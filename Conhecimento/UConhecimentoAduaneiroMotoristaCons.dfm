inherited FConhecimentoAduaneiroMotoristaCons: TFConhecimentoAduaneiroMotoristaCons
  Left = 390
  Top = 226
  Width = 643
  Height = 325
  Caption = 'Consulta Motorista'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Width = 27
    Caption = 'Nome'
  end
  inherited BtOk: TBitBtn
    Left = 537
    Top = 264
  end
  inherited BtCancela: TBitBtn
    Left = 449
    Top = 264
  end
  inherited BtProcurar: TBitBtn
    Left = 538
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Width = 297
  end
  inherited DBGrid1: TDBGrid
    Width = 611
    Height = 193
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_MOTORISTA'
        Title.Alignment = taRightJustify
        Title.Caption = 'C'#243'digo'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome'
        Width = 158
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_CPF'
        Title.Caption = 'CPF'
        Width = 124
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_RG'
        Title.Caption = 'RG'
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_CNH'
        Title.Caption = 'CNH'
        Width = 130
        Visible = True
      end>
  end
  inherited DSConsulta: TDataSource
    DataSet = DMConhecimento.QConhecimentoAduaneiroMotCons
  end
end
