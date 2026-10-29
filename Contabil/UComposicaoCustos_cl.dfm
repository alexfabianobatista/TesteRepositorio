object DMComposicaoCustos: TDMComposicaoCustos
  OldCreateOrder = False
  Left = 324
  Top = 211
  Height = 175
  Width = 855
  object QComposicaoCustos: TOracleDataSet1
    SQL.Strings = (
      'select '
      '    rowid,'
      '    tb_composicao_custos.* '
      'from tb_composicao_custos'
      'where '
      'tb_composicao_custos.cod_composicao_custos = :PK'
      'order by tb_composicao_custos.cod_composicao_custos')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000300000015000000434F445F434F4D504F534943414F5F435553544F
      5301000000000016000000444553435F434F4D504F534943414F5F435553544F
      5301000000000009000000494E445F415449564F010000000000}
    Session = DMOracle.DBCemapa
    Left = 48
    Top = 16
    object QComposicaoCustosCOD_COMPOSICAO_CUSTOS: TIntegerField
      FieldName = 'COD_COMPOSICAO_CUSTOS'
      Required = True
    end
    object QComposicaoCustosDESC_COMPOSICAO_CUSTOS: TStringField
      FieldName = 'DESC_COMPOSICAO_CUSTOS'
      Required = True
      Size = 120
    end
    object QComposicaoCustosIND_ATIVO: TStringField
      FieldName = 'IND_ATIVO'
      Size = 3
    end
  end
  object QComposicaoCustosGrid: TOracleDataSet1
    SQL.Strings = (
      'select '
      '    COD_COMPOSICAO_CUSTOS,'
      '    initcap(DESC_COMPOSICAO_CUSTOS)AS DESC_COMPOSICAO_CUSTOS,'
      '    IND_ATIVO'
      'from tb_composicao_custos'
      'order by cod_composicao_custos')
    QBEDefinition.QBEFieldDefs = {
      040000000300000015000000434F445F434F4D504F534943414F5F435553544F
      5301000000000016000000444553435F434F4D504F534943414F5F435553544F
      5301000000000009000000494E445F415449564F010000000000}
    Session = DMOracle.DBCemapa
    Left = 176
    Top = 16
    object QComposicaoCustosGridCOD_COMPOSICAO_CUSTOS: TIntegerField
      FieldName = 'COD_COMPOSICAO_CUSTOS'
      Required = True
    end
    object QComposicaoCustosGridDESC_COMPOSICAO_CUSTOS: TStringField
      FieldName = 'DESC_COMPOSICAO_CUSTOS'
      Required = True
      Size = 120
    end
    object QComposicaoCustosGridIND_ATIVO: TStringField
      FieldName = 'IND_ATIVO'
      Size = 3
    end
  end
  object QComposicaoCustosCons: TOracleDataSet1
    SQL.Strings = (
      'select '
      '    COD_COMPOSICAO_CUSTOS,'
      '    UPPER(DESC_COMPOSICAO_CUSTOS) as DESC_COMPOSICAO_CUSTOS,'
      '    IND_ATIVO'
      'from tb_composicao_custos'
      'where '
      
        'UPPER(tb_composicao_custos.DESC_COMPOSICAO_CUSTOS) like '#39'%'#39' || U' +
        'PPER(:DESCRICAO) || '#39'%'#39)
    Variables.Data = {
      03000000010000000A0000003A44455343524943414F05000000060000004355
      53544F0000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000300000015000000434F445F434F4D504F534943414F5F435553544F
      5301000000000016000000444553435F434F4D504F534943414F5F435553544F
      5301000000000009000000494E445F415449564F010000000000}
    Session = DMOracle.DBCemapa
    Left = 48
    Top = 72
    object QComposicaoCustosConsCOD_COMPOSICAO_CUSTOS: TIntegerField
      FieldName = 'COD_COMPOSICAO_CUSTOS'
      Required = True
    end
    object QComposicaoCustosConsDESC_COMPOSICAO_CUSTOS: TStringField
      FieldName = 'DESC_COMPOSICAO_CUSTOS'
      Required = True
      Size = 120
    end
    object QComposicaoCustosConsIND_ATIVO: TStringField
      FieldName = 'IND_ATIVO'
      Size = 3
    end
  end
  object QCustosContaReferencialGrid: TOracleDataSet1
    SQL.Strings = (
      'select '
      '    TB_COMPOSICAO_CUSTOS.COD_COMPOSICAO_CUSTOS,'
      '    TB_COMPOSICAO_CUSTOS.DESC_COMPOSICAO_CUSTOS,'
      '    TB_COMPOSICAO_CUSTOS.IND_ATIVO,'
      '    TB_PLANO_CONTA_REFERENCIAL.COD_PLANO_CONTA_REFERENCIAL,'
      '    TB_PLANO_CONTA_REFERENCIAL.NUM_PLANO_CONTA_REFERENCIAL,'
      '    TB_PLANO_CONTA_REFERENCIAL.DESC_PLANO_CONTA_REFERENCIAL'
      'from TB_COMPOSICAO_CUSTOS '
      'inner join TB_CUSTOS_CONTA_REFERENCIAL on'
      
        'TB_COMPOSICAO_CUSTOS.COD_COMPOSICAO_CUSTOS = TB_CUSTOS_CONTA_REF' +
        'ERENCIAL.COD_COMPOSICAO_CUSTOS'
      'INNER JOIN TB_PLANO_CONTA_REFERENCIAL ON'
      
        'TB_CUSTOS_CONTA_REFERENCIAL.COD_PLANO_CONTA_REFERENCIAL = TB_PLA' +
        'NO_CONTA_REFERENCIAL.COD_PLANO_CONTA_REFERENCIAL'
      'where'
      '    TB_COMPOSICAO_CUSTOS.COD_COMPOSICAO_CUSTOS = :PK'
      'order by TB_COMPOSICAO_CUSTOS.COD_COMPOSICAO_CUSTOS')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000600000015000000434F445F434F4D504F534943414F5F435553544F
      5301000000000016000000444553435F434F4D504F534943414F5F435553544F
      5301000000000009000000494E445F415449564F0100000000001B0000004E55
      4D5F504C414E4F5F434F4E54415F5245464552454E4349414C0100000000001C
      000000444553435F504C414E4F5F434F4E54415F5245464552454E4349414C01
      00000000001B000000434F445F504C414E4F5F434F4E54415F5245464552454E
      4349414C010000000000}
    Session = DMOracle.DBCemapa
    Left = 552
    Top = 24
    object QCustosContaReferencialGridCOD_COMPOSICAO_CUSTOS: TIntegerField
      FieldName = 'COD_COMPOSICAO_CUSTOS'
      Required = True
    end
    object QCustosContaReferencialGridDESC_COMPOSICAO_CUSTOS: TStringField
      FieldName = 'DESC_COMPOSICAO_CUSTOS'
      Required = True
      Size = 120
    end
    object QCustosContaReferencialGridIND_ATIVO: TStringField
      FieldName = 'IND_ATIVO'
      Size = 3
    end
    object QCustosContaReferencialGridNUM_PLANO_CONTA_REFERENCIAL: TStringField
      FieldName = 'NUM_PLANO_CONTA_REFERENCIAL'
      Required = True
    end
    object QCustosContaReferencialGridDESC_PLANO_CONTA_REFERENCIAL: TStringField
      FieldName = 'DESC_PLANO_CONTA_REFERENCIAL'
      Size = 200
    end
    object QCustosContaReferencialGridCOD_PLANO_CONTA_REFERENCIAL: TIntegerField
      FieldName = 'COD_PLANO_CONTA_REFERENCIAL'
      Required = True
    end
  end
  object QCustosContaReferencial: TOracleDataSet1
    SQL.Strings = (
      'select '
      '    rowid, '
      '    tb_custos_conta_referencial.*'
      'from tb_custos_conta_referencial'
      'where tb_custos_conta_referencial.cod_composicao_custos = :pk'
      '')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_CUSTOS_CONTA_REFERENCIAL'
    SequenceField.Sequence = 'SQCUSTO_CONTA_REFERENCIAL'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      04000000030000001C000000434F445F435553544F535F434F4E54415F524546
      4552454E4349414C01000000000015000000434F445F434F4D504F534943414F
      5F435553544F530100000000001B000000434F445F504C414E4F5F434F4E5441
      5F5245464552454E4349414C010000000000}
    Session = DMOracle.DBCemapa
    Left = 384
    Top = 24
    object QCustosContaReferencialCOD_CUSTOS_CONTA_REFERENCIAL: TIntegerField
      FieldName = 'COD_CUSTOS_CONTA_REFERENCIAL'
      Required = True
    end
    object QCustosContaReferencialCOD_COMPOSICAO_CUSTOS: TIntegerField
      FieldName = 'COD_COMPOSICAO_CUSTOS'
      Required = True
    end
    object QCustosContaReferencialCOD_PLANO_CONTA_REFERENCIAL: TIntegerField
      FieldName = 'COD_PLANO_CONTA_REFERENCIAL'
      Required = True
    end
  end
  object DSCustosContaReferencial: TDataSource
    DataSet = QCustosContaReferencial
    Left = 384
    Top = 72
  end
end
