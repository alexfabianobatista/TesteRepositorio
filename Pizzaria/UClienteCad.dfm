inherited FClienteCad: TFClienteCad
  Caption = 'Cadastro de Clientes'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited DbGDados: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_CLIENTE'
        Title.Alignment = taRightJustify
        Title.Caption = 'C'#243'digo'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_NOME'
        Title.Caption = 'Nome'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_TELEFONE'
        Title.Caption = 'Telefone'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_ENDERECO'
        Title.Caption = 'Endere'#231'o'
        Width = 184
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_LOCALIZACAO'
        Title.Caption = 'Localiza'#231#227'o'
        Width = 254
        Visible = True
      end>
  end
  inherited PnDados: TPanel
    Left = 95
    Top = 79
    Width = 404
    Height = 268
    inherited PnBotoes: TPanel
      Top = 230
      Width = 402
      inherited BtnGravar: TBitBtn
        Left = 188
      end
      inherited BtnCancelar: TBitBtn
        Left = 294
      end
    end
    inherited PnEdits: TPanel
      Width = 402
      Height = 229
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 16
        Top = 56
        Width = 28
        Height = 13
        Caption = 'Nome'
        FocusControl = DbEFoco
      end
      object Label3: TLabel
        Left = 16
        Top = 96
        Width = 42
        Height = 13
        Caption = 'Telefone'
        FocusControl = DBEdit3
      end
      object Label4: TLabel
        Left = 16
        Top = 136
        Width = 46
        Height = 13
        Caption = 'Endere'#231'o'
        FocusControl = DBEdit4
      end
      object Label5: TLabel
        Left = 16
        Top = 176
        Width = 57
        Height = 13
        Caption = 'Localiza'#231#227'o'
        FocusControl = DBEdit5
      end
      object DBEdit1: TDBEdit
        Left = 16
        Top = 32
        Width = 81
        Height = 21
        Color = clBtnFace
        DataField = 'COD_CLIENTE'
        DataSource = DS
        ParentShowHint = False
        ReadOnly = True
        ShowHint = False
        TabOrder = 0
      end
      object DbEFoco: TDBEdit
        Left = 16
        Top = 72
        Width = 369
        Height = 21
        CharCase = ecUpperCase
        DataField = 'DESC_NOME'
        DataSource = DS
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 16
        Top = 112
        Width = 153
        Height = 21
        DataField = 'DESC_TELEFONE'
        DataSource = DS
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 16
        Top = 152
        Width = 369
        Height = 21
        DataField = 'DESC_ENDERECO'
        DataSource = DS
        TabOrder = 3
      end
      object DBEdit5: TDBEdit
        Left = 16
        Top = 192
        Width = 369
        Height = 21
        DataField = 'DESC_LOCALIZACAO'
        DataSource = DS
        TabOrder = 4
      end
    end
  end
  inherited TB: TIBQuery
    SQL.Strings = (
      'select * from TB_CLIENTE')
    GeneratorField.Field = 'COD_CLIENTE'
    GeneratorField.Generator = 'GEN_CLIENTE'
    object TBCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Origin = 'TB_CLIENTE.COD_CLIENTE'
    end
    object TBDESC_NOME: TIBStringField
      FieldName = 'DESC_NOME'
      Origin = 'TB_CLIENTE.DESC_NOME'
      Required = True
      Size = 100
    end
    object TBDESC_TELEFONE: TIBStringField
      FieldName = 'DESC_TELEFONE'
      Origin = 'TB_CLIENTE.DESC_TELEFONE'
      Required = True
    end
    object TBDESC_ENDERECO: TIBStringField
      FieldName = 'DESC_ENDERECO'
      Origin = 'TB_CLIENTE.DESC_ENDERECO'
      Size = 100
    end
    object TBDESC_LOCALIZACAO: TIBStringField
      FieldName = 'DESC_LOCALIZACAO'
      Origin = 'TB_CLIENTE.DESC_LOCALIZACAO'
      Size = 200
    end
  end
  inherited IBU: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  COD_CLIENTE,'
      '  DESC_NOME,'
      '  DESC_TELEFONE,'
      '  DESC_ENDERECO,'
      '  DESC_LOCALIZACAO'
      'from TB_CLIENTE '
      'where'
      '  COD_CLIENTE = :COD_CLIENTE')
    ModifySQL.Strings = (
      'update TB_CLIENTE'
      'set'
      '  COD_CLIENTE = :COD_CLIENTE,'
      '  DESC_NOME = :DESC_NOME,'
      '  DESC_TELEFONE = :DESC_TELEFONE,'
      '  DESC_ENDERECO = :DESC_ENDERECO,'
      '  DESC_LOCALIZACAO = :DESC_LOCALIZACAO'
      'where'
      '  COD_CLIENTE = :OLD_COD_CLIENTE')
    InsertSQL.Strings = (
      'insert into TB_CLIENTE'
      
        '  (COD_CLIENTE, DESC_NOME, DESC_TELEFONE, DESC_ENDERECO, DESC_LO' +
        'CALIZACAO)'
      'values'
      
        '  (:COD_CLIENTE, :DESC_NOME, :DESC_TELEFONE, :DESC_ENDERECO, :DE' +
        'SC_LOCALIZACAO)')
    DeleteSQL.Strings = (
      'delete from TB_CLIENTE'
      'where'
      '  COD_CLIENTE = :OLD_COD_CLIENTE')
  end
end
