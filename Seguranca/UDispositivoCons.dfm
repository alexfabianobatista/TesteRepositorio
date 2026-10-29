inherited FDispositivoCons: TFDispositivoCons
  Left = 287
  Top = 276
  Width = 1091
  Height = 357
  Caption = 'Consulta Dispositivos do Aplicativo Cemapa'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Width = 119
    Caption = 'Descri'#231#227'o do Dispositivo'
  end
  inherited LblNumRegistros: TLabel
    Top = 287
  end
  inherited BtOk: TBitBtn
    Left = 985
    Top = 291
  end
  inherited BtCancela: TBitBtn
    Left = 897
    Top = 291
  end
  inherited BtProcurar: TBitBtn
    Left = 986
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Text = '%'
  end
  inherited DBGrid1: TDBGrid
    Width = 1059
    Height = 232
    TabStop = False
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_DISPOSITIVO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DESC_DISPOSITIVO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 194
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_MODELO'
        Title.Caption = 'Modelo'
        Width = 285
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_FILIAL'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'descfilial'
        Title.Caption = 'Filial'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_USUARIO'
        Title.Caption = 'Cod. Usuario'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'nomeusuario'
        Title.Caption = 'Nome Usu'#225'rio'
        Width = 132
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_ULTIMO_ACESSO'
        Title.Caption = 'Dt. Ult. Acesso'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_REGISTRO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'IND_SITUACAO'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_IP_ULTIMO_ACESSO'
        Title.Caption = 'Ip Ult. Acesso'
        Width = 105
        Visible = True
      end>
  end
  inherited DSConsulta: TDataSource
    DataSet = DMUsuario.QDispositivosCons
  end
end
