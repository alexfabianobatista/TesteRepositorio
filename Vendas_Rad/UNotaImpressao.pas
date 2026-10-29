unit UNotaImpressao;

interface

Uses Dialogs, SysUtils, UBiblioteca,UFilial_cl;

Type
  TFNotaImpressao = Class
  Private
    Procedure NFMoinho;
    Procedure NF_AB;
    Procedure NFFaville;
    Procedure NFEncopel;
    Procedure NFBrasil;
    Procedure NF_NIR;
    Procedure NF_CGS;
    Procedure NF_CGS_2;
    Procedure NF_CEREAIS;
    Procedure NF_GONZATTI;
    Procedure NF_MEDIBENS;
    Procedure NF_TEMPERMED;
    Procedure EmitePedido(wDocumento : String);
    Procedure EmitePedido_Bobina;
    Procedure NFZadimel;
    Procedure Imp_Desconto(wLinha:Integer;wColuna : Real);
    Procedure Calc_Peso_Nota;
    Procedure NFRadiolandia;
  Public
    Procedure EmiteNF(wCodNF:Integer);
end;

var
  FNotaImpressao : TFNotaImpressao;
  wEmpresa : string;
  wMensCorpoNota : Char;
  wbase_icm_tributada, wvlr_icm, wtotal_produtos, wvlr_ipi, wPeso,wBase_Subst,wIcms_Subst : Real;
Const
  wBranco : String = '                                                                                                                            ';

implementation

Uses UOracle_cl, UNotaSaida_cl, UNotaEntrada_cl;

Procedure TFNotaImpressao.EmiteNF(wCodNF:Integer);
var wTipoDocumento,wLpt_Nota,wLpt_Pedido: String;
begin
  // *** Emissão de Nota Fiscal *** \\
  wEmpresa := DMOracle.BuscaNome('SELECT COD_EMPRESA FROM TB_PARAM_SISTEMA', 'COD_FILIAL >= 0');
  wTipoDocumento := DMOracle.BuscaNome('SELECT IND_EMITE FROM TB_OPERACAO, TB_NOTA_CAB',
                    'TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
                   +' AND TB_NOTA_CAB.COD_NOTA_CAB = '+FloatToStr(wCodNF));
  DMNotaSaida.SetaEmissao(wCodNF);
  wLpt_Nota := DMOracle.BuscaNome('SELECT DESC_LPT_NOTA FROM TB_FILIAL', 'COD_FILIAL = '+FloatToStr(DMNotaSaida.QNFE_EmiteCod_Filial.Value));
  wLpt_Pedido := DMOracle.BuscaNome('SELECT DESC_LPT_PEDIDO FROM TB_FILIAL', 'COD_FILIAL = '+FloatToStr(DMNotaSaida.QNFE_EmiteCod_Filial.Value));
  If DMNotaSaida.QNFE_EmiteIND_SITUACAO.Value <> '2' Then
     raise Exception.Create('Esta Nota não foi confirmada!');
  wMensCorpoNota := 'N';
  wPeso := 0; // inicializa variavel utilizado na procedure calc_Peso_nota
  If DMNotaSaida.QNFE_EmiteInd_Entrada_Saida.Value = 'E' Then
  begin
     wbase_icm_tributada := DMNotaEntrada.QSomaItemNotaSVal_ICM_Base.Value;
     wvlr_icm := DMNotaEntrada.QSomaItemNotaSVal_ICM.Value;
     wtotal_produtos := DMNotaEntrada.QSomaItemNotaSVal_Total.Value;
     wvlr_ipi := DMNotaEntrada.QSomaItemNotaSVal_Ipi.Value;
     wBase_Subst:=0;
     wIcms_Subst:=0;
  end
  else
  begin
    DMNotaSaida.QNotaSaida.Close;
    DMNotaSaida.QSomaItemNota.Close;
    DMNotaSaida.QNotaSaida.SetVariable('PK',DMNotaSaida.QNFE_EmiteCOD_NOTA_CAB.Value);
    DMNotaSaida.QNotaSaida.Open;
    DMNotaSaida.QSomaItemNota.Open;
    wbase_icm_tributada := DMNotaSaida.QSomaItemNotaSVal_ICM_Base.Value;
    wvlr_icm := DMNotaSaida.QSomaItemNotaSVal_ICM.Value;
    wtotal_produtos := DMNotaSaida.QSomaItemNotaSVal_Total.Value;
    wvlr_ipi := DMNotaSaida.QSomaItemNotaSVal_Ipi.Value;
    wBase_Subst:=DMNotaSaida.QSomaItemNotaSVal_Base_Subst.Value;
    wIcms_Subst:=DMNotaSaida.QSomaItemNotaSVal_Icms_Subst.Value;
  end;
  if Imp = Nil Then
     Imp := TImp.Create;
  if wTipoDocumento = 'F' Then // Nota Fiscal
  begin
    if Trim(wLpt_Nota) = 'LPT1'
    then
       Imp.AbreImpressora
    else
      if Trim(wLpt_Nota) = 'LPT2'
      then
         Imp.AbreImpressora_Lpt2
      else
         Imp.AbreImpressora_Com2;
    Imp.ConfiguraImpressora('CONDENSADO_OFF','SEXTOS',66);
    if wEmpresa = 'NIR' Then
    begin
      Imp.ConfiguraImpressora('CONDENSADO_ON','OITAVOS',94);
      FNotaImpressao.NF_NIR;
    end;
    if wEmpresa = 'ENCOPEL' Then
    begin
      Imp.ConfiguraImpressora('CONDENSADO_ON','OITAVOS',68);
      FNotaImpressao.NFEncopel;
    end;
    if wEmpresa = 'BRASIL' Then
    begin
      Imp.ConfiguraImpressora('CONDENSADO_ON','OITAVOS',68);
      FNotaImpressao.NFBrasil;
    end;
    if wEmpresa = 'FAVILLE' Then
    begin
      Imp.ConfiguraImpressora('CONDENSADO_ON','SEXTOS',66);
      FNotaImpressao.NFFaville;
    end;
    if wEmpresa = 'MOINHO' Then
    begin
      Imp.ConfiguraImpressora('CONDENSADO_ON','OITAVOS',104);
      FNotaImpressao.NFMoinho;
    end;
    if wEmpresa = 'AB' Then   // AB CÓMERCIO DE INSUMOS LTDA.
    begin
      Imp.ConfiguraImpressora('CONDENSADO_ON','OITAVOS',88);
      FNotaImpressao.NF_AB;
    end;
    if wEmpresa = 'CGS' Then
    begin
      Imp.ConfiguraImpressora('CONDENSADO_ON','OITAVOS',90);
      if DMNotaSaida.QNFE_EmiteCOD_FILIAL.Value <> 3 Then
         FNotaImpressao.NF_CGS
      else
         FNotaImpressao.NF_CGS_2;
    end;
    if wEmpresa = 'CEREAIS' Then
    begin
      Imp.ConfiguraImpressora('CONDENSADO_ON','OITAVOS',88);
      FNotaImpressao.NF_CEREAIS;
    end;
    if wEmpresa = 'GONZATTI' Then   // CEREALISTA SÃO JORGE - G. GONZATTI
    begin
      Imp.ConfiguraImpressora('CONDENSADO_ON','OITAVOS',68);
      FNotaImpressao.NF_GONZATTI;
    end;
    if wEmpresa = 'MEDIBENS' Then
    begin
      Imp.ConfiguraImpressora('CONDENSADO_ON','SEXTOS',72);
      FNotaImpressao.NF_MEDIBENS;
    end;
    if wEmpresa = 'ZADIMEL' Then
    begin
      Imp.ConfiguraImpressora('CONDENSADO_ON','SEXTOS',66);
      FNotaImpressao.NFZADIMEL;
    end;
    if wEmpresa = 'RADIO' Then
    begin
      Imp.ConfiguraImpressora('CONDENSADO_ON','OITAVOS',73);
      FNotaImpressao.NFRadiolandia;
    end;
    if wEmpresa = 'TEMPERMED' Then
    begin
      Imp.ConfiguraImpressora('CONDENSADO_ON','OITAVOS',96);
      FNotaImpressao.NF_TEMPERMED;
    end;
  end // Nota Fiscal
  else
  begin
    if Trim(wLpt_Pedido) = 'LPT1' then
       Imp.AbreImpressora
    else if Trim(wLpt_Pedido) = 'LPT2' then
            Imp.AbreImpressora_Lpt2
    else if Trim(wLpt_Pedido) = 'LPT3' then
            Imp.AbreImpressora_Lpt3
    else
       Imp.AbreImpressora_Com2;
    Imp.ConfiguraImpressora('CONDENSADO_ON','SEXTOS',33);
    if (wTipoDocumento = 'P') Then // Pedido
       EmitePedido('Pedido:');
    if (wTipoDocumento = 'O') Then // Orçamento
       EmitePedido('Orçamento:');
    if (wTipoDocumento = 'R') Then // Pedido 40 colunas
       EmitePedido_Bobina;
  end;
  if wTipoDocumento[1] in ['P','O','F'] Then
     Imp.SaltaPagina;
  Imp.ConfiguraImpressora('CONDENSADO_OFF','SEXTOS',66);
  Imp.FechaImpressora;  // Finaliza os serviços de Impressao
  With DMNotaSaida do
  Begin
    QNFE_Emite.Close;
    QNFE_EmiteIT.Close;
  end;
end;

Procedure TFNotaImpressao.NFMoinho;
var wCont, wContReceber : Byte;
    wPerc_Funrural,wExtenso, wLinhaExt1, wLinhaExt2 : String;
