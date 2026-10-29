inherited FPlanoContaAntigoCons: TFPlanoContaAntigoCons
  Left = 285
  Top = 171
  Width = 633
  Height = 455
  Caption = 'Consulta Plano Conta Antigo'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Width = 58
    Caption = 'Nome Conta'
  end
  object Label3: TLabel [1]
    Left = 8
    Top = 48
    Width = 20
    Height = 14
    Caption = 'Filial'
    Visible = False
  end
  object Label4: TLabel [2]
    Left = 168
    Top = 9
    Width = 81
    Height = 14
    Caption = 'C'#243'digo Reduzido'
  end
  object Label5: TLabel [3]
    Left = 264
    Top = 9
    Width = 68
    Height = 14
    Caption = 'N'#250'mero Conta'
  end
  inherited BtOk: TBitBtn
    Left = 519
    Top = 401
  end
  inherited BtCancela: TBitBtn
    Left = 431
    Top = 401
  end
  inherited BtProcurar: TBitBtn
    Left = 536
    Top = 64
    OnClick = BtProcurarClick
  end
  inherited DBGrid1: TDBGrid
    Top = 93
    Width = 609
    Height = 300
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_REDUZIDO'
        Title.Caption = 'Reduzido'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_FILIAL'
        Title.Caption = 'Filial'
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_PLANO_CONTA'
        Title.Caption = 'Descri'#231#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_GRAU'
        Title.Caption = 'Grau'
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_PLANO_CONTA'
        Title.Caption = 'Num Plano Conta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_PLANO_CONTA_ANTIGO'
        Title.Caption = 'Codigo '
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_LIBERADO_USO'
        Title.Caption = 'Liberado'
        Visible = True
      end>
  end
  object MECodFilial: TMaskEdit [9]
    Left = 8
    Top = 64
    Width = 49
    Height = 22
    TabOrder = 5
    Visible = False
  end
  object MEDescFilial: TMaskEdit [10]
    Left = 80
    Top = 64
    Width = 329
    Height = 22
    TabStop = False
    ParentColor = True
    ReadOnly = True
    TabOrder = 6
    Visible = False
  end
  object BitBtn1: TBitBtn [11]
    Left = 56
    Top = 64
    Width = 25
    Height = 22
    TabOrder = 7
    Visible = False
    OnClick = BitBtn1Click
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
  end
  object MeReduzido: TMaskEdit [12]
    Left = 168
    Top = 24
    Width = 81
    Height = 22
    TabOrder = 8
  end
  object MeNumConta: TMaskEdit [13]
    Left = 264
    Top = 24
    Width = 137
    Height = 22
    TabOrder = 9
  end
  object RgLiberado: TRadioGroup [14]
    Left = 416
    Top = 16
    Width = 97
    Height = 73
    Caption = 'Liberado p/usar'
    ItemIndex = 0
    Items.Strings = (
      'Sim'
      'N'#227'o'
      'Todas')
    TabOrder = 10
  end
  inherited DSConsulta: TDataSource
    DataSet = DMPlanoConta.QPlanoContaAntigoCons
    Left = 392
    Top = 400
  end
  inherited PopupMenu1: TPopupMenu
    Left = 360
    Top = 400
  end
end
