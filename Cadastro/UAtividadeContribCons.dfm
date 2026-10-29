inherited FAtividadeContribCons: TFAtividadeContribCons
  Left = 367
  Top = 131
  Width = 788
  Height = 528
  Caption = 'FAtividadeContribCons'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Width = 221
    Caption = 'Atividade sujeita a contribui'#231#227'o previdenci'#225'ria'
  end
  object Label2: TLabel [1]
    Left = 544
    Top = 8
    Width = 22
    Height = 14
    Caption = 'NCM'
  end
  inherited BtOk: TBitBtn
    Left = 682
    Top = 458
  end
  inherited BtCancela: TBitBtn
    Left = 594
    Top = 458
  end
  inherited BtProcurar: TBitBtn
    Left = 683
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Width = 521
    Anchors = [akLeft, akTop, akRight]
    Text = ''
  end
  inherited DBGrid1: TDBGrid
    Width = 756
    Height = 217
    ParentShowHint = False
    ShowHint = True
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_ATIVIDADE_CONTRIB'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_ATIVIDADE_CONTRIB'
        Title.Caption = 'Descri'#231#227'o'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PERC_ALIQ'
        Title.Caption = 'Al'#237'quota'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_NCM'
        Title.Caption = 'NCM'
        Width = 221
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_INI_ESCRIT'
        Title.Caption = 'Data In'#237'cio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_FIN_ESCRIT'
        Title.Caption = 'Data Fim'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_TIPO'
        Title.Caption = 'Tipo'
        Width = 160
        Visible = True
      end>
  end
  object DBMemo1: TDBMemo [7]
    Left = 8
    Top = 279
    Width = 756
    Height = 169
    Anchors = [akLeft, akRight, akBottom]
    DataField = 'DESC_ATIVIDADE_CONTRIB'
    DataSource = DSConsulta
    TabOrder = 5
  end
  object MENCM: TMaskEdit [8]
    Left = 544
    Top = 24
    Width = 121
    Height = 22
    TabOrder = 6
  end
  inherited DSConsulta: TDataSource
    DataSet = DMProduto.QAtividadeContribCons
    Left = 40
    Top = 456
  end
  inherited PopupMenu1: TPopupMenu
    Left = 8
    Top = 456
  end
end