begin
  // *** Emissão de Nota Fiscal para o Moinho Iguaçu
  // *** OBS - Colocar Posicao X em Centimetros
  wCont := 2;
  With DMNotaSaida do
  Begin
    Imp.WriteXY(18.3,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
    Inc(wCont);
    Imp.WriteXY(5.5,wCont,QNFE_EmiteNOME_FILIAL.Value);
    Inc(wCont);
    Imp.WriteXY(5.5,wCont,QNFE_EmiteEND_FILIAL.Value);
    If QNFE_EmiteInd_Entrada_Saida.Value = 'E' Then
      Imp.WriteXY(15.5,wCont,'XX')
    Else
      Imp.WriteXY(13.3,wCont,'XX');
    Inc(wCont);
    Imp.WriteXY(5.5,wCont,QNFE_EmiteCIDADE_FILIAL.Value);
    Imp.WriteXY(9.5,wCont,QNFE_EmiteUF_FILIAL.Value);
    Imp.WriteXY(10.5,wCont,QNFE_EmiteCEP_FILIAL.Value);
    Inc(wCont);
    Imp.WriteXY(5.5,wCont,'Telefone:'+QNFE_EmiteTELEFONE_FILIAL.Text+'  Cx Postal:' +FloatToStr(QNFE_EmiteCXPOSTAL_FILIAL.Value));
    wCont := wCont + 2;
    Imp.WriteXY(5.5,wCont,'Fax:'+QNFE_EmiteDESC_FAX.Text+'  E_Mail:' + QNFE_EmiteDESC_E_MAIL.Text);
    Imp.WriteXY(14,wCont,QNFE_EmiteCGC_FILIAL.Value);
    wCont := wCont + 3;
    Imp.WriteXY(0,wCont,QNFE_EmiteNAT_OPERACAO.Value);
    Imp.WriteXY(7,wCont,QNFE_Emitenum_cfop.Text);  //ALTERADO SERGIO 13/12/2002
{    If QNFE_EmiteUF_Filial.Value <> QNFE_EmiteUF_Nota.Value then
      Imp.WriteXY(7,wCont,QNFE_EmiteNat_InterEstadual.Text)
    Else
      Imp.WriteXY(7,wCont,QNFE_EmiteNat_Estadual.Text);
}
    Imp.WriteXY(14,wCont,QNFE_EmiteINSCRICAO_FILIAL.Value);
    wCont := wCont + 4;
    Imp.WriteXY(0,wCont,QNFE_EmiteNOME.Text+' - '+QNFE_EmiteCOD_CADASTRO.Text);
    Imp.WriteXY(13,wCont,QNFE_EmiteNUM_CGC_CPF.Value);
    Imp.WriteXY(18,wCont,QNFE_EmiteDT_EMISSAO.Text);
    wCont := wCont + 2;
    Imp.WriteXY(0,wCont, QNFE_EmiteDESC_ENDERECO.Value);
    Imp.WriteXY(12.2,wCont,QNFE_EmiteDESC_BAIRRO.Value);
    Imp.WriteXY(15.4,wCont,QNFE_EmiteDESC_CEP.Value);
    Imp.WriteXY(18,wCont,QNFE_EmiteDT_RECEBIMENTO.Text);
    wCont := wCont+3;
    Imp.WriteXY(0,wCont,QNFE_EmiteDESC_CIDADE.Value);
    Imp.WriteXY(8.7,wCont,QNFE_EmiteDESC_TELEFONE.Value);
    Imp.WriteXY(12.2,wCont,QNFE_EmiteCOD_ESTADO.Value);
    Imp.WriteXY(14,wCont,QNFE_EmiteNUM_INSCRICAO.Value);
    wCont := wCont + 4;
    If QNFE_EmiteInd_Condicao_Pagto.Value = '2' Then
    Begin
      wContReceber:=0;
      QContaReceber.Open;
      QContaReceber.First;
      While not QContaReceber.Eof Do
      Begin
        if wContReceber = 0 Then
          Begin
            Imp.WriteXY(0,wCont,QContaReceberDT_EMISSAO.Text);
            Imp.WriteXY(2,wCont,Bib.NumToTexto(QContaReceberNUM_TITULO.Value,0,6));
            Imp.WriteXY(3.6,wCont,QContaReceberDT_Vencimento.Text);
            Imp.WriteXY(5.5,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
            wContReceber := 1;
          End
        Else
          Begin
            Imp.WriteXY(8.2,wCont,QContaReceberDT_EMISSAO.Text);
            Imp.WriteXY(10,wCont,Bib.NumToTexto(QContaReceberNUM_TITULO.Value,0,6));
            Imp.WriteXY(11.6,wCont,QContaReceberDT_Vencimento.Text);
            Imp.WriteXY(13.5,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
            wContReceber := 0;
            Inc(wCont);
          End;
        QContaReceber.Next;
      End;
      QContaReceber.Close;
    End;
    wCont := 31;
    Imp.WriteXY(0.2,wCont,QNFE_EmiteDESC_CIDADE.Text + ' - ' + QNFE_EmiteCOD_ESTADO.Value + ' - ' + QNFE_EmiteDESC_ENDERECO.Text);
    wExtenso := Bib.Extenso( wtotal_produtos
                        +wvlr_ipi
                        -QNFE_Emiteval_funrural.Value,'REAL');
    Bib.QuebraString(wExtenso,118,wLinhaExt1,wLinhaExt2,'*');
    wCont := wCont + 3;
    Imp.WriteXY(0,wCont,'(R$' + Bib.NumToTexto(wtotal_produtos
                                 +wvlr_ipi
                                 -QNFE_EmiteVAL_Funrural.Value,2,15)+')');
    Imp.WriteXY(2.5,wCont,wLinhaExt1);
    Inc(wCont);
    Imp.WriteXY(0,wCont,wLinhaExt2+'******************');
    wCont := wCont + 2;
    Imp.WriteXY(0,wCont,'Nome Fantasia:'+QNFE_EmiteDESC_FANTASIA.Text);
    wCont := 47;
    // **** Itens ****
    QNFE_EmiteIt.First;
    While Not QNFE_EmiteIT.Eof do
    Begin
      Inc(wCont);
      Imp.WriteXY(0,wCont,Bib.NumToTexto(QNFE_EmiteITCod_Produto.Value,0,6));
      Imp.WriteXY(1.5,wCont,QNFE_EmiteITDesc_Produto.Value);
      If (QNFE_EmiteItInd_Tipo_Produto.Value = 'AGRICOLA') And
         (QNFE_EmiteItCod_Lote_Tipo.Value > 1) Then
         Imp.WriteXY(7.8,wCont,QNFE_EmiteITCod_Lote_Tipo.Text);
      Imp.WriteXY(9.8,wCont,QNFE_EmiteITNum_Nota_Produtor.Text);
      Imp.WriteXY(11,wCont,QNFE_EmiteITDesc_Situacao_Trib.Value);
      Imp.WriteXY(11.7,wCont,QNFE_EmiteITDesc_Unidade.Value);
      Imp.WriteXY(12.6,wCont,Bib.NumToTexto(QNFE_EmiteITQT_Quantidade.Value,2,10));
      Imp.WriteXY(14.3,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Unitario.Value,3,12));
      Imp.WriteXY(16.5,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value,2,15));
      Imp.WriteXY(19.5,wCont,QNFE_EmiteITPerc_Aliquota.Text);
      Calc_Peso_Nota;   // calculo do peso produto
      If QNFE_EmiteItDesc_Complemento.Value <> '' Then
      Begin   // ** Imprimir Complemento de Descrição
        Inc(wCont);
        Imp.WriteXY(1.5,wCont,QNFE_EmiteITDesc_Complemento.Value);
      End;
      // este teste é apenas para imprimir mensagem da ACCO
      If QNFE_EmiteItInd_Tipo_Embalagem.Value <> '' Then
         wMensCorpoNota := 'S';
      If (QNFE_EmiteItInd_Imprime_NF.Value = 'S') And (QNFE_EmiteItDesc_Observacao.Value <> '') Then
      Begin   // ** Imprimir Informações do Lote
          Inc(wCont);
          Imp.WriteXY(1.5,wCont,' OBS:');
          Imp.WriteXY(1.8,wCont,QNFE_EmiteItDesc_Observacao.Value);
      End;
      If (QNFE_EmiteItInd_Tipo_Produto.Value = 'AGRICOLA') or (QNFE_EmiteItInd_Tipo_Produto.Value = 'ARROZ')then
      Begin // Preco de produtos agrícolas em Sacas
        Inc(wCont);
        Imp.WriteXY(14.3,wCont,'Preco P/ '+FloatToStr(QNFE_EmiteItNum_Embalagem.Value)+' Kg');
      End;
      If (QNFE_EmiteItDesc_Germinacao.Value <> '') Or (QNFE_EmiteItDesc_Pureza.Value <> '') or
         (QNFE_EmiteItDesc_Atestado.Value <> '') Or (QNFE_EmiteItDesc_Validade.Value <> '') Or (QNFE_EmiteItDesc_Peneira.Value <> '') Then
      Begin   // ** Imprimir Informações do Lote
        Inc(wCont);
        Imp.WriteXY(0,wCont,'Lote:');
        Imp.WriteXY(0,wCont,QNFE_EmiteItDesc_Lote.Value);
        Imp.WriteXY(0,wCont,' Germ.:');
        Imp.WriteXY(0,wCont,QNFE_EmiteItDesc_Germinacao.Value);
        Imp.WriteXY(0,wCont,' Pureza:');
        Imp.WriteXY(0,wCont,QNFE_EmiteItDesc_Pureza.Value);
        Imp.WriteXY(0,wCont,' Atestado:');
        Imp.WriteXY(0,wCont,QNFE_EmiteItDesc_Atestado.Value);
        Imp.WriteXY(0,wCont,' Validade:');
        Imp.WriteXY(0,wCont,QNFE_EmiteItDesc_Validade.Value);
        Imp.WriteXY(0,wCont,' Peneira:');
        Imp.WriteXY(0,wCont,QNFE_EmiteItDesc_Peneira.Value);
      End;
      If QNFE_EmiteItDesc_Observacao_Tr.Text <> '' Then
      Begin   // ** Imprimir Complemento de Descrição
        Inc(wCont);
        Imp.WriteXY(1.5,wCont,QNFE_EmiteITDesc_Observacao_Tr.Value);
      End;
      QNFE_EmiteIT.Next;
    end;
    If QNFE_EmiteVal_Desconto.Value > 0 Then
      If QNFE_EmiteInd_Fixar_Empresa.Value = 'F' Then
       Begin
        Inc(wCont);
        Imp.WriteXY(10,wCont,'Valor Atribuido as NFs a Fixar:   ');
        Imp.WriteXY(16.5,wCont,Bib.NumToTexto(QNFE_EmiteVal_Desconto.Value,2,15));
       End
      Else
       Begin
        Inc(wCont);
        Imp.WriteXY(15,wCont,'Desconto:   '+Bib.NumToTexto(QNFE_EmiteVal_Desconto.Value,2,13));
       End;
    // *** Final dos Itens ****
    FNotaImpressao.Imp_Desconto(wCont,1.5);
    If (wCont <= 63) And (wMensCorpoNota = 'S') And ((QNFE_EmiteInd_Vendas.Value = 'V') or (QNFE_EmiteInd_Futura_Cliente.Value = 'S')) Then
     If QNFE_EmiteCOD_FILIAL.Value <> 5 Then
      Begin
        Imp.WriteXY(0,63,'Endereco para entrega de embalagens vazias(triplice lavadas): Estrada para escola agricola Meu Cantinho');
        Imp.WriteXY(0,64,'Linha Tres Fazendas - Santa Terezinha de Itaipu - PR');
        Imp.WriteXY(0,65,'E Obrigatorio a apresentacao desta NF ou copia no momento da entrega das embalagens vazias, acompanhada da NF de produtor');
      End
     Else
      Begin
        Imp.WriteXY(0,64,'Recebimento embalagens de agrotoxicos ADDAV - PR - Rodovia PR486 Km 11');
        Imp.WriteXY(0,65,'Espigao Azul - Cascavel - PR');
      End;
    wCont := 69;
    Imp.WriteXY(0,wCont,Bib.NumToTexto(wbase_icm_tributada,2,13));
    Imp.WriteXY(4,wCont,Bib.NumToTexto(wvlr_icm,2,13));
    Imp.WriteXY(16,wCont,Bib.NumToTexto(wtotal_produtos,2,15));
    wCont := wCont + 3;
    Imp.WriteXY(0,wCont,Bib.NumToTexto(QNFE_EmiteVAL_FRETE.Value,2,13));
    Imp.WriteXY(8,wCont,Bib.NumToTexto(QNFE_EmiteVAL_DESPESAS.Value,2,13));
    Imp.WriteXY(12,wCont,Bib.NumToTexto(wvlr_ipi,2,13));
    Imp.WriteXY(16,wCont,Bib.NumToTexto(wtotal_produtos
                                 +wvlr_ipi
                                 +QNFE_EmiteVAL_DESPESAS.Value
                                 -QNFE_EmiteVAL_Desconto.Value
                                 -QNFE_EmiteVAL_Funrural.Value,2,15));
    wCont := wCont + 4;
    if Trim(QNFE_Emitenome_transp.Value) = '' then
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_Transportadora.Value)
    else
      Imp.WriteXY(0,wCont,QNFE_Emitenome_transp.Value);
    if QNFE_EmiteInd_Tipo_Frete.Value = 'FOB' Then
      Imp.WriteXY(11.7,wCont,'2') // Destinatário
    else
      Imp.WriteXY(11.7,wCont,'1'); // Emitente
    Imp.WriteXY(12.4,wCont,QNFE_EmiteDesc_Placa.Value);
    Imp.WriteXY(16,wCont,QNFE_Emitecgc_transp.Value);
    wCont := wCont+3;
    Imp.WriteXY(0,wCont,QNFE_Emiteend_transp.Value);
    Imp.WriteXY(10.5,wCont,QNFE_Emitecidade_transp.Value);
    Imp.WriteXY(14.5,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(15.5,wCont,QNFE_Emiteinsc_transp.Value);
    wCont := wCont + 3;
    Imp.WriteXY(0.3,wCont,QNFE_EmiteNum_Volumes.Text);
    Imp.WriteXY(14.5,wCont,Bib.NumToTexto(wPeso,2,11));
    if QNFE_Emiteqt_beneficiado.Value > 0 Then
       Imp.WriteXY(18,wCont,QNFE_Emiteqt_beneficiado.Text)
    else
       Imp.WriteXY(18,wCont,Bib.NumToTexto(wPeso,2,11));
    wCont := wCont + 3;
    if QNFE_EmiteVAL_Funrural.Value > 0 Then
    begin
      Imp.WriteXY(0.5,wCont,Bib.NumToTexto(QNFE_EmiteVAL_Funrural.Value,2,13));
      wPerc_Funrural := DMOracle.BuscaNome('SELECT PERC_FUNRURAL FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(QNFE_EmiteCod_Cadastro.Value));
      Imp.WriteXY(3.4,wCont,wPerc_Funrural);
    end;
    Imp.WriteXY(4,wCont,QNFE_EmiteOBS.Value);
    Inc(wCont);
    Imp.WriteXY(4,wCont,QNFE_EmiteOBS_COMPLEMENTO.Value);
    Inc(wCont);
    Imp.WriteXY(4,wCont,QNFE_EmiteDesc_Mensagem.Value);
    Inc(wCont);
    Imp.WriteXY(4,wCont,QNFE_EmiteDesc_COMPLEMENTO.Value);
    Inc(wCont);
    Imp.WriteXY(4,wCont,QNFE_EmiteDesc_COMPLEMENTO1.Value);
    Inc(wCont);
    Imp.WriteXY(4,wCont,QNFE_EmiteDesc_COMPLEMENTO2.Value);
    Inc(wCont);
    Imp.WriteXY(4,wCont,Bib.NumToTexto(QNFE_EmiteCod_Vendedor.Value,0,8)+' - '+QNFE_EmiteNOME_VENDEDOR.Value);
    wCont := wCont + 7;
    Imp.WriteXY(4.5,wCont,QNFE_EmiteNOME.Text + ' - ' + QNFE_EmiteCOD_CADASTRO.Text);
    Imp.WriteXY(18.3,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8));
  end;
end;
// ---------------------- Impressão NF AB Comércio de Insumos Ltda ----------\\
Procedure TFNotaImpressao.NF_AB;
var wCont,wContReceber : Byte;
    wPerc_Funrural,wExtenso, wLinhaExt1, wLinhaExt2 : String;
    wVlSeguro : Real;
begin
  // *** Emissão de Nota Fiscal para o AB - Comercio de Insumos Ltda
  // *** OBS - Colocar Posicao X em Centimetros
  wCont := 0;
  wVlSeguro := 0;
  with DMNotaSaida do
  begin
    Imp.WriteXY(18.3,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
    wCont:=wCont + 2;
    if QNFE_EmiteInd_Entrada_Saida.Value = 'E' Then
      Imp.WriteXY(15.7,wCont,'XX')
    else
      Imp.WriteXY(12.8,wCont,'XX');
    Inc(wCont);
    Imp.WriteXY(4,wCont,QNFE_EmiteEND_FILIAL.Text+' - '+QNFE_EmiteBAIRRO_FILIAL.Text);
    Inc(wCont);
    Imp.WriteXY(4,wCont,Trim(QNFE_EmiteCIDADE_FILIAL.Text)+' -'+QNFE_EmiteUF_FILIAL.Text+' - '+QNFE_EmiteCEP_FILIAL.Text);
    Inc(wCont);
    Imp.WriteXY(4,wCont,'Fone/Fax:'+QNFE_EmiteTELEFONE_FILIAL.Text+'  Cx Postal:' +FloatToStr(QNFE_EmiteCXPOSTAL_FILIAL.Value));
    Inc(wCont);
    Imp.WriteXY(4,wCont,'E_Mail:' + QNFE_EmiteDESC_E_MAIL.Text);
    wCont := wCont + 2;
    Imp.WriteXY(14,wCont,QNFE_EmiteCGC_FILIAL.Value);
    wCont := wCont + 2;
    Imp.WriteXY(0.5,wCont,QNFE_EmiteCOD_OPERACAO.Text + ' - ' + QNFE_EmiteNAT_OPERACAO.Text);
    Imp.WriteXY(7.4,wCont,QNFE_Emitenum_cfop.Text);  //ALTERADO SERGIO 13/12/2002
    Imp.WriteXY(14,wCont,QNFE_EmiteINSCRICAO_FILIAL.Value);
    wCont:=wCont+3;
    Imp.WriteXY(0.5,wCont,QNFE_EmiteNOME.Text+' - '+QNFE_EmiteCOD_CADASTRO.Text);
    Imp.WriteXY(13,wCont,QNFE_EmiteNUM_CGC_CPF.Value);
    Imp.WriteXY(18,wCont,QNFE_EmiteDT_EMISSAO.Text);
    wCont := wCont + 2;
    Imp.WriteXY(0.5,wCont, QNFE_EmiteDESC_ENDERECO.Value);
    Imp.WriteXY(12.2,wCont,QNFE_EmiteDESC_BAIRRO.Value);
    Imp.WriteXY(15.2,wCont,QNFE_EmiteDESC_CEP.Value);
    Imp.WriteXY(18,wCont,QNFE_EmiteDT_RECEBIMENTO.Text);
    wCont := wCont + 2;
    Imp.WriteXY(0.5,wCont,QNFE_EmiteDESC_CIDADE.Value);
    Imp.WriteXY(8.5,wCont,QNFE_EmiteDESC_TELEFONE.Value);
    Imp.WriteXY(11.8,wCont,QNFE_EmiteCOD_ESTADO.Value);
    Imp.WriteXY(13.5,wCont,QNFE_EmiteNUM_INSCRICAO.Value);
    wCont := wCont + 4;
    If (QNFE_EmiteInd_Condicao_Pagto.Value = '2') And (QNFE_EmiteInd_Entrada_Saida.Value = 'S') Then
    begin
      wContReceber:=0;
      QContaReceber.Open;
      QContaReceber.First;
      while not QContaReceber.Eof do       // Faturamento
      begin
        if wContReceber = 0 Then
        begin
          Imp.WriteXY(0.5,wCont,Bib.NumToTexto(QContaReceberNUM_TITULO.Value,0,6));
          Imp.WriteXY(2.8,wCont,QContaReceberDT_Vencimento.Text);
          Imp.WriteXY(6,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
          wContReceber := 1;
        end
        else
          begin
            Imp.WriteXY(10.2,wCont,Bib.NumToTexto(QContaReceberNUM_TITULO.Value,0,6));
            Imp.WriteXY(12.8,wCont,QContaReceberDT_Vencimento.Text);
            Imp.WriteXY(18,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
            wContReceber := 0;
            Inc(wCont);
          end;
        QContaReceber.Next;
      end;
      QContaReceber.Close;
    end;
    wCont := 25;
    wExtenso := Bib.Extenso( wtotal_produtos
                        +wvlr_ipi
                        -QNFE_Emiteval_funrural.Value
                        +QNFE_EmiteVAL_DESPESAS.Value
                        -QNFE_EmiteVAL_Desconto.Value,'REAL');
    Bib.QuebraString(wExtenso,98,wLinhaExt1,wLinhaExt2,'*');   // 108

    Imp.WriteXY(1.8,wCont,'(R$' + Bib.NumToTexto(wtotal_produtos
                                 +wvlr_ipi
                                 -QNFE_EmiteVAL_Funrural.Value
                                 +QNFE_EmiteVAL_DESPESAS.Value
                                 -QNFE_EmiteVAL_Desconto.Value,2,15)+')');
    Imp.WriteXY(1.8,wCont,wLinhaExt1);
    Inc(wCont);
    Imp.WriteXY(1.8,wCont,wLinhaExt2+'*******');
    wCont := wCont + 3;
    // **** Itens ****
    QNFE_EmiteIt.First;
    while not QNFE_EmiteIT.Eof do
    begin
      Inc(wCont);
      Imp.WriteXY(0,wCont,Bib.NumToTexto(QNFE_EmiteITCod_Produto.Value,0,6));
      Imp.WriteXY(1.7,wCont,QNFE_EmiteITDesc_Produto.Value);
      Imp.WriteXY(9.8,wCont,QNFE_EmiteITDesc_Situacao_Trib.Value);
      Imp.WriteXY(11,wCont,QNFE_EmiteITNum_Embalagem.Text);
      Imp.WriteXY(11.6,wCont,QNFE_EmiteITDesc_Unidade.Value);
      Imp.WriteXY(13,wCont,Bib.NumToTexto(QNFE_EmiteITQT_Quantidade.Value,2,10));
      Imp.WriteXY(14.6,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Unitario.Value,3,12));
      Imp.WriteXY(16.6,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value,2,15));
      Imp.WriteXY(19.7,wCont,QNFE_EmiteITPerc_Aliquota.Text);
      If QNFE_EmiteInd_Obs_Frete_Seguro.Value = 'S' then
         wVlSeguro := wVlSeguro + QNFE_EmiteITQT_Quantidade.Value * QNFE_EmiteITVal_Preco_Frete.Value / QNFE_EmiteItNum_Embalagem.Value;
      Calc_Peso_Nota;   // calculo do peso produto
      if QNFE_EmiteItDesc_Complemento.Value <> '' Then
      begin   // ** Imprimir Complemento de Descrição
        Inc(wCont);
        Imp.WriteXY(1.7,wCont,QNFE_EmiteITDesc_Complemento.Value);
      end;
      If QNFE_EmiteItInd_Tipo_Embalagem.Value <> '' Then
         wMensCorpoNota := 'S';
      if (QNFE_EmiteItInd_Tipo_Produto.Value = 'AGRICOLA') or (QNFE_EmiteItInd_Tipo_Produto.Value = 'ARROZ')then
      begin // Preco de produtos agrícolas em Sacas
        Inc(wCont);
        Imp.WriteXY(14.3,wCont,'Preco P/ '+FloatToStr(QNFE_EmiteItNum_Embalagem.Value)+' Kg');
      end;
      if (QNFE_EmiteItDesc_Germinacao.Value <> '') Or (QNFE_EmiteItDesc_Pureza.Value <> '') or
         (QNFE_EmiteItDesc_Atestado.Value <> '') Or (QNFE_EmiteItDesc_Validade.Value <> '') Or (QNFE_EmiteItDesc_Peneira.Value <> '') Then
      begin   // ** Imprimir Informações do Lote
        Inc(wCont);
        Imp.WriteXY(0.3,wCont,'Lote:');
        Imp.WriteXY(0.3,wCont,QNFE_EmiteItDesc_Lote.Value);
        Imp.WriteXY(0.3,wCont,' Germ.:');
        Imp.WriteXY(0.3,wCont,QNFE_EmiteItDesc_Germinacao.Value);
        Imp.WriteXY(0.3,wCont,' Pureza:');
        Imp.WriteXY(0.3,wCont,QNFE_EmiteItDesc_Pureza.Value);
        Imp.WriteXY(0.3,wCont,' Atestado:');
        Imp.WriteXY(0.3,wCont,QNFE_EmiteItDesc_Atestado.Value);
        Imp.WriteXY(0.3,wCont,' Validade:');
        Imp.WriteXY(0.3,wCont,QNFE_EmiteItDesc_Validade.Value);
        Imp.WriteXY(0.3,wCont,' Peneira:');
        Imp.WriteXY(0.3,wCont,QNFE_EmiteItDesc_Peneira.Value);
      end;
      if QNFE_EmiteItInd_Imprime_NF.Value = 'S' Then
      begin   // ** Imprimir Informações do Lote
          Inc(wcont);
          Imp.WriteXY(0,wCont,' OBS:');
          Imp.WriteXY(0,wCont,QNFE_EmiteItDesc_Observacao.Value);
      end;
      if QNFE_EmiteItDesc_Observacao_Tr.Text <> '' Then
      begin   // ** Imprimir Complemento de Descrição
        Inc(wCont);
        Imp.WriteXY(1.5,wCont,QNFE_EmiteITDesc_Observacao_Tr.Value);
      end;
      QNFE_EmiteIT.Next;
    end;
    if QNFE_EmiteVal_Desconto.Value > 0 then
    begin
      Inc(wCont);
      Imp.WriteXY(15,wCont,'Desconto:   '+Bib.NumToTexto(QNFE_EmiteVal_Desconto.Value,2,13));
    end;
    // *** Final dos Itens ****
    FNotaImpressao.Imp_Desconto(wCont,1.7);
    If (wCont <= 49) And (wMensCorpoNota = 'S') Then
     Begin
      Imp.WriteXY(0,49,'Endereco para entrega de embalagens vazias(triplice lavadas): ');
      Imp.WriteXY(0,50,'Estrada para escola agricola Meu Cantinho - Linha Tres Fazendas - Santa Terezinha de Itaipu - PR');
      Imp.WriteXY(0,51,'E Obrigatorio a apresentacao desta NF ou copia no momento da entrega das embalagens vazias, acompanhada da NF de produtor');
     End;
    wCont := 55;
    Imp.WriteXY(0,wCont,Bib.NumToTexto(wbase_icm_tributada,2,13));
    Imp.WriteXY(4,wCont,Bib.NumToTexto(wvlr_icm,2,13));
    Imp.WriteXY(16,wCont,Bib.NumToTexto(wtotal_produtos,2,15));
    wCont := wCont + 2;
//    Imp.WriteXY(0,wCont,Bib.NumToTexto(QNFE_EmiteVAL_FRETE.Value,2,13));
    Imp.WriteXY(0,wCont,'0,00');
    Imp.WriteXY(8,wCont,Bib.NumToTexto(QNFE_EmiteVAL_DESPESAS.Value,2,13));
    Imp.WriteXY(12,wCont,Bib.NumToTexto(wvlr_ipi,2,13));
    Imp.WriteXY(16,wCont,Bib.NumToTexto( wtotal_produtos
                                 +wvlr_ipi
                                 +QNFE_EmiteVAL_DESPESAS.Value
                                 -QNFE_EmiteVAL_Desconto.Value
                                 -QNFE_EmiteVAL_Funrural.Value,2,15));
    wCont := wCont + 3;  // Linha 60
    if Trim(QNFE_Emitenome_transp.Value) = '' then
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_Transportadora.Value)
    else
      Imp.WriteXY(0.5,wCont,QNFE_Emitenome_transp.Value);
    if QNFE_EmiteInd_Tipo_Frete.Value = 'FOB' Then
      Imp.WriteXY(12.3,wCont,'2') // Destinatário
    else
      Imp.WriteXY(12.3,wCont,'1'); // Emitente
    Imp.WriteXY(13,wCont,QNFE_EmiteDesc_Placa.Value);
    Imp.WriteXY(16,wCont,QNFE_Emitecgc_transp.Value);
    wCont := wCont+2;
    Imp.WriteXY(0.5,wCont,QNFE_Emiteend_transp.Value);
    Imp.WriteXY(11,wCont,QNFE_Emitecidade_transp.Value);
    Imp.WriteXY(15,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(16,wCont,QNFE_Emiteinsc_transp.Value);
    wCont := wCont + 2;
    Imp.WriteXY(0.3,wCont,QNFE_EmiteNum_Volumes.Text);
    Imp.WriteXY(14.5,wCont,Bib.NumToTexto(wPeso,2,11));
    Imp.WriteXY(18,wCont,Bib.NumToTexto(wPeso,2,11));
    wCont := wCont + 3;
    if QNFE_EmiteVAL_Funrural.Value > 0 Then
    begin
      Imp.WriteXY(3,wCont,Bib.NumToTexto(QNFE_EmiteVAL_Funrural.Value,2,13));
      wPerc_Funrural := DMOracle.BuscaNome('SELECT PERC_FUNRURAL FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(QNFE_EmiteCod_Cadastro.Value));
      Imp.WriteXY(7,wCont,wPerc_Funrural);
    end;
    If wVlSeguro > 0 Then
     Begin
       Inc(wCont);
       Imp.WriteXY(0.5,wCont,'VALOR PARA EFEITO DE SEGURO:'+Bib.NumToTexto(wVlSeguro,2,13));
       Inc(wcont);
     End
    else
     wCont := wCont + 2;
    Imp.WriteXY(0.5,wCont,QNFE_EmiteOBS.Value);
    Inc(wCont);
    Imp.WriteXY(0.5,wCont,QNFE_EmiteOBS_COMPLEMENTO.Value);
    Inc(wCont);
    Imp.WriteXY(0.5,wCont,QNFE_EmiteDesc_Mensagem.Value);
    Inc(wCont);
    Imp.WriteXY(0.5,wCont,QNFE_EmiteDesc_COMPLEMENTO.Value);
    Inc(wCont);
    Imp.WriteXY(0.5,wCont,QNFE_EmiteDesc_COMPLEMENTO1.Value);
    Inc(wCont);
    Imp.WriteXY(0.5,wCont,QNFE_EmiteDesc_COMPLEMENTO2.Value);
    Inc(wCont);
    Imp.WriteXY(0.5,wCont,Bib.NumToTexto(QNFE_EmiteCod_Vendedor.Value,0,8)+' - '+QNFE_EmiteNOME_VENDEDOR.Value);
    wCont := wCont + 7;
    Imp.WriteXY(0.5,wCont,QNFE_EmiteNOME.Text + ' - ' + QNFE_EmiteCOD_CADASTRO.Text);
    Imp.WriteXY(17,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8));
  end;

end;
// ---------------------- Final impressão NF AB Comércio de Insumos Ltda ----\\
Procedure TFNotaImpressao.NFFaville;
Var wCont : Byte;
    wVolume,wPesoBruto,wPesoLiquido : Real;
    wVencimento,wNotaGlobal,wContLinha : Integer;
begin
  // *** Emissão de Nota Fiscal para a FAVILLE
  // *** OBS - Colocar Posicao X em Centimetros
  wCont := 0;
  with DMNotaSaida do
  begin
    wNotaGlobal := 0;
    QNFE_EmiteIt.First;
    wVolume := 0;
    wPesoBruto := 0;
    while wNotaGlobal < 2 do
    begin
      wCont := 0;
      if wNotaGlobal = 1 then
         Imp.WriteXY(9.5,wCont,'CONTINUACAO');
      WnotaGlobal := 2;
      If QNFE_EmiteInd_Entrada_Saida.Value = 'S' Then
        Imp.WriteXY(12.7,wCont,'XX')
      Else
        Imp.WriteXY(15.7,wCont,'XX');
      Imp.WriteXY(18.5,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
      wCont := wCont+4;
      Imp.WriteXY(0,wCont,QNFE_EmiteNAT_OPERACAO.Value);
      Imp.WriteXY(6,wCont,QNFE_Emitenum_cfop.Text);
      Imp.WriteXY(7.5,wCont,QNFE_EmiteDesc_Inscricao_Subst.Text);
      wCont := wCont+3;
      Imp.WriteXY(0,wCont,QNFE_EmiteCOD_CADASTRO.Text);
      Imp.WriteXY(1.1,wCont,QNFE_EmiteNOME.Value);
      Imp.WriteXY(13,wCont,QNFE_EmiteNUM_CGC_CPF.Value);
      Imp.WriteXY(18.5,wCont,QNFE_EmiteDT_EMISSAO.Text);
      wCont := wCont + 2;
      Imp.WriteXY(0,wCont, QNFE_EmiteDESC_ENDERECO.Value);
      Imp.WriteXY(10.5,wCont,QNFE_EmiteDESC_BAIRRO.Value);
      Imp.WriteXY(14.5,wCont,QNFE_EmiteDESC_CEP.Value);
      Imp.WriteXY(18.5,wCont,QNFE_EmiteDT_EMISSAO.Text);
      wCont := wCont+2;
      Imp.WriteXY(0,wCont,QNFE_EmiteDESC_CIDADE.Value);
      Imp.WriteXY(8,wCont,QNFE_EmiteDESC_TELEFONE.Value);
      Imp.WriteXY(12,wCont,QNFE_EmiteCOD_ESTADO.Value);
      Imp.WriteXY(13,wCont,QNFE_EmiteNUM_INSCRICAO.Value);
      wCont := wCont + 3;
      // **** Itens ****
      wContLinha := 0;
      While Not QNFE_EmiteIT.Eof do
      Begin
        Inc(wCont);
        Inc(wContLinha);
        Imp.WriteXY(0,wCont,Bib.NumToTexto(QNFE_EmiteITCod_Produto.Value,0,6));
        Imp.WriteXY(1,wCont,QNFE_EmiteITDesc_Produto.Value);
        Imp.WriteXY(8.4,wCont,QNFE_EmiteITNum_Classificacao.Value);
        Imp.WriteXY(9.2,wCont,QNFE_EmiteITDesc_Situacao_Trib.Value);
        Imp.WriteXY(10,wCont,QNFE_EmiteITDesc_Unidade.Value);
        wVolume := wVolume + QNFE_EmiteITQT_Quantidade.Value;
        Imp.WriteXY(10.8,wCont,Bib.NumToTexto(QNFE_EmiteITQT_Quantidade.Value,2,8));
        Imp.WriteXY(12.2,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Unitario.Value,2,10));
        Imp.WriteXY(14,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value,2,19));
        Imp.WriteXY(17.4,wCont,Trim(QNFE_EmiteITPerc_Aliquota.Text));
        Imp.WriteXY(18,wCont,Trim(QNFE_EmiteITPerc_IPI.Text) );
        Imp.WriteXY(18.6,wCont,Bib.NumToTexto(QNFE_EmiteITVal_IPI.Value,2,7));
        wPesoLiquido := wPesoLiquido + QNFE_EmiteITQT_Quantidade.Value * QNFE_EmiteITNum_Embalagem.Value;  //peso LIQUIDO
        wPesoBruto := wPesoBruto + QNFE_EmiteITQT_Quantidade.Value * QNFE_EmiteITNum_Volumes.Value; // PESO BRUTO
        If QNFE_EmiteItDesc_Complemento.Value <> '' Then
        Begin   // ** Imprimir Complemento de Descrição
          Inc(wCont);
          Inc(wContLinha);
          Imp.WriteXY(1,wCont,QNFE_EmiteITDesc_Complemento.Value);
        End;
        If QNFE_EmiteItInd_Tipo_Produto.Value = 'AGRICOLA' then
        Begin // Preco de produtos agrícolas em Sacas
          Inc(wCont);
          Inc(wContLinha);
          Imp.WriteXY(14.3,wCont,'Preço em '+FloatToStr(QNFE_EmiteItNum_Embalagem.Value)+' Kg');
        End;
        If QNFE_EmiteItInd_Imprime_NF.Value = 'S' Then
        Begin   // ** Imprimir Informações do Lote
          Inc(wCont);
          Imp.WriteXY(0,wCont,'Lote:');
          Imp.WriteXY(0,wCont,QNFE_EmiteItDesc_Lote.Value);
          Imp.WriteXY(0,wCont,' OBS:');
          Imp.WriteXY(0,wCont,QNFE_EmiteItDesc_Observacao.Value);
        End;
        QNFE_EmiteIT.Next;
        if wContLinha >= 21 then
        begin
          wCont := 38;
          Imp.WriteXY(17,wCont,'CONTINUA');
          wNotaGlobal := 1;
          wCont := 61;
          Imp.WriteXY(1,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
          Imp.WriteXY(9,wCont,QNFE_EmiteNOME.Value);
          Imp.SaltaPagina;
          Break;
        End;
      End;
    End;
    If QNFE_EmiteVal_Desconto.Value > 0 Then
    Begin
      Inc(wCont);
      Imp.WriteXY(12,wCont,'DESCONTO: '+Bib.NumToTexto(QNFE_EmiteVal_Desconto.Value,2,13));
    End;
    // *** Final dos Itens ****
    FNotaImpressao.Imp_Desconto(wCont,1);
    wCont := 38;
    Imp.WriteXY(0,wCont,Bib.NumToTexto(wbase_icm_tributada,2,18));
    Imp.WriteXY(4,wCont,Bib.NumToTexto(wvlr_icm,2,17));
    Imp.WriteXY(7.5,wCont,Bib.NumToTexto(wBase_Subst,2,17));
    Imp.WriteXY(12.5,wCont,Bib.NumToTexto(wIcms_Subst,2,15));
    Imp.WriteXY(17,wCont,Bib.NumToTexto(wtotal_produtos,2,20));
    wCont := wCont + 2;
    Imp.WriteXY(0,wCont,Bib.NumToTexto(QNFE_EmiteVAL_FRETE.Value,2,18));
    Imp.WriteXY(7.5,wCont,Bib.NumToTexto(QNFE_EmiteVAL_DESPESAS.Value,2,17));
    Imp.WriteXY(12.5,wCont,Bib.NumToTexto(wvlr_ipi,2,15));
    Imp.WriteXY(17,wCont,Bib.NumToTexto( wtotal_produtos
                                 +wvlr_ipi + wIcms_Subst
                                 +QNFE_EmiteVAL_DESPESAS.Value
                                 -QNFE_EmiteVAL_Desconto.Value
                                 -QNFE_EmiteVAL_Funrural.Value,2,20));
    wCont := wCont + 4;                                                       
    If Trim(QNFE_Emitenome_transp.Value) = '' then
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_Transportadora.Value)
    Else
      Imp.WriteXY(0,wCont,QNFE_Emitenome_transp.Value);
    If QNFE_EmiteInd_Tipo_Frete.Value = 'FOB' Then
      Imp.WriteXY(11.3,wCont,'2') // Destinatário
    Else
      Imp.WriteXY(11.3,wCont,'1'); // Emitente
    Imp.WriteXY(12.5,wCont,QNFE_EmiteDesc_Placa.Value);
    Imp.WriteXY(16,wCont,QNFE_Emitecgc_transp.Value);
    wCont := wCont+2;
    Imp.WriteXY(0,wCont,QNFE_Emiteend_transp.Value);
    Imp.WriteXY(9,wCont,QNFE_Emitecidade_transp.Value);
    Imp.WriteXY(15,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(16,wCont,QNFE_Emiteinsc_transp.Value);
    wCont := wCont + 2;
    Imp.WriteXY(1,wCont,FloatToStr(wVolume) );
    Imp.WriteXY(3,wCont,'CAIXA');
    Imp.WriteXY(6,wCont,'FAVILLE');
    Imp.WriteXY(14,wCont,Bib.NumToTexto(wPesoBruto,2,8));
    Imp.WriteXY(18,wCont,Bib.NumToTexto(wPesoLiquido,2,8));
    wCont := wCont + 3;
    If QNFE_EmiteInd_Condicao_Pagto.Value = '2' Then
    Begin
      QContaReceber.Open;
      QContaReceber.First;
      wVencimento := 0;
      While not QContaReceber.Eof do
      Begin
        if wVencimento = 0 then
        begin
          wVencimento := 1;
          Imp.WriteXY(0,wCont,QContaReceberDT_Vencimento.Text);
          Imp.WriteXY(2,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
        end
        else
        begin
          wVencimento := 0;
          Imp.WriteXY(4,wCont,QContaReceberDT_Vencimento.Text+' ');
          Imp.WriteXY(6,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
          inc(wcont);
        end;
//        Inc(wCont);
        QContaReceber.Next;
      End;
      QContaReceber.Close;
    End;
    If QNFE_EmiteInd_Condicao_Pagto.Value = '1' Then
       Imp.WriteXY(0,wCont,'A VISTA');
    If QNFE_EmiteInd_Condicao_Pagto.Value = '3' Then
     Begin
       Imp.WriteXY(0,wCont,'Cheque:');
       If QNFE_EmiteNr_Dias_Cheque.Value > 0 Then
          Imp.WriteXY(1,wCont,DateToStr(QNFE_EmiteDT_EMISSAO.Value + QNFE_EmiteNr_Dias_Cheque.Value));
       If QNFE_EmiteNr_Dias_Cheque1.Value > 0 Then
          Imp.WriteXY(3,wCont,DateToStr(QNFE_EmiteNr_Dias_Cheque1.Value + QNFE_EmiteDT_EMISSAO.Value));
       If QNFE_EmiteNr_Dias_Cheque2.Value > 0 Then
          Imp.WriteXY(5,wCont,DateToStr(QNFE_EmiteNr_Dias_Cheque2.Value + QNFE_EmiteDT_EMISSAO.Value));
       If QNFE_EmiteNr_Dias_Cheque3.Value > 0 Then
          Imp.WriteXY(7,wCont,DateToStr(QNFE_EmiteNr_Dias_Cheque3.Value + QNFE_EmiteDT_EMISSAO.Value));
       If QNFE_EmiteNr_Dias_Cheque4.Value > 0 Then
          Imp.WriteXY(9,wCont,DateToStr(QNFE_EmiteNr_Dias_Cheque4.Value + QNFE_EmiteDT_EMISSAO.Value));
     End;
    inc(wcont);
    Imp.WriteXY(0,wCont,Trim(QNFE_EmiteOBS.Value) );
    Inc(wCont);
    Imp.WriteXY(0,wCont,Trim(QNFE_EmiteOBS_COMPLEMENTO.Value) );
    Inc(wCont);
    Imp.WriteXY(0,wCont,QNFE_EmiteDesc_Mensagem.Value);
    Inc(wCont);
    Imp.WriteXY(0,wCont,QNFE_EmiteDesc_COMPLEMENTO.Value);
    Inc(wcont);
    Imp.WriteXY(0,wCont,QNFE_EmiteDesc_FANTASIA.Value);
    Inc(wcont);
    Imp.WriteXY(0,wCont,Bib.NumToTexto(QNFE_EmiteCod_Vendedor.Value,0,8)+' - '+QNFE_EmiteNOME_VENDEDOR.Value);
    Inc(wcont);
    If QNFE_EmiteCOD_ESTADO.Value = 'RJ' Then
       Imp.WriteXY(0,wCont,'ICMS RETIDO CONFORME TERMO DE ACORDO Nº 02/2002 SEF/RJ PROCESSO Nº E34/071635/2004');
    wCont := 60;
    Imp.WriteXY(1,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
    Imp.WriteXY(8,wCont,Bib.NumToTexto(QNFE_EmiteCOD_CADASTRO.Value,0,8));
    Imp.WriteXY(9.5,wCont,QNFE_EmiteNOME.Value);
    Imp.WriteXY(17,wCont,Bib.NumToTexto( wtotal_produtos
                                 +wvlr_ipi + wIcms_Subst
                                 +QNFE_EmiteVAL_DESPESAS.Value
                                 -QNFE_EmiteVAL_Desconto.Value
                                 -QNFE_EmiteVAL_Funrural.Value,2,20));
  End;
End;


Procedure TFNotaImpressao.NFEncopel;
Var wCont,wContServico,wNotaGlobal,wContLinha,wInd : Byte;
    wTotalISS, wTotalServico,wVal_Irrf : Real;
    wTbProduto,wTbQuant,wTbTotal : Array[1..10] of Real;
    wTbDescricao : Array[1..10] of String;
begin
  // *** Emissão de Nota Fiscal para a ENCOPEL
  // *** OBS - Colocar Posicao X em Centimetros
  // *** wNotaGlobal Controla a quebra de continuação
  For wInd := 1 To 10 Do
   Begin
     wTbProduto[wInd] := 0;
     wTbQuant[wInd] := 0;
     wTbTotal[wInd] := 0;
     wTbDescricao[wInd] := '';
   End;
  wTotalISS := 0;
  wTotalServico := 0;
  wVal_Irrf := 0;
  wCont := 0;                // INICIALIZA VALOR DA VARIAVEL - Robson 26/06/2000
  With DMNotaSaida do
  Begin
    wNotaGlobal := 0;
    while wNotaGlobal < 2 do
    begin
      wCont := 0;
      if wNotaGlobal = 1 then
         Imp.WriteXY(9.5,wCont,'CONTINUACAO');
      WnotaGlobal := 2;
      If QNFE_EmiteInd_Entrada_Saida.Value = 'S' Then
        Imp.WriteXY(11.5,wCont,'X')
      Else
        Imp.WriteXY(13.5,wCont,'X');
      Imp.WriteXY(16.5,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
      wCont := wCont+5;
      Imp.WriteXY(0,wCont,QNFE_EmiteNAT_OPERACAO.Value);
      Imp.WriteXY(5.2,wCont,QNFE_Emitenum_cfop.Text);  //ALTERADO SERGIO 13/12/2002
{      If QNFE_EmiteUF_Filial.Value <> QNFE_EmiteUF_Nota.Value then
        Imp.WriteXY(5.2,wCont,QNFE_EmiteNat_InterEstadual.Text)
      Else
        Imp.WriteXY(5.2,wCont,QNFE_EmiteNat_Estadual.Text);}
      wCont := wCont+3;
      Imp.WriteXY(0.2,wCont,QNFE_EmiteCOD_CADASTRO.Text);
      QNotaNome.Close;
      QNotaNome.SetVariable('PK',QNotaSaidaCod_Nota_Cab.Value);
      QNotaNome.Open;
      If Not QNotaNome.Eof Then
       Begin
         Imp.WriteXY(1.1,wCont,QNotaNomeNOME.Value);
         Imp.WriteXY(12,wCont,QNotaNomeDesc_CGC_CPF.Value);
       End
      else
        Begin
         Imp.WriteXY(1.1,wCont,QNFE_EmiteNOME.Value);
         Imp.WriteXY(12,wCont,QNFE_EmiteNUM_CGC_CPF.Value);
        End;
      Imp.WriteXY(16.2,wCont,QNFE_EmiteDT_EMISSAO.Text);
      wCont := wCont + 2;
      If Not QNotaNome.Eof Then
        Imp.WriteXY(0,wCont, QNotaNomeDESC_ENDERECO.Value)
      Else
        Imp.WriteXY(0,wCont, QNFE_EmiteDESC_ENDERECO.Value);
      Imp.WriteXY(9,wCont,QNFE_EmiteDESC_BAIRRO.Value);
      Imp.WriteXY(13.6,wCont,QNFE_EmiteDESC_CEP.Value);
      Imp.WriteXY(16.2,wCont,QNFE_EmiteDT_EMISSAO.Text);
      wCont := wCont+2;
      Imp.WriteXY(0,wCont,QNFE_EmiteDESC_CIDADE.Value);
      Imp.WriteXY(6.7,wCont,QNFE_EmiteDESC_TELEFONE.Value);
      Imp.WriteXY(10.3,wCont,QNFE_EmiteCOD_ESTADO.Value);
      If Not QNotaNome.Eof Then
        Imp.WriteXY(11.5,wCont,QNotaNomeDesc_INSCRICAO.Value)
      else
        Imp.WriteXY(11.5,wCont,QNFE_EmiteNUM_INSCRICAO.Value);
      // **** Itens de produtos ****
      wCont := wCont + 3;
      wContLinha := 0;
      // somente pode posicionar no inicio do arquivo a primeira vez
      If wNotaGlobal = 0 then
         QNFE_EmiteIt.First;
      While Not QNFE_EmiteIT.Eof do
      Begin
        If QNFE_EmiteItIND_TIPO_PRODUTO.Value <> 'SERVIÇO' Then
        Begin
          Inc(wCont);
          Inc(wcontLinha);
          Imp.WriteXY(0,wCont,Bib.NumToTexto(QNFE_EmiteITCod_Produto.Value,0,6));
          Imp.WriteXY(1,wCont,QNFE_EmiteITDesc_Produto.Value);
          Imp.WriteXY(9.6,wCont,QNFE_EmiteITNum_Classificacao.Value);
          Imp.WriteXY(10.5,wCont,QNFE_EmiteITDesc_Unidade.Value);
          Imp.WriteXY(11.2,wCont,Bib.NumToTexto(QNFE_EmiteITQT_Quantidade.Value,2,8));
          Imp.WriteXY(12.6,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Unitario.Value,2,11));
          Imp.WriteXY(15,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value,2,19));
          Imp.WriteXY(18,wCont,QNFE_EmiteITPerc_Aliquota.Text);
          Calc_Peso_Nota;  // calcula peso para nota
          If QNFE_EmiteItDesc_Complemento.Value <> '' Then
          Begin   // ** Imprimir Complemento de Descrição
            Inc(wCont);
            Inc(wContLinha);
            Imp.WriteXY(1,wCont,QNFE_EmiteITDesc_Complemento.Value);
          End;
        End
        Else
        Begin
          wTotalISS := wTotalISS + QNFE_EmiteItVal_ISS.Value;
          wTotalServico := wTotalServico + QNFE_EmiteItVal_Total.Value;
          If QNFE_EmiteIND_REGIME_ESPECIAL.Value = 'SIM' Then
             wVal_Irrf := wVal_Irrf + QNFE_EmiteItVal_Total.Value * 0.03;
          wInd := 1;
          While wInd <= 10 do
          Begin
            If wTbProduto[wInd] = QNFE_EmiteITCod_Produto.Value Then
             Begin
               wTbQuant[wInd] := wTbQuant[wInd] + QNFE_EmiteITQT_Quantidade.Value;
               wTbTotal[wInd] := wTbTotal[wInd] + QNFE_EmiteITVal_Total.Value;
               Break;
             End;
            Inc(wInd);
          End;
          If wInd > 10 Then
           Begin
             wInd := 1;
             While wInd <= 10 do    // este while serve para localizar a posicao da tabela que esta vazia
              Begin
               If wTbProduto[wInd] = 0 Then
                  Break;
               Inc(wInd);   
              End;
             wTbProduto[wInd] := QNFE_EmiteITCod_Produto.Value;
             wTbQuant[wInd] := QNFE_EmiteITQT_Quantidade.Value;
             wTbTotal[wInd] := QNFE_EmiteITVal_Total.Value;
             wTbDescricao[wInd] := QNFE_EmiteITDesc_Produto.Value;
           End;
        End;
        QNFE_EmiteIT.Next;
        If (wContLinha >= 15) And (Not QNFE_EmiteIT.Eof) then
        Begin
          wCont := 42;
          Imp.WriteXY(15.4,wCont,'CONTINUA');
          wNotaGlobal := 1;
          Imp.SaltaPagina;
          Break;
        End;
      End;
    End;
    // Fim do Controle de Continuação
    If QNFE_EmiteVal_Desconto.Value > 0 Then
    Begin
      Inc(wCont);
      Imp.WriteXY(0.5,wCont,'DESCONTO: '+Bib.NumToTexto(QNFE_EmiteVal_Desconto.Value,2,13));
    End;
    // Fim dos Item de Produto
    FNotaImpressao.Imp_Desconto(wCont,1);
    wCont := 33;
    wContServico := 0;
    // Item de Serviço
    wInd := 1;
    While wTbProduto[wInd] <> 0 do
    Begin
      Inc(wCont); Inc(wContServico);
      Imp.WriteXY(0,wCont,Bib.NumToTexto(wTbProduto[wInd],0,6));
      Imp.WriteXY(1,wCont,wTbDescricao[wInd]);
      Imp.WriteXY(9.3,wCont,Bib.NumToTexto(wTbQuant[wInd],2,6));
      Imp.WriteXY(10.4,wCont,Bib.NumToTexto(wTbTotal[wInd] / wTbQuant[wInd],2,13));
      Imp.WriteXY(12.7,wCont,Bib.NumToTexto(wTbTotal[wInd],2,17));
      If wContServico = 2 Then
        Imp.WriteXY(15.5,wCont,Bib.NumToTexto(wTotalISS,2,15) );
      If wContServico = 4 Then
        Imp.WriteXY(15.5,wCont,Bib.NumToTexto(wTotalServico,2,15));
      Inc(wInd);
    End;
    If (wTotalISS > 0) or (wTotalServico > 0) Then
    Begin
      If wContServico < 2 Then
      Begin
        Inc(wCont); Inc(wContServico);
        Imp.WriteXY(15.5,wCont,Bib.NumToTexto(wTotalISS,2,15));
      End;
      If wContServico < 4 Then
      Begin
        wCont := wCont + 4 - wContServico;
        Imp.WriteXY(15.5,wCont,Bib.NumToTexto(wTotalServico,2,15));
      End;
    End;
    // *** Final dos Itens ****
    wCont := 42;
    Imp.WriteXY(0,wCont,Bib.NumToTexto(wbase_icm_tributada,2,18));
    Imp.WriteXY(3.8,wCont,Bib.NumToTexto(wvlr_icm,2,17));
    Imp.WriteXY(14.4,wCont,Bib.NumToTexto(wtotal_produtos - wTotalServico,2,20));
    wCont := wCont + 2;
    Imp.WriteXY(0,wCont,Bib.NumToTexto(QNFE_EmiteVAL_FRETE.Value,2,18));
    Imp.WriteXY(7.5,wCont,Bib.NumToTexto(QNFE_EmiteVAL_DESPESAS.Value,2,17));
    Imp.WriteXY(10.2,wCont,Bib.NumToTexto(wvlr_ipi,2,15));
    Imp.WriteXY(14.4,wCont,Bib.NumToTexto( wtotal_produtos
                                 +wvlr_ipi
                                 +QNFE_EmiteVAL_DESPESAS.Value
                                 -QNFE_EmiteVAL_Desconto.Value
                                 -QNFE_EmiteVAL_Funrural.Value,2,20));
    wCont := wCont + 3;
    If Trim(QNFE_Emitenome_transp.Value) = '' then
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_Transportadora.Value)
    Else
      Imp.WriteXY(0,wCont,QNFE_Emitenome_transp.Value);
    If QNFE_EmiteInd_Tipo_Frete.Value = 'FOB' Then
      Imp.WriteXY(9.8,wCont,'2') // Destinatário
    Else
      Imp.WriteXY(9.8,wCont,'1'); // Emitente
    Imp.WriteXY(10.5,wCont,QNFE_EmiteDesc_Placa.Value);
    Imp.WriteXY(14,wCont,QNFE_Emitecgc_transp.Value);
    wCont := wCont+2;
    Imp.WriteXY(0,wCont,QNFE_Emiteend_transp.Value);
    Imp.WriteXY(7.8,wCont,QNFE_Emitecidade_transp.Value);
    Imp.WriteXY(13,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(14,wCont,QNFE_Emiteinsc_transp.Value);
    wCont := wCont + 2;
    Imp.WriteXY(1,wCont,QNFE_EmiteNUM_VOLUMES.Text);
    Imp.WriteXY(14,wCont,Bib.NumToTexto(wPeso,2,8));
    Imp.WriteXY(16.5,wCont,Bib.NumToTexto(wPeso,2,8));
    wCont := wCont + 3;
    Imp.WriteXY(0,wCont,QNFE_EmiteOBS.Value);
    Inc(wCont);
    If Trim(QNFE_EmiteOBS_COMPLEMENTO.Value) <> '' Then
    Begin
      Imp.WriteXY(0,wCont,QNFE_EmiteOBS_COMPLEMENTO.Value);
      Inc(wCont);
    End;
    If Trim( QNFE_EmiteDesc_Mensagem.Value)<>'' Then
    Begin
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_Mensagem.Value);
      Inc(wCont);
    End;
    If Trim(QNFE_EmiteDesc_COMPLEMENTO.Value) <> '' Then
    Begin
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_COMPLEMENTO.Value);
      Inc(wCont);
    End;
    If QNFE_EmiteInd_Condicao_Pagto.Value = '1' Then
    Begin
      Imp.WriteXY(0,wCont,'Pagamento a Vista');
      Inc(wCont);
    End;
    If wVal_Irrf <> 0 then
       Imp.WriteXY(0,wCont,'Retencao na Fonte 3%:'+Bib.NumToTexto(wVal_Irrf,2,8));
    If QNFE_EmiteInd_Condicao_Pagto.Value = '2' Then
    Begin
      Imp.WriteXY(0,wCont,'Vencimentos:');
      QContaReceber.Open;
      QContaReceber.First;
      While not QContaReceber.Eof do
      Begin
        Imp.WriteXY(2,wCont,QContaReceberDT_Vencimento.Text+' ');
        Imp.WriteXY(4,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
        Inc(wCont);
        QContaReceber.Next;
      End;
      QContaReceber.Close;
    End;
    Inc(wcont);
    Imp.WriteXY(0,wCont,'Doc. emitido p/emp. enquadrada no Regime Fiscal das Microempresas e das' );
    Inc(wCont);
    Imp.WriteXY(0,wCont,'empresas de pequeno porte - nao gera direito a credito de ICMS' );
    Imp.WriteXY(19,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,6) );
  End;
//  Imp.SaltaPagina;
End;

Procedure TFNotaImpressao.NFBrasil;
Var wContServico,wNotaGlobal,wContLinha : Byte;
    wTotalISS, wTotalServico : Real;
    wCont : Integer;
begin
  // *** Emissão de Nota Fiscal para a Brasil Paper
  // *** OBS - Colocar Posicao X em Centimetros
  // *** wNotaGlobal Controla a quebra de continuação
  wTotalISS := 0;
  wTotalServico := 0;
  wCont := 0;                // INICIALIZA VALOR DA VARIAVEL
  With DMNotaSaida do
  Begin
    wNotaGlobal := 0;
    while wNotaGlobal < 2 do
    begin
      wCont := 0;
      if wNotaGlobal = 1 then
         Imp.WriteXY(9.5,wCont,'CONTINUACAO');
      WnotaGlobal := 2;
      If QNFE_EmiteInd_Entrada_Saida.Value = 'S' Then
        Imp.WriteXY(11.2,wCont,'X')
      Else
        Imp.WriteXY(13.5,wCont,'X');
      Imp.WriteXY(16.5,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
      wCont := wCont+5;
      Imp.WriteXY(0,wCont,QNFE_EmiteNAT_OPERACAO.Value);
      Imp.WriteXY(5.2,wCont,QNFE_Emitenum_cfop.Text);  //ALTERADO SERGIO 13/12/2002
{      If QNFE_EmiteUF_Filial.Value <> QNFE_EmiteUF_Nota.Value then
        Imp.WriteXY(5.2,wCont,QNFE_EmiteNat_InterEstadual.Text)
      Else
        Imp.WriteXY(5.2,wCont,QNFE_EmiteNat_Estadual.Text);}
      wCont := wCont+3;
      Imp.WriteXY(0.2,wCont,QNFE_EmiteCOD_CADASTRO.Text);
      QNotaNome.Close;
      QNotaNome.SetVariable('PK',QNotaSaidaCod_Nota_Cab.Value);
      QNotaNome.Open;
      If Not QNotaNome.Eof Then
       Begin
         Imp.WriteXY(1.1,wCont,QNotaNomeNOME.Value);
         Imp.WriteXY(12,wCont,QNotaNomeDesc_CGC_CPF.Value);
       End
      else
        Begin
         Imp.WriteXY(1.1,wCont,QNFE_EmiteNOME.Value);
         Imp.WriteXY(12,wCont,QNFE_EmiteNUM_CGC_CPF.Value);
        End;
      Imp.WriteXY(16.2,wCont,QNFE_EmiteDT_EMISSAO.Text);
      wCont := wCont + 2;
      If Not QNotaNome.Eof Then
        Imp.WriteXY(0,wCont, QNotaNomeDESC_ENDERECO.Value)
      Else
        Imp.WriteXY(0,wCont, QNFE_EmiteDESC_ENDERECO.Value);
      Imp.WriteXY(9,wCont,QNFE_EmiteDESC_BAIRRO.Value);
      Imp.WriteXY(13.6,wCont,QNFE_EmiteDESC_CEP.Value);
      Imp.WriteXY(16.2,wCont,QNFE_EmiteDT_EMISSAO.Text);
      wCont := wCont+2;
      Imp.WriteXY(0,wCont,QNFE_EmiteDESC_CIDADE.Value);
      Imp.WriteXY(6.7,wCont,QNFE_EmiteDESC_TELEFONE.Value);
      Imp.WriteXY(10.3,wCont,QNFE_EmiteCOD_ESTADO.Value);
      If Not QNotaNome.Eof Then
        Imp.WriteXY(11.5,wCont,QNotaNomeDesc_INSCRICAO.Value)
      else
        Imp.WriteXY(11.5,wCont,QNFE_EmiteNUM_INSCRICAO.Value);
      // **** Itens de produtos ****
      wCont := wCont + 3;  // MUDADO ERA 3
      wContLinha := 0;
      // somente pode posicionar no inicio do arquivo a primeira vez
      If wNotaGlobal = 0 then
         QNFE_EmiteIt.First;
      While Not QNFE_EmiteIT.Eof do
      Begin
        if QNFE_EmiteItIND_TIPO_PRODUTO.Value <> 'SERVIÇO' Then
        Begin
          wCont := wCont + 1;
          Inc(wcontLinha);
          Imp.WriteXY(0,wCont,Bib.NumToTexto(QNFE_EmiteITCod_Produto.Value,0,6));
          Imp.WriteXY(1,wCont,QNFE_EmiteITDesc_Produto.Value);
          Imp.WriteXY(9.6,wCont,QNFE_EmiteITNum_Classificacao.Value);
          Imp.WriteXY(10.5,wCont,QNFE_EmiteITDesc_Unidade.Value);
          Imp.WriteXY(11,wCont,Bib.NumToTexto(QNFE_EmiteITQT_Quantidade.Value,2,8));
          Imp.WriteXY(12.6,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Unitario.Value,2,11));
          Imp.WriteXY(14.5,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value,2,19));
          Imp.WriteXY(18,wCont,QNFE_EmiteITPerc_Aliquota.Text);
          Calc_Peso_Nota;  // calcula peso para nota
          If QNFE_EmiteItDesc_Complemento.Value <> '' Then
          Begin   // ** Imprimir Complemento de Descrição
            wCont := wCont + 1;
            Inc(wContLinha);
            Imp.WriteXY(1,wCont,QNFE_EmiteITDesc_Complemento.Value);
          End;
        End
        Else
        Begin
          wTotalISS := wTotalISS + QNFE_EmiteItVal_ISS.Value;
          wTotalServico := wTotalServico + QNFE_EmiteItVal_Total.Value;
        End;
        QNFE_EmiteIT.Next;
        If wContLinha >= 15 then
        Begin
          wCont := 42;
          Imp.WriteXY(15.4,wCont,'CONTINUA');
          wNotaGlobal := 1;
          Imp.SaltaPagina;
          Break;
        End;
      End;
    End;
    // Fim do Controle de Continuação
    If QNFE_EmiteVal_Desconto.Value > 0 Then
    Begin
      wCont := wCont + 1;
      Imp.WriteXY(0.5,wCont,'DESCONTO: '+Bib.NumToTexto(QNFE_EmiteVal_Desconto.Value,2,13));
    End;
    // Fim dos Item de Produto
    FNotaImpressao.Imp_Desconto(wCont ,1);
    wCont := 33;
    wContServico := 0;
    // Item de Serviço
    QNFE_EmiteIt.First;
    While Not QNFE_EmiteIT.Eof do
    Begin
      if QNFE_EmiteItIND_TIPO_PRODUTO.Value = 'SERVIÇO' Then
      Begin
        wCont := wCont + 1;
        Inc(wContServico);
        Imp.WriteXY(0,wCont,Bib.NumToTexto(QNFE_EmiteITCod_Produto.Value,0,6));
        Imp.WriteXY(1,wCont,QNFE_EmiteITDesc_Produto.Value);
        Imp.WriteXY(9.3,wCont,Bib.NumToTexto(QNFE_EmiteITQT_Quantidade.Value,2,6));
        Imp.WriteXY(10.4,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Unitario.Value,2,13));
        Imp.WriteXY(12.7,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value,2,17));
        If wContServico = 2 Then
          Imp.WriteXY(15.5,wCont,Bib.NumToTexto(wTotalISS,2,15) );
        If wContServico = 4 Then
          Imp.WriteXY(15.5,wCont,Bib.NumToTexto(wTotalServico,2,15));
      End;
      QNFE_EmiteIt.Next;
    End;
    If wTotalISS > 0 Then
    Begin
      If wContServico < 2 Then
      Begin
        wCont := wCont + 1;
        Inc(wContServico);
        Imp.WriteXY(15.5,wCont,Bib.NumToTexto(wTotalISS,2,15));
      End;
      If wContServico < 4 Then
      Begin
        wCont := wCont + 4 - wContServico;
        Imp.WriteXY(15.5,wCont,Bib.NumToTexto(wTotalServico,2,15));
      End;

    End;
    // *** Final dos Itens ****
    wCont := 42;
    Imp.WriteXY(0,wCont,Bib.NumToTexto(wbase_icm_tributada,2,18));
    Imp.WriteXY(3.8,wCont,Bib.NumToTexto(wvlr_icm,2,17));
    Imp.WriteXY(14.4,wCont,Bib.NumToTexto(wtotal_produtos - wTotalServico,2,20));
    wCont := wCont + 2;
    Imp.WriteXY(0,wCont,Bib.NumToTexto(QNFE_EmiteVAL_FRETE.Value,2,18));
    Imp.WriteXY(7.5,wCont,Bib.NumToTexto(QNFE_EmiteVAL_DESPESAS.Value,2,17));
    Imp.WriteXY(10.2,wCont,Bib.NumToTexto(wvlr_ipi,2,15));
    Imp.WriteXY(14.4,wCont,Bib.NumToTexto( wtotal_produtos
                                 +wvlr_ipi
                                 +QNFE_EmiteVAL_DESPESAS.Value
                                 -QNFE_EmiteVAL_Desconto.Value
                                 -QNFE_EmiteVAL_Funrural.Value,2,20));
    wCont := wCont + 3;
    If Trim(QNFE_Emitenome_transp.Value) = '' then
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_Transportadora.Value)
    Else
      Imp.WriteXY(0,wCont,QNFE_Emitenome_transp.Value);
    If QNFE_EmiteInd_Tipo_Frete.Value = 'FOB' Then
      Imp.WriteXY(9.6,wCont,'2') // Destinatário
    Else
      Imp.WriteXY(9.6,wCont,'1'); // Emitente
    Imp.WriteXY(10.5,wCont,QNFE_EmiteDesc_Placa.Value);
    Imp.WriteXY(14,wCont,QNFE_Emitecgc_transp.Value);
    wCont := wCont+2;
    Imp.WriteXY(0,wCont,QNFE_Emiteend_transp.Value);
    Imp.WriteXY(7.8,wCont,QNFE_Emitecidade_transp.Value);
    Imp.WriteXY(13,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(14,wCont,QNFE_Emiteinsc_transp.Value);
    wCont := wCont + 2;
    Imp.WriteXY(1,wCont,QNFE_EmiteNUM_VOLUMES.Text);
    Imp.WriteXY(14,wCont,Bib.NumToTexto(wPeso,2,8));
    Imp.WriteXY(16.5,wCont,Bib.NumToTexto(wPeso,2,8));
    wCont := wCont + 3;          //************************VERIFICAR POSICAO ERA 3
    Imp.WriteXY(0,wCont,QNFE_EmiteOBS.Value);
    wCont := wCont + 1;
    If Trim(QNFE_EmiteOBS_COMPLEMENTO.Value) <> '' Then
    Begin
      Imp.WriteXY(0,wCont,QNFE_EmiteOBS_COMPLEMENTO.Value);
      wCont := wCont + 1;
    End;
    If Trim( QNFE_EmiteDesc_Mensagem.Value)<>'' Then
    Begin
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_Mensagem.Value);
      wCont := wCont + 1;
    End;
    If Trim(QNFE_EmiteDesc_COMPLEMENTO.Value) <> '' Then
    Begin
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_COMPLEMENTO.Value);
      wCont := wCont + 1;
    End;
    If wCont=59 Then //MUDADO
    Begin
       Imp.WriteXY(19,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,6) );
       wCont := wCont + 1;
    End;
    If QNFE_EmiteInd_Condicao_Pagto.Value = '1' Then
    Begin
      Imp.WriteXY(0,wCont,'Pagamento a Vista');
      wCont := wCont + 1;
    End;
    If QNFE_EmiteInd_Condicao_Pagto.Value = '2' Then
    Begin
      Imp.WriteXY(0,wCont,'Vencimentos:');
      wCont := wCont + 1;
      QContaReceber.Open;
      QContaReceber.First;
      While not QContaReceber.Eof do
      Begin
        Imp.WriteXY(2,wCont,QContaReceberDT_Vencimento.Text+' ');
        Imp.WriteXY(4,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
        If wCont=59 Then
          Imp.WriteXY(19,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,6) );
        wCont := wCont + 1;
        QContaReceber.Next;
      End;
      QContaReceber.Close;
    End;
    If wCont<=59 Then
    Begin
      wCont := 59;
      Imp.WriteXY(19,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,6) );
    End;
  End;
