inherited FMarcaCad: TFMarcaCad
  Caption = 'Cadastro de Marcas'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited DbGDados: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'CODMARCA'
        Title.Alignment = taRightJustify
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DSCMARCA'
        Title.Caption = 'Descri'#231#227'o'
        Width = 283
        Visible = True
      end>
  end
  inherited PnDados: TPanel
    Left = 151
    Top = 135
    Width = 288
    Height = 130
    inherited PnBotoes: TPanel
      Top = 92
      Width = 286
      inherited BtnGravar: TBitBtn
        Left = 72
      end
      inherited BtnCancelar: TBitBtn
        Left = 178
      end
    end
    inherited PnEdits: TPanel
      Width = 286
      Height = 91
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 8
        Top = 48
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = DBEFoco
      end
      object DBEdit1: TDBEdit
        Left = 8
        Top = 24
        Width = 89
        Height = 21
        Color = clBtnFace
        DataField = 'CODMARCA'
        DataSource = DS
        ReadOnly = True
        TabOrder = 0
      end
      object DBEFoco: TDBEdit
        Left = 8
        Top = 64
        Width = 268
        Height = 21
        CharCase = ecUpperCase
        DataField = 'DSCMARCA'
        DataSource = DS
        TabOrder = 1
      end
    end
  end
  inherited TB: TIBQuery
    SQL.Strings = (
      'select * from TB_MARCA')
    GeneratorField.Field = 'CODMARCA'
    GeneratorField.Generator = 'GEN_MARCA'
    object TBCODMARCA: TIntegerField
      FieldName = 'CODMARCA'
      Origin = 'TB_MARCA.CODMARCA'
      Required = True
    end
    object TBDSCMARCA: TIBStringField
      DisplayWidth = 80
      FieldName = 'DSCMARCA'
      Origin = 'TB_MARCA.DSCMARCA'
      Required = True
      Size = 80
    end
  end
  inherited IBU: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CODMARCA,'
      '  DSCMARCA'
      'from TB_MARCA '
      'where'
      '  CODMARCA = :CODMARCA')
    ModifySQL.Strings = (
      'update TB_MARCA'
      'set'
      '  CODMARCA = :CODMARCA,'
      '  DSCMARCA = :DSCMARCA'
      'where'
      '  CODMARCA = :OLD_CODMARCA')
    InsertSQL.Strings = (
      'insert into TB_MARCA'
      '  (CODMARCA, DSCMARCA)'
      'values'
      '  (:CODMARCA, :DSCMARCA)')
    DeleteSQL.Strings = (
      'delete from TB_MARCA'
      'where'
      '  CODMARCA = :OLD_CODMARCA')
  end
end
