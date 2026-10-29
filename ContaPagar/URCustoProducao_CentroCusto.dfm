inherited FRCustoProducao_CentroCusto: TFRCustoProducao_CentroCusto
  Left = 243
  Top = 174
  Width = 1154
  HorzScrollBar.Position = 0
  Caption = 'FRCustoProducao_CentroCusto'
  PixelsPerInch = 96
  TextHeight = 13
  inherited QRPrimario: TQuickRep
    Left = 0
    Width = 1111
    Height = 1572
    DataSet = DMContasPagarRel.QrCustosProducao
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Page.Values = (
      50.000000000000000000
      2970.000000000000000000
      60.000000000000000000
      2100.000000000000000000
      50.000000000000000000
      50.000000000000000000
      0.000000000000000000)
    Zoom = 140
    inherited QRBand1: TQRBand
      Left = 26
      Top = 32
      Width = 1058
      Height = 54
      Size.Values = (
        102.053571428571400000
        1999.494047619048000000)
      inherited QRSysData2: TQRSysData
        Left = 1040
        Width = 36
        Height = 24
        Size.Values = (
          44.979166666666670000
          1965.854166666667000000
          0.000000000000000000
          68.791666666666670000)
        FontSize = 10
      end
      inherited QRLabel2: TQRLabel
        Left = 986
        Width = 46
        Height = 24
        Size.Values = (
          45.357142857142860000
          1863.422619047619000000
          0.000000000000000000
          86.934523809523810000)
        FontSize = 10
      end
      inherited QRLTitulo: TQRLabel
        Left = 12
        Top = 26
        Width = 192
        Height = 23
        Size.Values = (
          43.467261904761900000
          22.678571428571430000
          49.136904761904760000
          362.857142857142900000)
        Caption = 'Custo de Produ'#231#227'o'
        FontSize = 10
      end
      inherited QRLEmpresa: TQRLabel
        Left = 12
        Width = 91
        Height = 23
        Size.Values = (
          43.467261904761900000
          22.678571428571430000
          0.000000000000000000
          171.979166666666700000)
        FontSize = 10
      end
      inherited QRSysData1: TQRSysData
        Left = 854
        Top = 22
        Width = 225
        Height = 24
        Size.Values = (
          44.979166666666670000
          1613.958333333333000000
          42.333333333333330000
          425.979166666666700000)
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 376
        Top = 24
        Width = 91
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          43.467261904761900000
          710.595238095238100000
          45.357142857142860000
          171.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLabel5'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    inherited QRBand2: TQRBand
      Left = 26
      Top = 281
      Width = 1058
      Height = 55
      Size.Values = (
        103.943452380952400000
        1999.494047619048000000)
      inherited QRLabel1: TQRLabel
        Left = 12
        Width = 203
        Height = 23
        Size.Values = (
          43.467261904761900000
          22.678571428571430000
          0.000000000000000000
          383.645833333333300000)
        FontSize = 10
      end
      inherited QRLNomeRel: TQRLabel
        Left = 910
        Width = 147
        Height = 23
        Size.Values = (
          43.467261904761900000
          1719.791666666667000000
          0.000000000000000000
          277.812500000000000000)
        FontSize = 10
      end
    end
    object QRGroup1: TQRGroup
      Left = 26
      Top = 86
      Width = 1058
      Height = 27
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Frame.Style = psInsideFrame
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        51.026785714285710000
        1999.494047619048000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'QrCustosProducao.cod_centro_custo'
      FooterBand = QRBand3
      Master = QRPrimario
      ReprintOnNewPage = False
      object QRDBText11: TQRDBText
        Left = 5
        Top = 0
        Width = 60
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          45.357142857142860000
          9.449404761904762000
          0.000000000000000000
          113.392857142857100000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMContasPagarRel.QrCustosProducao
        DataField = 'COD_CENTRO_CUSTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText18: TQRDBText
        Left = 77
        Top = 0
        Width = 212
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          45.357142857142860000
          145.520833333333300000
          0.000000000000000000
          400.654761904761900000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMContasPagarRel.QrCustosProducao
        DataField = 'DESC_CENTRO_CUSTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRBandFinalidade: TQRBand
      Left = 26
      Top = 113
      Width = 1058
      Height = 30
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Frame.Style = psInsideFrame
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        56.696428571428570000
        1999.494047619048000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRDBText1: TQRDBText
        Left = 108
        Top = 0
        Width = 325
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          45.357142857142860000
          204.107142857142900000
          0.000000000000000000
          614.211309523809500000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMContasPagarRel.QrCustosProducao
        DataField = 'DESC_FINALIDADE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText14: TQRDBText
        Left = 40
        Top = 0
        Width = 39
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          45.357142857142860000
          75.595238095238100000
          0.000000000000000000
          73.705357142857140000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMContasPagar.QRContasPagar_Cab
        DataField = 'COD_FINALIDADE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText2: TQRDBText
        Left = 840
        Top = 1
        Width = 208
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          45.357142857142860000
          1587.500000000000000000
          1.889880952380952000
          393.095238095238100000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMContasPagarRel.QrCustosProducao
        DataField = 'TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRBand3: TQRBand
      Left = 26
      Top = 143
      Width = 1058
      Height = 82
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Frame.Style = psInsideFrame
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        154.970238095238100000
        1999.494047619048000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRExpr1: TQRExpr
        Left = 744
        Top = 0
        Width = 304
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          43.467261904761900000
          1406.071428571429000000
          0.000000000000000000
          574.523809523809500000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = True
        Transparent = False
        WordWrap = True
        Expression = 'SUM(QrCustosProducao.TOTAL)'
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 4
        Top = -1
        Width = 69
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          43.467261904761900000
          7.559523809523810000
          -1.889880952380952000
          130.401785714285700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total '
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText3: TQRDBText
        Left = 77
        Top = 0
        Width = 212
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          45.357142857142860000
          145.520833333333300000
          0.000000000000000000
          400.654761904761900000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMContasPagarRel.QrCustosProducao
        DataField = 'DESC_CENTRO_CUSTO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRBand4: TQRBand
      Left = 26
      Top = 225
      Width = 1058
      Height = 56
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Frame.Style = psInsideFrame
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        1999.494047619048000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRExpr2: TQRExpr
        Left = 744
        Top = 16
        Width = 304
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          43.467261904761900000
          1406.071428571429000000
          30.238095238095240000
          574.523809523809500000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'SUM(QrCustosProducao.TOTAL)'
        FontSize = 10
      end
      object QRLabel4: TQRLabel
        Left = 572
        Top = 15
        Width = 80
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          43.467261904761900000
          1081.011904761905000000
          28.348214285714290000
          151.190476190476200000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total :'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
  end
end
