inherited FContratoLocatario_Cons: TFContratoLocatario_Cons
  Left = 310
  Top = 180
  Width = 703
  Height = 445
  Caption = 'Consulta Contrato Locat'#225'rio'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Visible = False
  end
  inherited BtOk: TBitBtn
    Left = 597
    Top = 379
  end
  inherited BtCancela: TBitBtn
    Left = 509
    Top = 379
  end
  inherited BtProcurar: TBitBtn
    Left = 598
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Visible = False
  end
  inherited DBGrid1: TDBGrid
    Width = 671
    Height = 320
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_CONTRATO_LOCATARIO'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_EMISSAO'
        Title.Caption = 'Dt. Emiss'#227'o'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIA_VENCIMENTO'
        Title.Caption = 'Dia Vencto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_CONTRATO'
        Title.Caption = 'Valor'
        Width = 70
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
        FieldName = 'DESC_IMOVEL'
        Title.Caption = 'Descri'#231#227'o'
        Visible = True
      end>
  end
  inline FmCondominio: TFmCondominio [6]
    Left = 8
    Top = 8
    Width = 269
    Height = 36
    TabOrder = 5
    inherited Label1: TLabel
      Height = 14
    end
    inherited MeCondominio: TMaskEdit
      Height = 22
    end
    inherited EdCondominio: TEdit
      Height = 22
    end
  end
  inline FmCadastro: TFmCadastro [7]
    Left = 296
    Top = 8
    Width = 265
    Height = 37
    TabOrder = 6
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
  inherited DSConsulta: TDataSource
    DataSet = DMImobiliaria.QLocatario_Cons
    Left = 656
    Top = 0
  end
  inherited PopupMenu1: TPopupMenu
    Left = 624
    Top = 0
  end
end
