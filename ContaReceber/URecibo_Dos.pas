unit URecibo_Dos;

interface

Uses Dialogs, SysUtils, UBiblioteca, UParamSistema_cl, ufilial_cl, Uoracle_cl, UContasReceber_cl, UBibContasReceber;

Type
  TFRecibo_Dos = Class
  Private
    Procedure Recibo_Feira(wNome,wParcela : String; wVencto, wDtPagto : TDateTime; wValorParcela,wJuros,wDesconto:Real);
    procedure Recibo40Colunas(wNome, wParcela: String; wVencto,
      wDtPagto: TDateTime; wValorParcela, wJuros, wDesconto: Real; wcodFilial : integer; wDescFilial, wObservacao, wDescEndereco, wDescCidade : string);
  Public
    procedure EmiteRecibo_DOS(wNome,wParcela : String; wVencto, wDtPagto : TDateTime;
      wValorParcela,wJuros,wDesconto:Real; wCodFilial : integer; wDescFilial, wObservacao, wDescEndereco, wDescCidade : string);
    procedure ReciboVoltaTitulo40Colunas(wNome, wParcela, wNumTitulo: String; wVencto,
      wDtPagto: TDateTime; wValorTitulo, wValorMovimento, wSaldo: Real; wcodFilial, wCodCadastro : integer; wDescFilial : string);
end;

var
  FRecibo_Dos : TFRecibo_Dos;
  BibContasReceber : TBibContasReceber;

implementation


Procedure TFRecibo_Dos.EmiteRecibo_DOS(wNome,wParcela : String; wVencto, wDtPagto : TDateTime; wValorParcela,wJuros,wDesconto:Real; wCodFilial : integer; wDescFilial, wObservacao, wDescEndereco, wDescCidade : string);
var wVal : string;
begin
  // Impressão de Recibo - Matricial - Modificado por Djeison A. Selzlein - 17/08/2013
  if Imp = Nil Then
     Imp := TImp.Create;

  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ARISTIDES' then
   begin
     Imp.AbreImpressora;
     Imp.ConfiguraImpressora('CONDENSADO_OFF','SEXTOS',18);
     Recibo_Feira(wNome,wParcela,wVencto, wDtPagto,wValorParcela,wJuros,wDesconto);
     Imp.SaltaPagina;
   end
  else
   begin
    wVal := DMOracle.BuscaNome('SELECT DESC_LPT_RECIBO FROM TB_FILIAL','COD_FILIAL = ' + IntToStr(wCodFilial));
    if wVal = 'LPT1' then
      imp.AbreImpressora;
    if wVal = 'LPT2' then
      imp.AbreImpressora_Lpt2;
    if wVal = 'LPT3' then
      imp.AbreImpressora_Lpt3;
    if wval = 'COM2' then
      imp.AbreImpressora_Com2;

    Imp.ConfiguraImpressora('CONDENSADO_OFF','SEXTOS',3);

    Imp.SaltaPagina;
    Recibo40Colunas(wNome, wParcela, wVencto,
      wDtPagto, wValorParcela, wJuros, wDesconto, wcodFilial, wDescFilial, wObservacao, wDescEndereco, wDescCidade);
   end;
   Imp.ConfiguraImpressora('CONDENSADO_OFF','SEXTOS',66);
   Imp.FechaImpressora;  // Finaliza os serviços de Impressao
end;

Procedure TFRecibo_Dos.Recibo40Colunas(wNome,wParcela : String; wVencto, wDtPagto : TDateTime; wValorParcela,wJuros,wDesconto:Real; wcodFilial : integer; wDescFilial, wObservacao, wDescEndereco, wDescCidade : string);
var wEndereco, wCidade : string;
begin
  DMFilial.QFilial.close;
  DMFilial.QFilial.SetVariable('PK', wcodFilial);
  DMFilial.QFilial.open;

  wEndereco := wDescEndereco;
  wCidade := wDescCidade;

  wObservacao := BibContasReceber.ImpressaoReciboPagto(DMParamSistema.QParamSistemaCOD_EMPRESA.Value); //Vanessa 13/07/2015

  Imp.WriteXY(0,1,Copy(DMFilial.QFilialDESC_FILIAL.Value,1,40));  //Era a posição (0,7)e continuei modificando a sequencia de 1 em 1 até o 20. Vanessa 25/10/2013
  Imp.WriteXY(0,2,Copy(DMFilial.QFilialDESC_ENDERECO.Value,1,40));
  Imp.WriteXY(0,3,Copy(DMFilial.QFilialDESC_TELEFONE.Value,1,40));
  Imp.WriteXY(0,4,'RECIBO DE PAGAMENTO');
  Imp.WriteXY(0,5,'----------------------------------------');
  Imp.WriteXY(0,6,DateToStr(wDtPagto) + '      N. Tit.:  ' + wParcela);
  Imp.WriteXY(0,7,'----------------------------------------');
  Imp.WriteXY(0,8,'CLI.:' + copy(wNome, 1, 35));
  Imp.WriteXY(0,9,'END.:' + copy(wEndereco,1,35));
  Imp.WriteXY(0,10,copy(wCidade,1,40));
  Imp.WriteXY(0,11,'----------------------------------------');
  Imp.WriteXY(0,12,'  N. Tit...:      ' + wParcela);
  Imp.WriteXY(0,13,'  Dt. Venc.: ' + DateToStr(wVencto));
  Imp.WriteXY(0,14,'  Dt. Pgto.: ' + DateToStr(wDtPagto));
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'RADIO' then
    Imp.WriteXY(0,15,'  Vlr Parc.: ' + Bib.NumToTexto(wValorParcela ,2,10))
  else
    Imp.WriteXY(0,15,'  Vlr Parc.: ' + Bib.NumToTexto(wValorParcela + wDesconto,2,10));
  Imp.WriteXY(0,16,'  Juros....: ' + Bib.NumToTexto(wJuros,2,10));
  Imp.WriteXY(0,17,'  Desconto.: ' + Bib.NumToTexto(wDesconto,2,10));
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'RADIO' then
    Imp.WriteXY(0,18,'  Total....: ' + Bib.NumToTexto(wValorParcela + wJuros - Wdesconto,2,10))
  else
    Imp.WriteXY(0,18,'  Total....: ' + Bib.NumToTexto(wValorParcela + wJuros,2,10));
  Imp.WriteXY(0,19,'----------------------------------------');
  Imp.WriteXY(0,20,'Obs: ' + wObservacao);
  Imp.WriteXY(0,21,'----------------------------------------');
  Imp.WriteXY(0,22,' '); //Era (0,33) - Vanessa 25/10/2013
