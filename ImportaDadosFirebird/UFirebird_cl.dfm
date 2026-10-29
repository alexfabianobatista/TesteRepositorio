object DMFirebird: TDMFirebird
  OldCreateOrder = False
  Left = 456
  Top = 208
  Height = 247
  Width = 318
  object ZConnection1: TZConnection
    ControlsCodePage = cGET_ACP
    AutoEncodeStrings = False
    Port = 3050
    Database = 'D:\ImportacaoClientes\PAMPA BRINDES\HMNFE.FDB'
    User = 'SYSDBA'
    Password = 'masterkey'
    Protocol = 'firebird-2.1'
    Left = 32
    Top = 16
  end
end
