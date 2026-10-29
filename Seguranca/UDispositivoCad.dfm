inherited FDispositivoCad: TFDispositivoCad
  Left = 384
  Top = 182
  Caption = 'Cadastro de Dispositivos Utilizados no Aplicativo Cemapa'
  ClientHeight = 558
  ClientWidth = 844
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel [1]
    Left = 16
    Top = 72
    Width = 103
    Height = 14
    Caption = 'C'#243'digo do Dispositivo'
    FocusControl = DBEdit1
  end
  object Label2: TLabel [2]
    Left = 16
    Top = 112
    Width = 80
    Height = 14
    Caption = 'N'#250'mero de S'#233'rie'
    FocusControl = DBEdit2
  end
  object Label3: TLabel [3]
    Left = 384
    Top = 112
    Width = 37
    Height = 14
    Caption = 'Modelo '
    FocusControl = DBEdit3
  end
  object Label4: TLabel [4]
    Left = 16
    Top = 155
    Width = 20
    Height = 14
    Caption = 'Filial'
    FocusControl = DBEdit4
  end
  object Label5: TLabel [5]
    Left = 250
    Top = 155
    Width = 37
    Height = 14
    Caption = 'Usu'#225'rio'
    FocusControl = DBEdit5
  end
  object Label6: TLabel [6]
    Left = 16
    Top = 203
    Width = 108
    Height = 14
    Caption = 'Data do '#218'ltimo Acesso'
    FocusControl = DBEdit6
  end
  object Label7: TLabel [7]
    Left = 190
    Top = 203
    Width = 84
    Height = 14
    Caption = 'Data de Cadastro'
    FocusControl = DBEdit7
  end
  object Label9: TLabel [8]
    Left = 487
    Top = 155
    Width = 94
    Height = 14
    Caption = 'IP do '#218'ltimo Acesso'
    FocusControl = DBEdit9
  end
  inherited Panel1: TPanel
    Width = 844
    inherited lbPesquisaCodigo: TLabel
      Left = 702
    end
    inherited SBConsulta: TSpeedButton
      Left = 809
    end
    inherited pnSeparador2: TPanel
      Left = 693
    end
    inherited MELocaliza: TMaskEdit
      Left = 760
    end
  end
  inherited StBLongHint: TStatusBar
    Top = 539
    Width = 844
  end
  object DBEdit1: TDBEdit [11]
    Left = 16
    Top = 88
    Width = 353
    Height = 22
    Color = clBtnFace
    DataField = 'COD_DISPOSITIVO'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 2
  end
  object DBEdit2: TDBEdit [12]
    Left = 16
    Top = 128
    Width = 350
    Height = 22
    DataField = 'DESC_DISPOSITIVO'
    DataSource = DataSource1
    TabOrder = 3
  end
  object DBEdit3: TDBEdit [13]
    Left = 384
    Top = 128
    Width = 350
    Height = 22
    DataField = 'DESC_MODELO'
    DataSource = DataSource1
    TabOrder = 4
  end
  object DBEdit4: TDBEdit [14]
    Left = 16
    Top = 171
    Width = 33
    Height = 22
    DataField = 'COD_FILIAL'
    DataSource = DataSource1
    TabOrder = 5
  end
  object DBEdit5: TDBEdit [15]
    Left = 250
    Top = 171
    Width = 49
    Height = 22
    DataField = 'COD_USUARIO'
    DataSource = DataSource1
    TabOrder = 6
  end
  object DBEdit6: TDBEdit [16]
    Left = 16
    Top = 219
    Width = 153
    Height = 22
    DataField = 'DT_ULTIMO_ACESSO'
    DataSource = DataSource1
    TabOrder = 8
  end
  object DBEdit7: TDBEdit [17]
    Left = 190
    Top = 219
    Width = 169
    Height = 22
    DataField = 'DT_REGISTRO'
    DataSource = DataSource1
    TabOrder = 9
  end
  object DBEdit9: TDBEdit [18]
    Left = 487
    Top = 171
    Width = 350
    Height = 22
    DataField = 'DESC_IP_ULTIMO_ACESSO'
    DataSource = DataSource1
    TabOrder = 7
  end
  object DBEdit10: TDBEdit [19]
    Left = 302
    Top = 171
    Width = 161
    Height = 22
    DataField = 'nomeusuario'
    DataSource = DataSource1
    TabOrder = 11
  end
  object DBEdit11: TDBEdit [20]
    Left = 55
    Top = 170
    Width = 170
    Height = 22
    DataField = 'descfilial'
    DataSource = DataSource1
    TabOrder = 12
  end
  object RGSituacao: TRadioGroup [21]
    Left = 368
    Top = 208
    Width = 345
    Height = 121
    Caption = 'Situa'#231#227'o do Dispositivo'
    Items.Strings = (
      'Aprovado'
      'Bloqueado'
      'Pendente')
    TabOrder = 10
  end
  inherited MMCadSimples: TMainMenu
    inherited Relatrios1: TMenuItem
      object PorDatadeAcesso1: TMenuItem
        Caption = 'Por Data de Acesso'
        OnClick = PorDatadeAcesso1Click
      end
    end
  end
  inherited DSPrimario: TDataSource
    DataSet = DMUsuario.QDispositivos
  end
  object DataSource1: TDataSource
    DataSet = DMUsuario.QDispositivos
    Left = 504
    Top = 48
  end
end
