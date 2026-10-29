object DmPisCofins0: TDmPisCofins0
  OldCreateOrder = False
  Left = 673
  Top = 209
  Height = 314
  Width = 342
  object QReg000: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  COD_FILIAL,'
      '  DESC_FILIAL,'
      '  NUM_CGC,'
      '  DESC_NIT,'
      '  E.DESC_SIGLA_ESTADO,'
      '  DESC_INSCRICAO,'
      '  E.COD_UF_IBGE || C.COD_CIDADE_IBGE COD_CIDADE_IBGE,'
      '  E.COD_UF_IBGE + 0.00 as COD_UF_IBGE,'
      '  DESC_INSCRICAO_MUNICIPAL,'
      '  DESC_SUFRAMA,'
      '  IND_ATIV_PREPONDERANTE'
      'FROM'
      '  TB_FILIAL F'
      'LEFT JOIN TB_CIDADE C ON F.COD_CIDADE = C.COD_CIDADE'
      'LEFT JOIN TB_ESTADO E ON F.COD_ESTADO = E.COD_ESTADO'
      'WHERE'
      '  F.COD_FILIAL = :COD_FILIAL')
    Variables.Data = {
      03000000010000000B0000003A434F445F46494C49414C030000000000000000
      000000}
    QBEDefinition.QBEFieldDefs = {
      040000000B0000000B000000444553435F46494C49414C010000000000070000
      004E554D5F43474301000000000008000000444553435F4E4954010000000000
      11000000444553435F5349474C415F45535441444F0100000000000E00000044
      4553435F494E5343524943414F0100000000000F000000434F445F4349444144
      455F4942474501000000000018000000444553435F494E5343524943414F5F4D
      554E49434950414C0100000000000C000000444553435F53554652414D410100
      000000000B000000434F445F55465F494247450100000000000A000000434F44
      5F46494C49414C01000000000016000000494E445F415449565F505245504F4E
      444552414E5445010000000000}
    Session = DMOracle.DBCemapa
    Left = 24
    Top = 16
    object QReg000DESC_FILIAL: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
    object QReg000NUM_CGC: TStringField
      FieldName = 'NUM_CGC'
      Size = 18
    end
    object QReg000DESC_NIT: TStringField
      FieldName = 'DESC_NIT'
      Size = 15
    end
    object QReg000DESC_SIGLA_ESTADO: TStringField
      FieldName = 'DESC_SIGLA_ESTADO'
      Size = 2
    end
    object QReg000DESC_INSCRICAO: TStringField
      FieldName = 'DESC_INSCRICAO'
      Size = 12
    end
    object QReg000COD_CIDADE_IBGE: TStringField
      FieldName = 'COD_CIDADE_IBGE'
      Size = 5
    end
    object QReg000COD_UF_IBGE: TFloatField
      FieldName = 'COD_UF_IBGE'
    end
    object QReg000DESC_INSCRICAO_MUNICIPAL: TStringField
      FieldName = 'DESC_INSCRICAO_MUNICIPAL'
      Size = 15
    end
    object QReg000DESC_SUFRAMA: TStringField
      FieldName = 'DESC_SUFRAMA'
      Size = 15
    end
    object QReg000COD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QReg000IND_ATIV_PREPONDERANTE: TIntegerField
      FieldName = 'IND_ATIV_PREPONDERANTE'
    end
  end
  object QReg100: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  DISTINCT'
      '  C.NOME,'
      
        '  decode(C.IND_FISICA_JURIDICA, '#39'F'#39', C.NUM_CGC_CPF, '#39#39') as DESC_' +
        'CPF,'
      
        '  decode(C.IND_FISICA_JURIDICA, '#39'J'#39', C.NUM_CGC_CPF, '#39#39') as DESC_' +
        'CNPJ,'
      '  C.DESC_CRC,'
      '  C.DESC_CEP,'
      '  C.DESC_ENDERECO,'
      '  C.DESC_COMPLEMENTO,'
      '  C.DESC_BAIRRO,'
      '  C.DESC_TELEFONE,'
      '  C.DESC_FAX,'
      '  C.DESC_E_MAIL,'
      '  I.COD_CIDADE_IBGE,'
      '  E.COD_UF_IBGE + 0.00 as COD_UF_IBGE'
      'FROM'
      '  TB_FILIAL F'
      
        #9'INNER JOIN TB_CADASTRO C ON F.COD_CADASTRO_CONTABILISTA = C.COD' +
        '_CADASTRO'
      #9'LEFT JOIN TB_ESTADO E ON C.COD_ESTADO = E.COD_ESTADO'
      #9'LEFT JOIN TB_CIDADE I ON C.COD_CIDADE = I.COD_CIDADE'
      '')
    QBEDefinition.QBEFieldDefs = {
      040000000D000000040000004E4F4D4501000000000008000000444553435F43
      504601000000000009000000444553435F434E504A0100000000000800000044
      4553435F43524301000000000008000000444553435F4345500100000000000D
      000000444553435F454E44455245434F01000000000010000000444553435F43
      4F4D504C454D454E544F0100000000000B000000444553435F42414952524F01
      00000000000D000000444553435F54454C45464F4E4501000000000008000000
      444553435F4641580100000000000B000000444553435F455F4D41494C010000
      0000000F000000434F445F4349444144455F494247450100000000000B000000
      434F445F55465F49424745010000000000}
    Session = DMOracle.DBCemapa
    Left = 96
    Top = 16
    object QReg100NOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object QReg100DESC_CPF: TStringField
      FieldName = 'DESC_CPF'
      Size = 18
    end
    object QReg100DESC_CNPJ: TStringField
      FieldName = 'DESC_CNPJ'
      Size = 18
    end
    object QReg100DESC_CRC: TStringField
      FieldName = 'DESC_CRC'
      Size = 10
    end
    object QReg100DESC_CEP: TStringField
      FieldName = 'DESC_CEP'
      Size = 9
    end
    object QReg100DESC_ENDERECO: TStringField
      FieldName = 'DESC_ENDERECO'
      Size = 40
    end
    object QReg100DESC_COMPLEMENTO: TStringField
      FieldName = 'DESC_COMPLEMENTO'
      Size = 40
    end
    object QReg100DESC_BAIRRO: TStringField
      FieldName = 'DESC_BAIRRO'
    end
    object QReg100DESC_TELEFONE: TStringField
      FieldName = 'DESC_TELEFONE'
      Size = 12
    end
    object QReg100DESC_FAX: TStringField
      FieldName = 'DESC_FAX'
      Size = 12
    end
    object QReg100DESC_E_MAIL: TStringField
      FieldName = 'DESC_E_MAIL'
      Size = 70
    end
    object QReg100COD_CIDADE_IBGE: TStringField
      FieldName = 'COD_CIDADE_IBGE'
      Size = 5
    end
    object QReg100COD_UF_IBGE: TFloatField
      FieldName = 'COD_UF_IBGE'
    end
  end
  object QReg140: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  COD_FILIAL,'
      '  DESC_FILIAL,'
      '  NUM_CGC,'
      '  E.DESC_SIGLA_ESTADO,'
      '  DESC_INSCRICAO,'
      '  C.COD_CIDADE_IBGE,'
      '  E.COD_UF_IBGE + 0.00 as COD_UF_IBGE,'
      '  DESC_INSCRICAO_MUNICIPAL,'
      '  DESC_SUFRAMA'
      'FROM'
      '  TB_FILIAL F'
      'LEFT JOIN TB_CIDADE C ON F.COD_CIDADE = C.COD_CIDADE'
      'LEFT JOIN TB_ESTADO E ON F.COD_ESTADO = E.COD_ESTADO'
      'WHERE'
      '  F.COD_FILIAL IN :FILIAIS')
    Variables.Data = {
      0300000001000000080000003A46494C49414953010000000400000028312900
      00000000}
    QBEDefinition.QBEFieldDefs = {
      04000000090000000B000000444553435F46494C49414C010000000000070000
      004E554D5F43474301000000000011000000444553435F5349474C415F455354
      41444F0100000000000E000000444553435F494E5343524943414F0100000000
      000F000000434F445F4349444144455F49424745010000000000180000004445
      53435F494E5343524943414F5F4D554E49434950414C0100000000000C000000
      444553435F53554652414D410100000000000B000000434F445F55465F494247
      450100000000000A000000434F445F46494C49414C010000000000}
    Session = DMOracle.DBCemapa
    Left = 168
    Top = 16
    object QReg140COD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QReg140DESC_FILIAL: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
    object QReg140NUM_CGC: TStringField
      FieldName = 'NUM_CGC'
      Size = 18
    end
    object QReg140DESC_SIGLA_ESTADO: TStringField
      FieldName = 'DESC_SIGLA_ESTADO'
      Size = 2
    end
    object QReg140DESC_INSCRICAO: TStringField
      FieldName = 'DESC_INSCRICAO'
      Size = 12
    end
    object QReg140COD_CIDADE_IBGE: TStringField
      FieldName = 'COD_CIDADE_IBGE'
      Size = 5
    end
    object QReg140COD_UF_IBGE: TFloatField
      FieldName = 'COD_UF_IBGE'
    end
    object QReg140DESC_INSCRICAO_MUNICIPAL: TStringField
      FieldName = 'DESC_INSCRICAO_MUNICIPAL'
      Size = 15
    end
    object QReg140DESC_SUFRAMA: TStringField
      FieldName = 'DESC_SUFRAMA'
      Size = 15
    end
  end
  object QReg150: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  DISTINCT'
      '  COD_CADASTRO,'
      '  NOME,'
      '  COD_PAIS_IBGE,'
      '  CASE'
      '    WHEN DESC_SIGLA_ESTADO = '#39'EX'#39' THEN'
      '      NULL        '
      '    ELSE'
      '      DESC_CNPJ'
      '  END AS DESC_CNPJ,'
      '  CASE'
      '    WHEN DESC_SIGLA_ESTADO = '#39'EX'#39' THEN'
      '      NULL    '
      '    ELSE'
      '      DESC_CPF'
      '  END AS DESC_CPF,'
      '  NUM_INSCRICAO,'
      '  COD_UF_IBGE,'
      '  COD_CIDADE_IBGE,'
      '  DESC_SUFRAMA,'
      '  DESC_ENDERECO,'
      '  DESC_COMPLEMENTO,'
      '  DESC_BAIRRO,'
      '  DESC_SIGLA_ESTADO,'
      '  DESC_INSCRICAO_MUNICIPAL,'
      '  IND_FISICA_JURIDICA'
      'FROM'
      '('
      'SELECT'
      '  DISTINCT'
      '  C.COD_CADASTRO + 0.00 as COD_CADASTRO,'
      '  C.NOME,'
      '  P.COD_PAIS_IBGE + 0.00 AS COD_PAIS_IBGE,'
      
        '  decode(C.IND_FISICA_JURIDICA, '#39'J'#39', C.NUM_CGC_CPF, '#39#39') as DESC_' +
        'CNPJ,'
      
        '  decode(C.IND_FISICA_JURIDICA, '#39'F'#39', C.NUM_CGC_CPF, '#39#39') as DESC_' +
        'CPF,'
      
        '  decode(C.IND_FISICA_JURIDICA, '#39'J'#39', C.NUM_INSCRICAO, '#39#39') as NUM' +
        '_INSCRICAO,'
      '  E.COD_UF_IBGE + 0.00 as COD_UF_IBGE,'
      '  I.COD_CIDADE_IBGE,'
      '  C.DESC_SUFRAMA,'
      '  C.DESC_ENDERECO,'
      '  C.DESC_COMPLEMENTO,'
      '  C.DESC_BAIRRO,'
      '  E.DESC_SIGLA_ESTADO,'
      '  C.DESC_INSCRICAO_MUNICIPAL,'
      '  C.IND_FISICA_JURIDICA,'
      '  TB_SERIE.COD_SERIE_MODELO'
      'FROM'
      '  TB_NOTA_ITEM'
      
        'INNER JOIN TB_NOTA_CAB ON TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITE' +
        'M.COD_NOTA_CAB'
      
        'INNER JOIN TB_OPERACAO ON TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO' +
        '.COD_OPERACAO'
      
        'INNER JOIN TB_SERIE ON (TB_NOTA_CAB.COD_SERIE = TB_SERIE.COD_SER' +
        'IE AND TB_SERIE.COD_FILIAL = TB_NOTA_CAB.COD_FILIAL'
      #9'AND TB_SERIE.COD_SERIE_MODELO = TB_NOTA_CAB.COD_SERIE_MODELO)'
      
        'INNER JOIN TB_CADASTRO C ON TB_NOTA_CAB.COD_CADASTRO = C.COD_CAD' +
        'ASTRO'
      'LEFT JOIN TB_ESTADO E ON C.COD_ESTADO = E.COD_ESTADO'
      'LEFT JOIN TB_CIDADE I ON C.COD_CIDADE = I.COD_CIDADE'
      'LEFT JOIN TB_PAIS P ON C.COD_PAIS = P.COD_PAIS'
      'WHERE'
      '  TB_NOTA_CAB.IND_SITUACAO <> '#39'1'#39
      'AND'
      '  TB_OPERACAO.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      
        '  (TB_OPERACAO.NUM_LIVROS <> 10 or TB_OPERACAO.NUM_LIVROS is nul' +
        'l)'
      'AND'
      
        '  ((TB_SERIE.COD_SERIE_MODELO NOT IN ('#39'02'#39','#39'2D'#39','#39'59'#39','#39'99'#39','#39'65'#39'))' +
        ' OR (TB_SERIE.COD_SERIE_MODELO = '#39'65'#39' AND (C.NUM_CGC_CPF IS NOT ' +
        'NULL)))'
      'AND'
      '  TB_NOTA_CAB.COD_FILIAL IN :FILIAIS'
      'AND'
      '  (TB_NOTA_CAB.DT_RECEBIMENTO between :DT_INICIAL AND :DT_FINAL)'
      'AND'
      
        '  ((NVL(TB_OPERACAO.PERC_BASE_PIS,-1) >= 0) AND (NVL(TB_OPERACAO' +
        '.PERC_BASE_COFINS,-1) >= 0))'
      '  '
      'UNION'
      ''
      '/*'
      
        '/ Notas de entrada de servi'#231'o da Grasel que s'#227'o escrituradas com' +
        'o sa'#237'da'
      '/ Com reten'#231#227'o de pis e cofins'
      '*/'
      'SELECT'
      '  DISTINCT'
      '  C.COD_CADASTRO + 0.00 as COD_CADASTRO,'
      '  C.NOME,'
      '  P.COD_PAIS_IBGE + 0.00 AS COD_PAIS_IBGE,'
      
        '  decode(C.IND_FISICA_JURIDICA, '#39'J'#39', C.NUM_CGC_CPF, '#39#39') as DESC_' +
        'CNPJ,'
      
        '  decode(C.IND_FISICA_JURIDICA, '#39'F'#39', C.NUM_CGC_CPF, '#39#39') as DESC_' +
        'CPF,'
      
        '  decode(C.IND_FISICA_JURIDICA, '#39'J'#39', C.NUM_INSCRICAO, '#39#39') as NUM' +
        '_INSCRICAO,'
      '  E.COD_UF_IBGE + 0.00 as COD_UF_IBGE,'
      '  I.COD_CIDADE_IBGE,'
      '  C.DESC_SUFRAMA,'
      '  C.DESC_ENDERECO,'
      '  C.DESC_COMPLEMENTO,'
      '  C.DESC_BAIRRO,'
      '  E.DESC_SIGLA_ESTADO,'
      '  C.DESC_INSCRICAO_MUNICIPAL,'
      '  C.IND_FISICA_JURIDICA,'
      '  TB_SERIE.COD_SERIE_MODELO'
      'FROM'
      '  TB_PARAM_SISTEMA PS,'
      '  TB_NOTA_ITEM'
      
        'INNER JOIN TB_NOTA_CAB ON TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITE' +
        'M.COD_NOTA_CAB'
      
        'INNER JOIN TB_OPERACAO ON TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO' +
        '.COD_OPERACAO'
      
        'INNER JOIN TB_SERIE ON (TB_NOTA_CAB.COD_SERIE = TB_SERIE.COD_SER' +
        'IE AND TB_SERIE.COD_FILIAL = TB_NOTA_CAB.COD_FILIAL'
      #9'AND TB_SERIE.COD_SERIE_MODELO = TB_NOTA_CAB.COD_SERIE_MODELO)'
      
        'INNER JOIN TB_CADASTRO C ON TB_NOTA_CAB.COD_CADASTRO = C.COD_CAD' +
        'ASTRO'
      'LEFT JOIN TB_ESTADO E ON C.COD_ESTADO = E.COD_ESTADO'
      'LEFT JOIN TB_CIDADE I ON C.COD_CIDADE = I.COD_CIDADE'
      'LEFT JOIN TB_PAIS P ON C.COD_PAIS = P.COD_PAIS'
      
        'INNER JOIN TB_NOTA_IMPOSTO_SERVICO NIS ON TB_NOTA_CAB.COD_NOTA_C' +
        'AB = NIS.COD_NOTA_CAB'
      'INNER JOIN TB_IMPOSTO IMP ON NIS.COD_IMPOSTO = IMP.COD_IMPOSTO'
      
        'INNER JOIN TB_PRODUTO P ON TB_NOTA_ITEM.COD_PRODUTO = P.COD_PROD' +
        'UTO'
      'WHERE'
      '  PS.COD_EMPRESA = '#39'GRASEL'#39
      'AND'
      '  C.IND_PIS_COFINS_RETIDO = '#39'SIM'#39
      'AND  '
      
        '  ((P.IND_TIPO_PRODUTO = '#39'SERVI'#199'O'#39') OR (TB_OPERACAO.IND_SERVICO ' +
        '= '#39'S'#39'))'
      'AND'
      
        '  (IMP.DESC_IMPOSTO LIKE '#39'%PIS%'#39' OR IMP.DESC_IMPOSTO LIKE '#39'%COFI' +
        'NS%'#39')'
      'AND'
      '  TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'E'#39
      'AND'
      
        '  (TB_NOTA_ITEM.COD_CST_PIS IS NOT NULL) AND (TB_NOTA_ITEM.COD_C' +
        'ST_COFINS IS NOT NULL)'
      'AND'
      '  TB_NOTA_CAB.IND_SITUACAO <> '#39'1'#39
      'AND'
      '  TB_OPERACAO.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      
        '  (TB_OPERACAO.NUM_LIVROS <> 10 or TB_OPERACAO.NUM_LIVROS is nul' +
        'l)'
      'AND'
      '  TB_SERIE.COD_SERIE_MODELO IN ('#39'01'#39','#39'98'#39')'
      'AND'
      '  TB_NOTA_CAB.COD_FILIAL IN :FILIAIS'
      'AND'
      '  (TB_NOTA_CAB.DT_RECEBIMENTO between :DT_INICIAL AND :DT_FINAL)'
      'AND'
      
        '  ((NVL(TB_OPERACAO.PERC_BASE_PIS,-1) = -1) AND (NVL(TB_OPERACAO' +
        '.PERC_BASE_COFINS,-1) = -1))'
      ''
      'UNION'
      ''
      'SELECT -- Fretes inclusao'
      '  DISTINCT'
      '  C.COD_CADASTRO + 0.00 ,'
      '  C.NOME,'
      '  P.COD_PAIS_IBGE + 0.00 ,'
      '  decode(C.IND_FISICA_JURIDICA, '#39'J'#39', C.NUM_CGC_CPF, '#39#39'),'
      '  decode(C.IND_FISICA_JURIDICA, '#39'F'#39', C.NUM_CGC_CPF, '#39#39'),'
      
        '  decode(C.IND_FISICA_JURIDICA, '#39'J'#39', C.NUM_INSCRICAO, '#39#39') as NUM' +
        '_INSCRICAO,'
      '  E.COD_UF_IBGE + 0.00,'
      '  I.COD_CIDADE_IBGE,'
      '  C.DESC_SUFRAMA,'
      '  C.DESC_ENDERECO,'
      '  C.DESC_COMPLEMENTO,'
      '  C.DESC_BAIRRO,'
      '  E.DESC_SIGLA_ESTADO,'
      '  C.DESC_INSCRICAO_MUNICIPAL,'
      '  C.IND_FISICA_JURIDICA,'
      '  TB_SERIE.COD_SERIE_MODELO'
      'FROM'
      '  TB_NOTA_ITEM'
      
        'INNER JOIN TB_NOTA_CAB ON TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITE' +
        'M.COD_NOTA_CAB'
      
        'INNER JOIN TB_OPERACAO ON TB_NOTA_CAB.COD_OPERACAO_CF = TB_OPERA' +
        'CAO.COD_OPERACAO'
      
        'INNER JOIN TB_PRODUTO ON TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.C' +
        'OD_PRODUTO'
      
        'INNER JOIN TB_CADASTRO C ON TB_NOTA_CAB.COD_TRANSPORTADOR = C.CO' +
        'D_CADASTRO'
      
        'INNER JOIN TB_SERIE ON (TB_NOTA_CAB.COD_SERIE_CF = TB_SERIE.COD_' +
        'SERIE AND TB_SERIE.COD_FILIAL = TB_NOTA_CAB.COD_FILIAL AND'
      #9'TB_NOTA_CAB.COD_SERIE_MODELO_CF = TB_SERIE.COD_SERIE_MODELO)'#9
      'LEFT JOIN TB_ESTADO E ON C.COD_ESTADO = E.COD_ESTADO'
      'LEFT JOIN TB_CIDADE I ON C.COD_CIDADE = I.COD_CIDADE'
      'LEFT JOIN TB_PAIS P ON C.COD_PAIS = P.COD_PAIS'
      'WHERE'
      '  TB_NOTA_CAB.DT_RECEBIMENTO BETWEEN :DT_INICIAL AND :DT_FINAL'
      'AND'
      '  TB_NOTA_CAB.COD_FILIAL IN :FILIAIS'
      'AND'
      
        '  ((TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'S'#39' AND TB_NOTA_CAB.IND_TIPO' +
        '_FRETE = '#39'CIF'#39')'
      '  OR'
      
        '  (TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'E'#39' AND TB_NOTA_CAB.IND_TIPO_' +
        'FRETE = '#39'FOB'#39'))'
      'AND'
      '  TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      'AND'
      '  TB_NOTA_CAB.VAL_FRETE > 0'
      'AND'
      '  TB_OPERACAO.IND_LIVRO_FISCAL = '#39'S'#39
      'AND  '
      
        '  TB_SERIE.COD_SERIE_MODELO IN ('#39'07'#39','#39'08'#39', '#39'8B'#39', '#39'09'#39', '#39'10'#39', '#39'11' +
        #39', '#39'26'#39', '#39'27'#39', '#39'57'#39')'
      'AND'
      
        '  ((NVL(TB_OPERACAO.PERC_BASE_PIS,-1) >= 0) AND (NVL(TB_OPERACAO' +
        '.PERC_BASE_COFINS,-1) >= 0))'
      '  '
      'UNION'
      ''
      'SELECT -- Fretes nota'
      '  DISTINCT'
      '  C.COD_CADASTRO + 0.00 ,'
      '  C.NOME,'
      '  P.COD_PAIS_IBGE + 0.00 ,'
      '  decode(C.IND_FISICA_JURIDICA, '#39'J'#39', C.NUM_CGC_CPF, '#39#39'),'
      '  decode(C.IND_FISICA_JURIDICA, '#39'F'#39', C.NUM_CGC_CPF, '#39#39'),'
      
        '  decode(C.IND_FISICA_JURIDICA, '#39'J'#39', C.NUM_INSCRICAO, '#39#39') as NUM' +
        '_INSCRICAO,'
      '  E.COD_UF_IBGE + 0.00,'
      '  I.COD_CIDADE_IBGE,'
      '  C.DESC_SUFRAMA,'
      '  C.DESC_ENDERECO,'
      '  C.DESC_COMPLEMENTO,'
      '  C.DESC_BAIRRO,'
      '  E.DESC_SIGLA_ESTADO,'
      '  C.DESC_INSCRICAO_MUNICIPAL,'
      '  C.IND_FISICA_JURIDICA,'
      '  TB_SERIE.COD_SERIE_MODELO'
      'FROM'
      '  TB_NOTA_ITEM'
      
        'INNER JOIN TB_NOTA_CAB ON TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITE' +
        'M.COD_NOTA_CAB'
      
        'INNER JOIN TB_OPERACAO ON TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO' +
        '.COD_OPERACAO'
      
        'INNER JOIN TB_PRODUTO ON TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.C' +
        'OD_PRODUTO'
      
        'INNER JOIN TB_CADASTRO C ON TB_NOTA_CAB.COD_CADASTRO = C.COD_CAD' +
        'ASTRO'
      
        'INNER JOIN TB_SERIE ON (TB_NOTA_CAB.COD_SERIE = TB_SERIE.COD_SER' +
        'IE AND TB_SERIE.COD_FILIAL = TB_NOTA_CAB.COD_FILIAL AND'
      #9'TB_NOTA_CAB.COD_SERIE_MODELO = TB_SERIE.COD_SERIE_MODELO)'#9
      'LEFT JOIN TB_ESTADO E ON C.COD_ESTADO = E.COD_ESTADO'
      'LEFT JOIN TB_CIDADE I ON C.COD_CIDADE = I.COD_CIDADE'
      'LEFT JOIN TB_PAIS P ON C.COD_PAIS = P.COD_PAIS'
      'WHERE'
      '  TB_NOTA_CAB.DT_RECEBIMENTO BETWEEN :DT_INICIAL AND :DT_FINAL'
      'AND'
      '  TB_NOTA_CAB.COD_FILIAL IN :FILIAIS'
      'AND'
      
        '  ((TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'S'#39' AND TB_NOTA_CAB.IND_TIPO' +
        '_FRETE = '#39'CIF'#39')'
      '  OR'
      
        '  (TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'E'#39' AND TB_NOTA_CAB.IND_TIPO_' +
        'FRETE = '#39'FOB'#39'))'
      'AND'
      '  TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      'AND'
      '  TB_OPERACAO.IND_LIVRO_FISCAL = '#39'S'#39
      'AND  '
      
        '  TB_SERIE.COD_SERIE_MODELO IN ('#39'07'#39','#39'08'#39', '#39'8B'#39', '#39'09'#39', '#39'10'#39', '#39'11' +
        #39', '#39'26'#39', '#39'27'#39', '#39'57'#39')'
      'AND'
      
        '  ((NVL(TB_OPERACAO.PERC_BASE_PIS,-1) >= 0) AND (NVL(TB_OPERACAO' +
        '.PERC_BASE_COFINS,-1) >= 0))'
      '  '
      'UNION'
      ''
      'SELECT'
      '  DISTINCT'
      '  C.COD_CADASTRO + 0.00,'
      '  C.NOME,'
      '  P.COD_PAIS_IBGE + 0.00,'
      
        '  decode(C.IND_FISICA_JURIDICA, '#39'J'#39', C.NUM_CGC_CPF, '#39#39') as DESC_' +
        'CNPJ,'
      
        '  decode(C.IND_FISICA_JURIDICA, '#39'F'#39', C.NUM_CGC_CPF, '#39#39') as DESC_' +
        'CPF,'
      
        '  decode(C.IND_FISICA_JURIDICA, '#39'J'#39', C.NUM_INSCRICAO, '#39#39') as NUM' +
        '_INSCRICAO,'
      '  E.COD_UF_IBGE + 0.00,'
      '  I.COD_CIDADE_IBGE,'
      '  C.DESC_SUFRAMA,'
      '  C.DESC_ENDERECO,'
      '  C.DESC_COMPLEMENTO,'
      '  C.DESC_BAIRRO,'
      '  E.DESC_SIGLA_ESTADO,'
      '  C.DESC_INSCRICAO_MUNICIPAL,'
      '  C.IND_FISICA_JURIDICA,'
      '  TB_SERIE.COD_SERIE_MODELO'
      'FROM'
      '  TB_CONHECIMENTO'
      
        'INNER JOIN TB_SERIE ON (TB_CONHECIMENTO.COD_SERIE = TB_SERIE.COD' +
        '_SERIE'
      
        #9'AND TB_CONHECIMENTO.COD_FILIAL = TB_SERIE.COD_FILIAL AND TB_CON' +
        'HECIMENTO.COD_SERIE_MODELO = '
      #9'TB_SERIE.COD_SERIE_MODELO)'
      
        'INNER JOIN TB_FILIAL ON TB_CONHECIMENTO.COD_FILIAL = TB_FILIAL.C' +
        'OD_FILIAL'
      
        'INNER JOIN TB_TRIBUTACAO ON TB_CONHECIMENTO.COD_TRIBUTACAO = TB_' +
        'TRIBUTACAO.COD_TRIBUTACAO'
      
        'INNER JOIN TB_OPERACAO ON TB_CONHECIMENTO.COD_OPERACAO = TB_OPER' +
        'ACAO.COD_OPERACAO'
      
        'INNER JOIN TB_CADASTRO C ON TB_CONHECIMENTO.COD_CADASTRO = C.COD' +
        '_CADASTRO'
      'LEFT JOIN TB_ESTADO E ON C.COD_ESTADO = E.COD_ESTADO'
      'LEFT JOIN TB_CIDADE I ON C.COD_CIDADE = I.COD_CIDADE'
      'LEFT JOIN TB_PAIS P ON C.COD_PAIS = P.COD_PAIS'
      'WHERE'
      '  TB_CONHECIMENTO.IND_SITUACAO <> '#39'1'#39
      'AND'
      
        '  TB_CONHECIMENTO.DT_RECEBIMENTO BETWEEN :DT_INICIAL AND :DT_FIN' +
        'AL'
      'AND'
      '  TB_CONHECIMENTO.COD_FILIAL IN :FILIAIS'
      'AND'
      '  TB_OPERACAO.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      
        '  ((NVL(TB_OPERACAO.PERC_BASE_PIS,-1) >= 0) AND (NVL(TB_OPERACAO' +
        '.PERC_BASE_COFINS,-1) >= 0))'
      'AND '
      
        '  TB_CONHECIMENTO.COD_SERIE_MODELO IN ('#39'07'#39','#39'08'#39', '#39'8B'#39', '#39'09'#39', '#39'1' +
        '0'#39', '#39'11'#39', '#39'26'#39', '#39'27'#39')'
      ''
      'UNION'
      ''
      'SELECT'
      '  DISTINCT'
      '  C.COD_CADASTRO + 0.00,'
      '  C.NOME,'
      '  P.COD_PAIS_IBGE + 0.00,'
      
        '  decode(C.IND_FISICA_JURIDICA, '#39'J'#39', C.NUM_CGC_CPF, '#39#39') as DESC_' +
        'CNPJ,'
      
        '  decode(C.IND_FISICA_JURIDICA, '#39'F'#39', C.NUM_CGC_CPF, '#39#39') as DESC_' +
        'CPF,'
      
        '  decode(C.IND_FISICA_JURIDICA, '#39'J'#39', C.NUM_INSCRICAO, '#39#39') as NUM' +
        '_INSCRICAO,'
      '  E.COD_UF_IBGE + 0.00,'
      '  I.COD_CIDADE_IBGE,'
      '  C.DESC_SUFRAMA,'
      '  C.DESC_ENDERECO,'
      '  C.DESC_COMPLEMENTO,'
      '  C.DESC_BAIRRO,'
      '  E.DESC_SIGLA_ESTADO,'
      '  C.DESC_INSCRICAO_MUNICIPAL,'
      '  C.IND_FISICA_JURIDICA,'
      '  TB_SERIE.COD_SERIE_MODELO'
      'FROM'
      '  TB_CONHECIMENTO'
      
        'INNER JOIN TB_SERIE ON (TB_CONHECIMENTO.COD_SERIE = TB_SERIE.COD' +
        '_SERIE'
      
        #9'AND TB_CONHECIMENTO.COD_FILIAL = TB_SERIE.COD_FILIAL AND TB_CON' +
        'HECIMENTO.COD_SERIE_MODELO = '
      #9'TB_SERIE.COD_SERIE_MODELO)'
      
        'INNER JOIN TB_FILIAL ON TB_CONHECIMENTO.COD_FILIAL = TB_FILIAL.C' +
        'OD_FILIAL'
      
        'INNER JOIN TB_TRIBUTACAO ON TB_CONHECIMENTO.COD_TRIBUTACAO = TB_' +
        'TRIBUTACAO.COD_TRIBUTACAO'
      
        'INNER JOIN TB_OPERACAO ON TB_CONHECIMENTO.COD_OPERACAO = TB_OPER' +
        'ACAO.COD_OPERACAO'
      
        'INNER JOIN TB_CADASTRO C ON TB_CONHECIMENTO.COD_CADASTRO_TOMADOR' +
        ' = C.COD_CADASTRO'
      'LEFT JOIN TB_ESTADO E ON C.COD_ESTADO = E.COD_ESTADO'
      'LEFT JOIN TB_CIDADE I ON C.COD_CIDADE = I.COD_CIDADE'
      'LEFT JOIN TB_PAIS P ON C.COD_PAIS = P.COD_PAIS'
      'WHERE'
      '  TB_CONHECIMENTO.IND_SITUACAO <> '#39'1'#39
      'AND'
      
        '  TB_CONHECIMENTO.DT_RECEBIMENTO BETWEEN :DT_INICIAL AND :DT_FIN' +
        'AL'
      'AND'
      '  TB_CONHECIMENTO.COD_FILIAL IN :FILIAIS'
      'AND'
      '  TB_OPERACAO.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      
        '  ((NVL(TB_OPERACAO.PERC_BASE_PIS,-1) >= 0) AND (NVL(TB_OPERACAO' +
        '.PERC_BASE_COFINS,-1) >= 0))'
      'AND'
      '  TB_CONHECIMENTO.COD_SERIE_MODELO = 57'
      ''
      '  '
      'UNION'
      ''
      'SELECT'
      '  DISTINCT'
      '  C.COD_CADASTRO + 0.00 ,'
      '  C.NOME,'
      '  P.COD_PAIS_IBGE + 0.00,'
      
        '  decode(C.IND_FISICA_JURIDICA, '#39'J'#39', C.NUM_CGC_CPF, '#39#39') as DESC_' +
        'CNPJ,'
      
        '  decode(C.IND_FISICA_JURIDICA, '#39'F'#39', C.NUM_CGC_CPF, '#39#39') as DESC_' +
        'CPF,'
      
        '  decode(C.IND_FISICA_JURIDICA, '#39'J'#39', C.NUM_INSCRICAO, '#39#39') as NUM' +
        '_INSCRICAO,'
      '  E.COD_UF_IBGE + 0.00,'
      '  I.COD_CIDADE_IBGE,'
      '  C.DESC_SUFRAMA,'
      '  C.DESC_ENDERECO,'
      '  C.DESC_COMPLEMENTO,'
      '  C.DESC_BAIRRO,'
      '  E.DESC_SIGLA_ESTADO,'
      '  C.DESC_INSCRICAO_MUNICIPAL,'
      '  C.IND_FISICA_JURIDICA,'
      '  TB_CONHECIMENTO_FRETE.COD_SERIE_MODELO'
      'FROM'
      '  TB_CONHECIMENTO_FRETE'
      
        'INNER JOIN TB_FILIAL ON TB_CONHECIMENTO_FRETE.COD_FILIAL = TB_FI' +
        'LIAL.COD_FILIAL'
      
        'INNER JOIN TB_TRIBUTACAO ON TB_CONHECIMENTO_FRETE.COD_TRIBUTACAO' +
        ' = TB_TRIBUTACAO.COD_TRIBUTACAO'
      
        'INNER JOIN TB_OPERACAO ON TB_CONHECIMENTO_FRETE.COD_OPERACAO = T' +
        'B_OPERACAO.COD_OPERACAO'
      
        'INNER JOIN TB_CADASTRO C ON TB_CONHECIMENTO_FRETE.COD_CADASTRO =' +
        ' C.COD_CADASTRO'
      'LEFT JOIN TB_ESTADO E ON C.COD_ESTADO = E.COD_ESTADO'
      'LEFT JOIN TB_CIDADE I ON C.COD_CIDADE = I.COD_CIDADE'
      'LEFT JOIN TB_PAIS P ON C.COD_PAIS = P.COD_PAIS'
      'WHERE'
      '  TB_CONHECIMENTO_FRETE.IND_SITUACAO <> '#39'1'#39
      'AND'
      
        '  TB_CONHECIMENTO_FRETE.DT_RECEBIMENTO BETWEEN :DT_INICIAL AND :' +
        'DT_FINAL'
      'AND'
      '  TB_CONHECIMENTO_FRETE.COD_FILIAL IN :FILIAIS'
      'AND'
      '  TB_OPERACAO.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      
        '  ((NVL(TB_OPERACAO.PERC_BASE_PIS,-1) >= 0) AND (NVL(TB_OPERACAO' +
        '.PERC_BASE_COFINS,-1) >= 0))'
      ')'
      'ORDER BY'
      '  COD_CADASTRO')
    Variables.Data = {
      03000000030000000B0000003A44545F494E494349414C0C0000000000000000
      000000090000003A44545F46494E414C0C000000000000000000000008000000
      3A46494C49414953010000000600000028312C32290000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000F000000040000004E4F4D4501000000000008000000444553435F43
      504601000000000009000000444553435F434E504A0100000000000D00000044
      4553435F454E44455245434F01000000000010000000444553435F434F4D504C
      454D454E544F0100000000000B000000444553435F42414952524F0100000000
      000F000000434F445F4349444144455F494247450100000000000C000000434F
      445F434144415354524F0100000000000D0000004E554D5F494E534352494341
      4F0100000000000C000000444553435F53554652414D41010000000000110000
      00444553435F5349474C415F45535441444F0100000000001800000044455343
      5F494E5343524943414F5F4D554E49434950414C0100000000000D000000434F
      445F504149535F4942474501000000000013000000494E445F4649534943415F
      4A555249444943410100000000000B000000434F445F55465F49424745010000
      000000}
    Session = DMOracle.DBCemapa
    Left = 240
    Top = 16
    object QReg150COD_CADASTRO: TFloatField
      FieldName = 'COD_CADASTRO'
    end
    object QReg150NOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object QReg150COD_PAIS_IBGE: TFloatField
      FieldName = 'COD_PAIS_IBGE'
    end
    object QReg150DESC_CNPJ: TStringField
      FieldName = 'DESC_CNPJ'
      Size = 18
    end
    object QReg150DESC_CPF: TStringField
      FieldName = 'DESC_CPF'
      Size = 18
    end
    object QReg150NUM_INSCRICAO: TStringField
      FieldName = 'NUM_INSCRICAO'
    end
    object QReg150DESC_SUFRAMA: TStringField
      FieldName = 'DESC_SUFRAMA'
      Size = 9
    end
    object QReg150DESC_ENDERECO: TStringField
      FieldName = 'DESC_ENDERECO'
      Size = 40
    end
    object QReg150DESC_COMPLEMENTO: TStringField
      FieldName = 'DESC_COMPLEMENTO'
      Size = 40
    end
    object QReg150DESC_BAIRRO: TStringField
      FieldName = 'DESC_BAIRRO'
    end
    object QReg150DESC_SIGLA_ESTADO: TStringField
      FieldName = 'DESC_SIGLA_ESTADO'
      Size = 2
    end
    object QReg150DESC_INSCRICAO_MUNICIPAL: TStringField
      FieldName = 'DESC_INSCRICAO_MUNICIPAL'
      Size = 15
    end
    object QReg150IND_FISICA_JURIDICA: TStringField
      FieldName = 'IND_FISICA_JURIDICA'
      Size = 1
    end
    object QReg150COD_UF_IBGE: TFloatField
      FieldName = 'COD_UF_IBGE'
    end
    object QReg150COD_CIDADE_IBGE: TStringField
      FieldName = 'COD_CIDADE_IBGE'
      Size = 5
    end
  end
  object QReg190: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  distinct'
      '  TRIM(DESC_UNIDADE) AS DESC_UNIDADE'
      'FROM'
      '('
      'SELECT'
      '  distinct'
      '  UPPER(DESC_UNIDADE) AS DESC_UNIDADE'
      'FROM'
      '  TB_PARAM_SISTEMA,'
      '  TB_NOTA_ITEM I'
      'INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      'INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACAO'
      'INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      'INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL'
      
        'INNER JOIN TB_TRIBUTACAO T ON P.COD_TRIBUTACAO = T.COD_TRIBUTACA' +
        'O'
      'INNER JOIN TB_ESTADO E ON N.COD_ESTADO = E.COD_ESTADO'
      
        'INNER JOIN TB_SERIE S ON (S.COD_SERIE = N.COD_SERIE AND S.COD_FI' +
        'LIAL = N.COD_FILIAL'
      #9'AND S.COD_SERIE_MODELO = N.COD_SERIE_MODELO)'
      'WHERE'
      '  N.DT_RECEBIMENTO BETWEEN :DT_INICIAL AND :DT_FINAL'
      'AND'
      '  N.COD_FILIAL IN :FILIAIS'
      'AND'
      '  N.IND_SITUACAO = '#39'2'#39
      'AND'
      '  (O.IND_LIVRO_FISCAL = '#39'S'#39' OR O.IND_CUPOM_FISCAL = '#39'S'#39')'
      'AND'
      '  DESC_UNIDADE is not null'
      'AND'
      '  S.COD_SERIE_MODELO <> '#39'06'#39
      'AND'
      
        '((NVL(O.PERC_BASE_PIS,-1) >= 0) AND (NVL(O.PERC_BASE_COFINS,-1) ' +
        '>= 0))'
      ''
      'UNION'
      ''
      'SELECT'
      '  distinct'
      '  UPPER(DESC_UNIDADE)'
      'FROM'
      '  Tb_Estoque_Inventario'
      
        'INNER JOIN TB_PRODUTO P ON Tb_Estoque_Inventario.COD_PRODUTO = P' +
        '.COD_PRODUTO'
      
        'INNER JOIN TB_TRIBUTACAO T ON P.COD_TRIBUTACAO = T.COD_TRIBUTACA' +
        'O'
      'Where'
      '  Tb_Estoque_Inventario.COD_FILIAL IN :FILIAIS'
      'And'
      '  Tb_Estoque_Inventario.NUM_ANO = :Num_Ano'
      'And'
      '  Tb_Estoque_Inventario.NUM_MES = :Num_Mes'
      'AND'
      '  DESC_UNIDADE is not null'
      'AND'
      
        '  (SELECT COUNT(*) FROM TB_FILIAL_INVENTARIO_MES X WHERE X.COD_F' +
        'ILIAL = Tb_Estoque_Inventario.COD_FILIAL AND X.NUM_MES = Tb_Esto' +
        'que_Inventario.NUM_MES) > 0'
      ''
      'UNION'
      ''
      'SELECT'
      '  distinct'
      '  UPPER(DESC_UNIDADE)'
      'FROM'
      '  TB_NOTA_ITEM'
      
        'INNER JOIN TB_NOTA_CAB ON Tb_Nota_Cab.COD_NOTA_CAB = Tb_Nota_Ite' +
        'm.COD_NOTA_CAB'
      
        'INNER JOIN TB_OPERACAO ON Tb_Nota_Cab.COD_OPERACAO = Tb_Operacao' +
        '.COD_OPERACAO'
      
        'INNER JOIN TB_CADASTRO ON Tb_Nota_Cab.COD_CADASTRO = Tb_Cadastro' +
        '.COD_CADASTRO'
      
        'INNER JOIN TB_CIDADE ON Tb_Cadastro.COD_CIDADE = Tb_Cidade.COD_C' +
        'IDADE'
      
        'INNER JOIN TB_ESTADO ON Tb_ESTADO.COD_ESTADO = TB_CIDADE.COD_EST' +
        'ADO'
      
        'INNER JOIN TB_PRODUTO P ON TB_NOTA_ITEM.COD_PRODUTO = P.COD_PROD' +
        'UTO'
      
        'INNER JOIN TB_TRIBUTACAO T ON P.COD_TRIBUTACAO = T.COD_TRIBUTACA' +
        'O'
      
        'INNER JOIN TB_SERIE S ON (S.COD_SERIE = TB_NOTA_CAB.COD_SERIE AN' +
        'D S.COD_FILIAL = TB_NOTA_CAB.COD_FILIAL'
      #9'AND S.COD_SERIE_MODELO = TB_NOTA_CAB.COD_SERIE_MODELO)'
      'Where'
      '  Tb_Nota_Cab.IND_SITUACAO = '#39'2'#39
      'AND'
      '  Tb_Operacao.IND_FIXAR_EMPRESA = '#39'F'#39
      'AND'
      '  TB_NOTA_CAB.DT_RECEBIMENTO BETWEEN :DT_INICIAL AND :DT_FINAL'
      'AND'
      '  TB_NOTA_CAB.COD_FILIAL IN :FILIAIS'
      'AND'
      
        '  (TB_OPERACAO.IND_LIVRO_FISCAL = '#39'S'#39' OR TB_OPERACAO.IND_CUPOM_F' +
        'ISCAL = '#39'S'#39')'
      'AND'
      '  DESC_UNIDADE is not null'
      'AND'
      
        '  ((NVL(TB_OPERACAO.PERC_BASE_PIS,-1) >= 0) AND (NVL(TB_OPERACAO' +
        '.PERC_BASE_COFINS,-1) >= 0))'
      ''
      'UNION ALL'
      ''
      'Select'
      '  distinct'
      '  UPPER(DESC_UNIDADE)'
      'From'
      '  TB_NOTA_ITEM'
      
        'INNER JOIN TB_NOTA_CAB ON Tb_Nota_Cab.COD_NOTA_CAB = Tb_Nota_Ite' +
        'm.COD_NOTA_CAB'
      
        'INNER JOIN TB_OPERACAO ON Tb_Nota_Cab.COD_OPERACAO = Tb_Operacao' +
        '.COD_OPERACAO'
      
        'INNER JOIN TB_CADASTRO ON Tb_Nota_Cab.COD_CADASTRO = Tb_Cadastro' +
        '.COD_CADASTRO'
      
        'INNER JOIN TB_CIDADE ON Tb_Cadastro.COD_CIDADE = Tb_Cidade.COD_C' +
        'IDADE'
      
        'INNER JOIN TB_ESTADO ON Tb_ESTADO.COD_ESTADO = TB_CIDADE.COD_EST' +
        'ADO'
      
        'INNER JOIN TB_PRODUTO P ON TB_NOTA_ITEM.COD_PRODUTO = P.COD_PROD' +
        'UTO'
      
        'INNER JOIN TB_TRIBUTACAO T ON P.COD_TRIBUTACAO = T.COD_TRIBUTACA' +
        'O'
      'Where'
      '  Tb_Nota_Cab.IND_SITUACAO = '#39'2'#39
      'And'
      '  Tb_Operacao.IND_FIXAR_EMPRESA = '#39'F'#39
      'AND'
      '  TB_OPERACAO.IND_COMPRAS = '#39'C'#39
      'AND'
      '  TB_CADASTRO.IND_FISICA_JURIDICA = '#39'F'#39
      'AND'
      '  TB_CADASTRO.DESC_INSCRICAO_MUNICIPAL is not null'
      'AND'
      '  TB_NOTA_CAB.DT_RECEBIMENTO BETWEEN :DT_INICIAL AND :DT_FINAL'
      'AND'
      '  TB_NOTA_CAB.COD_FILIAL IN :FILIAIS'
      'AND'
      
        '  (TB_OPERACAO.IND_LIVRO_FISCAL = '#39'S'#39' OR TB_OPERACAO.IND_CUPOM_F' +
        'ISCAL = '#39'S'#39')'
      'AND'
      
        '((NVL(TB_OPERACAO.PERC_BASE_PIS,-1) >= 0) AND (NVL(TB_OPERACAO.P' +
        'ERC_BASE_COFINS,-1) >= 0))'
      ')'
      'ORDER BY'
      '  TRIM(DESC_UNIDADE)')
    Variables.Data = {
      03000000050000000B0000003A44545F494E494349414C0C0000000000000000
      000000090000003A44545F46494E414C0C000000000000000000000008000000
      3A4E554D5F414E4F030000000000000000000000080000003A4E554D5F4D4553
      030000000000000000000000080000003A46494C494149530100000006000000
      28312C32290000000000}
    QBEDefinition.QBEFieldDefs = {04000000010000000C000000444553435F554E4944414445010000000000}
    Session = DMOracle.DBCemapa
    Left = 24
    Top = 80
    object QReg190DESC_UNIDADE: TStringField
      FieldName = 'DESC_UNIDADE'
      Size = 3
    end
  end
  object QReg200: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  DISTINCT'
      '  COD_PRODUTO,'
      '  DESC_PRODUTO,'
      '  NUM_FABRICANTE,'
      '  DESC_UNIDADE,'
      '  PERC_ALIQUOTA,'
      '  COD_GENERO_PRODUTO,'
      '  COD_EX_TIPI,'
      '  TRIM(TO_CHAR(NUM_GENERO_NCM, '#39'00000000'#39')) AS NUM_GENERO_NCM,'
      '  NVL(COD_LISTA_SERVICO, 0.00) COD_LISTA_SERVICO,'
      '  COD_TIPO_PRODUTO,'
      '  IND_TIPO_PRODUTO'
      'FROM'
      '('
      'SELECT'
      '  distinct'
      '  P.COD_PRODUTO + 0.00 AS COD_PRODUTO,'
      '  P.DESC_PRODUTO,'
      '  P.NUM_FABRICANTE,'
      '  P.DESC_UNIDADE,'
      '  T.PERC_ALIQUOTA,'
      '  P.COD_GENERO_PRODUTO + 0.00 AS COD_GENERO_PRODUTO,'
      '  P.COD_EX_TIPI,'
      '  P.NUM_GENERO_NCM,'
      '  P.COD_LISTA_SERVICO AS COD_LISTA_SERVICO,'
      '  P.COD_TIPO_PRODUTO,'
      '  P.IND_TIPO_PRODUTO'
      'FROM'
      '  TB_PARAM_SISTEMA,'
      '  TB_NOTA_ITEM I'
      'INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      'INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACAO'
      'INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      'INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL'
      
        'INNER JOIN TB_TRIBUTACAO T ON P.COD_TRIBUTACAO = T.COD_TRIBUTACA' +
        'O'
      'INNER JOIN TB_ESTADO E ON N.COD_ESTADO = E.COD_ESTADO'
      
        'INNER JOIN TB_SERIE ON (N.COD_SERIE = TB_SERIE.COD_SERIE AND TB_' +
        'SERIE.COD_FILIAL = N.COD_FILIAL'
      #9'AND N.COD_SERIE_MODELO = TB_SERIE.COD_SERIE_MODELO)'
      'WHERE'
      '  N.DT_RECEBIMENTO BETWEEN :DT_INICIAL AND :DT_FINAL'
      'AND'
      '  N.COD_FILIAL IN :FILIAIS'
      'AND'
      '  N.IND_SITUACAO = '#39'2'#39
      'AND'
      '  (O.IND_LIVRO_FISCAL = '#39'S'#39' OR O.IND_CUPOM_FISCAL = '#39'S'#39')'
      'AND'
      '  (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      'AND'
      '  TB_SERIE.COD_SERIE_MODELO <> '#39'06'#39
      'AND'
      
        '  ((NVL(O.PERC_BASE_PIS,-1) >= 0) OR (NVL(O.PERC_BASE_COFINS, -1' +
        ') >= 0))'
      'AND'
      
        ' ((I.COD_CST_PIS IS NOT NULL) AND (I.COD_CST_COFINS IS NOT NULL)' +
        ')'
      
        '-- OR ((P.COD_CST_PIS_SAIDA IS NOT NULL) AND (P.COD_CST_COFINS_S' +
        'AIDA IS NOT NULL))) Pegar do Item. Junior-20/08/2014'
      ''
      'UNION'
      ''
      'SELECT'
      '  distinct'
      '  P.COD_PRODUTO + 0.00 AS COD_PRODUTO,'
      '  P.DESC_PRODUTO,'
      '  P.NUM_FABRICANTE,'
      '  P.DESC_UNIDADE,'
      '  T.PERC_ALIQUOTA,'
      '  P.COD_GENERO_PRODUTO + 0.00 AS COD_GENERO_PRODUTO,'
      '  P.COD_EX_TIPI,'
      '  P.NUM_GENERO_NCM,'
      '  P.COD_LISTA_SERVICO AS COD_LISTA_SERVICO,'
      '  P.COD_TIPO_PRODUTO,'
      '  P.IND_TIPO_PRODUTO'
      'FROM'
      '  TB_NOTA_ITEM I'
      'INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      'INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACAO'
      'INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      'INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL'
      
        'INNER JOIN TB_TRIBUTACAO T ON P.COD_TRIBUTACAO = T.COD_TRIBUTACA' +
        'O'
      'INNER JOIN TB_ESTADO E ON N.COD_ESTADO = E.COD_ESTADO'
      
        'INNER JOIN TB_SERIE ON (N.COD_SERIE = TB_SERIE.COD_SERIE AND TB_' +
        'SERIE.COD_FILIAL = N.COD_FILIAL'
      #9'AND N.COD_SERIE_MODELO = TB_SERIE.COD_SERIE_MODELO)'
      
        'INNER JOIN TB_NOTA_IMPOSTO_SERVICO NIS ON N.COD_NOTA_CAB = NIS.C' +
        'OD_NOTA_CAB'
      'INNER JOIN TB_IMPOSTO IMP ON NIS.COD_IMPOSTO = IMP.COD_IMPOSTO'
      'WHERE'
      
        '  (IMP.DESC_IMPOSTO LIKE '#39'%PIS%'#39' OR IMP.DESC_IMPOSTO LIKE '#39'%COFI' +
        'NS%'#39')'
      'AND'
      '  N.DT_RECEBIMENTO BETWEEN :DT_INICIAL AND :DT_FINAL'
      'AND'
      '  N.COD_FILIAL IN :FILIAIS'
      'AND'
      '  N.IND_SITUACAO = '#39'2'#39
      'AND'
      '  (O.IND_LIVRO_FISCAL = '#39'S'#39' OR O.IND_CUPOM_FISCAL = '#39'S'#39')'
      'AND'
      '  (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      'AND'
      '  TB_SERIE.COD_SERIE_MODELO <> '#39'06'#39
      'AND'
      
        ' ((NVL(O.PERC_BASE_PIS,-1) = -1) AND (NVL(O.PERC_BASE_COFINS,-1)' +
        ' = -1))'
      ''
      'UNION'
      ''
      'SELECT'
      '  distinct'
      '  P.COD_PRODUTO + 0.00,'
      '  P.DESC_PRODUTO,'
      '  P.NUM_FABRICANTE,'
      '  P.DESC_UNIDADE,'
      '  T.PERC_ALIQUOTA,'
      '  P.COD_GENERO_PRODUTO + 0.00,'
      '  P.COD_EX_TIPI,'
      '  P.NUM_GENERO_NCM,'
      '  P.COD_LISTA_SERVICO,'
      '  P.COD_TIPO_PRODUTO,'
      '  P.IND_TIPO_PRODUTO'
      'FROM'
      '  TB_ESTOQUE_INVENTARIO INV'
      'INNER JOIN TB_PRODUTO P ON P.COD_PRODUTO = INV.COD_PRODUTO'
      'INNER JOIN TB_FILIAL F ON F.COD_FILIAL = INV.COD_FILIAL'
      
        'INNER JOIN TB_TRIBUTACAO T ON P.COD_TRIBUTACAO = T.COD_TRIBUTACA' +
        'O'
      'Where'
      '  INV.COD_FILIAL IN :FILIAIS'
      'And'
      '  INV.NUM_ANO = :Num_Ano'
      'And'
      '  INV.NUM_MES = :Num_Mes'
      'AND'
      
        '  (SELECT COUNT(*) FROM TB_FILIAL_INVENTARIO_MES X WHERE X.COD_F' +
        'ILIAL = INV.COD_FILIAL AND X.NUM_MES = INV.NUM_MES) > 0'
      'AND'
      
        '  (((P.COD_CST_PIS IS NOT NULL) AND (P.COD_CST_COFINS IS NOT NUL' +
        'L)) OR'
      
        '    ((P.COD_CST_PIS_SAIDA IS NOT NULL) AND (P.COD_CST_COFINS_SAI' +
        'DA IS NOT NULL)))'
      ''
      'UNION'
      ''
      'SELECT'
      '  distinct'
      '  P.COD_PRODUTO + 0.00,'
      '  P.DESC_PRODUTO,'
      '  P.NUM_FABRICANTE,'
      '  P.DESC_UNIDADE,'
      '  T.PERC_ALIQUOTA,'
      '  P.COD_GENERO_PRODUTO + 0.00,'
      '  P.COD_EX_TIPI,'
      '  P.NUM_GENERO_NCM,'
      '  P.COD_LISTA_SERVICO + 0.00,'
      '  P.COD_TIPO_PRODUTO,'
      '  P.IND_TIPO_PRODUTO'
      'FROM'
      '  TB_NOTA_ITEM'
      
        'INNER JOIN TB_NOTA_CAB ON Tb_Nota_Cab.COD_NOTA_CAB = Tb_Nota_Ite' +
        'm.COD_NOTA_CAB'
      
        'INNER JOIN TB_OPERACAO ON Tb_Nota_Cab.COD_OPERACAO = Tb_Operacao' +
        '.COD_OPERACAO'
      
        'INNER JOIN TB_CADASTRO ON Tb_Nota_Cab.COD_CADASTRO = Tb_Cadastro' +
        '.COD_CADASTRO'
      
        'INNER JOIN TB_CIDADE ON Tb_Cadastro.COD_CIDADE = Tb_Cidade.COD_C' +
        'IDADE'
      
        'INNER JOIN TB_ESTADO ON Tb_ESTADO.COD_ESTADO = TB_CIDADE.COD_EST' +
        'ADO'
      
        'INNER JOIN TB_PRODUTO P ON TB_NOTA_ITEM.COD_PRODUTO = P.COD_PROD' +
        'UTO'
      
        'INNER JOIN TB_TRIBUTACAO T ON P.COD_TRIBUTACAO = T.COD_TRIBUTACA' +
        'O'
      
        'INNER JOIN TB_SERIE ON (TB_NOTA_CAB.COD_SERIE = TB_SERIE.COD_SER' +
        'IE AND TB_SERIE.COD_FILIAL = TB_NOTA_CAB.COD_FILIAL'
      #9'AND TB_SERIE.COD_SERIE_MODELO = TB_NOTA_CAB.COD_SERIE_MODELO)'
      'Where'
      '  Tb_Nota_Cab.IND_SITUACAO = '#39'2'#39
      'AND'
      '  Tb_Operacao.IND_FIXAR_EMPRESA = '#39'F'#39
      'AND'
      '  TB_NOTA_CAB.DT_RECEBIMENTO BETWEEN :DT_INICIAL AND :DT_FINAL'
      'AND'
      '  TB_NOTA_CAB.COD_FILIAL IN :FILIAIS'
      'AND'
      '  TB_OPERACAO.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      
        '  (TB_OPERACAO.NUM_LIVROS <> 10 or TB_OPERACAO.NUM_LIVROS is nul' +
        'l)'
      'AND'
      '  TB_SERIE.COD_SERIE_MODELO <> '#39'06'#39
      'AND'
      
        '  ((NVL(TB_OPERACAO.PERC_BASE_PIS,-1) >= 0) OR (NVL(TB_OPERACAO.' +
        'PERC_BASE_COFINS, -1) >= 0))'
      'AND'
      
        ' ((TB_NOTA_ITEM.COD_CST_PIS IS NOT NULL) AND (TB_NOTA_ITEM.COD_C' +
        'ST_COFINS IS NOT NULL))'
      
        '-- OR ((P.COD_CST_PIS_SAIDA IS NOT NULL) AND (P.COD_CST_COFINS_S' +
        'AIDA IS NOT NULL))  Pegar do Item.Junior 20/08/2014'
      '--AND'
      '--  (NVL(TB_NOTA_ITEM.VAL_PIS, 0) > 0'
      '--  OR'
      '--  NVL(TB_NOTA_ITEM.VAL_CONFINS, 0) > 0)'
      ''
      'UNION'
      ''
      'Select'
      '  distinct'
      '  P.COD_PRODUTO + 0.00,'
      '  P.DESC_PRODUTO,'
      '  P.NUM_FABRICANTE,'
      '  P.DESC_UNIDADE,'
      '  T.PERC_ALIQUOTA,'
      '  P.COD_GENERO_PRODUTO + 0.00,'
      '  P.COD_EX_TIPI,'
      '  P.NUM_GENERO_NCM,'
      '  P.COD_LISTA_SERVICO,'
      '  P.COD_TIPO_PRODUTO,'
      '  P.IND_TIPO_PRODUTO'
      'From'
      '  TB_NOTA_ITEM'
      
        'INNER JOIN TB_NOTA_CAB ON Tb_Nota_Cab.COD_NOTA_CAB = Tb_Nota_Ite' +
        'm.COD_NOTA_CAB'
      
        'INNER JOIN TB_OPERACAO ON Tb_Nota_Cab.COD_OPERACAO = Tb_Operacao' +
        '.COD_OPERACAO'
      
        'INNER JOIN TB_CADASTRO ON Tb_Nota_Cab.COD_CADASTRO = Tb_Cadastro' +
        '.COD_CADASTRO'
      
        'INNER JOIN TB_CIDADE ON Tb_Cadastro.COD_CIDADE = Tb_Cidade.COD_C' +
        'IDADE'
      
        'INNER JOIN TB_ESTADO ON Tb_ESTADO.COD_ESTADO = TB_CIDADE.COD_EST' +
        'ADO'
      
        'INNER JOIN TB_PRODUTO P ON TB_NOTA_ITEM.COD_PRODUTO = P.COD_PROD' +
        'UTO'
      
        'INNER JOIN TB_TRIBUTACAO T ON P.COD_TRIBUTACAO = T.COD_TRIBUTACA' +
        'O'
      'Where'
      '  Tb_Nota_Cab.IND_SITUACAO = '#39'2'#39
      'And'
      '  Tb_Operacao.IND_FIXAR_EMPRESA = '#39'F'#39
      'AND'
      '  TB_OPERACAO.IND_COMPRAS = '#39'C'#39
      'AND'
      '  TB_CADASTRO.IND_FISICA_JURIDICA = '#39'F'#39
      'AND'
      '  TB_CADASTRO.DESC_INSCRICAO_MUNICIPAL is not null'
      'AND'
      '  TB_NOTA_CAB.DT_RECEBIMENTO BETWEEN :DT_INICIAL AND :DT_FINAL'
      'AND'
      '  TB_NOTA_CAB.COD_FILIAL IN :FILIAIS'
      'AND'
      '  TB_OPERACAO.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      
        '  ((NVL(TB_OPERACAO.PERC_BASE_PIS,-1) >= 0) OR (NVL(TB_OPERACAO.' +
        'PERC_BASE_COFINS, -1) >= 0))'
      'AND'
      
        ' ((P.COD_CST_PIS IS NOT NULL) AND (P.COD_CST_COFINS IS NOT NULL)' +
        ')'
      
        '-- OR ((P.COD_CST_PIS_SAIDA IS NOT NULL) AND (P.COD_CST_COFINS_S' +
        'AIDA IS NOT NULL)) Pegar do Item. Junior 20/08/2014.'
      ')'
      'ORDER BY'
      '  COD_PRODUTO')
    Variables.Data = {
      03000000050000000B0000003A44545F494E494349414C0C0000000000000000
      000000090000003A44545F46494E414C0C000000000000000000000008000000
      3A4E554D5F414E4F030000000000000000000000080000003A4E554D5F4D4553
      030000000000000000000000080000003A46494C494149530100000006000000
      28312C32290000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000B0000000B000000434F445F50524F4455544F0100000000000C0000
      00444553435F50524F4455544F0100000000000E0000004E554D5F4641425249
      43414E54450100000000000C000000444553435F554E49444144450100000000
      000D000000504552435F414C4951554F544101000000000012000000434F445F
      47454E45524F5F50524F4455544F0100000000000B000000434F445F45585F54
      4950490100000000000E0000004E554D5F47454E45524F5F4E434D0100000000
      0010000000434F445F5449504F5F50524F4455544F0100000000001100000043
      4F445F4C495354415F5345525649434F01000000000010000000494E445F5449
      504F5F50524F4455544F010000000000}
    Session = DMOracle.DBCemapa
    Left = 96
    Top = 80
    object QReg200COD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
    end
    object QReg200DESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 200
    end
    object QReg200NUM_FABRICANTE: TStringField
      FieldName = 'NUM_FABRICANTE'
      Size = 15
    end
    object QReg200DESC_UNIDADE: TStringField
      FieldName = 'DESC_UNIDADE'
      Size = 3
    end
    object QReg200PERC_ALIQUOTA: TFloatField
      FieldName = 'PERC_ALIQUOTA'
    end
    object QReg200COD_GENERO_PRODUTO: TFloatField
      FieldName = 'COD_GENERO_PRODUTO'
    end
    object QReg200COD_EX_TIPI: TStringField
      FieldName = 'COD_EX_TIPI'
      Size = 3
    end
    object QReg200COD_LISTA_SERVICO: TFloatField
      FieldName = 'COD_LISTA_SERVICO'
    end
    object QReg200COD_TIPO_PRODUTO: TStringField
      FieldName = 'COD_TIPO_PRODUTO'
      Size = 2
    end
    object QReg200NUM_GENERO_NCM: TStringField
      FieldName = 'NUM_GENERO_NCM'
      Size = 8
    end
    object QReg200IND_TIPO_PRODUTO: TStringField
      FieldName = 'IND_TIPO_PRODUTO'
      Size = 11
    end
  end
  object QReg400: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  DISTINCT'
      
        '/*  cast(decode(I.COD_OPERACAO, null, N.COD_OPERACAO, I.COD_OPER' +
        'ACAO) as number(6)) + 0.00 as COD_OPERACAO,*/'
      
        '  decode(I.COD_OPERACAO, null, N.COD_OPERACAO, I.COD_OPERACAO) +' +
        ' 0.00 as COD_OPERACAO,'
      
        '  decode(I.COD_OPERACAO, null, O_N.DESC_OPERACAO, O_I.DESC_OPERA' +
        'CAO) as DESC_OPERACAO'
      'FROM'
      '  TB_NOTA_ITEM I'
      'INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      'INNER JOIN TB_OPERACAO O_N ON N.COD_OPERACAO = O_N.COD_OPERACAO'
      'LEFT JOIN TB_OPERACAO O_I ON I.COD_OPERACAO = O_I.COD_OPERACAO'
      'INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      'INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL'
      
        'INNER JOIN TB_TRIBUTACAO T ON I.COD_TRIBUTACAO = T.COD_TRIBUTACA' +
        'O'
      'INNER JOIN TB_ESTADO E ON N.COD_ESTADO = E.COD_ESTADO'
      
        'INNER JOIN TB_SERIE S ON (N.COD_SERIE = S.COD_SERIE AND N.COD_FI' +
        'LIAL = S.COD_FILIAL'
      #9'AND N.COD_SERIE_MODELO = S.COD_SERIE_MODELO)'
      'WHERE'
      '  N.DT_RECEBIMENTO BETWEEN :DT_INICIAL AND :DT_FINAL'
      'AND'
      '  N.COD_FILIAL = :COD_FILIAL'
      'AND'
      
        '  --((O_N.IND_LIVRO_FISCAL = '#39'S'#39' AND I.COD_OPERACAO is null) OR ' +
        '(O_I.IND_LIVRO_FISCAL = '#39'S'#39' AND I.COD_OPERACAO is not null))'
      '  ((O_N.IND_LIVRO_FISCAL = '#39'S'#39') OR (O_I.IND_LIVRO_FISCAL = '#39'S'#39'))'
      'AND'
      '  N.IND_SITUACAO = '#39'2'#39
      'AND'
      
        '  --(((O_N.NUM_LIVROS <> 10 or O_N.NUM_LIVROS is null) AND I.COD' +
        '_OPERACAO is null) OR ((O_I.NUM_LIVROS <> 10 or O_I.NUM_LIVROS i' +
        's null) AND I.COD_OPERACAO is not null))'
      
        '  (((O_N.NUM_LIVROS <> 10) OR (O_N.NUM_LIVROS IS NULL)) OR ((O_I' +
        '.NUM_LIVROS <> 10) OR (O_I.NUM_LIVROS IS NULL)))'
      '--AND'
      
        '--  (((S.COD_SERIE_MODELO = '#39'55'#39') AND (O_N.IND_EMITE = '#39'F'#39')) OR ' +
        '(S.COD_SERIE_MODELO <> '#39'55'#39'))'
      'AND'
      '  S.COD_SERIE_MODELO <> '#39'06'#39)
    Variables.Data = {
      03000000030000000B0000003A44545F494E494349414C0C0000000000000000
      000000090000003A44545F46494E414C0C00000000000000000000000B000000
      3A434F445F46494C49414C030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000020000000C000000434F445F4F5045524143414F0100000000000D00
      0000444553435F4F5045524143414F010000000000}
    Session = DMOracle.DBCemapa
    Left = 176
    Top = 80
    object QReg400COD_OPERACAO: TFloatField
      FieldName = 'COD_OPERACAO'
    end
    object QReg400DESC_OPERACAO: TStringField
      FieldName = 'DESC_OPERACAO'
      Size = 50
    end
  end
  object QReg450: TOracleDataSet1
    SQL.Strings = (
      'select'
      '  DISTINCT'
      '  *'
      'FROM'
      '('
      'SELECT'
      '  DISTINCT'
      '  M.COD_MENSAGEM + 0.00 AS COD_MENSAGEM,'
      '  trim(M.DESC_MENSAGEM)  || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO1) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO2) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO3) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO4) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO5) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO6) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO7)  as DESC_MENSAGEM'
      'FROM'
      '  TB_NOTA_CAB'
      
        'INNER JOIN TB_MENSAGEM M ON M.COD_MENSAGEM = TB_NOTA_CAB.COD_MEN' +
        'SAGEM'
      
        'INNER JOIN TB_SERIE S ON (TB_NOTA_CAB.COD_SERIE = S.COD_SERIE AN' +
        'D TB_NOTA_CAB.COD_FILIAL = S.COD_FILIAL'
      #9'AND TB_NOTA_CAB.COD_SERIE_MODELO = S.COD_SERIE_MODELO)'
      
        'INNER JOIN TB_OPERACAO O ON TB_NOTA_CAB.COD_OPERACAO = O.COD_OPE' +
        'RACAO'
      'WHERE'
      '  TB_NOTA_CAB.COD_FILIAL = :COD_FILIAL'
      'AND'
      '  TB_NOTA_CAB.DT_RECEBIMENTO between :DATA_INI AND :DATA_FIN'
      '--AND'
      
        '--  ((S.COD_SERIE_MODELO = '#39'55'#39' AND O.IND_EMITE <> '#39'F'#39') OR (S.CO' +
        'D_SERIE_MODELO <> '#39'55'#39' AND O.IND_EMITE = '#39'F'#39'))'
      'AND'
      '  S.COD_SERIE_MODELO <> '#39'06'#39
      'AND'
      '  TB_NOTA_CAB.IND_SITUACAO <> '#39'3'#39
      'AND'
      '  O.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      '  (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      'UNION'
      'SELECT'
      '  DISTINCT'
      '  M.COD_MENSAGEM + 0.00 AS COD_MENSAGEM,'
      '  trim(M.DESC_MENSAGEM)  || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO1) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO2) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO3) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO4) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO5) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO6) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO7)  as DESC_MENSAGEM'
      'FROM'
      '  TB_NOTA_CAB'
      
        'INNER JOIN TB_MENSAGEM M ON M.COD_MENSAGEM = TB_NOTA_CAB.COD_MEN' +
        'SAGEM'
      
        'INNER JOIN TB_NOTA_ITEM ON TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_IT' +
        'EM.COD_NOTA_CAB'
      
        'INNER JOIN TB_PRODUTO ON TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.C' +
        'OD_PRODUTO'
      
        'INNER JOIN TB_SERIE ON (TB_NOTA_CAB.COD_SERIE = TB_SERIE.COD_SER' +
        'IE'
      #9'AND TB_NOTA_CAB.COD_SERIE_MODELO = TB_SERIE.COD_SERIE_MODELO)'
      
        'INNER JOIN TB_OPERACAO ON TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO' +
        '.COD_OPERACAO'
      'WHERE'
      
        '  ((TB_PRODUTO.IND_TIPO_PRODUTO = '#39'GAS'#39') OR (TB_PRODUTO.IND_TIPO' +
        '_PRODUTO = '#39'ENERGIA'#39'))'
      'AND'
      '  TB_OPERACAO.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      '  TB_NOTA_CAB.COD_FILIAL = :COD_FILIAL'
      'AND'
      '  TB_NOTA_CAB.DT_RECEBIMENTO between :DATA_INI AND :DATA_FIN'
      'AND'
      '  TB_SERIE.COD_SERIE_MODELO = '#39'06'#39
      'AND'
      '  TB_OPERACAO.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      
        '  (TB_OPERACAO.NUM_LIVROS <> 10 or TB_OPERACAO.NUM_LIVROS is nul' +
        'l)'
      'UNION'
      '('
      'SELECT'
      '  DISTINCT'
      '  M.COD_MENSAGEM + 0.00 AS COD_MENSAGEM,'
      '  trim(M.DESC_MENSAGEM)  || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO1) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO2) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO3) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO4) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO5) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO6) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO7)  as DESC_MENSAGEM'
      'FROM'
      '  TB_CONHECIMENTO,'
      '  TB_CADASTRO,'
      '  TB_OPERACAO,'
      '  TB_TRIBUTACAO,'
      '  TB_FILIAL,'
      '  TB_SERIE,'
      '  TB_MENSAGEM M'
      'WHERE'
      '  TB_CONHECIMENTO.COD_MENSAGEM = M.COD_MENSAGEM'
      '  AND'
      '  TB_CONHECIMENTO.COD_SERIE = TB_SERIE.COD_SERIE'
      '  AND'
      '  TB_CONHECIMENTO.COD_FILIAL = TB_SERIE.COD_FILIAL'
      '  AND'
      '  TB_CONHECIMENTO.COD_SERIE_MODELO = TB_SERIE.COD_SERIE_MODELO'
      '  AND'
      '  TB_CONHECIMENTO.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
      '  AND'
      '  TB_CONHECIMENTO.COD_TRIBUTACAO = TB_TRIBUTACAO.COD_TRIBUTACAO'
      '  AND'
      '  TB_CONHECIMENTO.COD_FILIAL = TB_FILIAL.COD_FILIAL'
      '  AND'
      '  TB_CONHECIMENTO.IND_SITUACAO <> '#39'1'#39
      'AND'
      '  TB_OPERACAO.IND_LIVRO_FISCAL = '#39'S'#39
      '  AND'
      '  TB_CONHECIMENTO.DT_RECEBIMENTO BETWEEN :DATA_INI AND :DATA_FIN'
      '  AND'
      '  TB_CONHECIMENTO.COD_FILIAL = :COD_FILIAL'
      'union'
      'SELECT'
      '  DISTINCT'
      '  M.COD_MENSAGEM + 0.00 AS COD_MENSAGEM,'
      '  trim(M.DESC_MENSAGEM)  || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO1) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO2) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO3) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO4) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO5) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO6) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO7)  as DESC_MENSAGEM'
      'FROM'
      '  TB_NOTA_ITEM I'
      'INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      'INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACAO'
      
        'INNER JOIN TB_SERIE ON (N.COD_SERIE = TB_SERIE.COD_SERIE AND TB_' +
        'SERIE.COD_FILIAL = N.COD_FILIAL'
      #9'AND N.COD_SERIE_MODELO = TB_SERIE.COD_SERIE_MODELO)'
      
        'INNER JOIN TB_TRIBUTACAO ON I.COD_TRIBUTACAO = TB_TRIBUTACAO.COD' +
        '_TRIBUTACAO'
      'INNER JOIN TB_FILIAL ON N.COD_FILIAL = TB_FILIAL.COD_FILIAL'
      
        'INNER JOIN TB_CADASTRO ON N.COD_CADASTRO = TB_CADASTRO.COD_CADAS' +
        'TRO'
      'INNER JOIN TB_MENSAGEM M ON N.COD_MENSAGEM = M.COD_MENSAGEM'
      'WHERE'
      '  N.IND_SITUACAO <> '#39'1'#39
      'AND'
      '  O.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      '  O.NUM_LIVROS = 10'
      'AND'
      '  N.COD_FILIAL = :COD_FILIAL'
      'AND'
      '  N.DT_RECEBIMENTO between :DATA_INI AND :DATA_FIN'
      ')'
      'union'
      'SELECT'
      '  DISTINCT'
      '  M.COD_MENSAGEM + 0.00 AS COD_MENSAGEM,'
      '  trim(M.DESC_MENSAGEM)  || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO1) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO2) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO3) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO4) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO5) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO6) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO7)  as DESC_MENSAGEM'
      'FROM'
      '  Tb_Nota_Cab,'
      '  Tb_Nota_Item,'
      '  Tb_Operacao,'
      '  TB_SERIE,'
      '  tb_mensagem m'
      'Where'
      '  tb_nota_cab.COD_MENSAGEM = M.COD_MENSAGEM'
      '  and'
      '  Tb_Nota_Cab.COD_NOTA_CAB = Tb_Nota_Item.COD_NOTA_CAB'
      '  And'
      '  Tb_Nota_Cab.COD_OPERACAO = Tb_Nota_Item.COD_OPERACAO'
      '  And'
      '  TB_NOTA_CAB.COD_SERIE = TB_SERIE.COD_SERIE'
      '  And'
      '  TB_NOTA_CAB.COD_FILIAL = TB_SERIE.COD_FILIAL'
      '  AND'
      '  TB_NOTA_CAB.COD_SERIE_MODELO = TB_SERIE.COD_SERIE_MODELO'
      '  AND'
      '  Tb_Nota_Cab.IND_SITUACAO <> '#39'1'#39
      '  And'
      '  Tb_Operacao.IND_TELECOMUNICACAO = '#39'S'#39
      '  And'
      '  Tb_Nota_Cab.COD_FILIAL = :COD_FILIAL'
      '  And'
      '  Tb_Nota_Cab.DT_RECEBIMENTO BETWEEN :DATA_INI AND :DATA_FIN'
      'AND'
      '  TB_OPERACAO.IND_LIVRO_FISCAL = '#39'S'#39
      ')'
      'ORDER BY'
      '  COD_MENSAGEM,'
      '  DESC_MENSAGEM'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '/*'
      'SELECT'
      '  DISTINCT'
      '  *'
      'FROM'
      '('
      'SELECT Distinct'
      '  TB_MENSAGEM.COD_MENSAGEM + 0.00 AS COD_MENSAGEM,'
      '  trim(TB_MENSAGEM.DESC_MENSAGEM)  || '#39'   '#39' ||'
      '  trim(DESC_COMPLEMENTO) || '#39'   '#39' ||'
      '  trim(DESC_COMPLEMENTO1) || '#39'   '#39' ||'
      '  trim(DESC_COMPLEMENTO2) || '#39'   '#39' ||'
      '  trim(DESC_COMPLEMENTO3) || '#39'   '#39' ||'
      '  trim(DESC_COMPLEMENTO4) || '#39'   '#39' ||'
      '  trim(DESC_COMPLEMENTO5) || '#39'   '#39' ||'
      '  trim(DESC_COMPLEMENTO6) || '#39'   '#39' ||'
      '  trim(DESC_COMPLEMENTO7)  as DESC_MENSAGEM'
      'FROM'
      '  TB_NOTA_ITEM'
      
        'INNER JOIN TB_NOTA_CAB ON TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITE' +
        'M.COD_NOTA_CAB'
      
        'INNER JOIN TB_OPERACAO ON TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO' +
        '.COD_OPERACAO'
      
        'INNER JOIN TB_SERIE ON (TB_NOTA_CAB.COD_SERIE = TB_SERIE.COD_SER' +
        'IE AND TB_SERIE.COD_FILIAL = TB_NOTA_CAB.COD_FILIAL)'
      
        'INNER JOIN TB_CADASTRO C ON TB_NOTA_CAB.COD_CADASTRO = C.COD_CAD' +
        'ASTRO'
      
        'INNER JOIN TB_MENSAGEM ON TB_NOTA_CAB.COD_MENSAGEM = TB_MENSAGEM' +
        '.COD_MENSAGEM'
      'LEFT JOIN TB_ESTADO E ON C.COD_ESTADO = E.COD_ESTADO'
      'LEFT JOIN TB_CIDADE I ON C.COD_CIDADE = I.COD_CIDADE'
      'LEFT JOIN TB_PAIS P ON C.COD_PAIS = P.COD_PAIS'
      'WHERE'
      '  TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      'AND'
      '  TB_OPERACAO.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      '  TB_NOTA_CAB.DT_RECEBIMENTO BETWEEN :DT_INICIAL AND :DT_FINAL'
      'AND'
      '  TB_NOTA_CAB.COD_FILIAL = :COD_FILIAL'
      'AND'
      
        '  ((TB_SERIE.COD_SERIE_MODELO = '#39'55'#39' AND TB_OPERACAO.IND_EMITE <' +
        '> '#39'F'#39') OR (TB_SERIE.COD_SERIE_MODELO <> '#39'55'#39'))'
      'AND'
      '  TB_SERIE.COD_SERIE_MODELO <> '#39'06'#39
      ''
      'UNION'
      ''
      'SELECT Distinct'
      '  TB_MENSAGEM.COD_MENSAGEM + 0.00,'
      '  trim(TB_MENSAGEM.DESC_MENSAGEM)  || '#39'   '#39' ||'
      '  trim(DESC_COMPLEMENTO) || '#39'   '#39' ||'
      '  trim(DESC_COMPLEMENTO1) || '#39'   '#39' ||'
      '  trim(DESC_COMPLEMENTO2) || '#39'   '#39' ||'
      '  trim(DESC_COMPLEMENTO3) || '#39'   '#39' ||'
      '  trim(DESC_COMPLEMENTO4) || '#39'   '#39' ||'
      '  trim(DESC_COMPLEMENTO5) || '#39'   '#39' ||'
      '  trim(DESC_COMPLEMENTO6) || '#39'   '#39' ||'
      '  trim(DESC_COMPLEMENTO7)  as DESC_MENSAGEM'
      'FROM'
      '  TB_NOTA_ITEM'
      
        'INNER JOIN TB_NOTA_CAB ON TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITE' +
        'M.COD_NOTA_ITEM'
      
        'INNER JOIN TB_OPERACAO ON TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO' +
        '.COD_OPERACAO'
      
        'INNER JOIN TB_PRODUTO ON TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.C' +
        'OD_PRODUTO'
      
        'INNER JOIN TB_CADASTRO C ON TB_NOTA_CAB.COD_TRANSPORTADOR = C.CO' +
        'D_CADASTRO'
      
        'INNER JOIN TB_MENSAGEM ON TB_NOTA_CAB.COD_MENSAGEM = TB_MENSAGEM' +
        '.COD_MENSAGEM'
      
        'INNER JOIN TB_SERIE ON (TB_NOTA_CAB.COD_SERIE = TB_SERIE.COD_SER' +
        'IE AND TB_SERIE.COD_FILIAL = TB_NOTA_CAB.COD_FILIAL)'
      'LEFT JOIN TB_ESTADO E ON C.COD_ESTADO = E.COD_ESTADO'
      'LEFT JOIN TB_CIDADE I ON C.COD_CIDADE = I.COD_CIDADE'
      'LEFT JOIN TB_PAIS P ON C.COD_PAIS = P.COD_PAIS'
      'WHERE'
      '  TB_NOTA_CAB.DT_RECEBIMENTO BETWEEN :DT_INICIAL AND :DT_FINAL'
      'AND'
      '  TB_NOTA_CAB.COD_FILIAL = :COD_FILIAL'
      'AND'
      '  TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'S'#39
      'AND'
      '  TB_NOTA_CAB.DESC_PLACA IS NOT NULL'
      'AND'
      '  TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      'AND'
      '  TB_NOTA_CAB.VAL_FRETE > 0'
      'AND'
      '  TB_OPERACAO.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      
        '  ((TB_SERIE.COD_SERIE_MODELO = '#39'55'#39' AND TB_OPERACAO.IND_EMITE <' +
        '> '#39'F'#39') OR (TB_SERIE.COD_SERIE_MODELO <> '#39'55'#39'))'
      'AND'
      '  TB_SERIE.COD_SERIE_MODELO <> '#39'06'#39
      ')'
      '*/'
      '')
    Variables.Data = {
      03000000030000000B0000003A434F445F46494C49414C030000000000000000
      000000090000003A444154415F494E490C000000000000000000000009000000
      3A444154415F46494E0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000020000000C000000434F445F4D454E534147454D0100000000000D00
      0000444553435F4D454E534147454D010000000000}
    Session = DMOracle.DBCemapa
    Left = 240
    Top = 80
    object QReg450COD_MENSAGEM: TFloatField
      FieldName = 'COD_MENSAGEM'
    end
    object QReg450DESC_MENSAGEM: TStringField
      FieldName = 'DESC_MENSAGEM'
      Size = 564
    end
  end
  object QReg500: TOracleDataSet1
    SQL.Strings = (
      'SELECT DISTINCT * FROM'
      '('
      'SELECT -- Inclus'#227'o'
      '  SYSDATE DT_ALT,'
      '  PC.NUM_PLANO_CONTA COD_CTA,'
      '  PC.DESC_NATUREZA_CONTA COD_NAT_CC,'
      '  DECODE(PS.NUM_GRAUS_CONTABIL, PC.NUM_GRAU, '#39'A'#39', '#39'S'#39') IND_CTA,'
      '  PC.NUM_GRAU NIVEL,'
      '  PC.DESC_PLANO_CONTA NOME_CTA,'
      '  PC.COD_PLANO_CONTA_REFERENCIAL COD_CTA_REF,'
      '  F.NUM_CGC CNPJ_EST'
      'FROM'
      '  TB_NOTA_ITEM I'
      'INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      'INNER JOIN TB_FILIAL F ON F.COD_FILIAL = N.COD_FILIAL'
      'INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO_CF = O.COD_OPERACAO'
      
        'INNER JOIN TB_PLANO_CONTA PC ON PC.NUM_PLANO_CONTA = DECODE(N.IN' +
        'D_ENTRADA_SAIDA, '#39'E'#39','
      '  O.COD_CONTABIL_PIS_CRED, O.COD_CONTABIL_PIS_DEB)  '
      
        'INNER JOIN TB_SERIE ON (N.COD_SERIE_CF = TB_SERIE.COD_SERIE AND ' +
        'TB_SERIE.COD_FILIAL = N.COD_FILIAL'
      '  AND N.COD_SERIE_MODELO_CF = TB_SERIE.COD_SERIE_MODELO)'
      'INNER JOIN TB_PARAM_SISTEMA PS ON 1 = 1'
      'WHERE'
      '  N.IND_SITUACAO = '#39'2'#39
      'AND'
      '  O.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      '  (O.NUM_LIVROS = 10)'
      'AND'
      '  N.COD_FILIAL IN :FILIAIS'
      'AND'
      '  N.DT_RECEBIMENTO between :DATA_INI AND :DATA_FIN '
      ''
      'UNION ALL'
      ''
      'SELECT'
      '  SYSDATE DT_ALT,'
      '  PC.NUM_PLANO_CONTA COD_CTA,'
      '  PC.DESC_NATUREZA_CONTA COD_NAT_CC,'
      '  DECODE(PS.NUM_GRAUS_CONTABIL, PC.NUM_GRAU, '#39'A'#39', '#39'S'#39') IND_CTA,'
      '  PC.NUM_GRAU NIVEL,'
      '  PC.DESC_PLANO_CONTA NOME_CTA,'
      '  PC.COD_PLANO_CONTA_REFERENCIAL COD_CTA_REF,'
      '  F.NUM_CGC CNPJ_EST'
      'FROM'
      '  TB_NOTA_ITEM I'
      'INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      'INNER JOIN TB_FILIAL F ON F.COD_FILIAL = N.COD_FILIAL'
      'INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACAO'
      
        'INNER JOIN TB_PLANO_CONTA PC ON PC.NUM_PLANO_CONTA = DECODE(N.IN' +
        'D_ENTRADA_SAIDA, '#39'E'#39','
      '  O.COD_CONTABIL_PIS_CRED, O.COD_CONTABIL_PIS_DEB)  '
      
        'INNER JOIN TB_SERIE ON (N.COD_SERIE = TB_SERIE.COD_SERIE AND TB_' +
        'SERIE.COD_FILIAL = N.COD_FILIAL)'
      'INNER JOIN TB_PARAM_SISTEMA PS ON 1 = 1'
      'WHERE'
      '  N.IND_SITUACAO = '#39'2'#39
      'AND'
      '  O.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      '  (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      'AND'
      '  N.COD_FILIAL IN :FILIAIS'
      'AND'
      '  N.DT_RECEBIMENTO between :DATA_INI AND :DATA_FIN '
      ''
      'UNION ALL'
      '  '
      'SELECT -- CONTA PIS CONHECIMENTO'
      '  SYSDATE DT_ALT,'
      '  PC.NUM_PLANO_CONTA COD_CTA,'
      '  PC.DESC_NATUREZA_CONTA COD_NAT_CC,'
      '  DECODE(PS.NUM_GRAUS_CONTABIL, PC.NUM_GRAU, '#39'A'#39', '#39'S'#39') IND_CTA,'
      '  PC.NUM_GRAU NIVEL,'
      '  PC.DESC_PLANO_CONTA NOME_CTA,'
      '  PC.COD_PLANO_CONTA_REFERENCIAL COD_CTA_REF,'
      '  F.NUM_CGC CNPJ_EST'
      'FROM'
      '  TB_CONHECIMENTO C'
      'INNER JOIN TB_FILIAL F ON F.COD_FILIAL = C.COD_FILIAL'
      'INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACAO'
      
        'INNER JOIN TB_PLANO_CONTA PC ON PC.NUM_PLANO_CONTA = DECODE(O.IN' +
        'D_TIPO_OPERACAO, '#39'E'#39','
      '  O.COD_CONTABIL_PIS_CRED, O.COD_CONTABIL_PIS_DEB)  '
      
        'INNER JOIN TB_SERIE ON (C.COD_SERIE = TB_SERIE.COD_SERIE AND TB_' +
        'SERIE.COD_FILIAL = C.COD_FILIAL)'
      'INNER JOIN TB_PARAM_SISTEMA PS ON 1 = 1'
      'WHERE'
      '  C.IND_SITUACAO = '#39'2'#39
      'AND'
      '  O.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      '  C.COD_FILIAL IN :FILIAIS'
      'AND'
      '  C.DT_RECEBIMENTO between :DATA_INI AND :DATA_FIN  '
      ''
      'UNION ALL'
      ''
      'SELECT -- CONTA COFINS CONHECIMENTO'
      '  SYSDATE DT_ALT,'
      '  PC.NUM_PLANO_CONTA COD_CTA,'
      '  PC.DESC_NATUREZA_CONTA COD_NAT_CC,'
      '  DECODE(PS.NUM_GRAUS_CONTABIL, PC.NUM_GRAU, '#39'A'#39', '#39'S'#39') IND_CTA,'
      '  PC.NUM_GRAU NIVEL,'
      '  PC.DESC_PLANO_CONTA NOME_CTA,'
      '  PC.COD_PLANO_CONTA_REFERENCIAL COD_CTA_REF,'
      '  F.NUM_CGC CNPJ_EST'
      'FROM'
      '  TB_CONHECIMENTO C'
      'INNER JOIN TB_FILIAL F ON F.COD_FILIAL = C.COD_FILIAL'
      'INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACAO'
      
        'INNER JOIN TB_PLANO_CONTA PC ON PC.NUM_PLANO_CONTA = DECODE(O.IN' +
        'D_TIPO_OPERACAO, '#39'E'#39','
      '  O.COD_CONTABIL_COFINS_CRED, O.COD_CONTABIL_COFINS_DEB)  '
      
        'INNER JOIN TB_SERIE ON (C.COD_SERIE = TB_SERIE.COD_SERIE AND TB_' +
        'SERIE.COD_FILIAL = C.COD_FILIAL)'
      'INNER JOIN TB_PARAM_SISTEMA PS ON 1 = 1'
      'WHERE'
      '  C.IND_SITUACAO = '#39'2'#39
      'AND'
      '  O.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      '  C.COD_FILIAL IN :FILIAIS'
      'AND'
      '  C.DT_RECEBIMENTO between :DATA_INI AND :DATA_FIN  '
      ''
      ''
      'UNION ALL'
      ''
      'SELECT'
      '  SYSDATE DT_ALT,'
      '  PC.NUM_PLANO_CONTA COD_CTA,'
      '  PC.DESC_NATUREZA_CONTA COD_NAT_CC,'
      '  DECODE(PS.NUM_GRAUS_CONTABIL, PC.NUM_GRAU, '#39'A'#39', '#39'S'#39') IND_CTA,'
      '  PC.NUM_GRAU NIVEL,'
      '  PC.DESC_PLANO_CONTA NOME_CTA,'
      '  PC.COD_PLANO_CONTA_REFERENCIAL COD_CTA_REF,'
      '  F.NUM_CGC CNPJ_EST'
      'FROM'
      '  TB_NOTA_ITEM I'
      'INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      'INNER JOIN TB_FILIAL F ON F.COD_FILIAL = N.COD_FILIAL'
      'INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACAO'
      
        'INNER JOIN TB_PLANO_CONTA PC ON PC.NUM_PLANO_CONTA = DECODE(N.IN' +
        'D_ENTRADA_SAIDA, '#39'E'#39','
      '  O.COD_CONTABIL_COFINS_CRED, O.COD_CONTABIL_COFINS_DEB)  '
      
        'INNER JOIN TB_SERIE ON (N.COD_SERIE = TB_SERIE.COD_SERIE AND TB_' +
        'SERIE.COD_FILIAL = N.COD_FILIAL)'
      'INNER JOIN TB_PARAM_SISTEMA PS ON 1 = 1'
      'WHERE'
      '  N.IND_SITUACAO = '#39'2'#39
      'AND'
      '  O.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      '  (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      'AND'
      '  N.COD_FILIAL IN :FILIAIS'
      'AND'
      '  N.DT_RECEBIMENTO between :DATA_INI AND :DATA_FIN '
      '  '
      'UNION ALL'
      ''
      'SELECT -- CONTA CREDITO PATRIMONIO DEPRECIACAO'
      '  SYSDATE DT_ALT,'
      '  PC.NUM_PLANO_CONTA COD_CTA,'
      '  PC.DESC_NATUREZA_CONTA COD_NAT_CC,'
      '  DECODE(PS.NUM_GRAUS_CONTABIL, PC.NUM_GRAU, '#39'A'#39', '#39'S'#39') IND_CTA,'
      '  PC.NUM_GRAU NIVEL,'
      '  PC.DESC_PLANO_CONTA NOME_CTA,'
      '  PC.COD_PLANO_CONTA_REFERENCIAL COD_CTA_REF,'
      '  F.NUM_CGC CNPJ_EST'
      'FROM'
      '  TB_PATRIMONIO_DEPRECIACAO PD'
      
        'INNER JOIN TB_PATRIMONIO_ITEM PI ON PD.COD_PATRIMONIO_ITEM = PI.' +
        'COD_PATRIMONIO_ITEM'
      'INNER JOIN TB_FILIAL F ON F.COD_FILIAL = PI.COD_FILIAL'
      
        'INNER JOIN TB_LANCTO_CONTABIL LC ON PD.COD_LANCTO_CONTABIL_CRED ' +
        '= LC.COD_LANCTO_CONTABIL'
      
        'INNER JOIN TB_PLANO_CONTA PC ON PC.COD_PLANO_CONTA = LC.COD_PLAN' +
        'O_CONTA'
      'INNER JOIN TB_PARAM_SISTEMA PS ON 1 = 1'
      'WHERE'
      '  PI.COD_FILIAL IN :FILIAIS'
      '  AND'
      '  PD.DT_DEPRECIACAO between :DATA_INI AND :DATA_FIN'
      '  '
      'UNION ALL'
      ''
      'SELECT -- CONTA DEBITO PATRIMONIO DEPRECIACAO'
      '  SYSDATE DT_ALT,'
      '  PC.NUM_PLANO_CONTA COD_CTA,'
      '  PC.DESC_NATUREZA_CONTA COD_NAT_CC,'
      '  DECODE(PS.NUM_GRAUS_CONTABIL, PC.NUM_GRAU, '#39'A'#39', '#39'S'#39') IND_CTA,'
      '  PC.NUM_GRAU NIVEL,'
      '  PC.DESC_PLANO_CONTA NOME_CTA,'
      '  PC.COD_PLANO_CONTA_REFERENCIAL COD_CTA_REF,'
      '  F.NUM_CGC CNPJ_EST'
      'FROM'
      '  TB_PATRIMONIO_DEPRECIACAO PD'
      
        'INNER JOIN TB_PATRIMONIO_ITEM PI ON PD.COD_PATRIMONIO_ITEM = PI.' +
        'COD_PATRIMONIO_ITEM'
      'INNER JOIN TB_FILIAL F ON F.COD_FILIAL = PI.COD_FILIAL'
      
        'INNER JOIN TB_LANCTO_CONTABIL LC ON PD.COD_LANCTO_CONTABIL_DEB =' +
        ' LC.COD_LANCTO_CONTABIL'
      
        'INNER JOIN TB_PLANO_CONTA PC ON PC.COD_PLANO_CONTA = LC.COD_PLAN' +
        'O_CONTA'
      'INNER JOIN TB_PARAM_SISTEMA PS ON 1 = 1'
      'WHERE'
      '  PI.COD_FILIAL IN :FILIAIS'
      '  AND'
      '  PD.DT_DEPRECIACAO between :DATA_INI AND :DATA_FIN '
      ''
      ''
      'UNION ALL'
      ''
      'SELECT -- CONTA CREDITO PATRIMONIO CIAP'
      '  SYSDATE DT_ALT,'
      '  PC.NUM_PLANO_CONTA COD_CTA,'
      '  PC.DESC_NATUREZA_CONTA COD_NAT_CC,'
      '  DECODE(PS.NUM_GRAUS_CONTABIL, PC.NUM_GRAU, '#39'A'#39', '#39'S'#39') IND_CTA,'
      '  PC.NUM_GRAU NIVEL,'
      '  PC.DESC_PLANO_CONTA NOME_CTA,'
      '  PC.COD_PLANO_CONTA_REFERENCIAL COD_CTA_REF,'
      '  F.NUM_CGC CNPJ_EST'
      'FROM'
      '  TB_CONTROLE_CREDITO_ICMS CC'
      
        'INNER JOIN TB_PATRIMONIO_ITEM PI ON CC.COD_PATRIMONIO_ITEM = PI.' +
        'COD_PATRIMONIO_ITEM'
      'INNER JOIN TB_FILIAL F ON F.COD_FILIAL = PI.COD_FILIAL'
      
        'INNER JOIN TB_LANCTO_CONTABIL LC ON CC.COD_LANCTO_CONTABIL_CRED ' +
        '= LC.COD_LANCTO_CONTABIL'
      
        'INNER JOIN TB_PLANO_CONTA PC ON PC.COD_PLANO_CONTA = LC.COD_PLAN' +
        'O_CONTA'
      'INNER JOIN TB_PARAM_SISTEMA PS ON 1 = 1'
      'WHERE'
      '  PI.COD_FILIAL IN :FILIAIS'
      '  AND'
      '  CC.DT_GERADO_CIAP between :DATA_INI AND :DATA_FIN '
      '  '
      'UNION ALL'
      ''
      'SELECT -- CONTA DEBITO PATRIMONIO CIAP'
      '  SYSDATE DT_ALT,'
      '  PC.NUM_PLANO_CONTA COD_CTA,'
      '  PC.DESC_NATUREZA_CONTA COD_NAT_CC,'
      '  DECODE(PS.NUM_GRAUS_CONTABIL, PC.NUM_GRAU, '#39'A'#39', '#39'S'#39') IND_CTA,'
      '  PC.NUM_GRAU NIVEL,'
      '  PC.DESC_PLANO_CONTA NOME_CTA,'
      '  PC.COD_PLANO_CONTA_REFERENCIAL COD_CTA_REF,'
      '  F.NUM_CGC CNPJ_EST'
      'FROM'
      '  TB_CONTROLE_CREDITO_ICMS CC'
      
        'INNER JOIN TB_PATRIMONIO_ITEM PI ON CC.COD_PATRIMONIO_ITEM = PI.' +
        'COD_PATRIMONIO_ITEM'
      'INNER JOIN TB_FILIAL F ON F.COD_FILIAL = PI.COD_FILIAL'
      
        'INNER JOIN TB_LANCTO_CONTABIL LC ON CC.COD_LANCTO_CONTABIL_DEB =' +
        ' LC.COD_LANCTO_CONTABIL'
      
        'INNER JOIN TB_PLANO_CONTA PC ON PC.COD_PLANO_CONTA = LC.COD_PLAN' +
        'O_CONTA'
      'INNER JOIN TB_PARAM_SISTEMA PS ON 1 = 1'
      'WHERE'
      '  PI.COD_FILIAL IN :FILIAIS'
      '  AND'
      '  CC.DT_GERADO_CIAP between :DATA_INI AND :DATA_FIN '
      '  '
      'UNION ALL'
      ''
      'SELECT -- CONTA CONT'#193'BIL DA OPERA'#199#195'O DA NOTA'
      '  SYSDATE DT_ALT,'
      '  PC.NUM_PLANO_CONTA COD_CTA,'
      '  PC.DESC_NATUREZA_CONTA COD_NAT_CC,'
      '  DECODE(PS.NUM_GRAUS_CONTABIL, PC.NUM_GRAU, '#39'A'#39', '#39'S'#39') IND_CTA,'
      '  PC.NUM_GRAU NIVEL,'
      '  PC.DESC_PLANO_CONTA NOME_CTA,'
      '  PC.COD_PLANO_CONTA_REFERENCIAL COD_CTA_REF,'
      '  F.NUM_CGC CNPJ_EST'
      'FROM'
      '  TB_NOTA_ITEM I'
      'INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      'INNER JOIN TB_FILIAL F ON F.COD_FILIAL = N.COD_FILIAL'
      'INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACAO'
      
        'INNER JOIN TB_PLANO_CONTA PC ON PC.NUM_PLANO_CONTA = O.COD_CONTA' +
        'BIL_NOTA_SPED_CONTRIB  '
      'INNER JOIN TB_PARAM_SISTEMA PS ON 1 = 1'
      'WHERE'
      '  N.IND_SITUACAO = '#39'2'#39
      'AND'
      '  O.IND_LIVRO_FISCAL = '#39'S'#39
      '--AND'
      '--  (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      'AND'
      '  N.COD_FILIAL IN :FILIAIS'
      'AND'
      '  N.DT_RECEBIMENTO between :DATA_INI AND :DATA_FIN '
      ''
      'UNION  ALL'
      ''
      'SELECT -- CONTA CONT'#193'BIL DA OPERACAO DO CONHECIMENTO'
      '  SYSDATE DT_ALT,'
      '  PC.NUM_PLANO_CONTA COD_CTA,'
      '  PC.DESC_NATUREZA_CONTA COD_NAT_CC,'
      '  DECODE(PS.NUM_GRAUS_CONTABIL, PC.NUM_GRAU, '#39'A'#39', '#39'S'#39') IND_CTA,'
      '  PC.NUM_GRAU NIVEL,'
      '  PC.DESC_PLANO_CONTA NOME_CTA,'
      '  PC.COD_PLANO_CONTA_REFERENCIAL COD_CTA_REF,'
      '  F.NUM_CGC CNPJ_EST'
      'FROM'
      '  TB_CONHECIMENTO C'
      'INNER JOIN TB_FILIAL F ON F.COD_FILIAL = C.COD_FILIAL'
      'INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACAO'
      
        'INNER JOIN TB_PLANO_CONTA PC ON PC.NUM_PLANO_CONTA = O.COD_CONTA' +
        'BIL_NOTA_SPED_CONTRIB'
      
        'INNER JOIN TB_SERIE ON (C.COD_SERIE = TB_SERIE.COD_SERIE AND TB_' +
        'SERIE.COD_FILIAL = C.COD_FILIAL)'
      'INNER JOIN TB_PARAM_SISTEMA PS ON 1 = 1'
      'WHERE'
      '  C.IND_SITUACAO = '#39'2'#39
      'AND'
      '  O.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      '  C.COD_FILIAL IN :FILIAIS'
      'AND'
      '  C.DT_RECEBIMENTO between :DATA_INI AND :DATA_FIN'
      ')')
    Variables.Data = {
      0300000003000000080000003A46494C49414953010000000400000028312900
      00000000090000003A444154415F494E490C0000000000000000000000090000
      003A444154415F46494E0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000080000000600000044545F414C540100000000000A000000434F445F
      4E41545F434301000000000007000000494E445F435441010000000000050000
      004E4956454C01000000000007000000434F445F435441010000000000080000
      004E4F4D455F4354410100000000000B000000434F445F4354415F5245460100
      0000000008000000434E504A5F455354010000000000}
    Session = DMOracle.DBCemapa
    Left = 24
    Top = 144
    object QReg500DT_ALT: TDateTimeField
      FieldName = 'DT_ALT'
    end
    object QReg500COD_PLANO_CONTA: TIntegerField
      FieldName = 'COD_PLANO_CONTA'
      Required = True
    end
    object QReg500COD_NAT_CC: TStringField
      FieldName = 'COD_NAT_CC'
      Size = 2
    end
    object QReg500IND_CTA: TStringField
      FieldName = 'IND_CTA'
      Size = 1
    end
    object QReg500NIVEL: TIntegerField
      FieldName = 'NIVEL'
      Required = True
    end
    object QReg500COD_CTA: TIntegerField
      FieldName = 'COD_CTA'
      Required = True
    end
    object QReg500NOME_CTA: TStringField
      FieldName = 'NOME_CTA'
      Required = True
      Size = 40
    end
    object QReg500COD_CTA_REF: TIntegerField
      FieldName = 'COD_CTA_REF'
    end
    object QReg500CNPJ_EST: TStringField
      FieldName = 'CNPJ_EST'
      Size = 18
    end
  end
  object QReg110: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      #9'F.COD_INC_TRIB,'
      #9'F.COD_APROPRIACAO_CRED,'
      #9'F.COD_TIPO_CONT,'
      #9'F.COD_CRITERIO_ESCRIT'
      'FROM'
      #9'TB_FILIAL F'
      'WHERE'
      #9'F.COD_FILIAL = :FILIAL')
    Variables.Data = {0300000001000000070000003A46494C49414C030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000040000000C000000434F445F494E435F545249420100000000000D00
      0000434F445F5449504F5F434F4E5401000000000014000000434F445F415052
      4F5052494143414F5F4352454401000000000013000000434F445F4352495445
      52494F5F455343524954010000000000}
    Session = DMOracle.DBCemapa
    Left = 96
    Top = 144
    object QReg110COD_INC_TRIB: TFloatField
      FieldName = 'COD_INC_TRIB'
    end
    object QReg110COD_TIPO_CONT: TFloatField
      FieldName = 'COD_TIPO_CONT'
    end
    object QReg110COD_APROPRIACAO_CRED: TIntegerField
      FieldName = 'COD_APROPRIACAO_CRED'
    end
    object QReg110COD_CRITERIO_ESCRIT: TIntegerField
      FieldName = 'COD_CRITERIO_ESCRIT'
    end
  end
  object QReg145: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  F.COD_INC_TRIB_PREV AS COD_INC_TRIB,'
      '  '#39#39' AS INFO_COMPL,'
      
        '  SUM(I.VAL_TOTAL + I.VAL_DESPESAS - I.VAL_DESCONTO) AS VL_REC_A' +
        'TIV,'
      '  '
      
        '  (SELECT SUM(IT.VAL_TOTAL) + SUM(IT.VAL_DESPESAS) - SUM(IT.VAL_' +
        'DESCONTO)'
      '    FROM TB_NOTA_ITEM IT'
      
        '      INNER JOIN TB_NOTA_CAB NT ON NT.COD_NOTA_CAB = IT.COD_NOTA' +
        '_CAB'
      
        '      INNER JOIN TB_OPERACAO OP ON NT.COD_OPERACAO = OP.COD_OPER' +
        'ACAO'
      '    WHERE'
      '      OP.IND_LIVRO_FISCAL = '#39'S'#39
      '      AND'
      '      (OP.NUM_LIVROS <> 10 or OP.NUM_LIVROS is null)'
      '      AND'
      '      OP.IND_COMPRAS <> '#39'D'#39
      '      AND'
      '      NT.IND_SITUACAO = 2 '
      '      AND'
      '      NT.IND_ENTRADA_SAIDA = '#39'S'#39'      '
      '      AND'
      '      NT.COD_FILIAL = :FILIAL'
      '      AND'
      '      NT.DT_EMISSAO BETWEEN :DT_INI AND :DT_FIN) AS VL_REC_TOT,'
      '      '
      
        '  ((SELECT SUM(IT.VAL_TOTAL) + SUM(IT.VAL_DESPESAS) - SUM(IT.VAL' +
        '_DESCONTO)'
      '    FROM TB_NOTA_ITEM IT'
      
        '      INNER JOIN TB_NOTA_CAB NT ON NT.COD_NOTA_CAB = IT.COD_NOTA' +
        '_CAB'
      
        '      INNER JOIN TB_OPERACAO OP ON NT.COD_OPERACAO = OP.COD_OPER' +
        'ACAO'
      '    WHERE'
      '      OP.IND_LIVRO_FISCAL = '#39'S'#39
      '      AND'
      '      (OP.NUM_LIVROS <> 10 or OP.NUM_LIVROS is null)'
      '      AND'
      '      NT.IND_SITUACAO = 2 '
      '      AND'
      '      NT.IND_ENTRADA_SAIDA = '#39'S'#39'      '
      '      AND'
      '      NT.DT_EMISSAO BETWEEN :DT_INI AND :DT_FIN ) - '
      
        '  (SUM(I.VAL_TOTAL + I.VAL_DESPESAS - I.VAL_DESCONTO))) AS VL_RE' +
        'C_DEMAIS_ATIV'
      'FROM'
      '  TB_NOTA_ITEM I'
      '  INNER JOIN TB_NOTA_CAB N ON I.COD_NOTA_CAB = N.COD_NOTA_CAB'
      '  INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO  '
      '  INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL'
      '  INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACAO'
      
        '  INNER JOIN TB_ATIVIDADE_CONTRIB A ON TRIM(P.NUM_GENERO_NCM) LI' +
        'KE TRIM(A.COD_NCM)||'#39'%'#39
      'WHERE'
      '  O.IND_LIVRO_FISCAL = '#39'S'#39
      '  AND'
      '  (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      '  AND'
      '  O.IND_COMPRAS <> '#39'D'#39
      '  AND'
      '  N.IND_SITUACAO = 2'
      '  AND'
      '  N.IND_ENTRADA_SAIDA = '#39'S'#39
      '  AND'
      '  F.COD_INC_TRIB_PREV IS NOT NULL'
      '  AND'
      '  F.COD_FILIAL = :FILIAL'
      '  AND'
      '  N.DT_EMISSAO BETWEEN :DT_INI AND :DT_FIN'
      'GROUP BY '
      '  F.COD_INC_TRIB_PREV,'
      '  '#39#39)
    Variables.Data = {
      0300000002000000070000003A44545F494E490C000000000000000000000007
      0000003A44545F46494E0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000050000000C000000434F445F494E435F545249420100000000000B00
      0000564C5F5245435F4154495601000000000012000000564C5F5245435F4445
      4D4149535F415449560100000000000A000000494E464F5F434F4D504C010000
      0000000A000000564C5F5245435F544F54010000000000}
    Session = DMOracle.DBCemapa
    Left = 168
    Top = 144
    object QReg145COD_INC_TRIB: TIntegerField
      FieldName = 'COD_INC_TRIB'
    end
    object QReg145VL_REC_ATIV: TFloatField
      FieldName = 'VL_REC_ATIV'
    end
    object QReg145VL_REC_DEMAIS_ATIV: TFloatField
      FieldName = 'VL_REC_DEMAIS_ATIV'
    end
    object QReg145INFO_COMPL: TStringField
      FieldName = 'INFO_COMPL'
      Size = 1
    end
    object QReg145VL_REC_TOT: TFloatField
      FieldName = 'VL_REC_TOT'
    end
  end
  object CDS145: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 240
    Top = 144
    Data = {
      690000009619E0BD01000000180000000400000000000300000069000A564C5F
      5245435F544F5408000400000000000B564C5F5245435F415449560800040000
      0000000A434F445F46494C49414C04000100000000000C434F445F494E435F54
      52494204000100000000000000}
    object CDS145VL_REC_TOT: TFloatField
      FieldName = 'VL_REC_TOT'
    end
    object CDS145VL_REC_ATIV: TFloatField
      FieldName = 'VL_REC_ATIV'
    end
    object CDS145COD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
    end
    object CDS145COD_INC_TRIB: TIntegerField
      FieldName = 'COD_INC_TRIB'
    end
  end
  object DS145: TDataSource
    DataSet = CDS145
    Left = 240
    Top = 200
  end
  object QReg111: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '    SUM(REC_BRU_NCUM_TRIB_MI) AS REC_BRU_NCUM_TRIB_MI,'
      '    SUM(REC_BRU_NCUM_NT_MI) AS REC_BRU_NCUM_NT_MI,'
      '    SUM(REC_BRU_NCUM_EXP) AS REC_BRU_NCUM_EXP,'
      '    SUM(REC_BRU_CUM) AS REC_BRU_CUM,'
      '    SUM(REC_BRU_TOTAL) AS REC_BRU_TOTAL'
      'FROM('
      ''
      'SELECT'
      'CASE'
      
        '    WHEN (INC_TRIB = '#39'NCUM'#39') AND (CST_PIS IN (50,53)) THEN --REC' +
        'EITA N'#195'O CUMULATIVA TRIBUTADA EXCLUSIVAMENTE NO MERCADO INTERNO'
      '        VAL_BC'
      '    ELSE'
      '        0'
      'END AS REC_BRU_NCUM_TRIB_MI,'
      'CASE'
      
        '    WHEN (INC_TRIB = '#39'NCUM'#39') AND (CST_PIS IN (51)) THEN --RECEIT' +
        'A N'#195'O CUMULATIVA N'#195'O TRIBUTADA EXCLUSIVAMENTE NO MERCADO INTERNO'
      '        VAL_BC'
      '    ELSE'
      '        0'
      'END AS REC_BRU_NCUM_NT_MI,'
      'CASE'
      
        '    WHEN (INC_TRIB = '#39'NCUM'#39') AND (CST_PIS IN (52)) THEN --RECEIT' +
        'A N'#195'O CUMULATIVA VINCULADA EXCLUSIVAMENTE A RECEITA DE EXPORTA'#199#195 +
        'O'
      '        VAL_BC'
      '    ELSE'
      '        0'
      'END AS REC_BRU_NCUM_EXP,'
      'CASE '
      
        '    WHEN (INC_TRIB = '#39'CUM'#39') AND (CST_PIS IN ('#39'50'#39','#39'51'#39','#39'52'#39','#39'53'#39 +
        ','#39'54'#39','#39'55'#39','#39'56'#39')) THEN -- RECEITA N'#195'O CUMULATIVA'
      '        VAL_BC'
      '    ELSE'
      '        0    '
      'END AS REC_BRU_CUM,'
      'CASE '
      '    WHEN CST_PIS NOT IN ('#39'70'#39','#39'71'#39','#39'72'#39','#39'73'#39','#39'74'#39') THEN'
      '        VAL_BC '
      '    ELSE'
      '        0'
      'END AS REC_BRU_TOTAL'
      ''
      'FROM'
      '('
      ''
      ''
      '-- SQL NOTAS'
      'SELECT DISTINCT'
      '  INC_TRIB,'
      '  CST_COFINS,'
      '  CST_PIS,'
      '  '
      '  TIPO,'
      '  '
      '  SUM('
      '    CASE '
      
        '      WHEN (IND_PIS_COFINS_RETIDO = '#39'SIM'#39') OR (CST_PIS IS NULL) ' +
        'THEN'
      '        0'
      '        --VAL_BC'
      '      ELSE'
      '        VAL_BC'
      '    END'
      '  ) AS VAL_BC,'
      '  '
      '  TRUNC('
      '    SUM('
      '      CASE'
      '        WHEN IND_PIS_COFINS_RETIDO = '#39'SIM'#39' THEN'
      '          0'
      '          --VAL_PIS'
      '        ELSE'
      '          VAL_PIS + NVL(VAL_PIS_IMPOSTO, 0)'
      '      END'
      '    )'
      '  ,2) AS VAL_PIS,'
      '  '
      '  TRUNC('
      '    SUM('
      '      CASE'
      '        WHEN IND_PIS_COFINS_RETIDO = '#39'SIM'#39' THEN'
      '          0'
      '          --VAL_COFINS'
      '        ELSE'
      '          VAL_COFINS + NVL(VAL_COFINS_IMPOSTO, 0)'
      '      END'
      '    )'
      '  ,2) AS VAL_COFINS'
      '  '
      'FROM('
      '  SELECT'
      '    '#39'NCUM'#39' AS INC_TRIB,'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    NVL(I.COD_CST_COFINS,P.COD_CST_COFINS) CST_COFINS,'
      '    NVL(I.COD_CST_PIS,P.COD_CST_PIS) CST_PIS,       '
      '    '#39'NOTAS'#39' AS TIPO,'
      '    '
      '    DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      SUM(I.VAL_TOTAL*O.PERC_BASE_PIS/100)/* + SUM(I.VAL_DESPESA' +
        'S) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)*/),    '
      '      SUM(I.VAL_BC_DI)) AS VAL_BC,'
      '    '
      '    SUM(I.VAL_PIS) AS VAL_PIS,    '
      '    (SELECT '
      '      NVL(NIS.VAL_IMPOSTO, 0) '
      '    FROM '
      '      TB_NOTA_IMPOSTO_SERVICO NIS '
      
        '        INNER JOIN TB_IMPOSTO IMP ON NIS.COD_IMPOSTO = IMP.COD_I' +
        'MPOSTO '
      '          AND IMP.DESC_IMPOSTO LIKE '#39'%PIS%'#39
      '    WHERE '
      '      NIS.COD_NOTA_CAB = N.COD_NOTA_CAB) AS VAL_PIS_IMPOSTO,'
      '    SUM(I.VAL_CONFINS) AS VAL_COFINS,'
      '    (SELECT '
      '      NVL(NIS.VAL_IMPOSTO, 0) '
      '    FROM '
      '      TB_NOTA_IMPOSTO_SERVICO NIS '
      
        '        INNER JOIN TB_IMPOSTO IMP ON NIS.COD_IMPOSTO = IMP.COD_I' +
        'MPOSTO '
      '          AND IMP.DESC_IMPOSTO LIKE '#39'%COFINS%'#39
      '    WHERE '
      '      NIS.COD_NOTA_CAB = N.COD_NOTA_CAB) AS VAL_COFINS_IMPOSTO'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_PIS, -1) >= 0 AND NVL(O.PERC_BASE_CO' +
        'FINS,-1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO  ' +
        '      '
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O'
      '  WHERE'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.IND_ENTRADA_SAIDA = '#39'E'#39
      '    AND'
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '  GROUP BY'
      '    '#39'NCUM'#39','
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    NVL(I.COD_CST_COFINS,P.COD_CST_COFINS),'
      '    NVL(I.COD_CST_PIS,P.COD_CST_PIS),       '
      '    '#39'NOTAS'#39','
      '    N.COD_NOTA_CAB,'
      '    PS.PERC_PIS,'
      '    PS.PERC_COFINS,'
      '    O.PERC_BASE_PIS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)'
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --CONHECIMENTO'
      '    '#39'NCUM'#39' AS INC_TRIB,'
      '    CAD.IND_PIS_COFINS_RETIDO,'
      '    C.COD_SERIE_MODELO,'
      '    NVL(C.COD_CST_COFINS,'#39'NI'#39') CST_COFINS,'
      '    NVL(C.COD_CST_PIS,'#39'NI'#39') CST_PIS,    '
      '    '#39'FRETES'#39' AS TIPO,'
      '    '
      '    DECODE(NVL(/*C.PERC_DESCONTO_FRETE*/0,0), 0,'
      '      DECODE(O.PERC_BASE_PIS,0,0,'
      '      (C.VAL_FRETE*O.PERC_BASE_PIS/100)),'
      '      (DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      (C.VAL_FRETE*O.PERC_BASE_PIS/100)) * C.PERC_DESCONTO_FRETE' +
        ' / 100)) AS VAL_BC,'
      '      '
      '    C.VAL_PIS,'
      '    0 AS VAL_PIS_IMPOSTO,'
      '    C.VAL_COFINS,'
      '    0 AS VAL_COFINS_IMPOSTO'
      '  FROM'
      '    TB_CONHECIMENTO C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_PIS, -1) >= 0 AND NVL(O.PERC_BASE_CO' +
        'FINS,-1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON C.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON C.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      
        '      INNER JOIN TB_CADASTRO CAD ON C.COD_CADASTRO = CAD.COD_CAD' +
        'ASTRO'
      '  WHERE'
      '    C.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    O.IND_TIPO_OPERACAO = '#39'E'#39
      '    AND'
      '    C.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN  '
      '  '
      '  UNION ALL'
      '  '
      '  SELECT --CONHECIMENTO FRETE'
      '    '#39'NCUM'#39' AS INC_TRIB,'
      '    CAD.IND_PIS_COFINS_RETIDO,'
      '    C.COD_SERIE_MODELO,'
      '    '#39'NI'#39' AS CST_COFINS,'
      '    '#39'NI'#39' AS CST_PIS,    '
      '    '#39'FRETES'#39' AS TIPO,'
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      
        '    (C.VAL_FRETE*O.PERC_BASE_PIS/100) /*+ NVL(C.VAL_PEDAGIO,0)*/' +
        ') AS VAL_BC,'
      '    C.VAL_PIS,'
      '    0 AS VAL_PIS_IMPOSTO,'
      '    C.VAL_COFINS,'
      '    0 AS VAL_COFINS_IMPOSTO'
      '  FROM'
      '    TB_CONHECIMENTO_FRETE C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_PIS, -1) >= 0 AND NVL(O.PERC_BASE_CO' +
        'FINS,-1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON C.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON C.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      
        '      INNER JOIN TB_CADASTRO CAD ON C.COD_CADASTRO = CAD.COD_CAD' +
        'ASTRO'
      '  WHERE'
      '    C.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    O.IND_TIPO_OPERACAO = '#39'E'#39
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    C.COD_FILIAL IN :FILIAIS'
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --N'
      '    '#39'NCUM'#39' AS INC_TRIB,'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    NVL(I.COD_CST_COFINS,P.COD_CST_COFINS) CST_COFINS,'
      '    NVL(I.COD_CST_PIS,P.COD_CST_PIS) CST_PIS,    '
      '    '#39'FRETES'#39' AS TIPO,'
      '    '
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      SUM((I.VAL_TOTAL*O.PERC_BASE_PIS/100)) /*+ SUM(I.VAL_DESPE' +
        'SAS) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)*/) AS VAL_BC,'
      '    '
      '    SUM(I.VAL_PIS) VAL_PIS,'
      '    SUM(0) AS VAL_PIS_IMPOSTO,'
      '    SUM(I.VAL_CONFINS) VAL_COFINS,'
      '    SUM(0) AS VAL_COFINS_IMPOSTO'
      '  FROM'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_PIS, -1) >= 0 AND NVL(O.PERC_BASE_CO' +
        'FINS,-1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O'
      '  WHERE'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    O.NUM_LIVROS = 10'
      '    AND'
      '    N.IND_ENTRADA_SAIDA = '#39'E'#39
      '    AND'
      '    N.IND_TIPO_FRETE = '#39'FOB'#39
      '    AND'
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '  GROUP BY'
      '    '#39'NCUM'#39','
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    NVL(I.COD_CST_COFINS,P.COD_CST_COFINS),'
      '    NVL(I.COD_CST_PIS,P.COD_CST_PIS),'
      '    '#39'FRETES'#39','
      '    O.PERC_BASE_PIS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)'
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --I'
      '    '#39'NCUM'#39' AS INC_TRIB,'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    DECODE(O.IND_TIPO_OPERACAO, '#39'E'#39','#39'50'#39','#39'01'#39') AS CST_COFINS,'
      '    DECODE(O.IND_TIPO_OPERACAO, '#39'E'#39','#39'50'#39','#39'01'#39') AS CST_PIS,'
      '    '#39'FRETES'#39' AS TIPO,'
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      '      (N.VAL_FRETE*O.PERC_BASE_PIS/100)) AS VL_BC,'
      '    N.VAL_FRETE * PS.PERC_PIS / 100 AS VAL_PIS,'
      '    0 AS VAL_PIS_IMPOSTO,'
      '    N.VAL_FRETE * PS.PERC_COFINS / 100 AS VAL_COFINS,'
      '    0 AS VAL_COFINS_IMPOSTO'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO_CF = O.COD_OPER' +
        'ACAO'
      
        '        AND NVL(O.PERC_BASE_PIS, -1) >= 0 AND NVL(O.PERC_BASE_CO' +
        'FINS,-1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO_CF = S' +
        'M.COD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O'
      '  WHERE'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.NUM_CONHECIMENTO_FRETE IS NOT NULL'
      '    AND'
      '    N.IND_ENTRADA_SAIDA = '#39'E'#39
      '    AND'
      '    N.IND_TIPO_FRETE = '#39'FOB'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    '
      '    UNION ALL'
      '    '
      '    SELECT --CUPOM FISCAL'
      '    '#39'NCUM'#39' AS INC_TRIB,'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    NVL(I.COD_CST_COFINS,P.COD_CST_COFINS) CST_COFINS,'
      '    NVL(I.COD_CST_PIS,P.COD_CST_PIS) CST_PIS,        '
      '    '#39'CUPOM FISCAL'#39' AS TIPO,     '
      '    '
      '    DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      SUM(I.VAL_TOTAL*O.PERC_BASE_PIS/100) /*+ SUM(I.VAL_DESPESA' +
        'S) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)*/),    '
      '      SUM(I.VAL_BC_DI)) AS VAL_BC,   '
      '    '
      '    SUM(I.VAL_PIS) AS VAL_PIS,'
      '    SUM(0) AS VAL_PIS_IMPOSTO,'
      '    SUM(I.VAL_CONFINS) AS VAL_COFINS,'
      '    SUM(0) AS VAL_COFINS_IMPOSTO'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_PIS, -1) >= 0 AND NVL(O.PERC_BASE_CO' +
        'FINS,-1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO  ' +
        '      '
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O'
      '  WHERE'
      '    (O.IND_LIVRO_FISCAL = '#39'N'#39' AND O.IND_CUPOM_FISCAL = '#39'S'#39')'
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.IND_ENTRADA_SAIDA = '#39'E'#39
      '    AND'
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '  GROUP BY'
      '    '#39'NCUM'#39','
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    NVL(I.COD_CST_COFINS,P.COD_CST_COFINS),'
      '    NVL(I.COD_CST_PIS,P.COD_CST_PIS),       '
      '    '#39'CUPOM FISCAL'#39','
      '    N.COD_NOTA_CAB,'
      '    PS.PERC_PIS,'
      '    PS.PERC_COFINS,'
      '    O.PERC_BASE_PIS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)'
      '    '
      '    '
      '    UNION ALL --NOTAS REGIME CUMULATIVO (LUCRO PRESUMIDO) '
      '    '
      '    '
      '    SELECT '
      '    '#39'CUM'#39' AS INC_TRIB,'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    NVL(I.COD_CST_COFINS,P.COD_CST_COFINS) CST_COFINS,'
      '    NVL(I.COD_CST_PIS,P.COD_CST_PIS) CST_PIS,    '
      '    '#39'NOTAS'#39' AS TIPO,     '
      '    '
      '    /*DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      SUM(I.VAL_TOTAL*O.PERC_BASE_PIS/100) - SUM(I.VAL_IPI) - SU' +
        'M(I.VAL_ICMS_SUBST)),    '
      '    SUM(I.VAL_BC_DI)) AS VAL_BC,*/'
      '    '
      '    DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_PIS,0,0,'
      '      SUM(I.VAL_TOTAL*O.PERC_BASE_PIS/100)),    '
      '    SUM(I.VAL_BC_DI)) AS VAL_BC,'
      '    '
      '    /*DECODE('#39'D'#39','
      
        '      (SELECT '#39'D'#39' FROM DUAL WHERE '#39'D'#39' IN((SELECT IND_VENDAS FROM' +
        ' TB_OPERACAO WHERE COD_OPERACAO = N.COD_OPERACAO))),'
      '      SUM(I.VAL_TOTAL*O.PERC_BASE_PIS/100) * -1,'
      '      SUM(I.VAL_TOTAL*O.PERC_BASE_PIS/100)) AS VAL_BC,*/'
      '    '
      '    SUM(I.VAL_PIS) AS VAL_PIS,'
      '    (SELECT '
      '      NVL(NIS.VAL_IMPOSTO, 0) '
      '    FROM '
      '      TB_NOTA_IMPOSTO_SERVICO NIS '
      
        '        INNER JOIN TB_IMPOSTO IMP ON NIS.COD_IMPOSTO = IMP.COD_I' +
        'MPOSTO '
      '          AND IMP.DESC_IMPOSTO LIKE '#39'%PIS%'#39
      '    WHERE '
      '      NIS.COD_NOTA_CAB = N.COD_NOTA_CAB) AS VAL_PIS_IMPOSTO,'
      '    SUM(I.VAL_CONFINS) AS VAL_COFINS,'
      '    (SELECT '
      '      NVL(NIS.VAL_IMPOSTO, 0) '
      '    FROM '
      '      TB_NOTA_IMPOSTO_SERVICO NIS '
      
        '        INNER JOIN TB_IMPOSTO IMP ON NIS.COD_IMPOSTO = IMP.COD_I' +
        'MPOSTO '
      '          AND IMP.DESC_IMPOSTO LIKE '#39'%COFINS%'#39
      '    WHERE '
      '      NIS.COD_NOTA_CAB = N.COD_NOTA_CAB) AS VAL_COFINS_IMPOSTO'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_PIS, -1) >= 0 AND NVL(O.PERC_BASE_CO' +
        'FINS,-1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO  ' +
        '      '
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 2'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O'
      '  WHERE'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.IND_ENTRADA_SAIDA = '#39'E'#39
      '    AND'
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '  GROUP BY'
      '    '#39'CUM'#39','
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    NVL(I.COD_CST_COFINS,P.COD_CST_COFINS),'
      '    NVL(I.COD_CST_PIS,P.COD_CST_PIS),    '
      '    '#39'NOTAS'#39','
      '    IND_COMPRAS,'
      '    IND_VENDAS,'
      '    N.COD_OPERACAO,'
      '    N.COD_NOTA_CAB,'
      '    PS.PERC_PIS,'
      '    PS.PERC_COFINS,'
      '    O.PERC_BASE_PIS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)'
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --CONHECIMENTO'
      '    '#39'CUM'#39' AS INC_TRIB,'
      '    CAD.IND_PIS_COFINS_RETIDO,'
      '    C.COD_SERIE_MODELO,'
      '    NVL(C.COD_CST_COFINS,'#39'NI'#39') CST_COFINS,'
      '    NVL(C.COD_CST_PIS,'#39'NI'#39') CST_PIS,    '
      '    '#39'FRETES'#39' AS TIPO,'
      '    '
      '    (C.VAL_FRETE*O.PERC_BASE_PIS/100) AS VAL_BC, '
      '      '
      '    C.VAL_PIS,'
      '    0 AS VAL_PIS_IMPOSTO,'
      '    C.VAL_COFINS,'
      '    0 AS VAL_COFINS_IMPOSTO'
      '  FROM'
      '    TB_CONHECIMENTO C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_PIS, -1) >= 0 AND NVL(O.PERC_BASE_CO' +
        'FINS,-1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON C.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON C.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 2'
      
        '      INNER JOIN TB_CADASTRO CAD ON C.COD_CADASTRO = CAD.COD_CAD' +
        'ASTRO'
      '  WHERE'
      '    C.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    O.IND_TIPO_OPERACAO = '#39'E'#39
      '    AND    '
      '    C.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN  '
      '  '
      '  UNION ALL'
      '  '
      '  SELECT --CONHECIMENTO FRETE'
      '    '#39'CUM'#39' AS INC_TRIB,'
      '    CAD.IND_PIS_COFINS_RETIDO,'
      '    C.COD_SERIE_MODELO,'
      '    '#39'NI'#39' AS CST_COFINS,'
      '    '#39'NI'#39' AS CST_PIS,    '
      '    '#39'FRETES'#39' AS TIPO,'
      '    (C.VAL_FRETE*O.PERC_BASE_PIS/100) AS VAL_BC,'
      '    C.VAL_PIS,'
      '    0 AS VAL_PIS_IMPOSTO,'
      '    C.VAL_COFINS,'
      '    0 AS VAL_COFINS_IMPOSTO'
      '  FROM'
      '    TB_CONHECIMENTO_FRETE C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_PIS, -1) >= 0 AND NVL(O.PERC_BASE_CO' +
        'FINS,-1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON C.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON C.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 2'
      
        '      INNER JOIN TB_CADASTRO CAD ON C.COD_CADASTRO = CAD.COD_CAD' +
        'ASTRO'
      '  WHERE'
      '    C.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    O.IND_TIPO_OPERACAO = '#39'E'#39
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    C.COD_FILIAL IN :FILIAIS'
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --N'
      '    '#39'CUM'#39' AS INC_TRIB,'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    NVL(I.COD_CST_COFINS,P.COD_CST_COFINS) CST_COFINS,'
      '    NVL(I.COD_CST_PIS,P.COD_CST_PIS) CST_PIS,'
      '    '#39'FRETES'#39' AS TIPO,'
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      '      SUM((I.VAL_TOTAL*O.PERC_BASE_PIS/100))) AS VAL_BC,'
      '    SUM(I.VAL_PIS) VAL_PIS,'
      '    SUM(0) AS VAL_PIS_IMPOSTO,'
      '    SUM(I.VAL_CONFINS) VAL_COFINS,'
      '    SUM(0) AS VAL_COFINS_IMPOSTO'
      '  FROM'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_PIS, -1) >= 0 AND NVL(O.PERC_BASE_CO' +
        'FINS,-1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 2'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O'
      '  WHERE'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    O.NUM_LIVROS = 10'
      '    AND'
      '    N.IND_ENTRADA_SAIDA = '#39'E'#39
      '    AND'
      '    N.IND_TIPO_FRETE = '#39'FOB'#39
      '    AND'
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '  GROUP BY'
      '    '#39'CUM'#39','
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    NVL(I.COD_CST_COFINS,P.COD_CST_COFINS),'
      '    NVL(I.COD_CST_PIS,P.COD_CST_PIS),'
      '    N.IND_ENTRADA_SAIDA,'
      '    '#39'FRETES'#39','
      '    O.PERC_BASE_PIS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)'
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --I'
      '    '#39'CUM'#39' AS INC_TRIB,'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    DECODE(O.IND_TIPO_OPERACAO, '#39'E'#39','#39'50'#39','#39'01'#39') AS CST_COFINS,'
      '    DECODE(O.IND_TIPO_OPERACAO, '#39'E'#39','#39'50'#39','#39'01'#39') AS CST_PIS,'
      '    '#39'FRETES'#39' AS TIPO,'
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      '    (N.VAL_FRETE*O.PERC_BASE_PIS/100)) AS VL_BC,'
      '    N.VAL_FRETE * PS.PERC_PIS / 100 AS VAL_PIS,'
      '    0 AS VAL_PIS_IMPOSTO,'
      '    N.VAL_FRETE * PS.PERC_COFINS / 100 AS VAL_COFINS,'
      '    0 AS VAL_COFINS_IMPOSTO'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO_CF = O.COD_OPER' +
        'ACAO'
      
        '        AND NVL(O.PERC_BASE_PIS, -1) >= 0 AND NVL(O.PERC_BASE_CO' +
        'FINS,-1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO_CF = S' +
        'M.COD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 2'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O'
      '  WHERE'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.NUM_CONHECIMENTO_FRETE IS NOT NULL'
      '    AND'
      '    N.IND_ENTRADA_SAIDA = '#39'E'#39
      '    AND'
      '    N.IND_TIPO_FRETE = '#39'FOB'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '  '
      '  UNION ALL'
      '  '
      '  SELECT  '
      '    '#39'CUM'#39' AS INC_TRIB,'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    NVL(I.COD_CST_COFINS,P.COD_CST_COFINS) CST_COFINS,'
      '    NVL(I.COD_CST_PIS,P.COD_CST_PIS) CST_PIS,    '
      '    '#39'CUPOM FISCAL'#39' AS TIPO,     '
      '    '
      '    /*DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      SUM(I.VAL_TOTAL*O.PERC_BASE_PIS/100) - SUM(I.VAL_IPI) - SU' +
        'M(I.VAL_ICMS_SUBST)),    '
      '    SUM(I.VAL_BC_DI)) AS VAL_BC,*/'
      '    '
      '    DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_PIS,0,0,'
      '      SUM(I.VAL_TOTAL*O.PERC_BASE_PIS/100)),    '
      '    SUM(I.VAL_BC_DI)) AS VAL_BC,'
      '    '
      '    /*DECODE('#39'D'#39','
      
        '      (SELECT '#39'D'#39' FROM DUAL WHERE '#39'D'#39' IN((SELECT IND_VENDAS FROM' +
        ' TB_OPERACAO WHERE COD_OPERACAO = N.COD_OPERACAO))),'
      '      SUM(I.VAL_TOTAL*O.PERC_BASE_PIS/100) * -1,'
      '      SUM(I.VAL_TOTAL*O.PERC_BASE_PIS/100)) AS VAL_BC,*/'
      '    '
      '    SUM(I.VAL_PIS) AS VAL_PIS,'
      '    SUM(0) AS VAL_PIS_IMPOSTO,'
      '    SUM(I.VAL_CONFINS) AS VAL_COFINS,'
      '    SUM(0) AS VAL_COFINS_IMPOSTO'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_PIS, -1) >= 0 AND NVL(O.PERC_BASE_CO' +
        'FINS,-1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO  ' +
        '      '
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 2'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O'
      '  WHERE'
      '    (O.IND_LIVRO_FISCAL = '#39'N'#39' AND O.IND_CUPOM_FISCAL = '#39'S'#39')    '
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.IND_ENTRADA_SAIDA = '#39'E'#39
      '    AND'
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '  GROUP BY'
      '    '#39'CUM'#39','
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    NVL(I.COD_CST_COFINS,P.COD_CST_COFINS),'
      '    NVL(I.COD_CST_PIS,P.COD_CST_PIS),       '
      '    '#39'CUPOM FISCAL'#39','
      '    IND_COMPRAS,'
      '    IND_VENDAS,'
      '    N.COD_OPERACAO,'
      '    N.COD_NOTA_CAB,'
      '    PS.PERC_PIS,'
      '    PS.PERC_COFINS,'
      '    O.PERC_BASE_PIS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)'
      ')'
      'GROUP BY'
      '  INC_TRIB,'
      '  CST_COFINS,'
      '  CST_PIS,'
      '  TIPO'
      ''
      'ORDER BY'
      '  TIPO,CST_PIS,CST_COFINS'
      ')'
      ''
      ')')
    Variables.Data = {
      0300000003000000070000003A44545F494E490C000000000000000000000007
      0000003A44545F46494E0C0000000000000000000000080000003A46494C4941
      495301000000230000002853454C45435420434F445F46494C49414C2046524F
      4D2054425F46494C49414C290000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000005000000140000005245435F4252555F4E43554D5F545249425F4D49
      010000000000120000005245435F4252555F4E43554D5F4E545F4D4901000000
      0000100000005245435F4252555F4E43554D5F4558500100000000000B000000
      5245435F4252555F43554D0100000000000D0000005245435F4252555F544F54
      414C010000000000}
    Session = DMOracle.DBCemapa
    Left = 96
    Top = 200
    object QReg111REC_BRU_NCUM_TRIB_MI: TFloatField
      FieldName = 'REC_BRU_NCUM_TRIB_MI'
    end
    object QReg111REC_BRU_NCUM_NT_MI: TFloatField
      FieldName = 'REC_BRU_NCUM_NT_MI'
    end
    object QReg111REC_BRU_NCUM_EXP: TFloatField
      FieldName = 'REC_BRU_NCUM_EXP'
    end
    object QReg111REC_BRU_CUM: TFloatField
      FieldName = 'REC_BRU_CUM'
    end
    object QReg111REC_BRU_TOTAL: TFloatField
      FieldName = 'REC_BRU_TOTAL'
    end
  end
end