//  Imp.SaltaPagina;
End;  //FIM IMPRESSAO NF BRASIL PAPER


Procedure TFNotaImpressao.NFRadiolandia;
Var wNotaGlobal,wContLinha : Byte;
    wCont : Integer;
    wVendedor : string;
begin
  // *** Emissão de Nota Fiscal para a RADIOLANDIA
  // *** OBS - Colocar Posicao X em Centimetros
  // *** wNotaGlobal Controla a quebra de continuação
  wCont := 1;                // INICIALIZA VALOR DA VARIAVEL
  With DMNotaSaida do
  Begin
    wNotaGlobal := 0;
    while wNotaGlobal < 2 do
    begin
      if wNotaGlobal = 1 then // SE A NOTA FOR CONTINUAÇÃO ESCREVE NA NOTA
      begin
        wCont := 1;
        Imp.WriteXY(9.5,wCont,'CONTINUACAO');
      end;

      wCont := 1;
      WnotaGlobal := 2;
      imp.WriteXY(18, wCont, Bib.NumToTexto(QNFE_EmiteNUM_NOTA.value,0,8));
      //-------CAMPO SAIDA/ENTRADA----------
      wCont := 3;
      if QNFE_EmiteInd_Entrada_Saida.Value = 'S' Then
        Imp.WriteXY(12.1,wCont,'X')
      else
        Imp.WriteXY(14.6,wCont,'X');

      wCont := wCont+5; //----PULA 5 LINHAS

      Imp.WriteXY(0.3,wCont,QNFE_EmiteNAT_OPERACAO.Value);
      Imp.WriteXY(7.1,wCont,QNFE_Emitenum_cfop.Text);  //ALTERADO SERGIO 13/12/2002    

      wCont := wCont+4; //---PULA 4 LINHA

      Imp.WriteXY(0.3,wCont,QNFE_EmiteCOD_CADASTRO.Text);
      QNotaNome.Close;
      QNotaNome.SetVariable('PK',QNotaSaidaCod_Nota_Cab.Value);
      QNotaNome.Open;

      If Not QNotaNome.Eof Then
      Begin
        Imp.WriteXY(1.1,wCont,QNotaNomeNOME.Value);
        Imp.WriteXY(12.2,wCont,QNotaNomeDesc_CGC_CPF.Value);
      End
      else
      Begin
        Imp.WriteXY(1.1,wCont,QNFE_EmiteNOME.Value);
        Imp.WriteXY(12.2,wCont,QNFE_EmiteNUM_CGC_CPF.Value);
      End;
      Imp.WriteXY(17.5,wCont,QNFE_EmiteDT_EMISSAO.Text);

      wCont := wCont + 2;//---PULA DUAS LINHAS---

      If Not QNotaNome.Eof Then
        Imp.WriteXY(0.3,wCont, QNotaNomeDESC_ENDERECO.Value)
      Else
        Imp.WriteXY(0.3,wCont, QNFE_EmiteDESC_ENDERECO.Value);

      Imp.WriteXY(10,wCont,QNFE_EmiteDESC_BAIRRO.Value);
      Imp.WriteXY(14.1,wCont,QNFE_EmiteDESC_CEP.Value);
      Imp.WriteXY(17.5,wCont,QNFE_EmiteDT_EMISSAO.Text);

      wCont := wCont+2;//----PULA DUAS LINHAS

      Imp.WriteXY(0.3,wCont,QNFE_EmiteDESC_CIDADE.Value);
      Imp.WriteXY(8.0,wCont,QNFE_EmiteDESC_TELEFONE.Value);
      Imp.WriteXY(11.2,wCont,QNFE_EmiteCOD_ESTADO.Value);

      If Not QNotaNome.Eof Then
        Imp.WriteXY(12.3,wCont,QNotaNomeDesc_INSCRICAO.Value)
      else
        Imp.WriteXY(12.3,wCont,QNFE_EmiteNUM_INSCRICAO.Value);


      wCont := wCont + 3; //---PULA TRES LINHAS---
      //-------FATURA------------------------------------------------

      If QNFE_EmiteIND_CONDICAO_PAGTO.Value = '1' Then
      Begin
        Imp.WriteXY(0.3,wCont,'Pagamento a Vista');
        wCont := wCont + 1;
      End;
      If QNFE_EmiteIND_CONDICAO_PAGTO.Value = '2' Then
      Begin
        QContaReceber.Close;
        QContaReceber.Open;
        QContaReceber.First;

        //---IMPRIME TRES FATURA POR LINHA-----
        While not QContaReceber.Eof do
        Begin

          //---PRIMEIRA FATURA DA LINHA---
          Imp.WriteXY(0.3,wCont,QContaReceberNUM_TITULO.Text+'/'+QContaReceberNUM_PARCELA.Text);
          Imp.WriteXY(1.7,wCont,QContaReceberDT_VENCIMENTO.Text+' ');
          Imp.WriteXY(3.3,wCont,Bib.NumToTexto(QContaReceberVAL_TITULO.Value,2,8));
          QContaReceber.Next;

          //---SEGUNDA FATURA DA LINHA---
          if not QContaReceber.Eof then
          begin
            Imp.WriteXY(6.2,wCont,QContaReceberNUM_TITULO.Text+'/'+QContaReceberNUM_PARCELA.Text);
            Imp.WriteXY(8.1,wCont,QContaReceberDT_VENCIMENTO.Text+' ');   
            Imp.WriteXY(10,wCont,Bib.NumToTexto(QContaReceberVAL_TITULO.Value,2,8));
            QContaReceber.Next;

            //---TERCEIRA FATURA DA LINHA---
            if not QContaReceber.Eof then
            begin
              Imp.WriteXY(13,wCont,QContaReceberNUM_TITULO.Text+'/'+QContaReceberNUM_PARCELA.Text); 
              Imp.WriteXY(14.6,wCont,QContaReceberDT_VENCIMENTO.Text+' ');
              Imp.WriteXY(16.6,wCont,Bib.NumToTexto(QContaReceberVAL_TITULO.Value,2,8));
              QContaReceber.Next;
            end;
          end;
          wCont := wCont + 1;//----PULA UMA LINHA
        End;
        QContaReceber.Close;
      End;
      //-------FIM FATURA------------------------------------------------

      // **** Itens de produtos ****
      wCont := 26;       //---POSICIONA NA LINHA 27 - Estava 26, mudei para 31 porque não estava imprimindo mais de 31 parcelas. Vanessa 04/03/2015
      wContLinha := 0;   //CONTROLA A QUANTIA DE ITENS POR NOTA (MAXIMO 8 ITENS POR NOTA)

      If wNotaGlobal = 0 then //somente pode posicionar no inicio do arquivo na primeira nota
         QNFE_EmiteIt.First;
      //PARAMOS AQUI ###################################################################
      While Not QNFE_EmiteIT.Eof do
      Begin
          wCont := wCont + 1;
          Inc(wcontLinha);
          Imp.WriteXY(0.3,wCont,Bib.NumToTexto(QNFE_EmiteITCod_Produto.Value,0,6));
          Imp.WriteXY(2.6,wCont,copy(QNFE_EmiteITDesc_Produto.Value+QNFE_EmiteITDesc_Lote.Value, 1, 56));
          Imp.WriteXY(10.9,wCont,QNFE_EmiteItDESC_SITUACAO_TRIB.Value);
          //Imp.WriteXY(10.9,wCont,QNFE_EmiteITNum_Classificacao.Value);
          Imp.WriteXY(11.9,wCont,QNFE_EmiteITDesc_Unidade.Value);
          Imp.WriteXY(12.9,wCont,Bib.NumToTexto(QNFE_EmiteITQT_Quantidade.Value,2,8));
          Imp.WriteXY(14,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Unitario.Value,2,11));
          Imp.WriteXY(15.7,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value,2,19));
          Imp.WriteXY(19,wCont,QNFE_EmiteITPerc_Aliquota.Text); 
          Calc_Peso_Nota;  // calcula peso para nota
          If QNFE_EmiteItDesc_Complemento.Text <> '' Then
          Begin   // ** Imprimir Complemento de Descrição
            wCont := wCont + 1; 
            Inc(wContLinha);
            Imp.WriteXY(1.8,wCont,QNFE_EmiteITDesc_Complemento.Value);
          End;
        QNFE_EmiteIT.Next;

        If (wContLinha >= 8) and (not QNFE_EmiteIT.eof) then
        Begin
          wCont := 43; //A MESMA POSICAO DO [VALOR TOTAL DOS PRODUTOS]
          Imp.WriteXY(16,wCont,'CONTINUA');
          wNotaGlobal := 1;
          Imp.SaltaPagina;
          Break;
        End;
      End;
    End;// Fim do Controle de Continuação

    //-------DESCONTO--------------------
    If QNFE_EmiteVal_Desconto.Value > 0 Then
    Begin
      wCont := wCont + 1;
      Imp.WriteXY(13,wCont,'DESCONTO: ');
      Imp.WriteXY(14.5,wCont,Bib.NumToTexto(QNFE_EmiteVAL_DESCONTO.Value,2,19)); 
    End;
    //------DESPESAS---------------------
    If QNFE_EmiteVAL_DESPESAS.Value > 0 Then
    Begin
      wCont := wCont + 1;
      Imp.WriteXY(13,wCont,'ACRESC. : '); 
      Imp.WriteXY(14.5,wCont,Bib.NumToTexto(QNFE_EmiteVAL_DESPESAS.Value,2,19));
    End;
    //------ENTRADA---------------------
    If QNFE_EmiteVAL_AVISTA.Value > 0 Then
    Begin
      wCont := wCont + 1;
      Imp.WriteXY(13,wCont,'ENTRADA : ');  
      Imp.WriteXY(14,wCont,Bib.NumToTexto(QNFE_EmiteVAL_AVISTA.Value,2,19));
    End;

    // Fim dos Item de Produto
    FNotaImpressao.Imp_Desconto(wCont,1);
    wCont := 43;
    Imp.WriteXY(0.3,wCont,Bib.NumToTexto(wbase_icm_tributada,2,18));
    Imp.WriteXY(4,wCont,Bib.NumToTexto(wvlr_icm,2,17));
    Imp.WriteXY(16,wCont,Bib.NumToTexto(wtotal_produtos,2,20));
    wCont := wCont + 2;
    Imp.WriteXY(0.3,wCont,Bib.NumToTexto(QNFE_EmiteVAL_FRETE.Value,2,18));
    Imp.WriteXY(7.9,wCont,'0,00');
    Imp.WriteXY(12,wCont,Bib.NumToTexto(wvlr_ipi,2,15));
    Imp.WriteXY(16,wCont,Bib.NumToTexto( wtotal_produtos
                                 +wvlr_ipi
                                 +QNFE_EmiteVAL_DESPESAS.Value
                                 -QNFE_EmiteVAL_Desconto.Value,2,20));
    wCont := wCont + 3;
    If Trim(QNFE_Emitenome_transp.Value) = '' then
      Imp.WriteXY(0.3,wCont,QNFE_EmiteDesc_Transportadora.Value)
    Else
      Imp.WriteXY(0.3,wCont,QNFE_Emitenome_transp.Value);
    If QNFE_EmiteInd_Tipo_Frete.Value = 'FOB' Then
      Imp.WriteXY(10.5,wCont,'2') // Destinatário
    Else
      Imp.WriteXY(10.5,wCont,'1'); // Emitente
    Imp.WriteXY(11.5,wCont,QNFE_EmiteDESC_PLACA.Value);
    Imp.WriteXY(15.5,wCont,QNFE_Emitecgc_transp.Value);
    wCont := wCont+2;
    Imp.WriteXY(0.3,wCont,QNFE_Emiteend_transp.Value);
    Imp.WriteXY(8,wCont,QNFE_Emitecidade_transp.Value);
    Imp.WriteXY(14.3,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(15.5,wCont,QNFE_Emiteinsc_transp.Value);
    wCont := wCont + 2;
    Imp.WriteXY(1,wCont,QNFE_EmiteNUM_VOLUMES.Text);
    Imp.WriteXY(12,wCont,Bib.NumToTexto(wPeso,2,8)); 
    Imp.WriteXY(16,wCont,Bib.NumToTexto(wPeso,2,8));
    wCont := wCont + 4;          //************************VERIFICAR POSICAO ERA 3
{//--FABIANO COMENTOU--
    if QNFE_EmiteCod_Filial.value  = 1 Then
    begin
      Imp.WriteXY(0,wCont,'Doc. emitido por empresa enquadrada no regime Fiscal');
      wCont := wCont + 1;
      Imp.WriteXY(0,wCont,'das Microempresas e das Empresas de Pequeno porte nao');
      wCont := wCont + 1;
      Imp.WriteXY(0,wCont,'gera direito a credito de ICMS.(Art. 416 do RICMS/PR)');
      wCont := wCont + 1;
    end;
}
    Imp.WriteXY(0.3,wCont,QNFE_EmiteOBS.Value);
    wCont := wCont + 1;
    If Trim(QNFE_EmiteOBS_COMPLEMENTO.Value) <> '' Then
    Begin
      Imp.WriteXY(0.3,wCont,QNFE_EmiteOBS_COMPLEMENTO.Value);
      wCont := wCont + 1;
    End;
    If Trim( QNFE_EmiteDesc_Mensagem.Value)<>'' Then
    Begin
      Imp.WriteXY(0.3,wCont,QNFE_EmiteDesc_Mensagem.Value);
      wCont := wCont + 1;
    End;
    If Trim(QNFE_Emitedesc_complemento.Value) <> '' Then
    Begin
      Imp.WriteXY(0.3,wCont,QNFE_Emitedesc_complemento.Value);
      wCont := wCont + 1;
    End;
    If Trim(QNFE_EmiteCOD_VENDEDOR.Text) <> '' Then
    Begin
      wVendedor := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+ QNFE_EmiteCOD_VENDEDOR.Text);
      Imp.WriteXY(0.3,wCont,wVendedor);  
    End;

    //---IMPRIME O CODIGO DA NOTA NO CANHOTO-----
    If wCont<=67 Then
    Begin
      wCont := 67;
      Imp.WriteXY(16.5,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,6) );
    End;
  End;
