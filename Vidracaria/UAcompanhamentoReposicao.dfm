object FAcompanhamentoReposicao: TFAcompanhamentoReposicao
  Left = 205
  Top = 73
  Width = 833
  Height = 544
  Caption = 'Acompanhamento Reposi'#231#227'o'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  DesignSize = (
    817
    506)
  PixelsPerInch = 96
  TextHeight = 13
  inline FmProduto1: TFmProduto
    Left = 13
    Top = 16
    Width = 436
    Height = 40
    TabOrder = 0
    inherited MeProduto: TMaskEdit
      OnExit = FmProduto1MeProdutoExit
    end
    inherited BtProduto: TBitBtn
      OnClick = FmProduto1BtProdutoClick
    end
    inherited EdProduto: TEdit
      Width = 360
    end
  end
  object DBGrid1: TDBGrid
    Left = 11
    Top = 60
    Width = 802
    Height = 445
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DsAcompanhamento
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_PEDIDO_CAB'
        Title.Alignment = taRightJustify
        Title.Caption = 'Pedido'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_PECA'
        Title.Caption = 'C'#243'd.Pe'#231'a'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Cliente'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_PRODUTO'
        Title.Caption = 'Produto'
        Width = 257
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_LARGURA'
        Title.Alignment = taRightJustify
        Title.Caption = 'Largura'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_ALTURA'
        Title.Alignment = taRightJustify
        Title.Caption = 'Altura'
        Visible = True
      end>
  end
  object DsAcompanhamento: TDataSource
    DataSet = DMPedido.QAcompanhamentoReposicao
    Left = 512
    Top = 16
  end
end
