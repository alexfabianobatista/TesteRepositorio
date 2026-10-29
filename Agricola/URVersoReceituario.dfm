object FRVersoReceituario: TFRVersoReceituario
  Left = 206
  Top = 57
  Width = 819
  Height = 623
  Caption = 'FRVersoReceituario'
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
    Top = 8
    Width = 794
    Height = 1120
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
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
      50.000000000000000000
      2970.000000000000000000
      50.000000000000000000
      2100.000000000000000000
      50.000000000000000000
      50.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Upper
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 1
    PrinterSettings.LastPage = 1
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 1
    PrinterSettings.ExtendedDuplex = 1
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 9
    PrinterSettings.PrintMetaFile = False
    PrinterSettings.PrintQuality = -3
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 2
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    PrevInitialZoom = qrZoomToFit
    object QR: TQRBand
      Left = 19
      Top = 19
      Width = 756
      Height = 1086
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
        2873.375000000000000000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbTitle
      object QRLabel3: TQRLabel
        Left = 0
        Top = 8
        Width = 753
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          21.166666666666670000
          1992.312500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'RECEITU'#193'RIO AGRON'#212'MICO - INFORMA'#199#213'ES COMPLEMENTARES'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel4: TQRLabel
        Left = 0
        Top = 24
        Width = 753
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          63.500000000000000000
          1992.312500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'LEIA ATENTAMENTE ANTES DE INICIAR O MANUSEIO'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRMemo1: TQRMemo
        Left = 8
        Top = 56
        Width = 353
        Height = 833
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2203.979166666667000000
          21.166666666666670000
          148.166666666666700000
          933.979166666666600000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Courier New'
        Font.Style = []
        Lines.Strings = (
          'PRECAU'#199#213'ES DE USO'
          
            'Durante a manipula'#231#227'o de agrot'#243'xicos, preparo da calda ou aplica' +
            #231#227'o dos produtos, use Equipamento de Prote'#231#227'o Individual - EPI (' +
            'macac'#227'o com mangas compridas, capa ou avental imperme'#225'vel, luvas' +
            ' imperme'#225'veis, chap'#233'u imperme'#225'vel com abas largas, botas, '#243'culos' +
            ' protetores e m'#225'scaras protetoras especiais providas de filtro a' +
            'dequado a cada tipo de produto).'
          
            'O Empregador '#233' obrigado por lei a fornecer os EPI'#180's aos trabalha' +
            'dores, que sob sua ordem apliquem agrot'#243'xicos, al'#233'm de promover ' +
            'a adequada manuten'#231#227'o dos mesmos. Cuidado! a pele '#233' a via mais i' +
            'mportante de penetra'#231#227'o de agrot'#243'xicos.'
          'Uso exclulsivamente agr'#237'cola.'
          'Mantenha o produo afastado de alimentos, crian'#231'as e animais.'
          
            'Manter afastado de '#225'reas tratadas, crian'#231'as, animais e pessoas d' +
            'esprotegidas, durante e ap'#243's a aplica'#231#227'o do agrot'#243'xico.'
          
            'Mantenha o agrot'#243'xico em sua embalagem original bem fechada, em ' +
            'lugar seco, ventilado e longe do fogo.'
          'N'#227'o utilize equipamentos com vazamentos.'
          
            'N'#227'o desentupa bicos, mangueiras, v'#225'lvulas e orif'#237'cios com a boca' +
            '.'
          'Aplique o agrot'#243'xico na dosagem recomendada.'
          'Distribua o produto da embalagem sem contato manual.'
          
            'N'#227'o manipule e n'#227'o aplique agrot'#243'xicos durante as horas mais que' +
            'ntes do dia ou com ventos fortes.'
          
            'N'#227'o misture duas ou mais formula'#231#245'es para aplica'#231#227'o, salvo estej' +
            'am devidamente autorizadas pelo '#243'rg'#227'o competente.'
          'Nunca deixe a embalagem aberta.'
          'Evite a aspira'#231#227'o ou inala'#231#227'o de agrot'#243'xicos.'
          'Evite o contato com a pele e com os olhos.'
          'Respeite o intervalo de seguran'#231'a (periodo de car'#234'ncia).'
          #201' proibida a reutiliza'#231#227'o de embalagens de agrot'#243'xicos.'
          
            'Em caso de suspeita de intoxica'#231#227'o, procure imediatamente um m'#233'd' +
            'ico, mantendo a pessoa em ambiente arejado e fresco.'
          
            'Ap'#243's a utiliza'#231#227'o de agrot'#243'xicos, remover roupas protetoras para' +
            ' lavagem e tomar banho com bastante sab'#227'o e '#225'gua fria.'
          ''
          'PRIMEIROS SOCORROS NOS CASOS DE ACIDENTES'
          'A.D'#201'RMICA(PELE)'
          
            'Retire imediatamente a roupa contaminada. Remova o agrot'#243'xico da' +
            ' pele com jato de '#225'gua corrente (n'#227'o adicione ant'#237'dotos ou reage' +
            'nte neutralizaste). A seguir lave suavemente as partes contamina' +
            'das com '#225'gua e sab'#227'o (se n'#227'o houver contra indica'#231#227'o).'
          'B.OCULAR(OLHOS)'
          
            'Lavar imediatamente e de maneira suave os olhos com '#225'gua corrent' +
            'e (fria ou normal, sem subst'#226'ncia neutralizante, ant'#237'doto ou col' +
            #237'rio) por um per'#237'odo de 10 minutos. Sem a possibilidade de '#225'gua ' +
            'corrente, deite o paciente de costa com a cabe'#231'a apoiada sobre a' +
            's pernas, incluinando-lhe a cabe'#231'a para tr'#225's e mantendo as p'#225'lbe' +
            'bras abertas derrame, com aux'#237'lio de uma caneca ou copo, um file' +
            'te de '#225'gua limpa.'
          'C.INALA'#199#195'O(PULM'#213'ES)'
          
            'Remova imediatamente o paciente para um local fresco e ventilado' +
            '. Afrouxe as roupas ou retire-as em caso de contamina'#231#227'o. Em cas' +
            'o de dificuldade ou parada respirat'#243'ria, aplique respira'#231#227'o arti' +
            'ficial boca a boca.'
          'D.ORAL(BOCA)'
          
            'Via de regra provoque o v'#244'mito imediatamente. Antes de induzir o' +
            ' v'#244'mito forne'#231'a 2 copos de '#225'gua '#224' vitima. Nunca provoque o v'#244'mit' +
            'o em vitima inconsciente ou em comvuls'#227'o ou em casos de agrot'#243'xi' +
            'cos c'#225'usticos ou corrosivos. Durante o v'#244'mito posicione o pacien' +
            'te com o tronco ereto e incline para frente. Quando v'#244'mito n'#227'o f' +
            'or indicado, forne'#231'a 50 gramas de carv'#227'o ativado dilu'#237'do num cop' +
            'o de '#225'gua.'
          'E.CONTATO(D'#201'RMICA)'
          
            'Irrita'#231#227'o (pele seca e rachada). Descolora'#231#227'o ('#225'reas amarelas ou' +
            ' avermelhadas). Descama'#231#227'o (pele escamosa ou com aspecto de sarn' +
            'a).'
          'F.INALA'#199#195'O(RESPIRAT'#211'RIA)'
          
            'Ardor na garganta e pulm'#245'es. Tosse. Rouquid'#227'o. Congestionamento ' +
            'das vias respirat'#243'rias.')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRMemo2: TQRMemo
        Left = 376
        Top = 56
        Width = 377
        Height = 833
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2203.979166666667000000
          994.833333333333400000
          148.166666666666700000
          997.479166666666900000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Courier New'
        Font.Style = []
        Lines.Strings = (
          'G.INGEST'#195'O(ORAL)'
          
            'Irrita'#231#227'o na boca e garganta. Dor no peito. N'#225'useas. Diarr'#233'ia, t' +
            'ranspira'#231#227'o anormal. Dor de cabe'#231'a. Fraqueza e c'#227'imbra.'
          'H.PARADA RESPIRAT'#211'RIA'
          
            'Remova o paciente para local fresco e ventilado, afrouxando suas' +
            ' roupas. Necessitando, inicie a assist'#234'ncia respirat'#243'ria procede' +
            'ndo da seguinte forma: com o paciente deitado de costas, com uma' +
            ' das m'#227'os, levante seu pesco'#231'o pela nuca e incline-lhe a cabe'#231'a ' +
            'para tr'#225's. Puxe o queixo do paciente para cima, de forma que a l' +
            #237'ngua n'#227'o dificulte a passagem do ar. Caso o paciente n'#227'o volte ' +
            'a respirar, inicie a respira'#231#227'o boa a boca da seguinte forma: fe' +
            'che-lhe as narinas pressionando com o polegar e indicador.'
          
            'Coloque sua boca com firmeza sobre a boca do paciente. Respire p' +
            'rofundamente e sopre rigorosamente na boca do paciente, at'#233' nota' +
            'r que seu peito est'#225' levantado. Deixe o ar sair livremente. Repi' +
            'ta a opera'#231#227'o 15 vezes por minuto (crian'#231'a 20 vezes). Aten'#231#227'o: c' +
            'aso tenha havido ingest'#227'o de agrot'#243'xico ou ocorrido v'#244'mitos, lim' +
            'par a boca do paciente com '#225'gua e algod'#227'o, prevenindo a auto-int' +
            'oxica'#231#227'o.'
          'I.PARADA CIRCULAT'#211'RIA'
          
            'Deite o paciente de costas sobre uma superf'#237'cie dura. Fique ao s' +
            'eu lado num plano superior. Coloque suas m'#227'os sobrepostas e com ' +
            'os dedos abertos na metade inferior do externo, evitando que os ' +
            'dedos toquem a parede do t'#243'rax. Com os bra'#231'os de extens'#227'o fa'#231'a u' +
            'ma press'#227'o vigorosa, para que o externo se baixe e comprima o co' +
            'ra'#231#227'o de encontro '#224' coluna vertebral. Descomprima subitamente a ' +
            'seguir. Repita a opera'#231#227'o cerca de 60 vezes por minuto.'
          'J.PARADA CARDIORESPIRAT'#211'RIA'
          'Exige as medidas nos item H e I.'
          
            'Alterar a massagem cardiada com a respira'#231#227'o boca a boca, de mod' +
            'o que um procedimento n'#227'o interfira no outro. Alternar a ventila' +
            #231#227'o e a massagem havendo apenas um prestando o socorro (a cada 6' +
            ' compress'#245'es do t'#243'rax, soprar duas vezes na boca do paciente).'
          'K.CONVULS'#195'O/COMA'
          
            'Proteja a cabe'#231'a do paciente contra poss'#237'veis les'#245'es (quedas e p' +
            'acandas). Evite ferimentos na l'#237'ngua, colocando uma prote'#231#227'o ent' +
            're os maxiliares. Mantenha o paciente aquecido e procure imediat' +
            'amente aux'#237'lio m'#233'dico. N'#227'o detenha as convuls'#245'es, elas ceder'#227'o e' +
            'spontaneamente.'
          'L.ESTADO DE CHOQUE'
          
            'Afrouxe as roupas no pesco'#231'o, peito e cintura. Manter as pernas ' +
            'elevadas. Em caso de v'#244'mito, vire-lhe a cabe'#231'a para o lado e lim' +
            'pe sua boca. N'#227'o d'#234' bebida alco'#243'lica.'
          ''
          'ADVERT'#202'NCIAS RELACIONADAS '#192' PROTE'#199#195'O DO MEIO AMBIENTE'
          
            'Abastencimento e limpeza de equipamentos: toda propriedade deve ' +
            'dispor de um local pr'#243'prio para abastecimento e limpeza dos equi' +
            'pamentos de pulveriza'#231#227'o para que os res'#237'duos dos agrot'#243'xicos n'#227 +
            'o venham a poluir as fontes e manancias de '#225'gua.'
          
            'Nunca captar '#225'gua diretamente de cursos ou cole'#231#245'es de '#225'gua, com' +
            ' os equipamentos de aplica'#231#227'o de agrot'#243'xicos. Disponha de abaste' +
            'cimento apropriado.'
          
            'Nunca despejar os res'#237'duos de calda dos equipamentos de pulveriz' +
            'a'#231#227'o nos rios ou lugares em que as chuvas arrastem as sobras par' +
            'a os cursos de '#225'gua.'
          
            'Nunca prepare mais calda do que a quantidade a ser aplicada, ass' +
            'im n'#227'o sobrar'#225' restos a despejar.'
          
            'As '#225'guas residu'#225'rias com agrot'#243'xicos, resultantes da lavagem dos' +
            ' equipamentos e embalagens utilizadas dever'#227'o ter a disposi'#231#227'o f' +
            'inal pr'#243'pria para n'#227'o ser levada '#224's fontes ou cursos de '#225'gua em ' +
            'geral.'
          
            'Manter dist'#226'ncia m'#237'nima de 3 metros de divisas de propriedades, ' +
            '200 metros adjacentes a mananciais de capta'#231#227'o de '#225'gua para abas' +
            'tecimento de popula'#231#227'o, n'#250'cleos populacionais, escolas, habita'#231#245 +
            'es e locais de recrea'#231#227'o e de 250 metros adjacentes a moradias i' +
            'soladas e agrupamento de animais e culturas suscetiveis ou quand' +
            'o utilizar equipamentos atomizadores ou canh'#245'es. No caso de equi' +
            'pamento de tra'#231#227'o motora, de barra ou costais a dist'#226'ncia m'#237'nima' +
            ' de 50 metros.'
          
            'Adotar medidas de manejo de solo e controle de eros'#227'o para evita' +
            'r que as part'#237'culas de solo com agrot'#243'xico sejam arrastadas para' +
            ' as fontes e mananciais de '#225'gua.'
          'N'#195'O REUTILIZAR QUALQUER TIPO DE EMBALAGEM DE AGROT'#211'XICOS'
          'N'#195'O JOGUE OS RESTOS DE AGROT'#211'XICOS NO MEIO AMBIENTE.')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel6: TQRLabel
        Left = 8
        Top = 896
        Width = 745
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          2370.666666666667000000
          1971.145833333334000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'AGRICULTOR - AGROT'#211'XICOS '#201' VENENO'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 8
        Top = 912
        Width = 745
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          2413.000000000000000000
          1971.145833333334000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'INSTRU'#199#213'ES SOBRE A DISPOSI'#199'AO FINAL DE RES'#205'DUOS E EMBALAGENS'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRMemo3: TQRMemo
        Left = 8
        Top = 936
        Width = 745
        Height = 145
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          383.645833333333400000
          21.166666666666670000
          2476.500000000000000000
          1971.145833333334000000)
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
        Lines.Strings = (
          
            '-Formula'#231#245'es l'#237'quidas ou p'#243' soluveis em '#225'gua: P/ embalagens em p' +
            'l'#225'stico, vidro ou metal, ap'#243's o completo esvaziamento, devem ser' +
            ' enxaguadas, 3 vezes, com agita'#231#227'o, e as caldas resultantes vert' +
            'idas no tanque de pulveriza'#231#227'o . Inutilize as embalagens lavadas' +
            '.'
          
            '-Formula'#231#227'o sem dilui'#231#227'o de '#225'gua: Esgotar totalmente as embalage' +
            'ns no uso. Embalagens r'#237'gidas n'#227'o lav'#225'veis devem ser mantidas in' +
            'tactas e fechadas sem vazamento. Embalagem flex'#237'veis contaminada' +
            's dever'#227'o ser acondicionadas em sacos apropriados.'
          
            '-Fica proibido o enterro, queima ou abandono de embalagens. Arma' +
            'zene-as na propriedade, longe de pessoas, animais, alimentos, re' +
            'sid'#234'ncias. A devolu'#231#227'o '#233' obrigat'#243'ria (Lei 9974/2000) no prazo de' +
            ' ate um ano.'
          
            '-Saiba com o seu revendedor o local para entrega das embalagens,' +
            ' ou entregue-nas diretamente na pr'#243'pria revenda.')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
  end
end
