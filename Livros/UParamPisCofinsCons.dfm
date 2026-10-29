inherited FParamPisCofinsCons: TFParamPisCofinsCons
  Width = 762
  Caption = 'Consulta Par'#226'metros de PIS/COFINS'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Visible = False
  end
  inherited BtProcurar: TBitBtn
    Left = 656
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Visible = False
  end
  inherited DBGrid1: TDBGrid
    Width = 730
    Columns = <
      item
        Expanded = False
        FieldName = 'DESC_OPERACAO'
        Title.Caption = 'Opera'#231#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_OPERACAO'
        Title.Alignment = taRightJustify
        Title.Caption = 'C'#243'd'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_NCM'
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'COD_CST'
        Title.Alignment = taRightJustify
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_ALIQ_PIS'
        Title.Alignment = taRightJustify
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_BC_PIS'
        Title.Alignment = taRightJustify
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_ALIQ_COFINS'
        Title.Alignment = taRightJustify
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_BC_COFINS'
        Title.Alignment = taRightJustify
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_PARAM_PIS_COFINS'
        Title.Alignment = taRightJustify
        Visible = False
      end>
  end
  inline FmOperacao: TFmOperacao [6]
    Left = 8
    Top = 10
    Width = 337
    Height = 37
    TabOrder = 5
    inherited Label1: TLabel
      Width = 48
      Height = 14
    end
    inherited MeOperacao: TMaskEdit
      Height = 22
    end
    inherited EdOperacao: TEdit
      Width = 261
      Height = 22
    end
  end
  inherited DSConsulta: TDataSource [7]
    DataSet = DMLivroFiscal.QParamPisCofinsCons
  end
end
