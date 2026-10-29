object DMBlocoH: TDMBlocoH
  OldCreateOrder = False
  Left = 532
  Top = 301
  Height = 155
  Width = 319
  object QReg005: TOracleDataSet1
    SQL.Strings = (
      '--registro h005'
      ''
      'SELECT'
      
        '  SUM(INV.QT_QUANTIDADE * DECODE(P.IND_TIPO_PRODUTO ,'#39'AGRICOLA'#39',' +
        ' INV.VL_CUSTO_MEDIO / P.NUM_EMBALAGEM, INV.VL_CUSTO_MEDIO)) AS V' +
        'L_INV'
      'FROM'
      '  TB_PARAM_SISTEMA,'
      '  TB_ESTOQUE_INVENTARIO INV'
      'INNER JOIN TB_PRODUTO P ON P.COD_PRODUTO = INV.COD_PRODUTO'
      'INNER JOIN TB_FILIAL F ON F.COD_FILIAL = INV.COD_FILIAL'
      'WHERE'
      '  INV.COD_FILIAL = :COD_FILIAL'
      'AND'
      '  INV.NUM_ANO = :NUM_ANO'
      'AND'
      '  INV.NUM_MES = :NUM_MES'
      'AND'
      '  P.IND_SITUACAO <> '#39'DESATIVADO'#39
      'AND'
      
        '  /*((COD_EMPRESA = '#39'ARZ'#39' AND P.IND_TIPO_PRODUTO IN ('#39'COMERCIAL'#39 +
        ', '#39'INDUSTRIAL'#39'))'
      
        '    OR COD_EMPRESA <> '#39'ARZ'#39' AND P.IND_TIPO_PRODUTO NOT IN ('#39'IMOB' +
        'ILIZAD'#39', '#39'IMOBILIZADO'#39','#39'CONSUMO'#39'))Junior 08/04/2026 estava traze' +
        'ndo produtos fora do tipo COMERCIAL E INDUSTRIAL*/'
      '  ('
      
        '     (COD_EMPRESA = '#39'ARZ'#39' AND P.IND_TIPO_PRODUTO IN ('#39'COMERCIAL'#39 +
        ', '#39'INDUSTRIAL'#39'))'
      '      OR'
      
        '     (COD_EMPRESA <> '#39'ARZ'#39' AND P.IND_TIPO_PRODUTO NOT IN ('#39'IMOBI' +
        'LIZAD'#39', '#39'IMOBILIZADO'#39', '#39'CONSUMO'#39'))'
      '   )'
      'AND'
      
        '  ((SELECT COUNT(*) FROM TB_FILIAL_INVENTARIO_MES X WHERE X.COD_' +
        'FILIAL = INV.COD_FILIAL AND X.NUM_MES = :MES_INVENTARIO) > 0)'
      ''
      '    '
      ' '
      ' '
      ' '
      ' ')
    Variables.Data = {
      03000000040000000B0000003A434F445F46494C49414C030000000000000000
      000000080000003A4E554D5F414E4F030000000000000000000000080000003A
      4E554D5F4D45530300000000000000000000000F0000003A4D45535F494E5645
      4E544152494F030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {040000000100000006000000564C5F494E56010000000000}
    Session = DMOracle.DBCemapa
    Left = 40
    Top = 24
    object QReg005VL_INV: TFloatField
      FieldName = 'VL_INV'
    end
  end
  object QReg010: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Tb_Produto.COD_PRODUTO as Cod_Item,'
      '  Tb_Produto.DESC_UNIDADE as Unid,'
      '  TB_PRODUTO.DESC_PRODUTO,'
      '  sum(Tb_Estoque_Inventario.QT_Quantidade) as Qtd,'
      
        '  avg(Decode(Tb_produto.Ind_Tipo_Produto,'#39'AGRICOLA'#39',Tb_Estoque_I' +
        'nventario.Vl_Custo_Medio / Tb_Produto.Num_Embalagem,Tb_Estoque_I' +
        'nventario.Vl_Custo_Medio)) as Vl_Unit,'
      '  sum(Tb_Estoque_Inventario.QT_Quantidade *'
      
        '    Decode(Tb_produto.Ind_Tipo_Produto,'#39'AGRICOLA'#39',Tb_Estoque_Inv' +
        'entario.Vl_Custo_Medio / Tb_Produto.Num_Embalagem,Tb_Estoque_Inv' +
        'entario.Vl_Custo_Medio)) as Vl_Item,'
      '  TB_PARAM_SISTEMA.COD_CONTABIL_INVENTARIO'
      'From'
      '  Tb_Estoque_Inventario'
      
        'INNER JOIN TB_PRODUTO ON Tb_Estoque_Inventario.COD_PRODUTO = Tb_' +
        'Produto.COD_PRODUTO'
      'INNER JOIN TB_PARAM_SISTEMA ON 1 = 1'
      'Where'
      '  Tb_Estoque_Inventario.COD_FILIAL = :Cod_Filial'
      'And'
      '  Tb_Estoque_Inventario.NUM_ANO = :Num_Ano'
      'And'
      '  Tb_Estoque_Inventario.NUM_MES = :Num_Mes'
      'AND'
      '  TB_PRODUTO.IND_SITUACAO <> '#39'DESATIVADO'#39
      'AND'
      
        '  /*((COD_EMPRESA = '#39'ARZ'#39' AND TB_PRODUTO.IND_TIPO_PRODUTO IN ('#39'C' +
        'OMERCIAL'#39', '#39'INDUSTRIAL'#39'))'
      
        '    OR COD_EMPRESA <> '#39'ARZ'#39' AND TB_PRODUTO.IND_TIPO_PRODUTO NOT ' +
        'IN ('#39'IMOBILIZAD'#39', '#39'IMOBILIZADO'#39','#39'CONSUMO'#39'))'
      
        '   OR (COD_EMPRESA = '#39'ARZ'#39' AND TB_PRODUTO.COD_CLASSE NOT IN (14,' +
        ' 16, 18)) Junior 08/04/2026 estava trazendo produtos fora do tip' +
        'o COMERCIAL E INDUSTRIAL*/'
      '   ('
      '    (COD_EMPRESA = '#39'ARZ'#39
      
        '      AND TB_PRODUTO.IND_TIPO_PRODUTO IN ('#39'COMERCIAL'#39', '#39'INDUSTRI' +
        'AL'#39')'
      '      AND TB_PRODUTO.COD_CLASSE NOT IN (14, 16, 18))'
      '    OR'
      '    (COD_EMPRESA <> '#39'ARZ'#39
      
        '      AND TB_PRODUTO.IND_TIPO_PRODUTO NOT IN ('#39'IMOBILIZAD'#39', '#39'IMO' +
        'BILIZADO'#39', '#39'CONSUMO'#39'))'
      '  )'
      ''
      'group by'
      '  Tb_Produto.COD_PRODUTO,'
      '  Tb_Produto.DESC_UNIDADE,'
      '  TB_PRODUTO.DESC_PRODUTO,'
      '  TB_PARAM_SISTEMA.COD_CONTABIL_INVENTARIO'
      'order by'
      '  TB_PRODUTO.DESC_PRODUTO'
      ' ')
    Variables.Data = {
      03000000030000000B0000003A434F445F46494C49414C030000000000000000
      000000080000003A4E554D5F414E4F030000000000000000000000080000003A
      4E554D5F4D4553030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000600000008000000434F445F4954454D01000000000004000000554E
      49440100000000000300000051544401000000000007000000564C5F554E4954
      01000000000007000000564C5F4954454D01000000000017000000434F445F43
      4F4E544142494C5F494E56454E544152494F010000000000}
    Session = DMOracle.DBCemapa
    Left = 136
    Top = 24
    object QReg010COD_ITEM: TFloatField
      FieldName = 'COD_ITEM'
      Required = True
    end
    object QReg010UNID: TStringField
      FieldName = 'UNID'
      Size = 3
    end
    object QReg010QTD: TFloatField
      FieldName = 'QTD'
      Required = True
    end
    object QReg010VL_UNIT: TFloatField
      FieldName = 'VL_UNIT'
    end
    object QReg010VL_ITEM: TFloatField
      FieldName = 'VL_ITEM'
    end
    object QReg010COD_CONTABIL_INVENTARIO: TStringField
      FieldName = 'COD_CONTABIL_INVENTARIO'
      Size = 15
    end
  end
end
