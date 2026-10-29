inherited FFuncaoCons: TFFuncaoCons
  Width = 690
  Height = 307
  Caption = 'Consulta de Fun'#231#245'es'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Width = 36
    Caption = 'Fun'#231#227'o'
  end
  inherited LblNumRegistros: TLabel
    Top = 237
  end
  object Label2: TLabel [2]
    Left = 234
    Top = 8
    Width = 19
    Height = 14
    Caption = 'Tela'
  end
  inherited BtOk: TBitBtn
    Left = 584
    TabOrder = 4
  end
  inherited BtCancela: TBitBtn
    Left = 496
    TabOrder = 5
  end
  inherited BtProcurar: TBitBtn
    Left = 585
    TabOrder = 2
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Width = 217
    Text = ''
    OnChange = METextoChange
  end
  inherited DBGrid1: TDBGrid
    Width = 658
    TabOrder = 3
    Columns = <
      item
        Expanded = False
        FieldName = 'NOME_FUNCAO'
        Title.Caption = 'Fun'#231#227'o'
        Width = 396
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_TELA'
        Title.Caption = 'Tela'
        Visible = True
      end>
  end
  object METela: TMaskEdit [8]
    Left = 234
    Top = 24
    Width = 209
    Height = 22
    TabOrder = 1
    OnChange = METelaChange
  end
  inherited DSConsulta: TDataSource
    DataSet = DMFuncao.QFuncaoCons
    Left = 376
  end
  inherited PopupMenu1: TPopupMenu
    Left = 344
  end
end
