inherited FRTermoDiario: TFRTermoDiario
  Left = 280
  Top = 78
  Width = 856
  Height = 574
  VertScrollBar.Position = 520
  Caption = 'FRTermoDiario'
  PixelsPerInch = 96
  TextHeight = 13
  inherited QRPrimario: TQuickRep
    Top = -520
    Width = 816
    Height = 1056
    DataSet = DMTermoAbertura.QRTermo
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
      Height = 466
      Frame.DrawBottom = False
      Size.Values = (
        1232.958333333333000000
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
        Width = 171
        Height = 19
        Enabled = False
        Size.Values = (
          50.270833333333330000
          21.166666666666670000
          47.625000000000000000
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
        Height = 19
        Enabled = False
        Size.Values = (
          50.270833333333330000
          1613.958333333333000000
          42.333333333333340000
          425.979166666666700000)
        FontSize = 12
      end
      object QRLabel3: TQRLabel
        Left = 32
        Top = 320
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
          846.666666666666700000
          531.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Empresa............:'
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
        Caption = 'Endereco...........:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLabel5: TQRLabel
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
        Caption = 'Orgao de Inscricao.:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLabel6: TQRLabel
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
        Caption = 'Inscr. Estadual....:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLabel7: TQRLabel
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
        Caption = 'Bairro.............:'
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
        Caption = 'Cidade.............:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLabel10: TQRLabel
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
        Caption = 'No da Inscricao....:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRDBText1: TQRDBText
        Left = 240
        Top = 320
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
          846.666666666666600000
          1336.145833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMTermoAbertura.QRTermo
        DataField = 'DESC_FILIAL'
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
        DataSet = DMTermoAbertura.QRTermo
        DataField = 'DESC_ENDERECO'
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRDBText5: TQRDBText
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
        Color = clWhite
        DataSet = DMTermoAbertura.QRTermo
        DataField = 'DESC_INSCRICAO'
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRDBText6: TQRDBText
        Left = 240
        Top = 384
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
          1016.000000000000000000
          1336.145833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMTermoAbertura.QRTermo
        DataField = 'NUM_CGC'
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRDBText7: TQRDBText
        Left = 240
        Top = 368
        Width = 289
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
          764.645833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMTermoAbertura.QRTermo
        DataField = 'DESC_BAIRRO'
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
        DataSet = DMTermoAbertura.QRTermo
        DataField = 'DESC_CIDADE'
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLOrgao: TQRLabel
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
        Caption = 'QRLOrgao'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLNumInscricao: TQRLabel
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
        Caption = 'QRLNumInscricao'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRDBText13: TQRDBText
        Left = 592
        Top = 368
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
          973.666666666666900000
          404.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMTermoAbertura.QRTermo
        DataField = 'DESC_CEP'
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLabel13: TQRLabel
        Left = 536
        Top = 368
        Width = 51
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1418.166666666667000000
          973.666666666666700000
          134.937500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CEP :'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRDBText15: TQRDBText
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
        DataSet = DMTermoAbertura.QRTermo
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
        Top = 40
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
          105.833333333333300000
          404.812500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'pag'
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRDBText18: TQRDBText
        Left = 32
        Top = 96
        Width = 713
        Height = 209
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          552.979166666666800000
          84.666666666666680000
          254.000000000000000000
          1886.479166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMTermoAbertura.QRTermo
        DataField = 'TEXTO'
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
    end
    inherited QRBand2: TQRBand
      Top = 993
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
    object QRBand3: TQRBand
      Left = 19
      Top = 489
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
      object QRDBTFuncao: TQRDBText
        Left = 80
        Top = 240
        Width = 641
        Height = 19
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          211.666666666666700000
          635.000000000000000000
          1695.979166666667000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'FUNC_RESPONSAVEL'
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
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
        DataSet = DMTermoAbertura.QRTermo
        DataField = 'DESC_FILIAL'
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRDBText4: TQRDBText
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
        DataSet = DMTermoAbertura.QRTermo
        DataField = 'RESPONSAVEL'
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRDBText9: TQRDBText
        Left = 192
        Top = 240
        Width = 201
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          508.000000000000000000
          635.000000000000000000
          531.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMTermoAbertura.QRTermo
        DataField = 'CI_RESPONSAVEL'
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLabel11: TQRLabel
        Left = 136
        Top = 240
        Width = 51
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          359.833333333333300000
          635.000000000000000000
          134.937500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'C.I.:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRDBText10: TQRDBText
        Left = 440
        Top = 240
        Width = 209
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1164.166666666667000000
          635.000000000000000000
          552.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMTermoAbertura.QRTermo
        DataField = 'CPF_RESPONSAVEL'
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLabel12: TQRLabel
        Left = 400
        Top = 240
        Width = 41
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1058.333333333333000000
          635.000000000000000000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CPF:'
        Color = clWhite
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
        DataSet = DMTermoAbertura.QRTermo
        DataField = 'CONTABILISTA'
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRDBText14: TQRDBText
        Left = 360
        Top = 480
        Width = 209
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          952.500000000000000000
          1270.000000000000000000
          552.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMTermoAbertura.QRTermo
        DataField = 'CPF_CONTABILISTA'
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLabel14: TQRLabel
        Left = 288
        Top = 478
        Width = 71
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          762.000000000000000000
          1264.708333333333000000
          187.854166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CPF/MF:'
        Color = clWhite
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
        DataSet = DMTermoAbertura.QRTermo
        DataField = 'local'
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRDBText12: TQRDBText
        Left = 288
        Top = 459
        Width = 273
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          762.000000000000000000
          1214.437500000000000000
          722.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMTermoAbertura.QRTermo
        DataField = 'CRC_CONTABILISTA'
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
    end
  end
  inherited QRTextFilter1: TQRTextFilter
    Left = 328
    Top = 40
  end
  inherited QRPDFFilter1: TQRPDFFilter
    Left = 360
    Top = 40
  end
  inherited QRHTMLFilter1: TQRHTMLFilter
    Left = 392
    Top = 40
  end
  inherited QRExcelFilter1: TQRExcelFilter
    Left = 424
    Top = 40
  end
  inherited QRRTFFilter1: TQRRTFFilter
    Left = 456
    Top = 40
  end
end
