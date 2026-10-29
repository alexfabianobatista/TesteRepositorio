unit URequisicaoImpressao;

interface

Uses Dialogs, SysUtils, UBiblioteca,UFilial_cl;

Type
  TFRequisicaoImpressao = Class
  Private
    Procedure REQ_CAVALCA;
  Public
    Procedure EmiteREQ(wCodREQ:Integer);
end;

var
  FRequisicaoImpressao : TFRequisicaoImpressao;
  wEmpresa : string;
Const
  wBranco : String = '                                                                                                                            ';

implementation

Uses UOracle_cl, UObra_cl;

Procedure TFRequisicaoImpressao.EmiteREQ(wCodREQ:Integer);
begin
  // *** Emissão de Nota Fiscal *** \\
  DMObra.QObra_Req_Emite.Close;
  DMObra.QObra_Req_Emite.Open;
  If DMObra.QObra_Req_CabIND_SITUACAO.Value <> '2' Then
     raise Exception.Create('Esta Requisição não foi confirmada!');
  if Imp = Nil Then
     Imp := TImp.Create;
  Imp.AbreImpressora;
  Imp.ConfiguraImpressora('CONDENSADO_OFF','SEXTOS',33);
  Req_Cavalca;
  Imp.SaltaPagina;
  Imp.ConfiguraImpressora('CONDENSADO_OFF','SEXTOS',66);
  Imp.FechaImpressora;  // Finaliza os serviços de Impressao
end;

procedure TFRequisicaoImpressao.REQ_CAVALCA;
Var wCont,wLinha,wObra : Integer;
    wTotal:Real;
    wAux : String;
