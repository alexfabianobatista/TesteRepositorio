object FObservacao_Cons: TFObservacao_Cons
  Left = 432
  Top = 290
  Width = 623
  Height = 282
  Caption = 'Consulta Observa'#231#227'o'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBMemo1: TDBMemo
    Left = 5
    Top = 5
    Width = 485
    Height = 229
    DataField = 'DESC_OBSERVACAO'
    DataSource = DsConsultaObservacao
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 496
    Top = 120
    Width = 105
    Height = 57
    TabOrder = 1
    Kind = bkOK
  end
  object DsConsultaObservacao: TDataSource
    DataSet = DMProduto.QProdutoCons
    Left = 544
    Top = 16
  end
end
