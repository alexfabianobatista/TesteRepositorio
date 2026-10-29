object FEtiquetaImpressao: TFEtiquetaImpressao
  Left = 486
  Top = 181
  Width = 418
  Height = 432
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Impress'#227'o de Etiquetas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    402
    394)
  PixelsPerInch = 96
  TextHeight = 13
  object BtnConsultar: TBitBtn
    Left = 16
    Top = 16
    Width = 121
    Height = 25
    Caption = 'Consultar Arquivo'
    TabOrder = 0
    OnClick = BtnConsultarClick
  end
  object DbGChapa: TDBGrid
    Left = 16
    Top = 56
    Width = 185
    Height = 297
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DsChapa
    Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DESC_CHAPA'
        Title.Caption = 'Chapa'
        Width = 160
        Visible = True
      end>
  end
  object DbGPeca: TDBGrid
    Left = 208
    Top = 56
    Width = 185
    Height = 297
    Anchors = [akTop, akRight, akBottom]
    DataSource = DsPeca
    Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'COD_PECA'
        Title.Caption = 'Pe'#231'a'
        Width = 160
        Visible = True
      end>
  end
  object EArquivo: TEdit
    Left = 144
    Top = 16
    Width = 249
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 3
  end
  object BtnImprimirTudo: TBitBtn
    Left = 96
    Top = 368
    Width = 121
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'C'#225'lculo Completo'
    TabOrder = 4
    OnClick = BtnImprimirTudoClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
      8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
      8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
      8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
      03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
      03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
      33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
      33333337FFFF7733333333300000033333333337777773333333}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 224
    Top = 368
    Width = 81
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Chapa'
    TabOrder = 5
    OnClick = BitBtn2Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
      8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
      8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
      8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
      03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
      03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
      33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
      33333337FFFF7733333333300000033333333337777773333333}
    NumGlyphs = 2
  end
  object BitBtn3: TBitBtn
    Left = 312
    Top = 368
    Width = 81
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Pe'#231'a'
    TabOrder = 6
    OnClick = BitBtn3Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
      8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
      8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
      8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
      03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
      03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
      33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
      33333337FFFF7733333333300000033333333337777773333333}
    NumGlyphs = 2
  end
  object CdChapa: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 328
    Top = 296
    Data = {
      4B0000009619E0BD0100000018000000020000000000030000004B000A444553
      435F4348415041010049000000010005574944544802000200140009434F445F
      434841504104000100000000000000}
    object CdChapaDESC_CHAPA: TStringField
      FieldName = 'DESC_CHAPA'
    end
    object CdChapaCOD_CHAPA: TIntegerField
      FieldName = 'COD_CHAPA'
    end
  end
  object DsChapa: TDataSource
    DataSet = CdChapa
    Left = 328
    Top = 328
  end
  object DsPeca: TDataSource
    DataSet = CdPeca
    Left = 360
    Top = 328
  end
  object CdPeca: TClientDataSet
    Active = True
    Aggregates = <>
    IndexFieldNames = 'COD_CHAPA'
    MasterFields = 'COD_CHAPA'
    MasterSource = DsChapa
    PacketRecords = 0
    Params = <>
    Left = 360
    Top = 296
    Data = {
      3D0000009619E0BD0100000018000000020000000000030000003D0009434F44
      5F4348415041040001000000000008434F445F50454341040001000000000000
      00}
    object CdPecaCOD_CHAPA: TIntegerField
      FieldName = 'COD_CHAPA'
    end
    object CdPecaCOD_PECA: TIntegerField
      FieldName = 'COD_PECA'
    end
  end
  object OdArquivo: TOpenDialog
    Left = 360
    Top = 264
  end
  object PopupMenu1: TPopupMenu
    Left = 296
    Top = 328
    object Peaselecionada1: TMenuItem
      Caption = 'Pe'#231'a Selecionada'
      OnClick = Peaselecionada1Click
    end
    object Peaavulsa1: TMenuItem
      Caption = 'Pe'#231'a Avulsa'
      OnClick = Peaavulsa1Click
    end
  end
end
