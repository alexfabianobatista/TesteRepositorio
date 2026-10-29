object FProdutos_UltimasVendas: TFProdutos_UltimasVendas
  Left = 381
  Top = 178
  Width = 917
  Height = 441
  Caption = #218'ltimas Vendas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  DesignSize = (
    901
    402)
  PixelsPerInch = 96
  TextHeight = 13
  object LbDiasUltimasVendas: TLabel
    Left = 345
    Top = 4
    Width = 123
    Height = 13
    Hint = 
      'A data de refer'#234'ncia '#233' configurado na tela de par'#226'metros do sist' +
      'ema, aba Vendas'
    Caption = 'LbDiasUltimasVendas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object LBValorTotal: TLabel
    Left = 644
    Top = 358
    Width = 74
    Height = 13
    Anchors = [akRight, akBottom]
    Caption = 'LBValorTotal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 572
    Top = 358
    Width = 67
    Height = 13
    Anchors = [akRight, akBottom]
    Caption = 'Valor Total:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 372
    Top = 358
    Width = 65
    Height = 13
    Anchors = [akRight, akBottom]
    Caption = 'Qtde Total:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object LBQtdeTodal: TLabel
    Left = 444
    Top = 358
    Width = 72
    Height = 13
    Anchors = [akRight, akBottom]
    Caption = 'LBQtdeTotal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object DBGrid1: TDBGrid
    Left = 11
    Top = 21
    Width = 877
    Height = 318
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DSUltVenda
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NUM_NOTA'
        Title.Caption = 'N'#250'mero'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_EMISSAO'
        Title.Caption = 'Dt. Emiss'#227'o'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLIENTE'
        Title.Caption = 'Cliente'
        Width = 294
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QT_QUANTIDADE'
        Title.Caption = 'Quantidade'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_UNITARIO'
        Title.Caption = 'Valor Bruto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_UNITARIO_COM_DESCONTO'
        Title.Caption = 'Valor L'#237'quido'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_OPERACAO'
        Title.Caption = 'Oper'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_VENDEDOR'
        Title.Caption = 'Vendedor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_ORDEM_SERVICO_CAB'
        Title.Caption = 'Cod OS'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_OBS_CORPO_NOTA'
        Title.Caption = 'Obs.'
        Width = 208
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 795
    Top = 338
    Width = 89
    Height = 25
    Anchors = [akRight]
    TabOrder = 1
    Kind = bkOK
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 383
    Width = 901
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object DSUltVenda: TDataSource
    DataSet = DMProduto.QProdutoConsUltVendas
    Left = 16
    Top = 313
  end
  object ActionList1: TActionList
    Left = 40
    Top = 312
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 49222
      OnExecute = Action1Execute
    end
  end
end
