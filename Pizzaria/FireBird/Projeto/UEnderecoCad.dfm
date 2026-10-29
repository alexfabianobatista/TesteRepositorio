inherited FEnderecoCad: TFEnderecoCad
  Caption = 'Cadastro de Endere'#231'os'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited DbGDados: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'CODENDERECO'
        Title.Alignment = taRightJustify
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DSCENDERECO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 304
        Visible = True
      end>
  end
  inherited PnDados: TPanel
    Left = 127
    Top = 111
    Width = 346
    Height = 133
    inherited PnBotoes: TPanel
      Top = 95
      Width = 344
      inherited BtnGravar: TBitBtn
        Left = 130
      end
      inherited BtnCancelar: TBitBtn
        Left = 236
      end
    end
    inherited PnEdits: TPanel
      Width = 344
      Height = 94
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
        DataField = 'CODENDERECO'
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
        DataField = 'DSCENDERECO'
        DataSource = DS
        TabOrder = 1
      end
    end
  end
  inherited TB: TIBQuery
    SQL.Strings = (
      'Select * From Tb_Endereco')
    GeneratorField.Field = 'CODENDERECO'
    GeneratorField.Generator = 'GEN_ENDERECO'
    object TBCODENDERECO: TIntegerField
      FieldName = 'CODENDERECO'
      Origin = 'TB_ENDERECO.CODENDERECO'
      Required = True
    end
    object TBDSCENDERECO: TIBStringField
      DisplayWidth = 80
      FieldName = 'DSCENDERECO'
      Origin = 'TB_ENDERECO.DSCENDERECO'
      Required = True
      Size = 80
    end
  end
  inherited IBU: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CODENDERECO,'
      '  DSCENDERECO'
      'from Tb_Endereco '
      'where'
      '  CODENDERECO = :CODENDERECO')
    ModifySQL.Strings = (
      'update Tb_Endereco'
      'set'
      '  CODENDERECO = :CODENDERECO,'
      '  DSCENDERECO = :DSCENDERECO'
      'where'
      '  CODENDERECO = :OLD_CODENDERECO')
    InsertSQL.Strings = (
      'insert into Tb_Endereco'
      '  (CODENDERECO, DSCENDERECO)'
      'values'
      '  (:CODENDERECO, :DSCENDERECO)')
    DeleteSQL.Strings = (
      'delete from Tb_Endereco'
      'where'
      '  CODENDERECO = :OLD_CODENDERECO')
  end
end
