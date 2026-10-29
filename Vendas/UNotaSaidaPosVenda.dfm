object FNotaSaidaPosVenda: TFNotaSaidaPosVenda
  Left = 453
  Top = 182
  BorderStyle = bsSingle
  Caption = 'P'#243's-Venda'
  ClientHeight = 213
  ClientWidth = 456
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 23
    Height = 13
    Caption = 'Data'
  end
  object Label2: TLabel
    Left = 16
    Top = 56
    Width = 28
    Height = 13
    Caption = 'Nome'
  end
  object Label3: TLabel
    Left = 16
    Top = 96
    Width = 48
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object Label4: TLabel
    Left = 259
    Top = 56
    Width = 109
    Height = 13
    Caption = 'Nota Pelo Atendimento'
  end
  object BtnOK: TBitBtn
    Left = 352
    Top = 152
    Width = 91
    Height = 33
    TabOrder = 3
    Kind = bkOK
  end
  object BtnCancelar: TBitBtn
    Left = 256
    Top = 152
    Width = 91
    Height = 33
    TabOrder = 4
    Kind = bkCancel
  end
  object DBEdit14: TDBEdit
    Left = 16
    Top = 32
    Width = 81
    Height = 21
    DataField = 'DT_POS_VENDA'
    DataSource = DsPosVenda
    TabOrder = 0
  end
  object DBEdit1: TDBEdit
    Left = 16
    Top = 72
    Width = 225
    Height = 21
    DataField = 'DESC_NOME'
    DataSource = DsPosVenda
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 16
    Top = 112
    Width = 425
    Height = 21
    DataField = 'DESC_POS_VENDA'
    DataSource = DsPosVenda
    TabOrder = 2
  end
  object BtnExcluir: TBitBtn
    Left = 160
    Top = 152
    Width = 91
    Height = 33
    Caption = 'Excluir'
    TabOrder = 5
    OnClick = BtnExcluirClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 194
    Width = 456
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object DBComboBox1: TDBComboBox
    Left = 256
    Top = 72
    Width = 112
    Height = 21
    DataField = 'NUM_NOTA'
    DataSource = DsPosVenda
    ItemHeight = 13
    Items.Strings = (
      '0'
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8'
      '9'
      '10')
    TabOrder = 7
  end
  object DsPosVenda: TDataSource
    DataSet = DMNotaSaida.QPosVenda
    Left = 408
    Top = 8
  end
  object ActionList1: TActionList
    Left = 16
    Top = 144
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 49222
      OnExecute = Action1Execute
    end
  end
end
