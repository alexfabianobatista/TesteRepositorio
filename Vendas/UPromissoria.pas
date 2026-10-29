unit UPromissoria;

interface

Uses Dialogs, SysUtils, UBiblioteca,UFilial_cl;

Type
  TFPromissoria = Class
  Public
    Procedure Promissoria_Dos;
    procedure Duplicata_AB;
end;

var
  FPromissoria : TFPromissoria;

implementation

Uses UOracle_cl, UContasReceber_cl, UParamSistema_cl;


procedure TFPromissoria.Duplicata_AB;
var wCont : integer;
begin
  if Imp = Nil Then
    Imp := TImp.Create;
  Imp.AbreImpressora;//----------abre impressora
  Imp.ConfiguraImpressora('CONDENSADO_ON','SEXTOS',36);//-----configurar pagina

  while not DMContasReceber.QRContasReceber_Duplicatas.eof do
  begin
    wCont:=0;
    Imp.WriteXY(10.5,wCont,DMContasReceber.QRContasReceber_DuplicatasDESC_FILIAL.Value);
    Imp.WriteXY(16.0,wCont,'CEP: '+ DMContasReceber.QRContasReceber_DuplicatasDESC_CEP_FILIAL.Value);
    Inc(wCont);
    Imp.WriteXY(10.5,wCont,DMContasReceber.QRContasReceber_DuplicatasDESC_CIDADE_FILIAL.Value);
    Imp.WriteXY(16.0,wCont,DMContasReceber.QRContasReceber_DuplicatasCOD_ESTADO_FILIAL.Value);
    Inc(wCont);
    Imp.WriteXY(10.5,wCont,'I.E. '+DMContasReceber.QRContasReceber_DuplicatasDESC_INSCRICAO_FILIAL.Value);
    Imp.WriteXY(16.0,wCont,'CNPJ: ' + DMContasReceber.QRContasReceber_DuplicatasNUM_CGC_FILIAL.Value);
    Inc(wCont,2);
    Imp.WriteXY(13.5,wCont,DateToStr(date));
    Inc(wCont,5);
    Imp.WriteXY(1.5,wCont,Bib.NumToTexto(DMContasReceber.QRContasReceber_DuplicatasVAL_NOTA.Value,2,6));
    Imp.WriteXY(5,wCont,Bib.NumToTexto(DMContasReceber.QRContasReceber_DuplicatasNUM_NOTA.Value,0,6));

    Imp.WriteXY(8,wCont,Bib.NumToTexto(DMContasReceber.QRContasReceber_DuplicatasVAL_TITULO.Value,2,6));
    Imp.WriteXY(11.5,wCont,Bib.NumToTexto(DMContasReceber.QRContasReceber_DuplicatasNUM_TITULO.Value,0,6)+'/'+DMContasReceber.QRContasReceber_DuplicatasNUM_PARCELA.Text);

    Imp.WriteXY(14.5,wCont,DateToStr(DMContasReceber.QRContasReceber_DuplicatasDT_VENCIMENTO.Value));
    Inc(wCont,5);
    Imp.WriteXY(7,wCont,Bib.FormataTexto(DMContasReceber.QRContasReceber_DuplicatasNOME.Value,30));
    Imp.WriteXY(18,wCont,DMContasReceber.QRContasReceber_DuplicatasCOD_CADASTRO.text);
    Inc(wCont);
    Imp.WriteXY(7,wCont,DMContasReceber.QRContasReceber_DuplicatasDESC_ENDERECO.Value);
    Inc(wCont);
    Imp.WriteXY(7,wCont,DMContasReceber.QRContasReceber_DuplicatasDESC_CIDADE.Value);
    Imp.WriteXY(14,wCont,DMContasReceber.QRContasReceber_DuplicatasCOD_ESTADO.Value);
    Inc(wCont);
    Imp.WriteXY(7,wCont,DMContasReceber.QRContasReceber_DuplicatasDESC_CIDADE_FILIAL.Value);
    Inc(wCont,2);
    Imp.WriteXY(7,wCont,DMContasReceber.QRContasReceber_DuplicatasNUM_CGC_CPF.Value);
    Imp.WriteXY(14.5,wCont,DMContasReceber.QRContasReceber_DuplicatasNUM_INSCRICAO.Value);
    Inc(wCont,2);
    Imp.WriteXY(7,wCont,copy(DMContasReceber.QRContasReceber_Duplicatasextenso.Text,1,75));
    Inc(wCont);
    Imp.WriteXY(7,wCont,copy(DMContasReceber.QRContasReceber_Duplicatasextenso.Text,76,151));
    Inc(wCont);
    Imp.WriteXY(7,wCont,copy(DMContasReceber.QRContasReceber_Duplicatasextenso.Text,152,180));
    Imp.SaltaPagina;

    DMContasReceber.QRContasReceber_Duplicatas.Next;
  end;
  Imp.FechaImpressora;  // Finaliza os serviços de Impressao
