/* ALIAS: DBCemapa */
SELECT Tb_nota_cab.COD_ESTADO, Tb_nota_item.QT_QUANTIDADE, Tb_nota_item.VAL_TOTAL, Tb_produto.DESC_PRODUTO, Tb_cadastro.NOME, Tb_regiao.DESC_REGIAO, Tb_ramo.DESC_RAMO
FROM TB_NOTA_CAB Tb_nota_cab, TB_NOTA_ITEM Tb_nota_item, TB_PRODUTO Tb_produto, TB_RAMO Tb_ramo, TB_REGIAO Tb_regiao, TB_CADASTRO Tb_cadastro
WHERE  (Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB)  
   AND  (Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO)  
   AND  (Tb_nota_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO)  
   AND  (Tb_cadastro.COD_REGIAO = Tb_regiao.COD_REGIAO)  
   AND  (Tb_cadastro.COD_RAMO = Tb_ramo.COD_RAMO)  

--ANSI== SELECT Tb_nota_cab.COD_ESTADO, Tb_nota_item.QT_QUANTIDADE, Tb_nota_item.VAL_TOTAL, Tb_produto.DESC_PRODUTO, Tb_cadastro.NOME, Tb_regiao.DESC_REGIAO, Tb_ramo.DESC_RAMO
--ANSI== FROM TB_NOTA_CAB Tb_nota_cab, TB_NOTA_ITEM Tb_nota_item, TB_CADASTRO Tb_cadastro, TB_PRODUTO Tb_produto, TB_REGIAO Tb_regiao, TB_RAMO Tb_ramo
--ANSI== WHERE  (Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB)  
--ANSI==    AND  (Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO)  
--ANSI==    AND  (Tb_nota_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO)  
--ANSI==    AND  (Tb_cadastro.COD_REGIAO = Tb_regiao.COD_REGIAO)  
--ANSI==    AND  (Tb_cadastro.COD_RAMO = Tb_ramo.COD_RAMO)  
