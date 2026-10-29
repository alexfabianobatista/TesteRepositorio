inherited FPlanoContaReferencialCons: TFPlanoContaReferencialCons
  Left = 310
  Top = 185
  Width = 472
  Height = 360
  Caption = 'Consulta Plano de Conta Referencial'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Width = 28
    Caption = 'Conta'
  end
  inherited BtOk: TBitBtn
    Top = 299
    Anchors = [akLeft, akBottom]
  end
  inherited BtCancela: TBitBtn
    Top = 299
    Anchors = [akLeft, akBottom]
  end
  inherited BtProcurar: TBitBtn
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Text = '0'
  end
  inherited DBGrid1: TDBGrid
    Width = 445
    Height = 228
    Columns = <
      item
        Expanded = False
        FieldName = 'NUM_PLANO_CONTA_REFERENCIAL'
        Title.Caption = 'Conta'
        Width = 121
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_PLANO_CONTA_REFERENCIAL'
        Title.Caption = 'Descri'#231#227'o'
        Width = 241
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_PLANO_CONTA_REFERENCIAL'
        Title.Alignment = taRightJustify
        Title.Caption = 'C'#243'digo'
        Width = 44
        Visible = True
      end>
  end
  inherited DSConsulta: TDataSource
    DataSet = DmPlanoContaReferencial.QPlanoContaReferencialCons
  end
end
