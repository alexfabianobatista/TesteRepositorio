object DMCadastroFirebird: TDMCadastroFirebird
  OldCreateOrder = False
  Left = 424
  Top = 298
  Height = 300
  Width = 516
  object ZQCidadeCons: TZQuery
    Connection = DMFirebird.ZConnection1
    SQL.Strings = (
      'SELECT'
      '  C.CIDCODIGO COD_CIDADE,'
      '  C.CIDNOME DESC_CIDADE,'
      '  C.CIDESTADO COD_ESTADO  '
      'FROM'
      '  TBCIDADE C'
      'WHERE'
      '  C.CIDCODIGO = :CODIGO')
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
    Left = 96
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
    object ZQCidadeConsCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
      Required = True
    end
    object ZQCidadeConsDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      Required = True
    end
    object ZQCidadeConsCOD_ESTADO: TStringField
      FieldName = 'COD_ESTADO'
      Required = True
      Size = 2
    end
  end
  object ZQFornecedor: TZQuery
    Connection = DMFirebird.ZConnection1
    SQL.Strings = (
      'SELECT'
      '    F.FORCODIGO AS COD_CADASTRO,'
      '    UPPER(F.FORFANTAZ) AS DESC_FANTASIA,'
      
        '    UPPER(F.FORENDER) ||'#39' '#39'|| COALESCE(F.FORENDNUM,0) AS DESC_EN' +
        'DERECO,'
      '    COALESCE(UPPER(C.cidnome),'#39'MATELANDIA'#39') AS DESC_CIDADE,'
      '    F.FORCEP AS DESC_CEP,'
      '    UPPER(B.bainome) AS DESC_BAIRRO,'
      '    F.forfone AS DESC_FONE,'
      '    F.forfax AS DESC_FAX,'
      '    F.forcxpostal AS DESC_CAIXA_POSTAL,'
      '    F.fordatacad AS DT_CADASTRO,'
      '    UPPER(F.forcontato) AS DESC_CONTATO,'
      '    F.forcelular AS DESC_CELULAR,'
      '    UPPER(F.FOROBS) AS OBS,'
      '    F.forcgccpf AS NUM_CGC_CPF,'
      '    F.forrgie AS NUM_INSCRICAO,'
      '    UPPER(C.cidestado) AS COD_ESTADO,'
      '    F.foremail as DESC_EMAIL,'
      '    UPPER(F.FORRAZAO) AS DESC_CADASTRO,'
      '    2 AS DESC_TIPO'
      'FROM'
      '  tbfornec F LEFT JOIN tbcidade C'
      '    ON F.cidcodigo = C.cidcodigo'
      '    LEFT JOIN tbbairro B'
      '    ON F.baicodigo = B.baicodigo')
    Params = <>
    Left = 32
    Top = 16
    object ZQFornecedorCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object ZQFornecedorDESC_FANTASIA: TStringField
      FieldName = 'DESC_FANTASIA'
      ReadOnly = True
      Size = 40
    end
    object ZQFornecedorDESC_ENDERECO: TStringField
      FieldName = 'DESC_ENDERECO'
      ReadOnly = True
      Size = 52
    end
    object ZQFornecedorDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      ReadOnly = True
    end
    object ZQFornecedorDESC_CEP: TStringField
      FieldName = 'DESC_CEP'
      Size = 8
    end
    object ZQFornecedorDESC_BAIRRO: TStringField
      FieldName = 'DESC_BAIRRO'
      ReadOnly = True
    end
    object ZQFornecedorDESC_FONE: TStringField
      FieldName = 'DESC_FONE'
      Size = 13
    end
    object ZQFornecedorDESC_FAX: TStringField
      FieldName = 'DESC_FAX'
      Size = 13
    end
    object ZQFornecedorDESC_CAIXA_POSTAL: TStringField
      FieldName = 'DESC_CAIXA_POSTAL'
      Size = 8
    end
    object ZQFornecedorDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
    end
    object ZQFornecedorDESC_CONTATO: TStringField
      FieldName = 'DESC_CONTATO'
      ReadOnly = True
      Size = 25
    end
    object ZQFornecedorDESC_CELULAR: TStringField
      FieldName = 'DESC_CELULAR'
      Size = 13
    end
    object ZQFornecedorOBS: TBlobField
      FieldName = 'OBS'
      ReadOnly = True
    end
    object ZQFornecedorNUM_CGC_CPF: TStringField
      FieldName = 'NUM_CGC_CPF'
      Size = 14
    end
    object ZQFornecedorNUM_INSCRICAO: TStringField
      FieldName = 'NUM_INSCRICAO'
      Size = 14
    end
    object ZQFornecedorDESC_EMAIL: TStringField
      FieldName = 'DESC_EMAIL'
      Size = 50
    end
    object ZQFornecedorDESC_CADASTRO: TStringField
      FieldName = 'DESC_CADASTRO'
      ReadOnly = True
      Size = 60
    end
    object ZQFornecedorDESC_TIPO: TIntegerField
      FieldName = 'DESC_TIPO'
      ReadOnly = True
    end
    object ZQFornecedorCOD_ESTADO: TStringField
      FieldName = 'COD_ESTADO'
      ReadOnly = True
      Size = 2
    end
  end
  object ZQCliente: TZQuery
    Connection = DMFirebird.ZConnection1
    SQL.Strings = (
      'SELECT'
      '    F.CLICODIGO AS COD_CADASTRO,'
      '    UPPER(F.CLIFANTAS) AS DESC_FANTASIA,'
      
        '    UPPER(F.CLIENDER) ||'#39' '#39'|| COALESCE(F.CLIENDNUM,0) AS DESC_EN' +
        'DERECO,'
      '    COALESCE(UPPER(C.cidnome),'#39'MATELANDIA'#39') AS DESC_CIDADE,'
      '    F.CLICEP AS DESC_CEP,'
      '    UPPER(B.bainome) AS DESC_BAIRRO,'
      '    F.CLIfone AS DESC_FONE,'
      '    F.CLIfax AS DESC_FAX,'
      '    F.CLIcxpostal AS DESC_CAIXA_POSTAL,'
      '    F.CLIdatacad AS DT_CADASTRO,'
      '    F.CLIcelular AS DESC_CELULAR,  '
      '    F.CLIcgccpf AS NUM_CGC_CPF, '
      '    UPPER(C.cidestado) AS COD_ESTADO,'
      '    F.CLIemail as DESC_EMAIL,'
      '    UPPER(F.CLIRAZAO) AS DESC_CADASTRO,'
      '    2 AS DESC_TIPO'
      'FROM'
      '  tbclientes F LEFT JOIN tbcidade C'
      '    ON F.cidcodigo = C.cidcodigo'
      '    LEFT JOIN tbbairro B'
      '    ON F.baicodigo = B.baicodigo')
    Params = <>
    Left = 32
    Top = 64
    object ZQClienteCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object ZQClienteDESC_FANTASIA: TStringField
      FieldName = 'DESC_FANTASIA'
      ReadOnly = True
      Size = 40
    end
    object ZQClienteDESC_ENDERECO: TStringField
      FieldName = 'DESC_ENDERECO'
      ReadOnly = True
      Size = 52
    end
    object ZQClienteDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      ReadOnly = True
    end
    object ZQClienteDESC_CEP: TStringField
      FieldName = 'DESC_CEP'
      Size = 8
    end
    object ZQClienteDESC_BAIRRO: TStringField
      FieldName = 'DESC_BAIRRO'
      ReadOnly = True
    end
    object ZQClienteDESC_FONE: TStringField
      FieldName = 'DESC_FONE'
      Size = 13
    end
    object ZQClienteDESC_FAX: TStringField
      FieldName = 'DESC_FAX'
      Size = 13
    end
    object ZQClienteDESC_CAIXA_POSTAL: TStringField
      FieldName = 'DESC_CAIXA_POSTAL'
      Size = 8
    end
    object ZQClienteDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
    end
    object ZQClienteDESC_CELULAR: TStringField
      FieldName = 'DESC_CELULAR'
      Size = 13
    end
    object ZQClienteNUM_CGC_CPF: TStringField
      FieldName = 'NUM_CGC_CPF'
      Size = 14
    end
    object ZQClienteCOD_ESTADO: TStringField
      FieldName = 'COD_ESTADO'
      ReadOnly = True
      Size = 2
    end
    object ZQClienteDESC_EMAIL: TStringField
      FieldName = 'DESC_EMAIL'
      Size = 50
    end
    object ZQClienteDESC_CADASTRO: TStringField
      FieldName = 'DESC_CADASTRO'
      ReadOnly = True
      Size = 40
    end
    object ZQClienteDESC_TIPO: TIntegerField
      FieldName = 'DESC_TIPO'
      ReadOnly = True
    end
  end
  object ZQCadastroAtenas: TZQuery
    Connection = DMFirebird.ZConnection1
    SQL.Strings = (
      'SELECT'
      '  TBLJ_CADASTRO.COD_CADASTRO AS COD_CADASTRO,'
      '  UPPER(TBLJ_CADASTRO.DESC_CADASTRO) AS DESC_FANTASIA,'
      
        '  UPPER(TBLJ_CADASTRO.DESC_ENDERECO) ||'#39','#39'|| COALESCE(TBLJ_CADAS' +
        'TRO.NUM_ENDERECO,0) AS DESC_ENDERECO,'
      '  TBLJ_CADASTRO.COD_CIDADE AS COD_CIDADE,'
      
        '  COALESCE(TBLJ_CADASTRO.DESC_CEP,TB_CIDADE.DESC_CEP) AS DESC_CE' +
        'P,'
      '/*  TBLJ_CADASTRO.DESC_CEP AS DESC_CEP,*/'
      '  UPPER(TBLJ_CADASTRO.DESC_BAIRRO) AS DESC_BAIRRO,'
      '  TBLJ_CADASTRO.DESC_FONE AS DESC_FONE,'
      '  TBLJ_CADASTRO.DT_CADASTRO AS DT_CADASTRO,'
      '  TBLJ_CADASTRO.DESC_CELULAR AS DESC_CELULAR,'
      
        '  DECODE(TBLJ_CADASTRO.DESC_CPF,'#39#39',TBLJ_CADASTRO.DESC_CNPJ,TBLJ_' +
        'CADASTRO.DESC_CPF) AS NUM_CGC_CPF,'
      '  TBLJ_CADASTRO.DESC_EMAIL as DESC_EMAIL,'
      '  UPPER(TBLJ_CADASTRO.DESC_RAZAO_SOCIAL) AS DESC_CADASTRO,'
      '  TBLJ_CADASTRO.IND_TIPO_CADASTRO AS IND_TIPO_CADASTRO,'
      '  TBLJ_CADASTRO.IND_FISICA_JURIDICA,'
      
        '  DECODE(TBLJ_CADASTRO.DESC_RG,'#39#39',TBLJ_CADASTRO.DESC_INSCRICAO_E' +
        'STADUAL,TBLJ_CADASTRO.DESC_RG) AS NUM_INSCRICAO,'
      '  TBLJ_CADASTRO.DT_NASCIMENTO,'
      '  TBLJ_CADASTRO.DESC_CONTATO,'
      '  TBLJ_CADASTRO.IND_SEXO AS IND_SEXO,'
      '  TBLJ_CADASTRO.DESC_OBSERVACOES AS DESC_OBSERVACAO,'
      '  TB_CIDADE.DESC_CIDADE AS DESC_CIDADE'
      'FROM'
      '  TBLJ_CADASTRO, TB_CIDADE'
      'WHERE'
      '  TBLJ_CADASTRO.COD_CIDADE = TB_CIDADE.COD_CIDADE'
      ''
      '')
    Params = <>
    Left = 40
    Top = 120
    object ZQCadastroAtenasCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object ZQCadastroAtenasDESC_FANTASIA: TStringField
      FieldName = 'DESC_FANTASIA'
      ReadOnly = True
      Size = 100
    end
    object ZQCadastroAtenasDESC_ENDERECO: TStringField
      FieldName = 'DESC_ENDERECO'
      ReadOnly = True
      Size = 121
    end
    object ZQCadastroAtenasCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
      Required = True
    end
    object ZQCadastroAtenasDESC_CEP: TStringField
      FieldName = 'DESC_CEP'
      Size = 15
    end
    object ZQCadastroAtenasDESC_BAIRRO: TStringField
      FieldName = 'DESC_BAIRRO'
      ReadOnly = True
      Size = 50
    end
    object ZQCadastroAtenasDESC_FONE: TStringField
      FieldName = 'DESC_FONE'
      Size = 30
    end
    object ZQCadastroAtenasDESC_CELULAR: TStringField
      FieldName = 'DESC_CELULAR'
      Size = 15
    end
    object ZQCadastroAtenasNUM_CGC_CPF: TStringField
      FieldName = 'NUM_CGC_CPF'
      ReadOnly = True
      Size = 100
    end
    object ZQCadastroAtenasDESC_EMAIL: TStringField
      FieldName = 'DESC_EMAIL'
      Size = 50
    end
    object ZQCadastroAtenasDESC_CADASTRO: TStringField
      FieldName = 'DESC_CADASTRO'
      ReadOnly = True
      Size = 100
    end
    object ZQCadastroAtenasIND_TIPO_CADASTRO: TStringField
      FieldName = 'IND_TIPO_CADASTRO'
      Size = 15
    end
    object ZQCadastroAtenasIND_FISICA_JURIDICA: TStringField
      FieldName = 'IND_FISICA_JURIDICA'
      Size = 10
    end
    object ZQCadastroAtenasNUM_INSCRICAO: TStringField
      FieldName = 'NUM_INSCRICAO'
      ReadOnly = True
      Size = 100
    end
    object ZQCadastroAtenasDT_NASCIMENTO: TDateField
      FieldName = 'DT_NASCIMENTO'
    end
    object ZQCadastroAtenasDESC_CONTATO: TStringField
      FieldName = 'DESC_CONTATO'
      Size = 30
    end
    object ZQCadastroAtenasIND_SEXO: TStringField
      FieldName = 'IND_SEXO'
      Size = 10
    end
    object ZQCadastroAtenasDESC_OBSERVACAO: TStringField
      FieldName = 'DESC_OBSERVACAO'
      Size = 5000
    end
    object ZQCadastroAtenasDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      Required = True
      Size = 80
    end
    object ZQCadastroAtenasDT_CADASTRO: TDateTimeField
      FieldName = 'DT_CADASTRO'
    end
  end
  object ZQCadastroIntelic: TZQuery
    Connection = DMFirebird.ZConnection1
    SQL.Strings = (
      'SELECT'
      '  CODIGO,NOME,NASCIMENTO,SEXO,PFJ,CNPJ,CPF,RG,CCE,'
      '  RUA||'#39','#39'||NUMERO AS ENDERECO,BAIRRO,COMPLEMENTO,'
      '  MUNICIPIO,UF,CEP,FONECOM,FONERES,FONECEL,FONEFAX,MAE,PAI,'
      
        '  REFCOM,REFCOM1,REFCOM2,REND,NOMEFANTASIA,ATIVO,LIMITE_CREDITO,' +
        'ESTADO_CIVIL,'
      '  EMAIL,DT_INSERT,DT_UPDATE'
      'FROM'
      'PESSOASEMPRESAS')
    Params = <>
    Left = 304
    Top = 16
    object ZQCadastroIntelicCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object ZQCadastroIntelicNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 100
    end
    object ZQCadastroIntelicNASCIMENTO: TDateTimeField
      FieldName = 'NASCIMENTO'
    end
    object ZQCadastroIntelicSEXO: TStringField
      FieldName = 'SEXO'
      Size = 9
    end
    object ZQCadastroIntelicPFJ: TStringField
      FieldName = 'PFJ'
      Size = 1
    end
    object ZQCadastroIntelicCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 18
    end
    object ZQCadastroIntelicCPF: TStringField
      FieldName = 'CPF'
      Size = 18
    end
    object ZQCadastroIntelicRG: TStringField
      FieldName = 'RG'
    end
    object ZQCadastroIntelicCCE: TStringField
      FieldName = 'CCE'
      Size = 14
    end
    object ZQCadastroIntelicBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 60
    end
    object ZQCadastroIntelicCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 100
    end
    object ZQCadastroIntelicMUNICIPIO: TStringField
      FieldName = 'MUNICIPIO'
      Size = 40
    end
    object ZQCadastroIntelicUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object ZQCadastroIntelicCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object ZQCadastroIntelicFONECOM: TStringField
      FieldName = 'FONECOM'
      Size = 16
    end
    object ZQCadastroIntelicFONERES: TStringField
      FieldName = 'FONERES'
      Size = 16
    end
    object ZQCadastroIntelicFONECEL: TStringField
      FieldName = 'FONECEL'
      Size = 16
    end
    object ZQCadastroIntelicFONEFAX: TStringField
      FieldName = 'FONEFAX'
      Size = 16
    end
    object ZQCadastroIntelicMAE: TStringField
      FieldName = 'MAE'
      Size = 70
    end
    object ZQCadastroIntelicPAI: TStringField
      FieldName = 'PAI'
      Size = 70
    end
    object ZQCadastroIntelicREFCOM: TStringField
      FieldName = 'REFCOM'
      Size = 70
    end
    object ZQCadastroIntelicREFCOM1: TStringField
      FieldName = 'REFCOM1'
      Size = 70
    end
    object ZQCadastroIntelicREFCOM2: TStringField
      FieldName = 'REFCOM2'
      Size = 70
    end
    object ZQCadastroIntelicREND: TFloatField
      FieldName = 'REND'
    end
    object ZQCadastroIntelicNOMEFANTASIA: TStringField
      FieldName = 'NOMEFANTASIA'
      Size = 100
    end
    object ZQCadastroIntelicATIVO: TStringField
      FieldName = 'ATIVO'
      Size = 1
    end
    object ZQCadastroIntelicLIMITE_CREDITO: TFloatField
      FieldName = 'LIMITE_CREDITO'
    end
    object ZQCadastroIntelicESTADO_CIVIL: TStringField
      FieldName = 'ESTADO_CIVIL'
      Size = 15
    end
    object ZQCadastroIntelicEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 60
    end
    object ZQCadastroIntelicDT_INSERT: TDateTimeField
      FieldName = 'DT_INSERT'
    end
    object ZQCadastroIntelicDT_UPDATE: TDateTimeField
      FieldName = 'DT_UPDATE'
    end
    object ZQCadastroIntelicENDERECO: TStringField
      FieldName = 'ENDERECO'
      ReadOnly = True
      Size = 71
    end
  end
  object ZQReceituarioOtico: TZQuery
    Connection = DMFirebird.ZConnection1
    SQL.Strings = (
      'SELECT *'
      'FROM'
      'TBLJ_RECEITUARIO_OTICA ')
    Params = <>
    Left = 232
    Top = 56
    object ZQReceituarioOticoCOD_RECEITUARIO_OTICA: TIntegerField
      FieldName = 'COD_RECEITUARIO_OTICA'
      Required = True
    end
    object ZQReceituarioOticoCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object ZQReceituarioOticoCOD_CLIENTE_USUARIO: TIntegerField
      FieldName = 'COD_CLIENTE_USUARIO'
    end
    object ZQReceituarioOticoCOD_FUNCIONARIO: TIntegerField
      FieldName = 'COD_FUNCIONARIO'
      Required = True
    end
    object ZQReceituarioOticoDESC_OBSERVACAO: TStringField
      FieldName = 'DESC_OBSERVACAO'
      Size = 500
    end
    object ZQReceituarioOticoVLR_OD_ESFERICO_LONGE: TFloatField
      FieldName = 'VLR_OD_ESFERICO_LONGE'
    end
    object ZQReceituarioOticoVLR_OE_ESFERICO_LONGE: TFloatField
      FieldName = 'VLR_OE_ESFERICO_LONGE'
    end
    object ZQReceituarioOticoVLR_OD_CILINDRICO_LONGE: TFloatField
      FieldName = 'VLR_OD_CILINDRICO_LONGE'
    end
    object ZQReceituarioOticoVLR_OE_CILINDRICO_LONGE: TFloatField
      FieldName = 'VLR_OE_CILINDRICO_LONGE'
    end
    object ZQReceituarioOticoVLR_OD_EIXO_LONGE: TFloatField
      FieldName = 'VLR_OD_EIXO_LONGE'
    end
    object ZQReceituarioOticoVLR_OE_EIXO_LONGE: TFloatField
      FieldName = 'VLR_OE_EIXO_LONGE'
    end
    object ZQReceituarioOticoVLR_OD_DP_LONGE: TFloatField
      FieldName = 'VLR_OD_DP_LONGE'
    end
    object ZQReceituarioOticoVLR_OE_DP_LONGE: TFloatField
      FieldName = 'VLR_OE_DP_LONGE'
    end
    object ZQReceituarioOticoVLR_OD_ALTURA_LONGE: TFloatField
      FieldName = 'VLR_OD_ALTURA_LONGE'
    end
    object ZQReceituarioOticoVLR_OE_ALTURA_LONGE: TFloatField
      FieldName = 'VLR_OE_ALTURA_LONGE'
    end
    object ZQReceituarioOticoVLR_OD_ESFERICO_PERTO: TFloatField
      FieldName = 'VLR_OD_ESFERICO_PERTO'
    end
    object ZQReceituarioOticoVLR_OE_ESFERICO_PERTO: TFloatField
      FieldName = 'VLR_OE_ESFERICO_PERTO'
    end
    object ZQReceituarioOticoVLR_OD_CILINDRICO_PERTO: TFloatField
      FieldName = 'VLR_OD_CILINDRICO_PERTO'
    end
    object ZQReceituarioOticoVLR_OE_CILINDRICO_PERTO: TFloatField
      FieldName = 'VLR_OE_CILINDRICO_PERTO'
    end
    object ZQReceituarioOticoVLR_OD_EIXO_PERTO: TFloatField
      FieldName = 'VLR_OD_EIXO_PERTO'
    end
    object ZQReceituarioOticoVLR_OE_EIXO_PERTO: TFloatField
      FieldName = 'VLR_OE_EIXO_PERTO'
    end
    object ZQReceituarioOticoVLR_OD_DP_PERTO: TFloatField
      FieldName = 'VLR_OD_DP_PERTO'
    end
    object ZQReceituarioOticoVLR_OE_DP_PERTO: TFloatField
      FieldName = 'VLR_OE_DP_PERTO'
    end
    object ZQReceituarioOticoVLR_OD_ALTURA_PERTO: TFloatField
      FieldName = 'VLR_OD_ALTURA_PERTO'
    end
    object ZQReceituarioOticoVLR_OE_ALTURA_PERTO: TFloatField
      FieldName = 'VLR_OE_ALTURA_PERTO'
    end
    object ZQReceituarioOticoDESC_DOCUMENTO: TStringField
      FieldName = 'DESC_DOCUMENTO'
      Size = 30
    end
    object ZQReceituarioOticoDT_EMISSAO: TDateField
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object ZQReceituarioOticoDT_FINALIZACAO: TDateField
      FieldName = 'DT_FINALIZACAO'
    end
    object ZQReceituarioOticoIND_CONFIRMAR: TStringField
      FieldName = 'IND_CONFIRMAR'
      Size = 3
    end
    object ZQReceituarioOticoIND_TIPO_PAGAMENTO: TStringField
      FieldName = 'IND_TIPO_PAGAMENTO'
      Size = 10
    end
    object ZQReceituarioOticoVLR_DESCONTO: TFloatField
      FieldName = 'VLR_DESCONTO'
    end
    object ZQReceituarioOticoVLR_ENTRADA: TFloatField
      FieldName = 'VLR_ENTRADA'
    end
    object ZQReceituarioOticoNUM_PARCELAS: TIntegerField
      FieldName = 'NUM_PARCELAS'
    end
    object ZQReceituarioOticoVLR_JUROS: TFloatField
      FieldName = 'VLR_JUROS'
    end
    object ZQReceituarioOticoCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
    end
    object ZQReceituarioOticoVLR_DINHEIRO: TFloatField
      FieldName = 'VLR_DINHEIRO'
    end
    object ZQReceituarioOticoVLR_CHEQUE: TFloatField
      FieldName = 'VLR_CHEQUE'
    end
    object ZQReceituarioOticoVLR_CARTAO_DEBITO: TFloatField
      FieldName = 'VLR_CARTAO_DEBITO'
    end
    object ZQReceituarioOticoVLR_CARTAO_CREDITO: TFloatField
      FieldName = 'VLR_CARTAO_CREDITO'
    end
    object ZQReceituarioOticoDESC_OPERADORA_CARTAO_DEBITO: TStringField
      FieldName = 'DESC_OPERADORA_CARTAO_DEBITO'
      Size = 10
    end
    object ZQReceituarioOticoDESC_OPERADORA_CARTAO_CREDITO: TStringField
      FieldName = 'DESC_OPERADORA_CARTAO_CREDITO'
      Size = 10
    end
    object ZQReceituarioOticoNUM_PARCELAS_CREDITO: TIntegerField
      FieldName = 'NUM_PARCELAS_CREDITO'
    end
    object ZQReceituarioOticoVLR_CREDITO_DINHEIRO: TFloatField
      FieldName = 'VLR_CREDITO_DINHEIRO'
    end
    object ZQReceituarioOticoVLR_CREDITO_DEVOLUCAO: TFloatField
      FieldName = 'VLR_CREDITO_DEVOLUCAO'
    end
    object ZQReceituarioOticoCOD_DEVOLUCAO_CLIENTE: TIntegerField
      FieldName = 'COD_DEVOLUCAO_CLIENTE'
    end
    object ZQReceituarioOticoVLR_DNP: TFloatField
      FieldName = 'VLR_DNP'
    end
    object ZQReceituarioOticoVLR_DNP_OD: TFloatField
      FieldName = 'VLR_DNP_OD'
    end
    object ZQReceituarioOticoVLR_DNP_OE: TFloatField
      FieldName = 'VLR_DNP_OE'
    end
    object ZQReceituarioOticoVLR_PONTE: TFloatField
      FieldName = 'VLR_PONTE'
    end
    object ZQReceituarioOticoVLR_ARO: TFloatField
      FieldName = 'VLR_ARO'
    end
    object ZQReceituarioOticoCOD_NFE: TIntegerField
      FieldName = 'COD_NFE'
    end
    object ZQReceituarioOticoHR_EMISSAO: TTimeField
      FieldName = 'HR_EMISSAO'
    end
    object ZQReceituarioOticoVLR_PRODUTOS: TFloatField
      FieldName = 'VLR_PRODUTOS'
      ReadOnly = True
    end
    object ZQReceituarioOticoQDE_PRODUTOS: TFloatField
      FieldName = 'QDE_PRODUTOS'
      ReadOnly = True
    end
    object ZQReceituarioOticoNUM_BOLETOS: TIntegerField
      FieldName = 'NUM_BOLETOS'
    end
    object ZQReceituarioOticoCOD_BANCO: TIntegerField
      FieldName = 'COD_BANCO'
    end
    object ZQReceituarioOticoCOD_USUARIO_LOGADO: TIntegerField
      FieldName = 'COD_USUARIO_LOGADO'
    end
    object ZQReceituarioOticoCOD_FILIAL_FAT: TIntegerField
      FieldName = 'COD_FILIAL_FAT'
    end
    object ZQReceituarioOticoCOD_NFCE: TIntegerField
      FieldName = 'COD_NFCE'
    end
    object ZQReceituarioOticoNUM_NFCE: TIntegerField
      FieldName = 'NUM_NFCE'
    end
    object ZQReceituarioOticoDESC_MEDICO: TStringField
      FieldName = 'DESC_MEDICO'
      Size = 100
    end
    object ZQReceituarioOticoDT_CONSULTA: TDateField
      FieldName = 'DT_CONSULTA'
    end
    object ZQReceituarioOticoVLR_PAGAR: TFloatField
      FieldName = 'VLR_PAGAR'
      ReadOnly = True
    end
    object ZQReceituarioOticoVLR_CREDITO_DEVOLUCAO_ATUAL: TFloatField
      FieldName = 'VLR_CREDITO_DEVOLUCAO_ATUAL'
    end
    object ZQReceituarioOticoVLR_CREDITO_DINHEIRO_ATUAL: TFloatField
      FieldName = 'VLR_CREDITO_DINHEIRO_ATUAL'
    end
  end
  object ZQCadastroRetifoz: TZQuery
    Connection = DMFirebird.ZConnection1
    SQL.Strings = (
      'SELECT'
      '  CAD.CODIGO AS COD_CADASTRO,'
      '  UPPER(CAD.NOME) AS NOME,'
      '  CAD.PESSOA_FJ AS IND_FISICA_JURIDICA,'
      '  CAD.EMAIL AS DESC_E_MAL,'
      '  CAD.EMAIL AS DESC_E_MAIL1,'
      '  UPPER(CAD.FANTASIA) AS DESC_FANTASIA,'
      '  UPPER(CADF.RAZAO_SOC_ANT) AS DESC_FANTASIA_FORNECEDOR,'
      '  CAD.CONTRIBUINTE_ICMS AS IND_CONTRIBUINTE,'
      '  CAD.RETEM_ISS AS IND_ISS_RETIDO,'
      '  UPPER(CAD.ENDERECO) || '#39','#39' || NRO_ENDERECO AS DESC_ENDERECO,'
      '  CAD.CEP AS DESC_CEP,'
      '  UPPER(CAD.BAIRRO) AS DESC_BAIRRO,'
      '  UPPER(CID.NOME) AS DESC_CIDADE,'
      '  UPPER(CID.UF) AS COD_ESTADO,'
      '  CAD.CAIXA_POSTAL AS NUM_CAIXA_POSTAL,'
      '  UPPER(CAD.COMPLEMENTO) AS DESC_COMPLEMENTO,'
      '  CAD.RG_INSCESTADUAL AS NUM_INSCRICAO,'
      '  CAD.CPF_CNPJ AS NUM_CGC_CPF,'
      '  CAD.DT_NASCIMENTO AS DT_NASCIMENTO,'
      '  UPPER(CAD.ESTADO_CIVIL) AS COD_ESTADO_CIVIL,'
      '  UPPER(CAD.SEXO) AS IND_SEXO_CATEGORIA,'
      '  UPPER(CAD.MUNI_NATURAL) AS DESC_NATURALIDADE,'
      '  CAD.RG_DATA_EXPEDICAO AS DT_EXPEDICAO_IDENTIDADE,'
      '  UPPER(CAD.RG_ORGAO_EXPEDIDOR) AS DESC_ORGAO_EMISSOR,'
      '  UPPER(CAD.OBSERVACOES) AS DESC_OBS,'
      '  CAD.DATA_ALT AS DT_ALTERACAO,'
      '  CAD.DATA_INC AS DT_CADASTRO,'
      '  CAD.RETEM_PIS AS IND_PIS_COFINS_RETIDO,'
      '  CAD.INSC_MUNICIPAL AS INSC_MUNICIPAL,'
      '  UPPER(CAD.ATIVO) AS IND_ATIVO,'
      '  CAD.HOME_PAGE AS DESC_CONTATO1,'
      
        '  UPPER(CAD.ENDERECO) || '#39','#39' || NRO_ENDERECO AS DESC_ENDERECO_CO' +
        'BRANCA,'
      '  UPPER(CID.NOME) AS DESC_CIDADE_COBRANCA,'
      '  UPPER(CID.UF) AS DESC_ESTADO_COBRANCA,'
      '  CAD.CEP AS DESC_CEP_COBRANCA,'
      '  UPPER(CAD.BAIRRO) AS DESC_BAIRRO_COBRANCA,'
      '  CASE'
      '    WHEN CAD.CODIGO = CADC.CODIGO THEN 1'
      '    WHEN CAD.CODIGO = CADF.CODIGO THEN 2'
      '    WHEN CAD.CODIGO = CADT.CODIGO THEN 3'
      '    WHEN CAD.CODIGO = CADV.CODIGO THEN 4'
      '  END AS COD_TIPO_CADASTRO,'
      '  UPPER(CADC.CARGO) AS DESC_FUNCAO,'
      '  CADC.CONSUMIDOR_FINAL AS IND_CONSUMIDOR_FINAL,'
      '  UPPER(CADC.PAI) AS NOME_PAI,'
      '  UPPER(CADC.MAE) AS NOME_MAE,'
      '  UPPER(CADC.CONJUGE) AS NOME_CONJUGE,'
      '  CADC.DT_NASC_CONJUGE AS DT_NASCIMENTO_CONJUGE,'
      '  CADC.CPF_CONJUGE AS DESC_CPF_CONJUGE,'
      '  CADC.RG_CONJUGE AS DESC_IDENTIDADE_CONJUGE,'
      '  UPPER(CADC.LOCAL_TRAB_CONJ) AS DESC_EMPRESA_CONJUGE,'
      '  CADC.SALARIO_CONJUGE AS VL_SALARIO_CONJUGE,'
      '  UPPER(CADC.LOCAL_TRABALHO) AS DESC_EMPRESA,'
      '  CADC.SALARIO AS VAL_SALARIO,'
      '  CADC.TEMPO_TRABALHO AS DESC_TEMPO,'
      '  CADC.LIMITE_CREDITO AS VAL_LIMITE'
      'FROM CAD_TERCEIROS CAD'
      'INNER JOIN CAD_MUNICIPIOS CID ON CAD.MUNICIPIO = CID.CODIGO'
      'LEFT JOIN CAD_TERCEIROS_FORNECEDORES CADF ON ('
      '      CAD.CODIGO = CADF.CODIGO AND CAD.EMPRESA = CADF.EMPRESA)'
      'LEFT JOIN CAD_TERCEIROS_CLIENTES  CADC ON ('
      '      CAD.CODIGO = CADC.CODIGO AND CAD.EMPRESA = CADC.EMPRESA)'
      'LEFT JOIN CAD_TERCEIROS_TRANSP CADT ON ('
      '      CAD.CODIGO = CADT.CODIGO AND CAD.EMPRESA = CADT.EMPRESA)'
      'LEFT JOIN CAD_TERCEIROS_VENDEDORES CADV ON ('
      '      CAD.CODIGO = CADV.CODIGO AND CAD.EMPRESA = CADV.EMPRESA)')
    Params = <>
    Left = 328
    Top = 88
    object ZQCadastroRetifozCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object ZQCadastroRetifozNOME: TStringField
      FieldName = 'NOME'
      ReadOnly = True
      Size = 50
    end
    object ZQCadastroRetifozIND_FISICA_JURIDICA: TStringField
      FieldName = 'IND_FISICA_JURIDICA'
      Required = True
      Size = 1
    end
    object ZQCadastroRetifozDESC_E_MAL: TStringField
      FieldName = 'DESC_E_MAL'
      Size = 200
    end
    object ZQCadastroRetifozDESC_E_MAIL1: TStringField
      FieldName = 'DESC_E_MAIL1'
      Size = 200
    end
    object ZQCadastroRetifozDESC_FANTASIA: TStringField
      FieldName = 'DESC_FANTASIA'
      ReadOnly = True
      Size = 60
    end
    object ZQCadastroRetifozDESC_FANTASIA_FORNECEDOR: TStringField
      FieldName = 'DESC_FANTASIA_FORNECEDOR'
      ReadOnly = True
      Size = 60
    end
    object ZQCadastroRetifozIND_CONTRIBUINTE: TStringField
      FieldName = 'IND_CONTRIBUINTE'
      Size = 1
    end
    object ZQCadastroRetifozIND_ISS_RETIDO: TStringField
      FieldName = 'IND_ISS_RETIDO'
      Required = True
      Size = 1
    end
    object ZQCadastroRetifozDESC_ENDERECO: TStringField
      FieldName = 'DESC_ENDERECO'
      ReadOnly = True
      Size = 71
    end
    object ZQCadastroRetifozDESC_CEP: TStringField
      FieldName = 'DESC_CEP'
      Size = 10
    end
    object ZQCadastroRetifozDESC_BAIRRO: TStringField
      FieldName = 'DESC_BAIRRO'
      ReadOnly = True
      Size = 40
    end
    object ZQCadastroRetifozDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      ReadOnly = True
      Size = 50
    end
    object ZQCadastroRetifozCOD_ESTADO: TStringField
      FieldName = 'COD_ESTADO'
      ReadOnly = True
      Size = 2
    end
    object ZQCadastroRetifozNUM_CAIXA_POSTAL: TStringField
      FieldName = 'NUM_CAIXA_POSTAL'
      Size = 15
    end
    object ZQCadastroRetifozDESC_COMPLEMENTO: TStringField
      FieldName = 'DESC_COMPLEMENTO'
      ReadOnly = True
      Size = 200
    end
    object ZQCadastroRetifozNUM_INSCRICAO: TStringField
      FieldName = 'NUM_INSCRICAO'
      Size = 15
    end
    object ZQCadastroRetifozNUM_CGC_CPF: TStringField
      FieldName = 'NUM_CGC_CPF'
    end
    object ZQCadastroRetifozDT_NASCIMENTO: TDateField
      FieldName = 'DT_NASCIMENTO'
    end
    object ZQCadastroRetifozCOD_ESTADO_CIVIL: TStringField
      FieldName = 'COD_ESTADO_CIVIL'
      ReadOnly = True
      Size = 1
    end
    object ZQCadastroRetifozIND_SEXO_CATEGORIA: TStringField
      FieldName = 'IND_SEXO_CATEGORIA'
      ReadOnly = True
      Size = 1
    end
    object ZQCadastroRetifozDESC_NATURALIDADE: TStringField
      FieldName = 'DESC_NATURALIDADE'
      ReadOnly = True
      Size = 6
    end
    object ZQCadastroRetifozDT_EXPEDICAO_IDENTIDADE: TDateField
      FieldName = 'DT_EXPEDICAO_IDENTIDADE'
    end
    object ZQCadastroRetifozDESC_ORGAO_EMISSOR: TStringField
      FieldName = 'DESC_ORGAO_EMISSOR'
      ReadOnly = True
    end
    object ZQCadastroRetifozDESC_OBS: TStringField
      FieldName = 'DESC_OBS'
      ReadOnly = True
      Size = 5000
    end
    object ZQCadastroRetifozDT_ALTERACAO: TDateField
      FieldName = 'DT_ALTERACAO'
    end
    object ZQCadastroRetifozDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
    end
    object ZQCadastroRetifozIND_PIS_COFINS_RETIDO: TStringField
      FieldName = 'IND_PIS_COFINS_RETIDO'
      Required = True
      Size = 1
    end
    object ZQCadastroRetifozINSC_MUNICIPAL: TStringField
      FieldName = 'INSC_MUNICIPAL'
    end
    object ZQCadastroRetifozIND_ATIVO: TStringField
      FieldName = 'IND_ATIVO'
      ReadOnly = True
      Size = 1
    end
    object ZQCadastroRetifozDESC_CONTATO1: TStringField
      FieldName = 'DESC_CONTATO1'
      Size = 80
    end
    object ZQCadastroRetifozDESC_ENDERECO_COBRANCA: TStringField
      FieldName = 'DESC_ENDERECO_COBRANCA'
      ReadOnly = True
      Size = 71
    end
    object ZQCadastroRetifozDESC_CIDADE_COBRANCA: TStringField
      FieldName = 'DESC_CIDADE_COBRANCA'
      ReadOnly = True
      Size = 50
    end
    object ZQCadastroRetifozDESC_ESTADO_COBRANCA: TStringField
      FieldName = 'DESC_ESTADO_COBRANCA'
      ReadOnly = True
      Size = 2
    end
    object ZQCadastroRetifozDESC_CEP_COBRANCA: TStringField
      FieldName = 'DESC_CEP_COBRANCA'
      Size = 10
    end
    object ZQCadastroRetifozDESC_BAIRRO_COBRANCA: TStringField
      FieldName = 'DESC_BAIRRO_COBRANCA'
      ReadOnly = True
      Size = 40
    end
    object ZQCadastroRetifozCOD_TIPO_CADASTRO: TIntegerField
      FieldName = 'COD_TIPO_CADASTRO'
      ReadOnly = True
    end
    object ZQCadastroRetifozDESC_FUNCAO: TStringField
      FieldName = 'DESC_FUNCAO'
      ReadOnly = True
      Size = 60
    end
    object ZQCadastroRetifozIND_CONSUMIDOR_FINAL: TStringField
      FieldName = 'IND_CONSUMIDOR_FINAL'
      Required = True
      Size = 1
    end
    object ZQCadastroRetifozNOME_PAI: TStringField
      FieldName = 'NOME_PAI'
      ReadOnly = True
      Size = 50
    end
    object ZQCadastroRetifozNOME_MAE: TStringField
      FieldName = 'NOME_MAE'
      ReadOnly = True
      Size = 50
    end
    object ZQCadastroRetifozNOME_CONJUGE: TStringField
      FieldName = 'NOME_CONJUGE'
      ReadOnly = True
      Size = 50
    end
    object ZQCadastroRetifozDT_NASCIMENTO_CONJUGE: TDateField
      FieldName = 'DT_NASCIMENTO_CONJUGE'
    end
    object ZQCadastroRetifozDESC_CPF_CONJUGE: TStringField
      FieldName = 'DESC_CPF_CONJUGE'
    end
    object ZQCadastroRetifozDESC_IDENTIDADE_CONJUGE: TStringField
      FieldName = 'DESC_IDENTIDADE_CONJUGE'
    end
    object ZQCadastroRetifozDESC_EMPRESA_CONJUGE: TStringField
      FieldName = 'DESC_EMPRESA_CONJUGE'
      ReadOnly = True
      Size = 60
    end
    object ZQCadastroRetifozVL_SALARIO_CONJUGE: TFloatField
      FieldName = 'VL_SALARIO_CONJUGE'
    end
    object ZQCadastroRetifozDESC_EMPRESA: TStringField
      FieldName = 'DESC_EMPRESA'
      ReadOnly = True
      Size = 60
    end
    object ZQCadastroRetifozVAL_SALARIO: TFloatField
      FieldName = 'VAL_SALARIO'
    end
    object ZQCadastroRetifozDESC_TEMPO: TStringField
      FieldName = 'DESC_TEMPO'
      Size = 12
    end
    object ZQCadastroRetifozVAL_LIMITE: TFloatField
      FieldName = 'VAL_LIMITE'
    end
  end
  object ZQFoneRetifoz: TZQuery
    Connection = DMFirebird.ZConnection1
    SQL.Strings = (
      'SELECT'
      '  CODIGO AS COD_VENDEDOR,'
      '  NUMERO AS DESC_FONE,'
      '  TIPO AS DESC_TIPO_FONE,'
      '  UPPER(CONTATO) AS NOME_CONTATO1'
      'FROM'
      '  CAD_TERCEIROS_FONES'
      'WHERE'
      '  CODIGO = :COD_VENDEDOR'
      'ORDER BY'
      '  CODIGO')
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_VENDEDOR'
        ParamType = ptUnknown
      end>
    Left = 424
    Top = 88
    ParamData = <
      item
        DataType = ftInteger
        Name = 'COD_VENDEDOR'
        ParamType = ptUnknown
      end>
    object ZQFoneRetifozCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object ZQFoneRetifozDESC_FONE: TStringField
      FieldName = 'DESC_FONE'
      Required = True
    end
    object ZQFoneRetifozDESC_TIPO_FONE: TStringField
      FieldName = 'DESC_TIPO_FONE'
      Size = 15
    end
    object ZQFoneRetifozNOME_CONTATO1: TStringField
      FieldName = 'NOME_CONTATO1'
      ReadOnly = True
      Size = 50
    end
  end
  object ZQCadastroAgroBickel: TZQuery
    Connection = DMFirebird.ZConnection1
    SQL.Strings = (
      'select'
      '  PARCEIRO AS COD_CADASTRO,'
      '  RAZAO_SOCIAL AS NOME,'
      '  FANTASIA AS DESC_FANTASIA,'
      '  ENDERECO AS DESC_ENDERECO,'
      '  COMPLEMENTO AS DESC_COMPLEMENTO,'
      '  BAIRRO AS DESC_BAIRRO,'
      '  MUNICIPIO AS DESC_CIDADE,'
      '  UF as COD_ESTADO,'
      '  CEP as DESC_CEP,'
      '  CELULAR as DESC_CELULAR,'
      '  TELEFONE as DESC_TELEFONE,'
      '  FAX as DESC_FAX,'
      '  EMAIL as DESC_E_MAIL,'
      '  PESSOA_FJ as IND_FISICA_JURIDICA,'
      '  IDN_SEXO as IND_SEXO_CATEGORIA,'
      '  CPF as NUM_CGC_CPF,'
      '  CPF_CONJUGE as DESC_CPF_CONJUGE,'
      '  CX_POSTAL as NUM_CAIXA_POSTAL,'
      '  DATA_CADASTRO as DT_CADASTRO,'
      '  DATA_ALTERACAO as DT_ALTERACAO,'
      '  DTAFUNDACAO as DT_FUNDACAO,'
      '  PAI as NOME_PAI,'
      '  MAE as NOME_MAE,'
      '  NASCIMENTO as DT_NASCIMENTO,'
      '  SALARIO as VAL_SALARIO,'
      '  ESTADO_CIVIL as COD_ESTADO_CIVIL,'
      '  CONJUGE as NOME_CONJUGE,'
      '  NASCIMENTO_CONJUGE as DT_NASCIMENTO_CONJUGE,'
      '  IE as NUM_INSCRICAO,'
      '  CODCIDADE as COD_CIDADE,'
      '  CODFILIAL as COD_FILIAL,'
      '  ENDERECO_COBRANCA as DESC_ENDERECO_COBRANCA,'
      '  CIDADE_COBRANCA as DESC_CIDADE_COBRANCA,'
      '  CEP_COBRANCA as DESC_CEP_COBRANCA,'
      '  CEP_ENTREGA as DESC_CEP_ENTREGA,'
      '  BAIRRO_COBRANCA as DESC_BAIRRO_COBRANCA,'
      '  BAIRRO_ENTREGA as DESC_BAIRRO_ENTREGA,'
      '  RG_CONJUGE as DESC_IDENTIDADE_CONJUGE,'
      '  SALARIO_CONJUGE as VL_SALARIO_CONJUGE'
      ''
      '  FROM PARCEIROS'
      '')
    Params = <>
    Left = 256
    Top = 152
    object ZQCadastroAgroBickelCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object ZQCadastroAgroBickelNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object ZQCadastroAgroBickelDESC_FANTASIA: TStringField
      FieldName = 'DESC_FANTASIA'
      Required = True
      Size = 50
    end
    object ZQCadastroAgroBickelDESC_ENDERECO: TStringField
      FieldName = 'DESC_ENDERECO'
      Size = 60
    end
    object ZQCadastroAgroBickelDESC_COMPLEMENTO: TStringField
      FieldName = 'DESC_COMPLEMENTO'
      Size = 50
    end
    object ZQCadastroAgroBickelDESC_BAIRRO: TStringField
      FieldName = 'DESC_BAIRRO'
      Size = 50
    end
    object ZQCadastroAgroBickelDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      Required = True
      Size = 50
    end
    object ZQCadastroAgroBickelCOD_ESTADO: TStringField
      FieldName = 'COD_ESTADO'
      Size = 2
    end
    object ZQCadastroAgroBickelDESC_CEP: TStringField
      FieldName = 'DESC_CEP'
      Size = 10
    end
    object ZQCadastroAgroBickelDESC_CELULAR: TStringField
      FieldName = 'DESC_CELULAR'
      Size = 15
    end
    object ZQCadastroAgroBickelDESC_TELEFONE: TStringField
      FieldName = 'DESC_TELEFONE'
      Size = 15
    end
    object ZQCadastroAgroBickelDESC_FAX: TStringField
      FieldName = 'DESC_FAX'
      Size = 15
    end
    object ZQCadastroAgroBickelDESC_E_MAIL: TStringField
      FieldName = 'DESC_E_MAIL'
      Size = 50
    end
    object ZQCadastroAgroBickelIND_FISICA_JURIDICA: TStringField
      FieldName = 'IND_FISICA_JURIDICA'
      Size = 1
    end
    object ZQCadastroAgroBickelIND_SEXO_CATEGORIA: TStringField
      FieldName = 'IND_SEXO_CATEGORIA'
      Size = 1
    end
    object ZQCadastroAgroBickelNUM_CGC_CPF: TStringField
      FieldName = 'NUM_CGC_CPF'
      Size = 15
    end
    object ZQCadastroAgroBickelDESC_CPF_CONJUGE: TStringField
      FieldName = 'DESC_CPF_CONJUGE'
      Size = 15
    end
    object ZQCadastroAgroBickelNUM_CAIXA_POSTAL: TSmallintField
      FieldName = 'NUM_CAIXA_POSTAL'
    end
    object ZQCadastroAgroBickelDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
    end
    object ZQCadastroAgroBickelDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
    end
    object ZQCadastroAgroBickelDT_FUNDACAO: TDateField
      FieldName = 'DT_FUNDACAO'
    end
    object ZQCadastroAgroBickelNOME_PAI: TStringField
      FieldName = 'NOME_PAI'
      Size = 40
    end
    object ZQCadastroAgroBickelNOME_MAE: TStringField
      FieldName = 'NOME_MAE'
      Size = 40
    end
    object ZQCadastroAgroBickelDT_NASCIMENTO: TDateField
      FieldName = 'DT_NASCIMENTO'
    end
    object ZQCadastroAgroBickelVAL_SALARIO: TFloatField
      FieldName = 'VAL_SALARIO'
    end
    object ZQCadastroAgroBickelCOD_ESTADO_CIVIL: TStringField
      FieldName = 'COD_ESTADO_CIVIL'
      Size = 15
    end
    object ZQCadastroAgroBickelNOME_CONJUGE: TStringField
      FieldName = 'NOME_CONJUGE'
      Size = 50
    end
    object ZQCadastroAgroBickelDT_NASCIMENTO_CONJUGE: TDateField
      FieldName = 'DT_NASCIMENTO_CONJUGE'
    end
    object ZQCadastroAgroBickelNUM_INSCRICAO: TStringField
      FieldName = 'NUM_INSCRICAO'
    end
    object ZQCadastroAgroBickelCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
    end
    object ZQCadastroAgroBickelCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
    end
    object ZQCadastroAgroBickelDESC_ENDERECO_COBRANCA: TStringField
      FieldName = 'DESC_ENDERECO_COBRANCA'
      Size = 60
    end
    object ZQCadastroAgroBickelDESC_CIDADE_COBRANCA: TStringField
      FieldName = 'DESC_CIDADE_COBRANCA'
      Size = 50
    end
    object ZQCadastroAgroBickelDESC_CEP_COBRANCA: TStringField
      FieldName = 'DESC_CEP_COBRANCA'
      Size = 10
    end
    object ZQCadastroAgroBickelDESC_CEP_ENTREGA: TStringField
      FieldName = 'DESC_CEP_ENTREGA'
      Size = 10
    end
    object ZQCadastroAgroBickelDESC_BAIRRO_COBRANCA: TStringField
      FieldName = 'DESC_BAIRRO_COBRANCA'
      Size = 50
    end
    object ZQCadastroAgroBickelDESC_BAIRRO_ENTREGA: TStringField
      FieldName = 'DESC_BAIRRO_ENTREGA'
      Size = 50
    end
    object ZQCadastroAgroBickelDESC_IDENTIDADE_CONJUGE: TStringField
      FieldName = 'DESC_IDENTIDADE_CONJUGE'
      Size = 15
    end
    object ZQCadastroAgroBickelVL_SALARIO_CONJUGE: TFloatField
      FieldName = 'VL_SALARIO_CONJUGE'
    end
  end
  object ZQClienteSGB: TZQuery
    Connection = DMFirebird.ZConnection1
    SQL.Strings = (
      'SELECT'
      '  CLIENTE AS NOME,'
      '  FANTASIA AS DESC_FANTASIA,'
      ''
      '  ENDERECO || '#39','#39' || NUMERO AS DESC_ENDERECO,'
      '  BAIRRO AS DESC_BAIRRO,'
      '  CIDADE AS DESC_CIDADE,'
      '  UF AS COD_ESTADO,'
      '  CEP AS DESC_CEP,'
      '  DECODE(CPF,'#39#39',CNPJ,CPF) AS NUM_CGC_CPF,'
      '  DECODE(RG,'#39#39',IE,RG) AS NUM_INSCRICAO,'
      '  TELEFONE AS DESC_FONE,'
      '  CELULAR AS DESC_FONE_CELULAR,'
      '  EMAIL AS DESC_E_MAIL'
      'from'
      '  TCLIENTE'
      'order by'
      '  nome')
    Params = <>
    Left = 392
    Top = 168
    object ZQClienteSGBNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 100
    end
    object ZQClienteSGBDESC_FANTASIA: TStringField
      FieldName = 'DESC_FANTASIA'
      Size = 100
    end
    object ZQClienteSGBDESC_ENDERECO: TStringField
      FieldName = 'DESC_ENDERECO'
      ReadOnly = True
      Size = 121
    end
    object ZQClienteSGBDESC_BAIRRO: TStringField
      FieldName = 'DESC_BAIRRO'
      Size = 100
    end
    object ZQClienteSGBDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      Size = 100
    end
    object ZQClienteSGBCOD_ESTADO: TStringField
      FieldName = 'COD_ESTADO'
      Size = 2
    end
    object ZQClienteSGBDESC_CEP: TStringField
      FieldName = 'DESC_CEP'
      Size = 9
    end
    object ZQClienteSGBNUM_CGC_CPF: TStringField
      FieldName = 'NUM_CGC_CPF'
      ReadOnly = True
    end
    object ZQClienteSGBNUM_INSCRICAO: TStringField
      FieldName = 'NUM_INSCRICAO'
      ReadOnly = True
    end
    object ZQClienteSGBDESC_FONE: TStringField
      FieldName = 'DESC_FONE'
      Size = 100
    end
    object ZQClienteSGBDESC_FONE_CELULAR: TStringField
      FieldName = 'DESC_FONE_CELULAR'
      Size = 100
    end
    object ZQClienteSGBDESC_E_MAIL: TStringField
      FieldName = 'DESC_E_MAIL'
      Size = 100
    end
  end
  object ZQCadastroMHNFE: TZQuery
    Connection = DMFirebird.ZConnection1
    SQL.Strings = (
      'select'
      '  PESSOA.ID  AS COD_CADASTRO,'
      '  '#39'M'#39' AS IND_SEXO_CATEGORIA,'
      '  CADASTRO AS DT_CADASTRO,'
      '  1 AS COD_TIPO_CADASTRO,'
      '  upper(RAZAO) AS NOME,'
      '  upper(fantasia) AS DESC_FANTASIA,'
      '  cnpjcpf AS NUM_CGC_CPF,'
      '  ie AS NUM_INSCRICAO,'
      '  upper(endereco) || '#39','#39' || numero AS DESC_ENDERECO,'
      '  upper(complemento) AS DESC_COMPLEMENTO,'
      '  upper(bairro) AS DESC_BAIRRO,'
      '  cep AS DESC_CEP,'
      '  lower(email) AS DESC_E_MAIL,'
      '  fone AS DESC_TELEFONE,'
      '  celular AS DESC_CELULAR,'
      '  278 AS COD_PAIS,'
      '  upper(M.nome) as DESC_CIDADE,'
      '  upper(e.sigla) as COD_ESTADO'
      'FROM'
      '  PESSOA,'
      '  municipio M,'
      '  estado    E'
      'WHERE'
      '  PESSOA.id_municipio = M.id'
      'AND'
      '  M.id_estado = E.id'
      'AND'
      '  PESSOA.ID > 2')
    Params = <>
    Left = 88
    Top = 184
    object ZQCadastroMHNFECOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
    end
    object ZQCadastroMHNFEIND_SEXO_CATEGORIA: TStringField
      FieldName = 'IND_SEXO_CATEGORIA'
      ReadOnly = True
      Size = 1
    end
    object ZQCadastroMHNFEDT_CADASTRO: TDateTimeField
      FieldName = 'DT_CADASTRO'
    end
    object ZQCadastroMHNFECOD_TIPO_CADASTRO: TIntegerField
      FieldName = 'COD_TIPO_CADASTRO'
      ReadOnly = True
    end
    object ZQCadastroMHNFENOME: TStringField
      FieldName = 'NOME'
      ReadOnly = True
      Size = 300
    end
    object ZQCadastroMHNFEDESC_FANTASIA: TStringField
      FieldName = 'DESC_FANTASIA'
      ReadOnly = True
      Size = 300
    end
    object ZQCadastroMHNFENUM_CGC_CPF: TStringField
      FieldName = 'NUM_CGC_CPF'
      Size = 50
    end
    object ZQCadastroMHNFENUM_INSCRICAO: TStringField
      FieldName = 'NUM_INSCRICAO'
      Size = 50
    end
    object ZQCadastroMHNFEDESC_ENDERECO: TStringField
      FieldName = 'DESC_ENDERECO'
      ReadOnly = True
      Size = 212
    end
    object ZQCadastroMHNFEDESC_COMPLEMENTO: TStringField
      FieldName = 'DESC_COMPLEMENTO'
      ReadOnly = True
      Size = 200
    end
    object ZQCadastroMHNFEDESC_BAIRRO: TStringField
      FieldName = 'DESC_BAIRRO'
      ReadOnly = True
      Size = 200
    end
    object ZQCadastroMHNFEDESC_CEP: TStringField
      FieldName = 'DESC_CEP'
      Size = 10
    end
    object ZQCadastroMHNFEDESC_E_MAIL: TStringField
      FieldName = 'DESC_E_MAIL'
      ReadOnly = True
      Size = 500
    end
    object ZQCadastroMHNFEDESC_TELEFONE: TStringField
      FieldName = 'DESC_TELEFONE'
    end
    object ZQCadastroMHNFEDESC_CELULAR: TStringField
      FieldName = 'DESC_CELULAR'
    end
    object ZQCadastroMHNFECOD_PAIS: TIntegerField
      FieldName = 'COD_PAIS'
      ReadOnly = True
    end
    object ZQCadastroMHNFEDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      ReadOnly = True
      Size = 50
    end
    object ZQCadastroMHNFECOD_ESTADO: TStringField
      FieldName = 'COD_ESTADO'
      ReadOnly = True
      Size = 2
    end
  end
end
