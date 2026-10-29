object DMCadastroPostgre: TDMCadastroPostgre
  OldCreateOrder = False
  Left = 453
  Top = 278
  Height = 242
  Width = 404
  object ZQCadastro: TZQuery
    Connection = DMPostgre.ZConnection1
    SQL.Strings = (
      'SELECT DISTINCT'
      '  E.CODIGO COD_CADASTRO,'
      '  E.NOME NOME,'
      '  CASE'#9'E.NUM_RUA'
      #9'WHEN 0 THEN E.ENDERECO'
      #9'WHEN NULL THEN E.ENDERECO'
      #9'ELSE E.ENDERECO || '#39', '#39' || E.NUM_RUA'
      '  END DESC_ENDERECO,'
      '  CASE LENGTH(E.CNPJ)'
      #9'WHEN 14 THEN 2'
      #9'ELSE 1'
      '  END AS COD_TIPO_CADASTRO,'
      '  CASE LENGTH(E.FONE_COM)'
      #9'WHEN 0 THEN E.FONE_RES'
      #9'ELSE E.FONE_COM'
      '  END DESC_TELEFONE,'
      '  E.CELULAR DESC_CELULAR,'
      '  E.FAX DESC_FAX,'
      '  CASE LENGTH(E.CNPJ)'
      #9'WHEN 14 THEN '#39'J'#39
      #9'ELSE '#39'F'#39
      '  END AS IND_FISICA_JURIDICA,'
      '  E.CEP DESC_CEP,'
      '  E.CNPJ NUM_CGC_CPF,'
      '  E.INSCRICAO NUM_INSCRICAO,'
      '  '#39#39' DESC_ENDERECO_COBRANCA,'
      '  '#39#39' DESC_CEP_COBRANCA,'
      '  E.BAIRRO DESC_BAIRRO,'
      '  '#39#39' DESC_FAX_COBRANCA,'
      '  '#39#39' NUM_CAIXA_POSTAL,'
      '  E.CONTATO NOME_CONTATO,'
      '  E.DCADASTRO DT_CADASTRO,'
      '  E.EMAIL DESC_EMAIL1,'
      '  E.FANTASIA DESC_FANTASIA,'
      '  '#39#39' DESC_BAIRRO_COBRANCA,'
      '  E.NASCIMENTO,'
      '  E.DCADASTRO,'
      '  E.EMAIL DESC_EMAIL,'
      '  C.NOME DESC_CIDADE,'
      '  C.ESTADO COD_ESTADO'
      ''
      'FROM'
      '  CLIFOR_DBF E LEFT JOIN CIDADE_DBF C'
      '  ON E.COD_CIDADE = C.CODIGO'
      'WHERE E.CODIGO <> 1'
      'ORDER BY'
      '  NOME')
    Params = <>
    Left = 32
    Top = 16
    object ZQCadastrocod_cadastro: TFloatField
      FieldName = 'cod_cadastro'
    end
    object ZQCadastronome: TStringField
      FieldName = 'nome'
      Size = 60
    end
    object ZQCadastrodesc_endereco: TMemoField
      FieldName = 'desc_endereco'
      ReadOnly = True
      BlobType = ftMemo
    end
    object ZQCadastrocod_tipo_cadastro: TIntegerField
      FieldName = 'cod_tipo_cadastro'
      ReadOnly = True
    end
    object ZQCadastrodesc_telefone: TStringField
      FieldName = 'desc_telefone'
      ReadOnly = True
      Size = 12
    end
    object ZQCadastrodesc_celular: TStringField
      FieldName = 'desc_celular'
      Size = 12
    end
    object ZQCadastrodesc_fax: TStringField
      FieldName = 'desc_fax'
      Size = 12
    end
    object ZQCadastroind_fisica_juridica: TMemoField
      FieldName = 'ind_fisica_juridica'
      ReadOnly = True
      BlobType = ftMemo
    end
    object ZQCadastrodesc_cep: TStringField
      FieldName = 'desc_cep'
      Size = 8
    end
    object ZQCadastronum_cgc_cpf: TStringField
      FieldName = 'num_cgc_cpf'
      Size = 14
    end
    object ZQCadastronum_inscricao: TStringField
      FieldName = 'num_inscricao'
      Size = 15
    end
    object ZQCadastrodesc_endereco_cobranca: TMemoField
      FieldName = 'desc_endereco_cobranca'
      ReadOnly = True
      BlobType = ftMemo
    end
    object ZQCadastrodesc_cep_cobranca: TMemoField
      FieldName = 'desc_cep_cobranca'
      ReadOnly = True
      BlobType = ftMemo
    end
    object ZQCadastrodesc_bairro: TStringField
      FieldName = 'desc_bairro'
      Size = 40
    end
    object ZQCadastrodesc_fax_cobranca: TMemoField
      FieldName = 'desc_fax_cobranca'
      ReadOnly = True
      BlobType = ftMemo
    end
    object ZQCadastronum_caixa_postal: TMemoField
      FieldName = 'num_caixa_postal'
      ReadOnly = True
      BlobType = ftMemo
    end
    object ZQCadastronome_contato: TStringField
      FieldName = 'nome_contato'
      Size = 40
    end
    object ZQCadastrodt_cadastro: TDateField
      FieldName = 'dt_cadastro'
    end
    object ZQCadastrodesc_email1: TStringField
      FieldName = 'desc_email1'
      Size = 40
    end
    object ZQCadastrodesc_fantasia: TStringField
      FieldName = 'desc_fantasia'
      Size = 40
    end
    object ZQCadastrodesc_bairro_cobranca: TMemoField
      FieldName = 'desc_bairro_cobranca'
      ReadOnly = True
      BlobType = ftMemo
    end
    object ZQCadastronascimento: TDateField
      FieldName = 'nascimento'
    end
    object ZQCadastrodcadastro: TDateField
      FieldName = 'dcadastro'
    end
    object ZQCadastrodesc_email: TStringField
      FieldName = 'desc_email'
      Size = 40
    end
    object ZQCadastrodesc_cidade: TStringField
      FieldName = 'desc_cidade'
      Size = 40
    end
    object ZQCadastrocod_estado: TStringField
      FieldName = 'cod_estado'
      Size = 2
    end
  end
  object ZQCidadeCons: TZQuery
    Connection = DMPostgre.ZConnection1
    SQL.Strings = (
      'SELECT'
      '  CIDADE COD_CIDADE,'
      '  CIDNOME DESC_CIDADE,'
      '  ESTADO COD_ESTADO,'
      '  CIDIBGE COD_CIDADE_IBGE'
      'FROM'
      '  CIDADE'
      'ORDER BY CIDADE')
    Params = <>
    Left = 120
    Top = 16
    object ZQCidadeConscod_cidade: TIntegerField
      FieldName = 'cod_cidade'
      Required = True
    end
    object ZQCidadeConsdesc_cidade: TStringField
      FieldName = 'desc_cidade'
      Size = 30
    end
    object ZQCidadeConscod_estado: TStringField
      FieldName = 'cod_estado'
      Size = 2
    end
    object ZQCidadeConscod_cidade_ibge: TStringField
      FieldName = 'cod_cidade_ibge'
      Size = 7
    end
  end
  object ZQCadastroSeta: TZQuery
    Connection = DMPostgre.ZConnection1
    SQL.Strings = (
      'SELECT DISTINCT'
      '  P.CODIGO COD_CADASTRO,'
      '  P.NOME NOME,'
      '  TRIM(P.APELIDO) DESC_FANTASIA,'
      '  P.PESSOA IND_FISICA_JURIDA,'
      '  P.CEP DESC_CEP,'
      '  TRIM(P.ENDERECO) ENDERECO,'
      '  TRIM(P.BAIRRO) BAIRRO,'
      '  TRIM(P.CIDADE) CIDADE,'
      '  TRIM(P.COMPLEMENTO) DESC_COMPLEMENTO,'
      '  TRIM(P.TRABALHO) DESC_EMPRESA,'
      '  P.UF COD_ESTADO,'
      '  P.CXPOSTAL NUM_CAIXA_POSTAL,'
      '  P.TELEFONE1 DESC_TELEFONE,'
      '  P.TELEFONE2 DESC_COMERCIAL,'
      '  P.TELEFONE3 DESC_CELULAR,'
      '  P.CPFCNPJ NUM_CGC_CPF,'
      '  P.RGIE NUM_INSCRICAO,'
      '  TRIM(P.PAI) NOME_PAI,'
      '  TRIM(P.MAE) NOME_MAE,'
      '  TRIM(P.EMAIL) DESC_E_MAIL,'
      '  TRIM(P.OBS) DESC_OBS1,'
      '  TRIM(P.CONTATO) NOME_CONTATO,'
      '  TRIM(P.ESTADOCIVIL) ESTADO_CIVIL,'
      '  TRIM(P.CONJUGE) NOME_CONJUGE,'
      '  TRIM(P.STATUS) STATUS,'
      '  P.SEXO IND_SEXO_CATEGORIA,'
      '  --  EMPRESA **EMPRESA_BANCO_DADOS**'
      '  TRIM(P.REFERENCIAS1) DESC_REF_COMERCIAL1,'
      '  TRIM(P.REFERENCIAS2) DESC_REF_COMERCIAL2,'
      '  P.CADASTRO DT_CADASTRO,'
      '  P.ATUALIZADO DT_ALTERACAO,'
      '  P.NASCIMENTO DT_NASCIMENTO,'
      '  P.FORNECEDOR TIPO_CADASTRO'
      'FROM'
      '  PESSOAS P'
      'ORDER BY'
      '  CODIGO')
    Params = <>
    Left = 40
    Top = 96
    object ZQCadastroSetacod_cadastro: TStringField
      FieldName = 'cod_cadastro'
      Required = True
      Size = 24
    end
    object ZQCadastroSetanome: TStringField
      FieldName = 'nome'
      Size = 200
    end
    object ZQCadastroSetadesc_fantasia: TMemoField
      FieldName = 'desc_fantasia'
      ReadOnly = True
      BlobType = ftMemo
    end
    object ZQCadastroSetaind_fisica_jurida: TFloatField
      FieldName = 'ind_fisica_jurida'
    end
    object ZQCadastroSetaendereco: TMemoField
      FieldName = 'endereco'
      ReadOnly = True
      BlobType = ftMemo
    end
    object ZQCadastroSetabairro: TMemoField
      FieldName = 'bairro'
      ReadOnly = True
      BlobType = ftMemo
    end
    object ZQCadastroSetacidade: TMemoField
      FieldName = 'cidade'
      ReadOnly = True
      BlobType = ftMemo
    end
    object ZQCadastroSetadesc_empresa: TMemoField
      FieldName = 'desc_empresa'
      ReadOnly = True
      BlobType = ftMemo
    end
    object ZQCadastroSetacod_estado: TStringField
      FieldName = 'cod_estado'
      Size = 8
    end
    object ZQCadastroSetanum_caixa_postal: TStringField
      FieldName = 'num_caixa_postal'
      Size = 32
    end
    object ZQCadastroSetadesc_telefone: TStringField
      FieldName = 'desc_telefone'
      Size = 80
    end
    object ZQCadastroSetadesc_comercial: TStringField
      FieldName = 'desc_comercial'
      Size = 80
    end
    object ZQCadastroSetadesc_celular: TStringField
      FieldName = 'desc_celular'
      Size = 80
    end
    object ZQCadastroSetanum_cgc_cpf: TStringField
      FieldName = 'num_cgc_cpf'
      Size = 72
    end
    object ZQCadastroSetanum_inscricao: TStringField
      FieldName = 'num_inscricao'
      Size = 64
    end
    object ZQCadastroSetanome_pai: TMemoField
      FieldName = 'nome_pai'
      ReadOnly = True
      BlobType = ftMemo
    end
    object ZQCadastroSetanome_mae: TMemoField
      FieldName = 'nome_mae'
      ReadOnly = True
      BlobType = ftMemo
    end
    object ZQCadastroSetadesc_e_mail: TMemoField
      FieldName = 'desc_e_mail'
      ReadOnly = True
      BlobType = ftMemo
    end
    object ZQCadastroSetadesc_obs1: TMemoField
      FieldName = 'desc_obs1'
      ReadOnly = True
      BlobType = ftMemo
    end
    object ZQCadastroSetanome_contato: TMemoField
      FieldName = 'nome_contato'
      ReadOnly = True
      BlobType = ftMemo
    end
    object ZQCadastroSetaestado_civil: TMemoField
      FieldName = 'estado_civil'
      ReadOnly = True
      BlobType = ftMemo
    end
    object ZQCadastroSetanome_conjuge: TMemoField
      FieldName = 'nome_conjuge'
      ReadOnly = True
      BlobType = ftMemo
    end
    object ZQCadastroSetastatus: TMemoField
      FieldName = 'status'
      ReadOnly = True
      BlobType = ftMemo
    end
    object ZQCadastroSetaind_sexo_categoria: TStringField
      FieldName = 'ind_sexo_categoria'
      Size = 4
    end
    object ZQCadastroSetadesc_ref_comercial1: TMemoField
      FieldName = 'desc_ref_comercial1'
      ReadOnly = True
      BlobType = ftMemo
    end
    object ZQCadastroSetadesc_ref_comercial2: TMemoField
      FieldName = 'desc_ref_comercial2'
      ReadOnly = True
      BlobType = ftMemo
    end
    object ZQCadastroSetadt_cadastro: TDateField
      FieldName = 'dt_cadastro'
    end
    object ZQCadastroSetadt_alteracao: TDateField
      FieldName = 'dt_alteracao'
    end
    object ZQCadastroSetadt_nascimento: TDateField
      FieldName = 'dt_nascimento'
    end
    object ZQCadastroSetadesc_cep: TStringField
      FieldName = 'desc_cep'
      Size = 40
    end
    object ZQCadastroSetadesc_complemento: TMemoField
      FieldName = 'desc_complemento'
      ReadOnly = True
      BlobType = ftMemo
    end
    object ZQCadastroSetatipo_cadastro: TBooleanField
      FieldName = 'tipo_cadastro'
    end
  end
end
