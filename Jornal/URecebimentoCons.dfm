inherited FRecebimentoCons: TFRecebimentoCons
  Left = 518
  Top = 193
  Width = 485
  Height = 374
  Caption = 'Consulta de Recebimento de Assinantes'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Left = 9
    Top = 2
    Width = 20
    Caption = 'Ano'
  end
  inherited BtOk: TBitBtn
    Left = 284
    Top = 301
  end
  inherited BtCancela: TBitBtn
    Left = 375
    Top = 301
  end
  inherited BtProcurar: TBitBtn
    Left = 380
    Top = 18
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Top = 18
    Width = 73
  end
  inherited DBGrid1: TDBGrid
    Top = 96
    Width = 453
    Height = 193
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_RECEBIMENTO_JORNAL'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NUM_ANO'
        Title.Caption = 'Ano'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome'
        Width = 205
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_VENCIMENTO'
        Title.Caption = 'Vencimento'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_TOTAL'
        Title.Caption = 'Valor Total'
        Width = 80
        Visible = True
      end>
  end
  inline FmCadastro1: TFmCadastro [6]
    Left = 8
    Top = 48
    Width = 457
    Height = 37
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 5
    inherited Label1: TLabel
      Width = 44
      Height = 14
    end
    inherited MeCadastro: TMaskEdit
      Height = 22
    end
    inherited EdCadastro: TEdit
      Width = 381
      Height = 22
    end
  end
  inherited DSConsulta: TDataSource [7]
    DataSet = DMRecebimento.QRecebimentoJornalCons
    Left = 40
    Top = 288
  end
  inherited PopupMenu1: TPopupMenu
    Left = 8
    Top = 288
  end
end
