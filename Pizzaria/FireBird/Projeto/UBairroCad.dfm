inherited FBairroCad: TFBairroCad
  Caption = 'Cadastro de Bairros'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited DbGDados: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'CODBAIRRO'
        Title.Alignment = taRightJustify
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DSCBAIRRO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 292
        Visible = True
      end>
  end
  inherited PnDados: TPanel
    Left = 127
    Top = 119
    Width = 347
    Height = 131
    inherited PnBotoes: TPanel
      Top = 93
      Width = 345
      inherited BtnGravar: TBitBtn
        Left = 131
      end
      inherited BtnCancelar: TBitBtn
        Left = 237
      end
    end
    inherited PnEdits: TPanel
      Width = 345
      Height = 92
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
        DataField = 'CODBAIRRO'
        DataSource = DS
        ReadOnly = True
        TabOrder = 0
      end
      object DBEFoco: TDBEdit
        Left = 8
        Top = 64
        Width = 329
        Height = 21
        CharCase = ecUpperCase
        DataField = 'DSCBAIRRO'
        DataSource = DS
        TabOrder = 1
      end
    end
  end
  inherited TB: TIBQuery
    SQL.Strings = (
      'Select * From Tb_Bairro')
    GeneratorField.Field = 'CODBAIRRO'
    GeneratorField.Generator = 'GEN_BAIRRO'
    object TBCODBAIRRO: TIntegerField
      FieldName = 'CODBAIRRO'
      Origin = 'TB_BAIRRO.CODBAIRRO'
      Required = True
    end
    object TBDSCBAIRRO: TIBStringField
      DisplayWidth = 80
      FieldName = 'DSCBAIRRO'
      Origin = 'TB_BAIRRO.DSCBAIRRO'
      Required = True
      Size = 80
    end
  end
  inherited IBU: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CODBAIRRO,'
      '  DSCBAIRRO'
      'from Tb_Bairro '
      'where'
      '  CODBAIRRO = :CODBAIRRO')
    ModifySQL.Strings = (
      'update Tb_Bairro'
      'set'
      '  CODBAIRRO = :CODBAIRRO,'
      '  DSCBAIRRO = :DSCBAIRRO'
      'where'
      '  CODBAIRRO = :OLD_CODBAIRRO')
    InsertSQL.Strings = (
      'insert into Tb_Bairro'
      '  (CODBAIRRO, DSCBAIRRO)'
      'values'
      '  (:CODBAIRRO, :DSCBAIRRO)')
    DeleteSQL.Strings = (
      'delete from Tb_Bairro'
      'where'
      '  CODBAIRRO = :OLD_CODBAIRRO')
  end
end
