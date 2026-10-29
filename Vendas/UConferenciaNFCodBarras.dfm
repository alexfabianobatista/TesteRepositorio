object FConferenciaNFCodBarras: TFConferenciaNFCodBarras
  Left = 277
  Top = 113
  Width = 1044
  Height = 540
  Caption = 'Confer'#234'ncia de Produtos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    1028
    501)
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 491
    Top = 6
    Width = 59
    Height = 26
    Caption = 'Cliente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 10
    Top = 63
    Width = 88
    Height = 33
    Caption = 'Produto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object EdNum_Nota: TEdit
    Left = 491
    Top = 29
    Width = 505
    Height = 32
    TabStop = False
    Anchors = [akLeft, akTop, akRight]
    Color = clBtnFace
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object DBGNota: TDBGrid
    Left = 8
    Top = 144
    Width = 993
    Height = 305
    TabStop = False
    Anchors = [akLeft, akTop, akRight, akBottom]
    Ctl3D = False
    DataSource = DsConferenciaNFCodBarras
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -21
    TitleFont.Name = 'Calibri'
    TitleFont.Style = []
    OnDrawColumnCell = DBGNotaDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_PRODUTO'
        Title.Caption = 'C'#243'd.'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_PRODUTO'
        Title.Caption = 'Produto'
        Width = 620
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QT_QUANTIDADE'
        Title.Caption = 'Qtde.NF'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QT_EMBARCADO'
        Title.Caption = 'Conferido'
        Width = 106
        Visible = True
      end>
  end
  object BtConfirmar: TBitBtn
    Left = 764
    Top = 458
    Width = 108
    Height = 43
    Anchors = [akLeft, akBottom]
    Caption = 'Confirmar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    TabStop = False
    Visible = False
  end
  object BtCancelar: TBitBtn
    Left = 878
    Top = 458
    Width = 108
    Height = 43
    Anchors = [akRight, akBottom]
    Caption = '&Fechar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    TabStop = False
    Kind = bkClose
  end
  object EdProduto: TEdit
    Left = 120
    Top = 93
    Width = 879
    Height = 39
    TabStop = False
    Anchors = [akLeft, akTop, akRight]
    Color = clBtnFace
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -27
    Font.Name = 'Calibri'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
  end
  object MEProduto: TMaskEdit
    Left = 8
    Top = 93
    Width = 105
    Height = 39
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -27
    Font.Name = 'Calibri'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 5
    OnExit = MEProdutoExit
  end
  inline FmNota1: TFmNota
    Tag = 1
    Left = 8
    Top = 12
    Width = 475
    Height = 56
    TabOrder = 6
    inherited Nota: TLabel
      Top = -4
      Width = 42
      Height = 26
      Font.Height = -21
      Font.Name = 'Calibri'
      ParentFont = False
    end
    inherited Label1: TLabel
      Width = 3
      Caption = ''
    end
    inherited MeNota: TMaskEdit
      Top = 18
      Width = 74
      Height = 34
      Font.Height = -21
      Font.Name = 'Calibri'
      ParentFont = False
    end
    inherited BtNota: TBitBtn
      Left = 77
      Top = 18
      Width = 35
      Height = 33
      OnClick = FmNota1BtNotaClick
    end
    inherited EdNota: TEdit
      Left = 116
      Top = 17
      Width = 359
      Height = 32
      Ctl3D = False
      Font.Height = -21
      Font.Name = 'Calibri'
      ParentCtl3D = False
      ParentFont = False
      Text = ''
    end
  end
  object DsConferenciaNFCodBarras: TDataSource
    DataSet = DMNotaSaida.QConferenciaNFCodBarras
    Left = 88
    Top = 464
  end
end
