object FBlocoP: TFBlocoP
  Left = 440
  Top = 132
  Width = 664
  Height = 509
  Caption = 'Contribui'#231#227'o Previdenci'#225'ria'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  DesignSize = (
    648
    471)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 16
    Width = 232
    Height = 13
    Caption = 'Escolha a filial para informar os dados do Bloco P'
  end
  object Label2: TLabel
    Left = 32
    Top = 386
    Width = 227
    Height = 13
    Caption = 'C'#243'digo de receita conforme informado em DCTF'
  end
  object CBFilial: TComboBox
    Left = 32
    Top = 32
    Width = 289
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    OnChange = CBFilialChange
    OnDropDown = CBFilialDropDown
  end
  object GroupBox1: TGroupBox
    Left = 32
    Top = 72
    Width = 585
    Height = 57
    Caption = 'Registro 0145'
    TabOrder = 1
    object DBPanel1: TDBPanel
      Left = 8
      Top = 16
      Width = 281
      Height = 37
      BevelOuter = bvNone
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      CodigoTabStop = True
      DataField = 'VL_REC_TOT'
      DataSource = DmPisCofins0.DS145
      fkCache = False
      fkChave = 'VL_REC_TOT'
      ForeignKey = False
      LCaption = 'Valor da receita bruta total'
      ReadOnly = False
      Required = False
      ValidateOnExit = False
      WidthCodigo = 20.000000000000000000
    end
    object DBPanel2: TDBPanel
      Left = 296
      Top = 16
      Width = 281
      Height = 37
      BevelOuter = bvNone
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      CodigoTabStop = True
      DataField = 'VL_REC_ATIV'
      DataSource = DmPisCofins0.DS145
      fkCache = False
      fkChave = 'VL_REC_ATIV'
      ForeignKey = False
      LCaption = 'Valor da receita das atividades sujeitas a contribui'#231#227'o'
      ReadOnly = False
      Required = False
      ValidateOnExit = False
      WidthCodigo = 20.000000000000000000
    end
  end
  object BtOk: TBitBtn
    Left = 472
    Top = 441
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    TabOrder = 3
    OnClick = BtOkClick
    Kind = bkOK
  end
  object BtCancela: TBitBtn
    Left = 560
    Top = 441
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    TabOrder = 4
    Kind = bkCancel
  end
  object GroupBox2: TGroupBox
    Left = 32
    Top = 144
    Width = 585
    Height = 233
    Caption = 'Registro P100'
    TabOrder = 2
    object DBPanel3: TDBPanel
      Left = 8
      Top = 16
      Width = 281
      Height = 37
      BevelOuter = bvNone
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      CodigoTabStop = True
      DataField = 'VL_REC_TOT_EST'
      DataSource = DmPisCofinsP.DS100
      fkCache = False
      fkChave = 'VL_REC_TOT_EST'
      ForeignKey = False
      LCaption = 'Valor da receita bruta '
      ReadOnly = False
      Required = False
      ValidateOnExit = False
      WidthCodigo = 20.000000000000000000
    end
    object DBPanel4: TDBPanel
      Left = 296
      Top = 16
      Width = 281
      Height = 37
      BevelOuter = bvNone
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      CodigoTabStop = True
      DataField = 'COD_ATIV_ECON'
      DataSource = DmPisCofinsP.DS100
      DefineByForm = DBPanel4DefineByForm
      fkCache = False
      fkCampo = 'DESC_ATIVIDADE_CONTRIB'
      fkChave = 'COD_ATIVIDADE_CONTRIB'
      fkTabela = 'TB_ATIVIDADE_CONTRIB'
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
      LCaption = 'C'#243'digo da atividade sujeita a contribui'#231#227'o'
      ReadOnly = False
      Required = False
      ValidateOnExit = False
      VisibleComponents = [dbpcCodigo, dbpcBusca, dbpcDescricao]
      WidthCodigo = 25.000000000000000000
    end
    object DBPanel5: TDBPanel
      Left = 8
      Top = 56
      Width = 225
      Height = 37
      BevelOuter = bvNone
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      CodigoTabStop = True
      DataField = 'VL_REC_ATIV_ESTAB'
      DataSource = DmPisCofinsP.DS100
      fkCache = False
      fkChave = 'VL_REC_ATIV_ESTAB'
      ForeignKey = False
      LCaption = 'Valor da receita sujeita a contribui'#231#227'o'
      ReadOnly = False
      Required = False
      ValidateOnExit = False
      WidthCodigo = 20.000000000000000000
    end
    object DBPanel6: TDBPanel
      Left = 240
      Top = 56
      Width = 49
      Height = 37
      BevelOuter = bvNone
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      CodigoTabStop = True
      DataField = 'ALIQ_CONT'
      DataSource = DmPisCofinsP.DS100
      fkCache = False
      fkChave = 'ALIQ_CONT'
      ForeignKey = False
      LCaption = 'Al'#237'quota'
      ReadOnly = False
      Required = False
      ValidateOnExit = False
      WidthCodigo = 20.000000000000000000
    end
    object DBPanel7: TDBPanel
      Left = 296
      Top = 56
      Width = 281
      Height = 37
      BevelOuter = bvNone
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      CodigoTabStop = False
      DataField = 'vl_cont_apu'
      DataSource = DmPisCofinsP.DS100
      fkCache = False
      fkChave = 'vl_cont_apu'
      ForeignKey = False
      LCaption = 'Valor da contribui'#231#227'o previdenci'#225'ria'
      ReadOnly = True
      Required = False
      ValidateOnExit = False
      WidthCodigo = 20.000000000000000000
    end
    object DBNavigator1: TDBNavigator
      Left = 472
      Top = 96
      Width = 104
      Height = 25
      DataSource = DmPisCofinsP.DS100
      VisibleButtons = [nbInsert, nbDelete]
      TabOrder = 0
      TabStop = True
      BeforeAction = DBNavigator1BeforeAction
      OnClick = DBNavigator1Click
    end
    object DBGrid1: TDBGrid
      Left = 8
      Top = 128
      Width = 568
      Height = 97
      DataSource = DmPisCofinsP.DS100
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 6
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_FILIAL'
          Title.Caption = 'Filial'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_INI'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DT_FIN'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'VL_REC_TOT_EST'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'COD_ATIV_ECON'
          Title.Caption = 'Atividade Econ'#244'mica'
          Width = 155
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_REC_ATIV_ESTAB'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'vl_bc_cont'
          Title.Caption = 'Base de c'#225'lculo'
          Width = 127
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ALIQ_CONT'
          Title.Caption = 'Al'#237'quota'
          Width = 52
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'vl_cont_apu'
          Title.Caption = 'Valor Apurado'
          Width = 110
          Visible = True
        end>
    end
  end
  object cbRec: TComboBox
    Left = 32
    Top = 400
    Width = 281
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 5
    OnChange = cbRecChange
    Items.Strings = (
      
        '298501 - Contribui'#231#227'o Previdenci'#225'ria Sobre Recita Bruta - Servi'#231 +
        'os'
      
        '299101 - Contribui'#231#227'o Previdenci'#225'ria Sobre Receita Bruta - Ind'#250's' +
        'tria')
  end
  object btLimpar: TButton
    Left = 327
    Top = 29
    Width = 75
    Height = 25
    Caption = 'Limpar Tela'
    TabOrder = 6
    OnClick = btLimparClick
  end
end
