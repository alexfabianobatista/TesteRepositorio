inherited FSuinoDespesaCons: TFSuinoDespesaCons
  Left = 336
  Top = 252
  Width = 744
  Height = 378
  Caption = 'Consulta de Despesas de Su'#237'nos'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Visible = False
  end
  object Label2: TLabel [1]
    Left = 328
    Top = 8
    Width = 51
    Height = 14
    Caption = 'Data Inicial'
  end
  object Label3: TLabel [2]
    Left = 400
    Top = 8
    Width = 47
    Height = 14
    Caption = 'Data Final'
  end
  inherited BtOk: TBitBtn
    Left = 638
    Top = 324
    TabOrder = 6
  end
  inherited BtCancela: TBitBtn
    Left = 550
    Top = 324
    TabOrder = 7
  end
  inherited BtProcurar: TBitBtn
    Left = 639
    TabOrder = 3
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    TabOrder = 4
    Visible = False
  end
  inherited DBGrid1: TDBGrid
    Width = 712
    Height = 253
    TabOrder = 5
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_SUINO_DESPESA'
        Title.Alignment = taRightJustify
        Title.Caption = 'C'#243'digo'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_CADASTRO'
        Title.Alignment = taRightJustify
        Title.Caption = 'Cadastro'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome'
        Width = 193
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_HISTORICO'
        Title.Alignment = taRightJustify
        Title.Caption = 'Hist'#243'rico'
        Width = -1
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DESC_HISTORICO'
        Title.Caption = 'Hist'#243'rico'
        Width = 134
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_DESPESA'
        Title.Caption = 'Data'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_DESPESA'
        Title.Alignment = taRightJustify
        Title.Caption = 'Valor'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_OBS'
        Title.Caption = 'Observa'#231#227'o'
        Width = 380
        Visible = True
      end>
  end
  inline FmCadastro: TFmCadastro [8]
    Left = 8
    Top = 8
    Width = 305
    Height = 37
    TabOrder = 0
    inherited Label1: TLabel
      Width = 44
      Height = 14
    end
    inherited MeCadastro: TMaskEdit
      Height = 22
    end
    inherited EdCadastro: TEdit
      Width = 229
      Height = 22
    end
  end
  object MeDataIni: TMaskEdit [9]
    Left = 328
    Top = 24
    Width = 65
    Height = 22
    EditMask = '!99/99/9999;1;_'
    MaxLength = 10
    TabOrder = 1
    Text = '  /  /    '
  end
  object MeDataFin: TMaskEdit [10]
    Left = 400
    Top = 24
    Width = 65
    Height = 22
    EditMask = '!99/99/9999;1;_'
    MaxLength = 10
    TabOrder = 2
    Text = '  /  /    '
  end
  inherited DSConsulta: TDataSource [11]
    DataSet = DmSuino.QSuinoDespesaCons
  end
end
