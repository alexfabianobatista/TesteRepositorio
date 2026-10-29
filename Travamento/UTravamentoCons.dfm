inherited FTravamentoCons: TFTravamentoCons
  Left = 334
  Top = 243
  Width = 528
  Caption = 'Consulta de Travamento de Tabelas no Banco'
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Width = 81
    Caption = 'Filtrar por tabela:'
  end
  inherited BtOk: TBitBtn
    Left = 422
    Caption = '&Fechar'
    ModalResult = 0
    OnClick = BtOkClick
    Kind = bkCustom
  end
  inherited BtCancela: TBitBtn
    Left = 334
    Visible = False
  end
  inherited BtProcurar: TBitBtn
    Left = 423
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Text = ''
  end
  inherited DBGrid1: TDBGrid
    Width = 496
    PopupMenu = PMSessao
    Columns = <
      item
        Expanded = False
        FieldName = 'ORACLE_USERNAME'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'OS_USER_NAME'
        Title.Caption = 'Usu'#225'rio do SO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROGRAM'
        Title.Caption = 'Sistema'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBJECT_NAME'
        Title.Caption = 'Nome do objeto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBJECT_TYPE'
        Title.Caption = 'Tipo do objeto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SID'
        Title.Caption = 'ID da sess'#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SERIAL'
        Visible = False
      end>
  end
  inherited DSConsulta: TDataSource
    DataSet = DMTravamento.QTravamentoCons
  end
  object PMSessao: TPopupMenu
    Left = 256
    Top = 8
    object DerrubarSesso1: TMenuItem
      Caption = '&Derrubar Sess'#227'o'
      OnClick = DerrubarSesso1Click
    end
  end
end
