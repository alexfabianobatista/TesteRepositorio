object DMConexao: TDMConexao
  OldCreateOrder = False
  Left = 387
  Top = 148
  Height = 137
  Width = 293
  object IBInterbase: TIBDatabase
    Connected = True
    DatabaseName = 'C:\grasel\Sighaib\cereal.gdb'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTransaction
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 32
    Top = 16
  end
  object IBTransaction: TIBTransaction
    Active = True
    DefaultDatabase = IBInterbase
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 104
    Top = 16
  end
end
