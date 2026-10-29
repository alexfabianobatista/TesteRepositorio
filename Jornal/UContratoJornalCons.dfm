inherited FContratoJornalCons: TFContratoJornalCons
  Left = 288
  Top = 128
  Width = 671
  Height = 552
  Caption = 'Consulta de contratos'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Left = 472
    Top = 64
    Width = 90
    Caption = 'Contendo a edi'#231#227'o'
  end
  inherited BtOk: TBitBtn
    Left = 477
    Top = 498
    TabOrder = 9
  end
  inherited BtCancela: TBitBtn
    Left = 565
    Top = 498
    TabOrder = 10
  end
  inherited BtProcurar: TBitBtn
    Left = 574
    TabOrder = 6
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Left = 472
    Top = 80
    Width = 89
    TabOrder = 5
    Text = ''
    OnKeyPress = METextoKeyPress
  end
  inherited DBGrid1: TDBGrid
    Top = 128
    Width = 649
    Height = 176
    TabOrder = 7
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_CONTRATO_JORNAL'
        Title.Caption = 'C'#243'digo'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CADASTRO'
        Title.Caption = 'Cliente'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_CONTRATO'
        Title.Caption = 'Data do Contrato'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_CONTRATO'
        Title.Caption = 'Valor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VENDEDOR'
        Title.Caption = 'Vendedor'
        Width = 143
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'desc_situacao'
        Title.Caption = 'Situa'#231#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FILIAL'
        Title.Caption = 'Filial'
        Width = 137
        Visible = True
      end>
  end
  object DBGItens: TDBGrid [6]
    Left = 8
    Top = 319
    Width = 649
    Height = 167
    Anchors = [akLeft, akRight, akBottom]
    DataSource = DSItens
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 8
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NUM_EDICAO'
        Title.Caption = 'Edi'#231#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_EDICAO'
        Title.Caption = 'Data da edi'#231#227'o'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_TIPO'
        Title.Caption = 'Tipo'
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_OBSERVACAO'
        Title.Caption = 'Observa'#231#227'o'
        Width = 308
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTA_RECEBER'
        Title.Caption = 'Conta a receber'
        Visible = True
      end>
  end
  inline FmFilial: TFmFilial [7]
    Left = 8
    Top = 8
    Width = 265
    Height = 37
    TabOrder = 0
    inherited Label1: TLabel
      Height = 14
    end
    inherited MeFilial: TMaskEdit
      Height = 22
    end
    inherited EdFilial: TEdit
      Height = 22
    end
  end
  inline FmCadastro: TFmCadastro [8]
    Left = 6
    Top = 48
    Width = 265
    Height = 37
    TabOrder = 1
    inherited Label1: TLabel
      Width = 44
      Height = 14
    end
    inherited MeCadastro: TMaskEdit
      Height = 22
    end
    inherited EdCadastro: TEdit
      Height = 22
    end
  end
  inline FmDatas: TFmDatas
    Left = 288
    Top = 64
    Width = 178
    Height = 57
    TabOrder = 4
    inherited GroupBox1: TGroupBox
      Caption = 'Contratos no per'#237'odo'
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
  inline FmVendedor: TFmVendedor
    Left = 6
    Top = 88
    Width = 265
    Height = 37
    TabOrder = 2
    inherited Label1: TLabel
      Width = 48
      Height = 14
    end
    inherited MeVendedor: TMaskEdit
      Height = 22
    end
    inherited EdVendedor: TEdit
      Height = 22
    end
  end
  object RGSituacao: TRadioGroup
    Left = 288
    Top = 8
    Width = 273
    Height = 49
    Caption = 'Situa'#231#227'o'
    Columns = 2
    ItemIndex = 3
    Items.Strings = (
      'Aberto'
      'Fechado'
      'Cancelado'
      'Todos')
    TabOrder = 3
  end
  inherited DSConsulta: TDataSource
    DataSet = DMContratoJornal.QContratoJornalCons
  end
  object DSItens: TDataSource
    DataSet = DMContratoJornal.QContratoJornalItemCons
    Left = 248
    Top = 8
  end
end
