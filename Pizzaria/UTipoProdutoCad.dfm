inherited FTipoProdutoCad: TFTipoProdutoCad
  Caption = 'Cadastro de Tipos de Produtos'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited DbGDados: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_TIPO_PRODUTO'
        Title.Alignment = taRightJustify
        Title.Caption = 'C'#243'digo'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_TIPO_PRODUTO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 293
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ind_sabores'
        Title.Caption = 'Sabores'
        Width = 49
        Visible = True
      end>
  end
  inherited PnDados: TPanel
    Left = 103
    Top = 111
    Width = 368
    Height = 171
    inherited PnBotoes: TPanel
      Top = 133
      Width = 366
      inherited BtnGravar: TBitBtn
        Left = 152
      end
      inherited BtnCancelar: TBitBtn
        Left = 258
      end
    end
    inherited PnEdits: TPanel
      Width = 366
      Height = 132
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
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = DbEFoco
      end
      object DBEdit1: TDBEdit
        Left = 16
        Top = 32
        Width = 81
        Height = 21
        Color = clBtnFace
        DataField = 'COD_TIPO_PRODUTO'
        DataSource = DS
        ReadOnly = True
        TabOrder = 0
      end
      object DbEFoco: TDBEdit
        Left = 16
        Top = 72
        Width = 336
        Height = 21
        CharCase = ecUpperCase
        DataField = 'DESC_TIPO_PRODUTO'
        DataSource = DS
        TabOrder = 1
      end
      object CbSabores: TCheckBox
        Left = 16
        Top = 104
        Width = 65
        Height = 17
        Caption = 'Sabores'
        TabOrder = 2
      end
      object DBCheckBox1: TDBCheckBox
        Left = 96
        Top = 104
        Width = 97
        Height = 17
        Caption = 'Ticket Cozinha'
        DataField = 'IND_TICKET_COZINHA'
        DataSource = DS
        TabOrder = 3
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object DBCheckBox2: TDBCheckBox
        Left = 208
        Top = 104
        Width = 113
        Height = 17
        Caption = 'Ticket Entregador'
        DataField = 'IND_TICKET_ENTREGADOR'
        DataSource = DS
        TabOrder = 4
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
    end
  end
  inherited PnLocalizar: TPanel
    Top = 304
  end
  inherited TB: TIBQuery
    OnCalcFields = TBCalcFields
    SQL.Strings = (
      'select * from TB_TIPO_PRODUTO')
    GeneratorField.Field = 'COD_TIPO_PRODUTO'
    GeneratorField.Generator = 'GEN_TIPO_PRODUTO'
    object TBCOD_TIPO_PRODUTO: TIntegerField
      FieldName = 'COD_TIPO_PRODUTO'
      Origin = 'TB_TIPO_PRODUTO.COD_TIPO_PRODUTO'
    end
    object TBDESC_TIPO_PRODUTO: TIBStringField
      FieldName = 'DESC_TIPO_PRODUTO'
      Origin = 'TB_TIPO_PRODUTO.DESC_TIPO_PRODUTO'
      Required = True
      Size = 100
    end
    object TBNUM_SABORES: TIntegerField
      FieldName = 'NUM_SABORES'
      Origin = 'TB_TIPO_PRODUTO.NUM_SABORES'
      Required = True
    end
    object TBind_sabores: TStringField
      FieldKind = fkCalculated
      FieldName = 'ind_sabores'
      Size = 1
      Calculated = True
    end
    object TBIND_TICKET_COZINHA: TIBStringField
      FieldName = 'IND_TICKET_COZINHA'
      Origin = '"TB_TIPO_PRODUTO"."IND_TICKET_COZINHA"'
      Required = True
      Size = 1
    end
    object TBIND_TICKET_ENTREGADOR: TIBStringField
      FieldName = 'IND_TICKET_ENTREGADOR'
      Origin = '"TB_TIPO_PRODUTO"."IND_TICKET_ENTREGADOR"'
      Required = True
      Size = 1
    end
  end
  inherited IBT: TIBTransaction
    Active = True
  end
  inherited IBU: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  COD_TIPO_PRODUTO,'
      '  DESC_TIPO_PRODUTO,'
      '  NUM_SABORES,'
      '  IND_TICKET_COZINHA,'
      '  IND_TICKET_ENTREGADOR'
      'from TB_TIPO_PRODUTO '
      'where'
      '  COD_TIPO_PRODUTO = :COD_TIPO_PRODUTO')
    ModifySQL.Strings = (
      'update TB_TIPO_PRODUTO'
      'set'
      '  COD_TIPO_PRODUTO = :COD_TIPO_PRODUTO,'
      '  DESC_TIPO_PRODUTO = :DESC_TIPO_PRODUTO,'
      '  IND_TICKET_COZINHA = :IND_TICKET_COZINHA,'
      '  IND_TICKET_ENTREGADOR = :IND_TICKET_ENTREGADOR,'
      '  NUM_SABORES = :NUM_SABORES'
      'where'
      '  COD_TIPO_PRODUTO = :OLD_COD_TIPO_PRODUTO')
    InsertSQL.Strings = (
      'insert into TB_TIPO_PRODUTO'
      
        '  (COD_TIPO_PRODUTO, DESC_TIPO_PRODUTO, IND_TICKET_COZINHA, IND_' +
        'TICKET_ENTREGADOR, '
      '   NUM_SABORES)'
      'values'
      
        '  (:COD_TIPO_PRODUTO, :DESC_TIPO_PRODUTO, :IND_TICKET_COZINHA, :' +
        'IND_TICKET_ENTREGADOR, '
      '   :NUM_SABORES)')
    DeleteSQL.Strings = (
      'delete from TB_TIPO_PRODUTO'
      'where'
      '  COD_TIPO_PRODUTO = :OLD_COD_TIPO_PRODUTO')
  end
end