end;

Procedure TFPromissoria.Promissoria_Dos;
Begin
  if Imp = Nil Then
     Imp := TImp.Create;
  Imp.AbreImpressora;  // abre a impressora lpt1
  Imp.ConfiguraImpressora('CONDENSADO_OFF','SEXTOS',33);
  While not(DMContasReceber.QRContasReceber_Duplicatas.Eof) Do
  Begin
    Imp.WriteXY(6.5,1,'N O T A   P R O M I S S O R I A');
    Imp.WriteXY(0.5,3,'NUMERO:'+DMContasReceber.QRContasReceber_DuplicatasNum_nota.Text+'/'+DMContasReceber.QRContasReceber_DuplicatasNum_Parcela.Text + ' - '+ DMContasReceber.QRContasReceber_Duplicatasnum_total_parcelas.Text);
    Imp.WriteXY(0.5,5,'Vencimento:'+DMContasReceber.QRContasReceber_DuplicatasDt_Vencimento.Text);
    Imp.WriteXY(12,5,'VALOR:'+Bib.NumToTexto(DMContasReceber.QRContasReceber_DuplicatasVal_Titulo.Value,2,8));
    Imp.WriteXY(0.5,7,'No dia '+DMContasReceber.QRContasReceber_DuplicatasDt_Vencimento.Text+' Pagarei por esta unica via de ');
    Imp.WriteXY(0.5,8,'NOTA PROMISSORIA A '+DMContasReceber.QRContasReceber_DuplicatasDesc_Filial.Value);
    Imp.WriteXY(0.5,9,'CNPJ '+DMContasReceber.QRContasReceber_DuplicatasNum_Cgc_Filial.Value+' ou a sua ordem a quantia de ');
    Imp.WriteXY(0.5,10,DMContasReceber.QRContasReceber_DuplicatasExtenso.Value+' em moeda corrente deste pais');
    Imp.WriteXY(0.5,12,'PAGAVEL EM:'+DMContasReceber.QRContasReceber_DuplicatasDesc_Cidade_Filial.Value);
    Imp.WriteXY(0.5,14,'EMITENTE..:'+DMContasReceber.QRContasReceber_DuplicatasCod_Cadastro.Text+' - '+DMContasReceber.QRContasReceber_DuplicatasNome.Value);
    Imp.WriteXY(0.5,15,'ENDERECO..:'+DMContasReceber.QRContasReceber_DuplicatasDesc_Endereco.Value);
    Imp.WriteXY(0.5,16,'CIDADE....:'+DMContasReceber.QRContasReceber_DuplicatasDesc_Cidade.Value+' UF:'+DMContasReceber.QRContasReceber_DuplicatasCod_Estado.Value);
    Imp.WriteXY(0.5,17,'C.P.F.....:'+DMContasReceber.QRContasReceber_DuplicatasNum_Cgc_Cpf.Value+' INSCRICAO:'+DMContasReceber.QRContasReceber_DuplicatasNUM_INSCRICAO.Value);
    Imp.WriteXY(6,20,DMContasReceber.QRContasReceber_DuplicatasDesc_Cidade_Filial.Value+ FormatDateTime(', dd "de" mmmm "de" yyyy',DMContasReceber.QRContasReceber_DuplicatasDt_Emissao.Value));
    {if DMParamSistema.CodEmpresa = 'COZER' then // COZER SOLICITOU DESSA FORMA, MAS DEPOIS MUDOU DE IDÉIA. SUPORTE 7301
    begin
      Imp.WriteXY(0.5,22,'__________________________________');
      Imp.WriteXY(12,22, '__________________________________');
      Imp.WriteXY(0.5,23,IntToStr(DMContasReceber.QRContasReceber_DuplicatasCOD_CADASTRO.Value)+' '+ DMContasReceber.QRContasReceber_DuplicatasNome.Value);
      Imp.WriteXY(12,23,DMContasReceber.QRContasReceber_DuplicatasDESC_FANTASIA.Value);
    end;}
    Imp.WriteXY(10,22,'__________________________________');
    Imp.WriteXY(10,23,IntToStr(DMContasReceber.QRContasReceber_DuplicatasCOD_CADASTRO.Value)+' '+ DMContasReceber.QRContasReceber_DuplicatasNome.Value);

    Imp.SaltaPagina;
    DMContasReceber.QRContasReceber_Duplicatas.Next;
  End;
  Imp.ConfiguraImpressora('CONDENSADO_OFF','SEXTOS',66);
  Imp.FechaImpressora;  // Finaliza os serviços de Impressao
End;

End.
