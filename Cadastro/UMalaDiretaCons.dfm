inherited FMalaDiretaCons: TFMalaDiretaCons
  Left = 527
  Top = 186
  Width = 663
  Height = 349
  Caption = 'Consulta de Mala Direta'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Width = 49
    Caption = 'Descri'#231#227'o'
  end
  inherited LblNumRegistros: TLabel
    Top = 279
  end
  inherited BtOk: TBitBtn
    Left = 557
    Top = 267
  end
  inherited BtCancela: TBitBtn
    Left = 469
    Top = 267
  end
  inherited BtProcurar: TBitBtn
    Left = 550
    Top = 16
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Width = 249
    Text = ''
  end
  inherited DBGrid1: TDBGrid
    Width = 631
    Height = 202
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_MALA_DIRETA_CAB'
        Title.Caption = 'C'#243'digo'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_MENSAGEM_ELETRONICA'
        Title.Caption = 'Mensagem'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_DESCRICAO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 190
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_CADASTRO'
        Title.Caption = 'Dt.Cadastro'
        Width = 129
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_STATUS'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'desc_situacao'
        Title.Caption = 'Situa'#231#227'o'
        Visible = True
      end>
  end
  inherited DSConsulta: TDataSource
    DataSet = DMMalaDireta.QMalaDiretaCons
    Left = 208
    Top = 272
  end
  inherited PopupMenu1: TPopupMenu
    Left = 168
    Top = 272
  end
end
