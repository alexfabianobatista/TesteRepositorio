unit TefUtils;

interface

uses
  Windows, Messages, Dialogs, StdCtrls, SysUtils, Classes, Forms, Buttons, Controls;

type
  TTefUtils = class
  private
  protected

  public
    class procedure AnalisaRetornoTEF(retorno: integer);
    class function ImprimeTransacaoTEF(cFormaPGTO, cTipo: String; cConteudo: TStringList): Boolean; overload;
    class function ImprimeTransacaoTEF(cImpressora: String; cConteudo: TStringList): Boolean; overload;
    class function ImprimeRelatorioGerencial(cConteudo: TStringList): Boolean;
    class Procedure Analisa_iRetorno(iRetorno: Integer);
    class function Retorno_Impressora: boolean;
    class procedure getDataHoraImpressora(var data: string; var hora: string);
  end;
//Funções da CliSiTef. 
function ConfiguraIntSiTefInterativo (pEnderecoIP: PChar;pCodigoLoja: PChar;
           pNumeroTerminal: PChar;ConfiguraResultado: smallint): integer; far; stdcall; external 'CliSiTef32I.dll';

function ConfiguraIntSiTefInterativoEx (pEnderecoIP: PChar;pCodigoLoja: PChar;
           pNumeroTerminal: PChar;ConfiguraResultado: smallint; pParametrosAdicionais:PChar): integer; far; stdcall; external 'CliSiTef32I.dll';

function IniciaFuncaoSiTefInterativo (Modalidade: integer;pValor: PChar;pNumeroCuponFiscal: PChar; pDataFiscal: PChar;pHorario: PChar;
          pOperador: PChar; pRestricoes: PChar): integer; far; stdcall; external 'CliSiTef32I.dll';

procedure FinalizaTransacaoSiTefInterativo (smallint: Word; pNumeroCuponFiscal: PChar;
            pDataFiscal: PChar;pHorario: PChar); far; stdcall; external 'CliSiTef32I.dll';

function ContinuaFuncaoSiTefInterativo (
           var ProximoComando: Integer;
           var TipoCampo: Integer;
           var TamanhoMinimo: smallint;
           var TamanhoMaximo: smallint;
           pBuffer: PChar;
           TamMaxBuffer: Integer;
           ContinuaNavegacao: Integer): integer; far; stdcall; external 'CliSiTef32I.dll';
function ObtemQuantidadeTransacoesPendentes(DataFiscal:PChar; CuponFiscal: PChar): Integer; far; stdcall; external 'CliSiTef32I.dll';
function LeCartaoDiretoSeguro (
            var Mensagem: String;
            var TipoCampoTrilha1: String;
            var Trilha1: String;
            var TipoCampoTrilha2: String;
            var Trilha2: String;
            Timeout: Smallint): Integer; far; stdcall; external 'CliSiTef32I.dll';
function LeCartaoSeguro (var Mensagem: String): Integer; far; stdcall; external 'CliSiTef32I.dll';
function VerificaPresencaPinPad(): Integer; far; stdcall; external 'CliSiTef32I.dll';
function EscreveMensagemPermanentePinPad(mensagem:PChar): integer; far; stdcall; external 'CliSiTef32I.dll';
function ObtemVersao (pClisitef: PChar; pClisitefi: PChar): integer; far; stdcall; external 'CliSiTef32I.dll';

