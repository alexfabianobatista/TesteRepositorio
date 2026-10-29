object DMCadastroSqlServer: TDMCadastroSqlServer
  OldCreateOrder = False
  Left = 624
  Top = 177
  Height = 150
  Width = 215
  object SSQCadastro: TADOQuery
    Connection = DMSqlServer.ConexaoSqlServer
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT [Codigo cliente] as COD_CADASTRO'
      '      ,[Tipo cliente] as TIPO_CADASTRO'
      '      ,[Nome]'
      '      ,[Fantasia]'
      '      ,[Endere'#231'o] + '#39', '#39' + [Numero] as DESC_ENDERECO'
      '      ,[Uf] as COD_ESTADO'
      '      ,[Bairro] as DESC_BAIRRO'
      '      ,[Cidade] as DESC_CIDADE'
      '      ,[Cep] as DESC_CEP'
      '      ,[Cpf] as NUM_CPF '
      '      ,[Cnpj] as NUM_CGC_CPF'
      '      ,[Inscri'#231#227'o] as NUM_INSCRICAO'
      '      ,[RG] as NUM_RG'
      '      ,[Data nascimento] AS DT_NASCIMENTO'
      '      ,[Telefone] as DESC_TELEFONE'
      '      ,[Celular] as DESC_CELULAR'
      '      ,[E_mail] as DESC_E_MAIL'
      '      ,[Data cadastro] as DT_CADASTRO'
      '  FROM [SIGIND].[dbo].[Clientes]')
    Left = 32
    Top = 16
    object SSQCadastroCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
    end
    object SSQCadastroTIPO_CADASTRO: TStringField
      FieldName = 'TIPO_CADASTRO'
      Size = 8
    end
    object SSQCadastroNome: TStringField
      FieldName = 'Nome'
      Size = 150
    end
    object SSQCadastroDESC_ENDERECO: TStringField
      FieldName = 'DESC_ENDERECO'
      ReadOnly = True
      Size = 78
    end
    object SSQCadastroCOD_ESTADO: TStringField
      FieldName = 'COD_ESTADO'
      Size = 3
    end
    object SSQCadastroDESC_BAIRRO: TStringField
      FieldName = 'DESC_BAIRRO'
      Size = 50
    end
    object SSQCadastroDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      Size = 40
    end
    object SSQCadastroDESC_CEP: TStringField
      FieldName = 'DESC_CEP'
      Size = 9
    end
    object SSQCadastroNUM_CPF: TStringField
      FieldName = 'NUM_CPF'
      Size = 14
    end
    object SSQCadastroNUM_CGC_CPF: TStringField
      FieldName = 'NUM_CGC_CPF'
      Size = 18
    end
    object SSQCadastroNUM_INSCRICAO: TStringField
      FieldName = 'NUM_INSCRICAO'
    end
    object SSQCadastroDESC_TELEFONE: TStringField
      FieldName = 'DESC_TELEFONE'
    end
    object SSQCadastroDESC_CELULAR: TStringField
      FieldName = 'DESC_CELULAR'
      Size = 14
    end
    object SSQCadastroDESC_E_MAIL: TStringField
      FieldName = 'DESC_E_MAIL'
      Size = 100
    end
    object SSQCadastroDT_CADASTRO: TDateTimeField
      FieldName = 'DT_CADASTRO'
    end
    object SSQCadastroDT_NASCIMENTO: TDateTimeField
      FieldName = 'DT_NASCIMENTO'
    end
    object SSQCadastroFantasia: TStringField
      FieldName = 'Fantasia'
      Size = 100
    end
    object SSQCadastroNUM_RG: TStringField
      FieldName = 'NUM_RG'
      Size = 15
    end
  end
  object SSQForn: TADOQuery
    Connection = DMSqlServer.ConexaoSqlServer
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT [Codigo for] AS COD_CADASTRO'
      '      ,[Tipo for] AS TIPO_CADASTRO'
      '      ,[Raz'#227'o social] AS NOME'
      '      ,[Nome fantasia] AS DESC_FANTASIA'
      '      ,[Endere'#231'o for] + '#39','#39' + [Numero] AS DESC_ENDERECO'
      '      ,[Bairro for] AS DESC_BAIRRO'
      '      ,[Municipio] AS COD_CIDADE'
      '      ,[Cidade for] AS DESC_CIDADE'
      '      ,[Uf for] AS COD_ESTADO'
      '      ,[Cep for] AS DESC_CEP'
      '      ,[Cnpj for] AS NUM_CGC_CPF'
      '      ,[Cpf for] AS NUM_CPF'
      '      ,[Inscri'#231#227'o for] NUM_INSCRICAO'
      '      ,[Rg for] AS NUM_RG'
      '      ,[Telefone for] AS DESC_TELEFONE'
      '      ,[Fax for] AS DESC_FAX'
      '      ,[Emai for] AS DESC_E_MAIL'
      '      ,[Site for] AS DESC_OBSERVACAO'
      '      ,[Contato for] AS DESC_CONTATO'
      '      ,[Data cad] AS DT_CADASTRO'
      '      ,[Obs_for]'
      '      ,[Celular] AS DESC_CELULAR'
      '  FROM [SIGIND].[dbo].[Fornecedores]')
    Left = 112
    Top = 16
    object SSQFornCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
    end
    object SSQFornTIPO_CADASTRO: TStringField
      FieldName = 'TIPO_CADASTRO'
      Size = 8
    end
    object SSQFornNOME: TStringField
      FieldName = 'NOME'
      Size = 70
    end
    object SSQFornDESC_FANTASIA: TStringField
      FieldName = 'DESC_FANTASIA'
      Size = 70
    end
    object SSQFornDESC_ENDERECO: TStringField
      FieldName = 'DESC_ENDERECO'
      ReadOnly = True
      Size = 57
    end
    object SSQFornDESC_BAIRRO: TStringField
      FieldName = 'DESC_BAIRRO'
      Size = 60
    end
    object SSQFornCOD_CIDADE: TStringField
      FieldName = 'COD_CIDADE'
      Size = 7
    end
    object SSQFornDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      Size = 50
    end
    object SSQFornCOD_ESTADO: TStringField
      FieldName = 'COD_ESTADO'
      Size = 9
    end
    object SSQFornDESC_CEP: TStringField
      FieldName = 'DESC_CEP'
      Size = 9
    end
    object SSQFornNUM_CGC_CPF: TStringField
      FieldName = 'NUM_CGC_CPF'
      Size = 18
    end
    object SSQFornNUM_CPF: TStringField
      FieldName = 'NUM_CPF'
      Size = 14
    end
    object SSQFornNUM_INSCRICAO: TStringField
      FieldName = 'NUM_INSCRICAO'
    end
    object SSQFornNUM_RG: TStringField
      FieldName = 'NUM_RG'
      Size = 15
    end
    object SSQFornDESC_TELEFONE: TStringField
      FieldName = 'DESC_TELEFONE'
      Size = 15
    end
    object SSQFornDESC_FAX: TStringField
      FieldName = 'DESC_FAX'
    end
    object SSQFornDESC_E_MAIL: TStringField
      FieldName = 'DESC_E_MAIL'
      Size = 100
    end
    object SSQFornDESC_OBSERVACAO: TStringField
      FieldName = 'DESC_OBSERVACAO'
      Size = 100
    end
    object SSQFornDESC_CONTATO: TStringField
      FieldName = 'DESC_CONTATO'
      Size = 60
    end
    object SSQFornDT_CADASTRO: TDateTimeField
      FieldName = 'DT_CADASTRO'
    end
    object SSQFornObs_for: TMemoField
      FieldName = 'Obs_for'
      BlobType = ftMemo
    end
    object SSQFornDESC_CELULAR: TStringField
      FieldName = 'DESC_CELULAR'
    end
  end
end
