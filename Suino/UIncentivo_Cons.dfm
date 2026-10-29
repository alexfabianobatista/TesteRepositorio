inherited FIncentivo_Cons: TFIncentivo_Cons
  Left = 355
  Top = 183
  Width = 499
  Height = 325
  Caption = 'Consulta Incentivos'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Width = 44
    Caption = 'Cadastro'
    Visible = False
  end
  inherited BtOk: TBitBtn
    Left = 393
    Top = 271
  end
  inherited BtCancela: TBitBtn
    Left = 305
    Top = 271
  end
  inherited BtProcurar: TBitBtn
    Left = 394
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Width = 65
    Text = ''
    Visible = False
  end
  inherited DBGrid1: TDBGrid
    Width = 467
    Height = 200
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_CADASTRO'
        Title.Caption = 'Cadastro'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_INICIO_INCENTIVO'
        Title.Caption = 'Dt. Inicio'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_FINAL_INCENTIVO'
        Title.Caption = 'Dt. Final'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_INCENTIVO'
        Title.Caption = 'Valor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome'
        Visible = True
      end>
  end
  inline FmCadastro: TFmCadastro [6]
    Left = 8
    Top = 8
    Width = 345
    Height = 37
    TabOrder = 5
    inherited Label1: TLabel
      Width = 44
      Height = 14
    end
    inherited MeCadastro: TMaskEdit
      Height = 22
    end
    inherited EdCadastro: TEdit
      Width = 269
      Height = 22
    end
  end
  inherited DSConsulta: TDataSource [7]
    DataSet = DMIncentivo.QIncentivo_Cons
    Left = 360
    Top = 16
  end
  inherited PopupMenu1: TPopupMenu
    Left = 336
    Top = 16
  end
end