// Funções utilizadas para a impressão do comprovante TEF
function Bematech_FI_AbreComprovanteNaoFiscalVinculado( FormaPagamento: String; Valor: String; NumeroCupom: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_UsaComprovanteNaoFiscalVinculado( Texto: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_FechaComprovanteNaoFiscalVinculado: Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_RelatorioGerencialTEF( Texto: String ): Integer; StdCall; External 'BEMAFI32.DLL' Name 'Bematech_FI_RelatorioGerencialTEF';
function Bematech_FI_FechaRelatorioGerencial: Integer; StdCall; External 'BEMAFI32.DLL' Name 'Bematech_FI_FechaRelatorioGerencial';
function Bematech_FI_HabilitaDesabilitaRetornoEstendidoMFD(FlagRetorno:string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_RetornoImpressoraMFD( Var ACK: Integer; Var ST1: Integer; Var ST2: Integer; Var ST3: Integer ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_EstornoNaoFiscalVinculadoMFD(CGC, Nome, Endereco : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_AcionaGuilhotinaMFD( iCorte: Integer ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ReimpressaoNaoFiscalVinculadoMFD: Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_DataHoraImpressora( Data: String; Hora: String ): Integer; StdCall; External 'BEMAFI32.DLL';
const
  FINALIZA_CONFIRMANDO: Integer = 1; // Finaliza confirmando a transação TEF
  FINALIZA_CANCELANDO: Integer = 0; // Finaliza cancelando a transação TEF

implementation

uses UBiblioteca, UTEF;

class procedure TTefUtils.AnalisaRetornoTEF(retorno: integer);
begin
  Case retorno of
    //1: MessageDlg('Endereço IP inválido ou não resolvido', mtWarning, [mbOK], 0);
    1: Application.MessageBox( 'Endereço IP inválido ou não resolvido', 'Atenção',
                                  MB_IconInformation + MB_OK);
    2: Application.MessageBox( 'Código da loja inválido', 'Atenção',
                                  MB_IconInformation + MB_OK);
    3: Application.MessageBox( 'Código de terminal inválido', 'Atenção',
                                  MB_IconInformation + MB_OK);
    6: Application.MessageBox( 'Erro na inicialização do Tcp/Ip', 'Atenção',
                                  MB_IconInformation + MB_OK);
    7: Application.MessageBox( 'Falta de memória', 'Atenção',
                                  MB_IconInformation + MB_OK);
    8: Application.MessageBox( 'Não encontrou a CliSiTef ou ela está com problemas', 'Atenção',
                                  MB_IconInformation + MB_OK);
    10: Application.MessageBox( 'Erro de acesso na pasta CliSiTef (Possível falta de permissão para escrita', 'Atenção',
                                  MB_IconInformation + MB_OK);
    -1: Application.MessageBox( 'Módulo não inicializado', 'Atenção',
                                  MB_IconInformation + MB_OK);
    -2: Application.MessageBox( 'Operação cancelada pelo operador', 'Atenção',
                                  MB_IconInformation + MB_OK);
    -3: Application.MessageBox( 'Fornecida uma modalidade inválida', 'Atenção',
                                  MB_IconInformation + MB_OK);
    -4: Application.MessageBox( 'Falta de memória para rodar a função', 'Atenção',
                                  MB_IconInformation + MB_OK);
    -5: Application.MessageBox( 'Sem comunicação com o SiTef', 'Atenção',
                                  MB_IconInformation + MB_OK);
    -6: Application.MessageBox( 'Operação cancelada pelo usuário', 'Atenção',
                                  MB_IconInformation + MB_OK);
    -40: Application.MessageBox( 'Transação negada pelo SiTef', 'Atenção',
                                  MB_IconInformation + MB_OK);
    -43: Application.MessageBox( 'Falha no Pinpad', 'Atenção',
                                  MB_IconInformation + MB_OK);
    -50: Application.MessageBox( 'Transação não segura', 'Atenção',
                                  MB_IconInformation + MB_OK);
    -100: Application.MessageBox( 'Erro interno do módulo', 'Atenção',
                                  MB_IconInformation + MB_OK);
    else
    begin
      if retorno > 0 then
        Application.MessageBox( 'Negada pelo autorizador', 'Atenção',
                                  MB_IconInformation + MB_OK);
      if retorno < 0 then
        Application.MessageBox( 'Erros detectados internamente pela rotina', 'Atenção',
                                  MB_IconInformation + MB_OK);
    end;
  end;
end;

class function TTefUtils.ImprimeRelatorioGerencial(
  cConteudo: TStringList): Boolean;
var
  iRetorno, i, j, wCorte: Integer;
  wLinha : String;
  wComprovante : TStringList;
  ErroImpressao: boolean;
begin
  Bematech_FI_FechaComprovanteNaoFiscalVinculado;
  Bematech_FI_FechaRelatorioGerencial;
  wCorte := 0;
  ErroImpressao := false;
  for i:= 0 to cConteudo.Count-1 do
  begin
    wComprovante := TStringList.Create;
    wComprovante := bib.QuebraStringDelimitador(cConteudo.Strings[i], #10);
    for j := 0 to wComprovante.Count-1 do
    begin
      wLinha := wComprovante.Strings[j];
      iRetorno := Bematech_FI_RelatorioGerencialTEF(pchar(wLinha));
      if (Retorno_Impressora) or (iRetorno <> 1) then
      begin
        ErroImpressao := true;
        Break;
      end;
    end;
    if ErroImpressao then
      Break;

    if i < cConteudo.Count-1 then  //nao deve cortar após o ultimo comprovante
    begin
      wLinha := #10 + #10 + #10;
      iRetorno := Bematech_FI_RelatorioGerencialTEF(pchar(wLinha));
      if (Retorno_Impressora) or (iRetorno <> 1) then
      begin
        ErroImpressao := true;
        Break;
      end;
    end;
  end;
  if ErroImpressao then
  begin
    if (MessageDlg('Impressora não responde. Deseja tentar novamente?(Sim/Não)', mtError, [mbYes, mbNo], 0) = mrYes) then
      result := ImprimeRelatorioGerencial(cConteudo)
    else
      result := false;
  end
  else
  begin
    iRetorno := Bematech_FI_FechaRelatorioGerencial;
    ErroImpressao := Retorno_Impressora or (iRetorno <> 1);
    if ErroImpressao then
    begin
      if (MessageDlg('Impressora não responde. Deseja tentar novamente?(Sim/Não)', mtError, [mbYes, mbNo], 0) = mrYes) then
        result := ImprimeRelatorioGerencial(cConteudo)
      else
        result := false;
    end
    else
      result := true;
  end;
end;

//////////////////////////////////////////////////////////
// Função: ImprimeTransacao
// Objetivo: Realiza a impressão da Transação TEF
// Parâmetros: string para a Forma de Pagamento
// string para a Valor da Forma de Pagamento
// string para o Número do Cupom Fiscal (COO)
// TDateTime para identificar o número da transação
// Retorno: True para OK ou False para não OK //////////////////////////////////////////////////////////
class function TTefUtils.ImprimeTransacaoTEF(cFormaPGTO, cTipo: String; cConteudo: TStringList): Boolean;
  var wLinha:string;
    iRetorno,wCorte, wAux, i, j: Integer;
    wComprovante: TStringList;
    ErroImpressao: boolean;
begin
  wCorte := 0;
  ErroImpressao := false;
  //abre o comprovante
  if cTipo = 'PAGAMENTO' then
    iRetorno := Bematech_FI_AbreComprovanteNaoFiscalVinculado(pchar(cFormaPGTO),pchar(''),pchar(''));

  ErroImpressao := Retorno_Impressora or (iRetorno <> 1);

  if not ErroImpressao  then
    for i:= 0 to cConteudo.Count-1 do
    begin
      wComprovante := bib.QuebraStringDelimitador(cConteudo.Strings[i], #10);
      for j := 0 to wComprovante.Count-1 do
      begin
        wLinha := wComprovante.Strings[j];
        iRetorno := Bematech_FI_UsaComprovanteNaoFiscalVinculado(pchar(wLinha));

        if (Retorno_Impressora) or (iRetorno <> 1) then
        begin
          ErroImpressao := true;
          Break;
        end;
      end;
      if ErroImpressao then
        Break;

      if i < cConteudo.Count-1 then  //nao deve cortar após o ultimo comprovante
      begin
        wLinha := #10 + #10 + #10;
        iRetorno := Bematech_FI_UsaComprovanteNaoFiscalVinculado(pchar(wLinha));
        if Retorno_Impressora or (iRetorno <> 1)  then
        begin
          ErroImpressao := true;
          Break;
        end;
      end;
    end;
    if ErroImpressao then
    begin
      if (MessageDlg('Impressora não responde. Deseja tentar novamente?(Sim/Não)', mtError, [mbYes, mbNo], 0) = mrYes) then
        result := ImprimeRelatorioGerencial(cConteudo)
      else
        result := false;
    end
    else
    begin
      iRetorno := Bematech_FI_FechaComprovanteNaoFiscalVinculado;
      ErroImpressao := Retorno_Impressora or (iRetorno <> 1);
      if ErroImpressao then
      begin
        if (MessageDlg('Impressora não responde. Deseja tentar novamente?(Sim/Não)', mtError, [mbYes, mbNo], 0) = mrYes) then
          result := ImprimeRelatorioGerencial(cConteudo)
        else
          result := false;
      end
      else
        result := true;
    end;

end;
class function TTefUtils.ImprimeTransacaoTEF(cImpressora: String; cConteudo: TStringList): Boolean;
  var i: Integer;
    wComprovante: TStringList;
begin
  for i:= 0 to cConteudo.Count-1 do
  begin
    Application.ProcessMessages;
    if not Bib.ImprimeImpressoraGenerica(cImpressora, pchar(cConteudo.Strings[i]),'Franklin Gothic Medium Cond',10 ) then
    begin
      if (MessageDlg('Impressora não responde. Deseja tentar novamente?(Sim/Não)', mtError, [mbYes, mbNo], 0) = mrYes) then
        result := ImprimeTransacaoTEF(cImpressora, cConteudo)
      else
        result := false;
    end;
    Sleep(500);
    Application.ProcessMessages;
  end;
end;



class Procedure TTefUtils.Analisa_iRetorno(iRetorno: Integer);
Begin
    if iRetorno = 0 then
       Application.MessageBox( 'Erro de Comunicação !', 'Erro',
                                MB_IconError + MB_OK);

    If iRetorno = -1 Then
       Application.MessageBox( 'Erro de Execução na Função. Verifique!', 'Erro',
                                MB_IconError + MB_OK);

    if iRetorno = -2  then
       Application.MessageBox( 'Parâmetro Inválido !', 'Erro',
                                MB_IconError + MB_OK);

    if iRetorno = -3  then
       Application.MessageBox( 'Alíquota não programada !', 'Atenção',
                                MB_IconInformation + MB_OK);

    If iRetorno = -4 Then
       Application.MessageBox( 'Arquivo BemaFI32.INI não encontrado. Verifique!', 'Atenção',
                                MB_IconInformation + MB_OK);

    If iRetorno = -5 Then
       Application.MessageBox( 'Erro ao Abrir a Porta de Comunicação', 'Erro',
                                MB_IconError + MB_OK);

    If iRetorno = -6 Then
       Application.MessageBox( 'Impressora Desligada ou Desconectada', 'Atenção',
                                MB_IconInformation + MB_OK);

    If iRetorno = -7 Then
       Application.MessageBox( 'Banco Não Cadastrado no Arquivo BemaFI32.ini', 'Atenção',
                                MB_IconInformation + MB_OK);

    If iRetorno = -8 Then
       Application.MessageBox( 'Erro ao Criar ou Gravar no Arquivo Retorno.txt ou Status.txt', 'Erro',
                                MB_IconError + MB_OK);

    if iRetorno = -18 then
       Application.MessageBox( 'Não foi possível abrir arquivo INTPOS.001 !', 'Atenção',
                                MB_IconInformation + MB_OK);

    if iRetorno = -19 then
       Application.MessageBox( 'Parâmetro diferentes !', 'Atenção',
                                MB_IconInformation + MB_OK);

    if iRetorno = -20 then
       Application.MessageBox( 'Transação cancelada pelo Operador !', 'Atenção',
                                MB_IconInformation + MB_OK);

    if iRetorno = -21 then
       Application.MessageBox( 'A Transação não foi aprovada !', 'Atenção',
                                MB_IconInformation + MB_OK);

    if iRetorno = -22 then
       Application.MessageBox( 'Não foi possível terminal a Impressão !', 'Atenção',
                                MB_IconInformation + MB_OK);

    if iRetorno = -23 then
       Application.MessageBox( 'Não foi possível terminal a Operação !', 'Atenção',
                                MB_IconInformation + MB_OK);

    if iRetorno = -24 then
       Application.MessageBox( 'Forma de pagamento não programada.', 'Atenção',
                                MB_IconInformation + MB_OK);

    if iRetorno = -25 then
       Application.MessageBox( 'Totalizador não fiscal não programado.', 'Atenção',
                                MB_IconInformation + MB_OK);

    if iRetorno = -26 then
       Application.MessageBox( 'Transação já Efetuada !', 'Atenção',
                                MB_IconInformation + MB_OK);

    if iRetorno = -28 then
       Application.MessageBox( 'Não há Informações para serem Impressas !', 'Atenção',
                                MB_IconInformation + MB_OK);

end;

class function TTefUtils.Retorno_Impressora: boolean;
  var
    iACK, iST1, iST2, iST3:Integer;
Begin
    iACK := 0; iST1 := 0; iST2 := 0; iST3 := 0;
    Bematech_FI_RetornoImpressoraMFD(iACK, iST1, iST2, iST3);

  result := (iST1 = 128) or (iST3 <> 0);

End;


class procedure TTefUtils.getDataHoraImpressora(var data, hora: string);
var
  wData: String;
  i:integer;
begin
  for i := 1 to 6 do wData := wData + ' ';
  for i := 1 to 6 do hora := hora + ' ';
  Analisa_iRetorno(Bematech_FI_DataHoraImpressora(wdata, hora));
  data := '20' + copy(wdata, 5, 2) + copy(wdata, 3, 2) + copy(wdata, 1, 2);
end;

end.
