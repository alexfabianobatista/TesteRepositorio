inherited FContaPatriLiqCons: TFContaPatriLiqCons
  Left = 417
  Top = 153
  Width = 581
  Height = 388
  Caption = 'Consulta Conta de Patrim'#244'nio L'#237'quido Sint'#233'tico'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Width = 72
    Caption = 'Nome da conta'
  end
  object Label2: TLabel [1]
    Left = 8
    Top = 328
    Width = 205
    Height = 14
    Caption = '* Somente contas sint'#233'ticas ser'#227'o listadas'
    Color = clActiveCaption
    ParentColor = False
  end
  inherited BtOk: TBitBtn
    Left = 471
    Top = 323
  end
  inherited BtCancela: TBitBtn
    Left = 383
    Top = 323
  end
  inherited BtProcurar: TBitBtn
    Left = 476
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Width = 305
    Text = ''
  end
  inherited DBGrid1: TDBGrid
    Width = 549
    Height = 263
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_REDUZIDO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'COD_PLANO_CONTA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NUM_PLANO_CONTA'
        Width = 135
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_PLANO_CONTA'
        Width = 388
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_COMPLETA'
        Visible = False
      end>
  end
  inherited DSConsulta: TDataSource
    DataSet = DMParamSistema.QContaPatriLiqCons
    Left = 384
    Top = 16
  end
  inherited PopupMenu1: TPopupMenu
    Left = 352
    Top = 16
  end
end
