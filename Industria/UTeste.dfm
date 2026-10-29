object Fteste: TFteste
  Left = 135
  Top = 165
  Width = 812
  Height = 510
  Caption = 'Fteste'
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
  object QuickRep1: TQuickRep
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    BeforePrint = QuickRep1BeforePrint
    DataSet = DMOrdemProducao.QEtiqueta
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
      110.000000000000000000
      2970.000000000000000000
      110.000000000000000000
      2100.000000000000000000
      45.000000000000000000
      45.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
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
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    PrevInitialZoom = qrZoomToFit
    object QRBand1: TQRBand
      Left = 17
      Top = 42
      Width = 760
      Height = 80
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QRBand1BeforePrint
      Color = clWhite
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        211.666666666666700000
        2010.833333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object Barcode1: TBarcode
        Left = 40
        Top = 40
        Width = 80
        Height = 30
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
      object Barcode2: TBarcode
        Left = 192
        Top = 40
        Width = 80
        Height = 30
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
      object Barcode3: TBarcode
        Left = 336
        Top = 40
        Width = 80
        Height = 30
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
      object Barcode4: TBarcode
        Left = 464
        Top = 32
        Width = 80
        Height = 30
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
      object Barcode5: TBarcode
        Left = 616
        Top = 32
        Width = 80
        Height = 30
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
      object QRLProduto1: TQRLabel
        Left = 14
        Top = 10
        Width = 134
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          37.041666666666670000
          26.458333333333330000
          354.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRLProduto1'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 5
      end
      object QRL_DT1: TQRLabel
        Left = 14
        Top = 20
        Width = 33
        Height = 8
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          21.166666666666670000
          37.041666666666670000
          52.916666666666660000
          87.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRL_DT1'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 5
      end
      object QRLVolumes1: TQRLabel
        Left = 88
        Top = 20
        Width = 44
        Height = 8
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          21.166666666666670000
          232.833333333333400000
          52.916666666666660000
          116.416666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRLVolumes1'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 5
      end
      object QRLProduto2: TQRLabel
        Left = 163
        Top = 10
        Width = 134
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          431.270833333333400000
          26.458333333333330000
          354.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRLProduto1'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 5
      end
      object QRL_DT2: TQRLabel
        Left = 163
        Top = 20
        Width = 33
        Height = 8
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          21.166666666666670000
          431.270833333333400000
          52.916666666666660000
          87.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRL_DT2'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 5
      end
      object QRLVolumes2: TQRLabel
        Left = 240
        Top = 20
        Width = 44
        Height = 8
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          21.166666666666670000
          635.000000000000000000
          52.916666666666660000
          116.416666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRLVolumes2'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 5
      end
      object QRLProduto3: TQRLabel
        Left = 316
        Top = 10
        Width = 134
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          836.083333333333400000
          26.458333333333330000
          354.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRLProduto3'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 5
      end
      object QRL_DT3: TQRLabel
        Left = 316
        Top = 20
        Width = 33
        Height = 8
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          21.166666666666670000
          836.083333333333400000
          52.916666666666660000
          87.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRL_DT3'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 5
      end
      object QRLVolumes3: TQRLabel
        Left = 384
        Top = 20
        Width = 44
        Height = 8
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          21.166666666666670000
          1016.000000000000000000
          52.916666666666660000
          116.416666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRLVolumes3'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 5
      end
      object QRLProduto4: TQRLabel
        Left = 470
        Top = 10
        Width = 134
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1243.541666666667000000
          26.458333333333330000
          354.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRLProduto4'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 5
      end
      object QRL_DT4: TQRLabel
        Left = 470
        Top = 20
        Width = 33
        Height = 8
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          21.166666666666670000
          1243.541666666667000000
          52.916666666666660000
          87.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRL_DT4'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 5
      end
      object QRLVolumes4: TQRLabel
        Left = 520
        Top = 20
        Width = 44
        Height = 8
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          21.166666666666670000
          1375.833333333333000000
          52.916666666666660000
          116.416666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRLVolumes4'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 5
      end
      object QRLProduto5: TQRLabel
        Left = 621
        Top = 10
        Width = 134
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1643.062500000000000000
          26.458333333333330000
          354.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRLProduto5'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 5
      end
      object QRL_DT5: TQRLabel
        Left = 621
        Top = 20
        Width = 33
        Height = 8
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          21.166666666666670000
          1643.062500000000000000
          52.916666666666660000
          87.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRL_DT5'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 5
      end
      object QRLVolumes5: TQRLabel
        Left = 664
        Top = 20
        Width = 44
        Height = 8
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          21.166666666666670000
          1756.833333333333000000
          52.916666666666660000
          116.416666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRLVolumes5'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 5
      end
      object QRImage1: TQRImage
        Left = 11
        Top = 28
        Width = 134
        Height = 39
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          103.187500000000000000
          29.104166666666670000
          74.083333333333340000
          354.541666666666700000)
      end
      object QRImage2: TQRImage
        Left = 161
        Top = 28
        Width = 134
        Height = 39
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          103.187500000000000000
          425.979166666666700000
          74.083333333333340000
          354.541666666666700000)
      end
      object QRImage3: TQRImage
        Left = 315
        Top = 28
        Width = 134
        Height = 39
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          103.187500000000000000
          833.437500000000000000
          74.083333333333340000
          354.541666666666700000)
      end
      object QRImage4: TQRImage
        Left = 469
        Top = 28
        Width = 134
        Height = 39
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          103.187500000000000000
          1240.895833333333000000
          74.083333333333340000
          354.541666666666700000)
      end
      object QRImage5: TQRImage
        Left = 620
        Top = 28
        Width = 134
        Height = 39
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          103.187500000000000000
          1640.416666666667000000
          74.083333333333340000
          354.541666666666700000)
      end
    end
  end
end
