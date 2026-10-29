inherited FProducaoLaminado: TFProducaoLaminado
  Left = 374
  Top = 130
  Height = 538
  Caption = 'Laminado'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited SbQuebra: TSpeedButton
    Left = 713
    Top = 3
    Width = 51
    Height = 30
  end
  object btnSBVisualizar: TSpeedButton [5]
    Left = 713
    Top = 37
    Width = 51
    Height = 30
    Anchors = [akTop, akRight]
    Caption = 'Visualizar'
    OnClick = btnSBVisualizarClick
  end
  inherited GbProducao: TGroupBox
    Width = 748
    Height = 425
    inherited DbGProducao: TDBGrid
      Width = 744
      Height = 408
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_PEDIDO_CAB'
          Title.Caption = 'Pedido'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_PECA'
          Title.Caption = 'Pe'#231'a'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_CADASTRO'
          Title.Caption = 'Cliente'
          Visible = True
        end>
    end
  end
end
