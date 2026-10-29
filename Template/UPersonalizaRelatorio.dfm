object FPersonalizaRelatorio: TFPersonalizaRelatorio
  Left = 374
  Top = 122
  Width = 742
  Height = 520
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Personaliza'#231#227'o de Relat'#243'rio de Consulta'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    726
    482)
  PixelsPerInch = 96
  TextHeight = 13
  object LConsulta: TLabel
    Left = 8
    Top = 8
    Width = 41
    Height = 13
    Caption = 'Consulta'
  end
  object Label3: TLabel
    Left = 8
    Top = 448
    Width = 128
    Height = 13
    Cursor = crArrow
    Caption = 'Excluir esta personaliza'#231#227'o'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentColor = False
    ParentFont = False
    OnClick = Label3Click
  end
  object BtnOk: TBitBtn
    Left = 612
    Top = 436
    Width = 105
    Height = 41
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    TabOrder = 0
    OnClick = BtnOkClick
  end
  object BtnCancelar: TBitBtn
    Left = 500
    Top = 436
    Width = 105
    Height = 41
    Anchors = [akRight, akBottom]
    Caption = 'Cancelar'
    TabOrder = 1
    OnClick = BtnCancelarClick
  end
  object PcRelatorio: TPageControl
    Left = 8
    Top = 56
    Width = 717
    Height = 372
    ActivePage = TsCampos
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    object TsCampos: TTabSheet
      Caption = 'Campos'
      DesignSize = (
        709
        344)
      object Label1: TLabel
        Left = 8
        Top = 264
        Width = 79
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = 'T'#237'tulo da Caluna'
      end
      object Label2: TLabel
        Left = 248
        Top = 264
        Width = 36
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = 'Largura'
      end
      object GbCamposSelecionados: TGroupBox
        Left = 8
        Top = 8
        Width = 325
        Height = 249
        Anchors = [akLeft, akTop, akBottom]
        Caption = 'Campos Selecionados'
        TabOrder = 0
        object LCamposSelecionados: TListBox
          Left = 2
          Top = 15
          Width = 321
          Height = 232
          Align = alClient
          ItemHeight = 13
          TabOrder = 0
          OnClick = LCamposSelecionadosClick
          OnKeyPress = LCamposSelecionadosKeyPress
        end
      end
      object GbOutrosCampos: TGroupBox
        Left = 376
        Top = 8
        Width = 325
        Height = 329
        Anchors = [akLeft, akTop, akBottom]
        Caption = 'Outros Campos'
        TabOrder = 1
        object LOutrosCampos: TListBox
          Left = 2
          Top = 15
          Width = 321
          Height = 312
          Align = alClient
          ItemHeight = 13
          TabOrder = 0
        end
      end
      object BtnAdiciona: TBitBtn
        Left = 343
        Top = 24
        Width = 25
        Height = 25
        Caption = '<'
        TabOrder = 2
        OnClick = BtnAdicionaClick
      end
      object BtnTira: TBitBtn
        Left = 343
        Top = 51
        Width = 25
        Height = 25
        Caption = '>'
        TabOrder = 3
        OnClick = BtnTiraClick
      end
      object BtnAdicionaTudo: TBitBtn
        Left = 343
        Top = 78
        Width = 25
        Height = 25
        Caption = '<<'
        TabOrder = 4
        OnClick = BtnAdicionaTudoClick
      end
      object BtnTiraTudo: TBitBtn
        Left = 343
        Top = 106
        Width = 25
        Height = 25
        Caption = '>>'
        TabOrder = 5
        OnClick = BtnTiraTudoClick
      end
      object ETituloCampo: TEdit
        Left = 8
        Top = 280
        Width = 233
        Height = 21
        Anchors = [akLeft, akBottom]
        TabOrder = 6
      end
      object ELarguraCampo: TEdit
        Left = 248
        Top = 280
        Width = 81
        Height = 21
        Anchors = [akLeft, akBottom]
        TabOrder = 7
      end
      object BitBtn1: TBitBtn
        Left = 304
        Top = 306
        Width = 25
        Height = 25
        Hint = 'Gravar'
        Anchors = [akLeft, akBottom]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        OnClick = BitBtn1Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
          7700333333337777777733333333008088003333333377F73377333333330088
          88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
          000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
          FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
          99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        NumGlyphs = 2
      end
      object RgAlinCampo: TRadioGroup
        Left = 8
        Top = 304
        Width = 137
        Height = 33
        Anchors = [akLeft, akBottom]
        Caption = 'Alinhamento'
        Columns = 3
        Items.Strings = (
          'Esq'
          'Cent'
          'Dir')
        TabOrder = 9
      end
    end
    object TsOutras: TTabSheet
      Caption = 'Outras Op'#231#245'es'
      ImageIndex = 1
      DesignSize = (
        709
        344)
      object CbData: TCheckBox
        Left = 8
        Top = 80
        Width = 129
        Height = 17
        Caption = 'Mostrar Data e Hora'
        TabOrder = 0
      end
      object CbNumPagina: TCheckBox
        Left = 8
        Top = 96
        Width = 153
        Height = 17
        Caption = 'Mostrar N'#250'mero de P'#225'gina'
        TabOrder = 1
      end
      object GbTitulo: TGroupBox
        Left = 8
        Top = 8
        Width = 693
        Height = 65
        Anchors = [akLeft, akTop, akRight]
        Caption = 'T'#237'tulo'
        TabOrder = 2
        DesignSize = (
          693
          65)
        object CbTitulo: TCheckBox
          Left = 8
          Top = 16
          Width = 97
          Height = 17
          Caption = 'Mostrar T'#237'tulo'
          TabOrder = 0
        end
        object ETitulo: TEdit
          Left = 8
          Top = 32
          Width = 677
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
      end
      object CbPublico: TCheckBox
        Left = 8
        Top = 112
        Width = 153
        Height = 17
        Caption = 'Relat'#243'rio P'#250'blico'
        TabOrder = 3
      end
      object RGOrientacao: TRadioGroup
        Left = 544
        Top = 80
        Width = 157
        Height = 41
        Caption = 'Orienta'#231#227'o do relat'#243'rio'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Retrato'
          'Paisagem')
        TabOrder = 4
      end
    end
  end
  object EConsulta: TEdit
    Left = 8
    Top = 24
    Width = 361
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 3
  end
end
