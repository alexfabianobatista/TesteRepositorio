inherited FGeraSPED: TFGeraSPED
  Left = 949
  Top = 251
  Width = 418
  Height = 402
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'SPED'
  Constraints.MinHeight = 402
  Constraints.MinWidth = 418
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  inherited PGRelatorio: TPageControl
    Left = 8
    Top = 8
    Width = 393
    Height = 289
    ActivePage = TsContabil
    Align = alNone
    object TsFiscal: TTabSheet
      Caption = 'Fiscal'
      OnShow = TsFiscalShow
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 51
        Height = 14
        Caption = 'Data Inicial'
      end
      object Label2: TLabel
        Left = 96
        Top = 16
        Width = 47
        Height = 14
        Caption = 'Data Final'
      end
      object MeDataIniFiscal: TMaskEdit
        Left = 16
        Top = 32
        Width = 65
        Height = 22
        EditMask = '!99/99/0000;1;_'
        MaxLength = 10
        TabOrder = 0
        Text = '01/01/2009'
      end
      object MeDataFinFiscal: TMaskEdit
        Left = 96
        Top = 32
        Width = 69
        Height = 22
        EditMask = '!99/99/0000;1;_'
        MaxLength = 10
        TabOrder = 1
        Text = '31/01/2009'
      end
      inline FmFilialFiscal: TFmFilial
        Left = 16
        Top = 64
        Width = 273
        Height = 40
        TabOrder = 2
        inherited Label1: TLabel
          Height = 14
        end
        inherited MeFilial: TMaskEdit
          Height = 22
          EditMask = '!999999;0;_'
          Text = '1     '
        end
        inherited EdFilial: TEdit
          Height = 22
          Text = ''
        end
      end
      object RgFinalidade: TRadioGroup
        Left = 16
        Top = 104
        Width = 177
        Height = 65
        Caption = 'Finalidade'
        ItemIndex = 0
        Items.Strings = (
          'Remessa Original'
          'Remessa Substitui'#231#227'o')
        TabOrder = 3
      end
    end
    object TsContabil: TTabSheet
      Caption = 'Cont'#225'bil'
      ImageIndex = 1
      object Label3: TLabel
        Left = 16
        Top = 16
        Width = 51
        Height = 14
        Caption = 'Data Inicial'
      end
      object Label4: TLabel
        Left = 96
        Top = 16
        Width = 47
        Height = 14
        Caption = 'Data Final'
      end
      object Label17: TLabel
        Left = 19
        Top = 179
        Width = 173
        Height = 14
        Caption = 'Outras Informa'#231#245'es (Registro J800)'
      end
      object MeDataIniContabil: TMaskEdit
        Left = 16
        Top = 32
        Width = 64
        Height = 22
        EditMask = '!99/99/0000;1;_'
        MaxLength = 10
        TabOrder = 0
        Text = '01/01/2008'
      end
      object MeDataFinContabil: TMaskEdit
        Left = 96
        Top = 32
        Width = 70
        Height = 22
        EditMask = '!99/99/0000;1;_'
        MaxLength = 10
        TabOrder = 1
        Text = '31/12/2008'
      end
      object PnFilial: TPanel
        Left = 16
        Top = 64
        Width = 369
        Height = 113
        BevelOuter = bvNone
        TabOrder = 2
        object Label5: TLabel
          Left = 272
          Top = 0
          Width = 26
          Height = 14
          Caption = 'Filiais'
        end
        object lblHashSubst: TLabel
          Left = 0
          Top = 85
          Width = 111
          Height = 12
          Caption = 'Hash do Livro substitu'#237'do:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object lblHash: TLabel
          Left = 16
          Top = 96
          Width = 25
          Height = 9
          Caption = 'lblHash'
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = 9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object LbFiliais: TListBox
          Left = 272
          Top = 13
          Width = 81
          Height = 52
          ItemHeight = 14
          TabOrder = 1
        end
        object BtnLimpar: TBitBtn
          Left = 272
          Top = 70
          Width = 81
          Height = 17
          Caption = 'Limpar'
          TabOrder = 2
          OnClick = BtnLimparClick
        end
        inline FmFilialContabil: TFmFilial
          Left = 0
          Top = 0
          Width = 265
          Height = 40
          TabOrder = 0
          inherited Label1: TLabel
            Height = 14
          end
          inherited MeFilial: TMaskEdit
            Width = 42
            Height = 22
            EditMask = '!999999;0;_'
            Text = ''
            OnExit = FmFilialContabilMeFilialExit
          end
          inherited BtFilial: TBitBtn
            OnClick = FmFilialContabilBtFilialClick
          end
          inherited EdFilial: TEdit
            Height = 22
            Text = ''
          end
        end
        object BtnMatriz: TBitBtn
          Left = 272
          Top = 87
          Width = 81
          Height = 17
          Caption = 'Matriz'
          TabOrder = 3
          TabStop = False
          OnClick = BtnMatrizClick
        end
        object RadioGroup1: TRadioGroup
          Left = 0
          Top = 35
          Width = 265
          Height = 46
          Caption = 'Finalidade'
          ItemIndex = 0
          Items.Strings = (
            'Remessa Original'
            'Remessa Substitui'#231#227'o')
          TabOrder = 4
          OnClick = RadioGroup1Click
        end
        object MEHashLivroSubst: TMaskEdit
          Left = 112
          Top = 81
          Width = 153
          Height = 22
          TabOrder = 5
          Visible = False
          OnChange = MEHashLivroSubstChange
          OnExit = MEHashLivroSubstExit
        end
      end
      object lbArquivosRTF: TListBox
        Left = 16
        Top = 200
        Width = 265
        Height = 58
        ItemHeight = 14
        TabOrder = 3
      end
      object btRtfAdd: TBitBtn
        Left = 288
        Top = 184
        Width = 81
        Height = 40
        Hint = 'Adicionar Documento RTF'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = btRtfAddClick
        Glyph.Data = {
          360C0000424D360C000000000000360000002800000020000000200000000100
          180000000000000C0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FEDFC6FA7302FA6C00FA6D00FA6D00FA6D00FA6D00FA6D00FA6D00FA6D00FA6D
          00FA6D00FA6D00FA6D00FA6D00FA6D00FA6C00FA7302FEE0C6FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FA7302FA7B0FFB7E15FB7E15FB7E15FB7E15FB7E15FB7E15FB7E15FB7E15FB7E
          15FB7E15FB7E15FB7E15FB7E15FB7E15FB7E15FA7B0FFA7302FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FA6C00FB7E15FB7E15FB7E15FB7E15FB7E15FB7E15FB7E15FB7E15FB7E15FB7E
          15FB7E15FB7E15FB7E15FB7E15FB7E15FB7E15FB7E15FA6C00FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FA6D00FB7E15FB7E15FB7E15FB7E15FB7E15FB7E15FA7D14FA7404FA6E00FA6D
          00FA6D00FA6D00FA6D00FA6D00FA6D00FA6D00FA6D00FA5D00FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FA6D00FB7E15FB7E15FB7E15FB7E15FB7E15FA7D14FA7100FDD1ADFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FA6D00FB7E15FB7E15FB7E15FB7E15FB7E15FA7404FDD1AEFEEDDFFA7404FA6C
          00FA6D00FA6D00FA6D00FA6D00FA6D00FA6D00FA6D00FA6D00FA6D00FA6D00FA
          6D00FA6D00FA6D00FA6D00FA6D00FA6C00FA7302FEE0C7FFFFFFFFFFFFFFFFFF
          FA6D00FB7E15FB7E15FB7E15FB7E15FB7E15FA6E00FFFFFFFA7404FA7B0FFA6D
          00FB7E15FB7E15FA7505FA7301FB7E15FB7E15FB7E15FA6D00FB7E15FB7E15FB
          7E15FA6D00FB7E15FB7E15FB7E15FB7E15FA7B0FFA7403FFFFFFFFFFFFFFFFFF
          FA6D00FB7E15FB7E15FB7E15FB7E15FB7E15FA6D00FFFFFFFA6C00FA6D00FFFF
          FFFA6D00FA7100FDCCA3FEF5ECFA7301FB7E15FA6D00FFFFFFFA6D00FB7E15FA
          6D00FFFFFFFA6D00FB7E15FB7E15FB7E15FB7E15FA6C00FFFFFFFFFFFFFFFFFF
          FA6D00FB7E15FB7E15FB7E15FB7E15FB7E15FA6D00FFFFFFFA6D00FA6D00FFFF
          FFFA6900FB8B2DFFFFFFFA7404FA7C12FB7E15FA6D00FFFFFFFA6D00FB7E15FA
          6D00FFFFFFFA6D00FB7E15FB7E15FB7E15FB7E15FA6D00FFFFFFFFFFFFFFFFFF
          FA6D00FB7E15FB7E15FB7E15FB7E15FB7E15FA6D00FFFFFFFA6D00FA6D00FFFF
          FFF95600FFFFFFFB933BFA7200FB7E15FB7E15FA6D00FFFFFFFA6D00FB7E15FA
          6D00FFFFFFFA5D00FA6D00FA6D00FB7E15FB7E15FA6D00FFFFFFFFFFFFFFFFFF
          FA6D00FB7E15FB7E15FB7E15FB7E15FB7E15FA6D00FFFFFFFA6D00FA6D00FFFF
          FFFFFFFFFFFFFFFFFFFFFB9D4CFA780BFB7E15FA6D00FFFFFFFA6D00FB7E15FA
          6D00FFFFFFFFFFFFFFFFFFFFFFFFFA6D00FB7E15FA6D00FFFFFFFFFFFFFFFFFF
          FA6D00FB7E15FB7E15FB7E15FB7E15FB7E15FA6D00FFFFFFFA6D00FA6D00FFFF
          FFFA5D00FA6A00FA8625FFFFFFFA6F00FB7E15FA6D00FFFFFFFA6D00FB7E15FA
          6D00FFFFFFFA5D00FA6D00FA6D00FB7E15FB7E15FA6D00FFFFFFFFFFFFFFFFFF
          FA6D00FB7E15FB7E15FB7E15FB7E15FB7E15FA6D00FFFFFFFA6D00FA6D00FFFF
          FFFA5D00FA6A00FA8624FFFFFFFA6F00FA6D00FA5D00FFFFFFFA5D00FA6D00FA
          6D00FFFFFFFA5D00FA6D00FA6D00FA6D00FB7E15FA6D00FFFFFFFFFFFFFFFFFF
          FA6D00FB7E15FB7E15FB7E15FB7E15FB7E15FA6D00FFFFFFFA6C00FA6D00FFFF
          FFFFFFFFFFFFFFFFFFFFFB9D4DFA6800FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA
          5D00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA6D00FA6C00FFFFFFFFFFFFFFFFFF
          FA6D00FB7E15FB7E15FB7E15FB7E15FB7E15FA6E00FFFFFFFA7403FA7B10FA6D
          00FA6D00FA6D00FA6F00FA780BFB7E15FA6D00FA6D00FA6D00FA6D00FA6D00FB
          7E15FA6D00FA6D00FA6D00FA6D00FA6D00FA7B0FFA7302FFFFFFFFFFFFFFFFFF
          FA6D00FB7E15FB7E15FB7E15FB7E15FB7E15FA7404FDD2AEFEECDDFA7403FA6C
          00FA6D00FA6D00FA6D00FA6D00FA6D00FA6D00FA6D00FA6D00FA6D00FA6D00FA
          6D00FA6D00FA6D00FA6D00FA6D00FA6C00FA7302FEDFC6FFFFFFFFFFFFFFFFFF
          FA6D00FB7E15FB7E15FB7E15FB7E15FB7E15FA7D14FA7100FDD2AEFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FA6D00FB7E15FB7E15FB7E15FB7E15FB7E15FB7E15FA7D14FA7404FA6E00FA6D
          00FA6D00FA6D00FA6D00FA6D00FA6D00FA6D00FA6D00FA5D00FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FA6D00FB7E15FB7E15FB7E15FB7E15FB7E15FB7E15FB7E15FB7E15FB7E15FB7E
          15FB7E15FA780BFA6F00FA6D00FA6D00FA6D00FA6D00FA5D00FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FA6D00FB7E15FB7E15FB7E15FB7E15FB7E15FB7E15FB7E15FB7E15FB7E15FB7E
          15FA780BFB9C4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FA6D00FB7E15FB7E15FB7E15FB7E15FB7E15FB7E15FB7E15FB7E15FB7E15FB7E
          15FA6F00FFFFFFFA8A2BFA6A00FA6D00FA6D00FA6200FCA054FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FA6D00FB7E15FB7E15FB7E15FB7E15FB7E15FB7E15FB7E15FB7E15FB7E15FB7E
          15FA6D00FFFFFFFA6A00FB7E15FB7E15FA7606FB9844FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FA6D00FB7E15FB7E15FB7E15FB7E15FB7E15FB7E15FB7E15FB7E15FB7E15FB7E
          15FA6D00FFFFFFFA6D00FB7E15FA790CFA8421FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FA6D00FB7E15FB7E15FB7E15FB7E15FB7E15FB7E15FB7E15FB7E15FB7E15FB7E
          15FA6D00FFFFFFFA6D00FA7B10FA7708FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FA6C00FB7E15FB7E15FB7E15FB7E15FB7E15FB7E15FB7E15FB7E15FB7E15FB7E
          15FA6D00FFFFFFFA6C00FA6E00FEF8F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FA7302FA7B0FFB7E15FB7E15FB7E15FB7E15FB7E15FB7E15FB7E15FB7E15FB7E
          15FA6D00FFFFFFF95B00FEE4CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FEDFC6FA7302FA6C00FA6D00FA6D00FA6D00FA6D00FA6D00FA6D00FA6D00FA6D
          00FA5D00FFFFFFFCBC85FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        Layout = blGlyphTop
      end
      object btRtfLimpar: TBitBtn
        Left = 288
        Top = 227
        Width = 81
        Height = 30
        Hint = 'Limpar Todos os Documentos'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = btRtfLimparClick
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F0F0F0F0
          F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDADADA767676
          343434252525252525333333757575D8D8D8FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9B
          9B9B262626252525252525252525252525252525252525282828969696FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF9A9A9A2525256161612B2B2B2525252525252525252525252828285C
          5C5C252525959595FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFD9D9D9282828606060FDFDFDBFBFBF2B2B2B2525252525
          25282828B5B5B5FDFDFD606060272727D6D6D6FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF767676252525282828BCBCBCFFFFFF
          BFBFBF2B2B2B282828B5B5B5FFFFFFBBBBBB272727252525727272FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF34343425252525
          2525282828BCBCBCFFFFFFBFBFBFB5B5B5FFFFFFBBBBBB272727252525252525
          333333FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2
          F2252525252525252525252525282828BCBCBCFFFFFFFFFFFFBBBBBB27272725
          2525252525252525252525ECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFF1F1F1252525252525252525252525282828B2B2B2FFFFFFFFFF
          FFBFBFBF2B2B2B252525252525252525252525EBEBEBFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333252525252525282828B3B3B3
          FFFFFFBCBCBCBCBCBCFFFFFFBFBFBF2B2B2B252525252525323232FEFEFEFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF75757525252528
          2828B4B4B4FFFFFFBCBCBC282828282828BCBCBCFFFFFFBFBFBF2B2B2B252525
          707070FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFD8D8D82828285C5C5CFDFDFDBCBCBC282828252525252525282828BCBCBCFD
          FDFD5E5E5E272727D4D4D4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF9696962525255D5D5D2828282525252525252525
          252525252828285D5D5D252525929292FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969696272727252525
          252525252525252525252525252525272727919191FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFD5D5D57070703232322525252525252E2E2E6F6F6FD3D3D3FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEECECECEBEBEBFEFEFEFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        Layout = blGlyphBottom
      end
    end
    object TsPisCofins: TTabSheet
      Caption = 'PIS/Cofins'
      ImageIndex = 2
      OnShow = TsPisCofinsShow
      object Label6: TLabel
        Left = 16
        Top = 16
        Width = 51
        Height = 14
        Caption = 'Data Inicial'
      end
      object Label7: TLabel
        Left = 96
        Top = 16
        Width = 47
        Height = 14
        Caption = 'Data Final'
      end
      object MeDataIniPisCofins: TMaskEdit
        Left = 16
        Top = 32
        Width = 62
        Height = 22
        EditMask = '!99/99/0000;1;_'
        MaxLength = 10
        TabOrder = 0
        Text = '01/01/2011'
      end
      object MeDataFinPisCofins: TMaskEdit
        Left = 96
        Top = 32
        Width = 68
        Height = 22
        EditMask = '!99/99/0000;1;_'
        MaxLength = 10
        TabOrder = 1
        Text = '31/01/2011'
      end
      object Panel1: TPanel
        Left = 16
        Top = 64
        Width = 369
        Height = 139
        BevelOuter = bvNone
        TabOrder = 2
        object Label8: TLabel
          Left = 272
          Top = -2
          Width = 94
          Height = 14
          Caption = 'Filiais Selecionadas'
        end
        object Label9: TLabel
          Left = 0
          Top = 84
          Width = 74
          Height = 14
          Caption = 'Recibo Anterior'
        end
        object lbFiliaisPisCofins: TListBox
          Left = 272
          Top = 14
          Width = 81
          Height = 89
          ItemHeight = 14
          TabOrder = 2
        end
        object btnLimparPisCofins: TBitBtn
          Left = 272
          Top = 102
          Width = 81
          Height = 17
          Caption = 'Limpar'
          TabOrder = 4
          TabStop = False
          OnClick = btnLimparPisCofinsClick
        end
        inline FmFilialPisCofins: TFmFilial
          Left = 0
          Top = 0
          Width = 265
          Height = 40
          TabOrder = 0
          inherited Label1: TLabel
            Height = 14
          end
          inherited MeFilial: TMaskEdit
            Width = 42
            Height = 22
            EditMask = '!999999;0;_'
            Text = ''
            OnExit = FmFilialPisCofinsMeFilialExit
          end
          inherited BtFilial: TBitBtn
            OnClick = FmFilialPisCofinsBtFilialClick
          end
          inherited EdFilial: TEdit
            Height = 22
            Text = ''
          end
        end
        object btnMatrizPisCofins: TBitBtn
          Left = 272
          Top = 119
          Width = 81
          Height = 17
          Caption = 'Matriz'
          TabOrder = 5
          TabStop = False
          OnClick = ik
        end
        object RGFinalidadePisCofins: TRadioGroup
          Left = 0
          Top = 42
          Width = 265
          Height = 39
          Caption = 'Finalidade'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Remessa Original'
            'Remessa Retifica'#231#227'o')
          TabOrder = 1
          OnClick = RGFinalidadePisCofinsClick
        end
        object MERecAnterior: TMaskEdit
          Left = 0
          Top = 100
          Width = 265
          Height = 22
          Enabled = False
          TabOrder = 3
          OnExit = MERecAnteriorExit
        end
      end
      object cbxBlocoP: TCheckBox
        Left = 16
        Top = 240
        Width = 97
        Height = 17
        Caption = 'Gerar Bloco P'
        TabOrder = 3
      end
    end
    object TsFCont: TTabSheet
      Caption = 'FCont'
      ImageIndex = 3
      object Label10: TLabel
        Left = 16
        Top = 16
        Width = 51
        Height = 14
        Caption = 'Data Inicial'
      end
      object Label11: TLabel
        Left = 96
        Top = 16
        Width = 47
        Height = 14
        Caption = 'Data Final'
      end
      object MeDataIniFCont: TMaskEdit
        Left = 16
        Top = 32
        Width = 60
        Height = 22
        EditMask = '!99/99/0000;1;_'
        MaxLength = 10
        TabOrder = 0
        Text = '01/01/2011'
      end
      object MeDataFinFCont: TMaskEdit
        Left = 96
        Top = 32
        Width = 68
        Height = 22
        EditMask = '!99/99/0000;1;_'
        MaxLength = 10
        TabOrder = 1
        Text = '31/01/2011'
      end
      object Panel2: TPanel
        Left = 16
        Top = 64
        Width = 369
        Height = 139
        BevelOuter = bvNone
        TabOrder = 2
        object Label12: TLabel
          Left = 272
          Top = -2
          Width = 94
          Height = 14
          Caption = 'Filiais Selecionadas'
        end
        object Label13: TLabel
          Left = 0
          Top = 84
          Width = 74
          Height = 14
          Caption = 'Recibo Anterior'
        end
        object lbReciboLength: TLabel
          Left = 189
          Top = 123
          Width = 74
          Height = 14
          Caption = 'lbReciboLength'
          Visible = False
        end
        object lblFiliaisFCont: TListBox
          Left = 272
          Top = 14
          Width = 81
          Height = 89
          ItemHeight = 14
          TabOrder = 2
        end
        object btnLimparFCont: TBitBtn
          Left = 272
          Top = 102
          Width = 81
          Height = 17
          Caption = 'Limpar'
          TabOrder = 4
          TabStop = False
          OnClick = btnLimparFContClick
        end
        inline FmFilialFCont: TFmFilial
          Left = 0
          Top = 0
          Width = 265
          Height = 40
          TabOrder = 0
          inherited Label1: TLabel
            Height = 14
          end
          inherited MeFilial: TMaskEdit
            Width = 42
            Height = 22
            EditMask = '!999999;0;_'
            Text = ''
            OnExit = FmFilialFContMeFilialExit
          end
          inherited BtFilial: TBitBtn
            OnClick = FmFilialFContBtFilialClick
          end
          inherited EdFilial: TEdit
            Height = 22
            Text = ''
          end
        end
        object btnMatrizFCont: TBitBtn
          Left = 272
          Top = 119
          Width = 81
          Height = 17
          Caption = 'Matriz'
          TabOrder = 5
          TabStop = False
          OnClick = btnMatrizFContClick
        end
        object RGFinalidadeFCont: TRadioGroup
          Left = 0
          Top = 42
          Width = 265
          Height = 39
          Caption = 'Finalidade'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Remessa Original'
            'Remessa Retifica'#231#227'o')
          TabOrder = 1
          OnClick = RGFinalidadeFContClick
        end
        object MEFContRecAnterior: TMaskEdit
          Left = 0
          Top = 100
          Width = 265
          Height = 22
          Color = clBtnFace
          Enabled = False
          TabOrder = 3
          OnChange = MEFContRecAnteriorChange
          OnExit = MEFContRecAnteriorExit
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'ECF'
      ImageIndex = 4
      object Label14: TLabel
        Left = 16
        Top = 16
        Width = 51
        Height = 14
        Caption = 'Data Inicial'
      end
      object Label15: TLabel
        Left = 96
        Top = 16
        Width = 47
        Height = 14
        Caption = 'Data Final'
      end
      object Label16: TLabel
        Left = 288
        Top = 62
        Width = 94
        Height = 14
        Caption = 'Filiais Selecionadas'
      end
      object MeDataIniECF: TMaskEdit
        Left = 16
        Top = 32
        Width = 65
        Height = 22
        EditMask = '!00/00/0000;1;_'
        MaxLength = 10
        TabOrder = 0
        Text = '  /  /    '
      end
      object MeDataFinECF: TMaskEdit
        Left = 96
        Top = 32
        Width = 66
        Height = 22
        EditMask = '!00/00/0000;1;_'
        MaxLength = 10
        TabOrder = 1
        Text = '  /  /    '
      end
      inline FmFilialECF: TFmFilial
        Left = 16
        Top = 64
        Width = 265
        Height = 40
        TabOrder = 2
        inherited Label1: TLabel
          Height = 14
        end
        inherited MeFilial: TMaskEdit
          Width = 42
          Height = 22
          EditMask = '!999999;0;_'
          Text = ''
          OnExit = FmFilialECFMeFilialExit
        end
        inherited EdFilial: TEdit
          Height = 22
          Text = ''
        end
      end
      object lblFiliaisECF: TListBox
        Left = 288
        Top = 78
        Width = 81
        Height = 89
        ItemHeight = 14
        TabOrder = 3
      end
      object btnLimparECF: TBitBtn
        Left = 288
        Top = 166
        Width = 81
        Height = 17
        Caption = 'Limpar'
        TabOrder = 4
        TabStop = False
        OnClick = btnLimparECFClick
      end
      object btnMatrizECF: TBitBtn
        Left = 288
        Top = 183
        Width = 81
        Height = 17
        Caption = 'Matriz'
        TabOrder = 5
        TabStop = False
        OnClick = btnMatrizECFClick
      end
    end
  end
  inherited BtOk: TBitBtn
    Top = 336
  end
  inherited BtCancela: TBitBtn
    Top = 336
  end
  inherited RGPreview: TRadioGroup
    Top = 304
    Visible = False
  end
end
