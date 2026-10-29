object DmFContJ: TDmFContJ
  OldCreateOrder = False
  Left = 576
  Top = 350
  Height = 150
  Width = 220
  object QReg930: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  C.NOME AS IDENT_NOM,'
      '  C.NUM_CGC_CPF AS IDENT_CPF_CNPJ,'
      
        '  SUBSTR(TRIM(C.DESC_QUALIFICACAO), 7, LENGTH(TRIM(C.DESC_QUALIF' +
        'ICACAO))) AS IDENT_QUALIF,'
      '  SUBSTR(TRIM(C.DESC_QUALIFICACAO),0, 3) AS COD_ASSIN,'
      '  TRIM(C.DESC_CRC) AS IND_CRC'
      'FROM'
      '  TB_FILIAL F '
      '    INNER JOIN TB_CADASTRO C ON'
      '    F.COD_CADASTRO_CONTABILISTA = C.COD_CADASTRO'
      'WHERE'
      '  F.COD_FILIAL = :FILIAL'
      '  '
      'UNION'
      ''
      'SELECT'
      '  C.NOME AS IDENT_NOM,'
      '  C.NUM_CGC_CPF AS IDENT_CPF_CNPJ,'
      
        '  SUBSTR(TRIM(C.DESC_QUALIFICACAO), 7, LENGTH(TRIM(C.DESC_QUALIF' +
        'ICACAO))) AS IDENT_QUALIF,'
      '  SUBSTR(TRIM(C.DESC_QUALIFICACAO),0, 3) AS COD_ASSIN,'
      '  TRIM(C.DESC_CRC) AS IND_CRC'
      'FROM'
      '  TB_FILIAL F '
      '    INNER JOIN TB_CADASTRO C ON'
      '    F.COD_CADASTRO_RESPONSAVEL = C.COD_CADASTRO'
      'WHERE'
      '  F.COD_FILIAL = :FILIAL'
      '  ')
    Variables.Data = {0300000001000000070000003A46494C49414C030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000005000000090000004944454E545F4E4F4D0100000000000E00000049
      44454E545F4350465F434E504A0100000000000C0000004944454E545F515541
      4C494601000000000009000000434F445F415353494E01000000000007000000
      494E445F435243010000000000}
    Session = DMOracle.DBCemapa
    Left = 16
    Top = 16
    object QReg930IDENT_NOM: TStringField
      FieldName = 'IDENT_NOM'
      Size = 60
    end
    object QReg930IDENT_CPF_CNPJ: TStringField
      FieldName = 'IDENT_CPF_CNPJ'
      Size = 18
    end
    object QReg930IDENT_QUALIF: TStringField
      FieldName = 'IDENT_QUALIF'
      Size = 94
    end
    object QReg930COD_ASSIN: TStringField
      FieldName = 'COD_ASSIN'
      Size = 3
    end
    object QReg930IND_CRC: TStringField
      FieldName = 'IND_CRC'
      Size = 10
    end
  end
end