End;  //FIM IMPRESSAO NF RADIOLANDIA

Procedure TFNotaImpressao.NF_NIR;
var wCont,wContServico,wNotaGlobal,wContLinha : Byte;
    wTotalISS, wTotalServico : Real;
begin
  // *** Emissão de Nota Fiscal para a NIR Informatica
  // *** OBS - Colocar Posicao X em Centimetros
  // *** wNotaGlobal Controla a quebra de continuação
  wTotalISS := 0;
  wTotalServico := 0;
  with DMNotaSaida do
  begin
    wNotaGlobal := 0;
    wCont       := 0;  // INICIALIZA VALOR DA VARIAVEL - Robson 26/06/2000
    while wNotaGlobal < 2 do
    begin
      wCont := 0;
      if wNotaGlobal = 1 then
        Imp.WriteXY(9.5,wCont,'CONTINUACAO');
      WnotaGlobal := 2;
      if QNFE_EmiteInd_Entrada_Saida.Value = 'S' Then
        Imp.WriteXY(11.5,wCont,'X')
      else
        Imp.WriteXY(14.0,wCont,'X');
      Imp.WriteXY(16.2,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
      wCont := wCont+5;
      Imp.WriteXY(0.2,wCont,QNFE_EmiteNAT_OPERACAO.Value);
      Imp.WriteXY(5.2,wCont,QNFE_Emitenum_cfop.Text);  //ALTERADO SERGIO 13/12/2002
{      if QNFE_EmiteUF_Filial.Value <> QNFE_EmiteUF_Nota.Value then
        Imp.WriteXY(5.2,wCont,QNFE_EmiteNat_InterEstadual.Text)
      else
        Imp.WriteXY(5.2,wCont,QNFE_EmiteNat_Estadual.Text);}
      wCont := wCont+3;
      Imp.WriteXY(0.2,wCont,QNFE_EmiteCOD_CADASTRO.Text);
      Imp.WriteXY(1.1,wCont,QNFE_EmiteNOME.Value);
      Imp.WriteXY(12,wCont,QNFE_EmiteNUM_CGC_CPF.Value);
      Imp.WriteXY(16.2,wCont,QNFE_EmiteDT_EMISSAO.Text);
      wCont := wCont + 2;
      Imp.WriteXY(0.2,wCont, QNFE_EmiteDESC_ENDERECO.Value);
      Imp.WriteXY(9,wCont,QNFE_EmiteDESC_BAIRRO.Value);
      Imp.WriteXY(13.7,wCont,QNFE_EmiteDESC_CEP.Value);
      Imp.WriteXY(16.2,wCont,QNFE_EmiteDT_EMISSAO.Text);
      wCont := wCont+2;
      Imp.WriteXY(0.2,wCont,QNFE_EmiteDESC_CIDADE.Value);
      Imp.WriteXY(7.2,wCont,QNFE_EmiteDESC_TELEFONE.Value);
      Imp.WriteXY(10.6,wCont,QNFE_EmiteCOD_ESTADO.Value);
      Imp.WriteXY(11.7,wCont,QNFE_EmiteNUM_INSCRICAO.Value);
      // **** Itens de produtos ****
      wCont := wCont + 3;
      wContLinha := 0;
      // somente pode posicionar no inicio do arquivo a primeira vez
      if wNotaGlobal = 0 then
         QNFE_EmiteIt.First;
      while not QNFE_EmiteIT.Eof do
      begin
      if QNFE_EmiteItIND_TIPO_PRODUTO.Value <> 'SERVIÇO' Then   // nota fiscal de serviços
        begin
          Inc(wCont);
          Inc(wContLinha);
          Imp.WriteXY(0,wCont,Bib.NumToTexto(QNFE_EmiteITCod_Produto.Value,0,6));
          Imp.WriteXY(1,wCont,QNFE_EmiteITDesc_Produto.Value);
          Imp.WriteXY(10.1,wCont,QNFE_EmiteITNum_Classificacao.Value);
          Imp.WriteXY(10.6,wCont,QNFE_EmiteITDesc_Unidade.Value);
          Imp.WriteXY(10.8,wCont,Bib.NumToTexto(QNFE_EmiteITQT_Quantidade.Value,2,8));
          Imp.WriteXY(12.2,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Unitario.Value,2,11));
          Imp.WriteXY(13.5,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value,2,19));
          Imp.WriteXY(18.1,wCont,QNFE_EmiteITPerc_Aliquota.Text);
          if QNFE_EmiteItDesc_Complemento.Value <> '' Then
          begin   // ** Imprimir Complemento de Descrição
            Inc(wCont);
            Inc(wContLinha);
            Imp.WriteXY(1,wCont,QNFE_EmiteITDesc_Complemento.Value);
          end;
          if QNFE_EmiteItInd_Tipo_Produto.Value = 'AGRICOLA' then
          begin // Preco de produtos agrícolas em Sacas
            Inc(wCont);
            Inc(wcontLinha);
            Imp.WriteXY(14.3,wCont,'Preço em '+FloatToStr(QNFE_EmiteItNum_Embalagem.Value)+' Kg');
          end;
        end
        else
        begin
          wTotalISS := wTotalISS + QNFE_EmiteItVal_ISS.Value;
          wTotalServico := wTotalServico + QNFE_EmiteItVal_Total.Value;
        end;
        QNFE_EmiteIT.Next;
        if wContLinha >= 15 then
        begin
          wCont := 42;
          Imp.WriteXY(15.4,wCont,'CONTINUA');
          wNotaGlobal := 1;
          Imp.SaltaPagina;
          Break;
        end;
      end;
    end;
    // Fim do Controle de Continuação
    if QNFE_EmiteVal_Desconto.Value > 0 Then
    begin
      Inc(wCont);
      Imp.WriteXY(0.5,wCont,'DESCONTO: '+Bib.NumToTexto(QNFE_EmiteVal_Desconto.Value,2,13));
    end;
    // Fim dos Item de Produto
    FNotaImpressao.Imp_Desconto(wCont,1);
    wCont := 33;
    wContServico := 0;
    // Item de Prestacao de Serviço
    QNFE_EmiteIt.First;
    while not QNFE_EmiteIT.Eof do
    begin                                                // O comentario abaixo era usado antes
      if QNFE_EmiteItIND_TIPO_PRODUTO.Value = 'SERVIÇO' Then   // QNFE_EmiteItPERC_ISS.Value > 0
      begin
        Inc(wCont); Inc(wContServico);
        Imp.WriteXY(0.2,wCont,Bib.NumToTexto(QNFE_EmiteITCod_Produto.Value,0,6));
        Imp.WriteXY(1.2,wCont,QNFE_EmiteITDesc_Produto.Value);
        Imp.WriteXY(9.3,wCont,Bib.NumToTexto(QNFE_EmiteITQT_Quantidade.Value,2,6));
        Imp.WriteXY(10.4,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Unitario.Value,2,13));
        Imp.WriteXY(12.7,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value,2,17));
        if wContServico = 2 Then
          Imp.WriteXY(15.5,wCont,Bib.NumToTexto(wTotalISS,2,15) );
        if wContServico = 4 Then
          Imp.WriteXY(15.5,wCont,Bib.NumToTexto(wTotalServico,2,15));
      end;
      QNFE_EmiteIt.Next;
    end;
    if wTotalISS > 0 Then
      if wContServico < 2 Then
      begin
        Inc(wCont); Inc(wContServico);
        Imp.WriteXY(15.5,wCont,Bib.NumToTexto(wTotalISS,2,15));
      end;
    If wTotalServico > 0 Then
      if wContServico < 4 Then
      begin
        wCont := wCont + 4 - wContServico;
        Imp.WriteXY(15.5,wCont,Bib.NumToTexto(wTotalServico,2,15));
      end;
    // *** Final dos Itens ****
    wCont := 42;
    Imp.WriteXY(0.2,wCont,Bib.NumToTexto(wbase_icm_tributada,2,18));
    Imp.WriteXY(3.8,wCont,Bib.NumToTexto(wvlr_icm,2,17));
    Imp.WriteXY(14.4,wCont,Bib.NumToTexto(wtotal_produtos - wTotalServico,2,20));
    wCont := wCont + 2;
    Imp.WriteXY(0.2,wCont,Bib.NumToTexto(QNFE_EmiteVAL_FRETE.Value,2,18));
    Imp.WriteXY(7.5,wCont,Bib.NumToTexto(QNFE_EmiteVAL_DESPESAS.Value,2,17));
    Imp.WriteXY(10.2,wCont,Bib.NumToTexto(wvlr_ipi,2,15));
    Imp.WriteXY(14.4,wCont,Bib.NumToTexto( wtotal_produtos
                                 +wvlr_ipi
                                 +QNFE_EmiteVAL_DESPESAS.Value
                                 -QNFE_EmiteVAL_Desconto.Value
                                 -QNFE_EmiteVAL_Funrural.Value,2,20));
    wCont := wCont + 3;
    if Trim(QNFE_Emitenome_transp.Value) = '' then
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_Transportadora.Value)
    else
      Imp.WriteXY(0.2,wCont,QNFE_Emitenome_transp.Value);
    if QNFE_EmiteInd_Tipo_Frete.Value = 'FOB' Then
      Imp.WriteXY(9.6,wCont,'2') // Destinatário
    else
      Imp.WriteXY(9.6,wCont,'1'); // Emitente
    Imp.WriteXY(10.5,wCont,QNFE_EmiteDesc_Placa.Value);
    Imp.WriteXY(14,wCont,QNFE_Emitecgc_transp.Value);
    wCont := wCont+2;
    Imp.WriteXY(0.2,wCont,QNFE_Emiteend_transp.Value);
    Imp.WriteXY(7.8,wCont,QNFE_Emitecidade_transp.Value);
    Imp.WriteXY(13,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(14,wCont,QNFE_Emiteinsc_transp.Value);
    wCont := wCont + 2;
    Imp.WriteXY(1,wCont,QNFE_EmiteNUM_VOLUMES.Text);
    wCont := wCont + 3;
    Imp.WriteXY(0.2,wCont,QNFE_EmiteOBS.Value);
    Inc(wCont);
    if Trim(QNFE_EmiteOBS_COMPLEMENTO.Value) <> '' Then
    begin
      Imp.WriteXY(0.2,wCont,QNFE_EmiteOBS_COMPLEMENTO.Value);
      Inc(wCont);
    end;
   if Trim( QNFE_EmiteDesc_Mensagem.Value)<>'' Then
    begin
      Imp.WriteXY(0.2,wCont,QNFE_EmiteDesc_Mensagem.Value);
      Inc(wCont);
    end;
    if Trim(QNFE_EmiteDesc_COMPLEMENTO.Value) <> '' Then
    begin
      Imp.WriteXY(0.2,wCont,QNFE_EmiteDesc_COMPLEMENTO.Value);
      Inc(wCont);
    end;
    if QNFE_EmiteInd_Condicao_Pagto.Value = '1' Then
    begin
      Imp.WriteXY(0.2,wCont,'Pagamento a Vista');
      Inc(wCont);
    end;
    if QNFE_EmiteInd_Condicao_Pagto.Value = '2' Then
    begin
      Imp.WriteXY(0.2,wCont,'Vencimentos:');
      QContaReceber.Open;
      QContaReceber.First;
      while not QContaReceber.Eof do
      begin
        Imp.WriteXY(2,wCont,QContaReceberDT_Vencimento.Text+' ');
        Imp.WriteXY(4,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
        if wCont=58 Then
          Imp.WriteXY(19,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,6) );
        Inc(wCont);
        QContaReceber.Next;
      end;
      QContaReceber.Close;
    end;
    if wCont<=58 Then
      wCont := 59;
    Imp.WriteXY(19,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,6) );
  end;
//  Imp.SaltaPagina;
end;

Procedure TFNotaImpressao.NF_CGS;
Var wCont,wVencimento,wJaExtenso,wNotaGlobal,wContLinha : Byte;
    wExtenso, wLinhaExt1, wLinhaExt2 : String;
    wNumero_Continua,wVol : Real;
