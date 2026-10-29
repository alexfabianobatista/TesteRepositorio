inherited FVeiculoCad: TFVeiculoCad
  Left = 468
  Top = 240
  Caption = 'Cadastro de Ve'#237'culos'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited TbOpcoes: TToolBar
    inherited TPesquisar: TToolButton [2]
      Left = 61
    end
    inherited TEditar: TToolButton [3]
      Left = 114
    end
    inherited ToolButton3: TToolButton [4]
      Left = 167
    end
    inherited TGravar: TToolButton [5]
      Left = 175
    end
    inherited ToolButton4: TToolButton [6]
      Left = 228
    end
    inherited TCancelar: TToolButton [7]
      Left = 236
    end
    inherited ToolButton5: TToolButton [8]
      Left = 289
    end
    inherited TExcluir: TToolButton [9]
      Left = 297
    end
    inherited ToolButton8: TToolButton [10]
      Left = 350
    end
    inherited ToolButton6: TToolButton [11]
      Left = 358
    end
    inherited Label11: TLabel [13]
      Left = 419
      Width = 63
    end
    inherited ToolButton1: TToolButton [14]
    end
  end
  inherited DbGDados: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'CODVEICULO'
        Title.Alignment = taRightJustify
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DSCVEICULO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 239
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dscmarca'
        Title.Caption = 'Marca'
        Width = 122
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dsccor'
        Title.Caption = 'Cor'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANOFAB'
        Title.Alignment = taRightJustify
        Title.Caption = 'Ano Fab.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANOMODELO'
        Title.Alignment = taRightJustify
        Title.Caption = 'Ano Modelo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CHASSI'
        Title.Caption = 'Chassi'
        Width = 159
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PLACA'
        Title.Caption = 'Placa'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALORCOMPRA'
        Title.Alignment = taRightJustify
        Title.Caption = 'Vlr. Compra'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALORVENDA'
        Title.Alignment = taRightJustify
        Title.Caption = 'Vlr. Venda'
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODMARCA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CODCOR'
        Visible = False
      end>
  end
  inherited PnDados: TPanel
    Left = 112
    Top = 40
    Height = 293
    inherited PnBotoes: TPanel
      Top = 255
    end
    inherited PnEdits: TPanel
      Height = 254
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
      object Label5: TLabel
        Left = 8
        Top = 88
        Width = 30
        Height = 13
        Caption = 'Marca'
      end
      object SpeedButton1: TSpeedButton
        Left = 55
        Top = 102
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
      object Label3: TLabel
        Left = 8
        Top = 128
        Width = 16
        Height = 13
        Caption = 'Cor'
      end
      object SpeedButton2: TSpeedButton
        Left = 55
        Top = 142
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
        OnClick = SpeedButton2Click
      end
      object Label4: TLabel
        Left = 8
        Top = 168
        Width = 75
        Height = 13
        Caption = 'Ano Fabrica'#231#227'o'
        FocusControl = DBEdit3
      end
      object Label6: TLabel
        Left = 152
        Top = 168
        Width = 57
        Height = 13
        Caption = 'Ano Modelo'
        FocusControl = DBEdit4
      end
      object Label7: TLabel
        Left = 152
        Top = 208
        Width = 31
        Height = 13
        Caption = 'Chassi'
        FocusControl = DBEdit5
      end
      object Label8: TLabel
        Left = 8
        Top = 208
        Width = 27
        Height = 13
        Caption = 'Placa'
      end
      object Label9: TLabel
        Left = 96
        Top = 8
        Width = 63
        Height = 13
        Caption = 'Valor Compra'
        FocusControl = DBEdit8
      end
      object Label10: TLabel
        Left = 226
        Top = 8
        Width = 58
        Height = 13
        Caption = 'Valor Venda'
        FocusControl = DBEdit9
      end
      object DBEdit1: TDBEdit
        Left = 8
        Top = 24
        Width = 81
        Height = 21
        Color = clBtnFace
        DataField = 'CODVEICULO'
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
        DataField = 'DSCVEICULO'
        DataSource = DS
        TabOrder = 1
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 81
        Top = 104
        Width = 217
        Height = 21
        DataField = 'CODMARCA'
        DataSource = DS
        DropDownRows = 15
        KeyField = 'CODMARCA'
        ListField = 'DSCMARCA'
        ListSource = DmMarca.DsSelMarca
        TabOrder = 3
      end
      object DBEdit6: TDBEdit
        Left = 8
        Top = 104
        Width = 45
        Height = 21
        DataField = 'CODMARCA'
        DataSource = DS
        TabOrder = 2
      end
      object DBLookupComboBox2: TDBLookupComboBox
        Left = 81
        Top = 144
        Width = 217
        Height = 21
        DataField = 'CODCOR'
        DataSource = DS
        DropDownRows = 15
        KeyField = 'CODCOR'
        ListField = 'DSCCOR'
        ListSource = DmCor.DsSelCor
        TabOrder = 5
      end
      object DBEdit2: TDBEdit
        Left = 8
        Top = 144
        Width = 45
        Height = 21
        DataField = 'CODCOR'
        DataSource = DS
        TabOrder = 4
      end
      object DBEdit3: TDBEdit
        Left = 8
        Top = 184
        Width = 134
        Height = 21
        DataField = 'ANOFAB'
        DataSource = DS
        TabOrder = 6
      end
      object DBEdit4: TDBEdit
        Left = 152
        Top = 184
        Width = 134
        Height = 21
        DataField = 'ANOMODELO'
        DataSource = DS
        TabOrder = 7
      end
      object DBEdit5: TDBEdit
        Left = 152
        Top = 224
        Width = 134
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CHASSI'
        DataSource = DS
        TabOrder = 9
      end
      object DBEdit8: TDBEdit
        Left = 96
        Top = 24
        Width = 124
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'VALORCOMPRA'
        DataSource = DS
        ReadOnly = True
        TabOrder = 10
      end
      object DBEdit9: TDBEdit
        Left = 226
        Top = 24
        Width = 124
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'VALORVENDA'
        DataSource = DS
        ReadOnly = True
        TabOrder = 11
      end
      object MePlaca: TMaskEdit
        Left = 8
        Top = 224
        Width = 134
        Height = 21
        CharCase = ecUpperCase
        EditMask = '!AAA-9999;1;_'
        MaxLength = 8
        TabOrder = 8
        Text = '   -    '
      end
    end
  end
  inherited TB: TIBQuery
    OnCalcFields = TBCalcFields
    SQL.Strings = (
      'Select * From TB_VEICULO')
    GeneratorField.Field = 'CODVEICULO'
    GeneratorField.Generator = 'GEN_VEICULO'
    object TBCODVEICULO: TIntegerField
      FieldName = 'CODVEICULO'
      Origin = 'TB_VEICULO.CODVEICULO'
      Required = True
    end
    object TBDSCVEICULO: TIBStringField
      FieldName = 'DSCVEICULO'
      Origin = 'TB_VEICULO.DSCVEICULO'
      Required = True
      Size = 80
    end
    object TBCODMARCA: TIntegerField
      FieldName = 'CODMARCA'
      Origin = 'TB_VEICULO.CODMARCA'
      Required = True
    end
    object TBANOFAB: TIntegerField
      FieldName = 'ANOFAB'
      Origin = 'TB_VEICULO.ANOFAB'
      Required = True
    end
    object TBANOMODELO: TIntegerField
      FieldName = 'ANOMODELO'
      Origin = 'TB_VEICULO.ANOMODELO'
      Required = True
    end
    object TBCHASSI: TIBStringField
      FieldName = 'CHASSI'
      Origin = 'TB_VEICULO.CHASSI'
      Required = True
      Size = 30
    end
    object TBPLACA: TIBStringField
      FieldName = 'PLACA'
      Origin = 'TB_VEICULO.PLACA'
      Size = 8
    end
    object TBCODCOR: TIntegerField
      FieldName = 'CODCOR'
      Origin = 'TB_VEICULO.CODCOR'
      Required = True
    end
    object TBVALORCOMPRA: TFloatField
      FieldName = 'VALORCOMPRA'
      Origin = 'TB_VEICULO.VALORCOMPRA'
      DisplayFormat = '#0.00'
    end
    object TBVALORVENDA: TFloatField
      FieldName = 'VALORVENDA'
      Origin = 'TB_VEICULO.VALORVENDA'
      DisplayFormat = '#0.00'
    end
    object TBdscmarca: TStringField
      FieldKind = fkCalculated
      FieldName = 'dscmarca'
      Size = 80
      Calculated = True
    end
    object TBdsccor: TStringField
      FieldKind = fkCalculated
      FieldName = 'dsccor'
      Size = 80
      Calculated = True
    end
  end
  inherited IBU: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CODVEICULO,'
      '  DSCVEICULO,'
      '  CODMARCA,'
      '  ANOFAB,'
      '  ANOMODELO,'
      '  CHASSI,'
      '  PLACA,'
      '  CODCOR,'
      '  VALORCOMPRA,'
      '  VALORVENDA'
      'from TB_VEICULO '
      'where'
      '  CODVEICULO = :CODVEICULO')
    ModifySQL.Strings = (
      'update TB_VEICULO'
      'set'
      '  CODVEICULO = :CODVEICULO,'
      '  DSCVEICULO = :DSCVEICULO,'
      '  CODMARCA = :CODMARCA,'
      '  ANOFAB = :ANOFAB,'
      '  ANOMODELO = :ANOMODELO,'
      '  CHASSI = :CHASSI,'
      '  PLACA = :PLACA,'
      '  CODCOR = :CODCOR,'
      '  VALORCOMPRA = :VALORCOMPRA,'
      '  VALORVENDA = :VALORVENDA'
      'where'
      '  CODVEICULO = :OLD_CODVEICULO')
    InsertSQL.Strings = (
      'insert into TB_VEICULO'
      
        '  (CODVEICULO, DSCVEICULO, CODMARCA, ANOFAB, ANOMODELO, CHASSI, ' +
        'PLACA, '
      '   CODCOR, VALORCOMPRA, VALORVENDA)'
      'values'
      
        '  (:CODVEICULO, :DSCVEICULO, :CODMARCA, :ANOFAB, :ANOMODELO, :CH' +
        'ASSI, :PLACA, '
      '   :CODCOR, :VALORCOMPRA, :VALORVENDA)')
    DeleteSQL.Strings = (
      'delete from TB_VEICULO'
      'where'
      '  CODVEICULO = :OLD_CODVEICULO')
  end
end
