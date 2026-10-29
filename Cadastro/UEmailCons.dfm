inherited FEmailCons: TFEmailCons
  Left = 284
  Top = 219
  Height = 306
  Caption = 'Consulta de Email'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Width = 28
    Caption = 'E-Mail'
  end
  inherited BtOk: TBitBtn
    Left = 184
    Top = 240
  end
  inherited BtCancela: TBitBtn
    Left = 272
    Top = 240
  end
  inherited BtProcurar: TBitBtn
    OnClick = BtProcurarClick
  end
  inherited DBGrid1: TDBGrid
    Height = 177
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_EMAIL'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DESC_EMAIL'
        Title.Caption = 'E-Mail'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_SENHA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DESC_SMTP'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NUM_PORTA_SMTP'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DESC_POP3'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NUM_PORTA_POP3'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DESC_MENSAGEM'
        Visible = False
      end>
  end
  inherited DSConsulta: TDataSource
    DataSet = DMCadastro.QEmailCons
  end
end
