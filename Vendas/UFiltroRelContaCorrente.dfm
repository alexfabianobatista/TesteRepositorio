inherited FFiltroRelContaCorrente: TFFiltroRelContaCorrente
  Left = 345
  Top = 120
  Width = 979
  Height = 567
  Caption = 'Filtro Relat'#243'rio Notas em Conta Corrente'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 20
  inherited LblNumRegistros: TLabel
    Top = 445
  end
  inherited Label2: TLabel
    Left = 720
    Top = 442
  end
  inherited DBTValorTotal: TDBText
    Left = 845
    Top = 441
  end
  inherited DBGFiltro: TDBGrid
    Width = 948
    Height = 400
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
        FieldName = 'DT_EMISSAO'
        Title.Caption = 'Emiss'#227'o'
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_NOTA'
        Title.Caption = 'Nota'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_CADASTRO'
        Title.Caption = 'Cliente'
        Width = 520
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Val_Total'
        Title.Caption = 'Valor'
        Width = 133
        Visible = True
      end>
  end
  inherited BtCancela: TBitBtn
    Left = 751
    Top = 473
  end
  inherited BtOk: TBitBtn
    Left = 854
    Top = 473
  end
  inherited DSPFiltroRelatorio: TDataSetProvider
    DataSet = DMRelatorio_Venda.QRContaCorrente
  end
  inherited CDSFiltroRelatorio: TClientDataSet
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COD_CADASTRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COD_VENDEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COD_DEPARTAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SERIE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOTA_CAB'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COD_CLASS_CADASTRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA_I'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA_F'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CONDICAO_PAGTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'HISTORICO_CAIXA'
        ParamType = ptInput
      end>
    OnCalcFields = CDSFiltroRelatorioCalcFields
    object CDSFiltroRelatorioCOD_NOTA_CAB: TIntegerField [1]
      FieldName = 'COD_NOTA_CAB'
      Required = True
    end
    object CDSFiltroRelatorioDT_EMISSAO: TDateTimeField [2]
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object CDSFiltroRelatorioNUM_NOTA: TIntegerField [3]
      FieldName = 'NUM_NOTA'
      Required = True
    end
    object CDSFiltroRelatorioCOD_SERIE: TStringField [4]
      FieldName = 'COD_SERIE'
      Required = True
      Size = 3
    end
    object CDSFiltroRelatorioCOD_CADASTRO: TIntegerField [5]
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object CDSFiltroRelatorioNOME_CADASTRO: TStringField [6]
      FieldName = 'NOME_CADASTRO'
      Required = True
      Size = 50
    end
    object CDSFiltroRelatorioVal_Total: TFloatField [7]
      FieldName = 'Val_Total'
      ReadOnly = True
      DisplayFormat = '#,##0.00'
    end
    object CDSFiltroRelatorioVAL_AVISTA: TFloatField [8]
      FieldName = 'VAL_AVISTA'
    end
    object CDSFiltroRelatorioNOME_VENDEDOR: TStringField [9]
      FieldName = 'NOME_VENDEDOR'
      Required = True
      Size = 40
    end
    object CDSFiltroRelatorioVAL_TOTAL_ITENS: TFloatField [10]
      FieldName = 'VAL_TOTAL_ITENS'
    end
  end
end
