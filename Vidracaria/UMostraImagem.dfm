object FMostraImagem: TFMostraImagem
  Left = 313
  Top = 179
  Width = 697
  Height = 288
  Caption = 'Mostra Imagem'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 16
    Width = 76
    Height = 13
    Caption = 'C'#243'digo de Barra'
  end
  object DBGrid1: TDBGrid
    Left = 40
    Top = 64
    Width = 633
    Height = 185
    DataSource = DMPedido.DSImagemPedido
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DESC_CAMINHO'
        Title.Caption = 'Caminho'
        Width = 599
        Visible = True
      end>
  end
  object EdCodBarra: TEdit
    Left = 40
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 1
    OnChange = EdCodBarraChange
  end
  object BtVizualizar: TBitBtn
    Left = 166
    Top = 30
    Width = 75
    Height = 25
    Caption = 'Vizualizar'
    TabOrder = 2
    OnClick = BtVizualizarClick
  end
end
