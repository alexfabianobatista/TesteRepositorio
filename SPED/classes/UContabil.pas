unit UContabil;

interface

uses
  Controls, SysUtils, Windows, Forms, UThreadLocal, OraTeste, UBiblioteca,
  Classes, ActiveX, ComObj, ComCtrls,

  Arquivo,
  Registro0000, Registro0001, Registro0007, Registro0020, Registro0150,
  Registro0180, Registro0990,
  RegistroI001, RegistroI010, RegistroI012, RegistroI015, RegistroI020,
  RegistroI030, RegistroI050, RegistroI051, RegistroI052, RegistroI075,
  RegistroI100, RegistroI150, RegistroI155, RegistroI200, RegistroI250,
  RegistroI300, RegistroI310, RegistroI350, RegistroI355, RegistroI500,
  RegistroI510, RegistroI550, RegistroI555, RegistroI990,
  RegistroJ001, RegistroJ005, RegistroJ100, RegistroJ150, RegistroJ800,
  RegistroJ900, RegistroJ930, RegistroJ990,
  Registro9001, Registro9900, Registro9990, Registro9999;

type
  TContabil = class
  private
    wFilial, wFinalidade: Integer;
    wDataIni, wDataFin: TDate;
    wFiliais: TStrings;
    arquivo: TArquivo;
    query: TOracleDataSet1;
    listaI250: array of TRegistroI250;
    totalI250: Double;
    wArquivosRTF: TStrings;
    wTrimestre: integer;
    isTrimestral: boolean;
    dtIniTrimestre, dtFinTrimestre: TDateTime;
    wHashLivroFiscal: String;

    procedure Registro0000;
    procedure Registro0001;
    procedure Registro0007;
    procedure Registro0020;
    procedure Registro0150;
    procedure Registro0180(codCadastro: Integer);
    procedure Registro0990(QtdLinhas: Double);

    procedure RegistroI001;
    procedure RegistroI010;
    procedure RegistroI012;
    procedure RegistroI015;
    procedure RegistroI020;
    procedure RegistroI030;
    procedure RegistroI050;
    procedure RegistroI051(codPlanoConta: Integer);
    procedure RegistroI052(codPlanoConta: Integer);
    procedure RegistroI075;
    procedure RegistroI100;
    procedure RegistroI150;
    procedure RegistroI155(data: TDate);
    procedure RegistroI200;
    function RegistroI250Teste(pGerarRegistro: Boolean = true): Double;
    procedure RegistroI250;
    //procedure RegistroI250(codLancamentoContabil: Integer);
    procedure RegistroI300;
    procedure RegistroI310(data: TDate);
    procedure RegistroI350;
    procedure RegistroI355(data: TDate);
    procedure RegistroI500;
    procedure RegistroI510;
    procedure RegistroI550;
    procedure RegistroI555;
    procedure RegistroI990(QtdLinhas: Double);

    procedure RegistroJ001;
    procedure RegistroJ005;
    procedure RegistroJ100(ano, mes: Word);
    procedure RegistroJ150(ano, mes: Word);
    procedure RegistroJ800;
    procedure RegistroJ900;
    procedure RegistroJ930;
    procedure RegistroJ990(QtdLinhas: Double);

    procedure Registro9001;
    procedure Registro9990(QtdLinhas: Double);
    procedure Registro9999(QtdLinhas: Double);

    function localizaRegistro(vetor: array of string; registro: string): Integer;
    function recuperaValor(texto: string; posicao: Integer): string;
    function alteraValor(texto: string; posicao: Integer; textoNovo: string): string;
    procedure atualizaTotalizadorEIndicadorBloco;
    procedure Execute;
    procedure geraListaI250;
    procedure Teste;
    function BuscaLancamento(pCodLanctoContabil: Integer): String;
    procedure AdicionaLancamento(pCodLanctoContabil: Integer;
      pTipoLancamentoSped: String; pOperacao: String; pValor: Double);
    procedure GeraDatas;
    procedure CatalogaLanctoEncerramento;
    procedure AdicionaEncerramento(pNumConta: String; pValLancamento: Double;
      pOperacao: String); overload;
    procedure AdicionaEncerramentoTrimestral(pNumConta: String; pValLancamento: Double;
      pOperacao: String; pDataFechamento: TDate); overload;

//    function geraStringFiliais(separador: string = ', '): string;    1
  public
    thread: TThreadLocal;
    procedure Gerar;
    constructor Create(HashLivroFiscalSubst:String; FinalidadeEcd: Integer; DataIni, DataFin: TDate;
      Filiais: TStrings; ArquivosRTF: TStrings; wMatriz: Integer = 1);
  end;

const
  TRIMESTRE_1_MES_INI: integer = 01;
  TRIMESTRE_1_MES_FIM: integer = 03;
  TRIMESTRE_2_MES_INI: integer = 04;
  TRIMESTRE_2_MES_FIM: integer = 06;
  TRIMESTRE_3_MES_INI: integer = 07;
  TRIMESTRE_3_MES_FIM: integer = 09;
  TRIMESTRE_4_MES_INI: integer = 10;
  TRIMESTRE_4_MES_FIM: integer = 12;

implementation

uses UOracle_cl, UBloco0_cl, DB, UBlocoC_cl, UFuncoes,
  Registro, UBlocoI_cl, Dialogs, USped_cl, UBlocoJ_cl, Variants,
  OracleData, DateUtils, UPlanoConta_cl, URDfc, UDRE_cl, Math, UContFisc0_cl;
var wTeste: Variant;
 wPartidaLanctos: TVariantMap;

constructor TContabil.Create(HashLivroFiscalSubst:String; FinalidadeEcd: Integer; DataIni, DataFin: TDate;
 Filiais: TStrings; ArquivosRTF: TStrings; wMatriz: Integer = 1);
begin
  if wMatriz = 0 then
    wFilial := 1
  else
    wFilial := wMatriz;
  wDataIni := DataIni;
  wDataFin := DataFin;
  wFiliais := Filiais;
  wArquivosRTF := ArquivosRTF;

  wFinalidade := FinalidadeEcd;
  wHashLivroFiscal := HashLivroFiscalSubst;

  inherited Create;
//  FreeOnTerminate := True;
  wPartidaLanctos := TVariantMap.Create;
end;

procedure TContabil.Execute;
var
  path: string;
  arq: TextFile;
  arqNovo: TextFile;
  linha: string;
  pathCompleto: string;
  pathCompletoAux: string;
begin
  thread.mostramensagem('Inicializando geração');
  SetLength(listaI250, 0);

  path := ExtractFilePath(Application.ExeName);
  if not DirectoryExists(path + 'SPED') then
    CreateDir(path + 'SPED');
  if not DirectoryExists(path + 'SPED\CONTABIL') then
    CreateDir(path + 'SPED\CONTABIL');   
  pathCompleto := path + 'SPED\CONTABIL\SPED-CONTABIL_gerado_em_' + FormatDateTime('yyyy-MM-dd_hh-mm-ss', Date + Time) + '_competencia_' + FormatDateTime('yyyy-MM-dd', wDataIni) + '_' + FormatDateTime('yyyy-MM-dd', wDataFin) + '_filiais_' + Bib.geraStringFiliais(wFiliais, '-') + '.txt';

  arquivo := TArquivo.Create(pathCompleto);
