inherited FRVerbaRepresentante: TFRVerbaRepresentante
  Left = 260
  Top = 170
  Caption = 'FRVerbaRepresentante'
  PixelsPerInch = 96
  TextHeight = 13
  inherited QRPrimario: TQuickRep
    DataSet = DMVerbaRepresentante.QRVerbaRepresentante
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
      Height = 66
      Size.Values = (
        174.625000000000000000
        2058.458333333333000000)
      inherited QRSysData2: TQRSysData
        Size.Values = (
          44.979166666666670000
          1965.854166666667000000
          0.000000000000000000
          68.791666666666660000)
        FontSize = 10
      end
      inherited QRLabel2: TQRLabel
        Size.Values = (
          44.979166666666670000
          1862.666666666667000000
          0.000000000000000000
          87.312500000000000000)
        FontSize = 10
      end
      inherited QRLTitulo: TQRLabel
        Width = 265
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          47.625000000000000000
          701.145833333333400000)
        Caption = 'Relat'#243'rio Verba por Representante'
        FontSize = 10
      end
      inherited QRLEmpresa: TQRLabel
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          0.000000000000000000
          171.979166666666700000)
        FontSize = 10
      end
      inherited QRSysData1: TQRSysData
        Size.Values = (
          44.979166666666670000
          1613.958333333333000000
          42.333333333333330000
          425.979166666666700000)
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 8
        Top = 46
        Width = 105
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          121.708333333333300000
          277.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Representante'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLMes: TQRLabel
        Left = 256
        Top = 32
        Width = 42
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          677.333333333333400000
          84.666666666666680000
          111.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRLMes'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLAno: TQRLabel
        Left = 308
        Top = 32
        Width = 49
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          814.916666666666800000
          84.666666666666680000
          129.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLAno'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel4: TQRLabel
        Left = 299
        Top = 32
        Width = 9
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          791.104166666666800000
          84.666666666666680000
          23.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '/'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 576
        Top = 46
        Width = 41
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1524.000000000000000000
          121.708333333333300000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Valor'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    inherited QRBand2: TQRBand
      Top = 153
      Size.Values = (
        148.166666666666700000
        2058.458333333333000000)
      inherited QRLabel1: TQRLabel
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          0.000000000000000000
          383.645833333333400000)
        FontSize = 10
      end
      inherited QRLNomeRel: TQRLabel
        Size.Values = (
          44.979166666666670000
          1735.666666666667000000
          0.000000000000000000
          277.812500000000000000)
        FontSize = 10
      end
    end
    object QRBand3: TQRBand
      Left = 19
      Top = 89
      Width = 778
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        2058.458333333333000000)
      BandType = rbDetail
      object QRDBText1: TQRDBText
        Left = 88
        Top = 3
        Width = 417
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          232.833333333333400000
          7.937500000000000000
          1103.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMVerbaRepresentante.QRVerbaRepresentante
        DataField = 'NOME'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText2: TQRDBText
        Left = 512
        Top = 3
        Width = 105
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1354.666666666667000000
          7.937500000000000000
          277.812500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMVerbaRepresentante.QRVerbaRepresentante
        DataField = 'VAL_VERBA'
        Mask = '#,##0.00'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText3: TQRDBText
        Left = 10
        Top = 3
        Width = 71
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          26.458333333333330000
          7.937500000000000000
          187.854166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMVerbaRepresentante.QRVerbaRepresentante
        DataField = 'COD_VENDEDOR'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRBand4: TQRBand
      Left = 19
      Top = 113
      Width = 778
      Height = 40
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        2058.458333333333000000)
      BandType = rbSummary
      object QRLabel6: TQRLabel
        Left = 88
        Top = 8
        Width = 89
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          232.833333333333400000
          21.166666666666670000
          235.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total Verba'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRExpr1: TQRExpr
        Left = 456
        Top = 8
        Width = 161
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1206.500000000000000000
          21.166666666666670000
          425.979166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'sum(QRVerbaRepresentante.Val_Verba)'
        Mask = '#,##0.00'
        FontSize = 10
      end
    end
  end
  inherited QRTextFilter1: TQRTextFilter
    Left = 144
    Top = 248
  end
end
