object FAtualizaFreteComissao: TFAtualizaFreteComissao
  Left = 463
  Top = 173
  Width = 327
  Height = 172
  Caption = 'Atualiza Vl Frete Comiss'#227'o'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 53
    Width = 87
    Height = 13
    Caption = 'Vl. Frete Comiss'#227'o'
  end
  object Label2: TLabel
    Left = 16
    Top = 8
    Width = 23
    Height = 13
    Caption = 'Nota'
    FocusControl = DBEdit2
  end
  object DBEdit2: TDBEdit
    Left = 16
    Top = 22
    Width = 89
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'COD_NOTA_CAB'
    DataSource = DMNotaSaida.DSNotaSaida
    ReadOnly = True
    TabOrder = 0
  end
  object BtConfirmar: TBitBtn
    Left = 112
    Top = 65
    Width = 89
    Height = 25
    Hint = 'Confirmar quantidade'
    Caption = 'Confirmar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = BtConfirmarClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000010000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      555555555555555555555555555555555555555555FF55555555555559055555
      55555555577FF5555555555599905555555555557777F5555555555599905555
      555555557777FF5555555559999905555555555777777F555555559999990555
      5555557777777FF5555557990599905555555777757777F55555790555599055
      55557775555777FF5555555555599905555555555557777F5555555555559905
      555555555555777FF5555555555559905555555555555777FF55555555555579
      05555555555555777FF5555555555557905555555555555777FF555555555555
      5990555555555555577755555555555555555555555555555555}
    NumGlyphs = 2
  end
  object MeValFrete: TMaskEdit
    Left = 16
    Top = 68
    Width = 89
    Height = 21
    TabOrder = 2
  end
end
