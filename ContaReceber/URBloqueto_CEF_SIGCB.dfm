object FRBloqueto_CEF_SIGCB: TFRBloqueto_CEF_SIGCB
  Left = 430
  Top = 155
  Width = 851
  Height = 540
  VertScrollBar.Position = 622
  Caption = 'Layout Caixa SIGCB'
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
    Left = 0
    Top = -622
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
    ReportTitle = 'Boleta'
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
        Left = 64
        Top = 944
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
        Top = 724
        Width = 654
        Height = 261
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          690.562500000000000000
          166.687500000000000000
          1915.583333333333000000
          1730.375000000000000000)
        Brush.Style = bsClear
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape20: TQRShape
        Left = 63
        Top = 749
        Width = 654
        Height = 2
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          5.291666666666667000
          166.687500000000000000
          1981.729166666667000000
          1730.375000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape21: TQRShape
        Left = 63
        Top = 789
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
          2087.562500000000000000
          1730.375000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape22: TQRShape
        Left = 63
        Top = 812
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
          2148.416666666667000000
          1730.375000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape23: TQRShape
        Left = 63
        Top = 836
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
          2211.916666666667000000
          1730.375000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape24: TQRShape
        Left = 63
        Top = 937
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
          2479.145833333333000000
          1730.375000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape25: TQRShape
        Left = 553
        Top = 714
        Width = 3
        Height = 218
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          576.791666666666700000
          1463.145833333333000000
          1889.125000000000000000
          7.937500000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape26: TQRShape
        Left = 554
        Top = 854
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
          2259.541666666667000000
          428.625000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape27: TQRShape
        Left = 554
        Top = 874
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
          2312.458333333333000000
          428.625000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape28: TQRShape
        Left = 554
        Top = 895
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
          2368.020833333333000000
          428.625000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape29: TQRShape
        Left = 554
        Top = 916
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
          2423.583333333333000000
          428.625000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape30: TQRShape
        Left = 160
        Top = 792
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
          2095.500000000000000000
          10.583333333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape31: TQRShape
        Left = 281
        Top = 791
        Width = 4
        Height = 47
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          124.354166666666700000
          743.479166666666800000
          2092.854166666667000000
          10.583333333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape32: TQRShape
        Left = 389
        Top = 790
        Width = 3
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666680000
          1029.229166666667000000
          2090.208333333333000000
          7.937500000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape33: TQRShape
        Left = 445
        Top = 752
        Width = 3
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          1177.395833333333000000
          1989.666666666667000000
          7.937500000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape34: TQRShape
        Left = 243
        Top = 815
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
          2156.354166666667000000
          7.937500000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRLabel27: TQRLabel
        Left = 66
        Top = 726
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
          1920.875000000000000000
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
        Top = 752
        Width = 35
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          174.625000000000000000
          1989.666666666667000000
          92.604166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'BENEFICI'#193'RIO'
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
        Top = 792
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
          2095.500000000000000000
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
        Top = 815
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
          2156.354166666667000000
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
        Top = 792
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
          2095.500000000000000000
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
        Top = 815
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
          2156.354166666667000000
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
        Top = 815
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
          2156.354166666667000000
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
        Top = 792
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
          2095.500000000000000000
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
        Top = 792
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
          2095.500000000000000000
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
        Top = 792
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
          2095.500000000000000000
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
        Top = 815
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
          2156.354166666667000000
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
        Top = 815
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
          2156.354166666667000000
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
        Top = 839
        Width = 244
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          174.625000000000000000
          2219.854166666667000000
          645.583333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 
          'INSTRU'#199#213'ES (Todas as informa'#231#245'es deste bloqueto s'#227'o de exclusiva' +
          ' responsabilidade do benefici'#225'rio)'
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
        Top = 726
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
          1920.875000000000000000
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
        Top = 760
        Width = 82
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          1476.375000000000000000
          2010.833333333333000000
          216.958333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'AG'#202'NCIA / C'#211'DIGO BENEFICI'#193'RIO'
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
        Top = 792
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
          2095.500000000000000000
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
        Top = 815
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
          2156.354166666667000000
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
        Top = 840
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
          2222.500000000000000000
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
        Top = 858
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
          2270.125000000000000000
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
        Top = 878
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
          2323.041666666667000000
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
        Top = 899
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
          2378.604166666667000000
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
        Top = 920
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
          2434.166666666667000000
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
        Top = 710
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
          1878.541666666667000000
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
        Top = 798
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
          2111.375000000000000000
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
        Top = 821
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
          2172.229166666667000000
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
        Top = 766
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
          2026.708333333333000000
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
        Top = 930
        Width = 59
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          174.625000000000000000
          2460.625000000000000000
          156.104166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'UNIDADE BENEFICI'#193'RIO'
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
        Top = 940
        Width = 26
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          174.625000000000000000
          2487.083333333333000000
          68.791666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'PAGADOR'
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
        Top = 989
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
          2616.729166666667000000
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
        Top = 735
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
          1944.687500000000000000
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
        Top = 820
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
          2169.583333333333000000
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
        Top = 698
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
          1846.791666666667000000
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
        Top = 698
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
          1846.791666666667000000
          76.729166666666680000)
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
        Top = 689
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
          1822.979166666667000000
          7.937500000000000000)
        Pen.Width = 2
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRLabel66: TQRLabel
        Left = 160
        Top = 693
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
          1833.562500000000000000
          132.291666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '104-0'
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
        Top = 689
        Width = 88
        Height = 26
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          68.791666666666680000
          169.333333333333300000
          1822.979166666667000000
          232.833333333333400000)
        Picture.Data = {
          07544269746D61702A300000424D2A3000000000000036000000280000007C00
          0000210000000100180000000000F42F0000C40E0000C40E0000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEEBEED6E1E6C3E0E3BFDFE0BBEBECD6FEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEF0F8E6E3EFD1E1E7C5F8F9F1FEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFAF7F1E2D3BCDDAE91D49F7FCC
          8A65CA815AC97F58C97E57CC8D68D0A383D4AB8BE3C9AEF2E9DBDECAB1D38376
          D0916BC79769C69464D09C78D39F7ED39F7ED29979E7CAB9FDFEFCFEFEFEFEFE
          FEFEFEFEFEFEFEFDFEFDF6FAF5D38376CF9F7FCFA07FCFA07FCFA07FCFA07FCF
          A07FCFA07FD9A78FEFCFC8EED9CFD09779D0A382CFA07FCFA07FCFA07FCFA07F
          CFA07FD09577E8DEC9F9F8F4A4CDFD7BBAFE7FBDFE7FBDFE7FBDFE7FBDFE7FBD
          FE7FBDFE7FBDFE80BDFE91C1FEFBFCFEFEFEFEFEFEFEFEFEFEE5C8BDD3A68CCF
          A07FCFA07FCFA07FCFA07FD1A181D5A285CFA07FCFA07FCFA281EEF1DEF6FAF0
          DA9585D19E80CFA180CFA07FCFA07FCFA07FCFA07FCFA07FD4AB8AE7D1BAFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEE4B8A6D3A384CFA07FCFA07FD09E7DD0
          9E7DCFA07FCFA07FD0977CDC9E93FBF8F2FEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFDEFEFDDDDAA8CC37E4EBE551FB4440AB63502B82F00B82F00B82F00B5
          3906B0490EB55217C47943D2B895D8C0A3AE2D06B73800B44309B4440AB4440A
          B2490EB3460CB23E04CA8D68EEEDE2FEFEFEFEFEFEFEFEFEFEFEFEFDFDFCF1F2
          E7B11F00AF440AAF460AAF460AAF460AAF460AAF460AAF460ABD6A3AE1BEA9E5
          BCADB34211B0490DAF460AAF460AAF460AAF460AAF460AAE3601D8AF97F6EEEB
          9AC8FD308EFE0A78FE0A78FE0A78FE0A78FE0A78FE0A78FE0A78FE0B78FE1E7D
          FEA8CEFEF6FAFEFEFEFEF5F9EFCB8368B34A18AF460AAF460AAF460AAF460AB1
          470DB54811AF460AAF470BB3551CEDF0DBF5FAEFC65A3DB34812AF470BAF460A
          AF460AAF460AAF460AAF460AB5531AD2956EFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFED17B61B54C17AF460AAF460AAE4E13AE4C12AF440AAF460AB03B07C2
          5438FBF7F1FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFDFDFCF6EFE6CFAB7DB73F07BB38
          00BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800B9420AB7
          7D4EFAF5F2B45F28BC3700BC3800BC3800BC3800B94109BB3C04BC3800BE6938
          DBC5AEFEFEFEFCFDFBFAFCF7FDFEFDFCFCFAECE5D2B82700BC3700BC3800BC38
          00BC3800BC3800BC3800BC3800C98455E7E7D1EAC5B8C24F25BC3800BC3800BC
          3800BC3800BC3800BC3800B83300D49487F4E8E7FEFEFE8CBAFE1D76FE0064FE
          0066FE0066FE0066FE0066FE0066FE0066FE0066FE2382FEC6E2FEF8FBFEE4D6
          BFC35C34BA3400BC3800BC3800BC3800BC3800BC3800BC3800BC3700BC3A07CB
          7D52FEFEFEFEFEFEE1A996BE4B19BB3800BC3800BC3800BC3800BC3800BC3800
          BC3B06CC704EFAF5F5F9FEF7F9FEF7F9FEF7F9FEF7F9FBF5CB7C63BE4210BC38
          00BC3800B84C15B94612BC3500BC3800BB3A07CA6D4FFEFEFEFEFEFEFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE
          FEFEFEFEFDFDF9F4EEDDB190B73100BC3800BB3E06BC3801BC3800BC3800BC38
          00BC3800BC3800BC3800BC3800BC3800BB3B03C05D2CFAF7F5CBA17DBC3102BC
          3700BC3800BC3800BC3800BC3800BC3800BF460FD89071F3DEDAEEDCD2E6D8C4
          F1DFD6F0DCD4CFBF9AB92F09BC3800BC3800BC3800BC3800BC3800BC3800BC38
          00D89374FAF8F6E9D0BEC16731BC3800BC3800BC3800BC3800BC3800BC3800BC
          3800BC9469ECE8DDFEFEFEF0F6FE7AAAFE0D69FE0167FE0066FE0066FE0066FE
          0066FE0066FE0066FE0066FE57AAFED1E5FAD28371C14515BC3800BC3800BC38
          00BC3800BC3800BC3800BC3800BB3701BB3F16DFE1CDFEFEFEFEFEFEFEFEFEBD
          6739B83B03BC3800BC3800BC3800BC3800BC3800BA3800C35C32E7C4BEE2DFC5
          E2DFC5E2DFC5E2DFC5E3D7BFB37540B84209BC3800BC3800BC3800BC3800BC38
          00BC3800BF4B1ED29787FEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFBF9F6E7CEB6B32100
          BC3800BC3800B3622BBB3B09BC3600BC3800BC3800BC3800BC3800BC3800BC38
          00BC3800BC3800C34F1EF7F4F0FBFEF8B72C04BC3700BC3800BC3800BC3800BC
          3800BC3800BC3800B62A00B01B00B32100B32100B32100B32100B32402A97841
          BB3A02BC3800BC3800BC3800BC3800BC3800BC3800D89374FAF8F6EBD8C7C477
          45BC3800BC3800BC3800BC3800BC3800BC3800BC3800B57B49EADFD2FEFEFEFE
          FEFED1ECFE5EACFE046DFE0066FE0066FE0066FE0066FE0066FE0066FE0066FE
          0066FE4B8FDEA7553FBC3B05BC3800BC3800BC3800BC3800BC3800BC3800BC38
          00BD3D06C96637FEFEFEFEFEFEFEFEFEFEFEFED69A6FC04B14BC3800BC3800BC
          3800BC3800BC3800BC3800BA3400B52800B32100B32100B32100B32100B32100
          BC2F00BC3600BC3800BC3800BC3800BC3800BC3800BC3800C1652FD8D8B1FEFE
          FEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFEFEFEFEFEFEF1E8DFAA692DBC3800BC3800BC3800BC3800BC3800
          BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800C34E1DF7E6
          E7FEFEFEBD7B3DBC3D05BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC
          3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800
          BC3800BC3800BC3800DA9777FCFEFAEEEAE1CB9C7ABD3200BC3800BC3800BC38
          00BC3800B3652FBC3807BF4D14EDD0C0FEFEFEFEFEFEFEFEFEBDE0FE449BFE00
          66FE0066FE0066FE0066FE0066FE0066FE0066FE0066FE056FFE8E3F3ABA3600
          BC3800BC3800BC3800BC3800BC3800BC3800BC3800C24718E3A3A7FEFEFEFEFE
          FEFEFEFEFEFEFEEFE5D2C85333BC3100BC3800BC3800BC3800BC3800BC3800BC
          3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800
          BC3800BC3800BC3800BC3800CE7046F9F3EAFEFEFEFEFEFEFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFDFCFBED
          D6CEB22C06BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800
          BC3800BC3800BC3800BC3800BC3800C24E1BF0E7DCFEFEFEF0D8D1B93211BB35
          00BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC
          3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800B4642DD4C1A4
          FEFEFEF4EBE4D59B81B82D00BC3800BC3800BC3800BC3800BB3E06BC3801BE44
          14EDCCC0FEFEFEFEFEFEFEFEFEF6FAFEB6DCFE429AFE0066FE0066FE0066FE00
          66FE0066FE0066FE0066FE0167FE126DE58B4842B84711B9430CBC3800BC3800
          BC3800BC3800BB3500C14925FBF3F3FEFEFEFEFEFEFEFEFEFEFEFEFCFBF9C58A
          64B84610BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC
          3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3B03
          CE774EF9F6F2FEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF4F2EBCCB090BB2E00BC3800BC3800BC
          3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800
          BC3800BF4912D8C39AFEFEFEFCF8F8CB5F4DBE3C09BC3800BC3800BC3800BC38
          00BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC
          3800BC3800BC3800BC3800BC3800C7694AE6C5C0FEFEFEF7F1EADBA88DB72C00
          BC3800BC3800BC3800BC3800BC3800BC3800BA400BEBCBBDFEFEFEFEFEFEFEFE
          FEFEFEFEF0F8FEA4D0FE2585FE0066FE0066FE0066FE0066FE0066FE0066FE00
          66FE006AFE2F5AC7964446C03903BC3800BC3800BC3800BC3800C04915D49876
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEE0D0BBC56135BC3600BC3800BC38
          00BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC
          3800BC3800BC3800BC3800BC3800BC3800BC3C03CF7B51FBFCF8FEFEFEFEFEFE
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFEFEFEF1E9DFC38F61BC3500BC3800BC3800BC3800BC3800BC3800BC3800BC
          3800BA3500BD3D0FC9623ACE8156C87643BD6026B23F05BB3E0DD29571FEFEFE
          FEFEFEDEA897C14015BC3600BC3800BC3800BC3800BC3800BC3800BC3800BC38
          00BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BA
          3500D38B72F3E8E6FEFEFEFCFAF7E3BDA9B13400BC3800BC3800BA3E06BC3800
          BC3800BC3800B83703E2C3ACFAFCF7FEFEFEFEFEFEFEFEFEFEFEFEE7F2FE8EC3
          FE127CFE0066FE0066FE0066FE0066FE0066FE0066FE0066FE0764F94D65B0A2
          4B3BC13600BC3800BC3800B93800BE5D2DF0E1D4FEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEF6F4EEC6734CB83700BC3800BC3800BC3800BC3800BC3800BC38
          00BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC
          3800BC3800B9450ECB8E67FDFEFCFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF3E1DAC8704CBC38
          00BC3800BC3800BC3800BC3800BC3800BC3800BC3800C5522ED68571E6BBABEB
          D5C3E6CBB3DDB99AD19577CB6C54C1764CFEFEFEFEFEFEF1E4DABF6137BB3C06
          BC3800BC3800BC3800BC3800BC3800BC3800BC3C04BD460DBD4911BD4710BC38
          00BC3800BC3800BC3800BC3800BC3800BC3800B93A05DAA78DFAFEFCFEFEFEFE
          FEFEE6CBBAAC4106BC3800BC3800BA3D05BC3800BC3800BC3800B93500DBB093
          F6F3ECFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEE2F0FE76B8FE0F79FE0066FE0066
          FE0066FE0066FE0066FE0066FE0066FE1471F361649CA8462FBC3800BC3800BB
          440DC7855CFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFED8A98A
          C05420BC3800BC3800BC3800BC3800BC3800BC3800BC3901BA4109BD4911C44E
          18BD3E06BC3901BC3800BC3800BC3800BC3800BC3800BC3800C05428D8A897FE
          FEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFEFEFEF1DCD6C35E3DBC3800BC3800BC3800BC3800BC38
          00BC3800BC3800BA4C15D79480F5E0E1FEFEFEFEFEFEFEFEFEFEFEFEFBF4F5E9
          C2C1C79970FDFEFCFEFEFEFEFEFECEA182BE4B18BC3800BC3800BC3800BC3800
          BC3800BC3800BF4810CA7642D4946ED28A65B93000BC3800BC3800BC3800BC38
          00BC3800BC3800BB420CDFAC95FEFEFEFEFEFEFEFEFEE8D1C1B05319BC3800BC
          3800BC3800BC3800BC3800BC3800BC3800D7927BF4E5E1FEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEE4F1FE63AFFE026AFE026AFE0066FE0066FE0066FE0066
          FE0066FE0066FE206DE8705F84B0431BBC3500C35528DEBFA3FEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF1E5D6CD764CBB3700BC3800BC3800
          BC3800BC3800BC3800BB3901B74811D0946DDD9B79C2622DBD3D06BC3800BC38
          00BC3800BC3800BC3800BC3800C9653DE8C8BFFEFEFEFEFEFEFEFEFEFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE
          EEDDD2B7602CBC3800BC3800BC3800BC3800BC3800BC3800BC3800BD7848E4D5
          C4FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFBF9F4EAFCFEF9FEFEFEFE
          FEFEF3E2DEC66134BB3A02BC3800BC3800BC3800BC3800BC3800C1501AD7A47B
          FBFEF8F3E8E0B32200BC3800BC3800BC3800BC3800BC3800BC3800BE4211E2AC
          98FEFEFEFEFEFEFEFEFEEBD8C9BB6731BC3800BC3800BC3800BC3800BC3800BC
          3800BC3800CC7863EFD9D6FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          E7F1FE338BFE056FFE0066FE0066FE0066FE0066FE0066FE0066FE0066FE3269
          D0845765B23811CA6849F4EFE7FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFAF9F7D58E74BD400FBC3800BC3800BC3800BC3800BC3800BB3800
          B9440EF1F5EFFEFEFECB9769BD450DBC3800BC3800BC3800BC3800BC3800BB38
          00C87747E9EAD1FEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF2DDD4C56035BC3800BC3800
          BC3800BC3800BC3800BC3800BC3800D7956FF3E6DAFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEC67F56BA420BBC
          3800BC3800BC3800BC3800BC3800B73C03BE7041F8FBF3E5E8CFB32200BC3800
          BC3800BC3800BC3800BC3800BC3800C14F1AE4B69EFEFEFEFEFEFEFEFEFEEDDD
          CDBE753CBC3800BC3800BC3800BC3800BC3800BC3800BC3800B1753FE2D7C4FE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFBFCFEDBEAFE1573FE1573FE
          1573FE1573FE1573FE1573FE1573FE1573FE1573FE4468BE96645CCC9C79FEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEE9CFC7CA
          704CBC3801BC3800BC3800BC3800BC3800BC3800BF410CEECECFFEFDFEC9935D
          BD440CBC3800BC3800BC3800BC3800BC3800B93901D08360FEFEFEFEFEFEFEFE
          FEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFEFEFEF3E3D7CA7741BC3800BC3800BC3800BC3800BC3800BC3800
          BC3800D38C65F1E1D5FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEDBC39FC25B26BC3800BC3800BC3800BC3800BC
          3800BA3600C55734F3DEDEE5E8CFB32200BC3800BC3800BC3800BC3800BC3800
          BC3800C07B48E3D6C0FEFEFEFEFEFEFEFEFEF5EAE1D79B77BC3800BC3800BC38
          00BC3800BC3800BC3800BC3800BC3F07E6BEA7FDFEFCFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEDC997FBD3D09BC3800BC3800BC
          3800BC3800BC3800BD3C05CC824DFEFDFCC7814EBD4109BC3800BC3800BC3800
          BC3800BC3800BD3E0BD78A6FFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF1E5D8C4
          7F44BC3800BC3800BC3800BC3800B54F1ABB3806BC3600C95B39EBC4BBFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFCFBF9CE764DBC3B03BC3800BC3800BC3800BC3800BC3800BE4C14CE9E6DE8
          D5C3B62900BC3800BC3800B94008BB3A02BC3800B83300D48367F3DED7FEFEFE
          FEFEFEFEFEFEF4F4EDD3B799BD3200BC3800BC3800BC3800BC3800BC3800BC38
          00BC3F07E6BAA8FDFCFCFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEC66E38C57B46C57D48C57D48C57D48C57D48C57D48C57D48C57D48
          BD8753C5B490FCF9FBFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEE5B5A4C7562EBC3400BC3800BC3800BC3800BC3800BB3800AB
          3A04FDFCFCB16F37B93E06BC3800BC3800BC3800BC3800BC3800BD440BD7936F
          FEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF7F3EFDBB79FBD3300BC3800BC3800BC
          3800BB3C05BC3801BC3800BE430FE2B19BFBFAF9FEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFED2BD9FBE5A2BBC36
          00BC3800BC3800BC3800BC3800B93F05BB6E38EFDBCCB62900BC3800BC3800BB
          3A02BC3800BC3800B83300D6A787F5F8EEFEFEFEFEFEFEFEFEFEFAF4F4E4B6AC
          B83100BC3800BC3800BC3800B94008BB3901BC3800BC3F07E6BAA8FDFCFCFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFCF9F7CD8F62BD420ABD430BBD
          430BBD430BBD430BBB4811BC470FBD430BBD430B9E5846567AC55C93FDFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFAF1EED59B
          7DB54108BC3800BC3800BC3800BC3800BB3800B43100F3DBDFC45C3BBD3C07BC
          3800BC3800BC3800BC3800BC3800BD6634D6C3A9FEFEFEFEFEFEFEFEFEFEFEFE
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFEFEFEFAFBF7E5D1BEB72700BC3800BC3800BC3800BC3800BC3800BC3800BC
          3A02C08255E2DAC9FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFCFAF8D5B498
          FDFDFDFEFEFEFEFEFEFEFEFEF0EEE6C9754EBA3700BC3800BC3800BC3800BC38
          00BB3701BE4B20DDB1A0B62E00BC3800BC3800BC3800BC3800BC3800B23E05DB
          B69BFBFEFAFEFEFEFEFEFEFEFEFEFBFAF7E5C6B4B72D00BC3800BC3800BC3800
          B84109BB3901BC3800BA3F07E5BAA8FDFCFCFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFDFEFDF2F6EEBA4114BC3800BC3800BC3800BC3800BC3800B93E06BA
          3C04BC3800C136008B4B541870F01573FE6AA6FEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEE0B29DBD4E1CBC3800BC3800BC38
          00BC3800BC3800BA3500DB9582B46737BA3E07BC3800BC3800BC3800BC3800BA
          3500C67046E6D5C2FEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFDFDFCECE1D4AF4F
          22BC3800BC3800BC3800BC3800BC3800BC3800BC3800B84C19C88C64E6D3BDF9
          F6F1FEFEFEFCFDFAF5F8EDEBE3D5CEA482C06947FDFCFCFEFEFEFEFEFEFEFEFE
          FEFEFED59E7CBD4D16BC3800BC3800BC3800BC3800BC3600BD3D0DC06F46BA31
          00BC3800BC3800BC3800BC3800BC3800B94D13E3BEA7FEFEFEFEFEFEFEFEFEFE
          FEFEFCFDFBE9D1C1B13100BC3800BC3800BC3800BA3C04BC3901BC3800BB3B03
          D49E79F2ECE0FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFBF8F7E4C1B5B532
          00BC3800BC3800BC3800BC3800BC3800BB3B03BB3A02BC3800AA48255F629303
          6BFE036BFE1577FE80B7FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEF1DED4CF8563B53700BC3800BC3800BC3800BC3800BC3800C164
          39B54A19BB3A03BC3800BC3800BC3800BC3800B93200CD7D5DF2EEE2FEFEFEFE
          FEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFEFEFEFEFEFEF5F0EBC29975BC3500BC3800BC3800BC38
          00BC3800BC3800BC3800BC3300BC4B15C97D4FDDA286E2B59CE0C1A6D9A885CE
          926BB15016B44D24FDFCFBFEFEFEFEFEFEFEFEFEFEFEFEE4D5BCC56B40BA3300
          BC3800BC3800BC3800BC3800BB3A02B54208BD3400BC3800BC3800BC3800BC38
          00BC3800C45C2BE9C6B5FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF0D8D1B9471EBC
          3800BC3800BC3800BC3800BC3800BC3800BC3800C9824DEBDBC6FEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEF8EFECC97757B73900BC3800BC3800BC3800BC38
          00BC3800BC3800BC3800BB3A028456572772DA0066FE0167FE036CFE1174FEA0
          C8FBFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFEFCDFB59D
          B6430CBC3800BC3800BC3800BC3800BC3800B74812BC3201BA3D06BC3A02BC38
          00BC3800BC3800B63702D08E70F9FEFBFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE
          FEFEFEFBFAF9E9D8CEBD380DBC3800BC3800BC3800BC3800BC3800BC3800BC38
          00BC3800BC3800BC3800BC4910BC6026BC3F06BC3E06BB3901AB4D11FDFCFBFE
          FEFEFEFEFEFEFEFEFEFEFEF5FEF2D28D73BC390DBC3800BC3800BC3800BC3800
          BC3800BC3800BB3D05BC3600BC3800BC3800BC3800BB3600CD7350EFD4C9FEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEF4DEDACB5E47BC3800BC3800BC3800BC3800BC
          3800BC3800BC3800C87141EAD0BEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFCFBFA
          EADACDB3420BBC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3700B246
          15626085036BFE0066FE0066FE0066FE0267FE1777FAC1D9F8FBFCFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEEACEBBC66A3ABC3400BC3800BC3800
          BC3800BC3800BC3800BC3800B9420ABB3B03BC3800BC3800BC3800B74209D39B
          7AFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEF9F1EFC7644C
          BB3B03BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC38
          00BC3800BC3800BC3800BB3800B43500FBFAF7FEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEE7BAACC85E37BB3700BC3800BC3800BC3800BC3800BC3901B8460EBD3200
          BC3800BC3800BC3800B73100D69A7DF4EAE3FEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEF4E1DBCB6B4CBC3800BC3800BC3800BC3800BC3800BC3800BC3800BB5B32E2
          C3B5FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF5F0EBCCA482BD2D00BC3800BC3800
          BC3800BC3800BC3800BC3800BC3800BC3601945A483D75BE0066FE0066FE0066
          FE0066FE0066FE0166FE237CEDD6E6F8FAFCFDFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEF5F3ECD8A68DBA3004BC3800BC3800BC3800BC3800BA3F08BC3901
          BC3800BC3800BC3800BC3800BC3800C04B15DEA588FEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFDFBFBB84C15BC3901BC3800BC3800
          BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BB37
          00B32100EFF4E2FDFDFCFEFEFEFEFEFEFEFEFEFEFEFEF7E7EAD3826DB93401BC
          3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800B72D00
          DBA78AF7F2EAFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF4EEE4CBA26DBC3800BC38
          00BC3800BC3800BC3800BC3800BC3800B55720DFC0AAFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEF2DED3BE5016BC3800BC3800BC3800BC3800BC3800BC3800BC3800
          BC3800B9420B5C58880066FE0066FE0066FE0066FE0066FE0066FE0066FE0066
          FE3785DFE3EEFAFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEE2CBB7AF
          591EBC3800BC3800BC3800BC3800B26630BB3C04BC3800BC3800BC3800BC3800
          BC3800C05F29DEBA9DFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFE
          FEFEFEFEFEFDFDFDCCCC99B73808BB3700BC3800BC3800BC3800BC3800BC3800
          BC3800BC3800BC3800BC3800BC3800BC3800BC3800B63000ECD2CBFDFBFAFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEDDA193BD4119BC3800BC3800BC3800BC3800BC
          3800BC3800BC3800BC3800BC3800BC3800AE4408E4C5B2FEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEF8F7F3DEC6ACBC3800BC3800BC3800BC3800BC3800BC38
          00BC3800B82E00D9A791F8FEFAFEFEFEFEFEFEFEFEFEFAF4ECE3B896B53900BC
          3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800B05A52546EC80066FE
          0066FE0066FE0066FE0066FE0066FE0066FE0066FE0066FE4BA4FEDEEFFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEEFEBE2CC9E7CBD3200BC3800BC3800BC
          3800BC3800BC3800BC3800BC3800BC3800BC3800BD3400C5804EE2E2C6FEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF9F9F3D7
          CCB3C04415BC3700BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800
          BC3800BC3800BC3800B63000E5C5C1FCF9F9FEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEF2F0E4D49272BD3000BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC
          3800BC3800B44513E6C6B6FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFAF9F6
          E6CDB8BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3700DE9F89FAF3
          F3FEFEFEFEFEFEFEFEFEECDDD0B76C3ABB3800BC3800BC3800BC3800BC3800BC
          3800BC3800BC3800BD3000DB9A86ABD2F53992FE0066FE0066FE0066FE0066FE
          0066FE0066FE0066FE0066FE086DFE7AB3F0E3EFFAFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFCFCFBE9C4B7BD3307BC3800BC3800BC3800BC3800BC3800BC3800BC
          3800BC3800BC3800B93000D2816CF5E7E6FEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF6F6F1E4B698BE401BBA3300BC
          3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BB3600
          D5C3ADFBF9F8FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFCFDFAD8B296B34A12BC38
          00BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BF6632EAD3C3FE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFCFBF8ECD3C2B83200BC3800BC3800
          BC3800BC3800BC3800BC3800BC3800DB9F82F7F2EDFEFEFEFEFEFEFDFEFCEBD2
          C0BA4911BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BF6A38E3
          CAB5EDF6FDA5CAF23A86EB0066FE0066FE0066FE0066FE0066FE0066FE0066FE
          0066FE1A77FA94C9FDE8F6FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF0E2D5C782
          4EBC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800B72C00D0
          8E74F4F9EFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEF8F0E7E6B9ADC67445B6380CB62D00BA3600BC3800BC
          3800BC3800BC3800BC3800BC3800BC3800BC3800C78657FAF4F0FEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEE9D4C2C7794ABC3800BC3800BC3800BC3800BC38
          00BC3800BC3800BC3800BC3800C68751EEE1D0FEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFDFDFCF2DCD2B62C00BC3800BC3800BC3800BC3800BC3800BC3800
          BC3800D19A6FF0EFDFFEFEFEFEFEFEF1D5CCCE6C4BBD3703BD3400BD3400BD34
          00BD3400BD3400BD3400BD3400B43800D39E7FF4EEE7FEFEFEE9F0F897BEEC28
          7CED0066FE0066FE0066FE0066FE0066FE0066FE0066FE0066FE2E86FEB4D4FE
          F7FAFEFEFEFEFEFEFEFEFEFEFEFEFEF9F6F1E1BCA4B93000BC3800BC3800BC38
          00BC3800BC3800BC3800BC3800BC3800B73D0BD6A186FAFEF9FEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEE5CCB5D89A88CF7462C55830BC470FBA3F07BC3D04BC3D04BC3E05BA
          4008BD3F0CC56344D6AF86FBF8F4FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          F8F1E9DDA787BD460CBD460CBD460CBD460CBD460CBD460CBD460CBD460CBC3F
          06D6A283F4ECE4FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF4E7E1B5
          592BBD460CBD460CBD460CBD460CBD460CBD460CBD460CCB925FEAE3CEFEFEFE
          FCF7F8E5C0B4BA6437BA6334BA6334BA6334BA6334BA6334BA6334BA6334BA63
          34B76C38E3C8B5FEFDFDFEFEFEFEFEFEE0EBF789B6F03085FE2383FE2B8AFE31
          8FFE318FFE318FFE2B8AFE2383FE1B7BFE5AA4FECAE3FEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFDFDF3DCD9C85942BD460CBD460CBD460CBD460CBD460CBD460CBD46
          0CBD460CBF5B24E0B69CFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF3D8
          DAE1AC9AD2946ECE8760D28059D27F59D1835BD08B66D6896CE0B8B3F1FDEDFD
          FEFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFEFCEED6C6D6926DD6926D
          D6926DD6926DD6926DD6926DD6926DD6926DD48964EDCDC7FBF6F7FEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF7F4F0CFB394D6926DD6926DD6926DD6
          926DD6926DD6926DD6926DDDB695F0E7D9FEFEFEFCF5F6ECD9D1D0BC9FD0BC9F
          D0BC9FD0BC9FD0BC9FD0BC9FD0BC9FD0BC9FD0BC9FD6C3A4F0E9DEFEFEFEFEFE
          FEFEFEFEFEFEFEE3EEFE9BC6FE89C2FE93CBFE9CD2FE9CD2FE9CD2FE94CBFE89
          C3FE7FB9FE6EB2FEC3DFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFAF0F1E7B3B1
          D6926DD6926DD6926DD6926DD6926DD6926DD6926DD6926DDBA380EED7C7FEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF8FEFAF3F8EEF7EC
          E5F7E8E5F8F3E8FBFEF9FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        Stretch = True
      end
      object QRDBText19: TQRDBText
        Left = 69
        Top = 757
        Width = 372
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          182.562500000000000000
          2002.895833333333000000
          984.250000000000000000)
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
        Left = 152
        Top = 940
        Width = 299
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          402.166666666666700000
          2487.083333333333000000
          791.104166666666700000)
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
        Left = 108
        Top = 953
        Width = 266
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          285.750000000000000000
          2521.479166666667000000
          703.791666666666700000)
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
        Left = 109
        Top = 965
        Width = 69
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          288.395833333333300000
          2553.229166666667000000
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
        Left = 380
        Top = 953
        Width = 185
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1005.416666666667000000
          2521.479166666667000000
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
        Left = 181
        Top = 965
        Width = 353
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          478.895833333333300000
          2553.229166666667000000
          933.979166666666700000)
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
        Top = 969
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
          2563.812500000000000000
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
        Left = 546
        Top = 965
        Width = 20
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1444.625000000000000000
          2553.229166666667000000
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
      object QRDBText30: TQRDBText
        Left = 288
        Top = 798
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
          2111.375000000000000000
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
        Top = 732
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
          1936.750000000000000000
          1264.708333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'PREFERENCIALMENTE NAS CASAS LOT'#201'RICAS AT'#201' O VALOR LIMITE'
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
        Left = 557
        Top = 798
        Width = 155
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1473.729166666667000000
          2111.375000000000000000
          410.104166666666700000)
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
        Top = 849
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
          2246.312500000000000000
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
        Left = 109
        Top = 940
        Width = 40
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          288.395833333333300000
          2487.083333333333000000
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
        Left = 455
        Top = 940
        Width = 111
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1203.854166666667000000
          2487.083333333333000000
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
      object QRImage3: TQRImage
        Left = 63
        Top = 1017
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
          2690.812500000000000000
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
          695.854166666666700000
          166.687500000000000000
          127.000000000000000000
          1730.375000000000000000)
        Brush.Style = bsClear
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape2: TQRShape
        Left = 63
        Top = 70
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
          185.208333333333300000
          1730.375000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape3: TQRShape
        Left = 63
        Top = 113
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
          298.979166666666700000
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
        Top = 73
        Width = 1
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          58.208333333333330000
          1166.812500000000000000
          193.145833333333300000
          2.645833333333333000)
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
        Top = 74
        Width = 35
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          174.625000000000000000
          195.791666666666700000
          92.604166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'BENEFICI'#193'RIO'
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
        Width = 244
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
          645.583333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 
          'INSTRU'#199#213'ES (Todas as informa'#231#245'es deste bloqueto s'#227'o de exclusiva' +
          ' responsabilidade do Benefici'#225'rio)'
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
        Top = 84
        Width = 82
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          1476.375000000000000000
          222.250000000000000000
          216.958333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'AG'#202'NCIA / C'#211'DIGO BENEFICI'#193'RIO'
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
          669.395833333333400000
          386.291666666666700000
          37.041666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
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
        Top = 90
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
          238.125000000000000000
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
        Width = 59
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
          156.104166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'UNIDADE BENEFICI'#193'RIO'
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
        Width = 26
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
          68.791666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'PAGADOR'
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
          828.145833333333400000
          288.395833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
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
        Top = 57
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
          150.812500000000000000
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
          328.083333333333400000)
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
        Top = 362
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
          957.791666666666700000
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
        Caption = '104-0'
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
          07544269746D61702A300000424D2A3000000000000036000000280000007C00
          0000210000000100180000000000F42F0000C40E0000C40E0000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEEBEED6E1E6C3E0E3BFDFE0BBEBECD6FEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEF0F8E6E3EFD1E1E7C5F8F9F1FEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFAF7F1E2D3BCDDAE91D49F7FCC
          8A65CA815AC97F58C97E57CC8D68D0A383D4AB8BE3C9AEF2E9DBDECAB1D38376
          D0916BC79769C69464D09C78D39F7ED39F7ED29979E7CAB9FDFEFCFEFEFEFEFE
          FEFEFEFEFEFEFEFDFEFDF6FAF5D38376CF9F7FCFA07FCFA07FCFA07FCFA07FCF
          A07FCFA07FD9A78FEFCFC8EED9CFD09779D0A382CFA07FCFA07FCFA07FCFA07F
          CFA07FD09577E8DEC9F9F8F4A4CDFD7BBAFE7FBDFE7FBDFE7FBDFE7FBDFE7FBD
          FE7FBDFE7FBDFE80BDFE91C1FEFBFCFEFEFEFEFEFEFEFEFEFEE5C8BDD3A68CCF
          A07FCFA07FCFA07FCFA07FD1A181D5A285CFA07FCFA07FCFA281EEF1DEF6FAF0
          DA9585D19E80CFA180CFA07FCFA07FCFA07FCFA07FCFA07FD4AB8AE7D1BAFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEE4B8A6D3A384CFA07FCFA07FD09E7DD0
          9E7DCFA07FCFA07FD0977CDC9E93FBF8F2FEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFDEFEFDDDDAA8CC37E4EBE551FB4440AB63502B82F00B82F00B82F00B5
          3906B0490EB55217C47943D2B895D8C0A3AE2D06B73800B44309B4440AB4440A
          B2490EB3460CB23E04CA8D68EEEDE2FEFEFEFEFEFEFEFEFEFEFEFEFDFDFCF1F2
          E7B11F00AF440AAF460AAF460AAF460AAF460AAF460AAF460ABD6A3AE1BEA9E5
          BCADB34211B0490DAF460AAF460AAF460AAF460AAF460AAE3601D8AF97F6EEEB
          9AC8FD308EFE0A78FE0A78FE0A78FE0A78FE0A78FE0A78FE0A78FE0B78FE1E7D
          FEA8CEFEF6FAFEFEFEFEF5F9EFCB8368B34A18AF460AAF460AAF460AAF460AB1
          470DB54811AF460AAF470BB3551CEDF0DBF5FAEFC65A3DB34812AF470BAF460A
          AF460AAF460AAF460AAF460AB5531AD2956EFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFED17B61B54C17AF460AAF460AAE4E13AE4C12AF440AAF460AB03B07C2
          5438FBF7F1FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFDFDFCF6EFE6CFAB7DB73F07BB38
          00BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800B9420AB7
          7D4EFAF5F2B45F28BC3700BC3800BC3800BC3800B94109BB3C04BC3800BE6938
          DBC5AEFEFEFEFCFDFBFAFCF7FDFEFDFCFCFAECE5D2B82700BC3700BC3800BC38
          00BC3800BC3800BC3800BC3800C98455E7E7D1EAC5B8C24F25BC3800BC3800BC
          3800BC3800BC3800BC3800B83300D49487F4E8E7FEFEFE8CBAFE1D76FE0064FE
          0066FE0066FE0066FE0066FE0066FE0066FE0066FE2382FEC6E2FEF8FBFEE4D6
          BFC35C34BA3400BC3800BC3800BC3800BC3800BC3800BC3800BC3700BC3A07CB
          7D52FEFEFEFEFEFEE1A996BE4B19BB3800BC3800BC3800BC3800BC3800BC3800
          BC3B06CC704EFAF5F5F9FEF7F9FEF7F9FEF7F9FEF7F9FBF5CB7C63BE4210BC38
          00BC3800B84C15B94612BC3500BC3800BB3A07CA6D4FFEFEFEFEFEFEFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE
          FEFEFEFEFDFDF9F4EEDDB190B73100BC3800BB3E06BC3801BC3800BC3800BC38
          00BC3800BC3800BC3800BC3800BC3800BB3B03C05D2CFAF7F5CBA17DBC3102BC
          3700BC3800BC3800BC3800BC3800BC3800BF460FD89071F3DEDAEEDCD2E6D8C4
          F1DFD6F0DCD4CFBF9AB92F09BC3800BC3800BC3800BC3800BC3800BC3800BC38
          00D89374FAF8F6E9D0BEC16731BC3800BC3800BC3800BC3800BC3800BC3800BC
          3800BC9469ECE8DDFEFEFEF0F6FE7AAAFE0D69FE0167FE0066FE0066FE0066FE
          0066FE0066FE0066FE0066FE57AAFED1E5FAD28371C14515BC3800BC3800BC38
          00BC3800BC3800BC3800BC3800BB3701BB3F16DFE1CDFEFEFEFEFEFEFEFEFEBD
          6739B83B03BC3800BC3800BC3800BC3800BC3800BA3800C35C32E7C4BEE2DFC5
          E2DFC5E2DFC5E2DFC5E3D7BFB37540B84209BC3800BC3800BC3800BC3800BC38
          00BC3800BF4B1ED29787FEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFBF9F6E7CEB6B32100
          BC3800BC3800B3622BBB3B09BC3600BC3800BC3800BC3800BC3800BC3800BC38
          00BC3800BC3800C34F1EF7F4F0FBFEF8B72C04BC3700BC3800BC3800BC3800BC
          3800BC3800BC3800B62A00B01B00B32100B32100B32100B32100B32402A97841
          BB3A02BC3800BC3800BC3800BC3800BC3800BC3800D89374FAF8F6EBD8C7C477
          45BC3800BC3800BC3800BC3800BC3800BC3800BC3800B57B49EADFD2FEFEFEFE
          FEFED1ECFE5EACFE046DFE0066FE0066FE0066FE0066FE0066FE0066FE0066FE
          0066FE4B8FDEA7553FBC3B05BC3800BC3800BC3800BC3800BC3800BC3800BC38
          00BD3D06C96637FEFEFEFEFEFEFEFEFEFEFEFED69A6FC04B14BC3800BC3800BC
          3800BC3800BC3800BC3800BA3400B52800B32100B32100B32100B32100B32100
          BC2F00BC3600BC3800BC3800BC3800BC3800BC3800BC3800C1652FD8D8B1FEFE
          FEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFEFEFEFEFEFEF1E8DFAA692DBC3800BC3800BC3800BC3800BC3800
          BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800C34E1DF7E6
          E7FEFEFEBD7B3DBC3D05BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC
          3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800
          BC3800BC3800BC3800DA9777FCFEFAEEEAE1CB9C7ABD3200BC3800BC3800BC38
          00BC3800B3652FBC3807BF4D14EDD0C0FEFEFEFEFEFEFEFEFEBDE0FE449BFE00
          66FE0066FE0066FE0066FE0066FE0066FE0066FE0066FE056FFE8E3F3ABA3600
          BC3800BC3800BC3800BC3800BC3800BC3800BC3800C24718E3A3A7FEFEFEFEFE
          FEFEFEFEFEFEFEEFE5D2C85333BC3100BC3800BC3800BC3800BC3800BC3800BC
          3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800
          BC3800BC3800BC3800BC3800CE7046F9F3EAFEFEFEFEFEFEFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFDFCFBED
          D6CEB22C06BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800
          BC3800BC3800BC3800BC3800BC3800C24E1BF0E7DCFEFEFEF0D8D1B93211BB35
          00BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC
          3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800B4642DD4C1A4
          FEFEFEF4EBE4D59B81B82D00BC3800BC3800BC3800BC3800BB3E06BC3801BE44
          14EDCCC0FEFEFEFEFEFEFEFEFEF6FAFEB6DCFE429AFE0066FE0066FE0066FE00
          66FE0066FE0066FE0066FE0167FE126DE58B4842B84711B9430CBC3800BC3800
          BC3800BC3800BB3500C14925FBF3F3FEFEFEFEFEFEFEFEFEFEFEFEFCFBF9C58A
          64B84610BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC
          3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3B03
          CE774EF9F6F2FEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF4F2EBCCB090BB2E00BC3800BC3800BC
          3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800
          BC3800BF4912D8C39AFEFEFEFCF8F8CB5F4DBE3C09BC3800BC3800BC3800BC38
          00BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC
          3800BC3800BC3800BC3800BC3800C7694AE6C5C0FEFEFEF7F1EADBA88DB72C00
          BC3800BC3800BC3800BC3800BC3800BC3800BA400BEBCBBDFEFEFEFEFEFEFEFE
          FEFEFEFEF0F8FEA4D0FE2585FE0066FE0066FE0066FE0066FE0066FE0066FE00
          66FE006AFE2F5AC7964446C03903BC3800BC3800BC3800BC3800C04915D49876
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEE0D0BBC56135BC3600BC3800BC38
          00BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC
          3800BC3800BC3800BC3800BC3800BC3800BC3C03CF7B51FBFCF8FEFEFEFEFEFE
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFEFEFEF1E9DFC38F61BC3500BC3800BC3800BC3800BC3800BC3800BC3800BC
          3800BA3500BD3D0FC9623ACE8156C87643BD6026B23F05BB3E0DD29571FEFEFE
          FEFEFEDEA897C14015BC3600BC3800BC3800BC3800BC3800BC3800BC3800BC38
          00BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BA
          3500D38B72F3E8E6FEFEFEFCFAF7E3BDA9B13400BC3800BC3800BA3E06BC3800
          BC3800BC3800B83703E2C3ACFAFCF7FEFEFEFEFEFEFEFEFEFEFEFEE7F2FE8EC3
          FE127CFE0066FE0066FE0066FE0066FE0066FE0066FE0066FE0764F94D65B0A2
          4B3BC13600BC3800BC3800B93800BE5D2DF0E1D4FEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEF6F4EEC6734CB83700BC3800BC3800BC3800BC3800BC3800BC38
          00BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC
          3800BC3800B9450ECB8E67FDFEFCFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF3E1DAC8704CBC38
          00BC3800BC3800BC3800BC3800BC3800BC3800BC3800C5522ED68571E6BBABEB
          D5C3E6CBB3DDB99AD19577CB6C54C1764CFEFEFEFEFEFEF1E4DABF6137BB3C06
          BC3800BC3800BC3800BC3800BC3800BC3800BC3C04BD460DBD4911BD4710BC38
          00BC3800BC3800BC3800BC3800BC3800BC3800B93A05DAA78DFAFEFCFEFEFEFE
          FEFEE6CBBAAC4106BC3800BC3800BA3D05BC3800BC3800BC3800B93500DBB093
          F6F3ECFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEE2F0FE76B8FE0F79FE0066FE0066
          FE0066FE0066FE0066FE0066FE0066FE1471F361649CA8462FBC3800BC3800BB
          440DC7855CFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFED8A98A
          C05420BC3800BC3800BC3800BC3800BC3800BC3800BC3901BA4109BD4911C44E
          18BD3E06BC3901BC3800BC3800BC3800BC3800BC3800BC3800C05428D8A897FE
          FEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFEFEFEF1DCD6C35E3DBC3800BC3800BC3800BC3800BC38
          00BC3800BC3800BA4C15D79480F5E0E1FEFEFEFEFEFEFEFEFEFEFEFEFBF4F5E9
          C2C1C79970FDFEFCFEFEFEFEFEFECEA182BE4B18BC3800BC3800BC3800BC3800
          BC3800BC3800BF4810CA7642D4946ED28A65B93000BC3800BC3800BC3800BC38
          00BC3800BC3800BB420CDFAC95FEFEFEFEFEFEFEFEFEE8D1C1B05319BC3800BC
          3800BC3800BC3800BC3800BC3800BC3800D7927BF4E5E1FEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEE4F1FE63AFFE026AFE026AFE0066FE0066FE0066FE0066
          FE0066FE0066FE206DE8705F84B0431BBC3500C35528DEBFA3FEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF1E5D6CD764CBB3700BC3800BC3800
          BC3800BC3800BC3800BB3901B74811D0946DDD9B79C2622DBD3D06BC3800BC38
          00BC3800BC3800BC3800BC3800C9653DE8C8BFFEFEFEFEFEFEFEFEFEFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE
          EEDDD2B7602CBC3800BC3800BC3800BC3800BC3800BC3800BC3800BD7848E4D5
          C4FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFBF9F4EAFCFEF9FEFEFEFE
          FEFEF3E2DEC66134BB3A02BC3800BC3800BC3800BC3800BC3800C1501AD7A47B
          FBFEF8F3E8E0B32200BC3800BC3800BC3800BC3800BC3800BC3800BE4211E2AC
          98FEFEFEFEFEFEFEFEFEEBD8C9BB6731BC3800BC3800BC3800BC3800BC3800BC
          3800BC3800CC7863EFD9D6FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          E7F1FE338BFE056FFE0066FE0066FE0066FE0066FE0066FE0066FE0066FE3269
          D0845765B23811CA6849F4EFE7FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFAF9F7D58E74BD400FBC3800BC3800BC3800BC3800BC3800BB3800
          B9440EF1F5EFFEFEFECB9769BD450DBC3800BC3800BC3800BC3800BC3800BB38
          00C87747E9EAD1FEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF2DDD4C56035BC3800BC3800
          BC3800BC3800BC3800BC3800BC3800D7956FF3E6DAFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEC67F56BA420BBC
          3800BC3800BC3800BC3800BC3800B73C03BE7041F8FBF3E5E8CFB32200BC3800
          BC3800BC3800BC3800BC3800BC3800C14F1AE4B69EFEFEFEFEFEFEFEFEFEEDDD
          CDBE753CBC3800BC3800BC3800BC3800BC3800BC3800BC3800B1753FE2D7C4FE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFBFCFEDBEAFE1573FE1573FE
          1573FE1573FE1573FE1573FE1573FE1573FE1573FE4468BE96645CCC9C79FEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEE9CFC7CA
          704CBC3801BC3800BC3800BC3800BC3800BC3800BF410CEECECFFEFDFEC9935D
          BD440CBC3800BC3800BC3800BC3800BC3800B93901D08360FEFEFEFEFEFEFEFE
          FEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFEFEFEF3E3D7CA7741BC3800BC3800BC3800BC3800BC3800BC3800
          BC3800D38C65F1E1D5FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEDBC39FC25B26BC3800BC3800BC3800BC3800BC
          3800BA3600C55734F3DEDEE5E8CFB32200BC3800BC3800BC3800BC3800BC3800
          BC3800C07B48E3D6C0FEFEFEFEFEFEFEFEFEF5EAE1D79B77BC3800BC3800BC38
          00BC3800BC3800BC3800BC3800BC3F07E6BEA7FDFEFCFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEDC997FBD3D09BC3800BC3800BC
          3800BC3800BC3800BD3C05CC824DFEFDFCC7814EBD4109BC3800BC3800BC3800
          BC3800BC3800BD3E0BD78A6FFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF1E5D8C4
          7F44BC3800BC3800BC3800BC3800B54F1ABB3806BC3600C95B39EBC4BBFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFCFBF9CE764DBC3B03BC3800BC3800BC3800BC3800BC3800BE4C14CE9E6DE8
          D5C3B62900BC3800BC3800B94008BB3A02BC3800B83300D48367F3DED7FEFEFE
          FEFEFEFEFEFEF4F4EDD3B799BD3200BC3800BC3800BC3800BC3800BC3800BC38
          00BC3F07E6BAA8FDFCFCFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEC66E38C57B46C57D48C57D48C57D48C57D48C57D48C57D48C57D48
          BD8753C5B490FCF9FBFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEE5B5A4C7562EBC3400BC3800BC3800BC3800BC3800BB3800AB
          3A04FDFCFCB16F37B93E06BC3800BC3800BC3800BC3800BC3800BD440BD7936F
          FEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF7F3EFDBB79FBD3300BC3800BC3800BC
          3800BB3C05BC3801BC3800BE430FE2B19BFBFAF9FEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFED2BD9FBE5A2BBC36
          00BC3800BC3800BC3800BC3800B93F05BB6E38EFDBCCB62900BC3800BC3800BB
          3A02BC3800BC3800B83300D6A787F5F8EEFEFEFEFEFEFEFEFEFEFAF4F4E4B6AC
          B83100BC3800BC3800BC3800B94008BB3901BC3800BC3F07E6BAA8FDFCFCFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFCF9F7CD8F62BD420ABD430BBD
          430BBD430BBD430BBB4811BC470FBD430BBD430B9E5846567AC55C93FDFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFAF1EED59B
          7DB54108BC3800BC3800BC3800BC3800BB3800B43100F3DBDFC45C3BBD3C07BC
          3800BC3800BC3800BC3800BC3800BD6634D6C3A9FEFEFEFEFEFEFEFEFEFEFEFE
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFEFEFEFAFBF7E5D1BEB72700BC3800BC3800BC3800BC3800BC3800BC3800BC
          3A02C08255E2DAC9FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFCFAF8D5B498
          FDFDFDFEFEFEFEFEFEFEFEFEF0EEE6C9754EBA3700BC3800BC3800BC3800BC38
          00BB3701BE4B20DDB1A0B62E00BC3800BC3800BC3800BC3800BC3800B23E05DB
          B69BFBFEFAFEFEFEFEFEFEFEFEFEFBFAF7E5C6B4B72D00BC3800BC3800BC3800
          B84109BB3901BC3800BA3F07E5BAA8FDFCFCFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFDFEFDF2F6EEBA4114BC3800BC3800BC3800BC3800BC3800B93E06BA
          3C04BC3800C136008B4B541870F01573FE6AA6FEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEE0B29DBD4E1CBC3800BC3800BC38
          00BC3800BC3800BA3500DB9582B46737BA3E07BC3800BC3800BC3800BC3800BA
          3500C67046E6D5C2FEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFDFDFCECE1D4AF4F
          22BC3800BC3800BC3800BC3800BC3800BC3800BC3800B84C19C88C64E6D3BDF9
          F6F1FEFEFEFCFDFAF5F8EDEBE3D5CEA482C06947FDFCFCFEFEFEFEFEFEFEFEFE
          FEFEFED59E7CBD4D16BC3800BC3800BC3800BC3800BC3600BD3D0DC06F46BA31
          00BC3800BC3800BC3800BC3800BC3800B94D13E3BEA7FEFEFEFEFEFEFEFEFEFE
          FEFEFCFDFBE9D1C1B13100BC3800BC3800BC3800BA3C04BC3901BC3800BB3B03
          D49E79F2ECE0FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFBF8F7E4C1B5B532
          00BC3800BC3800BC3800BC3800BC3800BB3B03BB3A02BC3800AA48255F629303
          6BFE036BFE1577FE80B7FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEF1DED4CF8563B53700BC3800BC3800BC3800BC3800BC3800C164
          39B54A19BB3A03BC3800BC3800BC3800BC3800B93200CD7D5DF2EEE2FEFEFEFE
          FEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFEFEFEFEFEFEF5F0EBC29975BC3500BC3800BC3800BC38
          00BC3800BC3800BC3800BC3300BC4B15C97D4FDDA286E2B59CE0C1A6D9A885CE
          926BB15016B44D24FDFCFBFEFEFEFEFEFEFEFEFEFEFEFEE4D5BCC56B40BA3300
          BC3800BC3800BC3800BC3800BB3A02B54208BD3400BC3800BC3800BC3800BC38
          00BC3800C45C2BE9C6B5FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF0D8D1B9471EBC
          3800BC3800BC3800BC3800BC3800BC3800BC3800C9824DEBDBC6FEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEF8EFECC97757B73900BC3800BC3800BC3800BC38
          00BC3800BC3800BC3800BB3A028456572772DA0066FE0167FE036CFE1174FEA0
          C8FBFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFEFCDFB59D
          B6430CBC3800BC3800BC3800BC3800BC3800B74812BC3201BA3D06BC3A02BC38
          00BC3800BC3800B63702D08E70F9FEFBFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE
          FEFEFEFBFAF9E9D8CEBD380DBC3800BC3800BC3800BC3800BC3800BC3800BC38
          00BC3800BC3800BC3800BC4910BC6026BC3F06BC3E06BB3901AB4D11FDFCFBFE
          FEFEFEFEFEFEFEFEFEFEFEF5FEF2D28D73BC390DBC3800BC3800BC3800BC3800
          BC3800BC3800BB3D05BC3600BC3800BC3800BC3800BB3600CD7350EFD4C9FEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEF4DEDACB5E47BC3800BC3800BC3800BC3800BC
          3800BC3800BC3800C87141EAD0BEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFCFBFA
          EADACDB3420BBC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3700B246
          15626085036BFE0066FE0066FE0066FE0267FE1777FAC1D9F8FBFCFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEEACEBBC66A3ABC3400BC3800BC3800
          BC3800BC3800BC3800BC3800B9420ABB3B03BC3800BC3800BC3800B74209D39B
          7AFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEF9F1EFC7644C
          BB3B03BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC38
          00BC3800BC3800BC3800BB3800B43500FBFAF7FEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEE7BAACC85E37BB3700BC3800BC3800BC3800BC3800BC3901B8460EBD3200
          BC3800BC3800BC3800B73100D69A7DF4EAE3FEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEF4E1DBCB6B4CBC3800BC3800BC3800BC3800BC3800BC3800BC3800BB5B32E2
          C3B5FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF5F0EBCCA482BD2D00BC3800BC3800
          BC3800BC3800BC3800BC3800BC3800BC3601945A483D75BE0066FE0066FE0066
          FE0066FE0066FE0166FE237CEDD6E6F8FAFCFDFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEF5F3ECD8A68DBA3004BC3800BC3800BC3800BC3800BA3F08BC3901
          BC3800BC3800BC3800BC3800BC3800C04B15DEA588FEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFDFBFBB84C15BC3901BC3800BC3800
          BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BB37
          00B32100EFF4E2FDFDFCFEFEFEFEFEFEFEFEFEFEFEFEF7E7EAD3826DB93401BC
          3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800B72D00
          DBA78AF7F2EAFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF4EEE4CBA26DBC3800BC38
          00BC3800BC3800BC3800BC3800BC3800B55720DFC0AAFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEF2DED3BE5016BC3800BC3800BC3800BC3800BC3800BC3800BC3800
          BC3800B9420B5C58880066FE0066FE0066FE0066FE0066FE0066FE0066FE0066
          FE3785DFE3EEFAFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEE2CBB7AF
          591EBC3800BC3800BC3800BC3800B26630BB3C04BC3800BC3800BC3800BC3800
          BC3800C05F29DEBA9DFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFE
          FEFEFEFEFEFDFDFDCCCC99B73808BB3700BC3800BC3800BC3800BC3800BC3800
          BC3800BC3800BC3800BC3800BC3800BC3800BC3800B63000ECD2CBFDFBFAFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEDDA193BD4119BC3800BC3800BC3800BC3800BC
          3800BC3800BC3800BC3800BC3800BC3800AE4408E4C5B2FEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEF8F7F3DEC6ACBC3800BC3800BC3800BC3800BC3800BC38
          00BC3800B82E00D9A791F8FEFAFEFEFEFEFEFEFEFEFEFAF4ECE3B896B53900BC
          3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800B05A52546EC80066FE
          0066FE0066FE0066FE0066FE0066FE0066FE0066FE0066FE4BA4FEDEEFFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEEFEBE2CC9E7CBD3200BC3800BC3800BC
          3800BC3800BC3800BC3800BC3800BC3800BC3800BD3400C5804EE2E2C6FEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF9F9F3D7
          CCB3C04415BC3700BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800
          BC3800BC3800BC3800B63000E5C5C1FCF9F9FEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEF2F0E4D49272BD3000BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC
          3800BC3800B44513E6C6B6FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFAF9F6
          E6CDB8BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3700DE9F89FAF3
          F3FEFEFEFEFEFEFEFEFEECDDD0B76C3ABB3800BC3800BC3800BC3800BC3800BC
          3800BC3800BC3800BD3000DB9A86ABD2F53992FE0066FE0066FE0066FE0066FE
          0066FE0066FE0066FE0066FE086DFE7AB3F0E3EFFAFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFCFCFBE9C4B7BD3307BC3800BC3800BC3800BC3800BC3800BC3800BC
          3800BC3800BC3800B93000D2816CF5E7E6FEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF6F6F1E4B698BE401BBA3300BC
          3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BB3600
          D5C3ADFBF9F8FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFCFDFAD8B296B34A12BC38
          00BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BF6632EAD3C3FE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFCFBF8ECD3C2B83200BC3800BC3800
          BC3800BC3800BC3800BC3800BC3800DB9F82F7F2EDFEFEFEFEFEFEFDFEFCEBD2
          C0BA4911BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BF6A38E3
          CAB5EDF6FDA5CAF23A86EB0066FE0066FE0066FE0066FE0066FE0066FE0066FE
          0066FE1A77FA94C9FDE8F6FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF0E2D5C782
          4EBC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800B72C00D0
          8E74F4F9EFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEF8F0E7E6B9ADC67445B6380CB62D00BA3600BC3800BC
          3800BC3800BC3800BC3800BC3800BC3800BC3800C78657FAF4F0FEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEE9D4C2C7794ABC3800BC3800BC3800BC3800BC38
          00BC3800BC3800BC3800BC3800C68751EEE1D0FEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFDFDFCF2DCD2B62C00BC3800BC3800BC3800BC3800BC3800BC3800
          BC3800D19A6FF0EFDFFEFEFEFEFEFEF1D5CCCE6C4BBD3703BD3400BD3400BD34
          00BD3400BD3400BD3400BD3400B43800D39E7FF4EEE7FEFEFEE9F0F897BEEC28
          7CED0066FE0066FE0066FE0066FE0066FE0066FE0066FE0066FE2E86FEB4D4FE
          F7FAFEFEFEFEFEFEFEFEFEFEFEFEFEF9F6F1E1BCA4B93000BC3800BC3800BC38
          00BC3800BC3800BC3800BC3800BC3800B73D0BD6A186FAFEF9FEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEE5CCB5D89A88CF7462C55830BC470FBA3F07BC3D04BC3D04BC3E05BA
          4008BD3F0CC56344D6AF86FBF8F4FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          F8F1E9DDA787BD460CBD460CBD460CBD460CBD460CBD460CBD460CBD460CBC3F
          06D6A283F4ECE4FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF4E7E1B5
          592BBD460CBD460CBD460CBD460CBD460CBD460CBD460CCB925FEAE3CEFEFEFE
          FCF7F8E5C0B4BA6437BA6334BA6334BA6334BA6334BA6334BA6334BA6334BA63
          34B76C38E3C8B5FEFDFDFEFEFEFEFEFEE0EBF789B6F03085FE2383FE2B8AFE31
          8FFE318FFE318FFE2B8AFE2383FE1B7BFE5AA4FECAE3FEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFDFDF3DCD9C85942BD460CBD460CBD460CBD460CBD460CBD460CBD46
          0CBD460CBF5B24E0B69CFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF3D8
          DAE1AC9AD2946ECE8760D28059D27F59D1835BD08B66D6896CE0B8B3F1FDEDFD
          FEFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFEFCEED6C6D6926DD6926D
          D6926DD6926DD6926DD6926DD6926DD6926DD48964EDCDC7FBF6F7FEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF7F4F0CFB394D6926DD6926DD6926DD6
          926DD6926DD6926DD6926DDDB695F0E7D9FEFEFEFCF5F6ECD9D1D0BC9FD0BC9F
          D0BC9FD0BC9FD0BC9FD0BC9FD0BC9FD0BC9FD0BC9FD6C3A4F0E9DEFEFEFEFEFE
          FEFEFEFEFEFEFEE3EEFE9BC6FE89C2FE93CBFE9CD2FE9CD2FE9CD2FE94CBFE89
          C3FE7FB9FE6EB2FEC3DFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFAF0F1E7B3B1
          D6926DD6926DD6926DD6926DD6926DD6926DD6926DD6926DDBA380EED7C7FEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF8FEFAF3F8EEF7EC
          E5F7E8E5F8F3E8FBFEF9FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        Stretch = True
      end
      object QRDBText4: TQRDBText
        Left = 69
        Top = 80
        Width = 372
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          182.562500000000000000
          211.666666666666700000
          984.250000000000000000)
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
        Top = 278
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
          735.541666666666700000
          709.083333333333300000)
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
        Top = 291
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
          769.937500000000000000
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
        Top = 279
        Width = 185
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          973.666666666666700000
          738.187500000000000000
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
        Top = 291
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
          769.937500000000000000
          933.979166666666700000)
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
        Left = 526
        Top = 291
        Width = 5
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1391.708333333333000000
          769.937500000000000000
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
        Top = 290
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
          767.291666666666700000
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
        Top = 55
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
          145.520833333333300000
          1264.708333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'PREFERENCIALMENTE NAS CASAS LOT'#201'RICAS AT'#201' O VALOR LIMITE'
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
        Left = 557
        Top = 122
        Width = 155
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1473.729166666667000000
          322.791666666666700000
          410.104166666666700000)
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
      object QRShape37: TQRShape
        Left = 0
        Top = 330
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
          873.124999999999900000
          2076.979166666667000000)
        Pen.Style = psDot
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape56: TQRShape
        Left = 0
        Top = 663
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
          1754.187500000000000000
          2076.979166666667000000)
        Pen.Style = psDot
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRDBText5: TQRDBText
        Left = 78
        Top = 798
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
          2111.375000000000000000
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
        Top = 901
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
          2383.895833333333000000
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
        Top = 798
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
          2111.375000000000000000
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
        Top = 122
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
          322.791666666666700000
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
        Top = 798
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
          2111.375000000000000000
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
      object QRLabel36: TQRLabel
        Left = 195
        Top = 144
        Width = 38
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          515.937500000000000000
          381.000000000000000000
          100.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'SR'
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
      object QRLabel63: TQRLabel
        Left = 195
        Top = 819
        Width = 38
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          515.937500000000000000
          2166.937500000000000000
          100.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'SR'
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
      object QRLabel69: TQRLabel
        Left = 470
        Top = 819
        Width = 38
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1243.541666666667000000
          2166.937500000000000000
          100.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'REAL'
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
      object QRLabel73: TQRLabel
        Left = 470
        Top = 144
        Width = 38
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1243.541666666667000000
          381.000000000000000000
          100.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'REAL'
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
      object QRShape36: TQRShape
        Left = 156
        Top = 689
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
          1822.979166666667000000
          7.937500000000000000)
        Pen.Width = 2
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRImage4: TQRImage
        Left = 64
        Top = 349
        Width = 88
        Height = 26
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          68.791666666666680000
          169.333333333333300000
          923.395833333333400000
          232.833333333333400000)
        Picture.Data = {
          07544269746D61702A300000424D2A3000000000000036000000280000007C00
          0000210000000100180000000000F42F0000C40E0000C40E0000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEEBEED6E1E6C3E0E3BFDFE0BBEBECD6FEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEF0F8E6E3EFD1E1E7C5F8F9F1FEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFAF7F1E2D3BCDDAE91D49F7FCC
          8A65CA815AC97F58C97E57CC8D68D0A383D4AB8BE3C9AEF2E9DBDECAB1D38376
          D0916BC79769C69464D09C78D39F7ED39F7ED29979E7CAB9FDFEFCFEFEFEFEFE
          FEFEFEFEFEFEFEFDFEFDF6FAF5D38376CF9F7FCFA07FCFA07FCFA07FCFA07FCF
          A07FCFA07FD9A78FEFCFC8EED9CFD09779D0A382CFA07FCFA07FCFA07FCFA07F
          CFA07FD09577E8DEC9F9F8F4A4CDFD7BBAFE7FBDFE7FBDFE7FBDFE7FBDFE7FBD
          FE7FBDFE7FBDFE80BDFE91C1FEFBFCFEFEFEFEFEFEFEFEFEFEE5C8BDD3A68CCF
          A07FCFA07FCFA07FCFA07FD1A181D5A285CFA07FCFA07FCFA281EEF1DEF6FAF0
          DA9585D19E80CFA180CFA07FCFA07FCFA07FCFA07FCFA07FD4AB8AE7D1BAFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEE4B8A6D3A384CFA07FCFA07FD09E7DD0
          9E7DCFA07FCFA07FD0977CDC9E93FBF8F2FEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFDEFEFDDDDAA8CC37E4EBE551FB4440AB63502B82F00B82F00B82F00B5
          3906B0490EB55217C47943D2B895D8C0A3AE2D06B73800B44309B4440AB4440A
          B2490EB3460CB23E04CA8D68EEEDE2FEFEFEFEFEFEFEFEFEFEFEFEFDFDFCF1F2
          E7B11F00AF440AAF460AAF460AAF460AAF460AAF460AAF460ABD6A3AE1BEA9E5
          BCADB34211B0490DAF460AAF460AAF460AAF460AAF460AAE3601D8AF97F6EEEB
          9AC8FD308EFE0A78FE0A78FE0A78FE0A78FE0A78FE0A78FE0A78FE0B78FE1E7D
          FEA8CEFEF6FAFEFEFEFEF5F9EFCB8368B34A18AF460AAF460AAF460AAF460AB1
          470DB54811AF460AAF470BB3551CEDF0DBF5FAEFC65A3DB34812AF470BAF460A
          AF460AAF460AAF460AAF460AB5531AD2956EFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFED17B61B54C17AF460AAF460AAE4E13AE4C12AF440AAF460AB03B07C2
          5438FBF7F1FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFDFDFCF6EFE6CFAB7DB73F07BB38
          00BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800B9420AB7
          7D4EFAF5F2B45F28BC3700BC3800BC3800BC3800B94109BB3C04BC3800BE6938
          DBC5AEFEFEFEFCFDFBFAFCF7FDFEFDFCFCFAECE5D2B82700BC3700BC3800BC38
          00BC3800BC3800BC3800BC3800C98455E7E7D1EAC5B8C24F25BC3800BC3800BC
          3800BC3800BC3800BC3800B83300D49487F4E8E7FEFEFE8CBAFE1D76FE0064FE
          0066FE0066FE0066FE0066FE0066FE0066FE0066FE2382FEC6E2FEF8FBFEE4D6
          BFC35C34BA3400BC3800BC3800BC3800BC3800BC3800BC3800BC3700BC3A07CB
          7D52FEFEFEFEFEFEE1A996BE4B19BB3800BC3800BC3800BC3800BC3800BC3800
          BC3B06CC704EFAF5F5F9FEF7F9FEF7F9FEF7F9FEF7F9FBF5CB7C63BE4210BC38
          00BC3800B84C15B94612BC3500BC3800BB3A07CA6D4FFEFEFEFEFEFEFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE
          FEFEFEFEFDFDF9F4EEDDB190B73100BC3800BB3E06BC3801BC3800BC3800BC38
          00BC3800BC3800BC3800BC3800BC3800BB3B03C05D2CFAF7F5CBA17DBC3102BC
          3700BC3800BC3800BC3800BC3800BC3800BF460FD89071F3DEDAEEDCD2E6D8C4
          F1DFD6F0DCD4CFBF9AB92F09BC3800BC3800BC3800BC3800BC3800BC3800BC38
          00D89374FAF8F6E9D0BEC16731BC3800BC3800BC3800BC3800BC3800BC3800BC
          3800BC9469ECE8DDFEFEFEF0F6FE7AAAFE0D69FE0167FE0066FE0066FE0066FE
          0066FE0066FE0066FE0066FE57AAFED1E5FAD28371C14515BC3800BC3800BC38
          00BC3800BC3800BC3800BC3800BB3701BB3F16DFE1CDFEFEFEFEFEFEFEFEFEBD
          6739B83B03BC3800BC3800BC3800BC3800BC3800BA3800C35C32E7C4BEE2DFC5
          E2DFC5E2DFC5E2DFC5E3D7BFB37540B84209BC3800BC3800BC3800BC3800BC38
          00BC3800BF4B1ED29787FEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFBF9F6E7CEB6B32100
          BC3800BC3800B3622BBB3B09BC3600BC3800BC3800BC3800BC3800BC3800BC38
          00BC3800BC3800C34F1EF7F4F0FBFEF8B72C04BC3700BC3800BC3800BC3800BC
          3800BC3800BC3800B62A00B01B00B32100B32100B32100B32100B32402A97841
          BB3A02BC3800BC3800BC3800BC3800BC3800BC3800D89374FAF8F6EBD8C7C477
          45BC3800BC3800BC3800BC3800BC3800BC3800BC3800B57B49EADFD2FEFEFEFE
          FEFED1ECFE5EACFE046DFE0066FE0066FE0066FE0066FE0066FE0066FE0066FE
          0066FE4B8FDEA7553FBC3B05BC3800BC3800BC3800BC3800BC3800BC3800BC38
          00BD3D06C96637FEFEFEFEFEFEFEFEFEFEFEFED69A6FC04B14BC3800BC3800BC
          3800BC3800BC3800BC3800BA3400B52800B32100B32100B32100B32100B32100
          BC2F00BC3600BC3800BC3800BC3800BC3800BC3800BC3800C1652FD8D8B1FEFE
          FEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFEFEFEFEFEFEF1E8DFAA692DBC3800BC3800BC3800BC3800BC3800
          BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800C34E1DF7E6
          E7FEFEFEBD7B3DBC3D05BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC
          3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800
          BC3800BC3800BC3800DA9777FCFEFAEEEAE1CB9C7ABD3200BC3800BC3800BC38
          00BC3800B3652FBC3807BF4D14EDD0C0FEFEFEFEFEFEFEFEFEBDE0FE449BFE00
          66FE0066FE0066FE0066FE0066FE0066FE0066FE0066FE056FFE8E3F3ABA3600
          BC3800BC3800BC3800BC3800BC3800BC3800BC3800C24718E3A3A7FEFEFEFEFE
          FEFEFEFEFEFEFEEFE5D2C85333BC3100BC3800BC3800BC3800BC3800BC3800BC
          3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800
          BC3800BC3800BC3800BC3800CE7046F9F3EAFEFEFEFEFEFEFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFDFCFBED
          D6CEB22C06BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800
          BC3800BC3800BC3800BC3800BC3800C24E1BF0E7DCFEFEFEF0D8D1B93211BB35
          00BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC
          3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800B4642DD4C1A4
          FEFEFEF4EBE4D59B81B82D00BC3800BC3800BC3800BC3800BB3E06BC3801BE44
          14EDCCC0FEFEFEFEFEFEFEFEFEF6FAFEB6DCFE429AFE0066FE0066FE0066FE00
          66FE0066FE0066FE0066FE0167FE126DE58B4842B84711B9430CBC3800BC3800
          BC3800BC3800BB3500C14925FBF3F3FEFEFEFEFEFEFEFEFEFEFEFEFCFBF9C58A
          64B84610BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC
          3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3B03
          CE774EF9F6F2FEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF4F2EBCCB090BB2E00BC3800BC3800BC
          3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800
          BC3800BF4912D8C39AFEFEFEFCF8F8CB5F4DBE3C09BC3800BC3800BC3800BC38
          00BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC
          3800BC3800BC3800BC3800BC3800C7694AE6C5C0FEFEFEF7F1EADBA88DB72C00
          BC3800BC3800BC3800BC3800BC3800BC3800BA400BEBCBBDFEFEFEFEFEFEFEFE
          FEFEFEFEF0F8FEA4D0FE2585FE0066FE0066FE0066FE0066FE0066FE0066FE00
          66FE006AFE2F5AC7964446C03903BC3800BC3800BC3800BC3800C04915D49876
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEE0D0BBC56135BC3600BC3800BC38
          00BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC
          3800BC3800BC3800BC3800BC3800BC3800BC3C03CF7B51FBFCF8FEFEFEFEFEFE
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFEFEFEF1E9DFC38F61BC3500BC3800BC3800BC3800BC3800BC3800BC3800BC
          3800BA3500BD3D0FC9623ACE8156C87643BD6026B23F05BB3E0DD29571FEFEFE
          FEFEFEDEA897C14015BC3600BC3800BC3800BC3800BC3800BC3800BC3800BC38
          00BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BA
          3500D38B72F3E8E6FEFEFEFCFAF7E3BDA9B13400BC3800BC3800BA3E06BC3800
          BC3800BC3800B83703E2C3ACFAFCF7FEFEFEFEFEFEFEFEFEFEFEFEE7F2FE8EC3
          FE127CFE0066FE0066FE0066FE0066FE0066FE0066FE0066FE0764F94D65B0A2
          4B3BC13600BC3800BC3800B93800BE5D2DF0E1D4FEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEF6F4EEC6734CB83700BC3800BC3800BC3800BC3800BC3800BC38
          00BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC
          3800BC3800B9450ECB8E67FDFEFCFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF3E1DAC8704CBC38
          00BC3800BC3800BC3800BC3800BC3800BC3800BC3800C5522ED68571E6BBABEB
          D5C3E6CBB3DDB99AD19577CB6C54C1764CFEFEFEFEFEFEF1E4DABF6137BB3C06
          BC3800BC3800BC3800BC3800BC3800BC3800BC3C04BD460DBD4911BD4710BC38
          00BC3800BC3800BC3800BC3800BC3800BC3800B93A05DAA78DFAFEFCFEFEFEFE
          FEFEE6CBBAAC4106BC3800BC3800BA3D05BC3800BC3800BC3800B93500DBB093
          F6F3ECFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEE2F0FE76B8FE0F79FE0066FE0066
          FE0066FE0066FE0066FE0066FE0066FE1471F361649CA8462FBC3800BC3800BB
          440DC7855CFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFED8A98A
          C05420BC3800BC3800BC3800BC3800BC3800BC3800BC3901BA4109BD4911C44E
          18BD3E06BC3901BC3800BC3800BC3800BC3800BC3800BC3800C05428D8A897FE
          FEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFEFEFEF1DCD6C35E3DBC3800BC3800BC3800BC3800BC38
          00BC3800BC3800BA4C15D79480F5E0E1FEFEFEFEFEFEFEFEFEFEFEFEFBF4F5E9
          C2C1C79970FDFEFCFEFEFEFEFEFECEA182BE4B18BC3800BC3800BC3800BC3800
          BC3800BC3800BF4810CA7642D4946ED28A65B93000BC3800BC3800BC3800BC38
          00BC3800BC3800BB420CDFAC95FEFEFEFEFEFEFEFEFEE8D1C1B05319BC3800BC
          3800BC3800BC3800BC3800BC3800BC3800D7927BF4E5E1FEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEE4F1FE63AFFE026AFE026AFE0066FE0066FE0066FE0066
          FE0066FE0066FE206DE8705F84B0431BBC3500C35528DEBFA3FEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF1E5D6CD764CBB3700BC3800BC3800
          BC3800BC3800BC3800BB3901B74811D0946DDD9B79C2622DBD3D06BC3800BC38
          00BC3800BC3800BC3800BC3800C9653DE8C8BFFEFEFEFEFEFEFEFEFEFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE
          EEDDD2B7602CBC3800BC3800BC3800BC3800BC3800BC3800BC3800BD7848E4D5
          C4FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFBF9F4EAFCFEF9FEFEFEFE
          FEFEF3E2DEC66134BB3A02BC3800BC3800BC3800BC3800BC3800C1501AD7A47B
          FBFEF8F3E8E0B32200BC3800BC3800BC3800BC3800BC3800BC3800BE4211E2AC
          98FEFEFEFEFEFEFEFEFEEBD8C9BB6731BC3800BC3800BC3800BC3800BC3800BC
          3800BC3800CC7863EFD9D6FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          E7F1FE338BFE056FFE0066FE0066FE0066FE0066FE0066FE0066FE0066FE3269
          D0845765B23811CA6849F4EFE7FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFAF9F7D58E74BD400FBC3800BC3800BC3800BC3800BC3800BB3800
          B9440EF1F5EFFEFEFECB9769BD450DBC3800BC3800BC3800BC3800BC3800BB38
          00C87747E9EAD1FEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF2DDD4C56035BC3800BC3800
          BC3800BC3800BC3800BC3800BC3800D7956FF3E6DAFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEC67F56BA420BBC
          3800BC3800BC3800BC3800BC3800B73C03BE7041F8FBF3E5E8CFB32200BC3800
          BC3800BC3800BC3800BC3800BC3800C14F1AE4B69EFEFEFEFEFEFEFEFEFEEDDD
          CDBE753CBC3800BC3800BC3800BC3800BC3800BC3800BC3800B1753FE2D7C4FE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFBFCFEDBEAFE1573FE1573FE
          1573FE1573FE1573FE1573FE1573FE1573FE1573FE4468BE96645CCC9C79FEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEE9CFC7CA
          704CBC3801BC3800BC3800BC3800BC3800BC3800BF410CEECECFFEFDFEC9935D
          BD440CBC3800BC3800BC3800BC3800BC3800B93901D08360FEFEFEFEFEFEFEFE
          FEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFEFEFEF3E3D7CA7741BC3800BC3800BC3800BC3800BC3800BC3800
          BC3800D38C65F1E1D5FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEDBC39FC25B26BC3800BC3800BC3800BC3800BC
          3800BA3600C55734F3DEDEE5E8CFB32200BC3800BC3800BC3800BC3800BC3800
          BC3800C07B48E3D6C0FEFEFEFEFEFEFEFEFEF5EAE1D79B77BC3800BC3800BC38
          00BC3800BC3800BC3800BC3800BC3F07E6BEA7FDFEFCFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEDC997FBD3D09BC3800BC3800BC
          3800BC3800BC3800BD3C05CC824DFEFDFCC7814EBD4109BC3800BC3800BC3800
          BC3800BC3800BD3E0BD78A6FFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF1E5D8C4
          7F44BC3800BC3800BC3800BC3800B54F1ABB3806BC3600C95B39EBC4BBFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFCFBF9CE764DBC3B03BC3800BC3800BC3800BC3800BC3800BE4C14CE9E6DE8
          D5C3B62900BC3800BC3800B94008BB3A02BC3800B83300D48367F3DED7FEFEFE
          FEFEFEFEFEFEF4F4EDD3B799BD3200BC3800BC3800BC3800BC3800BC3800BC38
          00BC3F07E6BAA8FDFCFCFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEC66E38C57B46C57D48C57D48C57D48C57D48C57D48C57D48C57D48
          BD8753C5B490FCF9FBFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEE5B5A4C7562EBC3400BC3800BC3800BC3800BC3800BB3800AB
          3A04FDFCFCB16F37B93E06BC3800BC3800BC3800BC3800BC3800BD440BD7936F
          FEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF7F3EFDBB79FBD3300BC3800BC3800BC
          3800BB3C05BC3801BC3800BE430FE2B19BFBFAF9FEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFED2BD9FBE5A2BBC36
          00BC3800BC3800BC3800BC3800B93F05BB6E38EFDBCCB62900BC3800BC3800BB
          3A02BC3800BC3800B83300D6A787F5F8EEFEFEFEFEFEFEFEFEFEFAF4F4E4B6AC
          B83100BC3800BC3800BC3800B94008BB3901BC3800BC3F07E6BAA8FDFCFCFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFCF9F7CD8F62BD420ABD430BBD
          430BBD430BBD430BBB4811BC470FBD430BBD430B9E5846567AC55C93FDFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFAF1EED59B
          7DB54108BC3800BC3800BC3800BC3800BB3800B43100F3DBDFC45C3BBD3C07BC
          3800BC3800BC3800BC3800BC3800BD6634D6C3A9FEFEFEFEFEFEFEFEFEFEFEFE
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFEFEFEFAFBF7E5D1BEB72700BC3800BC3800BC3800BC3800BC3800BC3800BC
          3A02C08255E2DAC9FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFCFAF8D5B498
          FDFDFDFEFEFEFEFEFEFEFEFEF0EEE6C9754EBA3700BC3800BC3800BC3800BC38
          00BB3701BE4B20DDB1A0B62E00BC3800BC3800BC3800BC3800BC3800B23E05DB
          B69BFBFEFAFEFEFEFEFEFEFEFEFEFBFAF7E5C6B4B72D00BC3800BC3800BC3800
          B84109BB3901BC3800BA3F07E5BAA8FDFCFCFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFDFEFDF2F6EEBA4114BC3800BC3800BC3800BC3800BC3800B93E06BA
          3C04BC3800C136008B4B541870F01573FE6AA6FEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEE0B29DBD4E1CBC3800BC3800BC38
          00BC3800BC3800BA3500DB9582B46737BA3E07BC3800BC3800BC3800BC3800BA
          3500C67046E6D5C2FEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFDFDFCECE1D4AF4F
          22BC3800BC3800BC3800BC3800BC3800BC3800BC3800B84C19C88C64E6D3BDF9
          F6F1FEFEFEFCFDFAF5F8EDEBE3D5CEA482C06947FDFCFCFEFEFEFEFEFEFEFEFE
          FEFEFED59E7CBD4D16BC3800BC3800BC3800BC3800BC3600BD3D0DC06F46BA31
          00BC3800BC3800BC3800BC3800BC3800B94D13E3BEA7FEFEFEFEFEFEFEFEFEFE
          FEFEFCFDFBE9D1C1B13100BC3800BC3800BC3800BA3C04BC3901BC3800BB3B03
          D49E79F2ECE0FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFBF8F7E4C1B5B532
          00BC3800BC3800BC3800BC3800BC3800BB3B03BB3A02BC3800AA48255F629303
          6BFE036BFE1577FE80B7FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEF1DED4CF8563B53700BC3800BC3800BC3800BC3800BC3800C164
          39B54A19BB3A03BC3800BC3800BC3800BC3800B93200CD7D5DF2EEE2FEFEFEFE
          FEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFEFEFEFEFEFEF5F0EBC29975BC3500BC3800BC3800BC38
          00BC3800BC3800BC3800BC3300BC4B15C97D4FDDA286E2B59CE0C1A6D9A885CE
          926BB15016B44D24FDFCFBFEFEFEFEFEFEFEFEFEFEFEFEE4D5BCC56B40BA3300
          BC3800BC3800BC3800BC3800BB3A02B54208BD3400BC3800BC3800BC3800BC38
          00BC3800C45C2BE9C6B5FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF0D8D1B9471EBC
          3800BC3800BC3800BC3800BC3800BC3800BC3800C9824DEBDBC6FEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEF8EFECC97757B73900BC3800BC3800BC3800BC38
          00BC3800BC3800BC3800BB3A028456572772DA0066FE0167FE036CFE1174FEA0
          C8FBFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFEFCDFB59D
          B6430CBC3800BC3800BC3800BC3800BC3800B74812BC3201BA3D06BC3A02BC38
          00BC3800BC3800B63702D08E70F9FEFBFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE
          FEFEFEFBFAF9E9D8CEBD380DBC3800BC3800BC3800BC3800BC3800BC3800BC38
          00BC3800BC3800BC3800BC4910BC6026BC3F06BC3E06BB3901AB4D11FDFCFBFE
          FEFEFEFEFEFEFEFEFEFEFEF5FEF2D28D73BC390DBC3800BC3800BC3800BC3800
          BC3800BC3800BB3D05BC3600BC3800BC3800BC3800BB3600CD7350EFD4C9FEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEF4DEDACB5E47BC3800BC3800BC3800BC3800BC
          3800BC3800BC3800C87141EAD0BEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFCFBFA
          EADACDB3420BBC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3700B246
          15626085036BFE0066FE0066FE0066FE0267FE1777FAC1D9F8FBFCFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEEACEBBC66A3ABC3400BC3800BC3800
          BC3800BC3800BC3800BC3800B9420ABB3B03BC3800BC3800BC3800B74209D39B
          7AFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEF9F1EFC7644C
          BB3B03BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC38
          00BC3800BC3800BC3800BB3800B43500FBFAF7FEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEE7BAACC85E37BB3700BC3800BC3800BC3800BC3800BC3901B8460EBD3200
          BC3800BC3800BC3800B73100D69A7DF4EAE3FEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEF4E1DBCB6B4CBC3800BC3800BC3800BC3800BC3800BC3800BC3800BB5B32E2
          C3B5FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF5F0EBCCA482BD2D00BC3800BC3800
          BC3800BC3800BC3800BC3800BC3800BC3601945A483D75BE0066FE0066FE0066
          FE0066FE0066FE0166FE237CEDD6E6F8FAFCFDFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEF5F3ECD8A68DBA3004BC3800BC3800BC3800BC3800BA3F08BC3901
          BC3800BC3800BC3800BC3800BC3800C04B15DEA588FEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFDFBFBB84C15BC3901BC3800BC3800
          BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BB37
          00B32100EFF4E2FDFDFCFEFEFEFEFEFEFEFEFEFEFEFEF7E7EAD3826DB93401BC
          3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800B72D00
          DBA78AF7F2EAFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF4EEE4CBA26DBC3800BC38
          00BC3800BC3800BC3800BC3800BC3800B55720DFC0AAFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEF2DED3BE5016BC3800BC3800BC3800BC3800BC3800BC3800BC3800
          BC3800B9420B5C58880066FE0066FE0066FE0066FE0066FE0066FE0066FE0066
          FE3785DFE3EEFAFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEE2CBB7AF
          591EBC3800BC3800BC3800BC3800B26630BB3C04BC3800BC3800BC3800BC3800
          BC3800C05F29DEBA9DFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFE
          FEFEFEFEFEFDFDFDCCCC99B73808BB3700BC3800BC3800BC3800BC3800BC3800
          BC3800BC3800BC3800BC3800BC3800BC3800BC3800B63000ECD2CBFDFBFAFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEDDA193BD4119BC3800BC3800BC3800BC3800BC
          3800BC3800BC3800BC3800BC3800BC3800AE4408E4C5B2FEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEF8F7F3DEC6ACBC3800BC3800BC3800BC3800BC3800BC38
          00BC3800B82E00D9A791F8FEFAFEFEFEFEFEFEFEFEFEFAF4ECE3B896B53900BC
          3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800B05A52546EC80066FE
          0066FE0066FE0066FE0066FE0066FE0066FE0066FE0066FE4BA4FEDEEFFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEEFEBE2CC9E7CBD3200BC3800BC3800BC
          3800BC3800BC3800BC3800BC3800BC3800BC3800BD3400C5804EE2E2C6FEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF9F9F3D7
          CCB3C04415BC3700BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800
          BC3800BC3800BC3800B63000E5C5C1FCF9F9FEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEF2F0E4D49272BD3000BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC
          3800BC3800B44513E6C6B6FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFAF9F6
          E6CDB8BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3700DE9F89FAF3
          F3FEFEFEFEFEFEFEFEFEECDDD0B76C3ABB3800BC3800BC3800BC3800BC3800BC
          3800BC3800BC3800BD3000DB9A86ABD2F53992FE0066FE0066FE0066FE0066FE
          0066FE0066FE0066FE0066FE086DFE7AB3F0E3EFFAFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFCFCFBE9C4B7BD3307BC3800BC3800BC3800BC3800BC3800BC3800BC
          3800BC3800BC3800B93000D2816CF5E7E6FEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF6F6F1E4B698BE401BBA3300BC
          3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BB3600
          D5C3ADFBF9F8FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFCFDFAD8B296B34A12BC38
          00BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BF6632EAD3C3FE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFCFBF8ECD3C2B83200BC3800BC3800
          BC3800BC3800BC3800BC3800BC3800DB9F82F7F2EDFEFEFEFEFEFEFDFEFCEBD2
          C0BA4911BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BF6A38E3
          CAB5EDF6FDA5CAF23A86EB0066FE0066FE0066FE0066FE0066FE0066FE0066FE
          0066FE1A77FA94C9FDE8F6FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF0E2D5C782
          4EBC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800BC3800B72C00D0
          8E74F4F9EFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEF8F0E7E6B9ADC67445B6380CB62D00BA3600BC3800BC
          3800BC3800BC3800BC3800BC3800BC3800BC3800C78657FAF4F0FEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEE9D4C2C7794ABC3800BC3800BC3800BC3800BC38
          00BC3800BC3800BC3800BC3800C68751EEE1D0FEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFDFDFCF2DCD2B62C00BC3800BC3800BC3800BC3800BC3800BC3800
          BC3800D19A6FF0EFDFFEFEFEFEFEFEF1D5CCCE6C4BBD3703BD3400BD3400BD34
          00BD3400BD3400BD3400BD3400B43800D39E7FF4EEE7FEFEFEE9F0F897BEEC28
          7CED0066FE0066FE0066FE0066FE0066FE0066FE0066FE0066FE2E86FEB4D4FE
          F7FAFEFEFEFEFEFEFEFEFEFEFEFEFEF9F6F1E1BCA4B93000BC3800BC3800BC38
          00BC3800BC3800BC3800BC3800BC3800B73D0BD6A186FAFEF9FEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEE5CCB5D89A88CF7462C55830BC470FBA3F07BC3D04BC3D04BC3E05BA
          4008BD3F0CC56344D6AF86FBF8F4FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          F8F1E9DDA787BD460CBD460CBD460CBD460CBD460CBD460CBD460CBD460CBC3F
          06D6A283F4ECE4FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF4E7E1B5
          592BBD460CBD460CBD460CBD460CBD460CBD460CBD460CCB925FEAE3CEFEFEFE
          FCF7F8E5C0B4BA6437BA6334BA6334BA6334BA6334BA6334BA6334BA6334BA63
          34B76C38E3C8B5FEFDFDFEFEFEFEFEFEE0EBF789B6F03085FE2383FE2B8AFE31
          8FFE318FFE318FFE2B8AFE2383FE1B7BFE5AA4FECAE3FEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFDFDF3DCD9C85942BD460CBD460CBD460CBD460CBD460CBD460CBD46
          0CBD460CBF5B24E0B69CFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF3D8
          DAE1AC9AD2946ECE8760D28059D27F59D1835BD08B66D6896CE0B8B3F1FDEDFD
          FEFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFEFCEED6C6D6926DD6926D
          D6926DD6926DD6926DD6926DD6926DD6926DD48964EDCDC7FBF6F7FEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF7F4F0CFB394D6926DD6926DD6926DD6
          926DD6926DD6926DD6926DDDB695F0E7D9FEFEFEFCF5F6ECD9D1D0BC9FD0BC9F
          D0BC9FD0BC9FD0BC9FD0BC9FD0BC9FD0BC9FD0BC9FD6C3A4F0E9DEFEFEFEFEFE
          FEFEFEFEFEFEFEE3EEFE9BC6FE89C2FE93CBFE9CD2FE9CD2FE9CD2FE94CBFE89
          C3FE7FB9FE6EB2FEC3DFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFAF0F1E7B3B1
          D6926DD6926DD6926DD6926DD6926DD6926DD6926DD6926DDBA380EED7C7FEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF8FEFAF3F8EEF7EC
          E5F7E8E5F8F3E8FBFEF9FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        Stretch = True
      end
      object QRLabel74: TQRLabel
        Left = 160
        Top = 353
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
          933.979166666666700000
          132.291666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '104-0'
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
      object QRShape38: TQRShape
        Left = 212
        Top = 347
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
          918.104166666666800000
          7.937500000000000000)
        Pen.Width = 2
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape39: TQRShape
        Left = 156
        Top = 347
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
          918.104166666666800000
          7.937500000000000000)
        Pen.Width = 2
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRSysData5: TQRSysData
        Left = 522
        Top = 354
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
          1381.125000000000000000
          936.625000000000000000
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
      object QRLabel75: TQRLabel
        Left = 630
        Top = 26
        Width = 86
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1666.875000000000000000
          68.791666666666670000
          227.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'FICHA DE CAIXA'
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
      object QRShape40: TQRShape
        Left = 63
        Top = 384
        Width = 654
        Height = 263
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          695.854166666666700000
          166.687500000000000000
          1016.000000000000000000
          1730.375000000000000000)
        Brush.Style = bsClear
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel76: TQRLabel
        Left = 66
        Top = 386
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
          1021.291666666667000000
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
      object QRLabel77: TQRLabel
        Left = 557
        Top = 386
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
          1021.291666666667000000
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
      object QRLabel78: TQRLabel
        Left = 558
        Top = 418
        Width = 82
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          1476.375000000000000000
          1105.958333333333000000
          216.958333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'AG'#202'NCIA / C'#211'DIGO BENEFICI'#193'RIO'
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
      object QRLabel79: TQRLabel
        Left = 66
        Top = 410
        Width = 35
        Height = 8
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          21.166666666666670000
          174.625000000000000000
          1084.791666666667000000
          92.604166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'BENEFICI'#193'RIO'
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
      object QRShape41: TQRShape
        Left = 63
        Top = 405
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
          1071.562500000000000000
          1730.375000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape42: TQRShape
        Left = 553
        Top = 384
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
          1016.000000000000000000
          7.937500000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape43: TQRShape
        Left = 160
        Top = 451
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
          1193.270833333333000000
          10.583333333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape44: TQRShape
        Left = 281
        Top = 451
        Width = 4
        Height = 47
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          124.354166666666700000
          743.479166666666800000
          1193.270833333333000000
          10.583333333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape45: TQRShape
        Left = 441
        Top = 408
        Width = 4
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          58.208333333333330000
          1166.812500000000000000
          1079.500000000000000000
          10.583333333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape46: TQRShape
        Left = 389
        Top = 450
        Width = 3
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666680000
          1029.229166666667000000
          1190.625000000000000000
          7.937500000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape47: TQRShape
        Left = 63
        Top = 472
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
          1248.833333333333000000
          1730.375000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel80: TQRLabel
        Left = 66
        Top = 475
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
          1256.770833333333000000
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
      object QRLabel81: TQRLabel
        Left = 66
        Top = 452
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
          1195.916666666667000000
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
      object QRLabel82: TQRLabel
        Left = 164
        Top = 452
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
          1195.916666666667000000
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
      object QRLabel83: TQRLabel
        Left = 164
        Top = 475
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
          1256.770833333333000000
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
      object QRLabel84: TQRLabel
        Left = 288
        Top = 452
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
          1195.916666666667000000
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
      object QRLabel85: TQRLabel
        Left = 288
        Top = 475
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
          1256.770833333333000000
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
      object QRLabel86: TQRLabel
        Left = 248
        Top = 475
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
          1256.770833333333000000
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
      object QRLabel87: TQRLabel
        Left = 394
        Top = 452
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
          1195.916666666667000000
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
      object QRLabel88: TQRLabel
        Left = 448
        Top = 452
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
          1195.916666666667000000
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
      object QRLabel89: TQRLabel
        Left = 448
        Top = 475
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
          1256.770833333333000000
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
      object QRShape48: TQRShape
        Left = 63
        Top = 449
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
          1187.979166666667000000
          1730.375000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel90: TQRLabel
        Left = 66
        Top = 499
        Width = 244
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          174.625000000000000000
          1320.270833333333000000
          645.583333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 
          'INSTRU'#199#213'ES (Todas as informa'#231#245'es deste bloqueto s'#227'o de exclusiva' +
          ' responsabilidade do Benefici'#225'rio)'
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
      object QRShape49: TQRShape
        Left = 554
        Top = 514
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
          1359.958333333333000000
          428.625000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape50: TQRShape
        Left = 554
        Top = 534
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
          1412.875000000000000000
          428.625000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape51: TQRShape
        Left = 554
        Top = 555
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
          1468.437500000000000000
          428.625000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape52: TQRShape
        Left = 554
        Top = 576
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
          1524.000000000000000000
          428.625000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape53: TQRShape
        Left = 63
        Top = 597
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
          1579.562500000000000000
          1730.375000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel91: TQRLabel
        Left = 66
        Top = 590
        Width = 59
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          174.625000000000000000
          1561.041666666667000000
          156.104166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'UNIDADE BENEFICI'#193'RIO'
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
      object QRLabel92: TQRLabel
        Left = 66
        Top = 600
        Width = 26
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          174.625000000000000000
          1587.500000000000000000
          68.791666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'PAGADOR'
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
      object QRLabel93: TQRLabel
        Left = 558
        Top = 580
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
          1534.583333333333000000
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
      object QRLabel94: TQRLabel
        Left = 558
        Top = 559
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
          1479.020833333333000000
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
      object QRLabel95: TQRLabel
        Left = 558
        Top = 538
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
          1423.458333333333000000
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
      object QRLabel96: TQRLabel
        Left = 558
        Top = 518
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
          1370.541666666667000000
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
      object QRLabel97: TQRLabel
        Left = 558
        Top = 500
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
          1322.916666666667000000
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
      object QRLabel98: TQRLabel
        Left = 558
        Top = 475
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
          1256.770833333333000000
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
      object QRLabel99: TQRLabel
        Left = 558
        Top = 452
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
          1195.916666666667000000
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
      object QRShape55: TQRShape
        Left = 63
        Top = 495
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
          1309.687500000000000000
          1730.375000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel100: TQRLabel
        Left = 69
        Top = 391
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
          1034.520833333333000000
          1264.708333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'PREFERENCIALMENTE NAS CASAS LOT'#201'RICAS AT'#201' O VALOR LIMITE'
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
      object QRLabel102: TQRLabel
        Left = 559
        Top = 424
        Width = 152
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1479.020833333333000000
          1121.833333333333000000
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
      object QRLabel103: TQRLabel
        Left = 557
        Top = 457
        Width = 155
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1473.729166666667000000
          1209.145833333333000000
          410.104166666666700000)
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
      object QRLabel104: TQRLabel
        Left = 197
        Top = 479
        Width = 25
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          521.229166666666800000
          1267.354166666667000000
          66.145833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'SR'
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
      object QRLabel105: TQRLabel
        Left = 473
        Top = 479
        Width = 60
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1251.479166666667000000
          1267.354166666667000000
          158.750000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'REAL'
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
      object QRLabel106: TQRLabel
        Left = 256
        Top = 481
        Width = 17
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          677.333333333333400000
          1272.645833333333000000
          44.979166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
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
      object QRDBText3: TQRDBText
        Left = 560
        Top = 391
        Width = 145
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1481.666666666667000000
          1034.520833333333000000
          383.645833333333300000)
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
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape57: TQRShape
        Left = 243
        Top = 475
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
          1256.770833333333000000
          7.937500000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRDBText12: TQRDBText
        Left = 69
        Top = 415
        Width = 372
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          182.562500000000000000
          1098.020833333333000000
          984.250000000000000000)
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
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText18: TQRDBText
        Left = 80
        Top = 458
        Width = 70
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          211.666666666666700000
          1211.791666666667000000
          185.208333333333300000)
        Alignment = taLeftJustify
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
      object QRDBText29: TQRDBText
        Left = 289
        Top = 457
        Width = 98
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          764.645833333333400000
          1209.145833333333000000
          259.291666666666700000)
        Alignment = taLeftJustify
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
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText35: TQRDBText
        Left = 400
        Top = 458
        Width = 39
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1058.333333333333000000
          1211.791666666667000000
          103.187500000000000000)
        Alignment = taLeftJustify
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
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel107: TQRLabel
        Left = 164
        Top = 458
        Width = 116
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          433.916666666666800000
          1211.791666666667000000
          306.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRLabel107'
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
      object QRDBText36: TQRDBText
        Left = 584
        Top = 481
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
          1272.645833333333000000
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
      object QRSysData6: TQRSysData
        Left = 448
        Top = 458
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
          1211.791666666667000000
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
        Transparent = False
        FontSize = 8
      end
      object QRMemo3: TQRMemo
        Left = 68
        Top = 511
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
          1352.020833333333000000
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
      object QRDBText37: TQRDBText
        Left = 626
        Top = 560
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
          1481.666666666667000000
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
      object QRDBText38: TQRDBText
        Left = 110
        Top = 600
        Width = 40
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          291.041666666666700000
          1587.500000000000000000
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
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText39: TQRDBText
        Left = 155
        Top = 600
        Width = 297
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          410.104166666666700000
          1587.500000000000000000
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
      object QRDBText40: TQRDBText
        Left = 457
        Top = 600
        Width = 111
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1209.145833333333000000
          1587.500000000000000000
          293.687500000000000000)
        Alignment = taLeftJustify
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
      object QRDBText41: TQRDBText
        Left = 110
        Top = 612
        Width = 268
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          291.041666666666700000
          1619.250000000000000000
          709.083333333333300000)
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
      object QRDBText42: TQRDBText
        Left = 110
        Top = 625
        Width = 69
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          291.041666666666700000
          1653.645833333333000000
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
      object QRDBText43: TQRDBText
        Left = 382
        Top = 612
        Width = 184
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1010.708333333333000000
          1619.250000000000000000
          486.833333333333300000)
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
      object QRDBText44: TQRDBText
        Left = 183
        Top = 625
        Width = 353
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          484.187500000000000000
          1653.645833333333000000
          933.979166666666700000)
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
      object QRDBText45: TQRDBText
        Left = 549
        Top = 625
        Width = 20
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1452.562500000000000000
          1653.645833333333000000
          52.916666666666670000)
        Alignment = taLeftJustify
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
      object QRLabel108: TQRLabel
        Left = 540
        Top = 624
        Width = 5
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1428.750000000000000000
          1651.000000000000000000
          13.229166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '-'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel109: TQRLabel
        Left = 578
        Top = 648
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
          1714.500000000000000000
          288.395833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
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
      object QRLabel110: TQRLabel
        Left = 631
        Top = 164
        Width = 77
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1669.520833333333000000
          433.916666666666700000
          203.729166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRLabel110'
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
      object QRLabel111: TQRLabel
        Left = 631
        Top = 500
        Width = 77
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1669.520833333333000000
          1322.916666666667000000
          203.729166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRLabel111'
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
      object QRLabel112: TQRLabel
        Left = 631
        Top = 839
        Width = 77
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1669.520833333333000000
          2219.854166666667000000
          203.729166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRLabel112'
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
      object QRLabel1: TQRLabel
        Left = 448
        Top = 753
        Width = 26
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          1185.333333333333000000
          1992.312500000000000000
          68.791666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CPF/CNPJ'
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
      object QRLabel72: TQRLabel
        Left = 448
        Top = 409
        Width = 26
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          1185.333333333333000000
          1082.145833333333000000
          68.791666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CPF/CNPJ'
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
      object QRLabel101: TQRLabel
        Left = 448
        Top = 74
        Width = 26
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          1185.333333333333000000
          195.791666666666700000
          68.791666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CPF/CNPJ'
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
      object QRDBText46: TQRDBText
        Left = 452
        Top = 79
        Width = 97
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1195.916666666667000000
          209.020833333333300000
          256.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMContasReceber.QRBloqueto
        DataField = 'NUM_CGC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Mask = '99.999.999/9999-99'
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRDBText47: TQRDBText
        Left = 452
        Top = 414
        Width = 97
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1195.916666666667000000
          1095.375000000000000000
          256.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMContasReceber.QRBloqueto
        DataField = 'NUM_CGC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Mask = '99.999.999/9999-99'
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRDBText48: TQRDBText
        Left = 453
        Top = 759
        Width = 97
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1198.562500000000000000
          2008.187500000000000000
          256.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMContasReceber.QRBloqueto
        DataField = 'NUM_CGC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Mask = '99.999.999/9999-99'
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRShape54: TQRShape
        Left = 222
        Top = 344
        Width = 189
        Height = 36
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          95.250000000000000000
          587.375000000000000000
          910.166666666666700000
          500.062500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel113: TQRLabel
        Left = 225
        Top = 345
        Width = 31
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          595.312500000000000000
          912.812500000000000000
          82.020833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'SAC CAIXA:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 4
      end
      object QRLabel114: TQRLabel
        Left = 257
        Top = 345
        Width = 152
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          679.979166666666700000
          912.812500000000000000
          402.166666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '0800 726 0101 (informa'#231#245'es, reclama'#231#245'es, sugest'#245'es e elogios)'
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
      object QRLabel116: TQRLabel
        Left = 349
        Top = 353
        Width = 36
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          923.395833333333300000
          933.979166666666700000
          95.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '0800 726 2492'
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
      object QRLabel117: TQRLabel
        Left = 225
        Top = 361
        Width = 26
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          595.312500000000000000
          955.145833333333300000
          68.791666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Ouvidoria:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 4
      end
      object QRLabel118: TQRLabel
        Left = 253
        Top = 361
        Width = 36
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          669.395833333333300000
          955.145833333333300000
          95.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '0800 725 7474'
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
      object QRLabel119: TQRLabel
        Left = 225
        Top = 370
        Width = 30
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          595.312500000000000000
          978.958333333333300000
          79.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'caixa.gov.br'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 4
      end
      object QRLabel115: TQRLabel
        Left = 225
        Top = 353
        Width = 119
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          595.312500000000000000
          933.979166666666700000
          314.854166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Para pessoas com defici'#234'ncia auditiva ou de fala: '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 4
      end
      object QRDBText49: TQRDBText
        Left = 69
        Top = 776
        Width = 372
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          182.562500000000000000
          2053.166666666667000000
          984.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMContasReceber.QRBloqueto
        DataField = 'ENDERECO_FILIAL'
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
      object QRShape58: TQRShape
        Left = 63
        Top = 772
        Width = 492
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          166.687500000000000000
          2042.583333333333000000
          1301.750000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape59: TQRShape
        Left = 63
        Top = 429
        Width = 492
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          166.687500000000000000
          1135.062500000000000000
          1301.750000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape60: TQRShape
        Left = 63
        Top = 94
        Width = 492
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          166.687500000000000000
          248.708333333333300000
          1301.750000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRDBText50: TQRDBText
        Left = 69
        Top = 97
        Width = 372
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          182.562500000000000000
          256.645833333333300000
          984.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMContasReceber.QRBloqueto
        DataField = 'ENDERECO_FILIAL'
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
      object QRDBText51: TQRDBText
        Left = 69
        Top = 433
        Width = 372
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          182.562500000000000000
          1145.645833333333000000
          984.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMContasReceber.QRBloqueto
        DataField = 'ENDERECO_FILIAL'
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
      object QRLabel120: TQRLabel
        Left = 66
        Top = 302
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
          799.041666666666700000
          129.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'SACADOR/AVALISTA'
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
      object QRLabel121: TQRLabel
        Left = 66
        Top = 639
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
          1690.687500000000000000
          129.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'SACADOR/AVALISTA'
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
      object QRLabel122: TQRLabel
        Left = 66
        Top = 977
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
          2584.979166666667000000
          129.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'SACADOR/AVALISTA'
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
      object QRShape61: TQRShape
        Left = 441
        Top = 117
        Width = 1
        Height = 45
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          119.062500000000000000
          1166.812500000000000000
          309.562500000000000000
          2.645833333333333000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape62: TQRShape
        Left = 441
        Top = 451
        Width = 4
        Height = 45
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          119.062500000000000000
          1166.812500000000000000
          1193.270833333333000000
          10.583333333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape63: TQRShape
        Left = 445
        Top = 792
        Width = 3
        Height = 46
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          121.708333333333300000
          1177.395833333333000000
          2095.500000000000000000
          7.937500000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
    end
  end
end
