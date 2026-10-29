inherited FRTermoCienciaResponsabilidade: TFRTermoCienciaResponsabilidade
  Left = 292
  Top = 43
  VertScrollBar.Position = 599
  Caption = 'FRTermoCienciaResponsabilidade'
  PixelsPerInch = 96
  TextHeight = 13
  inherited QRPrimario: TQuickRep
    Top = -599
    DataSet = DMReceita.QReceitaCab
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
      Enabled = False
      Size.Values = (
        100.541666666666700000
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
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          47.625000000000000000
          362.479166666666700000)
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
    end
    inherited QRBand2: TQRBand
      Top = 1065
      Enabled = False
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
      Top = 61
      Width = 756
      Height = 1004
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QRBand3BeforePrint
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        2656.416666666667000000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbTitle
      object QRLabel3: TQRLabel
        Left = 24
        Top = 8
        Width = 721
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          63.500000000000000000
          21.166666666666670000
          1907.645833333333000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 
          'TERMO DE CI'#202'NCIA E DE RESPONSABILIDADE PARA REVENDEDORES DE PROD' +
          'UTOS '#192' BASE DE ACEFATO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel4: TQRLabel
        Left = 24
        Top = 48
        Width = 71
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          63.500000000000000000
          127.000000000000000000
          187.854166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'VOC'#202' SABIA?'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape1: TQRShape
        Left = 24
        Top = 72
        Width = 721
        Height = 121
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          320.145833333333300000
          63.500000000000000000
          190.500000000000000000
          1907.645833333333000000)
        Pen.Width = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRMemo1: TQRMemo
        Left = 32
        Top = 80
        Width = 705
        Height = 105
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          277.812500000000000000
          84.666666666666670000
          211.666666666666700000
          1865.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        Lines.Strings = (
          
            #183' O ACEFATO AFETA O SISTEMA NERVOSO CENTRAL, PODENDO CAUSAR DOR ' +
            'DE CABE'#199'A, TREMORES, FRAQUEZA E PERDA DE CONTROLE DOS MOVIMENTOS' +
            ' DOS M'#218'SCULOS, SUOR E SALIVA EM EXCESSO, ENJ'#212'O, V'#212'MITO E EM CASO' +
            'S MAIS GRAVES, CONVULS'#213'ES E COMA.'
          
            #183' QUANDO UTILIZADO DE FORMA INCORRETA E SEM OS DEVIDOS EQUIPAMEN' +
            'TOS DE PROTE'#199#195'O (EPI), O ACEFATO PODE CAUSAR ESSES EFEITOS NOS T' +
            'RABALHADORES QUE O  UTILIZAM. A APLICA'#199#195'O INCORRETA, N'#195'O RESPEIT' +
            'ANDO AS DOSES RECOMENDADAS EM BULA, PODEM ACARRETAR EM RES'#205'DUOS ' +
            'ACIMA DO PERMITIDO OU O  N'#195'O CONTROLE DA PRAGA. EM AMBOS OS CASO' +
            'S, H'#193' PREJU'#205'ZOS AO AGRICULTOR E AO CONSUMIDOR.')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 24
        Top = 216
        Width = 721
        Height = 33
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          87.312500000000000000
          63.500000000000000000
          571.500000000000000000
          1907.645833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 
          'Devido aos riscos '#224' sa'#250'de do ACEFATO, em 2013 foram determinadas' +
          ' diversas restri'#231#245'es ao seu uso, conforme estabelecido na Resolu' +
          #231#227'o RDC ANVISA n'#186' 45, de 2 de outubro de 2013.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel6: TQRLabel
        Left = 24
        Top = 272
        Width = 721
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          63.500000000000000000
          719.666666666666700000
          1907.645833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 
          'POR ISSO, O USU'#193'RIO DEVE SEGUIR AS SEGUINTES RECOMENDA'#199#213'ES INFOR' +
          'MADAS NA BULA DO PRODUTO:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape2: TQRShape
        Left = 24
        Top = 304
        Width = 721
        Height = 105
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          277.812500000000000000
          63.500000000000000000
          804.333333333333300000
          1907.645833333333000000)
        Pen.Width = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRMemo2: TQRMemo
        Left = 32
        Top = 312
        Width = 705
        Height = 89
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          235.479166666666700000
          84.666666666666670000
          825.500000000000000000
          1865.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        Lines.Strings = (
          #183' UTILIZE O PRODUTO APENAS NAS CULTURAS AUTORIZADAS.'
          
            #183' UTILIZE TODOS OS EQUIPAMENTOS DE PROTE'#199#195'O INDIVIDUAL (EPI) REC' +
            'OMENDADOS PARA O MANUSEIO E APLICA'#199#195'O DO PRODUTO.'
          #183' RESPEITAR O MODO DE APLICA'#199#195'O RECOMENDADO.'
          
            #183' RESPEITE O N'#218'MERO M'#193'XIMO DE APLICA'#199#213'ES RECOMENDADO, O INTERVAL' +
            'O ENTRE CADA APLICA'#199#195'O E O INTERVALO ENTRE A '#218'LTIMA APLICA'#199#195'O E ' +
            'A COLHEITA DA CULTURA.')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel7: TQRLabel
        Left = 24
        Top = 424
        Width = 62
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          63.500000000000000000
          1121.833333333333000000
          164.041666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'SAIBA QUE:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRMemo3: TQRMemo
        Left = 24
        Top = 448
        Width = 721
        Height = 89
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          235.479166666666700000
          63.500000000000000000
          1185.333333333333000000
          1907.645833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        Lines.Strings = (
          
            'I. '#201' DEVER DA EMPRESA respons'#225'vel pelo produto fornecer treiname' +
            'nto adequado sobre as medidas de seguran'#231'a que podem diminuir os' +
            ' riscos '#224' sa'#250'de causados pelo uso e manuseio deste produto.'
          
            'II. '#201' ILEGAL a venda de produtos em desacordo com as especifica'#231 +
            #245'es da bula.'
          
            'III. '#201' ILEGAL a venda de produtos sem receitu'#225'rio agron'#244'mico ou ' +
            'em desacordo com o receitu'#225'rio agron'#244'mico.'
          
            'IV. '#201' SUA RESPONSABILIDADE informar ao comprador as medidas de s' +
            'eguran'#231'a que podem diminuir os riscos '#224' sa'#250'de causados pelo uso ' +
            'e manuseio deste produto.')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel8: TQRLabel
        Left = 24
        Top = 552
        Width = 721
        Height = 81
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          214.312500000000000000
          63.500000000000000000
          1460.500000000000000000
          1907.645833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 
          'DECLARO QUE VENDEREI OS PRODUTOS '#192' BASE DE ACEFATO DE ACORDO COM' +
          ' AS ESPECIFICA'#199#213'ES EM BULA E RECEITU'#193'RIO AGRON'#212'MICO, EXCLUSIVAME' +
          'NTE A USU'#193'RIOS TREINADOS E QUE POSSUEM O TERMO DE COMPROMISSO V'#193 +
          'LIDO. ENTREGAREI A CARTILHA INFORMATIVA SOBRE O ACEFATO E/OU INF' +
          'ORMAREI SOBRE A DISPONIBILIDADE DE ACESSO '#192' CARTILHA ONLINE, PEL' +
          'O SISTEMA ELETR'#212'NICO DE CONTROLE DE PRODUTOS '#192' BASE DE ACEFATO, ' +
          'AOS COMPRADORES E AUXILIAREI COM TODAS AS INFORMA'#199#213'ES DE SEGURAN' +
          #199'A NECESS'#193'RIA PARA O USO ADEQUADO E SEGURO DO PRODUTO.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLLocal: TQRLabel
        Left = 24
        Top = 784
        Width = 721
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          63.500000000000000000
          2074.333333333333000000
          1907.645833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRLLocal'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel9: TQRLabel
        Left = 24
        Top = 813
        Width = 65
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          63.500000000000000000
          2151.062500000000000000
          171.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Assinatura:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRHRule1: TQRHRule
        Left = 96
        Top = 821
        Width = 345
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          26.458333333333330000
          254.000000000000000000
          2172.229166666667000000
          912.812500000000000000)
        VertAdjust = 0
      end
      object QRLabel10: TQRLabel
        Left = 24
        Top = 848
        Width = 402
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          63.500000000000000000
          2243.666666666667000000
          1063.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 
          'Dados do profissional respons'#225'vel pela emiss'#227'o da Receita Agron'#244 +
          'mica:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLNomeAgronomo: TQRLabel
        Left = 24
        Top = 872
        Width = 721
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          63.500000000000000000
          2307.166666666667000000
          1907.645833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRLNomeAgronomo'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLCrea: TQRLabel
        Left = 24
        Top = 888
        Width = 721
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          63.500000000000000000
          2349.500000000000000000
          1907.645833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRLCrea'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLReceituario: TQRLabel
        Left = 24
        Top = 904
        Width = 321
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          63.500000000000000000
          2391.833333333333000000
          849.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRLReceituario'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLLocalAgronomo: TQRLabel
        Left = 24
        Top = 920
        Width = 321
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          63.500000000000000000
          2434.166666666667000000
          849.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRLLocalAgronomo'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLArt: TQRLabel
        Left = 376
        Top = 904
        Width = 369
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          994.833333333333300000
          2391.833333333333000000
          976.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRLArt'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel11: TQRLabel
        Left = 376
        Top = 920
        Width = 65
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          994.833333333333300000
          2434.166666666667000000
          171.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Assinatura:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRHRule2: TQRHRule
        Left = 448
        Top = 928
        Width = 297
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          26.458333333333330000
          1185.333333333333000000
          2455.333333333333000000
          785.812500000000000000)
        VertAdjust = 0
      end
      object QRMDeclaracaoUsuario: TQRMemo
        Left = 24
        Top = 640
        Width = 721
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          63.500000000000000000
          1693.333333333333000000
          1907.645833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRMDeclaracaoUsuario1: TQRMemo
        Left = 24
        Top = 657
        Width = 721
        Height = 56
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          148.166666666666700000
          63.500000000000000000
          1738.312500000000000000
          1907.645833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel12: TQRLabel
        Left = 24
        Top = 720
        Width = 721
        Height = 33
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          87.312500000000000000
          63.500000000000000000
          1905.000000000000000000
          1907.645833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 
          'DECLARO TER ENTENDIDO AS ORIENTA'#199#213'ES PRESTADAS E ESTAR CIENTE DO' +
          'S RISCOS '#192' SA'#218'DE CAUSADOS PELO USO E MANUSEIO DE PRODUTOS '#192' BASE' +
          ' DE ACEFATO E DAS RECOMENDA'#199#213'ES QUE DEVO SEGUIR DURANTE SUA UTIL' +
          'IZA'#199#195'O. '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
  end
  inherited QRTextFilter1: TQRTextFilter
    Left = 579
    Top = 460
  end
  inherited QRPDFFilter1: TQRPDFFilter
    Left = 611
    Top = 460
  end
  inherited QRHTMLFilter1: TQRHTMLFilter
    Left = 643
    Top = 460
  end
  inherited QRExcelFilter1: TQRExcelFilter
    Left = 675
    Top = 460
  end
  inherited QRRTFFilter1: TQRRTFFilter
    Left = 707
    Top = 460
  end
end
