inherited FBloqueioProdutoParam: TFBloqueioProdutoParam
  Left = 348
  Top = 121
  Height = 428
  Caption = 'Parametros de Bloqueio'
  PixelsPerInch = 96
  TextHeight = 14
  inherited PGRelatorio: TPageControl
    Height = 313
  end
  inherited BtOk: TBitBtn
    Top = 368
    TabOrder = 2
  end
  inherited BtCancela: TBitBtn
    Top = 368
    TabOrder = 3
  end
  inherited RGPreview: TRadioGroup
    Top = 336
    TabOrder = 1
  end
  inline Fm0Produto: TFmProduto
    Left = 16
    Top = 16
    Width = 265
    Height = 41
    TabOrder = 4
    inherited Label1: TLabel
      Height = 14
    end
    inherited MeProduto: TMaskEdit
      Height = 22
    end
    inherited EdProduto: TEdit
      Height = 22
    end
  end
  object GroupBox8: TGroupBox
    Left = 207
    Top = 240
    Width = 181
    Height = 58
    Caption = 'Data de Bloqueio'
    TabOrder = 7
    object Label146: TLabel
      Left = 9
      Top = 12
      Width = 13
      Height = 14
      Caption = 'De'
    end
    object Label147: TLabel
      Left = 95
      Top = 12
      Width = 17
      Height = 14
      Caption = 'At'#233
    end
    object ME0DtBloqueioIni: TMaskEdit
      Left = 9
      Top = 29
      Width = 78
      Height = 22
      EditMask = '!99/99/00##;1;_'
      MaxLength = 10
      TabOrder = 0
      Text = '  /  /    '
    end
    object ME0DtBloqueioFim: TMaskEdit
      Left = 95
      Top = 29
      Width = 78
      Height = 22
      EditMask = '!99/99/00##;1;_'
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
    end
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 240
    Width = 181
    Height = 58
    Caption = 'Data de Lan'#231'amento'
    TabOrder = 6
    object Label1: TLabel
      Left = 9
      Top = 12
      Width = 13
      Height = 14
      Caption = 'De'
    end
    object Label2: TLabel
      Left = 95
      Top = 12
      Width = 17
      Height = 14
      Caption = 'At'#233
    end
    object ME0DtLancamentoIni: TMaskEdit
      Left = 9
      Top = 29
      Width = 78
      Height = 22
      EditMask = '!99/99/00##;1;_'
      MaxLength = 10
      TabOrder = 0
      Text = '  /  /    '
    end
    object ME0DtLancamentoFim: TMaskEdit
      Left = 95
      Top = 29
      Width = 78
      Height = 22
      EditMask = '!99/99/00##;1;_'
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
    end
  end
  object RG0TipoProduto: TRadioGroup
    Left = 16
    Top = 192
    Width = 289
    Height = 41
    Caption = 'Tipo de Produto'
    Columns = 3
    ItemIndex = 2
    Items.Strings = (
      'Fixar'
      'Consumo'
      'Todos')
    TabOrder = 5
  end
end