begin
  // *** Emissão de Nota Fiscal para a CGS
  // *** OBS - Colocar Posicao X em Centimetros
  With DMNotaSaida do
  Begin
    wNotaGlobal := 0;
    wVol := 0;
    while wNotaGlobal < 2 do
    begin
      wCont := 5;
      if wNotaGlobal = 1 then
      begin
         wCont := 7;
         wNumero_Continua := QNFE_EmiteNUM_NOTA.Value - 1;
         Imp.WriteXY(9.5,wCont,'CONTINUACAO NOTA '+Bib.NumToTexto(wNumero_Continua,0,8));
      end;
      WnotaGlobal := 2;
      If QNFE_EmiteInd_Entrada_Saida.Value = 'S' Then
        Imp.WriteXY(12.8,wCont,'XX')
      Else
        Imp.WriteXY(15,wCont,'XX');
      wCont := wCont+8;
      Imp.WriteXY(1.2,wCont,QNFE_EmiteNAT_OPERACAO.Value);
      Imp.WriteXY(6.8,wCont,QNFE_Emitenum_cfop.Text);  //ALTERADO SERGIO 13/12/2002
{      If QNFE_EmiteUF_Filial.Value <> QNFE_EmiteUF_Nota.Value then
        Imp.WriteXY(6.8,wCont,QNFE_EmiteNat_InterEstadual.Text)
      Else
        Imp.WriteXY(6.8,wCont,QNFE_EmiteNat_Estadual.Text);}
      wCont := wCont+4;
      Imp.WriteXY(1.2,wCont,QNFE_EmiteCOD_CADASTRO.Text);
      Imp.WriteXY(2.1,wCont,QNFE_EmiteNOME.Value);
      Imp.WriteXY(13.5,wCont,QNFE_EmiteNUM_CGC_CPF.Value);
      Imp.WriteXY(18.2,wCont,QNFE_EmiteDT_EMISSAO.Text);
      wCont := wCont + 2;
      Imp.WriteXY(1.2,wCont, QNFE_EmiteDESC_ENDERECO.Value);
      Imp.WriteXY(10.4,wCont,QNFE_EmiteDESC_BAIRRO.Value);
      Imp.WriteXY(14.5,wCont,QNFE_EmiteDESC_CEP.Value);
      Imp.WriteXY(18.2,wCont,QNFE_EmiteDT_RECEBIMENTO.Text);
      wCont := wCont + 3;
      Imp.WriteXY(1,wCont,QNFE_EmiteDESC_CIDADE.Value);
      Imp.WriteXY(8.5,wCont,QNFE_EmiteDESC_TELEFONE.Value);
      Imp.WriteXY(12,wCont,QNFE_EmiteCOD_ESTADO.Value);
      Imp.WriteXY(13.5,wCont,QNFE_EmiteNUM_INSCRICAO.Value);
      wCont := wCont + 3;
      wExtenso := Bib.Extenso( wtotal_produtos
                          +wvlr_ipi - QNFE_EmiteVal_Desconto.Value,'REAL');
      Bib.QuebraString(wExtenso,40,wLinhaExt1,wLinhaExt2,'*');
      If QNFE_EmiteInd_Condicao_Pagto.Value = '2' Then
      Begin
        QContaReceber.Open;
        QContaReceber.First;
        wVencimento := 0;
        wJaExtenso := 0;
        While not QContaReceber.Eof do
        Begin
          if wVencimento = 0 then
          begin
            wVencimento := 1;
            Imp.WriteXY(0.7,wCont,Bib.NumToTexto(QContaReceberNum_Titulo.Value,0,6)+'/'+Bib.NumToTexto(QContaReceberNum_Parcela.Value,0,3));
            Imp.WriteXY(2.6,wCont,QContaReceberDT_Vencimento.Text);
            Imp.WriteXY(5.3,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
          end
          else
          begin
            wVencimento := 0;
            Imp.WriteXY(6.7,wCont,Bib.NumToTexto(QContaReceberNum_Titulo.Value,0,6)+'/'+Bib.NumToTexto(QContaReceberNum_Parcela.Value,0,3));
            Imp.WriteXY(8.8,wCont,QContaReceberDT_Vencimento.Text);
            Imp.WriteXY(11,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
            if wJaExtenso = 1 then // aqui é a impressão da segunda linha
            begin                  // controla a impressão da primeira linha primeiro
               Imp.WriteXY(14,wCont,wLinhaExt2);
               wJaExtenso := 2;
            end;
            if wJaExtenso  =  0 then  // pode acontecer de mais de uma linha de parcelas
            begin
               Imp.WriteXY(14,wCont,wLinhaExt1);
               wJaExtenso := 1;
            end;
            inc(wcont);
          end;
          QContaReceber.Next;
        End;
        QContaReceber.Close;
        if wJaExtenso = 0 then
        begin
           Imp.WriteXY(14,wCont,wLinhaExt1);
           inc(wcont);
           Imp.WriteXY(14,wCont,wLinhaExt2);
        end;
        if wJaExtenso = 1 then
           Imp.WriteXY(14,wCont,wLinhaExt2);
      end
      else
      begin
        Imp.WriteXY(14,wCont,wLinhaExt1);
        inc(wcont);
        Imp.WriteXY(14,wCont,wLinhaExt2);
      end;
      wCont := 33;
      // **** Itens ****
      wContLinha := 0;
      // somente pode posicionar no inicio do arquivo a primeira vez
      if wNotaGlobal = 0 then
         QNFE_EmiteIt.First;
      While Not QNFE_EmiteIT.Eof do
      Begin
        Imp.WriteXY(1,wCont,Bib.NumToTexto(QNFE_EmiteITCod_Produto.Value,0,6));
        Imp.WriteXY(2.5,wCont,(TRIM(QNFE_EmiteITDesc_Produto.Value) + ' - ' + TRIM(QNFE_EmiteItDesc_Lote.Value)));
        Imp.WriteXY(9.2,wCont,(TRIM(QNFE_EmiteITDesc_Class_Fiscal.Value)));
        Imp.WriteXY(10.1,wCont,QNFE_EmiteITNum_Classificacao.Value);
        Imp.WriteXY(10.8,wCont,QNFE_EmiteITDesc_Unidade.Value);
        Imp.WriteXY(11.4,wCont,Bib.NumToTexto(QNFE_EmiteITQT_Quantidade.Value,2,7));
        Imp.WriteXY(12.8,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Unitario.Value,2,11));
        Imp.WriteXY(14.5,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value,2,11));
        Imp.WriteXY(17.5,wCont,Trim(QNFE_EmiteITPerc_Aliquota.Text));
        Imp.WriteXY(18.2,wCont,Trim(QNFE_EmiteITPerc_IPI.Text) );
        Imp.WriteXY(19,wCont,Bib.NumToTexto(QNFE_EmiteITVal_IPI.Value,2,7));
        If QNFE_EmiteItDesc_Complemento.Value <> '' Then
        Begin   // ** Imprimir Complemento de Descrição
          Inc(wCont);
          Inc(wContLinha);
          Imp.WriteXY(2.5,wCont,QNFE_EmiteITDesc_Complemento.Value);
        End;
        If QNFE_EmiteITNum_Volumes.Text <> '' Then
           wVol := wVol + QNFE_EmiteITNum_Volumes.Value * QNFE_EmiteITQT_Quantidade.Value;
        QNFE_EmiteIT.Next;
        Inc(wCont);
        Inc(wContLinha);
        if wContLinha >= 27 then
        begin
          wCont := 62;
          wNumero_Continua := QNFE_EmiteNUM_NOTA.Value + 1;
          Imp.WriteXY(17,wCont,'CONTINUA NUMERO'+Bib.NumToTexto(wNumero_Continua,0,8));
          wNotaGlobal := 1;
          Imp.SaltaPagina;
          Break;
        End;
      End;
      If QNFE_EmiteVal_Desconto.Value > 0 Then
      Begin
        Imp.WriteXY(12.7,wCont,'DESCONTO: '+Bib.NumToTexto(QNFE_EmiteVal_Desconto.Value,2,13));
      End;
    end;
    // *** Final dos Itens ****
    FNotaImpressao.Imp_Desconto(wCont,2.5);
    wCont := 62;
    Imp.WriteXY(1.5,wCont,Bib.NumToTexto(wbase_icm_tributada,2,18));
    Imp.WriteXY(5.5,wCont,Bib.NumToTexto(wvlr_icm,2,17));
    Imp.WriteXY(17,wCont,Bib.NumToTexto(wtotal_produtos,2,20));
    wCont := wCont + 3;
    Imp.WriteXY(1,wCont,Bib.NumToTexto(QNFE_EmiteVAL_FRETE.Value,2,18));
    Imp.WriteXY(9.5,wCont,Bib.NumToTexto(QNFE_EmiteVAL_DESPESAS.Value,2,17));
    Imp.WriteXY(13.5,wCont,Bib.NumToTexto(wvlr_ipi,2,15));
    Imp.WriteXY(17,wCont,Bib.NumToTexto( wtotal_produtos
                                 +wvlr_ipi
                                 +QNFE_EmiteVAL_DESPESAS.Value
                                 -QNFE_EmiteVAL_Desconto.Value
                                 -QNFE_EmiteVAL_Funrural.Value,2,20));
    wCont := wCont + 3;
    If Trim(QNFE_Emitenome_transp.Value) = '' then
      Imp.WriteXY(1.2,wCont,QNFE_EmiteDesc_Transportadora.Value)
    Else
      Imp.WriteXY(1.2,wCont,QNFE_Emitenome_transp.Value);
    If QNFE_EmiteInd_Tipo_Frete.Value = 'FOB' Then
      Imp.WriteXY(12.3,wCont,'2') // Destinatário
    Else
      Imp.WriteXY(12.3,wCont,'1'); // Emitente
    Imp.WriteXY(13,wCont,QNFE_EmiteDesc_Placa.Value);
    Imp.WriteXY(16.5,wCont,QNFE_Emitecgc_transp.Value);
    wCont := wCont + 3;
    Imp.WriteXY(1.2,wCont,QNFE_Emiteend_transp.Value);
    Imp.WriteXY(10.5,wCont,QNFE_Emitecidade_transp.Value);
    Imp.WriteXY(14.8,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(16.5,wCont,QNFE_Emiteinsc_transp.Value);
    wCont := wCont + 2;
    Imp.WriteXY(2,wCont,Bib.NumToTexto(wVol,0,8));
    Imp.WriteXY(3.5,wCont,'CAIXA');
    Imp.WriteXY(8,wCont,'CGS');
    wCont := wCont + 3;
    Imp.WriteXY(1.2,wCont,QNFE_EmiteOBS.Value);
    Inc(wCont);
    Imp.WriteXY(1.2,wCont,QNFE_EmiteOBS_COMPLEMENTO.Value);
    Inc(wCont);
    Imp.WriteXY(1.2,wCont,QNFE_EmiteDesc_Mensagem.Value);
    Inc(wCont);
    Imp.WriteXY(1.2,wCont,QNFE_EmiteDesc_COMPLEMENTO.Value);
    Inc(wCont);
    Imp.WriteXY(0.5,wCont,QNFE_EmiteDesc_COMPLEMENTO1.Value);
    Inc(wCont);
    Imp.WriteXY(0.5,wCont,QNFE_EmiteDesc_COMPLEMENTO2.Value);
    Inc(wcont);
    Imp.WriteXY(1.2,wCont,Bib.NumToTexto(QNFE_EmiteCod_Vendedor.Value,0,8)+' - '+QNFE_EmiteNOME_VENDEDOR.Value);
    QrAchaNrPedido.Close;
    QrAchaNrPedido.SetVariable('PK',QNFE_EmiteCOD_NOTA_CAB.Value);
    QrAchaNrPedido.Open;
    Inc(wcont);
    Imp.WriteXY(1.2,wCont,'Referente Pedido Nr.:');
    Imp.WriteXY(5,wCont,Bib.NumToTexto(QrAchaNrPedidoNum_Pedido.Value,0,6));
  end;
End;

// Impressao nota fiscal Filial 02 CGC - Grassi
Procedure TFNotaImpressao.NF_CGS_2;
var wCont,wVencimento,wJaExtenso,wNotaGlobal,wContLinha : Byte;
    wExtenso, wLinhaExt1, wLinhaExt2 : String;
    wNumero_Continua,wVol : Real;
begin
  // *** Emissão de Nota Fiscal para a CGS filial 02
  // *** OBS - Colocar Posicao X em Centimetros
  with DMNotaSaida do
  begin
    wNotaGlobal := 0;
    wVol := 0;
    while wNotaGlobal < 2 do
    begin
      wCont := 5;
      if wNotaGlobal = 1 then
      begin
         wCont := 7;
         wNumero_Continua := QNFE_EmiteNUM_NOTA.Value - 1;
         Imp.WriteXY(9.5,wCont,'CONTINUACAO NOTA '+Bib.NumToTexto(wNumero_Continua,0,8));
      end;
      WnotaGlobal := 2;
      If QNFE_EmiteInd_Entrada_Saida.Value = 'S' Then
        Imp.WriteXY(12.8,wCont,'XX')
      Else
        Imp.WriteXY(15,wCont,'XX');
      wCont := wCont+8;
      Imp.WriteXY(1.2,wCont,QNFE_EmiteNAT_OPERACAO.Value);
      Imp.WriteXY(6.8,wCont,QNFE_Emitenum_cfop.Text);  //ALTERADO SERGIO 13/12/2002
{      If QNFE_EmiteUF_Filial.Value <> QNFE_EmiteUF_Nota.Value then
        Imp.WriteXY(6.8,wCont,QNFE_EmiteNat_InterEstadual.Text)
      Else
        Imp.WriteXY(6.8,wCont,QNFE_EmiteNat_Estadual.Text);}
      wCont := wCont+4;
      Imp.WriteXY(1.2,wCont,QNFE_EmiteCOD_CADASTRO.Text);
      Imp.WriteXY(2.1,wCont,QNFE_EmiteNOME.Value);
      Imp.WriteXY(13.5,wCont,QNFE_EmiteNUM_CGC_CPF.Value);
      Imp.WriteXY(18.2,wCont,QNFE_EmiteDT_EMISSAO.Text);
      wCont := wCont + 2;
      Imp.WriteXY(1.2,wCont, QNFE_EmiteDESC_ENDERECO.Value);
      Imp.WriteXY(10.4,wCont,QNFE_EmiteDESC_BAIRRO.Value);
      Imp.WriteXY(14.5,wCont,QNFE_EmiteDESC_CEP.Value);
      Imp.WriteXY(18.2,wCont,QNFE_EmiteDT_RECEBIMENTO.Text);
      wCont := wCont + 3;
      Imp.WriteXY(1,wCont,QNFE_EmiteDESC_CIDADE.Value);
      Imp.WriteXY(8.5,wCont,QNFE_EmiteDESC_TELEFONE.Value);
      Imp.WriteXY(12,wCont,QNFE_EmiteCOD_ESTADO.Value);
      Imp.WriteXY(13.5,wCont,QNFE_EmiteNUM_INSCRICAO.Value);
      wCont := wCont + 3;
      wExtenso := Bib.Extenso( wtotal_produtos
                          +wvlr_ipi - QNFE_EmiteVal_Desconto.Value,'REAL');
      Bib.QuebraString(wExtenso,40,wLinhaExt1,wLinhaExt2,'*');
      If QNFE_EmiteInd_Condicao_Pagto.Value = '2' Then
      Begin
        QContaReceber.Open;
        QContaReceber.First;
        wVencimento := 0;
        wJaExtenso := 0;
        While not QContaReceber.Eof do
        Begin
          if wVencimento = 0 then
          begin
            wVencimento := 1;
            Imp.WriteXY(0.7,wCont,Bib.NumToTexto(QContaReceberNum_Titulo.Value,0,6)+'/'+Bib.NumToTexto(QContaReceberNum_Parcela.Value,0,3));
            Imp.WriteXY(2.6,wCont,QContaReceberDT_Vencimento.Text);
            Imp.WriteXY(5.3,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
          end
          else
          begin
            wVencimento := 0;
            Imp.WriteXY(6.7,wCont,Bib.NumToTexto(QContaReceberNum_Titulo.Value,0,6)+'/'+Bib.NumToTexto(QContaReceberNum_Parcela.Value,0,3));
            Imp.WriteXY(8.8,wCont,QContaReceberDT_Vencimento.Text);
            Imp.WriteXY(11,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
            if wJaExtenso = 1 then // aqui é a impressão da segunda linha
            begin                  // controla a impressão da primeira linha primeiro
               Imp.WriteXY(14,wCont,wLinhaExt2);
               wJaExtenso := 2;
            end;
            if wJaExtenso  =  0 then  // pode acontecer de mais de uma linha de parcelas
            begin
               Imp.WriteXY(14,wCont,wLinhaExt1);
               wJaExtenso := 1;
            end;
            inc(wcont);
          end;
          QContaReceber.Next;
        End;
        QContaReceber.Close;
        if wJaExtenso = 0 then
        begin
           Imp.WriteXY(14,wCont,wLinhaExt1);
           inc(wcont);
           Imp.WriteXY(14,wCont,wLinhaExt2);
        end;
        if wJaExtenso = 1 then
           Imp.WriteXY(14,wCont,wLinhaExt2);
      end
      else
      begin
        Imp.WriteXY(14,wCont,wLinhaExt1);
        inc(wcont);
        Imp.WriteXY(14,wCont,wLinhaExt2);
      end;
      wCont := 33;
      // **** Itens ****
      wContLinha := 0;
      // somente pode posicionar no inicio do arquivo a primeira vez
      if wNotaGlobal = 0 then
         QNFE_EmiteIt.First;
      While Not QNFE_EmiteIT.Eof do
      Begin
        Imp.WriteXY(1,wCont,Bib.NumToTexto(QNFE_EmiteITCod_Produto.Value,0,6));
        Imp.WriteXY(2.5,wCont,(TRIM(QNFE_EmiteITDesc_Produto.Value) + ' - ' + TRIM(QNFE_EmiteItDesc_Lote.Value)));
        Imp.WriteXY(9.2,wCont,(TRIM(QNFE_EmiteITDesc_Class_Fiscal.Value)));
        Imp.WriteXY(10.1,wCont,QNFE_EmiteITNum_Classificacao.Value);
        Imp.WriteXY(10.8,wCont,QNFE_EmiteITDesc_Unidade.Value);
        Imp.WriteXY(11.4,wCont,Bib.NumToTexto(QNFE_EmiteITQT_Quantidade.Value,2,7));
        Imp.WriteXY(12.8,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Unitario.Value,2,11));
        Imp.WriteXY(14.5,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value,2,11));
        Imp.WriteXY(17.5,wCont,Trim(QNFE_EmiteITPerc_Aliquota.Text));
        Imp.WriteXY(18.2,wCont,Trim(QNFE_EmiteITPerc_IPI.Text) );
        Imp.WriteXY(19,wCont,Bib.NumToTexto(QNFE_EmiteITVal_IPI.Value,2,7));
        If QNFE_EmiteItDesc_Complemento.Value <> '' Then
        Begin   // ** Imprimir Complemento de Descrição
          Inc(wCont);
          Inc(wContLinha);
          Imp.WriteXY(2.5,wCont,QNFE_EmiteITDesc_Complemento.Value);
        End;
        If QNFE_EmiteITNum_Volumes.Text <> '' Then
           wVol := wVol + QNFE_EmiteITNum_Volumes.Value * QNFE_EmiteITQT_Quantidade.Value;
        QNFE_EmiteIT.Next;
        Inc(wCont);
        Inc(wContLinha);
        if wContLinha >= 27 then
        begin
          wCont := 62;
          wNumero_Continua := QNFE_EmiteNUM_NOTA.Value + 1;
          Imp.WriteXY(17,wCont,'CONTINUA NUMERO'+Bib.NumToTexto(wNumero_Continua,0,8));
          wNotaGlobal := 1;
          Imp.SaltaPagina;
          Break;
        End;
      End;
      If QNFE_EmiteVal_Desconto.Value > 0 Then
      Begin
        Imp.WriteXY(12.7,wCont,'DESCONTO: '+Bib.NumToTexto(QNFE_EmiteVal_Desconto.Value,2,13));
      End;
    end;
    // *** Final dos Itens ****
    FNotaImpressao.Imp_Desconto(wCont,2.5);
    wCont := 63;      //62 - Robson Editou aqui
    Imp.WriteXY(1.5,wCont,Bib.NumToTexto(wbase_icm_tributada,2,18));
    Imp.WriteXY(5.5,wCont,Bib.NumToTexto(wvlr_icm,2,17));
    Imp.WriteXY(17,wCont,Bib.NumToTexto(wtotal_produtos,2,20));
    wCont := wCont + 2;   //3 - Robson Editou aqui
    Imp.WriteXY(1,wCont,Bib.NumToTexto(QNFE_EmiteVAL_FRETE.Value,2,18));
    Imp.WriteXY(9.5,wCont,Bib.NumToTexto(QNFE_EmiteVAL_DESPESAS.Value,2,17));
    Imp.WriteXY(13.5,wCont,Bib.NumToTexto(wvlr_ipi,2,15));
    Imp.WriteXY(17,wCont,Bib.NumToTexto( wtotal_produtos
                                 +wvlr_ipi
                                 +QNFE_EmiteVAL_DESPESAS.Value
                                 -QNFE_EmiteVAL_Desconto.Value
                                 -QNFE_EmiteVAL_Funrural.Value,2,20));
    wCont := wCont + 4; //3-Robson editou aqui
    If Trim(QNFE_Emitenome_transp.Value) = '' then
      Imp.WriteXY(1.2,wCont,QNFE_EmiteDesc_Transportadora.Value)
    Else
      Imp.WriteXY(1.2,wCont,QNFE_Emitenome_transp.Value);
    If QNFE_EmiteInd_Tipo_Frete.Value = 'FOB' Then
      Imp.WriteXY(12.3,wCont,'2') // Destinatário
    Else
      Imp.WriteXY(12.3,wCont,'1'); // Emitente
    Imp.WriteXY(13,wCont,QNFE_EmiteDesc_Placa.Value);
    Imp.WriteXY(16.5,wCont,QNFE_Emitecgc_transp.Value);
    wCont := wCont + 3;
    Imp.WriteXY(1.2,wCont,QNFE_Emiteend_transp.Value);
    Imp.WriteXY(10.5,wCont,QNFE_Emitecidade_transp.Value);
    Imp.WriteXY(14.8,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(16.5,wCont,QNFE_Emiteinsc_transp.Value);
    wCont := wCont + 2;
    Imp.WriteXY(2,wCont,Bib.NumToTexto(wVol,0,8));
    Imp.WriteXY(3.5,wCont,'CAIXA');
    Imp.WriteXY(8,wCont,'GRASSI');
    wCont := wCont + 3;
    Imp.WriteXY(1.2,wCont,QNFE_EmiteOBS.Value);
    Inc(wCont);
    Imp.WriteXY(1.2,wCont,QNFE_EmiteOBS_COMPLEMENTO.Value);
    Inc(wCont);
    Imp.WriteXY(1.2,wCont,QNFE_EmiteDesc_Mensagem.Value);
    Inc(wCont);
    Imp.WriteXY(1.2,wCont,QNFE_EmiteDesc_COMPLEMENTO.Value);
    Inc(wCont);
    Imp.WriteXY(0.5,wCont,QNFE_EmiteDesc_COMPLEMENTO1.Value);
    Inc(wCont);
    Imp.WriteXY(0.5,wCont,QNFE_EmiteDesc_COMPLEMENTO2.Value);
    Inc(wcont);
    Imp.WriteXY(1.2,wCont,Bib.NumToTexto(QNFE_EmiteCod_Vendedor.Value,0,8)+' - '+QNFE_EmiteNOME_VENDEDOR.Value);
    QrAchaNrPedido.Close;
    QrAchaNrPedido.SetVariable('PK',QNFE_EmiteCOD_NOTA_CAB.Value);
    QrAchaNrPedido.Open;
    Inc(wcont);
    Imp.WriteXY(1.2,wCont,'Referente Pedido Nr.:');
    Imp.WriteXY(5,wCont,Bib.NumToTexto(QrAchaNrPedidoNum_Pedido.Value,0,6));
  End;
End;   // Fim do procedimento de impressao CGS Filial 02.

Procedure TFNotaImpressao.NF_CEREAIS;
Var wCont : Byte;
begin
  // *** Emissão de Nota Fiscal para o Moinho Iguaçu
  // *** OBS - Colocar Posicao X em Centimetros
  wCont := 0;
  With DMNotaSaida do
  Begin
//    Imp.WriteXY(18.3,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );

    Imp.WriteXY(18.3,Wcont,QNFE_EmiteNUM_NOTA.Text);
    WCont :=Wcont + 2;
    //Inc(wCont);
    If QNFE_EmiteInd_Entrada_Saida.Value = 'E' Then
      Imp.WriteXY(15,wCont,'XX')
    Else
      Imp.WriteXY(12.7,wCont,'XX');

    wCont := wCont + 6;
    Imp.WriteXY(0,wCont,QNFE_EmiteNAT_OPERACAO.Value);
    Imp.WriteXY(6.5,wCont,QNFE_Emitenum_cfop.Text);  //ALTERADO SERGIO 13/12/2002
{    If QNFE_EmiteUF_Filial.Value <> QNFE_EmiteUF_Nota.Value then
      Imp.WriteXY(6.5,wCont,QNFE_EmiteNat_InterEstadual.Text)
    Else
      Imp.WriteXY(6.5,wCont,QNFE_EmiteNat_Estadual.Text);}
    wCont := wCont + 4;
    Imp.WriteXY(0,wCont,QNFE_EmiteCOD_CADASTRO.Text);
    Imp.WriteXY(1.1,wCont,QNFE_EmiteNOME.Value);
    Imp.WriteXY(13,wCont,QNFE_EmiteNUM_CGC_CPF.Value);
    Imp.WriteXY(18,wCont,QNFE_EmiteDT_EMISSAO.Text);
    wCont := wCont + 3;
    Imp.WriteXY(0,wCont, QNFE_EmiteDESC_ENDERECO.Value);
    Imp.WriteXY(12.1,wCont,QNFE_EmiteDESC_BAIRRO.Value);
    Imp.WriteXY(15.2,wCont,QNFE_EmiteDESC_CEP.Value);
    Imp.WriteXY(18,wCont,QNFE_EmiteDT_EMISSAO.Text);
    wCont := wCont+3;
    Imp.WriteXY(0,wCont,QNFE_EmiteDESC_CIDADE.Value);
    Imp.WriteXY(8.5,wCont,QNFE_EmiteDESC_TELEFONE.Value);
    Imp.WriteXY(11.6,wCont,QNFE_EmiteCOD_ESTADO.Value);
    Imp.WriteXY(13.5,wCont,QNFE_EmiteNUM_INSCRICAO.Value);
    wCont := wCont + 4;
    If QNFE_EmiteInd_Condicao_Pagto.Value = '2' Then
    Begin
      QContaReceber.Open;
      QContaReceber.First;
      While not QContaReceber.Eof Do
      Begin
        Imp.WriteXY(10.2,wCont,Bib.NumToTexto(QContaReceberNUM_TITULO.Value,0,6));
        Imp.WriteXY(12.5,wCont,QContaReceberDT_Vencimento.Text);
        Imp.WriteXY(16,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
        QContaReceber.Next;
        Inc(wCont);
      End;
      QContaReceber.Close;
    End;
    wCont := 27;
    QNFE_EmiteIt.First;
    While Not QNFE_EmiteIT.Eof do
    Begin
      Inc(wCont);
      Imp.WriteXY(0,wCont,Bib.NumToTexto(QNFE_EmiteITCod_Produto.Value,0,6));
      Imp.WriteXY(2,wCont,QNFE_EmiteITDesc_Produto.Value);
      Imp.WriteXY(10.3,wCont,QNFE_EmiteITDesc_Situacao_Trib.Value);
      Imp.WriteXY(11,wCont,QNFE_EmiteITDesc_Unidade.Value);
      Imp.WriteXY(12,wCont,Bib.NumToTexto(QNFE_EmiteITQT_Quantidade.Value,2,10));
      Imp.WriteXY(14.3,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Unitario.Value,3,12));
      Imp.WriteXY(16.5,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value,2,15));
      Imp.WriteXY(19.6,wCont,QNFE_EmiteITPerc_Aliquota.Text);
      Calc_Peso_Nota;  //rotina calculo peso nota
      If QNFE_EmiteItDesc_Complemento.Value <> '' Then
      Begin   // ** Imprimir Complemento de Descrição
        Inc(wCont);
        Imp.WriteXY(2,wCont,QNFE_EmiteITDesc_Complemento.Value);
      End;
      If (QNFE_EmiteItInd_Tipo_Produto.Value = 'AGRICOLA') or (QNFE_EmiteItInd_Tipo_Produto.Value = 'ARROZ')then
      Begin // Preco de produtos agrícolas em Sacas
        Inc(wCont);
        Imp.WriteXY(14.3,wCont,'Preco em '+FloatToStr(QNFE_EmiteItNum_Embalagem.Value)+' Kg');
      End;
      If QNFE_EmiteItInd_Imprime_NF.Value = 'S' Then
      Begin   // ** Imprimir Informações do Lote
        Inc(wCont);
        Imp.WriteXY(0,wCont,'Lote:');
        Imp.WriteXY(0,wCont,QNFE_EmiteItDesc_Lote.Value);
        Imp.WriteXY(0,wCont,' Germ.:');
        Imp.WriteXY(0,wCont,QNFE_EmiteItDesc_Germinacao.Value);
        Imp.WriteXY(0,wCont,' Pureza:');
        Imp.WriteXY(0,wCont,QNFE_EmiteItDesc_Pureza.Value);
        Imp.WriteXY(0,wCont,' Atestado:');
        Imp.WriteXY(0,wCont,QNFE_EmiteItDesc_Atestado.Value);
        Imp.WriteXY(0,wCont,' Validade:');
        Imp.WriteXY(0,wCont,QNFE_EmiteItDesc_Validade.Value);
        Imp.WriteXY(0,wCont,' Peneira:');
        Imp.WriteXY(0,wCont,QNFE_EmiteItDesc_Peneira.Value);
      End;
      QNFE_EmiteIT.Next;
    End;
    If QNFE_EmiteVal_Desconto.Value > 0 Then
    Begin
      Inc(wCont);
      Imp.WriteXY(15,wCont,'Desconto:   '+Bib.NumToTexto(QNFE_EmiteVal_Desconto.Value,2,13));
    End;
    // *** Final dos Itens ****
    FNotaImpressao.Imp_Desconto(wCont,2);
    wCont := 50;
    Imp.WriteXY(0,wCont,Bib.NumToTexto(wbase_icm_tributada,2,13));
    Imp.WriteXY(4,wCont,Bib.NumToTexto(wvlr_icm,2,13));
    Imp.WriteXY(17,wCont,Bib.NumToTexto(wtotal_produtos,2,15));
    wCont := wCont + 2;
    Imp.WriteXY(0,wCont,Bib.NumToTexto(QNFE_EmiteVAL_FRETE.Value,2,13));
    Imp.WriteXY(8,wCont,Bib.NumToTexto(QNFE_EmiteVAL_DESPESAS.Value,2,13));
    Imp.WriteXY(12,wCont,Bib.NumToTexto(wvlr_ipi,2,13));
    Imp.WriteXY(17,wCont,Bib.NumToTexto( wtotal_produtos
                                 +wvlr_ipi
                                 +QNFE_EmiteVAL_DESPESAS.Value
                                 -QNFE_EmiteVAL_Desconto.Value
                                 -QNFE_EmiteVAL_Funrural.Value,2,15));
    wCont := wCont + 4;
    If Trim(QNFE_Emitenome_transp.Value) = '' then
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_Transportadora.Value)
    Else
      Imp.WriteXY(0,wCont,QNFE_Emitenome_transp.Value);
    If QNFE_EmiteInd_Tipo_Frete.Value = 'FOB' Then
      Imp.WriteXY(11.2,wCont,'2') // Destinatário
    Else
      Imp.WriteXY(11.2,wCont,'1'); // Emitente
    Imp.WriteXY(13,wCont,QNFE_EmiteDesc_Placa.Value);
    Imp.WriteXY(16,wCont,QNFE_Emitecgc_transp.Value);
    wCont := wCont+2;
    Imp.WriteXY(0,wCont,QNFE_Emiteend_transp.Value);
    Imp.WriteXY(11.3,wCont,QNFE_Emitecidade_transp.Value);
    Imp.WriteXY(14.8,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(16,wCont,QNFE_Emiteinsc_transp.Value);
    wCont := wCont + 3;
    Imp.WriteXY(0.3,wCont,QNFE_EmiteNum_Volumes.Text);
    Imp.WriteXY(15,wCont,Bib.NumToTexto(wPeso,2,8));
    Imp.WriteXY(18,wCont,Bib.NumToTexto(wPeso,2,8));
    wCont := wCont + 4;
    Imp.WriteXY(5,wCont,Bib.NumToTexto(QNFE_EmiteVAL_Funrural.Value,2,13));
    wCont := wCont + 2;
    Imp.WriteXY(0,wCont,QNFE_EmiteOBS.Value);
    Inc(wCont);
    Imp.WriteXY(0,wCont,QNFE_EmiteOBS_COMPLEMENTO.Value);
    Inc(wCont);
    Imp.WriteXY(0,wCont,QNFE_EmiteDesc_Mensagem.Value);
    Inc(wCont);
    Imp.WriteXY(0,wCont,QNFE_EmiteDesc_COMPLEMENTO.Value);
    Inc(wCont);
    Imp.WriteXY(0.5,wCont,QNFE_EmiteDesc_COMPLEMENTO1.Value);
    Inc(wCont);
    Imp.WriteXY(0.5,wCont,QNFE_EmiteDesc_COMPLEMENTO2.Value);
  End;
End;

Procedure TFNotaImpressao.NF_GONZATTI;    // Nota Fiscal - G. GONZATTI
var wCont, wContReceber : Byte;
    wPerc_Funrural : String;
begin
  // *** OBS - Colocar Posicao X em Centimetros
  wCont := 0;
  with DMNotaSaida do
  begin
    Imp.WriteXY(16.5,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,6) );
    wCont:=wCont + 2; //ALTERADO POR PMC 03/12/2003
    Imp.WriteXY(2.5,wCont,'NOVA RAZAO SOCIAL: BRASPERON COMERCIO DE CEREAIS LTDA');
    Inc(wCont); //fim alteração

    if QNFE_EmiteInd_Entrada_Saida.Value = 'E' Then
      Imp.WriteXY(13.4,wCont,'XX')
    else
      Imp.WriteXY(11.4,wCont,'XX');
    Imp.WriteXY(18.5,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,6) );
    wCont := wCont + 5;
    Imp.WriteXY(0,wCont,QNFE_EmiteCOD_OPERACAO.Text + ' - ' + QNFE_EmiteNAT_OPERACAO.Text);
    Imp.WriteXY(6,wCont,QNFE_Emitenum_cfop.Text);  //ALTERADO SERGIO 13/12/2002
{    if QNFE_EmiteUF_Filial.Value <> QNFE_EmiteUF_Nota.Value then
       Imp.WriteXY(6.5,wCont,QNFE_EmiteNat_InterEstadual.Text)
    else
       Imp.WriteXY(6.5,wCont,QNFE_EmiteNat_Estadual.Text);}
    wCont:=wCont+3;
    Imp.WriteXY(0,wCont,QNFE_EmiteNOME.Text+' - '+QNFE_EmiteCOD_CADASTRO.Text);
    Imp.WriteXY(11.8,wCont,QNFE_EmiteNUM_CGC_CPF.Value);
    Imp.WriteXY(16,wCont,QNFE_EmiteDT_EMISSAO.Text);
    wCont := wCont + 2;
    Imp.WriteXY(0,wCont, QNFE_EmiteDESC_ENDERECO.Value);
    Imp.WriteXY(9.5,wCont,QNFE_EmiteDESC_BAIRRO.Value);
    Imp.WriteXY(13,wCont,QNFE_EmiteDESC_CEP.Value);
    Imp.WriteXY(16,wCont,QNFE_EmiteDT_RECEBIMENTO.Text);
    wCont := wCont + 2;
    Imp.WriteXY(0,wCont,QNFE_EmiteDESC_CIDADE.Value);
    Imp.WriteXY(7.3,wCont,QNFE_EmiteDESC_TELEFONE.Value);
    Imp.WriteXY(10.8,wCont,QNFE_EmiteCOD_ESTADO.Value);
    Imp.WriteXY(12,wCont,QNFE_EmiteNUM_INSCRICAO.Value);
    Imp.WriteXY(16,wCont,TimeToStr(Time));
    wCont := wCont + 3;
    if QNFE_EmiteInd_Condicao_Pagto.Value = '2' Then
     begin
      wContReceber:=0;
      QContaReceber.Open;
      QContaReceber.First;
      while not QContaReceber.Eof do       // Faturamento
      begin
        if wContReceber = 0 Then
        begin
          Imp.WriteXY(0.3,wCont,Bib.NumToTexto(QContaReceberNUM_TITULO.Value,0,6));
          Imp.WriteXY(2.8,wCont,QContaReceberDT_Vencimento.Text);
          Imp.WriteXY(6,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
          wContReceber := 1;
        end
        else
          begin
            Imp.WriteXY(9.8,wCont,Bib.NumToTexto(QContaReceberNUM_TITULO.Value,0,6));
            Imp.WriteXY(12.6,wCont,QContaReceberDT_Vencimento.Text);
            Imp.WriteXY(16,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
            wContReceber := 0;
            Inc(wCont);
          end;
        QContaReceber.Next;
      end;
      QContaReceber.Close;
     end
    else
      Imp.WriteXY(0.3,wCont,'A VISTA');
    wCont := 22;
    // **** Itens ****
    QNFE_EmiteIt.First;
    while not QNFE_EmiteIT.Eof do
    begin
      Inc(wCont);
      Imp.WriteXY(0,wCont,Bib.NumToTexto(QNFE_EmiteITCod_Produto.Value,0,6));
      If QNFE_EmiteITInd_Tipo_Consumo.Value <> 'QUEBRA' Then
         Imp.WriteXY(1.5,wCont,QNFE_EmiteITDesc_Produto.Value)
      Else
         Imp.WriteXY(1.5,wCont,'Quebra Tecnica');
      Imp.WriteXY(9.2,wCont,QNFE_EmiteITDesc_Situacao_Trib.Value);
      Imp.WriteXY(9.6,wCont,QNFE_EmiteITDesc_Unidade.Value);
      Imp.WriteXY(10.4,wCont,Bib.NumToTexto(QNFE_EmiteITQT_Quantidade.Value,2,10));
      Imp.WriteXY(12.5,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Unitario.Value,3,12));
      Imp.WriteXY(15,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value,2,15));
      Imp.WriteXY(17.7,wCont,QNFE_EmiteITPerc_Aliquota.Text);
      Calc_Peso_Nota;  //rotina calcula peso produtos
      if QNFE_EmiteItDesc_Complemento.Value <> '' Then
      begin   // ** Imprimir Complemento de Descrição
        Inc(wCont);
        Imp.WriteXY(0.6,wCont,QNFE_EmiteITDesc_Complemento.Value);
      end;
      If QNFE_EmiteItInd_Tipo_Embalagem.Value <> '' Then
         wMensCorpoNota := 'S';
      If (QNFE_EmiteItInd_Tipo_Produto.Value = 'AGRICOLA') or (QNFE_EmiteItInd_Tipo_Produto.Value = 'ARROZ')then
       begin // Preco de produtos agrícolas em Sacas
         Inc(wCont);
         Imp.WriteXY(11.5,wCont,'Preco P/ '+FloatToStr(QNFE_EmiteItNum_Embalagem.Value)+' Kg');
       end;
      If (QNFE_EmiteItDesc_Germinacao.Value <> '') Or (QNFE_EmiteItDesc_Pureza.Value <> '') or
         (QNFE_EmiteItDesc_Atestado.Value <> '') Or (QNFE_EmiteItDesc_Validade.Value <> '') Or (QNFE_EmiteItDesc_Peneira.Value <> '') Then
      begin   // ** Imprimir Informações do Lote
        Inc(wCont);
        Imp.WriteXY(0,wCont,'Lote:');
        Imp.WriteXY(0.3,wCont,QNFE_EmiteItDesc_Lote.Value);
        Imp.WriteXY(0.3,wCont,' Germ.:');
        Imp.WriteXY(0.3,wCont,QNFE_EmiteItDesc_Germinacao.Value);
        Imp.WriteXY(0.3,wCont,' Pureza:');
        Imp.WriteXY(0.3,wCont,QNFE_EmiteItDesc_Pureza.Value);
        Imp.WriteXY(0.3,wCont,' Atestado:');
        Imp.WriteXY(0.3,wCont,QNFE_EmiteItDesc_Atestado.Value);
        Imp.WriteXY(0.3,wCont,' Validade:');
        Imp.WriteXY(0.3,wCont,QNFE_EmiteItDesc_Validade.Value);
        Imp.WriteXY(0.3,wCont,' Peneira:');
        Imp.WriteXY(0.3,wCont,QNFE_EmiteItDesc_Peneira.Value);
      end;
      If QNFE_EmiteItInd_Imprime_NF.Value = 'S' Then
      begin   // ** Imprimir Informações do Lote
        Imp.WriteXY(0,wCont,' OBS:');
        Imp.WriteXY(0,wCont,QNFE_EmiteItDesc_Observacao.Value);
      end;
      If QNFE_EmiteItDesc_Observacao_Tr.Text <> '' Then
      begin   // ** Imprimir Complemento de Descrição
        Inc(wCont);
        Imp.WriteXY(0.6,wCont,QNFE_EmiteITDesc_Observacao_Tr.Value);
      end;
      QNFE_EmiteIT.Next;
    end;
    If (QNFE_EmiteVal_Desconto.Value > 0) Then
      If (QNFE_EmiteCOD_OPERACAO.Value <> 3) And (QNFE_EmiteCOD_OPERACAO.Value <> 29)Then
       begin
        Inc(wCont);
        Imp.WriteXY(9.5,wCont,'Desconto:   -');
        Imp.WriteXY(15,wCont,Bib.NumToTexto(QNFE_EmiteVal_Desconto.Value,2,15));
       end
      Else
       begin
        Inc(wCont);
        Imp.WriteXY(5.5,wCont,'Valor Atribuido Nota Fiscal em Observacao:   -');
        Imp.WriteXY(15,wCont,Bib.NumToTexto(QNFE_EmiteVal_Desconto.Value,2,15));
       end;
    // *** Final dos Itens ****
    FNotaImpressao.Imp_Desconto(wCont,2);
    // ** Nova Razão Social - Adicionado por PMC 03/12/2003
    if wCont <= 37 then
    begin
      Inc(wCont);
      Inc(wCont);
      Imp.WriteXY(1.5,wCont,'NOVA RAZAO SOCIAL: BRASPERON COMERCIO DE CEREAIS LTDA');
      Inc(wCont);
      if trim(QNFE_EmiteCOD_FILIAL.Text) = '1' then
      begin
        Imp.WriteXY(1.5,wCont,'                    RUA PROTASIO ALVES, 940.');
        Inc(wCont);
      end;
    end;
    // ** Final Nova Razão Social
    If (wCont <= 37) And (wMensCorpoNota = 'S') Then
     Begin
      Imp.WriteXY(0,37,'Endereco para entrega de embalagens vazias(triplice lavadas): Estrada para escola agricola Meu Cantinho');
      Imp.WriteXY(0,38,'Linha Tres Fazendas - Santa Terezinha de Itaipu - PR');
      Imp.WriteXY(0,39,'E Obrigatorio a apresentacao desta NF ou copia no momento da entrega das embalagens vazias, acompanhada da NF de produtor');
     End;
    wCont := 42;
    Imp.WriteXY(0.5,wCont,Bib.NumToTexto(wbase_icm_tributada,2,13));
    Imp.WriteXY(4.5,wCont,Bib.NumToTexto(wvlr_icm,2,13));
    Imp.WriteXY(15,wCont,Bib.NumToTexto(wtotal_produtos,2,15));
    wCont := wCont + 2;
    Imp.WriteXY(0.5,wCont,Bib.NumToTexto(QNFE_EmiteVAL_FRETE.Value,2,13));
    Imp.WriteXY(8,wCont,Bib.NumToTexto(QNFE_EmiteVAL_DESPESAS.Value,2,13));
    Imp.WriteXY(11.5,wCont,Bib.NumToTexto(wvlr_ipi,2,13));
    Imp.WriteXY(15,wCont,Bib.NumToTexto(wtotal_produtos
                                 +wvlr_ipi
                                 +QNFE_EmiteVAL_DESPESAS.Value
                                 -QNFE_EmiteVAL_Desconto.Value
                                 -QNFE_EmiteVAL_Funrural.Value,2,15));
    wCont := wCont + 3;  // Linha 60
    if Trim(QNFE_Emitenome_transp.Value) = '' then
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_Transportadora.Value)
    else
      Imp.WriteXY(0,wCont,QNFE_Emitenome_transp.Value);
    if QNFE_EmiteInd_Tipo_Frete.Value = 'FOB' Then
      Imp.WriteXY(10.6,wCont,'2') // Destinatário
    else
      Imp.WriteXY(10.6,wCont,'1'); // Emitente
    Imp.WriteXY(11.8,wCont,QNFE_EmiteDesc_Placa.Value);
    Imp.WriteXY(15,wCont,QNFE_Emitecgc_transp.Value);
    wCont := wCont+2;
    Imp.WriteXY(0,wCont,QNFE_Emiteend_transp.Value);
    Imp.WriteXY(10.5,wCont,QNFE_Emitecidade_transp.Value);
    Imp.WriteXY(14,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(15,wCont,QNFE_Emiteinsc_transp.Value);
    wCont := wCont + 2;
    Imp.WriteXY(0,wCont,QNFE_EmiteNum_Volumes.Text);
    Imp.WriteXY(13.1,wCont,Bib.NumToTexto(wPeso,2,8));
    Imp.WriteXY(15.5,wCont,Bib.NumToTexto(wPeso,2,8));
    wCont := wCont + 3;
    if QNFE_EmiteVAL_Funrural.Value > 0 Then
    begin
      Imp.WriteXY(0,wCont,Bib.NumToTexto(QNFE_EmiteVAL_Funrural.Value,2,13));
      wPerc_Funrural := DMOracle.BuscaNome('SELECT PERC_FUNRURAL FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(QNFE_EmiteCod_Cadastro.Value));
      Imp.WriteXY(2,wCont,wPerc_Funrural);
    end;
    wCont:=wCont+2;
    Imp.WriteXY(0,wCont,QNFE_EmiteOBS.Value);
    Inc(wCont);
    Imp.WriteXY(0,wCont,QNFE_EmiteOBS_COMPLEMENTO.Value);
    Inc(wCont);
    Imp.WriteXY(0,wCont,QNFE_EmiteDesc_Mensagem.Value);
    Inc(wCont);
    Imp.WriteXY(0,wCont,QNFE_EmiteDesc_COMPLEMENTO.Value);
    Inc(wCont);
    Imp.WriteXY(0,wCont,QNFE_EmiteDesc_COMPLEMENTO1.Value);
    Inc(wCont);
    Imp.WriteXY(0,wCont,QNFE_EmiteDesc_COMPLEMENTO2.Value);
    Inc(wcont);
    Imp.WriteXY(0,wCont,Bib.NumToTexto(QNFE_EmiteCod_Vendedor.Value,0,8)+' - '+QNFE_EmiteNOME_VENDEDOR.Value);
  end;
end;
// ---------------------- Final impressão NF GONZATTI - CEREALISTA SÃO JORGE ----\\

procedure TFNotaImpressao.EmitePedido(wDocumento: String);
Var wCont, wLinha : Integer;
    wEmbalagem,wTotal_Prod:Real;
begin
  wCont := 0;
  wTotal_Prod := 0;
  With DMNotaSaida do
  Begin
    If Trim(QNFE_EmiteDesc_FANTASIA.Value) <> '' then
    begin
       Imp.WriteXY(10,wCont,'Fantasia:');
       Imp.WriteXY(11.5,wCont,Trim(QNFE_EmiteDesc_FANTASIA.Value));
    end;
    Imp.WriteXY(17,wCont,wDocumento);
    Imp.WriteXY(18.5,wCont,QNFE_EmiteNUM_NOTA.Text);
    wCont := wCont+1;
    If (wEmpresa <> 'FAVILLE') And (wEmpresa <> 'ZADIMEL')  Then
       Imp.WriteXY(0.2,wCont,QNFE_EmiteNOME_FILIAL.Value);
    Imp.WriteXY(10,wCont,'Cliente:');
    Imp.WriteXY(11.5,wCont,QNFE_EmiteCOD_CADASTRO.Text);
    Imp.WriteXY(12.5,wCont,QNFE_EmiteNOME.Value);
    wCont := wCont + 1;
    If (wEmpresa <> 'FAVILLE') And (wEmpresa <> 'ZADIMEL')  Then
       Imp.WriteXY(0.2,wCont, QNFE_EmiteEND_FILIAL.Value);
    Imp.WriteXY(10,wCont,'Endereco:');
    Imp.WriteXY(1.5,wCont, QNFE_EmiteDESC_ENDERECO.Value);
    wCont := wCont+1;
    If (wEmpresa <> 'FAVILLE') And (wEmpresa <> 'ZADIMEL')  Then
    Begin
      Imp.WriteXY(0.2,wCont,QNFE_EmiteCEP_FILIAL.Value);
      Imp.WriteXY(3.7,wCont,QNFE_EmiteCIDADE_FILIAL.Value);
      Imp.WriteXY(3.7,wCont,'-'+QNFE_EmiteUF_FILIAL.Value);
    end;
    Imp.WriteXY(10,wCont,'Fone:');
    if wEmpresa = 'RADIO' then
      Imp.WriteXY(11,wCont,QNFE_EmiteDESC_TELEFONE.Value + ' - ' + QNFE_EmiteDESC_CELULAR.Value)
    else
      Imp.WriteXY(11,wCont,QNFE_EmiteDESC_TELEFONE.Value);
    Imp.WriteXY(15,wCont,'Cidade:');
    Imp.WriteXY(16.2,wCont,QNFE_EmiteDESC_CIDADE.Value);
    wCont := wCont+1;
    Imp.WriteXY(0.2,wCont,'Emissao:');
    Imp.WriteXY(1.7,wCont,QNFE_EmiteDT_EMISSAO.Text);
    Imp.WriteXY(10,wCont,'Bairro:');
    Imp.WriteXY(11.2,wCont,QNFE_EmiteDESC_BAIRRO.Value);
    Imp.WriteXY(14,wCont,' UF:');
    Imp.WriteXY(14.8,wCont,QNFE_EmiteCOD_ESTADO.Value);
    Imp.WriteXY(14,wCont,' CEP:');
    Imp.WriteXY(14.8,wCont,QNFE_EmiteDESC_CEP.Value);
    wCont:= wCont +1;
    If wEmpresa <> 'ZADIMEL'  Then
       IF QNFE_EmiteInd_Vendas.Value = 'D' Then
         Imp.WriteXY(0.2,wCont,'DEVOLUCAO DE VENDA - CREDITO PARA CLIENTE'+Trim(QNFE_EmiteDESC_RESUMO.Value))
       Else
         Imp.WriteXY(0.2,wCont,QNFE_EmiteCod_Operacao.Text + ' - ' + QNFE_EmiteNat_Operacao.Text);
    If QNFE_EmiteInd_Condicao_Pagto.Value = '1' Then
      Imp.WriteXY(10,wCont,'A Vista');
    If QNFE_EmiteInd_Condicao_Pagto.Value = '2' Then
      Imp.WriteXY(10,wCont,'A Prazo');
    If QNFE_EmiteInd_Condicao_Pagto.Value = '3' Then
       If (wEmpresa = 'FAVILLE') Or (wEmpresa = 'ZADIMEL')  Then
        Begin
          Imp.WriteXY(10,wCont,'CHEQUE PARA :');
          Imp.WriteXY(12.2,wCont,DateToStr(QNFE_EmiteDT_EMISSAO.Value + QNFE_EmiteNr_Dias_Cheque.Value));
          If QNFE_EmiteNr_Dias_Cheque1.Value <> 0 Then
             Imp.WriteXY(14.4,wCont,DateToStr(QNFE_EmiteDT_EMISSAO.Value + QNFE_EmiteNr_Dias_Cheque1.Value));
          If QNFE_EmiteNr_Dias_Cheque2.Value <> 0 Then
             Imp.WriteXY(16.8,wCont,DateToStr(QNFE_EmiteDT_EMISSAO.Value + QNFE_EmiteNr_Dias_Cheque2.Value));
          If QNFE_EmiteNr_Dias_Cheque3.Value <> 0 Then
             Imp.WriteXY(19.2,wCont,DateToStr(QNFE_EmiteDT_EMISSAO.Value + QNFE_EmiteNr_Dias_Cheque3.Value));
        End
       else
          Imp.WriteXY(10,wCont,'Conta Corrente');
    If (wEmpresa = 'FAVILLE') then
    begin
      Inc(wCont);
      Imp.WriteXY(0.2,wCont,'Representante:');
      Imp.WriteXY(2.3,wCont,QNFE_EmiteCod_Vendedor.Text);
      Imp.WriteXY(2.8,wCont,QNFE_EmiteNome_Vendedor.Text);
    end;

    Inc(wCont);
    // **** Itens ****
    Imp.WriteXY(0.2,wCont,'___________________________________________________________________');
    Imp.WriteXY(0.2,wCont,'__________________________________________________________________');
    wCont := wCont+1;
    Imp.WriteXY(0.2,wCont,'QUANTIDADE');
    Imp.WriteXY(1.9,wCont,'UNID.');
    Imp.WriteXY(3.2,wCont,'PRODUTO');
    Imp.WriteXY(11,wCont,'LOTE');
    Imp.WriteXY(15.5,wCont,'PRECO UNITARIO');
    Imp.WriteXY(18.7,wCont,'TOTAL');
    wCont := wCont + 1;
    Imp.WriteXY(0.2,wCont,'___________________________________________________________________');
    Imp.WriteXY(0.2,wCont,'__________________________________________________________________');
    wCont := wCont+1;
    wEmbalagem := 0;
    QNFE_EmiteIt.First;
    wLinha:=wCont;
    While Not QNFE_EmiteIT.Eof do
    Begin
      Imp.WriteXY(0.2,wCont,Bib.NumToTexto(QNFE_EmiteITQT_Quantidade.Value,2,10));
      Imp.WriteXY(1.9,wCont,QNFE_EmiteITDesc_Unidade.Value);
      If (wEmpresa <> 'ZADIMEL') Then
         Imp.WriteXY(3.2,wCont,QNFE_EmiteITCod_Produto.Text);
      Imp.WriteXY(4,wCont,QNFE_EmiteITDesc_Produto.Value);
      Imp.WriteXY(11,wCont,QNFE_EmiteITDesc_Lote.Value);
      Imp.WriteXY(16.6,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Unitario.Value,2,10));
      Imp.WriteXY(18,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value,2,10));
      wEmbalagem := wEmbalagem + (QNFE_EmiteITQT_Quantidade.Value * QNFE_EmiteITNum_Embalagem.Value);
      wTotal_Prod := wTotal_Prod + QNFE_EmiteITQT_Quantidade.Value;
      if (wLinha = 24) then
      begin
         wCont := wCont+2;
         Imp.WriteXY(18.2,wCont,'continua');
         wCont := wCont+5;
         Imp.WriteXY(18.2,wCont,'continua');
         wCont:=wCont+2;
         wLinha:=-1;
      end;
      QNFE_EmiteIT.Next;
      wCont := wCont + 1;
      inc(wLinha);
    End;
    // *** Final dos Itens ****
    Imp.WriteXY(0.2,wCont,Bib.NumToTexto(wTotal_Prod,2,10));
    if wLinha > 18 then
      wCont:= wCont+28
    else
      wCont :=wCont+3;
    Imp.WriteXY(0.2,wCont,'Observacao:');
    Imp.WriteXY(2.2,wCont,QNFE_EmiteOBS.Value + ' ' + QNFE_EmiteOBS_COMPLEMENTO.Value);
    wCont := wCont+1;
    If (QNFE_EmiteDesc_Transportadora.Value <> '') Or (QNFE_Emitenome_transp.Value <> '' ) Then
    Begin
      if Trim(QNFE_Emitenome_transp.Value) = '' then
        Imp.WriteXY(0.2,wCont,'Transp.:'+QNFE_EmiteDesc_Transportadora.Value)
      else
        Imp.WriteXY(0.2,wCont,'Transp.:'+QNFE_Emitenome_transp.Value);
      Inc(wCont);
    End;
    Imp.WriteXY(0.2,wCont,'Pedido:');
    Imp.WriteXY(1.7,wCont,Bib.NumTotexto(wtotal_produtos+wvlr_ipi,2,10));
    If wEmpresa <> 'ZADIMEL'  Then
    Begin
      Imp.WriteXY(4.2,wCont,'Acrescimo:');
      Imp.WriteXY(5.9,wCont,Bib.NumToTexto(QNFE_EmiteVal_Despesas.Value,2,11));
      Imp.WriteXY(7.9,wCont,'Desconto:');
      Imp.WriteXY(9.2,wCont,Bib.NumToTexto(QNFE_EmiteVal_Desconto.Value,2,11));
      Imp.WriteXY(10.3,wCont,'Entrada:');
      Imp.WriteXY(12.1,wCont,Bib.NumToTexto(QNFE_EmiteVal_AVista.Value,2,11));
    end;
    Imp.WriteXY(16.7,wCont,'Total:');
    Imp.WriteXY(18.2,wCont,Bib.NumTotexto(wtotal_produtos
                                         +wvlr_ipi
                                         +QNFe_EmiteVal_FunRural.Value
                                         -QNFE_EmiteVal_Desconto.Value
                                         -QNFE_EmiteVal_AVista.Value,2,10));
    wCont := wCont + 1;
    Imp.WriteXY(0.2,wCont,'Parcelas');
    Imp.WriteXY(4.2,wCont,'Vencimento');
    Imp.WriteXY(8.6,wCont,'Valor');
    If wEmpresa = 'CGS'
    Then
      Imp.WriteXY(16.7,wCont,'M3:'+Bib.NumToTexto(wEmbalagem,5,11));
    wCont:=wCont+1;
    QContaReceber.Open;
    QContaReceber.First;
    While not QContaReceber.Eof do
    Begin
      Imp.WriteXY(0.2,wCont,Bib.NumTotexto(QContaReceberNUM_PARCELA.Value,0,8));
      Imp.WriteXY(4.2,wCont,QContaReceberDT_VENCIMENTO.Text);
      Imp.WriteXY(8.2,wCont,Bib.NumToTexto(QContaReceberVAL_TITULO.Value,2,8));
      wCont := wCont + 1;
      QContaReceber.Next;
    End;
    wCont := wCont + 2;
    QContaReceber.Close;
    Imp.WriteXY(0.2,wCont,'________________________________');
    wCont := wCont + 1;
    Imp.WriteXY(0.2,wCont,QNFE_EmiteNome.Value);
  End;
