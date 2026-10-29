inherited FRFichaInspecao: TFRFichaInspecao
  Left = 323
  Top = 100
  Width = 935
  Height = 644
  HorzScrollBar.Position = 0
  Caption = 'Ficha de Inspe'#231#227'o'
  PixelsPerInch = 96
  TextHeight = 13
  inherited QRPrimario: TQuickRep
    Left = 0
    Width = 653
    Height = 845
    DataSet = DMOrdemServico.QRFichaInspecao
    Font.Name = 'Draft 12cpi'
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE'
      'QRLOOPBAND1')
    Functions.DATA = (
      '0'
      '0'
      #39#39
      '0')
    Page.Columns = 2
    Page.PaperSize = Letter
    Page.Values = (
      50.000000000000000000
      2794.000000000000000000
      60.000000000000000000
      2159.000000000000000000
      50.000000000000000000
      50.000000000000000000
      0.000000000000000000)
    Zoom = 80
    inherited QRBand1: TQRBand
      Left = 15
      Top = 18
      Width = 623
      Height = 105
      Size.Values = (
        347.265625000000000000
        2060.442708333333000000)
      inherited QRSysData2: TQRSysData
        Left = 594
        Width = 21
        Height = 14
        Size.Values = (
          44.979166666666670000
          1965.854166666667000000
          0.000000000000000000
          68.791666666666670000)
        FontSize = 10
      end
      inherited QRLabel2: TQRLabel
        Left = 563
        Width = 22
        Height = 13
        Size.Values = (
          42.994791666666670000
          1862.005208333333000000
          0.000000000000000000
          72.760416666666670000)
        FontSize = 10
      end
      inherited QRLTitulo: TQRLabel
        Left = 259
        Top = 37
        Width = 118
        Height = 16
        Size.Values = (
          52.916666666666670000
          856.588541666666700000
          122.369791666666700000
          390.260416666666700000)
        Font.Height = -17
        Font.Name = 'Draft 12cpi'
        Font.Style = [fsBold]
        ParentFont = False
        FontSize = 13
      end
      inherited QRLEmpresa: TQRLabel
        Left = 7
        Top = 5
        Width = 55
        Height = 15
        Size.Values = (
          49.609375000000000000
          23.151041666666670000
          16.536458333333330000
          181.901041666666700000)
        Font.Height = -16
        Font.Name = 'Draft 12cpi'
        ParentFont = False
        FontSize = 12
      end
      inherited QRSysData1: TQRSysData
        Left = 488
        Top = 13
        Width = 129
        Height = 14
        Size.Values = (
          44.979166666666670000
          1613.958333333333000000
          42.333333333333330000
          425.979166666666700000)
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 5
        Top = 59
        Width = 106
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          49.609375000000000000
          16.536458333333330000
          195.130208333333300000
          350.572916666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'ORDEM SERVI'#199'O:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Draft 12cpi'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRDBText1: TQRDBText
        Left = 111
        Top = 59
        Width = 93
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          49.609375000000000000
          367.109375000000000000
          195.130208333333300000
          307.578125000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMOrdemServico.QRFichaInspecao
        DataField = 'COD_ORDEM_SERVICO_CAB'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Draft 12cpi'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRDBText2: TQRDBText
        Left = 106
        Top = 72
        Width = 284
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          350.572916666666700000
          238.125000000000000000
          939.270833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMOrdemServico.QRFichaInspecao
        DataField = 'NOME'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel4: TQRLabel
        Left = 5
        Top = 72
        Width = 39
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          16.536458333333330000
          238.125000000000000000
          128.984375000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cliente.:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText3: TQRDBText
        Left = 61
        Top = 72
        Width = 40
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.302083333333330000
          201.744791666666700000
          238.125000000000000000
          132.291666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMOrdemServico.QRFichaInspecao
        DataField = 'COD_CADASTRO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 224
        Top = 59
        Width = 45
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          740.833333333333300000
          195.130208333333300000
          148.828125000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Emiss'#227'o:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText4: TQRDBText
        Left = 277
        Top = 59
        Width = 103
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.302083333333330000
          916.119791666666700000
          195.130208333333300000
          340.651041666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMOrdemServico.QRFichaInspecao
        DataField = 'DT_ENTRADA'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel6: TQRLabel
        Left = 429
        Top = 59
        Width = 43
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          1418.828125000000000000
          195.130208333333300000
          142.213541666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Previs'#227'o:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText5: TQRDBText
        Left = 474
        Top = 59
        Width = 103
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.302083333333330000
          1567.656250000000000000
          195.130208333333300000
          340.651041666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMOrdemServico.QRFichaInspecao
        DataField = 'DT_PREVISAO_ENTREGA'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel8: TQRLabel
        Left = 429
        Top = 72
        Width = 42
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          1418.828125000000000000
          238.125000000000000000
          138.906250000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Telefone:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText6: TQRDBText
        Left = 493
        Top = 72
        Width = 103
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.302083333333330000
          1630.494791666667000000
          238.125000000000000000
          340.651041666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMOrdemServico.QRFichaInspecao
        DataField = 'TELEFONE'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel16: TQRLabel
        Left = 5
        Top = 87
        Width = 48
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          16.536458333333330000
          287.734375000000000000
          158.750000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Vendedor:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText17: TQRDBText
        Left = 61
        Top = 87
        Width = 236
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.302083333333330000
          201.744791666666700000
          287.734375000000000000
          780.520833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMOrdemServico.QRFichaInspecao
        DataField = 'NOME_VENDEDOR'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape1: TQRShape
        Left = 0
        Top = 54
        Width = 622
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          3.307291666666667000
          0.000000000000000000
          178.593750000000000000
          2057.135416666667000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
    end
    inherited QRBand2: TQRBand
      Left = 15
      Top = 614
      Width = 623
      Height = 25
      Size.Values = (
        82.682291666666670000
        2060.442708333333000000)
      inherited QRLabel1: TQRLabel
        Left = 5
        Width = 99
        Height = 13
        Size.Values = (
          42.994791666666670000
          16.536458333333330000
          0.000000000000000000
          327.421875000000000000)
        FontSize = 10
      end
      inherited QRLNomeRel: TQRLabel
        Left = 534
        Width = 69
        Height = 13
        Size.Values = (
          42.994791666666670000
          1766.093750000000000000
          0.000000000000000000
          228.203125000000000000)
        FontSize = 10
      end
    end
    object QRBand3: TQRBand
      Left = 15
      Top = 123
      Width = 623
      Height = 291
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
        962.421875000000000000
        2060.442708333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbTitle
      object QRLabel11: TQRLabel
        Left = 5
        Top = 6
        Width = 47
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          16.536458333333330000
          19.843750000000000000
          155.442708333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Modelo...:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText9: TQRDBText
        Left = 73
        Top = 6
        Width = 103
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          241.432291666666700000
          19.843750000000000000
          340.651041666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMOrdemServico.QRFichaInspecao
        DataField = 'DESC_MODELO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel12: TQRLabel
        Left = 5
        Top = 19
        Width = 43
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          16.536458333333330000
          62.838541666666670000
          142.213541666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Motor....:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText10: TQRDBText
        Left = 73
        Top = 19
        Width = 103
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          241.432291666666700000
          62.838541666666670000
          340.651041666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMOrdemServico.QRFichaInspecao
        DataField = 'NUM_MOTOR'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel14: TQRLabel
        Left = 333
        Top = 2
        Width = 43
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          1101.328125000000000000
          6.614583333333333000
          142.213541666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Placa....:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText12: TQRDBText
        Left = 400
        Top = 2
        Width = 103
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          1322.916666666667000000
          6.614583333333333000
          340.651041666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMOrdemServico.QRFichaInspecao
        DataField = 'NUM_PLACA'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel15: TQRLabel
        Left = 333
        Top = 15
        Width = 42
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          1101.328125000000000000
          49.609375000000000000
          138.906250000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'KM.......:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText13: TQRDBText
        Left = 400
        Top = 15
        Width = 103
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          1322.916666666667000000
          49.609375000000000000
          340.651041666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMOrdemServico.QRFichaInspecao
        DataField = 'KM_CHEGADA'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText11: TQRDBText
        Left = 73
        Top = 32
        Width = 103
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          241.432291666666700000
          105.833333333333300000
          340.651041666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMOrdemServico.QRFichaInspecao
        DataField = 'NUM_CILINDROS'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel7: TQRLabel
        Left = 5
        Top = 32
        Width = 42
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          16.536458333333330000
          105.833333333333300000
          138.906250000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cilindro.:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel9: TQRLabel
        Left = 5
        Top = 45
        Width = 49
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          16.536458333333330000
          148.828125000000000000
          162.057291666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Combust.:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel10: TQRLabel
        Left = 5
        Top = 65
        Width = 65
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          49.609375000000000000
          16.536458333333330000
          214.973958333333300000
          214.973958333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Observa'#231#227'o..:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText7: TQRDBText
        Left = 72
        Top = 65
        Width = 550
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          238.125000000000000000
          214.973958333333300000
          1819.010416666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMOrdemServico.QRFichaInspecao
        DataField = 'DESC_OBS'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape2: TQRShape
        Left = 0
        Top = 81
        Width = 622
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          3.307291666666667000
          0.000000000000000000
          267.890625000000000000
          2057.135416666667000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape4: TQRShape
        Left = 0
        Top = 63
        Width = 622
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          3.307291666666667000
          0.000000000000000000
          208.359375000000000000
          2057.135416666667000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel13: TQRLabel
        Left = 5
        Top = 86
        Width = 78
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          99.218750000000000000
          16.536458333333330000
          284.427083333333300000
          257.968750000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Equipamento..:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Draft 12cpi'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel17: TQRLabel
        Left = 303
        Top = 87
        Width = 103
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          99.218750000000000000
          1002.109375000000000000
          287.734375000000000000
          340.651041666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Servi'#231'o Solicitado..:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Draft 12cpi'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape5: TQRShape
        Left = 295
        Top = 82
        Width = 1
        Height = 209
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          691.223958333333300000
          975.651041666666700000
          271.197916666666700000
          3.307291666666667000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRDBText8: TQRDBText
        Left = 6
        Top = 100
        Width = 285
        Height = 186
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          615.156250000000000000
          19.843750000000000000
          330.729166666666700000
          942.578125000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMOrdemServico.QRFichaInspecao
        DataField = 'DESC_EQUIPAMENTO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText18: TQRDBText
        Left = 304
        Top = 101
        Width = 312
        Height = 186
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          615.156250000000000000
          1005.416666666667000000
          334.036458333333300000
          1031.875000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMOrdemServico.QRFichaInspecao
        DataField = 'DESC_SOLICITACAO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText19: TQRDBText
        Left = 73
        Top = 45
        Width = 103
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          241.432291666666700000
          148.828125000000000000
          340.651041666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMOrdemServico.QRFichaInspecao
        DataField = 'DESC_COMBUSTIVEL'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel18: TQRLabel
        Left = 333
        Top = 29
        Width = 42
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          1101.328125000000000000
          95.911458333333330000
          138.906250000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Ano......:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText20: TQRDBText
        Left = 400
        Top = 29
        Width = 103
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          1322.916666666667000000
          95.911458333333330000
          340.651041666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMOrdemServico.QRFichaInspecao
        DataField = 'NUM_ANO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel19: TQRLabel
        Left = 333
        Top = 45
        Width = 42
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          1101.328125000000000000
          148.828125000000000000
          138.906250000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Chassis:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText21: TQRDBText
        Left = 400
        Top = 44
        Width = 103
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          1322.916666666667000000
          145.520833333333300000
          340.651041666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMOrdemServico.QRFichaInspecao
        DataField = 'NUM_CHASSI'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRBand5: TQRBand
      Left = 15
      Top = 446
      Width = 623
      Height = 168
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
        555.625000000000000000
        2060.442708333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRMemo1: TQRMemo
        Left = 7
        Top = 13
        Width = 622
        Height = 76
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          251.354166666666700000
          23.151041666666670000
          42.994791666666670000
          2057.135416666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Lines.Strings = (
          
            '1) As pe'#231'as e servi'#231'os que se tornem necess'#225'rias ao perfeito aca' +
            'bamento do servi'#231'o e que n'#227'o tenha constado '
          ' desta lista, ser'#227'o cobradas a parte.'
          
            '2) N'#227'o nos responsabilizamos pelos motores ou pe'#231'as que n'#227'o seja' +
            'm retiradas ou que o cliente n'#227'o queira receber'
          ' no prazo de 60 (sessenta) dias contados da data desta ordem.'
          
            '3) A garantia '#233' exclusivamente para motores montados pela pr'#243'pri' +
            'a RETIFICADORA DE MOTORES FOZ LTDA. '
          ' N'#227'o garantimos usinagem ap'#243's montagens por terceiros.'
          
            '4) Autorizo(amos) a execu'#231#227'o dos servi'#231'os bem como a aplica'#231#227'o (' +
            'ou fornecimento) das pe'#231'as anotadas, incluindo'
          ' as extras se necess'#225'rio.')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel51: TQRLabel
        Left = 19
        Top = 127
        Width = 124
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          62.838541666666670000
          420.026041666666700000
          410.104166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '______________________'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel52: TQRLabel
        Left = 64
        Top = 140
        Width = 42
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          211.666666666666700000
          463.020833333333300000
          138.906250000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Receptor'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel50: TQRLabel
        Left = 229
        Top = 127
        Width = 124
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          757.369791666666700000
          420.026041666666700000
          410.104166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '______________________'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel53: TQRLabel
        Left = 275
        Top = 140
        Width = 33
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          909.505208333333300000
          463.020833333333300000
          109.140625000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cliente'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel55: TQRLabel
        Left = 429
        Top = 127
        Width = 124
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          1418.828125000000000000
          420.026041666666700000
          410.104166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '______________________'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel54: TQRLabel
        Left = 470
        Top = 140
        Width = 46
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          1554.427083333333000000
          463.020833333333300000
          152.135416666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Mec'#226'nico'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape3: TQRShape
        Left = 0
        Top = 9
        Width = 622
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          3.307291666666667000
          0.000000000000000000
          29.765625000000000000
          2057.135416666667000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
    end
    object QRGroup1: TQRGroup
      Left = 15
      Top = 414
      Width = 311
      Height = 16
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
        52.916666666666670000
        1028.567708333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'QRFichaInspecao.DESC_TIPO_EQUIPAMENTO_FICHA'
      Master = QRPrimario
      ReprintOnNewPage = False
      object QRDBText14: TQRDBText
        Left = 24
        Top = 0
        Width = 176
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          79.375000000000000000
          0.000000000000000000
          582.083333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = DMOrdemServico.QRFichaInspecao
        DataField = 'DESC_TIPO_EQUIPAMENTO_FICHA'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRBand4: TQRBand
      Left = 15
      Top = 430
      Width = 311
      Height = 16
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
      LinkBand = QRGroup1
      Size.Values = (
        52.916666666666670000
        1028.567708333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRDBText15: TQRDBText
        Left = 24
        Top = 0
        Width = 41
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          79.375000000000000000
          0.000000000000000000
          135.598958333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMOrdemServico.QRFichaInspecao
        DataField = 'QT_QUANTIDADE'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText16: TQRDBText
        Left = 72
        Top = 0
        Width = 147
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          238.125000000000000000
          0.000000000000000000
          486.171875000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = DMOrdemServico.QRFichaInspecao
        DataField = 'DESC_EQUIPAMENTO_FICHA'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
  end
  inherited QRTextFilter1: TQRTextFilter
    Left = 488
    Top = 497
  end
  inherited QRPDFFilter1: TQRPDFFilter
    Left = 520
    Top = 497
  end
  inherited QRHTMLFilter1: TQRHTMLFilter
    Left = 552
    Top = 497
  end
  inherited QRExcelFilter1: TQRExcelFilter
    Left = 584
    Top = 497
  end
  inherited QRRTFFilter1: TQRRTFFilter
    Left = 616
    Top = 497
  end
  object DataSource1: TDataSource
    DataSet = DMOrdemServico.QRFichaInspecao
    Left = 624
    Top = 537
  end
end
