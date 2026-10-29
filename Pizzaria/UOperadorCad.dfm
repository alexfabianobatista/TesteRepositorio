inherited FOperadorCad: TFOperadorCad
  Caption = 'Cadastro de Operadores'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited DbGDados: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_OPERADOR'
        Title.Alignment = taRightJustify
        Title.Caption = 'C'#243'digo'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_NOME'
        Title.Caption = 'Nome'
        Width = 230
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_SENHA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DESC_LOGIN'
        Title.Caption = 'Login'
        Visible = False
      end>
  end
  inherited PnDados: TPanel
    Left = 103
    Top = 87
    Width = 238
    Height = 185
    inherited PnBotoes: TPanel
      Top = 147
      Width = 236
      inherited BtnGravar: TBitBtn
        Left = 22
      end
      inherited BtnCancelar: TBitBtn
        Left = 128
      end
    end
    inherited PnEdits: TPanel
      Width = 236
      Height = 146
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
      object Label4: TLabel
        Left = 16
        Top = 96
        Width = 31
        Height = 13
        Caption = 'Senha'
        FocusControl = DBEdit4
      end
      object DBEdit1: TDBEdit
        Left = 16
        Top = 32
        Width = 89
        Height = 21
        Color = clBtnFace
        DataField = 'COD_OPERADOR'
        DataSource = DS
        ReadOnly = True
        TabOrder = 0
      end
      object DbEFoco: TDBEdit
        Left = 16
        Top = 72
        Width = 205
        Height = 21
        CharCase = ecUpperCase
        DataField = 'DESC_NOME'
        DataSource = DS
        TabOrder = 1
      end
      object DBEdit4: TDBEdit
        Left = 16
        Top = 112
        Width = 205
        Height = 21
        DataField = 'DESC_SENHA'
        DataSource = DS
        PasswordChar = '*'
        TabOrder = 2
      end
    end
  end
  inherited TB: TIBQuery
    BeforeDelete = nil
    SQL.Strings = (
      'select * from TB_OPERADOR')
    GeneratorField.Field = 'COD_OPERADOR'
    GeneratorField.Generator = 'GEN_OPERADOR'
    object TBCOD_OPERADOR: TIntegerField
      FieldName = 'COD_OPERADOR'
      Origin = '"TB_OPERADOR"."COD_OPERADOR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TBDESC_NOME: TIBStringField
      FieldName = 'DESC_NOME'
      Origin = '"TB_OPERADOR"."DESC_NOME"'
      Required = True
      Size = 100
    end
    object TBDESC_SENHA: TIBStringField
      FieldName = 'DESC_SENHA'
      Origin = '"TB_OPERADOR"."DESC_SENHA"'
      Required = True
      Size = 100
    end
  end
  inherited IBT: TIBTransaction
    Active = True
  end
  inherited IBU: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  COD_OPERADOR,'
      '  DESC_NOME,'
      '  DESC_SENHA'
      'from TB_OPERADOR '
      'where'
      '  COD_OPERADOR = :COD_OPERADOR')
    ModifySQL.Strings = (
      'update TB_OPERADOR'
      'set'
      '  COD_OPERADOR = :COD_OPERADOR,'
      '  DESC_NOME = :DESC_NOME,'
      '  DESC_SENHA = :DESC_SENHA'
      'where'
      '  COD_OPERADOR = :OLD_COD_OPERADOR')
    InsertSQL.Strings = (
      'insert into TB_OPERADOR'
      '  (COD_OPERADOR, DESC_NOME, DESC_SENHA)'
      'values'
      '  (:COD_OPERADOR, :DESC_NOME, :DESC_SENHA)')
    DeleteSQL.Strings = (
      'delete from TB_OPERADOR'
      'where'
      '  COD_OPERADOR = :OLD_COD_OPERADOR')
  end
end
