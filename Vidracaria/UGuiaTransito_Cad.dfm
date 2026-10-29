inherited FGuiaTransito_Cad: TFGuiaTransito_Cad
  Left = 215
  Top = 40
  Caption = 'Cadastro Guia de Tr'#226'nsito'
  ClientHeight = 514
  ClientWidth = 618
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel [0]
    Left = 24
    Top = 56
    Width = 33
    Height = 14
    Caption = 'C'#243'digo'
    FocusControl = DBEdit1
  end
  object Label2: TLabel [1]
    Left = 104
    Top = 56
    Width = 47
    Height = 14
    Caption = 'Cod. Nota'
    FocusControl = DBEdit2
  end
  object Label3: TLabel [2]
    Left = 24
    Top = 104
    Width = 66
    Height = 14
    Caption = 'Consignat'#225'rio'
    FocusControl = DBEdit3
  end
  object Label4: TLabel [3]
    Left = 176
    Top = 189
    Width = 72
    Height = 14
    Caption = 'Hora Lacra'#231#227'o'
    FocusControl = DBEdit4
  end
  object Label5: TLabel [4]
    Left = 24
    Top = 149
    Width = 36
    Height = 14
    Caption = 'Destino'
    FocusControl = DBEdit5
  end
  object Label6: TLabel [5]
    Left = 24
    Top = 189
    Width = 45
    Height = 14
    Caption = 'Nr. Lacre'
    FocusControl = DBEdit6
  end
  object Label7: TLabel [6]
    Left = 280
    Top = 189
    Width = 61
    Height = 14
    Caption = 'Temperatura'
    FocusControl = DBEdit7
  end
  object Label8: TLabel [7]
    Left = 224
    Top = 56
    Width = 39
    Height = 14
    Caption = 'Nr. Guia'
    FocusControl = DBEdit8
  end
  object Label9: TLabel [8]
    Left = 312
    Top = 56
    Width = 25
    Height = 14
    Caption = 'S'#233'rie'
    FocusControl = DBEdit9
  end
  object SbConsNota: TSpeedButton [9]
    Left = 180
    Top = 71
    Width = 27
    Height = 25
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
    OnClick = SbConsNotaClick
  end
  object Label10: TLabel [10]
    Left = 368
    Top = 56
    Width = 56
    Height = 14
    Caption = 'Dt. Emiss'#227'o'
    FocusControl = DBEdit10
  end
  object Label11: TLabel [11]
    Left = 24
    Top = 232
    Width = 60
    Height = 14
    Caption = 'Observa'#231#227'o'
    FocusControl = DBEdit11
  end
  inherited Panel1: TPanel
    Width = 618
    TabOrder = 13
  end
  inherited StBLongHint: TStatusBar
    Top = 495
    Width = 618
  end
  object DBEdit1: TDBEdit [14]
    Left = 24
    Top = 71
    Width = 73
    Height = 22
    TabStop = False
    Color = clBtnFace
    DataField = 'COD_GUIA_TRANSITO'
    DataSource = DSPrimario
    ReadOnly = True
    TabOrder = 0
  end
  object DBEdit2: TDBEdit [15]
    Left = 104
    Top = 71
    Width = 73
    Height = 22
    DataField = 'COD_NOTA_CAB'
    DataSource = DSPrimario
    TabOrder = 1
  end
  object DBEdit3: TDBEdit [16]
    Left = 24
    Top = 120
    Width = 564
    Height = 22
    DataField = 'DESC_CONSIGNATARIO'
    DataSource = DSPrimario
    TabOrder = 5
  end
  object DBEdit4: TDBEdit [17]
    Left = 176
    Top = 205
    Width = 88
    Height = 22
    DataField = 'DESC_HORA'
    DataSource = DSPrimario
    TabOrder = 8
  end
  object DBEdit5: TDBEdit [18]
    Left = 24
    Top = 165
    Width = 564
    Height = 22
    DataField = 'DESC_DESTINO'
    DataSource = DSPrimario
    TabOrder = 6
  end
  object DBEdit6: TDBEdit [19]
    Left = 24
    Top = 205
    Width = 144
    Height = 22
    DataField = 'DESC_LACRE'
    DataSource = DSPrimario
    TabOrder = 7
  end
  object DBEdit7: TDBEdit [20]
    Left = 280
    Top = 205
    Width = 144
    Height = 22
    DataField = 'DESC_TEMPERATURA'
    DataSource = DSPrimario
    TabOrder = 9
  end
  object DBEdit8: TDBEdit [21]
    Left = 224
    Top = 71
    Width = 73
    Height = 22
    DataField = 'NUM_GUIA_TRANSITO'
    DataSource = DSPrimario
    TabOrder = 2
  end
  object DBEdit9: TDBEdit [22]
    Left = 312
    Top = 71
    Width = 46
    Height = 22
    DataField = 'COD_SERIE'
    DataSource = DSPrimario
    TabOrder = 3
  end
  object DBGrid1: TDBGrid [23]
    Left = 24
    Top = 328
    Width = 569
    Height = 153
    DataSource = DsGuiaTransitoItens
    TabOrder = 15
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DESC_CLASSE'
        Title.Caption = 'Esp'#233'cie'
        Width = 202
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SQT_PESO'
        Title.Caption = 'Peso Kg'
        Width = 117
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SNUM_VOLUMES'
        Title.Caption = 'Nr. Volumes'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_UNIDADE'
        Title.Caption = 'Natureza'
        Width = 75
        Visible = True
      end>
  end
  object DBEdit10: TDBEdit [24]
    Left = 368
    Top = 71
    Width = 97
    Height = 22
    DataField = 'DT_EMISSAO'
    DataSource = DSPrimario
    TabOrder = 4
  end
  object DBEdit11: TDBEdit [25]
    Left = 24
    Top = 248
    Width = 561
    Height = 22
    DataField = 'DESC_OBS1'
    DataSource = DSPrimario
    TabOrder = 10
  end
  object DBEdit12: TDBEdit [26]
    Left = 24
    Top = 272
    Width = 561
    Height = 22
    DataField = 'DESC_OBS2'
    DataSource = DSPrimario
    TabOrder = 11
  end
  object DBEdit13: TDBEdit [27]
    Left = 24
    Top = 296
    Width = 561
    Height = 22
    DataField = 'DESC_OBS3'
    DataSource = DSPrimario
    TabOrder = 12
  end
  inherited MMCadSimples: TMainMenu
    inherited Relatrios1: TMenuItem
      object EmissoGuiaTransito1: TMenuItem
        Caption = 'Emiss'#227'o Guia Tr'#226'nsito'
      end
    end
  end
  object DsGuiaTransitoItens: TDataSource
    Left = 576
    Top = 8
  end
end
