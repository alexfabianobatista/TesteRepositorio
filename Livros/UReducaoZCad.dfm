object FReducaoZCad: TFReducaoZCad
  Left = 458
  Top = 165
  Width = 401
  Height = 380
  Caption = 'Cadastro automatizado de redu'#231#227'o Z'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    385
    342)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 51
    Height = 13
    Caption = 'Impressora'
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 128
    Width = 353
    Height = 161
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DMLivroFiscal.DSReducaoZCons
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NUM_SERIE'
        Title.Caption = 'N'#250'mero de s'#233'rie'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_SEQ_IMPRESSORA'
        Title.Caption = 'Nr. Caixa'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_REDUCAO'
        Title.Caption = 'Data da redu'#231#227'o Z'
        Visible = True
      end>
  end
  object DBLCImpressora: TDBLookupComboBox
    Left = 16
    Top = 32
    Width = 273
    Height = 21
    KeyField = 'NUM_SERIE'
    ListField = 'NUM_SERIE'
    ListSource = DMImpressoraFiscal.DSECFCons
    TabOrder = 1
    OnCloseUp = DBLCImpressoraCloseUp
  end
  inline FmDatas1: TFmDatas
    Left = 16
    Top = 59
    Width = 178
    Height = 60
    TabOrder = 2
  end
  object BtOk: TBitBtn
    Left = 188
    Top = 305
    Width = 85
    Height = 25
    Anchors = [akRight, akBottom]
    TabOrder = 3
    Kind = bkOK
  end
  object BtCancela: TBitBtn
    Left = 284
    Top = 305
    Width = 85
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cancelar'
    TabOrder = 4
    Kind = bkCancel
  end
  object BtListar: TBitBtn
    Left = 296
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Listar'
    TabOrder = 5
    OnClick = BtListarClick
  end
end
