inherited FProdutoCad: TFProdutoCad
  Left = 308
  Top = 161
  Height = 450
  Caption = 'Cadastro de Produtos'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited DbGDados: TDBGrid
    Height = 367
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_PRODUTO'
        Title.Alignment = taRightJustify
        Title.Caption = 'C'#243'digo'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_PRODUTO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 206
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'desc_tipo_produto'
        Title.Caption = 'Tipo do Produto'
        Width = 208
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_VENDA'
        Title.Alignment = taRightJustify
        Title.Caption = 'Pre'#231'o'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_TIPO_PRODUTO'
        Title.Alignment = taRightJustify
        Visible = False
      end>
  end
  inherited PnLocalizar: TPanel [2]
    Left = 112
    Top = 72
  end
  inherited PnDados: TPanel [3]
    Left = 56
    Top = 8
    Width = 370
    Height = 400
    inherited PnBotoes: TPanel
      Top = 362
      Width = 368
      inherited BtnGravar: TBitBtn
        Left = 154
      end
      inherited BtnCancelar: TBitBtn
        Left = 260
      end
    end
    inherited PnEdits: TPanel
      Width = 368
      Height = 361
      object Label5: TLabel
        Left = 16
        Top = 96
        Width = 76
        Height = 13
        Caption = 'Tipo do Produto'
      end
      object SpeedButton1: TSpeedButton
        Left = 63
        Top = 110
        Width = 24
        Height = 24
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          1800000000000006000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF3434344B4B4B333333FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF85
          8585929292858585FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF636363C9C9C9F6F6F6A1A1A1454545FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F9F9FD6
          D6D6DFDFDFC1C1C18E8E8EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF676767BDBDBDF6F6F69D9D9D4D4D4DFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA1A1A1D0
          D0D0DFDFDFBFBFBF939393FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF6E6E6EB8B8B8F3F3F39A9A9A525252FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA5A5A5CD
          CDCDDFDFDFBDBDBD959595FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF4343434A4A4A4C4C4C666666ADADADE8E8E89191915050504D4D4D4A4A
          4A434343FF00FFFF00FFFF00FFFF00FFFF00FF8D8D8D919191929292A1A1A1C8
          C8C8DFDFDFB8B8B89494949393939191918D8D8DFF00FFFF00FFFF00FFFF00FF
          323232E6E6E6DFDFDFE0E0E0DADADAD7D7D7D3D3D3D9D9D9E1E1E1E5E5E5E8E8
          E8F2F2F2333333FF00FFFF00FFFF00FF848484DFDFDFDFDFDFDFDFDFDFDFDFDF
          DFDFDCDCDCDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF858585FF00FFFF00FFFF00FF
          666666E6E6E6D4D4D4D5D5D5D4D4D4D3D3D3D0D0D0D3D3D3D7D7D7DADADADCDC
          DCF2F2F2606060FF00FFFF00FFFF00FFA1A1A1DFDFDFDDDDDDDEDEDEDDDDDDDC
          DCDCDADADADCDCDCDFDFDFDFDFDFDFDFDFDFDFDF9D9D9DFF00FFFF00FFFF00FF
          323232E7E7E7E0E0E0E1E1E1DDDDDDD7D7D7D3D3D3DADADAE1E1E1E6E6E6EAEA
          EAF6F6F6444444FF00FFFF00FFFF00FF848484DFDFDFDFDFDFDFDFDFDFDFDFDF
          DFDFDCDCDCDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF8E8E8EFF00FFFF00FFFF00FF
          FF00FF3B3B3B434343474747434343A3A3A3D3D3D38787874A4A4A4949494343
          433F3F3FFF00FFFF00FFFF00FFFF00FFFF00FF8989898D8D8D9090908D8D8DC2
          C2C2DCDCDCB3B3B39191919090908D8D8D8B8B8BFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF4C4C4CA9A9A9D1D1D1929292525252FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF929292C6
          C6C6DBDBDBB9B9B9959595FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF454545A7A7A7CCCCCC919191505050FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8E8E8EC4
          C4C4D8D8D8B8B8B8949494FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF3E3E3EA8A8A8D3D3D3919191474747FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8A8A8AC5
          C5C5DCDCDCB8B8B8909090FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF4B4B4B646464464646FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF92
          9292A0A0A08F8F8FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        NumGlyphs = 2
        OnClick = SpeedButton1Click
      end
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
      object Label3: TLabel
        Left = 16
        Top = 136
        Width = 28
        Height = 13
        Caption = 'Pre'#231'o'
        FocusControl = DBEdit3
      end
      object Label4: TLabel
        Left = 128
        Top = 136
        Width = 92
        Height = 13
        Caption = 'Quantidade Padr'#227'o'
        FocusControl = DBEdit2
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 89
        Top = 112
        Width = 264
        Height = 21
        DataField = 'COD_TIPO_PRODUTO'
        DataSource = DS
        DropDownRows = 15
        KeyField = 'COD_TIPO_PRODUTO'
        ListField = 'DESC_TIPO_PRODUTO'
        ListSource = DmTipoProduto.DsSelTipoProduto
        TabOrder = 3
        TabStop = False
      end
      object DBEdit6: TDBEdit
        Left = 16
        Top = 112
        Width = 45
        Height = 21
        DataField = 'COD_TIPO_PRODUTO'
        DataSource = DS
        TabOrder = 2
      end
      object DBEdit1: TDBEdit
        Left = 16
        Top = 32
        Width = 97
        Height = 21
        Color = clBtnFace
        DataField = 'COD_PRODUTO'
        DataSource = DS
        ReadOnly = True
        TabOrder = 0
      end
      object DbEFoco: TDBEdit
        Left = 16
        Top = 72
        Width = 337
        Height = 21
        CharCase = ecUpperCase
        DataField = 'DESC_PRODUTO'
        DataSource = DS
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 16
        Top = 152
        Width = 105
        Height = 21
        DataField = 'VLR_VENDA'
        DataSource = DS
        TabOrder = 4
      end
      object PageControl1: TPageControl
        Left = 16
        Top = 242
        Width = 334
        Height = 110
        ActivePage = TabSheet1
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 7
        object TabSheet1: TTabSheet
          Caption = 'Produtos'
          object DbGItensProd: TDBGrid
            Left = 0
            Top = 0
            Width = 326
            Height = 82
            Align = alClient
            DataSource = DmProduto.DsProduto
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnEditButtonClick = DbGItensProdEditButtonClick
            Columns = <
              item
                ButtonStyle = cbsEllipsis
                Expanded = False
                FieldName = 'COD_PRODUTO_ITEM'
                Title.Alignment = taRightJustify
                Title.Caption = 'Produto'
                Width = 53
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'desc_produto'
                ReadOnly = True
                Title.Caption = 'Descri'#231#227'o'
                Width = 239
                Visible = True
              end>
          end
        end
        object TabSheet2: TTabSheet
          Caption = 'Tipos de Produtos'
          ImageIndex = 1
          TabVisible = False
          object DbGItensTipo: TDBGrid
            Left = 0
            Top = 0
            Width = 326
            Height = 94
            Align = alClient
            DataSource = DmProduto.DsTipo
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnEditButtonClick = DbGItensTipoEditButtonClick
            Columns = <
              item
                ButtonStyle = cbsEllipsis
                Expanded = False
                FieldName = 'COD_TIPO_PRODUTO_ITEM'
                Title.Alignment = taRightJustify
                Title.Caption = 'Tipo'
                Width = 53
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'desc_tipo_produto'
                ReadOnly = True
                Title.Caption = 'Descri'#231#227'o'
                Width = 239
                Visible = True
              end>
          end
        end
      end
      object DBEdit2: TDBEdit
        Left = 128
        Top = 152
        Width = 105
        Height = 21
        DataField = 'QT_QUANTIDADE_PADRAO'
        DataSource = DS
        TabOrder = 5
      end
      object DBRadioGroup1: TDBRadioGroup
        Left = 16
        Top = 178
        Width = 337
        Height = 53
        Caption = 'Tipo da Taxa de Entrega'
        Columns = 2
        DataField = 'IND_TIPO_TAXA_ENTREGA'
        DataSource = DS
        Items.Strings = (
          'N'#227'o cobrar'
          'Cobrar somente uma vez'
          'Cobrar uma taxa por produto')
        TabOrder = 6
        TabStop = True
        Values.Strings = (
          '0'
          '1'
          '2')
      end
    end
  end
  inherited TB: TIBQuery
    OnCalcFields = TBCalcFields
    SQL.Strings = (
      'select * from TB_PRODUTO')
    GeneratorField.Field = 'COD_PRODUTO'
    GeneratorField.Generator = 'GEN_PRODUTO'
    object TBCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Origin = 'TB_PRODUTO.COD_PRODUTO'
    end
    object TBDESC_PRODUTO: TIBStringField
      FieldName = 'DESC_PRODUTO'
      Origin = 'TB_PRODUTO.DESC_PRODUTO'
      Required = True
      Size = 100
    end
    object TBVLR_VENDA: TFloatField
      FieldName = 'VLR_VENDA'
      Origin = 'TB_PRODUTO.VLR_VENDA'
      Required = True
      DisplayFormat = '#0.00'
    end
    object TBCOD_TIPO_PRODUTO: TIntegerField
      FieldName = 'COD_TIPO_PRODUTO'
      Origin = 'TB_PRODUTO.COD_TIPO_PRODUTO'
    end
    object TBQT_QUANTIDADE_PADRAO: TFloatField
      FieldName = 'QT_QUANTIDADE_PADRAO'
      Origin = '"TB_PRODUTO"."QT_QUANTIDADE_PADRAO"'
      Required = True
    end
    object TBdesc_tipo_produto: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_tipo_produto'
      Size = 100
      Calculated = True
    end
    object TBIND_TIPO_TAXA_ENTREGA: TIBStringField
      FieldName = 'IND_TIPO_TAXA_ENTREGA'
      Origin = '"TB_PRODUTO"."IND_TIPO_TAXA_ENTREGA"'
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
      '  COD_PRODUTO,'
      '  DESC_PRODUTO,'
      '  VLR_VENDA,'
      '  COD_TIPO_PRODUTO,'
      '  IND_TIPO_TAXA_ENTREGA,'
      '  QT_QUANTIDADE_PADRAO'
      'from TB_PRODUTO '
      'where'
      '  COD_PRODUTO = :COD_PRODUTO')
    ModifySQL.Strings = (
      'update TB_PRODUTO'
      'set'
      '  COD_PRODUTO = :COD_PRODUTO,'
      '  COD_TIPO_PRODUTO = :COD_TIPO_PRODUTO,'
      '  DESC_PRODUTO = :DESC_PRODUTO,'
      '  IND_TIPO_TAXA_ENTREGA = :IND_TIPO_TAXA_ENTREGA,'
      '  QT_QUANTIDADE_PADRAO = :QT_QUANTIDADE_PADRAO,'
      '  VLR_VENDA = :VLR_VENDA'
      'where'
      '  COD_PRODUTO = :OLD_COD_PRODUTO')
    InsertSQL.Strings = (
      'insert into TB_PRODUTO'
      
        '  (COD_PRODUTO, COD_TIPO_PRODUTO, DESC_PRODUTO, IND_TIPO_TAXA_EN' +
        'TREGA, '
      '   QT_QUANTIDADE_PADRAO, VLR_VENDA)'
      'values'
      
        '  (:COD_PRODUTO, :COD_TIPO_PRODUTO, :DESC_PRODUTO, :IND_TIPO_TAX' +
        'A_ENTREGA, '
      '   :QT_QUANTIDADE_PADRAO, :VLR_VENDA)')
    DeleteSQL.Strings = (
      'delete from TB_PRODUTO'
      'where'
      '  COD_PRODUTO = :OLD_COD_PRODUTO')
  end
end
