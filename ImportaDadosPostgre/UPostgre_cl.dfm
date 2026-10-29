object DMPostgre: TDMPostgre
  OldCreateOrder = False
  Left = 477
  Top = 256
  Height = 247
  Width = 318
  object ZConnection1: TZConnection
    ControlsCodePage = cGET_ACP
    AutoEncodeStrings = False
    ClientCodepage = 'WIN1252'
    Properties.Strings = (
      'controls_cp=GET_ACP'
      'codepage=WIN1252')
    HostName = 'localhost'
    Port = 5432
    Database = 'seta'
    User = 'postgres'
    Password = 'cemapa'
    Protocol = 'postgresql'
    Left = 32
    Top = 16
  end
end
