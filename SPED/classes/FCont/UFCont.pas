unit UFCont;

interface

uses
  Controls, SysUtils, Windows, Forms, UThreadLocal, OraTeste, UBiblioteca,
  Classes,

  Arquivo,
  FCont0000,
  FContI001, FContI050, FContI051, FContI075, FContI100,
  FContI150, FContI155, FContI156, FContI200, FContI250,
  FContI256, FContI350, FContI356, FContI990,
  FContJ001, FContJ930, FContJ990,
  FContM001, FContM020, FContM025, FContM030, FContM155,
  FContM355, FContM990,
  FCont9001, FCont9900, FCont9990, FCont9999;

type
  TFCont = class
  private
    wFilial: Integer;
    wDataIni, wDataFin: TDate;
    wFiliais: TStrings;
    arquivo: TArquivo;
    query: TOracleDataSet1; 

    function localizaRegistro(vetor: array of string; registro: string): Integer;
    function recuperaValor(texto: string; posicao: Integer): string;
    function alteraValor(texto: string; posicao: Integer; textoNovo: string): string;
    procedure atualizaTotalizadorEIndicadorBloco;
    procedure Execute;
    function geraStringFiliais(separador: string = ', '): string;
    procedure FCont0000;
    procedure FContI001;
    procedure FContI050;
    procedure FContI051(codPlanoConta: Integer);
    procedure FContI075;
    procedure FContI100;
    procedure FContI150;
    procedure FContI155(data: TDate);
    procedure FContI350;

  public
    thread: TThreadLocal;
    procedure Gerar;
    constructor Create(DataIni, DataFin: TDate; Filiais: TStrings; wMatriz: Integer = 1);
  end;

implementation

uses UOracle_cl, DB, UFuncoes, Registro, Dialogs, USped_cl, Variants,
  OracleData, DateUtils, UFCont0_cl, UFilial_cl, UFContI_cl;

constructor TFCont.Create(DataIni, DataFin: TDate; Filiais: TStrings; wMatriz: Integer = 1);
begin
  if wMatriz = 0 then
    wFilial := 1
  else
    wFilial := wMatriz;
  wDataIni := DataIni;
  wDataFin := DataFin;
  wFiliais := Filiais;

  inherited Create;
end;

procedure TFCont.Execute;
var
  path: string;
begin
  thread.mostramensagem('Inicializando geração');

  path := ExtractFilePath(Application.ExeName);
  if not DirectoryExists(path + 'SPED') then
    CreateDir(path + 'SPED');
  if not DirectoryExists(path + 'SPED\FCONT') then
    CreateDir(path + 'SPED\FCONT');
  arquivo := TArquivo.Create(path + 'SPED\FCONT\SPED-FCONT_gerado_em_' + FormatDateTime('yyyy-MM-dd_hh-mm-ss', Date + Time) + '_competencia_' + FormatDateTime('yyyy-MM-dd', wDataIni) + '_' + FormatDateTime('yyyy-MM-dd', wDataFin) + '_filiais_' + geraStringFiliais('-') + '.txt');

  FCont0000;
  //FCont9999(0);

  thread.mostramensagem('Ajustando totalizadores');
  atualizaTotalizadorEIndicadorBloco;

  thread.mostramensagem('Gerando arquivo texto');
  arquivo.geraArquivo;

  arquivo.Destroy;
  thread.mostramensagem('Arquivo gerado');
end;

procedure TFCont.Gerar;
var
  teste: string;