end;

procedure TFNotaImpressao.EmitePedido_Bobina;
Var wCont : Integer;
    wQuant : Real;
begin
  wCont := 0;
  With DMNotaSaida do
  Begin
    Imp.WriteXY(0,wCont,QNFE_EmiteNOME_FILIAL.Value);
    Inc(wCont);
    Imp.WriteXY(0,wCont,Trim(QNFE_EmiteCOD_CADASTRO.Text)+' '+QNFE_EmiteNOME.Value);
    Inc(wCont);
  If DMNotaSaida.QNFE_EmiteDESC_FANTASIA.Value <> '' then
    begin
      Imp.WriteXY(0,wCont, QNFE_EmiteDESC_FANTASIA.Value);
      Inc(wCont);
    end;
    Imp.WriteXY(0,wCont, QNFE_EmiteDESC_ENDERECO.Value);
    Inc(wCont);
    Imp.WriteXY(0,wCont, QNFE_EmiteDESC_BAIRRO.Value);
    Inc(wCont);
    Imp.WriteXY(0,wCont,QNFE_EmiteDESC_CIDADE.Text+' '+QNFE_EmiteCOD_ESTADO.Text+' '+QNFE_EmiteDESC_TELEFONE.Text);
    Inc(wCont);
    Imp.WriteXY(0,wCont,'Emissao:');
    Imp.WriteXY(1.5,wCont,QNFE_EmiteDT_EMISSAO.Text);
    Imp.WriteXY(3,wCont,'PEDIDO NUM.:');
    Imp.WriteXY(5,wCont,QNFE_EmiteNUM_NOTA.Text);
    Inc(wCont);
    // **** Itens ****
    Imp.WriteXY(0,wCont,'________________________________________');
    Inc(wCont);
    Imp.WriteXY(0,wCont,'QUANTIDADE UN DESCRICAO');
    Inc(wCont);
    Imp.WriteXY(2,wCont,'PRECO UNITARIO');
    Imp.WriteXY(5,wCont,'TOTAL');
    Inc(wCont);
    Imp.WriteXY(0,wCont,'________________________________________');
    Inc(wCont);
    wQuant := 0;
    QNFE_EmiteIt.First;
    While Not QNFE_EmiteIT.Eof do
    Begin
      wQuant := wQuant + QNFE_EmiteITQT_Quantidade.Value;
      Imp.WriteXY(0,wCont,Bib.NumToTexto(QNFE_EmiteITQT_Quantidade.Value,2,10));
      Imp.WriteXY(1.6,wCont,QNFE_EmiteITDesc_Unidade.Value);
      Imp.WriteXY(2.2,wCont,Trim(QNFE_EmiteITCod_Produto.Text)+'-'+Trim(QNFE_EmiteITDesc_Produto.Text));
      Inc(wCont);
      Imp.WriteXY(2,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Unitario.Value,2,10));
      Imp.WriteXY(4.2,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value,2,10));
      QNFE_EmiteIT.Next;
      wCont := wCont + 1;
    End;
    Inc(wCont);
    Imp.WriteXY(0,wCont,'________');
    Inc(wCont);
    Imp.WriteXY(0,wCont,Bib.NumToTexto(wQuant,2,10));
    // *** Final dos Itens ****
    wCont := wCont+3;
    Imp.WriteXY(0,wCont,'Observacao:');
    Imp.WriteXY(2,wCont,QNFE_EmiteOBS.Value + ' ' + QNFE_EmiteOBS_COMPLEMENTO.Value);
    wCont := wCont+1;
    Imp.WriteXY(0,wCont,'Pedido:');
    Imp.WriteXY(1.5,wCont,Bib.NumTotexto(wtotal_produtos+wvlr_ipi,2,10));
    Imp.WriteXY(3,wCont,'Desc:');
    Imp.WriteXY(3.7,wCont,Bib.NumToTexto(QNFE_EmiteVal_Desconto.Value,2,11));
    Inc(wCont);
    Imp.WriteXY(0,wCont,'Entrada:');
    Imp.WriteXY(1.5,wCont,Bib.NumTotexto(QNFE_EmiteVal_AVista.Value,2,10));
    Imp.WriteXY(3,wCont,'Total:');
    Imp.WriteXY(3.7,wCont,Bib.NumTotexto(wtotal_produtos
                                         +wvlr_ipi
                                         +QNFe_EmiteVal_Funrural.Value
                                         -QNFE_EmiteVal_AVista.Value
                                         -QNFE_EmiteVal_Desconto.Value,2,10));
    wCont := wCont + 2;
    Imp.WriteXY(0,wCont,'Nao Vale Como Nota Fiscal, Exija sua Nota Fiscal');
    if QNFE_EmiteInd_Condicao_Pagto.Value = '2' Then
     begin
      wCont := wCont + 1;
      QContaReceber.Open;
      QContaReceber.First;
      Imp.WriteXY(1.3,wCont,'Vencimento');
      Imp.WriteXY(4,wCont,'Valor');
      wCont := wCont + 1;
      while not QContaReceber.Eof do       // Faturamento
      begin
        Imp.WriteXY(1.3,wCont,QContaReceberDT_Vencimento.Text);
        Imp.WriteXY(3.5,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
        Inc(wCont);
        QContaReceber.Next;
      end;
      QContaReceber.Close;
     end;
    wCont := wCont + 6;
    Imp.WriteXY(4.5,wCont,'');
  End;
end;
// Inicio do procedimento de impressão NF - MEDIBENS
Procedure TFNotaImpressao.NF_MEDIBENS;
var wCont,wContServico,wNotaGlobal,wContLinha : Byte;
    wTotalISS, wTotalServico : Real;
begin
  // *** Emissão de Nota Fiscal para a MEDIBENS Informatica
  // *** OBS - Colocar Posicao X em Centimetros
  // *** wNotaGlobal Controla a quebra de continuação
  wTotalISS := 0;
  wTotalServico := 0;
  with DMNotaSaida do
  begin
    wNotaGlobal := 0;
          wCont := 0;  // INICIALIZA VALOR DA VARIAVEL - Robson 26/06/2000
    while wNotaGlobal < 2 do
    begin
      wCont := 2;
      Imp.WriteXY(0,wCont,'');  // Pula linha.
      if wNotaGlobal = 1 then
         Imp.WriteXY(9.5,wCont,'CONTINUACAO');
      WnotaGlobal := 2;
      if QNFE_EmiteInd_Entrada_Saida.Value = 'S' Then
         Imp.WriteXY(12.9,wCont,'X')
      else
         Imp.WriteXY(14.9,wCont,'X');
      Imp.WriteXY(18.3,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
      wCont := wCont+5;
      Imp.WriteXY(0.5,wCont,QNFE_EmiteNAT_OPERACAO.Value);
      Imp.WriteXY(6.5,wCont,QNFE_Emitenum_cfop.Text);  //ALTERADO SERGIO 13/12/2002
{      if QNFE_EmiteUF_Filial.Value <> QNFE_EmiteUF_Nota.Value then
         Imp.WriteXY(6.5,wCont,QNFE_EmiteNat_InterEstadual.Text)
      else
         Imp.WriteXY(6.5,wCont,QNFE_EmiteNat_Estadual.Text);}
      wCont := wCont+3;
      Imp.WriteXY(0.5,wCont,QNFE_EmiteCOD_CADASTRO.Text);
      Imp.WriteXY(1.4,wCont,QNFE_EmiteNOME.Value);
      Imp.WriteXY(12.8,wCont,QNFE_EmiteNUM_CGC_CPF.Value);
      Imp.WriteXY(18.2,wCont,QNFE_EmiteDT_EMISSAO.Text);
      wCont := wCont + 2;
      Imp.WriteXY(0.5,wCont, QNFE_EmiteDESC_ENDERECO.Value);
      Imp.WriteXY(11.0,wCont,QNFE_EmiteDESC_BAIRRO.Value);
      Imp.WriteXY(15.1,wCont,QNFE_EmiteDESC_CEP.Value);
      Imp.WriteXY(18.2,wCont,QNFE_EmiteDT_EMISSAO.Text);
      wCont := wCont+2;
      Imp.WriteXY(0.5,wCont,QNFE_EmiteDESC_CIDADE.Value);
      Imp.WriteXY(8.1,wCont,QNFE_EmiteDESC_TELEFONE.Value);
      Imp.WriteXY(11.8,wCont,QNFE_EmiteCOD_ESTADO.Value);
      Imp.WriteXY(12.8,wCont,QNFE_EmiteNUM_INSCRICAO.Value);
      Imp.WriteXY(18.2,wCont,TimeToStr(Time));
      // **** Itens de produtos ****
      wCont := wCont + 3;
      wContLinha := 0;
      // somente pode posicionar no inicio do arquivo a primeira vez
      if wNotaGlobal = 0 then
         QNFE_EmiteIt.First;
      while not QNFE_EmiteIT.Eof do
      begin
      if QNFE_EmiteItIND_TIPO_PRODUTO.Value <> 'SERVIÇO' Then   // nota fiscal de serviços
        begin
          Inc(wCont);
          Inc(wcontLinha);
          Imp.WriteXY(0,wCont,QNFE_EmiteITNum_Fabricante.Value);
          Imp.WriteXY(2.4,wCont,QNFE_EmiteITDesc_Produto.Value);
          Imp.WriteXY(10.5,wCont,QNFE_EmiteITNum_Classificacao.Value);
          Imp.WriteXY(11.2,wCont,QNFE_EmiteITDesc_Unidade.Value);
          Imp.WriteXY(11.5,wCont,Bib.NumToTexto(QNFE_EmiteITQT_Quantidade.Value,2,8));
          Imp.WriteXY(12.9,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Unitario.Value,2,11));
          Imp.WriteXY(14.3,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value,2,19));
          Imp.WriteXY(19.2,wCont,QNFE_EmiteITPerc_Aliquota.Text);
          Calc_Peso_Nota;
          if QNFE_EmiteItDesc_Complemento.Value <> '' Then
          begin   // ** Imprimir Complemento de Descrição
            Inc(wCont);
            Inc(wContLinha);
            Imp.WriteXY(1,wCont,QNFE_EmiteITDesc_Complemento.Value);
          end;
          if QNFE_EmiteItInd_Tipo_Produto.Value = 'AGRICOLA' then
          begin // Preco de produtos agrícolas em Sacas
            Inc(wCont);
            Inc(wcontLinha);
            Imp.WriteXY(14.3,wCont,'Preço em '+FloatToStr(QNFE_EmiteItNum_Embalagem.Value)+' Kg');
          end;
        end
        else
        begin
          wTotalISS := wTotalISS + QNFE_EmiteItVal_ISS.Value;
          wTotalServico := wTotalServico + QNFE_EmiteItVal_Total.Value;
        end;
        QNFE_EmiteIT.Next;
        if wContLinha >= 15 then
        begin
          wCont := 42;
          Imp.WriteXY(15.4,wCont,'CONTINUA');
          wNotaGlobal := 1;
          Imp.SaltaPagina;
          Break;
        end;
      end;
    end;
    // Fim do Controle de Continuação
    if QNFE_EmiteVal_Desconto.Value > 0 Then
    begin
      Inc(wCont);
      Imp.WriteXY(0.5,wCont,'DESCONTO: '+Bib.NumToTexto(QNFE_EmiteVal_Desconto.Value,2,13));
    end;
    // Fim dos Item de Produto
    wCont := 33;
    wContServico := 0;
    // Item de Prestacao de Serviço
    QNFE_EmiteIt.First;
    while not QNFE_EmiteIT.Eof do
    begin                                                // O comentario abaixo era usado antes
      if QNFE_EmiteItIND_TIPO_PRODUTO.Value = 'SERVIÇO' Then   // QNFE_EmiteItPERC_ISS.Value > 0
      begin
        Inc(wCont); Inc(wContServico);
        Imp.WriteXY(0.2,wCont,Bib.NumToTexto(QNFE_EmiteITCod_Produto.Value,0,6));
        Imp.WriteXY(1.2,wCont,QNFE_EmiteITDesc_Produto.Value);
        Imp.WriteXY(9.3,wCont,Bib.NumToTexto(QNFE_EmiteITQT_Quantidade.Value,2,6));
        Imp.WriteXY(10.4,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Unitario.Value,2,13));
        Imp.WriteXY(12.7,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value,2,17));
        if wContServico = 2 Then
          Imp.WriteXY(15.5,wCont,Bib.NumToTexto(wTotalISS,2,15) );
        if wContServico = 4 Then
          Imp.WriteXY(15.5,wCont,Bib.NumToTexto(wTotalServico,2,15));
      end;
      QNFE_EmiteIt.Next;
    end;
    if wTotalISS > 0 Then
      if wContServico < 2 Then
      begin
        Inc(wCont); Inc(wContServico);
        Imp.WriteXY(15.5,wCont,Bib.NumToTexto(wTotalISS,2,15));
      end;
    If wTotalServico > 0 Then
      if wContServico < 4 Then
      begin
        wCont := wCont + 4 - wContServico;
        Imp.WriteXY(15.5,wCont,Bib.NumToTexto(wTotalServico,2,15));
      end;
    // *** Final dos Itens ****
    wCont := 46;
    Imp.WriteXY(0.2,wCont,Bib.NumToTexto(wbase_icm_tributada,2,18));
    Imp.WriteXY(3.8,wCont,Bib.NumToTexto(wvlr_icm,2,17));
    Imp.WriteXY(14.4,wCont,Bib.NumToTexto(wtotal_produtos - wTotalServico,2,20));
    wCont := wCont + 2;
    Imp.WriteXY(0.2,wCont,Bib.NumToTexto(QNFE_EmiteVAL_FRETE.Value,2,18));
    Imp.WriteXY(7.5,wCont,Bib.NumToTexto(QNFE_EmiteVAL_DESPESAS.Value,2,17));
    Imp.WriteXY(10.2,wCont,Bib.NumToTexto(wvlr_ipi,2,15));
    Imp.WriteXY(14.4,wCont,Bib.NumToTexto(wtotal_produtos
                                 +wvlr_ipi
                                 +QNFE_EmiteVAL_DESPESAS.Value
                                 -QNFE_EmiteVAL_Desconto.Value
                                 -QNFE_EmiteVAL_Funrural.Value,2,20));
    wCont := wCont + 3;
    if Trim(QNFE_Emitenome_transp.Value) = '' then
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_Transportadora.Value)
    else
      Imp.WriteXY(0.2,wCont,QNFE_Emitenome_transp.Value);
    if QNFE_EmiteInd_Tipo_Frete.Value = 'FOB' Then
      Imp.WriteXY(10.5,wCont,'2') // Destinatário
    else
      Imp.WriteXY(10.5,wCont,'1'); // Emitente
    Imp.WriteXY(10.5,wCont,QNFE_EmiteDesc_Placa.Value);
    Imp.WriteXY(14,wCont,QNFE_Emitecgc_transp.Value);
    wCont := wCont+2;
    Imp.WriteXY(0.2,wCont,QNFE_Emiteend_transp.Value);
    Imp.WriteXY(7.8,wCont,QNFE_Emitecidade_transp.Value);
    Imp.WriteXY(13,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(14,wCont,QNFE_Emiteinsc_transp.Value);
    wCont := wCont + 2;
    Imp.WriteXY(1,wCont,QNFE_EmiteNUM_VOLUMES.Text);
    Imp.WriteXY(14,wCont,Bib.NumToTexto(wPeso,2,8));
    Imp.WriteXY(16.5,wCont,Bib.NumToTexto(wPeso,2,8));
    wCont := wCont + 2;
    Imp.WriteXY(0.2,wCont,'Empresa Optante do Simples - PR');
    Inc(wCont);
    Imp.WriteXY(0.2,wCont,QNFE_EmiteOBS.Value);
    Inc(wCont);
    if Trim(QNFE_EmiteOBS_COMPLEMENTO.Value) <> '' Then
    begin
      Imp.WriteXY(0.2,wCont,QNFE_EmiteOBS_COMPLEMENTO.Value);
      Inc(wCont);
    end;
    if Trim( QNFE_EmiteDesc_Mensagem.Value)<>'' Then
    begin
      Imp.WriteXY(0.2,wCont,QNFE_EmiteDesc_Mensagem.Value);
      Inc(wCont);
    end;
    if Trim(QNFE_EmiteDesc_COMPLEMENTO.Value) <> '' Then
    begin
      Imp.WriteXY(0.2,wCont,QNFE_EmiteDesc_COMPLEMENTO.Value);
      Inc(wCont);
    end;
    if QNFE_EmiteInd_Condicao_Pagto.Value = '1' Then
    begin
      Imp.WriteXY(0.2,wCont,'Pagamento a Vista');
      Inc(wCont);
    end;
    if QNFE_EmiteInd_Condicao_Pagto.Value = '2' Then
    begin
      Imp.WriteXY(0.2,wCont,'Vencimentos:');
      QContaReceber.Open;
      QContaReceber.First;
      while not QContaReceber.Eof do
      begin
        Imp.WriteXY(2,wCont,QContaReceberDT_Vencimento.Text+' ');
        Imp.WriteXY(4,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
        if wCont=58 Then
          Imp.WriteXY(19,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,6) );
        Inc(wCont);
        QContaReceber.Next;
      end;
      QContaReceber.Close;
    end;
    //if wCont<=58 Then
    //  wCont := 58;
    wCont := wCont + 6; //--------------- alterado por Fabio - 14/06/20002 antigo {wCont := wCont + 8;}
    Imp.WriteXY(18.7,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,6) );
  end;
