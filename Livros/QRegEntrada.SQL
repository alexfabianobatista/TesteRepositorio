/* ALIAS: DBCemapa */
SELECT Tb_nota_cab.NUM_NOTA, Tb_nota_cab.COD_SERIE, Tb_nota_cab.DT_RECEBIMENTO, Tb_nota_cab.COD_CADASTRO, Tb_nota_cab.COD_ESTADO, Tb_tributacao.NUM_CLASSIFICACAO, Tb_tributacao.PERC_ALIQUOTA, Tb_nota_item.VAL_TOTAL, Tb_nota_item.VAL_IPI, Tb_nota_item.VAL_ICM_BASE, Tb_nota_item.VAL_ICM
FROM TB_NOTA_CAB Tb_nota_cab, TB_NOTA_ITEM Tb_nota_item, TB_TRIBUTACAO Tb_tributacao
WHERE  (Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB)  
   AND  (Tb_nota_item.COD_TRIBUTACAO = Tb_tributacao.COD_TRIBUTACAO)  
