inherited FContratoLocador_Cons: TFContratoLocador_Cons
  Left = 304
  Top = 134
  Width = 646
  Height = 467
  Caption = 'Consulta Contrato Locador'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Visible = False
  end
  inherited BtOk: TBitBtn
    Left = 540
    Top = 402
  end
  inherited BtCancela: TBitBtn
    Left = 452
    Top = 403
  end
  inherited BtProcurar: TBitBtn
    Left = 541
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Visible = False
  end
  inherited DBGrid1: TDBGrid
    Width = 614
    Height = 342
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_CONTRATO_LOCADOR'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_EMISSAO'
        Title.Caption = 'Dt. Emiss'#227'o'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_CONTRATO'
        Title.Caption = 'Vl. Contrato'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_CONDOMINIO'
        Title.Caption = 'Vl. Condominio'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_FIADOR'
        Title.Caption = 'Fiador'
        Visible = True
      end>
  end
  inline FmCadastro: TFmCadastro [6]
    Left = 8
    Top = 8
    Width = 265
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
      Height = 22
    end
  end
  inline FmImovel: TFmImovel [7]
    Left = 288
    Top = 8
    Width = 243
    Height = 40
    TabOrder = 6
    inherited Label1: TLabel
      Width = 30
      Height = 14
    end
    inherited MeImovel: TMaskEdit
      Height = 22
    end
    inherited EdImovel: TEdit
      Width = 164
      Height = 22
    end
  end
  inherited DSConsulta: TDataSource
    DataSet = DMImobiliaria.QLocador_Cons
    Left = 568
    Top = 0
  end
end
