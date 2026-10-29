inherited FOficinaCons: TFOficinaCons
  Left = 129
  Top = 98
  Width = 790
  Height = 538
  Caption = 'Consulta de Ordens de Servi'#231'o'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Top = 92
    Width = 37
    Caption = 'N'#250'mero'
  end
  inherited BtOk: TBitBtn
    Left = 613
    Top = 469
    TabOrder = 8
  end
  inherited BtCancela: TBitBtn
    Left = 701
    Top = 469
    TabOrder = 9
  end
  inherited BtProcurar: TBitBtn
    Left = 685
    Top = 112
    TabOrder = 6
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Top = 108
    Width = 65
    TabOrder = 2
    Text = ''
  end
  inherited DBGrid1: TDBGrid
    Top = 144
    Width = 766
    Height = 221
    TabOrder = 7
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_OFICINA_CAB'
        Title.Caption = 'C'#243'digo'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_OFICINA_CAB'
        Title.Caption = 'N'#250'mero'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'desc_situacao'
        Title.Caption = 'Situa'#231#227'o'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_CLIENTE'
        Title.Caption = 'Cliente'
        Width = 227
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_PLACA'
        Title.Caption = 'Ve'#237'culo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_ENTRADA'
        Title.Caption = 'Data Entrada'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_SAIDA'
        Title.Caption = 'Data Sa'#237'da'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_FILIAL'
        Title.Caption = 'Filial'
        Width = 188
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONDICAO_PAGTO'
        Title.Caption = 'Pagamento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_PARCIAL_TOTAL'
        Title.Caption = 'Servi'#231'o'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_SERVICO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 177
        Visible = True
      end
      item
        Expanded = False
        Visible = False
      end>
  end
  object DBGItens: TDBGrid [6]
    Left = 8
    Top = 377
    Width = 585
    Height = 120
    Anchors = [akLeft, akRight, akBottom]
    DataSource = DSItens
    TabOrder = 10
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_OFICINA_CAB'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DESC_PRODUTO'
        Title.Caption = 'Produto'
        Width = 336
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QT_QUANTIDADE'
        Title.Caption = 'Quantidade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_UNITARIO'
        Title.Caption = 'Valor Unit'#225'rio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_TOTAL'
        Title.Caption = 'Total'
        Visible = True
      end>
  end
  inline FmFilial: TFmFilial [7]
    Left = 8
    Top = 8
    Width = 265
    Height = 41
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
    Left = 8
    Top = 48
    Width = 265
    Height = 43
    TabOrder = 1
    inherited Label1: TLabel
      Width = 32
      Height = 14
      Caption = 'Cliente'
    end
    inherited MeCadastro: TMaskEdit
      Height = 22
    end
    inherited EdCadastro: TEdit
      Height = 22
    end
  end
  inline FmDatasE: TFmDatas
    Left = 328
    Top = 8
    Width = 177
    Height = 57
    TabOrder = 3
    inherited GroupBox1: TGroupBox
      Caption = 'Data de Entrada'
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
  inline FmDatasS: TFmDatas
    Left = 328
    Top = 79
    Width = 177
    Height = 57
    TabOrder = 4
    inherited GroupBox1: TGroupBox
      Caption = 'Data de Sa'#237'da'
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
  object RGSituacao: TRadioGroup
    Left = 544
    Top = 8
    Width = 105
    Height = 129
    Caption = 'Situa'#231#227'o'
    ItemIndex = 3
    Items.Strings = (
      'Aberta'
      'Confirmada'
      'Cancelada'
      'Todas')
    TabOrder = 5
  end
  inherited DSConsulta: TDataSource
    DataSet = DMOficina.QOficinaCons
    Left = 48
    Top = 448
  end
  object DSItens: TDataSource
    DataSet = DMOficina.QOficinaItemCons
    Left = 16
    Top = 448
  end
end
