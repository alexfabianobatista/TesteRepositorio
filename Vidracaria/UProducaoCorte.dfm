inherited FProducaoCorte: TFProducaoCorte
  Left = 523
  Top = 153
  Caption = 'Corte'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited SbQuebra: TSpeedButton
    Left = 731
    Top = 2
    Height = 33
  end
  object SBVisualizar: TSpeedButton [5]
    Left = 731
    Top = 40
    Width = 41
    Height = 32
    Caption = 'Visualiz'
    OnClick = SBVisualizarClick
  end
  inherited GbProducao: TGroupBox
    Caption = '[ Corte ]'
    inherited DbGProducao: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_PEDIDO_CAB'
          Title.Alignment = taRightJustify
          Title.Caption = 'Pedido'
          Width = 80
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'COD_PECA'
          Title.Alignment = taRightJustify
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
