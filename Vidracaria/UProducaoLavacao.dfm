inherited FProducaoLavacao: TFProducaoLavacao
  Left = 341
  Top = 152
  Width = 822
  Caption = 'Lava'#231#227'o'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited LMensagem: TLabel
    Width = 288
  end
  inherited SbQuebra: TSpeedButton
    Left = 753
    Top = 3
    Width = 51
    Height = 32
  end
  object btnSBVisualizar: TSpeedButton [5]
    Left = 753
    Top = 38
    Width = 51
    Height = 30
    Anchors = [akTop, akRight]
    Caption = 'Visualizar'
    OnClick = btnSBVisualizarClick
  end
  inherited GbProducao: TGroupBox
    Width = 789
    Caption = '[ Lava'#231#227'o ]'
    inherited DbGProducao: TDBGrid
      Width = 785
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
          Title.Caption = 'Peca'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_CADASTRO'
          Title.Caption = 'Cliente'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 490
          Visible = True
        end>
    end
  end
end