End;

procedure TFRecibo_Dos.ReciboVoltaTitulo40Colunas(wNome, wParcela, wnumTitulo: String;
  wVencto, wDtPagto: TDateTime; wValorTitulo, wValorMovimento, wSaldo: Real;
  wcodFilial, wCodCadastro: integer; wDescFilial: string);
var wVal, wEndereco, wCidade : string;
begin
  // Impressão de Recibo - Matricial - Criado por Djeison A. Selzlein - 20/08/2013
  if Imp = Nil Then
     Imp := TImp.Create;
  wVal := DMOracle.BuscaNome('SELECT DESC_LPT_RECIBO FROM TB_FILIAL','COD_FILIAL = ' + IntToStr(wCodFilial));
  if wVal = 'LPT1' then
    imp.AbreImpressora;
  if wVal = 'LPT2' then
    imp.AbreImpressora_Lpt2;
  if wVal = 'LPT3' then
    imp.AbreImpressora_Lpt3;
  if wval = 'COM2' then
    imp.AbreImpressora_Com2;

  Imp.ConfiguraImpressora('CONDENSADO_OFF','SEXTOS',3);

  DMFilial.QFilial.close;
  DMFilial.QFilial.SetVariable('PK', wcodFilial);
  DMFilial.QFilial.open;

  wEndereco := DMOracle.BuscaNome('SELECT DESC_ENDERECO FROM TB_CADASTRO','COD_CADASTRO = ' +
      IntToStr(wCodCadastro));
  wCidade   := DMOracle.BuscaNome('SELECT DESC_CIDADE || '' - '' || COD_ESTADO FROM TB_CADASTRO',
      'COD_CADASTRO = ' + IntToStr(wCodCadastro));

  Imp.WriteXY(0,7,Copy(DMFilial.QFilialDESC_FILIAL.Value,1,40));
  Imp.WriteXY(0,8,Copy(DMFilial.QFilialDESC_ENDERECO.Value,1,40));
  Imp.WriteXY(0,9,Copy(DMFilial.QFilialDESC_TELEFONE.Value,1,40));
  Imp.WriteXY(0,10,'RECIBO DE VOLTA DE BAIXA');
  Imp.WriteXY(0,11,'----------------------------------------');
  Imp.WriteXY(0,12,DateToStr(wDtPagto) + '    N. Tit.:  '+ wNumTitulo + '/' + wParcela);
  Imp.WriteXY(0,13,'----------------------------------------');
  Imp.WriteXY(0,14,'CLI.:' + copy(wNome, 1, 35));
  Imp.WriteXY(0,15,'END.:' + copy(wEndereco,1,35));
  Imp.WriteXY(0,16,copy(wCidade,1,40));
  Imp.WriteXY(0,17,'----------------------------------------');
  Imp.WriteXY(0,18,'  Num. Titulo.: ' + wNumTitulo+'/'+wParcela);
  Imp.WriteXY(0,19,'  Dt. Venc....: ' + DateToStr(wVencto));
  Imp.WriteXY(0,20,'  Dt. Pgto....: ' + DateToStr(wDtPagto));
  Imp.WriteXY(0,21,'  Vl.Original.: ' + Bib.NumToTexto(wValorTitulo,2,10));
  Imp.WriteXY(0,22,'  Vl.Volta....: ' + Bib.NumToTexto(wValorMovimento,2,10));
  Imp.WriteXY(0,23,'  Saldo Titulo: ' + Bib.NumToTexto(wSaldo,2,10));
  Imp.WriteXY(0,24,'----------------------------------------');
  Imp.WriteXY(0,32,' ');
  Imp.ConfiguraImpressora('CONDENSADO_OFF','SEXTOS',66);
  Imp.FechaImpressora;  // Finaliza os serviços de Impressao
end;

Procedure TFRecibo_Dos.Recibo_Feira(wNome,wParcela : String; wVencto, wDtPagto : TDateTime; wValorParcela,wJuros,wDesconto:Real);
begin
  Imp.WriteXY(0.3,6,Copy(wNome,1,33));
  Imp.WriteXY(11.2,6,Copy(wNome,1,33));
  Imp.WriteXY(0.3,8,wParcela);
  Imp.WriteXY(3.5,8,DateToStr(wVencto));
  Imp.WriteXY(7,8,DateToStr(wDtPagto));
  Imp.WriteXY(11.1,8,wParcela);
  Imp.WriteXY(14.1,8,DateToStr(wVencto));
  Imp.WriteXY(17.5,8,DateToStr(wDtPagto));
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