//  arquivo := TArquivo.Create(path + 'SPED\CONTABIL\SPED-CONTABIL_gerado_em_' + FormatDateTime('yyyy-MM-dd_hh-mm-ss', Date + Time) + '_competencia_' + FormatDateTime('yyyy-MM-dd', wDataIni) + '_' + FormatDateTime('yyyy-MM-dd', wDataFin) + '_filial_' + FormatFloat('00', wFilial) + '.txt');

  Registro0000;
  Registro9999(0);

  thread.mostramensagem('Ajustando totalizadores');
  try
    atualizaTotalizadorEIndicadorBloco;
  except on e: Exception do
    if (MessageDlg(e.Message + #13 + #10 + 'Deseja continuar a geração do arquivo?', mtWarning, [mbYes, mbNo], 0) = mrNo) then
      Exit;
  end;

  thread.mostramensagem('Gerando arquivo texto');
  arquivo.geraArquivo;

  arquivo.Destroy;
  thread.mostramensagem('Arquivo gerado');
end;

procedure TContabil.Gerar;
var
  teste: string;
begin
  try
    Execute;
  except
    on e: Exception do
      thread.avisaErro('Erro na geração do SPED Contábil.' + #13 + #10 + e.Message);
  end;
end;

procedure TContabil.Registro0000;
var reg: TContabil0000;
begin
  query := executaQuery(DmBloco0.QReg000);
//  if Bib.geraStringFiliais(wFiliais) <> '' then
//    query.SetVariable('FILIAIS', Bib.geraStringFiliais(wFiliais))
//  else
  query.SetVariable('FILIAIS', '(' + IntToStr(wFilial) + ')');
  query.open;

//  DmBloco0.QReg000.Close; 
//  DmBloco0.QReg000.SetVariable('COD_FILIAL', wFilial);
//  DmBloco0.QReg000.Open;
  DMContFisc0.QReg010.SetVariable('FILIAIS', '(' + IntToStr(wFilial) + ')');
  DMContFisc0.QReg010.Open;
  isTrimestral := (DMContFisc0.QReg010FORMA_APUR.Value = 'T');
  DMContFisc0.QReg010.Close;

  if query.IsEmpty then begin fechaQuery(query); Exit; end;

  reg := TContabil0000.Create(TObject(Self), arquivo);
  reg.LECD := 'LECD';
  reg.DT_INI := wDataIni;
  reg.DT_FIN := wDataFin;
  reg.NOME := pegaValor(query, 'DESC_FILIAL');
  reg.CNPJ := pegaValor(query, 'NUM_CGC');
  reg.UF := pegaValor(query, 'DESC_SIGLA_ESTADO');
  reg.IE := pegaValor(query, 'DESC_INSCRICAO');
  if SomenteNumeros(pegaValor(query, 'COD_CIDADE_IBGE')) = '' then
    reg.COD_MUN := 0
  else
    reg.COD_MUN := StrToInt(SomenteNumeros(pegaValor(query, 'COD_CIDADE_IBGE')));
  reg.IM := pegaValor(query, 'DESC_INSCRICAO_MUNICIPAL');
  reg.IND_SIT_ESP := '';
  reg.IND_SIT_INI_PER := pegaValor(query, 'IND_SIT_INI_PER');
  reg.IND_NIRE := pegaValor(query, 'IND_NIRE');
  reg.IND_FIN_ESC := wFinalidade;
  reg.COD_HASH_SUB := wHashLivroFiscal;
  reg.IND_GRANDE_PORTE := pegaValor(query, 'IND_GRANDE_PORTE'); 
  reg.TIP_ECD := pegaValor(query, 'TIP_ECD');
  reg.COD_SCP := pegaValor(query, 'COD_SCP');
  reg.IDENT_MF := pegaValor(query, 'IDENT_MF');
  reg.IND_ESC_CONS := pegaValor(query, 'IND_ESC_CONS');
  reg.IND_CENTRALIZADA := pegaValor(query, 'IND_CENTRALIZADA');;
  reg.IND_MUDANC_PC := pegaValor(query, 'IND_MUDANC_PC');;
  reg.grava;
  reg.Free;
  reg := nil;
  fechaQuery(query);

  thread.tela.GProgresso.AddProgress(1);

  Registro0001;
  Registro0990(0);
  RegistroI001;
  RegistroI990(0);
  RegistroJ001;
  RegistroJ990(0);
  Registro9001;
  Registro9990(0);
end;

procedure TContabil.Registro0001;
var reg: TContabil0001;
begin
  reg := TContabil0001.Create(TObject(Self), arquivo);
  reg.IND_DAD := 1;
  reg.grava;
  reg.Free;
  reg := nil;

  Registro0007;
end;

procedure TContabil.Registro0007;
var reg: TRegistro0007;
begin
  query := executaQuery(DmBloco0.QReg007);
  if Bib.geraStringFiliais(wFiliais) <> '' then
    query.SetVariable('FILIAIS', Bib.geraStringFiliais(wFiliais))
  else
    query.SetVariable('FILIAIS', '(SELECT COD_FILIAL FROM TB_FILIAL)');
  query.open;

  if query.IsEmpty then begin fechaQuery(query); Exit; end;

  query.First;
  while not query.Eof do
  begin
    reg := TRegistro0007.Create(TObject(Self), arquivo);
    reg.COD_ENT_REF := pegaValor(query, 'COD_ENTIDADE_CONTABIL');
    reg.COD_INSCR := pegaValor(query, 'DESC_INSCRICAO');
    reg.grava;
    reg.Free;
    reg := nil;

    query.Next;
  end;
  fechaQuery(query);
end;

procedure TContabil.Registro0020;
var reg: TRegistro0020;
begin
//  reg := TRegistro0020.Create(TObject(Self), arquivo);
//  reg.grava;
//  reg.Free;
//  reg := nil;
end;

procedure TContabil.Registro0150;
var reg: TContabil0150;
begin
//  DmBloco0.QReg150.Close;
//  DmBloco0.QReg150.SetVariable('Dt_Inicial',wDataIni);
//  DmBloco0.QReg150.SetVariable('Dt_Final',wDataFin);
//  DmBloco0.QReg150.SetVariable('Cod_Filial',wFilial);
//  DmBloco0.QReg150.Open;
//
//  if DmBloco0.QReg150.IsEmpty then Exit;
//
//  DmBloco0.QReg150.First;
//  while not DmBloco0.QReg150.Eof do
//  Begin
//    reg := TContabil0150.Create(TObject(Self), arquivo);
//    reg.COD_PART := IntToStr(DmBloco0.QReg150COD_CADASTRO.Value);
//    reg.NOME := DmBloco0.QReg150NOME.Value;
//    reg.COD_PAIS := DmBloco0.QReg150COD_PAIS_IBGE.Value;
//    reg.CNPJ := DmBloco0.QReg150DESC_CNPJ.Value;
//    reg.CPF := DmBloco0.QReg150DESC_CPF.Value;
//    reg.NIT := '';
//    reg.UF := DmBloco0.QReg150DESC_SIGLA_ESTADO.Value;
//    reg.IE := DmBloco0.QReg150NUM_INSCRICAO.Value;
//    reg.IE_ST := '';
//    if SomenteNumeros(DmBloco0.QReg150COD_CIDADE_IBGE.Value) = '' then
//      reg.COD_MUN := 0
//    else
//      reg.COD_MUN := StrToInt(SomenteNumeros(DmBloco0.QReg150COD_CIDADE_IBGE.Value));
//    reg.IM := DmBloco0.QReg150DESC_INSCRICAO_MUNICIPAL.Value;
//    reg.SUFRAMA := DmBloco0.QReg150DESC_SUFRAMA.Value;
//    reg.grava;
//  reg.Free;
//  reg := nil;
//
//    Registro0180(DmBloco0.QReg150COD_CADASTRO.Value);
//
//    DmBloco0.QReg150.Next;
//  End;

  Registro0180(0);
end;

procedure TContabil.Registro0180(codCadastro: Integer);
var reg: TRegistro0180;
begin
//  reg := TRegistro0180.Create(TObject(Self), arquivo);
//  reg.grava;
//  reg.Free;
//  reg := nil;
end;

procedure TContabil.Registro0990(QtdLinhas: Double);
var reg: TRegistro0990;
begin
  reg := TRegistro0990.Create(TObject(Self), arquivo);
  reg.QTD_LIN_0 := QtdLinhas;
  reg.grava;
  reg.Free;
  reg := nil;
end;

procedure TContabil.RegistroI001;
var reg: TRegistroI001;
begin
  reg := TRegistroI001.Create(TObject(Self), arquivo);
  reg.IND_DAD := 1;
  reg.grava;
  reg.Free;
  reg := nil;

  RegistroI010;
end;

procedure TContabil.RegistroI010;
var reg: TRegistroI010;
begin
  reg := TRegistroI010.Create(TObject(Self), arquivo);
  reg.IND_ESC := 'G';
  reg.COD_VER_LC := '9.00';
  reg.grava;
  reg.Free;
  reg := nil;

  RegistroI012;
  RegistroI020;
  RegistroI030;
  RegistroI050;
  RegistroI075;
  RegistroI100;
  RegistroI150;
  RegistroI200;
  RegistroI300;
  RegistroI350;
  RegistroI500;
  RegistroI510;
  RegistroI550;
  RegistroI555;
end;

procedure TContabil.RegistroI012;
var reg: TRegistroI012;
begin
//  reg := TRegistroI012.Create(TObject(Self), arquivo);
//  reg.grava;
//  reg.Free;
//  reg := nil;
  RegistroI015;
end;

procedure TContabil.RegistroI015;
var reg: TRegistroI015;
begin
//  reg := TRegistroI015.Create(TObject(Self), arquivo);
//  reg.grava;
//  reg.Free;
//  reg := nil;
end;

procedure TContabil.RegistroI020;
var reg: TRegistroI020;
begin
//  reg := TRegistroI020.Create(TObject(Self), arquivo);
//  reg.grava;
//  reg.Free;
//  reg := nil;
end;

procedure TContabil.RegistroI030;
var reg: TRegistroI030;
begin
  query := executaQuery(DmBlocoI.QReg030);
  if Bib.geraStringFiliais(wFiliais) <> '' then
    query.SetVariable('FILIAIS', Bib.geraStringFiliais(wFiliais))
  else
    query.SetVariable('FILIAIS', '(SELECT COD_FILIAL FROM TB_FILIAL)');
  query.SetVariable('DT_INICIAL_INI', wDataIni);
  query.SetVariable('DT_INICIAL_FIN', wDataFin);

  query.open;

  if query.IsEmpty then begin fechaQuery(query); Exit; end;

  query.First;
//  while not query.Eof do
//  Begin
  reg := TRegistroI030.Create(TObject(Self), arquivo);
  reg.DNRC_ABERT := 'TERMO DE ABERTURA';
  reg.NUM_ORD := Trunc(pegaValor(query, 'NUM_ORDEM'));
  reg.NAT_LIVR := pegaValor(query, 'DESC_NAT_LIVRO');
  reg.QTD_LIN := 0;
  reg.NOME := pegaValor(query, 'DESC_FILIAL');
  reg.NIRE := pegaValor(query, 'NUM_NIRE');
  reg.CNPJ := pegaValor(query, 'NUM_CGC');
  reg.DT_ARQ := pegaValor(query, 'DT_NIRE');
  reg.DT_ARQ_CONV := 0;
  reg.DESC_MUN := pegaValor(query, 'DESC_CIDADE');
  reg.DT_EX_SOCIAL := wDataFin;
  reg.NOME_AUDITOR := '';
  reg.COD_CVM_AUDITOR := '';
  reg.grava;
  reg.Free;
  reg := nil;
  fechaQuery(query);

//    query.Next;
//  End;
end;

procedure TContabil.RegistroI050;
var reg: TRegistroI050;
  super, indConta: string;
begin
  query := executaQuery(DmBlocoI.QReg050, True);

  if query.IsEmpty then begin fechaQuery(query); Exit; end;

  query.First;
  while not query.Eof do
  begin
    reg := TRegistroI050.Create(TObject(Self), arquivo);
    reg.DT_ALT := wDataIni;
    reg.COD_NAT := pegaValor(query, 'DESC_NATUREZA_CONTA');
    if eNulo(query, 'COD_REDUZIDO') then
    begin
      indConta := 'S';
      if pegaValor(query, 'NUM_GRAU') = 1 then
        super := copy(pegaValor(query, 'NUM_PLANO_CONTA'), 1, 1)
      else
        super := copy(pegaValor(query, 'NUM_PLANO_CONTA'), 1, Integer((pegaValor(query, 'NUM_GRAU') - 1) * 2 - 1));
    end
    else
    begin
      indConta := 'A';
      super := copy(pegaValor(query, 'NUM_PLANO_CONTA'), 1, Integer((pegaValor(query, 'NUM_GRAU') - 1) * 2 - 1));
    end;
    reg.IND_CTA := indConta;
    reg.NIVEL := pegaValor(query, 'NUM_GRAU');
    reg.COD_CTA := pegaValor(query, 'NUM_PLANO_CONTA');
    if pegaValor(query, 'NUM_GRAU') <> 1 then
      reg.COD_CTA_SUP := super;
    reg.CTA := pegaValor(query, 'DESC_PLANO_CONTA');
    reg.grava;
    reg.Free;
    reg := nil;

    if indConta = 'A' then
    begin
      // Plano de contas referencial não é obrigatório no ECD
      //RegistroI051(pegaValor(query, 'COD_PLANO_CONTA'));
      RegistroI052(pegaValor(query, 'COD_PLANO_CONTA'));
    end;

    query.Next;
  end;
  fechaQuery(query);
end;

procedure TContabil.RegistroI051(codPlanoConta: Integer);
var reg: TRegistroI051;
  query: TOracleDataSet1;
  numPlanoContaReferencial, codPlanRef: string;
  contaLendo: Integer;
begin
  codPlanRef := '';
  query := executaQuery(DmBlocoI.QReg051);
  query.SetVariable('COD_PLANO_CONTA', codPlanoConta);
  query.open;

  if eNulo(query, 'NUM_PLANO_CONTA_REFERENCIAL') then
  begin
    numPlanoContaReferencial := '';
    codPlanRef := ''
  end
  else
  begin
    numPlanoContaReferencial := pegaValor(query, 'NUM_PLANO_CONTA_REFERENCIAL');
    codPlanRef := pegaValor(query, 'COD_PLAN_REF');
  end;
  contaLendo := codPlanoConta;
  fechaQuery(query);

  while numPlanoContaReferencial = '' do
  begin
    contaLendo := leContaAnterior(contaLendo);

    query := executaQuery(DmBlocoI.QReg051);
    query.SetVariable('COD_PLANO_CONTA', contaLendo);
    query.open;

    if ((not (eNulo(query, 'NUM_PLANO_CONTA_REFERENCIAL'))) and (pegaValor(query, 'NUM_PLANO_CONTA_REFERENCIAL') <> '')) then
      numPlanoContaReferencial := pegaValor(query, 'NUM_PLANO_CONTA_REFERENCIAL');
    if ((query.IsEmpty) or (pegaValor(query, 'NUM_GRAU') = 1)) then
    begin
      fechaQuery(query);
      Break;
    end;
    fechaQuery(query);
  end;

  if numPlanoContaReferencial = '' then Exit;

  reg := TRegistroI051.Create(TObject(Self), arquivo);
  reg.COD_PLAN_REF := codPlanRef;
  reg.COD_CCUS := '';
//  reg.COD_CTA_REF := numPlanoContaReferencial;
  reg.grava;
  reg.Free;
  reg := nil;
end;

procedure TContabil.RegistroI052(codPlanoConta: Integer);
var reg: TRegistroI052;
  query: TOracleDataSet1;
begin
  query := executaQuery(DmBlocoI.QReg052);
  query.SetVariable('COD_PLANO_CONTA', codPlanoConta);
  query.open;

  if query.IsEmpty then begin fechaQuery(query); Exit; end;

  reg := TRegistroI052.Create(TObject(Self), arquivo);
  reg.COD_CCUS := '';
  reg.COD_AGL := pegaValor(query, 'COD_AGLUTINACAO');
  reg.grava;
  reg.Free;
  reg := nil;

  fechaQuery(query);
end;

procedure TContabil.RegistroI075;
var reg: TRegistroI075;
begin
  query := executaQuery(DmBlocoI.QReg075, True);

  if query.IsEmpty then begin fechaQuery(query); Exit; end;

  query.First;
  while not query.Eof do
  begin
    reg := TRegistroI075.Create(TObject(Self), arquivo);
    reg.COD_HIST := IntToStr(pegaValor(query, 'COD_HISTORICO_CONTABIL'));
    reg.DESCR_HIST := pegaValor(query, 'DESC_HISTORICO_CONTABIL');
    reg.grava;
    reg.Free;
    reg := nil;

    query.Next;
  end;
  fechaQuery(query);
end;

procedure TContabil.RegistroI100;
var reg: TRegistroI100;
begin
//  reg := TRegistroI100.Create(TObject(Self), arquivo);
//  reg.grava;
//  reg.Free;
//  reg := nil;
end;

procedure TContabil.RegistroI150;
var reg: TRegistroI150;
  diaIni, mesIni, anoIni, diaFin, mesFin, anoFin: Word;
  dataIniAux, dataFinAux: TDate;
  i: Integer;
begin
  DecodeDate(wDataIni, anoIni, mesIni, diaIni);
  DecodeDate(wDataFin, anoFin, mesFin, diaFin);

  for i := mesIni to mesFin do
  begin
    reg := TRegistroI150.Create(TObject(Self), arquivo);

    Bib.PriUltDataVar(dataIniAux, dataFinAux, True, StrToDate('01/' + FormatFloat('00', i) + '/' + FormatFloat('0000', anoIni)));

    reg.DT_INI := dataIniAux;
    reg.DT_FIN := dataFinAux;
    reg.grava;
    reg.Free;
    reg := nil;

    RegistroI155(dataIniAux);
  end;
end;

procedure TContabil.RegistroI155(data: TDate);
var reg: TRegistroI155;
  AnoMes: Integer;
  dia, mes, ano: Word;
begin
  DecodeDate(data, ano, mes, dia);
  AnoMes := StrToInt(IntToStr(ano) + FormatFloat('00', mes));

  query := executaQuery(DmBlocoI.QReg155);
  if Bib.geraStringFiliais(wFiliais) <> '' then
    query.SetVariable('FILIAIS', Bib.geraStringFiliais(wFiliais))
  else
    query.SetVariable('FILIAIS', '(SELECT COD_FILIAL FROM TB_FILIAL)');
  query.SetVariable('DT_ANO_MES', AnoMes);
  query.open;

  if query.IsEmpty then begin fechaQuery(query); Exit; end;

  query.First;
  while not query.Eof do
  begin
    reg := TRegistroI155.Create(TObject(Self), arquivo);
    reg.COD_CTA := pegaValor(query, 'NUM_PLANO_CONTA');
    reg.COD_CCUS := '';
    if pegaValor(query, 'VAL_ANTERIOR') > 0 then
    begin
      reg.VL_SLD_INI := pegaValor(query, 'VAL_ANTERIOR');
      reg.IND_DC_INI := 'D';
    end
    else
    begin
      reg.VL_SLD_INI := pegaValor(query, 'VAL_ANTERIOR') * -1;
      reg.IND_DC_INI := 'C';
    end;
    reg.VL_DEB := ABS(pegaValor(query, 'VAL_DEBITO'));
    reg.VL_CRED := ABS(pegaValor(query, 'VAL_CREDITO'));
    if pegaValor(query, 'VAL_ATUAL') > 0 then
    begin
      reg.VL_SLD_FIN := pegaValor(query, 'VAL_ATUAL');
      reg.IND_DC_FIN := 'D';
    end
    else
    begin
      reg.VL_SLD_FIN := pegaValor(query, 'VAL_ATUAL') * -1;
      reg.IND_DC_FIN := 'C';
    end;
    reg.grava;
    reg.Free;
    reg := nil;

    query.Next;
  end;
  fechaQuery(query);
end;

//procedure TContabil.RegistroI200;
//var reg: TRegistroI200;
//begin
//  query := executaQuery(DmBlocoI.QReg200);
//  if Bib.geraStringFiliais(wFiliais) <> '' then
//    query.SetVariable('FILIAIS', Bib.geraStringFiliais(wFiliais))
//  else
//    query.SetVariable('FILIAIS', '(SELECT COD_FILIAL FROM TB_FILIAL)');
//  query.SetVariable('DATA_INI', wDataIni);
//  query.SetVariable('DATA_FIN', wDataFin);
//  query.open;
//
//  if query.IsEmpty then begin fechaQuery(query); Exit; end;
//
//  query.First;
//  while not query.Eof do
//  begin
//    reg := TRegistroI200.Create(TObject(Self), arquivo);
//    reg.NUM_LCTO := IntToStr(pegaValor(query, 'COD_LANCTO_CONTABIL'));
//    reg.DT_LCTO := pegaValor(query, 'DT_LANCAMENTO');
//    reg.IND_LCTO := pegaValor(query, 'IND_LANCAMENTO');
//
//    totalI250 := 0;
//    SetLength(listaI250, 0);
//    // o Next é feito aqui dentro! ;)
//    RegistroI250(pegaValor(query, 'COD_LANCTO_CONTABIL'));
//
//    reg.VL_LCTO := totalI250;
//    reg.grava;
//    reg.Free;
//    reg := nil;
//
//    geraListaI250;
//  end;
//  fechaQuery(query);
//end;

procedure TContabil.geraListaI250();
var i: Integer;
begin
  for i := 0 to length(listaI250) - 1 do
  begin
    listaI250[i].grava;
    listaI250[i].Free;
    listaI250[i] := nil;
  end;
end;

//procedure TContabil.RegistroI250(codLancamentoContabil: Integer);
//var reg: TRegistroI250;
//  data: TDate;
//  indLancamento: string;
//  //valLancamento: Double;
//  //complemento: String;
//begin
//  data := pegaValor(query, 'DT_LANCAMENTO');
//  indLancamento := pegaValor(query, 'IND_LANCAMENTO');
//  //valLancamento := pegaValor(query, 'VAL_LANCAMENTO');
//  //complemento := pegaValor(query, 'DESC_COMPLEMENTO_PARAM');
//
//  while not query.Eof do
//  begin
//    reg := TRegistroI250.Create(TObject(Self), arquivo);
//    reg.COD_CTA := pegaValor(query, 'NUM_PLANO_CONTA');
//    reg.COD_CCUS := '';
//    if pegaValor(query, 'VAL_LANCAMENTO') >= 0 then
//      reg.VL_DC := pegaValor(query, 'VAL_LANCAMENTO')
//    else
//      reg.VL_DC := pegaValor(query, 'VAL_LANCAMENTO') * -1;
//    reg.IND_DC := pegaValor(query, 'IND_OPERACAO');
//    reg.NUM_ARQ := '';
//    reg.COD_HIST_PAD := IntToStr(pegaValor(query, 'COD_HISTORICO_CONTABIL'));
//    reg.HIST := pegaValor(query, 'DESC_COMPLEMENTO');
//    reg.COD_PART := '';
//    SetLength(listaI250, length(listaI250) + 1);
//    listaI250[length(listaI250) - 1] := reg;
//    if pegaValor(query, 'IND_OPERACAO') = 'D' then
//      totalI250 := totalI250 + pegaValor(query, 'VAL_LANCAMENTO');
//
//    query.Next;
//
//    if (
//      (data <> pegaValor(query, 'DT_LANCAMENTO')) or
//      (indLancamento <> pegaValor(query, 'IND_LANCAMENTO')) or
//      ) then
//      Break;
//
////    if (
////      (data = pegaValor(query, 'DT_LANCAMENTO')) and
////      (indLancamento = pegaValor(query, 'IND_LANCAMENTO'))
////    ) then
////    Begin
////      data := pegaValor(query, 'DT_LANCAMENTO');
////      indLancamento := pegaValor(query, 'IND_LANCAMENTO');
////    End
////    else
////      Break;
//  end;
//end;

procedure TContabil.AdicionaEncerramentoTrimestral(pNumConta: String;
  pValLancamento: Double; pOperacao: String; pDataFechamento: TDate);
var wValor: Double;
begin


  DMBlocoI.CDSEncerramento.First;

  if pOperacao = 'C' then
    wValor := pValLancamento * -1
  else
    wValor := pValLancamento;


  if DMBlocoI.CDSEncerramento.Locate('NUM_PLANO_CONTA;DT_ENCERRAMENTO', VarArrayOf([pNumConta, StrToDate(FormatDateTime('dd/mm/yyyy', pDataFechamento))]), []) then
  begin
    DMBlocoI.CDSEncerramento.Edit;
    DmBlocoI.CDSEncerramentoVAL_LANCAMENTO.Value :=
       DmBlocoI.CDSEncerramentoVAL_LANCAMENTO.Value + wValor;
  end
  else
  begin
    DMBlocoI.CDSEncerramento.Append;
    DmBlocoI.CDSEncerramentoNUM_PLANO_CONTA.Value := pNumConta;
    DmBlocoI.CDSEncerramentoVAL_LANCAMENTO.Value := wValor;
    DmBlocoI.CDSEncerramentoDT_ENCERRAMENTO.Value := pDataFechamento;
  end;
  DMBlocoI.CDSEncerramento.Post;
  
end;

procedure TContabil.AdicionaEncerramento(pNumConta: String;
  pValLancamento: Double; pOperacao: String);
var wValor: Double;
begin

  DMBlocoI.CDSEncerramento.First;

  if pOperacao = 'C' then
    wValor := pValLancamento * -1
  else
    wValor := pValLancamento;

  while not DMBlocoI.CDSEncerramento.Eof do
  begin 
    if DMBlocoI.CDSEncerramentoNUM_PLANO_CONTA.Value = pNumConta then
    begin
      DMBlocoI.CDSEncerramento.Edit;
      DmBlocoI.CDSEncerramentoVAL_LANCAMENTO.Value :=
        DmBlocoI.CDSEncerramentoVAL_LANCAMENTO.Value + wValor;
      DMBlocoI.CDSEncerramento.Post;
      Exit;
    end;
    DMBlocoI.CDSEncerramento.Next;
  end;

  DMBlocoI.CDSEncerramento.Append;
  DmBlocoI.CDSEncerramentoNUM_PLANO_CONTA.Value := pNumConta;
  DmBlocoI.CDSEncerramentoVAL_LANCAMENTO.Value := wValor;
  DMBlocoI.CDSEncerramento.Post;
  
end;

procedure TContabil.CatalogaLanctoEncerramento;
var dia,mes,ano,diaLanc,mesLanc,anoLanc: word;
 wFiltro: string;
begin

  wFiltro := '(IND_LANCAMENTO = ' + QuotedStr('E') + ') and (DESC_NATUREZA_CONTA = ' + QuotedStr('04') + ')';

  with DMBlocoI do
  begin
    query.First;
    decodeDate(wDataFin,ano,mes,dia);
    decodeDate(pegaValor(query,'DT_LANCAMENTO'),anoLanc,mesLanc,diaLanc);
    if (mes <> mesLanc) and not (isTrimestral) then
      Exit;

    case mesLanc of
      1..3:
        wTrimestre := 1;
      4..6:
        wTrimestre := 2;
      7..9:
        wTrimestre := 3;
      10..12:
        wTrimestre := 4;
    end;

    if mesLanc <> (wTrimestre*3) then
      Exit;

    dtFinTrimestre := EndOfAMonth(anoLanc, wTrimestre*3);

    if not isTrimestral then
    begin
      while not query.Eof do
      begin
        if (pegaValor(query,'IND_LANCAMENTO') = 'E') and
         (pegaValor(query,'DESC_NATUREZA_CONTA') = '04') then
        begin
          AdicionaEncerramento(pegaValor(query,'NUM_PLANO_CONTA'),
            pegaValor(query,'VAL_LANCAMENTO'),
            pegaValor(query,'IND_OPERACAO'))
        end;
        query.Next;
      end;
    end
    else
    begin

      query.Filtered := false;
      query.Filter := wFiltro;
      query.Filtered := true;

      while not query.Eof do
      begin
        AdicionaEncerramentoTrimestral(pegaValor(query,'NUM_PLANO_CONTA'),
          pegaValor(query,'VAL_LANCAMENTO'),
          pegaValor(query,'IND_OPERACAO'),
          trunc(dtFinTrimestre));
        query.Next;
      end;
      query.Filtered := false;
    end;

    query.First;
  end;
end;

function TContabil.BuscaLancamento(pCodLanctoContabil: Integer): String;
begin
  Result := '';
  with DMBlocoI.CDSPartida do
  begin
    First;
    while not Eof do
    begin
      if DmBlocoI.CDSPartidaCOD_LANCTO_CONTABIL.Value = pCodLanctoContabil then
      begin
        Result := DmBlocoI.CDSPartidaIND_TIPO_LANCAMENTO_SPED.Value;
        Exit;
      end;
      Next;
    end;
  end;
end;

procedure TContabil.AdicionaLancamento(pCodLanctoContabil: Integer;
  pTipoLancamentoSped: String; pOperacao: String; pValor: Double);
begin
  with DMBlocoI.CDSPartida do
  begin
    First;

    while not Eof do
    begin
      if DMBlocoI.CDSPartidaCOD_LANCTO_CONTABIL.Value = pCodLanctoContabil then
      begin
        Edit;
        if pTipoLancamentoSped <> 'VALOR' then
          DMBlocoI.CDSPartidaIND_TIPO_LANCAMENTO_SPED.Value :=
            pTipoLancamentoSped;

        if (pTipoLancamentoSped = 'VALOR') and (pOperacao = 'C') then
          DMBlocoI.CDSPartidaVAL_LANCAMENTO.Value :=
            DMBlocoI.CDSPartidaVAL_LANCAMENTO.Value + pValor;

        Post;
        Exit;
      end;
      Next;
    end;

    Append;
    DMBlocoI.CDSPartidaCOD_LANCTO_CONTABIL.Value := pCodLanctoContabil;
    DMBlocoI.CDSPartidaIND_TIPO_LANCAMENTO_SPED.Value := pTipoLancamentoSped;
    Post;

  end;
end;

procedure TContabil.Teste;
var wComplemento: String;
    wFilialAtu,wHistContAtu: Variant;
    wDtLancAtu: Variant;
    wValLancAtu: Variant;
    wComplAtu: Variant;
    wCont: Integer;
    wNumLcto,wIndLcto: String;
    wDtLcto: TDate;
    wCodFilial,wCodHistContabil: Integer;
    wCodLanctoCont,wCodNotaCabAtu,wCodContaReceberCabAtu,wCodContaPagarCabAtu,
      wCodBcoMovimentoAtu,wCodCaixaMovAtu,wCodPlanilhaAtu: Variant;
    wSaltos,wRecNo: Integer;

    wCodNotaCabAnt,wCodContaReceberCabAnt,wCodContaPagarCabAnt,
      wCodBcoMovimentoAnt,wCodCaixaMovAnt,wCodPlanilhaAnt: Variant;
    wFilialAnt,wHistContAnt: Variant;
    wDtLancAnt: Variant;
    wValLancAnt: Variant;
    wComplAnt: Variant;
    wPartida: Boolean;
    wMesAtu,wMesAnt: String;
    wSalvar: Boolean;
    wCodLanctoContCab: Variant;
begin
  wPartida := false;
  wSalvar := true;
  DmBlocoI.CDSPartida.EmptyDataSet;
  while not query.eof do
  begin

    if BuscaLancamento(pegaValor(query,'COD_LANCTO_CONTABIL')) <> '' then
    begin
      query.Next;
      Continue;
    end;

    AdicionaLancamento(pegaValor(query,'COD_LANCTO_CONTABIL'),'CABECALHO',
      pegaValor(query,'IND_OPERACAO'),pegaValor(query,'VAL_LANCAMENTO'));

    //Para atualizar o valor do cabecalho para gerar o valor total do lançamento
    AdicionaLancamento(pegaValor(query,'COD_LANCTO_CONTABIL'),'VALOR',
      pegaValor(query,'IND_OPERACAO'),pegaValor(query,'VAL_LANCAMENTO'));

    if wSalvar then
      DMOracle.ExecutaSql(
        'UPDATE TB_LANCTO_CONTABIL SET IND_TIPO_LANCAMENTO_SPED = '+
        quotedStr('CABECALHO')+
        ' WHERE COD_LANCTO_CONTABIL = '+
        query.FieldbyName('COD_LANCTO_CONTABIL').Text,false);

    wRecNo := query.RecNo;
    wFilialAnt := pegaValor(query,'COD_FILIAL');
    wHistContAnt := pegaValor(query,'COD_HISTORICO_CONTABIL');
    wDtLancAnt := pegaValor(query, 'DT_LANCAMENTO');
    wValLancAnt := pegaValor(query, 'VAL_LANCAMENTO');
    wComplAnt := pegaValor(query, 'DESC_COMPLEMENTO_PARAM');
    wCodNotaCabAnt := pegaValor(query,'COD_NOTA_CAB');
    wCodContaReceberCabAnt := pegaValor(query,'COD_CONTA_RECEBER_CAB');
    wCodContaPagarCabAnt := pegaValor(query,'COD_CONTA_PAGAR_CAB');
    wCodBcoMovimentoAnt := pegaValor(query,'COD_BCO_MOVIMENTO');
    wCodCaixaMovAnt := pegaValor(query,'COD_CAIXA_MOV');
    wCodPlanilhaAnt := pegaValor(query,'COD_PLANILHA');
    wMesAnt := query.FieldByName('DT_LANCAMENTO').Text;
    wMesAnt := copy(wMesAnt,4,2);

    wCodLanctoContCab := pegaValor(query,'COD_LANCTO_CONTABIL');

    thread.mostramensagem('Catalogando lançamentos do mês ' + wMesAnt);

    while not query.Eof do
    begin
      query.Next;

      wMesAtu := query.FieldByName('DT_LANCAMENTO').Text;
      wMesAtu := copy(wMesAtu,4,2);
      if wMesAtu <> wMesAnt then
        break;

      if BuscaLancamento(pegaValor(query,'COD_LANCTO_CONTABIL')) = 'PARTIDA' then
      begin
        Continue;
      end;

      wFilialAtu := pegaValor(query,'COD_FILIAL');
      wHistContAtu := pegaValor(query,'COD_HISTORICO_CONTABIL');
      wDtLancAtu := pegaValor(query, 'DT_LANCAMENTO');
      wValLancAtu := pegaValor(query, 'VAL_LANCAMENTO');
      wComplAtu := pegaValor(query, 'DESC_COMPLEMENTO_PARAM');
      wCodNotaCabAtu := pegaValor(query,'COD_NOTA_CAB');
      wCodContaReceberCabAtu := pegaValor(query,'COD_CONTA_RECEBER_CAB');
      wCodContaPagarCabAtu := pegaValor(query,'COD_CONTA_PAGAR_CAB');
      wCodBcoMovimentoAtu := pegaValor(query,'COD_BCO_MOVIMENTO');
      wCodCaixaMovAtu := pegaValor(query,'COD_CAIXA_MOV');
      wCodPlanilhaAtu := pegaValor(query,'COD_PLANILHA');

      if ((pegaValor(query,'COD_LANCTO_CONTABIL') = 31475) or
       (pegaValor(query,'COD_LANCTO_CONTABIL') = 31474)) then
        wSaltos := 500;

      //Aqui acontece a mágica
      if ((
            (wFilialAtu = wFilialAnt) and
            (wHistContAtu = wHistContAnt) and
            (wDtLancAtu = wDtLancAnt) and
            (wValLancAtu = wValLancAnt) and
            (wComplAtu = wComplAnt) and
            (wCodNotaCabAtu = 0) and
            (wCodContaReceberCabAtu = 0) and
            (wCodContaPagarCabAtu = 0) and
            (wCodBcoMovimentoAtu = 0) and
            (wCodCaixaMovAtu = 0) and
            (wCodPlanilhaAtu = 0)
          ) or
          (
            (wCodNotaCabAtu = wCodNotaCabAnt) and
            (wCodContaReceberCabAtu = wCodContaReceberCabAnt) and
            (wCodContaPagarCabAtu = wCodContaPagarCabAnt) and
            (wCodBcoMovimentoAtu = wCodBcoMovimentoAnt) and
            (wCodCaixaMovAtu = wCodCaixaMovAnt) and
            (wCodPlanilhaAtu = wCodPlanilhaAnt) and
            (
              (wCodNotaCabAtu > 0) or
              (wCodContaReceberCabAtu > 0) or
              (wCodContaPagarCabAtu > 0) or
              (wCodBcoMovimentoAtu > 0) or
              (wCodCaixaMovAtu > 0) or
              (wCodPlanilhaAtu > 0)
            )
          )) then
      begin
        //Cataloga o lançamento
        AdicionaLancamento(pegaValor(query,'COD_LANCTO_CONTABIL'),'PARTIDA',
          pegaValor(query,'IND_OPERACAO'),pegaValor(query,'VAL_LANCAMENTO'));

        //Para atualizar o valor do cabecalho para gerar o valor total do lançamento
        AdicionaLancamento(wCodLanctoContCab,'VALOR',
          pegaValor(query,'IND_OPERACAO'),pegaValor(query,'VAL_LANCAMENTO'));

        if wSalvar then
          DMOracle.ExecutaSql(
            'UPDATE TB_LANCTO_CONTABIL SET IND_TIPO_LANCAMENTO_SPED = '+
            quotedStr('PARTIDA')+
            ' WHERE COD_LANCTO_CONTABIL = '+
            query.FieldbyName('COD_LANCTO_CONTABIL').Text,false);

      end
      else
      begin

        //AdicionaLancamento(pegaValor(query,'COD_LANCTO_CONTABIL'),'CABECALHO',
//          pegaValor(query,'IND_OPERACAO'),pegaValor(query,'VAL_LANCAMENTO'));
//
//        //Para atualizar o valor do cabecalho para gerar o valor total do lançamento
//        AdicionaLancamento(pegaValor(query,'COD_LANCTO_CONTABIL'),'VALOR',
//          pegaValor(query,'IND_OPERACAO'),pegaValor(query,'VAL_LANCAMENTO'));
//
//        if wSalvar then
//          DMOracle.ExecutaSql(
//            'UPDATE TB_LANCTO_CONTABIL SET IND_TIPO_LANCAMENTO_SPED = '+
//            quotedStr('CABECALHO')+
//            ' WHERE COD_LANCTO_CONTABIL = '+
//            query.FieldbyName('COD_LANCTO_CONTABIL').Text,false);
        break;
      end;
    end;
    query.RecNo := wRecNo;
    query.Next;
  end;
end;

procedure TContabil.RegistroI200;
var reg: TRegistroI200;
    wComplemento: String;
    wFilialAtu,wHistContAtu: Integer;
    wDtLancAtu: TDate;
    wValLancAtu: Double;
    wComplAtu: String;
    wCont: Integer;
    wNumLcto,wIndLcto: String;
    wDtLcto: TDate;
    wCodFilial,wCodHistContabil: Integer;
    wCodLanctoCont,wCodNotaCabAtu,wCodContaReceberCabAtu,wCodContaPagarCabAtu,
      wCodBcoMovimentoAtu,wCodCaixaMovAtu,wCodPlanilhaAtu: Integer;
    wSaltos,wRecNo: Integer;
begin
  wTeste:=0;

  GeraDatas;
  DmBlocoI.CDSDatas.First;
  DmBlocoI.CDSEncerramento.EmptyDataSet;

  while not DmBlocoI.CDSDatas.Eof do
  begin
    query := executaQuery(DmBlocoI.QReg200);

    if Bib.geraStringFiliais(wFiliais) <> '' then
      query.SetVariable('FILIAIS', Bib.geraStringFiliais(wFiliais))
    else
      query.SetVariable('FILIAIS', '(SELECT COD_FILIAL FROM TB_FILIAL)');
    query.SetVariable('DATA_INI', DmBlocoI.CDSDatasDT_INI.Value);
    query.SetVariable('DATA_FIN', DmBlocoI.CDSDatasDT_FIN.Value);
    query.open;

    if query.IsEmpty then
    begin
      fechaQuery(query);
      DmBlocoI.CDSDatas.Next;
      Continue;
    end;

    wPartidaLanctos.Clear;
    CatalogaLanctoEncerramento;
    teste;

    wCont := 1;
    query.First;
    while not query.Eof do
    begin

      if BuscaLancamento(pegaValor(query,'COD_LANCTO_CONTABIL')) = 'PARTIDA' then
      begin
        query.Next;
        Continue;
      end;

      reg := TRegistroI200.Create(TObject(Self), arquivo);
      reg.NUM_LCTO := IntToStr(pegaValor(query, 'COD_LANCTO_CONTABIL'));
      reg.DT_LCTO := pegaValor(query, 'DT_LANCAMENTO');
      reg.VL_LCTO := DmBlocoI.CDSPartidaVAL_LANCAMENTO.Value;
      reg.IND_LCTO := pegaValor(query, 'IND_LANCAMENTO');
      reg.grava;
      reg.Free;
      reg := Nil;
      RegistroI250;
    end;
    fechaQuery(query);
    DmBlocoI.CDSDatas.Next;
    thread.tela.GProgresso.AddProgress(6);
  end;
  //ShowMessage(wTeste);
end;

procedure TContabil.RegistroI250;
var reg: TRegistroI250;
begin
  reg := TRegistroI250.Create(TObject(Self), arquivo);
  reg.COD_CTA := pegaValor(query, 'NUM_PLANO_CONTA');
  reg.COD_CCUS := '';
  if pegaValor(query, 'VAL_LANCAMENTO') >= 0 then
    reg.VL_DC := pegaValor(query, 'VAL_LANCAMENTO')
  else
    reg.VL_DC := pegaValor(query, 'VAL_LANCAMENTO') * -1;
  reg.IND_DC := pegaValor(query, 'IND_OPERACAO');
  reg.NUM_ARQ := '';
  reg.COD_HIST_PAD := IntToStr(pegaValor(query, 'COD_HISTORICO_CONTABIL'));
  reg.HIST := pegaValor(query, 'DESC_COMPLEMENTO');
  reg.COD_PART := '';
  reg.grava;
  reg.Free;
  reg := Nil;

  query.Next;

  while (not query.Eof) do
  begin
    if BuscaLancamento(pegaValor(query,'COD_LANCTO_CONTABIL')) = 'PARTIDA' then
    begin
      reg := TRegistroI250.Create(TObject(Self), arquivo);
      reg.COD_CTA := pegaValor(query, 'NUM_PLANO_CONTA');
      reg.COD_CCUS := '';
      if pegaValor(query, 'VAL_LANCAMENTO') >= 0 then
        reg.VL_DC := pegaValor(query, 'VAL_LANCAMENTO')
      else
        reg.VL_DC := pegaValor(query, 'VAL_LANCAMENTO') * -1;
      reg.IND_DC := pegaValor(query, 'IND_OPERACAO');
      reg.NUM_ARQ := '';
      reg.COD_HIST_PAD := IntToStr(pegaValor(query, 'COD_HISTORICO_CONTABIL'));
      reg.HIST := pegaValor(query, 'DESC_COMPLEMENTO');
      reg.COD_PART := '';
      reg.grava;
      reg.Free;
      reg := Nil;
      query.Next;
    end
    else
      exit;
  end;
end;

procedure TContabil.GeraDatas;
var wMesIni, wMesFin, i: Integer;
  wInicio,wFim: String;
begin
  wMesIni := StrToInt(copy(DateToStr(wDataIni),4,2));
  wMesFin := StrToInt(copy(DateToStr(wDataFin),4,2));
  with DMBlocoI.CDSDatas do
  begin
    DmBlocoI.CDSDatas.EmptyDataSet;

    for i:=wMesIni to wMesFin do
    begin
      if i = wMesIni then
        wInicio := DateToStr(wDataIni)
      else
        wInicio := '01'+Format('/%.2d/',[i])+
          copy(DateToStr(wDataIni),7,4);
      if i = wMesFin then
        wFim := DateToStr(wDataFin)
      else
        wFim := DMOracle.FastSelect('LAST_DAY(' +
          quotedStr(wInicio)+')','DUAL');
      Append;
      DmBlocoI.CDSDatasDT_INI.Text := wInicio;
      DmBlocoI.CDSDatasDT_FIN.Text := wFim;
      Post;
    end;
  end;
end;

//Função que é utilizada para 2 propósitos.
//Se pGerarRegistro for true gera o registro I250
//Se for false apenas retorna o valor total do cabeçalho das partidas para ser utilizado no registro I200
function TContabil.RegistroI250Teste(pGerarRegistro: Boolean = true): Double;
var reg: TRegistroI250;
  query250: TOracleDataSet1;
  wLimite: Integer;
  valor: String;
  wResultado: Double;

  wCodFilial,wCodHistCont,wDtLancto,wValLancto,wCodLanctoCont,wDescCompl,
    wCodNotaCab,wCodContaReceberCab,wCodContaPagarCab,wCodBcoMov,wCodCaixaMov,
    wCodPlanilha: Variant;
begin
  wResultado := 0;

  //Define o limite de códigos de lançamento que a busca deve respeitar.
  //EX: Se o limite é 5 e foi passado o código de lançamento contábil 10,
  //a busca retornará as contas que estiverem entre o lançamento contábil 5 e 15
  wLimite := 100000;
  if pegaValor(query,'COD_LANCTO_CONTABIL') = 31475 then
    wResultado := wResultado;  // utilizado apenas para colocar um breakpoint

  wCodFilial := pegaValor(query,'COD_FILIAL');
  wCodHistCont := pegaValor(query,'COD_HISTORICO_CONTABIL');
  wDtLancto := pegaValor(query, 'DT_LANCAMENTO');
  wValLancto := pegaValor(query, 'VAL_LANCAMENTO');
  wCodLanctoCont := pegaValor(query,'COD_LANCTO_CONTABIL');
  wDescCompl := pegaValor(query,'DESC_COMPLEMENTO_PARAM');
  wCodNotaCab := pegaValor(query,'COD_NOTA_CAB');
  wCodContaReceberCab := pegaValor(query,'COD_CONTA_RECEBER_CAB');
  wCodContaPagarCab := pegaValor(query,'COD_CONTA_PAGAR_CAB');
  wCodBcoMov := pegaValor(query,'COD_BCO_MOVIMENTO');
  wCodCaixaMov := pegaValor(query,'COD_CAIXA_MOV');
  wCodPlanilha := pegaValor(query,'COD_PLANILHA');

  query250 := executaQuery(DMBlocoI.QReg250);
  query250.SetVariable('COD_FILIAL',wCodFilial);
  query250.SetVariable('COD_HISTORICO_CONTABIL',wCodHistCont);
  query250.SetVariable('DT_LANCAMENTO',wDtLancto);
  query250.SetVariable('VAL_LANCAMENTO',wValLancto);
  query250.SetVariable('COD_LANCTO_CONTABIL', wCodLanctoCont);

  if wDescCompl <> '' then
    query250.SetVariable('COMPLEMENTO', wDescCompl)
  else
    query250.SetVariable('COMPLEMENTO', null);

  if wCodNotaCab > 0 then
  begin
    query250.SetVariable('COD_NOTA_CAB', wCodNotaCab);
    wLimite := 0;
  end
  else
    query250.SetVariable('COD_NOTA_CAB',null);

  if wCodContaReceberCab > 0 then
  begin
    query250.SetVariable('COD_CONTA_RECEBER_CAB',
      wCodContaReceberCab);
    wLimite := 0;
  end
  else
    query250.SetVariable('COD_CONTA_RECEBER_CAB',null);

  if wCodContaPagarCab > 0 then
  begin
    query250.SetVariable('COD_CONTA_PAGAR_CAB',
      wCodContaPagarCab);
    wLimite := 0;
  end
  else
    query250.SetVariable('COD_CONTA_PAGAR_CAB',null);

  if wCodBcoMov > 0 then
  begin
    query250.SetVariable('COD_BCO_MOVIMENTO',
      wCodBcoMov);
    wLimite := 0;
  end
  else
    query250.SetVariable('COD_BCO_MOVIMENTO',null);

  if wCodCaixaMov > 0 then
  begin
    query250.SetVariable('COD_CAIXA_MOV',
      wCodCaixaMov);
    wLimite := 0;
  end
  else
    query250.SetVariable('COD_CAIXA_MOV',null);

  if wCodPlanilha > 0 then
  begin
    query250.SetVariable('COD_PLANILHA',
      wCodPlanilha);
    wLimite := 0;
  end
  else
    query250.SetVariable('COD_PLANILHA',null);

  query250.SetVariable('LIMITE',wLimite);
  query250.Open;

  //teste
  {if pegaValor(query,'NUM_PLANO_CONTA') = '3010102000013' then
    valor := pegaValor(query,'VAL_LANCAMENTO');}
  //----

  if query250.IsEmpty then begin
    fechaQuery(query250); Exit; end;

  while not query250.Eof do
  begin
    if pGerarRegistro then
    begin
      reg := TRegistroI250.Create(TObject(Self),arquivo);
      reg.COD_CTA := pegaValor(query250,'COD_CTA');
      reg.VL_DC := pegaValor(query250,'VL_DC');
      reg.IND_DC := pegaValor(query250,'IND_DC');
      reg.COD_HIST_PAD := pegaValor(query250,'COD_HIST_PAD');

      if (pegaValor(query250,'COD_CTA') = '1010101000001') and
        ((pegaValor(query,'DT_LANCAMENTO') >= StrToDate('01/01/2013'))
        and (pegaValor(query,'DT_LANCAMENTO') <= StrToDate('31/01/2013'))) then
        if reg.IND_DC = 'C' then
          wTeste := wTeste + reg.VL_DC;

      reg.grava;
      reg.Free;
      reg := Nil;
    end
    else
    begin
      if query250.RecordCount > 1 then
      begin
        if pegaValor(query250,'IND_DC') = 'C' then
          wResultado := wResultado + StrToFloat(pegaValor(query250,'VL_DC'));
      end
      else
        wResultado := wResultado + StrToFloat(pegaValor(query250,'VL_DC'));
    end;
     query250.Next;
  end;

  Result := wResultado;
  fechaQuery(query250);
end;

procedure TContabil.RegistroI300;
var reg: TRegistroI300;
begin
//  query := executaQuery(DmBlocoI.QReg300);
//  query.SetVariable('DT_LANCAMENTO_INI', wDataIni);
//  query.SetVariable('DT_LANCAMENTO_FIN', wDataFin);
//  query.open;
//
//  if query.IsEmpty then Begin fechaQuery(query); Exit; End;
//
//  query.First;
//  while not query.Eof do
//  Begin
//    reg := TRegistroI300.Create(TObject(Self), arquivo);
//    reg.DT_BCTE := pegaValor(query, 'DT_LANCAMENTO');
//    reg.grava;
//  reg.Free;
//  reg := nil;
//
//    RegistroI310(pegaValor(query, 'DT_LANCAMENTO'));
//
//    query.Next;
//  End;
//  fechaQuery(query);
end;

procedure TContabil.RegistroI310(data: TDate);
var reg: TRegistroI310;
  query: TOracleDataSet1;
begin
//  query := executaQuery(DmBlocoI.QReg310);
//  query.SetVariable('DT_LANCAMENTO', data);
//  query.open;
//
//  if query.IsEmpty then Begin fechaQuery(query); Exit; End;
//
//  query.First;
//  while not query.Eof do
//  Begin
//    reg := TRegistroI310.Create(TObject(Self), arquivo);
//    reg.COD_CTA := pegaValor(query, 'NUM_PLANO_CONTA');
//    reg.COD_CCUS := '';
//    reg.VAL_DEBD := pegaValor(query, 'VAL_DEBITO');
//    reg.VAL_CRED := pegaValor(query, 'VAL_CREDITO');
//    reg.grava;
//  reg.Free;
//  reg := nil;
//
//    query.Next;
//  End;
//  fechaQuery(query);
end;

procedure TContabil.RegistroI350;
var reg: TRegistroI350;
  wTrimestre: integer;
  wDataAux, wDataAuxFin: TDate;
begin

  if not isTrimestral then
  begin

    // Anual
    reg := TRegistroI350.Create(TObject(Self), arquivo);
    reg.DT_RES := wDataFin;
    reg.grava;
    reg.Free;
    reg := nil;
    RegistroI355(wDataFin);

  end   //PARA TRIMESTRAL
  else
  begin
    // TRIMESTRAL     //Registro i350 deve iniciar NO FIM TRIMESTRE 31/03/
    wDataAux := wDataIni;
      while formatDateTime('yyyymm', wDataAuxFin) < formatDateTime('yyyymm', trunc(wDataFin)) do
      begin
        wDataAuxFin := StrToDate(DMOracle.FastSelect('LAST_DAY('
          + quotedStr(DateToStr(wDataAux+89))
          + ')'
          , 'DUAL'
          , '1=1'));
        reg := TRegistroI350.Create(TObject(Self), arquivo);
        reg.DT_RES := wDataAuxFin;
        reg.grava;
        reg.Free;
        reg := nil;
        RegistroI355(wDataAuxFin);
        wDataAux := wDataAuxFin;
      end;
  end;

end;

procedure TContabil.RegistroI355(data: TDate);
var reg: TRegistroI355;
  AnoMes: Integer;
  dia, mes, ano: Word;
begin
  with DMBlocoI do
  begin
    if isTrimestral then
    begin
      CDSEncerramento.Filtered := false;
      CDSEncerramento.Filter := 'DT_ENCERRAMENTO = ' + QuotedStr(FormatDateTime('dd/MM/yyyy', data));
      CDSEncerramento.Filtered := true;
    end;

    CDSEncerramento.First;
    while not CDSEncerramento.Eof do
    begin
      reg := TRegistroI355.Create(TObject(Self), arquivo);
      reg.COD_CTA := CDSEncerramentoNUM_PLANO_CONTA.Value;
      reg.COD_CCUS := '';
      if CDSEncerramentoVAL_LANCAMENTO.Value > 0 then
      begin
        reg.VAL_CTA := ABS(CDSEncerramentoVAL_LANCAMENTO.Value);
        reg.IND_DC := 'C';
      end
      else
      begin
        reg.VAL_CTA := ABS(CDSEncerramentoVAL_LANCAMENTO.Value);
        reg.IND_DC := 'D';
      end;
      reg.grava;
      reg.Free;
      reg := nil;

      CDSEncerramento.Next;
    end;
    CDSEncerramento.Filtered := false;
    CDSEncerramento.Filter := '';
  end;
end;

procedure TContabil.RegistroI500;
var reg: TRegistroI500;
begin
//  reg := TRegistroI500.Create(TObject(Self), arquivo);
//  reg.grava;
//  reg.Free;
//  reg := nil;
end;

procedure TContabil.RegistroI510;
var reg: TRegistroI510;
begin
//  reg := TRegistroI510.Create(TObject(Self), arquivo);
//  reg.grava;
//  reg.Free;
//  reg := nil;
end;

procedure TContabil.RegistroI550;
var reg: TRegistroI550;
begin
//  reg := TRegistroI550.Create(TObject(Self), arquivo);
//  reg.grava;
//  reg.Free;
//  reg := nil;
end;

procedure TContabil.RegistroI555;
var reg: TRegistroI555;
begin
//  reg := TRegistroI555.Create(TObject(Self), arquivo);
//  reg.grava;
//  reg.Free;
//  reg := nil;
end;

procedure TContabil.RegistroI990(QtdLinhas: Double);
var reg: TRegistroI990;
begin
  reg := TRegistroI990.Create(TObject(Self), arquivo);
  reg.QTD_LIN_I := QtdLinhas;
  reg.grava;
  reg.Free;
  reg := nil;
end;

procedure TContabil.RegistroJ001;
var reg: TRegistroJ001;
begin
  reg := TRegistroJ001.Create(TObject(Self), arquivo);
  reg.IND_DAD := 1;
  reg.grava;
  reg.Free;
  reg := nil;

  RegistroJ005;
  RegistroJ900;
end;

procedure TContabil.RegistroJ005;
var reg: TRegistroJ005;
  wTrimestre: integer;
  ano, mes, dia: Word;
  dtIniAux: TDateTime;
begin

  dtIniAux := wDataIni;

  if isTrimestral then
  begin

    for wTrimestre := 1 to 4 do
    begin
      DecodeDate(dtIniAux, ano, mes, dia);
      dtFinTrimestre := EndOfAMonth(ano, wTrimestre*3);
      reg := TRegistroJ005.Create(TObject(Self), arquivo);
      reg.DT_INI := dtIniAux;
      reg.DT_FIN := dtFinTrimestre;
      reg.ID_DEM := 1;
      reg.CAB_DEM := '';
      reg.grava;
      reg.Free;
      reg := nil;

      RegistroJ100(ano, MonthOf(dtFinTrimestre));
      RegistroJ150(ano, MonthOf(dtFinTrimestre));
      dtIniAux := dtFinTrimestre + 1;

      thread.tela.GProgresso.AddProgress(6);

    end;
  end
  else
  begin
    DecodeDate(wDataFin, ano, mes, dia);
    reg := TRegistroJ005.Create(TObject(Self), arquivo);
    reg.DT_INI := wDataIni;
    reg.DT_FIN := wDataFin;
    reg.ID_DEM := 1;
    reg.CAB_DEM := '';
    reg.grava;
    reg.Free;
    reg := nil;

    RegistroJ100(ano, mes);
    RegistroJ150(ano, mes);
  end;

  RegistroJ800;

end;

procedure TContabil.RegistroJ100(ano, mes: Word);
var reg: TRegistroJ100;
  AnoMes, AnoMesIni: Integer;
  //dia, mes, ano: Word;    //comentado para alteracao trimestralxanual - CLEBER - 26/02/2021
begin
  //DecodeDate(wDataFin, ano, mes, dia);     //comentado para alteracao trimestralxanual - CLEBER - 26/02/2021
  AnoMes := StrToInt(IntToStr(ano) + FormatFloat('00', mes));

  if not isTrimestral then
  begin
    query := ExecutaQuery(DmBlocoJ.QReg100);
    if Bib.geraStringFiliais(wFiliais) <> '' then
      query.SetVariable('FILIAIS', Bib.geraStringFiliais(wFiliais))
    else
      query.SetVariable('FILIAIS', '(SELECT COD_FILIAL FROM TB_FILIAL)');
    query.SetVariable('DT_ANO_MES', AnoMes);
    query.open;

    if query.IsEmpty then begin fechaQuery(query); Exit; end;

    query.First;
    while not query.Eof do
    begin
      reg := TRegistroJ100.Create(TObject(Self), arquivo);
      reg.COD_AGL := pegaValor(query, 'COD_AGLUTINACAO');
      reg.IND_COD_AGL := pegaValor(query, 'IND_COD_AGLUTINACAO');
      reg.NIVEL_AGL := pegaValor(query, 'NUM_GRAU');
      reg.COD_AGL_SUP := pegaValor(query, 'COD_AGLUTINACAO_SUP');
      reg.IND_GRP_BAL := pegaValor(query, 'DESC_TIPO_BALANCO');
      reg.DESCR_COD_AGL := pegaValor(query, 'DESC_PLANO_CONTA');
      reg.VL_CTA_INI := pegaValor(query, 'VAL_CTA_INI');
      reg.IND_DC_CTA_INI := pegaValor(query, 'IND_DC_BAL_INI');
      reg.VL_CTA_FIN := pegaValor(query, 'VAL_ATUAL');
      reg.IND_DC_CTA_FIN := pegaValor(query, 'IND_DC');
      reg.grava;
      reg.Free;
      reg := nil;

      query.Next;
    end;
  end
  else
  begin
    if mes = 3 then
      AnoMesIni := StrToInt(IntToStr(ano - 1) + FormatFloat('00', 12))
    else
      AnoMesIni := StrToInt(IntToStr(ano) + FormatFloat('00', mes - 3));

    query := ExecutaQuery(DmBlocoJ.QReg100trim);
    if Bib.geraStringFiliais(wFiliais) <> '' then
      query.SetVariable('FILIAIS', Bib.geraStringFiliais(wFiliais))
    else
      query.SetVariable('FILIAIS', '(SELECT COD_FILIAL FROM TB_FILIAL)');
    query.SetVariable('DT_ANO_MES', AnoMes);
    query.SetVariable('DT_ANO_MES_INI', AnoMesIni);
    query.open;

    if query.IsEmpty then begin fechaQuery(query); Exit; end;

    query.First;
    while not query.Eof do
    begin
      reg := TRegistroJ100.Create(TObject(Self), arquivo);
      reg.COD_AGL := pegaValor(query, 'COD_AGLUTINACAO');
      reg.IND_COD_AGL := pegaValor(query, 'IND_COD_AGLUTINACAO');
      reg.NIVEL_AGL := pegaValor(query, 'NUM_GRAU');
      reg.COD_AGL_SUP := pegaValor(query, 'COD_AGLUTINACAO_SUP');
      reg.IND_GRP_BAL := pegaValor(query, 'DESC_TIPO_BALANCO');
      reg.DESCR_COD_AGL := pegaValor(query, 'DESC_PLANO_CONTA');
      reg.VL_CTA_INI := pegaValor(query, 'VAL_CTA_INI');
      reg.IND_DC_CTA_INI := pegaValor(query, 'IND_DC_BAL_INI');
      reg.VL_CTA_FIN := pegaValor(query, 'VAL_ATUAL');
      reg.IND_DC_CTA_FIN := pegaValor(query, 'IND_DC');
      reg.grava;
      reg.Free;
      reg := nil;

      query.Next;
    end;
  end;

  fechaQuery(query);
end;

procedure TContabil.RegistroJ150(ano, mes: Word);
var reg: TRegistroJ150;
  dados: TDataSet;
  //dia, mes, ano: Word;     //comentado para alteracao trimestralxanual - CLEBER - 26/02/2021
  DreLinha: integer;
  wCodReduzido, wNumPlanoConta, super: string;
  wNumGrau, wIndicadorGrupo, wGrupoSup: string;
begin
  //DecodeDate(wDataFin, ano, mes, dia);       //comentado para alteracao trimestralxanual - CLEBER - 26/02/2021

  dados := DMDRE.GeraDRE(mes, ano, wFiliais, false , true, isTrimestral);

  dados.First;


  if dados.IsEmpty then begin dados.Close; Exit; end;

  DMDRE.QIndOperacaoGrupo.Open;
  DreLinha := 1;

  while not dados.Eof do
  begin
    reg := TRegistroJ150.Create(TObject(Self), arquivo);
    reg.NU_ORDEM := IntToStr(DreLinha);
    reg.COD_AGL := VarToStr(dados.FieldValues['COD_AGLUTINACAO_SPED']);
    wCodReduzido := '';
    if dados.FieldValues['IND_TOTALIZADOR_SPED'] = 'S' then
      reg.IND_COD_AGL := 'T'
    else
      reg.IND_COD_AGL := 'D';

    reg.NIVEL_AGL := dados.FieldValues['NUM_NIVEL_AGLUTINACAO'];

    if varToStr(dados.FieldValues['COD_AGLUTINACAO_SUPERIOR']) <> '' then
      reg.COD_AGL_SUP := varToStr(dados.FieldValues['COD_AGLUTINACAO_SUPERIOR']);

    reg.DESCR_COD_AGL := VarToStr(dados.FieldValues['DESC_AGLUTINACAO']);

    if dados.FieldValues['VAL_SALDO_ANTERIOR'] >= 0 then
    begin
      reg.VAL_CTA_INI := dados.FieldValues['VAL_SALDO_ANTERIOR'];
      reg.IND_DC_CTA_INI := 'C';
    end
    else
    begin
      reg.VAL_CTA_INI := dados.FieldValues['VAL_SALDO_ANTERIOR'] * -1 ;
      reg.IND_DC_CTA_INI := 'D';
    end;

    if dados.FieldValues['VAL_SALDO'] >= 0 then
    begin
      reg.VL_CTA_FIN := dados.FieldValues['VAL_SALDO'];
      reg.IND_DC_CTA_FIN := 'C';
    end
    else
    begin
      reg.VL_CTA_FIN := dados.FieldValues['VAL_SALDO'] * -1;
      reg.IND_DC_CTA_FIN := 'D';
    end;

    // Se não entrar nas opções seguintes, é o último grupo (Lucro Líquido?)
    reg.IND_GRP_DRE := 'R';
    with DMDRE do
    begin
      if reg.IND_COD_AGL = 'T' then
      begin
        wGrupoSup := Copy(string(reg.COD_AGL_SUP), 10, Length(string(reg.COD_AGL_SUP)) - 9);
        if ((QIndOperacaoGrupoCOD_GRUPO_DRE.Text <> wGrupoSup)
        or (QIndOperacaoGrupoIND_COD_AGL.Text <> reg.IND_COD_AGL))
        and (wGrupoSup <> '') then
        begin
          QIndOperacaoGrupo.Close;
          QIndOperacaoGrupo.SetVariable('COD_GRUPO_DRE', wGrupoSup);
          QIndOperacaoGrupo.SetVariable('IND_COD_AGL', reg.IND_COD_AGL);
          QIndOperacaoGrupo.Open;
        end;
        if (QIndOperacaoGrupo.Locate('COD_GRUPO_DRE_FILHO', Copy(string(reg.COD_AGL), 10, Length(string(reg.COD_AGL)) - 9), []))
          and (wGrupoSup <> '') then
        begin
          if QIndOperacaoGrupo.FieldValues['IND_OPERACAO'] = '+' then
            reg.IND_GRP_DRE := 'R';
          if QIndOperacaoGrupo.FieldValues['IND_OPERACAO'] = '-' then
            reg.IND_GRP_DRE := 'D';
        end;
      end
      else
      begin
        wGrupoSup := Copy(string(reg.COD_AGL_SUP), 10, Length(string(reg.COD_AGL_SUP)) - 9);
        if ((QIndOperacaoGrupoCOD_GRUPO_DRE.Text <> wGrupoSup)
        or (QIndOperacaoGrupoIND_COD_AGL.Text <> reg.IND_COD_AGL))
        and (wGrupoSup <> '') then
        begin
          QIndOperacaoGrupo.Close;
          QIndOperacaoGrupo.SetVariable('COD_GRUPO_DRE', wGrupoSup);
          QIndOperacaoGrupo.SetVariable('IND_COD_AGL', reg.IND_COD_AGL);
          QIndOperacaoGrupo.Open;
        end;
        if (wGrupoSup <> '') then
        begin
          if (QIndOperacaoGrupo.Locate('COD_GRUPO_DRE_FILHO', reg.COD_AGL, [])) then
          begin

            if QIndOperacaoGrupo.FieldValues['IND_OPERACAO'] = '+' then
              reg.IND_GRP_DRE := 'R';
            if QIndOperacaoGrupo.FieldValues['IND_OPERACAO'] = '-' then
              reg.IND_GRP_DRE := 'D';
          end;
        end;
      end;
    end;
    reg.grava;
    reg.Free;
    reg := nil;
    dados.Next;
    inc(DreLinha);
  end;
  dados.Close;
end;

procedure TContabil.RegistroJ800;
var reg: TRegistroJ800;
  richText: TRichEdit;
  i: integer;
  tipoDoc: string;
begin
  i := 0;
  while i < wArquivosRTF.Count do
  begin
     try
        richText := TRichEdit.CreateParented(THandle(HWND_MESSAGE));
        richText.PlainText := true;
        richText.Lines.LoadFromFile(wArquivosRTF[i]);

        if Pos('Demonstração dos Fluxos de Caixa', richText.Text) > 0 then
          tipoDoc := '002'
        else
          if Pos('NOTAS EXPLICATIVAS ÀS DEMONSTRAÇÕES CONTÁBEIS', richText.Text) > 0 then
            tipoDoc := '010'
          else
            tipoDoc := '099';


        reg := TRegistroJ800.Create(TObject(Self), arquivo);
        reg.TIPO_DOC := tipoDoc;
        reg.DESC_RTF := '';
        reg.ARQ_RTF := richText.Text;
        reg.IND_FIM_RTF := 'J800FIM';
        reg.grava;
        Inc(i);
        reg.Free;
        reg := nil;
        richText.Free;
        richText := Nil;
        
      except on e:Exception do
        MessageDlg('Registro J800 - Erro ao anexar arquivo .rtf'
          + #13#10
          + e.Message
          , mtError
          , [mbOk]
          , 0);
      end;
  end;

end;

procedure TContabil.RegistroJ900;
var reg: TRegistroJ900;
begin
  query := executaQuery(DmBlocoJ.QReg900);
  if Bib.geraStringFiliais(wFiliais) <> '' then
    query.SetVariable('FILIAIS', Bib.geraStringFiliais(wFiliais))
  else
    query.SetVariable('FILIAIS', '(SELECT COD_FILIAL FROM TB_FILIAL)');
  query.SetVariable('DT_INICIAL_INI', wDataIni);
  query.SetVariable('DT_INICIAL_FIN', wDataFin);
  query.open;

  if query.IsEmpty then begin fechaQuery(query); RegistroJ930; Exit; end;

  query.First;

  reg := TRegistroJ900.Create(TObject(Self), arquivo);
  reg.DNRC_ENCER := 'TERMO DE ENCERRAMENTO';
  reg.NUM_ORD := Trunc(pegaValor(query, 'NUM_ORDEM'));
  reg.NAT_LIVRO := pegaValor(query, 'DESC_NAT_LIVRO');
  reg.NOME := pegaValor(query, 'DESC_FILIAL');
  reg.QTD_LIN := 0;
  reg.DT_INI_ESCR := wDataIni;
  reg.DT_FIN_ESCR := wDataFin;
  reg.grava;
  reg.Free;
  reg := nil;
  fechaQuery(query);

  RegistroJ930;
end;

procedure TContabil.RegistroJ930;
var reg: TRegistroJ930;
begin
  query := executaQuery(DmBlocoJ.QReg930);
  query.SetVariable('FILIAIS', geraStringFiliais(wFiliais));
  query.Open;

  if query.IsEmpty then begin fechaQuery(query); Exit; end;

  query.First;

  while not query.Eof do
  begin
    reg := TRegistroJ930.Create(TObject(Self), arquivo);
    reg.IDENT_NOM := pegaValor(query, 'NOME');
    reg.IDENT_CPF := pegaValor(query, 'DESC_CPF');
    reg.IDENT_QUALIF := copy(pegaValor(query, 'DESC_QUALIFICACAO'), 7, length(pegaValor(query, 'DESC_QUALIFICACAO')));
    reg.COD_ASSIM := copy(pegaValor(query, 'DESC_QUALIFICACAO'), 1, 3);
    reg.IND_CRC := pegaValor(query, 'DESC_CRC');
    reg.EMAIL := pegaValor(query, 'DESC_E_MAIL');
    reg.FONE := pegaValor(query, 'DESC_TELEFONE');
    reg.UF_CRC := pegaValor(query, 'UF_CRC');
    reg.NUM_SEQ_CRC := pegaValor(query, 'NUM_SEQ_CRC');
    if Trim(query.FieldByName('DT_CRC').Text) = '' then
      reg.DT_CRC := ''
    else
      reg.DT_CRC := StringReplace(pegaValor(query, 'DT_CRC'),'/','',[rfReplaceAll]);
    reg.IND_RESP_LEGAL := pegaValor(query, 'IND_RESP_LEGAL');
    reg.grava;
    reg.Free;
    reg := nil;

    query.Next;
  end;

  fechaQuery(query);
end;

procedure TContabil.RegistroJ990(QtdLinhas: Double);
var reg: TRegistroJ990;
begin
  reg := TRegistroJ990.Create(TObject(Self), arquivo);
  reg.QTD_LIN_J := QtdLinhas;
  reg.grava;
  reg.Free;
  reg := nil;
end;

procedure TContabil.Registro9999(QtdLinhas: Double);
var reg: TRegistro9999;
begin
  reg := TRegistro9999.Create(TObject(Self), arquivo);
  reg.QTD_LIN := QtdLinhas;
  reg.grava;
  reg.Free;
  reg := nil;
end;

procedure TContabil.Registro9001;
var reg: TContabil9001;
begin
  reg := TContabil9001.Create(TObject(Self), arquivo);
  reg.IND_DAD := 1;
  reg.grava;
  reg.Free;
  reg := nil;
end;

procedure TContabil.Registro9990(QtdLinhas: Double);
var reg: TRegistro9990;
begin
  reg := TRegistro9990.Create(TObject(Self), arquivo);
  reg.QTD_LIN_9 := QtdLinhas;
  reg.grava;
  reg.Free;
  reg := nil;
  thread.tela.GProgresso.AddProgress(4);
end;

function TContabil.localizaRegistro(vetor: array of string; registro: string): Integer;
var i: Integer;
begin
  for i := 0 to Length(vetor) - 1 do
    if vetor[i] = registro then
    begin
      Result := i;
      Exit;
    end;
  Result := -1;
end;

function TContabil.recuperaValor(texto: string; posicao: Integer): string;
var i, cont, posicaoIni, posicaoFin: Integer;
begin
  cont := 0;
  for i := 1 to length(texto) do
  begin
    if texto[i] = '|' then
    begin
      Inc(cont);
      if cont = posicao then
        posicaoIni := i;
      if cont > posicao then
      begin
        posicaoFin := i;
        Break;
      end;
    end;
  end;

  Result := copy(texto, posicaoIni + 1, posicaoFin - posicaoIni - 1);
end;

function TContabil.alteraValor(texto: string; posicao: Integer; textoNovo: string): string;
var i, cont, posicaoIni, posicaoFin: Integer;
begin
  cont := 0;
  posicaoIni := 0;
  posicaoFin := 0;
  for i := 1 to length(texto) do
  begin
    if texto[i] = '|' then
    begin
      Inc(cont);
      if cont = posicao then
        posicaoIni := i;
      if cont > posicao then
      begin
        posicaoFin := i;
        Break;
      end;
    end;
  end;

  if (cont <= posicao) and (posicaoFin = 0) then
    Result := texto
  else
  begin
    Result := copy(texto, 1, posicaoIni);
    Result := Result + textoNovo;
    Result := Result + copy(texto, posicaoFin, length(texto));
  end;
end;

procedure TContabil.atualizaTotalizadorEIndicadorBloco;
var movimento: string;
  reg: TRegistro9900;
  query, query1, query2: TOracleDataSet1;
begin
  // --- Totaliza e seta o indicador dos blocos --- //

  query := executaQuery(DmSped.QBlocos, True);

//  DmSped.QBlocos.Close;
//  DmSped.QBlocos.open;
  query.First;

  while not query.Eof do
  begin
    query1 := executaQuery(DmSped.QProcuraRegistro);
    query1.SetVariable('DESC_BLOCO', pegaValor(query, 'DESC_BLOCO'));
    query1.SetVariable('DESC_REGISTRO', '990');
    query1.Open;
//    DmSped.QProcuraRegistro.Close;
//    DmSped.QProcuraRegistro.SetVariable('DESC_BLOCO', DmSped.QBlocosDESC_BLOCO.Value);
//    DmSped.QProcuraRegistro.SetVariable('DESC_REGISTRO', '990');
//    DmSped.QProcuraRegistro.open;
    if (not query1.IsEmpty) then
    begin
      query2 := executaQuery(DmSped.QContaBloco);
      query2.SetVariable('DESC_BLOCO', pegaValor(query, 'DESC_BLOCO'));
      query2.Open;
//      DmSped.QContaBloco.Close;
//      DmSped.QContaBloco.SetVariable('DESC_BLOCO', DmSped.QBlocosDESC_BLOCO.Value);
//      DmSped.QContaBloco.open;
      DmSped.QUpSped.Close;
      DmSped.QUpSped.SetVariable('COD_REGISTRO', pegaValor(query1, 'COD_REGISTRO'));
      DmSped.QUpSped.SetVariable('DESC_CONTEUDO', alteraValor(pegaValor(query1, 'DESC_CONTEUDO'), 2, IntToStr(pegaValor(query2, 'TOTAL'))));
      try
        DmSped.QUpSped.ExecSQL;
      except
        DMOracle.DBCemapa.Rollback;
        MessageDlg('Erro na gravação.', mtError, [mbOK], 0);
        Abort;
      end;
    end;

    query1 := executaQuery(DmSped.QProcuraRegistro);
    query1.SetVariable('DESC_BLOCO', pegaValor(query, 'DESC_BLOCO'));
    query1.SetVariable('DESC_REGISTRO', '001');
    query1.Open;
//    DmSped.QProcuraRegistro.Close;
//    DmSped.QProcuraRegistro.SetVariable('DESC_BLOCO', DmSped.QBlocosDESC_BLOCO.Value);
//    DmSped.QProcuraRegistro.SetVariable('DESC_REGISTRO', '001');
//    DmSped.QProcuraRegistro.open;
    if (not query1.IsEmpty) then
    begin
      query2 := executaQuery(DmSped.QContaBloco);
      query2.SetVariable('DESC_BLOCO', pegaValor(query, 'DESC_BLOCO'));
      query2.Open;
//      DmSped.QContaBloco.Close;
//      DmSped.QContaBloco.SetVariable('DESC_BLOCO', DmSped.QBlocosDESC_BLOCO.Value);
//      DmSped.QContaBloco.open;
      if pegaValor(query2, 'TOTAL') > 2 then
        movimento := '0'
      else
        movimento := '1';
      DmSped.QUpSped.Close;
      DmSped.QUpSped.SetVariable('COD_REGISTRO', pegaValor(query1, 'COD_REGISTRO'));
      DmSped.QUpSped.SetVariable('DESC_CONTEUDO', alteraValor(pegaValor(query1, 'DESC_CONTEUDO'), 2, movimento));
      try
        DmSped.QUpSped.ExecSQL;
      except
        DMOracle.DBCemapa.Rollback;
        MessageDlg('Erro na gravação.', mtError, [mbOK], 0);
        Abort;
      end;
    end;

    query.Next;
  end;
  if query <> nil then
  begin
    fechaQuery(query);
    query := nil;
  end;
  if query1 <> nil then
  begin
    fechaQuery(query1);
    query1 := nil;
  end;
  if query2 <> nil then
  begin
    fechaQuery(query2);
    query2 := nil;
  end;

  // --- Cria os objetos do registro 9900 --- //

  query := executaQuery(DmSped.QRegistros, True);
//  DmSped.QRegistros.Close;
//  DmSped.QRegistros.open;
  query.First;

  while not query.Eof do
  begin
    reg := TRegistro9900.Create(TObject(Self), arquivo);
    reg.REG_BLC := pegaValor(query, 'DESC_BLOCO') + pegaValor(query, 'DESC_REGISTRO');
    reg.QTD_REG_BLC := 0;
    reg.grava;
    reg.Free;
    reg := nil;

    query.Next;
  end;
  if query <> nil then
  begin
    fechaQuery(query);
    query := nil;
  end;

  reg := TRegistro9900.Create(TObject(Self), arquivo);
  reg.REG_BLC := '9900';
  reg.QTD_REG_BLC := 0;
  reg.grava;
  reg.Free;
  reg := nil;

  // --- Altera as quantidades --- //
  thread.mostramensagem('Totalizando Registro 9990');

  query := executaQuery(DmSped.QProcuraRegistro);
  query.SetVariable('DESC_BLOCO', '9');
  query.SetVariable('DESC_REGISTRO', '990');
  query.Open;
//  DmSped.QProcuraRegistro.Close;
//  DmSped.QProcuraRegistro.SetVariable('DESC_BLOCO', '9');
//  DmSped.QProcuraRegistro.SetVariable('DESC_REGISTRO', '990');
//  DmSped.QProcuraRegistro.open;
  if (not query.IsEmpty) then
  begin
    query1 := executaQuery(DmSped.QContaBloco);
    query1.SetVariable('DESC_BLOCO', '9');
    query1.Open;
//    DmSped.QContaBloco.Close;
//    DmSped.QContaBloco.SetVariable('DESC_BLOCO', '9');
//    DmSped.QContaBloco.open;
    DmSped.QUpSped.Close;
    DmSped.QUpSped.SetVariable('COD_REGISTRO', pegaValor(query, 'COD_REGISTRO'));
    DmSped.QUpSped.SetVariable('DESC_CONTEUDO', alteraValor(pegaValor(query, 'DESC_CONTEUDO'), 2, IntToStr(pegaValor(query1, 'TOTAL'))));
    try
      DmSped.QUpSped.ExecSQL;
    except
      DMOracle.DBCemapa.Rollback;
      MessageDlg('Erro na gravação.', mtError, [mbOK], 0);
      Abort;
    end;
  end;
  if query <> nil then
  begin
    fechaQuery(query);
    query := nil;
  end;
  if query1 <> nil then
  begin
    fechaQuery(query1);
    query1 := nil;
  end;

  thread.mostramensagem('Totalizando Registro 9999');

  query := executaQuery(DmSped.QProcuraRegistro);
  query.SetVariable('DESC_BLOCO', '9');
  query.SetVariable('DESC_REGISTRO', '999');
  query.Open;
//  DmSped.QProcuraRegistro.Close;
//  DmSped.QProcuraRegistro.SetVariable('DESC_BLOCO', '9');
//  DmSped.QProcuraRegistro.SetVariable('DESC_REGISTRO', '999');
//  DmSped.QProcuraRegistro.open;
  query1 := executaQuery(DmSped.QConta, True);
//  DmSped.QConta.Close;
//  DmSped.QConta.open;
  DmSped.QUpSped.Close;
  DmSped.QUpSped.SetVariable('COD_REGISTRO', pegaValor(query, 'COD_REGISTRO'));
  DmSped.QUpSped.SetVariable('DESC_CONTEUDO', alteraValor(pegaValor(query, 'DESC_CONTEUDO'), 2, IntToStr(pegaValor(query1, 'TOTAL'))));
  try
    DmSped.QUpSped.ExecSQL;
  except
    DMOracle.DBCemapa.Rollback;
    MessageDlg('Erro na gravação.', mtError, [mbOK], 0);
    Abort;
  end;
  if query <> nil then
  begin
    fechaQuery(query);
    query := nil;
  end;
  if query1 <> nil then
  begin
    fechaQuery(query1);
    query1 := nil;
  end;

  // --- Altera os códigos --- //
  thread.mostramensagem('Gerenciando Código 9990');

  query := executaQuery(DmSped.QProcuraRegistro);
  query.SetVariable('DESC_BLOCO', '9');
  query.SetVariable('DESC_REGISTRO', '990');
  query.Open;
//  DmSped.QProcuraRegistro.Close;
//  DmSped.QProcuraRegistro.SetVariable('DESC_BLOCO', '9');
//  DmSped.QProcuraRegistro.SetVariable('DESC_REGISTRO', '990');
//  DmSped.QProcuraRegistro.open;
  query1 := executaQuery(DmSped.QMaxRegistro, True);
//  DmSped.QMaxRegistro.Close;
//  DmSped.QMaxRegistro.open;
  DmSped.QAlteraCodigo.Close;
  DmSped.QAlteraCodigo.SetVariable('COD_REGISTRO', pegaValor(query, 'COD_REGISTRO'));
  DmSped.QAlteraCodigo.SetVariable('COD_REGISTRO_NOVO', pegaValor(query1, 'MAXIMO') + 1);
  try
    DmSped.QAlteraCodigo.ExecSQL;
  except
    DMOracle.DBCemapa.Rollback;
    MessageDlg('Erro na gravação.', mtError, [mbOK], 0);
    Abort;
  end;
  if query <> nil then
  begin
    fechaQuery(query);
    query := nil;
  end;
  if query1 <> nil then
  begin
    fechaQuery(query1);
    query1 := nil;
  end;

  thread.mostramensagem('Gerenciando Código 9999');

  query := executaQuery(DmSped.QProcuraRegistro);
  query.SetVariable('DESC_BLOCO', '9');
  query.SetVariable('DESC_REGISTRO', '999');
  query.Open;
//  DmSped.QProcuraRegistro.Close;
//  DmSped.QProcuraRegistro.SetVariable('DESC_BLOCO', '9');
//  DmSped.QProcuraRegistro.SetVariable('DESC_REGISTRO', '999');
//  DmSped.QProcuraRegistro.open;
  query1 := executaQuery(DmSped.QMaxRegistro, True);
//  DmSped.QMaxRegistro.Close;
//  DmSped.QMaxRegistro.open;
  DmSped.QAlteraCodigo.Close;
  DmSped.QAlteraCodigo.SetVariable('COD_REGISTRO', pegaValor(query, 'COD_REGISTRO'));
  DmSped.QAlteraCodigo.SetVariable('COD_REGISTRO_NOVO', pegaValor(query1, 'MAXIMO') + 1);
  try
    DmSped.QAlteraCodigo.ExecSQL;
  except
    DMOracle.DBCemapa.Rollback;
    MessageDlg('Erro na gravação.', mtError, [mbOK], 0);
    Abort;
  end;
  if query <> nil then
  begin
    fechaQuery(query);
    query := nil;
  end;
  if query1 <> nil then
  begin
    fechaQuery(query1);
    query1 := nil;
  end;

  // --- Altera o Campo QTD_LIN do Registro I030 --- //

  thread.mostramensagem('Atualizando Registro I030');

  query := executaQuery(DmSped.QProcuraRegistro);
  query.SetVariable('DESC_BLOCO', 'I');
  query.SetVariable('DESC_REGISTRO', '030');
  query.Open;
//  DmSped.QProcuraRegistro.Close;
//  DmSped.QProcuraRegistro.SetVariable('DESC_BLOCO', 'I');
//  DmSped.QProcuraRegistro.SetVariable('DESC_REGISTRO', '030');
//  DmSped.QProcuraRegistro.open;
  query1 := executaQuery(DmSped.QConta, True);
//  DmSped.QConta.Close;
//  DmSped.QConta.open;
  if ((not query.IsEmpty) and (not (eNulo(query, 'COD_REGISTRO')))) then
  begin
    DmSped.QUpSped.Close;
    DmSped.QUpSped.SetVariable('COD_REGISTRO', pegaValor(query, 'COD_REGISTRO'));
    DmSped.QUpSped.SetVariable('DESC_CONTEUDO', alteraValor(pegaValor(query, 'DESC_CONTEUDO'), 5, IntToStr(pegaValor(query1, 'TOTAL'))));
    try
      DmSped.QUpSped.ExecSQL;
    except
      DMOracle.DBCemapa.Rollback;
      MessageDlg('Erro na gravação.', mtError, [mbOK], 0);
      Abort;
    end;
  end;
  if query <> nil then
  begin
    fechaQuery(query);
    query := nil;
  end;
  if query1 <> nil then
  begin
    fechaQuery(query1);
    query1 := nil;
  end;

  // --- Altera o Campo QTD_LIN do Registro J900 --- //

  thread.mostramensagem('Totalizando Registro J900');

  query := executaQuery(DmSped.QProcuraRegistro);
  query.SetVariable('DESC_BLOCO', 'J');
  query.SetVariable('DESC_REGISTRO', '900');
  query.Open;
//  DmSped.QProcuraRegistro.Close;
//  DmSped.QProcuraRegistro.SetVariable('DESC_BLOCO', 'J');
//  DmSped.QProcuraRegistro.SetVariable('DESC_REGISTRO', '900');
//  DmSped.QProcuraRegistro.open;
  query1 := executaQuery(DmSped.QConta, True);
//  DmSped.QConta.Close;
//  DmSped.QConta.open;
  if ((not query.IsEmpty) and (not (eNulo(query, 'COD_REGISTRO')))) then
  begin
    DmSped.QUpSped.Close;
    DmSped.QUpSped.SetVariable('COD_REGISTRO', pegaValor(query, 'COD_REGISTRO'));
    DmSped.QUpSped.SetVariable('DESC_CONTEUDO', alteraValor(pegaValor(query, 'DESC_CONTEUDO'), 6, IntToStr(pegaValor(query1, 'TOTAL'))));
    try
      DmSped.QUpSped.ExecSQL;
    except
      DMOracle.DBCemapa.Rollback;
      MessageDlg('Erro na gravação.', mtError, [mbOK], 0);
      Abort;
    end;
  end;
  if query <> nil then
  begin
    fechaQuery(query);
    query := nil;
  end;
  if query1 <> nil then
  begin
    fechaQuery(query1);
    query1 := nil;
  end;

  // --- Altera a quantidade nos registros 9900 --- //

  thread.mostramensagem('Totalizando Registros 9900');

  query := executaQuery(DmSped.QProcuraRegistro);
  query.SetVariable('DESC_BLOCO', '9');
  query.SetVariable('DESC_REGISTRO', '900');
  query.Open;
//  DmSped.QProcuraRegistro.Close;
//  DmSped.QProcuraRegistro.SetVariable('DESC_BLOCO', '9');
//  DmSped.QProcuraRegistro.SetVariable('DESC_REGISTRO', '900');
//  DmSped.QProcuraRegistro.open;
  query.First;

  while not query.Eof do
  begin
    query1 := executaQuery(DmSped.QContaRegistro);
    query1.SetVariable('DESC_BLOCO', copy(recuperaValor(pegaValor(query, 'DESC_CONTEUDO'), 2), 1, 1));
    query1.SetVariable('DESC_REGISTRO', copy(recuperaValor(pegaValor(query, 'DESC_CONTEUDO'), 2), 2, 3));
    query1.Open;
//      DmSped.QContaRegistro.Close;
//      DmSped.QContaRegistro.SetVariable('DESC_BLOCO', copy(recuperaValor(DmSped.QProcuraRegistroDESC_CONTEUDO.Value, 2), 1, 1));
//      DmSped.QContaRegistro.SetVariable('DESC_REGISTRO', copy(recuperaValor(DmSped.QProcuraRegistroDESC_CONTEUDO.Value, 2), 2, 3));
//      DmSped.QContaRegistro.open;
    DmSped.QUpSped.Close;
    DmSped.QUpSped.SetVariable('COD_REGISTRO', pegaValor(query, 'COD_REGISTRO'));
    DmSped.QUpSped.SetVariable('DESC_CONTEUDO', alteraValor(pegaValor(query, 'DESC_CONTEUDO'), 3, IntToStr(pegaValor(query1, 'TOTAL'))));
    try
      DmSped.QUpSped.ExecSQL;
    except
      DMOracle.DBCemapa.Rollback;
      MessageDlg('Erro na gravação.', mtError, [mbOK], 0);
      Abort;
    end;

    query.Next;
  end;
  if query <> nil then
  begin
    fechaQuery(query);
    query := nil;
  end;
  if query1 <> nil then
  begin
    fechaQuery(query1);
    query1 := nil;
  end;

//  DmSped.QProcuraRegistro.Close;
//  DmSped.QBlocos.Close;
//  DmSped.QContaBloco.Close;
//  DmSped.QRegistros.Close;
//  DmSped.QMaxRegistro.Close;
//  DmSped.QConta.Close;
end;

//function TContabil.geraStringFiliais(separador: string = ', '): string;
//var i: Integer;
//  str: string;
//begin
//  if wFiliais.Count = 0 then
//  begin
//    Result := '';
//    Exit;
//  end;
//
//  str := '';
//  for i := 0 to wFiliais.Count - 1 do
//  begin
//    try
//      StrToInt(wFiliais[i]);
//      str := str + wFiliais[i];
//    except
//      str := str + '0';
//    end;
//    if i < wFiliais.Count - 1 then
//      str := str + separador;
//  end;
//  str := '(' + str + ')';
//
//  Result := str;
//end;

end.
