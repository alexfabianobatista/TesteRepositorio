inherited FProducaoFuracao: TFProducaoFuracao
  Left = 369
  Top = 167
  Caption = 'Fura'#231#227'o'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited SbQuebra: TSpeedButton
    Left = 715
    Top = 2
    Width = 52
    Height = 32
  end
  object btnSBVisualizar: TSpeedButton [5]
    Left = 715
    Top = 38
    Width = 52
    Height = 31
    Caption = 'Visualizar'
    OnClick = btnSBVisualizarClick
  end
  inherited GbProducao: TGroupBox
    Top = 77
    Width = 750
    Caption = '[ Fura'#231#227'o ]'
    inherited DbGProducao: TDBGrid
      Width = 746
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_PEDIDO_CAB'
          Title.Caption = 'Pedido'
          Width = 80
          Visible = True
        end
        item
          Alignment = taRightJustify
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
