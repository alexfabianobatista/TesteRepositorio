object DmSistema: TDmSistema
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 625
  Top = 246
  Height = 243
  Width = 296
  object DbSistema: TIBDatabase
    DatabaseName = 'C:\PIZZARIA.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 24
    Top = 8
  end
  object TSistema: TIBTransaction
    Active = False
    DefaultDatabase = DbSistema
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 88
    Top = 8
  end
end
