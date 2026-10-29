object FVendaPerdidaCad: TFVendaPerdidaCad
  Left = 361
  Top = 178
  Width = 390
  Height = 228
  Caption = 'Cadastro de Vendas Perdidas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 32
    Width = 55
    Height = 13
    Caption = 'Quantidade'
    FocusControl = DBEdit1
  end
  object DBEdit1: TDBEdit
    Left = 24
    Top = 48
    Width = 81
    Height = 21
    DataField = 'QT_QUANTIDADE'
    DataSource = DsVendaPerdida
    TabOrder = 0
  end
  object BtConfirma: TBitBtn
    Left = 176
    Top = 128
    Width = 89
    Height = 25
    Caption = 'Confirma'
    TabOrder = 2
    OnClick = BtConfirmaClick
    Kind = bkOK
  end
  object BitBtn1: TBitBtn
    Left = 280
    Top = 128
    Width = 81
    Height = 25
    Caption = 'Cancela'
    TabOrder = 3
    OnClick = BitBtn1Click
    Kind = bkCancel
  end
  object DBPanel1: TDBPanel
    Left = 24
    Top = 74
    Width = 337
    Height = 37
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    CodigoTabStop = True
    DataField = 'COD_MOTIVO'
    DataSource = DsVendaPerdida
    DefineByForm = DBPanel1DefineByForm
    fkCache = False
    fkCampo = 'desc_motivo'
    fkChave = 'COD_MOTIVO'
    fkTabela = 'tb_motivo'
    ForeignKey = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
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
    LCaption = 'Motivo'
    ReadOnly = False
    Required = True
    ValidateOnExit = False
    VisibleComponents = [dbpcCodigo, dbpcBusca, dbpcDescricao]
    WidthCodigo = 20.000000000000000000
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 171
    Width = 374
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object DsVendaPerdida: TDataSource
    DataSet = DMProduto.QVendaPerdida
    Left = 312
    Top = 8
  end
  object ActionList1: TActionList
    Left = 8
    Top = 136
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 49222
      OnExecute = Action1Execute
    end
  end
end
