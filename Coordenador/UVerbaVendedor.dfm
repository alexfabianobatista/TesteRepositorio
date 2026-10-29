inherited FVerbaVendedor: TFVerbaVendedor
  Left = 245
  Top = 171
  Caption = 'Verba Vendedor'
  ClientWidth = 610
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel [0]
    Left = 24
    Top = 56
    Width = 71
    Height = 14
    Caption = 'Representante'
  end
  object Label2: TLabel [1]
    Left = 24
    Top = 96
    Width = 48
    Height = 14
    Caption = 'Vendedor'
    FocusControl = DBEdit2
  end
  object Label3: TLabel [2]
    Left = 392
    Top = 56
    Width = 20
    Height = 14
    Caption = 'Ano'
  end
  object Label4: TLabel [3]
    Left = 432
    Top = 56
    Width = 20
    Height = 14
    Caption = 'M'#234's'
  end
  object Label5: TLabel [4]
    Left = 320
    Top = 96
    Width = 29
    Height = 14
    Caption = 'Valor '
    FocusControl = DBEdit5
  end
  object Label6: TLabel [5]
    Left = 464
    Top = 56
    Width = 116
    Height = 14
    Caption = 'Valor Do Representante'
  end
  inherited Panel1: TPanel
    Width = 610
    inherited SBIncluir: TSpeedButton
      Visible = False
    end
    inherited SBConsulta: TSpeedButton
      Visible = False
    end
    inherited MELocaliza: TMaskEdit
      Visible = False
    end
  end
  inherited StBLongHint: TStatusBar
    Width = 610
  end
  object DBEdit2: TDBEdit [8]
    Left = 24
    Top = 112
    Width = 65
    Height = 22
    TabStop = False
    Color = clBtnFace
    DataField = 'COD_VENDEDOR'
    DataSource = DSPrimario
    ReadOnly = True
    TabOrder = 2
  end
  object DBEdit5: TDBEdit [9]
    Left = 320
    Top = 112
    Width = 137
    Height = 22
    DataField = 'VAL_VERBA'
    DataSource = DSPrimario
    TabOrder = 3
  end
  object DBDirceu1: TDBDirceu [10]
    Left = 90
    Top = 112
    Width = 225
    Height = 22
    DataField = 'COD_VENDEDOR'
    DataSource = DSPrimario
    ParentColor = True
    ReadOnly = True
    TabOrder = 4
    TabStop = False
    diTabela = 'tb_vendedor'
    diCampo = 'nome'
    diChave = 'cod_vendedor'
    diCache = False
  end
  object MeRepresentante: TMaskEdit [11]
    Left = 24
    Top = 72
    Width = 65
    Height = 22
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 5
    OnChange = MeRepresentanteChange
  end
  object MeAno: TMaskEdit [12]
    Left = 377
    Top = 72
    Width = 35
    Height = 22
    EditMask = '####'
    MaxLength = 4
    TabOrder = 6
    Text = '    '
    OnChange = MeAnoChange
    OnExit = MeAnoExit
  end
  object MeMes: TMaskEdit [13]
    Left = 424
    Top = 72
    Width = 29
    Height = 22
    EditMask = '##'
    MaxLength = 2
    TabOrder = 7
    Text = '  '
    OnChange = MeMesChange
    OnExit = MeMesExit
  end
  object DBGrid1: TDBGrid [14]
    Left = 24
    Top = 144
    Width = 433
    Height = 201
    DataSource = DsVerbaVendedor_All
    TabOrder = 8
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_VENDEDOR'
        Title.Caption = 'Vendedor'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome'
        Width = 177
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_VERBA'
        Title.Caption = 'Verba'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_UTILIZADO'
        Title.Caption = 'Val Utilizado'
        Width = 91
        Visible = True
      end>
  end
  object MeNome: TMaskEdit [15]
    Left = 96
    Top = 72
    Width = 273
    Height = 22
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 9
  end
  object MeValorTotal: TMaskEdit [16]
    Left = 464
    Top = 72
    Width = 109
    Height = 22
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 10
  end
  inherited MMCadSimples: TMainMenu
    inherited Manuteno1: TMenuItem
      inherited Incluir1: TMenuItem
        Visible = False
      end
    end
    inherited Relatrios1: TMenuItem
      object RelVerbaVendedor1: TMenuItem
        Caption = 'Rel Verba Vendedor'
        OnClick = RelVerbaVendedor1Click
      end
    end
  end
  inherited DSPrimario: TDataSource
    DataSet = DMVerbaRepresentante.QVerbaVendedor
  end
  object DsVerbaVendedor_All: TDataSource
    DataSet = DMVerbaRepresentante.QVerbaVendedor_All
    Left = 568
    Top = 8
  end
end
