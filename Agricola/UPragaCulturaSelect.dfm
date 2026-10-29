object FPragaCulturaSelect: TFPragaCulturaSelect
  Left = 240
  Top = 225
  Width = 562
  Height = 340
  Caption = 'Praga'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    546
    301)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 87
    Height = 13
    Caption = 'Selecione a Praga'
  end
  object BtCancela: TBitBtn
    Left = 450
    Top = 267
    Width = 85
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cancelar'
    TabOrder = 0
    Kind = bkCancel
  end
  object BtOk: TBitBtn
    Left = 354
    Top = 267
    Width = 85
    Height = 25
    Anchors = [akRight, akBottom]
    TabOrder = 1
    Kind = bkOK
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 32
    Width = 530
    Height = 225
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DMPraga.DSPragaProdutoCons
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_PRAGA'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_PRAGA'
        Title.Caption = 'Praga'
        Width = 439
        Visible = True
      end>
  end
end
