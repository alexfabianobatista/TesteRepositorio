inherited FRDanfe: TFRDanfe
  Caption = 'FRDanfe'
  PixelsPerInch = 96
  TextHeight = 13
  inherited QRPrimario: TQuickRep
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
    PrinterSettings.Duplex = False
    inherited QRBand1: TQRBand
      Height = 154
      Frame.DrawTop = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Size.Values = (
        407.458333333333300000
        2000.250000000000000000)
      inherited QRSysData2: TQRSysData
        Left = 727
        Top = 112
        Enabled = False
        Size.Values = (
          44.979166666666670000
          1923.520833333334000000
          296.333333333333400000
          68.791666666666660000)
        FontSize = 10
      end
      inherited QRLabel2: TQRLabel
        Left = 696
        Top = 112
        Enabled = False
        Size.Values = (
          44.979166666666670000
          1841.500000000000000000
          296.333333333333300000
          87.312500000000000000)
        FontSize = 10
      end
      inherited QRLTitulo: TQRLabel
        Left = 312
        Top = 26
        Height = 47
        Size.Values = (
          124.354166666666700000
          825.500000000000100000
          68.791666666666680000
          362.479166666666700000)
        Alignment = taCenter
        AutoSize = False
        Caption = 'DOCUMENTO AUXILIAR DA NOTA FISCAL ELETR'#212'NICA'
        Font.Height = -11
        ParentFont = False
        FontSize = 8
      end
      inherited QRLEmpresa: TQRLabel
        Left = 312
        Top = 8
        Width = 137
        Height = 19
        Size.Values = (
          50.270833333333330000
          825.500000000000100000
          21.166666666666670000
          362.479166666666700000)
        Alignment = taCenter
        AutoSize = False
        Caption = 'DANFE'
        Font.Height = -16
        Font.Style = [fsBold]
        ParentFont = False
        FontSize = 12
      end
      inherited QRSysData1: TQRSysData
        Left = 594
        Top = 136
        Enabled = False
        Size.Values = (
          44.979166666666670000
          1571.625000000000000000
          359.833333333333400000
          425.979166666666700000)
        FontSize = 10
      end
      object QRDBIImageDanfe: TQRDBImage
        Left = 8
        Top = 8
        Width = 137
        Height = 121
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          320.145833333333400000
          21.166666666666670000
          21.166666666666670000
          362.479166666666700000)
      end
      object QRShape1: TQRShape
        Left = 312
        Top = 0
        Width = 1
        Height = 153
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          404.812500000000000000
          825.500000000000100000
          0.000000000000000000
          2.645833333333333000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape2: TQRShape
        Left = 448
        Top = 0
        Width = 1
        Height = 153
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          404.812500000000000000
          1185.333333333333000000
          0.000000000000000000
          2.645833333333333000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape3: TQRShape
        Left = 448
        Top = 56
        Width = 305
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          1185.333333333333000000
          148.166666666666700000
          806.979166666666800000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape4: TQRShape
        Left = 448
        Top = 96
        Width = 305
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          1185.333333333333000000
          254.000000000000000000
          806.979166666666800000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRImage1: TQRImage
        Left = 456
        Top = 8
        Width = 289
        Height = 41
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          108.479166666666700000
          1206.500000000000000000
          21.166666666666670000
          764.645833333333400000)
      end
      object QRLabel3: TQRLabel
        Left = 456
        Top = 104
        Width = 289
        Height = 41
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          108.479166666666700000
          1206.500000000000000000
          275.166666666666700000
          764.645833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 
          'Consulta de autenticidade no portal nacional da NF-e www.nfe.faz' +
          'enda.gov.br/portal ou no site da Sefaz Autorizada'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRDBTHomologacao: TQRLabel
        Left = 8
        Top = 136
        Width = 297
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          21.166666666666670000
          359.833333333333400000
          785.812500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'SEM VALOR FISCAL'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
    end
    inherited QRBand2: TQRBand
      Top = 177
      Height = 200
      Size.Values = (
        529.166666666666700000
        2000.250000000000000000)
      inherited QRLabel1: TQRLabel
        Top = 184
        Enabled = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          486.833333333333300000
          383.645833333333300000)
        FontSize = 10
      end
      inherited QRLNomeRel: TQRLabel
        Top = 184
        Enabled = False
        Size.Values = (
          44.979166666666670000
          1735.666666666667000000
          486.833333333333300000
          277.812500000000000000)
        FontSize = 10
      end
    end
  end
end
