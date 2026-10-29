unit UNotaImpressao;

interface

Uses Dialogs, SysUtils, UBiblioteca,UFilial_cl,UMensagem_cl, Variants, Controls, RdPrint,StdCtrls, FORMS;

Type
  TFNotaImpressao = Class
  Private
    Procedure NFMoinho;
    Procedure NF_Video_Som;
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
//    Procedure Imp_Desconto(wLinha:Integer;wColuna : Real);
    Procedure Calc_Peso_Nota;
    Procedure NF_ARZ;
    Procedure NF_BRUSCHI;
    Procedure NF_COBRA;
//    Procedure NF_CAVALCA;
    Procedure NF_COZER;
    Procedure NF_LUNASA;
    Procedure IMP_OBSERVACAO;
    Procedure IMP_OBS_CORPO_NOTA(wCol : Real; var wCont : Integer);
    Procedure ProcuraNBM;
    Procedure LimpaTbNbm;
    Procedure NF_ABATE;
    Procedure NF_LIMP;
    Procedure Rodape_Faville_Zadimel;
    Procedure NF_SETIMO;
    Procedure NF_RCI;
    Procedure NF_PUBLICAR;
    Procedure NF_MEDIPECAS;
    Procedure NF_GRAZAPEL;
    Procedure NF_BORGES;
    Procedure NF_DINIZ;
    Procedure NF_FAZENDA;
    Procedure NF_SAFARI;
    Procedure NF_GRASEL;
    Procedure NF_TRENTO;
    Procedure NF_DAMBONI;
    Procedure NF_INSIDE;
    Procedure NF_TRIPAR;
    Procedure NF_FAZENDA1(RDPrint : TRDPrint);
    procedure NF_FIBRATIVE;
    procedure NF_CELEIRO;//TBEM É FIBRATIVE
    Procedure NF_ITAIPU;
    Procedure NF_INJEPAR;

  Public
    Procedure EmiteNF(wCodNF:Integer; wTipo: String = '');
    Procedure EmiteNFRDPrint(wCodNF:Integer; RDPrint : TRDprint);
    Procedure EmiteComprovanteEntrega(pPagto,pProximo : String);
    Procedure EmiteGuia;
    Procedure setFlagAgricola(flag :Boolean);
end;

var
  FNotaImpressao : TFNotaImpressao;
  wEmpresa, wTransgenico, wCod_Mens, wMsgTributacao : string;
  wMensCorpoNota : Char;
  wCont,wContNBM,wNotaGlobal,wContLinha : Integer;
  wbase_icm_tributada, wvlr_icm, wtotal_produtos, wvlr_ipi, wPeso, wPesoBruto, wBase_Subst, wIcms_Subst, wDesc_Transgenicos,wFunrural,wVolumes : Real;
  wTb_Nbm : Array[1..10] of String;
  wLinha1, wLinha2, wLinha3, wLinha4 : string;
  wFlagAgricola : Boolean = false; //variavel utilizada para saber se a chamada da UnotaImpressao foi feita pelo agricola

Const
  wBranco : String = '                                                                                                                            ';

implementation

Uses UOracle_cl, UNotaSaida_cl, UNotaEntrada_cl, UCadastro_cl,UParamSistema_cl,
  UContasReceber_cl, UPromissoria, UOperacao_cl, UGuiaTransito_cl, UNotaRDPrint,
  DB, URPedido, UTRelSimples, UNfeImpressao, UTipoNota;

//seta a variavel wFlagAgricola, esta variável é usada
//para saber se a chamada foi feita pelo modulo agricola
//e esta sendo gerado lotes de nf-e  
Procedure TFNotaImpressao.setFlagAgricola(flag :Boolean);
begin
  wFlagAgricola := flag;
end;

Procedure TFNotaImpressao.EmiteNF(wCodNF:Integer; wTipo: String = ''); //wTipo serve para nao exibir tela FTipoNota
var wTipoDocumento,wLpt_Nota,wLpt_Pedido,wComando,wChaveAcesso,wTipoNota : String;
  RDPrint : TRDprint;
begin
  // *** Emissão de Nota Fiscal *** \\
  wEmpresa := DMParamSistema.QParamSistemaCOD_EMPRESA.Value;
  wTipoDocumento := DMOracle.BuscaNome('SELECT IND_EMITE FROM TB_OPERACAO, TB_NOTA_CAB',
                    'TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
                   +' AND TB_NOTA_CAB.COD_NOTA_CAB = '+FloatToStr(wCodNF));
  DMNotaSaida.SetaEmissao(wCodNF);
  wLpt_Nota := DMOracle.BuscaNome('SELECT DESC_LPT_NOTA FROM TB_FILIAL', 'COD_FILIAL = '+FloatToStr(DMNotaSaida.QNFE_EmiteCod_Filial.Value));
  wLpt_Pedido := DMOracle.BuscaNome('SELECT DESC_LPT_PEDIDO FROM TB_FILIAL', 'COD_FILIAL = '+FloatToStr(DMNotaSaida.QNFE_EmiteCod_Filial.Value));
  If DMNotaSaida.QNFE_EmiteIND_SITUACAO.Value <> '2' Then
     Raise Exception.Create('Esta Nota não foi confirmada!');
  wMensCorpoNota := 'N';
  wPeso := 0; // inicializa variavel utilizado na procedure calc_Peso_nota
  wPesoBruto := 0;
  wDesc_Transgenicos := 0;
  If DMNotaSaida.QNFE_EmiteInd_Entrada_Saida.Value = 'E' Then
   begin
     wbase_icm_tributada := DMNotaEntrada.QSomaItemNotaSVal_ICM_Base.Value;
     wvlr_icm := DMNotaEntrada.QSomaItemNotaSVal_ICM.Value;
     wtotal_produtos := DMNotaEntrada.QSomaItemNotaSVal_Total.Value;
     wvlr_ipi := DMNotaEntrada.QSomaItemNotaSVal_Ipi.Value;
     wDesc_Transgenicos := DMNotaEntrada.QSomaItemNotasVal_Dpi_Transgenicos.Value;
     wBase_Subst:=0;
     wIcms_Subst:=0;
  end
  else
  begin
//    DMNotaSaida.QNotaSaida.Close;
    DMNotaSaida.QSomaItemNota.Close;
    DMNotaSaida.QSomaItemNota.Master := Nil; // FEITO PELO CESAR PARA NAO ACESSAR O QNOTASAIDA (ESTAVA DANDO OPEN)
    DMNotaSaida.QSomaItemNota.MasterFields := '';
    DMNotaSaida.QSomaItemNota.DetailFields := '';
    DMNotaSaida.QSomaItemNota.SetVariable('COD_NOTA_CAB',DMNotaSaida.QNFE_EmiteCOD_NOTA_CAB.Value);
//    DMNotaSaida.QNotaSaida.Open;
    DMNotaSaida.QSomaItemNota.Open;
    wbase_icm_tributada := DMNotaSaida.QSomaItemNotaSVal_ICM_Base.Value;
    wvlr_icm := DMNotaSaida.QSomaItemNotaSVal_ICM.Value;
    wtotal_produtos := DMNotaSaida.QSomaItemNotaSVal_Total.Value;
    wvlr_ipi := DMNotaSaida.QSomaItemNotaSVal_Ipi.Value;
    wBase_Subst:=DMNotaSaida.QSomaItemNotaSVal_Base_Subst.Value;
    wIcms_Subst:=DMNotaSaida.QSomaItemNotaSVal_Icms_Subst.Value;
    DMNotaSaida.QSomaItemNota.Close;
    DMNotaSaida.QSomaItemNota.Master := DMNotaSaida.QNotaSaida;
    DMNotaSaida.QSomaItemNota.MasterFields := 'COD_NOTA_CAB';
    DMNotaSaida.QSomaItemNota.DetailFields := 'COD_NOTA_CAB';
  end;
  wCod_Mens := '';
  if Imp = Nil Then
     Imp := TImp.Create;
  if wTipoDocumento = 'F' Then // Nota Fiscal
  begin
    if wTipo <> '' then
      wTipoNota := wTipo
    else
      wTipoNota := DMOracle.BuscaNome('SELECT IND_TIPO_NOTA FROM TB_FILIAL', 'COD_FILIAL = ' + DMNotaSaida.QNFE_EmiteCOD_FILIAL.Text);
    wChaveAcesso := '';
    if wTipoNota = 'AMBAS' then
    begin
      if FTipoNota = Nil then
        FTipoNota := TFTipoNota.Create(Application);
      FTipoNota.ShowModal;
      wTipoNota := FTipoNota.TipoNota;
    end;
    if wTipoNota = 'ELETRONICA' then
    begin
      NfeImpressao.setFlagAgricola(wFlagAgricola);
      wChaveAcesso := NfeImpressao.GeraXML
    end
    else
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
      //Imp.ConfiguraImpressora('CONDENSADO_ON','SEXTOS',66);
      if wEmpresa = 'NIR' Then
      begin
        Imp.ConfiguraImpressora('CONDENSADO_ON','OITAVOS',66);
        FNotaImpressao.NF_NIR;
      end;
      if wEmpresa = 'BRASIL' Then
      begin
        Imp.ConfiguraImpressora('CONDENSADO_ON','OITAVOS',68);
        FNotaImpressao.NFBrasil;
      end;
      if wEmpresa = 'MOINHO' Then
      begin
        Imp.ConfiguraImpressora('CONDENSADO_ON','OITAVOS',104);
        FNotaImpressao.NFMoinho;
      end;
      if wEmpresa = 'ITAIPU' Then
      begin
        Imp.ConfiguraImpressora('CONDENSADO_ON','OITAVOS',88);
        FNotaImpressao.NF_ITAIPU;
      end;
      if wEmpresa = 'VIDEOSOM' Then   // AB CÓMERCIO DE INSUMOS LTDA.
      begin
        Imp.ConfiguraImpressora('CONDENSADO_ON','OITAVOS',68);
        FNotaImpressao.NF_VIDEO_SOM;
      end;
      if wEmpresa = 'CGS' Then
      begin
        Imp.ConfiguraImpressora('CONDENSADO_ON','OITAVOS',88);
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
        //Imp.ConfiguraImpressora('CONDENSADO_ON','OITAVOS',68);
        //FNotaImpressao.NF_GONZATTI;
        Imp.ConfiguraImpressora('CONDENSADO_ON','OITAVOS',104);
        FNotaImpressao.NF_GONZATTI;
      end;
      if wEmpresa = 'MEDIBENS' Then
      begin
        Imp.ConfiguraImpressora('CONDENSADO_ON','SEXTOS',72);
        FNotaImpressao.NF_MEDIBENS;
      end;
      if wEmpresa = 'ARZ' Then
      begin
        Imp.ConfiguraImpressora('CONDENSADO_ON','OITAVOS',68);
        FNotaImpressao.NF_ARZ;
      end;
      if wEmpresa = 'TEMPERMED' Then
      begin
        Imp.ConfiguraImpressora('CONDENSADO_ON','OITAVOS',96);
        FNotaImpressao.NF_TEMPERMED;
      end;
      if wEmpresa = 'BRUSCHI' Then
      begin
        Imp.ConfiguraImpressora('CONDENSADO_ON','OITAVOS',68);
        FNotaImpressao.NF_BRUSCHI;
      end;
      if wEmpresa = 'COBRA' Then
      begin
        Imp.ConfiguraImpressora('CONDENSADO_ON','OITAVOS',64);
        FNotaImpressao.NF_COBRA;
      end;
      if wEmpresa = 'COZER' Then
      begin
        Imp.ConfiguraImpressora('CONDENSADO_ON','OITAVOS',68);
        FNotaImpressao.NF_COZER;
      end;
      if wEmpresa = 'LUNASA' Then
      begin
        Imp.ConfiguraImpressora('CONDENSADO_ON','OITAVOS',88);
        FNotaImpressao.NF_LUNASA;
      end;
      if wEmpresa = 'ABATE' Then
      begin
        Imp.ConfiguraImpressora('CONDENSADO_ON','OITAVOS',96);
        FNotaImpressao.NF_ABATE;
      end;
      if wEmpresa = 'LIMP' then
      begin
        Imp.ConfiguraImpressora('CONDENSADO_ON','OITAVOS',64);
        FNotaImpressao.NF_LIMP;
      end;
      if wEmpresa = 'SETIMO' Then
      begin
        Imp.ConfiguraImpressora('CONDENSADO_ON','OITAVOS',95);
        FNotaImpressao.NF_SETIMO;
      end;
      if wEmpresa = 'PUBLICAR' Then
      begin
        if DMNotaSaida.QNFE_EmiteCOD_FILIAL.Value = 1 then
        Begin
          Imp.ConfiguraImpressora('CONDENSADO_ON','SEXTOS',70);
          FNotaImpressao.NF_PUBLICAR;
        End
        else
        Begin
          Imp.ConfiguraImpressora('CONDENSADO_ON','SEXTOS',72); //era 71
          FNotaImpressao.NF_RCI;
        End
      end;
      if wEmpresa = 'MEDIPECAS' then
      begin
        Imp.ConfiguraImpressora('CONDENSADO_ON','OITAVOS', 88);
        FNotaImpressao.NF_MEDIPECAS;
      end;
      if wEmpresa = 'GRAZAPEL' then
      begin
        Imp.ConfiguraImpressora('CONDENSADO_ON','SEXTOS',71);
        FNotaImpressao.NF_GRAZAPEL;
      end;
      if wEmpresa = 'BORGES' then
      begin
        Imp.ConfiguraImpressora('CONDENSADO_ON','OITAVOS',68);
        FNotaImpressao.NF_BORGES;
      end;
      if wEmpresa = 'DINIZ' then
      begin
        Imp.ConfiguraImpressora('CONDENSADO_ON','OITAVOS',68);
        FNotaImpressao.NF_DINIZ;
      end;
      if wEmpresa = 'INSIDE' then
      begin
        Imp.ConfiguraImpressora('CONDENSADO_ON','OITAVOS',64);
        FNotaImpressao.NF_INSIDE;
      end;
      if wEmpresa = 'FAZENDA' then
      begin
        Imp.ConfiguraImpressora('CONDENSADO_ON','OITAVOS',89);
        FNotaImpressao.NF_FAZENDA;
      end;
      if wEmpresa = 'SAFARI' then
      begin
        Imp.ConfiguraImpressora('CONDENSADO_ON','SEXTOS',66);
        FNotaImpressao.NF_SAFARI;
      end;
      if wEmpresa = 'GRASEL' Then   // grasel entre rios
      begin
        Imp.ConfiguraImpressora('CONDENSADO_ON','OITAVOS',64);
        FNotaImpressao.NF_GRASEL;
      end;
      if wEmpresa = 'FAZENDA1' then
      begin
        if FNotaRDPrint = Nil then
          FNotaRDPrint := TFNotaRDPrint.Create(Application);
        RDPrint := TRDPrint.Create(FNotaRDPrint);
        EmiteNFRDPrint(wCodNF, RDPrint);
      end;
      if wEmpresa = 'TRENTO' then
      begin
        Imp.ConfiguraImpressora('CONDENSADO_ON','OITAVOS', 65);
        FNotaImpressao.NF_TRENTO;
      end;
      if wEmpresa = 'DAMBONI' then
      begin
        Imp.ConfiguraImpressora('CONDENSADO_ON','OITAVOS', 68);
        FNotaImpressao.NF_DAMBONI;
      end;
      if wEmpresa = 'TRIPAR' then
      begin
        Imp.ConfiguraImpressora('CONDENSADO_ON','OITAVOS', 98);
        FNotaImpressao.NF_TRIPAR;
      end;  
      if wEmpresa = 'FIBRATIVE' then
      begin
        Imp.ConfiguraImpressora('CONDENSADO_ON','OITAVOS',68);
        FNotaImpressao.NF_FIBRATIVE;
      end;
      if wEmpresa = 'CELEIRO' then
      begin
        Imp.ConfiguraImpressora('CONDENSADO_ON','OITAVOS',68);
        FNotaImpressao.NF_CELEIRO;
      end;
      if wEmpresa = 'INJEPAR' then
      begin
        Imp.ConfiguraImpressora('CONDENSADO_ON','OITAVOS',104);
        FNotaImpressao.NF_INJEPAR;
      end;
    end;
    try
      With DMOracle do
      Begin
        QExecSQL.Close;
        QExecSQL.SQL.Clear;
        wComando := 'UPDATE TB_NOTA_CAB SET IND_TIPO_NOTA = ' + QuotedStr(wTipoNota) + ', ';
        wComando := wComando + ' DESC_CHAVE_ACESSO = ' + QuotedStr(wChaveAcesso) +' WHERE '+
          'COD_NOTA_CAB = ' + IntToStr(wCodNF);
        QExecSQL.SQL.Add(wComando);
        QExecSQL.ExecSQL;
        If DMOracle.DBCemapa.InTransaction then
           DMOracle.DBCemapa.Commit;
      End;
    except
      DMOracle.DBCemapa.Rollback;
    end;
  end // Nota Fiscal
  else
  begin
    if Trim(wLpt_Pedido) = 'LPT1' then
       Imp.AbreImpressora
    else if Trim(wLpt_Pedido) = 'LPT2' then
            Imp.AbreImpressora_Lpt2
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
  if (wTipoDocumento[1] in ['P','O','F','R']) and not ((wTipoDocumento = 'F') and (wTipoNota = 'ELETRONICA')) Then
    if DMOracle.BuscaNome('SELECT IND_IMPRIME_PEDIDO FROM TB_FILIAL', 'COD_FILIAL = ' + DMNotaSaida.QNFE_EmiteCOD_FILIAL.Text) <> 'DESKJET' then
      If wEmpresa <> 'FAZENDA1' Then
      Begin
        Imp.SaltaPagina;
        Imp.ConfiguraImpressora('CONDENSADO_OFF','SEXTOS',66);
        Imp.FechaImpressora;  // Finaliza os serviços de Impressao
      end;
  With DMNotaSaida do
  Begin
    QNFE_Emite.Close;
    QNFE_EmiteIT.Close;
  end;
end;

Procedure TFNotaImpressao.EmiteComprovanteEntrega(pPagto,pProximo : String);
begin
  if Imp = Nil Then
     Imp := TImp.Create;
  Imp.AbreImpressora;
  With DMNotaSaida do
  Begin
    QNFE_Emite.Close;
    QNFE_Emite.SetVariable('Cod_Nota_Cab',QNFE_EmiteCod_Nota_Cab.Value);
    QNFE_Emite.Open;
    wCont := 0;
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
    Imp.WriteXY(0,wCont,'________________________________________');
    Inc(wCont);
    Imp.WriteXY(0,wCont,'Proximo a:'+pProximo);
    Inc(wCont);
    Imp.WriteXY(0,wCont,'Observacao:'+pPagto);
    wCont := wCont + 6;
    Imp.WriteXY(0,wCont,'');
  End;
  Imp.FechaImpressora;  // Finaliza os serviços de Impressao
End;

Procedure TFNotaImpressao.NFMoinho;
var wContReceber : Byte;
    wDesconto,wFacs,wFethab : Real;
    wExtenso, wLinhaExt1, wLinhaExt2, wEndereco,wNota_Dev : String;
begin
  // *** Emissão de Nota Fiscal para o Moinho Iguaçu
  // *** OBS - Colocar Posicao X em Centimetros
  wCont := 2;
  wTransgenico := 'NAO';
  With DMNotaSaida do
  Begin
    wFacs := 0;
    wFethab := 0;
    wNotaGlobal := 0;
    while wNotaGlobal < 2 do
    begin
      if wNotaGlobal = 1 then // SE A NOTA FOR CONTINUAÇÃO ESCREVE NA NOTA
      begin
        wCont := 2;
        Imp.WriteXY(11,wCont,'CONTINUACAO');
      end;
    //wCont := 3;
    WnotaGlobal := 2;
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
    if QNFE_EmiteIND_FISICA_JURIDICA.Value = 'F' then    // A pedido de Joao J, moinho, 03/02/2009
    begin
      If Trim(QNFE_EmiteDESC_INSCRICAO_MUNICIPAL.Value) <> '' Then
        Imp.WriteXY(14,wCont,QNFE_EmiteDESC_INSCRICAO_MUNICIPAL.Value)
      Else
        Imp.WriteXY(14,wCont,QNFE_EmiteNUM_INSCRICAO.Value);
    end
    else
    begin
      If Trim(QNFE_EmiteNUM_INSCRICAO.Value) <> '' Then
        Imp.WriteXY(14,wCont,QNFE_EmiteNUM_INSCRICAO.Value)
      Else
        Imp.WriteXY(14,wCont,QNFE_EmiteDESC_INSCRICAO_MUNICIPAL.Value);
    end;
    Imp.WriteXY(18,wCont,TimeToStr(Time));
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
    wFunrural := 0;
    If QNFE_EmiteInd_Funrural.Value = 'S' Then
       wFunrural := QNFE_Emiteval_funrural.Value;
    If QNFE_EmiteInd_Fixar_Empresa.Value = 'F' Then
       wExtenso := Bib.Extenso(wtotal_produtos + wvlr_ipi - wFunrural - wDesc_Transgenicos - QNFE_EmiteVal_Desconto_Fitas.Value,'REAL')
    else
       wExtenso := Bib.Extenso(wtotal_produtos + wvlr_ipi - QNFE_EmiteVal_Desconto.Value + QNFE_EmiteVal_Despesas.Value
                               - wFunrural - QNFE_EmiteVal_Desconto_Fitas.Value,'REAL');
    Bib.QuebraString(wExtenso,118,wLinhaExt1,wLinhaExt2,'*');
    wCont := wCont + 3;
    If QNFE_EmiteInd_Fixar_Empresa.Value = 'F' Then
       Imp.WriteXY(0,wCont,'(R$' + Bib.NumToTexto(wtotal_produtos + wvlr_ipi - wFunrural - wDesc_Transgenicos,2,15)+')')
    Else
       Imp.WriteXY(0,wCont,'(R$' + Bib.NumToTexto(wtotal_produtos
                                 +wvlr_ipi - QNFE_EmiteVal_Desconto.Value + QNFE_EmiteVal_Despesas.Value
                                 -wFunrural,2,15)+')');
    Imp.WriteXY(2.5,wCont,wLinhaExt1);
    Inc(wCont);
    Imp.WriteXY(0,wCont,wLinhaExt2+'******************');
    wCont := wCont + 2;
    Imp.WriteXY(0,wCont,'Nome Fantasia:'+QNFE_EmiteDESC_FANTASIA.Text);
    wCont := 47;
    // **** Itens ****
    wCont := 48;       //---POSICIONA NA LINHA 24
    wContLinha := 0;   //CONTROLA A QUANTIA DE ITENS POR NOTA (MAXIMO 13 ITENS POR NOTA)

    If wNotaGlobal = 0 then
       QNFE_EmiteIt.First;

    While Not QNFE_EmiteIt.Eof do
    Begin
      QLoteProduto.Close;
      QLoteProduto.SetVariable('COD_PRODUTO', QNFE_EmiteItCOD_PRODUTO.Value);
      QLoteProduto.open;

      Inc(WContLinha);
      Inc(wCont);
      Imp.WriteXY(0,wCont,Bib.NumToTexto(QNFE_EmiteITCod_Produto.Value,0,6));
      Imp.WriteXY(1.5,wCont,QNFE_EmiteITDesc_Produto.Value);
      If (QNFE_EmiteItInd_Tipo_Produto.Value = 'AGRICOLA') And
         (QNFE_EmiteItCod_Lote_Tipo.Value > 1) Then
        Imp.WriteXY(7.8,wCont,QNFE_EmiteITCod_Lote_Tipo.Text);
      Imp.WriteXY(8.4,wCont,QNFE_EmiteITNum_Romaneio.Text);
      If QNFE_EmiteITNum_Nota_Produtor.Text <> ''  Then
        Imp.WriteXY(9.8,wCont,QNFE_EmiteITNum_Nota_Produtor.Text)
      Else
        Imp.WriteXY(9.8,wCont,QNFE_EmiteITNum_Nota_Produtor_Rom.Text);
      Imp.WriteXY(11,wCont,QNFE_EmiteITDesc_Situacao_Trib.Value);
      Imp.WriteXY(11.7,wCont,QNFE_EmiteITDesc_Unidade.Value);
      Imp.WriteXY(12.5,wCont,Bib.NumToTexto(QNFE_EmiteITQT_Quantidade.Value,2,10));
      If (QNFE_EmiteInd_Fixar_Empresa.Value <> 'F') Then
       Begin
         If QNFE_EmiteITQT_Quantidade.Value > 0 Then
           wDesconto := QNFE_EmiteITVal_Desconto.Value / QNFE_EmiteITQT_Quantidade.Value
         else
           wDesconto := QNFE_EmiteITVal_Desconto.Value;
         If QNFE_EmiteITPerc_Desc.Value > 0 Then
           wDesconto := wDesconto + QNFE_EmiteITVal_Unitario.Value / ((100 - QNFE_EmiteITPerc_Desc.Value) / 100) - QNFE_EmiteITVal_Unitario.Value;
       End
      Else
        wDesconto := 0;

      if QNFE_EmiteCOD_OPERACAO.Value = 201 then //quando for a operacao 201 o valor unitario deve ser com 5 casas após a virgula -- Fabiano 18/11/2005
        Imp.WriteXY(14.3,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value / QNFE_EmiteItQT_QUANTIDADE.Value * QNFE_EmiteItNUM_EMBALAGEM.Value ,5,12))
      else
        Imp.WriteXY(14.3,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Unitario.Value + wDesconto,3,12));

      If (wDesconto > 0) And
         (QNFE_EmiteInd_Fixar_Empresa.Value <> 'F') Then
         Imp.WriteXY(16.5,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value + wDesconto * QNFE_EmiteITQT_Quantidade.Value,2,15))
      Else
         Imp.WriteXY(16.5,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value,2,15));
      If QNFE_EmiteITPerc_Tributado_Nota.Text <> '' Then
        Imp.WriteXY(19.5,wCont,QNFE_EmiteITPerc_Tributado_Nota.Text)
      Else
        Imp.WriteXY(19.5,wCont,QNFE_EmiteITPerc_Aliquota.Text);

      If (wDesconto > 0) And
         (QNFE_EmiteInd_Fixar_Empresa.Value <> 'F') Then
      Begin
        Inc(wCont);
        Inc(WContLinha);
        Imp.WriteXY(11.7,wCont,'Desconto:');
        Imp.WriteXY(16.5,wCont,Bib.NumToTexto(wDesconto * QNFE_EmiteITQT_Quantidade.Value,2,15));
      End;

// =============================================================================
      if ((not QLoteProduto.IsEmpty) and (not QLoteProdutoCOD_CADASTRO.IsNull)) then
      Begin
        Inc(wCont);
        Inc(WContLinha);
        if ((not QLoteProdutoDESC_RENASEN.IsNull) or (not QLoteProdutoCOD_CADASTRO.IsNull)) then
        Begin
          Imp.WriteXY(0, wCont, '-------------------- Dados dos Produtores --------------------');
          Inc(wCont);
          Inc(WContLinha);
        End;
        if not QLoteProdutoDESC_RENASEN.IsNull then
          Imp.WriteXY(0, wCont, 'Renasen');
        if not QLoteProdutoCOD_CADASTRO.IsNull then
          Imp.WriteXY(3, wCont, 'Produtor');
        if not QLoteProdutoCOD_CADASTRO.IsNull then
          Imp.WriteXY(12, wCont, 'CPF/CNPJ');
        if ((not QLoteProdutoDESC_RENASEN.IsNull) or (not QLoteProdutoCOD_CADASTRO.IsNull)) then
        Begin
          Inc(wCont);
          Inc(WContLinha);
        End;
        if not QLoteProdutoDESC_RENASEN.IsNull then
          Imp.WriteXY(0, wCont, QLoteProdutoDESC_RENASEN.Value);
        if not QLoteProdutoCOD_CADASTRO.IsNull then
          Imp.WriteXY(3, wCont, Copy(QLoteProdutoNOME.Value, 1, 55));
        if not QLoteProdutoCOD_CADASTRO.IsNull then
          Imp.WriteXY(12, wCont, QLoteProdutoNUM_CGC_CPF.Value);
        if (not QLoteProdutoCOD_CADASTRO.IsNull) then

        wEndereco := '';
        if not QLoteProdutoDESC_ENDERECO.IsNull then
        Begin
          wEndereco := wEndereco + QLoteProdutoDESC_ENDERECO.Value;
          if not QLoteProdutoNUM_CAIXA_POSTAL.IsNull then
          Begin
            wEndereco := wEndereco + ' - Cx Postal' + IntToStr(QLoteProdutoNUM_CAIXA_POSTAL.Value);
          End;
        End;
        if not QLoteProdutoDESC_CIDADE.IsNull then
          wEndereco := wEndereco + ' - ' + QLoteProdutoDESC_CIDADE.Value;
        if not QLoteProdutoDESC_SIGLA_ESTADO.IsNull then
          wEndereco := wEndereco + ' - ' + QLoteProdutoDESC_SIGLA_ESTADO.Value;

        if wEndereco <> '' then
        Begin
          Inc(wCont);
          Inc(WContLinha);
          Imp.WriteXY(3, wCont, Copy(wEndereco, 1, 55));
        End;
      End;
// =============================================================================

      Calc_Peso_Nota;   // calculo do peso produto
      If QNFE_EmiteItDESC_COMPLEMENTO.Value <> '' Then
      Begin   // ** Imprimir Complemento de Descrição
        Inc(wCont);
        Inc(WContLinha);
        Imp.WriteXY(1.5,wCont,QNFE_EmiteITDesc_Complemento.Value);
      End;
      // este teste é apenas para imprimir mensagem da ACCO
      If QNFE_EmiteItInd_Tipo_Embalagem.Value <> '' Then
         wMensCorpoNota := 'S';
      If (QNFE_EmiteItInd_Imprime_NF.Value = 'S') And (QNFE_EmiteItDesc_Observacao.Value <> '') Then
      Begin   // ** Imprimir Informações do Lote
          Inc(wCont);
          Inc(WContLinha);
          Imp.WriteXY(1.5,wCont,' OBS:');
          Imp.WriteXY(1.8,wCont,QNFE_EmiteItDesc_Observacao.Value);
      End;
      If (QNFE_EmiteItInd_Tipo_Produto.Value = 'AGRICOLA') or (QNFE_EmiteItInd_Tipo_Produto.Value = 'ARROZ')then
      Begin // Preco de produtos agrícolas em Sacas
        Inc(wCont);
        Inc(WContLinha);
        Imp.WriteXY(14.3,wCont,'Preco P/ '+FloatToStr(QNFE_EmiteItNum_Embalagem.Value)+' Kg');
      End;
      If (QNFE_EmiteItDesc_Germinacao.Value <> '') Or (QNFE_EmiteItDesc_Pureza.Value <> '') Or (QNFE_EmiteItDt_Vencto_Lote.Text <> '') Or
         (QNFE_EmiteItDesc_Atestado.Value <> '') Or (QNFE_EmiteItDesc_Validade.Value <> '') Or (QNFE_EmiteItDesc_Peneira.Value <> '') Then
      Begin   // ** Imprimir Informações do Lote
        Inc(wCont);
        Inc(wContLinha);
        Imp.WriteXY(0,wCont,'Lote:');
        Imp.WriteXY(0,wCont,QNFE_EmiteItDesc_Lote.Value);
        Imp.WriteXY(0,wCont,' Germ.:');
        Imp.WriteXY(0,wCont,QNFE_EmiteItDesc_Germinacao.Value);
        Imp.WriteXY(0,wCont,' Pureza:');
        Imp.WriteXY(0,wCont,QNFE_EmiteItDesc_Pureza.Value);
        Imp.WriteXY(0,wCont,QNFE_EmiteItDesc_Tipo_Semente.Value);  // este campo é uma descrição
        Imp.WriteXY(0,wCont,'  Nr.'+QNFE_EmiteItDesc_Atestado.Value);
        Imp.WriteXY(0,wCont,' Validade:');
        Imp.WriteXY(0,wCont,QNFE_EmiteItDesc_Validade.Value);
        Imp.WriteXY(0,wCont,' Peneira:');
        Imp.WriteXY(0,wCont,QNFE_EmiteItDesc_Peneira.Value);
        If QNFE_EmiteItDt_Vencto_Lote.Text <> '' Then
          Imp.WriteXY(0,wCont,' Validade:'+QNFE_EmiteItDt_Vencto_Lote.Text);
      End;
      If QNFE_EmiteItDesc_Observacao_Tr.Text <> '' Then
      Begin   // ** Imprimir Observacao da tributacao
        Inc(wCont);
        Inc(WContLinha);
        Imp.WriteXY(1.5,wCont,QNFE_EmiteITDesc_Observacao_Tr.Value);
      End;
      If QNFE_EmiteItInd_Cesta_Basica.Value = 'SIM' Then // produto transgenico
         wTransgenico := 'SIM';
      If (QNFE_EmiteItCod_Mensagem.Text <> '') And (QNFE_EmiteItCod_Mensagem.Value <> 0) Then
         wCod_Mens := QNFE_EmiteItCod_Mensagem.Text;
      wFacs := wFacs + QNFE_EmiteItVal_Facs.Value;
      wFethab := wFethab + QNFE_EmiteItVal_Fethab.Value;
      QNFE_EmiteIT.Next;

      If (wContLinha >= 14) and (not QNFE_EmiteIT.eof) then
        Begin
          wCont := 72; //A MESMA POSICAO DO [VALOR TOTAL DOS PRODUTOS]
          Imp.WriteXY(16,wCont,'CONTINUA');
          wNotaGlobal := 1;
          Imp.SaltaPagina;
          Break;
        End;
    End;
    End;
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
    // Imprime DPI (transgenicos)
    If wDesc_Transgenicos <> 0 Then
     Begin
       wCont := wCont + 2;
       Imp.WriteXY(1.5,wCont,'Desconto DPI - Transgenicos');
       Imp.WriteXY(16.5,wCont,Bib.NumToTexto(wDesc_Transgenicos,2,15));
     End;
    if QNFE_EmiteVal_Desconto_Fitas.Value > 0 then
     begin
       Inc(wCont);
       Imp.WriteXY(1.5,wCont,'Desconto Fitas Teste Transgenico:');
       Imp.WriteXY(16.5,wCont,Bib.NumToTexto(QNFE_EmiteVal_Desconto_Fitas.Value,2,15));
     end;
    If wCod_Mens <> '' Then
       IMP_OBSERVACAO;  // imprimir observacao da classe do produto
    // *** Final dos Itens ****
    IMP_OBS_CORPO_NOTA(1.5, wCont);
    If (wCont <= 63) And (wMensCorpoNota = 'S') And ((QNFE_EmiteInd_Vendas.Value = 'V') or (QNFE_EmiteInd_Futura_Cliente.Value = 'S')) Then
     If QNFE_EmiteCOD_FILIAL.Value <> 5 Then
      Begin
        Imp.WriteXY(0,64,'Endereco para entrega de embalagens vazias(triplice lavadas): Estrada para escola agricola Meu Cantinho');
        Imp.WriteXY(0,65,'Linha Tres Fazendas - Santa Terezinha de Itaipu - PR');
        Imp.WriteXY(0,66,'E Obrigatorio a apresentacao desta NF ou copia no momento da entrega das embalagens vazias, acompanhada da NF de produtor');
      End
     Else
      Begin
        Imp.WriteXY(0,64,'Recebimento embalagens de agrotoxicos ADDAV - PR - Rodovia PR486 Km 11');
        Imp.WriteXY(0,65,'Espigao Azul - Cascavel - PR');
      End;
    wCont := 70;
    Imp.WriteXY(0,wCont,Bib.NumToTexto(wbase_icm_tributada,2,13));
    Imp.WriteXY(4,wCont,Bib.NumToTexto(wvlr_icm,2,13));
    Imp.WriteXY(16,wCont,Bib.NumToTexto(wtotal_produtos,2,15));
    wCont := wCont + 2;
    Imp.WriteXY(0,wCont,Bib.NumToTexto(QNFE_EmiteVAL_FRETE.Value,2,13));
    Imp.WriteXY(8,wCont,Bib.NumToTexto(QNFE_EmiteVAL_DESPESAS.Value,2,13));
    Imp.WriteXY(12,wCont,Bib.NumToTexto(wvlr_ipi,2,13));
    Imp.WriteXY(16,wCont,Bib.NumToTexto(wtotal_produtos
                                 +wvlr_ipi
                                 +QNFE_EmiteVAL_DESPESAS.Value
                                 -QNFE_EmiteVAL_Desconto.Value
                                 -wFunrural
                                 -wDesc_Transgenicos
                                 -QNFE_EmiteVal_Desconto_Fitas.Value,2,15));
    wCont := wCont + 4;
    If Trim(QNFE_Emitenome_transp.Value) = '' then
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
    Imp.WriteXY(14.5,wCont,Bib.NumToTexto(wPesoBruto,2,11));
    if QNFE_Emiteqt_beneficiado.Value > 0 Then
       Imp.WriteXY(18,wCont,QNFE_Emiteqt_beneficiado.Text)
    else
       Imp.WriteXY(18,wCont,Bib.NumToTexto(wPeso,2,11));
    wCont := wCont + 3;
    if wFunrural > 0 Then
    begin
      Imp.WriteXY(0.5,wCont,Bib.NumToTexto(wFunrural,2,13));
      Imp.WriteXY(3.4,wCont,QNFE_EmitePERC_FUNRURAL.Text);
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
    Inc(wCont);
    If QNFE_EmiteCOD_NOTA_CAB_DEV_FIXAR.Text <> '' Then    // Acrescentado dia 18/12/2008 pelo César
     Begin
       wNota_Dev := DMOracle.BuscaNome('Select NUM_NOTA from Tb_Nota_Cab','Cod_Nota_Cab='+QNFE_EmiteCOD_NOTA_CAB_DEV_FIXAR.Text);
       Inc(wCont);
       Imp.WriteXY(4,wCont,'Compra Ref NF Devolucao:'+wNota_Dev);
     End;
    If (wFacs > 0) or (wFethab > 0) Then
       Imp.WriteXY(10,wCont,'Facs:'+Bib.NumToTexto(wFacs,2,9)+ '  Fethab:'+Bib.NumToTexto(wFethab,2,9));
    Inc(wCont);
    if wTransgenico = 'SIM' then
      Imp.WriteXY(4,wCont,'Esta carga contem soja ROUNDUP READY');
    Inc(wCont);
    If QNFE_EmiteCod_Cadastro_Parceiro.Text <> '' Then
       Imp.WriteXY(4,wCont,'Parceria:'+QNFE_EmiteCod_Cadastro_Parceiro.Text+' - '+DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = ' + QNFE_EmiteCod_Cadastro_Parceiro.Text));
    wCont := wCont + 4;
    Imp.WriteXY(4.5,wCont,QNFE_EmiteNOME.Text + ' - ' + QNFE_EmiteCOD_CADASTRO.Text);
    Imp.WriteXY(18.3,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8));
  end;
end;

Procedure TFNotaImpressao.NF_ITAIPU;
var wContReceber, wContServico : Byte;
    wDesconto,wFacs,wFethab, wTotalISS, wTotalServico: Real;
    wExtenso, wLinhaExt1, wLinhaExt2, wEndereco : String;
begin
  // *** Emissão de Nota Fiscal para Empresa de Agua Mineral Itaipu
  // *** OBS - Colocar Posicao X em Centimetros
  wCont := 2;
  wTransgenico := 'NAO';
  With DMNotaSaida do
  Begin
    wFacs := 0;
    wFethab := 0;
    wNotaGlobal := 0;
    while wNotaGlobal < 2 do
    begin
      wCont := 1;
      If QNFE_EmiteInd_Entrada_Saida.Value = 'E' Then
        Imp.WriteXY(14.6,wCont,'X')
      Else
        Imp.WriteXY(12.2,wCont,'X');
      Imp.WriteXY(17.6,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
      Inc(wCont);
      if wNotaGlobal = 1 then // SE A NOTA FOR CONTINUAÇÃO ESCREVE NA NOTA
      begin
        Imp.WriteXY(13,wCont,'CONTINUACAO');
      end;
      //wCont := 3;
      WnotaGlobal := 2;
//      Inc(wCont, 2);
      Inc(wCont, 5);
      Imp.WriteXY(0,wCont,QNFE_EmiteNAT_OPERACAO.Value);
      Imp.WriteXY(6,wCont,QNFE_Emitenum_cfop.Text);
      Imp.WriteXY(8.2,wCont,QNFE_EmiteDESC_INSCRICAO_SUBST.Text);
      Inc(wCont, 4);
      Imp.WriteXY(0,wCont,QNFE_EmiteNOME.Text+' - '+QNFE_EmiteCOD_CADASTRO.Text);
      Imp.WriteXY(12.5,wCont,QNFE_EmiteNUM_CGC_CPF.Value);
      Imp.WriteXY(17.3,wCont,QNFE_EmiteDT_EMISSAO.Text);
      Inc(wCont, 2);
      Imp.WriteXY(0,wCont, QNFE_EmiteDESC_ENDERECO.Value);
      Imp.WriteXY(12.2,wCont,QNFE_EmiteDESC_BAIRRO.Value);
      Imp.WriteXY(15,wCont,QNFE_EmiteDESC_CEP.Value);
  //    Imp.WriteXY(18.5,wCont,QNFE_EmiteDT_RECEBIMENTO.Text);
      Inc(wCont, 2);
      Imp.WriteXY(0,wCont,QNFE_EmiteDESC_CIDADE.Value);
      Imp.WriteXY(6.2,wCont,QNFE_EmiteDESC_TELEFONE.Value);
      Imp.WriteXY(11.5,wCont,QNFE_EmiteCOD_ESTADO.Value);
      Imp.WriteXY(12.5,wCont,QNFE_EmiteNUM_INSCRICAO.Value);
      Imp.WriteXY(17.3,wCont,TimeToStr(Time));
      Inc(wCont, 4);
      If QNFE_EmiteInd_Condicao_Pagto.Value = '2' Then
      Begin
        wContReceber:=0;
        QContaReceber.Open;
        QContaReceber.First;
        While not QContaReceber.Eof Do
        Begin
          if wContReceber = 0 Then
            Begin
              Imp.WriteXY(0,wCont,Bib.NumToTexto(QContaReceberNUM_TITULO.Value,0,6));
              Imp.WriteXY(3,wCont,QContaReceberDT_Vencimento.Text);
              Imp.WriteXY(6,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,12));
              wContReceber := 1;
            End
          Else
            Begin
              Imp.WriteXY(11.2,wCont,Bib.NumToTexto(QContaReceberNUM_TITULO.Value,0,6));
              Imp.WriteXY(13.5,wCont,QContaReceberDT_Vencimento.Text);
              Imp.WriteXY(16.5,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,12));
              wContReceber := 0;
              Inc(wCont);
            End;
          QContaReceber.Next;
        End;
        QContaReceber.Close;
      End;
      // **** Itens ****
      wCont := 27;       //POSICIONA ANTES DA LINHA DO PRIMEIRO PRODUTO
      wContLinha := 0;   //CONTROLA A QUANTIA DE ITENS POR NOTA

      If wNotaGlobal = 0 then
         QNFE_EmiteIt.First;

      While Not QNFE_EmiteIt.Eof do
      Begin
        if QNFE_EmiteItIND_TIPO_PRODUTO.Value <> 'SERVIÇO' Then   // nota fiscal de serviços
        begin
          QLoteProduto.Close;
          QLoteProduto.SetVariable('COD_PRODUTO', QNFE_EmiteItCOD_PRODUTO.Value);
          QLoteProduto.open;

          Inc(WContLinha);
          Inc(wCont);
          Imp.WriteXY(0,wCont,Bib.NumToTexto(QNFE_EmiteITCod_Produto.Value,0,6));
          Imp.WriteXY(1.2,wCont,QNFE_EmiteITDesc_Produto.Value);
          Imp.WriteXY(7.3,wCont,QNFE_EmiteItDESC_CLASS_FISCAL.Value);
          Imp.WriteXY(9.3,wCont,QNFE_EmiteITDesc_Situacao_Trib.Value);
          Imp.WriteXY(10.1,wCont,QNFE_EmiteITDesc_Unidade.Value);
          Imp.WriteXY(10.6,wCont,QNFE_EmiteITQT_Quantidade.Text);
          Imp.WriteXY(12.1,wCont,QNFE_EmiteItVAL_UNITARIO.Text);
          Imp.WriteXY(14.1,wCont,QNFE_EmiteItVAL_TOTAL.Text);
          Imp.WriteXY(16.6,wCont,QNFE_EmiteITPerc_Aliquota.Text);
          Imp.WriteXY(17.2,wCont,QNFE_EmiteItPERC_IPI.Text);
          Imp.WriteXY(18,wCont,QNFE_EmiteItVAL_IPI.Text);
          Calc_Peso_Nota;   // calculo do peso produto
          if QNFE_EmiteItDESC_COMPLEMENTO.Text <> '' then
          begin
            Inc(wContLinha);
            Inc(wCont);
            Imp.WriteXY(1,wCont, QNFE_EmiteItDESC_COMPLEMENTO.Text);
          end
        End
        else
        begin
          wTotalISS := wTotalISS + QNFE_EmiteItVal_ISS.Value;
          wTotalServico := wTotalServico + QNFE_EmiteItVal_Total.Value;
        end;
  // =============================================================================
        QNFE_EmiteIt.Next;
        If (wContLinha >= 25) and (not QNFE_EmiteIT.eof) then
        Begin
          wCont := 58; //A MESMA POSICAO DO [VALOR TOTAL DOS PRODUTOS]
          Imp.WriteXY(17,wCont,'CONTINUA');
          wNotaGlobal := 1;
          Imp.SaltaPagina;
          Break;
        End;
      End;
    End;
    wCont := 56;
    Imp.WriteXY(0.7,wCont,Bib.NumToTexto(wbase_icm_tributada,2,15));
    Imp.WriteXY(4.5,wCont,Bib.NumToTexto(wvlr_icm,2,15));
    Imp.WriteXY(8.5,wCont,Bib.NumToTexto(wBase_Subst,2,15));
    Imp.WriteXY(13.5,wCont,Bib.NumToTexto(wIcms_Subst,2,15));
    Imp.WriteXY(17,wCont,Bib.NumToTexto(wtotal_produtos,2,15));
    Inc(wCont, 2);
    Imp.WriteXY(0.7,wCont,Bib.NumToTexto(QNFE_EmiteVAL_FRETE.Value,2,15));
//    Imp.WriteXY(4.5,wCont,Bib.NumToTexto(QSomaItemNota,2,13));
    Imp.WriteXY(8.5,wCont,Bib.NumToTexto(QNFE_EmiteVAL_DESPESAS.Value,2,15));
    Imp.WriteXY(13.5,wCont,Bib.NumToTexto(wvlr_ipi,2,15));
    Imp.WriteXY(17,wCont,Bib.NumToTexto(wtotal_produtos
                                 +wvlr_ipi
                                 +QNFE_EmiteVAL_DESPESAS.Value
                                 -QNFE_EmiteVAL_Desconto.Value
                                 -QNFE_EmiteVal_Desconto_Fitas.Value,2,15));
    Inc(wCont, 3);
    if Trim(QNFE_Emitenome_transp.Value) = '' then
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_Transportadora.Value)
    else
      Imp.WriteXY(0,wCont,QNFE_Emitenome_transp.Value);
    if QNFE_EmiteInd_Tipo_Frete.Value = 'FOB' Then
      Imp.WriteXY(12.3,wCont,'2') // Destinatário
    else
      Imp.WriteXY(12.3,wCont,'1'); // Emitente
    Imp.WriteXY(12.9,wCont,QNFE_EmiteDesc_Placa.Value);
    Imp.WriteXY(15.7,wCont,QNFE_Emitecgc_transp.Value);
    Inc(wCont, 2);
    Imp.WriteXY(0,wCont,QNFE_Emiteend_transp.Value);
    Imp.WriteXY(10.8,wCont,QNFE_Emitecidade_transp.Value);
    Imp.WriteXY(14.9,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(15.7,wCont,QNFE_Emiteinsc_transp.Value);
    Inc(wCont, 2);
    Imp.WriteXY(0,wCont,QNFE_EmiteNum_Volumes.Text);
    Imp.WriteXY(14,wCont,Bib.NumToTexto(wPesoBruto,2,11));
    Imp.WriteXY(17,wCont,Bib.NumToTexto(wPeso,2,11));
    Inc(wCont, 3);
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
    Inc(wCont);
    Imp.WriteXY(0,wCont,Bib.NumToTexto(QNFE_EmiteCod_Vendedor.Value,0,8)+' - '+QNFE_EmiteNOME_VENDEDOR.Value);
    Inc(wCont);
  end;
end;

Procedure TFNotaImpressao.NFBrasil;
Var wContServico : Byte;
    wTotalISS, wTotalServico : Real;
    wFlagServico, wFlagProduto :Boolean;
begin
  // *** Emissão de Nota Fiscal para a Brasil Paper
  // *** OBS - Colocar Posicao X em Centimetros
  // *** wNotaGlobal Controla a quebra de continuação
  wTotalISS := 0;
  wTotalServico := 0;
  wCont := 0;
  wFlagServico := false;
  wFlagProduto := false;
  // INICIALIZA VALOR DA VARIAVEL

  With DMNotaSaida do
  Begin

    QNFE_EmiteIt.First;
    while not QNFE_EmiteIt.Eof do
    begin
      if QNFE_EmiteItIND_TIPO_PRODUTO.Value = 'SERVIÇO' then
        wFlagServico := true
      else
        wFlagProduto := true;

      QNFE_EmiteIt.Next;
    end;
    QNFE_EmiteIt.First;
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
      if wFlagServico and wFlagProduto then //ALTERADO MARLON 21/06/2007
      begin
        Imp.WriteXY(0,wCont, QNFE_EmiteNAT_OPERACAO.Value + '/SERVICO');
        Imp.WriteXY(5.2,wCont,QNFE_Emitenum_cfop.Text + '/5933');
      end
      else
      begin
        Imp.WriteXY(0,wCont,QNFE_EmiteNAT_OPERACAO.Value);
        Imp.WriteXY(5.2,wCont,QNFE_Emitenum_cfop.Text);  //ALTERADO SERGIO 13/12/2002
      end;
{      If QNFE_EmiteUF_Filial.Value <> QNFE_EmiteUF_Nota.Value then
        Imp.WriteXY(5.2,wCont,QNFE_EmiteNat_InterEstadual.Text)
      Else
        Imp.WriteXY(5.2,wCont,QNFE_EmiteNat_Estadual.Text);}
      wCont := wCont+3;
      Imp.WriteXY(0.2,wCont,QNFE_EmiteCOD_CADASTRO.Text);

      //QNotaNome.Close;
      //QNotaNome.SetVariable('PK',QNotaSaidaCod_Nota_Cab.Value);
      //QNotaNome.Open;

      //If Not QNotaNome.Eof Then
      // Begin
      //   Imp.WriteXY(1.1,wCont,QNotaNomeNOME.Value);
      //   Imp.WriteXY(12,wCont,QNotaNomeDesc_CGC_CPF.Value);
      // End
      //else
      //  Begin
      //   Imp.WriteXY(1.1,wCont,QNFE_EmiteNOME.Value);
      //   Imp.WriteXY(12,wCont,QNFE_EmiteNUM_CGC_CPF.Value);
      //  End;
      Imp.WriteXY(1.1,wCont,QNFE_EmiteNOME.Value);
      Imp.WriteXY(12,wCont,QNFE_EmiteNUM_CGC_CPF.Value);

      Imp.WriteXY(16.2,wCont,QNFE_EmiteDT_EMISSAO.Text);
      wCont := wCont + 2;

      //If Not QNotaNome.Eof Then
      //  Imp.WriteXY(0,wCont, QNotaNomeDESC_ENDERECO.Value)
      //Else
      //  Imp.WriteXY(0,wCont, QNFE_EmiteDESC_ENDERECO.Value);
      Imp.WriteXY(0,wCont, QNFE_EmiteDESC_ENDERECO.Value);

      Imp.WriteXY(9,wCont,QNFE_EmiteDESC_BAIRRO.Value);
      Imp.WriteXY(13.6,wCont,QNFE_EmiteDESC_CEP.Value);
      Imp.WriteXY(16.2,wCont,QNFE_EmiteDT_EMISSAO.Text);
      wCont := wCont+2;
      Imp.WriteXY(0,wCont,QNFE_EmiteDESC_CIDADE.Value);
      Imp.WriteXY(6.7,wCont,QNFE_EmiteDESC_TELEFONE.Value);
      Imp.WriteXY(10.3,wCont,QNFE_EmiteCOD_ESTADO.Value);

      //If Not QNotaNome.Eof Then
      //  Imp.WriteXY(11.5,wCont,QNotaNomeDesc_INSCRICAO.Value)
      //else
      //  Imp.WriteXY(11.5,wCont,QNFE_EmiteNUM_INSCRICAO.Value);
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
    IMP_OBS_CORPO_NOTA(1, wCont);
//    FNotaImpressao.Imp_Desconto(wCont ,1);
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


Procedure TFNotaImpressao.NF_ARZ;
Var wContServico : Byte;
    wTotalISS, wTotalServico : Real;
begin
  // *** Emissão de Nota Fiscal para a ARZ
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

      //QNotaNome.Close;
      //QNotaNome.SetVariable('PK',QNotaSaidaCod_Nota_Cab.Value);
      //QNotaNome.Open;

      //If Not QNotaNome.Eof Then
      // Begin
      //   Imp.WriteXY(1.1,wCont,QNotaNomeNOME.Value);
      //  Imp.WriteXY(12,wCont,QNotaNomeDesc_CGC_CPF.Value);
      // End
      //else
      //  Begin
      //   Imp.WriteXY(1.1,wCont,QNFE_EmiteNOME.Value);
      //   Imp.WriteXY(12,wCont,QNFE_EmiteNUM_CGC_CPF.Value);
      //  End;
      Imp.WriteXY(1.1,wCont, QNFE_EmiteNOME.Value);
      Imp.WriteXY(12,wCont,  QNFE_EmiteNUM_CGC_CPF.Value);

      Imp.WriteXY(16.2,wCont,QNFE_EmiteDT_EMISSAO.Text);
      wCont := wCont + 2;

      //If Not QNotaNome.Eof Then
      //  Imp.WriteXY(0,wCont, QNotaNomeDESC_ENDERECO.Value)
      //Else
      //  Imp.WriteXY(0,wCont, QNFE_EmiteDESC_ENDERECO.Value);
      Imp.WriteXY(0,wCont, QNFE_EmiteDESC_ENDERECO.Value);

      Imp.WriteXY(9,wCont,QNFE_EmiteDESC_BAIRRO.Value);
      Imp.WriteXY(13.6,wCont,QNFE_EmiteDESC_CEP.Value);
      Imp.WriteXY(16.2,wCont,QNFE_EmiteDT_EMISSAO.Text);
      wCont := wCont+2;
      Imp.WriteXY(0,wCont,QNFE_EmiteDESC_CIDADE.Value);
      Imp.WriteXY(6.7,wCont,QNFE_EmiteDESC_TELEFONE.Value);
      Imp.WriteXY(10.3,wCont,QNFE_EmiteCOD_ESTADO.Value);

      //If Not QNotaNome.Eof Then
      //  Imp.WriteXY(11.5,wCont,QNotaNomeDesc_INSCRICAO.Value)
      //else
      //  Imp.WriteXY(11.5,wCont,QNFE_EmiteNUM_INSCRICAO.Value);
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
          If QNFE_EmiteItDesc_Complemento.Text <> '' Then
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
        If wContLinha >= 24 then
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
    IMP_OBS_CORPO_NOTA(1, wCont);
//    FNotaImpressao.Imp_Desconto(wCont,1);
    wCont := 33;
    wContServico := 0;
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
    if QNFE_EmiteCod_Filial.value  = 1 Then
    begin
      Imp.WriteXY(0,wCont,'Doc. emitido por empresa enquadrada no regime Fiscal');
      wCont := wCont + 1;
      Imp.WriteXY(0,wCont,'das Microempresas e das Empresas de Pequeno porte nao');
      wCont := wCont + 1;
      Imp.WriteXY(0,wCont,'gera direito a credito de ICMS.(Art. 416 do RICMS/PR)');
      wCont := wCont + 1;
    end;
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
End;  //FIM IMPRESSAO NF ARZ

Procedure TFNotaImpressao.NF_NIR;
var wContServico : Byte;
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
          wCont := 0;  // INICIALIZA VALOR DA VARIAVEL - Robson 26/06/2000
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
          Inc(wcontLinha);
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
    IMP_OBS_CORPO_NOTA(1, wCont);
//    FNotaImpressao.Imp_Desconto(wCont,1);
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
    Imp.WriteXY(0.2,wCont,Bib.NumToTexto(0,2,18));
    Imp.WriteXY(3.8,wCont,Bib.NumToTexto(0,2,17));
    Imp.WriteXY(14.4,wCont,Bib.NumToTexto(wtotal_produtos - wTotalServico,2,20));
    wCont := wCont + 2;
    Imp.WriteXY(0.2,wCont,Bib.NumToTexto(QNFE_EmiteVAL_FRETE.Value,2,18));
    Imp.WriteXY(7.5,wCont,Bib.NumToTexto(QNFE_EmiteVAL_DESPESAS.Value,2,17));
//    Imp.WriteXY(10.2,wCont,Bib.NumToTexto(wvlr_ipi,2,15));
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
    Imp.WriteXY(0.2,wCont,'I - "DOCUMENTO EMITIDO POR ME OU EPP OPTANTE PELO SIMPLES NACIONAL"');
    Inc(wCont);
    Imp.WriteXY(0.2,wCont,'II - "NAO GERA DIREITO A CREDITO FISCAL DE ICMS, DE ISS E DE IPI"');
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
    if wCont<=58 Then
      wCont := 59;
    Imp.WriteXY(19,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,6) );
  end;
//  Imp.SaltaPagina;
end;

Procedure TFNotaImpressao.NF_VIDEO_SOM;
var wContServico : Byte;
    wTotalISS, wTotalServico : Real;
begin
  // *** Emissão de Nota Fiscal para a Video Som
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
      wCont := 0;
      if wNotaGlobal = 1 then
         Imp.WriteXY(9.5,wCont,'CONTINUACAO');
      WnotaGlobal := 2;
      Imp.WriteXY(16.5,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
      wCont := wCont + 3;
      if QNFE_EmiteInd_Entrada_Saida.Value = 'S' Then
         Imp.WriteXY(13,wCont,'X')
      else
        Imp.WriteXY(15.5,wCont,'X');
      Inc(wCont,6);
      Imp.WriteXY(0,wCont,QNFE_EmiteNAT_OPERACAO.Value);
      Imp.WriteXY(7,wCont,QNFE_Emitenum_cfop.Text);  //ALTERADO SERGIO 13/12/2002
      wCont := wCont+4;
      Imp.WriteXY(0,wCont,QNFE_EmiteNOME.Value);
      Imp.WriteXY(13.5,wCont,QNFE_EmiteNUM_CGC_CPF.Value);
      Imp.WriteXY(18.2,wCont,QNFE_EmiteDT_EMISSAO.Text);
      wCont := wCont + 2;
      Imp.WriteXY(0,wCont, QNFE_EmiteDESC_ENDERECO.Value);
      Imp.WriteXY(10,wCont,QNFE_EmiteDESC_BAIRRO.Value);
      Imp.WriteXY(15.5,wCont,QNFE_EmiteDESC_CEP.Value);
      Imp.WriteXY(18.2,wCont,QNFE_EmiteDT_EMISSAO.Text);
      wCont := wCont+2;
      Imp.WriteXY(0,wCont,QNFE_EmiteDESC_CIDADE.Value);
      Imp.WriteXY(8.5,wCont,QNFE_EmiteDESC_TELEFONE.Value);
      Imp.WriteXY(12.4,wCont,QNFE_EmiteCOD_ESTADO.Value);
      Imp.WriteXY(13.5,wCont,QNFE_EmiteNUM_INSCRICAO.Value);
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
          Imp.WriteXY(0.5,wCont,Bib.NumToTexto(QNFE_EmiteITCod_Produto.Value,0,6));
          Imp.WriteXY(2.5,wCont,QNFE_EmiteITDesc_Produto.Value);
          Imp.WriteXY(10.9,wCont,QNFE_EmiteITNum_Classificacao.Value);
          Imp.WriteXY(11.5,wCont,QNFE_EmiteITDesc_Unidade.Value);
          Imp.WriteXY(12.3,wCont,Bib.NumToTexto(QNFE_EmiteITQT_Quantidade.Value,0,5));
          Imp.WriteXY(14,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Unitario.Value,2,7));
          Imp.WriteXY(17,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value,2,9));
          Imp.WriteXY(19.7,wCont,QNFE_EmiteITPerc_Aliquota.Text);
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
            Imp.WriteXY(12.5,wCont,'Preço em '+FloatToStr(QNFE_EmiteItNum_Embalagem.Value)+' Kg');
          end;
        end
        else
        begin
          wTotalISS := wTotalISS + QNFE_EmiteItVal_ISS.Value;
          wTotalServico := wTotalServico + QNFE_EmiteItVal_Total.Value;
        end;
        QNFE_EmiteIT.Next;
        if wContLinha >= 9 then
        begin
          wCont := 30;
          Imp.WriteXY(17,wCont,'CONTINUA');
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
      Imp.WriteXY(15,wCont,'DESCONTO: '+Bib.NumToTexto(QNFE_EmiteVal_Desconto.Value,2,9));
    end;
    // Fim dos Item de Produto
    IMP_OBS_CORPO_NOTA(1, wCont);
//    FNotaImpressao.Imp_Desconto(wCont,1);
    wCont := 32;
    wContServico := 0;
    // Item de Prestacao de Serviço
    QNFE_EmiteIt.First;
    while not QNFE_EmiteIT.Eof do
    begin                                                // O comentario abaixo era usado antes
      if QNFE_EmiteItIND_TIPO_PRODUTO.Value = 'SERVIÇO' Then   // QNFE_EmiteItPERC_ISS.Value > 0
      begin
        Inc(wCont); Inc(wContServico);
        Imp.WriteXY(0,wCont,Bib.NumToTexto(QNFE_EmiteITCod_Produto.Value,0,6));
        Imp.WriteXY(1,wCont,QNFE_EmiteITDesc_Produto.Value);
        Imp.WriteXY(9,wCont,Bib.NumToTexto(QNFE_EmiteITQT_Quantidade.Value,0,6));
        Imp.WriteXY(10,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Unitario.Value,2,13));
        Imp.WriteXY(12.2,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value,2,17));
        if wContServico = 2 Then
          Imp.WriteXY(18.5,wCont,Bib.NumToTexto(wTotalISS,2,9) );
        if wContServico = 3 Then
          Imp.WriteXY(18.5,wCont,Bib.NumToTexto(wTotalServico,2,9));
      end;
      QNFE_EmiteIt.Next;
    end;
    if wTotalISS > 0 Then
      if wContServico < 2 Then
      begin
        Inc(wCont); Inc(wContServico);
        Imp.WriteXY(18.5,wCont,Bib.NumToTexto(wTotalISS,2,9));
      end;
    If wTotalServico > 0 Then
      if wContServico < 3 Then
      begin
        wCont := wCont + 3 - wContServico;
        Imp.WriteXY(18.5,wCont,Bib.NumToTexto(wTotalServico,2,9));
      end;
    // *** Final dos Itens ****
    wCont := 38;
    Imp.WriteXY(1,wCont,Bib.NumToTexto(wbase_icm_tributada,2,11));
    Imp.WriteXY(5,wCont,Bib.NumToTexto(wvlr_icm,2,9));
    Imp.WriteXY(16.5,wCont,Bib.NumToTexto(wtotal_produtos - wTotalServico,2,11));
    wCont := wCont + 2;
    Imp.WriteXY(1,wCont,Bib.NumToTexto(QNFE_EmiteVAL_FRETE.Value,2,11));
    Imp.WriteXY(9,wCont,Bib.NumToTexto(QNFE_EmiteVAL_DESPESAS.Value,2,11));
//    Imp.WriteXY(10.2,wCont,Bib.NumToTexto(wvlr_ipi,2,15));
    Imp.WriteXY(16.5,wCont,Bib.NumToTexto( wtotal_produtos
                                 +wvlr_ipi
                                 +QNFE_EmiteVAL_DESPESAS.Value
                                 -QNFE_EmiteVAL_Desconto.Value
                                 -QNFE_EmiteVAL_Funrural.Value,2,11));
    wCont := wCont + 3;
    if Trim(QNFE_Emitenome_transp.Value) = '' then
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_Transportadora.Value)
    else
      Imp.WriteXY(0,wCont,QNFE_Emitenome_transp.Value);
    if QNFE_EmiteInd_Tipo_Frete.Value = 'FOB' Then
      Imp.WriteXY(11.7,wCont,'2') // Destinatário
    else
      Imp.WriteXY(11.7,wCont,'1'); // Emitente
    Imp.WriteXY(12.7,wCont,QNFE_EmiteDesc_Placa.Value);
    Imp.WriteXY(16,wCont,QNFE_Emitecgc_transp.Value);
    wCont := wCont+2;
    Imp.WriteXY(0,wCont,QNFE_Emiteend_transp.Value);
    Imp.WriteXY(10,wCont,QNFE_Emitecidade_transp.Value);
    Imp.WriteXY(15,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(16,wCont,QNFE_Emiteinsc_transp.Value);
    wCont := wCont + 2;
    Imp.WriteXY(1,wCont,QNFE_EmiteNUM_VOLUMES.Text);
    wCont := wCont + 3;
    Imp.WriteXY(0,wCont,'I - "DOCUMENTO EMITIDO POR ME OU EPP OPTANTE PELO SIMPLES NACIONAL"');
    Inc(wCont);
    Imp.WriteXY(0,wCont,'II - "NAO GERA DIREITO A CREDITO FISCAL DE ICMS, DE ISS E DE IPI"');
    Inc(wCont);
    Imp.WriteXY(0,wCont,QNFE_EmiteOBS.Value);
    Inc(wCont);
    if Trim(QNFE_EmiteOBS_COMPLEMENTO.Value) <> '' Then
    begin
      Imp.WriteXY(0,wCont,QNFE_EmiteOBS_COMPLEMENTO.Value);
      Inc(wCont);
    end;
   if Trim( QNFE_EmiteDesc_Mensagem.Value)<>'' Then
    begin
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_Mensagem.Value);
      Inc(wCont);
    end;
    if Trim(QNFE_EmiteDesc_COMPLEMENTO.Value) <> '' Then
    begin
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_COMPLEMENTO.Value);
      Inc(wCont);
    end;
    if QNFE_EmiteInd_Condicao_Pagto.Value = '1' Then
    begin
      Imp.WriteXY(0,wCont,'Pagamento a Vista');
      Inc(wCont);
    end;
    if QNFE_EmiteInd_Condicao_Pagto.Value = '2' Then
    begin
      Imp.WriteXY(0,wCont,'Vencimentos:');
      QContaReceber.Open;
      QContaReceber.First;
      while not QContaReceber.Eof do
      begin
        Imp.WriteXY(2,wCont,QContaReceberDT_Vencimento.Text+' ');
        Imp.WriteXY(4,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
        Inc(wCont);
        QContaReceber.Next;
      end;
      QContaReceber.Close;
    end;
    if wCont<=62 Then
      wCont := 62;
    Imp.WriteXY(18.5,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,6) );
  end;
//  Imp.SaltaPagina;
end;


{Procedure TFNotaImpressao.NF_CGS;
Var wVencimento,wJaExtenso : Byte;
    wExtenso, wLinhaExt1, wLinhaExt2, wProduto : String;
    wVol : Real;
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
//         wNumero_Continua := QNFE_EmiteNUM_NOTA.Value - 1;
         Imp.WriteXY(9.5,wCont,'CONTINUACAO NOTA ');  //+Bib.NumToTexto(wNumero_Continua,0,8));
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
 {     wCont := wCont+4;
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
      wCont := wCont + 4;  //FABIANO
      wExtenso := Bib.Extenso( wtotal_produtos
                          +wvlr_ipi - QNFE_EmiteVal_Desconto.Value,'REAL');
      Bib.QuebraString(wExtenso,40,wLinhaExt1,wLinhaExt2,'*');
      If QNFE_EmiteInd_Condicao_Pagto.Value = '2' Then //A PRAZO
      Begin
        QContaReceber.Open;
        QContaReceber.First;
        wVencimento := 0;
        wJaExtenso := 0;
        While not QContaReceber.Eof do
        Begin
          If (((DMNotaSaida.QNotaSaidaCOD_SERIE.Value = 'B1') and //MARCOS - colocado p/ nao imprimir a parte B
             ( DMNotaSaida.QNotaSaidaNUM_NOTA.Value = QContaReceberNum_Titulo.Value))  or
             ( DMNotaSaida.QNotaSaidaCOD_SERIE.Value <> 'B1')) then
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
        wProduto := (TRIM(QNFE_EmiteITDesc_Produto.Value) + ' - ' + TRIM(QNFE_EmiteItDesc_Lote.Value));
        if Length(wProduto) > 43 then
          Imp.WriteXY(2.4,wCont,(QNFE_EmiteITDesc_Produto.Value))
        else
          Imp.WriteXY(2.4,wCont,(TRIM(QNFE_EmiteITDesc_Produto.Value) + ' - ' + TRIM(QNFE_EmiteItDesc_Lote.Value)));
        Imp.WriteXY(9.2,wCont,(TRIM(QNFE_EmiteITDesc_Class_Fiscal.Value)));
        Imp.WriteXY(10.1,wCont,QNFE_EmiteITNum_Classificacao.Value);
        Imp.WriteXY(10.8,wCont,QNFE_EmiteITDesc_Unidade.Value);
        Imp.WriteXY(11.4,wCont,Bib.NumToTexto(QNFE_EmiteITQT_Quantidade.Value,2,7));
        Imp.WriteXY(12.8,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Unitario.Value,2,11));
        Imp.WriteXY(14.5,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value,2,11));
        Imp.WriteXY(17.5,wCont,Trim(QNFE_EmiteITPerc_Aliquota.Text));
        Imp.WriteXY(18.2,wCont,Trim(QNFE_EmiteITPerc_IPI.Text) );
        Imp.WriteXY(19,wCont,Bib.NumToTexto(QNFE_EmiteITVal_IPI.Value,2,7));
        if Length(wProduto) > 43 then
        Begin
          Inc(wCont);
          Imp.WriteXY(2.4,wCont,(QNFE_EmiteItDesc_Lote.Value));
        end;
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
          wCont := 63; //(62) fabiano
//          wNumero_Continua := QNFE_EmiteNUM_NOTA.Value + 1;
          Imp.WriteXY(17,wCont,'CONTINUA NUMERO'); //+Bib.NumToTexto(wNumero_Continua,0,8));
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
    IMP_OBS_CORPO_NOTA(2.5, wCont);
//    FNotaImpressao.Imp_Desconto(wCont,2.5);
    wCont := 63;//(62) fabiano
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
    wCont := wCont + 3;
    Imp.WriteXY(2,wCont,Bib.NumToTexto(wVol,0,8));
    Imp.WriteXY(3.5,wCont,'CAIXA');
    Imp.WriteXY(8,wCont,'CGS');
    wCont := wCont + 3; //FABIANO
    If QNFE_EmiteOBS.Value <> '' then
    Begin
      Imp.WriteXY(1.2,wCont,QNFE_EmiteOBS.Value);
      Inc(wCont);
    end;
    If QNFE_EmiteOBS_COMPLEMENTO.Value <> '' then
    Begin
      Imp.WriteXY(1.2,wCont,QNFE_EmiteOBS_COMPLEMENTO.Value);
      Inc(wCont);
    End;
    If QNFE_EmiteDesc_Mensagem.Value <> '' then
    Begin
      Imp.WriteXY(1.2,wCont,QNFE_EmiteDesc_Mensagem.Value);
      Inc(wCont);
    end;
    If QNFE_EmiteDesc_COMPLEMENTO.Value <> '' then
    Begin
      Imp.WriteXY(1.2,wCont,QNFE_EmiteDesc_COMPLEMENTO.Value);
      Inc(wCont);
    end;
    If QNFE_EmiteDesc_COMPLEMENTO1.Value <> '' then
    Begin
      Imp.WriteXY(0.5,wCont,QNFE_EmiteDesc_COMPLEMENTO1.Value);
      Inc(wcont);
    end;
  //  Inc(wCont);
 //   Imp.WriteXY(0.5,wCont,QNFE_EmiteDesc_COMPLEMENTO2.Value);

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
var wVencimento,wJaExtenso : Byte;
    wExtenso, wLinhaExt1, wLinhaExt2 : String;
    wVol : Real;  //    wNumero_Continua,
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
//         wNumero_Continua := QNFE_EmiteNUM_NOTA.Value - 1;
         Imp.WriteXY(9.5,wCont,'CONTINUACAO NOTA '); //+Bib.NumToTexto(wNumero_Continua,0,8));
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
  {    wCont := wCont+4;
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
          If (((DMNotaSaida.QNotaSaidaCOD_SERIE.Value = 'B1') and //Marcos-colocado p/ nao imprimir a parte B
             ( DMNotaSaida.QNotaSaidaNUM_NOTA.Value = QContaReceberNum_Titulo.Value)) or
             ( DMNotaSaida.QNotaSaidaCOD_SERIE.Value <> 'B1')) then
          begin
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
//          wNumero_Continua := QNFE_EmiteNUM_NOTA.Value + 1;
          Imp.WriteXY(17,wCont,'CONTINUA NUMERO'); //+Bib.NumToTexto(wNumero_Continua,0,8));
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
    IMP_OBS_CORPO_NOTA(2.5, wCont);
//    FNotaImpressao.Imp_Desconto(wCont,2.5);
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
    wCont := wCont + 2;
    If QNFE_EmiteOBS.Value <> '' Then
    begin
      Imp.WriteXY(1.2,wCont,QNFE_EmiteOBS.Value);
      Inc(wCont);
    End;
    If QNFE_EmiteOBS_COMPLEMENTO.Value <> '' Then
    begin
      Imp.WriteXY(1.2,wCont,QNFE_EmiteOBS_COMPLEMENTO.Value);
      Inc(wCont);
    End;
    If QNFE_EmiteDesc_Mensagem.Value <> '' Then
    begin
      Imp.WriteXY(1.2,wCont,QNFE_EmiteDesc_Mensagem.Value);
      Inc(wCont);
    End;
    If QNFE_EmiteDesc_COMPLEMENTO.Value <> '' Then
    begin
      Imp.WriteXY(1.2,wCont,QNFE_EmiteDesc_COMPLEMENTO.Value);
      Inc(wCont);
    End;
    If QNFE_EmiteDesc_COMPLEMENTO1.Value <> '' Then
    begin
      Imp.WriteXY(0.5,wCont,QNFE_EmiteDesc_COMPLEMENTO1.Value);
      Inc(wCont);
    End;
    If QNFE_EmiteDesc_COMPLEMENTO2.Value <> '' Then
    begin
      Imp.WriteXY(0.5,wCont,QNFE_EmiteDesc_COMPLEMENTO2.Value);
      Inc(wcont);
    End;
    Imp.WriteXY(1.2,wCont,Bib.NumToTexto(QNFE_EmiteCod_Vendedor.Value,0,8)+' - '+QNFE_EmiteNOME_VENDEDOR.Value);
    QrAchaNrPedido.Close;
    QrAchaNrPedido.SetVariable('PK',QNFE_EmiteCOD_NOTA_CAB.Value);
    QrAchaNrPedido.Open;
    Inc(wcont);
    Imp.WriteXY(1.2,wCont,'Referente Pedido Nr.:');
    Imp.WriteXY(5,wCont,Bib.NumToTexto(QrAchaNrPedidoNum_Pedido.Value,0,6));
  End;
End;   // Fim do procedimento de impressao CGS Filial 02.  }

Procedure TFNotaImpressao.NF_CEREAIS;
begin
  // *** Emissão de Nota Fiscal para o Cereais Iguaçu
  // *** OBS - Colocar Posicao X em Centimetros
  wCont := 1;
  With DMNotaSaida do
  Begin
    Imp.WriteXY(18.3,Wcont,QNFE_EmiteNUM_NOTA.Text);
    WCont :=Wcont + 3;
    //Inc(wCont);
    If QNFE_EmiteInd_Entrada_Saida.Value = 'E' Then
      Imp.WriteXY(15,wCont,'XX')
    Else
      Imp.WriteXY(12.7,wCont,'XX');
    wCont := wCont + 6;
    Imp.WriteXY(0,wCont,QNFE_EmiteNAT_OPERACAO.Value);
    Imp.WriteXY(6.5,wCont,QNFE_Emitenum_cfop.Text);  //ALTERADO SERGIO 13/12/2002
    wCont := wCont + 4;
    Imp.WriteXY(0,wCont,QNFE_EmiteCOD_CADASTRO.Text);
    Imp.WriteXY(1.1,wCont,QNFE_EmiteNOME.Value);
    Imp.WriteXY(13,wCont,QNFE_EmiteNUM_CGC_CPF.Value);
    Imp.WriteXY(18,wCont,QNFE_EmiteDT_EMISSAO.Text);
    wCont := wCont + 2;
    Imp.WriteXY(0,wCont, QNFE_EmiteDESC_ENDERECO.Value);
    Imp.WriteXY(12.1,wCont,QNFE_EmiteDESC_BAIRRO.Value);
    Imp.WriteXY(15.2,wCont,QNFE_EmiteDESC_CEP.Value);
    Imp.WriteXY(18,wCont,QNFE_EmiteDT_EMISSAO.Text);
    wCont := wCont+3;
    Imp.WriteXY(0,wCont,QNFE_EmiteDESC_CIDADE.Value);
    Imp.WriteXY(8.5,wCont,QNFE_EmiteDESC_TELEFONE.Value);
    Imp.WriteXY(11.7,wCont,QNFE_EmiteCOD_ESTADO.Value);
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
    wCont := 28;
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
    IMP_OBS_CORPO_NOTA(2, wCont);
//    FNotaImpressao.Imp_Desconto(wCont,2);
    wCont := 51;
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
    wCont := wCont+3; //----PULA LINHA
    Imp.WriteXY(0,wCont,QNFE_Emiteend_transp.Value);
    Imp.WriteXY(11.3,wCont,QNFE_Emitecidade_transp.Value);
    Imp.WriteXY(14.8,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(16,wCont,QNFE_Emiteinsc_transp.Value);
    wCont := wCont + 3; //----PULA LINHA
    Imp.WriteXY(0.3,wCont,QNFE_EmiteNum_Volumes.Text);
    Imp.WriteXY(15,wCont,Bib.NumToTexto(wPeso,2,8));
    Imp.WriteXY(18,wCont,Bib.NumToTexto(wPeso,2,8));
    wCont := wCont + 4; //----PULA LINHA
    Imp.WriteXY(2.5,wCont,Bib.NumToTexto(QNFE_EmiteVAL_Funrural.Value,2,13));
    wCont := wCont + 2;//----PULA LINHA
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
    wCont := wCont + 8; //----PULA LINHA
    Imp.WriteXY(8,Wcont,QNFE_EmiteNUM_NOTA.Text);
  End;
End;

Procedure TFNotaImpressao.NF_GONZATTI;    // Nota Fiscal - G. GONZATTI
var wContReceber : Byte;
    wExtenso : string;
begin
  // *** OBS - Colocar Posicao X em Centimetros
  wCont := 0;
  with DMNotaSaida do
  begin
    Imp.WriteXY(18.5,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,6) );
    wCont:=wCont + 3; //ALTERADO POR PMC 03/12/2003
//    Imp.WriteXY(2.5,wCont,'NOVA RAZAO SOCIAL: BRASPERON COMERCIO DE CEREAIS LTDA');
    //Inc(wCont); //fim alteração

    if QNFE_EmiteInd_Entrada_Saida.Value = 'E' Then
      Imp.WriteXY(15.5,wCont,'XX')
    else
      Imp.WriteXY(13.3,wCont,'XX');
    //Imp.WriteXY(18.5,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,6) );
    wCont := wCont + 6;
    Imp.WriteXY(0,wCont,QNFE_EmiteCOD_OPERACAO.Text + ' - ' + QNFE_EmiteNAT_OPERACAO.Text);
    Imp.WriteXY(7,wCont,QNFE_Emitenum_cfop.Text);  //ALTERADO SERGIO 13/12/2002
    wCont:=wCont+4;
    Imp.WriteXY(0,wCont,QNFE_EmiteNOME.Text+' - '+QNFE_EmiteCOD_CADASTRO.Text);
    Imp.WriteXY(13.2,wCont,QNFE_EmiteNUM_CGC_CPF.Value);
    Imp.WriteXY(18.2,wCont,QNFE_EmiteDT_EMISSAO.Text);
    wCont := wCont + 3;
    Imp.WriteXY(0,wCont, QNFE_EmiteDESC_ENDERECO.Value);
    Imp.WriteXY(12.3,wCont,QNFE_EmiteDESC_BAIRRO.Value);
    Imp.WriteXY(15.5,wCont,QNFE_EmiteDESC_CEP.Value);
    Imp.WriteXY(18.2,wCont,QNFE_EmiteDT_RECEBIMENTO.Text);
    wCont := wCont + 2;
    Imp.WriteXY(0,wCont,QNFE_EmiteDESC_CIDADE.Value);
    Imp.WriteXY(8.8,wCont,QNFE_EmiteDESC_TELEFONE.Value);
    Imp.WriteXY(12.2,wCont,QNFE_EmiteCOD_ESTADO.Value);
    if QNFE_EmiteIND_FISICA_JURIDICA.Value = 'F' then    // A pedido de Joao J, moinho, 03/02/2009
    begin
      If Trim(QNFE_EmiteDESC_INSCRICAO_MUNICIPAL.Value) <> '' Then
        Imp.WriteXY(13,wCont,QNFE_EmiteDESC_INSCRICAO_MUNICIPAL.Value)
      Else
        Imp.WriteXY(13,wCont,QNFE_EmiteNUM_INSCRICAO.Value);
    end
    else
    begin
      If Trim(QNFE_EmiteNUM_INSCRICAO.Value) <> '' Then
        Imp.WriteXY(13,wCont,QNFE_EmiteNUM_INSCRICAO.Value)
      Else
        Imp.WriteXY(13,wCont,QNFE_EmiteDESC_INSCRICAO_MUNICIPAL.Value);
    end;
    Imp.WriteXY(18.2,wCont,TimeToStr(Time));
    wCont := wCont + 4;
    if QNFE_EmiteInd_Condicao_Pagto.Value = '2' Then
     begin
      wContReceber:=0;
      QContaReceber.Open;
      QContaReceber.First;
      while not QContaReceber.Eof do       // Faturamento
      begin
        if wContReceber = 0 Then
        begin
          Imp.WriteXY(0,wCont,QNFE_EmiteDT_EMISSAO.Text);
          Imp.WriteXY(2,wCont,Bib.NumToTexto(QContaReceberNUM_TITULO.Value,0,6));
          Imp.WriteXY(3.7,wCont,QContaReceberDT_Vencimento.Text);
          Imp.WriteXY(6,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
          wContReceber := 1;
        end
        else
          begin
            Imp.WriteXY(8.1,wCont,QNFE_EmiteDT_EMISSAO.Text);
            Imp.WriteXY(10,wCont,Bib.NumToTexto(QContaReceberNUM_TITULO.Value,0,6));
            Imp.WriteXY(11.7, wCont,QContaReceberDT_Vencimento.Text);
            Imp.WriteXY(14,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
            wContReceber := 0;
            Inc(wCont);
          end;
        QContaReceber.Next;
      end;
      QContaReceber.Close;
     end
    else
      Imp.WriteXY(0.3,wCont,'A VISTA');

    wCont := 29;
    Imp.WriteXY(0,wCont,QNFE_EmiteCIDADE_FILIAL.Value + ' / ' + QNFE_EmiteEND_FILIAL.Value);

    wCont := 32;
    wFunrural := 0;
    If QNFE_EmiteInd_Funrural.Value = 'S' Then
       wFunrural := QNFE_Emiteval_funrural.Value;

    wExtenso := Bib.Extenso(wtotal_produtos
                                 +wvlr_ipi
                                 +QNFE_EmiteVAL_DESPESAS.Value
                                 -QNFE_EmiteVAL_Desconto.Value
                                 -wFunrural
                                 -wDesc_Transgenicos
                                 -QNFE_EmiteVal_Desconto_Fitas.Value,'REAL');

    Imp.WriteXY(0,wCont,wextenso);

    // **** Itens ****
    wCont := 46;
    QNFE_EmiteIt.First;
    while not QNFE_EmiteIT.Eof do
    begin
      Inc(wCont);
      Imp.WriteXY(0,wCont,Bib.NumToTexto(QNFE_EmiteITCod_Produto.Value,0,6));
      If QNFE_EmiteITInd_Tipo_Consumo.Value <> 'QUEBRA' Then
         Imp.WriteXY(1.7,wCont,QNFE_EmiteITDesc_Produto.Value)
      Else
         Imp.WriteXY(1.7,wCont,'Quebra Tecnica');
      Imp.WriteXY(10.9,wCont,QNFE_EmiteITDesc_Situacao_Trib.Value);
      Imp.WriteXY(11.8,wCont,QNFE_EmiteITDesc_Unidade.Value);
      Imp.WriteXY(12.6,wCont,Bib.NumToTexto(QNFE_EmiteITQT_Quantidade.Value,2,10));

      if QNFE_EmiteCOD_OPERACAO.Value = 243 then //quando for a operacao 243 o valor unitario deve ser com 5 casas após a virgula -- Fabiano 18/11/2005
        Imp.WriteXY(14.5,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value / QNFE_EmiteItQT_QUANTIDADE.Value * QNFE_EmiteItNUM_EMBALAGEM.Value ,5,12))
      else
        Imp.WriteXY(14.5,wCont,Bib.NumToTexto(QNFE_EmiteItVAL_UNITARIO.Value,3,12));

      Imp.WriteXY(17,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value,2,15));
      Imp.WriteXY(19.6,wCont,QNFE_EmiteITPerc_Aliquota.Text);

      Calc_Peso_Nota;  //rotina calcula peso produtos


      if QNFE_EmiteItDesc_Complemento.Value <> '' Then
      begin   // ** Imprimir Complemento de Descrição
        Inc(wCont);
        Imp.WriteXY(0.6,wCont,QNFE_EmiteITDesc_Complemento.Value);
      end;
      if (QNFE_EmiteItDesc_Formulacao.Value <> '') Or (QNFE_EmiteItDesc_Grupo_Quimico.Value <> '') Then
      begin   // ** Imprimir Complemento de Descrição
        Inc(wCont);
        Imp.WriteXY(0.6,wCont,Trim(QNFE_EmiteItDesc_Formulacao.Value) + ' '+Trim(QNFE_EmiteItDesc_Grupo_Quimico.Value));
      end;
      If QNFE_EmiteItInd_Tipo_Embalagem.Value <> '' Then
         wMensCorpoNota := 'S';
      If (QNFE_EmiteItInd_Tipo_Produto.Value = 'AGRICOLA') or (QNFE_EmiteItInd_Tipo_Produto.Value = 'ARROZ')then
       begin // Preco de produtos agrícolas em Sacas
         Inc(wCont);
         Imp.WriteXY(13.5,wCont,'Preco P/ '+FloatToStr(QNFE_EmiteItNum_Embalagem.Value)+' Kg');
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
        Imp.WriteXY(0.6,wCont,QNFE_EmiteItDesc_Observacao_Tr.Value);
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
    IMP_OBS_CORPO_NOTA(2, wCont);
//    FNotaImpressao.Imp_Desconto(wCont,2);
    // Imprime DPI (transgenicos)
    If wDesc_Transgenicos <> 0 Then
     Begin
       wCont := wCont + 2;
       Imp.WriteXY(1.5,wCont,'Desconto DPI - Transgenicos');
       Imp.WriteXY(15,wCont,Bib.NumToTexto(wDesc_Transgenicos,2,15));
     End;
    if QNFE_EmiteVal_Desconto_Fitas.Value > 0 then
     begin
       Inc(wCont);
       Imp.WriteXY(1.5,wCont,'Desconto Fitas Teste Transgenico:');
       Imp.WriteXY(15,wCont,Bib.NumToTexto(QNFE_EmiteVal_Desconto_Fitas.Value,2,15));
     end;
    // ** Final Nova Razão Social
    If (wCont <= 62) And (wMensCorpoNota = 'S') Then
     Begin
      Imp.WriteXY(0,62,'Endereco para entrega de embalagens vazias(triplice lavadas): Estrada para escola agricola Meu Cantinho');
      Imp.WriteXY(0,63,'Linha Tres Fazendas - Santa Terezinha de Itaipu - PR');
      Imp.WriteXY(0,64,'E Obrigatorio a apresentacao desta NF ou copia no momento da entrega das embalagens vazias, acompanhada da NF de produtor');
     End;
    wCont := 68;
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
                                 -wFunrural
                                 -wDesc_Transgenicos
                                 -QNFE_EmiteVal_Desconto_Fitas.Value,2,15));
    wCont := wCont + 4;  // Linha 60
    if Trim(QNFE_Emitenome_transp.Value) = '' then
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_Transportadora.Value)
    else
      Imp.WriteXY(0,wCont,QNFE_Emitenome_transp.Value);
    if QNFE_EmiteInd_Tipo_Frete.Value = 'FOB' Then
      Imp.WriteXY(11.7,wCont,'2') // Destinatário
    else
      Imp.WriteXY(11.7,wCont,'1'); // Emitente
    Imp.WriteXY(12.5,wCont,QNFE_EmiteDesc_Placa.Value);
    Imp.WriteXY(16,wCont,QNFE_Emitecgc_transp.Value);
    wCont := wCont+3;
    Imp.WriteXY(0,wCont,QNFE_Emiteend_transp.Value);
    Imp.WriteXY(10.8,wCont,QNFE_Emitecidade_transp.Value);
    Imp.WriteXY(14.8,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(16,wCont,QNFE_Emiteinsc_transp.Value);
    wCont := wCont + 2;
    Imp.WriteXY(0,wCont,QNFE_EmiteNum_Volumes.Text);
    Imp.WriteXY(13.5,wCont,Bib.NumToTexto(wPeso,2,8));
    Imp.WriteXY(17,wCont,Bib.NumToTexto(wPeso,2,8));
    wCont := wCont + 4;
    if wFunrural > 0 Then
    begin
      Imp.WriteXY(0,wCont,Bib.NumToTexto(wFunrural,2,13));
      Imp.WriteXY(2,wCont,QNFE_EmitePERC_FUNRURAL.Text);
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

    wCont := 96;
    Imp.WriteXY(4.5,wCont,QNFE_EmiteNOME.Text+' - '+QNFE_EmiteCOD_CADASTRO.Text);
    Imp.WriteXY(18.5,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,6) );
  end;
end;
// ---------------------- Final impressão NF GONZATTI - CEREALISTA SÃO JORGE ----\\

procedure TFNotaImpressao.EmitePedido(wDocumento: String);
Var wLinha,wParcela, wArrumaRodape : Integer;
    wEmbalagem,wTotal_Prod,wTotalDesconto,wVolume,wPesoBruto:Real;
    wPlaca, wComplemento :String;
    wIsPrimeiraPag :Boolean;
begin
  wCont := 0;
  wLinha:=0;
  wArrumaRodape := 0;
  wTotal_Prod := 0;
  wVolume:=0;
  wIsPrimeiraPag := true; //variável para Medipecas .. para checar se é a primeira pagina

  With DMNotaSaida do
  Begin
    if DMOracle.BuscaNome('SELECT IND_IMPRIME_PEDIDO FROM TB_FILIAL', 'COD_FILIAL = ' + QNFE_EmiteCOD_FILIAL.Text) = 'DESKJET' then
    begin      //Adicionado a Pedido da Chaiana para ter a opção de imprimir o relatorio na deskjet. Diego A. S. 29/10/2008
      if FRPedido = nil then
        FRPedido := TFRPedido.Create(Application);
      with DMNotaSaida do
      begin
        QRPedidoEspelho.Close;
        QRPedidoEspelho.SetVariable('COD_NOTA_CAB', QNFE_EmiteCOD_NOTA_CAB.Value);
        QRPedidoEspelho.open;
        with FRPedido do
        begin
          QRMObservacao.Height := 0;
          QRMObservacao.Lines.Clear;
          QRM1.Lines.Clear;
          QRM2.Lines.Clear;
          QRM3.Lines.Clear;
          QRM4.Lines.Clear;
          QRM5.Lines.Clear;
          QRM4.Top := 80;
          QRM5.Top := 80;

          QRLPedido.Caption := QRPedidoEspelhoNUM_NOTA.Text;
          QRLFantasia.Caption := QRPedidoEspelhoDESC_FANTASIA.Value;
          QRLRuaFilial.Caption := QRPedidoEspelhoEND_FILIAL.Value;
          QRLEndFilial.Caption := QRPedidoEspelhoCIDADE_FILIAL.Text + ', CEP: ' + QRPedidoEspelhoCEP_FILIAL.Text + '-' + QRPedidoEspelhoUF_FILIAL.Text;
          QRLDtEmissao.Caption := QRPedidoEspelhoDT_EMISSAO.Text;
          QRLNatOp.Caption := QRPedidoEspelhoCOD_OPERACAO.Text + ' - ' + QRPedidoEspelhoNAT_OPERACAO.Value;
          QRLCliente.Caption := QRPedidoEspelhoNOME.Text;
          QRLEndereco.Caption := QRPedidoEspelhoDESC_ENDERECO.Value;
          QRLFone.Caption := QRPedidoEspelhoDESC_TELEFONE.Value;
          QRLCelular.Caption := QRPedidoEspelhoDESC_CELULAR.Value;
          QRLBairro.Caption := QRPedidoEspelhoDESC_BAIRRO.Value;
          QRLCidade.Caption := QRPedidoEspelhoDESC_CIDADE.Value;
          QRLCep.Caption := QRPedidoEspelhoDESC_CEP.Value + '-' + QRPedidoEspelhoUF_NOTA.Value;
          if QRPedidoEspelhoIND_CONDICAO_PAGTO.Value = '1' then
            QRLTipoPagto.Caption := 'A Vista'
          else
            if QRPedidoEspelhoIND_CONDICAO_PAGTO.Value = '2' then
              QRLTipoPagto.Caption := 'A Prazo'
            else
              QRLTipoPagto.Caption := 'Outros';
//          QRLTipoPagto2.Caption := QRLTipoPagto.Caption;

          if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ABATE' then
            QRMObservacao.Lines.Text := 'Vendedor: ' + QRPedidoEspelhoNOME_VENDEDOR.Value;

          if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'NIR')
            or (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'BENINI')) then
          Begin
            QRMObservacao.Lines.Append('Equipamento: ' + QNFE_EmiteOBS_COMPLEMENTO.Text);
            QRMObservacao.Lines.Append('Serviço Solicitado: ' + QNFE_EmiteOBS.Text);
            QRMObservacao.Lines.Append('Tecnico: ' + QNFE_EmiteNOME_VENDEDOR.Text);
          end
          else
          Begin
            if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DINIZ' then
              QRMObservacao.Lines.Append('Observacao: ');
            QRMObservacao.Lines.Append(QNFE_EmiteOBS.Value + ' ' + QNFE_EmiteOBS_COMPLEMENTO.Value);
          end;
          If (QNFE_EmiteDesc_Transportadora.Value <> '')
            Or (QNFE_Emitenome_transp.Value <> '' ) Then
          Begin
            if Trim(QNFE_Emitenome_transp.Value) = '' then
              QRMObservacao.Lines.Append('Transp.: ' + QNFE_EmiteDesc_Transportadora.Value)
            else
              QRMObservacao.Lines.Append('Transp.: ' + QNFE_Emitenome_transp.Value);
          End;
          QRMObservacao.Height := (QRMObservacao.Lines.Count * 16) + 1;
          QRBand4.Height := QRBand4.Height + QRMObservacao.Height - 16;
          if wEmpresa = 'ABATE' Then
            QRM1.Lines.Append('Obs: '+QNFE_EmiteDESC_OBS_CORPO_NOTA.Value)
          else
          Begin
            QRM1.Lines.Append('Pedido: ' + Bib.NumTotexto(wtotal_produtos+wvlr_ipi+wTotalDesconto,2,8));
          end;
          If (wEmpresa = 'ARZ') or (wEmpresa = 'DINIZ') Then
          Begin
            If wEmpresa = 'DINIZ' Then
            Begin
              QRM2.Lines.Append('Frete: ' + Bib.NumToTexto(QNFE_EmiteVal_Despesas.Value,2,8));
              QRM3.Lines.Append('Desconto: ' + Bib.NumToTexto(QNFE_EmiteVal_Desconto.Value,2,8));
            End
            Else
              QRM3.Lines.Append('Desconto: ' + Bib.NumToTexto(QNFE_EmiteVal_Desconto.Value,2,8));
          End
          Else
            If wEmpresa <> 'ABATE' Then
            Begin
              QRM2.Lines.Append('Acrescimo: ' + Bib.NumToTexto(QNFE_EmiteVal_Despesas.Value,2,6));
              QRM3.Lines.Append('Desconto: ' + Bib.NumToTexto(QNFE_EmiteVal_Desconto.Value,2,8));
              QRLEntrada.Caption := Bib.NumToTexto(QNFE_EmiteVal_AVista.Value,2,8);
            end;
          If wEmpresa = 'ABATE' Then
            QRM3.Lines.Append('Desconto: ' + Bib.NumToTexto(QNFE_EmiteVal_Desconto.Value,2,8));

          QRM1.Lines.Append('Parcelas');
          QRM2.Lines.Append('Vencimento');
          QRM3.Lines.Append('Valor');
          QRLEmbalagem.Caption := '';
          If wEmpresa = 'CGS' Then
            QRLEmbalagem.Caption := 'M3: ' + Bib.NumToTexto(wEmbalagem,5,5);
          QContaReceber.Open;
          QContaReceber.First;
          While not QContaReceber.Eof do
          Begin
            QRM1.Lines.Append(Bib.NumTotexto(QContaReceberNUM_PARCELA.Value,0,8));
            QRM2.Lines.Append(QContaReceberDT_VENCIMENTO.Text);
            QRM3.Lines.Append(Bib.NumToTexto(QContaReceberVAL_TITULO.Value,2,8));
            QContaReceber.Next;
          End;
          QContaReceber.Close;
          if wEmpresa = 'FORTE' Then //--Alterado pq FORTE passou a imprimir assinatura. Camila 15/03/2008.
          Begin
            QRM1.Lines.Append(' ');
            QRM2.Lines.Append(' ');
            QRM3.Lines.Append(' ');
            QRM1.Lines.Append('Frete: ' + Bib.NumToTexto(QNFE_EmiteVAL_DESPESAS.Value,2,8));
            QRM2.Lines.Append(' Total da Nota: ');
            QRM3.Lines.Append(Bib.NumTotexto(wtotal_produtos + wvlr_ipi + QNFe_EmiteVal_FunRural.Value +
                                                  QNFE_EmiteVAL_DESPESAS.Value - QNFE_EmiteVal_Desconto.Value -
                                                  QNFE_EmiteVal_AVista.Value,2,10));
          end;

          If wEmpresa = 'DINIZ' Then
            QRM4.Lines.Append('______________________________________');
          if (wEmpresa = 'MEDIPECAS') or (wEmpresa = 'NIR') or (wEmpresa = 'DINIZ') or
             (wEmpresa = 'BENINI') or (wEmpresa = 'BRUSCHI') or (wEmpresa = 'TRENTO') or (wEmpresa = 'FORTE') then
          begin
            QRM5.Lines.Append('______________________________________');
            If wEmpresa = 'DINIZ' Then
               QRM4.Lines.Append('Conferente');
            QRM5.Lines.Append(QNFE_EmiteNOME.Text);

            if wEmpresa = 'FORTE' Then
            begin
              QRM4.Lines.Append('ATENCAO: Em caso de Devolução, apresentar o Comprovante de Compra.');
            end;
          end;
          if wEmpresa = 'ABATE' Then
          Begin
            QRM4.Lines.Append(' ');
            QRM5.Lines.Append(' ');
            QRM4.Lines.Append('______________________________________');
            QRM5.Lines.Append('______________________________________');
            QRM4.Lines.Append(QNFE_EmiteNOME_FILIAL.Value);
            QRM5.Lines.Append(QNFE_EmiteNOME.Value);
          end;

          if (wEmpresa = 'INSIDE') and (wCont <= 25) then
          Begin
            QRM4.Lines.Append(' ');
            QRM4.Lines.Append('_____________________________________');
            QRM4.Lines.Append('INSIDE SEMPRE UM BOM NEGOCIO');
            QRM4.Lines.Append('ASSINAR PARA CONFIRMAR ESTE PEDIDO:');
            QRM4.Lines.Append(' ');
            QRM4.Lines.Append('____________________________');
            QRM4.Lines.Append('www.insideautopecas.com.br - inside@foznet.com.br');
          End;

          if wEmpresa = 'NUTRI' then
          begin
            QRM5.Lines.Append(' ');
            QRM5.Lines.Append('N O T A  P R O M I S S O R I A');
            QRM4.Lines.Append(' ');
            QRM4.Lines.Append(' ');
            QRM4.Lines.Append(' ');
            QRM4.Lines.Append('Pagarei a '+(QNFE_EmiteNOME_FILIAL.Value)+' por esta promissoria, a quantia total de ' + (Bib.NumTotexto(wtotal_produtos
                                                                                                                          +wvlr_ipi
                                                                                                                          +QNFe_EmiteVal_FunRural.Value
                                                                                                                          -QNFE_EmiteVal_AVista.Value,2,10)) +
                                                                                                                          ' reais.');
            QRM4.Lines.Append('___________________________________________________________________');
            QRM4.Lines.Append('__________________________________________________________________');
            QRM5.Lines.Append(' ');
            QRM5.Lines.Append(' ');
            QRM5.Lines.Append(' ');
            QRM5.Lines.Append(' ');
            QRM5.Lines.Append(' ');
            QRM5.Lines.Append('ASSINATURA:________________________________________');
          end;

          QRPrimario.Preview;
        end;
      end;
    end
    else
    begin
      If Trim(QNFE_EmiteDesc_FANTASIA.Value) <> '' then
      begin
         Imp.WriteXY(10,wCont,'Fantasia:');
         Imp.WriteXY(11.5,wCont,Trim(QNFE_EmiteDesc_FANTASIA.Value));
      end;
      Imp.WriteXY(17,wCont,wDocumento);
      Imp.WriteXY(18.5,wCont,QNFE_EmiteNUM_NOTA.Text);
      wCont := wCont+1;
      IF DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'VETRO' then
        Imp.WriteXY(0.2,wCont,QNFE_EmiteNOME_FILIAL.Value);
      Imp.WriteXY(10,wCont,'Cliente:');
      Imp.WriteXY(11.5,wCont,QNFE_EmiteCOD_CADASTRO.Text);
      Imp.WriteXY(12.5,wCont,QNFE_EmiteNOME.Value);
      wCont := wCont + 1;
      IF DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'VETRO' then
        Imp.WriteXY(0.2,wCont, QNFE_EmiteEND_FILIAL.Value);
      Imp.WriteXY(10,wCont,'Endereco:');
      Imp.WriteXY(1.5,wCont, QNFE_EmiteDESC_ENDERECO.Value);
      wCont := wCont+1;
      IF DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'VETRO' then
      Begin
        Imp.WriteXY(0.2,wCont,QNFE_EmiteCEP_FILIAL.Value);
        Imp.WriteXY(3.7,wCont,QNFE_EmiteCIDADE_FILIAL.Value);
        Imp.WriteXY(3.7,wCont,'-'+QNFE_EmiteUF_FILIAL.Value);
      end;
      Imp.WriteXY(10,wCont,'Fone:');
      Imp.WriteXY(11,wCont,QNFE_EmiteDESC_TELEFONE.Value);
      Imp.WriteXY(14,wCont,'Cidade:');
      Imp.WriteXY(15.5,wCont,QNFE_EmiteDESC_CIDADE.Value);
      inc(wCont);
      Imp.WriteXY(0.2,wCont,'Emissao:');
      Imp.WriteXY(1.7,wCont,QNFE_EmiteDT_EMISSAO.Text); 
      Imp.WriteXY(10,wCont,'Bairro:');
      Imp.WriteXY(11.2,wCont,QNFE_EmiteDESC_BAIRRO.Value);
      Imp.WriteXY(14,wCont,' UF:');
      Imp.WriteXY(14.8,wCont,QNFE_EmiteCOD_ESTADO.Value);
      Imp.WriteXY(14,wCont,' CEP:');
      Imp.WriteXY(14.8,wCont,QNFE_EmiteDESC_CEP.Value);
      wCont:= wCont +1;
      Imp.WriteXY(0.2,wCont,QNFE_EmiteCod_Operacao.Text + ' - ' + Trim(QNFE_EmiteNat_Operacao.Text)+' - '+Trim(QNFE_EmiteDESC_RESUMO.Value));
      If QNFE_EmiteInd_Condicao_Pagto.Value = '1' Then
       If QNFE_EmiteInd_Troca.Value = 'S' Then
          Imp.WriteXY(10,wCont,'Troca')
       Else
         If QNFE_EmiteInd_Brinde.Value = 'S' Then
            Imp.WriteXY(10,wCont,'Brinde')
         else
           If QNFE_EmiteInd_Bonificacao.Value = 'S' Then
             Imp.WriteXY(10,wCont,'Bonificação')
           else
             Imp.WriteXY(10,wCont,'A Vista');

      IF DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TOMBINI' then
        Imp.WriteXY(15,wCont,' CNPJ: '+ QNFE_EmiteNUM_CGC_CPF.Value);

      If QNFE_EmiteInd_Condicao_Pagto.Value = '2' Then
        Imp.WriteXY(10,wCont,'A Prazo');
      If QNFE_EmiteInd_Condicao_Pagto.Value = '3' Then
         If wEmpresa = 'MOINHO' Then
          Begin
            Imp.WriteXY(8,wCont,'CHEQUE PARA :');
            Imp.WriteXY(10,wCont,DateToStr(QNFE_EmiteDT_EMISSAO.Value + QNFE_EmiteNr_Dias_Cheque.Value)+'-'+QNFE_EmiteNr_Dias_Cheque.Text + 'dd');//+ '  '+ IntToStr(QNFE_EmiteNr_Dias_Cheque.Value)+' DD');
            If QNFE_EmiteNr_Dias_Cheque1.Value <> 0 Then
               Imp.WriteXY(12.5,wCont,DateToStr(QNFE_EmiteDT_EMISSAO.Value + QNFE_EmiteNr_Dias_Cheque1.Value)+ '-'+QNFE_EmiteNr_Dias_Cheque1.Text + 'dd');
            If QNFE_EmiteNr_Dias_Cheque2.Value <> 0 Then
               Imp.WriteXY(15,wCont,DateToStr(QNFE_EmiteDT_EMISSAO.Value + QNFE_EmiteNr_Dias_Cheque2.Value)+ '-'+QNFE_EmiteNr_Dias_Cheque2.Text + 'dd');
            If QNFE_EmiteNr_Dias_Cheque3.Value <> 0 Then
               Imp.WriteXY(17.5,wCont,DateToStr(QNFE_EmiteDT_EMISSAO.Value + QNFE_EmiteNr_Dias_Cheque3.Value)+ '-'+QNFE_EmiteNr_Dias_Cheque3.Text + 'dd');
          End
         else
            Imp.WriteXY(10,wCont,'Conta Corrente');
      if wEmpresa = 'MEDIPECAS' then
      begin
        Imp.WriteXY(14,wCont,'Placa: ' + QNFE_EmiteDesc_Placa.Value);
      end;
      If (wEmpresa = 'COZER') then
      begin
        Inc(wCont);
        Imp.WriteXY(0.2,wCont,'Vendedor.....:');
        Imp.WriteXY(2.3,wCont,QNFE_EmiteCod_Vendedor.Text);
        Imp.WriteXY(2.8,wCont,QNFE_EmiteNome_Vendedor.Text);
      end;
      If QNFE_EmiteInd_Condicao_Pagto.Value = '3' Then
        If wEmpresa = 'MOINHO' Then
          If QNFE_EmiteNr_Dias_Cheque4.Value <> 0 Then
             Imp.WriteXY(10,wCont,DateToStr(QNFE_EmiteDT_EMISSAO.Value + QNFE_EmiteNr_Dias_Cheque4.Value)+ '-'+QNFE_EmiteNr_Dias_Cheque4.Text + 'dd');
      //-----------------
      if wEmpresa = 'BORGES' then
      begin
        Inc(wCont);
        Imp.WriteXY(0.2,wCont,'Vendedor.....:');
        Imp.WriteXY(2.3,wCont,QNFE_EmiteCod_Vendedor.Text);
        Imp.WriteXY(2.8,wCont,QNFE_EmiteNome_Vendedor.Text);
      end;
      //-----------------
      Inc(wCont);
      // **** Itens ****
      Imp.WriteXY(0.2,wCont,'___________________________________________________________________');
      Imp.WriteXY(0.2,wCont,'__________________________________________________________________');
      wCont := wCont+1;
      Imp.WriteXY(0.2,wCont,'QUANTIDADE');
      Imp.WriteXY(1.9,wCont,'UNID.');

      if wEmpresa = 'MEDIPECAS' then
        Imp.WriteXY(2.8,wCont,'PRODUTO')
      else
      if wEmpresa = 'ABATE' then
        Imp.WriteXY(3.2,wCont,'VOLUMES - PRODUTO')
      else
        Imp.WriteXY(3.2,wCont,'PRODUTO');
      If wEmpresa = 'ARZ' Then
       Begin
         Imp.WriteXY(11,wCont,'VL.UNITARIO  %DESC ');
         Imp.WriteXY(14.5,wCont,'PRECO FINAL');
         Imp.WriteXY(18.7,wCont,'TOTAL');
       End
      Else
       Begin
         if wEmpresa = 'MEDIPECAS' then
          Begin
           Imp.WriteXY(11,wCont,'COMPLEMENTO');
           Imp.WriteXY(14.5,wCont,'PRECO UNITARIO %DESC');
           Imp.WriteXY(18.7,wCont,'TOTAL');
          End
         else
           If wEmpresa = 'DINIZ' then
            Begin
             Imp.WriteXY(14.5,wCont,'PRECO UNITARIO ');
             Imp.WriteXY(18.7,wCont,'TOTAL');
            End
           Else
            Begin
              Imp.WriteXY(11,wCont,'LOTE');
              Imp.WriteXY(14.5,wCont,'PRECO UNITARIO %DESC');
              Imp.WriteXY(18.7,wCont,'TOTAL');
            End;
       End;
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
        if (wEmpresa = 'MEDIPECAS') Or (wEmpresa = 'DINIZ') or (wEmpresa = 'TRENTO') then
         begin
          Imp.WriteXY(2.8,wCont,QNFE_EmiteItNUM_FABRICANTE.Text);
          Imp.WriteXY(5.1,wCont,(Copy(QNFE_EmiteITDesc_Produto.Text, 1, 39)));
         end
        Else
        If wEmpresa = 'ABATE' Then
        begin
           Imp.WriteXY(3.2,wCont,QNFE_EmiteITNUM_VOLUMES_NOTA.Text);
           Imp.WriteXY(4.4,wCont,QNFE_EmiteITDesc_Produto.Value);
         end
        else
        if wEmpresa = 'SETIMO' Then
        Begin
          Imp.WriteXY(3.2,wCont,QNFE_EmiteITCod_Produto.Text);
          Imp.WriteXY(4.4,wCont,QNFE_EmiteITDesc_Produto.Value);
          inc(wCont);
          Imp.WriteXY(3.2,wCont,QNFE_EmiteITDesc_Complemento.Value);
        end
        else
        begin
          Imp.WriteXY(3.2,wCont,QNFE_EmiteITCod_Produto.Text);
          Imp.WriteXY(4.4,wCont,QNFE_EmiteITDesc_Produto.Value);
        end;
        If wEmpresa = 'ARZ' Then
         Begin
           If QNFE_EmiteITPerc_Desc.Value > 0 Then
           Begin
             Imp.WriteXY(11,wCont,Bib.NumToTexto((QNFE_EmiteITVal_Unitario.Value * 100) / (100 - QNFE_EmiteITPerc_Desc.Value),2,10));
             wTotalDesconto := wTotalDesconto + ((((QNFE_EmiteITVal_Unitario.Value * 100) / (100 - QNFE_EmiteITPerc_Desc.Value))
                                              - (QNFE_EmiteITVal_Unitario.Value)) * (QNFE_EmiteITQT_Quantidade.Value));
           end
           else
             Imp.WriteXY(11,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Unitario.Value,2,10));
           Imp.WriteXY(13.2,wCont,Bib.NumToTexto(QNFE_EmiteITPerc_Desc.Value,0,2));
           Imp.WriteXY(14.5,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Unitario.Value,2,10));
         End
        else
         Begin
          if ((wEmpresa = 'MEDIPECAS') and (DMNotaSaida.QNotaSaidaCOD_SERIE.Text = 'OS'))  then
           Begin
  //          wComplemento := DMOracle.BuscaNome('SELECT DISTINCT DESC_COMPLEMENTO FROM TB_ORDEM_SERVICO_ITEM','COD_ORDEM_SERVICO_CAB =' +
  //                                            QNFE_EmiteNUM_NOTA.Text + ' AND COD_PRODUTO ='+ QNFE_EmiteITCod_Produto.Text +
  //                                            ' AND TB_ORDEM_SERVICO_ITEM.COD_ORDEM_SERVICO_ITEM = ' + QNFE_EmiteItCOD_ORDEM_SERVICO_ITEM.Text);
  //          wComplemento := DMOrdemServico.QOrdemServicoItDESC_COMPLEMENTO.Text;
            //wComplemento := DMOracle.BuscaNome('SELECT DISTINCT DESC_COMPLEMENTO FROM TB_ORDEM_SERVICO_ITEM','COD_ORDEM_SERVICO_CAB =' +
            //                                  QNFE_EmiteNUM_NOTA.Text + ' AND TB_ORDEM_SERVICO_ITEM.COD_ORDEM_SERVICO_ITEM = ' + QNFE_EmiteItCOD_ORDEM_SERVICO_ITEM.Text);
            //Imp.WriteXY(11,wCont,wComplemento);


            Imp.WriteXY(11,wCont,QNFE_EmiteItDESC_COMPLEMENTO_OS.Value);
           end
          else
            If (wEmpresa <> 'DINIZ') Then
               Imp.WriteXY(11,wCont,QNFE_EmiteITDesc_Lote.Value);
          Imp.WriteXY(15,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Unitario.Value,2,10));
          If (wEmpresa <> 'DINIZ') Then
            Imp.WriteXY(17,wCont,Bib.NumToTexto(QNFE_EmiteITPerc_Desc.Value,0,2));
         End;
        Imp.WriteXY(18,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value,2,10));
        wVolume := wVolume + QNFE_EmiteITNUM_VOLUMES_NOTA.Value;
        wEmbalagem := wEmbalagem + (QNFE_EmiteITQT_Quantidade.Value * QNFE_EmiteITNum_Embalagem.Value);
        wTotal_Prod := wTotal_Prod + QNFE_EmiteITQT_Quantidade.Value;
        wPesoBruto := wPesoBruto  + QNFE_EmiteItNUM_VOLUMES_NOTA.Value * QNFE_EmiteItNum_Embalagem.Value;

        if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'NIR') and (DMNotaSaida.QNotaSaidaCOD_SERIE.Text = 'OS'))  then
        Begin
          wComplemento := DMOracle.BuscaNome('SELECT DESC_COMPLEMENTO FROM TB_ORDEM_SERVICO_ITEM','COD_ORDEM_SERVICO_CAB =' +
                                            QNFE_EmiteNUM_NOTA.Text + ' AND COD_PRODUTO ='+ QNFE_EmiteITCod_Produto.Text);
          inc(wCont);
          Imp.WriteXY(0.2,wCont,wComplemento);
        end;

        if (wLinha = 24) and (wEmpresa <> 'MEDIPECAS') then
        begin
           wCont := wCont+2;
           Imp.WriteXY(18.2,wCont,'continua');
           wCont := wCont+5;
           Imp.WriteXY(18.2,wCont,'continua');
           wCont:=wCont+2;
           wLinha:=-1;
        end;
        if wIsPrimeiraPag = true then
        begin
          wArrumaRodape := wLinha;
          if (wEmpresa = 'MEDIPECAS') and (wLinha = 29) then
          begin
             wCont := wCont+1;
             Imp.WriteXY(18.2,wCont,'continua');
             wCont := wCont+3;
             Imp.WriteXY(18.2,wCont,'continua');
             wCont:=wCont+1;
             wLinha := -1;
             wIsPrimeiraPag := false;
          end;
        end
        else
        begin
          wArrumaRodape := wLinha;
          if (wEmpresa = 'MEDIPECAS') and (wLinha = 27) then
          begin
             wCont := wCont+1;
             Imp.WriteXY(18.2,wCont,'continua');
             wCont := wCont+3;
             Imp.WriteXY(18.2,wCont,'continua');
             wCont:=wCont+1;
             wLinha:=-1;
          end;
        end;
        QNFE_EmiteIT.Next;
        wCont := wCont + 1;
        inc(wLinha);
      End;
      // *** Final dos Itens ****
      if wEmpresa = 'ABATE' Then
        Imp.WriteXY(0.2,wCont,'L'+Bib.NumToTexto(wTotal_Prod,2,10))
      else
        Imp.WriteXY(0.2,wCont,Bib.NumToTexto(wTotal_Prod,2,10));
      if wEmpresa = 'ABATE' Then
      Begin
        Imp.WriteXY(2.2,wCont,Bib.NumToTexto(wVolume,2,10));
        inc(wCont);
        Imp.WriteXY(0.2,wCont,'B'+Bib.NumToTexto((wPesoBruto+wTotal_Prod),2,10));
      end;

      if wEmpresa = 'MEDIPECAS' then
       begin
          if wIsPrimeiraPag then
          begin
          if wArrumaRodape > 22 then
            wCont := wCont + (11-(wArrumaRodape - 22));
          end
          else
            if wArrumaRodape > 20 then //deve ter mais de 20 itens na pagina
              wCont := wCont + (11-(wArrumaRodape - 20));
       end
      else
       if wLinha > 18 then
          wCont := wCont + 3
       Else
          Inc(wCont);
      if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ABATE' then
      Begin
        inc(wCont,2);
        Imp.WriteXY(0.2,wCont,'Vendedor:'+ QNFE_EmiteNOME_VENDEDOR.Text+ ' - ');
      end;

      if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'NIR') or (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'BENINI')) then
      Begin
        Imp.WriteXY(0.2,wCont,'Equipamento:' + QNFE_EmiteOBS_COMPLEMENTO.Text);
        inc(wCont);
        Imp.WriteXY(0.2,wCont,'Serviço Solicitado:' + QNFE_EmiteOBS.Text);
        inc(wCont);
        Imp.WriteXY(0.2,wCont,'Tecnico:'+ QNFE_EmiteNOME_VENDEDOR.Text);
      end
      else
      Begin
        if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DINIZ' then
           If wCont < 21 then
              wCont := 21;
        if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'INSIDE' then
        begin
          Imp.WriteXY(0.2,wCont,'Observacao:');
          Imp.WriteXY(2.2,wCont,QNFE_EmiteOBS.Value + ' ' + QNFE_EmiteOBS_COMPLEMENTO.Value);
        end;
      end;
      wCont := wCont+1;
      if (wEmpresa = 'NUTRI') then
      begin
        if (QNFE_EmiteDESC_OBS_CORPO_NOTA.Value <> '') then
          Imp.WriteXY(0.2, wCont, QNFE_EmiteDESC_OBS_CORPO_NOTA.Value); // A pedido de Patrick, Diego A.S. - 21/11/2008
        Inc(wCont, 1); // A pedido de Patrick, Diego A.S. - 24/11/2008
      end;
      If (QNFE_EmiteDesc_Transportadora.Value <> '') Or (QNFE_Emitenome_transp.Value <> '' ) Then
      Begin
        if Trim(QNFE_Emitenome_transp.Value) = '' then
          Imp.WriteXY(0.2,wCont,'Transp.:'+QNFE_EmiteDesc_Transportadora.Value)
        else
          Imp.WriteXY(0.2,wCont,'Transp.:'+QNFE_Emitenome_transp.Value);
        Inc(wCont);
      End;
      if wEmpresa = 'ABATE' Then
        Imp.WriteXY(0.2,wCont,'Obs: '+QNFE_EmiteDESC_OBS_CORPO_NOTA.Value)
      else
      Begin
        Imp.WriteXY(0.2,wCont,'Pedido:');
        Imp.WriteXY(1.7,wCont,Bib.NumTotexto(wtotal_produtos+wvlr_ipi+wTotalDesconto,2,10));
      end;
      If (wEmpresa = 'ARZ') or (wEmpresa = 'DINIZ') Then
       Begin
        If wEmpresa = 'DINIZ' Then
         Begin
           Imp.WriteXY(4.2,wCont,'Frete:');
           Imp.WriteXY(5.6,wCont,Bib.NumToTexto(QNFE_EmiteVal_Despesas.Value,2,11));
           Imp.WriteXY(7.9,wCont,'Desconto:');
           Imp.WriteXY(9.2,wCont,Bib.NumToTexto(QNFE_EmiteVal_Desconto.Value,2,10));
         End
        Else
         Begin
           Imp.WriteXY(7.9,wCont,'Desconto:');
           Imp.WriteXY(9.2,wCont,Bib.NumToTexto(QNFE_EmiteVal_Desconto.Value,2,10));
         End
       End
      Else
       If wEmpresa <> 'ABATE' Then
        Begin
         Imp.WriteXY(4.2,wCont,'Acrescimo:');
         Imp.WriteXY(5.9,wCont,Bib.NumToTexto(QNFE_EmiteVal_Despesas.Value,2,11));
         Imp.WriteXY(7.9,wCont,'Desconto:');
         Imp.WriteXY(9.2,wCont,Bib.NumToTexto(QNFE_EmiteVal_Desconto.Value,2,11));
         Imp.WriteXY(11.2,wCont,'Entrada:');
         Imp.WriteXY(12.6,wCont,Bib.NumToTexto(QNFE_EmiteVal_AVista.Value,2,11));
       end;
      If wEmpresa = 'ABATE' Then
       Begin
        inc(wCont);
        Imp.WriteXY(16.7,wCont,'Total:');
        Imp.WriteXY(18.2,wCont,Bib.NumTotexto(wtotal_produtos
                                             +wvlr_ipi
                                             +QNFe_EmiteVal_FunRural.Value
                                             -QNFE_EmiteVal_AVista.Value,2,10));
        inc(wCont);
        Imp.WriteXY(16.7,wCont,'Desconto:');
        Imp.WriteXY(18.2,wCont,Bib.NumToTexto(QNFE_EmiteVal_Desconto.Value,2,11));

        inc(wCont);
        Imp.WriteXY(16.7,wCont,'Total:');
        Imp.WriteXY(18.2,wCont,Bib.NumToTexto(wtotal_produtos
                                             +wvlr_ipi
                                             +QNFe_EmiteVal_FunRural.Value
                                             -QNFE_EmiteVal_AVista.Value
                                             -QNFE_EmiteVal_Desconto.Value,2,11));
       end
       else
       Begin
        Imp.WriteXY(16.7,wCont,'Total:');
        Imp.WriteXY(18.2,wCont,Bib.NumTotexto(wtotal_produtos
                                             +wvlr_ipi
                                             +QNFe_EmiteVal_FunRural.Value
                                             -QNFE_EmiteVal_Desconto.Value
                                             -QNFE_EmiteVal_AVista.Value
                                             +QNFE_EmiteVal_Despesas.Value,2,10));

       end;
      //----bloco impressao dados do recebedor(Faville e Zadimel) Fabio 14/06/2005
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
        wCont := wCont + 1; //Era 2 - 10/08/2007
        QContaReceber.Close;
      if wEmpresa = 'FORTE' Then //--Alterado pq FORTE passou a imprimir assinatura. Camila 15/03/2008.
      Begin
        wCont := wCont + 2;
        Imp.WriteXY(0.3,wCont,'Frete:');
        Imp.WriteXY(0.7,wCont,Bib.NumToTexto(QNFE_EmiteVAL_DESPESAS.Value,2,8));
        Imp.WriteXY(5,wCont,'Total da Nota:');
        Imp.WriteXY(6.2,wCont,Bib.NumTotexto(wtotal_produtos + wvlr_ipi + QNFe_EmiteVal_FunRural.Value   +
                                              QNFE_EmiteVAL_DESPESAS.Value - QNFE_EmiteVal_Desconto.Value -
                                              QNFE_EmiteVal_AVista.Value,2,10));
        Inc(wCont);
      end;

      If wEmpresa = 'DINIZ' Then
        Imp.WriteXY(1,wCont,'______________________________________');
      if (wEmpresa = 'MEDIPECAS') or (wEmpresa = 'NIR') or (wEmpresa = 'DINIZ') or
         (wEmpresa = 'BENINI') or (wEmpresa = 'BRUSCHI') or (wEmpresa = 'TRENTO') or (wEmpresa = 'FORTE') then
      begin
        Imp.WriteXY(13,wCont,'______________________________________');
        Inc(wCont);
        If wEmpresa = 'DINIZ' Then
           Imp.WriteXY(2,wCont,'Conferente');
        Imp.WriteXY(13,wCont, QNFE_EmiteNOME.Text);

        //------------------------Camila 15/03/2008
        if wEmpresa = 'FORTE' Then
        begin
          Inc(wCont);
          Imp.WriteXY(0.2, wCont, 'ATENCAO: Em caso de Devolução, apresentar o Comprovante de Compra.');
        end;
        //------------------------
      end;
      if wEmpresa = 'ABATE' Then
      Begin
        inc(wCont,2);
        Imp.WriteXY(1,wCont,'______________________________________');
        Imp.WriteXY(13,wCont,'______________________________________');
        inc(wCont);
        Imp.WriteXY(1,wCont,QNFE_EmiteNOME_FILIAL.Value);
        Imp.WriteXY(13,wCont,QNFE_EmiteNOME.Value);
      end;

      if (wEmpresa = 'INSIDE') and (wCont <= 25) then
      Begin
        wCont := 26;
        Imp.WriteXY(0.2,wCont,'___________________________________________________________________');
        Imp.WriteXY(0.2,wCont,'__________________________________________________________________');
        Inc(wCont);
        Imp.WriteXY(0.2, wCont, 'INSIDE SEMPRE UM BOM NEGOCIO');
        Inc(wCont);
        Imp.WriteXY(0.2, wCont, 'ASSINAR PARA CONFIRMAR ESTE PEDIDO: ____________________________');
        Inc(wCont);
        Imp.WriteXY(0.2, wCont, 'www.insideautopecas.com.br - inside@foznet.com.br');
      End;

      if wEmpresa = 'NUTRI' then
      begin
        wCont := 18; //21
        imp.WriteXY(0.2, wCont, '                                                     N O T A  P R O M I S S O R I A');
        Inc(wCont);
        imp.WriteXY(0.2,wCont,'Pagarei a '+(QNFE_EmiteNOME_FILIAL.Value)+' por esta promissoria, a quantia total de ' + (Bib.NumTotexto(wtotal_produtos
                                                                                                                      +wvlr_ipi
                                                                                                                      +QNFe_EmiteVal_FunRural.Value
                                                                                                                      -QNFE_EmiteVal_AVista.Value,2,10)) +
                                                                                                                      ' reais.');
        Inc(wCont);
        Imp.WriteXY(0.2,wCont,'___________________________________________________________________');
        Imp.WriteXY(0.2,wCont,'__________________________________________________________________');
        Inc(wCont,2);
        Imp.WriteXY(12,wCont, 'ASSINATURA:________________________________________');
      end;
    end;
  End;
end;
//------------------------------------------
procedure TFNotaImpressao.EmitePedido_Bobina;
Var wCodFinalidade : Integer;
    wQuant, wVlUnitario,wVlDesconto : Real;
    wVal : string;
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

    // ****** Contas a receber ********
    if QNFE_EmiteInd_Condicao_Pagto.Value = '2' Then
    begin
      Imp.WriteXY(0,wCont,'________________________________________');
      Inc(wCont);
      Imp.WriteXY(0,wCont,'PRESTACOES A PAGAR');
      Inc(wCont);
      Imp.WriteXY(0,wCont,'________________________________________');
      Inc(wCont);
      //wCont := wCont + 1;
      QContaReceber.Open;
      QContaReceber.First;
      wCodFinalidade := QContaReceberCOD_FINALIDADE.Value; //essa variavel é usada mais abaixo, ao gerar a mensagem de juros
      Imp.WriteXY(1.3, wCont, 'Vencimento');
      Imp.WriteXY(4, wCont, 'Valor');
      wCont := wCont + 1;
      while not QContaReceber.Eof do       // Faturamento
      begin
        Imp.WriteXY(1.3, wCont, QContaReceberDT_Vencimento.Text);
        Imp.WriteXY(3.5, wCont, Bib.NumToTexto(QContaReceberVal_Titulo.Value, 2, 8));
        Inc(wCont);
        QContaReceber.Next;
      end;
      QContaReceber.Close;
    end;
    // ****** fim Contas a receber ********

    // **** Itens ****
    Imp.WriteXY(0, wCont, '________________________________________');
    Inc(wCont);
    Imp.WriteXY(0, wCont, 'QUANTIDADE UN DESCRICAO');
    Inc(wCont);
    Imp.WriteXY(2, wCont, 'PRECO UNITARIO');
    Imp.WriteXY(5, wCont, 'TOTAL');
    Inc(wCont);
    Imp.WriteXY(0, wCont, '________________________________________');
    Inc(wCont);
    wQuant := 0;
    QNFE_EmiteIt.First;
    wVlDesconto := 0; //calcula o desconto total
    While Not QNFE_EmiteIT.Eof do
    Begin
      wVlUnitario   := QNFE_EmiteItVAL_UNITARIO.Value;
      If (QNFE_EmiteItPERC_DESC.Text <> '') And (QNFE_EmiteItPERC_DESC.Text <> '0') Then
      Begin
        wVlUnitario := (wVlUnitario * 100) / (100 - QNFE_EmiteITPerc_Desc.Value); // este calculo acha o valor unitario sem desconto
        wVlDesconto := wVlDesconto + ((wVlUnitario - QNFE_EmiteITVal_Unitario.Value)*QNFE_EmiteITQt_Quantidade.Value); // para achar o valor que foi dado de desconto
      End;

      wQuant := wQuant + QNFE_EmiteITQT_Quantidade.Value;
      Imp.WriteXY(0,wCont,Bib.NumToTexto(QNFE_EmiteITQT_Quantidade.Value,2,10));
      Imp.WriteXY(1.6,wCont,QNFE_EmiteITDesc_Unidade.Value);
      Imp.WriteXY(2.2,wCont,Trim(QNFE_EmiteITCod_Produto.Text)+'-'+copy(Trim(QNFE_EmiteITDesc_Produto.Text),1,20));
      Inc(wCont);
      Imp.WriteXY(2,wCont,Bib.NumToTexto(wVlUnitario, 2, 10));   //Imp.WriteXY(2,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Unitario.Value,2,10));
      Imp.WriteXY(4.2,wCont,Bib.NumToTexto((wVlUnitario * QNFE_EmiteITQT_Quantidade.Value), 2, 10)); //Imp.WriteXY(4.2,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value, 2, 10));
      QNFE_EmiteIT.Next;
      wCont := wCont + 1;
    End;
    Inc(wCont);
    Imp.WriteXY(0,wCont,'____________');
    Inc(wCont);
    Imp.WriteXY(0,wCont,Bib.NumToTexto(wQuant,2,10));
    // *** Final dos Itens ****
    wCont := wCont+3;
    Imp.WriteXY(0,wCont,'Observacao:');
    Imp.WriteXY(2,wCont,QNFE_EmiteOBS.Value + ' ' + QNFE_EmiteOBS_COMPLEMENTO.Value);
    wCont := wCont+1;
    Imp.WriteXY(0,wCont,'Pedido:');
    Imp.WriteXY(1.5,wCont,Bib.NumTotexto(wtotal_produtos+wvlr_ipi+wVlDesconto,2,10));
    Imp.WriteXY(3,wCont,'Desc:');
    Imp.WriteXY(3.7,wCont,Bib.NumToTexto(QNFE_EmiteVal_Desconto.Value+wVlDesconto,2,11));
    Inc(wCont);
    Imp.WriteXY(0,wCont,'Entrada:');
    Imp.WriteXY(1.5,wCont,Bib.NumTotexto(QNFE_EmiteVal_AVista.Value,2,10));
    Imp.WriteXY(3,wCont,'Total:');
    Imp.WriteXY(3.7,wCont,Bib.NumTotexto(wtotal_produtos
                                         +wvlr_ipi
                                         -QNFe_EmiteVal_Funrural.Value 
                                         -QNFE_EmiteVal_Desconto.Value,2,10));
    //Imp.WriteXY(3.7,wCont,Bib.NumTotexto(wtotal_produtos
    //                                     +wvlr_ipi
    //                                     +QNFe_EmiteVal_Funrural.Value
    //                                     -QNFE_EmiteVal_AVista.Value
   //                                      -QNFE_EmiteVal_Desconto.Value,2,10));

    if QNFE_EmiteInd_Condicao_Pagto.Value = '2' Then
    begin
      Inc(wCont);
      Imp.WriteXY(0,wCont,'________________________________________');
      wVal := DMOracle.BuscaNome('SELECT PERC_TAXA FROM TB_FINALIDADE','COD_FINALIDADE = ' + IntToStr(wCodFinalidade));
      if wVal <> '' then
      begin
        Inc(wCont);
        Imp.WriteXY(0,wCont,'Apos 7 dias do Vencimento, correcao');
        Inc(wCont);
        Imp.WriteXY(0,wCont,'diaria de ' + FormatFloat('##0.00',strtofloat(wval)/30) + '% ao dia, Após 20 dias');
        Inc(wCont);
        Imp.WriteXY(0,wCont,'do vencimento, Multa de 2%.');
        Inc(wCont);
      end;
      Inc(wCont);
      Imp.WriteXY(0,wCont,'Reconheco que pagarei a divida ');
      Inc(wCont);
      Imp.WriteXY(0,wCont,'discriminada nesta nota');
      wCont := wCont + 2;
      Imp.WriteXY(0,wCont,' Assinatura:____________________________');
      Inc(wCont);
      Imp.WriteXY(0,wCont,'________________________________________');
    end;
    wCont := wCont + 2;
    Imp.WriteXY(0,wCont,'Nao Vale Como Nota Fiscal,');
    wCont := wCont + 1;
    Imp.WriteXY(0,wCont,'Exija sua Nota Fiscal');
    wCont := wCont + 6;
    Imp.WriteXY(4.5,wCont,'');
  End;
end;
// Inicio do procedimento de impressão NF - MEDIBENS
Procedure TFNotaImpressao.NF_MEDIBENS;
var wContServico : Byte;
    wTotalISS, wTotalServico : Real;
begin
  // *** Emissão de Nota Fiscal para a MEDIBENS Informatica
  // *** OBS - Colocar Posicao X em Centimetros
  // *** wNotaGlobal Controla a quebra de continuação
  wTotalISS := 0;
  wTotalServico := 0;
  wMsgTributacao := '';
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
          Imp.WriteXY(10.5,wCont,QNFE_EmiteITDesc_Situacao_Trib.Value);
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
        If QNFE_EmiteITDESC_OBSERVACAO_TR.Value <> '' Then
           wMsgTributacao := QNFE_EmiteITDESC_OBSERVACAO_TR.Value;
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
        wCont := wCont + 2 - wContServico;
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
    If Trim(QNFE_EmiteOBS_COMPLEMENTO.Value) <> '' Then
     begin
       Imp.WriteXY(0.2,wCont,QNFE_EmiteOBS_COMPLEMENTO.Value);
       Inc(wCont);
     end;
    If Trim( QNFE_EmiteDesc_Mensagem.Value)<>'' Then
     begin
       Imp.WriteXY(0.2,wCont,QNFE_EmiteDesc_Mensagem.Value);
       Inc(wCont);
     end;
    If Trim(QNFE_EmiteDesc_COMPLEMENTO.Value) <> '' Then
     begin
       Imp.WriteXY(0.2,wCont,QNFE_EmiteDesc_COMPLEMENTO.Value);
       Inc(wCont);
     end;
    If QNFE_EmiteInd_Condicao_Pagto.Value = '1' Then
     begin
       Imp.WriteXY(0.2,wCont,'Pagamento a Vista');
       Inc(wCont);
     end;
    If wMsgTributacao <> '' Then
     Begin
       Imp.WriteXY(0.2,wCont,wMsgTributacao);
       Inc(wCont);
     End;
    If QNFE_EmiteInd_Condicao_Pagto.Value = '2' Then
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

Procedure TFNotaImpressao.NF_TEMPERMED;
var wContServico,wContReceber : Byte;
    wTotalISS, wTotalServico : Real;
begin
  // *** Emissão de Nota Fiscal para a TEMPERMED
  // *** OBS - Colocar Posicao X em Centimetros
  // *** wNotaGlobal Controla a quebra de continuação
  if DMNotaSaida.QNFE_EmiteCOD_FILIAL.Value = 1 then
  Begin
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
        If QNFE_EmiteInd_Condicao_Pagto.Value = '1' Then
           Imp.WriteXY(0.2,wCont,'A VISTA');

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
             Imp.WriteXY(18,wCont,QNFE_EmiteITPerc_Ipi.Text);
             Imp.WriteXY(18.7,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Ipi.Value,2,5));
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
             wCont := 44;
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
      IMP_OBS_CORPO_NOTA(1, wCont);
  //    FNotaImpressao.Imp_Desconto(wCont,1);
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

      if Trim(QNFE_EmiteDesc_Mensagem.Value) <> '' Then
      begin
        Imp.WriteXY(0,wCont,QNFE_EmiteDesc_Mensagem.Value);
        wCont := wCont + 1;
      end;
      Imp.WriteXY(0,wCont,QNFE_EmiteOBS.Value);
      Inc(wCont);
      if Trim(QNFE_EmiteOBS_COMPLEMENTO.Value) <> '' Then
      begin
        Imp.WriteXY(0,wCont,QNFE_EmiteOBS_COMPLEMENTO.Value);
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
  end
  else
  if DMNotaSaida.QNFE_EmiteCOD_FILIAL.VALUE = 2 Then  //vidraçaria amazonas
  Begin
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
        Imp.WriteXY(11.5,wCont,QNFE_EmiteCOD_ESTADO.Value);
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
        If QNFE_EmiteInd_Condicao_Pagto.Value = '1' Then
           Imp.WriteXY(0.2,wCont,'A VISTA');

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
             Imp.WriteXY(12.5,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Unitario.Value,2,7));
             Imp.WriteXY(14,wCont,Bib.NumToTexto(QNFE_EmiteITPerc_Desc.Value,0,2));
             Imp.WriteXY(15.5,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value,2,9));
             Imp.WriteXY(17.5,wCont,QNFE_EmiteITPerc_Aliquota.Text);
             Imp.WriteXY(18,wCont,QNFE_EmiteITPerc_Ipi.Text);
             Imp.WriteXY(18.7,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Ipi.Value,2,5));
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
      IMP_OBS_CORPO_NOTA(1, wCont);
  //    FNotaImpressao.Imp_Desconto(wCont,1);
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

      if Trim(QNFE_EmiteDesc_Mensagem.Value) <> '' Then
      begin
        Imp.WriteXY(0,wCont,QNFE_EmiteDesc_Mensagem.Value);
        wCont := wCont + 1;
      end;
      Imp.WriteXY(0,wCont,QNFE_EmiteOBS.Value);
      Inc(wCont);
      if Trim(QNFE_EmiteOBS_COMPLEMENTO.Value) <> '' Then
      begin
        Imp.WriteXY(0,wCont,QNFE_EmiteOBS_COMPLEMENTO.Value);
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
  end;
// final nota impressão Tempermed

{Procedure TFNotaImpressao.Imp_Desconto(wLinha : Integer;wColuna:Real);
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
}
Procedure TFNotaImpressao.Calc_Peso_Nota;
begin
  If (DMNotaSaida.QNFE_EmiteITInd_Tipo_Produto.Value = 'AGRICOLA') Then
  Begin
    wPeso := wPeso + DMNotaSaida.QNFE_EmiteITQT_Quantidade.Value;
    wPesoBruto := wPesoBruto + DMNotaSaida.QNFE_EmiteITQT_Quantidade.Value;
  End
  Else
  Begin
    wPeso := wPeso + DMNotaSaida.QNFE_EmiteITQT_Quantidade.Value * DMNotaSaida.QNFE_EmiteITNum_embalagem.Value;
    wPesoBruto := wPesoBruto + DMNotaSaida.QNFE_EmiteITQT_Quantidade.Value * DMNotaSaida.QNFE_EmiteITNum_Volumes.Value;
  End;
End;

Procedure TFNotaImpressao.NF_BRUSCHI;
Var wContReceber : Real;
begin
  // *** Emissão de Nota Fiscal para a NIR Informatica
  // *** OBS - Colocar Posicao X em Centimetros
  // *** wNotaGlobal Controla a quebra de continuação
  with DMNotaSaida do
  begin
    wNotaGlobal := 0;
          wCont := 1;  // INICIALIZA VALOR DA VARIAVEL - Robson 26/06/2000
    while wNotaGlobal < 2 do
    begin
      wCont := 1;

      If QNFE_EmiteInd_Entrada_Saida.Value = 'S' Then
         Imp.WriteXY(10.1,wCont,'X')
      else
        Imp.WriteXY(12.0,wCont,'X');

      If wNotaGlobal = 1 then
         Imp.WriteXY(10.1,wCont,'CONTINUACAO');
      wNotaGlobal := 2;

      Imp.WriteXY(15.2,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
      Imp.WriteXY(18.3,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
      wCont := wCont+5;
      Imp.WriteXY(0.2,wCont,QNFE_EmiteNAT_OPERACAO.Value);
      Imp.WriteXY(5.6,wCont,QNFE_Emitenum_cfop.Text);  //ALTERADO SERGIO 13/12/2002
      Imp.WriteXY(7.0,wCont,QNFE_EmiteINSCRICAO_FILIAL.Text);
      wCont := wCont+3;
      Imp.WriteXY(0.2,wCont,QNFE_EmiteCOD_CADASTRO.Text);
      Imp.WriteXY(1.1,wCont,QNFE_EmiteNOME.Value);
      Imp.WriteXY(10.2,wCont,QNFE_EmiteNUM_CGC_CPF.Value);
      Imp.WriteXY(15,wCont,QNFE_EmiteDT_EMISSAO.Text);
      wCont := wCont + 2;
      Imp.WriteXY(0.2,wCont, QNFE_EmiteDESC_ENDERECO.Value);
      Imp.WriteXY(8.5,wCont,QNFE_EmiteDESC_BAIRRO.Value);
      Imp.WriteXY(12.2,wCont,QNFE_EmiteDESC_CEP.Value);
      Imp.WriteXY(15,wCont,QNFE_EmiteDT_EMISSAO.Text);
      wCont := wCont+2;
      Imp.WriteXY(0.2,wCont,QNFE_EmiteDESC_CIDADE.Value);
      Imp.WriteXY(6.8,wCont,QNFE_EmiteDESC_TELEFONE.Value);
      Imp.WriteXY(9.2,wCont,QNFE_EmiteCOD_ESTADO.Value);
      Imp.WriteXY(10.7,wCont,QNFE_EmiteNUM_INSCRICAO.Value);
      Wcont :=wCont + 3;
      if QNFE_EmiteInd_Condicao_Pagto.Value = '1' Then
        begin
        Imp.WriteXY(0.2,wCont,'Pagamento a Vista');
        end;
      if QNFE_EmiteInd_Condicao_Pagto.Value = '2' Then
        begin
          wContReceber:=0;
          QContaReceber.Open;
          QContaReceber.First;
          while not QContaReceber.Eof do
          begin
            if wContReceber = 0 Then
              Begin
                Imp.WriteXY(0,wCont,Bib.NumToTexto(QContaReceberNUM_TITULO.Value,0,6) );
                Imp.WriteXY(1.3,wCont,QContaReceberDT_Vencimento.Text);
                Imp.WriteXY(3.4,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
                wContReceber := 1;
              end
            else
            if wContReceber = 1 Then
              Begin
                Imp.WriteXY(5.2,wCont,Bib.NumToTexto(QContaReceberNUM_TITULO.Value,0,6) );
                Imp.WriteXY(6.8,wCont,QContaReceberDT_Vencimento.Text);
                Imp.WriteXY(9.5,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
                wContReceber := 2;
              end
            else
            if wContReceber = 2 Then
              Begin
                Imp.WriteXY(11.2,wCont,Bib.NumToTexto(QContaReceberNUM_TITULO.Value,0,6) );
                Imp.WriteXY(13,wCont,QContaReceberDT_Vencimento.Text);
                Imp.WriteXY(15.5,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
                wContReceber := 3;
              end;
        QContaReceber.Next;
         end;
      QContaReceber.Close;
      end;
      // **** Itens de produtos ****
      wCont := wCont + 4;
      wContLinha := 0;
      // somente pode posicionar no inicio do arquivo a primeira vez
      if wNotaGlobal = 0 then
         QNFE_EmiteIt.First;
      while not QNFE_EmiteIT.Eof do
      begin
        Inc(wCont);
        Inc(wcontLinha);
        Imp.WriteXY(0,wCont,Bib.NumToTexto(QNFE_EmiteITCod_Produto.Value,0,6));
        Imp.WriteXY(2,wCont,QNFE_EmiteITDesc_Produto.Value);
        Imp.WriteXY(9,wCont,QNFE_EmiteITNum_Classificacao.Value);
        Imp.WriteXY(9.8,wCont,QNFE_EmiteITDesc_Unidade.Value);
        Imp.WriteXY(10.2,wCont,Bib.NumToTexto(QNFE_EmiteITQT_Quantidade.Value,0,8));
        Imp.WriteXY(11.7,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Unitario.Value,3,11));
        Imp.WriteXY(13,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value,2,19));
        Imp.WriteXY(17.2,wCont,QNFE_EmiteITPerc_Aliquota.Text);
        if QNFE_EmiteItDesc_Complemento.Value <> '' Then
        begin   // ** Imprimir Complemento de Descrição
          Inc(wCont);
          Inc(wContLinha);
          Imp.WriteXY(1,wCont,QNFE_EmiteITDesc_Complemento.Value);
        end;
        QNFE_EmiteIT.Next;
        if wContLinha >= 15 then
        begin
          wCont := 41;
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
    IMP_OBS_CORPO_NOTA(1, wCont);
//    FNotaImpressao.Imp_Desconto(wCont,1);
    // *** Final dos Itens ****
    wCont := 42;
    Imp.WriteXY(0.2,wCont,Bib.NumToTexto(wbase_icm_tributada,2,18));
    Imp.WriteXY(2.5,wCont,Bib.NumToTexto(wvlr_icm,2,17));
    Imp.WriteXY(13.4,wCont,Bib.NumToTexto(wtotal_produtos,2,20));
    wCont := wCont + 2;
    Imp.WriteXY(0.2,wCont,Bib.NumToTexto(QNFE_EmiteVAL_FRETE.Value,2,18));
    Imp.WriteXY(6,wCont,Bib.NumToTexto(QNFE_EmiteVAL_DESPESAS.Value,2,17));
    Imp.WriteXY(10.2,wCont,Bib.NumToTexto(wvlr_ipi,2,15));
    Imp.WriteXY(13.4,wCont,Bib.NumToTexto( wtotal_produtos
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
      Imp.WriteXY(9.3,wCont,'2') // Destinatário
    else
      Imp.WriteXY(9.3,wCont,'1'); // Emitente
    Imp.WriteXY(10.2,wCont,QNFE_EmiteDesc_Placa.Value);
    Imp.WriteXY(14,wCont,QNFE_Emitecgc_transp.Value);
    wCont := wCont+2;
    Imp.WriteXY(0.2,wCont,QNFE_Emiteend_transp.Value);
    Imp.WriteXY(7.8,wCont,QNFE_Emitecidade_transp.Value);
    Imp.WriteXY(12.5,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(14,wCont,QNFE_Emiteinsc_transp.Value);
    wCont := wCont + 2;
    Imp.WriteXY(1,wCont,QNFE_EmiteNUM_VOLUMES.Text);
    wCont := wCont + 4;
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
  end;
//  Imp.SaltaPagina;
end;

Procedure TFNotaImpressao.NF_COBRA;
Var wContReceber : Real;
begin
  // *** Emissão de Nota Fiscal para a Cobra Artefatos cimento
  // *** OBS - Colocar Posicao X em Centimetros
  // *** wNotaGlobal Controla a quebra de continuação
  with DMNotaSaida do
  begin
    wNotaGlobal := 0;
          wCont := 0;  // INICIALIZA VALOR DA VARIAVEL - Robson 26/06/2000
    while wNotaGlobal < 2 do
    begin
      wCont := 0;
      If wNotaGlobal = 1 then
         Imp.WriteXY(10.1,wCont,'CONTINUACAO');
      wNotaGlobal := 2;
      If QNFE_EmiteInd_Entrada_Saida.Value = 'S' Then
         Imp.WriteXY(11.3,wCont,'X')
      else
        Imp.WriteXY(13.3,wCont,'X');
      Imp.WriteXY(16,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
      //Imp.WriteXY(18.6,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
      wCont := wCont+5;
      Imp.WriteXY(0.2,wCont,QNFE_EmiteNAT_OPERACAO.Value);
      Imp.WriteXY(6.4,wCont,QNFE_Emitenum_cfop.Text);  //ALTERADO SERGIO 13/12/2002
      wCont := wCont+3;
      Imp.WriteXY(0.2,wCont,QNFE_EmiteCOD_CADASTRO.Text);
      Imp.WriteXY(1.1,wCont,QNFE_EmiteNOME.Value);
      Imp.WriteXY(11.7,wCont,QNFE_EmiteNUM_CGC_CPF.Value);
      Imp.WriteXY(16.5,wCont,QNFE_EmiteDT_EMISSAO.Text);
      wCont := wCont + 2;
      Imp.WriteXY(0.2,wCont, QNFE_EmiteDESC_ENDERECO.Value);
      Imp.WriteXY(9.9,wCont,QNFE_EmiteDESC_BAIRRO.Value);
      Imp.WriteXY(13.5,wCont,QNFE_EmiteDESC_CEP.Value);
      Imp.WriteXY(16.5,wCont,QNFE_EmiteDT_EMISSAO.Text);
      wCont := wCont+2;
      Imp.WriteXY(0.2,wCont,QNFE_EmiteDESC_CIDADE.Value);
      Imp.WriteXY(7.2,wCont,QNFE_EmiteDESC_TELEFONE.Value);
      Imp.WriteXY(10.5,wCont,QNFE_EmiteCOD_ESTADO.Value);
      Imp.WriteXY(11.7,wCont,QNFE_EmiteNUM_INSCRICAO.Value);
      Wcont :=wCont + 4;
      if QNFE_EmiteInd_Condicao_Pagto.Value = '1' Then
        begin
        Imp.WriteXY(0.2,wCont,'Pagamento a Vista');
        end;
      if QNFE_EmiteInd_Condicao_Pagto.Value = '2' Then
        begin
          wContReceber:=0;
          QContaReceber.Open;
          QContaReceber.First;
          while not QContaReceber.Eof do
          begin
            if wContReceber = 0 Then
              Begin
                Imp.WriteXY(0.2,wCont,Bib.NumToTexto(QContaReceberNUM_TITULO.Value,0,6) );
                Imp.WriteXY(1.9,wCont,QContaReceberDT_Vencimento.Text);
                Imp.WriteXY(4,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
                wContReceber := 1;
              end
            else
            if wContReceber = 1 Then
              Begin
                Imp.WriteXY(6.5,wCont,Bib.NumToTexto(QContaReceberNUM_TITULO.Value,0,6) );
                Imp.WriteXY(8.4,wCont,QContaReceberDT_Vencimento.Text);
                Imp.WriteXY(10.4,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
                wContReceber := 2;
              end
            else
            if wContReceber = 2 Then
              Begin
                Imp.WriteXY(13,wCont,Bib.NumToTexto(QContaReceberNUM_TITULO.Value,0,6) );
                Imp.WriteXY(14.7,wCont,QContaReceberDT_Vencimento.Text);
                Imp.WriteXY(16.6,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
                wContReceber := 3;
              end;
        QContaReceber.Next;
         end;
      QContaReceber.Close;
      end;
      // **** Itens de produtos ****
      wCont := wCont + 4;
      wContLinha := 0;
      // somente pode posicionar no inicio do arquivo a primeira vez
      if wNotaGlobal = 0 then
         QNFE_EmiteIt.First;
      while not QNFE_EmiteIT.Eof do
      begin
        Inc(wCont);
        Inc(wcontLinha);
        Imp.WriteXY(0.2,wCont,Bib.NumToTexto(QNFE_EmiteITCod_Produto.Value,0,6));
        Imp.WriteXY(2,wCont,QNFE_EmiteITDesc_Produto.Value);
        Imp.WriteXY(10.5,wCont,QNFE_EmiteITNum_Classificacao.Value);
        Imp.WriteXY(11.3,wCont,QNFE_EmiteITDesc_Unidade.Value);
        Imp.WriteXY(11.6,wCont,Bib.NumToTexto(QNFE_EmiteITQT_Quantidade.Value,0,8));
        Imp.WriteXY(13.2,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Unitario.Value,2,11));
        Imp.WriteXY(15.4,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value,2,11));
        Imp.WriteXY(18.1,wCont,QNFE_EmiteITPerc_Aliquota.Text);
        if QNFE_EmiteItDesc_Complemento.Value <> '' Then
        begin   // ** Imprimir Complemento de Descrição
          Inc(wCont);
          Inc(wContLinha);
          Imp.WriteXY(1,wCont,QNFE_EmiteITDesc_Complemento.Value);
        end;
        QNFE_EmiteIT.Next;
        if wContLinha >= 15 then
        begin
          Imp.WriteXY(15.4,41,'CONTINUA');
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
    IMP_OBS_CORPO_NOTA(1, wCont);
//    FNotaImpressao.Imp_Desconto(wCont,1);
    // *** Final dos Itens ****
    wCont := 38;
    Imp.WriteXY(0.2,wCont,Bib.NumToTexto(wbase_icm_tributada,2,18));
    Imp.WriteXY(2.5,wCont,Bib.NumToTexto(wvlr_icm,2,17));
    Imp.WriteXY(13.4,wCont,Bib.NumToTexto(wtotal_produtos,2,20));
    wCont := wCont + 2;
    Imp.WriteXY(0.2,wCont,Bib.NumToTexto(QNFE_EmiteVAL_FRETE.Value,2,18));
    Imp.WriteXY(6,wCont,Bib.NumToTexto(QNFE_EmiteVAL_DESPESAS.Value,2,17));
    Imp.WriteXY(10.2,wCont,Bib.NumToTexto(wvlr_ipi,2,15));
    Imp.WriteXY(13.4,wCont,Bib.NumToTexto( wtotal_produtos
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
      Imp.WriteXY(10.7,wCont,'2') // Destinatário
    else
      Imp.WriteXY(10.7,wCont,'1'); // Emitente
    Imp.WriteXY(10.2,wCont,QNFE_EmiteDesc_Placa.Value);
    Imp.WriteXY(14.7,wCont,QNFE_Emitecgc_transp.Value);
    wCont := wCont+2;
    Imp.WriteXY(0.2,wCont,QNFE_Emiteend_transp.Value);
    Imp.WriteXY(8.8,wCont,QNFE_Emitecidade_transp.Value);
    Imp.WriteXY(14,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(15,wCont,QNFE_Emiteinsc_transp.Value);
    wCont := wCont + 2;
    Imp.WriteXY(1,wCont,QNFE_EmiteNUM_VOLUMES.Text);
    wCont := wCont + 6;
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
    Imp.WriteXY(18.6,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
  end;
//  Imp.SaltaPagina;
end;


{Procedure TFNotaImpressao.NF_CAVALCA;
begin
  // *** Emissão de Nota Fiscal para a Cavalca Engenharia - Pedreira Santo Antonio do Leveger
  // *** OBS - Colocar Posicao X em Centimetros
  // *** wNotaGlobal Controla a quebra de continuação

  with DMNotaSaida do
  begin
    wNotaGlobal := 0;
          wCont := 0;
    while wNotaGlobal < 2 do
    begin
      wCont := 0;
      If wNotaGlobal = 1 then
         Imp.WriteXY(10.1,wCont,'CONTINUACAO');
      wNotaGlobal := 2;
      Imp.WriteXY(16.3,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
      wCont:=wCont+2;
      If QNFE_EmiteInd_Entrada_Saida.Value = 'S' Then
         Imp.WriteXY(12.5,wCont,'X')
      else
        Imp.WriteXY(12.5,wCont,'X');

      //Imp.WriteXY(18.6,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
      wCont := wCont+5;
      Imp.WriteXY(0.2,wCont,QNFE_EmiteNAT_OPERACAO.Value);
      Imp.WriteXY(6.8,wCont,QNFE_Emitenum_cfop.Text);  //ALTERADO SERGIO 13/12/2002
      wCont := wCont+2;
      Imp.WriteXY(0.2,wCont,QNFE_EmiteCOD_CADASTRO.Text);
      Imp.WriteXY(1.1,wCont,QNFE_EmiteNOME.Value);
      Imp.WriteXY(13,wCont,QNFE_EmiteNUM_CGC_CPF.Value);
      Imp.WriteXY(17.5,wCont,QNFE_EmiteDT_EMISSAO.Text);
      wCont := wCont + 2;
      Imp.WriteXY(0.2,wCont, QNFE_EmiteDESC_ENDERECO.Value);
      Imp.WriteXY(9.9,wCont,QNFE_EmiteDESC_BAIRRO.Value);
      Imp.WriteXY(14.7,wCont,QNFE_EmiteDESC_CEP.Value);
      Imp.WriteXY(17.5,wCont,QNFE_EmiteDT_EMISSAO.Text);
      wCont := wCont+2;
      Imp.WriteXY(0.2,wCont,QNFE_EmiteDESC_CIDADE.Value);
      Imp.WriteXY(8.2,wCont,QNFE_EmiteDESC_TELEFONE.Value);
      Imp.WriteXY(11.8,wCont,QNFE_EmiteCOD_ESTADO.Value);
      Imp.WriteXY(12.7,wCont,QNFE_EmiteNUM_INSCRICAO.Value);

      // **** Itens de produtos ****
      wCont := wCont + 3;
//      wContLinha := 0;

      // somente pode posicionar no inicio do arquivo a primeira vez
      if wNotaGlobal = 0 then
         QNFE_EmiteIt.First;
      while not QNFE_EmiteIT.Eof do
      begin
        Inc(wCont);
//        Inc(wcontLinha);
        Imp.WriteXY(0.2,wCont,Bib.NumToTexto(QNFE_EmiteITCod_Produto.Value,0,6));
        Imp.WriteXY(2,wCont,QNFE_EmiteITDesc_Produto.Value);
        Imp.WriteXY(12.5,wCont,QNFE_EmiteITNum_Classificacao.Value);
        Imp.WriteXY(13.2,wCont,QNFE_EmiteITDesc_Unidade.Value);
        Imp.WriteXY(12.3,wCont,Bib.NumToTexto(QNFE_EmiteITQT_Quantidade.Value,3,8));
        Imp.WriteXY(14.4,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Unitario.Value,2,11));
        Imp.WriteXY(17.2,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value,2,11));
        Imp.WriteXY(19.7,wCont,QNFE_EmiteITPerc_Aliquota.Text);
        if QNFE_EmiteItDesc_Complemento.Value <> '' Then
        begin   // ** Imprimir Complemento de Descrição
          Inc(wCont);
//          Inc(wContLinha);
          Imp.WriteXY(2,wCont,QNFE_EmiteITDesc_Complemento.Value);
        end;
        QNFE_EmiteIT.Next;

      end;
    end;

    if QNFE_EmiteVal_Desconto.Value > 0 Then
    begin
      Inc(wCont);
      Imp.WriteXY(0.5,wCont,'DESCONTO: '+Bib.NumToTexto(QNFE_EmiteVal_Desconto.Value,2,13));
    end;
    // Fim dos Item de Produto
    IMP_OBS_CORPO_NOTA(1, wCont);
//    FNotaImpressao.Imp_Desconto(wCont,1);

    // *** Final dos Itens ****

    //----TRIBUTACAO E VALORES
    wCont := 42;
    Imp.WriteXY(0.2,wCont,Bib.NumToTexto(wbase_icm_tributada,2,18));
    Imp.WriteXY(2.5,wCont,Bib.NumToTexto(wvlr_icm,2,17));
    Imp.WriteXY(15.3,wCont,Bib.NumToTexto(wtotal_produtos,2,20));
    wCont := wCont + 2;
    Imp.WriteXY(0.2,wCont,Bib.NumToTexto(QNFE_EmiteVAL_FRETE.Value,2,18));
    Imp.WriteXY(6,wCont,Bib.NumToTexto(QNFE_EmiteVAL_DESPESAS.Value,2,17));
    Imp.WriteXY(11.2,wCont,Bib.NumToTexto(wvlr_ipi,2,15));
    Imp.WriteXY(15.3,wCont,Bib.NumToTexto( wtotal_produtos
                                 +wvlr_ipi
                                 +QNFE_EmiteVAL_DESPESAS.Value
                                 -QNFE_EmiteVAL_Desconto.Value
                                 -QNFE_EmiteVAL_Funrural.Value,2,20));
    wCont := wCont + 2;
    if Trim(QNFE_Emitenome_transp.Value) = '' then
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_Transportadora.Value)
    else
      Imp.WriteXY(0.2,wCont,QNFE_Emitenome_transp.Value);
    if QNFE_EmiteInd_Tipo_Frete.Value = 'FOB' Then
      Imp.WriteXY(11.9,wCont,'2') // Destinatário
    else
      Imp.WriteXY(11.9,wCont,'1'); // Emitente
    Imp.WriteXY(12.2,wCont,QNFE_EmiteDesc_Placa.Value);
    Imp.WriteXY(15,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(16,wCont,QNFE_Emitecgc_transp.Value);
    wCont := wCont+2;
    Imp.WriteXY(0.2,wCont,QNFE_Emiteend_transp.Value);
    Imp.WriteXY(11,wCont,QNFE_Emitecidade_transp.Value);
    Imp.WriteXY(15,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(16,wCont,QNFE_Emiteinsc_transp.Value);
    wCont := wCont + 4;
    Imp.WriteXY(2,wCont,'cavalcamineracao@yahoo.com.br');
    wCont:=wCont+1;

    //--------------------pagamentos
    if QNFE_EmiteInd_Condicao_Pagto.Value = '1' Then
    begin
      Imp.WriteXY(0.2,wCont,'Pagamento a Vista');
    end;
    if QNFE_EmiteInd_Condicao_Pagto.Value = '2' Then
    begin
      QContaReceber.Open;
      QContaReceber.First;
      Imp.WriteXY(0,wCont,'Pagamento a Prazo');
      inc(wCont);
      while not QContaReceber.Eof do
      begin
        Imp.WriteXY(0,wCont,Bib.NumToTexto(QContaReceberNUM_TITULO.Value,0,6) );
        Imp.WriteXY(1.3,wCont,QContaReceberDT_Vencimento.Text);
        Imp.WriteXY(3.4,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
        inc(wCont);
        QContaReceber.Next;
      end;
      QContaReceber.Close;
    end;
    //---------final pagamentos-------------------------------------
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
    wCont:=64;
    Imp.WriteXY(18.6,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
  end;
end;
    }
Procedure TFNotaImpressao.NF_COZER;
begin
  // *** Emissão de Nota Fiscal para a Loja Cozer- Matelandia
  // *** OBS - Colocar Posicao X em Centimetros
  // *** wNotaGlobal Controla a quebra de continuação

  with DMNotaSaida do
  begin
    wNotaGlobal := 0;
          wCont := 0;
    while wNotaGlobal < 2 do
    begin
      wCont := 0;
      If wNotaGlobal = 1 then
         Imp.WriteXY(10.1,wCont,'CONTINUACAO');
      wNotaGlobal := 2;
      //wCont:=wCont;
      If QNFE_EmiteInd_Entrada_Saida.Value = 'S' Then
         Imp.WriteXY(12,wCont,'X')
      else
        Imp.WriteXY(13.5,wCont,'X');
      Imp.WriteXY(17.6,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
      //Imp.WriteXY(18.6,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
      wCont := wCont+4;
      Imp.WriteXY(0.2,wCont,QNFE_EmiteNAT_OPERACAO.Value);
      Imp.WriteXY(6.8,wCont,QNFE_Emitenum_cfop.Text);  //ALTERADO SERGIO 13/12/2002
      wCont := wCont+3;
      Imp.WriteXY(0.2,wCont,QNFE_EmiteCOD_CADASTRO.Text);
      Imp.WriteXY(1.1,wCont,QNFE_EmiteNOME.Value);
      Imp.WriteXY(13,wCont,QNFE_EmiteNUM_CGC_CPF.Value);
      Imp.WriteXY(17.5,wCont,QNFE_EmiteDT_EMISSAO.Text);
      wCont := wCont + 2;
      Imp.WriteXY(0.2,wCont, QNFE_EmiteDESC_ENDERECO.Value);
      Imp.WriteXY(9.9,wCont,QNFE_EmiteDESC_BAIRRO.Value);
      Imp.WriteXY(14.7,wCont,QNFE_EmiteDESC_CEP.Value);
      Imp.WriteXY(17.5,wCont,QNFE_EmiteDT_EMISSAO.Text);
      wCont := wCont+2;
      Imp.WriteXY(0.2,wCont,QNFE_EmiteDESC_CIDADE.Value);
      Imp.WriteXY(8.2,wCont,QNFE_EmiteDESC_TELEFONE.Value);
      Imp.WriteXY(11.3,wCont,QNFE_EmiteCOD_ESTADO.Value);
      Imp.WriteXY(12.7,wCont,QNFE_EmiteNUM_INSCRICAO.Value);
      // **** Itens de produtos ****
      wCont := wCont + 3;
      wContLinha := 0;
      // somente pode posicionar no inicio do arquivo a primeira vez
      if wNotaGlobal = 0 then
         QNFE_EmiteIt.First;
      while not QNFE_EmiteIT.Eof do
      begin
        Inc(wCont);
        Inc(wcontLinha);
        Imp.WriteXY(0.4,wCont,Bib.NumToTexto(QNFE_EmiteITCod_Produto.Value,0,6));
        Imp.WriteXY(2.8,wCont,QNFE_EmiteITDesc_Produto.Value);
        Imp.WriteXY(11,wCont,QNFE_EmiteITNum_Classificacao.Value);
        Imp.WriteXY(11.6,wCont,QNFE_EmiteITDesc_Unidade.Value);
        Imp.WriteXY(12.1,wCont,Bib.NumToTexto(QNFE_EmiteITQT_Quantidade.Value,0,8));
        Imp.WriteXY(13.7,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Unitario.Value,2,11));
        Imp.WriteXY(16.3,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value,2,11));
        Imp.WriteXY(19,wCont,QNFE_EmiteITPerc_Aliquota.Text);
        if QNFE_EmiteItDesc_Complemento.Value <> '' Then
        Begin   // ** Imprimir Complemento de Descrição
          Inc(wCont);
          Inc(wContLinha);
          Imp.WriteXY(2,wCont,QNFE_EmiteITDesc_Complemento.Value);
        End;
        QNFE_EmiteIT.Next;
        If wContLinha = 19 Then
         Begin
           wNotaGlobal := 1;
           Imp.WriteXY(15.3,38,'CONTINUA');
           Imp.SaltaPagina;
           Break;
         End;
      End;
    End;
    if QNFE_EmiteVal_Desconto.Value > 0 Then
    begin
      Inc(wCont);
      Imp.WriteXY(0.5,wCont,'DESCONTO: '+Bib.NumToTexto(QNFE_EmiteVal_Desconto.Value,2,13));
    End;
    // Fim dos Item de Produto
    IMP_OBS_CORPO_NOTA(1, wCont);
//    FNotaImpressao.Imp_Desconto(wCont,1);
    // *** Final dos Itens ****
    //----TRIBUTACAO E VALORES
    wCont := 38;
    Imp.WriteXY(0.2,wCont,Bib.NumToTexto(wbase_icm_tributada,2,18));
    Imp.WriteXY(2.5,wCont,Bib.NumToTexto(wvlr_icm,2,17));
    Imp.WriteXY(15.3,wCont,Bib.NumToTexto(wtotal_produtos,2,20));
    wCont := wCont + 2;
    Imp.WriteXY(0.2,wCont,Bib.NumToTexto(QNFE_EmiteVAL_FRETE.Value,2,18));
    Imp.WriteXY(6,wCont,Bib.NumToTexto(QNFE_EmiteVAL_DESPESAS.Value,2,17));
    Imp.WriteXY(11.2,wCont,Bib.NumToTexto(wvlr_ipi,2,15));
    Imp.WriteXY(15.3,wCont,Bib.NumToTexto( wtotal_produtos
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
      Imp.WriteXY(10.6,wCont,'2') // Destinatário
    else
      Imp.WriteXY(10.6,wCont,'1'); // Emitente
    Imp.WriteXY(12.2,wCont,QNFE_EmiteDesc_Placa.Value);
    Imp.WriteXY(15,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(16,wCont,QNFE_Emitecgc_transp.Value);
    wCont := wCont+2;
    Imp.WriteXY(0.2,wCont,QNFE_Emiteend_transp.Value);
    Imp.WriteXY(11,wCont,QNFE_Emitecidade_transp.Value);
    Imp.WriteXY(15,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(16,wCont,QNFE_Emiteinsc_transp.Value);
    wCont := wCont + 4;
    //Imp.WriteXY(2,wCont,'cavalcamineracao@yahoo.com.br');
    wCont:=wCont+2;

    //--------------------pagamentos
    if QNFE_EmiteInd_Condicao_Pagto.Value = '1' Then
    begin
      Imp.WriteXY(0.2,wCont,'Pagamento a Vista');
    end;
    if QNFE_EmiteInd_Condicao_Pagto.Value = '2' Then
    begin
      QContaReceber.Open;
      QContaReceber.First;
      Imp.WriteXY(0,wCont,'Pagamento a Prazo');
      inc(wCont);
      while not QContaReceber.Eof do
      begin
        Imp.WriteXY(0,wCont,Bib.NumToTexto(QContaReceberNUM_TITULO.Value,0,6) );
        Imp.WriteXY(1.3,wCont,QContaReceberDT_Vencimento.Text);
        Imp.WriteXY(3.4,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
        inc(wCont);
        QContaReceber.Next;
      end;
      QContaReceber.Close;
    end;
    //---------final pagamentos-------------------------------------

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
    If QNFE_EmiteVal_AVista.Value > 0 Then
    Begin
      Imp.WriteXY(0,wCont,'Valor Entrada:'+Bib.NumToTexto(QNFE_EmiteVal_AVista.Value,2,8));
      Inc(wCont);
    End;

    wCont:=61;
    Imp.WriteXY(18.1,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
  end;
end;


Procedure TFNotaImpressao.NF_LUNASA;
Var wContReceber : Real;
    wProduto : string;
begin
  // *** Emissão de Nota Fiscal para a LUNASA
  // *** OBS - Colocar Posicao X em Centimetros
  // *** wNotaGlobal Controla a quebra de continuação
  with DMNotaSaida do
  begin
    wNotaGlobal := 0;
    while wNotaGlobal < 2 do
    begin
      wCont := 0;
      If QNFE_EmiteInd_Entrada_Saida.Value = 'S' Then
         Imp.WriteXY(12.5,wCont,'XX')
      else
         Imp.WriteXY(14.2,wCont,'XX');
      Imp.WriteXY(18.3,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );

      If wNotaGlobal = 1 then
      Begin
        inc(wCont);
        Imp.WriteXY(13,wCont,'CONTINUACAO');
        wCont := wCont -1;
      end;
      wNotaGlobal := 2;

      wCont := wCont+7;
      Imp.WriteXY(0.2,wCont,QNFE_EmiteNAT_OPERACAO.Value);
      Imp.WriteXY(7,wCont,QNFE_Emitenum_cfop.Text);  //ALTERADO SERGIO 13/12/2002
      wCont := wCont+4;
      Imp.WriteXY(0.2,wCont,QNFE_EmiteCOD_CADASTRO.Text);
      Imp.WriteXY(1.1,wCont,QNFE_EmiteNOME.Value);
      Imp.WriteXY(13,wCont,QNFE_EmiteNUM_CGC_CPF.Value);
      Imp.WriteXY(18,wCont,QNFE_EmiteDT_EMISSAO.Text);
      wCont := wCont + 3;
      Imp.WriteXY(0.2,wCont, QNFE_EmiteDESC_ENDERECO.Value);
      Imp.WriteXY(10.5,wCont,QNFE_EmiteDESC_BAIRRO.Value);
      Imp.WriteXY(15,wCont,QNFE_EmiteDESC_CEP.Value);
//      Imp.WriteXY(18,wCont,QNFE_EmiteDT_EMISSAO.Text);
      wCont := wCont+2;
      Imp.WriteXY(0.2,wCont,QNFE_EmiteDESC_CIDADE.Value);
      Imp.WriteXY(8.6,wCont,QNFE_EmiteDESC_TELEFONE.Value);
      Imp.WriteXY(11.8,wCont,QNFE_EmiteCOD_ESTADO.Value);
      Imp.WriteXY(12.7,wCont,QNFE_EmiteNUM_INSCRICAO.Value);
      Wcont :=wCont + 4;
      if QNFE_EmiteInd_Condicao_Pagto.Value = '1' Then
        begin
        Imp.WriteXY(0.2,wCont,'Pagamento a Vista');
        end;
      if QNFE_EmiteInd_Condicao_Pagto.Value = '2' Then
        begin
          wContReceber:=0;
          QContaReceber.Open;
          QContaReceber.First;
          while not QContaReceber.Eof do
          begin
            if wContReceber = 0 Then
              Begin
                Imp.WriteXY(0.4,wCont,Bib.NumToTexto(QContaReceberNUM_TITULO.Value,0,6) );
                Imp.WriteXY(2.8,wCont,QContaReceberDT_Vencimento.Text);
                Imp.WriteXY(5.5,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
                wContReceber := 1;
              end
            else
            if wContReceber = 1 Then
              Begin
                Imp.WriteXY(10.2,wCont,Bib.NumToTexto(QContaReceberNUM_TITULO.Value,0,6) );
                Imp.WriteXY(13,wCont,QContaReceberDT_Vencimento.Text);
                Imp.WriteXY(16,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
                wContReceber := 0;
                inc(wCont);
              end;
         QContaReceber.Next;
         end;
      QContaReceber.Close;
      end;
      // **** Itens de produtos ****
      wCont := 27;
      wContLinha := 0;
      // somente pode posicionar no inicio do arquivo a primeira vez
      if wNotaGlobal = 0 then
         QNFE_EmiteIt.First;
      while not QNFE_EmiteIT.Eof do
      begin
        Inc(wCont);
        Inc(wcontLinha);
        Imp.WriteXY(0,wCont,Bib.NumToTexto(QNFE_EmiteITCod_Produto.Value,0,6));
        Imp.WriteXY(1.6,wCont,copy(QNFE_EmiteITDesc_Produto.Value,1,53));
        if Length(QNFE_EmiteITDesc_Produto.Value) > 53 then
        Begin
          Inc(wCont);
          Inc(wContLinha);
          Imp.WriteXY(1.6,wCont,copy(QNFE_EmiteITDesc_Produto.Value,54,6)+ ' '+copy(QNFE_EmiteITDesc_Complemento.Value,1,46));
          if Length(QNFE_EmiteITDesc_Complemento.Value) > 46 then // imprime o resto do complemento se maior q 46 caracteres
          Begin
            Inc(wCont);
            Inc(wContLinha);
            Imp.WriteXY(1.6,wCont,copy(QNFE_EmiteITDesc_Complemento.Value,47,53));
          end;
        end
        Else
          If QNFE_EmiteITDesc_Complemento.Value <> '' Then
          Begin
            Inc(wCont);
            Inc(wcontLinha);
            Imp.WriteXY(1.6,wCont,copy(QNFE_EmiteITDesc_Complemento.Value,1,53));
            if Length(QNFE_EmiteITDesc_Complemento.Value) > 53 then
            Begin
              Inc(wCont);
              Inc(wcontLinha);
              Imp.WriteXY(1.6,wCont,copy(QNFE_EmiteITDesc_Complemento.Value,54,106));
            end
          End;
        //Imp.WriteXY(9.6,wCont,QNFE_EmiteITNum_Classificacao.Value);
        Imp.WriteXY(9.6,wCont,QNFE_EmiteITDESC_CLASS_FISCAL.Value);
        Imp.WriteXY(11.1,wCont,QNFE_EmiteITDesc_Unidade.Value);
        Imp.WriteXY(11.5,wCont,Bib.NumToTexto(QNFE_EmiteITQT_Quantidade.Value,0,8));
        Imp.WriteXY(12.5,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Unitario.Value,2,11));
        Imp.WriteXY(13.7,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value,2,19));
        Imp.WriteXY(17.6,wCont,QNFE_EmiteITPerc_Tributado_Nota.Text);
        If QNFE_EmiteInd_Entrada_Saida.Value = 'S' Then
        Begin
          Imp.WriteXY(18.1,wCont,QNFE_EmiteITPerc_Ipi.Text);
//          Imp.WriteXY(18.7,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value * QNFE_EmiteITPerc_Ipi.Value / 100,2,7));
          Imp.WriteXY(18.7,wCont,Bib.NumToTexto(QNFE_EmiteITVal_IPI.Value,2,7));
        end
        else
        Begin
          Imp.WriteXY(18.1,wCont,Bib.NumToTexto((QNFE_EmiteITVal_IPI.value*100)/QNFE_EmiteITVal_Total.Value,0,2));
          Imp.WriteXY(18.7,wCont,Bib.NumToTexto(QNFE_EmiteITVal_IPI.Value,2,7));
        end;
        wProduto := QNFE_EmiteITDesc_Produto.Value;
        Calc_Peso_Nota;   // calculo do peso produto
        //if QNFE_EmiteITVal_Desconto.Value > 0 then
        //Begin
        //  Inc(wCont);
        //  Inc(wContLinha);
          //wProduto := copy(QNFE_EmiteITDesc_Produto.Value,54,10);
        //  Imp.WriteXY(2,wCont,'DESCONTO: '+Bib.NumToTexto(QNFE_EmiteITVal_Desconto.Value,2,13));
       // end;
        QNFE_EmiteIT.Next;
        if wContLinha >= 17 then
        begin
          wCont := 50;
          Imp.WriteXY(17.1,wCont,'CONTINUA');
          wNotaGlobal := 1;
          Imp.SaltaPagina;
          Break;
        end;
      end;
    end;
     //Fim do Controle de Continuação
    if QNFE_EmiteVal_Desconto.Value > 0 Then
    begin
      Inc(wCont);
      Imp.WriteXY(12.5,wCont,'DESCONTO: ');
      Imp.WriteXY(14.4,wCont,Bib.NumToTexto(QNFE_EmiteVal_Desconto.Value,2,19));
    end;
    // Fim dos Item de Produto
    IMP_OBS_CORPO_NOTA(1, wCont);
//    FNotaImpressao.Imp_Desconto(wCont,1);
    // *** Final dos Itens ****
    wCont := 50;
    Imp.WriteXY(0.2,wCont,Bib.NumToTexto(wbase_icm_tributada,2,18));
    Imp.WriteXY(2.5,wCont,Bib.NumToTexto(wvlr_icm,2,17));
    Imp.WriteXY(15.4,wCont,Bib.NumToTexto(wtotal_produtos-QNFE_EmiteVal_Desconto.Value,2,20));
    wCont := wCont + 2;
    Imp.WriteXY(0.2,wCont,Bib.NumToTexto(QNFE_EmiteVAL_DESPESAS.Value,2,17));  // para lunasa frete esta em despesas
    Imp.WriteXY(6,wCont,Bib.NumToTexto(QNFE_EmiteVAL_FRETE.Value,2,18));
    Imp.WriteXY(13,wCont,Bib.NumToTexto(wvlr_ipi,2,15));
    Imp.WriteXY(15.4,wCont,Bib.NumToTexto( wtotal_produtos
                                 +wvlr_ipi         
                                 +QNFE_EmiteVAL_DESPESAS.Value-QNFE_EmiteVAL_DESCONTO.Value,2,20));
    wCont := wCont + 4;
    if Trim(QNFE_Emitenome_transp.Value) = '' then
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_Transportadora.Value)
    else
      Imp.WriteXY(0.2,wCont,QNFE_Emitenome_transp.Value);
    if QNFE_EmiteInd_Tipo_Frete.Value = 'FOB' Then
      Imp.WriteXY(11.6,wCont,'2') // Destinatário
    else
      Imp.WriteXY(11.6,wCont,'1'); // Emitente
    Imp.WriteXY(12.2,wCont,QNFE_EmiteDesc_Placa.Value);
    Imp.WriteXY(16,wCont,QNFE_Emitecgc_transp.Value);
    wCont := wCont+3;
    Imp.WriteXY(0.2,wCont,QNFE_Emiteend_transp.Value);
    Imp.WriteXY(9.2,wCont,QNFE_Emitecidade_transp.Value);
    Imp.WriteXY(14.8,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(16,wCont,QNFE_Emiteinsc_transp.Value);
    wCont := wCont + 2;
    Imp.WriteXY(1,wCont,QNFE_EmiteNUM_VOLUMES.Text);
    //Imp.WriteXY(14.5,wCont,Bib.NumToTexto(wPesoBruto,2,11));
    //Imp.WriteXY(18,wCont,Bib.NumToTexto(wPeso,2,11));
    wCont := wCont + 4;
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
   if Trim(QNFE_EmiteDesc_COMPLEMENTO1.Value) <> '' Then
    begin
      Imp.WriteXY(0.2,wCont,QNFE_EmiteDesc_COMPLEMENTO1.Value);
      Inc(wCont);
    end;
    Imp.WriteXY(0.2,wCont,'A-9403.30.00 B-9401.90.10 C-9403.60.00 D-9403.20.00');
    inc(wCont);
    Imp.WriteXY(0.2,wCont,'E-9403.10.00 F-9401.90.90');
    wCont := 79;
    Imp.WriteXY(18.1,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
  end;
//  Imp.SaltaPagina;
end;

Procedure TFNotaImpressao.IMP_OBSERVACAO;
var
  wAux : string;
  i : integer;
//  tam : integer;
Begin
  DMMensagem.QMensagem.Close;
  DMMensagem.QMensagem.SetVariable('PK',wCod_Mens);
  DMMensagem.QMensagem.Open;

  {wAux := Trim(DMMensagem.QMensagemDesc_Mensagem.Value)+' '+Trim(DMMensagem.QMensagemDesc_Complemento.Value)+' '+Trim(DMMensagem.QMensagemDesc_Complemento1.Value) + ' ' +
          Trim(DMMensagem.QMensagemDesc_Complemento2.Value)+' '+Trim(DMMensagem.QMensagemDesc_Complemento3.Value)+' '+Trim(DMMensagem.QMensagemDesc_Complemento4.Value) + ' ' +
          Trim(DMMensagem.QMensagemDesc_Complemento5.Value)+' '+Trim(DMMensagem.QMensagemDesc_Complemento6.Value)+' '+Trim(DMMensagem.QMensagemDesc_Complemento7.Value);

  tam := 56; //tamanho da linha da observacao
  i := 0;
  while (i*tam+1) < Length(wAux) do
  begin
    Inc(wCont);
    Imp.WriteXY(0.1,wCont,copy(wAux,i*tam+1,tam));
    inc(i);
  end;
  }
  Inc(wCont);
  Imp.WriteXY(0.1,wCont,Trim(DMMensagem.QMensagemDesc_Mensagem.Value)+' '+Trim(DMMensagem.QMensagemDesc_Complemento.Value)+' '+Trim(DMMensagem.QMensagemDesc_Complemento1.Value));

  If DMMensagem.QMensagemDesc_Complemento2.Value <> '' Then
   Begin
     Inc(wCont);
     Imp.WriteXY(0.1,wCont,Trim(DMMensagem.QMensagemDesc_Complemento2.Value)+' '+Trim(DMMensagem.QMensagemDesc_Complemento3.Value)+' '+Trim(DMMensagem.QMensagemDesc_Complemento4.Value));
   End;
  If DMMensagem.QMensagemDesc_Complemento5.Value <> '' Then
   Begin
     Inc(wCont);
     Imp.WriteXY(0.1,wCont,Trim(DMMensagem.QMensagemDesc_Complemento5.Value)+' '+Trim(DMMensagem.QMensagemDesc_Complemento6.Value)+' '+Trim(DMMensagem.QMensagemDesc_Complemento7.Value));
   End;
End;

Procedure TFNotaImpressao.IMP_OBS_CORPO_NOTA(wCol : Real; var wCont : Integer);
Var wLinha : String;
    wNum : Integer;
    //tam : integer;//tamanho máximo da linha
begin
  wNum := 1;
  wLinha := '';
  //tam := 56;
  While wNum <= Length(DMNotaSaida.QNFE_EmiteDesc_Obs_Corpo_Nota.Text) do
  Begin
    If ( Copy(DMNotaSaida.QNFE_EmiteDesc_Obs_Corpo_Nota.Text,wNum,1) = Chr(13) )  then //or ( length(wLinha) >= tam ) Then
    Begin
      //if Copy(DMNotaSaida.QNFE_EmiteDesc_Obs_Corpo_Nota.Text,wNum,1) <> Chr(13) then
      //  wLinha := wLinha + Copy(DMNotaSaida.QNFE_EmiteDesc_Obs_Corpo_Nota.Text,wNum,1);

      If wLinha <> '' Then
      Begin
        Inc(wCont);
        Imp.WriteXY(wCol,wCont,trim(wLinha));
        wLinha := '';
      End;

      //if Copy(DMNotaSaida.QNFE_EmiteDesc_Obs_Corpo_Nota.Text,wNum,1) = Chr(13) then
      inc(wNum);
    End
    Else
      wLinha := wLinha + Copy(DMNotaSaida.QNFE_EmiteDesc_Obs_Corpo_Nota.Text,wNum,1);

    Inc(wNum);
  End;

  If wLinha <> '' Then
  Begin
    Inc(wCont);
    Imp.WriteXY(wCol,wCont,wLinha);
  End;
End;

Procedure TFNotaImpressao.ProcuraNBM;
Begin
  For wContNBM:=1 to 10 do
  Begin
    If (DMNotaSaida.QNFE_EmiteItCod_Nbm_Sh.Value = wTb_Nbm[wContNBM]) Or
       (wTb_Nbm[wContNBM] = '')  Then
       Break;
  End;
  wTb_Nbm[wContNBM] := DMNotaSaida.QNFE_EmiteItCod_Nbm_Sh.Value;
End;

Procedure TFNotaImpressao.LimpaTbNbm;
Begin
  For wContNBM:=1 to 10 do
    wTb_Nbm[wContNBM] := '';
End;

//-------------------------------------------------------
Procedure TFNotaImpressao.NF_ABATE;
var
  wAux, wVlFrete, wQuantidade: Real;
  wstr : string;     //wLinha1, wLinha2, wLinha3, wLinha4,
  strs1, strs2 : array [1..7] of string;
  pos1, pos2, i : integer;
  wVEndedor : String;
Begin
  with DMNotaSaida do
  begin
    wNotaGlobal := 0;
    wQuantidade := 0;
    //CABEÇALHO
    //----------------------
    while wNotaGlobal < 2 do
    begin
      wCont := 4;//frigo smi
      //wCont := 5;bom jesus
      if wNotaGlobal = 1 then // SE A NOTA FOR CONTINUAÇÃO ESCREVE NA NOTA
      begin
//        Imp.WriteXY(18,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
        //wCont := 2;
        Imp.WriteXY(11,wCont,'CONTINUACAO');
      end;

//      if wNotaGlobal = 0 then
  //      Imp.WriteXY(18,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
      wNotaGlobal := 2;

      if QNFE_EmiteInd_Entrada_Saida.Value = 'S' Then
        If QNFE_EmiteCod_Filial.Value = 10  Then// filial 10 é o fomento
          Imp.WriteXY(13.9,wCont,'XX')
        Else
          Imp.WriteXY(12.8,wCont,'XX')
      Else
        If QNFE_EmiteCod_Filial.Value = 10  Then  // filial 10 é o fomento
          Imp.WriteXY(15.3,wCont,'XX')
        Else
          Imp.WriteXY(14.8,wCont,'XX');
      //Imp.WriteXY(18,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );

      If QNFE_EmiteCod_Filial.Value = 10  Then  // filial 10 é o fomento
         Inc(wcont,7)
      Else
         Inc(wCont,8);
      Imp.WriteXY(1.3,wCont,QNFE_EmiteNAT_OPERACAO.Value);
      Imp.WriteXY(7.2,wCont,QNFE_Emitenum_cfop.Text);
     //--------------------------

      //DESTINATÁRIO/REMETENTE
     //--------------------------
      If QNFE_EmiteCod_Filial.Value = 10  Then  // filial 10 é o fomento
         wCont := 15
      else
         wCont := 13;
      //wCont := 18; //bom jesus
      Imp.WriteXY(1.3, wCont,Trim(QNFE_EmiteCod_Cadastro.Text) + ' - ' + Trim(QNFE_EmiteNome.Text));
      Imp.WriteXY(13.4,wCont,QNFE_EmiteNUM_CGC_CPF.Value);
      Imp.WriteXY(18.3, wCont, QNFE_EmiteDT_EMISSAO.Text);

      wCont := wCont + 3;
      Imp.WriteXY(1.3, wCont, QNFE_EmiteDESC_ENDERECO.Value);
      Imp.WriteXY(12.2, wCont, QNFE_EmiteDESC_BAIRRO.Value);
      Imp.WriteXY(15.9, wCont, QNFE_EmiteDESC_CEP.Value);
      Imp.WriteXY(18.3, wCont, QNFE_EmiteDT_RECEBIMENTO.Text);

      If QNFE_EmiteCod_Filial.Value = 10 Then // filial 10 é o fomento
         wCont := wCont + 3
      Else
         wCont := wCont + 2;
      Imp.WriteXY(1.3, wCont, QNFE_EmiteDESC_CIDADE.Value);
      Imp.WriteXY(9.5, wCont, QNFE_EmiteDESC_TELEFONE.Value);
      Imp.WriteXY(12.2, wCont, QNFE_EmiteCOD_ESTADO.Value);
      Imp.WriteXY(13.5, wCont, QNFE_EmiteNUM_INSCRICAO.Value);
//      Imp.WriteXY(18,wCont,TimeToStr(Time));
      //FATURA
      //--------------------------
      If QNFE_EmiteCod_Filial.Value = 10 Then // filial 10 é o fomento
        wCont := 22
      else
        wCont := 21;
      wAux  := 11;

      QContaReceber.Open;
      QContaReceber.First;

      If QNFE_EmiteInd_Condicao_Pagto.Value = '2' Then
      Begin
        Imp.WriteXY(1.5, wCont, Bib.NumToTexto(QContaReceberNUM_TITULO.Value,0,6));
        Imp.WriteXY(6, wCont, QContaReceberCOD_BANCO_AGENCIA.Text);
        while not QContaReceber.Eof do
        begin
          Imp.WriteXY(wAux, wCont, QContaReceberDT_VENCIMENTO.Text);
          QContaReceber.Next;
          wAux := wAux + 3.7;
        end;

        wCont := wCont + 2;
        wAux  := 11;

        QContaReceber.First;
        while not QContaReceber.Eof do
        begin
          Imp.WriteXY(wAux,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
          QContaReceber.Next;
          wAux := wAux + 3.7;
        end;

      end;
      QContaReceber.Close;
     //--------------------------

     //DADOS DO PRODUTO
     //--------------------------
      wCont := 26;//frigo smi
      //wCont:=31;//bom jesus
      Imp.WriteXY(1.3,wCont,QNFE_EmiteCIDADE_FILIAL.Value);
      wCont := 34;
      wContLinha := 0;

      If wNotaGlobal = 0 then
       QNFE_EmiteIt.First;

        while not QNFE_EmiteIt.Eof do
        begin
          Inc(wContLinha);
          Inc(wCont);
          Imp.WriteXY(1.3,wCont,QNFE_EmiteItCOD_PRODUTO.Text);
          Imp.WriteXY(2,wCont,QNFE_EmiteItDESC_PRODUTO.Value);

          If QNFE_EmiteItNUM_VOLUMES_NOTA.Text <> '' Then
          begin
             Imp.WriteXY(9,wCont, QNFE_EmiteItNUM_VOLUMES_NOTA.Text);
             wQuantidade := wQuantidade + QNFE_EmiteItNUM_VOLUMES_NOTA.Value;
          end
          Else
          begin
             Imp.WriteXY(9,wCont,QNFE_EmiteItNUM_CABECAS.Text);
             wQuantidade := wQuantidade + QNFE_EmiteItNUM_CABECAS.Value;
          end;

          Imp.WriteXY(11.4,wCont,QNFE_EmiteITDesc_Unidade.Value);
          Imp.WriteXY(12.5, wCont, QNFE_EmiteItQT_QUANTIDADE.Text);
          Imp.WriteXY(14.5, wCont, Bib.NumToTexto(QNFE_EmiteItVAL_UNITARIO.Value,2,8));
          Imp.WriteXY(17.3, wCont, Bib.NumToTexto(QNFE_EmiteItVAL_TOTAL.Value, 2,8));
          Imp.WriteXY(20, wCont,QNFE_EmiteItPERC_ALIQUOTA.Text);
          wPeso := wPeso  + QNFE_EmiteItQT_QUANTIDADE.Value;
          wPesoBruto := wPesoBruto  + QNFE_EmiteItNUM_VOLUMES_NOTA.Value * QNFE_EmiteItNum_Embalagem.Value;
          //wQuantidade := wQuantidade + QNFE_EmiteItQT_QUANTIDADE.Value;
          QNFE_EmiteIt.Next;

          If (wContLinha >= 24) and (not QNFE_EmiteIT.eof) then
          Begin
            wCont := 66;
            Imp.WriteXY(17,wCont,'CONTINUA');
            wNotaGlobal := 1;
            Imp.SaltaPagina;
            Break;
          End;
      end;
    end;
     //--------------------------
     IMP_OBS_CORPO_NOTA(1,wCont);
     //CALCULO DO IMPOSTO
     //--------------------------
      If QNFE_EmiteCod_Filial.Value = 10 Then // filial 10 é o fomento
        wCont := 61;

      Imp.WriteXY(0.5,wCont, Bib.NumToTexto(wbase_icm_tributada,2,18));
      Imp.WriteXY(4.5, wCont, Bib.NumToTexto(wvlr_icm,2,17));
      Imp.WriteXY(8.5, wCont, Bib.NumToTexto(wBase_Subst, 2,17));
      Imp.WriteXY(12.5, wCont, BIB.NumToTexto(wIcms_Subst,2,17));
      Imp.WriteXY(17,wCont,Bib.NumToTexto(wtotal_produtos,2,11));

      wCont := wCont + 2;

      wVlFrete := 0;
      If QNFE_EmiteInd_Imprime_Frete.Value = 'S' Then
        wVlFrete := QNFE_EmiteVAL_FRETE.Value;

      Imp.WriteXY(0.5,wCont,Bib.NumToTexto(wVlFrete,2,18));

      Imp.WriteXY(9.5, wCont, QNFE_EmiteVAL_FUNRURAL.Text);
      Imp.WriteXY(13,wCont,Bib.NumToTexto(wvlr_ipi,2,15));

      wFunrural := 0;
      If QNFE_EmiteInd_Funrural.Value = 'S' Then
        wFunrural := QNFE_Emiteval_funrural.Value;
      Imp.WriteXY(17,wCont,Bib.NumToTexto( wtotal_produtos
                                 +wvlr_ipi
                                 +QNFE_EmiteVAL_DESPESAS.Value
                                 -QNFE_EmiteVAL_Desconto.Value
                                 -wFunrural
                                 -QNFE_EmiteVal_Desconto_Fitas.Value
                                 -wDesc_Transgenicos
                                 +wVlFrete,2,11));
      //--------------------------

     //TRANSPORTADOR/VOLUMES TRANSPORTADOS
     //--------------------------
      wCont := wCont + 4;

      if Trim(QNFE_Emitenome_transp.Value) = '' then
        Imp.WriteXY(1,wCont,QNFE_EmiteDesc_Transportadora.Value)
      else
        Imp.WriteXY(0.9,wCont,QNFE_Emitenome_transp.Value);
      if QNFE_EmiteInd_Tipo_Frete.Value = 'FOB' Then
        If QNFE_EmiteCod_Filial.Value = 10 Then // filial 10 é o fomento
          Imp.WriteXY(13.6,wCont,'2') // Destinatário  //Era 13.2; Alterado Camila 27/08/2007.
        Else
          Imp.WriteXY(12.3,wCont,'2') // Destinatário  //Era 13.2; Alterado Camila 27/08/2007.
      else
        If QNFE_EmiteCod_Filial.Value = 10 Then // filial 10 é o fomento
          Imp.WriteXY(13.6,wCont,'1') // Emitente    //Era 13.2; Alterado Camila 27/08/2007.
        Else
          Imp.WriteXY(12.3,wCont,'1'); // Emitente    //Era 13.2; Alterado Camila 27/08/2007.
      Imp.WriteXY(14,wCont,QNFE_EmiteDesc_Placa.Value);
      Imp.WriteXY(16,wCont,QNFE_Emiteuf_transp.Value);
      Imp.WriteXY(17,wCont,QNFE_Emitecgc_transp.Value);

      wCont := wCont+3;

      Imp.WriteXY(0.9,wCont,QNFE_Emiteend_transp.Value);
      Imp.WriteXY(11,wCont,QNFE_Emitecidade_transp.Value);
      Imp.WriteXY(16,wCont,QNFE_Emiteuf_transp.Value);
      Imp.WriteXY(17,wCont,QNFE_Emiteinsc_transp.Value);

      If QNFE_EmiteCod_Filial.Value = 10 Then // filial 10 é o fomento
         wCont := wCont + 3
      Else
         wCont := wCont + 2;

      //Imp.WriteXY(0.9,wCont,QNFE_EmiteNum_Volumes.Text);  //ALTERAÇÃO SOLICITADA PELA VANESSA DA FRIELLA
      Imp.WriteXY(0.7,wCont, Bib.NumToTexto(wQuantidade,2,11));
      Imp.WriteXY(14.5,wCont,Bib.NumToTexto((wPeso),2,11));
      Imp.WriteXY(18,wCont,Bib.NumToTexto(wPeso,2,11));

      wCont := wCont + 4;
      strs1[1] := '';

      pos1 := 2;
      pos2 := 1;

      If (QNFE_EmiteCod_Mensagem.Text <> '') And (QNFE_EmiteCod_Mensagem.Value <> 0) Then
        wCod_Mens := DMOracle.BuscaNome('SELECT DESC_MENSAGEM FROM TB_MENSAGEM','COD_MENSAGEM ='+QNotaSaidaCod_Mensagem.Text);
      Imp.WriteXY(1.3,wCont,(wCod_Mens));

      if QNFE_EmiteOBS.Value <> '' then
      begin
        strs1[pos1] := QNFE_EmiteOBS.Value;
        pos1 := pos1 + 1;
      end;

      if QNFE_EmiteOBS_COMPLEMENTO.Value <> '' then
      begin
        strs1[pos1] := QNFE_EmiteOBS_COMPLEMENTO.Value;
        pos1 := pos1 + 1;
      end;

      for i:=1 to 7 do
      begin
        wCont := wCont + 1;
        if strs1[i] <> '' then
          Imp.WriteXY(1.3,wCont,strs1[i]);
        if strs2[i] <> '' then
          Imp.WriteXY(9,wCont,strs2[i]);
      end;
      If QNFE_EmiteCod_Filial.Value = 10 Then // filial 10 é o fomento
         wCont := 81
      Else
         wCont := 81;
      if QNFE_EmiteCOD_VENDEDOR.Text <> '' then
      begin
        wVendedor := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR ='+QNFE_EmiteCOD_VENDEDOR.Text);
        Imp.WriteXY(1.3,wCont,wVendedor);
      end;
      If QNFE_EmiteCod_Filial.Value <> 10 Then // filial 10 é o fomento
       Begin
         wCont := 90;
         Imp.WriteXY(17.3,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
       End;
  End;
End;

//-------------------------------------------------------
Procedure TFNotaImpressao.NF_LIMP;
var wContReceber, wVlSeguro, wVlFrete : Real;
    wstr : string;     //wLinha1, wLinha2, wLinha3, wLinha4,
    strs1, strs2 : array [1..7] of string;
    pos1, pos2, i : integer;
    wVal : string;
    wPesoAux : String;
begin
  // *** Emissão de Nota Fiscal para a LIMPMASTER - FILIAIS
  // *** OBS - Colocar Posicao X em Centimetros
  // *** wNotaGlobal Controla a quebra de continuação

  wPeso := 0;
  with DMNotaSaida do
  begin
    wNotaGlobal := 0;
    wCont       := 0;
    while wNotaGlobal < 2 do
    begin
      wCont := 0;

      If wNotaGlobal = 1 then
         Imp.WriteXY(10.1,wCont,'CONTINUACAO');
      wNotaGlobal := 2;

      If QNFE_EmiteInd_Entrada_Saida.Value = 'S' Then
         Imp.WriteXY(11.5,wCont,'XX')
      else
        Imp.WriteXY(13.2,wCont,'XX');
      Imp.WriteXY(17.5,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8));

      wCont := wCont+5;
      Imp.WriteXY(0.5,wCont,QNFE_EmiteNAT_OPERACAO.Value + '-' + QNFE_EmiteCOD_OPERACAO.Text);
      Imp.WriteXY(6.3,wCont,QNFE_Emitenum_cfop.Text);  //ALTERADO MARCOS 18/10/2005
      //Imp.WriteXY(12.5,wCont,QNFE_EmiteINSCRICAO_FILIAL.Value);

      wCont := wCont+3;
      Imp.WriteXY(0.5,wCont,QNFE_EmiteCOD_CADASTRO.Text);
      Imp.WriteXY(1.1,wCont,QNFE_EmiteNOME.Value);
      Imp.WriteXY(12.2,wCont,QNFE_EmiteNUM_CGC_CPF.Value);
      Imp.WriteXY(16.6,wCont,QNFE_EmiteDT_EMISSAO.Text);
      wCont := wCont + 2;
      Imp.WriteXY(0.5,wCont, QNFE_EmiteDESC_ENDERECO.Value);
      Imp.WriteXY(9.9,wCont,QNFE_EmiteDESC_BAIRRO.Value);
      Imp.WriteXY(13.8,wCont,QNFE_EmiteDESC_CEP.Value);
      Imp.WriteXY(16.6,wCont,QNFE_EmiteDT_EMISSAO.Text);
      wCont := wCont+2;
      Imp.WriteXY(0.5,wCont,QNFE_EmiteDESC_CIDADE.Value);
      Imp.WriteXY(8.2,wCont,QNFE_EmiteDESC_TELEFONE.Value);
      Imp.WriteXY(10.8,wCont,QNFE_EmiteCOD_ESTADO.Value);
      Imp.WriteXY(12.7,wCont,QNFE_EmiteNUM_INSCRICAO.Value);


      // **** Itens de produtos ****
      wCont := 16;

      // somente pode posicionar no inicio do arquivo a primeira vez
      if wNotaGlobal = 0 then
         QNFE_EmiteIt.First;

      while not QNFE_EmiteIT.Eof do
      begin
        Inc(wCont);
        Imp.WriteXY(0.5,wCont,Bib.NumToTexto(QNFE_EmiteITCod_Produto.Value,0,6));
        wStr := QNFE_EmiteITDesc_Produto.Value + ' ' + QNFE_EmiteITDesc_Complemento.Value;
        //imprime a descricao do produto com os complementos 1 e 2
        Imp.WriteXY(2,wCont,copy(wStr,1,48));
        //se a descricao do produto for maior que o tamanho da linha, escreve o resto em baixo
        if length(wStr) > 48 then
        begin
          inc(wCont);
          Imp.WriteXY(2,wCont,copy(wStr,49,48));
        end;
        if length(wStr) > 96 then
        begin
          inc(wCont);
          Imp.WriteXY(2,wCont,copy(wStr,97,48));
        end;

        Imp.WriteXY(11.3,wCont,QNFE_EmiteITNum_Classificacao.Value);
        Imp.WriteXY(12.4,wCont,QNFE_EmiteItNUM_EMBALAGEM.Text + ' ' + QNFE_EmiteITDesc_Unidade.Value);
        Imp.WriteXY(13.3,wCont,Bib.NumToTexto(QNFE_EmiteITQT_Quantidade.Value,2,8));
        Imp.WriteXY(14.3,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Unitario.Value,2,11));
        Imp.WriteXY(16.5,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value,2,11));
        Imp.WriteXY(19.2,wCont,QNFE_EmiteITPerc_Aliquota.Text);

        //Calcula peso da nota
        wPesoAux := DMOracle.BuscaNome('SELECT NUM_METROS_CUBICOS FROM TB_PRODUTO','COD_PRODUTO =' + QNFE_EmiteITCod_Produto.Text);
        if wPesoAux <> '' then
          wPeso := wPeso + StrToFloat(wPesoAux);

        if QNFE_EmiteItDesc_Observacao_Tr.Text <> '' Then
        begin   // ** Imprimir Complemento de Descrição
          Inc(wCont);
          Imp.WriteXY(1.5,wCont,QNFE_EmiteITDesc_Observacao_Tr.Value);
        end;

        QNFE_EmiteIT.Next;
      end;
    end;

    If QNFE_EmiteVal_Desconto.Value > 0 Then
    Begin
      Inc(wCont);
      Imp.WriteXY(13.7,wCont,'DESCONTO: '+Bib.NumToTexto(QNFE_EmiteVal_Desconto.Value,2,13));
    End;
    // *** Final dos Itens ****

    //----TRIBUTACAO E VALORES
    wCont := 37;
    Imp.WriteXY(0.5,wCont,Bib.NumToTexto(wbase_icm_tributada,2,18));
    Imp.WriteXY(2.5,wCont,Bib.NumToTexto(wvlr_icm,2,17));
    Imp.WriteXY(15.5,wCont,Bib.NumToTexto(wtotal_produtos,2,11));
    wCont := wCont + 2;

    wVlFrete := 0;
    If QNFE_EmiteInd_Imprime_Frete.Value = 'S' Then
      wVlFrete := QNFE_EmiteVAL_FRETE.Value;

    Imp.WriteXY(0.5,wCont,Bib.NumToTexto(wVlFrete,2,18));

    Imp.WriteXY(6,wCont,Bib.NumToTexto(QNFE_EmiteVAL_DESPESAS.Value,2,17));
    Imp.WriteXY(11.2,wCont,Bib.NumToTexto(wvlr_ipi,2,15));
    wFunrural := 0;
    If QNFE_EmiteInd_Funrural.Value = 'S' Then
       wFunrural := QNFE_Emiteval_funrural.Value;
    Imp.WriteXY(15.5,wCont,Bib.NumToTexto( wtotal_produtos
                                 +wvlr_ipi
                                 +QNFE_EmiteVAL_DESPESAS.Value
                                 -QNFE_EmiteVAL_Desconto.Value
                                 -wFunrural
                                 -QNFE_EmiteVal_Desconto_Fitas.Value
                                 -wDesc_Transgenicos
                                 +wVlFrete,2,11));
    wCont := wCont + 3;
    if Trim(QNFE_Emitenome_transp.Value) = '' then
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_Transportadora.Value)
    else
      Imp.WriteXY(0.5,wCont,QNFE_Emitenome_transp.Value);
    if QNFE_EmiteInd_Tipo_Frete.Value = 'FOB' Then
      Imp.WriteXY(10.7,wCont,'2') // Destinatário
    else
      Imp.WriteXY(10.7,wCont,'1'); // Emitente
    Imp.WriteXY(12.2,wCont,QNFE_EmiteDesc_Placa.Value);
    Imp.WriteXY(13.8,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(15.5,wCont,QNFE_Emitecgc_transp.Value);
    wCont := wCont+2;
    Imp.WriteXY(0.5,wCont,QNFE_Emiteend_transp.Value);
    Imp.WriteXY(11,wCont,QNFE_Emitecidade_transp.Value);
    Imp.WriteXY(13.8,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(15.5,wCont,QNFE_Emiteinsc_transp.Value);
    wCont := wCont + 2;
    Imp.WriteXY(0.4,wCont,QNFE_EmiteNum_Volumes.Text);
    Imp.WriteXY(12.7,wCont,Bib.NumToTexto(wPeso,2,11));
    Imp.WriteXY(15.7,wCont,Bib.NumToTexto(wPeso,2,11));

    wCont:=wCont+3;

    strs1[1] := '';

    pos1 := 2;
    pos2 := 1;

    If (QNFE_EmiteCod_Mensagem.Text <> '') And (QNFE_EmiteCod_Mensagem.Value <> 0) Then
      wCod_Mens := DMOracle.BuscaNome('SELECT DESC_MENSAGEM FROM TB_MENSAGEM','COD_MENSAGEM ='+QNotaSaidaCod_Mensagem.Text);
    Imp.WriteXY(0.5,wCont,(wCod_Mens));

    if QNFE_EmiteOBS.Value <> '' then
    begin
      strs1[pos1] := QNFE_EmiteOBS.Value;
      pos1 := pos1 + 1;
    end;

    if QNFE_EmiteOBS_COMPLEMENTO.Value <> '' then
    begin
      strs1[pos1] := QNFE_EmiteOBS_COMPLEMENTO.Value;
      pos1 := pos1 + 1;
    end;

    for i:=1 to 7 do
    begin
      wCont := wCont + 1;
      if strs1[i] <> '' then
        Imp.WriteXY(0.5,wCont,strs1[i]);
      if strs2[i] <> '' then
        Imp.WriteXY(9,wCont,strs2[i]);
    end;

    wCont := 59;
    Imp.WriteXY(17.5,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8));
  end;

end;

Procedure TFNotaImpressao.RODAPE_FAVILLE_ZADIMEL;
Begin
  With DMNotaSaida do
  Begin
    Imp.WriteXY(1,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
    Imp.WriteXY(8,wCont,QNFE_EmiteCOD_CADASTRO.Text+'-'+QNFE_EmiteNOME.Value);
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
          Imp.WriteXY(4.3,wCont,DateToStr(QNFE_EmiteDT_EMISSAO.Value + QNFE_EmiteNr_Dias_Cheque1.Value));
       If QNFE_EmiteNr_Dias_Cheque2.Value <> 0 Then
          Imp.WriteXY(6.4,wCont,DateToStr(QNFE_EmiteDT_EMISSAO.Value + QNFE_EmiteNr_Dias_Cheque2.Value));
       If QNFE_EmiteNr_Dias_Cheque3.Value <> 0 Then
          Imp.WriteXY(8.5,wCont,DateToStr(QNFE_EmiteDT_EMISSAO.Value + QNFE_EmiteNr_Dias_Cheque3.Value));
     End;
    If QNFE_EmiteInd_Condicao_Pagto.Value = '1' Then
       Imp.WriteXY(1.0,wCont,'A VISTA ');
    If QNFE_EmiteInd_Condicao_Pagto.Value = '2' Then
       Imp.WriteXY(1.0,wCont,'A PRAZO ');
  end;
End;

Procedure TFNotaImpressao.NF_SETIMO;
var wAux, wVlFrete: Real;
Begin
  wPeso:= 0;
  wVolumes := 0;
  with DMNotaSaida do
  begin
    wNotaGlobal := 0;
    wCont := 0;
    while wNotaGlobal < 2 do
    begin
      if wNotaGlobal = 1 then // SE A NOTA FOR CONTINUAÇÃO ESCREVE NA NOTA
      begin
        wCont := 0;
        Imp.WriteXY(19,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
        wCont := 2;
        Imp.WriteXY(11,wCont,'CONTINUACAO');
      end;

      if wNotaGlobal = 0 then
        Imp.WriteXY(17,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );

      wNotaGlobal := 2;
      wCont := 4;
      if QNFE_EmiteInd_Entrada_Saida.Value = 'S' Then
        Imp.WriteXY(13.1,wCont,'XX')
      Else
        Imp.WriteXY(14.6,wCont,'XX');

      wCont := wCont + 6;
      Imp.WriteXY(0.9,wCont,QNFE_EmiteNAT_OPERACAO.Value);
      Imp.WriteXY(7.5,wCont,QNFE_Emitenum_cfop.Text);

      //DESTINATÁRIO/REMETENTE

      wCont := 13;
      Imp.WriteXY(0.9, wCont, QNFE_EmiteNome.Value);
      Imp.WriteXY(12,wCont,QNFE_EmiteNUM_CGC_CPF.Value);
      Imp.WriteXY(18, wCont, QNFE_EmiteDT_EMISSAO.Text);

      wCont := wCont + 3;
      Imp.WriteXY(0.9, wCont, QNFE_EmiteDESC_ENDERECO.Value);
      Imp.WriteXY(11, wCont, QNFE_EmiteDESC_BAIRRO.Value);
      Imp.WriteXY(15, wCont, QNFE_EmiteDESC_CEP.Value);
      Imp.WriteXY(18, wCont, QNFE_EmiteDT_RECEBIMENTO.Text);

      wCont := wCont + 2;
      Imp.WriteXY(0.9, wCont, QNFE_EmiteDESC_CIDADE.Value);
      Imp.WriteXY(7, wCont, QNFE_EmiteDESC_FAX.Value);
      Imp.WriteXY(12.2, wCont,QNFE_EmiteUF_NOTA.Value);
      Imp.WriteXY(13.1, wCont, QNFE_EmiteNUM_INSCRICAO.Value);

      //DADOS DO PRODUTO

      wCont := 23;
      wContLinha := 0;

      If wNotaGlobal = 0 then
       QNFE_EmiteIt.First;

        while not QNFE_EmiteIt.Eof do
        begin
          Inc(wContLinha);
          Inc(wCont);
          Imp.WriteXY(0.5, wCont, QNFE_EmiteItCOD_PRODUTO.Text);
          Imp.WriteXY(1.5, wCont, Trim(QNFE_EmiteItDESC_PRODUTO.Value) );
          if Trim(QNFE_EmiteItDESC_COMPLEMENTO.Text) <> '' Then
           Begin
             Inc(wContLinha);
             Inc(wCont);
             Imp.WriteXY(0.5, wCont, QNFE_EmiteItDESC_COMPLEMENTO.Value);
           End;
          Imp.WriteXY(8, wCont, QNFE_EmiteItDESC_CLASS_FISCAL.Value);
          Imp.WriteXY(9, wCont, QNFE_EmiteItDESC_SITUACAO_TRIB.Value);
          Imp.WriteXY(10, wCont, QNFE_EmiteItDESC_UNIDADE.Value);
          Imp.WriteXY(10.5, wCont, Bib.NumToTexto(QNFE_EmiteItQT_QUANTIDADE.Value,0,4));
          Imp.WriteXY(12.5, wCont, Bib.NumToTexto(QNFE_EmiteItVAL_UNITARIO.Value,2,8));
          Imp.WriteXY(15, wCont, Bib.NumToTexto(QNFE_EmiteItVAL_TOTAL.Value, 2,8));
          Imp.WriteXY(17, wCont,QNFE_EmiteItPERC_ALIQUOTA.Text);
          Imp.WriteXY(17.6, wCont, QNFE_EmiteItPERC_IPI.Text);
          Imp.WriteXY(19, wCont, QNFE_EmiteItVAL_IPI.Text);
          wPeso := wPeso +  QNFE_EmiteItNum_Volumes.Value * QNFE_EmiteItQT_QUANTIDADE.Value;
          wVolumes := wVolumes + QNFE_EmiteItNum_Metros_Cubicos.Value * QNFE_EmiteItQT_QUANTIDADE.Value;
          QNFE_EmiteIt.Next;

          If (wContLinha >= 14) and (not QNFE_EmiteIT.eof) then
          Begin
            wCont := 54; //A MESMA POSICAO DO [VALOR TOTAL DOS PRODUTOS]
            Imp.WriteXY(14.5,wCont,'CONTINUA');
            wNotaGlobal := 1;
            Imp.SaltaPagina;
            Break;
          End;
      end;
      end;
      //CALCULO DO IMPOSTO

      wCont := 56;
      Imp.WriteXY(0.5,wCont, Bib.NumToTexto(wbase_icm_tributada,2,18));
      Imp.WriteXY(4.5, wCont, Bib.NumToTexto(wvlr_icm,2,17));
      Imp.WriteXY(8.5, wCont, Bib.NumToTexto(wBase_Subst, 2,17));
      Imp.WriteXY(12.5, wCont, BIB.NumToTexto(wIcms_Subst,2,17));
      Imp.WriteXY(16.5,wCont,Bib.NumToTexto(wtotal_produtos,2,11));

      wCont := wCont + 3;

      wVlFrete := 0;
      If QNFE_EmiteInd_Imprime_Frete.Value = 'S' Then
        wVlFrete := QNFE_EmiteVAL_FRETE.Value;

      Imp.WriteXY(0.5,wCont,Bib.NumToTexto(wVlFrete,2,18));

      //Imp.WriteXY(9.5, wCont, QNFE_EmiteVAL_FUNRURAL.Text);
      //FALTA VALOR SEGURO

      Imp.WriteXY(13,wCont,Bib.NumToTexto(wvlr_ipi,2,15));

      wFunrural := 0;
      If QNFE_EmiteInd_Funrural.Value = 'S' Then
        wFunrural := QNFE_Emiteval_funrural.Value;
      Imp.WriteXY(16.5,wCont,Bib.NumToTexto( wtotal_produtos
                                 +wvlr_ipi
                                 +QNFE_EmiteVAL_DESPESAS.Value
                                 -QNFE_EmiteVAL_Desconto.Value
                                 -wFunrural
                                 -QNFE_EmiteVal_Desconto_Fitas.Value
                                 -wDesc_Transgenicos
                                 +wVlFrete,2,11));

      //TRANSPORTADOR/VOLUMES TRANSPORTADOS

      wCont := wCont + 4;

      if Trim(QNFE_Emitenome_transp.Value) = '' then
        Imp.WriteXY(1,wCont,QNFE_EmiteDesc_Transportadora.Value)
      else
        Imp.WriteXY(1,wCont,QNFE_Emitenome_transp.Value);
      if QNFE_EmiteInd_Tipo_Frete.Value = 'FOB' Then
        Imp.WriteXY(11.2,wCont,'2') // Destinatário
      else
        Imp.WriteXY(11.2,wCont,'1'); // Emitente
      Imp.WriteXY(13,wCont,QNFE_EmiteDesc_Placa.Value);
      Imp.WriteXY(15,wCont,QNFE_Emiteuf_transp.Value);
      Imp.WriteXY(16.5,wCont,QNFE_Emitecgc_transp.Value);

      wCont := wCont+3;

      Imp.WriteXY(1,wCont,QNFE_Emiteend_transp.Value);
      Imp.WriteXY(11,wCont,QNFE_Emitecidade_transp.Value);
      Imp.WriteXY(15,wCont,QNFE_Emiteuf_transp.Value);
      Imp.WriteXY(17,wCont,QNFE_Emiteinsc_transp.Value);
      wCont := wCont + 2;
      Imp.WriteXY(0.8,wCont,Bib.NumToTexto(wVolumes,2,8));
      Imp.WriteXY(6.3,wCont,'FIRENZE');
//      Imp.WriteXY(14.5,wCont,Bib.NumToTexto(wPeso,2,11));
      Imp.WriteXY(17.5,wCont,Bib.NumToTexto(wPeso,2,11));
      Inc(wCont,4);
      wAux := 1;
      QContaReceber.Open;
      QContaReceber.First;

      If QNFE_EmiteInd_Condicao_Pagto.Value = '2' Then
      Begin
        while not QContaReceber.Eof do
        begin
          Imp.WriteXY(wAux, wCont, QContaReceberDT_VENCIMENTO.Text);
          wAux := wAux + 2;
          Imp.WriteXY(wAux,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
          QContaReceber.Next;
          if Not(QContaReceber.Eof) Then
           Begin
             wAux := wAux + 2;
             Imp.WriteXY(wAux, wCont, QContaReceberDT_VENCIMENTO.Text);
             wAux := wAux + 3;
             Imp.WriteXY(wAux,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
             wAux := 1;
           End;
          QContaReceber.Next;
          Inc(wCont);
        End;
      End;
      QContaReceber.Close;
    If QNFE_EmiteInd_Condicao_Pagto.Value = '1' Then
       Imp.WriteXY(0,wCont,'A VISTA');
    If QNFE_EmiteInd_Condicao_Pagto.Value = '3' Then
     Begin
       Imp.WriteXY(0,wCont,'Cheque:');
       If QNFE_EmiteNr_Dias_Cheque.Value > 0 Then
          Imp.WriteXY(1,wCont,DateToStr(QNFE_EmiteDT_EMISSAO.Value + QNFE_EmiteNr_Dias_Cheque.Value)+ '-'+QNFE_EmiteNr_Dias_Cheque.Text + 'dd');
       If QNFE_EmiteNr_Dias_Cheque1.Value > 0 Then
          Imp.WriteXY(3,wCont,DateToStr(QNFE_EmiteNr_Dias_Cheque1.Value + QNFE_EmiteDT_EMISSAO.Value)+ '-'+QNFE_EmiteNr_Dias_Cheque1.Text + 'dd');
       If QNFE_EmiteNr_Dias_Cheque2.Value > 0 Then
          Imp.WriteXY(5,wCont,DateToStr(QNFE_EmiteNr_Dias_Cheque2.Value + QNFE_EmiteDT_EMISSAO.Value)+ '-'+QNFE_EmiteNr_Dias_Cheque2.Text + 'dd');
       If QNFE_EmiteNr_Dias_Cheque3.Value > 0 Then
          Imp.WriteXY(7,wCont,DateToStr(QNFE_EmiteNr_Dias_Cheque3.Value + QNFE_EmiteDT_EMISSAO.Value)+ '-'+QNFE_EmiteNr_Dias_Cheque3.Text + 'dd');
       If QNFE_EmiteNr_Dias_Cheque4.Value > 0 Then
          Imp.WriteXY(9,wCont,DateToStr(QNFE_EmiteNr_Dias_Cheque4.Value + QNFE_EmiteDT_EMISSAO.Value)+ '-'+QNFE_EmiteNr_Dias_Cheque4.Text + 'dd');
     End;
    Inc(wCont);
    Imp.WriteXY(1,wCont,'CLASSIFICACAO FISCAL - 94032000');
    Inc(wCont);
    Imp.WriteXY(1,wCont,'O TAMPO EM GRANITO DEVE SER CONFERIDO NO ATO DO RECEBIMENTO,');
    Inc(wCont);
    Imp.WriteXY(1,wCont,'NAO ACEITAMOS RECLAMACOES POSTERIORES.');
    If Trim(QNFE_EmiteOBS.Value) <> '' Then
    Begin
      inc(wcont);
      Imp.WriteXY(0,wCont,Trim(QNFE_EmiteOBS.Value) );
    End;
    If QNFE_EmiteOBS_COMPLEMENTO.Value <> '' Then
    Begin
      Inc(wCont);
      Imp.WriteXY(0,wCont,Trim(QNFE_EmiteOBS_COMPLEMENTO.Value) );
    End;
    If QNFE_EmiteDesc_Mensagem.Value <> '' then
    Begin
      Inc(wCont);
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_Mensagem.Value);
    End;
    If QNFE_EmiteDesc_COMPLEMENTO.Value <> '' Then
    Begin
      Inc(wCont);
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_COMPLEMENTO.Value);
    End;
    Inc(wCont);
    Imp.WriteXY(0,wCont,'Permite o aproveitamento do credito de ICMS no valor de R$'+Bib.NumToTexto(wtotal_produtos * 0.0107,2,8));
    Inc(wCont);
    Imp.WriteXY(0,wCont,'correspondente á aliquota de 1,07% nos termos do art. 23 da LC 123/06');
//      wCont := 93;
//      Imp.WriteXY(18.3,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
  end;
End;

//--------------------------------      //NAO APAGAR .. VAI SER VOLTADO QUANDO TERMINAR FORMULARIOS

procedure TFNotaImpressao.NF_RCI;
var
  wAux, wVlFrete, wValIss, wValIssRetidoFonte, wValServico, wValProduto, wValRF : Real;
  wContReceber : Byte;
  wFatura : Integer;
  wFlagProduto, wFlagServico : Boolean;
Begin
  wCont:= 0;
  wPeso:= 0;
  wVolumes := 0;
  wValProduto := 0;
  wValIssRetidoFonte := 0;
  wFlagProduto := false;
  wFlagServico := false;
  with DMNotaSaida do
  begin
    wNotaGlobal := 0;
    QNFE_EmiteIt.First;
    while not QNFE_EmiteIt.Eof do
    begin
      if QNFE_EmiteItIND_TIPO_PRODUTO.Text = 'SERVIÇO' then
        wFlagServico := true
      else
        wFlagProduto := true;
      QNFE_EmiteIt.Next;
    end;
    QNFE_EmiteIt.First;

    while wNotaGlobal < 2 do
    begin
      if wNotaGlobal = 1 then // SE A NOTA FOR CONTINUAÇÃO ESCREVE NA NOTA
      begin
        wCont := 0;
        //Imp.WriteXY(19,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
        wCont := 1;
        Imp.WriteXY(11,wCont,'CONTINUACAO');
      end;

      if wNotaGlobal = 0 then
        //Imp.WriteXY(17,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );

      wNotaGlobal := 2;
      wCont := 3;
      if QNFE_EmiteInd_Entrada_Saida.Value = 'S' Then
        Imp.WriteXY(13,wCont,'XX')
      Else
        Imp.WriteXY(14.5,wCont,'XX');

      wCont := wCont + 6;
      //Imp.WriteXY(1.5,wCont,QNFE_EmiteNAT_OPERACAO.Value);
      if QNFE_EmiteUF_FILIAL.Value = QNFE_EmiteUF_NOTA.Value then
      begin
        if (wFlagProduto = true) and (wFlagServico = false) then
        begin
          Imp.WriteXY(1.5,wCont,'VENDAS');
          Imp.WriteXY(6.6,wCont,'5102');
        end;
        if (wFlagProduto = false) and (wFlagServico = true) then
        begin
          Imp.WriteXY(1.5,wCont,'SERVICOS');
          Imp.WriteXY(6.6,wCont,'5949');
        end;
        if (wFlagProduto = true) and (wFlagServico = true) then
        begin
          Imp.WriteXY(1.5,wCont,'VENDAS/SERVICOS');
          Imp.WriteXY(6.6,wCont,'5102/5949');
        end;
      end
      else
      begin
        if (wFlagProduto = true) and (wFlagServico = false) then
        begin
          Imp.WriteXY(1.5,wCont,'VENDAS');
          Imp.WriteXY(6.6,wCont,'6102');
        end;
        if (wFlagProduto = false) and (wFlagServico = true) then
        begin
          Imp.WriteXY(1.5,wCont,'SERVICOS');
          Imp.WriteXY(6.6,wCont,'6949');
        end;
        if (wFlagProduto = true) and (wFlagServico = true) then
        begin
          Imp.WriteXY(1.5,wCont,'VENDAS/SERVICOS');
          Imp.WriteXY(6.6,wCont,'6102/6949');
        end;
      end;
      //Imp.WriteXY(9.3,wCont,QNFE_EmiteINSCRICAO_FILIAL.Value);

      //DESTINATÁRIO/REMETENTE

      wCont := 12;
      Imp.WriteXY(1, wCont, QNFE_EmiteNome.Value);
      Imp.WriteXY(13,wCont,QNFE_EmiteNUM_CGC_CPF.Value);
      Imp.WriteXY(17.5, wCont, QNFE_EmiteDT_EMISSAO.Text);

      wCont := wCont + 2;
      Imp.WriteXY(1, wCont, QNFE_EmiteDESC_ENDERECO.Value);
      Imp.WriteXY(11, wCont, QNFE_EmiteDESC_BAIRRO.Value);
      Imp.WriteXY(14.7, wCont, QNFE_EmiteDESC_CEP.Value);
      Imp.WriteXY(17.5, wCont, QNFE_EmiteDT_RECEBIMENTO.Text);

      wCont := wCont + 2;
      Imp.WriteXY(1, wCont, QNFE_EmiteDESC_CIDADE.Value);
      Imp.WriteXY(8, wCont, QNFE_EmiteDESC_TELEFONE.Value);
      Imp.WriteXY(11.6, wCont,QNFE_EmiteUF_NOTA.Value);

      if QNFE_EmiteNUM_INSCRICAO.Value <> 'ISENTO' then
        Imp.WriteXY(13.8, wCont, QNFE_EmiteNUM_INSCRICAO.Value);

      //DADOS DO PRODUTO

      wCont := 20;
      wContLinha := 0;
      wValIss := 0;
      wValServico := 0;
      If wNotaGlobal = 0 then
        QNFE_EmiteIt.First;
        while not QNFE_EmiteIt.Eof do
        begin
          if QNFE_EmiteItVAL_ISS.Value <> 0 then
          begin
            wValIss := wValIss + QNFE_EmiteItVAL_ISS.Value;
          end;

          Inc(wContLinha);
          Inc(wCont);
          Imp.WriteXY(0.5, wCont, QNFE_EmiteItCOD_PRODUTO.Text);
          Imp.WriteXY(2.3, wCont, QNFE_EmiteItDESC_PRODUTO.Value);
          Imp.WriteXY(9.9, wCont, QNFE_EmiteItDESC_CLASS_FISCAL.Value);
          //Imp.WriteXY(9, wCont, QNFE_EmiteItDESC_SITUACAO_TRIB.Value);
          Imp.WriteXY(11.2, wCont, QNFE_EmiteItDESC_UNIDADE.Value);
          Imp.WriteXY(12, wCont, Bib.NumToTexto(QNFE_EmiteItQT_QUANTIDADE.Value,0,4));
          Imp.WriteXY(13.6, wCont, Bib.NumToTexto(QNFE_EmiteItVAL_UNITARIO.Value,2,8));
          Imp.WriteXY(16.2, wCont, Bib.NumToTexto(QNFE_EmiteItVAL_TOTAL.Value, 2,8));
          //Imp.WriteXY(19.5, wCont,QNFE_EmiteItPERC_ALIQUOTA.Text);
          //Imp.WriteXY(17.6, wCont, QNFE_EmiteItPERC_IPI.Text);
          //Imp.WriteXY(19, wCont, QNFE_EmiteItVAL_IPI.Text);
          wPeso := wPeso +  QNFE_EmiteItNum_Volumes.Value * QNFE_EmiteItQT_QUANTIDADE.Value;
          wVolumes := wVolumes + QNFE_EmiteItNum_Metros_Cubicos.Value * QNFE_EmiteItQT_QUANTIDADE.Value;

          if QNFE_EmiteItIND_TIPO_PRODUTO.Text <> 'SERVIÇO' then
          begin
            wValProduto := wValProduto + ((QNFE_EmiteItVAL_UNITARIO.Value) * (QNFE_EmiteItQT_QUANTIDADE.Value));
          end
          else
            wValServico := wValServico + QNFE_EmiteItVAL_TOTAL.Value;

          QNFE_EmiteIt.Next;

          If (wContLinha >= 14) and (not QNFE_EmiteIT.eof) then
          Begin
            wCont := 43; //A MESMA POSICAO DO [VALOR TOTAL DOS PRODUTOS]
            Imp.WriteXY(16.5,wCont,'CONTINUA');
            wNotaGlobal := 1;
            Imp.SaltaPagina;
            Break;
          End;
        end; //fim do while
        if QNFE_EmiteOBS.Text <> '' then
        begin
          Inc(wCont);
          Imp.WriteXY(2.3,wCont, QNFE_EmiteOBS.Text);
          Inc(wCont);
        end;
        if QNFE_EmiteOBS_COMPLEMENTO.Text <> '' then
        begin
          Imp.WriteXY(2.3,wCont, QNFE_EmiteOBS_COMPLEMENTO.Text);
          Inc(wCont);
        end;
      end;
      if QNFE_EmiteDESC_OBS_CORPO_NOTA.Text <> '' then
      Begin
        wLinha1 := trim(copy(QNFE_EmiteDESC_OBS_CORPO_NOTA.Value,1,56));
        wLinha2 := trim(copy(QNFE_EmiteDESC_OBS_CORPO_NOTA.Value,57,56));
        wLinha3 := trim(copy(QNFE_EmiteDESC_OBS_CORPO_NOTA.Value,113,56));
        wLinha4 := trim(copy(QNFE_EmiteDESC_OBS_CORPO_NOTA.Value,169,56));
      end;
      if wLinha1 <> '' then
      Begin
        inc(wCont);
        Imp.WriteXY(2.3,wCont,wLinha1);
        inc(wCont);
      end;
      if wLinha2 <> '' then
      Begin
        Imp.WriteXY(2.3,wCont,wLinha2);
        inc(wCont);
      end;
      if wLinha3 <> '' then
      Begin
        Imp.WriteXY(2.3,wCont,wLinha3);
        inc(wCont);
      end;
      if wLinha4 <> '' then
        Imp.WriteXY(2.3,wCont,wLinha4);
      //FATURA
{     if {(QNFE_EmiteInd_Condicao_Pagto.Value = '2') and }//(wContLinha <= 14) Then
     //---fazer pra todas formas de pagamento --- if (wContLinha <= 14) Then
     //begin

       wCont := 37;
       wContReceber:=0;
       QContaReceber.Open;
       wFatura := 3;
       QContaReceber.First;
       while not QContaReceber.Eof do       // Faturamento
       begin
         if wContReceber <= 2 then
         begin
           Imp.WriteXY(wFatura,wCont,QContaReceberDT_Vencimento.Text);
           Inc(wContReceber);
           wFatura := wFatura + 4;
           QContaReceber.Next;
         end;
       end;

//       Imp.WriteXY(16.5,wCont,Bib.NumToTexto(wValServico,2,18));    //imprime valor do serviço
//     Imp.WriteXY(16.5,wCont,Bib.NumToTexto(wValIss,2,18));    //imprime valor do serviço

//       Inc(wCont,2);

{------------------------
       wFatura := 2;
       wContReceber := 0;
       wValRF := 0;
       //Desconta da primeira parcela o imposto retido na fonte
       if QNFE_EmiteIND_REGIME_ESPECIAL.Value = 'SIM' then
       begin
         wValRF := wValIss;
         wValIssRetidoFonte := wValIss;
       end;
       QContaReceber.First;
       while not QContaReceber.Eof do
       begin
         if wContReceber <= 2 then
         begin
           Imp.WriteXY(wFatura, wCont, Bib.NumToTexto((QContaReceberVAL_TITULO.Value - wValRF),2,18));
           wValRF := 0;
           Inc(wContReceber);
           wFatura := wFatura + 4;
           QContaReceber.Next;
         end;
       end;
------------------------ foi colocado na linha de baixo}

//     else
//       Imp.WriteXY(16.5,wCont,Bib.NumToTexto(wValIss, 2,18));

       //if QNFE_EmiteDESC_CIDADE.Value = 'MEDIANEIRA' then              retirado a pedido Juciele 11/12/08 - Marlon
       //begin
         if QNFE_EmiteIND_REGIME_ESPECIAL.Value = 'SIM' then
           Imp.WriteXY(12,wCont,Bib.NumToTexto(wValIssRetidoFonte, 2,18))    //imprime valor do iss retido na fonte
         else
           Imp.WriteXY(16.5,wCont,Bib.NumToTexto(wValServico, 2,18));
       //end;

       inc(wCont, 2);

       wFatura := 2;
       wContReceber := 0;
       wValRF := 0;
       //Desconta da primeira parcela o imposto retido na fonte
       if QNFE_EmiteIND_REGIME_ESPECIAL.Value = 'SIM' then
       begin
         wValRF := wValIss;
         wValIssRetidoFonte := wValIss;
       end;
       QContaReceber.First;
       while not QContaReceber.Eof do
       begin
         if wContReceber <= 2 then
         begin
           Imp.WriteXY(wFatura, wCont, Bib.NumToTexto((QContaReceberVAL_TITULO.Value),2,18));
           wValRF := 0;
           Inc(wContReceber);
           wFatura := wFatura + 4;
           QContaReceber.Next;
         end;
       end;

       //if QNFE_EmiteDESC_CIDADE.Value = 'MEDIANEIRA' then              retirado a pedido Juciele 11/12/08 - Marlon
       //begin
         if QNFE_EmiteIND_REGIME_ESPECIAL.Value = 'SIM' then
           Imp.WriteXY(12,wCont,Bib.NumToTexto((wValIssRetidoFonte*3)/100, 2,18))    //imprime valor do iss retido na fonte
         else
           Imp.WriteXY(16.5,wCont,Bib.NumToTexto((wValServico*3)/100, 2,18));
       //end;

       QContaReceber.Close;
//   end;
{    else
    begin
      wCont := 38;
      Imp.WriteXY(2.5,wCont,'A VISTA');
    end;
}
    //CALCULO DO IMPOSTO

    wCont := 41;
    //Imp.WriteXY(0.5,wCont, Bib.NumToTexto(wbase_icm_tributada,2,18));
    //Imp.WriteXY(4, wCont, Bib.NumToTexto(wvlr_icm,2,17));
    //Imp.WriteXY(8, wCont, Bib.NumToTexto(wBase_Subst, 2,17));
    //Imp.WriteXY(12, wCont, BIB.NumToTexto(wIcms_Subst,2,17));

    Imp.WriteXY(16,wCont,Bib.NumToTexto(wValProduto,2,11));

    wCont := wCont + 3;

    wFunrural := 0;
    If QNFE_EmiteInd_Funrural.Value = 'S' Then
      wFunrural := QNFE_Emiteval_funrural.Value;
    Imp.WriteXY(16,wCont,Bib.NumToTexto( wtotal_produtos
                               +wvlr_ipi
                               +QNFE_EmiteVAL_DESPESAS.Value
                               -QNFE_EmiteVAL_Desconto.Value
                               -wFunrural
                               -QNFE_EmiteVal_Desconto_Fitas.Value
                               -wDesc_Transgenicos
                               //-wValIssRetidoFonte Se Empresa com Regime Especial de Tributação, desconta o valor ISS, senão desconta 0. 20/06/2007 - Camila.
                               +wVlFrete,2,11));

    //TRANSPORTADOR/VOLUMES TRANSPORTADOS

    wCont := 46;

    if Trim(QNFE_Emitenome_transp.Value) = '' then
      Imp.WriteXY(1,wCont,QNFE_EmiteDesc_Transportadora.Value)
    else
      Imp.WriteXY(1,wCont,QNFE_Emitenome_transp.Value);
    //if QNFE_EmiteInd_Tipo_Frete.Value = 'FOB' Then
    //  Imp.WriteXY(10.3,wCont,'2') // Destinatário
    //else
     // Imp.WriteXY(10.3,wCont,'1'); // Emitente
    Imp.WriteXY(11.7,wCont,QNFE_EmiteDesc_Placa.Value);
    Imp.WriteXY(14,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(15,wCont,QNFE_Emitecgc_transp.Value);

    wCont := wCont+2;

    Imp.WriteXY(1,wCont,QNFE_Emiteend_transp.Value);
    Imp.WriteXY(9,wCont,QNFE_Emitecidade_transp.Value);
    Imp.WriteXY(14,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(15,wCont,QNFE_Emiteinsc_transp.Value);
    wCont := wCont + 2;

    //DADOS ADICIONAIS
    wCont := 54;
    if QNFE_EmiteIND_REGIME_ESPECIAL.Value = 'SIM' then
      Imp.WriteXY(1,wCont, 'IMPOSTO RETIDO NA FONTE');

    wCont := 64;
    Imp.WriteXY(16.5,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
  end;

End;
 


//------------------------------TEMPORARIO-------------------------------------
//------------------------------NAO APAGAR-------------------------------------

{Procedure TFNotaImpressao.NF_RCI;
var
  wAux, wVlFrete, wValIss, wValIssRetidoFonte, wValServico, wValProduto, wValRF : Real;
  wContReceber : Byte;
  wFatura : Integer;
  wFlagProduto, wFlagServico : Boolean;
Begin
  wCont:= 0;
  wPeso:= 0;
  wVolumes := 0;
  wValProduto := 0;
  wValIssRetidoFonte := 0;
  wFlagProduto := false;
  wFlagServico := false;
  with DMNotaSaida do
  begin
    wNotaGlobal := 0;

    QNFE_EmiteIt.First;
    while not QNFE_EmiteIt.Eof do
    begin
      if QNFE_EmiteItIND_TIPO_PRODUTO.Text = 'SERVIÇO' then
        wFlagServico := true
      else
        wFlagProduto := true;
      QNFE_EmiteIt.Next;
    end;
    QNFE_EmiteIt.First;

    while wNotaGlobal < 2 do
    begin
      if wNotaGlobal = 1 then // SE A NOTA FOR CONTINUAÇÃO ESCREVE NA NOTA
      begin
        wCont := 3;
        //Imp.WriteXY(19,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
        wCont := 1;
        Imp.WriteXY(11,wCont,'CONTINUACAO');
      end;

      if wNotaGlobal = 0 then
        //Imp.WriteXY(17,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );

      wNotaGlobal := 2;
      wCont := 4;
      if QNFE_EmiteInd_Entrada_Saida.Value = 'S' Then
        Imp.WriteXY(12.4,wCont,'XX')
      Else
        Imp.WriteXY(14.6,wCont,'XX');

      wCont := wCont + 7;
      if QNFE_EmiteCOD_OPERACAO.Value in [2,3] then
      begin
        if QNFE_EmiteUF_FILIAL.Value = QNFE_EmiteUF_NOTA.Value then
        begin
          if (wFlagProduto = true) and (wFlagServico = false) then
          begin
            Imp.WriteXY(1.5,wCont,'VENDAS');
            Imp.WriteXY(6.3,wCont,'5102');
          end;
          if (wFlagProduto = false) and (wFlagServico = true) then
          begin
            Imp.WriteXY(1.5,wCont,'SERVICOS');
            Imp.WriteXY(6.3,wCont,'5949');
          end;
          if (wFlagProduto = true) and (wFlagServico = true) then
          begin
            Imp.WriteXY(1.5,wCont,'VENDAS/SERVICOS');
            Imp.WriteXY(6.3,wCont,'5102/5949');
          end;
        end
        else
        begin
          if (wFlagProduto = true) and (wFlagServico = false) then
          begin
            Imp.WriteXY(1.5,wCont,'VENDAS');
            Imp.WriteXY(6.3,wCont,'6102');
          end;
          if (wFlagProduto = false) and (wFlagServico = true) then
          begin
            Imp.WriteXY(1.5,wCont,'SERVICOS');
            Imp.WriteXY(6.3,wCont,'6949');
          end;
          if (wFlagProduto = true) and (wFlagServico = true) then
          begin
            Imp.WriteXY(1.5,wCont,'VENDAS/SERVICOS');
            Imp.WriteXY(6.3,wCont,'6102/6949');
          end;
        end;
      end
      else
      begin
        Imp.WriteXY(1.5,wCont,QNFE_EmiteNAT_OPERACAO.Text);
        Imp.WriteXY(6.3,wCont, QNFE_Emitenum_cfop.Text);
      end;

      //DESTINATÁRIO/REMETENTE

      wCont := 14;
      Imp.WriteXY(1, wCont, QNFE_EmiteNome.Value);
      Imp.WriteXY(13,wCont,QNFE_EmiteNUM_CGC_CPF.Value);
      Imp.WriteXY(17.2, wCont, QNFE_EmiteDT_EMISSAO.Text);

      wCont := wCont + 1;
      Imp.WriteXY(1, wCont, QNFE_EmiteDESC_ENDERECO.Value);
      Imp.WriteXY(11, wCont, QNFE_EmiteDESC_BAIRRO.Value);
      Imp.WriteXY(14.5, wCont, QNFE_EmiteDESC_CEP.Value);
      Imp.WriteXY(17.2, wCont, QNFE_EmiteDT_RECEBIMENTO.Text);

      wCont := wCont + 2;
      Imp.WriteXY(1, wCont, QNFE_EmiteDESC_CIDADE.Value);
      Imp.WriteXY(8.4, wCont, QNFE_EmiteDESC_TELEFONE.Value);
      Imp.WriteXY(11.1, wCont,QNFE_EmiteUF_NOTA.Value);

      if QNFE_EmiteNUM_INSCRICAO.Value <> 'ISENTO' then
        Imp.WriteXY(13.5, wCont, QNFE_EmiteNUM_INSCRICAO.Value);

      //DADOS DO PRODUTO

      wCont := 21;
      wContLinha := 0;
      wValIss := 0;
      wValServico := 0;
      If wNotaGlobal = 0 then
        QNFE_EmiteIt.First;
        while not QNFE_EmiteIt.Eof do
        begin
          if QNFE_EmiteItVAL_ISS.Value <> 0 then
          begin
            wValIss := wValIss + QNFE_EmiteItVAL_ISS.Value;
            wValServico := wValServico + QNFE_EmiteItVAL_TOTAL.Value;
          end;

          Inc(wContLinha);
          Inc(wCont);
          Imp.WriteXY(0, wCont, QNFE_EmiteItCOD_PRODUTO.Text);
          Imp.WriteXY(1.6, wCont, QNFE_EmiteItDESC_PRODUTO.Value);
          Imp.WriteXY(9.9, wCont, QNFE_EmiteItDESC_CLASS_FISCAL.Value);
          //Imp.WriteXY(9, wCont, QNFE_EmiteItDESC_SITUACAO_TRIB.Value);
          Imp.WriteXY(10.6, wCont, QNFE_EmiteItDESC_UNIDADE.Value);
          Imp.WriteXY(11, wCont, Bib.NumToTexto(QNFE_EmiteItQT_QUANTIDADE.Value,0,4));
          Imp.WriteXY(12.3, wCont, Bib.NumToTexto(QNFE_EmiteItVAL_UNITARIO.Value,2,8));
          Imp.WriteXY(14, wCont, Bib.NumToTexto(QNFE_EmiteItVAL_TOTAL.Value, 2,8));
          //Imp.WriteXY(19.5, wCont,QNFE_EmiteItPERC_ALIQUOTA.Text);
          //Imp.WriteXY(17.6, wCont, QNFE_EmiteItPERC_IPI.Text);
          //Imp.WriteXY(19, wCont, QNFE_EmiteItVAL_IPI.Text);
          wPeso := wPeso +  QNFE_EmiteItNum_Volumes.Value * QNFE_EmiteItQT_QUANTIDADE.Value;
          wVolumes := wVolumes + QNFE_EmiteItNum_Metros_Cubicos.Value * QNFE_EmiteItQT_QUANTIDADE.Value;

          if QNFE_EmiteItIND_TIPO_PRODUTO.Text <> 'SERVIÇO' then
          begin
            wValProduto := wValProduto + ((QNFE_EmiteItVAL_UNITARIO.Value) * (QNFE_EmiteItQT_QUANTIDADE.Value));
          end;



          QNFE_EmiteIt.Next;

          If (wContLinha >= 14) and (not QNFE_EmiteIT.eof) then
          Begin
            wCont := 43; //A MESMA POSICAO DO [VALOR TOTAL DOS PRODUTOS]
            Imp.WriteXY(16.5,wCont,'CONTINUA');
            wNotaGlobal := 1;
            Imp.SaltaPagina;
            Break;
          End;
        end; //fim do while
        if QNFE_EmiteOBS.Text <> '' then
        begin
          Inc(wCont);
          Imp.WriteXY(1.6,wCont, QNFE_EmiteOBS.Text);
          Inc(wCont);
        end;
        if QNFE_EmiteOBS_COMPLEMENTO.Text <> '' then
        begin
          Imp.WriteXY(1.6,wCont, QNFE_EmiteOBS_COMPLEMENTO.Text);
          Inc(wCont);
        end;
      end;
      if QNFE_EmiteDESC_OBS_CORPO_NOTA.Text <> '' then
      Begin
        wLinha1 := trim(copy(QNFE_EmiteDESC_OBS_CORPO_NOTA.Value,1,56));
        wLinha2 := trim(copy(QNFE_EmiteDESC_OBS_CORPO_NOTA.Value,57,56));
        wLinha3 := trim(copy(QNFE_EmiteDESC_OBS_CORPO_NOTA.Value,113,56));
        wLinha4 := trim(copy(QNFE_EmiteDESC_OBS_CORPO_NOTA.Value,169,56));
      end;
      if wLinha1 <> '' then
      Begin
        inc(wCont);
        Imp.WriteXY(1.6,wCont,wLinha1);         // todas eram 2.3
        inc(wCont);
      end;
      if wLinha2 <> '' then
      Begin
        Imp.WriteXY(1.6,wCont,wLinha2);
        inc(wCont);
      end;
      if wLinha3 <> '' then
      Begin
        Imp.WriteXY(1.6,wCont,wLinha3);
        inc(wCont);
      end;
      if wLinha4 <> '' then
        Imp.WriteXY(1.6,wCont,wLinha4);

    //CALCULO DO IMPOSTO

    wCont := 43;
    //Imp.WriteXY(0.5,wCont, Bib.NumToTexto(wbase_icm_tributada,2,18));
    //Imp.WriteXY(4, wCont, Bib.NumToTexto(wvlr_icm,2,17));
    //Imp.WriteXY(8, wCont, Bib.NumToTexto(wBase_Subst, 2,17));
    //Imp.WriteXY(12, wCont, BIB.NumToTexto(wIcms_Subst,2,17));
    Imp.WriteXY(16,wCont,Bib.NumToTexto(wValProduto,2,11));

    wCont := wCont + 2;

    wFunrural := 0;
    If QNFE_EmiteInd_Funrural.Value = 'S' Then
      wFunrural := QNFE_Emiteval_funrural.Value;
    Imp.WriteXY(16,wCont,Bib.NumToTexto( wtotal_produtos
                               +wvlr_ipi
                               +QNFE_EmiteVAL_DESPESAS.Value
                               -QNFE_EmiteVAL_Desconto.Value
                               -wFunrural
                               -QNFE_EmiteVal_Desconto_Fitas.Value
                               -wDesc_Transgenicos
                               -wValIssRetidoFonte //Se Empresa com Regime Especial de Tributação, desconta o valor ISS, senão desconta 0. 20/06/2007 - Camila.
                               +wVlFrete,2,11));

    //TRANSPORTADOR/VOLUMES TRANSPORTADOS

    wCont := 47;

    if Trim(QNFE_Emitenome_transp.Value) = '' then
      Imp.WriteXY(1,wCont,QNFE_EmiteDesc_Transportadora.Value)
    else
      Imp.WriteXY(1,wCont,QNFE_Emitenome_transp.Value);
    if QNFE_EmiteCOD_OPERACAO.Value = 9 then
    begin
      if QNFE_EmiteInd_Tipo_Frete.Value = 'FOB' Then
        Imp.WriteXY(12,wCont,'2') // Destinatário
      else
        Imp.WriteXY(12,wCont,'1'); // Emitente
    end;
    Imp.WriteXY(13.2,wCont,QNFE_EmiteDesc_Placa.Value);
    Imp.WriteXY(15.2,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(16.5,wCont,QNFE_Emitecgc_transp.Value);

    wCont := wCont+2;

    Imp.WriteXY(1,wCont,QNFE_Emiteend_transp.Value);
    Imp.WriteXY(10,wCont,QNFE_Emitecidade_transp.Value);
    Imp.WriteXY(15.2,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(16.5,wCont,QNFE_Emiteinsc_transp.Value);
    wCont := wCont + 2;

    if QNFE_EmiteCOD_OPERACAO.Value = 9 then
    begin
      Imp.WriteXY(14,wCont,'4500');
      Imp.WriteXY(17.2, wCont, '11000');
    end;

    //DADOS ADICIONAIS
    wCont := 55;

    //FATURA

    wContReceber:=0;
    QContaReceber.Open;
    wFatura := 3;
    QContaReceber.First;

    while not QContaReceber.Eof do       // Faturamento
    begin
     if QNFE_EmiteIND_REGIME_ESPECIAL.Value = 'SIM' then
     begin
       if wContReceber = 0 then
         wValRF := wValIss
       else
         wValRF := 0;
     end;
     if wContReceber <= 5 then
     begin
       Imp.WriteXY(1,wCont,QContaReceberDT_Vencimento.Text);
       Imp.WriteXY(5,wCont,Bib.NumToTexto((QContaReceberVAL_TITULO.Value - wValRF),2,18));
       Inc(wContReceber);
       Inc(wCont);
      // wFatura := wFatura + 4;
       QContaReceber.Next;
     end
     else
       break;
    end;
    {if QNFE_EmiteDESC_CIDADE.Value = 'MEDIANEIRA' then
     if QNFE_EmiteIND_REGIME_ESPECIAL.Value = 'SIM' then
      Imp.WriteXY(1,wCont,Bib.NumToTexto(wValIss,2,18) + ' RF')
     else
      Imp.WriteXY(1,wCont,Bib.NumToTexto(wValIss,2,18));    //imprime valor do iss }

    //Inc(wCont,2);

    //Imp.WriteXY(1,wCont,Bib.NumToTexto(wValServico, 2,18));    //imprime valor dos serviços
   {QContaReceber.Close;

    Inc(wCont);
    if QNFE_EmiteIND_REGIME_ESPECIAL.Value = 'SIM' then
      Imp.WriteXY(1,wCont, 'IMPOSTO RETIDO NA FONTE');



    //wCont := 64;
    //Imp.WriteXY(16.5,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );

  end;

End;}


//-----------------------------------------------------------------------------




Procedure TFNotaImpressao.NF_PUBLICAR;
var
  wVlFrete, wValIss, wValServico : Real;
  wContReceber : Byte;
  wFatura : Integer;
begin
  wPeso:= 0;
  wVolumes := 0;
  wCont := 1;
  with DMNotaSaida do
  begin
    wNotaGlobal := 0;

    while wNotaGlobal < 2 do
    begin
      if wNotaGlobal = 1 then // SE A NOTA FOR CONTINUAÇÃO ESCREVE NA NOTA
      begin
        wCont := 0;
        Imp.WriteXY(19,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
        wCont := 1;
        Imp.WriteXY(11,wCont,'CONTINUACAO');
      end;

      //CABEÇALHO
      {if wNotaGlobal = 0 then
        Imp.WriteXY(16,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );  }

      wNotaGlobal := 2;
      wCont := 3;
      Imp.WriteXY(16,wCont,QNFE_Emitenum_cfop.Text);
      Inc(wCont,2);
      Imp.WriteXY(16,wCont,QNFE_EmiteDT_EMISSAO.Text);

      //FATURA
      if (QNFE_EmiteInd_Condicao_Pagto.Value = '2') Then
      begin
        wCont := 9;
        wContReceber:=0;
        QContaReceber.Open;
        wFatura := 3;
        QContaReceber.First;
        while not QContaReceber.Eof do       // Faturamento
        begin
          //Imp.WriteXY(1.5, wCont, QContaReceberNUM_TITULO.Text);
          Imp.WriteXY(4.5, wCont, Bib.NumToTexto(QContaReceberVAL_TITULO.Value,2,8));
          //Imp.WriteXY(10, wCont, QContaReceberNUM_PARCELA.Text);
          Imp.WriteXY(14, wCont, QContaReceberDT_VENCIMENTO.Text);
          Inc(wCont);
          QContaReceber.Next;
        end
      end
      else
      begin
        wCont := 9;
        Imp.WriteXY(1.5,wCont,'A VISTA');
      end;         

      //DESTINATÁRIO/REMETENTE

      wCont := 13;
      Imp.WriteXY(4, wCont, QNFE_EmiteNome.Value);
      Inc(wCont);
      Imp.WriteXY(4,wCont,QNFE_EmiteDESC_ENDERECO.Value);
      Inc(wCont);
      Imp.WriteXY(4, wCont, QNFE_EmiteDESC_CIDADE.Value + '-' + QNFE_EmiteCOD_ESTADO.Value);
      Inc(wCont);
      Imp.WriteXY(4, wCont, QNFE_EmiteNUM_CGC_CPF.Text);
      {Inc(wCont);
      Imp.WriteXY(4, wCont, QNFE_EmiteNOME_VENDEDOR.Value);
      Inc(wCont);
      Imp.WriteXY(4, wCont, QNFE_EmiteEND_FILIAL.Value);
      Inc(wCont);
      Imp.WriteXY(4, wCont, QNFE_EmiteDESC_CIDADE.Value);}

      wCont := 23;
      Imp.WriteXY(4.5, wCont, Bib.extenso( wtotal_produtos
                                           +wvlr_ipi
                                           +QNFE_EmiteVAL_DESPESAS.Value
                                           -QNFE_EmiteVAL_Desconto.Value
                                           -wFunrural
                                           -QNFE_EmiteVal_Desconto_Fitas.Value
                                           -wDesc_Transgenicos
                                           +wVlFrete, 'REAL'));



      //DADOS DO PRODUTO

      wCont := 29;
      wContLinha := 0;
      wValIss := 0;
      wValServico := 0;
      If wNotaGlobal = 0 then
        QNFE_EmiteIt.First;

      while not QNFE_EmiteIt.Eof do
      begin
        Inc(wContLinha);
        //Imp.WriteXY(1.5, wCont, QNFE_EmiteItDESC_UNIDADE.Value);
        //Imp.WriteXY(2, wCont, Bib.NumToTexto(QNFE_EmiteItQT_QUANTIDADE.Value,0,4));
        //Imp.WriteXY(4, wCont, QNFE_EmiteItCOD_PRODUTO.Text);
        Imp.WriteXY(5, wCont, QNFE_EmiteItDESC_PRODUTO.Value);
        Imp.WriteXY(14.5, wCont, Bib.NumToTexto(QNFE_EmiteItVAL_UNITARIO.Value,2,8));
        Imp.WriteXY(18, wCont, Bib.NumToTexto(QNFE_EmiteItVAL_TOTAL.Value, 2,8));
        Inc(wCont);

        QNFE_EmiteIt.Next;

        If (wContLinha >= 20) and (not QNFE_EmiteIT.eof) then
        Begin
          wCont := 58; //A MESMA POSICAO DO [VALOR TOTAL DOS PRODUTOS]
          Imp.WriteXY(17,wCont,'CONTINUA');
          wNotaGlobal := 1;
          Imp.SaltaPagina;
          Break;
        End;
      end;

      if QNFE_EmiteOBS.Text <> '' then
      begin
        Imp.WriteXY(5,wCont, QNFE_EmiteOBS.Text);
        Inc(wCont);
      end;
      if QNFE_EmiteOBS_COMPLEMENTO.Text <> '' then
      begin
        Imp.WriteXY(5,wCont, QNFE_EmiteOBS_COMPLEMENTO.Text);
        Inc(wCont);
      end;

      end;
      if QNFE_EmiteDESC_OBS_CORPO_NOTA.Text <> '' then
      Begin
        wLinha1 := trim(copy(QNFE_EmiteDESC_OBS_CORPO_NOTA.Value,1,56));
        wLinha2 := trim(copy(QNFE_EmiteDESC_OBS_CORPO_NOTA.Value,57,56));
        wLinha3 := trim(copy(QNFE_EmiteDESC_OBS_CORPO_NOTA.Value,113,56));
        wLinha4 := trim(copy(QNFE_EmiteDESC_OBS_CORPO_NOTA.Value,169,56));
      end;
      if wLinha1 <> '' then
      Begin
        inc(wCont);
        Imp.WriteXY(2.3,wCont,wLinha1);
        inc(wCont);
      end;
      if wLinha2 <> '' then
      Begin
        Imp.WriteXY(2.3,wCont,wLinha2);
        inc(wCont);
      end;
      if wLinha3 <> '' then
      Begin
        Imp.WriteXY(2.3,wCont,wLinha3);
        inc(wCont);
      end;
      if wLinha4 <> '' then
        Imp.WriteXY(2.3,wCont,wLinha4);


      //TOTAL NOTA
      wCont := 58;
      Imp.WriteXY(17,wCont,Bib.NumToTexto( wtotal_produtos
                                 +wvlr_ipi
                                 +QNFE_EmiteVAL_DESPESAS.Value
                                 -QNFE_EmiteVAL_Desconto.Value
                                 -wFunrural
                                 -QNFE_EmiteVal_Desconto_Fitas.Value
                                 -wDesc_Transgenicos
                                 +wVlFrete,2,11));
      {wCont := 63;
      Imp.WriteXY(1.5,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) ); }
  end;
end;
//------------------------------------
Procedure TFNotaImpressao.NF_MEDIPECAS;
var wContServico : Byte;
  wTotalISS, wTotalServico, wColuna : Real;
  wContFatura : Integer;
  wFlagServico, wFlagDescricao : Boolean;
begin
  // *** Emissão de Nota Fiscal para a NIR Informatica
  // *** OBS - Colocar Posicao X em Centimetros
  // *** wNotaGlobal Controla a quebra de continuação
  wTotalISS := 0;
  wTotalServico := 0;
  wFlagServico := false;
  wFlagDescricao := false;
  wMsgTributacao := '';
  with DMNotaSaida do
  begin
    wNotaGlobal := 0;
          wCont := 0;  // INICIALIZA VALOR DA VARIAVEL - Robson 26/06/2000

    QNFE_EmiteIt.First;
    while not QNFE_EmiteIt.Eof do
    begin
      if QNFE_EmiteItIND_TIPO_PRODUTO.Value = 'SERVIÇO' Then  //seta o flag para true se existir serviço na nota
        wFlagServico := true;
      QNFE_EmiteIt.Next;
    end;
    QNFE_EmiteIt.First;

    while wNotaGlobal < 2 do
    begin
      wCont := 0;
      if wNotaGlobal = 1 then
         Imp.WriteXY(9.5,wCont,'CONTINUACAO')
      else
      begin
        wCont := 0;
        Imp.WriteXY(17.5,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8));
      end;

      Inc(wCont,4);
      WnotaGlobal := 2;
      if QNFE_EmiteInd_Entrada_Saida.Value = 'S' Then
         Imp.WriteXY(12.6,wCont,'X')
      else
        Imp.WriteXY(15.1,wCont,'X');

      Inc(wCont,4);
      Imp.WriteXY(0.5,wCont,QNFE_EmiteNAT_OPERACAO.Value);

      if wFlagServico = false then  //se nao existe serviço, imprime cfop normal
        Imp.WriteXY(6.5,wCont,QNFE_Emitenum_cfop.Text)
      else
      begin
        if QNFE_EmiteCOD_ESTADO.Value =  'PR' then
          Imp.WriteXY(6.5,wCont,QNFE_Emitenum_cfop.Text + '/' + '5933')
        else
          Imp.WriteXY(6.5,wCont,QNFE_Emitenum_cfop.Text + '/' + '6933');
      end;

      Inc(wCont,3);

      Imp.WriteXY(0.5,wCont,QNFE_EmiteCOD_CADASTRO.Text);
      Imp.WriteXY(1,wCont,QNFE_EmiteNOME.Value);
      Imp.WriteXY(13.5,wCont,QNFE_EmiteNUM_CGC_CPF.Value);
      Imp.WriteXY(18,wCont,QNFE_EmiteDT_EMISSAO.Text);

      Inc(wCont,2);

      Imp.WriteXY(0.5,wCont, QNFE_EmiteDESC_ENDERECO.Value);
      Imp.WriteXY(11,wCont,QNFE_EmiteDESC_BAIRRO.Value);
      Imp.WriteXY(15.5,wCont,QNFE_EmiteDESC_CEP.Value);
      Imp.WriteXY(18,wCont,QNFE_EmiteDT_EMISSAO.Text);

      Inc(wCont,2);

      Imp.WriteXY(0.5,wCont,QNFE_EmiteDESC_CIDADE.Value);
      Imp.WriteXY(9,wCont,QNFE_EmiteDESC_TELEFONE.Value);
      Imp.WriteXY(11.7,wCont,QNFE_EmiteCOD_ESTADO.Value);
      Imp.WriteXY(13.5,wCont,QNFE_EmiteNUM_INSCRICAO.Value);

      Inc(wCont,3);

      //FATURA

      if QNFE_EmiteInd_Condicao_Pagto.Value = '1' Then
      begin
        Imp.WriteXY(0.5,wCont,'Pagamento a Vista');
      end;
      if QNFE_EmiteInd_Condicao_Pagto.Value = '2' Then
      begin
        QContaReceber.Open;
        QContaReceber.First;
        wContFatura := 0;
        wColuna := 1;
        while not QContaReceber.Eof do
        begin
          Inc(wContFatura);
//          Imp.WriteXY(1, wCont, '1');
//          Imp.WriteXY(2,wCont,QContaReceberDT_Vencimento.Text+' ');
//          Imp.WriteXY(4.1,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
//
//          Imp.WriteXY(7.8, wCont, '2');
//          Imp.WriteXY(8.8,wCont,QContaReceberDT_Vencimento.Text+' ');
//          Imp.WriteXY(11,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
//
//          Imp.WriteXY(14.5, wCont, '3');
//          Imp.WriteXY(15.4,wCont,QContaReceberDT_Vencimento.Text+' ');
//          Imp.WriteXY(18,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
          Imp.WriteXY(wColuna, wCont, IntToStr(wContFatura));
          wColuna := wColuna + 1;
          Imp.WriteXY(wColuna, wCont, QContaReceberDT_Vencimento.Text+' ');
          wColuna := wColuna + 2.2;
          Imp.WriteXY(wColuna, wCont, Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
          wColuna := wColuna + 3.5;

          QContaReceber.Next;
          if ((wContFatura mod 3) = 0) and (not QContaReceber.Eof) then
          begin
            Inc(wCont);
            wColuna := 1;
          end;
        end;
        QContaReceber.Close;
      end;

      // **** Itens de produtos ****
      wCont := 23;
      wContLinha := 0;
      // somente pode posicionar no inicio do arquivo a primeira vez
      if wNotaGlobal = 0 then
         QNFE_EmiteIt.First;
      //ShowMessage(IntToStr(QNFE_EmiteIT.RecordCount));
      while not QNFE_EmiteIT.Eof do
      begin
        if QNFE_EmiteItIND_TIPO_PRODUTO.Value <> 'SERVIÇO' Then   // nota fiscal de produtos
        begin
          Inc(wCont);
          Inc(wcontLinha);
          Imp.WriteXY(0.5,wCont, QNFE_EmiteItNUM_FABRICANTE.Text);
          Imp.WriteXY(2.5,wCont,QNFE_EmiteITDesc_Produto.Value);
          Imp.WriteXY(12.7,wCont,QNFE_EmiteItDESC_SITUACAO_TRIB.Value);
          Imp.WriteXY(13.6,wCont,QNFE_EmiteITDesc_Unidade.Value);
          Imp.WriteXY(13.9,wCont,Bib.NumToTexto(QNFE_EmiteITQT_Quantidade.Value,2,8));
          Imp.WriteXY(14.2,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Unitario.Value,2,11));
          Imp.WriteXY(17.3,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value,2,11));
          Imp.WriteXY(19.5,wCont,QNFE_EmiteITPerc_Aliquota.Text);
        end
        else
        begin
          wTotalISS := wTotalISS + QNFE_EmiteItVal_ISS.Value;
          wTotalServico := wTotalServico + QNFE_EmiteItVal_Total.Value;
        end;
        If QNFE_EmiteITDESC_OBSERVACAO_TR.Value <> '' Then
           wMsgTributacao := QNFE_EmiteITDESC_OBSERVACAO_TR.Value;
        QNFE_EmiteIT.Next;
        if wContLinha > 21 then
        begin
          wCont := 59;
          Imp.WriteXY(14.5,wCont,'CONTINUA');
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

    //IMP_OBS_CORPO_NOTA(1, wCont);

    wCont := 52;
    wContServico := 1;

    // Item de Prestacao de Serviço
    QNFE_EmiteIt.First;
    while (not QNFE_EmiteIT.Eof) do
    begin                                                // O comentario abaixo era usado antes
      if QNFE_EmiteItIND_TIPO_PRODUTO.Value = 'SERVIÇO' Then   // QNFE_EmiteItPERC_ISS.Value > 0
      begin
        Inc(wCont);
        if wFlagDescricao = false then
        begin
          Imp.WriteXY(0.5,wCont,'MAO DE OBRA');
          wFlagDescricao := true;
        end;
        //Imp.WriteXY(9.3,wCont,Bib.NumToTexto(QNFE_EmiteITQT_Quantidade.Value,2,6));
        //Imp.WriteXY(10.4,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Unitario.Value,2,13));
        //Imp.WriteXY(12.7,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value,2,17));
        //if wContServico = 1 then
          //Imp.WriteXY(17.5,wCont, QNFE_EmiteINSCRICAO_FILIAL.Value); //nao imprimir nada
        if wContServico = 2 Then
          Imp.WriteXY(17.5,wCont,Bib.NumToTexto(wTotalISS,2,15) );
        if wContServico = 3 Then
          Imp.WriteXY(17.5,wCont,Bib.NumToTexto(wTotalServico,2,15));
        Inc(wContServico);
      end;

      QNFE_EmiteIt.Next;

      if wContServico > 4 then
        break;
    end;

    if (wContServico = 2) and (QNFE_EmiteIt.Eof) then
    begin
      Inc(wCont);
      Imp.WriteXY(17.5,wCont,Bib.NumToTexto(wTotalISS,2,15) );
      QNFE_EmiteIt.Next;
      Inc(wCont);
      Imp.WriteXY(17.5,wCont,Bib.NumToTexto(wTotalServico,2,15));
    end;

    if (wContServico = 3) and (QNFE_EmiteIt.Eof) then
    begin
      Inc(wCont);
      Imp.WriteXY(17.5,wCont,Bib.NumToTexto(wTotalServico,2,15));
    end;

    // *** Final dos Itens ****

    //CALCULO DO IMPOSTO
    wCont := 58;

    Imp.WriteXY(0.5,wCont,Bib.NumToTexto(wbase_icm_tributada,2,18));
    Imp.WriteXY(4,wCont,Bib.NumToTexto(wvlr_icm,2,17));
    Imp.WriteXY(7,wCont, Bib.NumToTexto(wBase_Subst,2,18));
    Imp.WriteXY(11, wCont, Bib.NumToTexto(wIcms_Subst,2,18));
    Imp.WriteXY(17,wCont,Bib.NumToTexto(wtotal_produtos - wTotalServico,2,20));

    wCont := wCont + 2;

    Imp.WriteXY(0.5,wCont,Bib.NumToTexto(QNFE_EmiteVAL_FRETE.Value,2,18));
    Imp.WriteXY(7,wCont,Bib.NumToTexto(QNFE_EmiteVAL_DESPESAS.Value,2,18));
    Imp.WriteXY(11,wCont,Bib.NumToTexto(wvlr_ipi,2,18));

    Imp.WriteXY(17,wCont,Bib.NumToTexto( wtotal_produtos
                                   +wvlr_ipi
                                   +QNFE_EmiteVAL_DESPESAS.Value
                                   +wIcms_Subst
                                   +QNFE_EmiteVAL_FRETE.Value
                                   -QNFE_EmiteVAL_Desconto.Value
                                   -QNFE_EmiteVAL_Funrural.Value,2,20));


    //TRANSPORTADOR / VOLUMES TRANSPORTADOS

    wCont := 63;
    if Trim(QNFE_Emitenome_transp.Value) = '' then
      Imp.WriteXY(0.5,wCont,QNFE_EmiteDesc_Transportadora.Value)
    else
      Imp.WriteXY(0.5,wCont,QNFE_Emitenome_transp.Value);
    if QNFE_EmiteInd_Tipo_Frete.Value = 'FOB' Then
      Imp.WriteXY(11,wCont,'2') // Destinatário
    else
      Imp.WriteXY(11,wCont,'1'); // Emitente
    Imp.WriteXY(12.5,wCont,QNFE_EmiteDesc_Placa.Value);
    Imp.WriteXY(14.6, wCont, QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(17,wCont,QNFE_Emitecgc_transp.Value);

    Inc(wCont,2);

    Imp.WriteXY(0.5,wCont,QNFE_Emiteend_transp.Value);
    Imp.WriteXY(9.5,wCont,QNFE_Emitecidade_transp.Value);
    Imp.WriteXY(14.6,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(17,wCont,QNFE_Emiteinsc_transp.Value);

    Inc(wCont,2);

    Imp.WriteXY(0.5,wCont,QNFE_EmiteNUM_VOLUMES.Text);

    //DADOS ADICIONAIS

    wCont := 70;

    Imp.WriteXY(0.5,wCont,QNFE_EmiteOBS.Value);

    Inc(wCont);

    if Trim(QNFE_EmiteOBS_COMPLEMENTO.Value) <> '' Then
    begin
      Imp.WriteXY(0.5,wCont,QNFE_EmiteOBS_COMPLEMENTO.Value);
      Inc(wCont);
    end;
   if Trim( QNFE_EmiteDesc_Mensagem.Value)<>'' Then
    begin
      Imp.WriteXY(0.5,wCont,QNFE_EmiteDesc_Mensagem.Value);
      Inc(wCont);
    end;
    if Trim(QNFE_EmiteDesc_COMPLEMENTO.Value) <> '' Then
    begin
      Imp.WriteXY(0.5,wCont,QNFE_EmiteDesc_COMPLEMENTO.Value);
      Inc(wCont);
    end;
    Imp.WriteXY(0.5,wCont,wMsgTributacao);
    wCont := 82;
    Imp.WriteXY(17.5,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8));

  end;
//  Imp.SaltaPagina;
end;
//-------------------------------------
Procedure TFNotaImpressao.NF_GRAZAPEL;
var
  wAux, wVlFrete, wValIss, wValServico, wValProduto, wValRF : Real;
  wContReceber : Byte;
  wFatura : Integer;
  wFlagProduto, wFlagServico : Boolean;
Begin
  wCont:= 0;
  wPeso:= 0;
  wVolumes := 0;
  wValProduto := 0;
  wFlagProduto := false;
  wFlagServico := false;
  with DMNotaSaida do
  begin
    wNotaGlobal := 0;

    QNFE_EmiteIt.First;
    while not QNFE_EmiteIt.Eof do
    begin
      if QNFE_EmiteItIND_TIPO_PRODUTO.Text = 'SERVIÇO' then
        wFlagServico := true
      else
        wFlagProduto := true;
      QNFE_EmiteIt.Next;
    end;
    QNFE_EmiteIt.First;

    while wNotaGlobal < 2 do
    begin
      if wNotaGlobal = 1 then // SE A NOTA FOR CONTINUAÇÃO ESCREVE NA NOTA
      begin
        wCont := 0;
        Imp.WriteXY(19,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
        wCont := 1;
        Imp.WriteXY(11,wCont,'CONTINUACAO');
      end;

     // if wNotaGlobal = 0 then
     //   Imp.WriteXY(17,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );

      wNotaGlobal := 2;
      wCont := 1;
      if QNFE_EmiteInd_Entrada_Saida.Value = 'S' Then
        Imp.WriteXY(13.5,wCont,'XX')
      Else
        Imp.WriteXY(15.5,wCont,'XX');

      wCont := wCont + 7;

      Imp.WriteXY(1.5,wCont,QNFE_EmiteNAT_OPERACAO.Value);

      if QNFE_EmiteCOD_ESTADO.Value = 'PR' then
        Imp.WriteXY(7.2, wCont, QNFE_Emitenum_cfop.Text)
      else
        Imp.WriteXY(7.2, wCont, QNFE_Emitenum_cfop.Text);

      Imp.WriteXY(9.3,wCont,QNFE_EmiteINSCRICAO_FILIAL.Value);

      //DESTINATÁRIO/REMETENTE

      wCont := 12;
      Imp.WriteXY(1, wCont, QNFE_EmiteNome.Value);
      Imp.WriteXY(13,wCont,QNFE_EmiteNUM_CGC_CPF.Value);
      Imp.WriteXY(18.5, wCont, QNFE_EmiteDT_EMISSAO.Text);

      wCont := wCont + 1;
      Imp.WriteXY(1, wCont, QNFE_EmiteDESC_ENDERECO.Value);
      Imp.WriteXY(12, wCont, QNFE_EmiteDESC_BAIRRO.Value);
      Imp.WriteXY(15.8, wCont, QNFE_EmiteDESC_CEP.Value);
      Imp.WriteXY(18.5, wCont, QNFE_EmiteDT_RECEBIMENTO.Text);

      wCont := wCont + 2;
      Imp.WriteXY(1, wCont, QNFE_EmiteDESC_CIDADE.Value);
      Imp.WriteXY(8, wCont, QNFE_EmiteDESC_FAX.Value);
      Imp.WriteXY(12.2, wCont,QNFE_EmiteUF_NOTA.Value);
      Imp.WriteXY(13.8, wCont, QNFE_EmiteNUM_INSCRICAO.Value);

      //DADOS DO PRODUTO

      wCont := 19;
      wContLinha := 0;
      wValIss := 0;
      wValServico := 0;
      If wNotaGlobal = 0 then
        QNFE_EmiteIt.First;
        while not QNFE_EmiteIt.Eof do
        begin
          if QNFE_EmiteItVAL_ISS.Value <> 0 then
          begin
            wValIss := wValIss + QNFE_EmiteItVAL_ISS.Value;
            wValServico := wValServico + QNFE_EmiteItVAL_TOTAL.Value;
          end;

          Inc(wContLinha);
          Inc(wCont);
          Imp.WriteXY(1, wCont, QNFE_EmiteItCOD_PRODUTO.Text);
          Imp.WriteXY(2.3, wCont, QNFE_EmiteItDESC_PRODUTO.Value);
          Imp.WriteXY(9.9, wCont, QNFE_EmiteItDESC_CLASS_FISCAL.Value);
          Imp.WriteXY(9, wCont, QNFE_EmiteItDESC_SITUACAO_TRIB.Value);
          Imp.WriteXY(12.2, wCont, QNFE_EmiteItDESC_UNIDADE.Value);
          Imp.WriteXY(13, wCont, Bib.NumToTexto(QNFE_EmiteItQT_QUANTIDADE.Value,0,4));
          Imp.WriteXY(14.5, wCont, Bib.NumToTexto(QNFE_EmiteItVAL_UNITARIO.Value,2,8));
          Imp.WriteXY(16.5, wCont, Bib.NumToTexto(QNFE_EmiteItVAL_TOTAL.Value, 2,8));
          Imp.WriteXY(19.5, wCont,QNFE_EmiteItPERC_ALIQUOTA.Text);
          //Imp.WriteXY(17.6, wCont, QNFE_EmiteItPERC_IPI.Text);
          //Imp.WriteXY(19, wCont, QNFE_EmiteItVAL_IPI.Text);
          wPeso := wPeso +  QNFE_EmiteItNum_Volumes.Value * QNFE_EmiteItQT_QUANTIDADE.Value;
          wVolumes := wVolumes + QNFE_EmiteItNum_Metros_Cubicos.Value * QNFE_EmiteItQT_QUANTIDADE.Value;

          if QNFE_EmiteItIND_TIPO_PRODUTO.Text <> 'SERVIÇO' then
          begin
            wValProduto := wValProduto + ((QNFE_EmiteItVAL_UNITARIO.Value) * (QNFE_EmiteItQT_QUANTIDADE.Value));
          end;

          QNFE_EmiteIt.Next;

          If (wContLinha >= 14) and (not QNFE_EmiteIT.eof) then
          Begin
            wCont := 43; //A MESMA POSICAO DO [VALOR TOTAL DOS PRODUTOS]
            Imp.WriteXY(16.5,wCont,'CONTINUA');
            wNotaGlobal := 1;
            Imp.SaltaPagina;
            Break;
          End;
        end; //fim do while
      end;

    //CALCULO DO IMPOSTO

    wCont := 41;
    Imp.WriteXY(0.5,wCont, Bib.NumToTexto(wbase_icm_tributada,2,18));
    Imp.WriteXY(4, wCont, Bib.NumToTexto(wvlr_icm,2,17));
    Imp.WriteXY(8, wCont, Bib.NumToTexto(wBase_Subst, 2,17));
    Imp.WriteXY(12, wCont, BIB.NumToTexto(wIcms_Subst,2,17));
    Imp.WriteXY(17,wCont,Bib.NumToTexto(wValProduto,2,11));

    wCont := wCont + 2;

    wVlFrete := 0;
    If QNFE_EmiteInd_Imprime_Frete.Value = 'S' Then
      wVlFrete := QNFE_EmiteVAL_FRETE.Value;

    Imp.WriteXY(0.5,wCont,Bib.NumToTexto(wVlFrete,2,18));

    //Imp.WriteXY(9.5, wCont, QNFE_EmiteVAL_FUNRURAL.Text);
    //FALTA VALOR SEGURO

    Imp.WriteXY(12,wCont,Bib.NumToTexto(wvlr_ipi,2,15));

    wFunrural := 0;
    If QNFE_EmiteInd_Funrural.Value = 'S' Then
      wFunrural := QNFE_Emiteval_funrural.Value;
    Imp.WriteXY(17,wCont,Bib.NumToTexto( wtotal_produtos
                               +wvlr_ipi
                               +QNFE_EmiteVAL_DESPESAS.Value
                               -QNFE_EmiteVAL_Desconto.Value
                               -wFunrural
                               -QNFE_EmiteVal_Desconto_Fitas.Value
                               -wDesc_Transgenicos
                               +wVlFrete,2,11));

    //TRANSPORTADOR/VOLUMES TRANSPORTADOS

    wCont := 45;

    if Trim(QNFE_Emitenome_transp.Value) = '' then
      Imp.WriteXY(1,wCont,QNFE_EmiteDesc_Transportadora.Value)
    else
      Imp.WriteXY(1,wCont,QNFE_Emitenome_transp.Value);
    if QNFE_EmiteInd_Tipo_Frete.Value = 'FOB' Then
      Imp.WriteXY(13.3,wCont,'2') // Destinatário
    else
      Imp.WriteXY(13.3,wCont,'1'); // Emitente
    Imp.WriteXY(11.7,wCont,QNFE_EmiteDesc_Placa.Value);
    Imp.WriteXY(14,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(15,wCont,QNFE_Emitecgc_transp.Value);

    wCont := wCont+2;

    Imp.WriteXY(1,wCont,QNFE_Emiteend_transp.Value);
    Imp.WriteXY(9,wCont,QNFE_Emitecidade_transp.Value);
    Imp.WriteXY(14,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(15,wCont,QNFE_Emiteinsc_transp.Value);

    wCont := wCont + 2;

    Imp.WriteXY(1,wCont,QNFE_EmiteNUM_VOLUMES.Text);
    Imp.WriteXY(1,wCont,bib.NumToTexto(wPeso,2,17));
    Imp.WriteXY(1,wCont,bib.NumToTexto(wVolumes,2,17));

    //DADOS ADICIONAIS
    wCont := 47;
    if QNFE_EmiteOBS.Text <> '' then
    begin
      Imp.WriteXY(2.3,wCont, QNFE_EmiteOBS.Text);
      Inc(wCont);
    end;
    if QNFE_EmiteOBS_COMPLEMENTO.Text <> '' then
    begin
      Imp.WriteXY(2.3,wCont, QNFE_EmiteOBS_COMPLEMENTO.Text);
    end;

    //wCont := 57;
    //Imp.WriteXY(16.5,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
  end;

End;
//---------------------------------
procedure TFNotaImpressao.NF_BORGES;
Var wFatura, wColuna : Integer;
begin
  // *** Emissão de Nota Fiscal para a BORGES
  // *** OBS - Colocar Posicao X em Centimetros
  // *** wNotaGlobal Controla a quebra de continuação
  wCont := 0;
  With DMNotaSaida do
  Begin
    wNotaGlobal := 0;
    while wNotaGlobal < 2 do
    begin
      wCont := 0;
      Imp.WriteXY(16.5,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
      wCont := 1;
      If QNFE_EmiteInd_Entrada_Saida.Value = 'S' Then
        Imp.WriteXY(9.8,wCont,'X')
      Else
        Imp.WriteXY(11.8,wCont,'X');

      Imp.WriteXY(18.4,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
      if wNotaGlobal = 1 then
         Imp.WriteXY(14.5,wCont,'CONTINUACAO');
      WnotaGlobal := 2;
      wCont := wCont+5;
      Imp.WriteXY(0,wCont,QNFE_EmiteNAT_OPERACAO.Value);
      Imp.WriteXY(5.2,wCont,QNFE_Emitenum_cfop.Text);  //ALTERADO SERGIO 13/12/2002
      wCont := wCont+3;
      Imp.WriteXY(0,wCont, Trim(QNFE_EmiteNOME.Value) + ' - ' + QNFE_EmiteCOD_CADASTRO.Text);
      Imp.WriteXY(9.8,wCont,  QNFE_EmiteNUM_CGC_CPF.Value);
      Imp.WriteXY(15,wCont,QNFE_EmiteDT_EMISSAO.Text);
      wCont := wCont + 2;
      Imp.WriteXY(0,wCont, QNFE_EmiteDESC_ENDERECO.Value);
      Imp.WriteXY(8.5,wCont,QNFE_EmiteDESC_BAIRRO.Value);
      Imp.WriteXY(12.3,wCont,QNFE_EmiteDESC_CEP.Value);
      Imp.WriteXY(15,wCont,QNFE_EmiteDT_EMISSAO.Text);
      wCont := wCont+2;
      Imp.WriteXY(0,wCont,QNFE_EmiteDESC_CIDADE.Value);
      Imp.WriteXY(6.8,wCont,QNFE_EmiteDESC_TELEFONE.Value);
      Imp.WriteXY(9,wCont,QNFE_EmiteCOD_ESTADO.Value);
      Imp.WriteXY(10.2,wCont,QNFE_EmiteNUM_INSCRICAO.Value);
      Inc(wCont,3);

      //***Fatura***
      If QNFE_EmiteInd_Condicao_Pagto.Value = '2' Then
      Begin
        QContaReceber.Open;
        QContaReceber.First;
        wFatura := 0;
        wColuna := 0;
        While not(QContaReceber.Eof) do
        Begin
          Inc(wFatura);
          if ((wFatura mod 4) = 0) Then
           Begin
             Inc(wCont);
             wColuna := 0;
           End;
          Imp.WriteXY(wColuna, wCont, IntToStr(wFatura));
          Inc(wColuna,2);
          Imp.WriteXY(wColuna,wCont,QContaReceberDT_Vencimento.Text+' ');
          Inc(wColuna,2);
          Imp.WriteXY(wColuna,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
          Inc(wColuna,2);
          QContaReceber.Next;
        End;
        wFatura := 0;
        wColuna := 0;
        QContaReceber.Close;
      End;
      // **** Itens de produtos ****
      //wCont := 20;  // MUDADO ERA 8
      wCont := wCont + 4;
      wContLinha := 0;
      // somente pode posicionar no inicio do arquivo a primeira vez
      If wNotaGlobal = 0 then
         QNFE_EmiteIt.First;
      While Not QNFE_EmiteIT.Eof do
      Begin
        wCont := wCont + 1;
        Inc(wcontLinha);
        Imp.WriteXY(0,wCont,Bib.NumToTexto(QNFE_EmiteITCod_Produto.Value,0,6));
        Imp.WriteXY(2,wCont,QNFE_EmiteITDesc_Produto.Value);
        Imp.WriteXY(9,wCont,QNFE_EmiteITDesc_Situacao_Trib.Value);
        Imp.WriteXY(9.7,wCont,QNFE_EmiteITDesc_Unidade.Value);
        Imp.WriteXY(10.2,wCont,Bib.NumToTexto(QNFE_EmiteITQT_Quantidade.Value,2,8));
        Imp.WriteXY(11,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Unitario.Value,2,11));
        Imp.WriteXY(12,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value,2,19));
        Imp.WriteXY(17.4,wCont,QNFE_EmiteITPerc_Aliquota.Text);
        Calc_Peso_Nota;  // calcula peso para nota
        If QNFE_EmiteItDesc_Complemento.Text <> '' Then
         Begin   // ** Imprimir Complemento de Descrição
           wCont := wCont + 1;
           Inc(wContLinha);
           Imp.WriteXY(1,wCont,QNFE_EmiteITDesc_Complemento.Value);
         End;
        QNFE_EmiteIT.Next;
        //If wContLinha >= 18 then
        If wCont >= 37 Then
        Begin
          wCont := 43;
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
      Imp.WriteXY(12.2,wCont,'DESCONTO: '+Bib.NumToTexto(QNFE_EmiteVal_Desconto.Value,2,13));
    End;
    // Fim dos Item de Produto
    IMP_OBS_CORPO_NOTA(2, wCont);
//    FNotaImpressao.Imp_Desconto(wCont,1);
    wCont := 33;
    // *** Final dos Itens ****
    // *** Calculo do Imposto ****
    wCont := 42;
    Imp.WriteXY(0,wCont,Bib.NumToTexto(wbase_icm_tributada,2,18));
    Imp.WriteXY(3.2,wCont,Bib.NumToTexto(wvlr_icm,2,17));
    Imp.WriteXY(14.0,wCont,Bib.NumToTexto(wtotal_produtos,2,20));
    wCont := wCont + 2;
    Imp.WriteXY(0,wCont,Bib.NumToTexto(QNFE_EmiteVAL_FRETE.Value,2,18));
    Imp.WriteXY(6.8,wCont,Bib.NumToTexto(QNFE_EmiteVAL_DESPESAS.Value,2,17));
    Imp.WriteXY(10.2,wCont,Bib.NumToTexto(wvlr_ipi,2,15));
    Imp.WriteXY(14.0,wCont,Bib.NumToTexto( wtotal_produtos
                                 +wvlr_ipi
                                 +QNFE_EmiteVAL_DESPESAS.Value
                                 -QNFE_EmiteVAL_Desconto.Value,2,20));
    wCont := wCont + 3;
    If Trim(QNFE_Emitenome_transp.Value) = '' then
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_Transportadora.Value)
    Else
      Imp.WriteXY(0,wCont,QNFE_Emitenome_transp.Value);
    If QNFE_EmiteInd_Tipo_Frete.Value = 'FOB' Then
      Imp.WriteXY(9,wCont,'2') // Destinatário
    Else
      Imp.WriteXY(9,wCont,'1'); // Emitente
    Imp.WriteXY(10.5,wCont,QNFE_EmiteDesc_Placa.Value);
    Imp.WriteXY(13.8,wCont,QNFE_Emitecgc_transp.Value);
    wCont := wCont+2;
    Imp.WriteXY(0,wCont,QNFE_Emiteend_transp.Value);
    Imp.WriteXY(7.5,wCont,QNFE_Emitecidade_transp.Value);
    Imp.WriteXY(12.7,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(14,wCont,QNFE_Emiteinsc_transp.Value);
    wCont := wCont + 2;
    Imp.WriteXY(1,wCont,QNFE_EmiteNUM_VOLUMES.Text);
    Imp.WriteXY(12.7,wCont,Bib.NumToTexto(wPeso,2,8));
    Imp.WriteXY(15.5,wCont,Bib.NumToTexto(wPeso,2,8));
    wCont := wCont + 4;          //************************VERIFICAR POSICAO ERA 3

    //DADOS ADICIONAIS
    Imp.WriteXY(0,wCont,'DOCUMENTO EMITIDO POR MICROEMPRESA ');
    wCont := wCont + 1;
    Imp.WriteXY(0,wCont,'OPTANTE PELO SIMPLES/PR');
    if QNFE_EmiteItDESC_SITUACAO_TRIB.Value = '060' then
    Begin
      wCont := wCont + 1;
      Imp.WriteXY(0,wCont,'ICM JA PAGO POR SUBST. TRIB. ');
      wCont := wCont + 1;
      Imp.WriteXY(0,wCont,'CONF. ART.449A RICMS-PR');
    end;
    wCont := wCont + 1;
    Imp.WriteXY(0,wCont,QNFE_EmiteOBS.Value);
    wCont := wCont + 1;
    If Trim(QNFE_EmiteOBS_COMPLEMENTO.Text) <> '' Then
    Begin
      Imp.WriteXY(0,wCont,QNFE_EmiteOBS_COMPLEMENTO.Text);
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
    If QNFE_EmiteInd_Condicao_Pagto.Value = '1' Then
    Begin
      Imp.WriteXY(0,wCont,'Pagamento a Vista');
      wCont := wCont + 1;
    End;
  End;
//  Imp.SaltaPagina;
End;  //FIM IMPRESSAO NF BORGES

//---------------------------------
procedure TFNotaImpressao.NF_DINIZ;
Var wContServico : Byte;
    wTotalISS, wTotalServico : Real;
    wFatura, wColuna : Integer;
begin
  // *** Emissão de Nota Fiscal para a DINIZ
  // *** OBS - Colocar Posicao X em Centimetros
  // *** wNotaGlobal Controla a quebra de continuação
  wTotalISS := 0;
  wTotalServico := 0;
  wCont := 0;
  wFatura := 0;
  wColuna := 0;
  wMsgTributacao := '';
  With DMNotaSaida do
  Begin
    wNotaGlobal := 0;
    while wNotaGlobal < 2 do
    begin
      wCont := 0;
      If QNFE_EmiteInd_Entrada_Saida.Value = 'S' Then
        Imp.WriteXY(10.0,wCont,'X')
      Else
        Imp.WriteXY(12.0,wCont,'X');
      if wNotaGlobal = 1 then
         Imp.WriteXY(14.5,wCont,'CONTINUACAO');
      WnotaGlobal := 2;

      Imp.WriteXY(16.2,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
      Imp.WriteXY(18.2,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
      wCont := wCont+5;
      Imp.WriteXY(0,wCont,QNFE_EmiteNAT_OPERACAO.Value);
      Imp.WriteXY(5.2,wCont,QNFE_Emitenum_cfop.Text);  //ALTERADO SERGIO 13/12/2002
      wCont := wCont+3;
      Imp.WriteXY(0,wCont,QNFE_EmiteCOD_CADASTRO.Text);
      Imp.WriteXY(1.5,wCont, QNFE_EmiteNOME.Value);
      Imp.WriteXY(10,wCont,  QNFE_EmiteNUM_CGC_CPF.Value);
      Imp.WriteXY(15,wCont,QNFE_EmiteDT_EMISSAO.Text);
      wCont := wCont + 2;
      Imp.WriteXY(0,wCont, QNFE_EmiteDESC_ENDERECO.Value);
      Imp.WriteXY(8.3,wCont,QNFE_EmiteDESC_BAIRRO.Value);
      Imp.WriteXY(12.3,wCont,QNFE_EmiteDESC_CEP.Value);
      Imp.WriteXY(15,wCont,QNFE_EmiteDT_EMISSAO.Text);
      wCont := wCont+2;
      Imp.WriteXY(0,wCont,QNFE_EmiteDESC_CIDADE.Value);
      Imp.WriteXY(6.8,wCont,QNFE_EmiteDESC_TELEFONE.Value);
      Imp.WriteXY(9,wCont,QNFE_EmiteCOD_ESTADO.Value);
      Imp.WriteXY(9.8,wCont,QNFE_EmiteNUM_INSCRICAO.Value);
      Inc(wCont,3);

      //***Fatura***
      If QNFE_EmiteInd_Condicao_Pagto.Value = '2' Then
      Begin
        QContaReceber.Open;
        QContaReceber.First;
        While (not QContaReceber.Eof) do
        Begin
          Inc(wFatura);
          if ((wFatura mod 4) = 0) Then
           Begin
             Inc(wCont);
             wColuna := 0;
           End;
          Imp.WriteXY(wColuna, wCont, IntToStr(wFatura));
          Inc(wColuna,2);
          Imp.WriteXY(wColuna,wCont,QContaReceberDT_Vencimento.Text+' ');
          Inc(wColuna,2);
          Imp.WriteXY(wColuna,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
          Inc(wColuna,2);
          QContaReceber.Next;
        End;
        wFatura := 0;
        wColuna := 0;
        QContaReceber.Close;
      End;
      If QNFE_EmiteInd_Condicao_Pagto.Value = '1' Then
      Begin
        Imp.WriteXY(0,wCont,'Pagamento a Vista');
        inc(wCont);
      End;
      // **** Itens de produtos ****
      wCont := wCont + 4;  // MUDADO ERA 8
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
          Imp.WriteXY(0,wCont,QNFE_EmiteITNum_Fabricante.Value);
          //***Reduz o tamanho do campo DESC_PRODUTO, somente para DINIZ.
          Imp.WriteXY(3.5,wCont,(Copy(QNFE_EmiteItDESC_PRODUTO.Text, 1, 33)));
          Imp.WriteXY(8.8,wCont,QNFE_EmiteITDesc_Situacao_Trib.Value);
          Imp.WriteXY(9.7,wCont,QNFE_EmiteITDesc_Unidade.Value);
          Imp.WriteXY(10.2,wCont,Bib.NumToTexto(QNFE_EmiteITQT_Quantidade.Value,2,8));
          Imp.WriteXY(11,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Unitario.Value,2,11));
          Imp.WriteXY(12,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value,2,19));
          Imp.WriteXY(17.4,wCont,QNFE_EmiteITPerc_Aliquota.Text);
          Calc_Peso_Nota;  // calcula peso para nota
        End
        Else
        Begin
          wTotalISS := wTotalISS + QNFE_EmiteItVal_ISS.Value;
          wTotalServico := wTotalServico + QNFE_EmiteItVal_Total.Value;
        End;
        If QNFE_EmiteITDESC_OBSERVACAO_TR.Value <> '' Then
           wMsgTributacao := QNFE_EmiteITDESC_OBSERVACAO_TR.Value;
        QNFE_EmiteIT.Next;

        If ((wCont >= 37) AND (not(QNFE_EmiteIT.Eof))) Then
        Begin
          wCont := 43;
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
    IMP_OBS_CORPO_NOTA(1, wCont);
//    FNotaImpressao.Imp_Desconto(wCont,1);
    wCont := 33;
    wContServico := 0;
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
    // *** Calculo do Imposto ****
    wCont := 42;
    //Imp.WriteXY(0,wCont,Bib.NumToTexto(wbase_icm_tributada,2,18));
    //Imp.WriteXY(3.2,wCont,Bib.NumToTexto(wvlr_icm,2,17));
    Imp.WriteXY(2.1,wCont,'0,00');
    Imp.WriteXY(3.7,wCont,'0,00');
    Imp.WriteXY(6.8, wCont, Bib.NumToTexto(wBase_Subst, 2,17));
    Imp.WriteXY(10.2, wCont, BIB.NumToTexto(wIcms_Subst,2,17));
    Imp.WriteXY(14.0,wCont,Bib.NumToTexto(wtotal_produtos - wTotalServico,2,20));
    wCont := wCont + 2;
    Imp.WriteXY(0,wCont,Bib.NumToTexto(QNFE_EmiteVAL_FRETE.Value,2,18));
    Imp.WriteXY(6.8,wCont,Bib.NumToTexto(QNFE_EmiteVAL_DESPESAS.Value,2,17));
    Imp.WriteXY(10.2,wCont,Bib.NumToTexto(wvlr_ipi,2,15));
    Imp.WriteXY(14.0,wCont,Bib.NumToTexto( wtotal_produtos
                                 +wvlr_ipi + wIcms_Subst 
                                 +QNFE_EmiteVAL_DESPESAS.Value
                                 -QNFE_EmiteVAL_Desconto.Value
                                 -QNFE_EmiteVAL_Funrural.Value,2,20));
    wCont := wCont + 3;
    If Trim(QNFE_Emitenome_transp.Value) = '' then
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_Transportadora.Value)
    Else
      Imp.WriteXY(0,wCont,QNFE_Emitenome_transp.Value);
    If QNFE_EmiteInd_Tipo_Frete.Value = 'FOB' Then
      Imp.WriteXY(9.4,wCont,'2') // Destinatário
    Else
      Imp.WriteXY(9.4,wCont,'1'); // Emitente
    Imp.WriteXY(10.5,wCont,QNFE_EmiteDesc_Placa.Value);
    Imp.WriteXY(13.8,wCont,QNFE_Emitecgc_transp.Value);
    wCont := wCont+2;
    Imp.WriteXY(0,wCont,QNFE_Emiteend_transp.Value);
    Imp.WriteXY(7.5,wCont,QNFE_Emitecidade_transp.Value);
    Imp.WriteXY(12.7,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(14,wCont,QNFE_Emiteinsc_transp.Value);
    wCont := wCont + 2;
    Imp.WriteXY(1,wCont,QNFE_EmiteNUM_VOLUMES.Text);
    Imp.WriteXY(12.7,wCont,Bib.NumToTexto(wPeso,2,8));
    Imp.WriteXY(15.5,wCont,Bib.NumToTexto(wPeso,2,8));
    wCont := wCont + 3;          //************************VERIFICAR POSICAO ERA 3
    Imp.WriteXY(0,wCont,QNFE_EmiteOBS.Value);
    wCont := wCont + 1;
    If Trim(QNFE_EmiteOBS_COMPLEMENTO.Value) <> '' Then
    Begin
      Imp.WriteXY(0,wCont,QNFE_EmiteOBS_COMPLEMENTO.Value);
      wCont := wCont + 1;
    End;
    If Trim( QNFE_EmiteDesc_Mensagem.Value) <> '' Then
    Begin
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_Mensagem.Value);
      wCont := wCont + 1;
    End;
    If Trim(QNFE_EmiteDesc_COMPLEMENTO.Value) <> '' Then
    Begin
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_COMPLEMENTO.Value);
      wCont := wCont + 1;
    End;
    Imp.WriteXY(0,wCont,wMsgTributacao);
    wCont := wCont + 1;
    if QNotaSaidaCOD_ESTADO.Value = 'RS' then
    Begin
      Imp.WriteXY(0,wCont,'ICMS próprio considerado de acordo c/ decreto');
      inc(wCont);
      Imp.WriteXY(0,wCont,'45605/2008-RS no valor de R$'+ Bib.NumToTexto(wvlr_icm,2,8));
    end;
    if QNotaSaidaCOD_ESTADO.Value = 'SC' then
    Begin
      Imp.WriteXY(0,wCont,'ICMS próprio considerado de acordo c/ decreto');
      inc(wCont);
      Imp.WriteXY(0,wCont,'1475/2008-SC no valor de R$'+ Bib.NumToTexto(wvlr_icm,2,8));
    end;
  End;
//  Imp.SaltaPagina;
End;  //FIM IMPRESSAO NF DINIZ

procedure TFNotaImpressao.NF_FIBRATIVE;
Var wContServico : Byte;
    wTotalISS, wTotalServico : Real;
    wFatura, wColuna : Integer;
begin
  // *** Emissão de Nota Fiscal para a FIBRATIVE
  // *** OBS - Colocar Posicao X em Centimetros
  // *** wNotaGlobal Controla a quebra de continuação
  wTotalISS := 0;
  wTotalServico := 0;
  wCont := 0;
  wFatura := 0;
  wColuna := 0;
  wMsgTributacao := '';
  With DMNotaSaida do
  Begin
    wNotaGlobal := 0;
    while wNotaGlobal < 2 do
    begin
      wCont := 4;
      If QNFE_EmiteInd_Entrada_Saida.Value = 'S' Then
        Imp.WriteXY(11.0,wCont,'X')
      Else
        Imp.WriteXY(13.3,wCont,'X');
      if wNotaGlobal = 1 then
         Imp.WriteXY(14.5,wCont,'CONTINUACAO');
      WnotaGlobal := 2;

      Imp.WriteXY(16,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
      Imp.WriteXY(18,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
      wCont := wCont+5;
      Imp.WriteXY(0,wCont,QNFE_EmiteNAT_OPERACAO.Value);
      Imp.WriteXY(5.7,wCont,QNFE_Emitenum_cfop.Text);
      wCont := wCont+3;
      Imp.WriteXY(0,wCont,QNFE_EmiteCOD_CADASTRO.Text);
      Imp.WriteXY(1.5,wCont, QNFE_EmiteNOME.Value);
      Imp.WriteXY(11.5,wCont,  QNFE_EmiteNUM_CGC_CPF.Value);
      Imp.WriteXY(16,wCont,QNFE_EmiteDT_EMISSAO.Text);
      wCont := wCont + 2;
      Imp.WriteXY(0,wCont, QNFE_EmiteDESC_ENDERECO.Value);
      Imp.WriteXY(9,wCont,QNFE_EmiteDESC_BAIRRO.Value);
      Imp.WriteXY(13.3,wCont,QNFE_EmiteDESC_CEP.Value);
      Imp.WriteXY(16,wCont,QNFE_EmiteDT_EMISSAO.Text);
      wCont := wCont+2;
      Imp.WriteXY(0,wCont,QNFE_EmiteDESC_CIDADE.Value);
      Imp.WriteXY(7.5,wCont,QNFE_EmiteDESC_TELEFONE.Value);
      Imp.WriteXY(10.1,wCont,QNFE_EmiteCOD_ESTADO.Value);
      Imp.WriteXY(11.6,wCont,QNFE_EmiteNUM_INSCRICAO.Value);

      // **** Itens de produtos ****
      wCont := wCont + 4;
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
          Imp.WriteXY(0,wCont,QNFE_EmiteITCOD_PRODUTO.Text);
          Imp.WriteXY(1.5,wCont,(Copy(QNFE_EmiteItDESC_PRODUTO.Text, 1, 33)));
          Imp.WriteXY(10.7,wCont,QNFE_EmiteITDesc_Situacao_Trib.Value);
          Imp.WriteXY(11.2,wCont,QNFE_EmiteITDesc_Unidade.Value);
          Imp.WriteXY(11.5,wCont,Bib.NumToTexto(QNFE_EmiteITQT_Quantidade.Value,2,5));
          Imp.WriteXY(12.9,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Unitario.Value,2,9));
          Imp.WriteXY(15.2,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value,2,11));
          Imp.WriteXY(17.4,wCont,QNFE_EmiteITPerc_Aliquota.Text);
          Calc_Peso_Nota;  // calcula peso para nota
        End
        Else
        Begin
          wTotalISS := wTotalISS + QNFE_EmiteItVal_ISS.Value;
          wTotalServico := wTotalServico + QNFE_EmiteItVal_Total.Value;
        End;
        If QNFE_EmiteITDESC_OBSERVACAO_TR.Value <> '' Then
           wMsgTributacao := QNFE_EmiteITDESC_OBSERVACAO_TR.Value;
        QNFE_EmiteIT.Next;

        If wCont >= 37 Then
        Begin
          wCont := 43;
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
    IMP_OBS_CORPO_NOTA(1, wCont);
//    FNotaImpressao.Imp_Desconto(wCont,1);
    wCont := 33;
    wContServico := 0;
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
    // *** Calculo do Imposto ****
    wCont := 41;
    //Imp.WriteXY(0,wCont,Bib.NumToTexto(wbase_icm_tributada,2,18));
    //Imp.WriteXY(3.2,wCont,Bib.NumToTexto(wvlr_icm,2,17));
    Imp.WriteXY(0,wCont,Bib.NumToTexto(0,2,18));
    Imp.WriteXY(4,wCont,'0,00');
    Imp.WriteXY(7.2, wCont, Bib.NumToTexto(wBase_Subst, 2,17));
    Imp.WriteXY(10.2, wCont, BIB.NumToTexto(wIcms_Subst,2,17));
    Imp.WriteXY(14.0,wCont,Bib.NumToTexto(wtotal_produtos - wTotalServico,2,20));
    wCont := wCont + 2;
    Imp.WriteXY(0,wCont,Bib.NumToTexto(QNFE_EmiteVAL_FRETE.Value,2,18));
    Imp.WriteXY(7.2,wCont,Bib.NumToTexto(QNFE_EmiteVAL_DESPESAS.Value,2,17));
    Imp.WriteXY(10.2,wCont,Bib.NumToTexto(wvlr_ipi,2,15));
    Imp.WriteXY(14.0,wCont,Bib.NumToTexto( wtotal_produtos
                                 +wvlr_ipi + wIcms_Subst
                                 +QNFE_EmiteVAL_DESPESAS.Value
                                 -QNFE_EmiteVAL_Desconto.Value
                                 -QNFE_EmiteVAL_Funrural.Value,2,20));
    wCont := wCont + 3;
    If Trim(QNFE_Emitenome_transp.Value) = '' then
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_Transportadora.Value)
    Else
      Imp.WriteXY(0,wCont,QNFE_Emitenome_transp.Value);
    If QNFE_EmiteInd_Tipo_Frete.Value = 'FOB' Then
      Imp.WriteXY(10,wCont,'2') // Destinatário
    Else
      Imp.WriteXY(10,wCont,'1'); // Emitente
    Imp.WriteXY(10.5,wCont,QNFE_EmiteDesc_Placa.Value);
    Imp.WriteXY(13.8,wCont,QNFE_Emitecgc_transp.Value);
    wCont := wCont+2;
    Imp.WriteXY(0,wCont,QNFE_Emiteend_transp.Value);
    Imp.WriteXY(8,wCont,QNFE_Emitecidade_transp.Value);
    Imp.WriteXY(12.7,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(14,wCont,QNFE_Emiteinsc_transp.Value);
    wCont := wCont + 2;
    Imp.WriteXY(1,wCont,QNFE_EmiteNUM_VOLUMES.Text);
    Imp.WriteXY(12.7,wCont,Bib.NumToTexto(wPeso,2,8));
    Imp.WriteXY(15.5,wCont,Bib.NumToTexto(wPeso,2,8));
    wCont := wCont + 3;          //************************VERIFICAR POSICAO ERA 3
    Imp.WriteXY(0,wCont,QNFE_EmiteOBS.Value);
    wCont := wCont + 1;
    If Trim(QNFE_EmiteOBS_COMPLEMENTO.Value) <> '' Then
    Begin
      Imp.WriteXY(0,wCont,QNFE_EmiteOBS_COMPLEMENTO.Value);
      wCont := wCont + 1;
    End;
    If Trim( QNFE_EmiteDesc_Mensagem.Value) <> '' Then
    Begin
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_Mensagem.Value);
      wCont := wCont + 1;
    End;
    If Trim(QNFE_EmiteDesc_COMPLEMENTO.Value) <> '' Then
    Begin
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_COMPLEMENTO.Value);
      wCont := wCont + 1;
    End;
    If Trim(QNFE_EmiteDesc_COMPLEMENTO1.Value) <> '' Then
    Begin
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_COMPLEMENTO1.Value);
      wCont := wCont + 1;
    End;
    If Trim(QNFE_EmiteDesc_COMPLEMENTO2.Value) <> '' Then
    Begin
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_COMPLEMENTO2.Value);

    End;
  End;
//  Imp.SaltaPagina;
End;  //FIM IMPRESSAO NF FIBRATIVE

//----------------------------------------------
procedure TFNotaImpressao.NF_FAZENDA;
Var wContServico : Byte;
    wTotalISS, wTotalServico, wValDesconto : Real;
    wFatura, wColuna : Integer;
begin
  // *** Emissão de Nota Fiscal para a FAZENDA
  // *** OBS - Colocar Posicao X em Centimetros
  // *** wNotaGlobal Controla a quebra de continuação
  wTotalISS := 0;
  wTotalServico := 0;
  wCont := 0;
  wFatura := 0;
  wColuna := 0;
  With DMNotaSaida do
  Begin
    wNotaGlobal := 0;
    while wNotaGlobal < 2 do
    begin
      wCont := 0;
      if wNotaGlobal = 1 then
         Imp.WriteXY(14.5,wCont,'CONTINUACAO');
      WnotaGlobal := 2;

      //----------------------------
      Inc(wCont,13);
      Imp.WriteXY(0,wCont,QNFE_EmiteNAT_OPERACAO.Value);
      Imp.WriteXY(10,wCont,QNFE_Emitenum_cfop.Text);

      Inc(wCont,4);
      Imp.WriteXY(13,wCont,  QNFE_EmiteNUM_CGC_CPF.Value);

      Inc(wCont,3);
      Imp.WriteXY(0,wCont,QNFE_EmiteCOD_CADASTRO.Text);
      Imp.WriteXY(1.5,wCont, QNFE_EmiteNOME.Value);
      Imp.WriteXY(13,wCont,QNFE_EmiteNUM_INSCRICAO.Value);
      Imp.WriteXY(19,wCont,QNFE_EmiteDT_EMISSAO.Text);

      Inc(wCont,2);
      Imp.WriteXY(0,wCont, QNFE_EmiteDESC_ENDERECO.Value);
      Imp.WriteXY(8.3,wCont,QNFE_EmiteDESC_BAIRRO.Value);
      Imp.WriteXY(19,wCont,QNFE_EmiteDT_EMISSAO.Text);

      Inc(wCont,3);
      Imp.WriteXY(0,wCont,QNFE_EmiteDESC_CIDADE.Value);
      Imp.WriteXY(8,wCont,QNFE_EmiteCOD_ESTADO.Value);
      Imp.WriteXY(10,wCont,QNFE_EmiteDESC_CEP.Value);
      Imp.WriteXY(13,wCont,QNFE_EmiteDESC_TELEFONE.Value);
      //---------------------------
      //Itens de produtos
      //---------------------------
      Inc(wCont,5);
      wContLinha := 0;
      // somente pode posicionar no inicio do arquivo a primeira vez
      If wNotaGlobal = 0 then
         QNFE_EmiteIt.First;

      While Not QNFE_EmiteIT.Eof do
      Begin
        if QNFE_EmiteItIND_TIPO_PRODUTO.Value <> 'SERVIÇO' Then
        begin
          wCont := wCont + 1;
          Inc(wcontLinha);
          Imp.WriteXY(0,wCont,Bib.NumToTexto(QNFE_EmiteITCod_Produto.Value,0,6));
          Imp.WriteXY(1.5,wCont,QNFE_EmiteItDESC_PRODUTO.Value);
          Imp.WriteXY(9.2,wCont,QNFE_EmiteITDesc_Unidade.Value);
          Imp.WriteXY(10.2,wCont,Bib.NumToTexto(QNFE_EmiteITQT_Quantidade.Value,2,8));
          Imp.WriteXY(12.1,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Unitario.Value,2,11));
          Imp.WriteXY(15,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value,2,19));
          Imp.WriteXY(20.2,wCont,QNFE_EmiteITPerc_Aliquota.Text);
        end
        Else
        begin
          wTotalISS := wTotalISS + QNFE_EmiteItVal_ISS.Value;
          wTotalServico := wTotalServico + QNFE_EmiteItVal_Total.Value;
        end;
        QNFE_EmiteIT.Next;

      End;
    End;
    // Fim do Controle de Continuação
    //---------------------------------
    If QNFE_EmiteVal_Desconto.Value > 0 Then
    Begin
      wValDesconto := ((QNFE_EmiteVal_Desconto.Value * wtotal_produtos) /100);
      wCont := wCont + 1;
      Imp.WriteXY(0.5,wCont,'DESCONTO: '+Bib.NumToTexto(wValDesconto,2,13));
//      Imp.WriteXY(0.5,wCont,'DESCONTO: '+Bib.NumToTexto(QNFE_EmiteVal_Desconto.Value,2,13));
    End;
    // Fim dos Item de Produto
    IMP_OBS_CORPO_NOTA(1, wCont);
//    FNotaImpressao.Imp_Desconto(wCont,1);
    wCont := 33;
    wContServico := 0;
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
    //----------------------------
    //Calculo do Imposto
    //----------------------------
    wCont := 53;
    Imp.WriteXY(2.5,wCont,Bib.NumToTexto(wbase_icm_tributada,2,18));
    Imp.WriteXY(4.5,wCont,Bib.NumToTexto(wvlr_icm,2,17));
    Imp.WriteXY(11,wCont, Bib.NumToTexto(wTotal_produtos,2,18));
    Inc(wCont,2);
    Imp.WriteXY(2.5,wCont,Bib.NumToTexto(QNFE_EmiteVAL_FRETE.Value,2,18));
    //falta seguro
    Imp.WriteXY(11,wCont,Bib.NumToTexto(QNFE_EmiteVAL_DESPESAS.Value,2,17));

    {Imp.WriteXY(14.0,wCont,Bib.NumToTexto( wtotal_produtos
                                 +wvlr_ipi
                                 +QNFE_EmiteVAL_DESPESAS.Value
                                 -wValDesconto
                                 -QNFE_EmiteVAL_Funrural.Value,2,20));  }
    Imp.WriteXY(16, wCont, FloatToStr(Bib.NumToTextoArredondamento((wtotal_produtos
                                 +wvlr_ipi
                                 +QNFE_EmiteVAL_DESPESAS.Value
                                 -wValDesconto
                                 -QNFE_EmiteVAL_Funrural.Value),2)));

    wCont := wCont + 6;
    If Trim(QNFE_Emitenome_transp.Value) = '' then
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_Transportadora.Value)
    Else
      Imp.WriteXY(0,wCont,QNFE_Emitenome_transp.Value);
    If QNFE_EmiteInd_Tipo_Frete.Value = 'FOB' Then
      Imp.WriteXY(10.7,wCont,'2') // Destinatário
    Else
      Imp.WriteXY(10.7,wCont,'1'); // Emitente
    Imp.WriteXY(12,wCont,QNFE_EmiteDesc_Placa.Value);
    Imp.WriteXY(14,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(15.5,wCont,QNFE_Emitecgc_transp.Value);
    wCont := wCont+2;
    Imp.WriteXY(0,wCont,QNFE_Emiteend_transp.Value);
    Imp.WriteXY(10.5,wCont,QNFE_Emitecidade_transp.Value);
    Imp.WriteXY(14,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(15.5,wCont,QNFE_Emiteinsc_transp.Value);
    wCont := wCont + 3;
    Imp.WriteXY(0,wCont,QNFE_EmiteNUM_VOLUMES.Text);
    Imp.WriteXY(15.5,wCont,Bib.NumToTexto(wPeso,2,8));
    Imp.WriteXY(18,wCont,Bib.NumToTexto(wPeso,2,8));
    wCont := wCont +4;          //************************VERIFICAR POSICAO ERA 3
   { if QNFE_EmiteCod_Filial.value  = 1 Then
    begin
      Imp.WriteXY(0,wCont,'Doc. emitido por empresa enquadrada no regime Fiscal');
      wCont := wCont + 1;
      Imp.WriteXY(0,wCont,'das Microempresas e das Empresas de Pequeno porte nao');
      wCont := wCont + 1;
      Imp.WriteXY(0,wCont,'gera direito a credito de ICMS.(Art. 416 do RICMS/PR)');
      wCont := wCont + 1;
    end;}
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
    {If wCont=59 Then //MUDADO
    Begin
       Imp.WriteXY(19,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,6) );
       wCont := wCont + 1;
    End;  }
    If QNFE_EmiteInd_Condicao_Pagto.Value = '1' Then
    Begin
      Imp.WriteXY(0,wCont,'Pagamento a Vista');
      wCont := wCont + 1;
    End
    else
    Begin
    If QNFE_EmiteInd_Condicao_Pagto.Value = '2' Then
      Begin
        QContaReceber.Open;
        QContaReceber.First;
        While (not QContaReceber.Eof) do
        Begin
          Inc(wFatura);
          if ((wFatura mod 4) = 0) Then
           Begin
             Inc(wCont);
             wColuna := 0;
           End;
          Imp.WriteXY(wColuna, wCont, IntToStr(wFatura));
          Inc(wColuna,2);
          Imp.WriteXY(wColuna,wCont,'vencimento' + QContaReceberDT_Vencimento.Text+' ');
          Inc(wColuna,2);
          Imp.WriteXY(wColuna,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
          Inc(wColuna,2);
          QContaReceber.Next;
        End;
        wFatura := 0;
        wColuna := 0;
        QContaReceber.Close;
      End;
    end;

  End;
//  Imp.SaltaPagina;
End;  //FIM IMPRESSAO NF FAZENDA
//----------------------------------------------

Procedure TFNotaImpressao.EmiteGuia;
Var wNumNota, wDescPlaca : String;
    wAno, wMes, wDia : Word;
Begin
 

End;


Procedure TFNotaImpressao.NF_SAFARI;
var
  wAux, wVlFrete, wValIss, wValServico, wValProduto, wValRF : Real;
  wContReceber : Byte;
  wFatura : Integer;
Begin
  wCont:= 0;
  wPeso:= 0;
  wVolumes := 0;
  wValProduto := 0;
  with DMNotaSaida do
  begin
    wNotaGlobal := 0;
    while wNotaGlobal < 2 do
    begin
      if wNotaGlobal = 1 then // SE A NOTA FOR CONTINUAÇÃO ESCREVE NA NOTA
      begin
        wCont := 0;
        Imp.WriteXY(11,wCont,'CONTINUACAO');
        Imp.WriteXY(18,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
      end;

      if wNotaGlobal = 0 then
        Imp.WriteXY(18,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );

      wNotaGlobal := 2;
      Inc(wCont,3);
      if QNFE_EmiteInd_Entrada_Saida.Value = 'S' Then
        Imp.WriteXY(13.5,wCont,'XX')
      Else
        Imp.WriteXY(15.6,wCont,'XX');

      Inc(wCont,5);

      Imp.WriteXY(1.5,wCont,QNFE_EmiteNAT_OPERACAO.Value);
      Imp.WriteXY(7.3,wCont, QNFE_Emitenum_cfop.Text);
      Imp.WriteXY(9.3,wCont,QNFE_EmiteINSCRICAO_FILIAL.Value);

      //DESTINATÁRIO/REMETENTE

      Inc(wCont,3);
      Imp.WriteXY(1, wCont, QNFE_EmiteNome.Value);
      Imp.WriteXY(13.5,wCont,QNFE_EmiteNUM_CGC_CPF.Value);
      Imp.WriteXY(18.2, wCont, QNFE_EmiteDT_EMISSAO.Text);

      wCont := wCont + 2;
      Imp.WriteXY(1, wCont, QNFE_EmiteDESC_ENDERECO.Value);
      Imp.WriteXY(11.9, wCont, QNFE_EmiteDESC_BAIRRO.Value);
      Imp.WriteXY(16, wCont, QNFE_EmiteDESC_CEP.Value);
      Imp.WriteXY(18.2, wCont, QNFE_EmiteDT_RECEBIMENTO.Text);

      wCont := wCont + 2;
      Imp.WriteXY(1, wCont, QNFE_EmiteDESC_CIDADE.Value);
      Imp.WriteXY(8.5, wCont, QNFE_EmiteDESC_TELEFONE.Value);
      Imp.WriteXY(12.5, wCont,QNFE_EmiteUF_NOTA.Value);

      if QNFE_EmiteNUM_INSCRICAO.Value <> 'ISENTO' then
        Imp.WriteXY(13.8, wCont, QNFE_EmiteNUM_INSCRICAO.Value);

      //DADOS DO PRODUTO

      wCont := 18;
      wContLinha := 0;
      wValIss := 0;
      wValServico := 0;
      If wNotaGlobal = 0 then
        QNFE_EmiteIt.First;
        while not QNFE_EmiteIt.Eof do
        begin
          if QNFE_EmiteItVAL_ISS.Value <> 0 then
          begin
            wValIss := wValIss + QNFE_EmiteItVAL_ISS.Value;
            wValServico := wValServico + QNFE_EmiteItVAL_TOTAL.Value;
          end;

          Inc(wContLinha);
          Inc(wCont);
          Imp.WriteXY(1, wCont, QNFE_EmiteItCOD_PRODUTO.Text);
          Imp.WriteXY(3, wCont, QNFE_EmiteItDESC_PRODUTO.Value);
          //Imp.WriteXY(9.9, wCont, QNFE_EmiteItDESC_CLASS_FISCAL.Value);
          Imp.WriteXY(12.8, wCont, QNFE_EmiteItDESC_SITUACAO_TRIB.Value);
          Imp.WriteXY(13, wCont, QNFE_EmiteItDESC_UNIDADE.Value);
          Imp.WriteXY(13.8, wCont, Bib.NumToTexto(QNFE_EmiteItQT_QUANTIDADE.Value,0,4));
          Imp.WriteXY(15, wCont, Bib.NumToTexto(QNFE_EmiteItVAL_UNITARIO.Value,2,8));
          Imp.WriteXY(17.3, wCont, Bib.NumToTexto(QNFE_EmiteItVAL_TOTAL.Value, 2,8));
          Imp.WriteXY(18, wCont,QNFE_EmiteItPERC_ALIQUOTA.Text);
          //Imp.WriteXY(17.6, wCont, QNFE_EmiteItPERC_IPI.Text);
          //Imp.WriteXY(19, wCont, QNFE_EmiteItVAL_IPI.Text);
          wPeso := wPeso +  QNFE_EmiteItNum_Volumes.Value * QNFE_EmiteItQT_QUANTIDADE.Value;
          wVolumes := wVolumes + QNFE_EmiteItNum_Metros_Cubicos.Value * QNFE_EmiteItQT_QUANTIDADE.Value;

          if QNFE_EmiteItIND_TIPO_PRODUTO.Text <> 'SERVIÇO' then
          begin
            wValProduto := wValProduto + ((QNFE_EmiteItVAL_UNITARIO.Value) * (QNFE_EmiteItQT_QUANTIDADE.Value));
          end;

          QNFE_EmiteIt.Next;

          If (wContLinha >= 16) and (not QNFE_EmiteIT.eof) then
          Begin
            wCont := 43; //A MESMA POSICAO DO [VALOR TOTAL DOS PRODUTOS]
            Imp.WriteXY(16.5,wCont,'CONTINUA');
            wNotaGlobal := 1;
            Imp.SaltaPagina;
            Break;
          End;
        end; //fim do while
      end;
      if QNFE_EmiteDESC_OBS_CORPO_NOTA.Text <> '' then
      Begin
        wLinha1 := trim(copy(QNFE_EmiteDESC_OBS_CORPO_NOTA.Value,1,56));
        wLinha2 := trim(copy(QNFE_EmiteDESC_OBS_CORPO_NOTA.Value,57,56));
        wLinha3 := trim(copy(QNFE_EmiteDESC_OBS_CORPO_NOTA.Value,113,56));
        wLinha4 := trim(copy(QNFE_EmiteDESC_OBS_CORPO_NOTA.Value,169,56));
      end;
      if wLinha1 <> '' then
      Begin
        inc(wCont);
        Imp.WriteXY(3,wCont,wLinha1);
        inc(wCont);
      end;
      if wLinha2 <> '' then
      Begin
        Imp.WriteXY(3,wCont,wLinha2);
        inc(wCont);
      end;
      if wLinha3 <> '' then
      Begin
        Imp.WriteXY(3,wCont,wLinha3);
        inc(wCont);
      end;
      if wLinha4 <> '' then
        Imp.WriteXY(2.3,wCont,wLinha4);


    //CALCULO DO IMPOSTO

    wCont := 39;
    Imp.WriteXY(0.5,wCont, Bib.NumToTexto(wbase_icm_tributada,2,18));
    Imp.WriteXY(4, wCont, Bib.NumToTexto(wvlr_icm,2,17));
    Imp.WriteXY(8, wCont, Bib.NumToTexto(wBase_Subst, 2,17));
    Imp.WriteXY(12, wCont, BIB.NumToTexto(wIcms_Subst,2,17));
    Imp.WriteXY(16,wCont,Bib.NumToTexto(wValProduto,2,11));

    wCont := wCont + 2;

    wFunrural := 0;
    If QNFE_EmiteInd_Funrural.Value = 'S' Then
      wFunrural := QNFE_Emiteval_funrural.Value;
    Imp.WriteXY(16,wCont,Bib.NumToTexto( wtotal_produtos
                               +wvlr_ipi
                               +QNFE_EmiteVAL_DESPESAS.Value
                               -QNFE_EmiteVAL_Desconto.Value
                               -wFunrural
                               -QNFE_EmiteVal_Desconto_Fitas.Value
                               -wDesc_Transgenicos
                               +wVlFrete,2,11));

    //TRANSPORTADOR/VOLUMES TRANSPORTADOS

    wCont := 44;

    if Trim(QNFE_Emitenome_transp.Value) = '' then
      Imp.WriteXY(1,wCont,QNFE_EmiteDesc_Transportadora.Value)
    else
      Imp.WriteXY(1,wCont,QNFE_Emitenome_transp.Value);
    if QNFE_EmiteInd_Tipo_Frete.Value = 'FOB' Then
      Imp.WriteXY(11.3,wCont,'2') // Destinatário
    else
      Imp.WriteXY(11.3,wCont,'1'); // Emitente
    Imp.WriteXY(13,wCont,QNFE_EmiteDesc_Placa.Value);
    Imp.WriteXY(15.3,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(16,wCont,QNFE_Emitecgc_transp.Value);

    wCont := wCont+2;

    Imp.WriteXY(1,wCont,QNFE_Emiteend_transp.Value);
    Imp.WriteXY(9,wCont,QNFE_Emitecidade_transp.Value);
    Imp.WriteXY(15.3,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(16,wCont,QNFE_Emiteinsc_transp.Value);
    wCont := wCont + 2;
    Imp.WriteXY(1,wCont,QNFE_EmiteNUM_VOLUMES.Text);
    Imp.WriteXY(4.5,wCont,'Volumes');
    Imp.WriteXY(13.7,wCont,Bib.NumToTexto(wPeso,2,8));
    Imp.WriteXY(17,wCont,Bib.NumToTexto(wPeso,2,8));

    //DADOS ADICIONAIS
    Inc(wCont,3);
//    Imp.WriteXY(0.5,wCont,'Documento Emitido por ME ou EPP, optante pelo simples Nacional');      Retirado a pedido da Marcia
    Inc(wCont);
//    Imp.WriteXY(0.5,wCont,'nao gera direito a credito de ICMS e de ISS Dec 6038/7-2  2007');
    Inc(wCont);
    Imp.WriteXY(0.7,wCont,QNFE_EmiteOBS.Value);
    wCont := wCont + 1;
    If Trim(QNFE_EmiteOBS_COMPLEMENTO.Value) <> '' Then
    Begin
      Imp.WriteXY(0.7,wCont,QNFE_EmiteOBS_COMPLEMENTO.Value);
      wCont := wCont + 1;
    End;
    If Trim( QNFE_EmiteDesc_Mensagem.Value)<>'' Then
    Begin
      Imp.WriteXY(1,wCont,QNFE_EmiteDesc_Mensagem.Value);
      wCont := wCont + 1;
    End;
    If Trim(QNFE_EmiteDesc_COMPLEMENTO.Value) <> '' Then
    Begin
      Imp.WriteXY(1,wCont,QNFE_EmiteDesc_COMPLEMENTO.Value);
      wCont := wCont + 1;
    End;
    If QNFE_EmiteInd_Condicao_Pagto.Value = '1' Then
    Begin
      Imp.WriteXY(1,wCont,'Pagamento a Vista');
      wCont := wCont + 1;
    End;
    wCont := 60;
    Imp.WriteXY(16.5,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
  end;
End;

Procedure TFNotaImpressao.NF_CGS;
Var wVencimento,wJaExtenso : Byte;
    wExtenso, wLinhaExt1, wLinhaExt2, wProduto : String;
    wVol : Real;
begin
  // *** Emissão de Nota Fiscal para a CGS
  // *** OBS - Colocar Posicao X em Centimetros
  With DMNotaSaida do
  Begin
    wNotaGlobal := 0;
    wVol := 0;
    while wNotaGlobal < 2 do
    begin
      wCont := 2;
      if wNotaGlobal = 1 then
      begin
         wCont := 7;
//         wNumero_Continua := QNFE_EmiteNUM_NOTA.Value - 1;
         Imp.WriteXY(9.5,wCont,'CONTINUACAO NOTA ');  //+Bib.NumToTexto(wNumero_Continua,0,8));
      end;
      WnotaGlobal := 2;
      If QNFE_EmiteInd_Entrada_Saida.Value = 'S' Then
        Imp.WriteXY(15.2,wCont,'XX')
      Else
        Imp.WriteXY(17,wCont,'XX');

      Imp.WriteXY(21.3,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );

      wCont := wCont+6;
      Imp.WriteXY(1.2,wCont,QNFE_EmiteNAT_OPERACAO.Value);
      Imp.WriteXY(7.7,wCont,QNFE_Emitenum_cfop.Text);

      wCont := wCont+3;
      Imp.WriteXY(1.2,wCont,QNFE_EmiteCOD_CADASTRO.Text);
      Imp.WriteXY(2.1,wCont,QNFE_EmiteNOME.Value);
      Imp.WriteXY(15,wCont,QNFE_EmiteNUM_CGC_CPF.Value);
      Imp.WriteXY(21.3,wCont,QNFE_EmiteDT_EMISSAO.Text);
      wCont := wCont + 2;
      Imp.WriteXY(1.2,wCont, QNFE_EmiteDESC_ENDERECO.Value);
      Imp.WriteXY(13,wCont,QNFE_EmiteDESC_BAIRRO.Value);
      Imp.WriteXY(17.3,wCont,QNFE_EmiteDESC_CEP.Value);
      Imp.WriteXY(21.3,wCont,QNFE_EmiteDT_RECEBIMENTO.Text);
      wCont := wCont + 2;
      Imp.WriteXY(1,wCont,QNFE_EmiteDESC_CIDADE.Value);
      Imp.WriteXY(10.6,wCont,QNFE_EmiteDESC_TELEFONE.Value);
      Imp.WriteXY(14.3,wCont,QNFE_EmiteCOD_ESTADO.Value);
      Imp.WriteXY(15.3,wCont,QNFE_EmiteNUM_INSCRICAO.Value);
      wCont := wCont + 4;  //FABIANO
      wExtenso := Bib.Extenso( wtotal_produtos
                          +wvlr_ipi - QNFE_EmiteVal_Desconto.Value,'REAL');
      Bib.QuebraString(wExtenso,40,wLinhaExt1,wLinhaExt2,'*');
      If QNFE_EmiteInd_Condicao_Pagto.Value = '2' Then //A PRAZO
      Begin
        QContaReceber.Open;
        QContaReceber.First;
        wVencimento := 0;
        wJaExtenso := 0;
        While not QContaReceber.Eof do
        Begin
          If (((DMNotaSaida.QNotaSaidaCOD_SERIE.Value = 'B1') and //MARCOS - colocado p/ nao imprimir a parte B
             ( DMNotaSaida.QNotaSaidaNUM_NOTA.Value = QContaReceberNum_Titulo.Value))  or
             ( DMNotaSaida.QNotaSaidaCOD_SERIE.Value <> 'B1')) then
          Begin
            if wVencimento = 0 then
            begin
              wVencimento := 1;
              Imp.WriteXY(0.4,wCont,copy(QContaReceberDT_Vencimento.Text,1,6)+copy(QContaReceberDT_Vencimento.Text,9,2)+' - '+
                                    Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
            end
            else
            if wVencimento = 1 then
            Begin
              wVencimento := 2;
              Imp.WriteXY(5.4,wCont,copy(QContaReceberDT_Vencimento.Text,1,6)+copy(QContaReceberDT_Vencimento.Text,9,2)+' - '+
                                    Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
            end
            else
            if wVencimento = 2 then
            Begin
              wVencimento := 3;
              Imp.WriteXY(10.4,wCont,copy(QContaReceberDT_Vencimento.Text,1,6)+copy(QContaReceberDT_Vencimento.Text,9,2)+' - '+
                                    Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
            end
            else
            if wVencimento = 3 then
            Begin
              wVencimento := 4;
              Imp.WriteXY(15.4,wCont,copy(QContaReceberDT_Vencimento.Text,1,6)+copy(QContaReceberDT_Vencimento.Text,9,2)+' - '+
                                  Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
            end
            else
            if wVencimento = 4 then
            Begin
              wVencimento := 5;
              Imp.WriteXY(20.4,wCont,copy(QContaReceberDT_Vencimento.Text,1,6)+copy(QContaReceberDT_Vencimento.Text,9,2)+' - '+
                                    Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
              wCont := wCont +1;
            end
            else
            if wVencimento = 5 then
            Begin
              wVencimento := 6;
              Imp.WriteXY(0.4,wCont,copy(QContaReceberDT_Vencimento.Text,1,6)+copy(QContaReceberDT_Vencimento.Text,9,2)+' - '+
                                     Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
            end
            else
            if wVencimento = 6 then
            Begin
              wVencimento := 7;
              Imp.WriteXY(5.4,wCont,copy(QContaReceberDT_Vencimento.Text,1,6)+copy(QContaReceberDT_Vencimento.Text,9,2)+' - '+
                                     Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
            end
            else
            if wVencimento = 7 then
            Begin
              wVencimento := 8;
              Imp.WriteXY(10.4,wCont,copy(QContaReceberDT_Vencimento.Text,1,6)+copy(QContaReceberDT_Vencimento.Text,9,2)+' - '+
                                     Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
            end
            else
            if wVencimento = 8 then
            Begin
              wVencimento := 9;
              Imp.WriteXY(15.4,wCont,copy(QContaReceberDT_Vencimento.Text,1,6)+copy(QContaReceberDT_Vencimento.Text,9,2)+' - '+
                                     Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
            end
            else
            if wVencimento = 9 then
            Begin
              wVencimento := 10;
              Imp.WriteXY(20.4,wCont,copy(QContaReceberDT_Vencimento.Text,1,6)+copy(QContaReceberDT_Vencimento.Text,9,2)+' - '+
                                     Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
            end;
          end;
          QContaReceber.Next;
        End;
        QContaReceber.Close;
      end;
      wCont := 26;
      // **** Itens ****
      wContLinha := 0;
      // somente pode posicionar no inicio do arquivo a primeira vez
      if wNotaGlobal = 0 then
         QNFE_EmiteIt.First;
      While Not QNFE_EmiteIT.Eof do
      Begin
        Imp.WriteXY(1,wCont,Bib.NumToTexto(QNFE_EmiteITCod_Produto.Value,0,6));
        wProduto := (TRIM(QNFE_EmiteITDesc_Produto.Value) + ' - ' + TRIM(QNFE_EmiteItDesc_Lote.Value));
        if Length(wProduto) > 43 then
          Imp.WriteXY(2.4,wCont,(QNFE_EmiteITDesc_Produto.Value))
        else
          Imp.WriteXY(2.4,wCont,(TRIM(QNFE_EmiteITDesc_Produto.Value) + ' - ' + TRIM(QNFE_EmiteItDesc_Lote.Value)));
        Imp.WriteXY(11.5,wCont,(TRIM(QNFE_EmiteITDesc_Class_Fiscal.Value)));
        Imp.WriteXY(12.4,wCont,QNFE_EmiteITNum_Classificacao.Value);
        Imp.WriteXY(13,wCont,QNFE_EmiteITDesc_Unidade.Value);
        Imp.WriteXY(13.4,wCont,Bib.NumToTexto(QNFE_EmiteITQT_Quantidade.Value,2,7));
        Imp.WriteXY(14.8,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Unitario.Value,2,11));
        Imp.WriteXY(17.5,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value,2,11));
        Imp.WriteXY(20.6,wCont,Trim(QNFE_EmiteITPerc_Aliquota.Text));
        Imp.WriteXY(21.5,wCont,Trim(QNFE_EmiteITPerc_IPI.Text) );
        Imp.WriteXY(22,wCont,Bib.NumToTexto(QNFE_EmiteITVal_IPI.Value,2,7));
        if Length(wProduto) > 43 then
        Begin
          Inc(wCont);
          Imp.WriteXY(2.4,wCont,(QNFE_EmiteItDesc_Lote.Value));
        end;
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
          wCont := 63; //(62) fabiano
//          wNumero_Continua := QNFE_EmiteNUM_NOTA.Value + 1;
          Imp.WriteXY(17,wCont,'CONTINUA NUMERO'); //+Bib.NumToTexto(wNumero_Continua,0,8));
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
    IMP_OBS_CORPO_NOTA(2.5, wCont);
//    FNotaImpressao.Imp_Desconto(wCont,2.5);
    wCont := 56;//(62) fabiano
    Imp.WriteXY(1.5,wCont,Bib.NumToTexto(wbase_icm_tributada,2,18));
    Imp.WriteXY(5.5,wCont,Bib.NumToTexto(wvlr_icm,2,17));
    Imp.WriteXY(19,wCont,Bib.NumToTexto(wtotal_produtos,2,20));
    wCont := wCont + 2;
    Imp.WriteXY(1,wCont,Bib.NumToTexto(QNFE_EmiteVAL_FRETE.Value,2,18));
    Imp.WriteXY(9.5,wCont,Bib.NumToTexto(QNFE_EmiteVAL_DESPESAS.Value,2,17));
    Imp.WriteXY(13.5,wCont,Bib.NumToTexto(wvlr_ipi,2,15));
    Imp.WriteXY(19,wCont,Bib.NumToTexto( wtotal_produtos
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
      Imp.WriteXY(14.4,wCont,'2') // Destinatário
    Else
      Imp.WriteXY(14.4,wCont,'1'); // Emitente
    Imp.WriteXY(13,wCont,QNFE_EmiteDesc_Placa.Value);
    Imp.WriteXY(16.5,wCont,QNFE_Emitecgc_transp.Value);
    wCont := wCont + 3;
    Imp.WriteXY(1.2,wCont,QNFE_Emiteend_transp.Value);
    Imp.WriteXY(10.5,wCont,QNFE_Emitecidade_transp.Value);
    Imp.WriteXY(14.8,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(16.5,wCont,QNFE_Emiteinsc_transp.Value);
    wCont := wCont + 1;
    Imp.WriteXY(1.2,wCont,Bib.NumToTexto(wVol,0,8));
    Imp.WriteXY(3.9,wCont,'CAIXA');
    Imp.WriteXY(8,wCont,'CGS');
    wCont := wCont + 3; //FABIANO
    If QNFE_EmiteOBS.Value <> '' then
    Begin
      Imp.WriteXY(1.2,wCont,QNFE_EmiteOBS.Value);
      Inc(wCont);
    end;
    If QNFE_EmiteOBS_COMPLEMENTO.Value <> '' then
    Begin
      Imp.WriteXY(1.2,wCont,QNFE_EmiteOBS_COMPLEMENTO.Value);
      Inc(wCont);
    End;
    If QNFE_EmiteDesc_Mensagem.Value <> '' then
    Begin
      Imp.WriteXY(1.2,wCont,QNFE_EmiteDesc_Mensagem.Value);
      Inc(wCont);
    end;
    If QNFE_EmiteDesc_COMPLEMENTO.Value <> '' then
    Begin
      Imp.WriteXY(1.2,wCont,QNFE_EmiteDesc_COMPLEMENTO.Value);
      Inc(wCont);
    end;
    If QNFE_EmiteDesc_COMPLEMENTO1.Value <> '' then
    Begin
      Imp.WriteXY(0.5,wCont,QNFE_EmiteDesc_COMPLEMENTO1.Value);
      Inc(wcont);
    end;

    Imp.WriteXY(1.2,wCont,Bib.NumToTexto(QNFE_EmiteCod_Vendedor.Value,0,8)+' - '+QNFE_EmiteNOME_VENDEDOR.Value);
    QrAchaNrPedido.Close;
    QrAchaNrPedido.SetVariable('PK',QNFE_EmiteCOD_NOTA_CAB.Value);
    QrAchaNrPedido.Open;
    Inc(wcont);
    Imp.WriteXY(1.2,wCont,'Referente Pedido Nr.:');
    Imp.WriteXY(5,wCont,Bib.NumToTexto(QrAchaNrPedidoNum_Pedido.Value,0,6));

    wCont := 81;
    Imp.WriteXY(20,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
  end;
End;

Procedure TFNotaImpressao.NF_CGS_2;
Var wVencimento,wJaExtenso : Byte;
    wExtenso, wLinhaExt1, wLinhaExt2, wProduto : String;
    wVol : Real;
begin
  // *** Emissão de Nota Fiscal para a CGS
  // *** OBS - Colocar Posicao X em Centimetros
  With DMNotaSaida do
  Begin
    wNotaGlobal := 0;
    wVol := 0;
    while wNotaGlobal < 2 do
    begin
      wCont := 2;
      if wNotaGlobal = 1 then
      begin
         wCont := 7;
//         wNumero_Continua := QNFE_EmiteNUM_NOTA.Value - 1;
         Imp.WriteXY(9.5,wCont,'CONTINUACAO NOTA ');  //+Bib.NumToTexto(wNumero_Continua,0,8));
      end;
      WnotaGlobal := 2;
      If QNFE_EmiteInd_Entrada_Saida.Value = 'S' Then
        Imp.WriteXY(15.2,wCont,'XX')
      Else
        Imp.WriteXY(17,wCont,'XX');

      Imp.WriteXY(21.3,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );

      wCont := wCont+6;
      Imp.WriteXY(1.2,wCont,QNFE_EmiteNAT_OPERACAO.Value);
      Imp.WriteXY(7.7,wCont,QNFE_Emitenum_cfop.Text);

      wCont := wCont+3;
      Imp.WriteXY(1.2,wCont,QNFE_EmiteCOD_CADASTRO.Text);
      Imp.WriteXY(2.1,wCont,QNFE_EmiteNOME.Value);
      Imp.WriteXY(15,wCont,QNFE_EmiteNUM_CGC_CPF.Value);
      Imp.WriteXY(21.3,wCont,QNFE_EmiteDT_EMISSAO.Text);
      wCont := wCont + 2;
      Imp.WriteXY(1.2,wCont, QNFE_EmiteDESC_ENDERECO.Value);
      Imp.WriteXY(13,wCont,QNFE_EmiteDESC_BAIRRO.Value);
      Imp.WriteXY(17.3,wCont,QNFE_EmiteDESC_CEP.Value);
      Imp.WriteXY(21.3,wCont,QNFE_EmiteDT_RECEBIMENTO.Text);
      wCont := wCont + 2;
      Imp.WriteXY(1,wCont,QNFE_EmiteDESC_CIDADE.Value);
      Imp.WriteXY(10.6,wCont,QNFE_EmiteDESC_TELEFONE.Value);
      Imp.WriteXY(14.3,wCont,QNFE_EmiteCOD_ESTADO.Value);
      Imp.WriteXY(15.3,wCont,QNFE_EmiteNUM_INSCRICAO.Value);
      wCont := wCont + 4;  //FABIANO
      wExtenso := Bib.Extenso( wtotal_produtos
                          +wvlr_ipi - QNFE_EmiteVal_Desconto.Value,'REAL');
      Bib.QuebraString(wExtenso,40,wLinhaExt1,wLinhaExt2,'*');
      If QNFE_EmiteInd_Condicao_Pagto.Value = '2' Then //A PRAZO
      Begin
        QContaReceber.Open;
        QContaReceber.First;
        wVencimento := 0;
        wJaExtenso := 0;
        While not QContaReceber.Eof do
        Begin
          If (((DMNotaSaida.QNotaSaidaCOD_SERIE.Value = 'B1') and //MARCOS - colocado p/ nao imprimir a parte B
             ( DMNotaSaida.QNotaSaidaNUM_NOTA.Value = QContaReceberNum_Titulo.Value))  or
             ( DMNotaSaida.QNotaSaidaCOD_SERIE.Value <> 'B1')) then
          Begin
            if wVencimento = 0 then
            begin
              wVencimento := 1;
              Imp.WriteXY(0.4,wCont,copy(QContaReceberDT_Vencimento.Text,1,6)+copy(QContaReceberDT_Vencimento.Text,9,2)+' - '+
                                    Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
            end
            else
            if wVencimento = 1 then
            Begin
              wVencimento := 2;
              Imp.WriteXY(5.4,wCont,copy(QContaReceberDT_Vencimento.Text,1,6)+copy(QContaReceberDT_Vencimento.Text,9,2)+' - '+
                                    Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
            end
            else
            if wVencimento = 2 then
            Begin
              wVencimento := 3;
              Imp.WriteXY(10.4,wCont,copy(QContaReceberDT_Vencimento.Text,1,6)+copy(QContaReceberDT_Vencimento.Text,9,2)+' - '+
                                    Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
            end
            else
            if wVencimento = 3 then
            Begin
              wVencimento := 4;
              Imp.WriteXY(15.4,wCont,copy(QContaReceberDT_Vencimento.Text,1,6)+copy(QContaReceberDT_Vencimento.Text,9,2)+' - '+
                                  Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
            end
            else
            if wVencimento = 4 then
            Begin
              wVencimento := 5;
              Imp.WriteXY(20.4,wCont,copy(QContaReceberDT_Vencimento.Text,1,6)+copy(QContaReceberDT_Vencimento.Text,9,2)+' - '+
                                    Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
              wCont := wCont +1;
            end
            else
            if wVencimento = 5 then
            Begin
              wVencimento := 6;
              Imp.WriteXY(0.4,wCont,copy(QContaReceberDT_Vencimento.Text,1,6)+copy(QContaReceberDT_Vencimento.Text,9,2)+' - '+
                                     Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
            end
            else
            if wVencimento = 6 then
            Begin
              wVencimento := 7;
              Imp.WriteXY(5.4,wCont,copy(QContaReceberDT_Vencimento.Text,1,6)+copy(QContaReceberDT_Vencimento.Text,9,2)+' - '+
                                     Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
            end
            else
            if wVencimento = 7 then
            Begin
              wVencimento := 8;
              Imp.WriteXY(10.4,wCont,copy(QContaReceberDT_Vencimento.Text,1,6)+copy(QContaReceberDT_Vencimento.Text,9,2)+' - '+
                                     Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
            end
            else
            if wVencimento = 8 then
            Begin
              wVencimento := 9;
              Imp.WriteXY(15.4,wCont,copy(QContaReceberDT_Vencimento.Text,1,6)+copy(QContaReceberDT_Vencimento.Text,9,2)+' - '+
                                     Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
            end
            else
            if wVencimento = 9 then
            Begin
              wVencimento := 10;
              Imp.WriteXY(20.4,wCont,copy(QContaReceberDT_Vencimento.Text,1,6)+copy(QContaReceberDT_Vencimento.Text,9,2)+' - '+
                                     Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
            end;
          end;
          QContaReceber.Next;
        End;
        QContaReceber.Close;
      end;
      wCont := 26;
      // **** Itens ****
      wContLinha := 0;
      // somente pode posicionar no inicio do arquivo a primeira vez
      if wNotaGlobal = 0 then
         QNFE_EmiteIt.First;
      While Not QNFE_EmiteIT.Eof do
      Begin
        Imp.WriteXY(1,wCont,Bib.NumToTexto(QNFE_EmiteITCod_Produto.Value,0,6));
        wProduto := (TRIM(QNFE_EmiteITDesc_Produto.Value) + ' - ' + TRIM(QNFE_EmiteItDesc_Lote.Value));
        if Length(wProduto) > 43 then
          Imp.WriteXY(2.4,wCont,(QNFE_EmiteITDesc_Produto.Value))
        else
          Imp.WriteXY(2.4,wCont,(TRIM(QNFE_EmiteITDesc_Produto.Value) + ' - ' + TRIM(QNFE_EmiteItDesc_Lote.Value)));
        Imp.WriteXY(11.5,wCont,(TRIM(QNFE_EmiteITDesc_Class_Fiscal.Value)));
        Imp.WriteXY(12.4,wCont,QNFE_EmiteITNum_Classificacao.Value);
        Imp.WriteXY(13,wCont,QNFE_EmiteITDesc_Unidade.Value);
        Imp.WriteXY(13.4,wCont,Bib.NumToTexto(QNFE_EmiteITQT_Quantidade.Value,2,7));
        Imp.WriteXY(14.8,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Unitario.Value,2,11));
        Imp.WriteXY(17.5,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value,2,11));
        Imp.WriteXY(20.6,wCont,Trim(QNFE_EmiteITPerc_Aliquota.Text));
        Imp.WriteXY(21.5,wCont,Trim(QNFE_EmiteITPerc_IPI.Text) );
        Imp.WriteXY(22,wCont,Bib.NumToTexto(QNFE_EmiteITVal_IPI.Value,2,7));
        if Length(wProduto) > 43 then
        Begin
          Inc(wCont);
          Imp.WriteXY(2.4,wCont,(QNFE_EmiteItDesc_Lote.Value));
        end;
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
          wCont := 63; //(62) fabiano
//          wNumero_Continua := QNFE_EmiteNUM_NOTA.Value + 1;
          Imp.WriteXY(17,wCont,'CONTINUA NUMERO'); //+Bib.NumToTexto(wNumero_Continua,0,8));
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
    IMP_OBS_CORPO_NOTA(2.5, wCont);
//    FNotaImpressao.Imp_Desconto(wCont,2.5);
    wCont := 56;//(62) fabiano
    Imp.WriteXY(1.5,wCont,Bib.NumToTexto(wbase_icm_tributada,2,18));
    Imp.WriteXY(5.5,wCont,Bib.NumToTexto(wvlr_icm,2,17));
    Imp.WriteXY(19,wCont,Bib.NumToTexto(wtotal_produtos,2,20));
    wCont := wCont + 2;
    Imp.WriteXY(1,wCont,Bib.NumToTexto(QNFE_EmiteVAL_FRETE.Value,2,18));
    Imp.WriteXY(9.5,wCont,Bib.NumToTexto(QNFE_EmiteVAL_DESPESAS.Value,2,17));
    Imp.WriteXY(13.5,wCont,Bib.NumToTexto(wvlr_ipi,2,15));
    Imp.WriteXY(19,wCont,Bib.NumToTexto( wtotal_produtos
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
      Imp.WriteXY(14.4,wCont,'2') // Destinatário
    Else
      Imp.WriteXY(14.4,wCont,'1'); // Emitente
    Imp.WriteXY(13,wCont,QNFE_EmiteDesc_Placa.Value);
    Imp.WriteXY(16.5,wCont,QNFE_Emitecgc_transp.Value);
    wCont := wCont + 3;
    Imp.WriteXY(1.2,wCont,QNFE_Emiteend_transp.Value);
    Imp.WriteXY(10.5,wCont,QNFE_Emitecidade_transp.Value);
    Imp.WriteXY(14.8,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(16.5,wCont,QNFE_Emiteinsc_transp.Value);
    wCont := wCont + 1;
    Imp.WriteXY(1.2,wCont,Bib.NumToTexto(wVol,0,8));
    Imp.WriteXY(3.9,wCont,'CAIXA');
    Imp.WriteXY(8,wCont,'CGS');
    wCont := wCont + 3; //FABIANO
    If QNFE_EmiteOBS.Value <> '' then
    Begin
      Imp.WriteXY(1.2,wCont,QNFE_EmiteOBS.Value);
      Inc(wCont);
    end;
    If QNFE_EmiteOBS_COMPLEMENTO.Value <> '' then
    Begin
      Imp.WriteXY(1.2,wCont,QNFE_EmiteOBS_COMPLEMENTO.Value);
      Inc(wCont);
    End;
    If QNFE_EmiteDesc_Mensagem.Value <> '' then
    Begin
      Imp.WriteXY(1.2,wCont,QNFE_EmiteDesc_Mensagem.Value);
      Inc(wCont);
    end;
    If QNFE_EmiteDesc_COMPLEMENTO.Value <> '' then
    Begin
      Imp.WriteXY(1.2,wCont,QNFE_EmiteDesc_COMPLEMENTO.Value);
      Inc(wCont);
    end;
    If QNFE_EmiteDesc_COMPLEMENTO1.Value <> '' then
    Begin
      Imp.WriteXY(0.5,wCont,QNFE_EmiteDesc_COMPLEMENTO1.Value);
      Inc(wcont);
    end;

    Imp.WriteXY(1.2,wCont,Bib.NumToTexto(QNFE_EmiteCod_Vendedor.Value,0,8)+' - '+QNFE_EmiteNOME_VENDEDOR.Value);
    QrAchaNrPedido.Close;
    QrAchaNrPedido.SetVariable('PK',QNFE_EmiteCOD_NOTA_CAB.Value);
    QrAchaNrPedido.Open;
    Inc(wcont);
    Imp.WriteXY(1.2,wCont,'Referente Pedido Nr.:');
    Imp.WriteXY(5,wCont,Bib.NumToTexto(QrAchaNrPedidoNum_Pedido.Value,0,6));

    wCont := 81;
    Imp.WriteXY(20,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
  end;
End;

Procedure TFNotaImpressao.NF_GRASEL;
var wContReceber, wVlSeguro, wVlFrete : Real;
    wstr,wObs_Tr : string;     //wLinha1, wLinha2, wLinha3, wLinha4,
    i : integer;
    wVal : string;
begin
  // *** Emissão de Nota Fiscal para GRASEL
  // *** OBS - Colocar Posicao X em Centimetros
  // *** wNotaGlobal Controla a quebra de continuação
  wTransgenico := 'NAO';
  with DMNotaSaida do
  begin
    wNotaGlobal := 0;
    wCont       := 0;
    while wNotaGlobal < 2 do
    begin
      wCont := 0;
      Imp.WriteXY(0,wCont,copy(QNFE_EmiteOBS.Value,0,32));
      If QNFE_EmiteInd_Entrada_Saida.Value = 'S' Then
        Imp.WriteXY(14.8,wCont,'XX')
      else
        Imp.WriteXY(16.5,wCont,'XX');

      Imp.WriteXY(18,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8));
      wCont := wCont + 1;
      Imp.WriteXY(0,wCont,copy(QNFE_EmiteOBS.Value,33,60));
      If wNotaGlobal = 1 then
         Imp.WriteXY(12.7,wCont,'CONTINUACAO');
      wNotaGlobal := 2;
      Inc(wCont);
      Imp.WriteXY(0,wCont,copy(QNFE_EmiteOBS_COMPLEMENTO.Value,0,32));
      Inc(wCont);
      Imp.WriteXY(0,wCont,copy(QNFE_EmiteOBS_COMPLEMENTO.Value,33,60));
      Inc(wCont);
      If QNFE_Emiteval_funrural.Value > 0 Then
         Imp.WriteXY(0,wCont,'Funrural:'+Bib.NumToTexto(QNFE_Emiteval_funrural.Value,2,8));
      Inc(wCont);
      Imp.WriteXY(5.3,wCont,QNFE_EmiteNAT_OPERACAO.Value);
      //Imp.WriteXY(9,wCont,QNFE_EmiteCOD_OPERACAO.Text);
      Imp.WriteXY(11.4,wCont,QNFE_Emitenum_cfop.Text);
      inc(wCont,1);
      If QNFE_EmiteNum_Pedido.Text <> '' Then
         Imp.WriteXY(0,wCont,'Pedido:'+QNFE_EmiteNum_Pedido.Text);

      If (QNFE_EmiteInd_Condicao_Pagto.Value = '2') And (QNFE_EmiteIND_ENTRADA_SAIDA.Value = 'S') Then
       Begin
         inc(wCont);
         Imp.WriteXY(0,wCont,'Apos Vencimento sera');
         inc(wCont);
         Imp.WriteXY(0,wCont,'cobrado juros de 3%Mes');
         inc(wCont);
         Imp.WriteXY(0,wCont,'antecipacao de 1,2%Mes ');
       End
      Else
       Begin
        inc(wCont,3);
       End;
      Imp.WriteXY(5.3,wCont,Trim(QNFE_EmiteCod_Cadastro.Text) + ' - '+QNFE_EmiteNOME.Value);
      Imp.WriteXY(14.7,wCont,QNFE_EmiteNUM_CGC_CPF.Text);
      Imp.WriteXY(18.2,wCont,QNFE_EmiteDT_EMISSAO.Text);
      wCont := wCont + 2;
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_Mensagem.Value); // esta msg é do codigo da msg da nota
      Imp.WriteXY(5.3,wCont,QNFE_EmiteDESC_ENDERECO.Value);
      Imp.WriteXY(12,wCont,QNFE_EmiteDESC_BAIRRO.Value);
      Imp.WriteXY(16,wCont,QNFE_EmiteDESC_CEP.Value);
      Imp.WriteXY(18.2,wCont,QNFE_EmiteDT_RECEBIMENTO.Text);
      wCont := wCont + 2;
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_COMPLEMENTO.Value);  // esta msg é do codigo da msg da nota
      Imp.WriteXY(5.3,wCont,QNFE_EmiteDESC_CIDADE.Value);
      Imp.WriteXY(11.3,wCont,QNFE_EmiteDESC_TELEFONE.Value);
      Imp.WriteXY(14.2,wCont,QNFE_EmiteCOD_ESTADO.Value);
      If  Trim(QNFE_EmiteDesc_Inscricao_Municipal.Value) <> '' Then
         Imp.WriteXY(14.9,wCont,QNFE_EmiteDESC_INSCRICAO_MUNICIPAL.Value)
      Else
         Imp.WriteXY(14.9,wCont,QNFE_EmiteNUM_INSCRICAO.Value);
      Imp.WriteXY(18.2,wCont,TimeToStr(Time));
      wCont := wCont + 1;
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_COMPLEMENTO1.Value);  // esta msg é do codigo da msg da nota

       //pagamentos
      wCont := wCont + 2;
      Imp.WriteXY(0,wCont,'Vendedor:'+QNFE_EmiteNOME_VENDEDOR.Value);
      If QNFE_EmiteInd_Condicao_Pagto.Value = '1' Then
        Imp.WriteXY(5.3,wCont,'Pagamento a Vista');

      If QNFE_EmiteInd_Condicao_Pagto.Value = '2' Then
       If QNFE_EmiteIND_ENTRADA_SAIDA.Value = 'S' Then
        begin
          wContReceber:=0;
          QContaReceber.Open;
          QContaReceber.First;
          while not QContaReceber.Eof do
          begin
            if wContReceber = 0 Then
            Begin
              Imp.WriteXY(5.3,wCont,Bib.NumToTexto(QContaReceberNUM_TITULO.Value,0,6) );
              Imp.WriteXY(6.5,wCont,QContaReceberDT_Vencimento.Text);
              Imp.WriteXY(8.7,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
            end;
            if wContReceber = 1 Then
            Begin
              Imp.WriteXY(10,wCont,Bib.NumToTexto(QContaReceberNUM_TITULO.Value,0,6) );
              Imp.WriteXY(11.7,wCont,QContaReceberDT_Vencimento.Text);
              Imp.WriteXY(13.6,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
            end;
            if wContReceber = 2 Then
            Begin
              Imp.WriteXY(15,wCont,Bib.NumToTexto(QContaReceberNUM_TITULO.Value,0,6) );
              Imp.WriteXY(17,wCont,QContaReceberDT_Vencimento.Text);
              Imp.WriteXY(18.2,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
            end;
            wContReceber := wContReceber + 1;
            QContaReceber.Next;
          end;
          QContaReceber.Close;
        End
       Else
        begin
          wContReceber:=0;
          DMNotaEntrada.QContaPagar.Open;
          DMNotaEntrada.QContaPagar.First;
          while not DMNotaEntrada.QContaPagar.Eof do
          begin
            if wContReceber = 0 Then
            Begin
              Imp.WriteXY(5.3,wCont,Bib.NumToTexto(DMNotaEntrada.QContaPagarNUM_TITULO.Value,0,6) );
              Imp.WriteXY(6.5,wCont,DMNotaEntrada.QContaPagarDT_Vencimento.Text);
              Imp.WriteXY(8.7,wCont,Bib.NumToTexto(DMNotaEntrada.QContaPagarVal_Titulo.Value,2,8));
            end;
            if wContReceber = 1 Then
            Begin
              Imp.WriteXY(10,wCont,Bib.NumToTexto(DMNotaEntrada.QContaPagarNUM_TITULO.Value,0,6) );
              Imp.WriteXY(11.7,wCont,DMNotaEntrada.QContaPagarDT_Vencimento.Text);
              Imp.WriteXY(13.6,wCont,Bib.NumToTexto(DMNotaEntrada.QContaPagarVal_Titulo.Value,2,8));
            end;
            if wContReceber = 2 Then
            Begin
              Imp.WriteXY(15,wCont,Bib.NumToTexto(DMNotaEntrada.QContaPagarNUM_TITULO.Value,0,6) );
              Imp.WriteXY(17,wCont,DMNotaEntrada.QContaPagarDT_Vencimento.Text);
              Imp.WriteXY(18.2,wCont,Bib.NumToTexto(DMNotaEntrada.QContaPagarVal_Titulo.Value,2,8));
            end;
            wContReceber := wContReceber + 1;
            DMNotaEntrada.QContaPagar.Next;
          end;
          DMNotaEntrada.QContaPagar.Close;
        End;
      //fim dos pagamentos

      // **** Itens de produtos ****
      wCont := 20;

      // somente pode posicionar no inicio do arquivo a primeira vez
      if wNotaGlobal = 0 then
         QNFE_EmiteIt.First;

      wContLinha := 0;
      wObs_Tr := '';
      while not QNFE_EmiteIT.Eof do
      begin
        Inc(wCont);
        Inc(wcontLinha);
        Imp.WriteXY(0,wCont,Bib.NumToTexto(QNFE_EmiteITCod_Produto.Value,0,6));
        wStr := QNFE_EmiteITDesc_Produto.Value + ' ' + QNFE_EmiteITDesc_Complemento.Value;
        //imprime a descricao do produto com os complementos 1 e 2
        Imp.WriteXY(1.2,wCont,copy(wStr,1,44));
        //se a descricao do produto for maior que o tamanho da linha, escreve o resto em baixo
        if length(wStr) > 44 then
        begin
          inc(wCont);
          Imp.WriteXY(1.7,wCont,copy(wStr,45,44));
        end;
        if length(wStr) > 92 then
        begin
          inc(wCont);
          Imp.WriteXY(1.7,wCont,copy(wStr,93,44));
        end;

        Imp.WriteXY(9.8,wCont,QNFE_EmiteITDesc_Situacao_Trib.Value);
        //Imp.WriteXY(10,wCont,QNFE_EmiteItNUM_EMBALAGEM.Text + ' ' + QNFE_EmiteITDesc_Unidade.Value);
        Imp.WriteXY(10.5,wCont,QNFE_EmiteItDESC_UNIDADE.Value);
        Imp.WriteXY(12,wCont,Bib.NumToTexto(QNFE_EmiteITQT_Quantidade.Value,2,8));
        Imp.WriteXY(14,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Unitario.Value,2,11));
        Imp.WriteXY(15.1,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value,2,11));
        Imp.WriteXY(18.7,wCont,QNFE_EmiteITPerc_Aliquota.Text);
        Imp.WriteXY(19.3,wCont,QNFE_EmiteItPERC_IPI.Text);
        If QNFE_EmiteItVAL_IPI.Value <> 0 Then
           Imp.WriteXY(19.4,wCont,QNFE_EmiteItVAL_IPI.Text);


        If QNFE_EmiteInd_Obs_Frete_Seguro.Value = 'S' then
          wVlSeguro := wVlSeguro + QNFE_EmiteITQT_Quantidade.Value * QNFE_EmiteITVal_Preco_Frete.Value / QNFE_EmiteItNum_Embalagem.Value;
        Calc_Peso_Nota;   // calculo do peso produto

      // este teste é apenas para imprimir mensagem da ACCO
        If QNFE_EmiteItInd_Tipo_Embalagem.Value <> '' Then
           wMensCorpoNota := 'S';

        if (QNFE_EmiteItInd_Tipo_Produto.Value = 'AGRICOLA') Then
        begin // Preco de produtos agrícolas em Sacas
          Inc(wCont);
          Imp.WriteXY(13.7,wCont,'Preco P/ '+FloatToStr(QNFE_EmiteItNum_Embalagem.Value)+' Kg');
        end;

        // ** Imprimir Informações do Lote
        If (QNFE_EmiteItDesc_Germinacao.Value <> '') Or (QNFE_EmiteItDesc_Pureza.Value <> '') Or (QNFE_EmiteItDt_Vencto_Lote.Text <> '') Or
           (QNFE_EmiteItDesc_Atestado.Value <> '') Or (QNFE_EmiteItDesc_Validade.Value <> '') Or (QNFE_EmiteItDesc_Peneira.Value <> '') Then
        Begin   // ** Imprimir Informações do Lote
          Inc(wCont);
          If QNFE_EmiteItDesc_Lote.Value <> '' Then
            Imp.WriteXY(0,wCont,'Lote:'+QNFE_EmiteItDesc_Lote.Value);
          If QNFE_EmiteItDesc_Germinacao.Value <> '' Then
            Imp.WriteXY(2.7,wCont,' Germ.:'+QNFE_EmiteItDesc_Germinacao.Value);
          If QNFE_EmiteItDesc_Pureza.Value <> '' Then
            Imp.WriteXY(5.7,wCont,' Pureza:'+QNFE_EmiteItDesc_Pureza.Value);
          If QNFE_EmiteItDesc_Atestado.Value <> '' Then
            Imp.WriteXY(8.4,wCont,' Atestado:'+QNFE_EmiteItDesc_Atestado.Value);
          If QNFE_EmiteItDesc_Validade.Text <> '' Then
            Imp.WriteXY(11,wCont,' Validade:'+QNFE_EmiteItDesc_Validade.Text);
          If QNFE_EmiteItDesc_Peneira.Value <> '' Then
            Imp.WriteXY(13.7,wCont,' Peneira:'+QNFE_EmiteItDesc_Peneira.Value);
//          If QNFE_EmiteItDt_Vencto_Lote.Text <> '' Then
//            Imp.WriteXY(16.3,wCont,' Validade:'+QNFE_EmiteItDt_Vencto_Lote.Text);
        End;

        if (QNFE_EmiteItInd_Imprime_NF.Value = 'S') And (QNFE_EmiteItDesc_Observacao.Value <> '') Then
        begin   // ** Imprimir Informações do Lote
          Inc(wcont);
          Imp.WriteXY(0,wCont,'Obs:'+QNFE_EmiteItDesc_Observacao.Value);
        end;
        if QNFE_EmiteItDesc_Observacao_Tr.Text <> '' Then
          wObs_Tr := QNFE_EmiteITDesc_Observacao_Tr.Value;  // ** Guarda Complemento de Descrição de tributacao de icms
        If QNFE_EmiteItInd_Cesta_Basica.Value = 'SIM' Then // produto transgenico
           wTransgenico := 'SIM';
        If (QNFE_EmiteItCod_Mensagem.Text <> '') And (QNFE_EmiteItCod_Mensagem.Value <> 0) Then
           wCod_Mens := QNFE_EmiteItCod_Mensagem.Text;

        QNFE_EmiteIT.Next;
        if ((wContLinha >= 9) and (not(QNFE_EmiteIT.Eof))) then
        begin
          wCont := 44;
//          wNumero_Continua := QNFE_EmiteNUM_NOTA.Value + 1;
          Imp.WriteXY(8.8,wCont,'CONTINUA'); //+Bib.NumToTexto(wNumero_Continua,0,8));
          wNotaGlobal := 1;
          Imp.SaltaPagina;
          Break;
        End;

      end;// fim produtos
    end;
    If wObs_Tr <> '' Then
     begin
       Inc(wCont);
       Imp.WriteXY(0,wCont,wObs_Tr);
     end;
    If QNFE_EmiteVal_Desconto.Value > 0 Then
    Begin
      Inc(wCont);
      Imp.WriteXY(13.7,wCont,'DESCONTO: '+Bib.NumToTexto(QNFE_EmiteVal_Desconto.Value,2,13));
    End;
    If QNFE_EmiteVal_Desconto_Fitas.Value > 0 Then
    Begin
      Inc(wCont);
      Imp.WriteXY(1.7,wCont,'DESCONTO FITAS TESTE TRANSGENICOS:');
      Imp.WriteXY(15.2,wCont,Bib.NumToTexto(QNFE_EmiteVal_Desconto_Fitas.Value,2,11));
    End;

    //IMPRIME O CODIGO DO DCO NA NOTA QUANDO TIVER SIDO INFORMADO
    wval := DMOracle.BuscaNome('SELECT NUM_DCO FROM TB_DCO','COD_NOTA_CAB = ' + QNFE_EmiteCOD_NOTA_CAB.Text);
    if wVal <> '' then
    begin
      Inc(wCont);
      Imp.WriteXY(1.7,wCont,'DCO: '+wVal);
    end;
    //-----------------------------------------------------------

    If wCod_Mens <> '' Then
       IMP_OBSERVACAO;  // imprimir observacao da classe do produto
    If wCont < 30 Then
       wCont := 30; // para imprimir msg corpo nota mais abaixo
    IMP_OBS_CORPO_NOTA(0,wCont);
    If (wMensCorpoNota = 'S') Then
    Begin
      Imp.WriteXY(0,wCont,'Endereco para entrega de embalagens vazias(triplice lavadas): ');
      inc(wCont);
      Imp.WriteXY(0,wCont,'Estrada para escola agricola Meu Cantinho - Linha Tres Fazendas - Santa Terezinha de Itaipu - PR');
      inc(wCont);
      Imp.WriteXY(0,wCont,'E Obrigatorio a apresentacao desta NF ou copia no momento da entrega das embalagens vazias, acompanhada da NF de produtor');
    End;
    // *** Final dos Itens ****     

    // Imprime DPI (transgenicos)
    If wDesc_Transgenicos <> 0 Then
     Begin
       wCont := wCont + 2;
       Imp.WriteXY(1.7,wCont,'Desconto Referente DPI - (Royalties Monsanto)');
       Imp.WriteXY(15.2,wCont,Bib.NumToTexto(wDesc_Transgenicos,2,11));
     End;

    //----TRIBUTACAO E VALORES
    wCont := 42;
    Imp.WriteXY(0.3,wCont,Bib.NumToTexto(wbase_icm_tributada,2,10));  //era 18
    Imp.WriteXY(1.8,wCont,Bib.NumToTexto(wvlr_icm,2,10));
    Imp.WriteXY(8.9,wCont,Bib.NumToTexto(wtotal_produtos,2,11));
    wCont := wCont + 2;

    wVlFrete := 0;
    If QNFE_EmiteInd_Imprime_Frete.Value = 'S' Then
      wVlFrete := QNFE_EmiteVAL_FRETE.Value;

    Imp.WriteXY(0.3,wCont,Bib.NumToTexto(wVlFrete,2,10));

    Imp.WriteXY(3.3,wCont,Bib.NumToTexto(QNFE_EmiteVAL_DESPESAS.Value,2,17));
    Imp.WriteXY(5.3,wCont,Bib.NumToTexto(wvlr_ipi,2,15));
    wFunrural := 0;
    If QNFE_EmiteInd_Funrural.Value = 'S' Then
       wFunrural := QNFE_Emiteval_funrural.Value;
    Imp.WriteXY(8.9,wCont,Bib.NumToTexto( wtotal_produtos
                                 +wvlr_ipi
                                 +QNFE_EmiteVAL_DESPESAS.Value
                                 -QNFE_EmiteVAL_Desconto.Value
//                                 -wFunrural  solicitado para retirar pela Marcia e Andreia dia 21/05/2008 - César
                                 -QNFE_EmiteVal_Desconto_Fitas.Value
                                 -wDesc_Transgenicos
                                 +wVlFrete,2,11));

    //Transportador
    wCont := 47;
    if Trim(QNFE_Emitenome_transp.Value) = '' then
      Imp.WriteXY(0.1,wCont,QNFE_EmiteDesc_Transportadora.Value)
    else
      Imp.WriteXY(0.1,wCont,QNFE_Emitenome_transp.Value);
    if QNFE_EmiteInd_Tipo_Frete.Value = 'FOB' Then
      Imp.WriteXY(6,wCont,'2') // Destinatário
    else
      Imp.WriteXY(6,wCont,'1'); // Emitente
    Imp.WriteXY(6.7,wCont,QNFE_EmiteDesc_Placa.Value);
    Imp.WriteXY(8.1,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(8.7,wCont,QNFE_Emitecgc_transp.Value);
    wCont := wCont+2;
    Imp.WriteXY(0.1,wCont,QNFE_Emiteend_transp.Value);
    Imp.WriteXY(5.2,wCont,copy(QNFE_Emitecidade_transp.Value,0,18));
    Imp.WriteXY(8.1,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(8.7,wCont,QNFE_Emiteinsc_transp.Value);
    wCont := wCont + 2;
    Imp.WriteXY(0.1,wCont,QNFE_EmiteNum_Volumes.Text);
    Imp.WriteXY(8,wCont,Bib.NumToTexto(wPesoBruto,0,8));
    Imp.WriteXY(8.9,wCont,Bib.NumToTexto(wPeso,0,8));

    wCont := 56;
    Imp.WriteXY(18.6,wCont,QNFE_EmiteNUM_NOTA.Text);
  end;
end;

Procedure TFNotaImpressao.EmiteNFRDPrint(wCodNF:Integer; RDPrint : TRDprint);
var wTipoDocumento,wLpt_Nota,wLpt_Pedido: String;
begin
  // *** Emissão de Nota Fiscal *** \\
// RDPrint
  wEmpresa := DMParamSistema.QParamSistemaCOD_EMPRESA.Value;
  wTipoDocumento := DMOracle.BuscaNome('SELECT IND_EMITE FROM TB_OPERACAO, TB_NOTA_CAB',
                    'TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
                   +' AND TB_NOTA_CAB.COD_NOTA_CAB = '+FloatToStr(wCodNF));
  if wTipoDocumento = 'F' Then // Nota Fiscal
  begin
    If DMNotaSaida.pDiretoParaImpressora = 'S' Then // imprime direto para a impressora sem mostrar na tela
      RDPrint.OpcoesPreview.Preview := False
     Else
      RDPrint.OpcoesPreview.Preview := True;
    RDPrint.Impressora := epson;
    RDPrint.PortaComunicacao := 'USB001';//wLpt_Nota; // Porta
    RDPrint.FonteTamanhoPadrao := S17cpp; // Condensado
    //RDPrint.TamanhoQteLPP := Oito; // Oitavos
    RDPrint.TamanhoQteLPP := Seis;
    RDPrint.TamanhoQteColunas := 138;
    RDPrint.TamanhoQteLinhas := 60;
    RDPrint.UsaGerenciadorImpr := true;

    if (not RDPrint.Abrir) then
     begin
      Raise Exception.Create('Erro na Inicialização dos Parâmetros, Verifique os parâmetros informados');
     end
    else
      If DMNotaSaida.pDiretoParaImpressora = 'S' Then  // imprime direto para a impressora sem mostrar na tela
        FNotaImpressao.NF_FAZENDA1(RDPrint)
      Else
        if (RDPrint.Setup) then
           FNotaImpressao.NF_FAZENDA1(RDPrint);   

  end // Nota Fiscal
  else
  begin
    if Trim(wLpt_Pedido) = 'LPT1' then
       Imp.AbreImpressora
    else if Trim(wLpt_Pedido) = 'LPT2' then
            Imp.AbreImpressora_Lpt2
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
  if (wTipoDocumento = 'F') then
    RDPrint.Novapagina
  else if wTipoDocumento[1] in ['P','O'] Then
     Imp.SaltaPagina;
     
//  Imp.ConfiguraImpressora('CONDENSADO_OFF','SEXTOS',66);
  if wTipoDocumento = 'F' Then // Nota Fiscal
     RDPrint.Fechar
  else
     Imp.FechaImpressora;  // Finaliza os serviços de Impressao
  With DMNotaSaida do
  Begin
    QNFE_Emite.Close;
    QNFE_EmiteIT.Close;
  end;
end;


Procedure TFNotaImpressao.NF_FAZENDA1(RDPrint : TRDPrint);
Var wContServico : Byte;
    wTotalISS, wTotalServico, wValDesconto : Real;
    wFatura, wColuna : Integer;
begin
  // *** Emissão de Nota Fiscal para a FAZENDA
  // *** OBS - Colocar Posicao X em Centimetros
  // *** wNotaGlobal Controla a quebra de continuação
  wTotalISS := 0;
  wTotalServico := 0;
  wCont := 0;
  wFatura := 0;
  wColuna := 0;
  With DMNotaSaida do
  Begin
    wNotaGlobal := 0;
    while wNotaGlobal < 2 do
    begin
      wCont := 0;
      if wNotaGlobal = 1 then
         RDPrint.imp(wCont,98,'CONTINUACAO');
         //RDPrint.imp(wCont,14.5,'CONTINUACAO');
      WnotaGlobal := 2;

      //----------------------------
      wCont := 6;
      RDPrint.imp(wCont,1,QNFE_EmiteNAT_OPERACAO.Value);
      RDPrint.imp(wCont,70,QNFE_Emitenum_cfop.Text);

      //Inc(wCont,2);
      //RDPrint.imp(91,wCont,  QNFE_EmiteNUM_CGC_CPF.Value);

      wCont := 8;
      RDPrint.imp(wCont,1,QNFE_EmiteCOD_CADASTRO.Text);
      RDPrint.imp(wCont,10, QNFE_EmiteNOME.Value);
      RDPrint.imp(wCont,91,QNFE_EmiteNUM_INSCRICAO.Value);
      RDPrint.imp(wCont,120,QNFE_EmiteDT_EMISSAO.Text);

      wCont := 9;
      RDPrint.imp(wCont,1, QNFE_EmiteDESC_ENDERECO.Value);
      RDPrint.imp(wCont,58,QNFE_EmiteDESC_BAIRRO.Value);
      RDPrint.imp(wCont,120,QNFE_EmiteDT_EMISSAO.Text);

      wCont := 10;
      RDPrint.imp(wCont,1,QNFE_EmiteDESC_CIDADE.Value);
      RDPrint.imp(wCont,58,QNFE_EmiteCOD_ESTADO.Value);
      RDPrint.imp(wCont,70,QNFE_EmiteDESC_CEP.Value);
      RDPrint.imp(wCont,91,QNFE_EmiteDESC_TELEFONE.Value);
      //---------------------------
      //Itens de produtos
      //---------------------------
      wCont := 11;
      wContLinha := 0;
      // somente pode posicionar no inicio do arquivo a primeira vez
      If wNotaGlobal = 0 then
         QNFE_EmiteIt.First;

      While Not QNFE_EmiteIT.Eof do
      Begin
        if QNFE_EmiteItIND_TIPO_PRODUTO.Value <> 'SERVIÇO' Then
        begin
          wCont := wCont + 1;
          Inc(wcontLinha);
          RDPrint.imp(wCont,1,Bib.NumToTexto(QNFE_EmiteITCod_Produto.Value,0,6));
          RDPrint.imp(wCont,11,QNFE_EmiteItDESC_PRODUTO.Value);
          //RDPrint.imp(wCont,11,QNFE_EmiteItDESC_PRODUTO.Value);
          RDPrint.imp(wCont,67,QNFE_EmiteITDesc_Unidade.Value);
          RDPrint.imp(wCont,72,Bib.NumToTexto(QNFE_EmiteITQT_Quantidade.Value,2,8));
          RDPrint.imp(wCont,82,Bib.NumToTexto(QNFE_EmiteITVal_Unitario.Value,2,11));
          RDPrint.imp(wCont,100,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value,2,19));
          RDPrint.imp(wCont,132,QNFE_EmiteITPerc_Aliquota.Text);
        end
        Else
        begin
          wTotalISS := wTotalISS + QNFE_EmiteItVal_ISS.Value;
          wTotalServico := wTotalServico + QNFE_EmiteItVal_Total.Value;
        end;
        QNFE_EmiteIT.Next;

      End;
    End;
    // Fim do Controle de Continuação
    //---------------------------------
    If QNFE_EmiteVal_Desconto.Value > 0 Then
    Begin
      wValDesconto := ((QNFE_EmiteVal_Desconto.Value * wtotal_produtos) /100);
      wCont := wCont + 1;
      RDPrint.imp(wCont,1,'DESCONTO: '+Bib.NumToTexto(wValDesconto,2,13));
      //RDPrint.imp(wCont,0.5,'DESCONTO: '+Bib.NumToTexto(wValDesconto,2,13));
//      Imp.WriteXY(0.5,wCont,'DESCONTO: '+Bib.NumToTexto(QNFE_EmiteVal_Desconto.Value,2,13));
    End;
    // Fim dos Item de Produto
    IMP_OBS_CORPO_NOTA(1, wCont);
//    FNotaImpressao.Imp_Desconto(wCont,1);
   { wCont := 23;
    wContServico := 0;
    If wTotalISS > 0 Then
    Begin
      If wContServico < 2 Then
      Begin
        wCont := wCont + 1;
        Inc(wContServico);
        RDPrint.imp(wCont,109,Bib.NumToTexto(wTotalISS,2,15));
        //RDPrint.imp(wCont,15.5,Bib.NumToTexto(wTotalISS,2,15));
      End;
      If wContServico < 4 Then
      Begin
        wCont := wCont + 1 - wContServico;
        RDPrint.imp(wCont,109,Bib.NumToTexto(wTotalServico,2,15));
        //RDPrint.imp(wCont,15.5,Bib.NumToTexto(wTotalServico,2,15));
      End;

    End;  }
    // *** Final dos Itens ****
    //----------------------------
    //Calculo do Imposto
    //----------------------------
    wCont := 20;
    RDPrint.imp(wCont,14,Bib.NumToTexto(wbase_icm_tributada,2,18));
    RDPrint.imp(wCont,36,Bib.NumToTexto(wvlr_icm,2,17));
    RDPrint.imp(wCont,78, Bib.NumToTexto(wTotal_produtos,2,18));
    wCont := 21;
    RDPrint.imp(wCont,14,Bib.NumToTexto(QNFE_EmiteVAL_FRETE.Value,2,18));
    //falta seguro
    RDPrint.imp(wCont,78,Bib.NumToTexto(QNFE_EmiteVAL_DESPESAS.Value,2,17));

    RDPrint.imp(wCont,112,  FloatToStr(Bib.NumToTextoArredondamento((wtotal_produtos
                                 +wvlr_ipi
                                 +QNFE_EmiteVAL_DESPESAS.Value
                                 -wValDesconto
                                 -QNFE_EmiteVAL_Funrural.Value),2)));

    wCont := 23;
    If Trim(QNFE_Emitenome_transp.Value) = '' then
      RDPrint.imp(wCont,1,QNFE_EmiteDesc_Transportadora.Value)
    Else
      RDPrint.imp(wCont,1,QNFE_Emitenome_transp.Value);
    If QNFE_EmiteInd_Tipo_Frete.Value = 'FOB' Then
      RDPrint.imp(wCont,75,'2') // Destinatário
    Else
      RDPrint.imp(wCont,75,'1'); // Emitente
    RDPrint.imp(wCont,84,QNFE_EmiteDesc_Placa.Value);
    RDPrint.imp(wCont,98,QNFE_Emiteuf_transp.Value);
    RDPrint.imp(wCont,105,QNFE_Emitecgc_transp.Value);
    wCont := 24;
    RDPrint.imp(wCont,1,QNFE_Emiteend_transp.Value);
    RDPrint.imp(wCont,70,QNFE_Emitecidade_transp.Value);
    RDPrint.imp(wCont,98,QNFE_Emiteuf_transp.Value);
    RDPrint.imp(wCont,105,QNFE_Emiteinsc_transp.Value);
    wCont := 25;
    RDPrint.imp(wCont,1,QNFE_EmiteNUM_VOLUMES.Text);
    RDPrint.imp(wCont,105,Bib.NumToTexto(wPeso,2,8));
    RDPrint.imp(wCont,128,Bib.NumToTexto(wPeso,2,8));
    wCont := 27;          //************************VERIFICAR POSICAO ERA 3

    RDPrint.imp(wCont,1,QNFE_EmiteOBS.Value);
    wCont := wCont + 1;
    If Trim(QNFE_EmiteOBS_COMPLEMENTO.Value) <> '' Then
    Begin
      RDPrint.imp(wCont,1,QNFE_EmiteOBS_COMPLEMENTO.Value);
      wCont := wCont + 1;
    End;
    If Trim( QNFE_EmiteDesc_Mensagem.Value)<>'' Then
    Begin
      RDPrint.imp(wCont,1,QNFE_EmiteDesc_Mensagem.Value);
      wCont := wCont + 1;
    End;
    If Trim(QNFE_EmiteDesc_COMPLEMENTO.Value) <> '' Then
    Begin
      RDPrint.imp(wCont,1,QNFE_EmiteDesc_COMPLEMENTO.Value);
      wCont := wCont + 1;
    End;
    If QNFE_EmiteInd_Condicao_Pagto.Value = '1' Then
    Begin
      RDPrint.imp(wCont,1,'Pagamento a Vista');
      wCont := wCont + 1;
    End
    else
    Begin
    If QNFE_EmiteInd_Condicao_Pagto.Value = '2' Then
      Begin
        QContaReceber.Open;
        QContaReceber.First;
        While (not QContaReceber.Eof) do
        Begin
          Inc(wFatura);
          if ((wFatura mod 4) = 0) Then
           Begin
             Inc(wCont);
             wColuna := 0;
           End;
          RDPrint.imp(wCont,wColuna,  IntToStr(wFatura));
          Inc(wColuna,2);
          RDPrint.imp(wCont,wColuna,'vencimento' + QContaReceberDT_Vencimento.Text+' ');
          Inc(wColuna,2);
          RDPrint.imp(wCont,wColuna,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
          Inc(wColuna,2);
          QContaReceber.Next;
        End;
        wFatura := 0;
        wColuna := 0;
        QContaReceber.Close;
      End;
    end;

  End;
//  Imp.SaltaPagina;
End;  //FIM IMPRESSAO NF FAZENDA

Procedure TFNotaImpressao.NF_TRENTO;
begin
  // *** Emissão de Nota Fiscal para a mecanica Trento
  // *** OBS - Colocar Posicao X em Centimetros
  // *** wNotaGlobal Controla a quebra de continuação

  with DMNotaSaida do
  begin
    wNotaGlobal := 0;
          wCont := 0;
    while wNotaGlobal < 2 do
    begin
      wCont := 1;
      If wNotaGlobal = 1 then
         Imp.WriteXY(10.1,wCont,'CONTINUACAO');
      wNotaGlobal := 2;
      //wCont:=wCont;
      If QNFE_EmiteInd_Entrada_Saida.Value = 'S' Then
         Imp.WriteXY(12.5,wCont,'X')
      else
        Imp.WriteXY(12.5,wCont,'X');
      Imp.WriteXY(16.1,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
      //Imp.WriteXY(18.6,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
      wCont := wCont+5;
      Imp.WriteXY(0.2,wCont,QNFE_EmiteNAT_OPERACAO.Value);
      Imp.WriteXY(7.4,wCont,QNFE_Emitenum_cfop.Text);  //ALTERADO SERGIO 13/12/2002
      wCont := wCont+3;

      //DESTINATARIO REMETENTE

      Imp.WriteXY(0.2,wCont,QNFE_EmiteCOD_CADASTRO.Text);
      Imp.WriteXY(1.1,wCont,QNFE_EmiteNOME.Value);
      Imp.WriteXY(12.1,wCont,QNFE_EmiteNUM_CGC_CPF.Value);
      Imp.WriteXY(16,wCont,QNFE_EmiteDT_EMISSAO.Text);
      wCont := wCont + 2;
      Imp.WriteXY(0.2,wCont, QNFE_EmiteDESC_ENDERECO.Value);
      Imp.WriteXY(9.9,wCont,QNFE_EmiteDESC_BAIRRO.Value);
      Imp.WriteXY(13.6,wCont,QNFE_EmiteDESC_CEP.Value);
      Imp.WriteXY(16,wCont,QNFE_EmiteDT_EMISSAO.Text);
      wCont := wCont+2;
      Imp.WriteXY(0.2,wCont,QNFE_EmiteDESC_CIDADE.Value);
      Imp.WriteXY(8.2,wCont,QNFE_EmiteDESC_TELEFONE.Value);
      Imp.WriteXY(10.9,wCont,QNFE_EmiteCOD_ESTADO.Value);
      Imp.WriteXY(12.1,wCont,QNFE_EmiteNUM_INSCRICAO.Value);
      // **** Itens de produtos ****
      wCont := wCont + 3;
      wContLinha := 0;
      // somente pode posicionar no inicio do arquivo a primeira vez
      if wNotaGlobal = 0 then
         QNFE_EmiteIt.First;
      while not QNFE_EmiteIT.Eof do
      begin
        Inc(wCont);
        Inc(wcontLinha);
        Imp.WriteXY(0.2,wCont,Bib.NumToTexto(QNFE_EmiteITCod_Produto.Value,0,6));
        Imp.WriteXY(2.5,wCont,QNFE_EmiteITDesc_Produto.Value);
        Imp.WriteXY(9.5,wCont,QNFE_EmiteITNum_Classificacao.Value);
        Imp.WriteXY(10.2,wCont,QNFE_EmiteITDesc_Unidade.Value);
        Imp.WriteXY(10.2,wCont,Bib.NumToTexto(QNFE_EmiteITQT_Quantidade.Value,0,8));
        Imp.WriteXY(12.1,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Unitario.Value,2,11));
        Imp.WriteXY(14.2,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value,2,11));
        Imp.WriteXY(14.8,wCont,QNFE_EmiteITPerc_Aliquota.Text);
        if QNFE_EmiteItDesc_Complemento.Value <> '' Then
        Begin   // ** Imprimir Complemento de Descrição
          Inc(wCont);
          Inc(wContLinha);
          Imp.WriteXY(2,wCont,QNFE_EmiteITDesc_Complemento.Value);
        End;
        QNFE_EmiteIT.Next;
        If wContLinha >= 15 Then
         Begin
           wNotaGlobal := 1;
           Imp.WriteXY(15.3,38,'CONTINUA');
           Imp.SaltaPagina;
           Break;
         End;
      End;
    End;
    if QNFE_EmiteVal_Desconto.Value > 0 Then
    begin
      Inc(wCont);
      Imp.WriteXY(0.5,wCont,'DESCONTO: '+Bib.NumToTexto(QNFE_EmiteVal_Desconto.Value,2,13));
    End;
    // Fim dos Item de Produto
    IMP_OBS_CORPO_NOTA(1, wCont);
//    FNotaImpressao.Imp_Desconto(wCont,1);
    // *** Final dos Itens ****
    //----TRIBUTACAO E VALORES
    wCont := 35;
    Imp.WriteXY(0.2,wCont,Bib.NumToTexto(wbase_icm_tributada,2,18));
    Imp.WriteXY(2.5,wCont,Bib.NumToTexto(wvlr_icm,2,17));
    Imp.WriteXY(15,wCont,Bib.NumToTexto(wtotal_produtos,2,15));
    wCont := wCont + 2;
    Imp.WriteXY(0.2,wCont,Bib.NumToTexto(QNFE_EmiteVAL_FRETE.Value,2,18));
    Imp.WriteXY(6.2,wCont,Bib.NumToTexto(QNFE_EmiteVAL_DESPESAS.Value,2,17));
    Imp.WriteXY(11.2,wCont,Bib.NumToTexto(wvlr_ipi,2,15));
    Imp.WriteXY(15,wCont,Bib.NumToTexto( wtotal_produtos
                                 +wvlr_ipi
                                 +QNFE_EmiteVAL_DESPESAS.Value
                                 -QNFE_EmiteVAL_Desconto.Value
                                 -QNFE_EmiteVAL_Funrural.Value,2,15));
    wCont := wCont + 3;
    if Trim(QNFE_Emitenome_transp.Value) = '' then
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_Transportadora.Value)
    else
      Imp.WriteXY(0.2,wCont,QNFE_Emitenome_transp.Value);
    if QNFE_EmiteInd_Tipo_Frete.Value = 'FOB' Then
      Imp.WriteXY(9.8,wCont,'2') // Destinatário
    else
      Imp.WriteXY(9.8,wCont,'1'); // Emitente
    Imp.WriteXY(11,wCont,QNFE_EmiteDesc_Placa.Value);
    Imp.WriteXY(13,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(15,wCont,QNFE_Emitecgc_transp.Value);
    wCont := wCont+2;
    Imp.WriteXY(0.2,wCont,QNFE_Emiteend_transp.Value);
    Imp.WriteXY(9,wCont,QNFE_Emitecidade_transp.Value);
    Imp.WriteXY(13,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(15,wCont,QNFE_Emiteinsc_transp.Value);
    wCont := wCont + 2;
    Imp.WriteXY(0.2,wCont,QNFE_EmiteNUM_VOLUMES.Text);
    Imp.WriteXY(11.2,wCont,Bib.NumToTexto(wPesoBruto,0,8));
    Imp.WriteXY(15,wCont,Bib.NumToTexto(wPeso,0,8));

    wCont:=wCont+3;

    //--------------------pagamentos
    if QNFE_EmiteInd_Condicao_Pagto.Value = '1' Then
    begin
      Imp.WriteXY(0.2,wCont,'Pagamento a Vista');
    end;
    if QNFE_EmiteInd_Condicao_Pagto.Value = '2' Then
    begin
      QContaReceber.Open;
      QContaReceber.First;
      Imp.WriteXY(0,wCont,'Pagamento a Prazo');
      inc(wCont);
      while not QContaReceber.Eof do
      begin
        Imp.WriteXY(0,wCont,Bib.NumToTexto(QContaReceberNUM_TITULO.Value,0,6) );
        Imp.WriteXY(1.3,wCont,QContaReceberDT_Vencimento.Text);
        Imp.WriteXY(3.4,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
        inc(wCont);
        QContaReceber.Next;
      end;
      QContaReceber.Close;
    end;
    //---------final pagamentos-------------------------------------

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
    If QNFE_EmiteVal_AVista.Value > 0 Then
    Begin
      Imp.WriteXY(0,wCont,'Valor Entrada:'+Bib.NumToTexto(QNFE_EmiteVal_AVista.Value,2,8));
      Inc(wCont);
    End;

    wCont:=58;
    Imp.WriteXY(15,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
  end;
end;

procedure TFNotaImpressao.NF_INSIDE;
Var wContServico : Byte;
    wTotalISS, wColuna, wTotalServico, wAux2, wAux3 : Real;
    wFatura, wAux : Integer;
    wTipoCliente : string;
begin
  // *** Emissão de Nota Fiscal para a INSIDE
  // *** OBS - Colocar Posicao X em Centimetros
  // *** wNotaGlobal Controla a quebra de continuação
  wTotalISS := 0;
  wTotalServico := 0;
  wCont := 0;
  wFatura := 0;
  wColuna := 0;
  wMsgTributacao := '';
  wAux2 := 0;
  wAux3 := 0;

  With DMNotaSaida do
  Begin
    wNotaGlobal := 0;
    wTipoCliente := DMOracle.BuscaNome('SELECT COD_TIPO_CADASTRO FROM TB_CADASTRO','COD_CADASTRO ='+ QNFE_EmiteCOD_CADASTRO.Text);
    while wNotaGlobal < 2 do
    begin
      wCont := 0;
      //Inc(wCont, 1);
      If QNFE_EmiteInd_Entrada_Saida.Value = 'S' Then
        Imp.WriteXY(10.5,wCont,'X')
      Else
        Imp.WriteXY(12.5,wCont,'X');
      if wNotaGlobal = 1 then
         Imp.WriteXY(14.5,wCont,'CONTINUACAO');
      WnotaGlobal := 2;

      Imp.WriteXY(16.2,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
      //Imp.WriteXY(18.2,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
      wCont := wCont + 5;
      Imp.WriteXY(0.7,wCont,QNFE_EmiteNAT_OPERACAO.Value);
      Imp.WriteXY(5.8,wCont,QNFE_Emitenum_cfop.Text);
      wCont := wCont + 3;
      Imp.WriteXY(0.7,wCont,QNFE_EmiteCOD_CADASTRO.Text);


      Imp.WriteXY(1.6,wCont, QNFE_EmiteNOME.Value);
      Imp.WriteXY(10.5,wCont,  QNFE_EmiteNUM_CGC_CPF.Value);

      Imp.WriteXY(15.5,wCont,QNFE_EmiteDT_EMISSAO.Text);
      wCont := wCont + 2;

      Imp.WriteXY(0.7,wCont, QNFE_EmiteDESC_ENDERECO.Value);

      Imp.WriteXY(8.8,wCont,QNFE_EmiteDESC_BAIRRO.Value);
      Imp.WriteXY(12.8,wCont,QNFE_EmiteDESC_CEP.Value);
      Imp.WriteXY(15.5,wCont,QNFE_EmiteDT_EMISSAO.Text);
      wCont := wCont+2;
      Imp.WriteXY(0.7,wCont,QNFE_EmiteDESC_CIDADE.Value);
      Imp.WriteXY(7.3,wCont,QNFE_EmiteDESC_TELEFONE.Value);
      Imp.WriteXY(9.5,wCont,QNFE_EmiteCOD_ESTADO.Value);

      Imp.WriteXY(10.3,wCont,QNFE_EmiteNUM_INSCRICAO.Value);
      Inc(wCont, 4);

      //Conta qtos items haverao para saber se vai imprimir fatura nessa nota
      if wAux2 = 0 then
      begin
        wAux2 := QNFE_EmiteIt.RecordCount / 11;  //Cabem 11 itens por nota
        QNFE_EmiteIT.First;
      end;
      //conta

      //***Fatura***
      If QNFE_EmiteInd_Condicao_Pagto.Value = '1' Then
      Begin
        Imp.WriteXY(2.2,wCont,'A Vista');
        wCont := wCont + 1;
      End;
      If (QNFE_EmiteInd_Condicao_Pagto.Value = '2') and (wAux2 <= 1) Then
      Begin
        QContaReceber.Open;
        QContaReceber.First;
        wColuna := 0;
        While (not QContaReceber.Eof) do
        Begin
          Inc(wFatura);
          //if ((wFatura mod 4) = 0) Then
          //Begin
            //Inc(wCont, 2);
            //wColuna := 1;
          //End;
          if ((wFatura mod 4) = 0) Then
          Begin
            Inc(wCont, 1);
            wColuna := 0;
            wAux3 := 0;
          End;
          Imp.WriteXY(wColuna, wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8)+'-'+IntToStr(wFatura));
          //wColuna := wColuna + 1.8;
          if wAux3 = 1 then
            wColuna := wColuna + 3.1;
          if wAux3 = 2 then
            wColuna := wColuna + 3.1;

          wColuna := wColuna + 2.6;
          wAux3 := wAux3 + 1;
          Imp.WriteXY(wColuna,wCont,QContaReceberDT_Vencimento.Text+' ');
          wColuna := wColuna + 2.2;
          Imp.WriteXY(wColuna,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
          wColuna := wColuna - 2.2; 
          QContaReceber.Next;
        End;
        wFatura := 0;
        wColuna := 0;
        QContaReceber.Close;
      End;
      wAux2 := wAux2 - 1;


      // **** Itens de produtos ****
      wCont := 20;
      wContLinha := 0;
      // somente pode posicionar no inicio do arquivo a primeira vez
      If wNotaGlobal = 0 then
         QNFE_EmiteIt.First;

      //CABECALHO

      While Not QNFE_EmiteIT.Eof do
      Begin
        if QNFE_EmiteItIND_TIPO_PRODUTO.Value <> 'SERVIÇO' Then
        Begin
          wCont := wCont + 1;
          Inc(wcontLinha);
          Imp.WriteXY(0.7,wCont,QNFE_EmiteItCOD_PRODUTO.Text);
          //***Reduz o tamanho do campo DESC_PRODUTO, somente para INSIDE.
          Imp.WriteXY(2,wCont,( Copy(QNFE_EmiteItDESC_PRODUTO.Text, 1, 40)));
          //Imp.WriteXY(8.3,wCont,( Copy(QNFE_EmiteItDESC_CLASS_FISCAL.Text, 1, 40)));
          Imp.WriteXY(8.3,wCont,( Copy(QNFE_EmiteItCOD_NBM_SH.Value, 1, 40)));
          Imp.WriteXY(9.8,wCont,QNFE_EmiteITDesc_Situacao_Trib.Value);
          Imp.WriteXY(10.7,wCont,QNFE_EmiteITDesc_Unidade.Value);
          Imp.WriteXY(10.9,wCont,Bib.NumToTexto(QNFE_EmiteITQT_Quantidade.Value,2,8));
          Imp.WriteXY(12.4,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Unitario.Value,2,8));
          Imp.WriteXY(13.9,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value,2,10));
          If QNFE_EmiteITPerc_Tributado_Nota.Text <> '' Then
            Imp.WriteXY(15.9,wCont,QNFE_EmiteITPerc_Tributado_Nota.Text)
          Else
            Imp.WriteXY(15.9,wCont,QNFE_EmiteITPerc_Aliquota.Text);  
          Imp.WriteXY(16.5,wCont,QNFE_EmiteItPERC_IPI.Text);
          Imp.WriteXY(16.8,wCont,QNFE_EmiteItVAL_IPI.Text);
          Calc_Peso_Nota;  // calcula peso para nota
        End
        Else
        Begin
          wTotalISS := wTotalISS + QNFE_EmiteItVal_ISS.Value;
          wTotalServico := wTotalServico + QNFE_EmiteItVal_Total.Value;
        End;
        If QNFE_EmiteITDESC_OBSERVACAO_TR.Value <> '' Then
           wMsgTributacao := QNFE_EmiteITDESC_OBSERVACAO_TR.Value;
        QNFE_EmiteIT.Next;

        If wCont >= 32 Then
        Begin
          wCont := 38;
          Imp.WriteXY(14.4,wCont,'CONTINUA');
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
      Imp.WriteXY(2,wCont,'DESCONTO: '+Bib.NumToTexto(QNFE_EmiteVal_Desconto.Value,2,13));
    End;
    // Fim dos Item de Produto
    IMP_OBS_CORPO_NOTA(1, wCont);
//    FNotaImpressao.Imp_Desconto(wCont,1);
    {
    wCont := 29;
    wContServico := 0;
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
    }
    // *** Final dos Itens ****
    // *** Calculo do Imposto ****
    wCont := 36;
    Imp.WriteXY(0,wCont,Bib.NumToTexto(wbase_icm_tributada,2,18));
    Imp.WriteXY(3.2,wCont,Bib.NumToTexto(wvlr_icm,2,17));
    Imp.WriteXY(6.8, wCont, Bib.NumToTexto(wBase_Subst, 2,17));
    Imp.WriteXY(10.2, wCont, Bib.NumToTexto(wIcms_Subst,2,17));
    Imp.WriteXY(14.0,wCont,Bib.NumToTexto(wtotal_produtos - wTotalServico,2,20));
    wCont := wCont + 2;
    Imp.WriteXY(0,wCont,Bib.NumToTexto(QNFE_EmiteVAL_FRETE.Value,2,18));
    Imp.WriteXY(6.8,wCont,Bib.NumToTexto(QNFE_EmiteVAL_DESPESAS.Value,2,17));
    Imp.WriteXY(10.2,wCont,Bib.NumToTexto(wvlr_ipi,2,15));
    if ((QNotaSaidaCOD_ESTADO.Value = 'PR') or (QNotaSaidaCOD_ESTADO.Value <> 'PR') and (wTipoCliente = '7')) then
      Imp.WriteXY(14.0,wCont,Bib.NumToTexto( wtotal_produtos
                                     +wvlr_ipi
                                     +QNFE_EmiteVAL_DESPESAS.Value
                                     -QNFE_EmiteVAL_Desconto.Value
                                     -QNFE_EmiteVAL_Funrural.Value,2,20))
    else
      Imp.WriteXY(14.0,wCont,Bib.NumToTexto( wtotal_produtos
                                     +wvlr_ipi + wIcms_Subst
                                     +QNFE_EmiteVAL_DESPESAS.Value
                                     -QNFE_EmiteVAL_Desconto.Value
                                     -QNFE_EmiteVAL_Funrural.Value,2,20));
    

    wCont := wCont + 3;
    If Trim(QNFE_Emitenome_transp.Value) = '' then
      Imp.WriteXY(0.7,wCont,QNFE_EmiteDesc_Transportadora.Value)
    Else
      Imp.WriteXY(0.7,wCont,QNFE_Emitenome_transp.Value);
    If QNFE_EmiteInd_Tipo_Frete.Value = 'FOB' Then
      Imp.WriteXY(9.4,wCont,'2') // Destinatário
    Else
      Imp.WriteXY(9.4,wCont,'1'); // Emitente
    Imp.WriteXY(10.5,wCont,QNFE_EmiteDesc_Placa.Value);
    Imp.WriteXY(12.7,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(13.8,wCont,QNFE_Emitecgc_transp.Value);
    wCont := wCont+2;
    Imp.WriteXY(0.7,wCont,QNFE_Emiteend_transp.Value);
    Imp.WriteXY(7.5,wCont,QNFE_Emitecidade_transp.Value);
    Imp.WriteXY(12.7,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(14,wCont,QNFE_Emiteinsc_transp.Value);
    wCont := wCont + 2;
    Imp.WriteXY(1,wCont,QNFE_EmiteNUM_VOLUMES.Text);
    Imp.WriteXY(3,wCont,'Volume(s)');
    //Imp.WriteXY(12.7,wCont,Bib.NumToTexto(wPeso,2,8));
    //Imp.WriteXY(15.5,wCont,Bib.NumToTexto(wPeso,2,8));
    wCont := wCont + 3;          //************************VERIFICAR POSICAO ERA 3
    Imp.WriteXY(0.7,wCont,QNFE_EmiteOBS.Value);
    wCont := wCont + 1;
    If Trim(QNFE_EmiteOBS_COMPLEMENTO.Value) <> '' Then
    Begin
      Imp.WriteXY(0.7,wCont,QNFE_EmiteOBS_COMPLEMENTO.Value);
      wCont := wCont + 1;
    End;
    If Trim( QNFE_EmiteDesc_Mensagem.Value) <> '' Then
    Begin
      Imp.WriteXY(0.7,wCont,QNFE_EmiteDesc_Mensagem.Value);
      wCont := wCont + 1;
    End;
    If Trim(QNFE_EmiteDesc_COMPLEMENTO.Value) <> '' Then
      Imp.WriteXY(0.7,wCont,QNFE_EmiteDesc_COMPLEMENTO.Value);
    wAux := 0;
    while (wAux < Length(wMsgTributacao) / 56) Do
    begin
      wCont := wCont + 1;
      Imp.WriteXY(0.7,wCont,(Copy(wMsgTributacao, (wAux * 56) + 1, (wAux * 56) + 56)));
      Inc(wAux, 1);
    end;
    wCont := wCont + 1;

    Inc(wCont, 7);
    Imp.WriteXY(1.5,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );

  End;
//  Imp.SaltaPagina;
End;  //FIM IMPRESSAO NF INSIDE

Procedure TFNotaImpressao.NF_TRIPAR;
var wContServico : Byte;
  wTotalISS, wTotalServico, wColuna, wContProdutos : Real;
  wContFatura : Integer;
  wFlagServico, wFlagDescricao : Boolean;
begin
  // *** Emissão de Nota Fiscal para a NIR Informatica
  // *** OBS - Colocar Posicao X em Centimetros
  // *** wNotaGlobal Controla a quebra de continuação
  wTotalISS := 0;
  wTotalServico := 0;
  wFlagServico := false;
  wFlagDescricao := false;
  wMsgTributacao := '';
  with DMNotaSaida do
  begin
    wNotaGlobal := 0;
          wCont := 0;  // INICIALIZA VALOR DA VARIAVEL - Robson 26/06/2000

    while wNotaGlobal < 2 do
    begin
      wCont := 0;
      if wNotaGlobal = 1 then
         Imp.WriteXY(9.5,wCont,'CONTINUACAO')
      else
      begin
        wCont := 0;
        //Imp.WriteXY(17.5,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8));
      end;

      Inc(wCont,7);
      WnotaGlobal := 2;
      if QNFE_EmiteInd_Entrada_Saida.Value = 'S' Then
         Imp.WriteXY(12.1,wCont,'XX')
      else
        Imp.WriteXY(14.3,wCont,'XX');

      Inc(wCont,6);
      Imp.WriteXY(0,wCont,QNFE_EmiteNAT_OPERACAO.Value);
      Imp.WriteXY(6.4,wCont,QNFE_Emitenum_cfop.Text);

      Inc(wCont,4);

      Imp.WriteXY(0,wCont,QNFE_EmiteCOD_CADASTRO.Text);
      Imp.WriteXY(1,wCont,QNFE_EmiteNOME.Value);
      Imp.WriteXY(12,wCont,QNFE_EmiteNUM_CGC_CPF.Value);
      Imp.WriteXY(16.5,wCont,QNFE_EmiteDT_EMISSAO.Text);

      Inc(wCont,3);

      Imp.WriteXY(0,wCont, QNFE_EmiteDESC_ENDERECO.Value);
      Imp.WriteXY(9.5,wCont,QNFE_EmiteDESC_BAIRRO.Value);
      Imp.WriteXY(13.5,wCont,QNFE_EmiteDESC_CEP.Value);
      Imp.WriteXY(16.5,wCont,QNFE_EmiteDT_EMISSAO.Text);

      Inc(wCont,2);

      Imp.WriteXY(0,wCont,QNFE_EmiteDESC_CIDADE.Value);
      Imp.WriteXY(8,wCont,QNFE_EmiteDESC_TELEFONE.Value);
      Imp.WriteXY(10.8,wCont,QNFE_EmiteCOD_ESTADO.Value);
      Imp.WriteXY(13,wCont,QNFE_EmiteNUM_INSCRICAO.Value);

      // **** Itens de produtos ****
      wCont := 27; //18 onde comeca os campos de produtos; 23 onde termina os produtos
      //wContProdutos := 18; // usando essa variavel para os produtos, pois usando integer nao da
      wContLinha := 0;
      // somente pode posicionar no inicio do arquivo a primeira vez
      if wNotaGlobal = 0 then
         QNFE_EmiteIt.First;
      //ShowMessage(IntToStr(QNFE_EmiteIT.RecordCount));
      while not QNFE_EmiteIT.Eof do
      begin
        Inc(wCont, 1);
        Inc(wcontLinha);
        //wContProdutos := wContProdutos + 2;
        Imp.WriteXY(0.2,wCont, QNFE_EmiteItCOD_PRODUTO.Text);
        Imp.WriteXY(1,wCont,QNFE_EmiteITDesc_Produto.Value);
        Imp.WriteXY(8.5,wCont,( Copy(QNFE_EmiteItCOD_NBM_SH.Value, 1, 40)));
        Imp.WriteXY(9.3,wCont,QNFE_EmiteItDESC_SITUACAO_TRIB.Value);
        Imp.WriteXY(10.5,wCont,QNFE_EmiteITDesc_Unidade.Value);
        Imp.WriteXY(11.5,wCont,Bib.NumToTexto(QNFE_EmiteITQT_Quantidade.Value,0,8));
        Imp.WriteXY(12.3,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Unitario.Value,2,11));
        Imp.WriteXY(14.7,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value,2,11));
        Imp.WriteXY(18,wCont,QNFE_EmiteITPerc_Aliquota.Text);
        If QNFE_EmiteITDESC_OBSERVACAO_TR.Value <> '' Then
           wMsgTributacao := QNFE_EmiteITDESC_OBSERVACAO_TR.Value;
        wPeso := wPeso  + QNFE_EmiteItQT_QUANTIDADE.Value;
        wPesoBruto := wPesoBruto  + QNFE_EmiteITNUM_VOLUMES_NOTA.Value * QNFE_EmiteItNum_Embalagem.Value;
        QNFE_EmiteIT.Next;

        if (wcontLinha >= 29) and ((QNFE_EmiteVal_Desconto.Value > 0) or (not QNFE_EmiteIt.Eof)) then
        begin
          wCont := 59;
          Imp.WriteXY(16.5,wCont,'CONTINUA');
          wNotaGlobal := 1;
          Imp.SaltaPagina;
          Break;
        end;
      end;
    end;
    // Fim do Controle de Continuação

    if QNFE_EmiteVal_Desconto.Value > 0 Then
    begin
      Inc(wCont, 2);
      Imp.WriteXY(0.5,wCont,'DESCONTO: '+Bib.NumToTexto(QNFE_EmiteVal_Desconto.Value,2,13));
    end;
    // Fim dos Item de Produto


    //CALCULO DO IMPOSTO
    wCont := 61;

    Imp.WriteXY(0,wCont,Bib.NumToTexto(wbase_icm_tributada,2,18));
    Imp.WriteXY(3,wCont,Bib.NumToTexto(wvlr_icm,2,17));
    Imp.WriteXY(7,wCont, Bib.NumToTexto(wBase_Subst,2,18));
    Imp.WriteXY(11, wCont, Bib.NumToTexto(wIcms_Subst,2,18));
    Imp.WriteXY(15,wCont,Bib.NumToTexto(wtotal_produtos - wTotalServico,2,20));

    wCont := wCont + 3;

    Imp.WriteXY(0,wCont,Bib.NumToTexto(QNFE_EmiteVAL_FRETE.Value,2,18));
    Imp.WriteXY(7,wCont,Bib.NumToTexto(QNFE_EmiteVAL_DESPESAS.Value,2,18));
    Imp.WriteXY(11,wCont,Bib.NumToTexto(wvlr_ipi,2,18));

    Imp.WriteXY(15,wCont,Bib.NumToTexto( wtotal_produtos
                                   +wvlr_ipi
                                   +QNFE_EmiteVAL_DESPESAS.Value
                                   +wIcms_Subst
                                   +QNFE_EmiteVAL_FRETE.Value
                                   -QNFE_EmiteVAL_Desconto.Value
                                   -QNFE_EmiteVAL_Funrural.Value,2,20));


    //TRANSPORTADOR / VOLUMES TRANSPORTADOS

    //wCont := 47;
    wCont := 68;
    if Trim(QNFE_Emitenome_transp.Value) = '' then
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_Transportadora.Value)
    else
      Imp.WriteXY(0,wCont,QNFE_Emitenome_transp.Value);
    if QNFE_EmiteInd_Tipo_Frete.Value = 'FOB' Then
      Imp.WriteXY(10.1,wCont,'2') // Destinatário
    else
      Imp.WriteXY(10.1,wCont,'1'); // Emitente
    Imp.WriteXY(12,wCont,QNFE_EmiteDesc_Placa.Value);
    Imp.WriteXY(13.7, wCont, QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(15.5,wCont,QNFE_Emitecgc_transp.Value);

    Inc(wCont,2);

    Imp.WriteXY(0,wCont,QNFE_Emiteend_transp.Value);
    Imp.WriteXY(9,wCont,QNFE_Emitecidade_transp.Value);
    Imp.WriteXY(13.7,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(16,wCont,QNFE_Emiteinsc_transp.Value);

    Inc(wCont,2);

    Imp.WriteXY(0,wCont,QNFE_EmiteNUM_VOLUMES.Text);
    Imp.WriteXY(2.5,wCont,QNFE_EmiteDESC_ESPECIE.Text);
    Imp.WriteXY(6,wCont,QNFE_EmiteDESC_MARCA.Text);
    Imp.WriteXY(13.7,wCont,Bib.NumToTexto(wPesoBruto,0,8));
    Imp.WriteXY(16.2,wCont,Bib.NumToTexto(wPeso,0,8));

    //DADOS ADICIONAIS

    //wCont := 55;
    wCont := 77;

    Imp.WriteXY(0,wCont,QNFE_EmiteOBS.Value);

    Inc(wCont);
    
    if Trim(QNFE_EmiteDESC_OBS_CORPO_NOTA.Value) <> '' Then
    begin
      Imp.WriteXY(0,wCont,QNFE_EmiteDESC_OBS_CORPO_NOTA.Value);
      Inc(wCont);
    end;
    if Trim(QNFE_EmiteOBS_COMPLEMENTO.Value) <> '' Then
    begin
      Imp.WriteXY(0,wCont,QNFE_EmiteOBS_COMPLEMENTO.Value);
      Inc(wCont);
    end;
   if Trim( QNFE_EmiteDesc_Mensagem.Value)<>'' Then
    begin
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_Mensagem.Value);
      Inc(wCont);
    end;
    if Trim(QNFE_EmiteDesc_COMPLEMENTO.Value) <> '' Then
    begin
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_COMPLEMENTO.Value);
      Inc(wCont);
    end;

    Imp.WriteXY(0,wCont,wMsgTributacao);
    //wCont := 55;
    //Imp.WriteXY(17.5,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8));

  end;
//  Imp.SaltaPagina;

end;

procedure TFNotaImpressao.NF_CELEIRO;
Var wContServico: Byte;
    wTotalISS, wTotalServico: Real;
//    wFatura, wColuna: Integer;
    wContReceber: Byte;
    wExtenso: string;
begin
  // *** Emissão de Nota Fiscal para a CELEIRO
  // *** OBS - Colocar Posicao X em Centimetros
  // *** wNotaGlobal Controla a quebra de continuação
  wTotalISS := 0;
  wTotalServico := 0;
  wCont := 0;
//  wFatura := 0;
//  wColuna := 0;
  wMsgTributacao := '';
  With DMNotaSaida do
  Begin
    wNotaGlobal := 0;
    while wNotaGlobal < 2 do
    begin
      wCont := 4;
      If QNFE_EmiteInd_Entrada_Saida.Value = 'S' Then
        Imp.WriteXY(11.0,wCont,'X')
      Else
        Imp.WriteXY(13.3,wCont,'X');
      if wNotaGlobal = 1 then
         Imp.WriteXY(14.5,wCont,'CONTINUACAO');
      WnotaGlobal := 2;

      Imp.WriteXY(16,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
      Imp.WriteXY(18,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
      wCont := wCont+5;
      Imp.WriteXY(0,wCont,QNFE_EmiteNAT_OPERACAO.Value);
      Imp.WriteXY(5.7,wCont,QNFE_Emitenum_cfop.Text);
      wCont := wCont+3;
      Imp.WriteXY(0,wCont,QNFE_EmiteCOD_CADASTRO.Text);
      Imp.WriteXY(1.5,wCont, QNFE_EmiteNOME.Value);
      Imp.WriteXY(11.5,wCont,  QNFE_EmiteNUM_CGC_CPF.Value);
      Imp.WriteXY(16,wCont,QNFE_EmiteDT_EMISSAO.Text);
      wCont := wCont + 2;
      Imp.WriteXY(0,wCont, QNFE_EmiteDESC_ENDERECO.Value);
      Imp.WriteXY(9,wCont,QNFE_EmiteDESC_BAIRRO.Value);
      Imp.WriteXY(13.3,wCont,QNFE_EmiteDESC_CEP.Value);
      Imp.WriteXY(16,wCont,QNFE_EmiteDT_EMISSAO.Text);
      wCont := wCont+2;
      Imp.WriteXY(0,wCont,QNFE_EmiteDESC_CIDADE.Value);
      Imp.WriteXY(7.5,wCont,QNFE_EmiteDESC_TELEFONE.Value);
      Imp.WriteXY(10.1,wCont,QNFE_EmiteCOD_ESTADO.Value);
      Imp.WriteXY(11.6,wCont,QNFE_EmiteNUM_INSCRICAO.Value);

      Inc(wCont, 3);
      //FATURAS - Pedido de Elton. Diego A. S., 18/02/2009
      if QNFE_EmiteInd_Condicao_Pagto.Value = '2' Then
      begin
        wContReceber:=0;
        QContaReceber.Open;
        QContaReceber.First;
        while not QContaReceber.Eof do       // Faturamento
        begin
          if wContReceber = 0 Then
          begin
            Imp.WriteXY(0,wCont,Bib.NumToTexto(QContaReceberNUM_TITULO.Value,0,6));
            Imp.WriteXY(1.7,wCont,QContaReceberDT_Vencimento.Text);
            Imp.WriteXY(4,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
            wContReceber := 1;
          end
          else
          begin
            Imp.WriteXY(8.5,wCont,Bib.NumToTexto(QContaReceberNUM_TITULO.Value,0,6));
            Imp.WriteXY(10.2, wCont,QContaReceberDT_Vencimento.Text);
            Imp.WriteXY(12.5,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
            wContReceber := 0;
            Inc(wCont);
          end;
          QContaReceber.Next;
        end;
        QContaReceber.Close;
      end;
      //FIM DAS FATURAS

      // **** Itens de produtos ****
      Inc(wCont, 6);
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
          Imp.WriteXY(0,wCont,QNFE_EmiteITCOD_PRODUTO.Text);
          Imp.WriteXY(1.5,wCont,(Copy(QNFE_EmiteItDESC_PRODUTO.Text, 1, 33)));
          Imp.WriteXY(10.7,wCont,QNFE_EmiteITDesc_Situacao_Trib.Value);
          Imp.WriteXY(11.2,wCont,QNFE_EmiteITDesc_Unidade.Value);
          Imp.WriteXY(11.5,wCont,Bib.NumToTexto(QNFE_EmiteITQT_Quantidade.Value,2,5));
          Imp.WriteXY(12.9,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Unitario.Value,2,9));
          Imp.WriteXY(15.2,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value,2,11));
          Imp.WriteXY(17.4,wCont,QNFE_EmiteITPerc_Aliquota.Text);
          Calc_Peso_Nota;  // calcula peso para nota
        End
        Else
        Begin
          wTotalISS := wTotalISS + QNFE_EmiteItVal_ISS.Value;
          wTotalServico := wTotalServico + QNFE_EmiteItVal_Total.Value;
        End;
        If QNFE_EmiteITDESC_OBSERVACAO_TR.Value <> '' Then
           wMsgTributacao := QNFE_EmiteITDESC_OBSERVACAO_TR.Value;
        QNFE_EmiteIT.Next;

        If wCont >= 37 Then
        Begin
          wCont := 43;
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
    IMP_OBS_CORPO_NOTA(1, wCont);
//    FNotaImpressao.Imp_Desconto(wCont,1);
    wCont := 33;
    wContServico := 0;
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
    // *** Calculo do Imposto ****
    wCont := 43;
    Imp.WriteXY(0,wCont,Bib.NumToTexto(wbase_icm_tributada,2,18));
    Imp.WriteXY(4,wCont,Bib.NumToTexto(wvlr_icm,2,17)); // Era 3.2.
                                                        // Elton pediu para sair valores de Icms. Diego A. S. 18/02/2009
    //Imp.WriteXY(0,wCont,Bib.NumToTexto(0,2,18));
    //Imp.WriteXY(4,wCont,'0,00');
    Imp.WriteXY(7.2, wCont, Bib.NumToTexto(wBase_Subst, 2,17));
    Imp.WriteXY(10.2, wCont, BIB.NumToTexto(wIcms_Subst,2,17));
    Imp.WriteXY(14.0,wCont,Bib.NumToTexto(wtotal_produtos - wTotalServico,2,20));
    wCont := wCont + 2;
    Imp.WriteXY(0,wCont,Bib.NumToTexto(QNFE_EmiteVAL_FRETE.Value,2,18));
    Imp.WriteXY(7.2,wCont,Bib.NumToTexto(QNFE_EmiteVAL_DESPESAS.Value,2,17));
    Imp.WriteXY(10.2,wCont,Bib.NumToTexto(wvlr_ipi,2,15));
    Imp.WriteXY(14.0,wCont,Bib.NumToTexto( wtotal_produtos
                                 +wvlr_ipi + wIcms_Subst
                                 +QNFE_EmiteVAL_DESPESAS.Value
                                 -QNFE_EmiteVAL_Desconto.Value
                                 -QNFE_EmiteVAL_Funrural.Value,2,20));
    wCont := wCont + 3;
    If Trim(QNFE_Emitenome_transp.Value) = '' then
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_Transportadora.Value)
    Else
      Imp.WriteXY(0,wCont,QNFE_Emitenome_transp.Value);
    If QNFE_EmiteInd_Tipo_Frete.Value = 'FOB' Then
      Imp.WriteXY(10,wCont,'2') // Destinatário
    Else
      Imp.WriteXY(10,wCont,'1'); // Emitente
    Imp.WriteXY(10.5,wCont,QNFE_EmiteDesc_Placa.Value);
    Imp.WriteXY(13.8,wCont,QNFE_Emitecgc_transp.Value);
    wCont := wCont+2;
    Imp.WriteXY(0,wCont,QNFE_Emiteend_transp.Value);
    Imp.WriteXY(8,wCont,QNFE_Emitecidade_transp.Value);
    Imp.WriteXY(12.7,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(14,wCont,QNFE_Emiteinsc_transp.Value);
    wCont := wCont + 2;
    Imp.WriteXY(1,wCont,QNFE_EmiteNUM_VOLUMES.Text);
    Imp.WriteXY(12.7,wCont,Bib.NumToTexto(wPeso,2,8));
    Imp.WriteXY(15.5,wCont,Bib.NumToTexto(wPeso,2,8));
    wCont := wCont + 3;          //************************VERIFICAR POSICAO ERA 3
    Imp.WriteXY(0,wCont,QNFE_EmiteOBS.Value);
    wCont := wCont + 1;
    If Trim(QNFE_EmiteOBS_COMPLEMENTO.Value) <> '' Then
    Begin
      Imp.WriteXY(0,wCont,QNFE_EmiteOBS_COMPLEMENTO.Value);
      wCont := wCont + 1;
    End;
    If Trim( QNFE_EmiteDesc_Mensagem.Value) <> '' Then
    Begin
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_Mensagem.Value);
      wCont := wCont + 1;
    End;
    If Trim(QNFE_EmiteDesc_COMPLEMENTO.Value) <> '' Then
    Begin
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_COMPLEMENTO.Value);
      wCont := wCont + 1;
    End;
    If Trim(QNFE_EmiteDesc_COMPLEMENTO1.Value) <> '' Then
    Begin
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_COMPLEMENTO1.Value);
      wCont := wCont + 1;
    End;
    If Trim(QNFE_EmiteDesc_COMPLEMENTO2.Value) <> '' Then
    Begin
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_COMPLEMENTO2.Value);

    End;
  End;
//  Imp.SaltaPagina;
End;  //FIM IMPRESSAO NF CELEIRO FIBRATIVE

Procedure TFNotaImpressao.NF_DAMBONI;
begin
  // *** Emissão de Nota Fiscal para a DAMBONIGAS
  // *** OBS - Colocar Posicao X em Centimetros
  // *** wNotaGlobal Controla a quebra de continuação

  with DMNotaSaida do
  begin
    wNotaGlobal := 0;
          wCont := 0;
    while wNotaGlobal < 2 do
    begin
      wCont := 1;
      If wNotaGlobal = 1 then
         Imp.WriteXY(2.5,wCont,'CONTINUACAO');
      wNotaGlobal := 2;
      If QNFE_EmiteInd_Entrada_Saida.Value = 'S' Then
         Imp.WriteXY(12.5,wCont,'XX')
      else
        Imp.WriteXY(14.8,wCont,'XX');
      Imp.WriteXY(17.8,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
      //Imp.WriteXY(18.6,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
      Inc(wCont, 5);
      Imp.WriteXY(0.2,wCont,QNFE_EmiteNAT_OPERACAO.Value);
      Imp.WriteXY(5.8,wCont,QNFE_Emitenum_cfop.Text);  //ALTERADO SERGIO 13/12/2002
      Inc(wCont, 3);

      //DESTINATARIO REMETENTE

      Imp.WriteXY(0.2,wCont,QNFE_EmiteCOD_CADASTRO.Text);
      Imp.WriteXY(1.1,wCont,QNFE_EmiteNOME.Value);
      Imp.WriteXY(13.2,wCont,QNFE_EmiteNUM_CGC_CPF.Value);
      Imp.WriteXY(18.2,wCont,QNFE_EmiteDT_EMISSAO.Text);
      Inc(wCont, 2);
      Imp.WriteXY(0.2,wCont, QNFE_EmiteDESC_ENDERECO.Value);
      Imp.WriteXY(10.8,wCont,QNFE_EmiteDESC_BAIRRO.Value);
      Imp.WriteXY(15.4,wCont,QNFE_EmiteDESC_CEP.Value);
      Imp.WriteXY(18.2,wCont,QNFE_EmiteDT_EMISSAO.Text);
      Inc(wCont, 2);
      Imp.WriteXY(0.2,wCont,QNFE_EmiteDESC_CIDADE.Value);
      Imp.WriteXY(8.7,wCont,QNFE_EmiteDESC_TELEFONE.Value);
      Imp.WriteXY(11.7,wCont,QNFE_EmiteCOD_ESTADO.Value);
      Imp.WriteXY(13.2,wCont,QNFE_EmiteNUM_INSCRICAO.Value);
      // **** Itens de produtos ****
      Inc(wCont, 3);
      wContLinha := 0;
      // somente pode posicionar no inicio do arquivo a primeira vez
      if wNotaGlobal = 0 then
         QNFE_EmiteIt.First;
      while not QNFE_EmiteIT.Eof do
      begin
        Inc(wCont);
        Inc(wcontLinha);
        Imp.WriteXY(0,wCont,Bib.NumToTexto(QNFE_EmiteITCod_Produto.Value,0,6));
        Imp.WriteXY(1,wCont,QNFE_EmiteITDesc_Produto.Value);
        Imp.WriteXY(10.7,wCont,QNFE_EmiteITNum_Classificacao.Value);
        Imp.WriteXY(11,wCont,QNFE_EmiteITDesc_Unidade.Value);
        Imp.WriteXY(12.2,wCont,Bib.NumToTexto(QNFE_EmiteITQT_Quantidade.Value,0,8));
        Imp.WriteXY(14,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Unitario.Value,2,11));
        Imp.WriteXY(17,wCont,Bib.NumToTexto(QNFE_EmiteITVal_Total.Value,2,11));
        Imp.WriteXY(19.6,wCont,QNFE_EmiteITPerc_Aliquota.Text);
        if QNFE_EmiteItDesc_Complemento.Value <> '' Then
        Begin   // ** Imprimir Complemento de Descrição
          Inc(wCont);
          Inc(wContLinha);
          Imp.WriteXY(2,wCont,QNFE_EmiteITDesc_Complemento.Value);
        End;
        QNFE_EmiteIT.Next;
        If wContLinha >= 17 Then
         Begin
           wNotaGlobal := 1;
           Imp.WriteXY(16.5,42,'CONTINUA');
           Imp.SaltaPagina;
           Break;
         End;
      End;
    End;
    if QNFE_EmiteVal_Desconto.Value > 0 Then
    begin
      Inc(wCont);
      Imp.WriteXY(0.5,wCont,'DESCONTO: '+Bib.NumToTexto(QNFE_EmiteVal_Desconto.Value,2,13));
    End;
    // Fim dos Item de Produto
    IMP_OBS_CORPO_NOTA(1, wCont);
//    FNotaImpressao.Imp_Desconto(wCont,1);
    // *** Final dos Itens ****
    //----TRIBUTACAO E VALORES
    wCont := 36;
    Imp.WriteXY(0.2,wCont,Bib.NumToTexto(wbase_icm_tributada,2,18));
    Imp.WriteXY(4.2,wCont,Bib.NumToTexto(wvlr_icm,2,17));
    Imp.WriteXY(8.4,wCont,Bib.NumToTexto(wBase_Subst,2,15));
    Imp.WriteXY(12.5,wCont,Bib.NumToTexto(wIcms_Subst,2,15));
    Imp.WriteXY(16.5,wCont,Bib.NumToTexto(wtotal_produtos,2,15));
    Inc(wCont, 2);
    Imp.WriteXY(0.2,wCont,Bib.NumToTexto(QNFE_EmiteVAL_FRETE.Value,2,18));
    Imp.WriteXY(8.5,wCont,Bib.NumToTexto(QNFE_EmiteVAL_DESPESAS.Value,2,17));
    Imp.WriteXY(12.5,wCont,Bib.NumToTexto(wvlr_ipi,2,15));
    Imp.WriteXY(16.5,wCont,Bib.NumToTexto( wtotal_produtos
                                 +wvlr_ipi
                                 +QNFE_EmiteVAL_DESPESAS.Value
                                 -QNFE_EmiteVAL_Desconto.Value
                                 -QNFE_EmiteVAL_Funrural.Value,2,15));
    Inc(wCont, 3);
    if Trim(QNFE_Emitenome_transp.Value) = '' then
      Imp.WriteXY(0.2,wCont,QNFE_EmiteDesc_Transportadora.Value)
    else
      Imp.WriteXY(0.2,wCont,QNFE_Emitenome_transp.Value);
    if QNFE_EmiteInd_Tipo_Frete.Value = 'FOB' Then
      Imp.WriteXY(10.8,wCont,'2') // Destinatário
    else
      Imp.WriteXY(10.8,wCont,'1'); // Emitente
    Imp.WriteXY(12.4,wCont,QNFE_EmiteDesc_Placa.Value);
    Imp.WriteXY(14.7,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(15.4,wCont,QNFE_Emitecgc_transp.Value);
    Inc(wCont, 2);
    Imp.WriteXY(0.2,wCont,QNFE_Emiteend_transp.Value);
    Imp.WriteXY(9,wCont,QNFE_Emitecidade_transp.Value);
    Imp.WriteXY(14.7,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(15.4,wCont,QNFE_Emiteinsc_transp.Value);
    Inc(wCont, 2);
    Imp.WriteXY(0.2,wCont,QNFE_EmiteNUM_VOLUMES.Text);
    Imp.WriteXY(15.5,wCont,Bib.NumToTexto(wPesoBruto,0,8));
    Imp.WriteXY(18.2,wCont,Bib.NumToTexto(wPeso,0,8));

    Inc(wCont, 3);

    //--------------------pagamentos
    if QNFE_EmiteInd_Condicao_Pagto.Value = '1' Then
    begin
      Imp.WriteXY(0.2,wCont,'Pagamento a Vista');
    end;
    if QNFE_EmiteInd_Condicao_Pagto.Value = '2' Then
    begin
      QContaReceber.Open;
      QContaReceber.First;
      Imp.WriteXY(0,wCont,'Pagamento a Prazo');
      inc(wCont);
      while not QContaReceber.Eof do
      begin
        Imp.WriteXY(0,wCont,Bib.NumToTexto(QContaReceberNUM_TITULO.Value,0,6) );
        Imp.WriteXY(1.3,wCont,QContaReceberDT_Vencimento.Text);
        Imp.WriteXY(3.4,wCont,Bib.NumToTexto(QContaReceberVal_Titulo.Value,2,8));
        inc(wCont);
        QContaReceber.Next;
      end;
      QContaReceber.Close;
    end;
    //---------final pagamentos-------------------------------------

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
    if Trim(QNFE_EmiteDesc_COMPLEMENTO1.Value) <> '' Then
    begin
      Imp.WriteXY(0.2,wCont,QNFE_EmiteDesc_COMPLEMENTO1.Value);
      Inc(wCont);
    end;
    if Trim(QNFE_EmiteDesc_COMPLEMENTO2.Value) <> '' Then
    begin
      Imp.WriteXY(0.2,wCont,QNFE_EmiteDesc_COMPLEMENTO2.Value);
      Inc(wCont);
    end;
    If QNFE_EmiteVal_AVista.Value > 0 Then
    Begin
      Imp.WriteXY(0,wCont,'Valor Entrada:'+Bib.NumToTexto(QNFE_EmiteVal_AVista.Value,2,8));
      Inc(wCont);
    End;

    wCont:=60;
    Imp.WriteXY(18,wCont,Bib.NumToTexto(QNFE_EmiteNUM_NOTA.Value,0,8) );
  end;
end;

Procedure TFNotaImpressao.NF_INJEPAR;
type
  TServico = Record
    DescServico: String;
    QtQtde: Integer;
    ValUn: Real;
    ValServico: Real;
    PercDesconto: Real;
    AliqIss: Real;
    DescPlaca: String;
end;
type
  TProduto = Record
    NumFabricante: String;
    DescProduto: String;
    DescSituacao: String;
    DescUnid: String;
    QtQtde: Real;
    ValUnitario: Real;
    ValTotal: Real;
    PercDesconto: Real;
    AliqIcms: Real;
    DescPlaca: String;
end;
procedure verificaLinhaServicos(wTotalISS, wValorServicos: Real); // verifica se está na linha para imprimir ISS ou o valor total dos servicos
begin
  if wCont = 50 then
    Imp.WriteXY(15,wCont,Bib.NumToTexto(wTotalISS,2,21));
  if wCont = 69 then
    Imp.WriteXY(15,wCont,Bib.NumToTexto(wValorServicos,2,22));
end;
var
  wContServico, wContProduto, cfop: Integer;
  wProdutos: Array of TProduto;
  wProduto: TProduto;
  wServicos: Array of TServico;
  wServico: TServico;
  wSaltar: Boolean;
  wTotalISS, wTotalPeca, wTotalServico, wDescPecas, wDescServicos, wPercDescPecas, wPercDescServicos: Real;
  wAux: String;
  CFOPs: Array of Integer;
begin
  // *** Emissão de Nota Fiscal para a Retífica INJEPAR
  // *** OBS - Colocar Posicao X em Centimetros
  // *** wNotaGlobal Controla a quebra de continuação
  wTotalISS := 0;
  wTotalServico := 0;
  wTotalPeca := 0;
  wMsgTributacao := '';
  SetLength(wServicos, 0);
  wContServico := 0;
  wContProduto := 0;
  wDescPecas := 0;
  wDescServicos := 0;
  wPercDescPecas := -2;
  wPercDescServicos := -2;
  wSaltar := False;
  SetLength(CFOps, 0);
  with DMNotaSaida do
  begin
    wNotaGlobal := 0;
    wCont := 0;
    QNFE_EmiteIt.First;
    while not QNFE_EmiteIT.Eof do
    begin
      if QNFE_EmiteItIND_TIPO_PRODUTO.Value <> 'SERVIÇO' Then   // nota fiscal de serviços
      begin
        wProduto.NumFabricante := QNFE_EmiteItNUM_FABRICANTE_ITEM.Value;// + ' ' + QNFE_EmiteItDESC_COMPLEMENTO.Value
        wProduto.DescProduto := QNFE_EmiteItDESC_COMPL_ITEM.Value;
        if Trim(wProduto.DescProduto) = '' then
          wProduto.DescProduto := QNFE_EmiteItDESC_PRODUTO.Value;
        wProduto.DescSituacao := QNFE_EmiteItDESC_SITUACAO_TRIB.Value;
        wProduto.DescUnid := QNFE_EmiteItDESC_UNIDADE.Value;
        wProduto.QtQtde := QNFE_EmiteItQT_QUANTIDADE.Value;
        wProduto.ValUnitario := QNFE_EmiteItVAL_UNITARIO.Value;
        wProduto.ValTotal := QNFE_EmiteItQT_QUANTIDADE.Value * QNFE_EmiteItVAL_UNITARIO.Value;
        wProduto.AliqIcms := QNFE_EmiteItPERC_ALIQUOTA.Value;
        wProduto.PercDesconto := QNFE_EmiteItPERC_DESC.Value;
        wProduto.DescPlaca := QNFE_EmiteItDESC_RENDA.Value;
        if wPercDescPecas <> -1 then
        begin
          if (QNFE_EmiteItVAL_DESCONTO.Value > 0) then
            wPercDescPecas := -1
          else if wPercDescPecas = -2 then
            wPercDescPecas := QNFE_EmiteItPERC_DESC.Value
          else if (QNFE_EmiteItPERC_DESC.Value > 0) and (wPercDescPecas <> QNFE_EmiteItPERC_DESC.Value) then
            wPercDescPecas := -1;
        end;
        wTotalPeca := wTotalPeca + wProduto.ValTotal;
        wDescPecas := wDescPecas + QNFE_EmiteItVAL_DESCONTO.Value +
            (wProduto.ValTotal * wProduto.PercDesconto / 100);
        Inc(wContProduto);
        SetLength(wProdutos, wContProduto);
        wProdutos[wContProduto - 1] := wProduto;
        Calc_Peso_Nota;
        if QNFE_EmiteCOD_ESTADO.Value = QNFE_EmiteUF_FILIAL.Value then
          cfop := QNFE_EmiteNAT_ESTADUAL_NOVO.Value
        else
          cfop := QNFE_EmiteNAT_INTERESTADUAL_NOVO.Value;
      end
      else
      begin
        wServico.DescServico := QNFE_EmiteItDESC_COMPL_ITEM.Value;
        if Trim(wServico.DescServico) = '' then
          wServico.DescServico := QNFE_EmiteITDesc_Produto.Value;
        wServico.ValUn := QNFE_EmiteItVAL_UNITARIO.Value;
        wServico.ValServico := QNFE_EmiteItQT_QUANTIDADE.Value * QNFE_EmiteItVAL_UNITARIO.Value;
        wServico.AliqIss := QNFE_EmiteItVAL_ISS.Value;
        wServico.QtQtde := Trunc(QNFE_EmiteItQT_QUANTIDADE.Value);
        wServico.PercDesconto := QNFE_EmiteItPERC_DESC.Value;
        wServico.DescPlaca := QNFE_EmiteItDESC_RENDA.Value;
        wDescServicos := wDescServicos + QNFE_EmiteItVAL_DESCONTO.Value +
            (wServico.ValServico * wServico.PercDesconto / 100);
        if wPercDescServicos <> -1 then
        begin
          if (QNFE_EmiteItVAL_DESCONTO.Value > 0) then
            wPercDescServicos := -1
          else if (wPercDescServicos = -2) then
            wPercDescServicos := QNFE_EmiteItPERC_DESC.Value
          else if (QNFE_EmiteItPERC_DESC.Value > 0) and (wPercDescServicos <> QNFE_EmiteItPERC_DESC.Value) then
            wPercDescServicos := -1;
        end;
        wTotalServico := wTotalServico + wServico.ValServico;
        Inc(wContServico);
        SetLength(wServicos, wContServico);
        wServicos[wContServico - 1] := wServico;
        wTotalISS := wTotalISS + QNFE_EmiteItVal_ISS.Value;
//        cfop := QNFE_EmiteItCOD_CFOP.Value;
        if QNFE_EmiteCOD_ESTADO.Value = QNFE_EmiteUF_FILIAL.Value then
          cfop := 5933
        else
          cfop := 6933;
      end;
      if (cfop > 0) and (not (Bib.ComparaIntegerArray(cfop, CFOPs))) then
      begin
        SetLength(CFOPs, Length(CFOPs) + 1);
        CFOPs[Length(CFOPs) - 1] := cfop;
      end;
      QNFE_EmiteIT.Next;
    end; //Fim dos itens
    wAux := '';
    for wCont := 0 to Length(CFOPs) - 1 do
      wAux := wAux + IntToStr(cfops[wCont]) + '/';
    SetLength(wAux, Length(wAux) - 1);
    if ((Copy(wAux, 1, 4) = '5933') or (Copy(wAux, 1, 4) = '6933')) and (Length(wAux) > 4) then
      wAux := Copy(wAux, 6, 4) + '/' + Copy(wAux, 1, 4);
    wContProduto := 0;
    wContServico := 0;
    wDescPecas := Trunc(wDescPecas * 100) / 100;       // para eliminar os décimos de centavos
    wDescServicos := Trunc(wDescServicos * 100) / 100;
    while wNotaGlobal < 2 do
    begin
      wCont := 1;
      if wNotaGlobal = 1 then
        Imp.WriteXY(3.5,wCont,'CONTINUACAO');
      if QNFE_EmiteInd_Entrada_Saida.Value = 'S' Then
        Imp.WriteXY(12,wCont,'X')
      else
        Imp.WriteXY(14,wCont,'X');
      Imp.WriteXY(18.2,wCont,FormatFloat('000000', QNFE_EmiteNUM_NOTA.Value));

      Inc(wCont, 3);
      Imp.WriteXY(12.5,wCont,'77.418.044/0001-60');

      Inc(wCont, 2);
      Imp.WriteXY(0,wCont,QNFE_EmiteNAT_OPERACAO.Value);
      Imp.WriteXY(6.2,wCont,wAux);
      Imp.WriteXY(13,wCont,'42001693-07');

      Inc(wCont, 3);
      Imp.WriteXY(0,wCont,QNFE_EmiteCOD_CADASTRO.Text);
      Imp.WriteXY(1,wCont,QNFE_EmiteNOME.Value);
      Imp.WriteXY(12.2,wCont,QNFE_EmiteNUM_CGC_CPF.Value);
      Imp.WriteXY(17.2,wCont,QNFE_EmiteDT_EMISSAO.Text);

      Inc(wCont, 2);
      Imp.WriteXY(0,wCont, QNFE_EmiteDESC_ENDERECO.Value);
      Imp.WriteXY(9.2,wCont,QNFE_EmiteDESC_BAIRRO.Value);
      Imp.WriteXY(14.2,wCont,QNFE_EmiteDESC_CEP.Value);
      Imp.WriteXY(17.2,wCont,QNFE_EmiteDT_EMISSAO.Text);

      Inc(wCont, 2);
      Imp.WriteXY(0,wCont,QNFE_EmiteDESC_CIDADE.Value);
      Imp.WriteXY(7.5,wCont,QNFE_EmiteDESC_TELEFONE.Value);
      Imp.WriteXY(11.4,wCont,QNFE_EmiteCOD_ESTADO.Value);
      Imp.WriteXY(12,wCont,QNFE_EmiteNUM_INSCRICAO.Value + ' ' + QNFE_EmiteDESC_ORGAO_EMISSOR.Value);
      Imp.WriteXY(17.2,wCont,TimeToStr(Time));

      // **** Itens ****
      wNotaGlobal := 2;
//      Imp.ConfiguraCondensado('CONDENSADO_ON');
      Inc(wCont, 3);
      wContLinha := 0;
      while wContProduto < Length(wProdutos) do //Impressao dos Produtos
      begin
        wProduto := wProdutos[wContProduto];
        Inc(wCont);
        Inc(wContProduto);
        Inc(wContLinha);
        Imp.WriteXY(0,wCont, wProduto.NumFabricante);
        if (wProduto.DescPlaca <> '') then
          Imp.WriteXY(3,wCont, Copy(wProduto.DescProduto,1,42))
        else
          Imp.WriteXY(3,wCont, Copy(wProduto.DescProduto,1,50));
        Imp.WriteXY(9.2,wCont, wProduto.DescPlaca);
        Imp.WriteXY(10.7,wCont, wProduto.DescSituacao);
        Imp.WriteXY(11.2,wCont, wProduto.DescUnid);
        Imp.WriteXY(11.9,wCont, Bib.NumToTexto(wProduto.QtQtde,0,5));
        Imp.WriteXY(13,wCont, Bib.NumToTexto(wProduto.ValUnitario,2,14));
        wAux := Bib.NumToTexto(wProduto.ValTotal,2,22);
        if (wPercDescPecas > 0) and (wProduto.PercDesconto = 0) then
          wAux := wAux + ' LL';
        Imp.WriteXY(14.8,wCont, wAux);
        Imp.WriteXY(19,wCont, FloatToStr(wProduto.AliqIcms));
        if wContProduto = Length(wProdutos) then
        begin
          Inc(wCont);
          Imp.WriteXY(3,wCont,'TOTAL... ');
          Imp.WriteXY(15,wCont,Bib.NumToTexto(wTotalPeca,2,22));
          if (wDescPecas > 0) Then
          begin
            Inc(wCont);
            Imp.WriteXY(3,wCont,'DESCONTO... ');
            if wPercDescPecas >= 0 then
              Imp.WriteXY(5, wCont, FormatFloat('#,##0.00', wPercDescPecas) + ' %');
            Imp.WriteXY(15,wCont,Bib.NumToTexto(wDescPecas,2,22));
          end;
        end;

        if (wContLinha = 23) and (wContProduto < Length(wProdutos)) then
        begin
          wSaltar := True;
          Break;
        end;
      end;
      wCont := 44;
      wContLinha := 0;
      while wContServico < Length(wServicos) do //Impressao dos Servicos
      begin
        wServico := wServicos[wContServico];
        Inc(wCont);
        Inc(wContServico);
        Inc(wContLinha);
        Imp.WriteXY(0,wCont,IntToStr(wServico.QtQtde));
        if (wProduto.DescPlaca <> '') then
          Imp.WriteXY(0.3,wCont,Copy(wServico.DescServico,1,45))
        else
          Imp.WriteXY(0.3,wCont, Copy(wServico.DescServico,1,50));
        Imp.WriteXY(8,wCont, wServico.DescPlaca);
        Imp.WriteXY(9.2,wCont,Bib.NumToTexto(wServico.ValUn,2,10));
        wAux := Bib.NumToTexto(wServico.ValServico,2,9);
        if (wPercDescServicos > 0) and (wServico.PercDesconto = 0) then
          wAux := wAux + ' LL';
        Imp.WriteXY(12,wCont, wAux);
//        Imp.WriteXY(12,wCont,Bib.NumToTexto(wServico.ValServico,2,10));
        Imp.WriteXY(14,wCont,Bib.NumToTexto(wServico.AliqIss,2,8));
        verificaLinhaServicos(wTotalISS, wTotalServico - wDescServicos);

        if (wContServico = Length(wServicos)) then
        begin
          Inc(wCont);
          Imp.WriteXY(0.3,wCont,'TOTAL... ');
          Imp.WriteXY(11.8,wCont,Bib.NumToTexto(wTotalServico,2,10));
          verificaLinhaServicos(wTotalISS, wTotalServico - wDescServicos);

          if (wDescServicos > 0) Then
          begin
            Inc(wCont);
            Imp.WriteXY(0.3,wCont,'DESCONTO... ');
            if wPercDescServicos >= 0 then
              Imp.WriteXY(2, wCont, FormatFloat('#,##0.00', wPercDescServicos) + ' %');
            Imp.WriteXY(11.8,wCont,Bib.NumToTexto(wDescServicos,2,10));
            verificaLinhaServicos(wTotalISS, wTotalServico - wDescServicos);
          end;
        end;

        if (wContLinha = 23) and (wContServico < Length(wServicos)) then
        begin
          wSaltar := True;
          Break;
        end;
      end;
      if wCont < 50 then
        Imp.WriteXY(15,50,Bib.NumToTexto(wTotalISS,2,22));
      if wCont < 69 then
        Imp.WriteXY(15,69,Bib.NumToTexto(wTotalServico - wDescServicos,2,22));
      if wSaltar then
      begin
//        Imp.ConfiguraCondensado('CONDENSADO_OFF');
        wSaltar := False;
        wCont := 75;
        Imp.WriteXY(17,wCont,'CONTINUA');
        wNotaGlobal := 1;
        Imp.SaltaPagina;
      end;
    end;
    // Fim do Controle de Continuação

//    Imp.ConfiguraCondensado('CONDENSADO_OFF');
    wCont := 72;
    Imp.WriteXY(0.1,wCont,Bib.NumToTexto(wbase_icm_tributada,2,15));
    Imp.WriteXY(4,wCont,Bib.NumToTexto(wvlr_icm,2,15));
    Imp.WriteXY(15,wCont,Bib.NumToTexto(wTotalPeca - wDescPecas,2,22));

    Inc(wCont, 2);
    Imp.WriteXY(0.1,wCont,Bib.NumToTexto(QNFE_EmiteVAL_FRETE.Value,2,15));
    Imp.WriteXY(8,wCont,Bib.NumToTexto(QNFE_EmiteVAL_DESPESAS.Value,2,15));
    Imp.WriteXY(12,wCont,Bib.NumToTexto(wvlr_ipi,2,15));
    Imp.WriteXY(15,wCont,Bib.NumToTexto(wTotalPeca - wDescPecas
                                 +wTotalServico - wDescServicos
                                 +wvlr_ipi
                                 +QNFE_EmiteVAL_DESPESAS.Value
                                 -QNFE_EmiteVAL_Desconto.Value
                                 -QNFE_EmiteVAL_Funrural.Value,2,22));

    Inc(wCont, 3);
    if Trim(QNFE_Emitenome_transp.Value) = '' then
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_Transportadora.Value)
    else
      Imp.WriteXY(0,wCont,QNFE_Emitenome_transp.Value);
    if QNFE_EmiteInd_Tipo_Frete.Value = 'FOB' Then
      Imp.WriteXY(11.2,wCont,'2') // Destinatário
    else
      Imp.WriteXY(11.2,wCont,'1'); // Emitente
    Imp.WriteXY(12,wCont,QNFE_EmiteDesc_Placa.Value);
    Imp.WriteXY(14,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(15,wCont,QNFE_Emitecgc_transp.Value);

    Inc(wCont, 2);
    Imp.WriteXY(0,wCont,QNFE_Emiteend_transp.Value);
    Imp.WriteXY(9,wCont,QNFE_Emitecidade_transp.Value);
    Imp.WriteXY(14,wCont,QNFE_Emiteuf_transp.Value);
    Imp.WriteXY(15,wCont,QNFE_Emiteinsc_transp.Value);

    Inc(wCont, 2);
    Imp.WriteXY(0,wCont,QNFE_EmiteNUM_VOLUMES.Text);
    Imp.WriteXY(2,wCont,QNFE_EmiteDESC_ESPECIE.Text);
    Imp.WriteXY(5.5,wCont,QNFE_EmiteDESC_MARCA.Text);
    Imp.WriteXY(9,wCont,QNFE_EmiteNUM_CONHECIMENTO_FRETE.Text);
//    Imp.WriteXY(13,wCont,Bib.NumToTexto(wPeso,2,8));
//    Imp.WriteXY(15,wCont,Bib.NumToTexto(wPesoBruto,2,22));

    Inc(wCont, 3);
    If Trim(QNFE_EmiteOBS.Value) <> '' Then
    begin
      Imp.WriteXY(0,wCont,QNFE_EmiteOBS.Value);
      Inc(wCont);
    end;
    If Trim(QNFE_EmiteDESC_OBS_CORPO_NOTA.Value) <> '' Then
    begin
      Imp.WriteXY(0,wCont,QNFE_EmiteDESC_OBS_CORPO_NOTA.Value);
      Inc(wCont);
    end;
    If Trim(QNFE_EmiteOBS_COMPLEMENTO.Value) <> '' Then
    begin
      Imp.WriteXY(0,wCont,QNFE_EmiteOBS_COMPLEMENTO.Value);
      Inc(wCont);
    end;
    If Trim(QNFE_EmiteDESC_MENSAGEM.Value) <> '' Then
    begin
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_Mensagem.Value);
      Inc(wCont);
    end;
    If Trim(QNFE_EmiteDesc_COMPLEMENTO.Value) <> '' Then
    begin
      Imp.WriteXY(0,wCont,QNFE_EmiteDesc_COMPLEMENTO.Value);
      Inc(wCont);
    end;
    If QNFE_EmiteIND_CONDICAO_PAGTO.Value = '2' Then
      Imp.WriteXY(0,wCont,'PAGAMENTO A PRAZO')
    else
      Imp.WriteXY(0,wCont,'PAGAMENTO A VISTA');
    Inc(wCont);

    wCont := 97;
    Imp.WriteXY(17.5,wCont,FormatFloat('000000', QNFE_EmiteNUM_NOTA.Value));
  end;
end;

end.
