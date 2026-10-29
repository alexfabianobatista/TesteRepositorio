inherited FRNotasCfopPagto: TFRNotasCfopPagto
  Left = 197
  Top = 40
  Width = 838
  Height = 628
  HorzScrollBar.Position = 0
  Caption = 'Relat'#243'rio de notas por CFOP/PAGTO'
  PixelsPerInch = 96
  TextHeight = 13
  inherited QRPrimario: TQuickRep
    Left = 0
    DataSet = DMLivroFiscal.QRNotasCfopPagto
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
    inherited QRBand1: TQRBand
      Height = 85
      Size.Values = (
        224.895833333333300000
        2000.250000000000000000)
      inherited QRSysData2: TQRSysData
        Size.Values = (
          44.979166666666670000
          1965.854166666667000000
          0.000000000000000000
          68.791666666666670000)
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
          701.145833333333300000)
        Caption = 'Relat'#243'rio de notas por CFOP/PAGTO'
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
      object QrlPeriodo: TQRLabel
        Left = 9
        Top = 37
        Width = 81
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          97.895833333333330000
          214.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QrlPeriodo'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 45
        Top = 64
        Width = 33
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          119.062500000000000000
          169.333333333333300000
          87.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CFOP'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel6: TQRLabel
        Left = 135
        Top = 63
        Width = 57
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          357.187500000000000000
          166.687500000000000000
          150.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #192' Vista'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel7: TQRLabel
        Left = 257
        Top = 64
        Width = 57
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          679.979166666666700000
          169.333333333333300000
          150.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'A Prazo'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel8: TQRLabel
        Left = 367
        Top = 64
        Width = 49
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          971.020833333333300000
          169.333333333333300000
          129.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Outros'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel9: TQRLabel
        Left = 712
        Top = 64
        Width = 41
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1883.833333333333000000
          169.333333333333300000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 438
        Top = 64
        Width = 81
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1158.875000000000000000
          169.333333333333300000
          214.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TEF Cart'#227'o'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel4: TQRLabel
        Left = 541
        Top = 64
        Width = 81
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1431.395833333333000000
          169.333333333333300000
          214.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'POS Cart'#227'o'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    inherited QRBand2: TQRBand
      Top = 183
      Size.Values = (
        148.166666666666700000
        2000.250000000000000000)
      inherited QRLabel1: TQRLabel
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          0.000000000000000000
          383.645833333333300000)
        FontSize = 10
      end
      inherited QRLNomeRel: TQRLabel
        Left = 635
        Size.Values = (
          44.979166666666670000
          1680.104166666667000000
          0.000000000000000000
          277.812500000000000000)
        FontSize = 10
      end
    end
    object QRBand3: TQRBand
      Left = 19
      Top = 129
      Width = 756
      Height = 25
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
        66.145833333333330000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRDBText5: TQRDBText
        Left = 314
        Top = 2
        Width = 102
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          830.791666666666700000
          5.291666666666667000
          269.875000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMLivroFiscal.QRNotasCfopPagto
        DataField = 'SVAL_OUTROS'
        Mask = '#,##0.00'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText4: TQRDBText
        Left = 193
        Top = 2
        Width = 120
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          510.645833333333300000
          5.291666666666667000
          317.500000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMLivroFiscal.QRNotasCfopPagto
        DataField = 'SVAL_APRAZO'
        Mask = '#,##0.00'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText3: TQRDBText
        Left = 79
        Top = 2
        Width = 113
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          209.020833333333300000
          5.291666666666667000
          298.979166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMLivroFiscal.QRNotasCfopPagto
        DataField = 'SVAL_AVISTA'
        Mask = '#,##0.00'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRExpr1: TQRExpr
        Left = 624
        Top = 2
        Width = 129
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1651.000000000000000000
          5.291666666666667000
          341.312500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Master = QRPrimario
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 
          'QRNotasCfopPagto.SVAL_AVISTA+QRNotasCfopPagto.SVAL_APRAZO+QRNota' +
          'sCfopPagto.SVAL_OUTROS+QRNotasCfopPagto.SVAL_TEF_CARTAO+QRNotasC' +
          'fopPagto.SVAL_POS_CARTAO'
        Mask = '#,##0.00'
        FontSize = 10
      end
      object QRDBText2: TQRDBText
        Left = 36
        Top = 2
        Width = 42
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          95.250000000000000000
          5.291666666666667000
          111.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMLivroFiscal.QRNotasCfopPagto
        DataField = 'NAT_OPERACAO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText6: TQRDBText
        Left = 417
        Top = 2
        Width = 101
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1103.312500000000000000
          5.291666666666667000
          267.229166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMLivroFiscal.QRNotasCfopPagto
        DataField = 'SVAL_TEF_CARTAO'
        Mask = '#,##0.00'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText1: TQRDBText
        Left = 519
        Top = 2
        Width = 102
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1373.187500000000000000
          5.291666666666667000
          269.875000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DMLivroFiscal.QRNotasCfopPagto
        DataField = 'SVAL_POS_CARTAO'
        Mask = '#,##0.00'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRBand4: TQRBand
      Left = 19
      Top = 154
      Width = 756
      Height = 29
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
        76.729166666666670000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRLabel10: TQRLabel
        Left = 18
        Top = 9
        Width = 57
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          47.625000000000000000
          23.812500000000000000
          150.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Totais:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRExpr2: TQRExpr
        Left = 622
        Top = 9
        Width = 131
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1645.708333333333000000
          23.812500000000000000
          346.604166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Master = QRPrimario
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 
          'SUM(IF(QRNotasCfopPagto.IND_VENDAS= '#39'V'#39',QRNotasCfopPagto.SVAL_AV' +
          'ISTA,0) - IF(QRNotasCfopPagto.IND_VENDAS= '#39'D'#39',QRNotasCfopPagto.S' +
          'VAL_AVISTA,0) + IF(QRNotasCfopPagto.IND_VENDAS= '#39'V'#39',QRNotasCfopP' +
          'agto.SVAL_APRAZO,0) - IF(QRNotasCfopPagto.IND_VENDAS= '#39'D'#39',QRNota' +
          'sCfopPagto.SVAL_APRAZO,0) + IF(QRNotasCfopPagto.IND_VENDAS= '#39'V'#39',' +
          '+QRNotasCfopPagto.SVAL_OUTROS,0) - IF(QRNotasCfopPagto.IND_VENDA' +
          'S= '#39'D'#39',QRNotasCfopPagto.SVAL_OUTROS,0) + IF(QRNotasCfopPagto.IND' +
          '_VENDAS= '#39'V'#39',QRNotasCfopPagto.SVAL_TEF_CARTAO,0) - IF(QRNotasCfo' +
          'pPagto.IND_VENDAS= '#39'D'#39',QRNotasCfopPagto.SVAL_TEF_CARTAO,0) + IF(' +
          'QRNotasCfopPagto.IND_VENDAS= '#39'V'#39',QRNotasCfopPagto.SVAL_POS_CARTA' +
          'O,0) - IF(QRNotasCfopPagto.IND_VENDAS= '#39'D'#39',QRNotasCfopPagto.SVAL' +
          '_POS_CARTAO,0))'
        Mask = '#,##0.00'
        FontSize = 10
      end
      object QRExpr3: TQRExpr
        Left = 417
        Top = 9
        Width = 101
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1103.312500000000000000
          23.812500000000000000
          267.229166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Master = QRPrimario
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 
          'SUM(IF(QRNotasCfopPagto.IND_VENDAS= '#39'V'#39',QRNotasCfopPagto.SVAL_TE' +
          'F_CARTAO,0)-IF(QRNotasCfopPagto.IND_VENDAS= '#39'D'#39',QRNotasCfopPagto' +
          '.SVAL_TEF_CARTAO,0))'
        Mask = '#,##0.00'
        FontSize = 10
      end
      object QRExpr4: TQRExpr
        Left = 314
        Top = 9
        Width = 102
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          830.791666666666700000
          23.812500000000000000
          269.875000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Master = QRPrimario
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 
          'SUM(IF(QRNotasCfopPagto.IND_VENDAS= '#39'V'#39',QRNotasCfopPagto.SVAL_OU' +
          'TROS,0) - IF(QRNotasCfopPagto.IND_VENDAS= '#39'D'#39',QRNotasCfopPagto.S' +
          'VAL_OUTROS,0))'
        Mask = '#,##0.00'
        FontSize = 10
      end
      object QRExpr5: TQRExpr
        Left = 193
        Top = 9
        Width = 120
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          510.645833333333300000
          23.812500000000000000
          317.500000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Master = QRPrimario
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 
          'SUM(IF(QRNotasCfopPagto.IND_VENDAS= '#39'V'#39',QRNotasCfopPagto.SVAL_AP' +
          'RAZO,0) - IF(QRNotasCfopPagto.IND_VENDAS= '#39'D'#39',QRNotasCfopPagto.S' +
          'VAL_APRAZO, 0))'
        Mask = '#,##0.00'
        FontSize = 10
      end
      object QRExpr6: TQRExpr
        Left = 73
        Top = 9
        Width = 119
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          193.145833333333300000
          23.812500000000000000
          314.854166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Master = QRPrimario
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 
          'SUM(IF(QRNotasCfopPagto.IND_VENDAS= '#39'V'#39',QRNotasCfopPagto.SVAL_AV' +
          'ISTA,0) - IF(QRNotasCfopPagto.IND_VENDAS='#39'D'#39',QRNOTAScFOPpAGTO.sV' +
          'AL_AVISTA,0))'
        Mask = '#,##0.00'
        FontSize = 10
      end
      object QRHRule1: TQRHRule
        Left = 0
        Top = -8
        Width = 761
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          -21.166666666666670000
          2013.479166666667000000)
        VertAdjust = 0
      end
      object QRExpr7: TQRExpr
        Left = 519
        Top = 9
        Width = 101
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1373.187500000000000000
          23.812500000000000000
          267.229166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Master = QRPrimario
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 
          'SUM(IF(QRNotasCfopPagto.IND_VENDAS= '#39'V'#39',QRNotasCfopPagto.SVAL_PO' +
          'S_CARTAO,0) - IF(QRNotasCfopPagto.IND_VENDAS= '#39'D'#39',QRNotasCfopPag' +
          'to.SVAL_POS_CARTAO,0))'
        Mask = '#,##0.00'
        FontSize = 10
      end
    end
    object QRGroup2: TQRGroup
      Left = 19
      Top = 108
      Width = 756
      Height = 21
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
        55.562500000000000000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'QRNotasCfopPagto.DT_EMISSAO'
      Master = QRPrimario
      ReprintOnNewPage = False
      object QRDBText7: TQRDBText
        Left = 49
        Top = 1
        Width = 81
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          129.645833333333300000
          2.645833333333333000
          214.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = DMLivroFiscal.QRNotasCfopPagto
        DataField = 'DT_EMISSAO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel11: TQRLabel
        Left = 6
        Top = 1
        Width = 41
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          15.875000000000000000
          2.645833333333333000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DATA:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
  end
end
