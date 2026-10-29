inherited FCorCad: TFCorCad
  Caption = 'Cadastro de Cores'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited DbGDados: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'CODCOR'
        Title.Alignment = taRightJustify
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DSCCOR'
        Title.Caption = 'Descri'#231#227'o'
        Width = 253
        Visible = True
      end>
  end
  inherited PnDados: TPanel
    Left = 159
    Top = 111
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
        Width = 134
        Height = 21
        Color = clBtnFace
        DataField = 'CODCOR'
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
        DataField = 'DSCCOR'
        DataSource = DS
        TabOrder = 1
      end
    end
  end
  inherited TB: TIBQuery
    SQL.Strings = (
      'select * from TB_COR')
    GeneratorField.Field = 'CODCOR'
    GeneratorField.Generator = 'GEN_COR'
    object TBCODCOR: TIntegerField
      FieldName = 'CODCOR'
      Origin = 'TB_COR.CODCOR'
      Required = True
    end
    object TBDSCCOR: TIBStringField
      DisplayWidth = 80
      FieldName = 'DSCCOR'
      Origin = 'TB_COR.DSCCOR'
      Required = True
      Size = 80
    end
  end
  inherited IBU: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CODCOR,'
      '  DSCCOR'
      'from TB_COR '
      'where'
      '  CODCOR = :CODCOR')
    ModifySQL.Strings = (
      'update TB_COR'
      'set'
      '  CODCOR = :CODCOR,'
      '  DSCCOR = :DSCCOR'
      'where'
      '  CODCOR = :OLD_CODCOR')
    InsertSQL.Strings = (
      'insert into TB_COR'
      '  (CODCOR, DSCCOR)'
      'values'
      '  (:CODCOR, :DSCCOR)')
    DeleteSQL.Strings = (
      'delete from TB_COR'
      'where'
      '  CODCOR = :OLD_CODCOR')
  end
end