begin
  try
    Execute;
  except
    on e: Exception do
      thread.avisaErro('Erro na geração do SPED PIS/Cofins.' + #13 + #10 + e.Message);
  end;
end;

procedure TFCont.FCont0000;
var reg: TFCont0000;
query: TOracleDataSet1;
begin
  query := executaQuery(dm);
  query.SetVariable('FILIAIS', bib.geraStringFiliais(wFiliais));
  if not abreQuery(query) then Exit;

  reg := TFCont0000.Create(TObject(Self), arquivo);
  reg.ID_ARQ := 'LALU';
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
  reg.IND_SIT_INI_PER := 0;
  reg.grava;
  reg.Free;
  reg := nil;
  fechaQuery(query);

  FContI001;
//  FContI990;
//  FContJ001;
//  FContJ990;
//  FContM001;
//  FContM990;
//  FCont9001;
//  FCont9990;
end;

procedure TFCont.FContI001;
var reg: TFContI001;
begin
  reg := TFContI001.Create(TObject(Self), arquivo);
  reg.IND_DAD := 1;
  reg.grava;
  reg.Free;
  reg := nil;

  FContI050;
  FContI075;
  FContI100;
end;

procedure TFCont.FContI050;
var reg: TFContI050;
  query: TOracleDataSet1;
  super, indConta: string;
begin
  query := executaQuery(DmFContI.QReg050);
  if not abreQuery(query) then Exit;

  query.First;
  while not query.Eof do
  begin
    reg := TFContI050.Create(TObject(Self), arquivo);
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
      FContI051(pegaValor(query, 'COD_PLANO_CONTA'));
    end;

    query.Next;
  end;
  fechaQuery(query);
end;

procedure TFCont.FContI051(codPlanoConta: Integer);
var reg: TFContI051;
  query: TOracleDataSet1;
  numPlanoContaReferencial: string;
  contaLendo: Integer;
begin
  query := executaQuery(DmFContI.QReg051);
  if not abreQuery(query) then Exit;

  if eNulo(query, 'NUM_PLANO_CONTA_REFERENCIAL') then
    numPlanoContaReferencial := ''
  else
    numPlanoContaReferencial := pegaValor(query, 'NUM_PLANO_CONTA_REFERENCIAL');
  contaLendo := codPlanoConta;
  fechaQuery(query);

  while numPlanoContaReferencial = '' do
  begin
    contaLendo := leContaAnterior(contaLendo);

    query := executaQuery(DmFContI.QReg051);
    abreQuery(query);

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

  reg := TFContI051.Create(TObject(Self), arquivo);
  reg.COD_ENT_REF := '10';
  reg.COD_CCUS := '';
  reg.COD_CTA_REF := numPlanoContaReferencial;
  reg.grava;
  reg.Free;
  reg := nil;
end;

procedure TFCont.FContI075;
var reg: TFContI075;
query: TOracleDataSet1;
begin
  query := executaQuery(DmFContI.QReg075);
  if not abreQuery(query) then Exit;

  query.First;
  while not query.Eof do
  begin
    reg := TFContI075.Create(TObject(Self), arquivo);
    reg.COD_HIST := IntToStr(pegaValor(query, 'COD_HISTORICO_CONTABIL'));
    reg.DESCR_HIST := pegaValor(query, 'DESC_HISTORICO_CONTABIL');
    reg.grava;
    reg.Free;
    reg := nil;

    query.Next;
  end;
  fechaQuery(query);
end;

procedure TFCont.FContI100;
var reg: TFContI100;
begin
//  reg := TFContI100.Create(TObject(Self), arquivo);
//  reg.grava;
//  reg.Free;
//  reg := nil;
end;

procedure TFCont.FContI150;
var reg: TFContI150;
  diaIni, mesIni, anoIni, diaFin, mesFin, anoFin: Word;
  dataIniAux, dataFinAux: TDate;
  i: Integer;
begin
  DecodeDate(wDataIni, anoIni, mesIni, diaIni);
  DecodeDate(wDataFin, anoFin, mesFin, diaFin);

  for i := mesIni to mesFin do
  begin
    reg := TFContI150.Create(TObject(Self), arquivo);

    Bib.PriUltDataVar(dataIniAux, dataFinAux, True, StrToDate('01/' + FormatFloat('00', i) + '/' + FormatFloat('0000', anoIni)));

    reg.DT_INI := dataIniAux;
    reg.DT_FIN := dataFinAux;
    reg.grava;
    reg.Free;
    reg := nil;

    FContI155(dataIniAux);
  end;
end;

procedure TFCont.FContI155(data: TDate);
var reg: TFContI155;
  AnoMes: Integer;
  dia, mes, ano: Word;
begin
  DecodeDate(data, ano, mes, dia);
  AnoMes := StrToInt(IntToStr(ano) + FormatFloat('00', mes));

  query := executaQuery(DmFContI.QReg155);
  if Bib.geraStringFiliais(wFiliais) <> '' then
    query.SetVariable('FILIAIS', Bib.geraStringFiliais(wFiliais))
  else
    query.SetVariable('FILIAIS', '(SELECT COD_FILIAL FROM TB_FILIAL)');
  query.SetVariable('DT_ANO_MES', AnoMes);
  query.open;

  if not abreQuery(query) then Exit;

  query.First;
  while not query.Eof do
  begin
    reg := TFContI155.Create(TObject(Self), arquivo);
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
    reg.VL_DEB := pegaValor(query, 'VAL_DEBITO');
    reg.VL_CRED := pegaValor(query, 'VAL_CREDITO');
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


procedure TFCont.FContI350;
var reg: TFContI350;
begin
  reg := TFContI350.Create(TObject(Self), arquivo);
  reg.DT_RES := wDataFin;
  reg.grava;
  reg.Free;
  reg := nil;
  //FContI355(wDataFin);
end;







function TFCont.localizaRegistro(vetor: array of string; registro: string): Integer;
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

function TFCont.alteraValor(texto: string; posicao: Integer; textoNovo: string): string;
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

procedure TFCont.atualizaTotalizadorEIndicadorBloco;
var movimento: string;
  reg: TFCont9900;
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
  fechaQuery(query);
  fechaQuery(query1);
  fechaQuery(query2);

  // --- Cria os objetos do registro 9900 --- //

  query := executaQuery(DmSped.QRegistros, True);
//  DmSped.QRegistros.Close;
//  DmSped.QRegistros.open;
  query.First;

  while not query.Eof do
  begin
    reg := TFCont9900.Create(TObject(Self), arquivo);
    reg.REG_BLC := pegaValor(query, 'DESC_BLOCO') + pegaValor(query, 'DESC_REGISTRO');
    reg.QTD_REG_BLC := 0;
    reg.grava;
    reg.Free;
    reg := nil;

    query.Next;
  end;
  fechaQuery(query);

  reg := TFCont9900.Create(TObject(Self), arquivo);
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
  fechaQuery(query);
  fechaQuery(query1);

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
  fechaQuery(query);
  fechaQuery(query1);

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
  fechaQuery(query);
  fechaQuery(query1);

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
  fechaQuery(query);
  fechaQuery(query1);

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
  fechaQuery(query);
  fechaQuery(query1);

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
  fechaQuery(query);
  fechaQuery(query1);

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
  fechaQuery(query);
  fechaQuery(query1);

//  DmSped.QProcuraRegistro.Close;
//  DmSped.QBlocos.Close;
//  DmSped.QContaBloco.Close;
//  DmSped.QRegistros.Close;
//  DmSped.QMaxRegistro.Close;
//  DmSped.QConta.Close;
end;

function TFCont.geraStringFiliais(separador: string = ', '): string;
var i: Integer;
  str: string;
begin
  if wFiliais.Count = 0 then
  begin
    Result := '';
    Exit;
  end;

  str := '';
  for i := 0 to wFiliais.Count - 1 do
  begin
    try
      StrToInt(wFiliais[i]);
      str := str + wFiliais[i];
    except
      str := str + '0';
    end;
    if i < wFiliais.Count - 1 then
      str := str + separador;
  end;
  str := '(' + str + ')';

  Result := str;
end;

function TFCont.recuperaValor(texto: string; posicao: Integer): string;
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

end.

