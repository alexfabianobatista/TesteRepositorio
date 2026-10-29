inherited FSuspensaoProcCons: TFSuspensaoProcCons
  Left = 614
  Top = 462
  Caption = 'FSuspensaoProcCons'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Width = 101
    Caption = 'Ind. Suspens'#227'o Eleg.'
  end
  inherited BtProcurar: TBitBtn
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Width = 152
    EditMask = '!99999;1;_'
    MaxLength = 5
    Text = '     '
  end
  inherited DBGrid1: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_SUSPENSAO_R1070'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'COD_IND_SUSPENSAO'
        Title.Caption = 'Indicativo Susp'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_SUSPENSAO'
        Title.Caption = 'Ind. Suspens'#227'o Eleg.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_DECISAO'
        Title.Caption = 'Data Decis'#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_DEPOSITO'
        Title.Caption = 'Dep'#243'sito integral?'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_USUARIO'
        Visible = False
      end>
  end
  inherited DSConsulta: TDataSource
    DataSet = DMReinf.QReinfSuspProcessoCons
  end
end
