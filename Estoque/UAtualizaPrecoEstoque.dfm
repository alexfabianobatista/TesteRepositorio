object FAtualizaPrecoEstoque: TFAtualizaPrecoEstoque
  Left = 486
  Top = 109
  Width = 346
  Height = 416
  Caption = 'Atualiza Pre'#231'o Todo Estoque'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    330
    377)
  PixelsPerInch = 96
  TextHeight = 13
  object LblPorcentagem: TLabel
    Left = 8
    Top = 8
    Width = 119
    Height = 13
    Caption = 'Percentual Reajuste (%) :'
  end
  object SBCodClasse: TSpeedButton
    Left = 56
    Top = 142
    Width = 22
    Height = 22
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000010000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
      55555575555555775F55509999999901055557F55555557F75F5001111111101
      105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
      01105777F555557F75F75500FFFFFF0FF0105577F555FF7F57575550FF700008
      8F0055575FF7777555775555000888888F005555777FFFFFFF77555550000000
      0F055555577777777F7F555550FFFFFF0F05555557F5FFF57F7F555550F000FF
      0005555557F777557775555550FFFFFF0555555557F555FF7F55555550FF7000
      05555555575FF777755555555500055555555555557775555555}
    NumGlyphs = 2
    OnClick = SBCodClasseClick
  end
  object Label3: TLabel
    Left = 7
    Top = 127
    Width = 31
    Height = 13
    Caption = 'Classe'
  end
  object Label4: TLabel
    Left = 85
    Top = 128
    Width = 90
    Height = 13
    Caption = 'Classe - SubClasse'
  end
  object MePorcentagem: TMaskEdit
    Left = 8
    Top = 24
    Width = 114
    Height = 21
    TabOrder = 0
    Text = '0'
    OnKeyPress = MePorcentagemKeyPress
  end
  object BtOk: TBitBtn
    Left = 159
    Top = 340
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    TabOrder = 8
    OnClick = BtOkClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object BtCancelar: TBitBtn
    Left = 247
    Top = 340
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cancelar'
    TabOrder = 9
    Kind = bkCancel
  end
  inline FmProduto: TFmProduto
    Left = 8
    Top = 168
    Width = 304
    Height = 41
    TabOrder = 4
    inherited BtProduto: TBitBtn
      OnClick = FmProdutoBtProdutoClick
    end
    inherited EdProduto: TEdit
      Width = 228
    end
  end
  object CBVarejo: TCheckBox
    Left = 8
    Top = 308
    Width = 153
    Height = 17
    Caption = 'Atualizar pre'#231'o Varejo'
    Checked = True
    State = cbChecked
    TabOrder = 6
  end
  object CBAtacado: TCheckBox
    Left = 176
    Top = 308
    Width = 137
    Height = 17
    Caption = 'Atualizar pre'#231'o Atacado'
    TabOrder = 7
  end
  inline FmFilial: TFmFilial
    Left = 8
    Top = 48
    Width = 304
    Height = 41
    TabOrder = 1
    inherited EdFilial: TEdit
      Width = 228
    end
  end
  object MeCodClasse: TMaskEdit
    Left = 7
    Top = 143
    Width = 43
    Height = 21
    EditMask = '######'
    MaxLength = 6
    TabOrder = 3
    Text = '      '
    OnExit = MeCodClasseExit
  end
  object EdDescClasse: TEdit
    Left = 85
    Top = 143
    Width = 228
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 10
  end
  inline FmMarca1: TFmMarca
    Left = 8
    Top = 88
    Width = 304
    Height = 40
    TabOrder = 2
    inherited EdMarca: TEdit
      Width = 228
    end
  end
  inline FmLote1: TFmLote
    Left = 8
    Top = 211
    Width = 304
    Height = 37
    TabOrder = 5
    inherited EdLote: TEdit
      Width = 228
    end
  end
  inline FmCadastro1: TFmCadastro
    Left = 9
    Top = 256
    Width = 304
    Height = 37
    TabOrder = 11
    inherited Label1: TLabel
      Width = 50
      Caption = 'Fabricante'
    end
    inherited EdCadastro: TEdit
      Width = 228
    end
  end
end
