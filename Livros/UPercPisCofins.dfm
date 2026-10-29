inherited FPercPisCofins: TFPercPisCofins
  Left = 496
  Top = 141
  Caption = 'Percentuais de PIS/COFINS'
  ClientHeight = 353
  ClientWidth = 415
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel [0]
    Left = 24
    Top = 56
    Width = 33
    Height = 14
    Caption = 'C'#243'digo'
    FocusControl = DBEdit1
  end
  object Label3: TLabel [1]
    Left = 72
    Top = 96
    Width = 20
    Height = 14
    Caption = 'Ano'
    FocusControl = DBEdit3
  end
  object Label8: TLabel [2]
    Left = 24
    Top = 96
    Width = 20
    Height = 14
    Caption = 'M'#234's'
    FocusControl = DBEdit8
  end
  object LPIS: TLabel [3]
    Left = 32
    Top = 304
    Width = 70
    Height = 14
    Caption = 'Total do PIS: '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LCOFINS: TLabel [4]
    Left = 224
    Top = 304
    Width = 92
    Height = 14
    Caption = 'Total do COFINS: '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited Panel1: TPanel
    Width = 415
  end
  inherited StBLongHint: TStatusBar
    Top = 334
    Width = 415
  end
  object DBEdit1: TDBEdit [7]
    Left = 24
    Top = 72
    Width = 89
    Height = 22
    TabStop = False
    Color = clBtnFace
    DataField = 'COD_PERC_PIS_COFINS'
    DataSource = DSPrimario
    ReadOnly = True
    TabOrder = 2
  end
  object GbPis: TGroupBox [8]
    Left = 24
    Top = 144
    Width = 177
    Height = 153
    Caption = 'PIS/PASEP'
    TabOrder = 5
    object Label2: TLabel
      Left = 16
      Top = 24
      Width = 68
      Height = 14
      Caption = '% Exporta'#231#227'o'
      FocusControl = DBEdit2
    end
    object Label4: TLabel
      Left = 16
      Top = 64
      Width = 94
      Height = 14
      Caption = '% Interno Tributado'
      FocusControl = DBEdit4
    end
    object Label5: TLabel
      Left = 16
      Top = 104
      Width = 116
      Height = 14
      Caption = '% Interno N'#227'o Tributado'
      FocusControl = DBEdit5
    end
    object DBEdit2: TDBEdit
      Left = 16
      Top = 40
      Width = 144
      Height = 22
      DataField = 'PERC_PIS_EXP'
      DataSource = DSPrimario
      TabOrder = 0
    end
    object DBEdit4: TDBEdit
      Left = 16
      Top = 80
      Width = 144
      Height = 22
      DataField = 'PERC_PIS_TRIB'
      DataSource = DSPrimario
      TabOrder = 1
    end
    object DBEdit5: TDBEdit
      Left = 16
      Top = 120
      Width = 144
      Height = 22
      DataField = 'PERC_PIS_NAO_TRIB'
      DataSource = DSPrimario
      TabOrder = 2
    end
  end
  object GbCofins: TGroupBox [9]
    Left = 216
    Top = 144
    Width = 177
    Height = 153
    Caption = 'COFINS'
    TabOrder = 6
    object Label6: TLabel
      Left = 16
      Top = 104
      Width = 116
      Height = 14
      Caption = '% Interno N'#227'o Tributado'
      FocusControl = DBEdit5
    end
    object Label7: TLabel
      Left = 16
      Top = 64
      Width = 94
      Height = 14
      Caption = '% Interno Tributado'
      FocusControl = DBEdit4
    end
    object Label9: TLabel
      Left = 16
      Top = 24
      Width = 68
      Height = 14
      Caption = '% Exporta'#231#227'o'
      FocusControl = DBEdit2
    end
    object DBEdit6: TDBEdit
      Left = 16
      Top = 40
      Width = 144
      Height = 22
      DataField = 'PERC_COFINS_EXP'
      DataSource = DSPrimario
      TabOrder = 0
    end
    object DBEdit7: TDBEdit
      Left = 16
      Top = 80
      Width = 144
      Height = 22
      DataField = 'PERC_COFINS_TRIB'
      DataSource = DSPrimario
      TabOrder = 1
    end
    object DBEdit9: TDBEdit
      Left = 16
      Top = 120
      Width = 144
      Height = 22
      DataField = 'PERC_COFINS_NAO_TRIB'
      DataSource = DSPrimario
      TabOrder = 2
    end
  end
  object DBEdit3: TDBEdit [10]
    Left = 72
    Top = 112
    Width = 41
    Height = 22
    DataField = 'NUM_ANO'
    DataSource = DSPrimario
    TabOrder = 4
  end
  object DBEdit8: TDBEdit [11]
    Left = 24
    Top = 112
    Width = 41
    Height = 22
    DataField = 'NUM_MES'
    DataSource = DSPrimario
    TabOrder = 3
  end
  inherited MMCadSimples: TMainMenu
    Left = 304
    Top = 48
  end
  inherited DSPrimario: TDataSource
    DataSet = DMLivroFiscal.QPercPisCofins
    OnDataChange = DSPrimarioDataChange
    Left = 352
    Top = 48
  end
  inherited ILBotao: TImageList
    Left = 240
    Top = 48
  end
end
