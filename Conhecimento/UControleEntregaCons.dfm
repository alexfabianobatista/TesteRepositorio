inherited FControleEntregaCons: TFControleEntregaCons
  Left = 611
  Top = 198
  Width = 736
  Height = 324
  Caption = 'Consulta Controle de Entrega'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Left = 482
    Top = 12
    Width = 39
    Caption = 'Dt.Inicial'
  end
  object Label11: TLabel [1]
    Left = 556
    Top = 13
    Width = 35
    Height = 14
    Caption = 'Dt.Final'
  end
  inherited BtOk: TBitBtn
    Left = 628
    Top = 254
    TabOrder = 7
  end
  inherited BtCancela: TBitBtn
    Left = 540
    Top = 254
    TabOrder = 8
  end
  inherited BtProcurar: TBitBtn
    Left = 631
    TabOrder = 2
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Left = 482
    Top = 28
    Width = 65
    EditMask = '!99/99/##00;1;_'
    MaxLength = 10
    Text = '  /  /    '
  end
  inherited DBGrid1: TDBGrid
    Width = 704
    Height = 193
    TabOrder = 6
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_CONTROLE_ENTREGA'
        Title.Caption = 'C'#243'digo'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DT_ENTREGA'
        Title.Caption = 'Data Entrega'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_NOTA_CAB'
        Title.Caption = 'C'#243'digo Nota'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_NOTA'
        Title.Caption = 'Num. Nota'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_CADASTRO_REMETENTE'
        Title.Caption = 'Remetente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_CADASTRO_DESTINATARIO'
        Title.Caption = 'Destinat'#225'rio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_CADASTRO_RECEBEDOR'
        Title.Caption = 'Recebedor'
        Visible = True
      end>
  end
  inline FmCadastroRemetente: TFmCadastro [7]
    Left = 8
    Top = 7
    Width = 76
    Height = 37
    TabOrder = 3
    inherited Label1: TLabel
      Width = 51
      Height = 14
      Caption = 'Remetente'
    end
    inherited MeCadastro: TMaskEdit
      Height = 22
    end
    inherited EdCadastro: TEdit
      Width = 0
      Height = 22
    end
  end
  inline FmCadastroDestinatario: TFmCadastro [8]
    Left = 90
    Top = 7
    Width = 75
    Height = 37
    TabOrder = 4
    inherited Label1: TLabel
      Width = 57
      Height = 14
      Caption = 'Destinat'#225'rio'
    end
    inherited MeCadastro: TMaskEdit
      Height = 22
    end
    inherited EdCadastro: TEdit
      Width = 0
      Height = 22
    end
  end
  inline FmCadastroRecebedor: TFmCadastro
    Left = 175
    Top = 8
    Width = 74
    Height = 37
    TabOrder = 5
    inherited Label1: TLabel
      Width = 53
      Height = 14
      Caption = 'Recebedor'
    end
    inherited MeCadastro: TMaskEdit
      Height = 22
    end
    inherited EdCadastro: TEdit
      Width = 20
      Height = 22
    end
  end
  object MeDtFim: TMaskEdit
    Left = 554
    Top = 27
    Width = 68
    Height = 22
    EditMask = '!99/99/##00;1;_'
    MaxLength = 10
    TabOrder = 1
    Text = '  /  /    '
  end
  inherited DSConsulta: TDataSource
    DataSet = DMConhecimento.QControleEntregaCons
    Left = 688
    Top = 0
  end
  inherited PopupMenu1: TPopupMenu
    Left = 656
    Top = 0
  end
end