begin
  DMObra.QObra_Req_Item.First;
  while Not DMObra.QObra_Req_Emite.Eof Do
  Begin
    wCont := 0;
    wTotal := 0;
    With DMObra do
    Begin
      Imp.WriteXY(0,wCont,QObra_Req_EmiteDesc_Filial.Value);
      If QObra_Req_EmiteIND_TIPO_REQUISICAO.TEXT = 'PROVISORIA' Then
        Imp.WriteXY(11,wCont,'Tipo Requisicao: '+QObra_Req_EmiteIND_TIPO_REQUISICAO.Value);
      //inc(wCont);
      //Imp.WriteXY(1,wCont,QObra_Req_EmiteNUM_CGC.Value);
      //Imp.WriteXY(11,wCont,QObra_Req_EmiteDESC_INSCRICAO.Value);//tirado a pedido do Leandro 27/01/2006
      //inc(wCont);
      //Imp.WriteXY(1,wCont,QObra_Req_EmiteDESC_ENDERECO.Value);
      //Imp.WriteXY(11,wCont,QObra_Req_EmiteDESC_TELEFONE.Value); //tirado a pedido do Leandro 27/01/2006
      inc(wCont);
      Imp.WriteXY(1,wCont,QObra_Req_EmiteDESC_CIDADE.Value);
      Imp.WriteXY(11,wCont,QObra_Req_EmiteCOD_ESTADO.Value);
      Imp.WriteXY(17,wCont,'NR:'+QObra_Req_EmiteNUM_REQUISICAO.TEXT);
      inc(wCont);
      Imp.WriteXY(1,wCont,'Operacao:'+QObra_Req_EmiteDesc_Operacao.Value);
      Imp.WriteXY(11,wCont,'Competencia: '+QObra_Req_Emitedesc_competencia.Value);  
      inc(wCont);
      Imp.WriteXY(0,wCont,'________________________________________________________________________________');
      inc(wCont);
      Imp.WriteXY(0,wCont,'Firma:'+QObra_Req_EmiteCOD_CADASTRO.Text+' - '+QObra_Req_EmiteNOME.Value);
      inc(wCont);
      wAux:=DMOracle.BuscaNome('SELECT DESC_OBRA FROM TB_OBRA','COD_OBRA = '+FloatToStr(QObra_Req_ItemCod_Obra.Value));
      Imp.WriteXY(0,wCont,'Obra.:'+QObra_Req_ItemCOD_OBRA.Text+' - '+wAux);
      inc(wCont);
      wAux:=DMOracle.BuscaNome('SELECT DESC_CENTRO_CUSTO FROM TB_CENTRO_CUSTO','COD_CENTRO_CUSTO = '+FloatToStr(QObra_Req_ItemCOD_CENTRO_CUSTO.Value));
      Imp.WriteXY(0,wCont,'Centro Custo.:'+QObra_Req_ItemCOD_CENTRO_CUSTO.Text+' - '+wAux);
      Imp.WriteXY(12,wCont,'Finalidade:'+QObra_Req_EmiteDesc_Finalidade.Value);
      inc(wCont);
      Imp.WriteXY(0,wCont,'________________________________________________________________________________');
      inc(wCont);
      Imp.WriteXY(0,wCont,'CODIGO     QUANT');
      Imp.WriteXY(4.3,wCont,'DESCRICAO');
      Imp.WriteXY(15,wCont,'UNITARIO');
      Imp.WriteXY(18.5,wCont,'TOTAL');
      inc(wCont);
      Imp.WriteXY(0,wCont,'________________________________________________________________________________');
      inc(wCont);
      wLinha:=wCont;
      wObra := QObra_Req_ItemCod_Obra.Value;
      While Not (QObra_Req_Item.Eof) And (QObra_Req_ItemCod_Obra.Value = wObra) do
      Begin
        Imp.WriteXY(0,wCont,Bib.NumToTexto(QObra_Req_ItemCod_Produto.Value,0,6));
        Imp.WriteXY(1.2,wCont,Bib.NumToTexto(QObra_Req_ItemQT_Quantidade.Value,2,10));
        Imp.WriteXY(4.3,wCont,Copy(QObra_Req_ItemDescricao.Value,1,40));
        Imp.WriteXY(14.5,wCont,Bib.NumToTexto(QObra_Req_ItemVal_Unitario.Value,4,10));
        Imp.WriteXY(17.2,wCont,Bib.NumToTexto(QObra_Req_ItemVal_Total.Value,2,10));
        If QObra_Req_ItemDesc_Complemento.Value <> '' then
        Begin
          inc(wCont);
          Imp.WriteXY(0,wCont,QObra_Req_ItemDesc_Complemento.Value);
          inc(wLinha);
        End;
        wTotal := wTotal + QObra_Req_ItemVal_Total.Value;
        if (wLinha >= 24) then
        begin
           wCont := wCont+2;
           Imp.WriteXY(17,wCont,'Continua');
           Imp.SaltaPagina;
           wCont:=1;
           wLinha:=-1;
           Imp.WriteXY(17,wCont,'Continuacao');
        end;
        QObra_Req_Item.Next;
        wCont := wCont + 1;
        inc(wLinha);
      End;
      If QObra_Req_EmiteVal_Desconto.Value <> 0 Then
       Begin
         Imp.WriteXY(4.3,wCont,'DESCONTO');
         Imp.WriteXY(17.2,wCont,Bib.NumToTexto(QObra_Req_EmiteVal_Desconto.Value*-1,2,10));
       End;
      If QObra_Req_EmiteVal_Acrescimo.Value <> 0 Then
       Begin
         inc(wCont);
         Imp.WriteXY(4.3,wCont,'ACRESCIMO');
         Imp.WriteXY(17.2,wCont,Bib.NumToTexto(QObra_Req_EmiteVal_Acrescimo.Value,2,10));
       End;
      inc(wCont);
      // *** Final dos Itens ****
      Imp.WriteXY(17.2,wCont,Bib.NumToTexto(wTotal-QObra_Req_EmiteVal_Desconto.Value+QObra_Req_EmiteVal_Acrescimo.Value,2,10));
      wCont:= 25;
      Imp.WriteXY(0.2,wCont,'Parcelas');
      Imp.WriteXY(4.2,wCont,'Vencimento');
      Imp.WriteXY(8.6,wCont,'Valor');
      QContasPagar_Cab.Close;
      QContasPagar_Cab.Open;
      QContasPagar_Cab.First;
      While not QContasPagar_Cab.Eof do
      Begin
        inc(wCont);
        Imp.WriteXY(0.2,wCont,Bib.NumTotexto(QContasPagar_CabNUM_PARCELA.Value,0,8));
        Imp.WriteXY(4.4,wCont,QContasPagar_CabDT_VENCIMENTO.Text);
        Imp.WriteXY(8.2,wCont,Bib.NumToTexto(QContasPagar_CabVAL_TITULO.Value,2,8));
        QContasPagar_Cab.Next;
      End;
      wCont := wCont + 2;
      Imp.WriteXY(1,wCont,'Dt.Emissão:'+QObra_Req_EmiteDT_EMISSAO.Text);
      Imp.WriteXY(10,wCont,'________________________________');
      wCont := wCont + 1;
      Imp.WriteXY(12,wCont,'Assinatura');
      If QObra_Req_Item.Eof Then
         Break  // para sair da impressão de requisição
      Else
         Imp.SaltaPagina;   
    End;
  End;
end;

end.
