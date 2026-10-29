object FNFeRetorno: TFNFeRetorno
  Left = 309
  Top = 135
  Width = 816
  Height = 378
  Caption = 'Retorno da NF-e'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  DesignSize = (
    800
    339)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 81
    Width = 81
    Height = 13
    Caption = 'C'#243'digo de Status'
    Visible = False
  end
  object Label2: TLabel
    Left = 8
    Top = 9
    Width = 48
    Height = 13
    Caption = 'Resultado'
  end
  object MECStat: TMaskEdit
    Left = 8
    Top = 97
    Width = 789
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    ReadOnly = True
    TabOrder = 0
    Visible = False
  end
  object PPrincipal: TPanel
    Left = 8
    Top = 24
    Width = 784
    Height = 266
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 1
    object treeViewResultado: TTreeView
      Left = 0
      Top = 0
      Width = 784
      Height = 266
      Align = alClient
      AutoExpand = True
      BevelKind = bkFlat
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Indent = 19
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
    end
  end
  object BtFechar: TBitBtn
    Left = 676
    Top = 298
    Width = 115
    Height = 35
    Anchors = [akRight, akBottom]
    Caption = '&Fechar'
    Default = True
    TabOrder = 2
    OnClick = BtFecharClick
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
  object BtErro: TBitBtn
    Left = 8
    Top = 300
    Width = 313
    Height = 33
    Anchors = [akLeft, akBottom]
    Caption = 'Deu erro? Clique aqui'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = BtErroClick
  end
end
