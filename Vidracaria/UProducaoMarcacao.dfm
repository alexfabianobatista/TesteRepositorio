inherited FProducaoMarcacao: TFProducaoMarcacao
  Caption = 'Marca'#231#227'o'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited SbQuebra: TSpeedButton
    Left = 728
    Top = 5
    Height = 32
  end
  object SBVisualizar: TSpeedButton [5]
    Left = 728
    Top = 40
    Width = 41
    Height = 32
    Caption = 'Visualiz'
    OnClick = SBVisualizarClick
  end
  inherited GbProducao: TGroupBox
    Caption = '[ Marca'#231#227'o ]'
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
