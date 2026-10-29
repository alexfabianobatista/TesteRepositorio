inherited FBorderoCad: TFBorderoCad
  Left = 410
  Top = 198
  Caption = 'Cadastro de Border'#244
  ClientHeight = 348
  ClientWidth = 570
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel [0]
    Left = 8
    Top = 145
    Width = 87
    Height = 14
    Caption = 'Contas a Receber'
  end
  object Label2: TLabel [1]
    Left = 8
    Top = 48
    Width = 33
    Height = 14
    Caption = 'C'#243'digo'
    FocusControl = DBEdit1
  end
  object DBText1: TDBText [2]
    Left = 504
    Top = 41
    Width = 58
    Height = 16
    Alignment = taRightJustify
    DataField = 'IND_SITUACAO'
    DataSource = DSPrimario
  end
  object Label3: TLabel [3]
    Left = 456
    Top = 40
    Width = 45
    Height = 14
    Caption = 'Situa'#231#227'o:'
  end
  inherited Panel1: TPanel
    Width = 570
    inherited lbPesquisaCodigo: TLabel
      Left = 432
    end
    inherited SBConsulta: TSpeedButton
      Left = 539
    end
    inherited pnSeparador2: TPanel
      Left = 423
    end
    inherited MELocaliza: TMaskEdit
      Left = 490
    end
  end
  object btCRCons: TBitBtn [6]
    Left = 400
    Top = 297
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Inserir C.R.'
    TabOrder = 2
    OnClick = btCRConsClick
  end
  object DBGrid1: TDBGrid [7]
    Left = 8
    Top = 161
    Width = 553
    Height = 128
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DMBordero.DSBorderoItem
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 3
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NUM_TITULO'
        Title.Caption = 'N'#186' T'#237'tulo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_PARCELA'
        Title.Caption = 'Parc'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_ORIGINAL'
        Title.Caption = 'Valor Original'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome'
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_BANCO_AGENCIA'
        Title.Caption = 'Conta Corrente'
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_EMISSAO'
        Title.Caption = 'Emiss'#227'o'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_VENCIMENTO'
        Title.Caption = 'Vencimento'
        Width = 80
        Visible = True
      end>
  end
  object DBPanel2: TDBPanel [8]
    Left = 8
    Top = 97
    Width = 329
    Height = 37
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    CodigoTabStop = True
    DataField = 'COD_CONTA_CORRENTE'
    DataSource = DSPrimario
    DefineByForm = DBPanel2DefineByForm
    fkCache = False
    fkCampo = 'desc_conta_corrente'
    fkChave = 'COD_CONTA_CORRENTE'
    fkTabela = 'tb_conta_corrente'
    ForeignKey = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
      55555575555555775F55509999999901055557F55555557F75F5001111111101
      105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
      01105777F555557F75F75500FFFFFF0FF0105577F555FF7F57575550FF700008
      8F0055575FF7777555775555000888888F005555777FFFFFFF77555550000000
      0F055555577777777F7F555550FFFFFF0F05555557F5FFF57F7F555550F000FF
      0005555557F777557775555550FFFFFF0555555557F555FF7F55555550FF7000
      05555555575FF777755555555500055555555555557775555555}
    LCaption = 'Conta Corrente'
    ReadOnly = False
    Required = True
    ValidateOnExit = False
    VisibleComponents = [dbpcCodigo, dbpcBusca, dbpcDescricao]
    WidthCodigo = 20.000000000000000000
  end
  object DBPanel3: TDBPanel [9]
    Left = 344
    Top = 97
    Width = 105
    Height = 37
    Anchors = [akTop, akRight]
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    CodigoTabStop = True
    DataField = 'VAL_JUROS'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'VAL_JUROS'
    ForeignKey = False
    LCaption = 'Valor Juros'
    ReadOnly = False
    Required = False
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object DBPanel4: TDBPanel [10]
    Left = 458
    Top = 97
    Width = 105
    Height = 37
    Anchors = [akTop, akRight]
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    CodigoTabStop = True
    DataField = 'DT_BORDERO'
    DataSource = DSPrimario
    fkCache = False
    fkChave = 'DT_BORDERO'
    ForeignKey = False
    LCaption = 'Data'
    ReadOnly = False
    Required = True
    ValidateOnExit = False
    WidthCodigo = 20.000000000000000000
  end
  object btCRExcluir: TBitBtn [11]
    Left = 488
    Top = 297
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Excluir C.R.'
    TabOrder = 7
    OnClick = btCRExcluirClick
  end
  object DBEdit1: TDBEdit [12]
    Left = 8
    Top = 64
    Width = 57
    Height = 22
    Color = clBtnFace
    DataField = 'COD_BORDERO'
    DataSource = DSPrimario
    Enabled = False
    TabOrder = 8
  end
  object btEstornar: TBitBtn [13]
    Left = 8
    Top = 297
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Debitar C.R.'
    TabOrder = 9
    OnClick = btEstornarClick
  end
  inherited StBLongHint: TStatusBar
    Top = 329
    Width = 570
  end
  inherited MMCadSimples: TMainMenu
    Left = 293
    inherited Relatrios1: TMenuItem
      object Border1: TMenuItem
        Caption = 'Border'#244
        OnClick = Border1Click
      end
    end
    object Opes1: TMenuItem
      Caption = '&Op'#231#245'es'
      object ConfirmarBorder1: TMenuItem
        Caption = '&Confirmar Border'#244
        OnClick = ConfirmarBorder1Click
      end
      object VoltarConfirmao1: TMenuItem
        Caption = '&Voltar Confirma'#231#227'o'
        OnClick = VoltarConfirmao1Click
      end
    end
  end
  inherited DSPrimario: TDataSource
    DataSet = DMBordero.QBorderoCab
  end
  inherited IdHTTP1: TIdHTTP
    Left = 329
  end
end
