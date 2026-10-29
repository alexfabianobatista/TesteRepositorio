inherited FBandeiraCartaoCons: TFBandeiraCartaoCons
  Left = 542
  Top = 282
  Width = 472
  Height = 358
  Caption = 'Consulta de Bandeira de Cart'#245'es de Cr'#233'dito'
  PixelsPerInch = 96
  TextHeight = 14
  inherited LblNumRegistros: TLabel
    Top = 288
  end
  inherited BtOk: TBitBtn
    Left = 238
    Top = 292
  end
  inherited BtCancela: TBitBtn
    Left = 150
    Top = 292
  end
  inherited BtProcurar: TBitBtn
    Left = 367
    OnClick = BtProcurarClick
  end
  inherited DBGrid1: TDBGrid
    Width = 440
    Height = 233
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_BANDEIRA_CARTAO'
        Title.Caption = 'C'#243'digo'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_BANDEIRA_CARTAO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 216
        Visible = True
      end>
  end
  inherited DSConsulta: TDataSource
    DataSet = DMBandeiraCartao.QBandeiraCartaoCons
  end
end
