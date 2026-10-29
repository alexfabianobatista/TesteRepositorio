object DMBlocoK: TDMBlocoK
  OldCreateOrder = False
  Left = 397
  Top = 352
  Height = 276
  Width = 555
  object QReg200: TOracleDataSet1
    SQL.Strings = (
      'SELECT  '
      '  --DT_MOVIMENTO AS DT_EST,'
      '  COD_ITEM,'
      '  SUM('
      '    CASE'
      '      WHEN QTD > 0 THEN QTD'
      '      ELSE 0'
      '    END '
      '  ) AS QTD,'
      '  IND_EST,'
      '  COD_PART,'
      '  IND_SITUACAO,'
      '  COD_TIPO_PRODUTO'
      'FROM'
      '('
      '/*SELECT'
      
        '  CASE WHEN MAX(DT_MOVIMENTO) < TO_DATE(:DT_FINAL,'#39'DD/MM/YYYY'#39') ' +
        'THEN '
      
        '    TO_DATE(:DT_FINAL,'#39'DD/MM/YYYY'#39') ELSE MAX(DT_MOVIMENTO) END A' +
        'S DT_MOVIMENTO,'
      '  I.COD_PRODUTO AS COD_ITEM,'
      '  SUM(EM.QT_MOVIMENTO) AS QTD,'
      '  0 AS IND_EST,'
      '  NULL AS COD_PART'
      'FROM'
      '  TB_PARAM_SISTEMA,'
      '  TB_NOTA_ITEM I'
      'INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      'INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACAO'
      'INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      'INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL'
      
        'INNER JOIN TB_TRIBUTACAO T ON I.COD_TRIBUTACAO = T.COD_TRIBUTACA' +
        'O'
      'INNER JOIN TB_ESTADO E ON N.COD_ESTADO = E.COD_ESTADO'
      
        'INNER JOIN TB_SERIE ON (N.COD_SERIE = TB_SERIE.COD_SERIE AND TB_' +
        'SERIE.COD_FILIAL = N.COD_FILIAL AND N.COD_SERIE_MODELO = TB_SERI' +
        'E.COD_SERIE_MODELO)'
      
        'INNER JOIN TB_ESTOQUE_MOV EM ON I.COD_PRODUTO = EM.COD_PRODUTO A' +
        'ND I.COD_LOTE_TIPO = EM.COD_LOTE_TIPO AND N.COD_FILIAL = EM.COD_' +
        'FILIAL '
      '  AND EM.DT_MOVIMENTO <= :DT_FINAL'
      'WHERE'
      '  N.DT_RECEBIMENTO BETWEEN :DT_INICIAL AND :DT_FINAL'
      'AND'
      '  N.COD_FILIAL = :COD_FILIAL'
      'AND'
      '  N.IND_SITUACAO = '#39'2'#39
      'AND'
      '  O.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      '  (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      'AND'
      '  TB_SERIE.COD_SERIE_MODELO in ('#39'01'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39') '
      'AND'
      
        '  P.COD_TIPO_PRODUTO IN ('#39'00'#39', '#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39', '#39'06' +
        #39', '#39'10'#39')'
      'AND'
      '  P.COD_PRODUTO NOT IN (SELECT'
      '                          P.COD_PRODUTO'
      '                        FROM'
      '                          TB_ESTOQUE_INVENTARIO INV'
      
        '                        INNER JOIN TB_PRODUTO P ON P.COD_PRODUTO' +
        ' = INV.COD_PRODUTO'
      
        '                        INNER JOIN TB_FILIAL F ON F.COD_FILIAL =' +
        ' INV.COD_FILIAL'
      
        '                        INNER JOIN TB_TRIBUTACAO T ON P.COD_TRIB' +
        'UTACAO = T.COD_TRIBUTACAO'
      '                        Where'
      '                          INV.COD_FILIAL = :COD_FILIAL'
      '                        And'
      '                          INV.NUM_ANO = :Num_Ano'
      '                        And'
      '                          INV.NUM_MES = :Num_Mes'
      '                        AND'
      
        '                          P.COD_TIPO_PRODUTO IN ('#39'00'#39', '#39'01'#39', '#39'02' +
        #39', '#39'03'#39', '#39'04'#39', '#39'05'#39', '#39'06'#39', '#39'10'#39')'
      '                        AND'
      
        '                          (SELECT COUNT(*) FROM TB_FILIAL_INVENT' +
        'ARIO_MES X WHERE X.COD_FILIAL = INV.COD_FILIAL AND X.NUM_MES = I' +
        'NV.NUM_MES) > 0'
      '                        '
      '                        UNION'
      '                        '
      '                        SELECT'
      '                          COD_PRODUTO_DESTINO'
      '                        FROM'
      '                          TB_PRODUTO_TRANSFERIDO PT'
      '                        WHERE'
      
        '                          PT.DT_TRANSFERENCIA BETWEEN :DT_INICIA' +
        'L AND :DT_FINAL'
      '                          AND'
      
        '                          PT.DT_TRANSFERENCIA <= N.DT_RECEBIMENT' +
        'O -- PARA N'#195'O CONSIDERAR NOTAS FEITAS ANTES DA TRANSFER'#202'NCIA'
      '                          '
      '                        UNION'
      '                        '
      '                        SELECT'
      '                          COD_PRODUTO_ORIGEM'
      '                        FROM'
      '                          TB_PRODUTO_TRANSFERIDO PT'
      '                        WHERE'
      
        '                          PT.DT_TRANSFERENCIA BETWEEN :DT_INICIA' +
        'L AND :DT_FINAL'
      '                        AND'
      
        '                          PT.DT_TRANSFERENCIA <= N.DT_RECEBIMENT' +
        'O -- PARA N'#195'O CONSIDERAR NOTAS FEITAS ANTES DA TRANSFER'#202'NCIA'
      '                          '
      '                        )'
      'GROUP BY'
      '  I.COD_PRODUTO,'
      '  0,'
      '  NULL'
      '  '
      'UNION'
      '*/'
      'SELECT'
      
        '  --LAST_DAY(TO_DATE('#39'01'#39'||'#39'/'#39'||INV.NUM_MES||'#39'/'#39'||INV.NUM_ANO)) ' +
        'AS DT_MOVIMENTO,'
      '  INV.COD_PRODUTO AS COD_ITEM,'
      '  CASE '
      
        '    WHEN -- SE N'#195'O EXISTIR NOTA DE DEP'#211'SITO NA EMPRESA MOSTRA A ' +
        'QUANTIDADE DO INVENT'#193'RIO'
      '      ('
      '        SELECT DISTINCT COUNT(*) FROM TB_NOTA_AUX NA'
      '          INNER JOIN TB_NOTA_ITEM I'
      '            ON NA.COD_NOTA_ITEM = I.COD_NOTA_ITEM'
      '          INNER JOIN TB_NOTA_CAB N'
      '            ON I.COD_NOTA_CAB = N.COD_NOTA_CAB'
      '          INNER JOIN TB_SERIE '
      
        '            ON (N.COD_SERIE = TB_SERIE.COD_SERIE AND TB_SERIE.CO' +
        'D_FILIAL = N.COD_FILIAL AND N.COD_SERIE_MODELO = TB_SERIE.COD_SE' +
        'RIE_MODELO)'
      '          INNER JOIN TB_PRODUTO P'
      '            ON I.COD_PRODUTO = P.COD_PRODUTO'
      '          INNER JOIN TB_OPERACAO O '
      '            ON N.COD_OPERACAO = O.COD_OPERACAO'
      '        WHERE '
      '          NA.COD_PRODUTO = INV.COD_PRODUTO '
      '          AND'
      '            N.DT_RECEBIMENTO BETWEEN :DT_INICIAL AND :DT_FINAL'
      '          AND'
      '            N.COD_FILIAL = INV.COD_FILIAL'
      '          AND'
      '            N.IND_SITUACAO = '#39'2'#39
      '          AND'
      '            O.IND_LIVRO_FISCAL = '#39'S'#39
      '          AND'
      '            (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      '          AND'
      
        '            TB_SERIE.COD_SERIE_MODELO in ('#39'01'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39 +
        ', '#39'65'#39') '
      '          AND'
      
        '            P.COD_TIPO_PRODUTO IN ('#39'00'#39', '#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39',' +
        ' '#39'05'#39', '#39'06'#39', '#39'10'#39')'
      '          AND'
      '            NA.IND_TIPO = '#39'DEP_EMP'#39
      '      ) = 0 THEN '
      '    INV.QT_QUANTIDADE'
      
        '  ELSE -- SE EXISTIR NOTA DE DEP'#211'SITO NA EMPRESA, MOSTRA APENAS ' +
        'A DIFEREN'#199'A ENTRE O ESTOQUE E A NOTA DE DEP'#211'SITO'
      '    ('
      
        '    SELECT CASE WHEN (NA.QT_NOTA_ITEM - NA.QT_DEVOLVIDO - INV.QT' +
        '_QUANTIDADE) < 0 THEN 0 ELSE (NA.QT_NOTA_ITEM - NA.QT_DEVOLVIDO ' +
        '- INV.QT_QUANTIDADE) END FROM TB_NOTA_AUX NA'
      '          INNER JOIN TB_NOTA_ITEM I'
      '            ON NA.COD_NOTA_ITEM = I.COD_NOTA_ITEM'
      '          INNER JOIN TB_NOTA_CAB N'
      '            ON I.COD_NOTA_CAB = N.COD_NOTA_CAB'
      '          INNER JOIN TB_SERIE '
      
        '            ON (N.COD_SERIE = TB_SERIE.COD_SERIE AND TB_SERIE.CO' +
        'D_FILIAL = N.COD_FILIAL AND N.COD_SERIE_MODELO = TB_SERIE.COD_SE' +
        'RIE_MODELO)'
      '          INNER JOIN TB_PRODUTO P'
      '            ON I.COD_PRODUTO = P.COD_PRODUTO'
      '          INNER JOIN TB_OPERACAO O '
      '            ON N.COD_OPERACAO = O.COD_OPERACAO'
      '        WHERE '
      '          NA.COD_PRODUTO = INV.COD_PRODUTO '
      '          AND'
      '            N.DT_RECEBIMENTO BETWEEN :DT_INICIAL AND :DT_FINAL'
      '          AND'
      '            N.COD_FILIAL = INV.COD_FILIAL'
      '          AND'
      '            N.IND_SITUACAO = '#39'2'#39
      '          AND'
      '            O.IND_LIVRO_FISCAL = '#39'S'#39
      '          AND'
      '            (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      '          AND'
      
        '            TB_SERIE.COD_SERIE_MODELO in ('#39'01'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39 +
        ', '#39'65'#39') '
      '          AND'
      
        '            P.COD_TIPO_PRODUTO IN ('#39'00'#39', '#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39',' +
        ' '#39'05'#39', '#39'06'#39', '#39'10'#39')'
      '          AND'
      '            NA.IND_TIPO = '#39'DEP_EMP'#39
      '        )    '
      '  END AS QTD,'
      '  0 AS IND_EST,'
      '  NULL AS COD_PART,'
      '  P.IND_SITUACAO,'
      '  P.COD_TIPO_PRODUTO'
      'FROM'
      '  TB_ESTOQUE_INVENTARIO INV'
      'INNER JOIN TB_PRODUTO P ON P.COD_PRODUTO = INV.COD_PRODUTO'
      'INNER JOIN TB_FILIAL F ON F.COD_FILIAL = INV.COD_FILIAL'
      
        '--INNER JOIN TB_TRIBUTACAO T ON P.COD_TRIBUTACAO = T.COD_TRIBUTA' +
        'CAO'
      '--INNER JOIN TB_NOTA_ITEM I ON P.COD_PRODUTO = I.COD_PRODUTO'
      '--INNER JOIN TB_NOTA_CAB N ON I.COD_NOTA_CAB = N.COD_NOTA_CAB'
      '--INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACAO'
      '--INNER JOIN TB_ESTADO E ON N.COD_ESTADO = E.COD_ESTADO'
      
        '--INNER JOIN TB_SERIE ON (N.COD_SERIE = TB_SERIE.COD_SERIE AND T' +
        'B_SERIE.COD_FILIAL = N.COD_FILIAL AND N.COD_SERIE_MODELO = TB_SE' +
        'RIE.COD_SERIE_MODELO)'
      'Where'
      '  INV.COD_FILIAL = :COD_FILIAL'
      'And'
      '  INV.NUM_ANO = :Num_Ano'
      'And'
      '  INV.NUM_MES = :Num_Mes'
      'AND'
      
        '  P.COD_TIPO_PRODUTO IN ('#39'00'#39', '#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39', '#39'06' +
        #39', '#39'10'#39')'
      '--AND  '
      '--  N.DT_RECEBIMENTO BETWEEN :DT_INICIAL AND :DT_FINAL'
      '--AND'
      '--  N.COD_FILIAL = :COD_FILIAL'
      '--AND'
      '--  N.IND_SITUACAO = '#39'2'#39
      '--AND'
      '--  O.IND_LIVRO_FISCAL = '#39'S'#39
      '--AND'
      '--  (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      '--AND'
      '--  TB_SERIE.COD_SERIE_MODELO in ('#39'01'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39') '
      'AND'
      
        '  (SELECT COUNT(*) FROM TB_FILIAL_INVENTARIO_MES X WHERE X.COD_F' +
        'ILIAL = INV.COD_FILIAL AND X.NUM_MES = INV.NUM_MES) > 0'
      'AND'
      '  P.COD_PRODUTO NOT IN (                        '
      '                        SELECT'
      '                          PT.COD_PRODUTO_DESTINO'
      '                        FROM'
      '                          TB_PRODUTO_TRANSFERIDO PT'
      '                        WHERE'
      
        '                          PT.DT_TRANSFERENCIA BETWEEN :DT_INICIA' +
        'L AND :DT_FINAL'
      '                          --AND'
      
        '                          --PT.DT_TRANSFERENCIA <= N.DT_RECEBIME' +
        'NTO -- PARA N'#195'O CONSIDERAR NOTAS FEITAS ANTES DA TRANSFER'#202'NCIA'
      '                          '
      '                        UNION'
      '                        '
      '                        SELECT'
      '                          PT.COD_PRODUTO_ORIGEM'
      '                        FROM'
      '                          TB_PRODUTO_TRANSFERIDO PT'
      '                        WHERE'
      
        '                          PT.DT_TRANSFERENCIA BETWEEN :DT_INICIA' +
        'L AND :DT_FINAL'
      '                        --AND'
      
        '                        --PT.DT_TRANSFERENCIA <= N.DT_RECEBIMENT' +
        'O -- PARA N'#195'O CONSIDERAR NOTAS FEITAS ANTES DA TRANSFER'#202'NCIA'
      '                        )'
      '    '
      'UNION'
      ''
      'SELECT'
      '  --N.DT_RECEBIMENTO AS DT_MOVIMENTO,'
      '  NA.COD_PRODUTO AS COD_ITEM,'
      '  NA.QT_NOTA_ITEM - QT_DEVOLVIDO AS QTD,'
      '  2 AS IND_EST,'
      '  N.COD_CADASTRO,'
      '  P.IND_SITUACAO,'
      '  P.COD_TIPO_PRODUTO'
      'FROM'
      '  TB_NOTA_AUX NA'
      '  INNER JOIN TB_NOTA_ITEM I'
      '    ON NA.COD_NOTA_ITEM = I.COD_NOTA_ITEM'
      '  INNER JOIN TB_NOTA_CAB N'
      '    ON I.COD_NOTA_CAB = N.COD_NOTA_CAB'
      '  INNER JOIN TB_PRODUTO P'
      '    ON I.COD_PRODUTO = P.COD_PRODUTO'
      '  INNER JOIN TB_SERIE '
      
        '    ON (N.COD_SERIE = TB_SERIE.COD_SERIE AND TB_SERIE.COD_FILIAL' +
        ' = N.COD_FILIAL AND N.COD_SERIE_MODELO = TB_SERIE.COD_SERIE_MODE' +
        'LO)'
      '  INNER JOIN TB_OPERACAO O '
      '    ON N.COD_OPERACAO = O.COD_OPERACAO'
      'WHERE'
      '  N.DT_RECEBIMENTO BETWEEN :DT_INICIAL AND :DT_FINAL'
      '  AND'
      '    N.COD_FILIAL = :COD_FILIAL'
      '  AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '  AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '  AND'
      '    (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      '  AND'
      '    TB_SERIE.COD_SERIE_MODELO in ('#39'01'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39') '
      '  AND'
      
        '   P.COD_TIPO_PRODUTO IN ('#39'00'#39', '#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39', '#39'0' +
        '6'#39', '#39'10'#39')'
      '  AND'
      '  NA.IND_TIPO = '#39'DEP_EMP'#39
      ')'
      'WHERE'
      '    IND_SITUACAO <> '#39'DESATIVADO'#39
      '    AND'
      
        '    COD_TIPO_PRODUTO IN ('#39'00'#39', '#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39', '#39'06' +
        #39', '#39'10'#39')'
      'GROUP BY'
      '  --DT_MOVIMENTO,'
      '  COD_ITEM,  '
      '  IND_EST,'
      '  COD_PART,'
      '  IND_SITUACAO,'
      '  COD_TIPO_PRODUTO'
      'ORDER BY'
      '  COD_ITEM')
    Variables.Data = {
      03000000050000000B0000003A44545F494E494349414C0C0000000000000000
      000000090000003A44545F46494E414C0C00000000000000000000000B000000
      3A434F445F46494C49414C030000000000000000000000080000003A4E554D5F
      414E4F050000000000000000000000080000003A4E554D5F4D45530500000000
      00000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000400000008000000434F445F4954454D010000000000030000005154
      4401000000000007000000494E445F45535401000000000008000000434F445F
      50415254010000000000}
    Session = DMOracle.DBCemapa
    Left = 64
    Top = 48
    object QReg200COD_ITEM: TFloatField
      FieldName = 'COD_ITEM'
    end
    object QReg200QTD: TFloatField
      FieldName = 'QTD'
    end
    object QReg200IND_EST: TFloatField
      FieldName = 'IND_EST'
    end
    object QReg200COD_PART: TFloatField
      FieldName = 'COD_PART'
    end
  end
  object QReg220: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  DT_TRANSFERENCIA,'
      '  COD_PRODUTO_ORIGEM,'
      '  COD_PRODUTO_DESTINO,'
      '  ABS(QT_QUANTIDADE) AS QT_QUANTIDADE  '
      'FROM'
      '  TB_PARAM_SISTEMA,'
      '  TB_PRODUTO_TRANSFERIDO PT'
      
        '  INNER JOIN TB_PRODUTO P ON PT.COD_PRODUTO_ORIGEM = P.COD_PRODU' +
        'TO'
      'WHERE'
      
        '  P.COD_TIPO_PRODUTO IN ('#39'00'#39', '#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39', '#39'06' +
        #39', '#39'10'#39')'
      '  AND'
      '  PT.DT_TRANSFERENCIA BETWEEN :DT_INICIAL AND :DT_FINAL'
      '  AND'
      '  PT.QT_QUANTIDADE > 0'
      ''
      ''
      '/*'
      'SELECT'
      '  DT_TRANSFERENCIA,'
      '  COD_PRODUTO_ORIGEM,'
      '  COD_PRODUTO_DESTINO,'
      '  ABS(QT_QUANTIDADE) AS QT_QUANTIDADE  '
      'FROM'
      '  TB_PARAM_SISTEMA,'
      '  TB_NOTA_ITEM I'
      'INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      'INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACAO'
      'INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL'
      'INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      
        'INNER JOIN TB_TRIBUTACAO T ON P.COD_TRIBUTACAO = T.COD_TRIBUTACA' +
        'O'
      'INNER JOIN TB_ESTADO E ON N.COD_ESTADO = E.COD_ESTADO'
      
        'INNER JOIN TB_SERIE ON (N.COD_SERIE = TB_SERIE.COD_SERIE AND TB_' +
        'SERIE.COD_FILIAL = N.COD_FILIAL AND N.COD_SERIE_MODELO = TB_SERI' +
        'E.COD_SERIE_MODELO)'
      
        'INNER JOIN TB_PRODUTO_TRANSFERIDO PT ON (I.COD_PRODUTO = PT.COD_' +
        'PRODUTO_ORIGEM OR I.COD_PRODUTO = PT.COD_PRODUTO_DESTINO)'
      ''
      'WHERE'
      '  N.DT_RECEBIMENTO BETWEEN :DT_INICIAL AND :DT_FINAL'
      'AND'
      '  N.COD_FILIAL = :COD_FILIAL'
      'AND'
      '  N.IND_SITUACAO = '#39'2'#39
      'AND'
      '  O.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      '  (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      'AND'
      
        '(TB_SERIE.COD_SERIE_MODELO in ('#39'01'#39', '#39'1B'#39', '#39'04'#39') OR (TB_SERIE.CO' +
        'D_SERIE_MODELO = '#39'55'#39' AND O.IND_EMITE <> '#39'F'#39'))'
      'AND'
      
        '  P.COD_TIPO_PRODUTO IN ('#39'00'#39', '#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39', '#39'06' +
        #39', '#39'10'#39')'
      '*/')
    Variables.Data = {
      03000000020000000B0000003A44545F494E494349414C0C0000000000000000
      000000090000003A44545F46494E414C0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000040000001000000044545F5452414E53464552454E43494101000000
      000012000000434F445F50524F4455544F5F4F524947454D0100000000001300
      0000434F445F50524F4455544F5F44455354494E4F0100000000000D00000051
      545F5155414E544944414445010000000000}
    Session = DMOracle.DBCemapa
    Left = 136
    Top = 48
    object QReg220DT_TRANSFERENCIA: TDateTimeField
      FieldName = 'DT_TRANSFERENCIA'
    end
    object QReg220COD_PRODUTO_ORIGEM: TIntegerField
      FieldName = 'COD_PRODUTO_ORIGEM'
    end
    object QReg220COD_PRODUTO_DESTINO: TIntegerField
      FieldName = 'COD_PRODUTO_DESTINO'
    end
    object QReg220QT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
    end
  end
  object QReg230: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  OC.DT_PERIODO_I AS DT_INI_OP,'
      '  DECODE(OC.IND_SITUACAO,3,OC.DT_PERIODO_F,NULL) AS DT_FIN_OP,'
      '  OC.COD_ORDEM_PRODUCAO_CAB AS COD_DOC_OP,'
      '  OI.COD_PRODUTO AS COD_ITEM,'
      '  OI.QT_QUANTIDADE AS QTD_ENC,'
      '  '#39'PRODUCAO'#39' AS TIPO'
      'FROM'
      '  TB_ORDEM_PRODUCAO_CAB OC'
      '    INNER JOIN TB_ORDEM_PRODUCAO_ITEM OI'
      '      ON OC.COD_ORDEM_PRODUCAO_CAB = OI.COD_ORDEM_PRODUCAO_CAB'
      '    INNER JOIN TB_PRODUTO P ON OI.COD_PRODUTO = P.COD_PRODUTO'
      'WHERE'
      '  (OC.DT_PERIODO_F  BETWEEN :DT_INI AND :DT_FIN)'
      '  AND'
      '  P.COD_TIPO_PRODUTO IN ('#39'03'#39', '#39'04'#39')'
      '  '
      'UNION'
      '  '
      'SELECT'
      '  B.DT_BOLETIM AS DT_INI_OP,'
      '  B.DT_BOLETIM AS DT_FIN_OP,'
      '  B.COD_BOLETIM AS COD_DOC_OP,'
      '  F.COD_PRODUTO AS COD_ITEM,'
      '  B.QT_FABRICADO AS QTD_ENC,'
      '  '#39'BOLETIM'#39' AS TIPO'
      'FROM'
      '  TB_BOLETIM B'
      '    INNER JOIN TB_FORMULA F ON B.COD_FORMULA = F.COD_FORMULA'
      '    INNER JOIN TB_PRODUTO P ON F.COD_PRODUTO = P.COD_PRODUTO'
      'WHERE'
      '  B.DT_BOLETIM BETWEEN :DT_INI AND :DT_FIN'
      '  AND'
      '  B.COD_FILIAL = :FILIAL'
      '  AND'
      '  P.COD_TIPO_PRODUTO IN ('#39'03'#39', '#39'04'#39')')
    Variables.Data = {
      0300000003000000070000003A44545F494E490C000000000000000000000007
      0000003A44545F46494E0C0000000000000000000000070000003A46494C4941
      4C030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000060000000900000044545F494E495F4F500100000000000900000044
      545F46494E5F4F500100000000000A000000434F445F444F435F4F5001000000
      000008000000434F445F4954454D010000000000070000005154445F454E4301
      0000000000040000005449504F010000000000}
    Session = DMOracle.DBCemapa
    Left = 208
    Top = 48
    object QReg230DT_INI_OP: TDateTimeField
      FieldName = 'DT_INI_OP'
    end
    object QReg230DT_FIN_OP: TDateTimeField
      FieldName = 'DT_FIN_OP'
    end
    object QReg230COD_DOC_OP: TIntegerField
      FieldName = 'COD_DOC_OP'
    end
    object QReg230COD_ITEM: TIntegerField
      FieldName = 'COD_ITEM'
    end
    object QReg230QTD_ENC: TFloatField
      FieldName = 'QTD_ENC'
    end
    object QReg230TIPO: TStringField
      FieldName = 'TIPO'
      Size = 8
    end
  end
  object QReg235: TOracleDataSet1
    SQL.Strings = (
      '--REGISTRO K235'
      ''
      'SELECT'
      '  OP.DT_PRODUCAO AS DT_SAIDA,'
      '  FI.COD_PRODUTO AS COD_ITEM,'
      '  FI.QT_ITEM AS QTD,'
      '  --FI.COD_PRODUTO AS COD_INS_SUBST'
      '  '#39#39' AS COD_INS_SUBST'
      'FROM'
      '  TB_ORDEM_PRODUCAO_CAB OP'
      
        '  INNER JOIN TB_ORDEM_PRODUCAO_ITEM OI ON OP.COD_ORDEM_PRODUCAO_' +
        'CAB = OI.COD_ORDEM_PRODUCAO_CAB'
      '  INNER JOIN TB_FORMULA F ON OI.COD_PRODUTO = F.COD_PRODUTO '
      '    --AND OI.COD_LOTE = F.COD_LOTE_TIPO --(VERIFICAR)'
      
        '  INNER JOIN TB_FORMULA_ITEM FI ON F.COD_FORMULA = FI.COD_FORMUL' +
        'A'
      '  INNER JOIN TB_PRODUTO P ON OI.COD_PRODUTO = P.COD_PRODUTO'
      'WHERE'
      '  :TIPO = '#39'PRODUCAO'#39
      '  AND'
      '  OP.COD_ORDEM_PRODUCAO_CAB = :COD_PRODUCAO'
      '  AND F.COD_PRODUTO = :COD_PRODUTO'
      
        '  AND P.COD_TIPO_PRODUTO IN ('#39'00'#39', '#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39',' +
        ' '#39'10'#39')'
      ''
      '  '
      'UNION'
      ''
      'SELECT'
      '  B.DT_BOLETIM AS DT_SAIDA,'
      '  FI.COD_PRODUTO AS COD_ITEM,'
      '  FI.QT_ITEM AS QTD,'
      '  --FI.COD_PRODUTO AS COD_INS_SUBST'
      '  '#39#39' AS COD_INS_SUBST'
      'FROM'
      '  TB_BOLETIM B'
      '  INNER JOIN TB_FORMULA F ON B.COD_FORMULA = F.COD_FORMULA '
      
        '  INNER JOIN TB_FORMULA_ITEM FI ON F.COD_FORMULA = FI.COD_FORMUL' +
        'A'
      '  INNER JOIN TB_PRODUTO P ON FI.COD_PRODUTO = P.COD_PRODUTO'
      'WHERE'
      '  :TIPO = '#39'BOLETIM'#39
      '  AND'
      '  B.COD_BOLETIM = :COD_PRODUCAO'
      '  AND'
      '  F.COD_PRODUTO = :COD_PRODUTO'
      '  AND '
      
        '  P.COD_TIPO_PRODUTO IN ('#39'00'#39', '#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39', '#39'10' +
        #39')')
    Variables.Data = {
      0300000003000000050000003A5449504F0500000000000000000000000D0000
      003A434F445F50524F445543414F0300000000000000000000000C0000003A43
      4F445F50524F4455544F030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000040000000800000044545F534149444101000000000008000000434F
      445F4954454D010000000000030000005154440100000000000D000000434F44
      5F494E535F5355425354010000000000}
    Session = DMOracle.DBCemapa
    Left = 280
    Top = 48
    object QReg235DT_SAIDA: TDateTimeField
      FieldName = 'DT_SAIDA'
      Required = True
    end
    object QReg235COD_ITEM: TIntegerField
      FieldName = 'COD_ITEM'
      Required = True
    end
    object QReg235QTD: TFloatField
      FieldName = 'QTD'
      Required = True
    end
    object QReg235COD_INS_SUBST: TStringField
      FieldName = 'COD_INS_SUBST'
      Size = 1
    end
  end
end
