inherited FRTermo: TFRTermo
  Left = 280
  Top = 78
  VertScrollBar.Position = 203
  Caption = 'FRTermo'
  PixelsPerInch = 96
  TextHeight = 13
  inherited QRPrimario: TQuickRep
    Top = -203
    Width = 816
    Height = 1056
    DataSet = DMEmissaoTermo.QREmissaoTermo
    Font.Height = -16
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Page.Values = (
      50.000000000000000000
      2794.000000000000000000
      60.000000000000000000
      2159.000000000000000000
      50.000000000000000000
      50.000000000000000000
      0.000000000000000000)
    inherited QRBand1: TQRBand
      Width = 778
      Height = 482
      Frame.DrawBottom = False
      Size.Values = (
        1275.291666666667000000
        2058.458333333333000000)
      inherited QRSysData2: TQRSysData
        Height = 19
        Enabled = False
        Size.Values = (
          50.270833333333330000
          1965.854166666667000000
          0.000000000000000000
          68.791666666666660000)
        FontSize = 12
      end
      inherited QRLabel2: TQRLabel
        Width = 41
        Height = 19
        Enabled = False
        Size.Values = (
          50.270833333333330000
          1862.666666666667000000
          0.000000000000000000
          108.479166666666700000)
        FontSize = 12
      end
      inherited QRLTitulo: TQRLabel
        Left = 96
        Top = 2
        Width = 171
        Height = 19
        Enabled = False
        Size.Values = (
          50.270833333333330000
          254.000000000000000000
          5.291666666666667000
          452.437500000000000000)
        FontSize = 12
      end
      inherited QRLEmpresa: TQRLabel
        Width = 81
        Height = 19
        Enabled = False
        Size.Values = (
          50.270833333333330000
          21.166666666666670000
          0.000000000000000000
          214.312500000000000000)
        FontSize = 12
      end
      inherited QRSysData1: TQRSysData
        Left = 522
        Height = 19
        Enabled = False
        Size.Values = (
          50.270833333333330000
          1381.125000000000000000
          42.333333333333340000
          425.979166666666700000)
        FontSize = 12
      end
      object QRLabel3: TQRLabel
        Left = 32
        Top = 296
        Width = 201
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          84.666666666666670000
          783.166666666666700000
          531.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NOME ..............:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLabel4: TQRLabel
        Left = 32
        Top = 336
        Width = 201
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          84.666666666666670000
          889.000000000000000000
          531.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'ENDERE'#199'O...........:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLabel5: TQRLabel
        Left = 32
        Top = 400
        Width = 201
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          84.666666666666670000
          1058.333333333333000000
          531.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'ORGAO DE INSCRI'#199#195'O.:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLabel6: TQRLabel
        Left = 32
        Top = 432
        Width = 201
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          84.666666666666670000
          1143.000000000000000000
          531.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'INSCR. ESTADUAL....:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLabel7: TQRLabel
        Left = 32
        Top = 448
        Width = 201
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          84.666666666666670000
          1185.333333333333000000
          531.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CNPJ...............:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLabel8: TQRLabel
        Left = 32
        Top = 368
        Width = 201
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          84.666666666666670000
          973.666666666666700000
          531.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CEP................:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLabel9: TQRLabel
        Left = 32
        Top = 352
        Width = 201
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          84.666666666666670000
          931.333333333333300000
          531.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'BAIRRO.............:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRDBText2: TQRDBText
        Left = 240
        Top = 336
        Width = 505
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          635.000000000000000000
          889.000000000000000000
          1336.145833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMEmissaoTermo.QREmissaoTermo
        DataField = 'DESC_ENDERECO'
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRDBText5: TQRDBText
        Left = 240
        Top = 432
        Width = 505
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          635.000000000000000000
          1143.000000000000000000
          1336.145833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMEmissaoTermo.QREmissaoTermo
        DataField = 'DESC_INSCRICAO'
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRDBText6: TQRDBText
        Left = 240
        Top = 448
        Width = 505
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          635.000000000000000000
          1185.333333333333000000
          1336.145833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMEmissaoTermo.QREmissaoTermo
        DataField = 'NUM_CGC'
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRDBText7: TQRDBText
        Left = 240
        Top = 368
        Width = 505
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          635.000000000000000000
          973.666666666666900000
          1336.145833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMEmissaoTermo.QREmissaoTermo
        DataField = 'DESC_CEP'
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRDBText8: TQRDBText
        Left = 240
        Top = 352
        Width = 505
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          635.000000000000000000
          931.333333333333500000
          1336.145833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMEmissaoTermo.QREmissaoTermo
        DataField = 'DESC_BAIRRO'
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLOrgao: TQRLabel
        Left = 240
        Top = 400
        Width = 505
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          635.000000000000000000
          1058.333333333333000000
          1336.145833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRLOrgao'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRDBText13: TQRDBText
        Left = 640
        Top = 384
        Width = 105
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1693.333333333333000000
          1016.000000000000000000
          277.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMEmissaoTermo.QREmissaoTermo
        DataField = 'DESC_ESTADO'
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLabel13: TQRLabel
        Left = 584
        Top = 384
        Width = 41
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1545.166666666667000000
          1016.000000000000000000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'UF :'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRDBText15: TQRDBText
        Left = 32
        Top = 152
        Width = 713
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666680000
          84.666666666666680000
          402.166666666666600000
          1886.479166666667000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMEmissaoTermo.QREmissaoTermo
        DataField = 'TITULO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 14
      end
      object QRDBText16: TQRDBText
        Left = 592
        Top = 16
        Width = 153
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1566.333333333333000000
          42.333333333333340000
          404.812500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMEmissaoTermo.QREmissaoTermo
        DataField = 'pag'
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRDBText18: TQRDBText
        Left = 32
        Top = 192
        Width = 713
        Height = 105
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          277.812500000000000000
          84.666666666666680000
          508.000000000000000000
          1886.479166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMEmissaoTermo.QREmissaoTermo
        DataField = 'TEXTO'
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRDBText19: TQRDBText
        Left = 32
        Top = 40
        Width = 713
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666680000
          84.666666666666680000
          105.833333333333300000
          1886.479166666667000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMEmissaoTermo.QREmissaoTermo
        DataField = 'REGISTRO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 14
      end
      object QRDBText20: TQRDBText
        Left = 32
        Top = 64
        Width = 713
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666680000
          84.666666666666680000
          169.333333333333300000
          1886.479166666667000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMEmissaoTermo.QREmissaoTermo
        DataField = 'MODELO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 14
      end
      object QRDBText21: TQRDBText
        Left = 32
        Top = 88
        Width = 713
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666680000
          84.666666666666680000
          232.833333333333400000
          1886.479166666667000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMEmissaoTermo.QREmissaoTermo
        DataField = 'NUM_ORDEM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 14
      end
      object QRDBText22: TQRDBText
        Left = 32
        Top = 112
        Width = 713
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666680000
          84.666666666666680000
          296.333333333333400000
          1886.479166666667000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMEmissaoTermo.QREmissaoTermo
        DataField = 'ULT_LANC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 14
      end
      object QRDBText1: TQRDBText
        Left = 240
        Top = 296
        Width = 505
        Height = 41
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          108.479166666666700000
          635.000000000000000000
          783.166666666666800000
          1336.145833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMEmissaoTermo.QREmissaoTermo
        DataField = 'DESC_FILIAL'
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLabel15: TQRLabel
        Left = 32
        Top = 384
        Width = 201
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          84.666666666666670000
          1016.000000000000000000
          531.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'MUNIC'#205'PIO..........:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRDBText23: TQRDBText
        Left = 240
        Top = 384
        Width = 337
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          635.000000000000000000
          1016.000000000000000000
          891.645833333333200000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMEmissaoTermo.QREmissaoTermo
        DataField = 'DESC_CIDADE'
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLabel10: TQRLabel
        Left = 32
        Top = 416
        Width = 201
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          84.666666666666670000
          1100.666666666667000000
          531.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'N'#176' DA INSCRI'#199#195'O....:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLNumInscricao: TQRLabel
        Left = 240
        Top = 416
        Width = 505
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          635.000000000000000000
          1100.666666666667000000
          1336.145833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRLNumInscricao'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
    end
    inherited QRBand2: TQRBand
      Top = 1009
      Width = 778
      Height = 32
      Frame.DrawTop = False
      Size.Values = (
        84.666666666666670000
        2058.458333333333000000)
      inherited QRLabel1: TQRLabel
        Width = 181
        Height = 19
        Enabled = False
        Size.Values = (
          50.270833333333330000
          21.166666666666670000
          0.000000000000000000
          478.895833333333300000)
        FontSize = 12
      end
      inherited QRLNomeRel: TQRLabel
        Left = 630
        Width = 131
        Height = 19
        Enabled = False
        Size.Values = (
          50.270833333333330000
          1666.875000000000000000
          0.000000000000000000
          346.604166666666700000)
        FontSize = 12
      end
    end
    object z: TQRBand
      Left = 19
      Top = 505
      Width = 778
      Height = 504
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        1333.500000000000000000
        2058.458333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRShape1: TQRShape
        Left = 112
        Top = 200
        Width = 553
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          296.333333333333400000
          529.166666666666800000
          1463.145833333333000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRDBText3: TQRDBText
        Left = 72
        Top = 224
        Width = 641
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          190.500000000000000000
          592.666666666666800000
          1695.979166666667000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMEmissaoTermo.QREmissaoTermo
        DataField = 'FUNC_RESPONSAVEL'
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRDBText4: TQRDBText
        Left = 72
        Top = 208
        Width = 641
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          190.500000000000000000
          550.333333333333400000
          1695.979166666667000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMEmissaoTermo.QREmissaoTermo
        DataField = 'RESPONSAVEL'
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRDBText10: TQRDBText
        Left = 72
        Top = 240
        Width = 641
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          190.500000000000000000
          635.000000000000000000
          1695.979166666667000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMEmissaoTermo.QREmissaoTermo
        DataField = 'CPF_RESPONSAVEL'
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRShape2: TQRShape
        Left = 112
        Top = 432
        Width = 553
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          296.333333333333400000
          1143.000000000000000000
          1463.145833333333000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRDBText11: TQRDBText
        Left = 72
        Top = 440
        Width = 641
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          190.500000000000000000
          1164.166666666667000000
          1695.979166666667000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMEmissaoTermo.QREmissaoTermo
        DataField = 'CONTABILISTA'
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRDBText12: TQRDBText
        Left = 72
        Top = 456
        Width = 641
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          190.500000000000000000
          1206.500000000000000000
          1695.979166666667000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMEmissaoTermo.QREmissaoTermo
        DataField = 'CRC_CONTABILISTA'
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRDBText14: TQRDBText
        Left = 72
        Top = 472
        Width = 641
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          190.500000000000000000
          1248.833333333333000000
          1695.979166666667000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMEmissaoTermo.QREmissaoTermo
        DataField = 'CPF_CONTABILISTA'
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRDBText17: TQRDBText
        Left = 32
        Top = 16
        Width = 713
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          84.666666666666680000
          42.333333333333340000
          1886.479166666667000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMEmissaoTermo.QREmissaoTermo
        DataField = 'local'
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
    end
  end
  inherited QRTextFilter1: TQRTextFilter
    Left = 328
    Top = 8
  end
  inherited QRPDFFilter1: TQRPDFFilter
    Left = 360
    Top = 8
  end
  inherited QRHTMLFilter1: TQRHTMLFilter
    Left = 392
    Top = 8
  end
  inherited QRExcelFilter1: TQRExcelFilter
    Left = 424
    Top = 8
  end
  inherited QRRTFFilter1: TQRRTFFilter
    Left = 456
    Top = 8
  end
end
