inherited FBorderoCons: TFBorderoCons
  Left = 393
  Top = 238
  Width = 515
  Height = 321
  Caption = 'FBorderoCons'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Left = 152
    Top = 256
    Width = 22
    Caption = 'Data'
    Visible = False
  end
  inherited BtOk: TBitBtn
    Left = 409
    Top = 252
  end
  inherited BtCancela: TBitBtn
    Left = 321
    Top = 252
  end
  inherited BtProcurar: TBitBtn
    Left = 410
    Top = 21
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Left = 184
    Top = 256
    Width = 97
    Text = ''
    Visible = False
  end
  inherited DBGrid1: TDBGrid
    Top = 120
    Width = 483
    Height = 121
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_BORDERO'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_JUROS'
        Title.Caption = 'Juros'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_BORDERO'
        Title.Caption = 'Data'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_CONTA_CORRENTE'
        Title.Caption = 'Conta Corrente'
        Visible = True
      end>
  end
  inline FmContaCorrente1: TFmContaCorrente [6]
    Left = 6
    Top = 10
    Width = 299
    Height = 37
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 5
    inherited Label1: TLabel
      Width = 73
      Height = 14
    end
    inherited MeContaCorrente: TMaskEdit
      Height = 22
    end
    inherited EdContaCorrente: TEdit
      Width = 222
      Height = 22
    end
  end
  inline FmDatas1: TFmDatas [7]
    Left = 6
    Top = 52
    Width = 178
    Height = 60
    TabOrder = 6
    inherited GroupBox1: TGroupBox
      inherited Label1: TLabel
        Width = 26
        Height = 14
      end
      inherited Label2: TLabel
        Height = 14
      end
      inherited MeDtInicial: TMaskEdit
        Height = 22
      end
      inherited MeDtFinal: TMaskEdit
        Height = 22
      end
    end
  end
  inherited DSConsulta: TDataSource
    DataSet = DMBordero.QBorderoCons
    Left = 40
    Top = 248
  end
  inherited PopupMenu1: TPopupMenu
    Left = 8
    Top = 248
  end
end
