inherited FMensagemEletronicaCons: TFMensagemEletronicaCons
  Left = 340
  Top = 179
  Width = 652
  Height = 355
  Caption = 'Consulta de Mensagem Eletr'#244'nica'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Width = 49
    Caption = 'Descri'#231#227'o'
  end
  inherited LblNumRegistros: TLabel
    Top = 285
  end
  inherited BtOk: TBitBtn
    Left = 546
    Top = 281
  end
  inherited BtCancela: TBitBtn
    Left = 458
    Top = 281
  end
  inherited BtProcurar: TBitBtn
    Left = 547
    Top = 16
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Width = 289
    Text = ''
  end
  inherited DBGrid1: TDBGrid
    Width = 620
    Height = 214
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_MENSAGEM_ELETRONICA'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_DESCRICAO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 212
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_TITULO'
        Title.Caption = 'T'#237'tulo'
        Width = 159
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_REMETENTE'
        Title.Caption = 'Remetente'
        Width = 160
        Visible = True
      end>
  end
  inherited DSConsulta: TDataSource
    DataSet = DMMalaDireta.QMensagemEletronicaCons
    Left = 256
    Top = 280
  end
  inherited PopupMenu1: TPopupMenu
    Left = 224
    Top = 280
  end
end
