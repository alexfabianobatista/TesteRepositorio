inherited FTermoAberturaCons: TFTermoAberturaCons
  Left = 323
  Top = 239
  Width = 498
  Height = 366
  Caption = 'Consulta Termos de Abertura'
  PixelsPerInch = 96
  TextHeight = 14
  inherited BtOk: TBitBtn
    Top = 305
    Anchors = [akLeft, akBottom]
  end
  inherited BtCancela: TBitBtn
    Top = 305
    Anchors = [akLeft, akBottom]
  end
  inherited BtProcurar: TBitBtn
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Width = 217
  end
  inherited DBGrid1: TDBGrid
    Width = 466
    Height = 234
    Columns = <
      item
        Expanded = False
        FieldName = 'DESC_NAT_LIVRO'
        Title.Caption = 'Natureza'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_TERMO_ABERTURA'
        Title.Alignment = taRightJustify
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'COD_FILIAL'
        Title.Alignment = taRightJustify
        Title.Caption = 'Filial'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_ORDEM'
        Title.Alignment = taRightJustify
        Title.Caption = 'Ordem'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_ARQUIVAMENTO'
        Title.Caption = 'Arquivamento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_ARQUIVAMENTO_CONVERSAO'
        Title.Caption = 'Arquivamento Convers'#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_INICIAL'
        Title.Caption = 'Data Inicial'
        Visible = True
      end>
  end
  inherited DSConsulta: TDataSource
    DataSet = DMTermoAbertura.QTermoAberturaCons
  end
end
