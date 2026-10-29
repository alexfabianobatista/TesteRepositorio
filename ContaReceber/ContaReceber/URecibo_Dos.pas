unit URecibo_Dos;

interface

Uses Dialogs, SysUtils, UBiblioteca, UParamSistema_cl, ufilial_cl, Uoracle_cl, UContasReceber_cl;

Type
  TFRecibo_Dos = Class
  Private
    Procedure Recibo_Feira(wNome,wParcela : String; wVencto, wDtPagto : TDateTime; wValorParcela,wJuros,wDesconto:Real);
    procedure Recibo_encopel(wNome, wParcela: String; wVencto,
      wDtPagto: TDateTime; wValorParcela, wJuros, wDesconto: Real; wcodFilial : integer; wDescFilial : string);
  Public
    Procedure EmiteRecibo_DOS(wNome,wParcela : String; wVencto, wDtPagto : TDateTime; wValorParcela,wJuros,wDesconto:Real; wCodFilial : integer; wDescFilial : string);
end;

var
  FRecibo_Dos : TFRecibo_Dos;

implementation

Procedure TFRecibo_Dos.EmiteRecibo_DOS(wNome,wParcela : String; wVencto, wDtPagto : TDateTime; wValorParcela,wJuros,wDesconto:Real; wCodFilial : integer; wDescFilial : string);
var wVal : string;
begin
  // *** Emissão de Nota Fiscal *** \\
  if Imp = Nil Then
     Imp := TImp.Create;

  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ENCOPEL' then
  begin
    wVal := DMOracle.BuscaNome('SELECT DESC_LPT_PEDIDO FROM TB_FILIAL','COD_FILIAL = ' + IntToStr(wCodFilial));
    if wVal = 'LPT1' then
      imp.AbreImpressora;
    if wVal = 'LPT2' then
      imp.AbreImpressora_Lpt2;
    if wval = 'COM2' then
      imp.AbreImpressora_Com2;

    Imp.ConfiguraImpressora('CONDENSADO_OFF','SEXTOS',3);

    //Recibo_Feira(wNome,wParcela,wVencto, wDtPagto,wValorParcela,wJuros,wDesconto);
    Imp.SaltaPagina;
    recibo_encopel(wNome, wParcela, wVencto,
      wDtPagto, wValorParcela, wJuros, wDesconto, wcodFilial, wDescFilial);
    Imp.ConfiguraImpressora('CONDENSADO_OFF','SEXTOS',66);
    Imp.FechaImpressora;  // Finaliza os serviços de Impressao

  end;

  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ARISTIDES' then
  begin
    Imp.AbreImpressora;
    Imp.ConfiguraImpressora('CONDENSADO_OFF','SEXTOS',18);
    Recibo_Feira(wNome,wParcela,wVencto, wDtPagto,wValorParcela,wJuros,wDesconto);
    Imp.SaltaPagina;
    Imp.ConfiguraImpressora('CONDENSADO_OFF','SEXTOS',66);
    Imp.FechaImpressora;  // Finaliza os serviços de Impressao
  end;
end;

