inherited FPecaRetornoCons: TFPecaRetornoCons
  Left = 428
  Top = 187
  Width = 488
  Caption = 'Consulta de Pe'#231'as de Retorno'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Width = 24
    Caption = 'Pe'#231'a'
  end
  inherited BtOk: TBitBtn
    Left = 382
    TabOrder = 4
  end
  inherited BtCancela: TBitBtn
    Left = 294
    TabOrder = 5
  end
  inherited BtProcurar: TBitBtn
    Left = 383
    TabOrder = 2
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Width = 105
    Text = ''
  end
  inherited DBGrid1: TDBGrid
    Top = 64
    Width = 456
    Height = 167
    TabOrder = 3
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_PECA_RETORNO'
        Title.Caption = 'C'#243'digo'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_PECA'
        Title.Caption = 'Pe'#231'a'
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_SERIE'
        Title.Caption = 'S'#233'rie'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_RETORNO'
        Title.Caption = 'Data'
        Visible = True
      end>
  end
  inline FmData: TFmDatas [6]
    Left = 128
    Top = 0
    Width = 178
    Height = 60
    TabOrder = 1
    inherited GroupBox1: TGroupBox
      Caption = 'Data'
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
  inherited DSConsulta: TDataSource [7]
    DataSet = DMPecaRetorno.QPecaRetornoCons
    Left = 40
    Top = 240
  end
  inherited PopupMenu1: TPopupMenu
    Left = 8
    Top = 240
  end
end
