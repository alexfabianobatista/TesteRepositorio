object FConfirmaBoletimProducao: TFConfirmaBoletimProducao
  Left = 321
  Top = 207
  Width = 700
  Height = 313
  Caption = 'Confirmar Odem de Produ'#231#227'o'
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
    684
    274)
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 684
    Height = 223
    ActivePage = TabSheet1
    Align = alTop
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Confirma Boletim de Produ'#231#227'o'
      object Label12: TLabel
        Left = 342
        Top = 129
        Width = 72
        Height = 13
        Caption = 'Qtd. a produzir:'
      end
      object MEQtBaixar: TMaskEdit
        Left = 421
        Top = 126
        Width = 73
        Height = 21
        TabOrder = 0
      end
      object BtBaixaAux: TBitBtn
        Left = 504
        Top = 108
        Width = 121
        Height = 25
        Caption = 'Baixar'
        TabOrder = 1
        OnClick = BtBaixaAuxClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333333333333333333333333333333333333333333333FF333333333333
          3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
          E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
          E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
          E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
          000033333373FF77777733333330003333333333333777333333333333333333
          3333333333333333333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
      end
      object DBGrid1: TDBGrid
        Left = 16
        Top = 17
        Width = 645
        Height = 82
        DataSource = DMBoletim.DsBoletimProducao
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'COD_BOLETIM'
            Title.Caption = 'C'#243'd.Ordem'
            Width = 59
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_BOLETIM'
            Title.Caption = 'Data'
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COD_FORMULA'
            Title.Caption = 'C'#243'd. F'#243'rmula'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome_formula'
            Title.Caption = 'Produto Acabado'
            Width = 262
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QT_FABRICADO'
            Title.Caption = 'Qtd. Ordem'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QT_BAIXADO'
            Title.Caption = 'Qtd. Produzido'
            Width = 78
            Visible = True
          end>
      end
      object BtVoltaBaixa: TBitBtn
        Left = 504
        Top = 147
        Width = 121
        Height = 25
        Caption = 'Volta Baixa'
        TabOrder = 2
        OnClick = BtVoltaBaixaClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333333333333333333333333333333333333333333333FF333333333333
          3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
          E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
          E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
          E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
          000033333373FF77777733333330003333333333333777333333333333333333
          3333333333333333333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
      end
    end
  end
  object BtOk: TBitBtn
    Left = 296
    Top = 234
    Width = 85
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Sair'
    TabOrder = 1
    OnClick = BtOkClick
    Kind = bkOK
  end
end
