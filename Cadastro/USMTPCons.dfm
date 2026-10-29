inherited FSMTPCons: TFSMTPCons
  Left = 339
  Top = 173
  Width = 630
  Height = 376
  Caption = 'Consulta SMTP'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Width = 28
    Caption = 'E-mail'
  end
  inherited LblNumRegistros: TLabel
    Top = 306
  end
  inherited BtOk: TBitBtn
    Left = 524
    Top = 302
  end
  inherited BtCancela: TBitBtn
    Left = 436
    Top = 302
  end
  inherited BtProcurar: TBitBtn
    Left = 517
    Top = 16
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Width = 385
    Text = ''
  end
  inherited DBGrid1: TDBGrid
    Width = 598
    Height = 233
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_SMTP'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_SMTP'
        Title.Caption = 'SMTP'
        Width = 168
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_EMAIL'
        Title.Caption = 'E-mail'
        Width = 177
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QT_EMAIL'
        Title.Caption = 'Emails'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QT_HORAS'
        Title.Caption = 'Horas'
        Visible = True
      end>
  end
  inherited DSConsulta: TDataSource
    DataSet = DMMalaDireta.QSMTPCons
  end
end
