inherited FProducaoConferencia: TFProducaoConferencia
  Left = 414
  Top = 153
  Caption = 'FProducaoConferencia'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited SbQuebra: TSpeedButton
    Top = 1
    Width = 37
    Height = 31
  end
  object SBVisualizar: TSpeedButton [5]
    Left = 721
    Top = 36
    Width = 36
    Height = 32
    Caption = 'Visualiz'
    OnClick = SBVisualizarClick
  end
  inherited GbProducao: TGroupBox
    Caption = 'Confer'#234'ncia'
    inherited DbGProducao: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_PEDIDO_CAB'
          Title.Caption = 'Pedido'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_PECA'
          Title.Caption = 'Pe'#231'a'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_CADASTRO'
          Title.Caption = 'Cliente'
          Width = 490
          Visible = True
        end>
    end
  end
end
