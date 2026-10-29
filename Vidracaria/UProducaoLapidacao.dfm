inherited FProducaoLapidacao: TFProducaoLapidacao
  Caption = 'Lapida'#231#227'o'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited LMensagem: TLabel
    Top = 7
    Width = 251
  end
  inherited SbQuebra: TSpeedButton
    Left = 712
    Top = 0
    Width = 52
    Height = 31
  end
  object btnSBVisualizar: TSpeedButton [5]
    Left = 712
    Top = 32
    Width = 52
    Height = 31
    Caption = 'Visualizar'
    OnClick = btnSBVisualizarClick
  end
  inherited GbProducao: TGroupBox
    Width = 749
    Caption = '[ Lapida'#231'ao ]'
    inherited DbGProducao: TDBGrid
      Width = 745
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
