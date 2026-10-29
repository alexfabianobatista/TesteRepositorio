inherited FProducaoForno: TFProducaoForno
  Caption = 'Forno'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited SbQuebra: TSpeedButton
    Left = 722
    Top = 4
    Height = 32
  end
  object SBVisualizar: TSpeedButton [5]
    Left = 722
    Top = 40
    Width = 41
    Height = 32
    Caption = '&Visualiz'
    OnClick = SBVisualizarClick
  end
  inherited GbProducao: TGroupBox
    Height = 435
    Caption = '[ Forno ]'
    inherited DbGProducao: TDBGrid
      Height = 418
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
        end
        item
          Expanded = False
          FieldName = 'IND_FORNO'
          Title.Caption = 'Forno'
          Visible = False
        end>
    end
  end
end
