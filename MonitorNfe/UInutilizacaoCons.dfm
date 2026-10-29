inherited FInutilizacaoCons: TFInutilizacaoCons
  Left = 264
  Top = 103
  Width = 685
  Height = 486
  Caption = 'Consulta de Inutiliza'#231#227'o'
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Left = 288
    Top = 6
    Width = 25
    Caption = 'S'#233'rie'
  end
  object Label2: TLabel [1]
    Left = 336
    Top = 6
    Width = 45
    Height = 14
    Caption = 'Com o N'#186
  end
  inherited BtOk: TBitBtn
    Left = 579
    Top = 425
    Caption = '&Fechar'
    TabOrder = 5
  end
  inherited BtCancela: TBitBtn
    Left = 491
    Top = 425
    TabOrder = 6
    Visible = False
  end
  inherited BtProcurar: TBitBtn
    Left = 580
    TabOrder = 3
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Left = 288
    Top = 22
    Width = 33
    TabOrder = 1
    Text = '1'
    OnKeyPress = METextoKeyPress
  end
  inherited DBGrid1: TDBGrid
    Width = 653
    Height = 354
    TabOrder = 4
    Columns = <
      item
        Expanded = False
        FieldName = 'FILIAL'
        Title.Caption = 'Filial'
        Width = 263
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_CNPJ'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'IND_AMBIENTE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DESC_PROTOCOLO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DESC_UF'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'COD_SERIE'
        Title.Caption = 'S'#233'rie'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_NUM_INI'
        Title.Caption = 'N'#250'm. Inicial'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_NUM_FIM'
        Title.Caption = 'N'#250'm. Final'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_ANO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DESC_STATUS'
        Title.Caption = 'Status'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_MOTIVO'
        Title.Caption = 'Motivo'
        Width = 174
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_SITUACAO'
        Title.Caption = 'Situa'#231#227'o'
        Width = 117
        Visible = True
      end>
  end
  inline FmFilial: TFmFilial [7]
    Left = 8
    Top = 8
    Width = 265
    Height = 37
    TabOrder = 0
    inherited Label1: TLabel
      Height = 14
    end
    inherited MeFilial: TMaskEdit
      Height = 22
    end
    inherited EdFilial: TEdit
      Height = 22
    end
  end
  object MENumero: TMaskEdit [8]
    Left = 336
    Top = 22
    Width = 49
    Height = 22
    TabOrder = 2
    OnKeyPress = MENumeroKeyPress
  end
  inherited DSConsulta: TDataSource [9]
    DataSet = DMNfe.QInutilizacaoCons
    Left = 592
    Top = 0
  end
  inherited PopupMenu1: TPopupMenu
    Left = 560
    Top = 0
  end
end
