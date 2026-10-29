inherited FVendedorCad: TFVendedorCad
  Caption = 'Cadastro de Vendedores'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited DbGDados: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'CODVENDEDOR'
        Title.Alignment = taRightJustify
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome'
        Width = 253
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMISSAO'
        Title.Alignment = taRightJustify
        Title.Caption = 'Comiss'#227'o (%)'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_ADMISSAO'
        Title.Caption = 'Admiss'#227'o'
        Visible = True
      end>
  end
  inherited PnDados: TPanel
    Height = 174
    inherited PnBotoes: TPanel
      Top = 136
    end
    inherited PnEdits: TPanel
      Height = 135
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
      object Label3: TLabel
        Left = 8
        Top = 88
        Width = 114
        Height = 13
        Caption = 'Percentual de Comiss'#227'o'
        FocusControl = DBEdit2
      end
      object Label7: TLabel
        Left = 150
        Top = 88
        Width = 71
        Height = 13
        Caption = 'Data Admiss'#227'o'
      end
      object DBEdit1: TDBEdit
        Left = 8
        Top = 24
        Width = 134
        Height = 21
        Color = clBtnFace
        DataField = 'CODVENDEDOR'
        DataSource = DS
        ReadOnly = True
        TabOrder = 0
      end
      object DBEFoco: TDBEdit
        Left = 8
        Top = 64
        Width = 351
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NOME'
        DataSource = DS
        TabOrder = 1
      end
      object DBEdit2: TDBEdit
        Left = 8
        Top = 104
        Width = 134
        Height = 21
        DataField = 'COMISSAO'
        DataSource = DS
        TabOrder = 2
      end
      object MeDataAdmissao: TMaskEdit
        Left = 150
        Top = 104
        Width = 69
        Height = 21
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 3
        Text = '  /  /    '
      end
    end
  end
  inherited TB: TIBQuery
    SQL.Strings = (
      'select * from TB_VENDEDOR')
    GeneratorField.Field = 'CODVENDEDOR'
    GeneratorField.Generator = 'GEN_VENDEDOR'
    object TBCODVENDEDOR: TIntegerField
      FieldName = 'CODVENDEDOR'
      Origin = 'TB_VENDEDOR.CODVENDEDOR'
      Required = True
    end
    object TBNOME: TIBStringField
      FieldName = 'NOME'
      Origin = 'TB_VENDEDOR.NOME'
      Required = True
      Size = 80
    end
    object TBCOMISSAO: TFloatField
      FieldName = 'COMISSAO'
      Origin = 'TB_VENDEDOR.COMISSAO'
    end
    object TBDATA_ADMISSAO: TDateTimeField
      FieldName = 'DATA_ADMISSAO'
      Origin = 'TB_VENDEDOR.DATA_ADMISSAO'
    end
  end
  inherited IBT: TIBTransaction
    Active = False
  end
  inherited IBU: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CODVENDEDOR,'
      '  NOME,'
      '  COMISSAO,'
      '  DATA_ADMISSAO'
      'from TB_VENDEDOR '
      'where'
      '  CODVENDEDOR = :CODVENDEDOR')
    ModifySQL.Strings = (
      'update TB_VENDEDOR'
      'set'
      '  CODVENDEDOR = :CODVENDEDOR,'
      '  NOME = :NOME,'
      '  COMISSAO = :COMISSAO,'
      '  DATA_ADMISSAO = :DATA_ADMISSAO'
      'where'
      '  CODVENDEDOR = :OLD_CODVENDEDOR')
    InsertSQL.Strings = (
      'insert into TB_VENDEDOR'
      '  (CODVENDEDOR, NOME, COMISSAO, DATA_ADMISSAO)'
      'values'
      '  (:CODVENDEDOR, :NOME, :COMISSAO, :DATA_ADMISSAO)')
    DeleteSQL.Strings = (
      'delete from TB_VENDEDOR'
      'where'
      '  CODVENDEDOR = :OLD_CODVENDEDOR')
  end
end
