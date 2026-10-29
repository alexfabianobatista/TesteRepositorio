object FConsultaEstoquePorNota: TFConsultaEstoquePorNota
  Left = 375
  Top = 182
  Width = 869
  Height = 507
  Caption = 'Consulta Estoque Por Nota'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    853
    468)
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 4
    Width = 836
    Height = 428
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DSConsultaEstoqueNota
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_FILIAL'
        Title.Caption = 'Filial'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_PRODUTO'
        Title.Caption = 'C'#243'd. Produto'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_PRODUTO'
        Title.Caption = 'Produto'
        Width = 533
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QT_QUANTIDADE'
        Title.Caption = 'Qt. Estoque'
        Width = 73
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 338
    Top = 435
    Width = 119
    Height = 30
    Anchors = [akBottom]
    Caption = 'Sair'
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = BitBtn1Click
    NumGlyphs = 2
  end
  object DSConsultaEstoqueNota: TDataSource
    DataSet = DMNotaEntrada.QConsNotaEstoque
    Left = 800
    Top = 416
  end
end
