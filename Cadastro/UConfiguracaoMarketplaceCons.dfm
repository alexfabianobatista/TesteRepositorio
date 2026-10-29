inherited FConfiguracaoMarketplaceCons: TFConfiguracaoMarketplaceCons
  Left = 322
  Top = 158
  Width = 779
  Height = 416
  Caption = 'Consulta de configura'#231#245'es do marketplace'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Enabled = False
    Visible = False
  end
  inherited LblNumRegistros: TLabel
    Top = 346
  end
  inherited BtOk: TBitBtn
    Left = 673
    Top = 342
  end
  inherited BtCancela: TBitBtn
    Left = 585
    Top = 342
  end
  inherited BtProcurar: TBitBtn
    Left = 666
    Top = 16
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Width = 1
    Enabled = False
    Visible = False
  end
  inherited DBGrid1: TDBGrid
    Width = 747
    Height = 265
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_CONFIGURACAO_SKYHUB'
        Title.Caption = 'C'#243'digo'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_FILIAL'
        Title.Caption = 'Filial'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_ATIVO'
        Title.Caption = 'Ativo'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_USUARIO_EMAIL'
        Title.Caption = 'E-mail'
        Width = 442
        Visible = True
      end>
  end
  inline FmFilial1: TFmFilial [7]
    Left = 16
    Top = 8
    Width = 217
    Height = 37
    TabOrder = 5
    inherited Label1: TLabel
      Height = 14
    end
    inherited MeFilial: TMaskEdit
      Height = 22
    end
    inherited EdFilial: TEdit
      Width = 141
      Height = 22
    end
  end
  inherited DSConsulta: TDataSource [8]
    DataSet = DMConfiguracaoMarketplace.QConfiguracaoMarketplaceCons
    Left = 440
    Top = 16
  end
  inherited PopupMenu1: TPopupMenu
    Left = 408
    Top = 16
  end
end
