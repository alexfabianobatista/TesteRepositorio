object FEditorHTML: TFEditorHTML
  Left = 153
  Top = 56
  Width = 1130
  Height = 640
  Caption = 'Editor HTML'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1114
    Height = 581
    Align = alClient
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 221
      Top = 1
      Width = 2
      Height = 579
      Color = clScrollBar
      ParentColor = False
    end
    object Splitter2: TSplitter
      Left = 773
      Top = 1
      Width = 2
      Height = 579
      Align = alRight
      Color = clScrollBar
      ParentColor = False
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 220
      Height = 579
      Align = alLeft
      Alignment = taLeftJustify
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        220
        579)
      object GroupBox1: TGroupBox
        Left = 15
        Top = 8
        Width = 202
        Height = 257
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Elementos dispon'#237'veis'
        TabOrder = 0
        DesignSize = (
          202
          257)
        object TVObjetos: TTreeView
          Left = 8
          Top = 24
          Width = 181
          Height = 225
          Anchors = [akLeft, akTop, akRight, akBottom]
          AutoExpand = True
          BorderStyle = bsNone
          Color = clMenu
          DragMode = dmAutomatic
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Indent = 19
          ParentFont = False
          TabOrder = 0
          OnDblClick = TVObjetosDblClick
          Items.Data = {
            07000000230000000000000000000000FFFFFFFFFFFFFFFF0000000001000000
            0A436F6E7461696E657273200000000000000000000000FFFFFFFFFFFFFFFF00
            00000000000000074469766973E36F1E0000000100000001000000FFFFFFFFFF
            FFFFFF000000000400000005546578746F200000000100000001000000FFFFFF
            FFFFFFFFFF000000000400000007546974756C6F732000000001000000010000
            00FFFFFFFFFFFFFFFF000000000000000007476967616E74651F000000010000
            0001000000FFFFFFFFFFFFFFFF0000000000000000064772616E64651E000000
            0100000001000000FFFFFFFFFFFFFFFF0000000000000000054DE964696F2000
            00000100000001000000FFFFFFFFFFFFFFFF0000000000000000075065717565
            6E6F220000000100000001000000FFFFFFFFFFFFFFFF00000000000000000950
            6172E1677261666F200000000100000001000000FFFFFFFFFFFFFFFF00000000
            00000000074E65677269746F200000000100000001000000FFFFFFFFFFFFFFFF
            0000000000000000074974E16C69636F200000000200000002000000FFFFFFFF
            FFFFFFFF000000000100000007496D6167656E731E0000000200000002000000
            FFFFFFFFFFFFFFFF000000000000000005466F6E74651E000000030000000300
            0000FFFFFFFFFFFFFFFF00000000010000000541E7F565731D00000003000000
            03000000FFFFFFFFFFFFFFFF0000000000000000044C696E6B1F000000040000
            0004000000FFFFFFFFFFFFFFFF00000000010000000647726164657320000000
            0400000004000000FFFFFFFFFFFFFFFF000000000300000007546162656C6173
            1F0000000400000004000000FFFFFFFFFFFFFFFF000000000000000006546162
            656C611E0000000400000004000000FFFFFFFFFFFFFFFF000000000000000005
            4C696E68611F0000000400000004000000FFFFFFFFFFFFFFFF00000000000000
            0006436F6C756E611F0000000500000005000000FFFFFFFFFFFFFFFF00000000
            02000000064C6973746173210000000500000005000000FFFFFFFFFFFFFFFF00
            00000000000000084F7264656E616461250000000500000005000000FFFFFFFF
            FFFFFFFF00000000000000000C4EE36F206F7264656E6164611F000000060000
            0006000000FFFFFFFFFFFFFFFF0000000003000000064F7574726F7328000000
            0600000006000000FFFFFFFFFFFFFFFF00000000000000000F51756562726120
            6465206C696E6861290000000600000006000000FFFFFFFFFFFFFFFF00000000
            00000000104C696E686120686F72697A6F6E74616C2600000006000000060000
            00FFFFFFFFFFFFFFFF00000000000000000D43656E7472616C697A61646F72}
        end
      end
      object GroupBox2: TGroupBox
        Left = 15
        Top = 272
        Width = 201
        Height = 297
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = 'Navega'#231#227'o'
        TabOrder = 1
        DesignSize = (
          201
          297)
        object TVNavegacao: TTreeView
          Left = 8
          Top = 24
          Width = 185
          Height = 257
          Anchors = [akLeft, akTop, akRight, akBottom]
          BorderStyle = bsNone
          Color = clBtnFace
          DragMode = dmAutomatic
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          HideSelection = False
          Indent = 19
          ParentFont = False
          PopupMenu = PUpNavegacao
          RightClickSelect = True
          TabOrder = 0
          OnChange = TVNavegacaoChange
          OnCustomDrawItem = TVNavegacaoCustomDrawItem
          OnDragDrop = TVNavegacaoDragDrop
          OnDragOver = TVNavegacaoDragOver
          Items.Data = {
            010000001E0000000000000000000000FFFFFFFFFFFFFFFF0000000000000000
            05436F72706F}
        end
      end
    end
    object Panel2: TPanel
      Left = 223
      Top = 1
      Width = 550
      Height = 579
      Align = alClient
      BevelOuter = bvNone
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 1
      DesignSize = (
        550
        579)
      object Panel4: TPanel
        Left = 8
        Top = 8
        Width = 536
        Height = 565
        Anchors = [akLeft, akTop, akRight, akBottom]
        BorderStyle = bsSingle
        TabOrder = 0
        object WebBrowser1: TWebBrowser
          Left = 1
          Top = 1
          Width = 530
          Height = 559
          Align = alClient
          DragMode = dmAutomatic
          TabOrder = 0
          OnDragDrop = WebBrowser1DragDrop
          OnDragOver = WebBrowser1DragOver
          OnTitleChange = WebBrowser1TitleChange
          ControlData = {
            4C000000C7360000C63900000100000001020000000000000000000000000000
            000000004C000000000000000000000001000000E0D057007335CF11AE690800
            2B2E12620A000000000000004C0000000114020000000000C000000000000046
            8000000000000000000000000000000000000000000000000000000000000000
            00000000000000000100000000000000000000000000000000000000}
        end
      end
    end
    object Panel5: TPanel
      Left = 775
      Top = 1
      Width = 338
      Height = 579
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
      DesignSize = (
        338
        579)
      object GroupBox3: TGroupBox
        Left = 5
        Top = 192
        Width = 321
        Height = 377
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = 'Estilo'
        TabOrder = 1
        DesignSize = (
          321
          377)
        object PgcEstilo: TPageControl
          Left = 7
          Top = 21
          Width = 303
          Height = 348
          ActivePage = TabSheet10
          Anchors = [akLeft, akTop, akRight, akBottom]
          BiDiMode = bdLeftToRight
          MultiLine = True
          ParentBiDiMode = False
          Style = tsFlatButtons
          TabOrder = 0
          Visible = False
          object TabSheet10: TTabSheet
            Caption = 'Letra'
            object ScrollBox11: TScrollBox
              Left = 0
              Top = 0
              Width = 295
              Height = 293
              Align = alClient
              BorderStyle = bsNone
              TabOrder = 0
              DesignSize = (
                295
                293)
              object Label31: TLabel
                Left = 51
                Top = 26
                Width = 19
                Height = 13
                Caption = 'Cor:'
              end
              object Label18: TLabel
                Left = 44
                Top = 60
                Width = 30
                Height = 13
                Caption = 'Fonte:'
              end
              object Label32: TLabel
                Left = 28
                Top = 94
                Width = 48
                Height = 13
                Caption = 'Tamanho:'
              end
              object Label33: TLabel
                Left = 44
                Top = 132
                Width = 28
                Height = 13
                Caption = 'Estilo:'
              end
              object Label34: TLabel
                Left = 20
                Top = 173
                Width = 56
                Height = 13
                Caption = 'Decora'#231#227'o:'
              end
              object Label2: TLabel
                Left = 44
                Top = 205
                Width = 27
                Height = 13
                Caption = 'Peso:'
              end
              object CBCssFontFamily: TComboBox
                Left = 88
                Top = 58
                Width = 185
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                ItemHeight = 13
                ItemIndex = 0
                TabOrder = 0
                Text = 'None'
                OnChange = CBCssFontFamilyChange
                Items.Strings = (
                  'None'
                  'Georgia, serif'
                  'Palatino Linotype, Book Antiqua, Palatino, serif'
                  'Times New Roman, Times, serif'
                  'Arial, Helvetica, sans-serif'
                  'Arial Black, Gadget, sans-serif'
                  'Comic Sans MS, cursive, sans-serif'
                  'Impact, Charcoal, sans-serif'
                  'Lucida Sans Unicode, Lucida Grande, sans-serif'
                  'Tahoma, Geneva, sans-serif'
                  'Trebuchet MS, Helvetica, sans-serif'
                  'Verdana, Geneva, sans-serif'
                  'Courier New, Courier, monospace'
                  'Lucida Console, Monaco, monospace')
              end
              object CBCssFontStyle: TComboBox
                Left = 88
                Top = 128
                Width = 185
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                ItemHeight = 13
                ItemIndex = 0
                TabOrder = 1
                Text = 'Normal'
                OnChange = CBCssFontStyleChange
                Items.Strings = (
                  'Normal'
                  'Italic'
                  'Oblique')
              end
              object CBCssTextDecoration: TComboBox
                Left = 88
                Top = 163
                Width = 185
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                ItemHeight = 13
                ItemIndex = 0
                TabOrder = 2
                Text = 'None'
                OnChange = CBCssTextDecorationChange
                Items.Strings = (
                  'None'
                  'Underline'
                  'Overline '
                  'Line-through'
                  'Blink')
              end
              object CBCssColor: TComboBox
                Left = 88
                Top = 22
                Width = 185
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                ItemHeight = 13
                TabOrder = 3
                Text = 'Nenhuma'
                OnChange = CBCssColorChange
                Items.Strings = (
                  'Nenhuma'
                  'Ciano'
                  'Preto'
                  'Azul'
                  'F'#250'csia'
                  'Cinza'
                  'Verde'
                  'Lim'#227'o'
                  'Marrom'
                  'Marinho'
                  'Oliva'
                  'Roxo'
                  'Vermelho'
                  'Prata'
                  'Cerceta'
                  'Branco'
                  'Amarelo'
                  'Trigo'
                  'Violeta'
                  'Rosa'
                  'Tomate'
                  'Salm'#227'o'
                  'Laranja'
                  'Ouro')
              end
              object CBCssFontWeight: TComboBox
                Left = 88
                Top = 201
                Width = 185
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                ItemHeight = 13
                ItemIndex = 0
                TabOrder = 4
                Text = 'Normal'
                OnChange = CBCssFontWeightChange
                Items.Strings = (
                  'Normal'
                  'Bold'
                  'Bolder'
                  'Lighter')
              end
              object CBCssFontSize: TComboBox
                Left = 88
                Top = 92
                Width = 185
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                ItemHeight = 13
                ItemIndex = 0
                TabOrder = 5
                Text = 'Unset'
                OnChange = CBCssFontSizeChange
                Items.Strings = (
                  'Unset'
                  'Xx-small'
                  'X-small'
                  'Small'
                  'Medium'
                  'Large'
                  'X-large'
                  'Xx-large')
              end
            end
          end
          object TabSheet11: TTabSheet
            Caption = 'Dimens'#245'es'
            ImageIndex = 1
            object ScrollBox12: TScrollBox
              Left = 0
              Top = 0
              Width = 295
              Height = 293
              Align = alClient
              BorderStyle = bsNone
              TabOrder = 0
              DesignSize = (
                295
                293)
              object Label19: TLabel
                Left = 40
                Top = 25
                Width = 30
                Height = 13
                Caption = 'Altura:'
              end
              object Label15: TLabel
                Left = 32
                Top = 52
                Width = 39
                Height = 13
                Caption = 'Largura:'
              end
              object TBCssHeight: TTrackBar
                Left = 80
                Top = 24
                Width = 193
                Height = 17
                Anchors = [akLeft, akTop, akRight]
                Max = 100
                TabOrder = 0
                ThumbLength = 10
                TickMarks = tmBoth
                TickStyle = tsNone
                OnChange = TBCssHeightChange
              end
              object TBCssWidth: TTrackBar
                Left = 80
                Top = 51
                Width = 193
                Height = 17
                Anchors = [akLeft, akTop, akRight]
                Max = 100
                TabOrder = 1
                ThumbLength = 10
                TickMarks = tmBoth
                TickStyle = tsNone
                OnChange = TBCssWidthChange
              end
            end
          end
          object TabSheet12: TTabSheet
            Caption = 'Margens'
            ImageIndex = 2
            object ScrollBox13: TScrollBox
              Left = 0
              Top = 0
              Width = 295
              Height = 293
              Align = alClient
              BorderStyle = bsNone
              TabOrder = 0
              DesignSize = (
                295
                293)
              object Label20: TLabel
                Left = 40
                Top = 104
                Width = 29
                Height = 13
                Caption = 'Baixo:'
              end
              object Label21: TLabel
                Left = 43
                Top = 78
                Width = 26
                Height = 13
                Caption = 'Cima:'
              end
              object Label17: TLabel
                Left = 38
                Top = 52
                Width = 33
                Height = 13
                Caption = 'Direita:'
              end
              object Label16: TLabel
                Left = 24
                Top = 25
                Width = 48
                Height = 13
                Caption = 'Esquerda:'
              end
              object TBCssMarginLeft: TTrackBar
                Left = 80
                Top = 24
                Width = 195
                Height = 17
                Anchors = [akLeft, akTop, akRight]
                Max = 100
                TabOrder = 0
                ThumbLength = 10
                TickMarks = tmBoth
                TickStyle = tsNone
                OnChange = TBCssMarginLeftChange
              end
              object TBCssMarginRight: TTrackBar
                Left = 80
                Top = 51
                Width = 195
                Height = 17
                Anchors = [akLeft, akTop, akRight]
                Max = 100
                TabOrder = 1
                ThumbLength = 10
                TickMarks = tmBoth
                TickStyle = tsNone
                OnChange = TBCssMarginRightChange
              end
              object TBCssMarginTop: TTrackBar
                Left = 80
                Top = 77
                Width = 195
                Height = 17
                Anchors = [akLeft, akTop, akRight]
                Max = 100
                TabOrder = 2
                ThumbLength = 10
                TickMarks = tmBoth
                TickStyle = tsNone
                OnChange = TBCssMarginTopChange
              end
              object TBCssMarginBottom: TTrackBar
                Left = 80
                Top = 103
                Width = 195
                Height = 17
                Anchors = [akLeft, akTop, akRight]
                Max = 100
                TabOrder = 3
                ThumbLength = 10
                TickMarks = tmBoth
                TickStyle = tsNone
                OnChange = TBCssMarginBottomChange
              end
            end
          end
          object TabSheet13: TTabSheet
            Caption = 'Espa'#231'amentos'
            ImageIndex = 3
            object ScrollBox14: TScrollBox
              Left = 0
              Top = 0
              Width = 295
              Height = 293
              Align = alClient
              BorderStyle = bsNone
              TabOrder = 0
              DesignSize = (
                295
                293)
              object Label24: TLabel
                Left = 40
                Top = 103
                Width = 29
                Height = 13
                Caption = 'Baixo:'
              end
              object Label25: TLabel
                Left = 43
                Top = 77
                Width = 26
                Height = 13
                Caption = 'Cima:'
              end
              object Label23: TLabel
                Left = 38
                Top = 51
                Width = 33
                Height = 13
                Caption = 'Direita:'
              end
              object Label22: TLabel
                Left = 24
                Top = 25
                Width = 48
                Height = 13
                Caption = 'Esquerda:'
              end
              object TBCssPaddingLeft: TTrackBar
                Left = 80
                Top = 24
                Width = 193
                Height = 17
                Anchors = [akLeft, akTop, akRight]
                Max = 100
                TabOrder = 0
                ThumbLength = 10
                TickMarks = tmBoth
                TickStyle = tsNone
                OnChange = TBCssPaddingLeftChange
              end
              object TBCssPaddingRight: TTrackBar
                Left = 80
                Top = 50
                Width = 193
                Height = 17
                Anchors = [akLeft, akTop, akRight]
                Max = 100
                TabOrder = 1
                ThumbLength = 10
                TickMarks = tmBoth
                TickStyle = tsNone
                OnChange = TBCssPaddingRightChange
              end
              object TBCssPaddingTop: TTrackBar
                Left = 80
                Top = 76
                Width = 193
                Height = 17
                Anchors = [akLeft, akTop, akRight]
                Max = 100
                TabOrder = 2
                ThumbLength = 10
                TickMarks = tmBoth
                TickStyle = tsNone
                OnChange = TBCssPaddingTopChange
              end
              object TBCssPaddingBottom: TTrackBar
                Left = 80
                Top = 102
                Width = 192
                Height = 17
                Anchors = [akLeft, akTop, akRight]
                Max = 100
                TabOrder = 3
                ThumbLength = 10
                TickMarks = tmBoth
                TickStyle = tsNone
                OnChange = TBCssPaddingBottomChange
              end
            end
          end
          object TabSheet14: TTabSheet
            Caption = 'Borda'
            ImageIndex = 4
            object ScrollBox15: TScrollBox
              Left = 0
              Top = 0
              Width = 295
              Height = 293
              Align = alClient
              BorderStyle = bsNone
              TabOrder = 0
              DesignSize = (
                295
                293)
              object Label26: TLabel
                Left = 24
                Top = 89
                Width = 48
                Height = 13
                Caption = 'Tamanho:'
              end
              object Label27: TLabel
                Left = 51
                Top = 55
                Width = 19
                Height = 13
                Caption = 'Cor:'
              end
              object Label4: TLabel
                Left = 51
                Top = 23
                Width = 24
                Height = 13
                Caption = 'Tipo:'
              end
              object Label9: TLabel
                Left = 3
                Top = 119
                Width = 68
                Height = 13
                Caption = 'Recolhimento:'
              end
              object Label12: TLabel
                Left = 32
                Top = 153
                Width = 36
                Height = 13
                Caption = 'Cantos:'
              end
              object TBCssBorderWidth: TTrackBar
                Left = 80
                Top = 88
                Width = 191
                Height = 17
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
                ThumbLength = 10
                TickMarks = tmBoth
                TickStyle = tsNone
                OnChange = TBCssBorderWidthChange
              end
              object CBCssBorderColor: TComboBox
                Left = 85
                Top = 53
                Width = 189
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                ItemHeight = 13
                TabOrder = 1
                Text = 'Nenhuma'
                OnChange = CBCssBorderColorChange
                Items.Strings = (
                  'Nenhuma'
                  'Ciano'
                  'Preto'
                  'Azul'
                  'F'#250'csia'
                  'Cinza'
                  'Verde'
                  'Lim'#227'o'
                  'Marrom'
                  'Marinho'
                  'Oliva'
                  'Roxo'
                  'Vermelho'
                  'Prata'
                  'Cerceta'
                  'Branco'
                  'Amarelo'
                  'Trigo'
                  'Violeta'
                  'Rosa'
                  'Tomate'
                  'Salm'#227'o'
                  'Laranja'
                  'Ouro')
              end
              object CBCssBorderStyle: TComboBox
                Left = 85
                Top = 21
                Width = 189
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                ItemHeight = 13
                ItemIndex = 0
                TabOrder = 2
                Text = 'None'
                OnChange = CBCssBorderStyleChange
                Items.Strings = (
                  'None'
                  'Dotted'
                  'Dashed'
                  'Solid'
                  'Double'
                  'Groove'
                  'Inset'
                  'Outset')
              end
              object CBCssBorderCollapse: TComboBox
                Left = 85
                Top = 117
                Width = 189
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                ItemHeight = 13
                ItemIndex = 0
                TabOrder = 3
                Text = 'Separate'
                OnChange = CBCssBorderStyleChange
                Items.Strings = (
                  'Separate'
                  'Collapse')
              end
              object TBCssBorderRadius: TTrackBar
                Left = 80
                Top = 152
                Width = 191
                Height = 17
                Anchors = [akLeft, akTop, akRight]
                Max = 100
                TabOrder = 4
                ThumbLength = 10
                TickMarks = tmBoth
                TickStyle = tsNone
                OnChange = TBCssBorderRadiusChange
              end
            end
          end
          object TabSheet15: TTabSheet
            Caption = 'Fundo'
            ImageIndex = 5
            object ScrollBox16: TScrollBox
              Left = 0
              Top = 0
              Width = 295
              Height = 293
              Align = alClient
              BorderStyle = bsNone
              TabOrder = 0
              DesignSize = (
                295
                293)
              object Label30: TLabel
                Left = 36
                Top = 96
                Width = 40
                Height = 13
                Caption = 'Dire'#231#227'o:'
              end
              object Label28: TLabel
                Left = 35
                Top = 59
                Width = 41
                Height = 13
                Caption = 'Cor final:'
              end
              object Label29: TLabel
                Left = 27
                Top = 25
                Width = 48
                Height = 13
                Caption = 'Cor inicial:'
              end
              object CBCssBackgroundDirection: TComboBox
                Left = 88
                Top = 94
                Width = 179
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                ItemHeight = 13
                ItemIndex = 0
                TabOrder = 0
                Text = 'To left'
                OnChange = CBCssBackgroundDirectionChange
                Items.Strings = (
                  'To left'
                  'To right'
                  'To bottom'
                  'To up')
              end
              object CBCssBackgroundColor1: TComboBox
                Left = 88
                Top = 22
                Width = 179
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                ItemHeight = 13
                TabOrder = 1
                Text = 'Transparente'
                OnChange = CBCssBackgroundColor1Change
                Items.Strings = (
                  'Tranparente'
                  'Ciano'
                  'Preto'
                  'Azul'
                  'F'#250'csia'
                  'Cinza'
                  'Verde'
                  'Lim'#227'o'
                  'Marrom'
                  'Marinho'
                  'Oliva'
                  'Roxo'
                  'Vermelho'
                  'Prata'
                  'Cerceta'
                  'Branco'
                  'Amarelo'
                  'Trigo'
                  'Violeta'
                  'Rosa'
                  'Tomate'
                  'Salm'#227'o'
                  'Laranja'
                  'Ouro')
              end
              object CBCssBackgroundColor2: TComboBox
                Left = 88
                Top = 56
                Width = 179
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                ItemHeight = 13
                TabOrder = 2
                Text = 'Transparente'
                OnChange = CBCssBackgroundColor2Change
                Items.Strings = (
                  'Tranparente'
                  'Ciano'
                  'Preto'
                  'Azul'
                  'F'#250'csia'
                  'Cinza'
                  'Verde'
                  'Lim'#227'o'
                  'Marrom'
                  'Marinho'
                  'Oliva'
                  'Roxo'
                  'Vermelho'
                  'Prata'
                  'Cerceta'
                  'Branco'
                  'Amarelo'
                  'Trigo'
                  'Violeta'
                  'Rosa'
                  'Tomate'
                  'Salm'#227'o'
                  'Laranja'
                  'Ouro')
              end
            end
          end
          object TabSheet16: TTabSheet
            Caption = 'Alinhamento'
            ImageIndex = 6
            object ScrollBox17: TScrollBox
              Left = 0
              Top = 0
              Width = 295
              Height = 293
              Align = alClient
              BorderStyle = bsNone
              TabOrder = 0
              DesignSize = (
                295
                293)
              object Label37: TLabel
                Left = 22
                Top = 27
                Width = 50
                Height = 13
                Caption = 'Flutua'#231#227'o:'
              end
              object Label11: TLabel
                Left = 14
                Top = 59
                Width = 62
                Height = 13
                Caption = 'Alinha.Texto:'
              end
              object CBCssFloat: TComboBox
                Left = 88
                Top = 23
                Width = 184
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                ItemHeight = 13
                ItemIndex = 0
                TabOrder = 0
                Text = 'None'
                OnChange = CBCssFloatChange
                Items.Strings = (
                  'None'
                  'Left'
                  'Right')
              end
              object CBCssTextAlign: TComboBox
                Left = 88
                Top = 55
                Width = 184
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                ItemHeight = 13
                ItemIndex = 0
                TabOrder = 1
                Text = 'Left'
                OnChange = CBCssTextAlignChange
                Items.Strings = (
                  'Left'
                  'Right'
                  'Center')
              end
            end
          end
          object TabSheet1: TTabSheet
            Caption = 'Listas'
            ImageIndex = 7
            object ScrollBox1: TScrollBox
              Left = 0
              Top = 0
              Width = 295
              Height = 293
              Align = alClient
              BorderStyle = bsNone
              TabOrder = 0
              DesignSize = (
                295
                293)
              object Label35: TLabel
                Left = 46
                Top = 24
                Width = 30
                Height = 13
                Caption = #205'cone:'
              end
              object CBCssListDtyleType: TComboBox
                Left = 88
                Top = 23
                Width = 184
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                ItemHeight = 13
                TabOrder = 0
                Text = 'Disc'
                OnChange = CBCssListDtyleTypeChange
                Items.Strings = (
                  'Disc'
                  'Circle'
                  'Square'
                  'None'
                  'Inherit')
              end
            end
          end
        end
      end
      object GroupBox4: TGroupBox
        Left = 5
        Top = 8
        Width = 320
        Height = 178
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Atributos'
        TabOrder = 0
        DesignSize = (
          320
          178)
        object PgcAtributos: TPageControl
          Left = 7
          Top = 20
          Width = 304
          Height = 148
          ActivePage = TabTexto
          Anchors = [akLeft, akTop, akRight]
          Style = tsFlatButtons
          TabOrder = 0
          object TabTexto: TTabSheet
            Caption = 'Texto'
            object ScrollBox6: TScrollBox
              Left = 0
              Top = 0
              Width = 296
              Height = 117
              Align = alClient
              BorderStyle = bsNone
              TabOrder = 0
              DesignSize = (
                296
                117)
              object Label14: TLabel
                Left = 7
                Top = 0
                Width = 27
                Height = 13
                Caption = 'Texto'
              end
              object EdAtribTextoTexto: TEdit
                Left = 10
                Top = 15
                Width = 281
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
                OnKeyUp = EdAtribTextoTextoKeyUp
              end
            end
          end
          object TabImagens: TTabSheet
            Caption = 'Imagens'
            ImageIndex = 1
            object ScrollBox3: TScrollBox
              Left = 0
              Top = 0
              Width = 296
              Height = 117
              Align = alClient
              BorderStyle = bsNone
              TabOrder = 0
              DesignSize = (
                296
                117)
              object Label5: TLabel
                Left = 10
                Top = -1
                Width = 74
                Height = 13
                Caption = 'Link da imagem'
              end
              object Label1: TLabel
                Left = 32
                Top = 51
                Width = 30
                Height = 13
                Caption = 'Altura:'
              end
              object Label8: TLabel
                Left = 24
                Top = 78
                Width = 39
                Height = 13
                Caption = 'Largura:'
              end
              object EdAtribImagensLink: TEdit
                Left = 10
                Top = 15
                Width = 281
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
                OnKeyUp = EdAtribImagensLinkKeyUp
              end
              object TBAtribImagensHeight: TTrackBar
                Left = 72
                Top = 50
                Width = 193
                Height = 17
                Anchors = [akLeft, akTop, akRight]
                Max = 500
                TabOrder = 1
                ThumbLength = 10
                TickMarks = tmBoth
                TickStyle = tsNone
                OnChange = TBAtribImagensHeightChange
              end
              object TBAtribImagensWidth: TTrackBar
                Left = 72
                Top = 77
                Width = 193
                Height = 17
                Anchors = [akLeft, akTop, akRight]
                Max = 500
                TabOrder = 2
                ThumbLength = 10
                TickMarks = tmBoth
                TickStyle = tsNone
                OnChange = TBAtribImagensWidthChange
              end
            end
          end
          object TabAcoes: TTabSheet
            Caption = 'A'#231#245'es'
            ImageIndex = 2
            object ScrollBox2: TScrollBox
              Left = 0
              Top = 0
              Width = 296
              Height = 117
              Align = alClient
              BorderStyle = bsNone
              TabOrder = 0
              DesignSize = (
                296
                117)
              object Label6: TLabel
                Left = 10
                Top = -1
                Width = 27
                Height = 13
                Caption = 'Texto'
              end
              object Label10: TLabel
                Left = 10
                Top = 47
                Width = 110
                Height = 13
                Caption = 'Link de direcionamento'
              end
              object EdAtribAcoesTexto: TEdit
                Left = 10
                Top = 15
                Width = 279
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
                OnKeyUp = EdAtribAcoesTextoKeyUp
              end
              object EdAtribAcoesLink: TEdit
                Left = 10
                Top = 63
                Width = 279
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 1
                OnKeyUp = EdAtribAcoesLinkKeyUp
              end
            end
          end
          object TabItemLista: TTabSheet
            Caption = 'Item Lista'
            ImageIndex = 7
            object ScrollBox8: TScrollBox
              Left = 0
              Top = 0
              Width = 296
              Height = 117
              Align = alClient
              BorderStyle = bsNone
              TabOrder = 0
              DesignSize = (
                296
                117)
              object Label7: TLabel
                Left = 10
                Top = -1
                Width = 27
                Height = 13
                Caption = 'Texto'
              end
              object EdAtribItemListaTexto: TEdit
                Left = 10
                Top = 15
                Width = 279
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
                OnKeyUp = EdAtribItemListaTextoKeyUp
              end
            end
          end
          object TabContainers: TTabSheet
            Caption = 'Containers'
            ImageIndex = 9
            object ScrollBox10: TScrollBox
              Left = 0
              Top = 0
              Width = 296
              Height = 117
              Align = alClient
              BorderStyle = bsNone
              TabOrder = 0
              object Label3: TLabel
                Left = 11
                Top = 0
                Width = 85
                Height = 13
                Caption = 'Classe de divis'#227'o:'
              end
              object CbAtribContainersClasse: TComboBox
                Left = 11
                Top = 16
                Width = 262
                Height = 21
                ItemHeight = 13
                ItemIndex = 0
                TabOrder = 0
                Text = 'Nenhuma'
                OnChange = CbAtribContainersClasseChange
                Items.Strings = (
                  'Nenhuma'
                  'Row'
                  'Col'
                  'Jumbotron'
                  'Container')
              end
            end
          end
          object TabLista: TTabSheet
            Caption = 'Lista'
            ImageIndex = 5
            object Label13: TLabel
              Left = 16
              Top = 8
              Width = 23
              Height = 13
              Caption = 'Itens'
            end
            object BtAtribAdicionarItens: TButton
              Left = 104
              Top = 24
              Width = 113
              Height = 25
              Caption = 'Adicionar'
              TabOrder = 0
              OnClick = BtAtribAdicionarItensClick
            end
            object SeAtribQtItens: TSpinEdit
              Left = 16
              Top = 27
              Width = 81
              Height = 22
              MaxValue = 25
              MinValue = 1
              TabOrder = 1
              Value = 1
            end
          end
        end
      end
    end
  end
  object PUpNavegacao: TPopupMenu
    Left = 241
    Top = 536
    object Remover1: TMenuItem
      Caption = 'Remover'
      OnClick = Remover1Click
    end
    object Moverparacima1: TMenuItem
      Caption = 'Mover para cima'
      OnClick = Moverparacima1Click
    end
    object Moverparabaixo1: TMenuItem
      Caption = 'Mover para baixo'
      OnClick = Moverparabaixo1Click
    end
  end
  object MainMenu1: TMainMenu
    Left = 207
    Top = 537
    object Arquivo1: TMenuItem
      Caption = 'Arquivo'
      object Limpar1: TMenuItem
        Caption = 'Novo'
        OnClick = Limpar1Click
      end
      object Salvar1: TMenuItem
        Caption = 'Salvar'
        OnClick = Salvar1Click
      end
    end
    object Adicionar1: TMenuItem
      Caption = 'Adicionar'
      object Itempersonalizado1: TMenuItem
        Caption = 'Layout'
        OnClick = Itempersonalizado1Click
      end
    end
  end
  object TmAtualizarHtml: TTimer
    Enabled = False
    Interval = 400
    OnTimer = TmAtualizarHtmlTimer
    Left = 279
    Top = 537
  end
end
