object FROrdemServico_Entrada3: TFROrdemServico_Entrada3
  Left = 429
  Top = 8
  Width = 855
  Height = 823
  Caption = 'Ordem de Servi'#231'o Entrada'
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
    Left = -8
    Top = 0
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = DMOrdemServico.QREntrada
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
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
      50.000000000000000000
      2970.000000000000000000
      60.000000000000000000
      2100.000000000000000000
      50.000000000000000000
      50.000000000000000000
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
    ShowProgress = False
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    PrevInitialZoom = qrZoomOther
    object QRBand1: TQRBand
      Left = 19
      Top = 23
      Width = 756
      Height = 346
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        915.458333333333300000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object QRLTitulo: TQRLabel
        Left = 8
        Top = 18
        Width = 145
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          21.166666666666670000
          47.625000000000000000
          383.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'ORDEM DE SERVI'#199'O'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRLEmpresa: TQRLabel
        Left = 8
        Top = 0
        Width = 73
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          21.166666666666670000
          0.000000000000000000
          193.145833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Empresa:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRShape4: TQRShape
        Left = 8
        Top = 32
        Width = 747
        Height = 10
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          26.458333333333330000
          21.166666666666670000
          84.666666666666670000
          1976.437500000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel3: TQRLabel
        Left = 8
        Top = 60
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
          158.750000000000000000
          277.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cliente.....:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText4: TQRDBText
        Left = 117
        Top = 60
        Width = 432
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          309.562500000000000000
          158.750000000000000000
          1143.000000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMOrdemServico.QREntrada
        DataField = 'NOME_CLIENTE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBFone: TQRDBText
        Left = 425
        Top = 16
        Width = 145
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1124.479166666667000000
          42.333333333333330000
          383.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = DMOrdemServico.QREntrada
        DataField = 'DESC_FONE_FILIAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRDBText1: TQRDBText
        Left = 117
        Top = 40
        Width = 169
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          309.562500000000000000
          105.833333333333300000
          447.145833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = DMOrdemServico.QREntrada
        DataField = 'COD_ORDEM_SERVICO_CAB'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel7: TQRLabel
        Left = 8
        Top = 40
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
          105.833333333333300000
          277.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'N'#186' da Ordem.:'
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
      object QRLabel6: TQRLabel
        Left = 8
        Top = 100
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
          264.583333333333300000
          277.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'End.........:'
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
      object QRLabel8: TQRLabel
        Left = 328
        Top = 40
        Width = 129
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          867.833333333333300000
          105.833333333333300000
          341.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Data Entrada...:'
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
      object QRLabel9: TQRLabel
        Left = 8
        Top = 80
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
          211.666666666666700000
          277.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CPF.........:'
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
      object QRLabel10: TQRLabel
        Left = 8
        Top = 118
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
          312.208333333333300000
          277.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Celular.....:'
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
      object QRDBText2: TQRDBText
        Left = 116
        Top = 80
        Width = 89
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          306.916666666666700000
          211.666666666666700000
          235.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = DMOrdemServico.QREntrada
        DataField = 'NUM_CGC_CPF'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText3: TQRDBText
        Left = 116
        Top = 98
        Width = 105
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          306.916666666666700000
          259.291666666666700000
          277.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = DMOrdemServico.QREntrada
        DataField = 'DESC_ENDERECO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText5: TQRDBText
        Left = 459
        Top = 40
        Width = 81
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1214.437500000000000000
          105.833333333333300000
          214.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = DMOrdemServico.QREntrada
        DataField = 'DT_ENTRADA'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText6: TQRDBText
        Left = 117
        Top = 118
        Width = 105
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          309.562500000000000000
          312.208333333333300000
          277.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = DMOrdemServico.QREntrada
        DataField = 'DESC_TELEFONE'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel12: TQRLabel
        Left = 8
        Top = 488
        Width = 113
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          1291.166666666667000000
          298.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Data de Sa'#237'da:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText10: TQRDBText
        Left = 128
        Top = 488
        Width = 65
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          338.666666666666700000
          1291.166666666667000000
          171.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = DMOrdemServico.QREntrada
        DataField = 'DT_SAIDA'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 8
        Top = 157
        Width = 177
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          415.395833333333300000
          468.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'N'#186' S'#233'rie/Marca-Modelo:'
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
      object QRLabel4: TQRLabel
        Left = 8
        Top = 138
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
          365.125000000000000000
          277.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Aparelho....:'
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
      object QRDBText8: TQRDBText
        Left = 117
        Top = 138
        Width = 129
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          309.562500000000000000
          365.125000000000000000
          341.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = DMOrdemServico.QREntrada
        DataField = 'DESC_EQUIPAMENTO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel13: TQRLabel
        Left = 645
        Top = 59
        Width = 49
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1706.562500000000000000
          156.104166666666700000
          129.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Senha:'
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
      object QRImage1: TQRImage
        Left = 645
        Top = 83
        Width = 88
        Height = 89
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          235.479166666666700000
          1706.562500000000000000
          219.604166666666700000
          232.833333333333300000)
        Picture.Data = {
          0A544A504547496D616765B3070000FFD8FFE1001845786966000049492A0008
          0000000000000000000000FFEC00114475636B79000100040000003C0000FFE1
          0321687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F003C
          3F787061636B657420626567696E3D22EFBBBF222069643D2257354D304D7043
          656869487A7265537A4E54637A6B633964223F3E203C783A786D706D65746120
          786D6C6E733A783D2261646F62653A6E733A6D6574612F2220783A786D70746B
          3D2241646F626520584D5020436F726520352E302D633036302036312E313334
          3334322C20323031302F30312F31302D31383A30363A34332020202020202020
          223E203C7264663A52444620786D6C6E733A7264663D22687474703A2F2F7777
          772E77332E6F72672F313939392F30322F32322D7264662D73796E7461782D6E
          7323223E203C7264663A4465736372697074696F6E207264663A61626F75743D
          222220786D6C6E733A786D703D22687474703A2F2F6E732E61646F62652E636F
          6D2F7861702F312E302F2220786D6C6E733A786D704D4D3D22687474703A2F2F
          6E732E61646F62652E636F6D2F7861702F312E302F6D6D2F2220786D6C6E733A
          73745265663D22687474703A2F2F6E732E61646F62652E636F6D2F7861702F31
          2E302F73547970652F5265736F75726365526566232220786D703A4372656174
          6F72546F6F6C3D2241646F62652050686F746F73686F70204353352220786D70
          4D4D3A496E7374616E636549443D22786D702E6969643A394336394141333437
          31443031314535424331443842303845434231314231362220786D704D4D3A44
          6F63756D656E7449443D22786D702E6469643A39433639414133353731443031
          31453542433144384230384543423131423136223E203C786D704D4D3A446572
          6976656446726F6D2073745265663A696E7374616E636549443D22786D702E69
          69643A3943363941413332373144303131453542433144384230384543423131
          423136222073745265663A646F63756D656E7449443D22786D702E6469643A39
          4336394141333337314430313145354243314438423038454342313142313622
          2F3E203C2F7264663A4465736372697074696F6E3E203C2F7264663A5244463E
          203C2F783A786D706D6574613E203C3F787061636B657420656E643D2272223F
          3EFFEE000E41646F62650064C000000001FFDB00840006040404050406050506
          09060506090B080606080B0C0A0A0B0A0A0C100C0C0C0C0C0C100C0E0F100F0E
          0C1313141413131C1B1B1B1C1F1F1F1F1F1F1F1F1F1F010707070D0C0D181010
          181A1511151A1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F
          1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1FFFC000110800570055
          03011100021101031101FFC4006E000100020301010000000000000000000000
          0108050607090301010000000000000000000000000000000010000005020501
          0703040300000000000000010203041112211305150607314132141617082242
          3351612324915243110100000000000000000000000000000000FFDA000C0301
          0002110311003F00E61B2F593DF4BB227FAB773BBCD5AE59979BE3BFC3E5B2FF
          007B2CC3B005F8000001A975659E4EF74DF9035C58DC2D75711450F24CC9D3C4
          B309A32C730DBB8914C6B4A6202B0FC46D2F9EC7EA449752C4B8FA1147793ADE
          7A5C432A729FC29325D08DD27312FBA97775405CB000001CB3E4BC5E5F27A4FA
          8B5C5D2FAE466B47A83716ECE542233CE24923EA32ADB7117DB5EE014D98D13A
          87EDA4DFEA4D2E307AAC43CA536E659CA262495EDA4CBB0927459977D95C6803
          D1C0000000000000000000000000000000000000000000000000000000000000
          000011726EB6A5752B4EFA0090000000104A49D6864743A1D3F5012000000023
          3116DF7159FED5C3FC80A11B2F593DF4BB227FAB773BBCD5AE59979BE3BFC3E5
          B2FF007B2CC3B005F8000001A975659E4EF74DF9035C58DC2D75711450F24CC9
          D3C4B309A32C730DBB8914C6B4A6202B0FC46D2F9EC7EA449752C4B8FA114779
          3ADE7A5C432A729FC29325D08DD27312FBA97775405CB000001CB3E4BC5E5F27
          A4FA8B5C5D2FAE466B47A83716ECE542233CE24923EA32ADB7117DB5EE014D98
          D13A87EDA4DFEA4D2E307AAC43CA536E659CA262495EDA4CBB0927459977D95C
          6803D1C000000000000000000000000000000000000000000000000000000000
          0000000018AF56F15DF360DE216F94AED7E61AF35D977E1BAFF0E3D9D8032A00
          000214A4A526A51925292A999E044440317A272BE2FAF29F4E89ABC2D51514C9
          324A1C869F36CCFB2FCB52ADAD3BC0654000007CA5CB8B0E33B2A5BC88F15849
          ADE7DD5121B42125535294A322222FD4C0613DC3E05B41EB3EA3D3369274A39E
          A1E718C8CE32A937997DB7D0AB6D6B401473D09C93DECDA77983BA6F37EEDB84
          6FC9E62ECCFC97E6D7FE74BEEFA69501E81800000D3BAC7A4CED5BA5FC974F83
          2DB8325F84E524BEE25868928A2DC4B8EACD294256849A0D4A3A1571C0055FF8
          8DC6B564F545CD4133A2B51A0C47D32E3372E3BAEBE4BA21294B4D2D6A5212B3
          4ACD74B702C6A6402E8800000E4DF28744D4757E916A0D4298CC4F2EFB122414
          97DB8CDBCD2154CA371D5211535A92A4919E2644458D005358FC5358F6FF0050
          D4CA743285B9C265704A6C535A9CC89469754D939F4DA57126B89D554C08E81F
          FFD9}
      end
      object QRLabel14: TQRLabel
        Left = 8
        Top = 292
        Width = 97
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          772.583333333333300000
          256.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Observa'#231#245'es:'
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
      object QRLabel15: TQRLabel
        Left = 8
        Top = 321
        Width = 113
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          849.312500000000000000
          298.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Data de Sa'#237'da:'
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
      object QRLabel16: TQRLabel
        Left = 296
        Top = 321
        Width = 49
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          783.166666666666700000
          849.312500000000000000
          129.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Valor:'
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
      object QRDBText9: TQRDBText
        Left = 122
        Top = 321
        Width = 65
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          322.791666666666700000
          849.312500000000000000
          171.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = DMOrdemServico.QREntrada
        DataField = 'DT_SAIDA'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel17: TQRLabel
        Left = 381
        Top = 16
        Width = 46
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1008.062500000000000000
          42.333333333333330000
          121.708333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'FONE:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRDBText7: TQRDBText
        Left = 8
        Top = 199
        Width = 737
        Height = 74
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          195.791666666666700000
          21.166666666666670000
          526.520833333333300000
          1949.979166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMOrdemServico.QREntrada
        DataField = 'DESC_SOLICITACAO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel18: TQRLabel
        Left = 8
        Top = 175
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
          463.020833333333300000
          277.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Defeito.....:'
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
      object QRSysData1: TQRSysData
        Left = 600
        Top = 0
        Width = 161
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1587.500000000000000000
          0.000000000000000000
          425.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Data = qrsDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FontSize = 11
      end
      object QRSemChip: TQRImage
        Left = 112
        Top = 293
        Width = 17
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          296.333333333333300000
          775.229166666666700000
          44.979166666666670000)
        Picture.Data = {
          0A544A504547496D6167652E020000FFD8FFE000104A46494600010200006400
          640000FFEC00114475636B7900010004000000640000FFEE000E41646F626500
          64C000000001FFDB008400010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010102020202020202020202
          0203030303030303030303010101010101010201010202020102020303030303
          0303030303030303030303030303030303030303030303030303030303030303
          030303030303030303030303FFC00011080010001003011100021101031101FF
          C4005B00000301000000000000000000000000000304060A0101010000000000
          0000000000000000000001100001050101010100000000000000000005010203
          04060807001111010101010100000000000000000000000001112131FFDA000C
          03010002110311003F00D37F0D70A7276FF8F79876BB1F09F36D16A757CFDE35
          A2D09D2F981F78998366FCEB3A4CA942172C44F9AD5EBF7ECC92CB23D55CF91E
          AAABFABF13201DD9C35CA5E75C7BD2FB9C5785F9BE6B5794F0AF573F9D3E1F30
          3A8950E684E18E5E185075C82264D52F50B9032586562A3E391A8E6AA2A27C32
          628B837B4393F21C65CB197D4747F86E7F459FE77F140A6C219F59C08C2C24B0
          BF36CDD1223490EBC7E0B946FD1B903E29A1958D92291AAD7222A2A7C2785BBF
          3B3794765C61D4396CA746F8768B447FC13D6C4040613D630454B96284708769
          D01C346D13D3DCBD76E5A99B1C5144C74923DC8D6A2AAA27C2DE3FFFD9}
      end
      object QRImage3: TQRImage
        Left = 304
        Top = 293
        Width = 17
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          804.333333333333300000
          775.229166666666700000
          44.979166666666670000)
        Picture.Data = {
          0A544A504547496D6167652E020000FFD8FFE000104A46494600010200006400
          640000FFEC00114475636B7900010004000000640000FFEE000E41646F626500
          64C000000001FFDB008400010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010102020202020202020202
          0203030303030303030303010101010101010201010202020102020303030303
          0303030303030303030303030303030303030303030303030303030303030303
          030303030303030303030303FFC00011080010001003011100021101031101FF
          C4005B00000301000000000000000000000000000304060A0101010000000000
          0000000000000000000001100001050101010100000000000000000005010203
          04060807001111010101010100000000000000000000000001112131FFDA000C
          03010002110311003F00D37F0D70A7276FF8F79876BB1F09F36D16A757CFDE35
          A2D09D2F981F78998366FCEB3A4CA942172C44F9AD5EBF7ECC92CB23D55CF91E
          AAABFABF13201DD9C35CA5E75C7BD2FB9C5785F9BE6B5794F0AF573F9D3E1F30
          3A8950E684E18E5E185075C82264D52F50B9032586562A3E391A8E6AA2A27C32
          628B837B4393F21C65CB197D4747F86E7F459FE77F140A6C219F59C08C2C24B0
          BF36CDD1223490EBC7E0B946FD1B903E29A1958D92291AAD7222A2A7C2785BBF
          3B3794765C61D4396CA746F8768B447FC13D6C4040613D630454B96284708769
          D01C346D13D3DCBD76E5A99B1C5144C74923DC8D6A2AAA27C2DE3FFFD9}
      end
      object QRLabel29: TQRLabel
        Left = 132
        Top = 294
        Width = 65
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          349.250000000000000000
          777.875000000000000000
          171.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'SEM CHIP'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel30: TQRLabel
        Left = 324
        Top = 294
        Width = 169
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          857.250000000000000000
          777.875000000000000000
          447.145833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'SEM CART'#195'O DE MEM'#211'RIA'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRComChip: TQRImage
        Left = 112
        Top = 293
        Width = 17
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          296.333333333333300000
          775.229166666666700000
          44.979166666666670000)
        Picture.Data = {
          0A544A504547496D61676566200000FFD8FFE104194578696600004D4D002A00
          0000080007011200030000000100010000011A00050000000100000062011B00
          05000000010000006A0128000300000001000200000131000200000063000000
          720132000200000014000000D58769000400000001000000EC00000118000AFC
          8000002710000AFC800000271041646F62652050686F746F73686F7020435335
          202831322E30783230313030313135205B32303130303131352E6D2E39393820
          323031302F30312F31353A30323A30303A3030206375746F66663B206D206272
          616E63685D29202057696E646F777300323031373A30363A32322031343A3334
          3A3538000000000003A001000300000001FFFF0000A002000400000001000000
          10A0030004000000010000001000000000000000060103000300000001000600
          00011A00050000000100000166011B0005000000010000016E01280003000000
          010002000002010004000000010000017602020004000000010000029B000000
          0000000048000000010000004800000001FFD8FFED000C41646F62655F434D00
          02FFEE000E41646F626500648000000001FFDB0084000C08080809080C09090C
          110B0A0B11150F0C0C0F1518131315131318110C0C0C0C0C0C110C0C0C0C0C0C
          0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D100E0E
          10140E0E0E14140E0E0E0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C0C0C0C
          0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC000110800100010
          03012200021101031101FFDD00040001FFC4013F000001050101010101010000
          0000000000030001020405060708090A0B010001050101010101010000000000
          0000010002030405060708090A0B1000010401030204020507060805030C3301
          0002110304211231054151611322718132061491A1B14223241552C162333472
          82D14307259253F0E1F163733516A2B283264493546445C2A3743617D255E265
          F2B384C3D375E3F3462794A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6
          C6D6E6F637475767778797A7B7C7D7E7F7110002020102040403040506070706
          05350100021103213112044151617122130532819114A1B14223C152D1F03324
          62E1728292435315637334F1250616A2B283072635C2D2449354A31764455536
          7465E2F2B384C3D375E3F34694A485B495C4D4E4F4A5B5C5D5E5F55666768696
          A6B6C6D6E6F62737475767778797A7B7C7FFDA000C03010002110311003F00ED
          3A1742E937F47C2BAEC5ADF6598F539EE7341249635CE71553AC61F4614753A3
          130D82CC1C573ECC8680032D735CFAA96FFC37A7FA777FA3FD0FFA540E8D9D57
          4FC1C47E0E6E3165F45632712FB9A05777A6D68C9AA5DB99EF1FADE37FD7AAFD
          37A9F68B19793D2313EACE5E1D79D4E464D94DCFBACF5185F6DD635CEB6DDA1D
          FE12C3EC67E633F44929FFD9FFED0AB850686F746F73686F7020332E30003842
          494D0425000000000010000000000000000000000000000000003842494D043A
          00000000007B000000100000000100000000000B7072696E744F757470757400
          00000400000000436C7253656E756D00000000436C7253000000005247424300
          000000496E7465656E756D00000000496E746500000000436C726D000000004D
          70426C626F6F6C010000000B7072696E7465724E616D65544558540000000100
          00003842494D043B00000000018200000010000000010000000000127072696E
          744F75747075744F7074696F6E7300000010000000004370746E626F6F6C0000
          000000436C6272626F6F6C00000000005267734D626F6F6C000000000043726E
          43626F6F6C0000000000436E7443626F6F6C00000000004C626C73626F6F6C00
          000000004E677476626F6F6C0000000000456D6C44626F6F6C0000000000496E
          7472626F6F6C000000000042636B674F626A6300000001000000000000524742
          43000000030000000052642020646F7562406FE000000000000000000047726E
          20646F7562406FE0000000000000000000426C2020646F7562406FE000000000
          000000000042726454556E744623526C74000000000000000000000000426C64
          20556E744623526C7400000000000000000000000052736C74556E7446235078
          6C40520000000000000000000A766563746F7244617461626F6F6C0100000000
          50675073656E756D000000005067507300000000506750430000000053636C20
          556E74462350726340590000000000003842494D03ED00000000001000480000
          0001000200480000000100023842494D042600000000000E0000000000000000
          00003F8000003842494D040D0000000000040000001E3842494D041900000000
          00040000001E3842494D03F3000000000009000000000000000001003842494D
          271000000000000A000100000000000000023842494D03F5000000000048002F
          66660001006C66660006000000000001002F6666000100A1999A000600000000
          0001003200000001005A00000006000000000001003500000001002D00000006
          0000000000013842494D03F80000000000700000FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E8
          00003842494D040000000000000200033842494D040200000000000800000000
          000000003842494D0430000000000004010101013842494D042D000000000006
          0001000000073842494D04080000000000100000000100000240000002400000
          00003842494D041E000000000004000000003842494D041A0000000003370000
          0006000000000000000000000010000000100000000100530000000100000000
          0000000000000000000000000000000100000000000000000000001000000010
          0000000000000000000000000000000001000000000000000000000000000000
          0000000010000000010000000000006E756C6C0000000200000006626F756E64
          734F626A6300000001000000000000526374310000000400000000546F70206C
          6F6E6700000000000000004C6566746C6F6E67000000000000000042746F6D6C
          6F6E670000001000000000526768746C6F6E670000001000000006736C696365
          73566C4C73000000014F626A6300000001000000000005736C69636500000012
          00000007736C69636549446C6F6E67000000000000000767726F757049446C6F
          6E6700000000000000066F726967696E656E756D0000000C45536C6963654F72
          6967696E0000000D6175746F47656E6572617465640000000054797065656E75
          6D0000000A45536C6963655479706500000000496D672000000006626F756E64
          734F626A6300000001000000000000526374310000000400000000546F70206C
          6F6E6700000000000000004C6566746C6F6E67000000000000000042746F6D6C
          6F6E670000001000000000526768746C6F6E67000000100000000375726C5445
          5854000000010000000000006E756C6C54455854000000010000000000004D73
          67655445585400000001000000000006616C7454616754455854000000010000
          0000000E63656C6C54657874497348544D4C626F6F6C010000000863656C6C54
          6578745445585400000001000000000009686F727A416C69676E656E756D0000
          000F45536C696365486F727A416C69676E0000000764656661756C7400000009
          76657274416C69676E656E756D0000000F45536C69636556657274416C69676E
          0000000764656661756C740000000B6267436F6C6F7254797065656E756D0000
          001145536C6963654247436F6C6F7254797065000000004E6F6E650000000974
          6F704F75747365746C6F6E67000000000000000A6C6566744F75747365746C6F
          6E67000000000000000C626F74746F6D4F75747365746C6F6E67000000000000
          000B72696768744F75747365746C6F6E6700000000003842494D042800000000
          000C000000023FF00000000000003842494D041100000000000101003842494D
          0414000000000004000000073842494D040C0000000002B70000000100000010
          0000001000000030000003000000029B00180001FFD8FFED000C41646F62655F
          434D0002FFEE000E41646F626500648000000001FFDB0084000C08080809080C
          09090C110B0A0B11150F0C0C0F1518131315131318110C0C0C0C0C0C110C0C0C
          0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D
          100E0E10140E0E0E14140E0E0E0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C
          0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC000110800
          10001003012200021101031101FFDD00040001FFC4013F000001050101010101
          0100000000000000030001020405060708090A0B010001050101010101010000
          0000000000010002030405060708090A0B100001040103020402050706080503
          0C33010002110304211231054151611322718132061491A1B14223241552C162
          33347282D14307259253F0E1F163733516A2B283264493546445C2A3743617D2
          55E265F2B384C3D375E3F3462794A485B495C4D4E4F4A5B5C5D5E5F556667686
          96A6B6C6D6E6F637475767778797A7B7C7D7E7F7110002020102040403040506
          07070605350100021103213112044151617122130532819114A1B14223C152D1
          F0332462E1728292435315637334F1250616A2B283072635C2D2449354A31764
          4555367465E2F2B384C3D375E3F34694A485B495C4D4E4F4A5B5C5D5E5F55666
          768696A6B6C6D6E6F62737475767778797A7B7C7FFDA000C0301000211031100
          3F00ED3A1742E937F47C2BAEC5ADF6598F539EE7341249635CE71553AC61F461
          4753A3130D82CC1C573ECC8680032D735CFAA96FFC37A7FA777FA3FD0FFA540E
          8D9D574FC1C47E0E6E3165F45632712FB9A05777A6D68C9AA5DB99EF1FADE37F
          D7AAFD37A9F68B19793D2313EACE5E1D79D4E464D94DCFBACF5185F6DD635CEB
          6DDA1DFE12C3EC67E633F44929FFD9003842494D042100000000005500000001
          010000000F00410064006F00620065002000500068006F0074006F0073006800
          6F00700000001300410064006F00620065002000500068006F0074006F007300
          68006F0070002000430053003500000001003842494D04060000000000070004
          000000010100FFE10E7C687474703A2F2F6E732E61646F62652E636F6D2F7861
          702F312E302F003C3F787061636B657420626567696E3D22EFBBBF222069643D
          2257354D304D7043656869487A7265537A4E54637A6B633964223F3E203C783A
          786D706D65746120786D6C6E733A783D2261646F62653A6E733A6D6574612F22
          20783A786D70746B3D2241646F626520584D5020436F726520352E302D633036
          302036312E3133343334322C20323031302F30312F31302D31383A30363A3433
          2020202020202020223E203C7264663A52444620786D6C6E733A7264663D2268
          7474703A2F2F7777772E77332E6F72672F313939392F30322F32322D7264662D
          73796E7461782D6E7323223E203C7264663A4465736372697074696F6E207264
          663A61626F75743D222220786D6C6E733A786D703D22687474703A2F2F6E732E
          61646F62652E636F6D2F7861702F312E302F2220786D6C6E733A64633D226874
          74703A2F2F7075726C2E6F72672F64632F656C656D656E74732F312E312F2220
          786D6C6E733A70686F746F73686F703D22687474703A2F2F6E732E61646F6265
          2E636F6D2F70686F746F73686F702F312E302F2220786D6C6E733A786D704D4D
          3D22687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F6D6D
          2F2220786D6C6E733A73744576743D22687474703A2F2F6E732E61646F62652E
          636F6D2F7861702F312E302F73547970652F5265736F757263654576656E7423
          2220786D703A43726561746F72546F6F6C3D2241646F62652050686F746F7368
          6F7020435335202831322E30783230313030313135205B32303130303131352E
          6D2E39393820323031302F30312F31353A30323A30303A3030206375746F6666
          3B206D206272616E63685D29202057696E646F77732220786D703A4372656174
          65446174653D22323031372D30362D32325431373A33313A31382D30333A3030
          2220786D703A4D6F64696679446174653D22323031372D30362D32325431343A
          33343A35382D30333A30302220786D703A4D65746164617461446174653D2232
          3031372D30362D32325431343A33343A35382D30333A3030222064633A666F72
          6D61743D22696D6167652F6A706567222070686F746F73686F703A436F6C6F72
          4D6F64653D22332220786D704D4D3A496E7374616E636549443D22786D702E69
          69643A4537323445443143373135374537313141343630434238443531463538
          4645302220786D704D4D3A446F63756D656E7449443D22786D702E6469643A45
          3632344544314337313537453731314134363043423844353146353846453022
          20786D704D4D3A4F726967696E616C446F63756D656E7449443D22786D702E64
          69643A4536323445443143373135374537313141343630434238443531463538
          464530223E203C786D704D4D3A486973746F72793E203C7264663A5365713E20
          3C7264663A6C692073744576743A616374696F6E3D2263726561746564222073
          744576743A696E7374616E636549443D22786D702E6969643A45363234454431
          4337313537453731314134363043423844353146353846453022207374457674
          3A7768656E3D22323031372D30362D32325431373A33313A31382D30333A3030
          222073744576743A736F6674776172654167656E743D2241646F62652050686F
          746F73686F7020435335202831322E30783230313030313135205B3230313030
          3131352E6D2E39393820323031302F30312F31353A30323A30303A3030206375
          746F66663B206D206272616E63685D29202057696E646F7773222F3E203C7264
          663A6C692073744576743A616374696F6E3D227361766564222073744576743A
          696E7374616E636549443D22786D702E6969643A453732344544314337313537
          4537313141343630434238443531463538464530222073744576743A7768656E
          3D22323031372D30362D32325431343A33343A35382D30333A30302220737445
          76743A736F6674776172654167656E743D2241646F62652050686F746F73686F
          7020435335202831322E30783230313030313135205B32303130303131352E6D
          2E39393820323031302F30312F31353A30323A30303A3030206375746F66663B
          206D206272616E63685D29202057696E646F7773222073744576743A6368616E
          6765643D222F222F3E203C2F7264663A5365713E203C2F786D704D4D3A486973
          746F72793E203C2F7264663A4465736372697074696F6E3E203C2F7264663A52
          44463E203C2F783A786D706D6574613E20202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020202020202020203C3F787061636B657420656E643D22
          77223F3EFFEE000E41646F626500640000000001FFDB00840006040404050406
          05050609060506090B080606080B0C0A0A0B0A0A0C100C0C0C0C0C0C100C0C0C
          0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C010707070D0C0D
          18101018140E0E0E14140E0E0E0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C
          0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC000110800
          10001003011100021101031101FFDD00040002FFC401A2000000070101010101
          0000000000000000040503020601000708090A0B010002020301010101010000
          0000000000010002030405060708090A0B100002010303020402060703040206
          0273010203110400052112314151061361227181143291A10715B14223C152D1
          E1331662F0247282F12543345392A2B26373C235442793A3B33617546474C3D2
          E2082683090A181984944546A4B456D355281AF2E3F3C4D4E4F465758595A5B5
          C5D5E5F566768696A6B6C6D6E6F637475767778797A7B7C7D7E7F73848586878
          8898A8B8C8D8E8F82939495969798999A9B9C9D9E9F92A3A4A5A6A7A8A9AAABA
          CADAEAFA110002020102030505040506040803036D0100021103042112314105
          511361220671819132A1B1F014C1D1E1234215526272F1332434438216925325
          A263B2C20773D235E2448317549308090A18192636451A2764745537F2A3B3C3
          2829D3E3F38494A4B4C4D4E4F465758595A5B5C5D5E5F5465666768696A6B6C6
          D6E6F6475767778797A7B7C7D7E7F738485868788898A8B8C8D8E8F839495969
          798999A9B9C9D9E9F92A3A4A5A6A7A8A9AAABACADAEAFAFFDA000C0301000211
          0311003F00ED1E46F22794EF3C9FA2DDDD6976F35C4F636D24B2BC60B33BC2AC
          CC49EA4938AA51E71D1BC9A961E66B2D2F47856E346D3649AE3508D15561B992
          2678A153D7D611FEFDA9FDDA3C3FEFD5C55FFFD0E89E4DD72D742D13499B46D6
          F4F68AF6C604D4F49BEBB445B7BB16EAA2E62AB7241CC05BBB6FDBFEFA2E137A
          8B70AA61AAEA7E50D33F2CF57D2ADF5DB4BFD4AE2CEEE5BCB813C465BABCB88D
          9A59788626B2487E041F6138449F0A2E2AFF00FFD9}
      end
    end
    object QRBand2: TQRBand
      Left = 19
      Top = 1057
      Width = 756
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = True
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        84.666666666666670000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object QRLabel1: TQRLabel
        Left = 8
        Top = 0
        Width = 145
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          0.000000000000000000
          383.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CEMAPA Inform'#225'tica'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLNomeRel: TQRLabel
        Left = 646
        Top = 0
        Width = 105
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1709.208333333333000000
          0.000000000000000000
          277.812500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NomeRelat'#243'rio'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRBand3: TQRBand
      Left = 19
      Top = 369
      Width = 756
      Height = 424
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QRBand3BeforePrint
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        1121.833333333333000000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbColumnHeader
      object QRLabel2: TQRLabel
        Left = 8
        Top = 8
        Width = 257
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          21.166666666666670000
          679.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CONTRATO DE PRESTA'#199#195'O DE SERVI'#199'O'
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
      object QRMClausulas: TQRMemo
        Left = 8
        Top = 30
        Width = 737
        Height = 331
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          875.770833333333300000
          21.166666666666670000
          79.375000000000000000
          1949.979166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape1: TQRShape
        Left = 188
        Top = 378
        Width = 553
        Height = 3
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          7.937500000000000000
          497.416666666666700000
          1000.125000000000000000
          1463.145833333333000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel19: TQRLabel
        Left = 8
        Top = 366
        Width = 177
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          968.375000000000000000
          468.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Assinatura do Cliente:'
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
    object QRBand4: TQRBand
      Left = 19
      Top = 793
      Width = 756
      Height = 264
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        698.500000000000000000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRLabel20: TQRLabel
        Left = 7
        Top = 31
        Width = 145
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          18.520833333333330000
          82.020833333333330000
          383.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'ORDEM DE SERVI'#199'O'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRLabel21: TQRLabel
        Left = 6
        Top = 57
        Width = 121
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          15.875000000000000000
          150.812500000000000000
          320.145833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'N'#186' da Ordem...:'
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
      object QRDBText13: TQRDBText
        Left = 128
        Top = 57
        Width = 169
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          338.666666666666700000
          150.812500000000000000
          447.145833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = DMOrdemServico.QREntrada
        DataField = 'COD_ORDEM_SERVICO_CAB'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel22: TQRLabel
        Left = 6
        Top = 77
        Width = 121
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          15.875000000000000000
          203.729166666666700000
          320.145833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cliente.......:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText14: TQRDBText
        Left = 128
        Top = 77
        Width = 432
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          338.666666666666700000
          203.729166666666700000
          1143.000000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMOrdemServico.QREntrada
        DataField = 'NOME_CLIENTE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel23: TQRLabel
        Left = 7
        Top = 97
        Width = 121
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          18.520833333333330000
          256.645833333333300000
          320.145833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Marca/Modelo..:'
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
      object QRLabel24: TQRLabel
        Left = 367
        Top = 57
        Width = 105
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          971.020833333333300000
          150.812500000000000000
          277.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Data Entrada:'
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
      object QRDBText15: TQRDBText
        Left = 474
        Top = 57
        Width = 81
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1254.125000000000000000
          150.812500000000000000
          214.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = DMOrdemServico.QREntrada
        DataField = 'DT_ENTRADA'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel25: TQRLabel
        Left = 368
        Top = 97
        Width = 105
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          973.666666666666700000
          256.645833333333300000
          277.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Valor.......:'
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
      object QRLabel26: TQRLabel
        Left = 572
        Top = 11
        Width = 46
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1513.416666666667000000
          29.104166666666670000
          121.708333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'FONE:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRDBText16: TQRDBText
        Left = 616
        Top = 11
        Width = 145
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1629.833333333333000000
          29.104166666666670000
          383.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = DMOrdemServico.QREntrada
        DataField = 'DESC_FONE_FILIAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRLabel27: TQRLabel
        Left = 573
        Top = 31
        Width = 100
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1516.062500000000000000
          82.020833333333330000
          264.583333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'VIA CLIENTE'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRMemo1: TQRMemo
        Left = 18
        Top = 125
        Width = 713
        Height = 103
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          272.520833333333300000
          47.625000000000000000
          330.729166666666700000
          1886.479166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = True
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        Lines.Strings = (
          
            'A perda desde recibo '#233' de sua responsabilidade. O objeto n'#227'o pro' +
            'curado em 30(trinta) dias'
          
            'ter'#225' seu pre'#231'o corrigido, e n'#227'o retirado em 90(noventa) dias, pe' +
            'rder'#225' o direito sobre o '
          'mesmo.'
          
            'A garantia s'#243' '#233' v'#225'lida pelo servi'#231'o executado, e n'#227'o abrange o m' +
            'au uso, infiltra'#231#227'o de'
          
            #225'guas e pe'#231'as quebradas. Vidro e pe'#231'as s'#243' quebram com quedas e b' +
            'atidas. '
          'Ciente, autorizo o conserto.')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel28: TQRLabel
        Left = 7
        Top = 243
        Width = 177
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          18.520833333333330000
          642.937500000000000000
          468.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Assinatura do Cliente:'
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
      object QRShape3: TQRShape
        Left = 187
        Top = 257
        Width = 553
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          494.770833333333300000
          679.979166666666700000
          1463.145833333333000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel11: TQRLabel
        Left = 8
        Top = 8
        Width = 82
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          21.166666666666670000
          21.166666666666670000
          216.958333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLabel11'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
    end
  end
end
