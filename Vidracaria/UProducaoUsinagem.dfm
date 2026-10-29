inherited FProducaoUsinagem: TFProducaoUsinagem
  Caption = 'Usinagem'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited SbQuebra: TSpeedButton
    Left = 725
    Top = 2
    Width = 43
    Height = 34
  end
  object SBVisualizar: TSpeedButton [5]
    Left = 726
    Top = 40
    Width = 41
    Height = 32
    Caption = 'Visualiz'
    OnClick = SBVisualizarClick
  end
  inherited GbProducao: TGroupBox
    Caption = '[ Usinagem ]'
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
