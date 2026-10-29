object FRBloqueto_Sudameris: TFRBloqueto_Sudameris
  Left = 410
  Top = 127
  Width = 826
  Height = 549
  VertScrollBar.Position = 632
  Caption = 'FRBloqueto_Sudameris'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object QRPrimario: TQuickRep
    Left = 6
    Top = -630
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = DMContasReceber.QRBloqueto
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Values = (
      0.000000000000000000
      2970.000000000000000000
      30.000000000000000000
      2100.000000000000000000
      15.000000000000000000
      15.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = First
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrinterSettings.PrintQuality = 0
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 0
    PrintIfEmpty = False
    ReportTitle = 'Boleto'
    ShowProgress = False
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    PrevInitialZoom = qrZoomToFit
    object QRBand2: TQRBand
      Left = 6
      Top = 11
      Width = 783
      Height = 1111
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Frame.Style = psDash
      AlignToBottom = False
      BeforePrint = QRBand2BeforePrint
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        2939.520833333333000000
        2071.687500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object Barcode1: TBarcode
        Left = 648
        Top = 1056
        Width = 117
        Height = 70
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = 0
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        AutoWidth = False
        BarColor = clBlack
        BackgroundColor = clWhite
        BarcodeType = btInterleaved2of5
        Digits = '000000000000'
        Version = 'Registered 1.1'
        Author.Name = 'Leonardo Augusto Rezende Santos'
        Author.Phone = '(011)3898-2349'
        Author.Email = 'leonardo@barcodebrasil.com.br'
        BarCaption = False
        RescaleEAN = True
      end
      object QRShape19: TQRShape
        Left = 63
        Top = 753
        Width = 654
        Height = 263
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          695.854166666666600000
          166.687500000000000000
          1992.312500000000000000
          1730.375000000000000000)
        Brush.Style = bsClear
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape20: TQRShape
        Left = 63
        Top = 795
        Width = 654
        Height = 4
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          10.583333333333330000
          166.687500000000000000
          2103.437500000000000000
          1730.375000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape21: TQRShape
        Left = 63
        Top = 817
        Width = 654
        Height = 4
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          10.583333333333330000
          166.687500000000000000
          2161.645833333333000000
          1730.375000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape22: TQRShape
        Left = 63
        Top = 841
        Width = 654
        Height = 4
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          10.583333333333330000
          166.687500000000000000
          2225.145833333333000000
          1730.375000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape23: TQRShape
        Left = 63
        Top = 865
        Width = 654
        Height = 4
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          10.583333333333330000
          166.687500000000000000
          2288.645833333333000000
          1730.375000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape24: TQRShape
        Left = 63
        Top = 966
        Width = 654
        Height = 3
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          7.937500000000000000
          166.687500000000000000
          2555.875000000000000000
          1730.375000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape25: TQRShape
        Left = 553
        Top = 753
        Width = 3
        Height = 215
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          568.854166666666700000
          1463.145833333333000000
          1992.312500000000000000
          7.937500000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape26: TQRShape
        Left = 554
        Top = 883
        Width = 162
        Height = 4
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          10.583333333333330000
          1465.791666666667000000
          2336.270833333333000000
          428.625000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape27: TQRShape
        Left = 554
        Top = 903
        Width = 162
        Height = 4
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          10.583333333333330000
          1465.791666666667000000
          2389.187500000000000000
          428.625000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape28: TQRShape
        Left = 554
        Top = 924
        Width = 162
        Height = 4
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          10.583333333333330000
          1465.791666666667000000
          2444.750000000000000000
          428.625000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape29: TQRShape
        Left = 554
        Top = 945
        Width = 162
        Height = 4
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          10.583333333333330000
          1465.791666666667000000
          2500.312500000000000000
          428.625000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape30: TQRShape
        Left = 160
        Top = 820
        Width = 4
        Height = 46
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          121.708333333333300000
          423.333333333333300000
          2169.583333333333000000
          10.583333333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape31: TQRShape
        Left = 281
        Top = 820
        Width = 4
        Height = 47
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          124.354166666666700000
          743.479166666666600000
          2169.583333333333000000
          10.583333333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape32: TQRShape
        Left = 389
        Top = 819
        Width = 3
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666660000
          1029.229166666667000000
          2166.937500000000000000
          7.937500000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape33: TQRShape
        Left = 441
        Top = 820
        Width = 4
        Height = 46
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          121.708333333333300000
          1166.812500000000000000
          2169.583333333333000000
          10.583333333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape34: TQRShape
        Left = 243
        Top = 843
        Width = 3
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          642.937500000000000000
          2230.437500000000000000
          7.937500000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRLabel27: TQRLabel
        Left = 66
        Top = 755
        Width = 58
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          174.625000000000000000
          1997.604166666667000000
          153.458333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'LOCAL DE PAGAMENTO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 4
      end
      object QRLabel37: TQRLabel
        Left = 66
        Top = 798
        Width = 25
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          174.625000000000000000
          2111.375000000000000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CEDENTE'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 4
      end
      object QRLabel38: TQRLabel
        Left = 66
        Top = 821
        Width = 49
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          174.625000000000000000
          2172.229166666667000000
          129.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DATA DOCUMENTO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 4
      end
      object QRLabel39: TQRLabel
        Left = 66
        Top = 844
        Width = 40
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          174.625000000000000000
          2233.083333333333000000
          105.833333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'USO DO BANCO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 4
      end
      object QRLabel40: TQRLabel
        Left = 164
        Top = 821
        Width = 68
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          433.916666666666700000
          2172.229166666667000000
          179.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'N'#218'MERO DO DOCUMENTO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 4
      end
      object QRLabel41: TQRLabel
        Left = 164
        Top = 844
        Width = 26
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          433.916666666666700000
          2233.083333333333000000
          68.791666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CARTEIRA'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 4
      end
      object QRLabel42: TQRLabel
        Left = 248
        Top = 844
        Width = 20
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          656.166666666666700000
          2233.083333333333000000
          52.916666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Esp'#233'cie'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 4
      end
      object QRLabel43: TQRLabel
        Left = 288
        Top = 821
        Width = 65
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          762.000000000000000000
          2172.229166666667000000
          171.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'ESP'#201'CIE DO DOCUMENTO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 4
      end
      object QRLabel44: TQRLabel
        Left = 394
        Top = 821
        Width = 18
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          1042.458333333333000000
          2172.229166666667000000
          47.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'ACEITE'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 4
      end
      object QRLabel45: TQRLabel
        Left = 448
        Top = 821
        Width = 60
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          1185.333333333333000000
          2172.229166666667000000
          158.750000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DATA PROCESSAMENTO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 4
      end
      object QRLabel46: TQRLabel
        Left = 288
        Top = 844
        Width = 34
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          762.000000000000000000
          2233.083333333333000000
          89.958333333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QUANTIDADE'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 4
      end
      object QRLabel47: TQRLabel
        Left = 448
        Top = 844
        Width = 18
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          1185.333333333333000000
          2233.083333333333000000
          47.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'VALOR'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 4
      end
      object QRLabel48: TQRLabel
        Left = 66
        Top = 868
        Width = 236
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          174.625000000000000000
          2296.583333333333000000
          624.416666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 
          'INSTRU'#199#213'ES (Todas as informa'#231#245'es deste bloqueto s'#227'o de exclusiva' +
          ' responsabilidade do cedente)'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 4
      end
      object QRLabel49: TQRLabel
        Left = 557
        Top = 755
        Width = 34
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          1473.729166666667000000
          1997.604166666667000000
          89.958333333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'VENCIMENTO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 4
      end
      object QRLabel50: TQRLabel
        Left = 558
        Top = 799
        Width = 72
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          1476.375000000000000000
          2114.020833333333000000
          190.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'AG'#202'NCIA / C'#211'DIGO CEDENTE'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 4
      end
      object QRLabel51: TQRLabel
        Left = 558
        Top = 821
        Width = 43
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          1476.375000000000000000
          2172.229166666667000000
          113.770833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NOSSO N'#218'MERO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 4
      end
      object QRLabel52: TQRLabel
        Left = 558
        Top = 844
        Width = 62
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          1476.375000000000000000
          2233.083333333333000000
          164.041666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'VALOR DO DOCUMENTO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 4
      end
      object QRLabel53: TQRLabel
        Left = 558
        Top = 869
        Width = 71
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          1476.375000000000000000
          2299.229166666667000000
          187.854166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '(-) DESCONTO / ABATIMENTO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 4
      end
      object QRLabel54: TQRLabel
        Left = 558
        Top = 887
        Width = 59
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          1476.375000000000000000
          2346.854166666667000000
          156.104166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '(-) OUTRAS DEDU'#199#213'ES'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 4
      end
      object QRLabel55: TQRLabel
        Left = 558
        Top = 907
        Width = 44
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          1476.375000000000000000
          2399.770833333333000000
          116.416666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '(+) MORA / MULTA'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 4
      end
      object QRLabel56: TQRLabel
        Left = 558
        Top = 928
        Width = 65
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          1476.375000000000000000
          2455.333333333333000000
          171.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '(+) OUTROS ACR'#201'SCIMOS'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 4
      end
      object QRLabel57: TQRLabel
        Left = 558
        Top = 949
        Width = 53
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          1476.375000000000000000
          2510.895833333333000000
          140.229166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '(=) VALOR COBRADO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 4
      end
      object QRSysData3: TQRSysData
        Left = 14
        Top = 907
        Width = 72
        Height = 15
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          37.041666666666670000
          2399.770833333333000000
          190.500000000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Data = qrsDate
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        FontSize = 8
      end
      object QRSysData4: TQRSysData
        Left = 448
        Top = 827
        Width = 96
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1185.333333333333000000
          2188.104166666667000000
          254.000000000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Data = qrsDate
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        FontSize = 8
      end
      object QRLabel58: TQRLabel
        Left = 253
        Top = 851
        Width = 14
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          669.395833333333300000
          2251.604166666667000000
          37.041666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'R$'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel59: TQRLabel
        Left = 556
        Top = 805
        Width = 152
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1471.083333333333000000
          2129.895833333333000000
          402.166666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'LabelAgenciaCedente3'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel60: TQRLabel
        Left = 66
        Top = 959
        Width = 49
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          174.625000000000000000
          2537.354166666667000000
          129.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'UNIDADE CEDENTE'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 4
      end
      object QRLabel61: TQRLabel
        Left = 66
        Top = 969
        Width = 22
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          174.625000000000000000
          2563.812500000000000000
          58.208333333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'SACADO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 4
      end
      object QRLabel62: TQRLabel
        Left = 499
        Top = 1018
        Width = 213
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1320.270833333333000000
          2693.458333333333000000
          563.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'AUTENTICA'#199#195'O MEC'#194'NICA/FICHA DE COMPENSA'#199#195'O'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText16: TQRDBText
        Left = 556
        Top = 765
        Width = 152
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1471.083333333333000000
          2024.062500000000000000
          402.166666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMContasReceber.QRBloqueto
        DataField = 'DT_VENCIMENTO1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRDBText17: TQRDBText
        Left = 584
        Top = 850
        Width = 124
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1545.166666666667000000
          2248.958333333333000000
          328.083333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMContasReceber.QRBloqueto
        DataField = 'VAL_TITULO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Mask = '#,##0.00'
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel64: TQRLabel
        Left = 220
        Top = 727
        Width = 425
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          582.083333333333300000
          1923.520833333333000000
          1124.479166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'aaabc.ccddx ddddd.defffy fgggg.gghhhz k uuuuvvvvvvvvvv'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 11
      end
      object QRLabel65: TQRLabel
        Left = 688
        Top = 727
        Width = 29
        Height = 20
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1820.333333333333000000
          1923.520833333333000000
          76.729166666666660000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '36000'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 13
      end
      object QRShape35: TQRShape
        Left = 212
        Top = 716
        Width = 3
        Height = 31
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          82.020833333333340000
          560.916666666666700000
          1894.416666666667000000
          7.937500000000000000)
        Pen.Width = 2
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape36: TQRShape
        Left = 156
        Top = 716
        Width = 3
        Height = 31
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          82.020833333333340000
          412.750000000000000000
          1894.416666666667000000
          7.937500000000000000)
        Pen.Width = 2
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRLabel66: TQRLabel
        Left = 160
        Top = 722
        Width = 50
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          423.333333333333300000
          1910.291666666667000000
          132.291666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '347-6'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial Black'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 12
      end
      object QRImage2: TQRImage
        Left = 64
        Top = 718
        Width = 88
        Height = 26
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          68.791666666666660000
          169.333333333333300000
          1899.708333333333000000
          232.833333333333300000)
        Picture.Data = {
          07544269746D61707E2A0000424D7E2A0000000000003604000028000000C700
          0000310000000100080000000000482600000000000000000000000100000001
          0000F1EEEB0036110A00B09C8D0077564300DED6CF00C5B8AD00987E6C00FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707040000000400000004000000040000
          0004000000040000040007070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707000707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070700070707070707
          0707070707070707070707070707070707000000070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0700070707070707070707070707070707070402050707070705030507070707
          0606070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070702000707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070007070707070707070707070707070707040605070707
          0702010207070707050507070707070707070707070707070707070707070707
          0707040400070007070707000700000007070707040407070707070707070604
          0007000707070400000704000707040000070700070707070007040400070707
          0707000707070007070700070007070007000707070707070704040007070707
          0007070007000404000707070700070404000707070707070707070707070707
          0707070707070707070707070707070707000707070707070707070707070707
          0707070007070707070000000707070707070707070700070707070707070707
          0707070707070707070606060200020005050005050606030007000206060505
          0505020702040306060405040002060605050602050206060207000205070705
          0506060602070604070603000704060707040205050006060705050204040204
          0506060600070705020704020403020205020700040202060604070707070707
          0707070707070707070707070707070707070707070707070700070707070707
          0707070707000007070707070707070707070707070707070707070707070605
          0707070707070707070707070707070704030004060506000502040203050006
          0407040600000402050502000604060405020205000600000404000206060405
          0200070506040406050205070304030400030300070003050402020502000606
          0402050204040205060507030507070206070506040607070403000402060202
          0707070707070707070707070707070707070707070707070707070707070707
          0700070707070707070707070006060707070707070707070707070707070707
          0707070707070604070707070707070707070707070707070406000002050200
          0505000204020203000704030202050505050207020402040402050400030202
          0507060607050206020707040302030604020500060506000202060007070203
          0503020402050205050205020405020202040706050707020200020200060000
          0006030203040502070707070707070707070707070707070707070707070707
          0707070707070707070007070707070707070707070404070707070700070707
          0707070707070707070707070707070707070707070707070707070707070707
          0406040002020600020204020400040304070406040506050202060006040604
          0502020200060005060506070000040202000704020405020706060302070604
          0300060007070406070204040602040402020406060305050204070605000705
          0302030004010202070502000600020207070707070707070707070707070707
          0707070707070707070707070707070707000707070707070707070707070707
          0707040204070707070707070707070704040007070707070707070707070707
          0707070707070707040600000205060606060605040606060007000506060505
          0606060606070302030405030505060604040306050506060507070705020205
          0706050502040206020703000707000605060704060204070206040205020505
          0204070605070705060402020406000407040604020702020707070707070707
          0707070707070707070707070707070707070707070707070700070707070707
          0707070707070707070704060507070707000400070707070101000707070707
          0707070007070707070707070707070704060400060507040000040707000400
          0707070704040707000007040007070404070700000704040707040407070404
          0707070704060600000604000604060300000300070707050302070501020700
          0603050504040602060400030507070202000406040600000700060304000602
          0707070707070707070707070707070707070707070707070707070707070707
          0700070707070707070405070707070707070707070707070703010407070707
          0606000707070707070705060707070707070707070707070406000006050707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070003060707060606060703060007030007070705
          0304070503050707050305020606060005060606040707050305030504030502
          0707020307000202070707070707070707070707070707070707070707070707
          0707070707070707070007070707070707020307070707070707070707070707
          0706030407070707070707070707070707070506070707070707070707070707
          0700000700000707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070000070704050507070407
          0707040707070707040707000407070700000000050500070705020007070707
          0505040707050505070700040707000007070707070707070707070707070707
          0707070707070707070707070707070707000707070707070707070707070707
          0707070707070707070707070707040500070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070700070707070707
          0707070707070004000707070707070707070707070703010507070707000600
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0700070707070707070707070707040304070707070707070707070707070202
          0007070707070304070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070007070707000400070707070700050407070707070707
          0707070707070707070707070707070707070707000400070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707000707070700060407070707070707
          0707070707070707070707070707070707070707070707070707070704020507
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070700070707070704
          0407070707070707070707070405020202020202020202050500070707070707
          0707070700040407070707070707070707050505050505050505050505050505
          0505050505050505050505050505050505050505050505050505050505050505
          0505050505050505050505050505050505050505050505050505050505050505
          0505050505050505050505050505050505050505050505050505050505050505
          0505050505050505050505050505050505050505050707070707070707070707
          0700070707070707070707070707000402060303030303030303030303030303
          0303030606050407070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070007070707070707070700050606060606020505050504
          0404000404040404050502020606060602040707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707000707070707070700050505040504
          0007070707070707070707070707070504070707000404040502050407070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070700070707070707
          0700040000070707070707070707070707070707070707060200070707070707
          0700040000070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0700070707070707070707070707070707070707070707070707070707070700
          0007070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070007070707070707070707070707070707070203050707
          0707000007070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707000707070704050407070707050305
          0707070201050707070702060007070707070707000507070707070707050407
          0707070707070707070707000400070707070707070707070707000004000707
          0707070707070007070707000000070707070707070700000700000707070000
          0707000007070700070700070707070707070007070000070707070000070707
          0700000007070707070700000707000007070707070000070707000707070000
          0707070707070704000007070707070707070707070707070700070707070405
          0407070707020102070707000000070707070405070707070707070704030407
          0707070700020500070707070707070707040603060606040707070707070707
          0406030606060204070707070707020306060602060606020007070707000206
          0606060007000206060603020007000606060605070704070704030606060604
          0707070406060206060606030302000707070506060606060007000203060204
          0700060306060305000707070705060306060207070707070707070707070707
          0700070707070700000707070700040007070707070707070707070707070707
          0707070707040707070707070707000707070707070707070003010200000603
          0407070707070705010102040004020304070707070704060101030400050301
          0304070707070406010304070707070301010304070707000101050007040104
          0700050301030507070707000401010106050502010300070707040501010300
          0707020101030007070004030101060007070707050103050004030307070707
          0707070707070707070007070707070707070707070707070707070707040305
          0707070707070707070707070707070707070707070707070707070707070707
          0401050707070003030707070707000101050707070700060607070707070704
          0101040707070002010104070707070003060707070707060103040707070707
          0606000707020106070700060103070707070707070201030707070705010407
          0707070701010207070003010300070707070705010304070707070706010407
          0707000102070707070707070707070707000707070707070707070707070707
          0707070707050106070707070707070707070707070707070707070707070707
          0707070707070707040304070707070601040707070702010307070707070705
          0304070707070700010104070707070702010100070707070503000707070401
          0102070707070707060600070701010107070006010307070707070707060103
          0007070707020007070707070101020707050101050707070707070201030407
          0707070706020707070707010307070707070707070707070700070707070707
          0707070707070707070005040707040007070707070707070707070707070707
          0707070707070707070707070707070700040007070700010105070707070601
          0107070707070705060507070707070401010007070707070001010207070707
          0403020700070201010507070707070702060007050101030207000601060707
          0707070707060103000707000707070707070707010102070001010307070707
          0707070201010007070707070400070707070401010707070707070707070707
          0700070707070707070707070707070707050103070707070402050707070707
          0705020007070707070707070707070707070707070707070707070707050301
          0104070707070601030707070707070503040707070707040101040707070707
          0706010307070707070201030606010106070707070707070206000703010304
          0307000301060707070707070706010607070702050707070707070701010507
          0201010407070707070707020103040707070707070707070702010103070707
          0707070707070707070007070707070707070704070707070704060507070707
          0201060007070707070301040707070707000407070707070707070707070707
          0707070503010101060707070707060101070707070707050304070707070704
          0101000707070707070201010007070707040302040601010507070707070707
          0506000001010207030507060106070707070707070601030504040102070707
          0707070701010605010102070707070707070705010304070707070707070702
          0301010105070707070707070707070707000707070707070707050200070707
          0707070707070707040604070003060007050500070707070002060407070707
          0707070707070707070706010101010207070707070706010307070707070704
          0304070707070704010104070707070707060101040707070704060407020103
          0007070707070707050607060101070702030703010607070707070707060101
          0606030105070707070707070101030506030304070707070707070201030407
          0707070707040301010103050707070707070707070707070700070707070707
          0707050202070707070707070707070707070707000106000707070707070707
          0704060407070707070707070707070707060101010604070707070707000601
          0107070707070705030407070707070401010007070707070706010300070707
          0707050604010102070707070707070704060701010307070403000201060707
          0707070707060103040000030607070707070707010102070704010104070707
          0707070501010007070707070703010103020407070707070707070707070707
          0700070707070707070700040407070707070707070707070707070707000007
          0707070707070707070700070707070707070707070707070701010304070707
          0707070707070601030707070707070503040707070707000101040707070707
          0001010207070707070704060601010407070707070707070006050101040707
          0002060601020707070707070706010607070705040707070707070701010207
          0707060103070707070707020103040707070707040101020007070707070707
          0707070707070707070007070707070707070707070707070707070707070007
          0707070707070707070707070707070707070707070707070707070707070707
          0003010707070704040707070700020101070707070707050604070707070704
          0101000707070707060103000707070707070702010106070707070707070707
          0703030103070707070503060102070707070707070601030007070707000707
          0707070701010207070706010307070707070705010304070707070705010307
          0707070500070707070707070707070707000707070707070707070707070707
          0707070707050204070707070707070707070707070707070707070707070707
          0707070707070707070301040707070306070707070706010307070707070705
          0304070707070704010104070700000201010407070707070707070401010507
          0707070707070707070301010207070707000301010207070707070707060106
          0007070006060007070707070101020700040101060707070707070201030407
          0707070700010207070700010407070707070707070707070700070707070707
          0707070707070707070000000705020407070707070707070707040400070707
          0707070707070707070707070707070707040102000002010207070700040301
          0105000707070002010607070707050301010204040503010304070707070707
          0707070003030007070707070707070004010101070707070707020101030000
          0707070004030103020505060103070707070005010103000503010300070707
          0707040301010200070707070702010500040601000707070707070707070707
          0700070707070707070707070707070707050604070707070707070707070707
          0707040604070707070707070707070707070707070707070707040606060306
          0007070704060306060305070700020306030207070704020606060606060205
          0707070707070707070707070502070707070707070707020606030207070707
          0707000603060200070707040603060606060603030507070707020306060606
          0603050007070707070006030606030207070707070705060206030207070707
          0707070707070707070007070707070707070707070707070704050707070707
          0700040400070707070707050407070707070707070707070707070707070707
          0707070700000007070707070700070707000707070700070700070707070707
          0707070000070707070707070707070707070707070707070707070707070700
          0007070707070707070707070707000707070707000707070700070707070707
          0707000007070700000707070707070707070007070700070707070707070700
          0000070707070707070707070707070707000707070707070707070707070707
          0707070707070707070402060407070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070700070707070707
          0707070707070707070707070707070707000505000707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0700070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070007070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707000707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070700070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0700070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          07070707070707070700}
        Stretch = True
      end
      object QRDBText19: TQRDBText
        Left = 69
        Top = 804
        Width = 475
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          182.562500000000000000
          2127.250000000000000000
          1256.770833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMContasReceber.QRBloqueto
        DataField = 'DESC_FILIAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRDBText21: TQRDBText
        Left = 139
        Top = 970
        Width = 299
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          367.770833333333300000
          2566.458333333333000000
          791.104166666666600000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMContasReceber.QRBloqueto
        DataField = 'NOME_SACADO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText22: TQRDBText
        Left = 96
        Top = 985
        Width = 266
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          254.000000000000000000
          2606.145833333333000000
          703.791666666666600000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMContasReceber.QRBloqueto
        DataField = 'DESC_ENDERECO_COBRANCA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText23: TQRDBText
        Left = 96
        Top = 998
        Width = 69
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          254.000000000000000000
          2640.541666666667000000
          182.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMContasReceber.QRBloqueto
        DataField = 'DESC_CEP_COBRANCA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText24: TQRDBText
        Left = 368
        Top = 985
        Width = 185
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          973.666666666666600000
          2606.145833333333000000
          489.479166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMContasReceber.QRBloqueto
        DataField = 'DESC_BAIRRO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText27: TQRDBText
        Left = 168
        Top = 998
        Width = 353
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          444.500000000000000000
          2640.541666666667000000
          933.979166666666600000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMContasReceber.QRBloqueto
        DataField = 'DESC_CIDADE_COBRANCA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel67: TQRLabel
        Left = 525
        Top = 998
        Width = 5
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1389.062500000000000000
          2640.541666666667000000
          13.229166666666670000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '-'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRDBText28: TQRDBText
        Left = 533
        Top = 998
        Width = 20
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1410.229166666667000000
          2640.541666666667000000
          52.916666666666670000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMContasReceber.QRBloqueto
        DataField = 'DESC_ESTADO_COBRANCA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText29: TQRDBText
        Left = 167
        Top = 851
        Width = 44
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          441.854166666666700000
          2251.604166666667000000
          116.416666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMContasReceber.QRBloqueto
        DataField = 'CARTEIRA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRDBText30: TQRDBText
        Left = 288
        Top = 827
        Width = 99
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          762.000000000000000000
          2188.104166666667000000
          261.937500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMContasReceber.QRBloqueto
        DataField = 'DESC_TIPO_DOCUMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel68: TQRLabel
        Left = 69
        Top = 765
        Width = 478
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          182.562500000000000000
          2024.062500000000000000
          1264.708333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Banco Sudameris'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel70: TQRLabel
        Left = 600
        Top = 827
        Width = 107
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1587.500000000000000000
          2188.104166666667000000
          283.104166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'DV'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRMemo1: TQRMemo
        Left = 68
        Top = 878
        Width = 477
        Height = 77
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          203.729166666666700000
          179.916666666666700000
          2323.041666666667000000
          1262.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText33: TQRDBText
        Left = 96
        Top = 970
        Width = 40
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          254.000000000000000000
          2566.458333333333000000
          105.833333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMContasReceber.QRBloqueto
        DataField = 'COD_CADASTRO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Mask = '000000'
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText34: TQRDBText
        Left = 442
        Top = 970
        Width = 111
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1169.458333333333000000
          2566.458333333333000000
          293.687500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMContasReceber.QRBloqueto
        DataField = 'NUM_CGC_CPF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel1: TQRLabel
        Left = 69
        Top = 781
        Width = 478
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          182.562500000000000000
          2066.395833333333000000
          1264.708333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Pag'#225'vel em qualquer banco at'#233' o vencimento'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRImage3: TQRImage
        Left = 63
        Top = 1047
        Width = 389
        Height = 49
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          129.645833333333300000
          166.687500000000000000
          2770.187500000000000000
          1029.229166666667000000)
        AutoSize = True
      end
      object QRShape1: TQRShape
        Left = 63
        Top = 48
        Width = 654
        Height = 263
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          695.854166666666600000
          166.687500000000000000
          127.000000000000000000
          1730.375000000000000000)
        Brush.Style = bsClear
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape2: TQRShape
        Left = 63
        Top = 90
        Width = 654
        Height = 4
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          10.583333333333330000
          166.687500000000000000
          238.125000000000000000
          1730.375000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape3: TQRShape
        Left = 63
        Top = 112
        Width = 654
        Height = 4
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          10.583333333333330000
          166.687500000000000000
          296.333333333333400000
          1730.375000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape4: TQRShape
        Left = 63
        Top = 136
        Width = 654
        Height = 4
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          10.583333333333330000
          166.687500000000000000
          359.833333333333400000
          1730.375000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape5: TQRShape
        Left = 63
        Top = 160
        Width = 654
        Height = 4
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          10.583333333333330000
          166.687500000000000000
          423.333333333333300000
          1730.375000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape6: TQRShape
        Left = 63
        Top = 261
        Width = 654
        Height = 3
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          7.937500000000000000
          166.687500000000000000
          690.562500000000000000
          1730.375000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape7: TQRShape
        Left = 553
        Top = 48
        Width = 3
        Height = 215
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          568.854166666666700000
          1463.145833333333000000
          127.000000000000000000
          7.937500000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape8: TQRShape
        Left = 554
        Top = 178
        Width = 162
        Height = 4
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          10.583333333333330000
          1465.791666666667000000
          470.958333333333400000
          428.625000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape9: TQRShape
        Left = 554
        Top = 198
        Width = 162
        Height = 4
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          10.583333333333330000
          1465.791666666667000000
          523.875000000000000000
          428.625000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape10: TQRShape
        Left = 554
        Top = 219
        Width = 162
        Height = 4
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          10.583333333333330000
          1465.791666666667000000
          579.437500000000000000
          428.625000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape11: TQRShape
        Left = 554
        Top = 240
        Width = 162
        Height = 4
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          10.583333333333330000
          1465.791666666667000000
          635.000000000000000000
          428.625000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape12: TQRShape
        Left = 160
        Top = 115
        Width = 4
        Height = 46
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          121.708333333333300000
          423.333333333333300000
          304.270833333333400000
          10.583333333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape13: TQRShape
        Left = 281
        Top = 115
        Width = 4
        Height = 47
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          124.354166666666700000
          743.479166666666600000
          304.270833333333400000
          10.583333333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape14: TQRShape
        Left = 389
        Top = 114
        Width = 3
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666660000
          1029.229166666667000000
          301.625000000000000000
          7.937500000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape15: TQRShape
        Left = 441
        Top = 115
        Width = 4
        Height = 46
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          121.708333333333300000
          1166.812500000000000000
          304.270833333333400000
          10.583333333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape16: TQRShape
        Left = 243
        Top = 138
        Width = 3
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          642.937500000000000000
          365.125000000000000000
          7.937500000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRLabel2: TQRLabel
        Left = 66
        Top = 50
        Width = 58
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          174.625000000000000000
          132.291666666666700000
          153.458333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'LOCAL DE PAGAMENTO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 4
      end
      object QRLabel3: TQRLabel
        Left = 66
        Top = 93
        Width = 25
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          174.625000000000000000
          246.062500000000000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CEDENTE'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 4
      end
      object QRLabel4: TQRLabel
        Left = 66
        Top = 116
        Width = 49
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          174.625000000000000000
          306.916666666666700000
          129.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DATA DOCUMENTO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 4
      end
      object QRLabel5: TQRLabel
        Left = 66
        Top = 139
        Width = 40
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          174.625000000000000000
          367.770833333333300000
          105.833333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'USO DO BANCO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 4
      end
      object QRLabel6: TQRLabel
        Left = 164
        Top = 116
        Width = 68
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          433.916666666666700000
          306.916666666666700000
          179.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'N'#218'MERO DO DOCUMENTO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 4
      end
      object QRLabel7: TQRLabel
        Left = 164
        Top = 139
        Width = 26
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          433.916666666666700000
          367.770833333333300000
          68.791666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CARTEIRA'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 4
      end
      object QRLabel8: TQRLabel
        Left = 248
        Top = 139
        Width = 20
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          656.166666666666700000
          367.770833333333300000
          52.916666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Esp'#233'cie'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 4
      end
      object QRLabel9: TQRLabel
        Left = 288
        Top = 116
        Width = 65
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          762.000000000000000000
          306.916666666666700000
          171.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'ESP'#201'CIE DO DOCUMENTO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 4
      end
      object QRLabel10: TQRLabel
        Left = 394
        Top = 116
        Width = 18
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          1042.458333333333000000
          306.916666666666700000
          47.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'ACEITE'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 4
      end
      object QRLabel11: TQRLabel
        Left = 448
        Top = 116
        Width = 60
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          1185.333333333333000000
          306.916666666666700000
          158.750000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DATA PROCESSAMENTO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 4
      end
      object QRLabel12: TQRLabel
        Left = 288
        Top = 139
        Width = 34
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          762.000000000000000000
          367.770833333333300000
          89.958333333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QUANTIDADE'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 4
      end
      object QRLabel13: TQRLabel
        Left = 448
        Top = 139
        Width = 18
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          1185.333333333333000000
          367.770833333333300000
          47.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'VALOR'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 4
      end
      object QRLabel14: TQRLabel
        Left = 66
        Top = 163
        Width = 236
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          174.625000000000000000
          431.270833333333300000
          624.416666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 
          'INSTRU'#199#213'ES (Todas as informa'#231#245'es deste bloqueto s'#227'o de exclusiva' +
          ' responsabilidade do cedente)'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 4
      end
      object QRLabel15: TQRLabel
        Left = 557
        Top = 50
        Width = 34
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          1473.729166666667000000
          132.291666666666700000
          89.958333333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'VENCIMENTO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 4
      end
      object QRLabel16: TQRLabel
        Left = 558
        Top = 94
        Width = 72
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          1476.375000000000000000
          248.708333333333300000
          190.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'AG'#202'NCIA / C'#211'DIGO CEDENTE'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 4
      end
      object QRLabel17: TQRLabel
        Left = 558
        Top = 116
        Width = 43
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          1476.375000000000000000
          306.916666666666700000
          113.770833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NOSSO N'#218'MERO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 4
      end
      object QRLabel18: TQRLabel
        Left = 558
        Top = 139
        Width = 62
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          1476.375000000000000000
          367.770833333333300000
          164.041666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'VALOR DO DOCUMENTO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 4
      end
      object QRLabel19: TQRLabel
        Left = 558
        Top = 164
        Width = 71
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          1476.375000000000000000
          433.916666666666700000
          187.854166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '(-) DESCONTO / ABATIMENTO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 4
      end
      object QRLabel20: TQRLabel
        Left = 558
        Top = 182
        Width = 59
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          1476.375000000000000000
          481.541666666666700000
          156.104166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '(-) OUTRAS DEDU'#199#213'ES'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 4
      end
      object QRLabel21: TQRLabel
        Left = 558
        Top = 202
        Width = 44
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          1476.375000000000000000
          534.458333333333300000
          116.416666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '(+) MORA / MULTA'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 4
      end
      object QRLabel22: TQRLabel
        Left = 558
        Top = 223
        Width = 65
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          1476.375000000000000000
          590.020833333333300000
          171.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '(+) OUTROS ACR'#201'SCIMOS'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 4
      end
      object QRLabel23: TQRLabel
        Left = 558
        Top = 244
        Width = 53
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          1476.375000000000000000
          645.583333333333300000
          140.229166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '(=) VALOR COBRADO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 4
      end
      object QRSysData1: TQRSysData
        Left = 286
        Top = 18
        Width = 72
        Height = 15
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          756.708333333333400000
          47.625000000000000000
          190.500000000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Data = qrsDate
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        FontSize = 8
      end
      object QRSysData2: TQRSysData
        Left = 448
        Top = 122
        Width = 96
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1185.333333333333000000
          322.791666666666700000
          254.000000000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Data = qrsDate
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        FontSize = 8
      end
      object QRLabel24: TQRLabel
        Left = 253
        Top = 146
        Width = 14
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          669.395833333333300000
          386.291666666666700000
          37.041666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'R$'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel25: TQRLabel
        Left = 556
        Top = 99
        Width = 152
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1471.083333333333000000
          261.937500000000000000
          402.166666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'LabelAgenciaCedente3'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel26: TQRLabel
        Left = 66
        Top = 254
        Width = 49
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          174.625000000000000000
          672.041666666666700000
          129.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'UNIDADE CEDENTE'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 4
      end
      object QRLabel28: TQRLabel
        Left = 66
        Top = 264
        Width = 22
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          174.625000000000000000
          698.500000000000000000
          58.208333333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'SACADO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 4
      end
      object QRLabel29: TQRLabel
        Left = 578
        Top = 313
        Width = 109
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1529.291666666667000000
          828.145833333333300000
          288.395833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'AUTENTICA'#199#195'O MEC'#194'NICA'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText1: TQRDBText
        Left = 556
        Top = 60
        Width = 152
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1471.083333333333000000
          158.750000000000000000
          402.166666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMContasReceber.QRBloqueto
        DataField = 'DT_VENCIMENTO1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRDBText2: TQRDBText
        Left = 584
        Top = 145
        Width = 124
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1545.166666666667000000
          383.645833333333400000
          328.083333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMContasReceber.QRBloqueto
        DataField = 'VAL_TITULO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Mask = '#,##0.00'
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel30: TQRLabel
        Left = 610
        Top = 26
        Width = 107
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1613.958333333333000000
          68.791666666666670000
          283.104166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'RECIBO DO SACADO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape17: TQRShape
        Left = 212
        Top = 11
        Width = 3
        Height = 31
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          82.020833333333340000
          560.916666666666700000
          29.104166666666670000
          7.937500000000000000)
        Pen.Width = 2
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape18: TQRShape
        Left = 156
        Top = 11
        Width = 3
        Height = 31
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          82.020833333333340000
          412.750000000000000000
          29.104166666666670000
          7.937500000000000000)
        Pen.Width = 2
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRLabel33: TQRLabel
        Left = 160
        Top = 17
        Width = 50
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          423.333333333333300000
          44.979166666666670000
          132.291666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '347-6'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial Black'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 12
      end
      object QRImage1: TQRImage
        Left = 64
        Top = 13
        Width = 88
        Height = 26
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          68.791666666666660000
          169.333333333333300000
          34.395833333333340000
          232.833333333333300000)
        Picture.Data = {
          07544269746D61707E2A0000424D7E2A0000000000003604000028000000C700
          0000310000000100080000000000482600000000000000000000000100000001
          0000F1EEEB0036110A00B09C8D0077564300DED6CF00C5B8AD00987E6C00FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707040000000400000004000000040000
          0004000000040000040007070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707000707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070700070707070707
          0707070707070707070707070707070707000000070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0700070707070707070707070707070707070402050707070705030507070707
          0606070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070702000707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070007070707070707070707070707070707040605070707
          0702010207070707050507070707070707070707070707070707070707070707
          0707040400070007070707000700000007070707040407070707070707070604
          0007000707070400000704000707040000070700070707070007040400070707
          0707000707070007070700070007070007000707070707070704040007070707
          0007070007000404000707070700070404000707070707070707070707070707
          0707070707070707070707070707070707000707070707070707070707070707
          0707070007070707070000000707070707070707070700070707070707070707
          0707070707070707070606060200020005050005050606030007000206060505
          0505020702040306060405040002060605050602050206060207000205070705
          0506060602070604070603000704060707040205050006060705050204040204
          0506060600070705020704020403020205020700040202060604070707070707
          0707070707070707070707070707070707070707070707070700070707070707
          0707070707000007070707070707070707070707070707070707070707070605
          0707070707070707070707070707070704030004060506000502040203050006
          0407040600000402050502000604060405020205000600000404000206060405
          0200070506040406050205070304030400030300070003050402020502000606
          0402050204040205060507030507070206070506040607070403000402060202
          0707070707070707070707070707070707070707070707070707070707070707
          0700070707070707070707070006060707070707070707070707070707070707
          0707070707070604070707070707070707070707070707070406000002050200
          0505000204020203000704030202050505050207020402040402050400030202
          0507060607050206020707040302030604020500060506000202060007070203
          0503020402050205050205020405020202040706050707020200020200060000
          0006030203040502070707070707070707070707070707070707070707070707
          0707070707070707070007070707070707070707070404070707070700070707
          0707070707070707070707070707070707070707070707070707070707070707
          0406040002020600020204020400040304070406040506050202060006040604
          0502020200060005060506070000040202000704020405020706060302070604
          0300060007070406070204040602040402020406060305050204070605000705
          0302030004010202070502000600020207070707070707070707070707070707
          0707070707070707070707070707070707000707070707070707070707070707
          0707040204070707070707070707070704040007070707070707070707070707
          0707070707070707040600000205060606060605040606060007000506060505
          0606060606070302030405030505060604040306050506060507070705020205
          0706050502040206020703000707000605060704060204070206040205020505
          0204070605070705060402020406000407040604020702020707070707070707
          0707070707070707070707070707070707070707070707070700070707070707
          0707070707070707070704060507070707000400070707070101000707070707
          0707070007070707070707070707070704060400060507040000040707000400
          0707070704040707000007040007070404070700000704040707040407070404
          0707070704060600000604000604060300000300070707050302070501020700
          0603050504040602060400030507070202000406040600000700060304000602
          0707070707070707070707070707070707070707070707070707070707070707
          0700070707070707070405070707070707070707070707070703010407070707
          0606000707070707070705060707070707070707070707070406000006050707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070003060707060606060703060007030007070705
          0304070503050707050305020606060005060606040707050305030504030502
          0707020307000202070707070707070707070707070707070707070707070707
          0707070707070707070007070707070707020307070707070707070707070707
          0706030407070707070707070707070707070506070707070707070707070707
          0700000700000707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070000070704050507070407
          0707040707070707040707000407070700000000050500070705020007070707
          0505040707050505070700040707000007070707070707070707070707070707
          0707070707070707070707070707070707000707070707070707070707070707
          0707070707070707070707070707040500070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070700070707070707
          0707070707070004000707070707070707070707070703010507070707000600
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0700070707070707070707070707040304070707070707070707070707070202
          0007070707070304070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070007070707000400070707070700050407070707070707
          0707070707070707070707070707070707070707000400070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707000707070700060407070707070707
          0707070707070707070707070707070707070707070707070707070704020507
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070700070707070704
          0407070707070707070707070405020202020202020202050500070707070707
          0707070700040407070707070707070707050505050505050505050505050505
          0505050505050505050505050505050505050505050505050505050505050505
          0505050505050505050505050505050505050505050505050505050505050505
          0505050505050505050505050505050505050505050505050505050505050505
          0505050505050505050505050505050505050505050707070707070707070707
          0700070707070707070707070707000402060303030303030303030303030303
          0303030606050407070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070007070707070707070700050606060606020505050504
          0404000404040404050502020606060602040707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707000707070707070700050505040504
          0007070707070707070707070707070504070707000404040502050407070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070700070707070707
          0700040000070707070707070707070707070707070707060200070707070707
          0700040000070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0700070707070707070707070707070707070707070707070707070707070700
          0007070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070007070707070707070707070707070707070203050707
          0707000007070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707000707070704050407070707050305
          0707070201050707070702060007070707070707000507070707070707050407
          0707070707070707070707000400070707070707070707070707000004000707
          0707070707070007070707000000070707070707070700000700000707070000
          0707000007070700070700070707070707070007070000070707070000070707
          0700000007070707070700000707000007070707070000070707000707070000
          0707070707070704000007070707070707070707070707070700070707070405
          0407070707020102070707000000070707070405070707070707070704030407
          0707070700020500070707070707070707040603060606040707070707070707
          0406030606060204070707070707020306060602060606020007070707000206
          0606060007000206060603020007000606060605070704070704030606060604
          0707070406060206060606030302000707070506060606060007000203060204
          0700060306060305000707070705060306060207070707070707070707070707
          0700070707070700000707070700040007070707070707070707070707070707
          0707070707040707070707070707000707070707070707070003010200000603
          0407070707070705010102040004020304070707070704060101030400050301
          0304070707070406010304070707070301010304070707000101050007040104
          0700050301030507070707000401010106050502010300070707040501010300
          0707020101030007070004030101060007070707050103050004030307070707
          0707070707070707070007070707070707070707070707070707070707040305
          0707070707070707070707070707070707070707070707070707070707070707
          0401050707070003030707070707000101050707070700060607070707070704
          0101040707070002010104070707070003060707070707060103040707070707
          0606000707020106070700060103070707070707070201030707070705010407
          0707070701010207070003010300070707070705010304070707070706010407
          0707000102070707070707070707070707000707070707070707070707070707
          0707070707050106070707070707070707070707070707070707070707070707
          0707070707070707040304070707070601040707070702010307070707070705
          0304070707070700010104070707070702010100070707070503000707070401
          0102070707070707060600070701010107070006010307070707070707060103
          0007070707020007070707070101020707050101050707070707070201030407
          0707070706020707070707010307070707070707070707070700070707070707
          0707070707070707070005040707040007070707070707070707070707070707
          0707070707070707070707070707070700040007070700010105070707070601
          0107070707070705060507070707070401010007070707070001010207070707
          0403020700070201010507070707070702060007050101030207000601060707
          0707070707060103000707000707070707070707010102070001010307070707
          0707070201010007070707070400070707070401010707070707070707070707
          0700070707070707070707070707070707050103070707070402050707070707
          0705020007070707070707070707070707070707070707070707070707050301
          0104070707070601030707070707070503040707070707040101040707070707
          0706010307070707070201030606010106070707070707070206000703010304
          0307000301060707070707070706010607070702050707070707070701010507
          0201010407070707070707020103040707070707070707070702010103070707
          0707070707070707070007070707070707070704070707070704060507070707
          0201060007070707070301040707070707000407070707070707070707070707
          0707070503010101060707070707060101070707070707050304070707070704
          0101000707070707070201010007070707040302040601010507070707070707
          0506000001010207030507060106070707070707070601030504040102070707
          0707070701010605010102070707070707070705010304070707070707070702
          0301010105070707070707070707070707000707070707070707050200070707
          0707070707070707040604070003060007050500070707070002060407070707
          0707070707070707070706010101010207070707070706010307070707070704
          0304070707070704010104070707070707060101040707070704060407020103
          0007070707070707050607060101070702030703010607070707070707060101
          0606030105070707070707070101030506030304070707070707070201030407
          0707070707040301010103050707070707070707070707070700070707070707
          0707050202070707070707070707070707070707000106000707070707070707
          0704060407070707070707070707070707060101010604070707070707000601
          0107070707070705030407070707070401010007070707070706010300070707
          0707050604010102070707070707070704060701010307070403000201060707
          0707070707060103040000030607070707070707010102070704010104070707
          0707070501010007070707070703010103020407070707070707070707070707
          0700070707070707070700040407070707070707070707070707070707000007
          0707070707070707070700070707070707070707070707070701010304070707
          0707070707070601030707070707070503040707070707000101040707070707
          0001010207070707070704060601010407070707070707070006050101040707
          0002060601020707070707070706010607070705040707070707070701010207
          0707060103070707070707020103040707070707040101020007070707070707
          0707070707070707070007070707070707070707070707070707070707070007
          0707070707070707070707070707070707070707070707070707070707070707
          0003010707070704040707070700020101070707070707050604070707070704
          0101000707070707060103000707070707070702010106070707070707070707
          0703030103070707070503060102070707070707070601030007070707000707
          0707070701010207070706010307070707070705010304070707070705010307
          0707070500070707070707070707070707000707070707070707070707070707
          0707070707050204070707070707070707070707070707070707070707070707
          0707070707070707070301040707070306070707070706010307070707070705
          0304070707070704010104070700000201010407070707070707070401010507
          0707070707070707070301010207070707000301010207070707070707060106
          0007070006060007070707070101020700040101060707070707070201030407
          0707070700010207070700010407070707070707070707070700070707070707
          0707070707070707070000000705020407070707070707070707040400070707
          0707070707070707070707070707070707040102000002010207070700040301
          0105000707070002010607070707050301010204040503010304070707070707
          0707070003030007070707070707070004010101070707070707020101030000
          0707070004030103020505060103070707070005010103000503010300070707
          0707040301010200070707070702010500040601000707070707070707070707
          0700070707070707070707070707070707050604070707070707070707070707
          0707040604070707070707070707070707070707070707070707040606060306
          0007070704060306060305070700020306030207070704020606060606060205
          0707070707070707070707070502070707070707070707020606030207070707
          0707000603060200070707040603060606060603030507070707020306060606
          0603050007070707070006030606030207070707070705060206030207070707
          0707070707070707070007070707070707070707070707070704050707070707
          0700040400070707070707050407070707070707070707070707070707070707
          0707070700000007070707070700070707000707070700070700070707070707
          0707070000070707070707070707070707070707070707070707070707070700
          0007070707070707070707070707000707070707000707070700070707070707
          0707000007070700000707070707070707070007070700070707070707070700
          0000070707070707070707070707070707000707070707070707070707070707
          0707070707070707070402060407070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070700070707070707
          0707070707070707070707070707070707000505000707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0700070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070007070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707000707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070700070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0700070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          07070707070707070700}
        Stretch = True
      end
      object QRDBText4: TQRDBText
        Left = 69
        Top = 99
        Width = 475
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          182.562500000000000000
          261.937500000000000000
          1256.770833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMContasReceber.QRBloqueto
        DataField = 'DESC_FILIAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRDBText6: TQRDBText
        Left = 140
        Top = 265
        Width = 297
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          370.416666666666700000
          701.145833333333400000
          785.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMContasReceber.QRBloqueto
        DataField = 'NOME_SACADO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText7: TQRDBText
        Left = 96
        Top = 280
        Width = 268
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          254.000000000000000000
          740.833333333333400000
          709.083333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMContasReceber.QRBloqueto
        DataField = 'DESC_ENDERECO_COBRANCA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText8: TQRDBText
        Left = 96
        Top = 293
        Width = 69
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          254.000000000000000000
          775.229166666666800000
          182.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMContasReceber.QRBloqueto
        DataField = 'DESC_CEP_COBRANCA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText9: TQRDBText
        Left = 368
        Top = 280
        Width = 185
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          973.666666666666600000
          740.833333333333400000
          489.479166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMContasReceber.QRBloqueto
        DataField = 'DESC_BAIRRO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText10: TQRDBText
        Left = 168
        Top = 293
        Width = 353
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          444.500000000000000000
          775.229166666666600000
          933.979166666666600000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMContasReceber.QRBloqueto
        DataField = 'DESC_CIDADE_COBRANCA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel34: TQRLabel
        Left = 525
        Top = 293
        Width = 5
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1389.062500000000000000
          775.229166666666700000
          13.229166666666670000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '-'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRDBText11: TQRDBText
        Left = 534
        Top = 293
        Width = 20
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1412.875000000000000000
          775.229166666666600000
          52.916666666666670000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMContasReceber.QRBloqueto
        DataField = 'DESC_ESTADO_COBRANCA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText12: TQRDBText
        Left = 167
        Top = 146
        Width = 44
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          441.854166666666700000
          386.291666666666700000
          116.416666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMContasReceber.QRBloqueto
        DataField = 'CARTEIRA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRDBText13: TQRDBText
        Left = 288
        Top = 122
        Width = 99
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          762.000000000000000000
          322.791666666666700000
          261.937500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMContasReceber.QRBloqueto
        DataField = 'DESC_TIPO_DOCUMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel35: TQRLabel
        Left = 69
        Top = 60
        Width = 478
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          182.562500000000000000
          158.750000000000000000
          1264.708333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Banco Sudameris'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel71: TQRLabel
        Left = 600
        Top = 122
        Width = 107
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1587.500000000000000000
          322.791666666666700000
          283.104166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'DV'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRMemo2: TQRMemo
        Left = 68
        Top = 173
        Width = 477
        Height = 77
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          203.729166666666700000
          179.916666666666700000
          457.729166666666600000
          1262.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText25: TQRDBText
        Left = 96
        Top = 265
        Width = 40
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          254.000000000000000000
          701.145833333333400000
          105.833333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMContasReceber.QRBloqueto
        DataField = 'COD_CADASTRO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Mask = '000000'
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText26: TQRDBText
        Left = 442
        Top = 265
        Width = 111
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1169.458333333333000000
          701.145833333333400000
          293.687500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMContasReceber.QRBloqueto
        DataField = 'NUM_CGC_CPF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel72: TQRLabel
        Left = 69
        Top = 76
        Width = 478
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          182.562500000000000000
          201.083333333333300000
          1264.708333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Pag'#225'vel em qualquer banco at'#233' o vencimento'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRShape37: TQRShape
        Left = 0
        Top = 353
        Width = 785
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          933.979166666666600000
          2076.979166666667000000)
        Pen.Style = psDot
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape56: TQRShape
        Left = 0
        Top = 701
        Width = 785
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          1854.729166666667000000
          2076.979166666667000000)
        Pen.Style = psDot
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRDBText5: TQRDBText
        Left = 78
        Top = 827
        Width = 70
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          206.375000000000000000
          2188.104166666667000000
          185.208333333333300000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = DMContasReceber.QRBloqueto
        DataField = 'DT_EMISSAO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText15: TQRDBText
        Left = 78
        Top = 122
        Width = 70
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          206.375000000000000000
          322.791666666666700000
          185.208333333333300000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = DMContasReceber.QRBloqueto
        DataField = 'DT_EMISSAO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText20: TQRDBText
        Left = 626
        Top = 225
        Width = 85
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1656.291666666667000000
          595.312500000000000000
          224.895833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMContasReceber.QRBloqueto
        DataField = 'val_acrescimo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Mask = '#,##0.00'
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText32: TQRDBText
        Left = 626
        Top = 930
        Width = 85
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1656.291666666667000000
          2460.625000000000000000
          224.895833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMContasReceber.QRBloqueto
        DataField = 'val_acrescimo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Mask = '#,##0.00'
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText14: TQRDBText
        Left = 398
        Top = 827
        Width = 30
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1053.041666666667000000
          2188.104166666667000000
          79.375000000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMContasReceber.QRBloqueto
        DataField = 'IND_ACEITE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRDBText31: TQRDBText
        Left = 398
        Top = 122
        Width = 30
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1053.041666666667000000
          322.791666666666700000
          79.375000000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMContasReceber.QRBloqueto
        DataField = 'IND_ACEITE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel31: TQRLabel
        Left = 165
        Top = 123
        Width = 116
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          436.562499999999900000
          325.437500000000000000
          306.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRLabel31'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel32: TQRLabel
        Left = 165
        Top = 828
        Width = 116
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          436.562499999999900000
          2190.750000000000000000
          306.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRLabel31'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
  end
end
