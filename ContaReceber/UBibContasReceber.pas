unit UBibContasReceber;

interface
  uses
    SysUtils;

  type TBibContasReceber = Class

  private
  function IndiceComissaoGolden: double;
  public

  function ImpressaoReciboPagto(wCodEmpresa : String) : String;
  function IndiceComissao(pCodEmpresa: string; pIndice: double): double;
  function Mod11CresolNossoNumero(pCarteira, pNossoNumero: string): string;  {Incluido por Cleber - 14/08/2019}
  procedure ImprimeDuplicataRetifoz(pNumTitulo: integer); //INCLUÍDO POR CLEBER - 18/12/2020

  end;

var
  BibContasReceber: TBibContasReceber;  

implementation

uses UContasReceber_cl, UBiblioteca, DB;


{ TBibContasReceber }

function TBibContasReceber.ImpressaoReciboPagto(
  wCodEmpresa: String): String;
begin
  if (wCodEmpresa = 'RADIO') then
    result := ''; //Marcos da Radiolandia não quer que apareça a Obs. na impressao. Vanessa 13/07/2015
end;

function TBibContasReceber.IndiceComissao(pCodEmpresa: string;
  pIndice: double): double;
begin
  result := pIndice;
  if pCodEmpresa = 'GOLDEN' then
    result := IndiceComissaoGolden;
end;

function TBibContasReceber.IndiceComissaoGolden: double;
begin
  result := 1;
end;


{Início das validações de boletos}
{Incluido por Cleber - 14/08/2019}
{Passar carteira com 2 dígitos(09 padrão no momento), nossonúmero(11 digitos) e base (valor máximo que deve
chegar o multiplicador)}
function TBibContasReceber.Mod11CresolNossoNumero(pCarteira, pNossoNumero: string): string;
var
  wSoma, wContador, wPeso: Integer;
  wValor: String;
begin
  wValor := pCarteira + pNossoNumero; //passa a carteira e nosso número para a váriavel
  wSoma := 0;  //inicializa soma
  wPeso := 2;  //valor inicial do multiplicador - reinicia a cada ciclo

  for wContador := Length(wValor) downto 1 do
  begin
    wSoma:= wSoma + (StrToInt(wValor[wContador]) * wPeso);    //somatório das multiplicações no acumulador

    if wPeso < 7 then     //menor que 7 incrementa
      wPeso := wPeso + 1
    else                  //igual retorna para 2
      wPeso := 2;
  end;

  if (wSoma mod 11) = 1 then
    Result := 'P'   //se 1 retorna p
  else if (wSoma mod 11) = 0 then
    Result := '0'   // se 0 retorna 0
  else
    Result := IntToStr(11 - (wSoma mod 11));//retorna a diferença

end;

procedure TBibContasReceber.ImprimeDuplicataRetifoz(pNumTitulo: integer);
var wCont : integer;
 wCol : Double;
