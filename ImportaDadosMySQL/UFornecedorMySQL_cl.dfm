object DMFornecedorMySql: TDMFornecedorMySql
  OldCreateOrder = False
  Left = 224
  Top = 125
  Height = 150
  Width = 215
  object ZQFornecedor: TZQuery
    Connection = DMMySQL.ZConnection1
    SQL.Strings = (
      'SELECT'
      ' '#39'F'#39' AS TIPO,'
      #9'F.FOR_RAZAOSOCIAL,'
      #9'F.FOR_NOMEFANT,'
      #9'F.FOR_ENDERECO,'
      #9'F.FOR_BAIRRO,'
      #9'F.FOR_CEP,'
      #9'F.FOR_FONE,'
      '  F.FOR_FONEDDD,'
      '  F.FOR_FAXDDD,'
      #9'F.FOR_FAX,'
      #9'F.FOR_EMAIL,'
      #9'F.FOR_CAIXAPOSTAL,'
      #9#39'J'#39' AS FISICAJURIDICA,'
      #9#39'N'#39' AS CONSUMFINAL,'
      #9'0 AS LIMITECREDITO,'
      #9'F.FOR_OBSERVACAO,'
      #9'F.FOR_SITUACAO,'
      #9'F.FOR_DATACAD,'
      #9'C.CID_NOME,'
      #9'C.CID_ESTADO,'
      #9'F.FOR_COMPLEMENTO,'
      #9'F.FOR_ENDNUMERO,'
      #9'F.FOR_CODANP,'
      #9'F.FOR_INSCEST,'
      #9'COALESCE(F.FOR_CPF,F.FOR_CNPJ) AS CNPJ,'
      #9'COALESCE(F.FOR_RG,F.FOR_INSCEST) AS FOR_RG'
      'FROM'
      #9'FORNECEDORES F'
      #9'INNER JOIN CIDADES C'
      #9'ON F.CID_CODIGO = C.CID_CODIGO'
      '')
    Params = <>
    Left = 32
    Top = 24
    object ZQFornecedorTIPO: TStringField
      FieldName = 'TIPO'
      ReadOnly = True
      Size = 1
    end
    object ZQFornecedorFOR_RAZAOSOCIAL: TStringField
      FieldName = 'FOR_RAZAOSOCIAL'
      Size = 60
    end
    object ZQFornecedorFOR_NOMEFANT: TStringField
      FieldName = 'FOR_NOMEFANT'
      Size = 50
    end
    object ZQFornecedorFOR_ENDERECO: TStringField
      FieldName = 'FOR_ENDERECO'
      Size = 50
    end
    object ZQFornecedorFOR_BAIRRO: TStringField
      FieldName = 'FOR_BAIRRO'
      Size = 50
    end
    object ZQFornecedorFOR_CEP: TStringField
      FieldName = 'FOR_CEP'
      Size = 8
    end
    object ZQFornecedorFOR_FONE: TStringField
      FieldName = 'FOR_FONE'
      Size = 25
    end
    object ZQFornecedorFOR_FONEDDD: TStringField
      FieldName = 'FOR_FONEDDD'
      Size = 2
    end
    object ZQFornecedorFOR_FAXDDD: TStringField
      FieldName = 'FOR_FAXDDD'
      Size = 2
    end
    object ZQFornecedorFOR_FAX: TStringField
      FieldName = 'FOR_FAX'
      Size = 25
    end
    object ZQFornecedorFOR_EMAIL: TStringField
      FieldName = 'FOR_EMAIL'
      Size = 50
    end
    object ZQFornecedorFOR_CAIXAPOSTAL: TStringField
      FieldName = 'FOR_CAIXAPOSTAL'
      Size = 10
    end
    object ZQFornecedorFISICAJURIDICA: TStringField
      FieldName = 'FISICAJURIDICA'
      ReadOnly = True
      Size = 1
    end
    object ZQFornecedorCONSUMFINAL: TStringField
      FieldName = 'CONSUMFINAL'
      ReadOnly = True
      Size = 1
    end
    object ZQFornecedorLIMITECREDITO: TLargeintField
      FieldName = 'LIMITECREDITO'
      ReadOnly = True
    end
    object ZQFornecedorFOR_OBSERVACAO: TMemoField
      FieldName = 'FOR_OBSERVACAO'
      BlobType = ftMemo
    end
    object ZQFornecedorFOR_SITUACAO: TStringField
      FieldName = 'FOR_SITUACAO'
      Size = 1
    end
    object ZQFornecedorFOR_DATACAD: TDateField
      FieldName = 'FOR_DATACAD'
    end
    object ZQFornecedorCID_NOME: TStringField
      FieldName = 'CID_NOME'
      Size = 50
    end
    object ZQFornecedorCID_ESTADO: TStringField
      FieldName = 'CID_ESTADO'
      Size = 2
    end
    object ZQFornecedorFOR_COMPLEMENTO: TStringField
      FieldName = 'FOR_COMPLEMENTO'
      Size = 50
    end
    object ZQFornecedorFOR_ENDNUMERO: TStringField
      FieldName = 'FOR_ENDNUMERO'
      Size = 10
    end
    object ZQFornecedorFOR_CODANP: TStringField
      FieldName = 'FOR_CODANP'
      Size = 7
    end
    object ZQFornecedorFOR_INSCEST: TStringField
      FieldName = 'FOR_INSCEST'
    end
    object ZQFornecedorCNPJ: TStringField
      FieldName = 'CNPJ'
      ReadOnly = True
    end
    object ZQFornecedorFOR_RG: TStringField
      FieldName = 'FOR_RG'
      ReadOnly = True
    end
  end
end
