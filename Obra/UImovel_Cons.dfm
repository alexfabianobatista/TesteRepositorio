inherited FImovel_Cons: TFImovel_Cons
  Left = 241
  Top = 135
  Width = 739
  Height = 513
  Caption = 'Consulta Imovel'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Width = 49
    Caption = 'Descri'#231#227'o'
  end
  inherited BtOk: TBitBtn
    Left = 633
    Top = 459
  end
  inherited BtCancela: TBitBtn
    Left = 545
    Top = 459
  end
  inherited BtProcurar: TBitBtn
    Left = 634
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Width = 281
    Text = ''
  end
  inherited DBGrid1: TDBGrid
    Top = 96
    Width = 707
    Height = 348
    Columns = <
      item
        Expanded = False
        FieldName = 'DESC_IMOVEL'
        Title.Caption = 'Descri'#231#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_ENDERECO'
        Title.Caption = 'Endere'#231'o'
        Width = 201
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Propriet'#225'rio'
        Width = 199
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_CONDOMINIO'
        Title.Caption = 'Condominio'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_CIDADE'
        Title.Caption = 'Cidade'
        Width = 64
        Visible = True
      end>
  end
  inline FmCadastro: TFmCadastro [6]
    Left = 304
    Top = 8
    Width = 313
    Height = 37
    TabOrder = 5
    inherited Label1: TLabel
      Width = 55
      Height = 14
      Caption = 'Propriet'#225'rio'
    end
    inherited MeCadastro: TMaskEdit
      Height = 22
    end
    inherited EdCadastro: TEdit
      Width = 237
      Height = 22
    end
  end
  inline FmCidade: TFmCidade [7]
    Left = 8
    Top = 52
    Width = 281
    Height = 37
    TabOrder = 6
    inherited Label1: TLabel
      Height = 14
    end
    inherited MeCidade: TMaskEdit
      Height = 22
    end
    inherited EdCidade: TEdit
      Width = 205
      Height = 22
    end
  end
  inline FmCondominio: TFmCondominio
    Left = 304
    Top = 53
    Width = 313
    Height = 36
    TabOrder = 7
    inherited Label1: TLabel
      Height = 14
    end
    inherited MeCondominio: TMaskEdit
      Height = 22
    end
    inherited EdCondominio: TEdit
      Width = 233
      Height = 22
    end
  end
  inherited DSConsulta: TDataSource
    DataSet = DMImobiliaria.QImovel_Cons
    Left = 688
    Top = 0
  end
  inherited PopupMenu1: TPopupMenu
    Left = 656
    Top = 0
  end
end