begin
  if Imp = Nil Then
      Imp := TImp.Create;

  Imp.AbreImpressora;//----------abre impressora
  Imp.ConfiguraImpressora('CONDENSADO_OFF','SEXTOS',48);//-----configurar pagina

  with DMContasReceber do
  begin

    QRTituloReparcelamentoEmissao.Close;
    QRTituloReparcelamentoEmissao.SetVariable('NUM_TITULO', pNumTitulo);
    QRTituloReparcelamentoEmissao.Open;
    sleep(100);
    QRTituloReparcelamentoEmissao.First;

    while not QRTituloReparcelamentoEmissao.eof do
    begin
      wCont:=1;
      wCol := 0;

      QRTitulosReparcelamento.Close;
      QRTitulosReparcelamento.SetVariable('NUM_TITULO', pNumTitulo);
      QRTitulosReparcelamento.Open;
      wCol := 0;

      while not QRTitulosReparcelamento.Eof do
      begin

        if (QRTitulosReparcelamento.RecNo mod 2) = 0 then
          wCol := 10
        else
          wCol := 0;

        Imp.WriteXY(1+wCol,wCont, QRTitulosReparcelamentoDT_EMISSAO.Text);
        Imp.WriteXY(4+wCol,wCont, QRTitulosReparcelamentoTITULO_ANTERIOR.Text);
        Imp.WriteXY(6.5+wCol,wCont, FormatFloat('#,##0.00', QRTitulosReparcelamentoTOTAL.value));

        if (QRTitulosReparcelamento.RecNo mod 2) = 0 then
          Inc(wCont);


        QRTitulosReparcelamento.Next;
      end;

      wCont := wCont + (11 - wCont);


      Imp.WriteXY(1,wCont, QRTituloReparcelamentoEmissaoDESC_FILIAL.Text);
      Inc(wCont);
      Imp.WriteXY(1,wCont, QRTituloReparcelamentoEmissaoDESC_ENDERECO.Text);
      Inc(wCont);
      Imp.WriteXY(1,wCont, QRTituloReparcelamentoEmissaoDESC_CIDADE.Text);
      Imp.WriteXY(4,wCont, ' - ' + QRTituloReparcelamentoEmissaoCOD_ESTADO.Text);
      Inc(wCont);
      Imp.WriteXY(1,wCont, QRTituloReparcelamentoEmissaoDESC_CEP.Text);
      Inc(wCont);
      Imp.WriteXY(1,wCont, QRTituloReparcelamentoEmissaoNUM_CGC.Text);
      Inc(wCont);
      Imp.WriteXY(1,wCont, QRTituloReparcelamentoEmissaoDESC_INSCRICAO.Text);
      Inc(wCont);
      Imp.WriteXY(1,wCont, QRTituloReparcelamentoEmissaoDESC_TELEFONE.Text);
      Imp.WriteXY(12,wCont, 'DATA DE EMISSAO: ' + QRTituloReparcelamentoEmissaoNOVA_EMISSSAO.Text);
      Inc(wCont, 6);

      Imp.WriteXY(3.5,wCont, QRTituloReparcelamentoEmissaoNUM_TITULO.Text);
      Imp.WriteXY(8.5,wCont, QRTituloReparcelamentoEmissaoNUM_TITULO.Text + '/' + DMContasReceber.QRTituloReparcelamentoEmissaoNUM_PARCELA.Text);
      Imp.WriteXY(11,wCont, FormatFloat('#,##0.00', QRTituloReparcelamentoEmissaoNOVO_VALOR.value));
      Imp.WriteXY(14,wCont, QRTituloReparcelamentoEmissaoDT_VENCIMENTO.Text);
      Inc(wCont, 6);

      Imp.WriteXY(5.5,wCont, QRTituloReparcelamentoEmissaoNOME.Text);
      Imp.WriteXY(16,wCont, QRTituloReparcelamentoEmissaoCOD_CADASTRO.Text);
      Inc(wCont);
      Imp.WriteXY(5.5,wCont, QRTituloReparcelamentoEmissaoCADASTRO_DESC_ENDERECO.Text);
      Imp.WriteXY(16,wCont, QRTituloReparcelamentoEmissaoCADASTRO_DESC_CEP.Text);
      Inc(wCont);
      Imp.WriteXY(5.5,wCont, QRTituloReparcelamentoEmissaoCADASTRO_DESC_CIDADE.Text);
      Imp.WriteXY(16,wCont, QRTituloReparcelamentoEmissaoCADASTRO_COD_ESTADO.Text);
      Inc(wCont);
      Imp.WriteXY(5.5,wCont, QRTituloReparcelamentoEmissaoCADASTRO_DESC_CIDADE.Text);
      Inc(wCont);
      Imp.WriteXY(5.5,wCont, QRTituloReparcelamentoEmissaoNUM_CGC_CPF.Text);
      Imp.WriteXY(15,wCont, QRTituloReparcelamentoEmissaoNUM_INSCRICAO.Text);

      Inc(wCont,2);
      Imp.WriteXY(5.5 ,wCont,Copy(Bib.extenso(QRTituloReparcelamentoEmissaoNOVO_VALOR.Value, 'REAL'), 1, 50));
      Inc(wCont);
      Imp.WriteXY(5.5 ,wCont,Copy(Bib.extenso(QRTituloReparcelamentoEmissaoNOVO_VALOR.Value, 'REAL'), 51,50));
      Inc(wCont);
      Imp.WriteXY(5.5 ,wCont,Copy(Bib.extenso(QRTituloReparcelamentoEmissaoNOVO_VALOR.Value, 'REAL'), 101,50));

      QRTituloReparcelamentoEmissao.Next;
      Imp.SaltaPagina;
    end;
  Imp.FechaImpressora;  // Finaliza os serviços de Impressao

  end;

end;

end.

