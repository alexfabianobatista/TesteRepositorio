inherited FRequisicaoTransfusaoCad: TFRequisicaoTransfusaoCad
  Left = 218
  Top = 153
  Caption = 'Cadastro de Requisi'#231#227'o de Transfus'#227'o'
  ClientHeight = 403
  ClientWidth = 660
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel [0]
    Left = 16
    Top = 56
    Width = 78
    Height = 14
    Caption = 'C'#243'd. Requisi'#231#227'o'
  end
  object Label2: TLabel [1]
    Left = 341
    Top = 155
    Width = 32
    Height = 14
    Caption = 'Iniciais'
  end
  object Label3: TLabel [2]
    Left = 115
    Top = 56
    Width = 41
    Height = 14
    Caption = 'Paciente'
  end
  object Label5: TLabel [3]
    Left = 17
    Top = 155
    Width = 36
    Height = 14
    Caption = 'Hemoc.'
  end
  object Label6: TLabel [4]
    Left = 112
    Top = 155
    Width = 78
    Height = 14
    Caption = 'Num. Bolsa SUS'
  end
  object Label7: TLabel [5]
    Left = 236
    Top = 155
    Width = 61
    Height = 14
    Caption = 'Num.Doa'#231#227'o'
  end
  object Label8: TLabel [6]
    Left = 447
    Top = 155
    Width = 34
    Height = 14
    Caption = 'Origem'
  end
  object Label9: TLabel [7]
    Left = 547
    Top = 155
    Width = 55
    Height = 14
    Caption = 'Data Coleta'
  end
  object SpeedButton1: TSpeedButton [8]
    Left = 183
    Top = 72
    Width = 23
    Height = 22
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
    NumGlyphs = 2
    OnClick = SpeedButton1Click
  end
  inherited Panel1: TPanel
    Width = 660
    TabOrder = 9
  end
  inherited StBLongHint: TStatusBar
    Top = 384
    Width = 660
  end
  object DBEdit1: TDBEdit [11]
    Left = 16
    Top = 72
    Width = 81
    Height = 22
    TabStop = False
    Color = clBtnFace
    DataField = 'COD_REQUISICAO_TRANSFUSAO'
    DataSource = DSPrimario
    ReadOnly = True
    TabOrder = 0
  end
  object DBEdit2: TDBEdit [12]
    Left = 115
    Top = 72
    Width = 65
    Height = 22
    DataField = 'COD_CADASTRO'
    DataSource = DSPrimario
    TabOrder = 1
  end
  object DBEdit3: TDBEdit [13]
    Left = 17
    Top = 171
    Width = 79
    Height = 22
    DataField = 'DESC_HEMOCOMPONENTE'
    DataSource = DMRequisicaoTransfusao.DSRequisicaoTransfusaoItem
    TabOrder = 3
  end
  object DBEdit4: TDBEdit [14]
    Left = 112
    Top = 171
    Width = 105
    Height = 22
    DataField = 'NUM_BOLSA_SUS'
    DataSource = DMRequisicaoTransfusao.DSRequisicaoTransfusaoItem
    TabOrder = 4
  end
  object DBEdit5: TDBEdit [15]
    Left = 235
    Top = 171
    Width = 86
    Height = 22
    DataField = 'NUM_DOACAO'
    DataSource = DMRequisicaoTransfusao.DSRequisicaoTransfusaoItem
    TabOrder = 5
  end
  object DBEdit6: TDBEdit [16]
    Left = 339
    Top = 171
    Width = 91
    Height = 22
    DataField = 'DESC_INICIAIS'
    DataSource = DMRequisicaoTransfusao.DSRequisicaoTransfusaoItem
    TabOrder = 6
  end
  object DBEdit7: TDBEdit [17]
    Left = 446
    Top = 171
    Width = 84
    Height = 22
    DataField = 'DESC_ORIGEM'
    DataSource = DMRequisicaoTransfusao.DSRequisicaoTransfusaoItem
    TabOrder = 7
  end
  object DBEdit8: TDBEdit [18]
    Left = 546
    Top = 171
    Width = 93
    Height = 22
    DataField = 'DT_COLETA'
    DataSource = DMRequisicaoTransfusao.DSRequisicaoTransfusaoItem
    TabOrder = 8
  end
  object DBDirceu1: TDBDirceu [19]
    Left = 208
    Top = 72
    Width = 333
    Height = 22
    DataField = 'COD_CADASTRO'
    DataSource = DSPrimario
    ParentColor = True
    ReadOnly = True
    TabOrder = 11
    TabStop = False
    diTabela = 'tb_cadastro'
    diCampo = 'nome'
    diChave = 'cod_cadastro'
    diCache = False
  end
  object DBRadioGroup1: TDBRadioGroup [20]
    Left = 543
    Top = 57
    Width = 95
    Height = 58
    Caption = 'Tipo Requisi'#231#227'o'
    DataField = 'IND_TIPO_REQUISICAO'
    DataSource = DSPrimario
    Items.Strings = (
      'Emerg'#234'ncia'
      'Urg'#234'ncia'
      'Rotina')
    TabOrder = 2
    Values.Strings = (
      'EMERGENCIA'
      'URGENCIA'
      'ROTINA')
  end
  object DBRadioGroup2: TDBRadioGroup [21]
    Left = 16
    Top = 196
    Width = 94
    Height = 54
    Caption = 'T.A.'
    DataField = 'DESC_TA'
    DataSource = DMRequisicaoTransfusao.DSRequisicaoTransfusaoItem
    Items.Strings = (
      'Compat'#237'vel'
      'Incompat'#237'vel')
    TabOrder = 12
    Values.Strings = (
      'COMPATIVEL'
      'INCOMPATIVEL')
  end
  object DBRadioGroup3: TDBRadioGroup [22]
    Left = 109
    Top = 196
    Width = 94
    Height = 54
    Caption = 'COOMBS'
    DataField = 'DESC_COOMBS'
    DataSource = DMRequisicaoTransfusao.DSRequisicaoTransfusaoItem
    Items.Strings = (
      'Compat'#237'vel'
      'Incompat'#237'vel')
    TabOrder = 13
    Values.Strings = (
      'COMPATIVEL'
      'INCOMPATIVEL')
  end
  object DBRadioGroup4: TDBRadioGroup [23]
    Left = 202
    Top = 196
    Width = 92
    Height = 54
    Caption = 'RESULTADO'
    DataField = 'DESC_RESULTADO'
    DataSource = DMRequisicaoTransfusao.DSRequisicaoTransfusaoItem
    Items.Strings = (
      'Compat'#237'vel'
      'Incompat'#237'vel')
    TabOrder = 14
    Values.Strings = (
      'COMPATIVEL'
      'INCOMPATIVEL')
  end
  object DBRadioGroup5: TDBRadioGroup [24]
    Left = 310
    Top = 196
    Width = 87
    Height = 54
    Caption = 'Teste Hem'#243'lise'
    DataField = 'DESC_HEMOLISE'
    DataSource = DMRequisicaoTransfusao.DSRequisicaoTransfusaoItem
    Items.Strings = (
      'Positivo'
      'Negativo')
    TabOrder = 15
    Values.Strings = (
      'POSITIVO'
      'NEGATIVO')
  end
  object DBRadioGroup6: TDBRadioGroup [25]
    Left = 413
    Top = 196
    Width = 98
    Height = 53
    Caption = 'ABO'
    Columns = 2
    DataField = 'DESC_ABO'
    DataSource = DMRequisicaoTransfusao.DSRequisicaoTransfusaoItem
    Items.Strings = (
      'A'
      'B'
      'AB'
      'O')
    TabOrder = 16
    Values.Strings = (
      'A'
      'B'
      'AB'
      'O')
  end
  object DBRadioGroup7: TDBRadioGroup [26]
    Left = 510
    Top = 196
    Width = 44
    Height = 53
    Caption = 'Rh'
    DataField = 'DESC_RH'
    DataSource = DMRequisicaoTransfusao.DSRequisicaoTransfusaoItem
    Items.Strings = (
      '+'
      '-')
    TabOrder = 17
    Values.Strings = (
      '+'
      '-')
  end
  object DBRadioGroup8: TDBRadioGroup [27]
    Left = 553
    Top = 196
    Width = 87
    Height = 53
    Caption = 'Pai'
    DataField = 'DESC_PAI'
    DataSource = DMRequisicaoTransfusao.DSRequisicaoTransfusaoItem
    Items.Strings = (
      'Positivo'
      'Negativo')
    TabOrder = 18
    Values.Strings = (
      'POSITIVO'
      'NEGATIVO')
  end
  object DBNavigator1: TDBNavigator [28]
    Left = 16
    Top = 129
    Width = 510
    Height = 25
    DataSource = DMRequisicaoTransfusao.DSRequisicaoTransfusaoItem
    VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
    TabOrder = 19
  end
  object DBGrid1: TDBGrid [29]
    Left = 16
    Top = 256
    Width = 625
    Height = 120
    DataSource = DMRequisicaoTransfusao.DSRequisicaoTransfusaoItem
    TabOrder = 20
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DESC_HEMOCOMPONENTE'
        Title.Caption = 'Hemoc'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_BOLSA_SUS'
        Title.Caption = 'Num.Bolsa SUS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_DOACAO'
        Title.Caption = 'Num.Doa'#231#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_INICIAIS'
        Title.Caption = 'Iniciais'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_TA'
        Title.Caption = 'T.A.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_COOMBS'
        Title.Caption = 'Coombs'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_RESULTADO'
        Title.Caption = 'Res.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_HEMOLISE'
        Title.Caption = 'Hem'#243'lise'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_ORIGEM'
        Title.Caption = 'Origem'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_COLETA'
        Title.Caption = 'Data Coleta'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_ABO'
        Title.Caption = 'ABO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_RH'
        Title.Caption = 'Rh'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_PAI'
        Title.Caption = 'Pai'
        Visible = True
      end>
  end
  inherited MMCadSimples: TMainMenu
    inherited Relatrios1: TMenuItem
      object Relao1: TMenuItem
        Caption = 'Rela'#231#227'o'
        OnClick = Relao1Click
      end
    end
  end
  inherited DSPrimario: TDataSource
    DataSet = DMRequisicaoTransfusao.QRequisicaoTransfusao
  end
end
