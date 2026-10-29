object FRBloqueto_CEF: TFRBloqueto_CEF
  Left = 163
  Top = 162
  Width = 828
  Height = 517
  VertScrollBar.Position = 569
  Caption = 'FRBloqueto_CEF'
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
    Top = -569
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
        Left = 592
        Top = 1024
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
        Height = 263
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          695.854166666666800000
          166.687500000000000000
          1915.583333333333000000
          1730.375000000000000000)
        Brush.Style = bsClear
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape20: TQRShape
        Left = 63
        Top = 766
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
          2026.708333333333000000
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
        Top = 710
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
          1878.541666666667000000
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
        Left = 441
        Top = 791
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
          2092.854166666667000000
          10.583333333333330000)
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
        Top = 769
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
          2034.645833333333000000
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
          2219.854166666667000000
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
        Top = 770
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
          2037.291666666667000000
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
        Top = 862
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
          2280.708333333333000000
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
        Top = 822
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
          2174.875000000000000000
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
        Top = 775
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
          2050.520833333333000000
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
          2460.625000000000000000
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
        Top = 940
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
          2487.083333333333000000
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
        Top = 736
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
          1947.333333333334000000
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
        Top = 821
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
          2172.229166666667000000
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
          0A544A504547496D616765500E0000FFD8FFE000104A46494600010101004700
          470000FFDB0043000604040405040605050609060506090B080606080B0C0A0A
          0B0A0A0C100C0C0C0C0C0C100C0E0F100F0E0C1313141413131C1B1B1B1C2020
          2020202020202020FFDB0043010707070D0C0D181010181A1511151A20202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020202020FFC00011080039008C03011100021101031101
          FFC4001D000001050003010000000000000000000000010506070802030409FF
          C400431000010303020304050807070500000000010203040005110612071321
          083141511422327181172352619294A1D11516566291B1C1243342437282A253
          6383C3D3FFC4001B010001050101000000000000000000000000010304050602
          07FFC40034110001030204040306070003000000000001000203041105122131
          1322516106417114325291B1D115234262A1C1E13381B2FFDA000C0301000211
          0311003F00A26B78A8114211421142114211421142114A9114212D2A44B8A542
          5C52D908C52D9225C52D9225C52D908DB4591746DA2C8BA36D1645D755309C5D
          F06DF3E7C94C58319D97257EC30C214E2CFB929049A47380D4E8940BA957C8F7
          14397CCFD5A9BB719FEEFAFD9EFA8BEDD0FC413BC07F4518B95AAE76B96A8772
          88F42948EAA62436A69601F1DAA00D4963C385C1B84D9046E96D568BA5DE7220
          5AE2BB366B99288EC24AD64246E3803C80A1EF0D173A040693B27FF92AE24FEC
          CDC7EEEE7E54C7B643F105D705FD0A8F5CAD970B5CE7605C63B9126B180F4779
          250B4E4050CA4F519041A7D8F0E171A85C1691BAE56AB55CAED3DA816C8CE4C9
          AF67951D9495AD5B5254AC2475E894934AF7868B9D024009D9483E4A7893FB33
          71FBBB9F9531EDB0FC43E6BBE03FA14C30AD1729B714DB624671FB82D65B4454
          24970AD3DE909EFCF4A905ED0DCD7D13794DEDE6A43F253C49FD9AB8FDDDCFCA
          9AF6D87E21F35DF01FD0A66BC69FBD59252625E20BD024A901C4B32105B51412
          405007C3293526291AF1769B84DB9A5BBA46AC77971B4BADC090B6D63285A5A5
          9491E60E2A33F12A569CAE9630479661F74EB692670B86388F42B8BF6AB8C76C
          B92223CCB63BD6B6D491D7A0EA479D771E214CF395B23093E41C0FF687D1CCD1
          7731C07A15D096CA941291951E800EF26A6D945528F92CE237ECDDC3EEEBFCAA
          27B741F1B7E69EE049D0A69BDE98D41625B48BCDB9FB7A9F0A2C89082DEF09C6
          EDB9EFC6453F14D1C9EE90570F639BB8B26DC53D65C27BE1DE83B9EB6D4ACD9A
          11E5231CD99288CA59653ED2F1E27AE00F135555552216662A6451979B2D9FA3
          742E98D1F6D4C1B2444B3D007A5100BEF1FA4E39DE7DDDC3C2B253D43E537715
          6EC8C3764F9E92D730B7BD3CC032519EB83E38F8530BB58DFB445C7D378B1764
          8394C34478C0FB984B840F729C35A8C21B687D4AABAC3CEAD3ECAFA17D12D92B
          584C6F0FCECC6B767C1841F9C58FF5AC63FDBF5D41C62A2EEE18F2DD3F471E99
          95F42532B52928585293ED01E154AA6AC85DA72D421F13972D23D5B9C4624157
          EF232C11EF096935A6C19F78C8E8555D6B7997A3B2D5B3D2B894A9647AB0213C
          E83FBEB29680FE0B55758C3ED0DBA9494439D6ADBF5D1BB65927DC5CEA8871DD
          7D5EE6D055FD2B2EAD57CFE81709D0A7B17161E289F1DD4BEDBE3BC3A856E0AF
          B42B7CD8464C876B59678BF9AEB7570FF5B44D5BA520DED9C256FA312591FE5B
          C9E8E27ED0E9F55626AA031485A7C95EC52676DD44F8D5A1ED17F8F6FBDC96B9
          8EDA1679891DCB657FE15F980B00FF001AAEAFC46A69A99E60D09DFB0EA3BAB1
          C368A1A8A86B65DBEA7A155CDCAFEC4286B9121C0C45653D49E800EE000FC001
          5E610523A57E56F33DC57A470D913733AC1AD1F254F6A6D4F3AFF2F7BB96E134
          7FB2C5F2FDF5F9AC8FE1DC3C49F73F0BF859940CCEFD673FC760BCA3C418FBAB
          1F959A4236EFDCA9DF67AD0BFAC5AD517092DEEB6D936C9773DCA7B3F328FE23
          77C2AE719AAE145947BCEFA79AA6A28B33EFE416BB2F34161BDC02CF727C6B16
          AED517DABAD7CED3D64BA04E551252E393E21321BDC7E196055E60125A623A85
          03106F25FA1599F15B1B2A65A57B2CD96344D1F3EF18065DC25168AFC434C246
          D4FDA528D6271892F206F900AF28DBCB7527E3B6B3BB699D02FCAB4A8B53A5BC
          888DC94F7B21CC952C7D7B52424F81350A8E012C81A764FCCFCADBAC7D1EE772
          8D711736253CDDC92AE609A95AB9DBFE97333BB3F1AD67B3C7972D85954711D7
          BDD3F59EDF7CE216BA65875CE65C6ECFEE97271809481F38E103A74427FA534E
          CB4D169B05D8BC8E5B662B36DD3F616A2B1B63DBEDB1C2519E89436D27BC9F70
          EA6B20F7171B9DCAB802CA05C12D48FDFAD37BBBBC55BA4DD1E5212B3D52D143
          65B47D5B5040A9357070B28F3CBF74CD3CB9EE7BA81F6ADB76F6AC1764A7D853
          F15D5F9EF0971B1F0D8BA9F823F9CB7A8FA262B8680AE5D92ADFB4EA1BA2877F
          22336AF76F5AFF009A69DC71FEE8F55CD08DCAB3B8E178F41E16EA05E7FBF8FE
          89F094B0C1FC1CAA8A466695A3B853263661F458B856F02CFAB9781DA9F5469E
          83394C40F4DB4CA50536853A1AC3C9E8A527767208E87DD589F13E33470C818F
          75A5035D09D3BD969307C2AA6566668E42ACA7F89D7F9ADAA1AB4E074481CB2D
          0928255BBA6318F1ACCB71BA47F2875EFF00B5DF6572306A9673682DADEE3459
          DB5BCEBB3D7D9302E0DAA2A2DCF2DA6E128EEDAA41C6E5A87452BEB1D3CAB69E
          19F0DC34838DEF3DDB1E83EFD5547887C452D5FE5FB8C1B8EA7AFA7409890852
          D4109054B51C2523A924F80AD82CAADA7C23D16DE8FD19160AD205C247F69B82
          BFEF2C754E7C903091EEAC0E2357C794BBCB61E8B434D16465BCD47ED3ABCDDF
          8E771B7B6B261DA6DCA65033EA97B98D9755FF0034A7DE935C182D067EAEFBA4
          E2DE5CBD02F6F1DE07E92E19DD92065C8A112907CB92E052CFD80AAEF0D93254
          30F7FAE896A9B78CAC815E80B38B427664D5111CD3536C0A584CC86FAA4211E2
          A65D03A8F72C1CFBC56271888878779157D46FD2CAD5BFDB2D57DB5BF6BBAB09
          930640C3AD2B23B8E4104608208E84555472161B8DC296E6822C556E7845C37D
          291275FF00D1173576F65D94DA2639CC6D3CA415FB1EA838C7F8B35364C4A678
          B5FE4986D331BAAF07667D1CB8B6D95ABA78CCCB8E5988A577F252AF9C5FFE47
          07E14FE2936D10D9A9BA567EAEAAE7B87A14A8AF4398843D1A4214DBCCB9ECAD
          0A185248F104743550A626FB55BEC768616C5A21B109A715BDC44748402AC632
          71F553924AE7FBC6EB9630376D157FDA0A18B870EA4BA06E5C07D99281FEEE52
          8FC12E9A9786BF2CEDEE9AA917614766B882170F15231833A5BCEE7CC270D7FE
          BA77187DE6B740B8A31C8BC9DA66F1B345C384957599390169FDC6DB5AF3F050
          4D2610CBCE3B5D1587F2D519A3349397A93CE91945B593F38BFA67E827FA9AEF
          C51E266D047919ACEEDBF6F73FD297E1FC05D58ECEFD216FF3D87F6ADB3222C3
          8BB53B588CC27A0F65294A7F9015E22ECF2BF33AEE7B8FFD92BD5990B58DB0D1
          A3E4158FA0EC715886C5E9F525E7E4A03914A485250DAC64107C4A81EFADCE0F
          837B3F3BC7E67D3FD588C6717E31E1C7FF001FFEBFC554768ED2CDB5728DAA22
          A3D59988F3F1FF005523E6D67FD481B7E02BD1701AADE23EA3FB58BC422FD499
          7803A33F4F6B04DCA4A375BACDB5F567B94FFF00949F811BBE03CEA663557C38
          B28DDDF4F34C50C399D7F20B553929091D4E056355DA628761D2F02E2EDCA0DB
          E3B1717CACBD290901C59755B9654AEF3B95D4D3866716E5BE8B811B6F7B6A96
          FECB773B34EB739EC4C61C6159F2712527F9D70D36375D90B12A82D0A28706D5
          A7A2927C08EF15E92C7E617EAB30458AE166BD5D2CB716AE36B90A8B319396DD
          47E208EE20F88355D2C4D7B72BB50A535C5A6E15B56DED2F796D94A2E5676653
          A3DA799794C7FC0A5DFE7549260BAF2BB4EEA736B7A84D3AB38F578BFD9E55A5
          16B660C6988E54857394F2F96AF6824ED680C8E9DC6BA8707CAE04BB648FACB8
          B59395BBB49DD2DD6F8F6F87A7E2B5162B696996C3EBE8840C01EC79572EC1DC
          E372ED4F64A2B00F2505E237106E3AEAE51A5CF8E88ED446B94C46412B482A56
          56BCA80EAAF547C2A6D1E1E22BDF9894C4D519FB2F4F0E78973343A27A62416E
          5A67968A82D45BDBCADDF452739DF495987896D6E5B221A8C9BEAA43A838F972
          BDD9275A5FB33086E732B64B81E5129DE301406DEF49EB5123C1CB5C0E6D8F44
          F3AB0116B24D27C79B9E9BD3D0EC91AD0C3ACC44901D53CA4951528A892369F1
          34ED4E146479766DFB2E63ABCADB5931F10789F3F5AAADE25C24456A097096DB
          70AB99CCD9E240C6023F1A768F0E30DC876A45868B896A43ED71A5D708BC4899
          123371A35B99699686D4202D5F9564EA3C08E9A4324931739DB9CBFEAD7C1E34
          6C4C0C642035BB737F89BAFDACEE9798E98CEA52C47CE5C6DB24EFF2C93E03CA
          AD305F0743472F15CEE2386DA6DDD57E2FE2C92AA2E1B5BC369DF5BDFB7968A5
          FA4F8E97CD3D608D66F416A6B7172969E71C5214104E427A24FB3E1571578471
          64CC0DAEA821ACCADB1175CB52F1BE66A1B24BB4CCB2B01A948DBBF9CB250A1D
          50B1EAF7A5401A6E0C1DD1BC383F51D92C95A1C2D649A178D5234758C5AA0595
          9772B53AFC95BCA0B716AF12020E300003DD4FD6E16E9E4CD9BF85C4156236DA
          CBAB5FF1AEF1AC6C7FA19E82D428CA752E3E50E1739811D4208294F4DF857C2B
          9A4C184726671CD6EC966ADCCDB016514D17A915A575146BDC78A87DC8E1C4F2
          8FA815CC4147B4012319CD58D5D1B658CB4581EB651A298B5D7DD592AED23753
          DF6467EF0AFF00E754BF801F8FF853BF10ECAA7B94E136E52E686830253CE3C1
          907704731655B01E9909CE2B434ED31C61A75B0B2AE90E6713D536532BB45084
          5084508450845084509114A84669509734B7425CD2DD225CD174897752DD164B
          BA96E9119A2E849BA8BA2C8DD45D1646EA3325B2EBA65768A108A108A108A108
          A108A12228422950814212D2A12D09114A84508452A11421142114217FFFD9}
        Stretch = True
      end
      object QRDBText19: TQRDBText
        Left = 69
        Top = 775
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
          2050.520833333333000000
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
        Top = 941
        Width = 299
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          367.770833333333400000
          2489.729166666667000000
          791.104166666666800000)
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
        Top = 956
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
          2529.416666666667000000
          703.791666666666800000)
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
        Top = 969
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
          2563.812500000000000000
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
        Top = 956
        Width = 185
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          973.666666666666900000
          2529.416666666667000000
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
        Top = 969
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
          2563.812500000000000000
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
        Left = 533
        Top = 969
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
          2563.812500000000000000
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
        Top = 736
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
          1947.333333333334000000
          1264.708333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Pag'#225'vel Preferencialmente nas casas lot'#233'ricas,'
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
        Top = 798
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
          2111.375000000000000000
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
        Left = 96
        Top = 941
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
          2489.729166666667000000
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
        Top = 941
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
          2489.729166666667000000
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
        Top = 752
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
          1989.666666666667000000
          1264.708333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = ' Ag'#234'ncias Caixa e toda Rede Banc'#225'ria'
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
        Stretch = True
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
          0A544A504547496D616765500E0000FFD8FFE000104A46494600010101004700
          470000FFDB0043000604040405040605050609060506090B080606080B0C0A0A
          0B0A0A0C100C0C0C0C0C0C100C0E0F100F0E0C1313141413131C1B1B1B1C2020
          2020202020202020FFDB0043010707070D0C0D181010181A1511151A20202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020202020FFC00011080039008C03011100021101031101
          FFC4001D000001050003010000000000000000000000010506070802030409FF
          C400431000010303020304050807070500000000010203040005110612071321
          083141511422327181172352619294A1D11516566291B1C1243342437282A253
          6383C3D3FFC4001B010001050101000000000000000000000000010304050602
          07FFC40034110001030204040306070003000000000001000203041105122131
          1322516106417114325291B1D115234262A1C1E13381B2FFDA000C0301000211
          0311003F00A26B78A8114211421142114211421142114A9114212D2A44B8A542
          5C52D908C52D9225C52D9225C52D908DB4591746DA2C8BA36D1645D755309C5D
          F06DF3E7C94C58319D97257EC30C214E2CFB929049A47380D4E8940BA957C8F7
          14397CCFD5A9BB719FEEFAFD9EFA8BEDD0FC413BC07F4518B95AAE76B96A8772
          88F42948EAA62436A69601F1DAA00D4963C385C1B84D9046E96D568BA5DE7220
          5AE2BB366B99288EC24AD64246E3803C80A1EF0D173A040693B27FF92AE24FEC
          CDC7EEEE7E54C7B643F105D705FD0A8F5CAD970B5CE7605C63B9126B180F4779
          250B4E4050CA4F519041A7D8F0E171A85C1691BAE56AB55CAED3DA816C8CE4C9
          AF67951D9495AD5B5254AC2475E894934AF7868B9D024009D9483E4A7893FB33
          71FBBB9F9531EDB0FC43E6BBE03FA14C30AD1729B714DB624671FB82D65B4454
          24970AD3DE909EFCF4A905ED0DCD7D13794DEDE6A43F253C49FD9AB8FDDDCFCA
          9AF6D87E21F35DF01FD0A66BC69FBD59252625E20BD024A901C4B32105B51412
          405007C3293526291AF1769B84DB9A5BBA46AC77971B4BADC090B6D63285A5A5
          9491E60E2A33F12A569CAE9630479661F74EB692670B86388F42B8BF6AB8C76C
          B92223CCB63BD6B6D491D7A0EA479D771E214CF395B23093E41C0FF687D1CCD1
          7731C07A15D096CA941291951E800EF26A6D945528F92CE237ECDDC3EEEBFCAA
          27B741F1B7E69EE049D0A69BDE98D41625B48BCDB9FB7A9F0A2C89082DEF09C6
          EDB9EFC6453F14D1C9EE90570F639BB8B26DC53D65C27BE1DE83B9EB6D4ACD9A
          11E5231CD99288CA59653ED2F1E27AE00F135555552216662A6451979B2D9FA3
          742E98D1F6D4C1B2444B3D007A5100BEF1FA4E39DE7DDDC3C2B253D43E537715
          6EC8C3764F9E92D730B7BD3CC032519EB83E38F8530BB58DFB445C7D378B1764
          8394C34478C0FB984B840F729C35A8C21B687D4AABAC3CEAD3ECAFA17D12D92B
          584C6F0FCECC6B767C1841F9C58FF5AC63FDBF5D41C62A2EEE18F2DD3F471E99
          95F42532B52928585293ED01E154AA6AC85DA72D421F13972D23D5B9C4624157
          EF232C11EF096935A6C19F78C8E8555D6B7997A3B2D5B3D2B894A9647AB0213C
          E83FBEB29680FE0B55758C3ED0DBA9494439D6ADBF5D1BB65927DC5CEA8871DD
          7D5EE6D055FD2B2EAD57CFE81709D0A7B17161E289F1DD4BEDBE3BC3A856E0AF
          B42B7CD8464C876B59678BF9AEB7570FF5B44D5BA520DED9C256FA312591FE5B
          C9E8E27ED0E9F55626AA031485A7C95EC52676DD44F8D5A1ED17F8F6FBDC96B9
          8EDA1679891DCB657FE15F980B00FF001AAEAFC46A69A99E60D09DFB0EA3BAB1
          C368A1A8A86B65DBEA7A155CDCAFEC4286B9121C0C45653D49E800EE000FC001
          5E610523A57E56F33DC57A470D913733AC1AD1F254F6A6D4F3AFF2F7BB96E134
          7FB2C5F2FDF5F9AC8FE1DC3C49F73F0BF859940CCEFD673FC760BCA3C418FBAB
          1F959A4236EFDCA9DF67AD0BFAC5AD517092DEEB6D936C9773DCA7B3F328FE23
          77C2AE719AAE145947BCEFA79AA6A28B33EFE416BB2F34161BDC02CF727C6B16
          AED517DABAD7CED3D64BA04E551252E393E21321BDC7E196055E60125A623A85
          03106F25FA1599F15B1B2A65A57B2CD96344D1F3EF18065DC25168AFC434C246
          D4FDA528D6271892F206F900AF28DBCB7527E3B6B3BB699D02FCAB4A8B53A5BC
          888DC94F7B21CC952C7D7B52424F81350A8E012C81A764FCCFCADBAC7D1EE772
          8D711736253CDDC92AE609A95AB9DBFE97333BB3F1AD67B3C7972D85954711D7
          BDD3F59EDF7CE216BA65875CE65C6ECFEE97271809481F38E103A74427FA534E
          CB4D169B05D8BC8E5B662B36DD3F616A2B1B63DBEDB1C2519E89436D27BC9F70
          EA6B20F7171B9DCAB802CA05C12D48FDFAD37BBBBC55BA4DD1E5212B3D52D143
          65B47D5B5040A9357070B28F3CBF74CD3CB9EE7BA81F6ADB76F6AC1764A7D853
          F15D5F9EF0971B1F0D8BA9F823F9CB7A8FA262B8680AE5D92ADFB4EA1BA2877F
          22336AF76F5AFF009A69DC71FEE8F55CD08DCAB3B8E178F41E16EA05E7FBF8FE
          89F094B0C1FC1CAA8A466695A3B853263661F458B856F02CFAB9781DA9F5469E
          83394C40F4DB4CA50536853A1AC3C9E8A527767208E87DD589F13E33470C818F
          75A5035D09D3BD969307C2AA6566668E42ACA7F89D7F9ADAA1AB4E074481CB2D
          0928255BBA6318F1ACCB71BA47F2875EFF00B5DF6572306A9673682DADEE3459
          DB5BCEBB3D7D9302E0DAA2A2DCF2DA6E128EEDAA41C6E5A87452BEB1D3CAB69E
          19F0DC34838DEF3DDB1E83EFD5547887C452D5FE5FB8C1B8EA7AFA7409890852
          D4109054B51C2523A924F80AD82CAADA7C23D16DE8FD19160AD205C247F69B82
          BFEF2C754E7C903091EEAC0E2357C794BBCB61E8B434D16465BCD47ED3ABCDDF
          8E771B7B6B261DA6DCA65033EA97B98D9755FF0034A7DE935C182D067EAEFBA4
          E2DE5CBD02F6F1DE07E92E19DD92065C8A112907CB92E052CFD80AAEF0D93254
          30F7FAE896A9B78CAC815E80B38B427664D5111CD3536C0A584CC86FAA4211E2
          A65D03A8F72C1CFBC56271888878779157D46FD2CAD5BFDB2D57DB5BF6BBAB09
          930640C3AD2B23B8E4104608208E84555472161B8DC296E6822C556E7845C37D
          291275FF00D1173576F65D94DA2639CC6D3CA415FB1EA838C7F8B35364C4A678
          B5FE4986D331BAAF07667D1CB8B6D95ABA78CCCB8E5988A577F252AF9C5FFE47
          07E14FE2936D10D9A9BA567EAEAAE7B87A14A8AF4398843D1A4214DBCCB9ECAD
          0A185248F104743550A626FB55BEC768616C5A21B109A715BDC44748402AC632
          71F553924AE7FBC6EB9630376D157FDA0A18B870EA4BA06E5C07D99281FEEE52
          8FC12E9A9786BF2CEDEE9AA917614766B882170F15231833A5BCEE7CC270D7FE
          BA77187DE6B740B8A31C8BC9DA66F1B345C384957599390169FDC6DB5AF3F050
          4D2610CBCE3B5D1587F2D519A3349397A93CE91945B593F38BFA67E827FA9AEF
          C51E266D047919ACEEDBF6F73FD297E1FC05D58ECEFD216FF3D87F6ADB3222C3
          8BB53B588CC27A0F65294A7F9015E22ECF2BF33AEE7B8FFD92BD5990B58DB0D1
          A3E4158FA0EC715886C5E9F525E7E4A03914A485250DAC64107C4A81EFADCE0F
          837B3F3BC7E67D3FD588C6717E31E1C7FF001FFEBFC554768ED2CDB5728DAA22
          A3D59988F3F1FF005523E6D67FD481B7E02BD1701AADE23EA3FB58BC422FD499
          7803A33F4F6B04DCA4A375BACDB5F567B94FFF00949F811BBE03CEA663557C38
          B28DDDF4F34C50C399D7F20B553929091D4E056355DA628761D2F02E2EDCA0DB
          E3B1717CACBD290901C59755B9654AEF3B95D4D3866716E5BE8B811B6F7B6A96
          FECB773B34EB739EC4C61C6159F2712527F9D70D36375D90B12A82D0A28706D5
          A7A2927C08EF15E92C7E617EAB30458AE166BD5D2CB716AE36B90A8B319396DD
          47E208EE20F88355D2C4D7B72BB50A535C5A6E15B56DED2F796D94A2E5676653
          A3DA799794C7FC0A5DFE7549260BAF2BB4EEA736B7A84D3AB38F578BFD9E55A5
          16B660C6988E54857394F2F96AF6824ED680C8E9DC6BA8707CAE04BB648FACB8
          B59395BBB49DD2DD6F8F6F87A7E2B5162B696996C3EBE8840C01EC79572EC1DC
          E372ED4F64A2B00F2505E237106E3AEAE51A5CF8E88ED446B94C46412B482A56
          56BCA80EAAF547C2A6D1E1E22BDF9894C4D519FB2F4F0E78973343A27A62416E
          5A67968A82D45BDBCADDF452739DF495987896D6E5B221A8C9BEAA43A838F972
          BDD9275A5FB33086E732B64B81E5129DE301406DEF49EB5123C1CB5C0E6D8F44
          F3AB0116B24D27C79B9E9BD3D0EC91AD0C3ACC44901D53CA4951528A892369F1
          34ED4E146479766DFB2E63ABCADB5931F10789F3F5AAADE25C24456A097096DB
          70AB99CCD9E240C6023F1A768F0E30DC876A45868B896A43ED71A5D708BC4899
          123371A35B99699686D4202D5F9564EA3C08E9A4324931739DB9CBFEAD7C1E34
          6C4C0C642035BB737F89BAFDACEE9798E98CEA52C47CE5C6DB24EFF2C93E03CA
          AD305F0743472F15CEE2386DA6DDD57E2FE2C92AA2E1B5BC369DF5BDFB7968A5
          FA4F8E97CD3D608D66F416A6B7172969E71C5214104E427A24FB3E1571578471
          64CC0DAEA821ACCADB1175CB52F1BE66A1B24BB4CCB2B01A948DBBF9CB250A1D
          50B1EAF7A5401A6E0C1DD1BC383F51D92C95A1C2D649A178D5234758C5AA0595
          9772B53AFC95BCA0B716AF12020E300003DD4FD6E16E9E4CD9BF85C4156236DA
          CBAB5FF1AEF1AC6C7FA19E82D428CA752E3E50E1739811D4208294F4DF857C2B
          9A4C184726671CD6EC966ADCCDB016514D17A915A575146BDC78A87DC8E1C4F2
          8FA815CC4147B4012319CD58D5D1B658CB4581EB651A298B5D7DD592AED23753
          DF6467EF0AFF00E754BF801F8FF853BF10ECAA7B94E136E52E686830253CE3C1
          907704731655B01E9909CE2B434ED31C61A75B0B2AE90E6713D536532BB45084
          5084508450845084509114A84669509734B7425CD2DD225CD174897752DD164B
          BA96E9119A2E849BA8BA2C8DD45D1646EA3325B2EBA65768A108A108A108A108
          A108A12228422950814212D2A12D09114A84508452A11421142114217FFFD9}
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
          973.666666666666900000
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
          775.229166666666800000
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
          775.229166666666800000
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
        Caption = 'Pag'#225'vel Preferencialmente nas casas lot'#233'ricas,'
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
        Caption = ' Ag'#234'ncias Caixa e toda Rede Banc'#225'ria'
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
        Top = 820
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
          2169.583333333333000000
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
        Top = 820
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
          2169.583333333333000000
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
          0A544A504547496D616765500E0000FFD8FFE000104A46494600010101004700
          470000FFDB0043000604040405040605050609060506090B080606080B0C0A0A
          0B0A0A0C100C0C0C0C0C0C100C0E0F100F0E0C1313141413131C1B1B1B1C2020
          2020202020202020FFDB0043010707070D0C0D181010181A1511151A20202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020202020FFC00011080039008C03011100021101031101
          FFC4001D000001050003010000000000000000000000010506070802030409FF
          C400431000010303020304050807070500000000010203040005110612071321
          083141511422327181172352619294A1D11516566291B1C1243342437282A253
          6383C3D3FFC4001B010001050101000000000000000000000000010304050602
          07FFC40034110001030204040306070003000000000001000203041105122131
          1322516106417114325291B1D115234262A1C1E13381B2FFDA000C0301000211
          0311003F00A26B78A8114211421142114211421142114A9114212D2A44B8A542
          5C52D908C52D9225C52D9225C52D908DB4591746DA2C8BA36D1645D755309C5D
          F06DF3E7C94C58319D97257EC30C214E2CFB929049A47380D4E8940BA957C8F7
          14397CCFD5A9BB719FEEFAFD9EFA8BEDD0FC413BC07F4518B95AAE76B96A8772
          88F42948EAA62436A69601F1DAA00D4963C385C1B84D9046E96D568BA5DE7220
          5AE2BB366B99288EC24AD64246E3803C80A1EF0D173A040693B27FF92AE24FEC
          CDC7EEEE7E54C7B643F105D705FD0A8F5CAD970B5CE7605C63B9126B180F4779
          250B4E4050CA4F519041A7D8F0E171A85C1691BAE56AB55CAED3DA816C8CE4C9
          AF67951D9495AD5B5254AC2475E894934AF7868B9D024009D9483E4A7893FB33
          71FBBB9F9531EDB0FC43E6BBE03FA14C30AD1729B714DB624671FB82D65B4454
          24970AD3DE909EFCF4A905ED0DCD7D13794DEDE6A43F253C49FD9AB8FDDDCFCA
          9AF6D87E21F35DF01FD0A66BC69FBD59252625E20BD024A901C4B32105B51412
          405007C3293526291AF1769B84DB9A5BBA46AC77971B4BADC090B6D63285A5A5
          9491E60E2A33F12A569CAE9630479661F74EB692670B86388F42B8BF6AB8C76C
          B92223CCB63BD6B6D491D7A0EA479D771E214CF395B23093E41C0FF687D1CCD1
          7731C07A15D096CA941291951E800EF26A6D945528F92CE237ECDDC3EEEBFCAA
          27B741F1B7E69EE049D0A69BDE98D41625B48BCDB9FB7A9F0A2C89082DEF09C6
          EDB9EFC6453F14D1C9EE90570F639BB8B26DC53D65C27BE1DE83B9EB6D4ACD9A
          11E5231CD99288CA59653ED2F1E27AE00F135555552216662A6451979B2D9FA3
          742E98D1F6D4C1B2444B3D007A5100BEF1FA4E39DE7DDDC3C2B253D43E537715
          6EC8C3764F9E92D730B7BD3CC032519EB83E38F8530BB58DFB445C7D378B1764
          8394C34478C0FB984B840F729C35A8C21B687D4AABAC3CEAD3ECAFA17D12D92B
          584C6F0FCECC6B767C1841F9C58FF5AC63FDBF5D41C62A2EEE18F2DD3F471E99
          95F42532B52928585293ED01E154AA6AC85DA72D421F13972D23D5B9C4624157
          EF232C11EF096935A6C19F78C8E8555D6B7997A3B2D5B3D2B894A9647AB0213C
          E83FBEB29680FE0B55758C3ED0DBA9494439D6ADBF5D1BB65927DC5CEA8871DD
          7D5EE6D055FD2B2EAD57CFE81709D0A7B17161E289F1DD4BEDBE3BC3A856E0AF
          B42B7CD8464C876B59678BF9AEB7570FF5B44D5BA520DED9C256FA312591FE5B
          C9E8E27ED0E9F55626AA031485A7C95EC52676DD44F8D5A1ED17F8F6FBDC96B9
          8EDA1679891DCB657FE15F980B00FF001AAEAFC46A69A99E60D09DFB0EA3BAB1
          C368A1A8A86B65DBEA7A155CDCAFEC4286B9121C0C45653D49E800EE000FC001
          5E610523A57E56F33DC57A470D913733AC1AD1F254F6A6D4F3AFF2F7BB96E134
          7FB2C5F2FDF5F9AC8FE1DC3C49F73F0BF859940CCEFD673FC760BCA3C418FBAB
          1F959A4236EFDCA9DF67AD0BFAC5AD517092DEEB6D936C9773DCA7B3F328FE23
          77C2AE719AAE145947BCEFA79AA6A28B33EFE416BB2F34161BDC02CF727C6B16
          AED517DABAD7CED3D64BA04E551252E393E21321BDC7E196055E60125A623A85
          03106F25FA1599F15B1B2A65A57B2CD96344D1F3EF18065DC25168AFC434C246
          D4FDA528D6271892F206F900AF28DBCB7527E3B6B3BB699D02FCAB4A8B53A5BC
          888DC94F7B21CC952C7D7B52424F81350A8E012C81A764FCCFCADBAC7D1EE772
          8D711736253CDDC92AE609A95AB9DBFE97333BB3F1AD67B3C7972D85954711D7
          BDD3F59EDF7CE216BA65875CE65C6ECFEE97271809481F38E103A74427FA534E
          CB4D169B05D8BC8E5B662B36DD3F616A2B1B63DBEDB1C2519E89436D27BC9F70
          EA6B20F7171B9DCAB802CA05C12D48FDFAD37BBBBC55BA4DD1E5212B3D52D143
          65B47D5B5040A9357070B28F3CBF74CD3CB9EE7BA81F6ADB76F6AC1764A7D853
          F15D5F9EF0971B1F0D8BA9F823F9CB7A8FA262B8680AE5D92ADFB4EA1BA2877F
          22336AF76F5AFF009A69DC71FEE8F55CD08DCAB3B8E178F41E16EA05E7FBF8FE
          89F094B0C1FC1CAA8A466695A3B853263661F458B856F02CFAB9781DA9F5469E
          83394C40F4DB4CA50536853A1AC3C9E8A527767208E87DD589F13E33470C818F
          75A5035D09D3BD969307C2AA6566668E42ACA7F89D7F9ADAA1AB4E074481CB2D
          0928255BBA6318F1ACCB71BA47F2875EFF00B5DF6572306A9673682DADEE3459
          DB5BCEBB3D7D9302E0DAA2A2DCF2DA6E128EEDAA41C6E5A87452BEB1D3CAB69E
          19F0DC34838DEF3DDB1E83EFD5547887C452D5FE5FB8C1B8EA7AFA7409890852
          D4109054B51C2523A924F80AD82CAADA7C23D16DE8FD19160AD205C247F69B82
          BFEF2C754E7C903091EEAC0E2357C794BBCB61E8B434D16465BCD47ED3ABCDDF
          8E771B7B6B261DA6DCA65033EA97B98D9755FF0034A7DE935C182D067EAEFBA4
          E2DE5CBD02F6F1DE07E92E19DD92065C8A112907CB92E052CFD80AAEF0D93254
          30F7FAE896A9B78CAC815E80B38B427664D5111CD3536C0A584CC86FAA4211E2
          A65D03A8F72C1CFBC56271888878779157D46FD2CAD5BFDB2D57DB5BF6BBAB09
          930640C3AD2B23B8E4104608208E84555472161B8DC296E6822C556E7845C37D
          291275FF00D1173576F65D94DA2639CC6D3CA415FB1EA838C7F8B35364C4A678
          B5FE4986D331BAAF07667D1CB8B6D95ABA78CCCB8E5988A577F252AF9C5FFE47
          07E14FE2936D10D9A9BA567EAEAAE7B87A14A8AF4398843D1A4214DBCCB9ECAD
          0A185248F104743550A626FB55BEC768616C5A21B109A715BDC44748402AC632
          71F553924AE7FBC6EB9630376D157FDA0A18B870EA4BA06E5C07D99281FEEE52
          8FC12E9A9786BF2CEDEE9AA917614766B882170F15231833A5BCEE7CC270D7FE
          BA77187DE6B740B8A31C8BC9DA66F1B345C384957599390169FDC6DB5AF3F050
          4D2610CBCE3B5D1587F2D519A3349397A93CE91945B593F38BFA67E827FA9AEF
          C51E266D047919ACEEDBF6F73FD297E1FC05D58ECEFD216FF3D87F6ADB3222C3
          8BB53B588CC27A0F65294A7F9015E22ECF2BF33AEE7B8FFD92BD5990B58DB0D1
          A3E4158FA0EC715886C5E9F525E7E4A03914A485250DAC64107C4A81EFADCE0F
          837B3F3BC7E67D3FD588C6717E31E1C7FF001FFEBFC554768ED2CDB5728DAA22
          A3D59988F3F1FF005523E6D67FD481B7E02BD1701AADE23EA3FB58BC422FD499
          7803A33F4F6B04DCA4A375BACDB5F567B94FFF00949F811BBE03CEA663557C38
          B28DDDF4F34C50C399D7F20B553929091D4E056355DA628761D2F02E2EDCA0DB
          E3B1717CACBD290901C59755B9654AEF3B95D4D3866716E5BE8B811B6F7B6A96
          FECB773B34EB739EC4C61C6159F2712527F9D70D36375D90B12A82D0A28706D5
          A7A2927C08EF15E92C7E617EAB30458AE166BD5D2CB716AE36B90A8B319396DD
          47E208EE20F88355D2C4D7B72BB50A535C5A6E15B56DED2F796D94A2E5676653
          A3DA799794C7FC0A5DFE7549260BAF2BB4EEA736B7A84D3AB38F578BFD9E55A5
          16B660C6988E54857394F2F96AF6824ED680C8E9DC6BA8707CAE04BB648FACB8
          B59395BBB49DD2DD6F8F6F87A7E2B5162B696996C3EBE8840C01EC79572EC1DC
          E372ED4F64A2B00F2505E237106E3AEAE51A5CF8E88ED446B94C46412B482A56
          56BCA80EAAF547C2A6D1E1E22BDF9894C4D519FB2F4F0E78973343A27A62416E
          5A67968A82D45BDBCADDF452739DF495987896D6E5B221A8C9BEAA43A838F972
          BDD9275A5FB33086E732B64B81E5129DE301406DEF49EB5123C1CB5C0E6D8F44
          F3AB0116B24D27C79B9E9BD3D0EC91AD0C3ACC44901D53CA4951528A892369F1
          34ED4E146479766DFB2E63ABCADB5931F10789F3F5AAADE25C24456A097096DB
          70AB99CCD9E240C6023F1A768F0E30DC876A45868B896A43ED71A5D708BC4899
          123371A35B99699686D4202D5F9564EA3C08E9A4324931739DB9CBFEAD7C1E34
          6C4C0C642035BB737F89BAFDACEE9798E98CEA52C47CE5C6DB24EFF2C93E03CA
          AD305F0743472F15CEE2386DA6DDD57E2FE2C92AA2E1B5BC369DF5BDFB7968A5
          FA4F8E97CD3D608D66F416A6B7172969E71C5214104E427A24FB3E1571578471
          64CC0DAEA821ACCADB1175CB52F1BE66A1B24BB4CCB2B01A948DBBF9CB250A1D
          50B1EAF7A5401A6E0C1DD1BC383F51D92C95A1C2D649A178D5234758C5AA0595
          9772B53AFC95BCA0B716AF12020E300003DD4FD6E16E9E4CD9BF85C4156236DA
          CBAB5FF1AEF1AC6C7FA19E82D428CA752E3E50E1739811D4208294F4DF857C2B
          9A4C184726671CD6EC966ADCCDB016514D17A915A575146BDC78A87DC8E1C4F2
          8FA815CC4147B4012319CD58D5D1B658CB4581EB651A298B5D7DD592AED23753
          DF6467EF0AFF00E754BF801F8FF853BF10ECAA7B94E136E52E686830253CE3C1
          907704731655B01E9909CE2B434ED31C61A75B0B2AE90E6713D536532BB45084
          5084508450845084509114A84669509734B7425CD2DD225CD174897752DD164B
          BA96E9119A2E849BA8BA2C8DD45D1646EA3325B2EBA65768A108A108A108A108
          A108A12228422950814212D2A12D09114A84508452A11421142114217FFFD9}
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
        Left = 286
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
          756.708333333333400000
          936.625000000000100000
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
          695.854166666666800000
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
        Top = 430
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
          1137.708333333333000000
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
      object QRLabel79: TQRLabel
        Left = 66
        Top = 429
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
          1135.062500000000000000
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
      object QRShape41: TQRShape
        Left = 63
        Top = 426
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
          1127.125000000000000000
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
          1166.812500000000000000
          1193.270833333333000000
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
          1320.270833333333000000
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
          1561.041666666667000000
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
      object QRLabel92: TQRLabel
        Left = 66
        Top = 600
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
          1587.500000000000000000
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
        Top = 392
        Width = 478
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          182.562500000000000000
          1037.166666666667000000
          1264.708333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Pag'#225'vel Preferencialmente nas casas lot'#233'ricas,'
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
      object QRLabel101: TQRLabel
        Left = 69
        Top = 410
        Width = 478
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          182.562500000000000000
          1084.791666666667000000
          1264.708333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = ' Ag'#234'ncias Caixa e toda Rede Banc'#225'ria'
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
        Top = 435
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
          1150.937500000000000000
          402.166666666666600000)
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
        Left = 600
        Top = 456
        Width = 107
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1587.500000000000000000
          1206.500000000000000000
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
        Top = 400
        Width = 145
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1481.666666666667000000
          1058.333333333333000000
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
        Top = 434
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
          1148.291666666667000000
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
        Top = 480
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
          1270.000000000000000000
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
        Left = 95
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
          251.354166666666700000
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
        Left = 140
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
          370.416666666666700000
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
        Left = 442
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
          1169.458333333333000000
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
        Left = 95
        Top = 616
        Width = 268
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          251.354166666666700000
          1629.833333333333000000
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
      object QRDBText42: TQRDBText
        Left = 95
        Top = 631
        Width = 69
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          251.354166666666700000
          1669.520833333333000000
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
        Left = 368
        Top = 616
        Width = 185
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          973.666666666666900000
          1629.833333333333000000
          489.479166666666600000)
        Alignment = taLeftJustify
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
        Left = 168
        Top = 631
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
          1669.520833333333000000
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
      object QRDBText45: TQRDBText
        Left = 534
        Top = 631
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
          1669.520833333333000000
          52.916666666666660000)
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
        Left = 526
        Top = 629
        Width = 5
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1391.708333333333000000
          1664.229166666667000000
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
        Top = 841
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
          2225.145833333333000000
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
    end
  end
end
