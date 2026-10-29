object DmBloco0: TDmBloco0
  OldCreateOrder = False
  Left = 456
  Top = 253
  Height = 306
  Width = 599
  object QReg000: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  DESC_FILIAL,'
      '  REGEXP_REPLACE(DESC_CNAE, '#39'[^0-9]+'#39') as DESC_CNAE, '
      '  NUM_CGC,'
      '  DESC_NIT,'
      '  E.DESC_SIGLA_ESTADO,'
      '  DESC_INSCRICAO,'
      '  E.COD_UF_IBGE || C.COD_CIDADE_IBGE AS COD_CIDADE_IBGE,'
      '  E.COD_UF_IBGE + 0.00 as COD_UF_IBGE,'
      '  DESC_INSCRICAO_MUNICIPAL,'
      '  NULL AS IND_SIT_ESP,'
      '  DESC_SUFRAMA,'
      '  IND_PERFIL_SPED,'
      '  IND_TIPO_ATIVIDADE,'
      '  DECODE('
      '    NUM_NIRE,'
      '    NULL,'
      '    0,'
      '    1'
      '  ) AS IND_NIRE,'
      ''
      
        '  --Implementar essas informa'#231#245'es para serem informadas na tela ' +
        'FGeraSped--'
      '  0 AS IND_FIN_ESC,'
      '  NULL AS COD_HASH_SUB,'
      '  NULL AS NIRE_SUBST,'
      
        '  --------------------------------------------------------------' +
        '-----------'
      ''
      '  0 AS IND_GRANDE_PORTE,'
      '  0 AS TIP_ECD,'
      '  NULL AS COD_SCP,'
      '  '#39'N'#39' AS IDENT_MF,'
      '  '#39'N'#39' AS IND_ESC_CONS,'
      
        '  (SELECT DECODE(IND_TIPO_PLANO_CONTA,'#39'UNICO'#39', '#39'0'#39', '#39'1'#39') FROM TB' +
        '_PARAM_SISTEMA) AS IND_CENTRALIZADA,'
      '  '#39'0'#39' AS IND_MUDANC_PC,'
      '  IND_VALORES_AGREGADOS,'
      '  DT_INVENTARIO  '
      'FROM'
      '  TB_FILIAL F'
      'LEFT JOIN TB_CIDADE C ON F.COD_CIDADE = C.COD_CIDADE'
      'LEFT JOIN TB_ESTADO E ON F.COD_ESTADO = E.COD_ESTADO'
      'WHERE'
      '  F.COD_FILIAL IN :FILIAIS'
      '')
    Variables.Data = {
      0300000001000000080000003A46494C4941495301000000230000002853454C
      45435420434F445F46494C49414C2046524F4D2054425F46494C49414C290000
      000000}
    QBEDefinition.QBEFieldDefs = {
      040000001A0000000B000000444553435F46494C49414C010000000000070000
      004E554D5F43474301000000000008000000444553435F4E4954010000000000
      11000000444553435F5349474C415F45535441444F0100000000000E00000044
      4553435F494E5343524943414F0100000000000F000000434F445F4349444144
      455F4942474501000000000018000000444553435F494E5343524943414F5F4D
      554E49434950414C0100000000000C000000444553435F53554652414D410100
      000000000B000000434F445F55465F494247450100000000000F000000494E44
      5F50455246494C5F5350454401000000000012000000494E445F5449504F5F41
      544956494441444501000000000008000000494E445F4E495245010000000000
      0B000000494E445F46494E5F4553430100000000000C000000434F445F484153
      485F5355420100000000000A0000004E4952455F53554253540100000000000B
      000000494E445F5349545F45535001000000000010000000494E445F4752414E
      44455F504F525445010000000000070000005449505F45434401000000000007
      000000434F445F534350010000000000080000004944454E545F4D4601000000
      00000C000000494E445F4553435F434F4E5301000000000010000000494E445F
      43454E5452414C495A4144410100000000000D000000494E445F4D5544414E43
      5F504301000000000009000000444553435F434E414501000000000015000000
      494E445F56414C4F5245535F414752454741444F530100000000000D00000044
      545F494E56454E544152494F010000000000}
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
      Required = True
      Size = 2
    end
    object QReg000DESC_INSCRICAO: TStringField
      FieldName = 'DESC_INSCRICAO'
      Size = 12
    end
    object QReg000DESC_INSCRICAO_MUNICIPAL: TStringField
      FieldName = 'DESC_INSCRICAO_MUNICIPAL'
      Size = 15
    end
    object QReg000DESC_SUFRAMA: TStringField
      FieldName = 'DESC_SUFRAMA'
      Size = 15
    end
    object QReg000COD_CIDADE_IBGE: TStringField
      DisplayWidth = 7
      FieldName = 'COD_CIDADE_IBGE'
      Size = 7
    end
    object QReg000COD_UF_IBGE: TFloatField
      FieldName = 'COD_UF_IBGE'
    end
    object QReg000IND_PERFIL_SPED: TStringField
      FieldName = 'IND_PERFIL_SPED'
      Size = 1
    end
    object QReg000IND_TIPO_ATIVIDADE: TStringField
      FieldName = 'IND_TIPO_ATIVIDADE'
      Size = 1
    end
    object QReg000IND_NIRE: TFloatField
      FieldName = 'IND_NIRE'
    end
    object QReg000IND_FIN_ESC: TFloatField
      FieldName = 'IND_FIN_ESC'
    end
    object QReg000COD_HASH_SUB: TStringField
      FieldName = 'COD_HASH_SUB'
      Size = 1
    end
    object QReg000NIRE_SUBST: TStringField
      FieldName = 'NIRE_SUBST'
      Size = 1
    end
    object QReg000IND_SIT_ESP: TStringField
      FieldName = 'IND_SIT_ESP'
      Size = 1
    end
    object QReg000IND_GRANDE_PORTE: TFloatField
      FieldName = 'IND_GRANDE_PORTE'
    end
    object QReg000TIP_ECD: TFloatField
      FieldName = 'TIP_ECD'
    end
    object QReg000COD_SCP: TStringField
      FieldName = 'COD_SCP'
      Size = 1
    end
    object QReg000IDENT_MF: TStringField
      FieldName = 'IDENT_MF'
      Size = 1
    end
    object QReg000IND_ESC_CONS: TStringField
      FieldName = 'IND_ESC_CONS'
      Size = 1
    end
    object QReg000IND_CENTRALIZADA: TStringField
      FieldName = 'IND_CENTRALIZADA'
      Size = 1
    end
    object QReg000IND_MUDANC_PC: TStringField
      FieldName = 'IND_MUDANC_PC'
      Size = 1
    end
    object QReg000DESC_CNAE: TStringField
      FieldName = 'DESC_CNAE'
      Size = 7
    end
    object QReg000IND_VALORES_AGREGADOS: TStringField
      FieldName = 'IND_VALORES_AGREGADOS'
      Size = 3
    end
    object QReg000DT_INVENTARIO: TDateTimeField
      FieldName = 'DT_INVENTARIO'
    end
  end
  object QReg005: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  DESC_FILIAL,'
      '  DESC_CEP,'
      '  DESC_ENDERECO,'
      '  NUM_ENDERECO,'
      '  DESC_COMPLEMENTO_ENDERECO,'
      '  DESC_BAIRRO,'
      '  NUM_CAIXA_POSTAL,'
      '  DESC_TELEFONE,'
      '  DESC_FAX,'
      '  DESC_E_MAIL'
      'FROM'
      '  TB_FILIAL'
      'WHERE'
      '  COD_FILIAL = :COD_FILIAL')
    Variables.Data = {
      03000000010000000B0000003A434F445F46494C49414C030000000000000000
      000000}
    QBEDefinition.QBEFieldDefs = {
      040000000A0000000B000000444553435F46494C49414C010000000000080000
      00444553435F4345500100000000000D000000444553435F454E44455245434F
      0100000000000C0000004E554D5F454E44455245434F01000000000019000000
      444553435F434F4D504C454D454E544F5F454E44455245434F0100000000000B
      000000444553435F42414952524F010000000000100000004E554D5F43414958
      415F504F5354414C0100000000000D000000444553435F54454C45464F4E4501
      000000000008000000444553435F4641580100000000000B000000444553435F
      455F4D41494C010000000000}
    Session = DMOracle.DBCemapa
    Left = 136
    Top = 16
    object QReg005DESC_FILIAL: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
    object QReg005DESC_CEP: TStringField
      FieldName = 'DESC_CEP'
      Size = 9
    end
    object QReg005DESC_ENDERECO: TStringField
      FieldName = 'DESC_ENDERECO'
      Size = 30
    end
    object QReg005NUM_ENDERECO: TIntegerField
      FieldName = 'NUM_ENDERECO'
    end
    object QReg005DESC_COMPLEMENTO_ENDERECO: TStringField
      FieldName = 'DESC_COMPLEMENTO_ENDERECO'
      Size = 22
    end
    object QReg005DESC_BAIRRO: TStringField
      FieldName = 'DESC_BAIRRO'
      Size = 15
    end
    object QReg005NUM_CAIXA_POSTAL: TIntegerField
      FieldName = 'NUM_CAIXA_POSTAL'
    end
    object QReg005DESC_TELEFONE: TStringField
      FieldName = 'DESC_TELEFONE'
      Size = 12
    end
    object QReg005DESC_FAX: TStringField
      FieldName = 'DESC_FAX'
      Size = 14
    end
    object QReg005DESC_E_MAIL: TStringField
      FieldName = 'DESC_E_MAIL'
      Size = 40
    end
  end
  object QReg100: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
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
      '  TB_CADASTRO C'
      'LEFT JOIN TB_ESTADO E ON C.COD_ESTADO = E.COD_ESTADO'
      'LEFT JOIN TB_CIDADE I ON C.COD_CIDADE = I.COD_CIDADE'
      'WHERE'
      '  C.COD_CADASTRO = :COD_CADASTRO')
    Variables.Data = {
      03000000010000000D0000003A434F445F434144415354524F03000000000000
      0000000000}
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
    Left = 304
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
      Required = True
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
      Size = 40
    end
    object QReg100COD_CIDADE_IBGE: TStringField
      FieldName = 'COD_CIDADE_IBGE'
      Size = 5
    end
    object QReg100COD_UF_IBGE: TFloatField
      FieldName = 'COD_UF_IBGE'
    end
  end
  object QReg200: TOracleDataSet1
    SQL.Strings = (
      '--REG 0200'
      ''
      'SELECT'
      '  DISTINCT'
      '  *'
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
      '  P.COD_LISTA_SERVICO + 0.00 AS COD_LISTA_SERVICO,'
      '  P.COD_TIPO_PRODUTO,'
      '  P.COD_CEST'
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
        'SERIE.COD_FILIAL = N.COD_FILIAL AND N.COD_SERIE_MODELO = TB_SERI' +
        'E.COD_SERIE_MODELO)'
      'WHERE'
      '  N.DT_RECEBIMENTO BETWEEN :DT_INICIAL AND :DT_FINAL'
      'AND'
      '  N.COD_FILIAL = :COD_FILIAL'
      'AND'
      '  N.IND_SITUACAO = '#39'2'#39
      'AND'
      '  O.IND_LIVRO_FISCAL = '#39'S'#39
      '--AND'
      '--  O.IND_TELECOMUNICACAO <> '#39'S'#39
      'AND'
      '  (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      'AND'
      
        '--  ((TB_SERIE.COD_SERIE_MODELO = '#39'55'#39' AND O.IND_EMITE <> '#39'F'#39') O' +
        'R (TB_SERIE.COD_SERIE_MODELO <> '#39'55'#39'))'
      '--AND'
      '--  TB_SERIE.COD_SERIE_MODELO <> '#39'06'#39
      
        '(TB_SERIE.COD_SERIE_MODELO in ('#39'01'#39', '#39'1B'#39', '#39'04'#39') OR (TB_SERIE.CO' +
        'D_SERIE_MODELO = '#39'55'#39' AND O.IND_EMITE <> '#39'F'#39'))'
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
      '  P.COD_CEST'
      'FROM'
      '  TB_PARAM_SISTEMA,'
      '  TB_ESTOQUE_INVENTARIO INV'
      'INNER JOIN TB_PRODUTO P ON P.COD_PRODUTO = INV.COD_PRODUTO'
      'INNER JOIN TB_FILIAL F ON F.COD_FILIAL = INV.COD_FILIAL'
      
        'INNER JOIN TB_TRIBUTACAO T ON P.COD_TRIBUTACAO = T.COD_TRIBUTACA' +
        'O'
      'Where'
      '  INV.COD_FILIAL = :COD_FILIAL'
      'And'
      '  INV.NUM_ANO = :NUM_ANO'
      'And'
      '  INV.NUM_MES = :NUM_MES'
      'AND'
      
        '  /*((COD_EMPRESA = '#39'ARZ'#39' AND P.IND_TIPO_PRODUTO IN ('#39'COMERCIAL'#39 +
        ', '#39'INDUSTRIAL'#39'))'
      
        '    OR (COD_EMPRESA <> '#39'ARZ'#39' AND P.IND_TIPO_PRODUTO NOT IN ('#39'IMO' +
        'BILIZAD'#39', '#39'IMOBILIZADO'#39','#39'CONSUMO'#39'))'
      
        '    OR (COD_EMPRESA = '#39'ARZ'#39' AND P.COD_CLASSE NOT IN (14, 16, 18)' +
        ')) Junior 08/04/2026 estava trazendo produtos fora do tipo COMER' +
        'CIAL E INDUSTRIAL*/'
      '   ('
      
        '    (COD_EMPRESA = '#39'ARZ'#39'AND P.IND_TIPO_PRODUTO IN ('#39'COMERCIAL'#39', ' +
        #39'INDUSTRIAL'#39')'
      
        '          AND P.COD_CLASSE NOT IN (14, 16, 18))  -- ? Junto com ' +
        'a primeira condi'#231#227'o'
      '    OR'
      '    (COD_EMPRESA <> '#39'ARZ'#39
      
        '      AND P.IND_TIPO_PRODUTO NOT IN ('#39'IMOBILIZAD'#39', '#39'IMOBILIZADO'#39 +
        ', '#39'CONSUMO'#39'))'
      '    )'
      'AND'
      '  P.IND_SITUACAO <> '#39'DESATIVADO'#39
      'AND'
      
        '  ((SELECT COUNT(*) FROM TB_FILIAL_INVENTARIO_MES X WHERE X.COD_' +
        'FILIAL = INV.COD_FILIAL AND X.NUM_MES = :MES_INV) > 0)'
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
      '  P.COD_CEST'
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
        'IE AND TB_SERIE.COD_FILIAL = TB_NOTA_CAB.COD_FILIAL AND '
      #9'TB_NOTA_CAB.COD_SERIE_MODELO = TB_SERIE.COD_SERIE_MODELO)'
      'Where'
      '  Tb_Nota_Cab.IND_SITUACAO = '#39'2'#39
      'AND'
      '  Tb_Operacao.IND_FIXAR_EMPRESA = '#39'F'#39
      'AND'
      '  TB_NOTA_CAB.DT_RECEBIMENTO BETWEEN :DT_INICIAL AND :DT_FINAL'
      'AND'
      '  TB_NOTA_CAB.COD_FILIAL = :COD_FILIAL'
      'AND'
      '  TB_OPERACAO.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      
        '  (TB_OPERACAO.NUM_LIVROS <> 10 or TB_OPERACAO.NUM_LIVROS is nul' +
        'l)'
      'AND'
      
        '--  ((TB_SERIE.COD_SERIE_MODELO = '#39'55'#39' AND TB_OPERACAO.IND_EMITE' +
        ' <> '#39'F'#39') OR (TB_SERIE.COD_SERIE_MODELO <> '#39'55'#39' AND TB_OPERACAO.I' +
        'ND_EMITE = '#39'F'#39'))'
      '--AND'
      '--  TB_SERIE.COD_SERIE_MODELO <> '#39'06'#39
      
        '(TB_SERIE.COD_SERIE_MODELO in ('#39'01'#39', '#39'1B'#39', '#39'04'#39') OR (TB_SERIE.CO' +
        'D_SERIE_MODELO = '#39'55'#39' AND TB_OPERACAO.IND_EMITE <> '#39'F'#39'))'
      ''
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
      '  P.COD_LISTA_SERVICO + 0.00,'
      '  P.COD_TIPO_PRODUTO,'
      '  P.COD_CEST'
      'From'
      '  TB_PARAM_SISTEMA,'
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
      '  TB_NOTA_CAB.COD_FILIAL = :COD_FILIAL'
      'AND'
      '  TB_OPERACAO.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      
        '  (((TB_NOTA_CAB.COD_SERIE_MODELO = '#39'55'#39' AND TB_OPERACAO.IND_EMI' +
        'TE <> '#39'F'#39') OR (TB_NOTA_CAB.COD_SERIE_MODELO <> '#39'55'#39'))'
      '  OR'
      
        '  (TB_PARAM_SISTEMA.COD_EMPRESA IN ('#39'POLITHERM'#39','#39'BISSOLOTTI'#39','#39'DA' +
        'MBONI'#39'))) -- DEVE SAIR C170 MESMO PARA NF-E DE EMISS'#195'O PR'#211'PRIA'
      '  --assim os produtos deve ser listados no 0200'
      'AND'
      
        '  ((TB_NOTA_CAB.COD_SERIE_MODELO <> '#39'65'#39') or (TB_PARAM_SISTEMA.C' +
        'OD_EMPRESA = '#39'DAMBONI'#39'))'
      '  '
      ''
      'UNION'
      '--SOMENTE PARA POLITHERM '
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
      '  P.COD_LISTA_SERVICO + 0.00 AS COD_LISTA_SERVICO,'
      '  P.COD_TIPO_PRODUTO,'
      '  P.COD_CEST'
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
        'SERIE.COD_FILIAL = N.COD_FILIAL AND N.COD_SERIE_MODELO = TB_SERI' +
        'E.COD_SERIE_MODELO)'
      'WHERE'
      '  N.DT_RECEBIMENTO BETWEEN :DT_INICIAL AND :DT_FINAL'
      'AND'
      '  N.COD_FILIAL = :COD_FILIAL'
      'AND'
      '  TB_PARAM_SISTEMA.COD_EMPRESA IN ('#39'POLITHERM'#39')'
      'AND'
      '  N.IND_SITUACAO = '#39'2'#39
      'AND'
      '  O.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      '  (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      'AND'
      '  TB_SERIE.COD_SERIE_MODELO IN ('#39'01'#39', '#39'1B'#39', '#39'04'#39','#39'55'#39')'
      ''
      'UNION'
      '--ORDEM DE PRODUCAO'
      'SELECT  '
      '  P.COD_PRODUTO + 0.00 AS COD_PRODUTO,'
      '  P.DESC_PRODUTO,'
      '  P.NUM_FABRICANTE,'
      '  P.DESC_UNIDADE,'
      '  T.PERC_ALIQUOTA,'
      '  P.COD_GENERO_PRODUTO + 0.00 AS COD_GENERO_PRODUTO,'
      '  P.COD_EX_TIPI,'
      '  P.NUM_GENERO_NCM,'
      '  P.COD_LISTA_SERVICO + 0.00 AS COD_LISTA_SERVICO,'
      '  P.COD_TIPO_PRODUTO,'
      '  P.COD_CEST'
      'FROM'
      '  TB_PARAM_SISTEMA,'
      '  TB_ORDEM_PRODUCAO_CAB OC'
      '    INNER JOIN TB_ORDEM_PRODUCAO_ITEM OI'
      '      ON OC.COD_ORDEM_PRODUCAO_CAB = OI.COD_ORDEM_PRODUCAO_CAB'
      '  INNER JOIN TB_PRODUTO P ON OI.COD_PRODUTO = P.COD_PRODUTO'
      
        '  INNER JOIN TB_TRIBUTACAO T ON P.COD_TRIBUTACAO = T.COD_TRIBUTA' +
        'CAO'
      'WHERE'
      '  (OC.DT_PERIODO_F  BETWEEN :DT_INICIAL AND :DT_FINAL)'
      '  AND'
      '  TB_PARAM_SISTEMA.COD_EMPRESA <> '#39'CGS'#39
      '  AND'
      '  P.COD_TIPO_PRODUTO IN ('#39'03'#39', '#39'04'#39')'
      '  '
      'UNION'
      ''
      '--FORMULAS DE PRODUCAO'
      'SELECT DISTINCT'
      '  P.COD_PRODUTO + 0.00 AS COD_PRODUTO,'
      '  P.DESC_PRODUTO,'
      '  P.NUM_FABRICANTE,'
      '  P.DESC_UNIDADE,'
      '  T.PERC_ALIQUOTA,'
      '  P.COD_GENERO_PRODUTO + 0.00 AS COD_GENERO_PRODUTO,'
      '  P.COD_EX_TIPI,'
      '  P.NUM_GENERO_NCM,'
      '  P.COD_LISTA_SERVICO + 0.00 AS COD_LISTA_SERVICO,'
      '  P.COD_TIPO_PRODUTO,'
      '  P.COD_CEST'
      'FROM'
      '  TB_PARAM_SISTEMA,'
      '  TB_ORDEM_PRODUCAO_CAB OP'
      
        '  INNER JOIN TB_ORDEM_PRODUCAO_ITEM OI ON OP.COD_ORDEM_PRODUCAO_' +
        'CAB = OI.COD_ORDEM_PRODUCAO_CAB'
      '  INNER JOIN TB_FORMULA F ON OI.COD_PRODUTO = F.COD_PRODUTO '
      '    --AND OI.COD_LOTE = F.COD_LOTE_TIPO --(VERIFICAR)'
      
        '  INNER JOIN TB_FORMULA_ITEM FI ON F.COD_FORMULA = FI.COD_FORMUL' +
        'A'
      '  INNER JOIN TB_PRODUTO P ON FI.COD_PRODUTO = P.COD_PRODUTO'
      
        '  INNER JOIN TB_TRIBUTACAO T ON P.COD_TRIBUTACAO = T.COD_TRIBUTA' +
        'CAO'
      'WHERE'
      '  OP.DT_PERIODO_F BETWEEN :DT_INICIAL AND :DT_FINAL'
      '  AND'
      '  F.COD_FILIAL = :COD_FILIAL'
      '  AND'
      '  TB_PARAM_SISTEMA.COD_EMPRESA <> '#39'CGS'#39
      ''
      '  '
      
        '/*UNION     comentado marcos 11/04/2023 estava trazendo registro' +
        ' de apena um produto acabado de todas as ordens de producao'
      
        '            e estava dando erro pois a cgs nao estava mais lanca' +
        'ndo o registro de inventario'
      ''
      '--FORMULAS DE PRODUCAO CGS'
      'SELECT DISTINCT'
      '  P.COD_PRODUTO + 0.00 AS COD_PRODUTO,'
      '  P.DESC_PRODUTO,'
      '  P.NUM_FABRICANTE,'
      '  P.DESC_UNIDADE,'
      '  T.PERC_ALIQUOTA,'
      '  P.COD_GENERO_PRODUTO + 0.00 AS COD_GENERO_PRODUTO,'
      '  P.COD_EX_TIPI,'
      '  P.NUM_GENERO_NCM,'
      '  P.COD_LISTA_SERVICO + 0.00 AS COD_LISTA_SERVICO,'
      '  P.COD_TIPO_PRODUTO,'
      '  P.COD_CEST'
      'FROM'
      '  TB_PARAM_SISTEMA,'
      '  TB_ORDEM_PRODUCAO_CAB OP'
      
        '  INNER JOIN TB_ORDEM_PRODUCAO_ITEM OI ON OP.COD_ORDEM_PRODUCAO_' +
        'CAB = OI.COD_ORDEM_PRODUCAO_CAB'
      '  INNER JOIN TB_FORMULA F ON OI.COD_PRODUTO = F.COD_PRODUTO  '
      
        '  INNER JOIN TB_FORMULA_ITEM FI ON FI.COD_FORMULA = F.COD_FORMUL' +
        'A'
      '  innER JOIN TB_FILIAL ON TB_FILIAL.COD_FILIAL = F.COD_FILIAL'
      '  INNER JOIN TB_PRODUTO P ON FI.COD_PRODUTO = P.COD_PRODUTO'
      
        '  INNER JOIN TB_TRIBUTACAO T ON P.COD_TRIBUTACAO = T.COD_TRIBUTA' +
        'CAO'
      'WHERE'
      '  OP.DT_PERIODO_F BETWEEN :DT_INICIAL AND :DT_FINAL'
      '  AND'
      '  TB_PARAM_SISTEMA.COD_EMPRESA = '#39'CGS'#39
      '  AND'
      '  TB_FILIAL.COD_FILIAL = :COD_FILIAL'
      '  AND'
      '  :BLOCOK   */'
      ''
      ''
      'UNION'
      '  '
      '--BOLETIM - PRODUTO ACABADO'
      'SELECT DISTINCT'
      '  P.COD_PRODUTO + 0.00 AS COD_PRODUTO,'
      '  P.DESC_PRODUTO,'
      '  P.NUM_FABRICANTE,'
      '  P.DESC_UNIDADE,'
      '  T.PERC_ALIQUOTA,'
      '  P.COD_GENERO_PRODUTO + 0.00 AS COD_GENERO_PRODUTO,'
      '  P.COD_EX_TIPI,'
      '  P.NUM_GENERO_NCM,'
      '  P.COD_LISTA_SERVICO + 0.00 AS COD_LISTA_SERVICO,'
      '  P.COD_TIPO_PRODUTO,'
      '  P.COD_CEST'
      'FROM'
      '  TB_BOLETIM B  '
      '  INNER JOIN TB_FORMULA F ON B.COD_FORMULA = F.COD_FORMULA  '
      '  INNER JOIN TB_PRODUTO P ON F.COD_PRODUTO = P.COD_PRODUTO'
      
        '  INNER JOIN TB_TRIBUTACAO T ON P.COD_TRIBUTACAO = T.COD_TRIBUTA' +
        'CAO'
      'WHERE'
      '  B.DT_BOLETIM BETWEEN :DT_INICIAL AND :DT_FINAL'
      '  AND'
      '  B.COD_FILIAL = :COD_FILIAL'
      '  AND'
      '  P.COD_TIPO_PRODUTO IN ('#39'03'#39', '#39'04'#39')'
      ''
      '  '
      'UNION'
      '  '
      '--BOLETIM - INSUMOS'
      'SELECT DISTINCT'
      '  P.COD_PRODUTO + 0.00 AS COD_PRODUTO,'
      '  P.DESC_PRODUTO,'
      '  P.NUM_FABRICANTE,'
      '  P.DESC_UNIDADE,'
      '  T.PERC_ALIQUOTA,'
      '  P.COD_GENERO_PRODUTO + 0.00 AS COD_GENERO_PRODUTO,'
      '  P.COD_EX_TIPI,'
      '  P.NUM_GENERO_NCM,'
      '  P.COD_LISTA_SERVICO + 0.00 AS COD_LISTA_SERVICO,'
      '  P.COD_TIPO_PRODUTO,'
      '  P.COD_CEST'
      'FROM'
      '  TB_BOLETIM B  '
      '  INNER JOIN TB_FORMULA F ON B.COD_FORMULA = F.COD_FORMULA  '
      
        '  INNER JOIN TB_FORMULA_ITEM FI ON F.COD_FORMULA = FI.COD_FORMUL' +
        'A'
      '  INNER JOIN TB_PRODUTO P ON FI.COD_PRODUTO = P.COD_PRODUTO'
      
        '  INNER JOIN TB_TRIBUTACAO T ON P.COD_TRIBUTACAO = T.COD_TRIBUTA' +
        'CAO'
      '  INNER JOIN TB_PRODUTO P2 ON F.COD_PRODUTO = P2.COD_PRODUTO'
      'WHERE'
      '  B.DT_BOLETIM BETWEEN :DT_INICIAL AND :DT_FINAL'
      '  AND'
      '  B.COD_FILIAL = :COD_FILIAL'
      '  AND'
      '  P.COD_TIPO_PRODUTO IN ('#39'03'#39', '#39'04'#39')'
      '  AND'
      '  P2.COD_TIPO_PRODUTO IN ('#39'03'#39', '#39'04'#39')'
      ''
      '  '
      '/*UNION'
      ' '
      '-- TB_CONHECIMENTO (REGISTRO 1400)'
      'SELECT DISTINCT'
      '  P.COD_PRODUTO + 0.00 AS COD_PRODUTO,'
      '  P.DESC_PRODUTO,'
      '  P.NUM_FABRICANTE,'
      '  P.DESC_UNIDADE,'
      '  T.PERC_ALIQUOTA,'
      '  P.COD_GENERO_PRODUTO + 0.00 AS COD_GENERO_PRODUTO,'
      '  P.COD_EX_TIPI,'
      '  P.NUM_GENERO_NCM,'
      '  P.COD_LISTA_SERVICO + 0.00 AS COD_LISTA_SERVICO,'
      '  P.COD_TIPO_PRODUTO,'
      '  P.COD_CEST'
      'FROM'
      '  TB_CONHECIMENTO CO    '
      '    INNER JOIN TB_SERIE S'
      '      ON CO.COD_SERIE = S.COD_SERIE'
      '        AND CO.COD_SERIE_MODELO = S.COD_SERIE_MODELO'
      '    INNER JOIN TB_FILIAL F'
      '      ON CO.COD_FILIAL = F.COD_FILIAL'
      '    INNER JOIN TB_OPERACAO O'
      '      ON CO.COD_OPERACAO = O.COD_OPERACAO'
      '    INNER JOIN TB_PRODUTO P'
      '      ON CO.COD_PRODUTO = P.COD_PRODUTO    '
      '    INNER JOIN TB_TRIBUTACAO T'
      '      ON P.COD_TRIBUTACAO = T.COD_TRIBUTACAO'
      'WHERE'
      '  CO.IND_SITUACAO = '#39'2'#39
      '  AND'
      '  O.IND_LIVRO_FISCAL = '#39'S'#39
      '  AND'
      '  (O.NUM_LIVROS = 10 or O.NUM_LIVROS is null)'
      '  AND'
      '  CO.COD_FILIAL = :COD_FILIAL  '
      '  AND'
      '  CO.DT_EMISSAO BETWEEN :DT_INICIAL AND :DT_FINAL'
      '  AND'
      '  S.COD_SERIE_MODELO IN ('#39'08'#39', '#39'57'#39')'
      '  AND'
      
        '  REGEXP_REPLACE(F.DESC_CNAE, '#39'[^0-9]+'#39') LIKE '#39'49302%'#39' -- servi'#231 +
        'o de transporte'
      ''
      'UNION'
      ''
      '-- TB_NOTA_CAB ( FRETE INCLUSO NA NOTA )'
      'SELECT DISTINCT'
      '  P.COD_PRODUTO + 0.00 AS COD_PRODUTO,'
      '  P.DESC_PRODUTO,'
      '  P.NUM_FABRICANTE,'
      '  P.DESC_UNIDADE,'
      '  T.PERC_ALIQUOTA,'
      '  P.COD_GENERO_PRODUTO + 0.00 AS COD_GENERO_PRODUTO,'
      '  P.COD_EX_TIPI,'
      '  P.NUM_GENERO_NCM,'
      '  P.COD_LISTA_SERVICO + 0.00 AS COD_LISTA_SERVICO,'
      '  P.COD_TIPO_PRODUTO,'
      '  P.COD_CEST'
      'FROM'
      '  TB_PARAM_SISTEMA PS,'
      '  TB_NOTA_ITEM I'
      '    INNER JOIN TB_NOTA_CAB N'
      '      ON I.COD_NOTA_CAB = N.COD_NOTA_CAB'
      '    INNER JOIN TB_OPERACAO O'
      '      ON N.COD_OPERACAO = O.COD_OPERACAO'
      '    INNER JOIN TB_SERIE S'
      '      ON N.COD_SERIE = S.COD_SERIE'
      '        AND N.COD_SERIE_MODELO = S.COD_SERIE_MODELO'
      '    INNER JOIN TB_FILIAL F'
      '      ON N.COD_FILIAL = F.COD_FILIAL    '
      '    INNER JOIN TB_PRODUTO P'
      '      ON I.COD_PRODUTO = P.COD_PRODUTO'
      '    INNER JOIN TB_TRIBUTACAO T'
      '      ON P.COD_TRIBUTACAO = T.COD_TRIBUTACAO'
      'WHERE'
      '  N.IND_ENTRADA_SAIDA = '#39'S'#39
      '  AND  '
      '  N.IND_SITUACAO = '#39'2'#39
      '  AND'
      '  O.IND_LIVRO_FISCAL = '#39'S'#39
      '  AND'
      '  (O.NUM_LIVROS = 10 or O.NUM_LIVROS is null)'
      '  AND'
      '  N.COD_FILIAL = :COD_FILIAL  '
      '  AND'
      '  N.DT_EMISSAO BETWEEN :DT_INICIAL AND :DT_FINAL'
      '  AND'
      '  S.COD_SERIE_MODELO IN ('#39'08'#39', '#39'57'#39')'
      '  AND'
      
        '  REGEXP_REPLACE(F.DESC_CNAE, '#39'[^0-9]+'#39') LIKE '#39'49302%'#39' -- servi'#231 +
        'o de transporte  '
      '  '
      
        '*/--REMOVIDO PARA DIRIMIR PROBLEMAS COM REGISTRO 1400 AP'#211'S TABEL' +
        'A SEFAZ-PR - CLEBER 16/06/2021  '
      '  '
      '  UNION'
      ''
      '-- PRODUTOS TRANSFORMADOS EM OUTROS PRODUTOS'
      'SELECT DISTINCT'
      '  P.COD_PRODUTO + 0.00 AS COD_PRODUTO,'
      '  P.DESC_PRODUTO,'
      '  P.NUM_FABRICANTE,'
      '  P.DESC_UNIDADE,'
      '  T.PERC_ALIQUOTA,'
      '  P.COD_GENERO_PRODUTO + 0.00 AS COD_GENERO_PRODUTO,'
      '  P.COD_EX_TIPI,'
      '  P.NUM_GENERO_NCM,'
      '  P.COD_LISTA_SERVICO + 0.00 AS COD_LISTA_SERVICO,'
      '  P.COD_TIPO_PRODUTO,'
      '  P.COD_CEST'
      'FROM'
      '  TB_PRODUTO_TRANSFERIDO PT'
      
        '    INNER JOIN TB_PRODUTO P ON P.COD_PRODUTO = PT.COD_PRODUTO_OR' +
        'IGEM'
      
        '    INNER JOIN TB_TRIBUTACAO T ON T.COD_TRIBUTACAO = P.COD_TRIBU' +
        'TACAO'
      'WHERE'
      '  PT.DT_TRANSFERENCIA BETWEEN :DT_INICIAL AND :DT_FINAL'
      '  AND'
      
        '  P.COD_TIPO_PRODUTO IN ('#39'00'#39', '#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39', '#39'06' +
        #39', '#39'10'#39')'
      '  AND'
      '  PT.QT_QUANTIDADE > 0  '
      '  AND '
      
        '  (SELECT IND_TIPO_ATIVIDADE FROM TB_FILIAL WHERE COD_FILIAL = :' +
        'COD_FILIAL) = '#39'I'#39
      '  AND 1 = 2 -- N'#195'O GERAR POR ENQUANTO'
      ''
      'UNION'
      ''
      '-- LAN'#199'AMENTOS DE DOCUMENTOS LIVRO FISCAL IPI'
      'SELECT DISTINCT'
      '  P.COD_PRODUTO + 0.00 AS COD_PRODUTO,'
      '  P.DESC_PRODUTO,'
      '  P.NUM_FABRICANTE,'
      '  P.DESC_UNIDADE,'
      '  T.PERC_ALIQUOTA,'
      '  P.COD_GENERO_PRODUTO + 0.00 AS COD_GENERO_PRODUTO,'
      '  P.COD_EX_TIPI,'
      '  P.NUM_GENERO_NCM,'
      '  P.COD_LISTA_SERVICO + 0.00 AS COD_LISTA_SERVICO,'
      '  P.COD_TIPO_PRODUTO,'
      '  P.COD_CEST'
      'FROM'
      '  TB_LIVRO_LCTO_IPI_ITEM LCTOITEM'
      
        '    INNER JOIN TB_NOTA_ITEM I ON LCTOITEM.COD_NOTA_ITEM = I.COD_' +
        'NOTA_ITEM'
      '    INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      
        '    INNER JOIN TB_TRIBUTACAO T ON T.COD_TRIBUTACAO = I.COD_TRIBU' +
        'TACAO'
      
        '    INNER JOIN TB_LIVRO_LCTO_IPI LCTO ON LCTOITEM.COD_LIVRO_LCTO' +
        '_IPI = LCTO.COD_LIVRO_LCTO_IPI'
      'WHERE'
      '    LCTO.NUM_ANO = :NUM_ANO'
      '    AND'
      '    LCTO.NUM_MES = :NUM_MES'
      '    AND'
      '    LCTO.COD_FILIAL = :COD_FILIAL'
      '    '
      'UNION ALL    '
      '    '
      'SELECT '
      '  PROD.COD_PRODUTO + 0.00 AS COD_PRODUTO,'
      '  PROD.DESC_PRODUTO,'
      '  PROD.NUM_FABRICANTE,'
      '  PROD.DESC_UNIDADE,'
      '  TRIB.PERC_ALIQUOTA,'
      '  PROD.COD_GENERO_PRODUTO + 0.00 AS COD_GENERO_PRODUTO,'
      '  PROD.COD_EX_TIPI,'
      '  PROD.NUM_GENERO_NCM,'
      '  PROD.COD_LISTA_SERVICO + 0.00 AS COD_LISTA_SERVICO,'
      '  PROD.COD_TIPO_PRODUTO,'
      '  PROD.COD_CEST'
      'FROM'
      '    TB_ESTOQUE_BAIXAR BAIXA'
      
        'INNER JOIN TB_NOTA_ITEM ITEM ON ITEM.COD_PRODUTO = BAIXA.COD_PRO' +
        'DUTO    '
      
        'INNER JOIN TB_NOTA_CAB NOTA ON NOTA.COD_NOTA_CAB = ITEM.COD_NOTA' +
        '_CAB'
      
        'INNER JOIN TB_PRODUTO PROD ON PROD.COD_PRODUTO = BAIXA.COD_PRODU' +
        'TO_BAIXA'
      
        'INNER JOIN TB_TRIBUTACAO TRIB ON TRIB.COD_TRIBUTACAO = ITEM.COD_' +
        'TRIBUTACAO'
      'WHERE'
      '    BAIXA.COD_PRODUTO IN ('
      '    '
      'SELECT'
      '  distinct'
      '  P.COD_PRODUTO + 0.00 AS COD_PRODUTO'
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
        'SERIE.COD_FILIAL = N.COD_FILIAL AND N.COD_SERIE_MODELO = TB_SERI' +
        'E.COD_SERIE_MODELO)'
      'WHERE'
      '  N.DT_RECEBIMENTO BETWEEN :DT_INICIAL AND :DT_FINAL'
      'AND'
      '  N.COD_FILIAL = :COD_FILIAL'
      'AND'
      '  N.IND_SITUACAO = '#39'2'#39
      'AND'
      '  O.IND_LIVRO_FISCAL = '#39'S'#39
      '--AND'
      '--  O.IND_TELECOMUNICACAO <> '#39'S'#39
      'AND'
      '  (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      'AND'
      
        '--  ((TB_SERIE.COD_SERIE_MODELO = '#39'55'#39' AND O.IND_EMITE <> '#39'F'#39') O' +
        'R (TB_SERIE.COD_SERIE_MODELO <> '#39'55'#39'))'
      '--AND'
      '--  TB_SERIE.COD_SERIE_MODELO <> '#39'06'#39
      
        '(TB_SERIE.COD_SERIE_MODELO in ('#39'01'#39', '#39'1B'#39', '#39'04'#39') OR (TB_SERIE.CO' +
        'D_SERIE_MODELO = '#39'55'#39' AND O.IND_EMITE <> '#39'F'#39'))'
      'AND'
      '  TB_PARAM_SISTEMA.COD_EMPRESA <> '#39'CGS'#39
      '    '
      '    '
      '    )'
      ''
      ')'
      'ORDER BY'
      '  COD_PRODUTO'
      ' '
      ' ')
    Variables.Data = {
      03000000070000000B0000003A44545F494E494349414C0C0000000000000000
      000000090000003A44545F46494E414C0C00000000000000000000000B000000
      3A434F445F46494C49414C030000000000000000000000080000003A4E554D5F
      414E4F030000000000000000000000080000003A4E554D5F4D45530300000000
      00000000000000070000003A424C4F434F4B0100000000000000000000000800
      00003A4D45535F494E56030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000B0000000B000000434F445F50524F4455544F0100000000000C0000
      00444553435F50524F4455544F0100000000000E0000004E554D5F4641425249
      43414E54450100000000000C000000444553435F554E49444144450100000000
      000D000000504552435F414C4951554F544101000000000012000000434F445F
      47454E45524F5F50524F4455544F0100000000000B000000434F445F45585F54
      4950490100000000000E0000004E554D5F47454E45524F5F4E434D0100000000
      0011000000434F445F4C495354415F5345525649434F01000000000010000000
      434F445F5449504F5F50524F4455544F01000000000008000000434F445F4345
      5354010000000000}
    Session = DMOracle.DBCemapa
    Left = 80
    Top = 72
    object QReg200COD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
    end
    object QReg200DESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
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
    object QReg200NUM_GENERO_NCM: TStringField
      FieldName = 'NUM_GENERO_NCM'
      Size = 8
    end
    object QReg200COD_LISTA_SERVICO: TFloatField
      FieldName = 'COD_LISTA_SERVICO'
    end
    object QReg200COD_TIPO_PRODUTO: TStringField
      FieldName = 'COD_TIPO_PRODUTO'
      Size = 2
    end
    object QReg200COD_CEST: TStringField
      FieldName = 'COD_CEST'
      Size = 15
    end
  end
  object QReg150: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  DISTINCT '
      ' *'
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
      '  C.NUM_INSCRICAO,'
      '  E.COD_UF_IBGE + 0.00 as COD_UF_IBGE,'
      '  I.COD_CIDADE_IBGE,'
      '  C.DESC_SUFRAMA,'
      '  C.DESC_ENDERECO,'
      '  C.DESC_COMPLEMENTO,'
      '  C.DESC_BAIRRO,'
      '  E.DESC_SIGLA_ESTADO,'
      '  C.DESC_INSCRICAO_MUNICIPAL,'
      '  C.IND_FISICA_JURIDICA'
      'FROM'
      '  TB_NOTA_ITEM'
      
        'INNER JOIN TB_NOTA_CAB ON TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITE' +
        'M.COD_NOTA_CAB'
      
        'INNER JOIN TB_OPERACAO ON TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO' +
        '.COD_OPERACAO'
      
        'INNER JOIN TB_SERIE ON (TB_NOTA_CAB.COD_SERIE = TB_SERIE.COD_SER' +
        'IE AND TB_SERIE.COD_FILIAL = TB_NOTA_CAB.COD_FILIAL AND TB_SERIE' +
        '.COD_SERIE_MODELO = TB_NOTA_CAB.COD_SERIE_MODELO)'
      
        'INNER JOIN TB_CADASTRO C ON TB_NOTA_CAB.COD_CADASTRO = C.COD_CAD' +
        'ASTRO'
      'LEFT JOIN TB_ESTADO E ON C.COD_ESTADO = E.COD_ESTADO'
      'LEFT JOIN TB_CIDADE I ON C.COD_CIDADE = I.COD_CIDADE'
      'LEFT JOIN TB_PAIS P ON C.COD_PAIS = P.COD_PAIS'
      'WHERE'
      '  TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      'AND'
      '  TB_OPERACAO.IND_LIVRO_FISCAL = '#39'S'#39
      '--AND'
      '  --TB_NOTA_CAB.DT_RECEBIMENTO BETWEEN :DT_INICIAL AND :DT_FINAL'
      'and'
      
        '  ((TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'E'#39' and TB_NOTA_CAB.DT_RECEB' +
        'IMENTO between :DT_INICIAL and :DT_FINAL)'
      'or'
      
        '  (TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'S'#39' and TB_NOTA_CAB.DT_EMISSA' +
        'O between :DT_INICIAL and :DT_FINAL))'
      'AND'
      '  TB_NOTA_CAB.COD_FILIAL = :COD_FILIAL'
      'AND'
      
        '  TB_SERIE.COD_SERIE_MODELO NOT IN ('#39'2D'#39', '#39'1A'#39', '#39'65'#39', '#39'98'#39') --n'#227 +
        'o deve sair cupom fiscal'
      'UNION'
      ''
      'SELECT'
      '  DISTINCT'
      '  C.COD_CADASTRO + 0.00 ,'
      '  C.NOME,'
      '  P.COD_PAIS_IBGE + 0.00 ,'
      '  decode(C.IND_FISICA_JURIDICA, '#39'J'#39', C.NUM_CGC_CPF, '#39#39'),'
      '  decode(C.IND_FISICA_JURIDICA, '#39'F'#39', C.NUM_CGC_CPF, '#39#39'),'
      '  C.NUM_INSCRICAO,'
      '  E.COD_UF_IBGE + 0.00,'
      '  I.COD_CIDADE_IBGE,'
      '  C.DESC_SUFRAMA,'
      '  C.DESC_ENDERECO,'
      '  C.DESC_COMPLEMENTO,'
      '  C.DESC_BAIRRO,'
      '  E.DESC_SIGLA_ESTADO,'
      '  C.DESC_INSCRICAO_MUNICIPAL,'
      '  C.IND_FISICA_JURIDICA'
      'FROM'
      '  TB_NOTA_ITEM'
      
        'INNER JOIN TB_NOTA_CAB ON TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITE' +
        'M.COD_NOTA_CAB'
      
        'INNER JOIN TB_OPERACAO ON TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO' +
        '.COD_OPERACAO'
      
        'INNER JOIN TB_PRODUTO ON TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.C' +
        'OD_PRODUTO'
      
        'INNER JOIN TB_CADASTRO C ON TB_NOTA_CAB.COD_TRANSPORTADOR = C.CO' +
        'D_CADASTRO'
      
        'INNER JOIN TB_SERIE ON (TB_NOTA_CAB.COD_SERIE = TB_SERIE.COD_SER' +
        'IE AND TB_SERIE.COD_FILIAL = TB_NOTA_CAB.COD_FILIAL)'
      'LEFT JOIN TB_ESTADO E ON C.COD_ESTADO = E.COD_ESTADO'
      'LEFT JOIN TB_CIDADE I ON C.COD_CIDADE = I.COD_CIDADE'
      'LEFT JOIN TB_PAIS P ON C.COD_PAIS = P.COD_PAIS'
      'where'
      '  --TB_NOTA_CAB.DT_RECEBIMENTO BETWEEN :DT_INICIAL AND :DT_FINAL'
      
        '  ((TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'E'#39' and TB_NOTA_CAB.DT_RECEB' +
        'IMENTO between :DT_INICIAL and :DT_FINAL)'
      'or'
      
        '  (TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'S'#39' and TB_NOTA_CAB.DT_EMISSA' +
        'O between :DT_INICIAL and :DT_FINAL))'
      'AND'
      '  TB_NOTA_CAB.COD_FILIAL = :COD_FILIAL'
      'AND'
      '  TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'S'#39
      '/*'
      'AND'
      '  TB_NOTA_CAB.DESC_PLACA IS NOT NULL'
      '*/'
      'AND'
      '  TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      'AND'
      '  TB_NOTA_CAB.VAL_FRETE > 0'
      'AND'
      '  TB_OPERACAO.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      '  TB_NOTA_CAB.COD_SERIE_MODELO NOT IN ('#39'2D'#39', '#39'1A'#39', '#39'65'#39', '#39'98'#39')'
      'AND'
      '  TB_NOTA_CAB.COD_OPERACAO_CF IS NOT NULL'
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
      '  C.NUM_INSCRICAO,'
      '  E.COD_UF_IBGE + 0.00,'
      '  I.COD_CIDADE_IBGE,'
      '  C.DESC_SUFRAMA,'
      '  C.DESC_ENDERECO,'
      '  C.DESC_COMPLEMENTO,'
      '  C.DESC_BAIRRO,'
      '  E.DESC_SIGLA_ESTADO,'
      '  C.DESC_INSCRICAO_MUNICIPAL,'
      '  C.IND_FISICA_JURIDICA'
      'FROM'
      '  TB_CONHECIMENTO'
      
        'INNER JOIN TB_SERIE ON TB_CONHECIMENTO.COD_SERIE = TB_SERIE.COD_' +
        'SERIE'
      
        'INNER JOIN TB_FILIAL ON TB_CONHECIMENTO.COD_FILIAL = TB_FILIAL.C' +
        'OD_FILIAL'
      
        'INNER JOIN TB_TRIBUTACAO ON TB_CONHECIMENTO.COD_TRIBUTACAO = TB_' +
        'TRIBUTACAO.COD_TRIBUTACAO'
      
        'INNER JOIN TB_OPERACAO ON TB_CONHECIMENTO.COD_OPERACAO = TB_OPER' +
        'ACAO.COD_OPERACAO'
      
        'INNER JOIN TB_CADASTRO C ON NVL(TB_CONHECIMENTO.COD_CADASTRO, TB' +
        '_CONHECIMENTO.COD_CADASTRO_TOMADOR) = C.COD_CADASTRO'
      'LEFT JOIN TB_ESTADO E ON C.COD_ESTADO = E.COD_ESTADO'
      'LEFT JOIN TB_CIDADE I ON C.COD_CIDADE = I.COD_CIDADE'
      'LEFT JOIN TB_PAIS P ON C.COD_PAIS = P.COD_PAIS'
      'WHERE'
      '  TB_CONHECIMENTO.IND_SITUACAO = '#39'2'#39
      'AND'
      
        '  TB_CONHECIMENTO.DT_RECEBIMENTO BETWEEN :DT_INICIAL AND :DT_FIN' +
        'AL'
      'AND'
      '  TB_CONHECIMENTO.COD_FILIAL = :COD_FILIAL'
      'AND'
      '  TB_OPERACAO.IND_LIVRO_FISCAL = '#39'S'#39
      ''
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
      '  C.NUM_INSCRICAO,'
      '  E.COD_UF_IBGE + 0.00,'
      '  I.COD_CIDADE_IBGE,'
      '  C.DESC_SUFRAMA,'
      '  C.DESC_ENDERECO,'
      '  C.DESC_COMPLEMENTO,'
      '  C.DESC_BAIRRO,'
      '  E.DESC_SIGLA_ESTADO,'
      '  C.DESC_INSCRICAO_MUNICIPAL,'
      '  C.IND_FISICA_JURIDICA'
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
      
        '  TB_CONHECIMENTO_FRETE.DT_RECEBIMENTO between :DT_INICIAL and :' +
        'DT_FINAL'
      'AND'
      '  TB_CONHECIMENTO_FRETE.COD_FILIAL = :COD_FILIAL'
      'AND'
      '  TB_OPERACAO.IND_LIVRO_FISCAL = '#39'S'#39
      ''
      'union all'
      ''
      'SELECT'
      '  DISTINCT'
      '  C.COD_CADASTRO + 0.00 as COD_CADASTRO,'
      '  C.NOME,'
      '  P.COD_PAIS_IBGE + 0.00 AS COD_PAIS_IBGE,'
      
        '  decode(C.IND_FISICA_JURIDICA, '#39'J'#39', C.NUM_CGC_CPF, '#39#39') as DESC_' +
        'CNPJ,'
      
        '  decode(C.IND_FISICA_JURIDICA, '#39'F'#39', C.NUM_CGC_CPF, '#39#39') as DESC_' +
        'CPF,'
      '  C.NUM_INSCRICAO,'
      '  E.COD_UF_IBGE + 0.00 as COD_UF_IBGE,'
      '  I.COD_CIDADE_IBGE,'
      '  C.DESC_SUFRAMA,'
      '  C.DESC_ENDERECO,'
      '  C.DESC_COMPLEMENTO,'
      '  C.DESC_BAIRRO,'
      '  E.DESC_SIGLA_ESTADO,'
      '  C.DESC_INSCRICAO_MUNICIPAL,'
      '  C.IND_FISICA_JURIDICA'
      'FROM'
      '  TB_NOTA_CAB N'
      'INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO_CF = O.COD_OPERACAO'
      
        'INNER JOIN TB_SERIE ON (N.COD_SERIE_CF = TB_SERIE.COD_SERIE AND ' +
        'TB_SERIE.COD_FILIAL = N.COD_FILIAL)'
      
        'INNER JOIN TB_TRIBUTACAO ON N.COD_TRIBUTACAO_FRETE = TB_TRIBUTAC' +
        'AO.COD_TRIBUTACAO'
      'INNER JOIN TB_FILIAL ON N.COD_FILIAL = TB_FILIAL.COD_FILIAL'
      'INNER JOIN (SELECT COD_CADASTRO,'
      '            NOME,'
      '            IND_FISICA_JURIDICA,'
      '            NUM_INSCRICAO,'
      '            DESC_SUFRAMA,'
      '            DESC_ENDERECO,'
      '            DESC_COMPLEMENTO,'
      '            DESC_BAIRRO,'
      '            COD_ESTADO,'
      '            COD_CIDADE,'
      '            COD_PAIS,'
      '            NUM_CGC_CPF,'
      
        '            DESC_INSCRICAO_MUNICIPAL FROM TB_CADASTRO) C ON N.CO' +
        'D_TRANSPORTADOR = C.COD_CADASTRO'
      ''
      
        'INNER JOIN TB_OPERACAO O_NOTA ON N.COD_OPERACAO = O_NOTA.COD_OPE' +
        'RACAO'
      
        'INNER JOIN TB_SERIE TB_SERIE_NOTA ON (N.COD_SERIE_CF = TB_SERIE_' +
        'NOTA.COD_SERIE AND TB_SERIE_NOTA.COD_FILIAL = N.COD_FILIAL)'
      
        'INNER JOIN TB_CADASTRO TB_CADASTRO_NOTA ON N.COD_TRANSPORTADOR =' +
        ' TB_CADASTRO_NOTA.COD_CADASTRO'
      ''
      'LEFT JOIN TB_ESTADO E ON C.COD_ESTADO = E.COD_ESTADO'
      'LEFT JOIN TB_CIDADE I ON C.COD_CIDADE = I.COD_CIDADE'
      'LEFT JOIN TB_PAIS P ON C.COD_PAIS = P.COD_PAIS'
      'WHERE'
      '  N.IND_SITUACAO <> '#39'1'#39
      'AND'
      '  O_NOTA.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      '  (O_NOTA.NUM_LIVROS <> 10 or O_NOTA.NUM_LIVROS is null)'
      'AND'
      '  N.COD_FILIAL = :COD_FILIAL'
      'and'
      ' N.DT_RECEBIMENTO between :DT_INICIAL AND :DT_FINAL'
      
        '  --((N.IND_ENTRADA_SAIDA = '#39'E'#39' and N.DT_RECEBIMENTO between :DT' +
        '_INICIAL and :DT_FINAL)'
      'or'
      
        '  --(N.IND_ENTRADA_SAIDA = '#39'S'#39' and N.DT_EMISSAO between :DT_INIC' +
        'IAL and :DT_FINAL))'
      
        '  NVL(DT_EMISSAO_CF, N.DT_RECEBIMENTO) BETWEEN :DT_INICIAL AND :' +
        'DT_FINAL'
      'AND'
      '  N.COD_SERIE_MODELO NOT IN ('#39'2D'#39', '#39'1A'#39', '#39'65'#39', '#39'98'#39')'
      'AND'
      '  N.NUM_CONHECIMENTO_FRETE IS NOT NULL'
      'AND'
      '  N.IND_ENTRADA_SAIDA = '#39'E'#39
      'AND'
      '  N.IND_TIPO_FRETE = '#39'FOB'#39
      'AND'
      '  (N.DT_EMISSAO_CF IS NULL'
      '    OR N.DT_RECEBIMENTO BETWEEN :DT_INICIAL AND :DT_FINAL)'
      ''
      ''
      'UNION'
      ''
      'SELECT'
      '  DISTINCT'
      '  C.COD_CADASTRO + 0.00 as COD_CADASTRO,'
      '  C.NOME,'
      
        '  (SELECT P.COD_PAIS_IBGE + 0.00 FROM TB_PAIS P WHERE P.COD_PAIS' +
        ' = C.COD_PAIS) AS COD_PAIS_IBGE,'
      
        '  decode(C.IND_FISICA_JURIDICA, '#39'J'#39', C.NUM_CGC_CPF, '#39#39') as DESC_' +
        'CNPJ,'
      
        '  decode(C.IND_FISICA_JURIDICA, '#39'F'#39', C.NUM_CGC_CPF, '#39#39') as DESC_' +
        'CPF,'
      '  C.NUM_INSCRICAO,'
      
        '  (SELECT E.COD_UF_IBGE + 0.00 FROM TB_ESTADO E WHERE E.COD_ESTA' +
        'DO = C.COD_ESTADO) AS COD_UF_IBGE,'
      
        '  (SELECT CI.COD_CIDADE_IBGE FROM TB_CIDADE CI WHERE CI.COD_CIDA' +
        'DE = C.COD_CIDADE) AS COD_CIDADE_IBGE,'
      '  C.DESC_SUFRAMA,'
      '  C.DESC_ENDERECO,'
      '  C.DESC_COMPLEMENTO,'
      '  C.DESC_BAIRRO,'
      
        '  (SELECT E.DESC_SIGLA_ESTADO FROM TB_ESTADO E WHERE E.COD_ESTAD' +
        'O = C.COD_ESTADO) AS DESC_SIGLA_ESTADO,'
      '  C.DESC_INSCRICAO_MUNICIPAL,'
      '  C.IND_FISICA_JURIDICA'
      'FROM'
      '  TB_NOTA_ITEM I'
      'INNER JOIN TB_NOTA_CAB N '
      '    ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      'INNER JOIN TB_OPERACAO O '
      '    ON N.COD_OPERACAO = O.COD_OPERACAO'
      'INNER JOIN TB_SERIE S '
      
        '    ON (N.COD_SERIE = S.COD_SERIE AND S.COD_FILIAL = N.COD_FILIA' +
        'L)'
      'INNER JOIN TB_PRODUTO P '
      '    ON I.COD_PRODUTO = P.COD_PRODUTO'
      'INNER JOIN TB_FILIAL F '
      '    ON N.COD_FILIAL = F.COD_FILIAL'
      'INNER JOIN TB_CADASTRO C '
      '    ON N.COD_CADASTRO = C.COD_CADASTRO'
      'WHERE'
      
        '  ((P.IND_TIPO_PRODUTO = '#39'GAS'#39') OR (P.IND_TIPO_PRODUTO = '#39'ENERGI' +
        'A'#39') OR (P.IND_TIPO_PRODUTO = '#39'AGUA'#39'))'
      'AND'
      '  O.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      '  N.COD_FILIAL = :COD_FILIAL'
      'and  '
      '  N.DT_RECEBIMENTO between :DT_INICIAL AND :DT_FINAL'
      'and'
      
        '  ((N.IND_ENTRADA_SAIDA = '#39'E'#39' and N.DT_RECEBIMENTO between :DT_I' +
        'NICIAL and :DT_FINAL)'
      'or'
      
        '  (N.IND_ENTRADA_SAIDA = '#39'S'#39' and N.DT_EMISSAO between :DT_INICIA' +
        'L and :DT_FINAL))'
      '--AND'
      '--  S.DESC_MODELO = '#39'06'#39
      ''
      ''
      'UNION'
      ''
      'SELECT'
      '  DISTINCT'
      '  C.COD_CADASTRO + 0.00 as COD_CADASTRO,'
      '  C.NOME,'
      '  P.COD_PAIS_IBGE + 0.00 AS COD_PAIS_IBGE,'
      
        '  decode(C.IND_FISICA_JURIDICA, '#39'J'#39', C.NUM_CGC_CPF, '#39#39') as DESC_' +
        'CNPJ,'
      
        '  decode(C.IND_FISICA_JURIDICA, '#39'F'#39', C.NUM_CGC_CPF, '#39#39') as DESC_' +
        'CPF,'
      '  C.NUM_INSCRICAO,'
      '  E.COD_UF_IBGE + 0.00 as COD_UF_IBGE,'
      '  CI.COD_CIDADE_IBGE,'
      '  C.DESC_SUFRAMA,'
      '  C.DESC_ENDERECO,'
      '  C.DESC_COMPLEMENTO,'
      '  C.DESC_BAIRRO,'
      '  E.DESC_SIGLA_ESTADO,'
      '  C.DESC_INSCRICAO_MUNICIPAL,'
      '  C.IND_FISICA_JURIDICA'
      'FROM'
      '  TB_LIVRO_LCTO_IPI_ITEM LCTOITEM'
      
        'INNER JOIN TB_NOTA_ITEM I ON LCTOITEM.COD_NOTA_ITEM = I.COD_NOTA' +
        '_ITEM'
      'INNER JOIN TB_NOTA_CAB N ON I.COD_NOTA_CAB = N.COD_NOTA_CAB'
      'INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTRO'
      
        'INNER JOIN TB_LIVRO_LCTO_IPI LCTO ON LCTOITEM.COD_LIVRO_LCTO_IPI' +
        ' = LCTO.COD_LIVRO_LCTO_IPI'
      'LEFT JOIN TB_ESTADO E ON C.COD_ESTADO = E.COD_ESTADO'
      'LEFT JOIN TB_CIDADE CI ON C.COD_CIDADE = CI.COD_CIDADE'
      'LEFT JOIN TB_PAIS P ON C.COD_PAIS = P.COD_PAIS'
      'WHERE'
      '  LCTO.COD_FILIAL = :COD_FILIAL'
      '  AND'
      '  LCTO.NUM_ANO = EXTRACT(YEAR FROM TO_DATE(:DT_INICIAL))'
      '  AND'
      '  LCTO.NUM_MES = EXTRACT(MONTH FROM TO_DATE(:DT_INICIAL))'
      ')'
      'ORDER BY'
      '  NOME,'
      '  COD_CADASTRO')
    Variables.Data = {
      03000000030000000B0000003A44545F494E494349414C0C0000000000000000
      000000090000003A44545F46494E414C0C00000000000000000000000B000000
      3A434F445F46494C49414C030000000000000000000000}
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
    Left = 360
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
      '--registro 0190'
      ''
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
      
        'INNER JOIN TB_SERIE S ON S.COD_SERIE = N.COD_SERIE AND S.COD_FIL' +
        'IAL = N.COD_FILIAL AND S.COD_SERIE_MODELO = N.COD_SERIE_MODELO'
      'WHERE'
      '  N.DT_RECEBIMENTO BETWEEN :DT_INICIAL AND :DT_FINAL'
      'AND'
      '  N.COD_FILIAL = :COD_FILIAL'
      'AND'
      '  N.IND_SITUACAO = '#39'2'#39
      'AND'
      '  O.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      '  DESC_UNIDADE is not null'
      'AND'
      
        '  --((S.COD_SERIE_MODELO = '#39'55'#39' AND O.IND_EMITE <> '#39'F'#39') OR (S.CO' +
        'D_SERIE_MODELO <> '#39'55'#39'))'
      
        '  --(S.COD_SERIE_MODELO in ('#39'01'#39', '#39'1B'#39', '#39'04'#39') or (S.COD_SERIE_MO' +
        'DELO = '#39'55'#39' AND O.IND_EMITE <> '#39'F'#39'))'
      
        '  (((TB_PARAM_SISTEMA.COD_EMPRESA NOT IN ('#39'POLITHERM'#39')) AND (S.C' +
        'OD_SERIE_MODELO IN ('#39'01'#39', '#39'1B'#39', '#39'04'#39')) OR (S.COD_SERIE_MODELO = ' +
        #39'55'#39' AND O.IND_EMITE <> '#39'F'#39')) OR'
      
        '    ((TB_PARAM_SISTEMA.COD_EMPRESA IN ('#39'POLITHERM'#39')) AND (S.COD_' +
        'SERIE_MODELO IN ('#39'01'#39', '#39'1B'#39', '#39'04'#39') OR S.COD_SERIE_MODELO = '#39'55'#39')' +
        '))'
      'AND'
      '  S.COD_SERIE_MODELO NOT IN ('#39'06'#39','#39'08'#39','#39'8B'#39','#39'09'#39','#39'10'#39','#39'11'#39','#39'22'#39')'
      ''
      'UNION'
      ''
      'SELECT'
      '  distinct'
      '  P.DESC_UNIDADE'
      'FROM'
      '  TB_PARAM_SISTEMA,'
      '  TB_ESTOQUE_INVENTARIO INV'
      'INNER JOIN TB_PRODUTO P ON P.COD_PRODUTO = INV.COD_PRODUTO'
      'INNER JOIN TB_FILIAL F ON F.COD_FILIAL = INV.COD_FILIAL'
      
        'INNER JOIN TB_TRIBUTACAO T ON P.COD_TRIBUTACAO = T.COD_TRIBUTACA' +
        'O'
      'Where'
      '  INV.COD_FILIAL = :COD_FILIAL'
      'And'
      '  INV.NUM_ANO = :NUM_ANO'
      'And'
      '  INV.NUM_MES = :NUM_MES'
      'AND'
      
        '  ((COD_EMPRESA = '#39'ARZ'#39' AND P.IND_TIPO_PRODUTO IN ('#39'COMERCIAL'#39', ' +
        #39'INDUSTRIAL'#39'))'
      
        '    OR COD_EMPRESA <> '#39'ARZ'#39' AND P.IND_TIPO_PRODUTO NOT IN ('#39'IMOB' +
        'ILIZAD'#39', '#39'IMOBILIZADO'#39','#39'CONSUMO'#39'))  '
      'AND'
      '  P.IND_SITUACAO <> '#39'DESATIVADO'#39
      'AND'
      
        '  ((SELECT COUNT(*) FROM TB_FILIAL_INVENTARIO_MES X WHERE X.COD_' +
        'FILIAL = INV.COD_FILIAL AND X.NUM_MES = :MES_INV) > 0)'
      ''
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
      
        'INNER JOIN TB_SERIE S ON S.COD_SERIE = TB_NOTA_CAB.COD_SERIE AND' +
        ' S.COD_FILIAL = TB_NOTA_CAB.COD_FILIAL AND S.COD_SERIE_MODELO = ' +
        'TB_NOTA_CAB.COD_SERIE_MODELO'
      'Where'
      '  Tb_Nota_Cab.IND_SITUACAO = '#39'2'#39
      'AND'
      '  Tb_Operacao.IND_FIXAR_EMPRESA = '#39'F'#39
      'AND'
      '  TB_NOTA_CAB.DT_RECEBIMENTO BETWEEN :DT_INICIAL AND :DT_FINAL'
      'AND'
      '  TB_NOTA_CAB.COD_FILIAL = :COD_FILIAL'
      'AND'
      '  TB_OPERACAO.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      '  DESC_UNIDADE is not null'
      'AND'
      
        '  --((S.COD_SERIE_MODELO = '#39'55'#39' AND TB_OPERACAO.IND_EMITE <> '#39'F'#39 +
        ') OR (S.COD_SERIE_MODELO <> '#39'55'#39'))'
      
        '  (S.COD_SERIE_MODELO in ('#39'01'#39', '#39'1B'#39', '#39'04'#39') or (S.COD_SERIE_MODE' +
        'LO = '#39'55'#39' AND TB_OPERACAO.IND_EMITE <> '#39'F'#39'))'
      'AND'
      '  S.COD_SERIE_MODELO NOT IN ('#39'06'#39','#39'08'#39','#39'8B'#39','#39'09'#39','#39'10'#39','#39'11'#39','#39'22'#39')'
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
      '  TB_NOTA_CAB.COD_FILIAL = :COD_FILIAL'
      'AND'
      '  TB_OPERACAO.IND_LIVRO_FISCAL = '#39'S'#39
      ''
      'UNION ALL'
      ''
      '-- TB_CONHECIMENTO (REGISTRO 1400)'
      'SELECT DISTINCT'
      '  UPPER(P.DESC_UNIDADE)'
      'FROM'
      '  TB_CONHECIMENTO CO    '
      '    INNER JOIN TB_SERIE S'
      '      ON CO.COD_SERIE = S.COD_SERIE'
      '        AND CO.COD_SERIE_MODELO = S.COD_SERIE_MODELO'
      '    INNER JOIN TB_FILIAL F'
      '      ON CO.COD_FILIAL = F.COD_FILIAL'
      '    INNER JOIN TB_OPERACAO O'
      '      ON CO.COD_OPERACAO = O.COD_OPERACAO'
      '    INNER JOIN TB_PRODUTO P'
      '      ON CO.COD_PRODUTO = P.COD_PRODUTO    '
      'WHERE'
      '  CO.IND_SITUACAO = '#39'2'#39
      '  AND'
      '  O.IND_LIVRO_FISCAL = '#39'S'#39
      '  AND'
      '  (O.NUM_LIVROS = 10 or O.NUM_LIVROS is null)'
      '  AND'
      '  CO.COD_FILIAL = :COD_FILIAL  '
      '  AND'
      '  CO.DT_EMISSAO BETWEEN :DT_INICIAL AND :DT_FINAL'
      '  AND'
      '  S.COD_SERIE_MODELO IN ('#39'08'#39', '#39'57'#39')'
      '  AND'
      
        '  REGEXP_REPLACE(F.DESC_CNAE, '#39'[^0-9]+'#39') = '#39'49302'#39' -- servi'#231'o de' +
        ' transporte'
      ''
      'UNION ALL'
      ''
      '-- TB_NOTA_CAB ( FRETE INCLUSO NA NOTA )'
      'SELECT DISTINCT'
      '  UPPER(P.DESC_UNIDADE)'
      'FROM'
      '  TB_PARAM_SISTEMA PS,'
      '  TB_NOTA_ITEM I'
      '    INNER JOIN TB_NOTA_CAB N'
      '      ON I.COD_NOTA_CAB = N.COD_NOTA_CAB'
      '    INNER JOIN TB_OPERACAO O'
      '      ON N.COD_OPERACAO = O.COD_OPERACAO'
      '    INNER JOIN TB_SERIE S'
      '      ON N.COD_SERIE = S.COD_SERIE'
      '        AND N.COD_SERIE_MODELO = S.COD_SERIE_MODELO'
      '    INNER JOIN TB_FILIAL F'
      '      ON N.COD_FILIAL = F.COD_FILIAL    '
      '    INNER JOIN TB_PRODUTO P'
      '      ON I.COD_PRODUTO = P.COD_PRODUTO    '
      'WHERE'
      '  N.IND_ENTRADA_SAIDA = '#39'S'#39
      '  AND  '
      '  N.IND_SITUACAO = '#39'2'#39
      '  AND'
      '  O.IND_LIVRO_FISCAL = '#39'S'#39
      '  AND'
      '  (O.NUM_LIVROS = 10 or O.NUM_LIVROS is null)'
      '  AND'
      '  N.COD_FILIAL = :COD_FILIAL  '
      '  AND'
      '  N.DT_EMISSAO BETWEEN :DT_INICIAL AND :DT_FINAL'
      '  AND'
      '  S.COD_SERIE_MODELO IN ('#39'08'#39', '#39'57'#39')'
      '  AND'
      
        '  REGEXP_REPLACE(F.DESC_CNAE, '#39'[^0-9]+'#39') = '#39'49302'#39' -- servi'#231'o de' +
        ' transporte'
      ')'
      'ORDER BY'
      '  TRIM(DESC_UNIDADE)'
      ' ')
    Variables.Data = {
      03000000060000000B0000003A44545F494E494349414C0C0000000000000000
      000000090000003A44545F46494E414C0C00000000000000000000000B000000
      3A434F445F46494C49414C030000000000000000000000080000003A4E554D5F
      414E4F030000000000000000000000080000003A4E554D5F4D45530300000000
      00000000000000080000003A4D45535F494E56030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {04000000010000000C000000444553435F554E4944414445010000000000}
    Session = DMOracle.DBCemapa
    Left = 24
    Top = 72
    object QReg190DESC_UNIDADE: TStringField
      FieldName = 'DESC_UNIDADE'
      Size = 3
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
      '  TB_PARAM_SISTEMA PARAM,'
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
      
        '  ((O_N.IND_LIVRO_FISCAL = '#39'S'#39' AND I.COD_OPERACAO is null) OR (O' +
        '_I.IND_LIVRO_FISCAL = '#39'S'#39' AND I.COD_OPERACAO is not null))'
      '--AND'
      '--  O_N.IND_TELECOMUNICACAO <> '#39'S'#39
      'AND'
      '  N.IND_SITUACAO = '#39'2'#39
      'AND'
      
        '  (((O_N.NUM_LIVROS <> 10 or O_N.NUM_LIVROS is null) AND I.COD_O' +
        'PERACAO is null) OR ((O_I.NUM_LIVROS <> 10 or O_I.NUM_LIVROS is ' +
        'null) AND I.COD_OPERACAO is not null))'
      'AND'
      
        '((((S.COD_SERIE_MODELO = '#39'55'#39' AND O_N.IND_EMITE <> '#39'F'#39') OR (S.CO' +
        'D_SERIE_MODELO <> '#39'55'#39')) AND PARAM.COD_EMPRESA NOT IN ('#39'POLITHER' +
        'M'#39'))'
      
        'OR (((PARAM.COD_EMPRESA IN ('#39'POLITHERM'#39'))) AND (S.COD_SERIE_MODE' +
        'LO = '#39'55'#39' AND O_N.IND_EMITE IN ('#39'F'#39','#39'N'#39')) OR (S.COD_SERIE_MODELO' +
        ' <> '#39'55'#39')))'
      'AND'
      
        '(NOT S.COD_SERIE_MODELO IN ('#39'2D'#39','#39'06'#39','#39'21'#39','#39'22'#39','#39'65'#39','#39'98'#39', '#39'66'#39')' +
        ')'
      
        '--  (S.COD_SERIE_MODELO in ('#39'01'#39', '#39'1B'#39', '#39'04'#39') OR (S.COD_SERIE_MO' +
        'DELO = '#39'55'#39' AND O_N.IND_EMITE <> '#39'F'#39'))')
    Variables.Data = {
      03000000030000000B0000003A44545F494E494349414C0C0000000000000000
      000000090000003A44545F46494E414C0C00000000000000000000000B000000
      3A434F445F46494C49414C030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000020000000C000000434F445F4F5045524143414F0100000000000D00
      0000444553435F4F5045524143414F010000000000}
    Session = DMOracle.DBCemapa
    Left = 136
    Top = 72
    object QReg400COD_OPERACAO: TFloatField
      FieldName = 'COD_OPERACAO'
    end
    object QReg400DESC_OPERACAO: TStringField
      FieldName = 'DESC_OPERACAO'
      Size = 30
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
      'AND'
      
        '  S.COD_SERIE_MODELO in ('#39'01'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39') AND O.IND_EMITE' +
        ' = '#39'F'#39
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
        'IE AND'
      
        #9'TB_NOTA_CAB.COD_FILIAL = TB_SERIE.COD_FILIAL AND TB_NOTA_CAB.CO' +
        'D_SERIE_MODELO = TB_SERIE.COD_SERIE_MODELO)'
      
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
      '  TB_CONHECIMENTO.COD_SERIE_MODELO = TB_SERIE.COD_SERIE_MODELO'
      '  AND'
      '  TB_CONHECIMENTO.COD_FILIAL = TB_SERIE.COD_FILIAL'
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
      '  AND'
      '  TB_NOTA_CAB.COD_FILIAL = TB_SERIE.COD_FILIAL'
      '  AND'
      '  TB_NOTA_CAB.COD_SERIE_MODELO = TB_SERIE.COD_SERIE_MODELO'
      '  And'
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
      '*/')
    Variables.Data = {
      03000000030000000B0000003A434F445F46494C49414C030000000000000000
      000000090000003A444154415F494E490C000000000000000000000009000000
      3A444154415F46494E0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000020000000C000000434F445F4D454E534147454D0100000000000D00
      0000444553435F4D454E534147454D010000000000}
    Session = DMOracle.DBCemapa
    Left = 192
    Top = 72
    object QReg450COD_MENSAGEM: TFloatField
      FieldName = 'COD_MENSAGEM'
    end
    object QReg450DESC_MENSAGEM: TStringField
      FieldName = 'DESC_MENSAGEM'
      Size = 564
    end
  end
  object QReg460: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  DISTINCT'
      '  *'
      'FROM'
      '('
      'SELECT'
      '  DISTINCT'
      '  TB_NOTA_CAB.COD_NOTA_CAB AS COD_OBS,'
      '  /*'
      '  Trim(OBS)  || '#39'   '#39' ||'
      '  trim(OBS_COMPLEMENTO)   as DESC_MENSAGEM'
      
        '  */ -- Foi alterado para pegar informa'#231#245'es dos itens (registro ' +
        'C195)'
      '  TB_NOTA_CAB.DESC_OBS_AJUSTE_FISCAL AS DESC_MENSAGEM'
      'FROM'
      '  TB_NOTA_ITEM'
      
        'INNER JOIN TB_NOTA_CAB ON TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITE' +
        'M.COD_NOTA_CAB'
      
        'INNER JOIN TB_OPERACAO ON TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO' +
        '.COD_OPERACAO'
      
        'INNER JOIN TB_SERIE ON (TB_NOTA_CAB.COD_SERIE = TB_SERIE.COD_SER' +
        'IE AND TB_SERIE.COD_FILIAL = TB_NOTA_CAB.COD_FILIAL'
      #9'AND TB_NOTA_CAB.COD_SERIE_MODELO = TB_SERIE.COD_SERIE_MODELO)'
      
        'INNER JOIN TB_CADASTRO C ON TB_NOTA_CAB.COD_CADASTRO = C.COD_CAD' +
        'ASTRO'
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
      '  TB_SERIE.COD_SERIE_MODELO IN ( '#39'01'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39' )'
      'AND'
      '  TB_NOTA_CAB.DESC_OBS_AJUSTE_FISCAL IS NOT NULL'
      'AND'
      
        '  TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'E'#39' -- Por enquanto, somente p' +
        'ara entradas'
      'AND'
      '  (:COD_NOTA IS NULL OR TB_NOTA_CAB.COD_NOTA_CAB = :COD_NOTA)'
      '/*'
      'UNION'
      ''
      'SELECT'
      '  DISTINCT'
      '  Trim(OBS)  || '#39'   '#39' ||'
      '  trim(OBS_COMPLEMENTO)   as DESC_MENSAGEM'
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
      '*/'
      ')')
    Variables.Data = {
      03000000040000000B0000003A44545F494E494349414C0C0000000000000000
      000000090000003A44545F46494E414C0C00000000000000000000000B000000
      3A434F445F46494C49414C030000000000000000000000090000003A434F445F
      4E4F5441030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000020000000D000000444553435F4D454E534147454D01000000000007
      000000434F445F4F4253010000000000}
    Session = DMOracle.DBCemapa
    Left = 248
    Top = 72
    object QReg460DESC_MENSAGEM: TStringField
      FieldName = 'DESC_MENSAGEM'
      Size = 123
    end
    object QReg460COD_OBS: TIntegerField
      FieldName = 'COD_OBS'
      Required = True
    end
  end
  object QReg007: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_PARAM_SISTEMA.COD_ENTIDADE_CONTABIL,'
      
        '  TB_FILIAL.DESC_INSCRICAO -- estava o NUM_NIRE, sabe-se l'#225' porq' +
        'ue'
      'FROM'
      '  TB_FILIAL, TB_PARAM_SISTEMA'
      'WHERE'
      '  TB_FILIAL.COD_FILIAL IN :FILIAIS')
    Variables.Data = {
      0300000001000000080000003A46494C4941495301000000230000002853454C
      45435420434F445F46494C49414C2046524F4D2054425F46494C49414C290000
      000000}
    QBEDefinition.QBEFieldDefs = {
      040000000200000015000000434F445F454E5449444144455F434F4E54414249
      4C0100000000000E000000444553435F494E5343524943414F010000000000}
    Session = DMOracle.DBCemapa
    Left = 192
    Top = 16
    object QReg007COD_ENTIDADE_CONTABIL: TStringField
      FieldName = 'COD_ENTIDADE_CONTABIL'
      Size = 2
    end
    object QReg007DESC_INSCRICAO: TStringField
      FieldName = 'DESC_INSCRICAO'
      Size = 12
    end
  end
  object QReg020: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  '#39'0'#39' AS IND_DESC,'
      '  NUM_CGC,'
      '  E.DESC_SIGLA_ESTADO,'
      '  DESC_INSCRICAO,'
      '  (C.COD_CIDADE_IBGE || E.COD_UF_IBGE) AS COD_CIDADE_IBGE,'
      '  DESC_INSCRICAO_MUNICIPAL,'
      '  NUM_NIRE'
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
      0400000007000000080000004E554D5F4E495245010000000000070000004E55
      4D5F43474301000000000011000000444553435F5349474C415F45535441444F
      0100000000000E000000444553435F494E5343524943414F0100000000000F00
      0000434F445F4349444144455F4942474501000000000018000000444553435F
      494E5343524943414F5F4D554E49434950414C01000000000008000000494E44
      5F44455343010000000000}
    Session = DMOracle.DBCemapa
    Left = 248
    Top = 16
    object QReg020IND_DESC: TStringField
      FieldName = 'IND_DESC'
      Size = 1
    end
    object QReg020NUM_CGC: TStringField
      FieldName = 'NUM_CGC'
      Size = 18
    end
    object QReg020DESC_SIGLA_ESTADO: TStringField
      FieldName = 'DESC_SIGLA_ESTADO'
      Size = 2
    end
    object QReg020DESC_INSCRICAO: TStringField
      FieldName = 'DESC_INSCRICAO'
      Size = 12
    end
    object QReg020COD_CIDADE_IBGE: TStringField
      FieldName = 'COD_CIDADE_IBGE'
      Size = 45
    end
    object QReg020DESC_INSCRICAO_MUNICIPAL: TStringField
      FieldName = 'DESC_INSCRICAO_MUNICIPAL'
      Size = 15
    end
    object QReg020NUM_NIRE: TStringField
      FieldName = 'NUM_NIRE'
      Size = 11
    end
  end
  object QReg210: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  BI.COD_PRODUTO AS COD_ITEM_COMP,'
      '  SUM(BI.QT_USADA) AS QTD_COMP,'
      '  SUM('
      '    CASE'
      
        '      WHEN 1 - B.QT_FABRICADO_VARIACAO / (B.QT_FABRICADO * F.QT_' +
        'PRODUCAO) > 0 THEN'
      
        '        ABS(1 - B.QT_FABRICADO_VARIACAO / (B.QT_FABRICADO * F.QT' +
        '_PRODUCAO))'
      '      ELSE'
      '        0'
      '    END '
      '  )AS PERDA'
      'FROM'
      '  TB_BOLETIM_ITEM BI'
      '  INNER JOIN TB_BOLETIM B ON BI.COD_BOLETIM = B.COD_BOLETIM'
      '  INNER JOIN TB_FORMULA F ON B.COD_FORMULA = F.COD_FORMULA'
      '  INNER JOIN TB_PRODUTO P ON F.COD_PRODUTO = P.COD_PRODUTO'
      'WHERE  '
      '  B.DT_BOLETIM BETWEEN :DT_INI AND :DT_FIN'
      '  AND'
      '  B.COD_FILIAL = :FILIAL'
      '  AND'
      '  F.COD_PRODUTO = :COD_PRODUTO'
      '  AND'
      '  :BLOCOK'
      'GROUP BY'
      '  BI.COD_PRODUTO'
      ''
      '/*UNION'
      ''
      'SELECT'
      '  FI.COD_PRODUTO AS COD_ITEM_COMP,'
      '  SUM(QT_ITEM) AS QTD_COMP,'
      '  0 AS PERDA'
      'FROM'
      '  TB_PARAM_SISTEMA,'
      '  TB_FORMULA_ITEM FI'
      
        '  INNER JOIN TB_ORDEM_PRODUCAO_ITEM I ON FI.COD_FORMULA = I.COD_' +
        'FORMULA'
      
        '  INNER JOIN TB_ORDEM_PRODUCAO_CAB O ON I.COD_ORDEM_PRODUCAO_CAB' +
        ' = O.COD_ORDEM_PRODUCAO_CAB'
      '  INNER JOIN TB_FORMULA F ON FI.COD_FORMULA = F.COD_FORMULA'
      'WHERE'
      '  O.DT_PRODUCAO BETWEEN :DT_INI AND :DT_FIN'
      '  AND'
      '  F.COD_FILIAL = :FILIAL'
      '  AND'
      '  I.COD_PRODUTO = :COD_PRODUTO'
      '  AND'
      '  TB_PARAM_SISTEMA.COD_EMPRESA <> '#39'CGS'#39
      'GROUP BY'
      '  FI.COD_PRODUTO,'
      '  0'
      '*/  '
      'UNION'
      ''
      '--SOMENTE CGS  '
      'SELECT'
      '  FI.COD_PRODUTO AS COD_ITEM_COMP,'
      '  SUM(QT_ITEM) AS QTD_COMP,'
      '  0 AS PERDA'
      'FROM'
      '  TB_PARAM_SISTEMA,'
      '  TB_FORMULA_ITEM FI  '
      '  INNER JOIN TB_FORMULA F ON FI.COD_FORMULA = F.COD_FORMULA'
      
        '  INNER JOIN TB_ORDEM_PRODUCAO_ITEM I ON F.COD_PRODUTO = I.COD_P' +
        'RODUTO'
      
        '  INNER JOIN TB_ORDEM_PRODUCAO_CAB O ON I.COD_ORDEM_PRODUCAO_CAB' +
        ' = O.COD_ORDEM_PRODUCAO_CAB'
      'WHERE'
      '  O.DT_PRODUCAO BETWEEN :DT_INI AND :DT_FIN'
      '  AND'
      '  I.COD_PRODUTO = :COD_PRODUTO'
      '  AND'
      '  TB_PARAM_SISTEMA.COD_EMPRESA = '#39'CGS'#39
      '  AND'
      '  :BLOCOK'
      'GROUP BY'
      '  FI.COD_PRODUTO,'
      '  0')
    Variables.Data = {
      0300000005000000070000003A44545F494E490C000000000000000000000007
      0000003A44545F46494E0C00000000000000000000000C0000003A434F445F50
      524F4455544F030000000000000000000000070000003A46494C49414C030000
      000000000000000000070000003A424C4F434F4B010000000600000031203D20
      300000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000030000000D000000434F445F4954454D5F434F4D5001000000000008
      0000005154445F434F4D50010000000000050000005045524441010000000000}
    Session = DMOracle.DBCemapa
    Left = 304
    Top = 72
    object QReg210COD_ITEM_COMP: TIntegerField
      FieldName = 'COD_ITEM_COMP'
      Required = True
    end
    object QReg210QTD_COMP: TFloatField
      FieldName = 'QTD_COMP'
      Required = True
    end
    object QReg210PERDA: TFloatField
      FieldName = 'PERDA'
    end
  end
  object QReg002: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  COD_CLASSIFICACAO_CONTRIB_IPI'
      'FROM'
      '  TB_FILIAL'
      'WHERE'
      '  COD_FILIAL = :COD_FILIAL')
    Variables.Data = {
      03000000010000000B0000003A434F445F46494C49414C030000000000000000
      000000}
    QBEDefinition.QBEFieldDefs = {
      04000000010000001D000000434F445F434C415353494649434143414F5F434F
      4E545249425F495049010000000000}
    Session = DMOracle.DBCemapa
    Left = 80
    Top = 16
    object QReg002COD_CLASSIFICACAO_CONTRIB_IPI: TStringField
      FieldName = 'COD_CLASSIFICACAO_CONTRIB_IPI'
      Size = 2
    end
  end
  object QReg221: TOracleDataSet1
    SQL.Strings = (
      '-- reg 0221 correla'#231#227'o de produtos por unidades'
      'select '
      #9'COD_PRODUTO, '
      #9'COD_PRODUTO_BAIXA, '
      
        #9'(SELECT DESC_UNIDADE FROM TB_PRODUTO WHERE COD_PRODUTO = COD_PR' +
        'ODUTO_BAIXA) as DESC_UNIDADE, '
      #9'QT_BAIXA '
      'FROM TB_ESTOQUE_BAIXAR'
      'where'
      'COD_PRODUTO = :COD_PRODUTO')
    Variables.Data = {
      03000000010000000C0000003A434F445F50524F4455544F0300000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      04000000040000000B000000434F445F50524F4455544F0100000000000C0000
      00444553435F554E494441444501000000000011000000434F445F50524F4455
      544F5F42414958410100000000000800000051545F4241495841010000000000}
    Session = DMOracle.DBCemapa
    Left = 360
    Top = 72
    object QReg221COD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QReg221COD_PRODUTO_BAIXA: TIntegerField
      FieldName = 'COD_PRODUTO_BAIXA'
      Required = True
    end
    object QReg221DESC_UNIDADE: TStringField
      FieldName = 'DESC_UNIDADE'
      Size = 3
    end
    object QReg221QT_BAIXA: TFloatField
      FieldName = 'QT_BAIXA'
    end
  end
end
