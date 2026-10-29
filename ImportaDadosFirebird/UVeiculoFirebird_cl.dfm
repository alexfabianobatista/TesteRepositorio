object DMVeiculoFirebird: TDMVeiculoFirebird
  OldCreateOrder = False
  Left = 481
  Top = 264
  Height = 228
  Width = 260
  object ZQVeiculoRetifoz: TZQuery
    Connection = DMFirebird.ZConnection1
    SQL.Strings = (
      'SELECT'
      '  PLACA AS NUM_PLACA,'
      '  UPPER(NOME) AS NOME,'
      '  CLIENTE AS COD_CADASTRO,'
      '  MARCA AS DESCRICAO,'
      '  CHASSI AS NUM_CHASSI,'
      '  ANOMODELO AS NUM_ANO,'
      '  ANOFABRICACAO AS NUM_ANO_FAB,'
      '  COMBUSTIVEL AS DESC_OBSERVACAO,'
      '  '#39'1'#39' AS COD_COR,'
      '  RENAVAM AS NUM_RENAVAM,'
      '  KM_ATUAL AS KM_ATUAL,'
      '  COD_MOTORISTA AS COD_MOTORISTA,'
      '  UPPER(NOME) AS DESC_MODELO'
      'FROM'
      '  CAD_VEICULOS')
    Params = <>
    Left = 32
    Top = 16
    object ZQVeiculoRetifozNUM_PLACA: TStringField
      FieldName = 'NUM_PLACA'
      Required = True
      Size = 8
    end
    object ZQVeiculoRetifozNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object ZQVeiculoRetifozCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
    end
    object ZQVeiculoRetifozDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
    end
    object ZQVeiculoRetifozNUM_CHASSI: TStringField
      FieldName = 'NUM_CHASSI'
    end
    object ZQVeiculoRetifozNUM_ANO: TStringField
      FieldName = 'NUM_ANO'
      Size = 4
    end
    object ZQVeiculoRetifozNUM_ANO_FAB: TStringField
      FieldName = 'NUM_ANO_FAB'
      Size = 4
    end
    object ZQVeiculoRetifozDESC_OBSERVACAO: TStringField
      FieldName = 'DESC_OBSERVACAO'
      Size = 30
    end
    object ZQVeiculoRetifozCOD_COR: TStringField
      FieldName = 'COD_COR'
      ReadOnly = True
      Size = 1
    end
    object ZQVeiculoRetifozNUM_RENAVAM: TStringField
      FieldName = 'NUM_RENAVAM'
      Size = 40
    end
    object ZQVeiculoRetifozKM_ATUAL: TIntegerField
      FieldName = 'KM_ATUAL'
    end
    object ZQVeiculoRetifozCOD_MOTORISTA: TIntegerField
      FieldName = 'COD_MOTORISTA'
    end
    object ZQVeiculoRetifozDESC_MODELO: TStringField
      FieldName = 'DESC_MODELO'
    end
  end
  object ZQModeloVeiculoRetifoz: TZQuery
    Connection = DMFirebird.ZConnection1
    SQL.Strings = (
      'SELECT'
      '  DISTINCT'
      '  UPPER(NOME) AS NOME'
      'FROM'
      '  CAD_VEICULOS'
      'WHERE '
      '  NOME <> '#39#39
      '  ')
    Params = <>
    Left = 144
    Top = 16
    object ZQModeloVeiculoRetifozNOME: TStringField
      FieldName = 'NOME'
      ReadOnly = True
      Size = 50
    end
  end
end
