inherited FRastrearCad: TFRastrearCad
  Left = 316
  Top = 121
  Caption = 'Rastrear'
  ClientHeight = 498
  ClientWidth = 801
  PixelsPerInch = 96
  TextHeight = 14
  object Label2: TLabel [0]
    Left = 80
    Top = 39
    Width = 21
    Height = 14
    Caption = 'Lote'
  end
  object Label1: TLabel [1]
    Left = 8
    Top = 38
    Width = 24
    Height = 14
    Caption = 'Pe'#231'a'
  end
  inherited Panel1: TPanel
    Width = 801
    Enabled = False
    TabOrder = 3
    Visible = False
    inherited BtCopia: TSpeedButton
      Left = 328
    end
  end
  inherited StBLongHint: TStatusBar
    Top = 479
    Width = 801
  end
  object MeLote: TMaskEdit [4]
    Left = 81
    Top = 55
    Width = 57
    Height = 22
    EditMask = '######'
    MaxLength = 6
    TabOrder = 1
    Text = '      '
  end
  object MePeca: TMaskEdit [5]
    Left = 9
    Top = 54
    Width = 57
    Height = 22
    EditMask = '######'
    MaxLength = 6
    TabOrder = 0
    Text = '      '
  end
  object BitBtn2: TBitBtn [6]
    Left = 161
    Top = 52
    Width = 75
    Height = 25
    Caption = 'Consultar'
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object DBGrid1: TDBGrid [7]
    Left = 8
    Top = 80
    Width = 753
    Height = 385
    DataSource = DSPrimario
    TabOrder = 5
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_PEDIDO'
        Title.Caption = 'C'#243'd.Pedido'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_PECA'
        Title.Caption = 'C'#243'd.Pe'#231'a'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_LOTE_TIPO'
        Title.Caption = 'C'#243'd.Lote'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_LOTE'
        Title.Caption = 'Lote'
        Width = 133
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_CADASTRO'
        Title.Caption = 'C'#243'd.Fornecedor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Fornecedor'
        Visible = True
      end>
  end
  inherited MMCadSimples: TMainMenu
    Left = 376
    inherited Manuteno1: TMenuItem
      Visible = False
    end
    inherited Relatrios1: TMenuItem
      Visible = False
    end
  end
  inherited DSPrimario: TDataSource
    DataSet = DmVidracaria.QRRastreamento
    Left = 400
  end
  inherited ILBotao: TImageList
    Left = 352
  end
  object OpenDialog1: TOpenDialog
    Left = 488
    Top = 8
  end
end
