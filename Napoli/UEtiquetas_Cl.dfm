object DMEtiquetas: TDMEtiquetas
  OldCreateOrder = False
  Left = 318
  Top = 214
  Height = 245
  Width = 297
  object CDEtiquetas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 48
    object CDEtiquetascod_produto: TStringField
      FieldName = 'cod_produto'
      Size = 10
    end
    object CDEtiquetasdesc_produto: TStringField
      FieldName = 'desc_produto'
      Size = 55
    end
    object CDEtiquetasval_produto: TFloatField
      FieldName = 'val_produto'
    end
    object CDEtiquetastipo_valor: TStringField
      FieldName = 'tipo_valor'
    end
    object CDEtiquetascod_original: TStringField
      FieldName = 'cod_original'
      Size = 30
    end
    object CDEtiquetasdesc_localizacao: TStringField
      FieldName = 'desc_localizacao'
      Size = 50
    end
    object CDEtiquetasdesc_unidade: TStringField
      FieldName = 'desc_unidade'
      Size = 10
    end
    object CDEtiquetasdescricao1: TStringField
      FieldName = 'descricao1'
      Size = 50
    end
    object CDEtiquetasdescricao2: TStringField
      FieldName = 'descricao2'
      Size = 50
    end
    object CDEtiquetasdescricao3: TStringField
      FieldName = 'descricao3'
      Size = 50
    end
  end
end
