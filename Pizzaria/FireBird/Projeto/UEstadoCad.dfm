inherited FEstadoCad: TFEstadoCad
  Caption = 'Cadastro de Estados'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited DbGDados: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'CODESTADO'
        Title.Alignment = taRightJustify
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DSCESTADO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 250
        Visible = True
      end>
  end
  inherited PnDados: TPanel
    Left = 151
    Top = 119
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
        DataField = 'CODESTADO'
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
        DataField = 'DSCESTADO'
        DataSource = DS
        TabOrder = 1
      end
    end
  end
  inherited TB: TIBQuery
    SQL.Strings = (
      'Select * From Tb_Estado')
    GeneratorField.Field = 'CODESTADO'
    GeneratorField.Generator = 'GEN_ESTADO'
    object TBCODESTADO: TIntegerField
      FieldName = 'CODESTADO'
      Origin = 'TB_ESTADO.CODESTADO'
      Required = True
    end
    object TBDSCESTADO: TIBStringField
      DisplayWidth = 80
      FieldName = 'DSCESTADO'
      Origin = 'TB_ESTADO.DSCESTADO'
      Required = True
      Size = 80
    end
  end
  inherited IBU: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CODESTADO,'
      '  DSCESTADO'
      'from Tb_Estado '
      'where'
      '  CODESTADO = :CODESTADO')
    ModifySQL.Strings = (
      'update Tb_Estado'
      'set'
      '  CODESTADO = :CODESTADO,'
      '  DSCESTADO = :DSCESTADO'
      'where'
      '  CODESTADO = :OLD_CODESTADO')
    InsertSQL.Strings = (
      'insert into Tb_Estado'
      '  (CODESTADO, DSCESTADO)'
      'values'
      '  (:CODESTADO, :DSCESTADO)')
    DeleteSQL.Strings = (
      'delete from Tb_Estado'
      'where'
      '  CODESTADO = :OLD_CODESTADO')
  end
end