Procedure TFRecibo_Dos.Recibo_encopel(wNome,wParcela : String; wVencto, wDtPagto : TDateTime; wValorParcela,wJuros,wDesconto:Real; wcodFilial : integer; wDescFilial, wObservacao : string);
var wEndereco, wCidade : string;
begin
  DMFilial.QFilial.close;
  DMFilial.QFilial.SetVariable('PK', wcodFilial);
  DMFilial.QFilial.open;

  wEndereco := DMOracle.BuscaNome('SELECT DESC_ENDERECO                    FROM TB_CADASTRO','COD_CADASTRO = ' + DMContasReceber.QContasReceberBaixaCOD_CADASTRO.Text);
  wCidade   := DMOracle.BuscaNome('SELECT DESC_CIDADE || '' - '' || COD_ESTADO FROM TB_CADASTRO','COD_CADASTRO = ' + DMContasReceber.QContasReceberBaixaCOD_CADASTRO.Text);

  Imp.WriteXY(0,7,Copy(DMFilial.QFilialDESC_FILIAL.Value,1,40));
  Imp.WriteXY(0,8,Copy(DMFilial.QFilialDESC_ENDERECO.Value,1,40));
  Imp.WriteXY(0,9,Copy(DMFilial.QFilialDESC_TELEFONE.Value,1,40));
  Imp.WriteXY(0,10,'RECIBO DE PAGAMENTO');
  Imp.WriteXY(0,11,'----------------------------------------');
  Imp.WriteXY(0,12,DateToStr(wDtPagto) + '            N. Tit.:  ' + wParcela);
  Imp.WriteXY(0,13,'----------------------------------------');
  Imp.WriteXY(0,14,'CLI.:' + copy(DMContasReceber.QContasReceberBaixaNOME.Value, 1, 35));
  Imp.WriteXY(0,15,'END.:' + copy(wEndereco,1,35));
  Imp.WriteXY(0,16,copy(wCidade,1,40));
  Imp.WriteXY(0,17,'----------------------------------------');
  Imp.WriteXY(0,18,'  N. Tit...:     ' + wParcela);
  Imp.WriteXY(0,19,'  Dt. Venc.: ' + DateToStr(wVencto));
  Imp.WriteXY(0,20,'  Dt. Pgto.: ' + DateToStr(wDtPagto));
  Imp.WriteXY(0,21,'  Vlr Parc.: ' + Bib.NumToTexto(wValorParcela,2,10));
  Imp.WriteXY(0,22,'  Juros....: ' + Bib.NumToTexto(wJuros,2,10));
  Imp.WriteXY(0,23,'  Desconto.: ' + Bib.NumToTexto(wDesconto,2,10));
  Imp.WriteXY(0,24,'  Total....: ' + Bib.NumToTexto(wValorParcela + wJuros - wDesconto,2,10));
  Imp.WriteXY(0,25,'----------------------------------------');
  Imp.WriteXY(0,26,'Obs: ' + wObservacao);
  Imp.WriteXY(0,27,'----------------------------------------');
  Imp.WriteXY(0,34,' ');
End;

Procedure TFRecibo_Dos.Recibo_Feira(wNome,wParcela : String; wVencto, wDtPagto : TDateTime; wValorParcela,wJuros,wDesconto:Real);
begin
  Imp.WriteXY(0.3,6,Copy(wNome,1,33));
  Imp.WriteXY(11.2,6,Copy(wNome,1,33));
  Imp.WriteXY(0.5,8,wParcela);
  Imp.WriteXY(3.5,8,DateToStr(wVencto));
  Imp.WriteXY(7,8,DateToStr(wDtPagto));
  Imp.WriteXY(11.3,8,wParcela);
  Imp.WriteXY(14.1,8,DateToStr(wVencto));
  Imp.WriteXY(17.3,8,DateToStr(wDtPagto));
  Imp.WriteXY(0.5,10,Bib.NumToTexto(wValorParcela,2,9));
  Imp.WriteXY(3.5,10,Bib.NumToTexto(wJuros,2,9));
  Imp.WriteXY(7.5,10,Bib.NumToTexto(wDesconto,2,9));
  Imp.WriteXY(11.8,10,Bib.NumToTexto(wValorParcela,2,9));
  Imp.WriteXY(14.5,10,Bib.NumToTexto(wJuros,2,9));
  Imp.WriteXY(17.3,10,Bib.NumToTexto(wDesconto,2,9));
  Imp.WriteXY(7.5,13,Bib.NumToTexto(wValorParcela + wJuros - wDesconto,2,9));
  Imp.WriteXY(17.5,13,Bib.NumToTexto(wValorParcela + wJuros - wDesconto,2,9));
End;

End.