end;

//---------------inicio impressao nota ZADIMEL

Procedure TFNotaImpressao.NFZadimel;
Var wCont : Byte;
    wPesoLiquido,wVolume : Real;
    wVencimento,wNotaGlobal,wContLinha : Integer;
begin
  // *** Emissão de Nota Fiscal para ZADIMEL
  // *** OBS - Colocar Posicao X em Centimetros
  wCont := 1;
  wPesoLiquido := 0;
  DMFilial.QFilial.Close;
  DMFilial.QFilial.SetVariable('PK',DMNotaSaida.QNFE_EmiteCod_Filial.Value);
  DMFilial.QFilial.Open;
  with DMNotaSaida do
  begin
    wNotaGlobal := 0;
    QNFE_EmiteIt.First;
    wVolume := 0;
    while wNotaGlobal < 2 do
    begin
      wCont := 1;
      Imp.WriteXY(4.8,wCont,DMFilial.QFilialDesc_Filial.Value);
      if wNotaGlobal = 1 then
         Imp.WriteXY(17,wCont,'CONTINUACAO');
      WnotaGlobal := 2;
      Inc(wCont);
      Imp.WriteXY(4.8,wCont,(DMFilial.QFilialDesc_Endereco.Text+'  Fone: '+ DMFilial.QFilialDesc_Telefone.Text));
      Imp.WriteXY(17.9,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8));
      Inc(wCont);
      Imp.WriteXY(4.8,wCont,(DMFilial.QFilialDesc_Cep.Text+' - '+DMFilial.QFilialDesc_Cidade.Text+' - '+DMFilial.QFilialCod_Estado.Text));
      If QNFE_EmiteInd_Entrada_Saida.Value = 'S' Then
        Imp.WriteXY(12.8,wCont,'XX')
      Else
        Imp.WriteXY(15,wCont,'XX');
      Inc(wCont);
      Inc(wCont);
      Imp.WriteXY(13.0,wCont,DMFilial.QFilialNUM_CGC.Value);
      wCont := wCont+2;
      Imp.WriteXY(0,wCont,QNFE_EmiteNAT_OPERACAO.Value);
      Imp.WriteXY(6,wCont,QNFE_Emitenum_cfop.Text);  
      Imp.WriteXY(7.5,wCont,QNFE_EmiteDesc_Inscricao_Subst.Text);
      Imp.WriteXY(13.0,wCont,DMFilial.QFilialDesc_Inscricao.Value);
      wCont := wCont+3;
      Imp.WriteXY(0,wCont,QNFE_EmiteCOD_CADASTRO.Text);
      Imp.WriteXY(1.8,wCont,QNFE_EmiteNOME.Value);
      Imp.WriteXY(13.0,wCont,QNFE_EmiteNUM_CGC_CPF.Value);
      Imp.WriteXY(18.2,wCont,QNFE_EmiteDT_EMISSAO.Text);
      wCont := wCont + 2;
      Imp.WriteXY(0,wCont, QNFE_EmiteDESC_ENDERECO.Value);
      Imp.WriteXY(10.2,wCont,QNFE_EmiteDESC_BAIRRO.Value);
      Imp.WriteXY(15.0,wCont,QNFE_EmiteDESC_CEP.Value);
      Imp.WriteXY(18.2,wCont,QNFE_EmiteDT_RECEBIMENTO.Text);
      wCont := wCont+2;
      Imp.WriteXY(0,wCont,QNFE_EmiteDESC_CIDADE.Value);
      Imp.WriteXY(8.5,wCont,QNFE_EmiteDESC_TELEFONE.Value);
      Imp.WriteXY(11.7,wCont,QNFE_EmiteCOD_ESTADO.Value);
      Imp.WriteXY(13.0,wCont,QNFE_EmiteNUM_INSCRICAO.Value);
      wCont := wCont + 3;
      // **** Itens ****
      wContLinha := 0;
      While Not QNFE_EmiteIT.Eof do
      Begin
        Inc(wCont);
        Inc(wContLinha);
        Imp.WriteXY(0,wCont,Bib.NumToTexto(QNFE_EmiteITCod_Produto.Value,0,6));
        Imp.WriteXY(1.2,wCont,QNFE_EmiteITDesc_Produto.Value);
        Imp.WriteXY(8.4,wCont,QNFE_EmiteITNum_Classificacao.Value);
        Imp.WriteXY(9,wCont,QNFE_EmiteITDesc_Situacao_Trib.Value);
        Imp.WriteXY(9.9,wCont,QNFE_EmiteITDesc_Unidade.Value);
        wVolume := wVolume + QNFE_EmiteITQT_Quantidade.Value;
        Imp.WriteXY(10.5,wCont,Bib.NumToTexto(QNFE_EmiteITQT_Quantidade.Value,2,8));
        Imp.WriteXY(12,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Unitario.Value,2,10));
        Imp.WriteXY(13.5,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value,2,19));
        Imp.WriteXY(17.1,wCont,Trim(QNFE_EmiteITPerc_Aliquota.Text));
        Imp.WriteXY(17.8,wCont,Bib.NumToTexto(QNFE_EmiteITPerc_IPI.Value,0,2));
        Imp.WriteXY(18.3,wCont,Bib.NumToTexto(QNFE_EmiteITVal_IPI.Value,2,7));
        wPesoLiquido := wPesoLiquido + QNFE_EmiteITQT_Quantidade.Value * QNFE_EmiteITNum_embalagem.Value;
        If QNFE_EmiteItCod_Produto.Value <= 13 Then
           wPeso := wPeso + QNFE_EmiteITQT_Quantidade.Value * 1.080
        Else
          If (QNFE_EmiteITCod_Produto.Value = 60) or (QNFE_EmiteITCod_Produto.Value = 61) or
             ((QNFE_EmiteITCod_Produto.Value >= 70) and (QNFE_EmiteITCod_Produto.Value <= 75)) Then
             wPeso := wPeso + QNFE_EmiteITQT_Quantidade.Value * 0.880
          Else
            If ((QNFE_EmiteITCod_Produto.Value >= 30) and (QNFE_EmiteITCod_Produto.Value <= 37)) Then
              wPeso := wPeso + QNFE_EmiteITQT_Quantidade.Value * 0.600
            Else
              If ((QNFE_EmiteITCod_Produto.Value >= 40) and (QNFE_EmiteITCod_Produto.Value <= 44)) Then
                wPeso := wPeso + QNFE_EmiteITQT_Quantidade.Value * 0.400
              Else
                If ((QNFE_EmiteITCod_Produto.Value >= 50) and (QNFE_EmiteITCod_Produto.Value <= 54)) Then
                  wPeso := wPeso + QNFE_EmiteITQT_Quantidade.Value * 1.200
                Else
                  If (QNFE_EmiteITCod_Produto.Value = 63) Then
                    wPeso := wPeso + QNFE_EmiteITQT_Quantidade.Value * 1.700
                  Else
                    wPeso := wPeso + QNFE_EmiteITQT_Quantidade.Value * 0.680;
        If QNFE_EmiteItDesc_Complemento.Value <> '' Then
        Begin   // ** Imprimir Complemento de Descrição
          Inc(wCont);
          Inc(wContLinha);
          Imp.WriteXY(1,wCont,QNFE_EmiteITDesc_Complemento.Value);
        End;
        If QNFE_EmiteItInd_Imprime_NF.Value = 'S' Then
        Begin   // ** Imprimir Informações do Lote
          Inc(wCont);
          Inc(wContLinha);
          Imp.WriteXY(1.0,wCont,'Lote:');
          Imp.WriteXY(1.0,wCont,QNFE_EmiteItDesc_Lote.Value);
          Imp.WriteXY(1.0,wCont,' Validade:');
          Imp.WriteXY(1.0,wCont,QNFE_EmiteItDesc_Validade.Value);
          Imp.WriteXY(1.0,wCont,' OBS:');
          Imp.WriteXY(1.0,wCont,QNFE_EmiteItDesc_Observacao.Value);
        End;
        QNFE_EmiteIT.Next;
        if (wContLinha >= 17) And (Not QNFE_EmiteIT.Eof) then
        begin
          wCont := 38;
          Imp.WriteXY(18,wCont,'CONTINUA');
          wNotaGlobal := 1;
          wCont := 61;
          Imp.WriteXY(0,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
          Imp.WriteXY(8,wCont,QNFE_EmiteNOME.Value);
          Imp.SaltaPagina;
          Break;
        End;
        if QNFE_EmiteItDesc_Observacao_Tr.Text <> '' Then
        begin   // ** Imprimir observacao de tributacao
          Inc(wCont);
          Inc(wContLinha);
          Imp.WriteXY(1.1,wCont,QNFE_EmiteITDesc_Observacao_Tr.Value);
        end;
      End;
    End;
    If QNFE_EmiteVal_Desconto.Value > 0 Then
    Begin
      Inc(wCont);
      Imp.WriteXY(11,wCont,'DESCONTO: '+Bib.NumToTexto(QNFE_EmiteVal_Desconto.Value,2,13));
    End;
    If QNFE_EmiteCod_Cadastro.Value = 8037 Then
     Begin
       wCont := 35;
       Imp.WriteXY(1.2,wCont,'ICMS SUSPENSO CONFORME ART 275 DO DECRETO 2736/96');
     End;
    // *** Final dos Itens ****
    FNotaImpressao.Imp_Desconto(wCont,1.2);
    wCont := 38;
    Imp.WriteXY(0,wCont,Bib.NumToTexto(wbase_icm_tributada,2,18));
    Imp.WriteXY(3.8,wCont,Bib.NumToTexto(wvlr_icm,2,17));
    Imp.WriteXY(7.5,wCont,Bib.NumToTexto(wBase_Subst,2,17));
    Imp.WriteXY(12.5,wCont,Bib.NumToTexto(wIcms_Subst,2,15));
    Imp.WriteXY(17,wCont,Bib.NumToTexto(wtotal_produtos,2,20));
    wCont := wCont + 2;
    Imp.WriteXY(0,wCont,Bib.NumToTexto(QNFE_EmiteVAL_FRETE.Value,2,18));
    Imp.WriteXY(7.5,wCont,Bib.NumToTexto(QNFE_EmiteVAL_DESPESAS.Value,2,17));
    Imp.WriteXY(12.5,wCont,Bib.NumToTexto(wvlr_ipi,2,15));
    Imp.WriteXY(17,wCont,Bib.NumToTexto( wtotal_produtos
                                 +wvlr_ipi + wIcms_Subst
                                 +QNFE_EmiteVAL_DESPESAS.Value
                                 -QNFE_EmiteVAL_Desconto.Value
                                 -QNFE_EmiteVAL_Funrural.Value,2,20));
    wCont := wCont + 4;
    If Trim(QNFE_Emitenome_transp.Value) = '' then
      Imp.WriteXY(1.0,wCont,QNFE_EmiteDesc_Transportadora.Value)
    Else
      Imp.WriteXY(1.0,wCont,QNFE_Emitenome_transp.Value);
    If QNFE_EmiteInd_Tipo_Frete.Value = 'FOB' Then
      Imp.WriteXY(11.2,wCont,'2') // Destinatário
    Else
      Imp.WriteXY(11.2,wCont,'1'); // Emitente
    Imp.WriteXY(13.2,wCont,QNFE_EmiteDesc_Placa.Value);
    Imp.WriteXY(17.0,wCont,QNFE_Emitecgc_transp.Value);
    wCont := wCont+2;
    Imp.WriteXY(1.0,wCont,QNFE_Emiteend_transp.Value);
    Imp.WriteXY(9.8,wCont,QNFE_Emitecidade_transp.Value);
    Imp.WriteXY(15.5,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(17.0,wCont,QNFE_Emiteinsc_transp.Value);
    wCont := wCont + 2;
    Imp.WriteXY(1,wCont,FloatToStr(wVolume) );
    Imp.WriteXY(3.5,wCont,'Cx/Pct/Saco');
    Imp.WriteXY(6.1,wCont,'ZADIMEL');
    If QNFE_EmiteUF_Nota.Value <> 'EX' Then
     Begin
       Imp.WriteXY(14,wCont,Bib.NumToTexto(wPeso+wPesoLiquido,2,8));
       Imp.WriteXY(18,wCont,Bib.NumToTexto(wPesoLiquido,2,8));
     End;
    wCont := wCont + 3;
    Imp.WriteXY(0,wCont,Bib.NumToTexto(QNFE_EmiteCod_Vendedor.Value,0,8)+' - '+QNFE_EmiteNOME_VENDEDOR.Value);
    Inc(wcont);
    If QNFE_EmiteInd_Condicao_Pagto.Value = '2' Then
    Begin
      QContaReceber.Open;
      QContaReceber.First;
      wVencimento := 0;
      While not QContaReceber.Eof do
      Begin
        if wVencimento = 0 then
        begin
          wVencimento := 1;
          Imp.WriteXY(0,wCont,QContaReceberDT_Vencimento.Text);
          Imp.WriteXY(2,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
        end
        else
        begin
          wVencimento := 0;
          Imp.WriteXY(4,wCont,QContaReceberDT_Vencimento.Text+' ');
          Imp.WriteXY(6,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
          inc(wcont);
        end;
        QContaReceber.Next;
      End;
      QContaReceber.Close;
    End;
    If QNFE_EmiteInd_Condicao_Pagto.Value = '1' Then
       Imp.WriteXY(1.0,wCont,'A VISTA');
    If QNFE_EmiteOBS.Value <> '' Then
    Begin
      inc(wcont);
      Imp.WriteXY(0,wCont,Trim(QNFE_EmiteOBS.Value) );
    End;
    If QNFE_EmiteOBS_COMPLEMENTO.Value <> '' Then
    Begin
      Inc(wCont);
      Imp.WriteXY(0,wCont,Trim(QNFE_EmiteOBS_COMPLEMENTO.Value) );
    End;
    If QNFE_EmiteDesc_Mensagem.Value <> '' Then
    Begin
      Inc(wCont);
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_Mensagem.Value);
    End;
    If QNFE_EmiteDesc_COMPLEMENTO.Value <> '' Then
    Begin
      Inc(wCont);
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_COMPLEMENTO.Value);
    End;
    Inc(wcont);
    Imp.WriteXY(0,wCont,Trim(QNFE_EmiteDesc_FANTASIA.Value)+'- Complemento:'+Trim(QNFE_EmiteDesc_DESTRITO.Value));
    If wcont < 56 Then
       wcont := 56;
    If QNFE_EmiteCOD_ESTADO.Value = 'RJ' Then
       Imp.WriteXY(0,wCont,'Icms retido conf termo acordo nr.02/2002 SEF/RJ processo N E34/071635/2004');
    wCont := 61;
    Imp.WriteXY(1,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
    Imp.WriteXY(8,wCont,QNFE_EmiteNOME.Value);
    Imp.WriteXY(17,wCont,Bib.NumToTexto( wtotal_produtos
                                 +wvlr_ipi + wIcms_Subst
                                 +QNFE_EmiteVAL_DESPESAS.Value
                                 -QNFE_EmiteVAL_Desconto.Value
                                 -QNFE_EmiteVAL_Funrural.Value,2,20));
    Inc(wcont);
    If QNFE_EmiteInd_Condicao_Pagto.Value = '3' Then
     Begin
       Imp.WriteXY(1.0,wCont,'CHEQUE PARA ');
       Imp.WriteXY(2.2,wCont,DateToStr(QNFE_EmiteDT_EMISSAO.Value + QNFE_EmiteNr_Dias_Cheque.Value));
       If QNFE_EmiteNr_Dias_Cheque1.Value <> 0 Then
          Imp.WriteXY(3.9,wCont,DateToStr(QNFE_EmiteDT_EMISSAO.Value + QNFE_EmiteNr_Dias_Cheque1.Value));
       If QNFE_EmiteNr_Dias_Cheque2.Value <> 0 Then
          Imp.WriteXY(6,wCont,DateToStr(QNFE_EmiteDT_EMISSAO.Value + QNFE_EmiteNr_Dias_Cheque2.Value));
       If QNFE_EmiteNr_Dias_Cheque3.Value <> 0 Then
          Imp.WriteXY(6,wCont,DateToStr(QNFE_EmiteDT_EMISSAO.Value + QNFE_EmiteNr_Dias_Cheque3.Value));
     End;
    If QNFE_EmiteInd_Condicao_Pagto.Value = '1' Then
       Imp.WriteXY(1.0,wCont,'A VISTA ');
    If QNFE_EmiteInd_Condicao_Pagto.Value = '2' Then
       Imp.WriteXY(1.0,wCont,'A PRAZO ');
  End;
End;

Procedure TFNotaImpressao.NF_TEMPERMED;
var wCont,wContServico,wNotaGlobal,wContLinha,wContReceber : Byte;
    wTotalISS, wTotalServico : Real;
begin
  // *** Emissão de Nota Fiscal para a TEMPERMED
  // *** OBS - Colocar Posicao X em Centimetros
  // *** wNotaGlobal Controla a quebra de continuação
  wTotalISS := 0;
  wTotalServico := 0;
  with DMNotaSaida do
  begin
    wNotaGlobal := 0;
          wCont := 0;
    while wNotaGlobal < 2 do
    begin
      wCont := 2;
      if wNotaGlobal = 1 then
         Imp.WriteXY(9,wCont,'CONTINUACAO');
      WnotaGlobal := 2;
      Imp.WriteXY(18.3,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
      wCont := wCont + 1;
      if QNFE_EmiteInd_Entrada_Saida.Value = 'S' Then
         Imp.WriteXY(13,wCont,'XX')
      else
        Imp.WriteXY(15.5,wCont,'XX');
      wCont := wCont+7;
      Imp.WriteXY(0,wCont,QNFE_EmiteNAT_OPERACAO.Value);
      Imp.WriteXY(6.3,wCont,QNFE_Emitenum_cfop.Text);
      wCont := wCont+4;
      Imp.WriteXY(0,wCont,QNFE_EmiteCOD_CADASTRO.Text);
      Imp.WriteXY(1.1,wCont,QNFE_EmiteNOME.Value);
      Imp.WriteXY(13,wCont,QNFE_EmiteNUM_CGC_CPF.Value);
      Imp.WriteXY(18,wCont,QNFE_EmiteDT_EMISSAO.Text);
      wCont := wCont + 2;
      Imp.WriteXY(0,wCont, QNFE_EmiteDESC_ENDERECO.Value);
      Imp.WriteXY(11.8,wCont,QNFE_EmiteDESC_BAIRRO.Value);
      Imp.WriteXY(15,wCont,QNFE_EmiteDESC_CEP.Value);
      Imp.WriteXY(18,wCont,QNFE_EmiteDT_RECEBIMENTO.Text);
      wCont := wCont+3;
      Imp.WriteXY(0,wCont,QNFE_EmiteDESC_CIDADE.Value);
      Imp.WriteXY(8.5,wCont,QNFE_EmiteDESC_TELEFONE.Value);
      Imp.WriteXY(11.9,wCont,QNFE_EmiteCOD_ESTADO.Value);
      Imp.WriteXY(13,wCont,QNFE_EmiteNUM_INSCRICAO.Value);
      wCont := wCont+4;
      If QNFE_EmiteInd_Condicao_Pagto.Value = '2' Then
      Begin
        wContReceber:=0;
        QContaReceber.Open;
        QContaReceber.First;
        While not QContaReceber.Eof Do
        Begin
          if wContReceber = 0 Then
            Begin
              Imp.WriteXY(0.2,wCont,Bib.NumToTexto(QContaReceberNUM_TITULO.Value,0,6));
              Imp.WriteXY(2.7,wCont,QContaReceberDT_Vencimento.Text);
              Imp.WriteXY(7,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
              wContReceber := 1;
            End
          Else
            Begin
              Imp.WriteXY(10.5,wCont,Bib.NumToTexto(QContaReceberNUM_TITULO.Value,0,6));
              Imp.WriteXY(13,wCont,QContaReceberDT_Vencimento.Text);
              Imp.WriteXY(17,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
              wContReceber := 0;
              Inc(wCont);
            End;
          QContaReceber.Next;
        End;
        QContaReceber.Close;
      End;
      // **** Itens de produtos ****
      wCont := 28;
      wContLinha := 0;
      // somente pode posicionar no inicio do arquivo a primeira vez
      if wNotaGlobal = 0 then
         QNFE_EmiteIt.First;
      while not QNFE_EmiteIT.Eof do
      begin
        if QNFE_EmiteItIND_TIPO_PRODUTO.Value <> 'SERVIÇO' Then   // nota fiscal de serviços
         Begin
           Inc(wCont);
           Inc(wcontLinha);
           Imp.WriteXY(0,wCont,Bib.NumToTexto(QNFE_EmiteITCod_Produto.Value,0,6));
           Imp.WriteXY(1.3,wCont,QNFE_EmiteITDesc_Produto.Value);
           Imp.WriteXY(8.5,wCont,QNFE_EmiteITNum_Classificacao.Value);
           Imp.WriteXY(10,wCont,QNFE_EmiteITDesc_Unidade.Value);
           Imp.WriteXY(11,wCont,Bib.NumToTexto(QNFE_EmiteITQT_Quantidade.Value,2,8));
           Imp.WriteXY(12.9,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Unitario.Value,2,7));
           Imp.WriteXY(14.3,wCont,Bib.NumToTexto(QNFE_EmiteITPerc_Desc.Value,0,2));
           Imp.WriteXY(15.5,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value,2,9));
           Imp.WriteXY(17.5,wCont,QNFE_EmiteITPerc_Aliquota.Text);
           Imp.WriteXY(18.3,wCont,QNFE_EmiteITPerc_Ipi.Text);
           Imp.WriteXY(19,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Ipi.Value,2,5));
           If QNFE_EmiteItDesc_Complemento.Value <> '' Then
           Begin   // ** Imprimir Complemento de Descrição
             Inc(wCont);
             Inc(wContLinha);
             Imp.WriteXY(1,wCont,QNFE_EmiteITDesc_Complemento.Value);
           end;
         end
        else
          begin
            wTotalISS := wTotalISS + QNFE_EmiteItVal_ISS.Value;
            wTotalServico := wTotalServico + QNFE_EmiteItVal_Total.Value;
          end;
        QNFE_EmiteIT.Next;
        if wContLinha >= 15 then
         begin
           wCont := 42;
           Imp.WriteXY(15,wCont,'CONTINUA');
           wNotaGlobal := 1;
           Imp.SaltaPagina;
           Break;
         end;
      end;
    end;
    // Fim do Controle de Continuação
    if QNFE_EmiteVal_Desconto.Value > 0 Then
    begin
      Inc(wCont);
      Imp.WriteXY(0.0,wCont,'DESCONTO: '+Bib.NumToTexto(QNFE_EmiteVal_Desconto.Value,2,13));
    end;
    // Fim dos Item de Produto
    FNotaImpressao.Imp_Desconto(wCont,1);
    wCont := 49;
    wContServico := 0;
    // Item de Prestacao de Serviço
    QNFE_EmiteIt.First;
    while not QNFE_EmiteIT.Eof do
    begin                                                // O comentario abaixo era usado antes
      if QNFE_EmiteItIND_TIPO_PRODUTO.Value = 'SERVIÇO' Then   // QNFE_EmiteItPERC_ISS.Value > 0
      begin
        Inc(wCont); Inc(wContServico);
        Imp.WriteXY(0,wCont,Bib.NumToTexto(QNFE_EmiteITCod_Produto.Value,0,6));
        Imp.WriteXY(1.2,wCont,QNFE_EmiteITDesc_Produto.Value);
//        Imp.WriteXY(9.3,wCont,Bib.NumToTexto(QNFE_EmiteITQT_Quantidade.Value,2,6));
//        Imp.WriteXY(10.4,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Unitario.Value,2,13));
//        Imp.WriteXY(12.7,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value,2,17));
        if wContServico = 0 Then
          Imp.WriteXY(17.5,wCont,Bib.NumToTexto(wTotalISS,2,9) );
        if wContServico = 3 Then
          Imp.WriteXY(17.5,wCont,Bib.NumToTexto(wTotalServico,2,9));
      end;
      QNFE_EmiteIt.Next;
    end;
    if (wTotalISS > 0) And (wContServico = 0) Then
        Imp.WriteXY(17.5,wCont,Bib.NumToTexto(wTotalISS,2,9));
    If wTotalServico > 0 Then
        Imp.WriteXY(17.5,52,Bib.NumToTexto(wTotalServico,2,9));
    // *** Final dos Itens ****
    wCont := 56;
    Imp.WriteXY(0.5,wCont,Bib.NumToTexto(wbase_icm_tributada,2,18));
    Imp.WriteXY(4.5,wCont,Bib.NumToTexto(wvlr_icm,2,17));
    Imp.WriteXY(16.5,wCont,Bib.NumToTexto(wtotal_produtos - wTotalServico,2,20));
    wCont := 59;
    Imp.WriteXY(0.5,wCont,Bib.NumToTexto(QNFE_EmiteVAL_FRETE.Value,2,18));
    Imp.WriteXY(8.5,wCont,Bib.NumToTexto(QNFE_EmiteVAL_DESPESAS.Value,2,17));
    Imp.WriteXY(13,wCont,Bib.NumToTexto(wvlr_ipi,2,15));
    Imp.WriteXY(16.5,wCont,Bib.NumToTexto( wtotal_produtos
                                 +wvlr_ipi
                                 +QNFE_EmiteVAL_DESPESAS.Value
                                 -QNFE_EmiteVAL_Desconto.Value,2,20));
    wCont := 63;
    if Trim(QNFE_Emitenome_transp.Value) = '' then
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_Transportadora.Value)
    else
      Imp.WriteXY(0,wCont,QNFE_Emitenome_transp.Value);
    if QNFE_EmiteInd_Tipo_Frete.Value = 'FOB' Then
      Imp.WriteXY(11.7,wCont,'2') // Destinatário
    else
      Imp.WriteXY(11.7,wCont,'1'); // Emitente
    Imp.WriteXY(12.5,wCont,QNFE_EmiteDesc_Placa.Value);
    Imp.WriteXY(15.5,wCont,QNFE_Emitecgc_transp.Value);
    wCont := wCont+3;
    Imp.WriteXY(0,wCont,QNFE_Emiteend_transp.Value);
    Imp.WriteXY(10.7,wCont,QNFE_Emitecidade_transp.Value);
    Imp.WriteXY(14.8,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(15.5,wCont,QNFE_Emiteinsc_transp.Value);
    wCont := wCont + 3;
    Imp.WriteXY(0,wCont,QNFE_EmiteNUM_VOLUMES.Text);
    wCont := wCont + 4;
    Imp.WriteXY(1.5,wCont,QNFE_EmiteDESC_ENDERECO_ENTREGA.Text);
    wCont := wCont + 1;
    Imp.WriteXY(1.5,wCont,QNFE_EmiteDESC_CIDADE_ENTREGA.Text);
    wCont := wCont + 2;
    Imp.WriteXY(0,wCont,'Codigo Classificacao IPI Nr. 7.007.29.00');
    wCont := wCont + 1;
    Imp.WriteXY(0,wCont,QNFE_EmiteOBS.Value);
    Inc(wCont);
    if Trim(QNFE_EmiteOBS_COMPLEMENTO.Value) <> '' Then
    begin
      Imp.WriteXY(0,wCont,QNFE_EmiteOBS_COMPLEMENTO.Value);
      Inc(wCont);
    end;
    if Trim(QNFE_EmiteDesc_Mensagem.Value) <> '' Then
    begin
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_Mensagem.Value);
      Inc(wCont);
    end;
    if Trim(QNFE_EmiteDesc_COMPLEMENTO.Value) <> '' Then
    begin
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_COMPLEMENTO.Value);
      Inc(wCont);
    end;
    if wCont<=89 Then
      wCont := 90;
    Imp.WriteXY(17.5,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,6) );
  end;
