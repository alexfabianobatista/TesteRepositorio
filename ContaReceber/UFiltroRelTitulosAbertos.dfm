inherited FFiltroRelTitulosAbertos: TFFiltroRelTitulosAbertos
  Width = 1028
  Caption = 'Filtro Relat'#243'rio T'#237'tulos Abertos'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 20
  inherited LblNumRegistros: TLabel
    Top = 434
  end
  inherited Label2: TLabel
    Left = 773
    Top = 433
  end
  inherited DBTValorTotal: TDBText
    Left = 862
    Top = 432
    Width = 138
  end
  inherited DBGFiltro: TDBGrid
    Width = 997
    Height = 393
    Columns = <
      item
        Expanded = False
        FieldName = 'IND_SELECIONADO'
        Title.Caption = ' '
        Width = 27
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_TITULO'
        Title.Caption = 'T'#237'tulo'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_VENCIMENTO'
        Title.Caption = 'Vencimento'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_PARCELA'
        Title.Caption = 'Parcela'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Cliente'
        Width = 451
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'val_titulo'
        Title.Caption = 'Valor'
        Width = 132
        Visible = True
      end>
  end
  inherited BtCancela: TBitBtn
    Left = 800
  end
  inherited BtOk: TBitBtn
    Left = 903
  end
  inherited DSPFiltroRelatorio: TDataSetProvider
    DataSet = DMContasReceber.QRContasReceber_TitulosAberto
  end
  inherited CDSFiltroRelatorio: TClientDataSet
    OnCalcFields = CDSFiltroRelatorioCalcFields
    object CDSFiltroRelatorioval_titulo: TFloatField [1]
      FieldName = 'val_titulo'
      ReadOnly = True
      DisplayFormat = '###,###,##0.00'
    end
    object CDSFiltroRelatorioNOME: TStringField [2]
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object CDSFiltroRelatorioNUM_TITULO: TFloatField [3]
      FieldName = 'NUM_TITULO'
    end
    object CDSFiltroRelatorioNUM_PARCELA: TIntegerField [4]
      FieldName = 'NUM_PARCELA'
    end
    object CDSFiltroRelatorioDT_VENCIMENTO: TDateTimeField [5]
      FieldName = 'DT_VENCIMENTO'
    end
    object CDSFiltroRelatoriovalorpago: TFloatField [6]
      FieldName = 'valorpago'
      ReadOnly = True
    end
    object CDSFiltroRelatoriosVal_Juros: TFloatField [7]
      FieldName = 'sVal_Juros'
      ReadOnly = True
    end
    object CDSFiltroRelatorioDESC_TELEFONE: TStringField [8]
      FieldName = 'DESC_TELEFONE'
      Size = 12
    end
    object CDSFiltroRelatorioCOD_CONTA_RECEBER_CAB: TIntegerField [9]
      FieldName = 'COD_CONTA_RECEBER_CAB'
      Required = True
    end
    object CDSFiltroRelatorioCOD_FILIAL: TIntegerField [10]
      FieldName = 'COD_FILIAL'
    end
    object CDSFiltroRelatorioCOD_FINALIDADE: TIntegerField [11]
      FieldName = 'COD_FINALIDADE'
    end
    object CDSFiltroRelatorioCOD_BANCO_AGENCIA: TIntegerField [12]
      FieldName = 'COD_BANCO_AGENCIA'
    end
    object CDSFiltroRelatorioCOD_CADASTRO: TIntegerField [13]
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object CDSFiltroRelatorioDESC_TIPO_DOCUMENTO: TStringField [14]
      FieldName = 'DESC_TIPO_DOCUMENTO'
      Size = 3
    end
    object CDSFiltroRelatorioVALT_TITULO: TFloatField [15]
      FieldName = 'VALT_TITULO'
    end
    object CDSFiltroRelatorioCOD_NOTA_CAB: TIntegerField [16]
      FieldName = 'COD_NOTA_CAB'
    end
    object CDSFiltroRelatorioDESC_OBSERVACAO: TStringField [17]
      FieldName = 'DESC_OBSERVACAO'
      Size = 50
    end
    object CDSFiltroRelatorioIND_ACEITE: TStringField [18]
      FieldName = 'IND_ACEITE'
      Size = 3
    end
    object CDSFiltroRelatorioIND_SITUACAO: TStringField [19]
      FieldName = 'IND_SITUACAO'
      Size = 13
    end
    object CDSFiltroRelatorioVAL_JUROS: TFloatField [20]
      FieldName = 'VAL_JUROS'
    end
    object CDSFiltroRelatorioVAL_ORIGINAL: TFloatField [21]
      FieldName = 'VAL_ORIGINAL'
    end
    object CDSFiltroRelatorioDESC_FILIAL: TStringField [22]
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
    object CDSFiltroRelatorioPERC_TAXA: TFloatField [23]
      FieldName = 'PERC_TAXA'
    end
    object CDSFiltroRelatorioCOD_MOEDA: TIntegerField [24]
      FieldName = 'COD_MOEDA'
      Required = True
    end
    object CDSFiltroRelatorioNUM_TIPO_JURO: TStringField [25]
      FieldName = 'NUM_TIPO_JURO'
      Size = 14
    end
    object CDSFiltroRelatorioDESC_CLASSIFICACAO: TStringField [26]
      FieldName = 'DESC_CLASSIFICACAO'
      Required = True
      Size = 30
    end
    object CDSFiltroRelatoriodesc_sigla_banco: TStringField [27]
      FieldName = 'desc_sigla_banco'
      ReadOnly = True
      Size = 3
    end
    object CDSFiltroRelatorioDESC_CELULAR: TStringField [28]
      FieldName = 'DESC_CELULAR'
      Size = 12
    end
    object CDSFiltroRelatorioNOME_VENDEDOR: TStringField [29]
      FieldName = 'NOME_VENDEDOR'
      Size = 40
    end
    object CDSFiltroRelatorioDESC_ENDERECO: TStringField [30]
      FieldName = 'DESC_ENDERECO'
      Size = 40
    end
    object CDSFiltroRelatorioDESC_CIDADE: TStringField [31]
      FieldName = 'DESC_CIDADE'
      Size = 30
    end
    object CDSFiltroRelatorioDESC_CEP: TStringField [32]
      FieldName = 'DESC_CEP'
      Size = 9
    end
    object CDSFiltroRelatorioCOD_ESTADO: TStringField [33]
      FieldName = 'COD_ESTADO'
      Size = 2
    end
    object CDSFiltroRelatorioNUM_CGC_CPF: TStringField [34]
      FieldName = 'NUM_CGC_CPF'
      Size = 18
    end
    object CDSFiltroRelatorioDESC_AVALISTA1: TStringField [35]
      FieldName = 'DESC_AVALISTA1'
      Size = 40
    end
    object CDSFiltroRelatorioDESC_FONE_EMPRESA: TStringField [36]
      FieldName = 'DESC_FONE_EMPRESA'
      Size = 12
    end
    object CDSFiltroRelatorioPERC_JURO_MORA: TFloatField [37]
      FieldName = 'PERC_JURO_MORA'
    end
    object CDSFiltroRelatorioNUM_DIAS_CARENCIA: TIntegerField [38]
      FieldName = 'NUM_DIAS_CARENCIA'
    end
    object CDSFiltroRelatorioperc_comissao: TFloatField [39]
      FieldName = 'perc_comissao'
      ReadOnly = True
    end
    object CDSFiltroRelatorioCOD_VENDEDOR: TIntegerField [40]
      FieldName = 'COD_VENDEDOR'
    end
    object CDSFiltroRelatoriocod_pedido_cab: TIntegerField [41]
      FieldName = 'cod_pedido_cab'
      ReadOnly = True
    end
    object CDSFiltroRelatorioDESC_ENDERECO_FILIAL: TStringField [42]
      FieldName = 'DESC_ENDERECO_FILIAL'
      Size = 30
    end
    object CDSFiltroRelatorioDESC_CNPJ_FILIAL: TStringField [43]
      FieldName = 'DESC_CNPJ_FILIAL'
      Size = 18
    end
    object CDSFiltroRelatorionum_dias_vencido: TIntegerField [44]
      FieldName = 'num_dias_vencido'
      ReadOnly = True
    end
    object CDSFiltroRelatorioNUM_INSCRICAO: TStringField [45]
      FieldName = 'NUM_INSCRICAO'
    end
    object CDSFiltroRelatorioDT_NASCIMENTO: TDateTimeField [46]
      FieldName = 'DT_NASCIMENTO'
    end
    object CDSFiltroRelatorioDESC_BAIRRO: TStringField [47]
      FieldName = 'DESC_BAIRRO'
      Size = 60
    end
    object CDSFiltroRelatorioDT_MOVIMENTO: TDateTimeField [48]
      FieldName = 'DT_MOVIMENTO'
    end
    object CDSFiltroRelatorioDT_BAIXA: TDateTimeField [49]
      FieldName = 'DT_BAIXA'
    end
    object CDSFiltroRelatorioDT_EMISSAO: TDateTimeField [50]
      FieldName = 'DT_EMISSAO'
    end
    object CDSFiltroRelatorioDT_CAPITALIZACAO: TDateTimeField [51]
      FieldName = 'DT_CAPITALIZACAO'
    end
    object CDSFiltroRelatorioDT_CAPITALIZACAO_MOEDA: TDateTimeField [52]
      FieldName = 'DT_CAPITALIZACAO_MOEDA'
    end
  end
end
