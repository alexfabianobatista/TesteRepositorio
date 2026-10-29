inherited FProducaoReposicao: TFProducaoReposicao
  Left = 251
  Top = 159
  Width = 741
  Height = 459
  Caption = 'Quebra'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Label1: TLabel
    Width = 224
    Caption = 'Pe'#231'a a Quebrar'
  end
  inherited LMensagem: TLabel
    Width = 216
  end
  inherited SbQuebra: TSpeedButton
    Left = 679
  end
  inherited GbProducao: TGroupBox
    Width = 704
    Height = 346
    Caption = '[ Quebra ]'
    inherited DbGProducao: TDBGrid
      Width = 700
      Height = 329
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
  inherited BitBtn1: TBitBtn
    Left = 248
    Top = -8
    Enabled = False
    Visible = False
  end
end