end;
// final nota impressão Tempermed

Procedure TFNotaImpressao.Imp_Desconto(wLinha :Integer;wColuna:Real);
var wPos : Integer;
begin
  If DMNotaSaida.QNFE_EmiteDesc_Obs_Corpo_Nota.Text <> '' Then
  Begin
    wPos := 1;
    if(wEmpresa <> 'ARZ') then
      wLinha := wLinha + 2;
    While wPos <= Length(DMNotaSaida.QNFE_EmiteDesc_Obs_Corpo_Nota.Text) do
    Begin
      Inc(wLinha);
      if(wEmpresa <> 'ARZ') then
      begin
        Imp.WriteXY(wColuna,wLinha,Copy(DMNotaSaida.QNFE_EmiteDesc_Obs_Corpo_Nota.Text,wPos,100));
        wPos := wPos + 100;
      end
      else
      begin
        Imp.WriteXY(wColuna,wLinha,Copy(DMNotaSaida.QNFE_EmiteDesc_Obs_Corpo_Nota.Text,wPos,54));
        wPos := wPos + 54;
      end;
    End;
  End;
End;

Procedure TFNotaImpressao.Calc_Peso_Nota;
begin
  If (DMNotaSaida.QNFE_EmiteITInd_Tipo_Produto.Value = 'AGRICOLA') Or
     (DMNotaSaida.QNFE_EmiteITInd_Tipo_Produto.Value = 'ARROZ') Then
     wPeso := wPeso + DMNotaSaida.QNFE_EmiteITQT_Quantidade.Value
  Else
     wPeso := wPeso + DMNotaSaida.QNFE_EmiteITQT_Quantidade.Value * DMNotaSaida.QNFE_EmiteITNum_embalagem.Value;
End;

end.
