unit UContFisc;

interface

uses
  Controls, SysUtils, Windows, Forms, UThreadLocal, OraTeste, UBiblioteca,
  Classes, Arquivo;

type
  TDreHashMap = class
  private
    wConta: array of string;
    wValor: array of double;
  public
    constructor Create;

    procedure Clear;
    procedure addValue(pConta: string; pValor: double);
    //procedure destroy;

    function getValue(pConta: string): double;
    function getContaByIndex(pIndice: integer): string;
    function count: integer;
end;

type
  TContFisc = class
  private
    query: TOracleDataSet1;
    wFilial: Integer;
    IsTrimestral: boolean;
    wDataIni, wDataFin: TDate;
    wFiliais: TStrings;
    arquivo: TArquivo;
    function recuperaValor(texto: string; posicao: Integer): string;
    function alteraValor(texto: string; posicao: Integer; textoNovo: string): string;
    function buscaContaReferencial(pCodContaContabil: string): string;
    function calculaNivelContaReferencial(pNumContaReferencial: string): integer;
    function tipoContaReferencial(pNumContaReferencial: string): string; //sintética ou analítica
    function contaReferencialSuperior(pNumContaReferencial: string): string;
    function pegaVersao(pDataFin: TDate): Integer;
    procedure atualizaTotalizadorEIndicadorBloco;
    procedure Execute;
    procedure Registro0000;
    procedure Registro0001;
    procedure Registro0010;
    procedure Registro0020;
    procedure Registro0030;
    procedure Registro0930;
    procedure Registro0990(QtdLinhas: integer);
    procedure RegistroJ001;
    procedure RegistroJ050;
    procedure RegistroJ051(codPlanoConta: integer);
    procedure RegistroJ990(QtdLinhas: integer);
    procedure RegistroK001;
    procedure RegistroK030;
    procedure RegistroK155(pDataIni, pDataFin: TDate);
    procedure RegistroK355(pAnoMes: integer);
    procedure RegistroK990(QtdLInhas: integer);
    procedure RegistroL001;
    procedure RegistroL030;
    procedure RegistroL100(pDataIni, pDataFin: TDate);
    procedure RegistroL200;
    procedure RegistroL210(pDataFin: TDate);
    procedure RegistroL300(pDataIni, pDataFin: TDate);
    procedure RegistroL990(QtdLinhas: integer);
    procedure RegistroM030;
    procedure RegistroN001;
    procedure RegistroN030;
    procedure RegistroP001;
    procedure RegistroP030;
    procedure RegistroP100(pDataIni, pDataFin: TDate; PerApur: string);
    procedure RegistroP130;
    procedure RegistroP150(pDataIni, pDataFin: TDate);
    procedure RegistroP200;
    procedure RegistroP230;
    procedure RegistroP300;
    procedure RegistroP400;
    procedure RegistroP500;
    procedure RegistroP990(QtdLinhas: integer);
    procedure RegistroY001;
    procedure RegistroY600;
    procedure RegistroY990(QtdLinhas: integer);

  public
    thread: TThreadLocal;
    procedure Gerar;
    constructor Create(DataIni, DataFin: TDate; Filiais: TStrings; wMatriz: Integer = 1);
  end;

implementation
  uses UOracle_cl, DB, UFuncoes, UContFisc0_cl, UContFiscJ_cl, UContFiscK_cl,
    UContFiscL_cl, UContFiscM_cl, UContFiscP_cl, UContFiscY_cl,
    Registro, Dialogs, USped_cl, UDRE_cl, Variants,
    OracleData, DateUtils, ContFisc0000, ContFisc9900, ContFisc0001, ContFisc0010,
    ContFisc0020, ContFisc0030, ContFisc0930, ContFisc0990, ContFiscJ001,
    ContFiscJ050, ContFiscJ051, ContFiscJ990, ContFiscK001, ContFiscK030,
    ContFiscK155, ContFiscK156, ContFiscK355, ContFiscK356, ContFiscK990,
    ContFiscL001, ContFiscL030, ContFiscL100, ContFiscL200, ContFiscL210,
    ContFiscL300, ContFiscL990, ContFiscM001, ContFiscM010, ContFiscM030,
    ContFiscN001, ContFiscN030, ContFiscP001, ContFiscP030, ContfiscP100,
    ContFiscP150, ContFiscP990, ContFiscY001, ContFiscY600, ContFiscY990,
    StrUtils, UMostraDRE;


constructor TContFisc.Create(DataIni, DataFin: TDate; Filiais: TStrings; wMatriz: Integer = 1);
begin
  if wMatriz = 0 then
    wFilial := 1
  else
    wFilial := wMatriz;
  wDataIni := DataIni;
  wDataFin := DataFin;
  wFiliais := Filiais;

  inherited Create;
//  FreeOnTerminate := True;

end;

procedure TContFisc.Execute;
var
  path: string;
begin
  thread.mostramensagem('Inicializando geração');
  //SetLength(listaI250, 0);

  path := ExtractFilePath(Application.ExeName);
  if not DirectoryExists(path + 'SPED') then
    CreateDir(path + 'SPED');
  if not DirectoryExists(path + 'SPED\ECF') then
    CreateDir(path + 'SPED\ECF');
  arquivo := TArquivo.Create(path + 'SPED\ECF\SPED-ECF_gerado_em_' + FormatDateTime('yyyy-MM-dd_hh-mm-ss', Date + Time) + '_competencia_' + FormatDateTime('yyyy-MM-dd', wDataIni) + '_' + FormatDateTime('yyyy-MM-dd', wDataFin) + '_filiais_' + Bib.geraStringFiliais(wFiliais, '-') + '.txt');

  Registro0000;
  //Registro9999(0);

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

procedure TContFisc.Gerar;
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

procedure TContFisc.Registro0000;
var reg: TContFisc0000;
  query0010: TOracleDataSet1;
  forma_trib: integer;
  data : TDate;
begin
  query := executaQuery(DmContFisc0.QReg000);
  query.SetVariable('FILIAIS', '(' + IntToStr(wFilial) + ')');
  query.open;


  query0010 := executaQuery(DmContFisc0.QReg010);
  query0010.SetVariable('FILIAIS', '(' + IntToStr(wFilial) + ')');
  query0010.open;

  forma_trib := pegaValor(query0010, 'FORMA_TRIB');


  if query.IsEmpty then begin fechaQuery(query); Exit; end;

  reg := TContFisc0000.Create(TObject(Self), arquivo);
  reg.NOME_ESC := pegaValor(query, 'NOME_ESC');
  reg.COD_VER := pegaVersao(wDataIni);
  reg.CNPJ := pegaValor(query, 'CNPJ');
  reg.NOME := pegaValor(query, 'NOME');
  reg.IND_SIT_INI_PER := pegaValor(query, 'IND_SIT_INI_PER');
  reg.SIT_ESPECIAL := pegaValor(query, 'SIT_ESPECIAL');
  reg.PAT_REMAN_CIS := pegaValor(query, 'PAT_REMAN_CIS');
  reg.DT_SIT_ESP := pegaValor(query, 'DT_SIT_ESP');
  reg.DT_INI := wDataIni;
  reg.DT_FIN := wDataFin;
  reg.RETIFICADORA := 'N';
  reg.NUM_REC := '';
  reg.TIP_ECF := 0;
  reg.COD_SCP := pegaValor(query, 'COD_CSP');

  reg.grava;
  reg.Free;
  reg := nil;
  fechaQuery(query);

  thread.mostramensagem('Geração iniciada! Bloco 0000.');
  thread.tela.GProgresso.AddProgress(1);

  Registro0001;
  Registro0990(0);
  RegistroJ001;
  RegistroJ990(0);
  RegistroK001;
  RegistroK990(0);

  if forma_trib in [1,2] then
  begin
    RegistroL001;
    RegistroL990(0);
  end
  else
  begin
    // TO DO - será ajustado no futuro para ser possível carregar os valores corretos
    RegistroP001;
    RegistroP990(0);
  end;
  RegistroY001;
end;


procedure TContFisc.Registro0001;
var reg: TContFisc0001;
begin

  thread.mostramensagem('Gerando registro 0001.');

  reg := TContFisc0001.Create(TObject(Self), arquivo);
  reg.IND_DAD := 1;
  reg.grava;
  reg.Free;
  reg := nil;

  Registro0010;
  Registro0020;
  Registro0030;
  Registro0930;
end;


procedure TContFisc.atualizaTotalizadorEIndicadorBloco;
var movimento: string;
  reg: TContFisc9900;
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
    reg := TContFisc9900.Create(TObject(Self), arquivo);
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

  reg := TContFisc9900.Create(TObject(Self), arquivo);
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
end;

function TContFisc.alteraValor(texto: string; posicao: Integer; textoNovo: string): string;
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

function TContFisc.recuperaValor(texto: string; posicao: Integer): string;
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


procedure TContFisc.Registro0010;
var reg: TContFisc0010;
begin
  thread.mostramensagem('Gerando registro 0010.');
  query := executaQuery(DmContFisc0.QReg010);
  query.SetVariable('FILIAIS', '(' + IntToStr(wFilial) + ')');
  query.open;

  if query.IsEmpty then begin fechaQuery(query); Exit; end;

  isTrimestral := (pegaValor(query, 'FORMA_APUR') = 'T');

  reg := TContFisc0010.Create(TObject(Self), arquivo);
  reg.HASH_ECF_ANTERIOR := pegaValor(query, 'HASH_ECF_ANTERIOR');
  reg.OPT_REFIS := pegaValor(query, 'OPT_REFIS');
  //reg.OPT_PAES := pegaValor(query, 'OPT_PAES');
  reg.FORMA_TRIB := pegaValor(query, 'FORMA_TRIB');
  reg.FORMA_APUR := pegaValor(query, 'FORMA_APUR');
  reg.COD_QUALIF_PJ := pegaValor(query, 'COD_QUALIF_PJ');
  reg.FORMA_TRIB_PER := pegaValor(query, 'FORMA_TRIB_PER');
  reg.MES_BAL_RED := pegaValor(query, 'MES_BAL_RED');
  reg.TIP_ESC_PRE := pegaValor(query, 'TIP_ESC_PRE');
  reg.TIP_ENT := pegaValor(query, 'TIP_ENT');
  reg.FORMA_APUR_I := pegaValor(query, 'FORMA_APUR_I');
  reg.APUR_CSLL := pegaValor(query, 'APUR_CSLL');
  reg.IND_REC_RECEITA := pegaValor(query, 'IND_RECEITA');

  reg.grava;
  reg.Free;
  reg := nil;
  fechaQuery(query);

end;

procedure TContFisc.Registro0020;
var
  reg: TContFisc0020;
begin

  thread.mostramensagem('Gerando registro 0020.');

  query := executaQuery(DmContFisc0.QReg020);
  query.SetVariable('FILIAIS', '(' + IntToStr(wFilial) + ')');
  query.SetVariable('DT_INI', wDataIni);
  query.SetVariable('DT_FIN', wDataFin);
  query.open;

  if query.IsEmpty then begin fechaQuery(query); Exit; end;

  reg := TContFisc0020.Create(TObject(Self), arquivo);
  reg.IND_ALIQ_CSLL := pegaValor(query, 'IND_ALIQ_CSLL');
  reg.IND_QTE_SCP := pegaValor(query, 'IND_QTE_SCP');
  reg.IND_ADM_FUN_CLU := pegaValor(query, 'IND_ADM_FUN_CLU');
  reg.IND_PART_CONS := pegaValor(query, 'IND_PART_CONS');
  reg.IND_OP_EXT := pegaValor(query, 'IND_OP_EXT');
  reg.IND_OP_VINC := pegaValor(query, 'IND_OP_VINC');
  reg.IND_PJ_ENQUAD := pegaValor(query, 'IND_PJ_ENQUAD');
  reg.IND_PART_EXT := pegaValor(query, 'IND_PART_EXT');
  reg.IND_ATIV_RURAL := pegaValor(query, 'IND_ATIV_RURAL');
  reg.IND_LUC_EXP := pegaValor(query, 'IND_LUC_EXP');
  reg.IND_RED_ISEN := pegaValor(query, 'IND_RED_ISEN');
  reg.IND_FIN := pegaValor(query, 'IND_FIN');
  //reg.IND_DOA_ELEIT := pegaValor(query, 'IND_DOA_ELEIT');
  reg.IND_PART_COLIG := pegaValor(query, 'IND_PART_COLIG');
  //reg.IND_VEND_EXP := pegaValor(query, 'IND_VEND_EXP');
  reg.IND_REC_EXT := pegaValor(query, 'IND_REC_EXT');
  reg.IND_ATIV_EXT := pegaValor(query, 'IND_ATIV_EXT');
  //reg.IND_COM_EXP := pegaValor(query, 'IND_COM_EXP');
  reg.IND_PGTO_EXT := pegaValor(query, 'IND_PGTO_EXT');
  reg.IND_ECOM_TI := pegaValor(query,  'IND_ECOM_TI');
  reg.IND_ROY_REC := pegaValor(query, 'IND_ROY_REC');
  reg.IND_ROY_PAG := pegaValor(query, 'IND_ROY_PAG');
  reg.IND_REND_SERV := pegaValor(query, 'IND_REND_SERV');
  reg.IND_PGTO_REM := pegaValor(query, 'IND_PGTO_REM');
  reg.IND_INOV_TEC := pegaValor(query, 'IND_INOV_TEC');
  reg.IND_CAP_INF := pegaValor(query, 'IND_CAP_INF');
  reg.IND_PJ_HAB := pegaValor(query, 'IND_PJ_HAB');
  reg.IND_POLO_AM := pegaValor(query, 'IND_POLO_AM');
  reg.IND_ZON_EXP := pegaValor(query, 'IND_ZON_EXP');
  reg.IND_AREA_COM := pegaValor(query, 'IND_AREA_COM');
  reg.IND_PAIS_A_PAIS := pegaValor(query, 'IND_PAIS_A_PAIS');
  reg.IND_DEREX := pegaValor(query, 'IND_DEREX');
  reg.POSSUI_CEBRAS := pegaValor(query, 'POSSUI_CEBRAS');
  reg.CEBAS := pegaValor(query, 'CEBAS');  
  reg.grava;
  reg.Free;
  reg := nil;
  fechaQuery(query);

end;

procedure TContFisc.Registro0030;
var reg: TContFisc0030;
begin
  query := executaQuery(DmContFisc0.QReg030);
  query.SetVariable('FILIAIS', '(' + IntToStr(wFilial) + ')');
  query.open;

  if query.IsEmpty then begin fechaQuery(query); Exit; end;

  thread.mostramensagem('Gerando registro 0030.');

  reg := TContFisc0030.Create(TObject(Self), arquivo);
  reg.COD_NAT := pegaValor(query, 'COD_NAT');
  reg.CNAE_FISCAL := pegaValor(query, 'CNAE_FISCAL');
  reg.ENDERECO := pegaValor(query, 'ENDERECO');
  reg.NUM := pegaValor(query, 'NUM');
  reg.COMPL := pegaValor(query, 'COMPL');
  reg.BAIRRO := pegaValor(query, 'BAIRRO');
  reg.UF := pegaValor(query, 'UF');
  reg.COD_MUN := pegaValor(query, 'COD_MUN');
  reg.CEP := StringReplace(pegaValor(query, 'CEP'),'-','',
    [rfignorecase,rfreplaceall]);
  reg.NUM_TEL := pegaValor(query, 'NUM_TEL');
  reg.EMAIL := pegaValor(query, 'EMAIL');

  reg.grava;
  reg.Free;
  reg := nil;
  fechaQuery(query);

end;

procedure TContFisc.Registro0930;
var reg: TContFisc0930;
begin
  query := executaQuery(DmContFisc0.QReg930);
  query.SetVariable('FILIAIS', '(' + IntToStr(wFilial) + ')');
  query.open;

  if query.IsEmpty then begin fechaQuery(query); Exit; end;

  thread.mostramensagem('Gerando registro 0930.');
  thread.tela.GProgresso.AddProgress(5);

  while not query.eof do
  begin
    reg := TContFisc0930.Create(TObject(Self), arquivo);
    reg.IDENT_NOM := pegaValor(query, 'IDENT_NOM');
    reg.IDENT_CPF_CNPJ := pegaValor(query, 'IDENT_CPF_CNPJ');
    reg.IDENT_QUALIF := pegaValor(query, 'IDENT_QUALIF');
    reg.IND_CRC := pegaValor(query, 'IND_CRC');
    reg.EMAIL := pegaValor(query, 'EMAIL');
    reg.FONE := pegaValor(query, 'FONE');
    reg.grava;
    reg.Free;
    reg := nil;
    query.Next;
  end;
  fechaQuery(query);
end;

procedure TContFisc.Registro0990(QtdLinhas: integer);
var reg: TContFisc0990;
begin
  reg := TContFisc0990.Create(TObject(Self), arquivo);
  reg.QTD_LIN := QtdLinhas;
  reg.grava;
  reg.Free;
  reg := nil;
end;


procedure TContFisc.RegistroJ001;
var reg: TContFiscJ001;
begin
  thread.mostramensagem('Gerando registro J001.');

  reg := TContFiscJ001.Create(TObject(Self), arquivo);
  reg.IND_DAD := 1;
  reg.grava;
  reg.Free;
  reg := nil;

  RegistroJ050;
end;

procedure TContFisc.RegistroJ050;
var reg: TContFiscJ050;
  super: string;
begin
  query := executaQuery(DmContFiscJ.QReg050);
  query.SetVariable('FILIAIS', bib.geraStringFiliais(wFiliais));
  query.SetVariable('DT_FIN', wDataFin);
  query.open;

  if query.IsEmpty then begin fechaQuery(query); Exit; end;

  thread.mostramensagem('Gerando registro J050.');
  thread.tela.GProgresso.AddProgress(3);

  while not query.Eof do
  begin
    reg := TContFiscJ050.Create(TObject(Self), arquivo);
    reg.DT_ALT := wDataIni;
    reg.COD_NAT := pegaValor(query, 'COD_NAT');
    if eNulo(query, 'COD_REDUZIDO') then
    begin
      if pegaValor(query, 'NIVEL') = 1 then
        super := copy(pegaValor(query, 'COD_CTA'), 1, 1)
      else
        super := copy(pegaValor(query, 'COD_CTA'), 1, Integer((pegaValor(query, 'NIVEL') - 1) * 2 - 1));
    end
    else
    begin
      super := copy(pegaValor(query, 'COD_CTA'), 1, Integer((pegaValor(query, 'NIVEL') - 1) * 2 - 1));
    end;
    reg.IND_CTA := pegaValor(query, 'IND_CTA');
    reg.NIVEL := pegaValor(query, 'NIVEL');
    reg.COD_CTA := pegaValor(query, 'COD_CTA');
    if pegaValor(query, 'NIVEL') <> 1 then
      reg.COD_CTA_SUP := super;
    reg.CTA := pegaValor(query, 'CTA');
    reg.grava;
    reg.Free;
    reg := nil;

    if ((pegaValor(query, 'COD_NAT') = '01') or
      (pegaValor(query, 'COD_NAT') = '02') or
      (pegaValor(query, 'COD_NAT') = '03') or
      (pegaValor(query, 'COD_NAT') = '04')) and
      (pegaValor(query, 'IND_CTA') = 'A') then
      RegistroJ051(pegaValor(query, 'COD_PLANO_CONTA'));

    query.next;
  end;

  fechaQuery(query);
end;

procedure TContFisc.RegistroJ051(codPlanoConta: integer);
var reg: TContFiscJ051;
  query: TOracleDataSet1;
  numPlanoContaReferencial: string;
  contaLendo: Integer;
begin
  query := executaQuery(DMContFiscJ.QReg051);
  query.SetVariable('COD_PLANO_CONTA', codPlanoConta);
  query.open;

  thread.mostramensagem('Gerando registro J051.');

  if eNulo(query, 'COD_CTA_REF') then
  begin
    numPlanoContaReferencial := ''
  end
  else
  begin
    numPlanoContaReferencial := pegaValor(query, 'COD_CTA_REF')
  end;
  contaLendo := codPlanoConta;
  fechaQuery(query);

  while numPlanoContaReferencial = '' do
  begin
    contaLendo := leContaAnterior(contaLendo);
    query := executaQuery(DMContFiscJ.QReg051);
    query.SetVariable('COD_PLANO_CONTA', contaLendo);
    query.open;

    if ((not (eNulo(query, 'COD_CTA_REF'))) and (pegaValor(query, 'COD_CTA_REF') <> '')) then
      numPlanoContaReferencial := pegaValor(query, 'COD_CTA_REF');
    if ((query.IsEmpty) {or (pegaValor(query, 'NUM_GRAU') = 1)}) then
    begin
      fechaQuery(query);
      Break;
    end;
    fechaQuery(query);
  end;

  if numPlanoContaReferencial = '' then Exit;

  reg := TContFiscJ051.Create(TObject(Self), arquivo);
  reg.COD_CCUS := '';
  reg.COD_CTA_REF := numPlanoContaReferencial;
  reg.grava;
  reg.Free;
  reg := nil;
end;

procedure TContFisc.RegistroJ990(QtdLinhas: integer);
var reg: TContFiscJ990;
begin
  thread.tela.GProgresso.AddProgress(20);
  reg := TContFiscJ990.Create(TObject(Self), arquivo);
  reg.QTD_LIN := QtdLinhas;
  reg.grava;
  reg.Free;
  reg := nil;
end;

procedure TContFisc.RegistroK001;
var reg: TContFiscK001;
begin
  reg := TContFiscK001.Create(TObject(Self), arquivo);
  reg.IND_DAD := 1;
  reg.grava;
  reg.Free;
  reg := nil;

  RegistroK030;
end;

procedure TContFisc.RegistroK030;
var reg: TContFiscK030;
  wDataAux, wDataAuxFin, wDataIniParam: TDate;
  wDia, wMes, wAno: word;
  queryPerApur: TOracleDataSet1;
  wTrimestre: integer;
begin

  queryPerApur := executaQuery(DMContFisc0.QReg010);
  queryPerApur.SetVariable('FILIAIS', wFilial);
  queryPerApur.Open;


  if pegaValor(queryPerApur, 'FORMA_APUR') = 'A' then
  begin

    // Anual
    reg := TContFiscK030.Create(TObject(Self), arquivo);
    query := executaQuery(DMContFiscK.QReg030);
    query.SetVariable('DT_INI_PERIODO', wDataIni);
    query.SetVariable('DT_FIN_PERIODO', wDataFin);
    query.Open;

    if query.IsEmpty then begin fechaQuery(query); exit; end;

    thread.mostramensagem('Gerando registro K030.');

    reg := TContFiscK030.Create(TObject(Self), arquivo);
      reg.DT_INI := wDataIni;
      reg.DT_FIN := pegaValor(query, 'DT_FIN');
      reg.PER_APUR := pegaValor(query, 'PER_APUR');
      reg.grava;
      reg.Free;
      reg := nil;
      fechaQuery(query);

      RegistroK155(wDataIni, wDataFin);
      decodeDate(wDataFin, wAno, wMes, wDia);
      RegistroK355(strToInt(intToStr(wAno)+intToStr(wMes)));

    // Por mês

    wDataAux := wDataIni;
    wDataIniParam := wDataIni; //Registro K155 deve iniciar sempre em Janeiro
    while formatDateTime('yyyymm', wDataAux) <= formatDateTime('yyyymm', wDataFin) do
    begin
      wDataAuxFin := StrToDate(DMOracle.FastSelect('LAST_DAY('
        + quotedStr(DateToStr(wDataAux))
        + ')'
        , 'DUAL'
        , '1=1'));
      reg := TContFiscK030.Create(TObject(Self), arquivo);
      query := executaQuery(DMContFiscK.QReg030);
      query.SetVariable('DT_INI_PERIODO', wDataAux);
      query.SetVariable('DT_FIN_PERIODO', wDataAuxFin);

      query.open;

      if query.IsEmpty then begin fechaQuery(query); Exit; end;

      reg := TContFiscK030.Create(TObject(Self), arquivo);
      //reg.DT_INI := pegaValor(query, 'DT_INI');
      reg.DT_INI := wDataIni;
      reg.DT_FIN := pegaValor(query, 'DT_FIN');
      reg.PER_APUR := pegaValor(query, 'PER_APUR');
      reg.grava;
      reg.Free;
      reg := nil;
      fechaQuery(query);

      RegistroK155(wDataIniParam, wDataAuxFin);
      decodeDate(wDataAuxFin, wAno, wMes, wDia);
      RegistroK355(strToInt(intToStr(wAno)
        + bib.StrZero(intToStr(wMes), 2)));

      wDataAux := IncMonth(wDataAux);
    end;

  end   //PARA TRIMESTRAL
  else if pegaValor(queryPerApur, 'FORMA_APUR') = 'T' then
  begin
    wTrimestre := 1;
    wDataAux := wDataIni;
    wDataIniParam := wDataIni; //Registro K155 deve iniciar sempre em Janeiro

    while formatDateTime('yyyymm', wDataAux) <= formatDateTime('yyyymm', wDataFin) do
    begin
      wDataAuxFin := StrToDate(DMOracle.FastSelect('LAST_DAY('
        + quotedStr(DateToStr(wDataAux+80))
        + ')'
        , 'DUAL'
        , '1=1'));
      reg := TContFiscK030.Create(TObject(Self), arquivo);
      query := executaQuery(DMContFiscK.QReg030);
      query.SetVariable('DT_INI_PERIODO', wDataAux);
      query.SetVariable('DT_FIN_PERIODO', wDataAuxFin);

      query.open;

      if query.IsEmpty then begin fechaQuery(query); Exit; end;

      thread.mostramensagem('Gerando registro K030.');

      reg := TContFiscK030.Create(TObject(Self), arquivo);
      //reg.DT_INI := pegaValor(query, 'DT_INI');
      reg.DT_INI := wDataAux;
      reg.DT_FIN := pegaValor(query, 'DT_FIN');
      reg.PER_APUR := Format('T%.2d', [wTrimestre]);
      //reg.PER_APUR := pegaValor(query, 'PER_APUR');
      reg.grava;
      reg.Free;
      reg := nil;
      fechaQuery(query);

      RegistroK155(wDataIniParam, wDataAuxFin);
      decodeDate(wDataAuxFin, wAno, wMes, wDia);
      RegistroK355(strToInt(intToStr(wAno)
        + bib.StrZero(intToStr(wMes), 2)));

      wDataAux := IncMonth(wDataAux, 3);
      inc(wTrimestre);
    end;
  end;
end;

procedure TContFisc.RegistroK155(pDataIni, pDataFin: tdate);
var reg: TContFiscK155;
  AnoMesIni: integer;
  AnoMesFin: integer;
begin

  AnoMesIni := StrToInt(formatdatetime('yyyymm', pDataIni));
  AnoMesFin := StrToInt(formatdatetime('yyyymm', pDataFin));

  query := executaQuery(DMContFiscK.QReg155);
  if Bib.geraStringFiliais(wFiliais) <> '' then
    query.SetVariable('FILIAIS', Bib.geraStringFiliais(wFiliais))
  else
    query.SetVariable('FILIAIS', '(SELECT COD_FILIAL FROM TB_FILIAL)');
  query.SetVariable('DT_ANO_MES_INI', AnoMesIni);
  query.SetVariable('DT_ANO_MES_FIN', AnoMesFin);
  query.open;

  if query.IsEmpty then begin fechaQuery(query); Exit; end;

  thread.mostramensagem('Gerando registro K155.');
  thread.tela.GProgresso.AddProgress(10);

  query.First;
  while not query.Eof do
  begin
    reg := TContFiscK155.Create(TObject(Self), arquivo);
    reg.COD_CTA := pegaValor(query, 'COD_CTA');
    reg.COD_CCUS := '';
    reg.VL_SLD_INI := pegaValor(query, 'VL_SLD_INI');
    reg.IND_VL_SLD_INI := pegaValor(query, 'IND_VL_SLD_INI');
    reg.VL_DEB := ABS(pegaValor(query, 'VL_DEB'));
    reg.VL_CRED := ABS(pegaValor(query, 'VL_CRED'));
    reg.VL_SLD_FIN := pegaValor(query, 'VL_SLD_FIN');
    reg.IND_VL_SLD_FIN := pegaValor(query, 'IND_VL_SLD_FIN');
    reg.grava;
    reg.Free;
    reg := nil;

    query.Next;
  end;
  fechaQuery(query);
end;

procedure TContFisc.RegistroK355(pAnoMes: integer);
var reg: TContFiscK355;
  AnoMes: string;
  wDre: TDataSet;
begin
  AnoMes := IntToStr(pAnoMes);

  thread.mostramensagem('Gerando registro K355.');

    // Busca o saldo das contas no DRE
    with DMDRE do
    begin
      wDre := GeraDRE(StrToInt(Copy(AnoMes,5,2)), StrToInt(Copy(AnoMes,1,4))
        , wFiliais, false, true, isTrimestral);
      wDre.First;
      while not wDre.Eof do
      begin

        if wDre.FieldByName('COD_PLANO_CONTA').Value <= 0 then
        begin
          wDre.Next;
          continue;
        end
        else
          if DMOracle.FastSelect('DESC_NATUREZA_CONTA', 'TB_PLANO_CONTA'
            , 'COD_PLANO_CONTA = ' + wDre.FieldByName('COD_PLANO_CONTA').Text
            ) <> '04' then
          begin
            wDre.Next;
            continue;
          end
          else
            if DMOracle.FastSelect('IND_LIBERADO_USO', 'TB_PLANO_CONTA'
              , 'COD_PLANO_CONTA = ' + wDre.FieldByName('COD_PLANO_CONTA').Text
              ) = 'NAO' then
            begin
              wDre.Next;
              continue;
            end;

        reg := TContFiscK355.Create(TObject(Self), arquivo);
        reg.COD_CTA := DMOracle.FastSelect('NUM_PLANO_CONTA', 'TB_PLANO_CONTA'
            , 'COD_PLANO_CONTA = ' + wDre.FieldByName('COD_PLANO_CONTA').Text);
        reg.COD_CCUS := '';
        //reg.VL_SLD_FIN := pegaValor(query, 'VL_SLD_FIN');
        reg.VL_SLD_FIN := ABS(wDre.FieldByName('VAL_SALDO').Value);
        reg.IND_VL_SLD_FIN := IfThen (wDre.FieldByName('VAL_SALDO').Value >= 0, 'C', 'D');
        //reg.IND_VL_SLD_FIN := IfThen(DMDRE.QSaldoVAL_ATUAL.Value >= 0, 'D', 'C');
        reg.grava;
        reg.Free;
        reg := nil;
        wDre.Next;
      end;
    end;    
end;

procedure TContFisc.RegistroK990(QtdLInhas: integer);
var reg: TContFiscK990;
begin
  reg := TContFiscK990.Create(TObject(Self), arquivo);
  reg.QTD_LIN := QtdLinhas;
  reg.grava;
  reg.Free;
  reg := nil;
end;

procedure TContFisc.RegistroL001;
var reg: TContFiscL001;
begin
  reg := TContFiscL001.Create(TObject(Self), arquivo);
  reg.IND_DAD := 1;
  reg.grava;
  reg.Free;
  reg := nil;

  RegistroL030;
end;

{
procedure TContFisc.RegistroL030;
var reg: TContFiscL030;
  wDataAux: tdate;
begin
  wDataAux := wDataIni;
  while wDataAux <= wDataFin do
  begin
    reg := TContFiscL030.Create(TObject(Self), arquivo);
    query := executaQuery(DMContFiscL.QReg030);
    query.SetVariable('DT_INI_PERIODO', wDataAux);
    query.open;

    if query.IsEmpty then begin fechaQuery(query); Exit; end;

    reg := TContFiscL030.Create(TObject(Self), arquivo);
    reg.DT_INI := pegaValor(query, 'DT_INI');
    reg.DT_FIN := pegaValor(query, 'DT_FIN');
    reg.PER_APUR := pegaValor(query, 'PER_APUR');
    reg.grava;
    reg.Free;
    reg := nil;

    RegistroL100(StrToInt(formatdatetime('yyyymm', wDataAux)));
    fechaQuery(query);
    wDataAux := IncMonth(wDataAux);
  end;
  RegistroL200;
  RegistroL300;
end;
}

procedure TContFisc.RegistroL030;
var reg: TContFiscL030;
  wDataAux, wDataAuxFin, dtFinTrimestre: tdate;
  vTrimestre : integer;
  dia, ano, mes: Word;
begin


  if not isTrimestral then
  begin

    // Anual

    reg := TContFiscL030.Create(TObject(Self), arquivo);
    query := executaQuery(DMContFiscL.QReg030);
    query.SetVariable('DT_INI_PERIODO', wDataIni);
    query.SetVariable('DT_FIN_PERIODO', wDataFin);
    query.Open;

    if query.IsEmpty then begin fechaQuery(query); exit; end;

    reg := TContFiscL030.Create(TObject(Self), arquivo);
    reg.DT_INI := wDataIni;
    reg.DT_FIN := pegaValor(query, 'DT_FIN');
    reg.PER_APUR := pegaValor(query, 'PER_APUR');
    reg.grava;
    reg.Free;
    reg := nil;
    fechaQuery(query);

    RegistroL100(wDataIni, wDataFin);
    RegistroL200;
    RegistroL210(wDataFin);
    RegistroL300(wDataIni, wDataFin);

    // Por mês
    wDataAux := wDataIni;

    while formatDateTime('yyyymm', wDataAux) <= formatDateTime('yyyymm', wDataFin) do
    begin

      thread.mostramensagem('Registro L100.');
      thread.tela.GProgresso.AddProgress(5);


      wDataAuxFin := StrToDate(DMOracle.FastSelect('LAST_DAY('
        + quotedStr(DateToStr(wDataAux))
        + ')'
        , 'DUAL'
        , '1=1'));
      reg := TContFiscL030.Create(TObject(Self), arquivo);
      query := executaQuery(DMContFiscL.QReg030);
      query.SetVariable('DT_INI_PERIODO', wDataAux);
      query.SetVariable('DT_FIN_PERIODO', wDataAuxFin);
      query.open;

      if query.IsEmpty then begin fechaQuery(query); Exit; end;

      reg := TContFiscL030.Create(TObject(Self), arquivo);
      reg.DT_INI := wDataIni;
      reg.DT_FIN := pegaValor(query, 'DT_FIN');
      reg.PER_APUR := pegaValor(query, 'PER_APUR');
      reg.grava;
      reg.Free;
      reg := nil;
      fechaQuery(query);

      RegistroL100(wDataAux, wDataAuxFin);
      RegistroL200;
      RegistroL210(wDataAuxFin);
      RegistroL300(wDataAux, wDataAuxFin);
      wDataAux := IncMonth(wDataAux);
    end;
  end
  else
  begin

    wDataAux := wDataIni;

    for vTrimestre := 1 to 4 do
    begin

      thread.mostramensagem('Registro L100.');
      thread.tela.GProgresso.AddProgress(15);

      DecodeDate(wDataAux, ano, mes, dia);
      dtFinTrimestre := EndOfAMonth(ano, vTrimestre*3);

      reg := TContFiscL030.Create(TObject(Self), arquivo);
      reg.DT_INI := wDataAux;
      reg.DT_FIN := dtFinTrimestre;
      reg.PER_APUR := Format('T%.2d', [vTrimestre]);
      reg.grava;
      reg.Free;
      reg := nil;

      RegistroL100(wDataAux, dtFinTrimestre);
      RegistroL200;
      RegistroL210(dtFinTrimestre);
      RegistroL300(wDataAux, dtFinTrimestre);
      wDataAux := dtFinTrimestre + 1;

    end;
  end;  //LIBERAR AQUI   <<<------------------------------------------------------


  {
  wDataAux := wDataIni;
  while formatDateTime('yyyymm', wDataAux) <= formatDateTime('yyyymm', wDataFin) do
  begin
    reg := TContFiscL030.Create(TObject(Self), arquivo);
    query := executaQuery(DMContFiscL.QReg030);
    query.SetVariable('DT_INI_PERIODO', wDataAux);
    query.SetVariable('DT_FIN_PERIODO', wDataFin);
    query.open;

    if query.IsEmpty then begin fechaQuery(query); Exit; end;

    reg := TContFiscL030.Create(TObject(Self), arquivo);
    reg.DT_INI := pegaValor(query, 'DT_INI');
    reg.DT_FIN := pegaValor(query, 'DT_FIN');
    reg.PER_APUR := pegaValor(query, 'PER_APUR');
    reg.grava;
    reg.Free;
    reg := nil;
    fechaQuery(query);

    RegistroL100(StrToInt(formatdatetime('yyyymm', wDataAux)),
      StrToInt(formatdatetime('yyyymm', wDataFin)));
    RegistroL200;

    wDataAux := IncMonth(wDataFin);
  end;

  RegistroL300;
  }
end;

procedure TContFisc.RegistroL100(pDataIni, pDataFin: tdate);
var reg: TContFiscL100;
  query: TOracleDataSet1;
  wPeriodoIni, wPeriodoFin: integer;
begin
  wPeriodoIni := StrToInt(formatdatetime('yyyymm', pDataIni));
  wPeriodoFin := StrToInt(formatdatetime('yyyymm', pDataFin));
  
  reg := TContFiscL100.Create(TObject(Self), arquivo);
  query := executaQuery(DMContFiscL.QReg100);
  query.SetVariable('DT_ANO_MES_INI', wPeriodoIni);
  query.SetVariable('DT_ANO_MES_FIN', wPeriodoFin);
  query.SetVariable('FILIAIS', geraStringFiliais(wFiliais));
  query.SetVariable('TRIMESTRAL', IfThen(isTrimestral, 'SIM', 'NAO'));
  query.open;

  thread.mostramensagem('Gerando registro L100.');

  while not query.Eof do
  begin
    reg := TContFiscL100.Create(TObject(Self), arquivo);
    reg.CODIGO := pegaValor(query, 'CODIGO');
    reg.DESCRICAO := pegaValor(query, 'DESCRICAO');
    reg.TIPO := pegaValor(query, 'TIPO');
    reg.NIVEL := pegaValor(query, 'NIVEL');
    reg.COD_NAT := pegaValor(query, 'COD_NAT');
    reg.COD_CTA_SUP := pegaValor(query, 'COD_CTA_SUP');
    reg.VAL_CTA_REF_INI := pegaValor(query, 'VAL_CTA_REF_INI');
    reg.VAL_CTA_REF_DEB := pegaValor(query, 'VAL_CTA_REF_DEB');
    reg.VAL_CTA_REF_CRED := pegaValor(query, 'VAL_CTA_REF_CRED');
    reg.IND_VAL_CTA_REF_INI := pegaValor(query, 'IND_VAL_CTA_REF_INI');
    reg.VAL_CTA_REF_FIN := pegaValor(query,  'VAL_CTA_REF_FIN');
    reg.IND_VAL_CTA_REF_FIN := pegaValor(query, 'IND_VAL_CTA_REF_FIN');
    reg.grava;
    reg.Free;
    reg := nil;
    query.Next;
  end;
  fechaQuery(query);
end;

procedure TContFisc.RegistroL200;
var reg: TContFiscL200;
begin
    reg := TContFiscL200.Create(TObject(self), arquivo);
    reg.IND_AVAL_ESTOQ := '1'; // Custo médio
    reg.grava;
    reg.Free;
    reg := nil;
end;

procedure TContFisc.RegistroL210(pDataFin: TDate);
var reg: TContFiscL210;
  dia, ano, mes: Word;
  vSaldo : Double;
  wFiltro : string;
begin

decodeDate(pDataFin, ano, mes, dia);

  with DMContFiscL do
  begin
    query := executaQuery(QReg210Saldo);

    QReg210.Open;

    while not QReg210.Eof do
    begin
      vSaldo := 0;
      wFiltro := '(COD_COMPOSICAO_CUSTOS = ' + QReg210COD_COMPOSICAO_CUSTOS.Text  + ')';
      QReg210Contas.Filter := wFiltro;
      QReg210Contas.Filtered := True;
      QReg210Contas.Open;

      while not QReg210Contas.Eof do
      begin 

        query.SetVariable('ANOMES', StrToInt(IntToStr(ano) + FormatFloat('00', mes)));
        query.SetVariable('MES', mes);
        query.SetVariable('FILIAIS', Bib.geraStringFiliais(wFiliais));
        query.SetVariable('COD_PLANO_CONTA_REFERENCIAL', QReg210ContasCOD_PLANO_CONTA_REFERENCIAL.Value);
        query.Open;
        vSaldo := vSaldo + pegaValor(query, 'VAL_ATUAL');

        query.close;

        QReg210Contas.Next;
      end;

      reg := TContFiscL210.Create(TObject(self), arquivo);
      reg.CODIGO := pegaValor(QReg210, 'COD_COMPOSICAO_CUSTOS');
      reg.DESCRICAO := pegaValor(QReg210, 'DESC_COMPOSICAO_CUSTOS');
      reg.VALOR := vSaldo;
      reg.grava;
      reg.Free;
      reg := nil;

      QReg210Contas.Filtered := False;
      QReg210Contas.Close;

      QReg210.Next;
    end;
    QReg210.Close;
  end;

end;

procedure TContFisc.RegistroL300(pDataIni, pDataFin: tdate);
var
  wDiaIni, wMesIni, wAnoIni: word;
  wDiaFin, wMesFin, wAnoFin: word;
  i, j: integer;
  reg: TContFiscL300;
  wDre: TDataSet;
  wdataSource: TDataSource;
  fmostradre: Tfmostradre;
  wDreMap: TDreHashMap;
  wTeste: double;
  arq: TextFile;
begin

  wTeste := 0;

  thread.mostramensagem('Gerando registro L300.');

  with DMDre do
  begin
    decodeDate(pDataIni, wAnoIni, wMesIni, wDiaIni);
    decodeDate(pDataFin, wAnoFin, wMesFin, wDiaFin);
    i := wMesIni;
    while i <= wMesFin do
    begin
      wDre :=
      GeraDRE(
        i,
        wAnoIni,
        wFiliais
      );

      wDre.First;


//      if i <> 12 then begin Inc(i); continue; end;
//      fmostradre := Tfmostradre.Create(Application);
//      wDataSource := TDatasource.Create(Application);
//      wDatasource.DataSet := wDre;
//      fmostradre.DBGrid1.DataSource := wDatasource;
//      Fmostradre.Showmodal;


      wDreMap := TDreHashMap.Create;
      while not wDre.eof do
      begin

        if wDre.FieldByName('COD_PLANO_CONTA').Value <= 0 then
        begin
          wDre.Next;
          continue;
        end
        else
          if buscaContaReferencial(wDre.FieldByName('COD_PLANO_CONTA').Text)
            = '' then
          begin
            wDre.Next;
            continue;
          end
          else
            if DMOracle.FastSelect('DESC_NATUREZA_CONTA', 'TB_PLANO_CONTA'
              , 'COD_PLANO_CONTA = ' + wDre.FieldByName('COD_PLANO_CONTA').Text
              ) <> '04' then
            begin
              wDre.Next;
              continue;
            end
            else
              if DMOracle.FastSelect('IND_LIBERADO_USO', 'TB_PLANO_CONTA'
                , 'COD_PLANO_CONTA = ' + wDre.FieldByName('COD_PLANO_CONTA').Text
                ) = 'NAO' then
              begin
                wDre.Next;
                continue;
              end;

        // Mapeamento do DRE para hashmap para somar
        // valores de contas referenciais iguais
        wDreMap.addValue(
          buscaContaReferencial(wDre.FieldByName('COD_PLANO_CONTA').Text)
          , wDre.FieldByName('VAL_SALDO').Value);

        // Para testar
//        if ((wDre.FieldByName('COD_PLANO_CONTA').Value = 2722)
//            or (wDre.FieldByName('COD_PLANO_CONTA').Value = 221)
//            or (wDre.FieldByName('COD_PLANO_CONTA').Value = 226)
//            or (wDre.FieldByName('COD_PLANO_CONTA').Value = 223)
//            or (wDre.FieldByName('COD_PLANO_CONTA').Value = 224)
//            or (wDre.FieldByName('COD_PLANO_CONTA').Value = 225)
//            or (wDre.FieldByName('COD_PLANO_CONTA').Value = 226)
//            or (wDre.FieldByName('COD_PLANO_CONTA').Value = 2723)
//            or (wDre.FieldByName('COD_PLANO_CONTA').Value = 2724)
//            or (wDre.FieldByName('COD_PLANO_CONTA').Value = 2725)
//            or (wDre.FieldByName('COD_PLANO_CONTA').Value = 2726)
//            or (wDre.FieldByName('COD_PLANO_CONTA').Value = 2727)
//            or (wDre.FieldByName('COD_PLANO_CONTA').Value = 6116)
//          )and (i = 1) then
//        begin
//          wTeste := wTeste + wDre.FieldByName('VAL_SALDO').Value;
//        end;

        wDre.next;
      end;

      // Para Testar
//      if i = 12 then
//      begin
//
//        // Este trecho de código gera um arquivo texto na pasta temp para
//        // verificar se o HashMap foi gerado corretamente
//        AssignFile(arq, 'c:\temp\PlanoReferencialHashMap.txt');
//        Rewrite(arq);
//        for j := 0 to wDreMap.count - 1 do
//        begin
//          Writeln(arq, wDreMap.getContaByIndex(j)
//            + '    '
//            + FloatToStr(abs(wDreMap.getValue(wDreMap.getContaByIndex(j)))));
//        end;
//        CloseFile(arq);
//
//      end;
      // até aqui

      // Lança efetivamente os registros do DRE

      for j := 0 to wDreMap.count - 1 do
      begin       
        reg := TContFiscL300.Create(TObject(self), arquivo);
        reg.CODIGO := wDreMap.getContaByIndex(j);
        reg.DESCRICAO
          :=  DMOracle.FastSelect('DESC_PLANO_CONTA_REFERENCIAL',
          'TB_PLANO_CONTA_REFERENCIAL', 'NUM_PLANO_CONTA_REFERENCIAL = ' +
          quotedStr(reg.CODIGO));
        reg.TIPO := tipoContaReferencial(reg.CODIGO);
        reg.NIVEL := calculaNivelContaReferencial(reg.CODIGO);
        reg.COD_NAT := '04';
        reg.COD_CTA_SUP := contaReferencialSuperior(reg.CODIGO);
        reg.VALOR := abs(wDreMap.getValue(wDreMap.getContaByIndex(j)));
        reg.IND_VALOR := IfThen(
          (wDreMap.getValue(wDreMap.getContaByIndex(j)) >= 0), 'C', 'D');
        reg.grava;
        reg.Free;
        reg := nil;
      end;
      wDreMap.destroy;
      wDreMap := nil;
      Inc(i);
    end;
  end;
end;

function TContFisc.buscaContaReferencial(pCodContaContabil: string): string;
var wContaReferencial: string;
begin
  with DMOracle do
  begin
    result := '';
    if trim(pCodContaContabil) <> '' then
    begin
      wContaReferencial := FastSelect('NVL(TRIM(COD_PLANO_CONTA_REFERENCIAL), 0)',
        'TB_PLANO_CONTA',
        'COD_PLANO_CONTA = ' + pCodContaContabil);
      if (wContaReferencial <> '0') and (wContaReferencial <> '')then
      begin
        result := FastSelect('NUM_PLANO_CONTA_REFERENCIAL',
          'TB_PLANO_CONTA_REFERENCIAL',
          'COD_PLANO_CONTA_REFERENCIAL = ' + wContaReferencial);
      end
    end;
  end;
end;

function TContFisc.calculaNivelContaReferencial(
  pNumContaReferencial: string): integer;
var wSeparador, i: integer;
begin
  wSeparador := 0;
  for i := 0 to length(pNumContaReferencial) do
  begin
    if pNumContaReferencial[i] = '.' then
      inc(wSeparador);
  end;
  result := wSeparador + 1;
end;

function TContFisc.tipoContaReferencial(pNumContaReferencial: string): string;
  var wNumGrausContabil: string;
begin
  with DMOracle do
  begin
    wNumGrausContabil := FastSelect('NUM_GRAUS_CONTABIL',
      'TB_PARAM_SISTEMA', '1=1');
    if trim(wNumGrausContabil) = '' then
    begin
      MessageDlg('Grau contábil não informado nos parâmetros do sistema.',
        mtError, [mbOk], 0);
      abort;
    end;
    if strToInt(wNumGrausContabil) = calculaNivelContaReferencial(
      pNumContaReferencial) then
      result := 'A'
    else
      result := 'S';
  end;
end;

procedure TContFisc.RegistroL990(QtdLinhas: integer);
var reg: TContFiscL990;
begin
  reg := TContFiscL990.Create(TObject(Self), arquivo);
  reg.QTD_LIN := QtdLinhas;
  reg.grava;
  reg.Free;
  reg := nil;
end;

procedure TContFisc.RegistroN001;
var reg: TContFiscN001;
begin
  reg := TContFiscN001.Create(TObject(Self), arquivo);
  reg.IND_DAD := 1;
  reg.grava;
  reg.Free;
  reg := nil;

  //RegistroN030;
end;

procedure TContFisc.RegistroN030;
var reg: TContFiscN030;
begin
  reg := TContFiscN030.Create(TObject(Self), arquivo);

  reg.grava;
  reg.Free;
  reg := nil;

end;

procedure TContFisc.RegistroP001;
var reg: TContFiscP001;
begin
  reg := TContFiscP001.Create(TObject(Self), arquivo);
  reg.IND_DAD := 1;
  reg.grava;
  reg.Free;
  reg := nil;

  RegistroP030;
end;

procedure TContFisc.RegistroP030;
var reg: TContFiscP030;
  wDataAux, wDataAuxFin, dtFinTrimestre: tdate;
  vTrimestre : integer;
  vPerApur: String;
  dia, ano, mes: Word;
begin


  if not isTrimestral then
  begin

    // Anual

    reg := TContFiscP030.Create(TObject(Self), arquivo);
    query := executaQuery(DMContFiscP.QReg030);
    query.SetVariable('DT_INI_PERIODO', wDataIni);
    query.SetVariable('DT_FIN_PERIODO', wDataFin);
    query.Open;

    if query.IsEmpty then begin fechaQuery(query); exit; end;

    reg := TContFiscP030.Create(TObject(Self), arquivo);
    reg.DT_INI := wDataIni;
    reg.DT_FIN := pegaValor(query, 'DT_FIN');
    reg.PER_APUR := pegaValor(query, 'PER_APUR');
    vPerApur := reg.PER_APUR;
    reg.grava;
    reg.Free;
    reg := nil;
    fechaQuery(query);

    RegistroP100(wDataIni, wDataFin, vPerApur);
    RegistroP130;
    RegistroP150(wDataIni, wDataFin);

    // Por mês
    wDataAux := wDataIni;

    while formatDateTime('yyyymm', wDataAux) <= formatDateTime('yyyymm', wDataFin) do
    begin

      thread.mostramensagem('Registro P100.');
      thread.tela.GProgresso.AddProgress(5);


      wDataAuxFin := StrToDate(DMOracle.FastSelect('LAST_DAY('
        + quotedStr(DateToStr(wDataAux))
        + ')'
        , 'DUAL'
        , '1=1'));
      reg := TContFiscP030.Create(TObject(Self), arquivo);
      query := executaQuery(DMContFiscP.QReg030);
      query.SetVariable('DT_INI_PERIODO', wDataAux);
      query.SetVariable('DT_FIN_PERIODO', wDataAuxFin);
      query.open;

      if query.IsEmpty then begin fechaQuery(query); Exit; end;

      reg := TContFiscP030.Create(TObject(Self), arquivo);
      reg.DT_INI := wDataIni;
      reg.DT_FIN := pegaValor(query, 'DT_FIN');
      reg.PER_APUR := pegaValor(query, 'PER_APUR');
      vPerApur := reg.PER_APUR;
      reg.grava;
      reg.Free;
      reg := nil;
      fechaQuery(query);

      RegistroP100(wDataIni, wDataFin, vPerApur);
      RegistroP130;
      RegistroP150(wDataIni, wDataFin);
      wDataAux := IncMonth(wDataAux);
    end;
  end
  else
  begin

    wDataAux := wDataIni;

    for vTrimestre := 1 to 4 do
    begin

      thread.mostramensagem('Registro P100. Trimestre ' + IntToStr(vTrimestre) + '.');
      thread.tela.GProgresso.AddProgress(15);

      DecodeDate(wDataAux, ano, mes, dia);
      dtFinTrimestre := EndOfAMonth(ano, vTrimestre*3);

      reg := TContFiscP030.Create(TObject(Self), arquivo);
      reg.DT_INI := wDataAux;
      reg.DT_FIN := dtFinTrimestre;
      reg.PER_APUR := Format('T%.2d', [vTrimestre]);
      vPerApur := reg.PER_APUR;
      reg.grava;
      reg.Free;
      reg := nil;

      RegistroP100(wDataAux, dtFinTrimestre, vPerApur);
      RegistroP130;
      RegistroP150(wDataAux, dtFinTrimestre);
      wDataAux := dtFinTrimestre + 1;

    end;
  end;  //LIBERAR AQUI   <<<------------------------------------------------------


  {
  wDataAux := wDataIni;
  while formatDateTime('yyyymm', wDataAux) <= formatDateTime('yyyymm', wDataFin) do
  begin
    reg := TContFiscL030.Create(TObject(Self), arquivo);
    query := executaQuery(DMContFiscL.QReg030);
    query.SetVariable('DT_INI_PERIODO', wDataAux);
    query.SetVariable('DT_FIN_PERIODO', wDataFin);
    query.open;

    if query.IsEmpty then begin fechaQuery(query); Exit; end;

    reg := TContFiscL030.Create(TObject(Self), arquivo);
    reg.DT_INI := pegaValor(query, 'DT_INI');
    reg.DT_FIN := pegaValor(query, 'DT_FIN');
    reg.PER_APUR := pegaValor(query, 'PER_APUR');
    reg.grava;
    reg.Free;
    reg := nil;
    fechaQuery(query);

    RegistroL100(StrToInt(formatdatetime('yyyymm', wDataAux)),
      StrToInt(formatdatetime('yyyymm', wDataFin)));
    RegistroL200;

    wDataAux := IncMonth(wDataFin);
  end;

  RegistroL300;
  }
end;

procedure TContFisc.RegistroP100(pDataIni, pDataFin: TDate; PerApur: string);
var reg: TContFiscP100;
  query: TOracleDataSet1;
  wPeriodoIni, wPeriodoFin: integer;
begin
  wPeriodoIni := StrToInt(formatdatetime('yyyymm', pDataIni));
  wPeriodoFin := StrToInt(formatdatetime('yyyymm', pDataFin));

  reg := TContFiscP100.Create(TObject(Self), arquivo);
  query := executaQuery(DMContFiscP.QReg100);
  query.SetVariable('DT_ANO_MES_INI', wPeriodoIni);
  query.SetVariable('DT_ANO_MES_FIN', wPeriodoFin);
  query.SetVariable('FILIAIS', geraStringFiliais(wFiliais));
  query.SetVariable('TRIMESTRAL', IfThen(isTrimestral, 'SIM', 'NAO'));
  query.open;

  thread.mostramensagem('Gerando registro P100.');

  while not query.Eof do
  begin
    reg := TContFiscP100.Create(TObject(Self), arquivo);
    reg.CODIGO := pegaValor(query, 'CODIGO');
    reg.DESCRICAO := pegaValor(query, 'DESCRICAO');
    reg.TIPO := pegaValor(query, 'TIPO');
    reg.NIVEL := pegaValor(query, 'NIVEL');
    reg.COD_NAT := pegaValor(query, 'COD_NAT');
    reg.COD_CTA_SUP := pegaValor(query, 'COD_CTA_SUP');
    reg.VAL_CTA_REF_INI := pegaValor(query, 'VAL_CTA_REF_INI');
    reg.VAL_CTA_REF_DEB := pegaValor(query, 'VAL_CTA_REF_DEB');
    reg.VAL_CTA_REF_CRED := pegaValor(query, 'VAL_CTA_REF_CRED');
    reg.IND_VAL_CTA_REF_INI := pegaValor(query, 'IND_VAL_CTA_REF_INI');
    reg.VAL_CTA_REF_FIN := pegaValor(query,  'VAL_CTA_REF_FIN');
    reg.IND_VAL_CTA_REF_FIN := pegaValor(query, 'IND_VAL_CTA_REF_FIN');
    reg.grava;
    reg.Free;
    reg := nil;
    query.Next;
  end;
  fechaQuery(query);
end;

procedure TContFisc.RegistroP130;
begin
  //
end;

procedure TContFisc.RegistroP150(pDataIni, pDataFin: TDate);
var
  wDiaIni, wMesIni, wAnoIni: word;
  wDiaFin, wMesFin, wAnoFin: word;
  i, j: integer;
  reg: TContFiscP150;
  wDre: TDataSet;
  wdataSource: TDataSource;
  fmostradre: Tfmostradre;
  wDreMap: TDreHashMap;
  wTeste: double;
  arq: TextFile;
begin

  wTeste := 0;

  thread.mostramensagem('Gerando registro P150.');

  with DMDre do
  begin
    decodeDate(pDataIni, wAnoIni, wMesIni, wDiaIni);
    decodeDate(pDataFin, wAnoFin, wMesFin, wDiaFin);
    i := wMesIni;
    while i <= wMesFin do
    begin
      wDre :=
      GeraDRE(
        i,
        wAnoIni,
        wFiliais
      );

      wDre.First;


//      if i <> 12 then begin Inc(i); continue; end;
//      fmostradre := Tfmostradre.Create(Application);
//      wDataSource := TDatasource.Create(Application);
//      wDatasource.DataSet := wDre;
//      fmostradre.DBGrid1.DataSource := wDatasource;
//      Fmostradre.Showmodal;


      wDreMap := TDreHashMap.Create;
      while not wDre.eof do
      begin

        if wDre.FieldByName('COD_PLANO_CONTA').Value <= 0 then
        begin
          wDre.Next;
          continue;
        end
        else
          if buscaContaReferencial(wDre.FieldByName('COD_PLANO_CONTA').Text)
            = '' then
          begin
            wDre.Next;
            continue;
          end
          else
            if DMOracle.FastSelect('DESC_NATUREZA_CONTA', 'TB_PLANO_CONTA'
              , 'COD_PLANO_CONTA = ' + wDre.FieldByName('COD_PLANO_CONTA').Text
              ) <> '04' then
            begin
              wDre.Next;
              continue;
            end
            else
              if DMOracle.FastSelect('IND_LIBERADO_USO', 'TB_PLANO_CONTA'
                , 'COD_PLANO_CONTA = ' + wDre.FieldByName('COD_PLANO_CONTA').Text
                ) = 'NAO' then
              begin
                wDre.Next;
                continue;
              end;

        // Mapeamento do DRE para hashmap para somar
        // valores de contas referenciais iguais
        wDreMap.addValue(
          buscaContaReferencial(wDre.FieldByName('COD_PLANO_CONTA').Text)
          , wDre.FieldByName('VAL_SALDO').Value);

        // Para testar
//        if ((wDre.FieldByName('COD_PLANO_CONTA').Value = 2722)
//            or (wDre.FieldByName('COD_PLANO_CONTA').Value = 221)
//            or (wDre.FieldByName('COD_PLANO_CONTA').Value = 226)
//            or (wDre.FieldByName('COD_PLANO_CONTA').Value = 223)
//            or (wDre.FieldByName('COD_PLANO_CONTA').Value = 224)
//            or (wDre.FieldByName('COD_PLANO_CONTA').Value = 225)
//            or (wDre.FieldByName('COD_PLANO_CONTA').Value = 226)
//            or (wDre.FieldByName('COD_PLANO_CONTA').Value = 2723)
//            or (wDre.FieldByName('COD_PLANO_CONTA').Value = 2724)
//            or (wDre.FieldByName('COD_PLANO_CONTA').Value = 2725)
//            or (wDre.FieldByName('COD_PLANO_CONTA').Value = 2726)
//            or (wDre.FieldByName('COD_PLANO_CONTA').Value = 2727)
//            or (wDre.FieldByName('COD_PLANO_CONTA').Value = 6116)
//          )and (i = 1) then
//        begin
//          wTeste := wTeste + wDre.FieldByName('VAL_SALDO').Value;
//        end;

        wDre.next;
      end;

      // Para Testar
//      if i = 12 then
//      begin
//
//        // Este trecho de código gera um arquivo texto na pasta temp para
//        // verificar se o HashMap foi gerado corretamente
//        AssignFile(arq, 'c:\temp\PlanoReferencialHashMap.txt');
//        Rewrite(arq);
//        for j := 0 to wDreMap.count - 1 do
//        begin
//          Writeln(arq, wDreMap.getContaByIndex(j)
//            + '    '
//            + FloatToStr(abs(wDreMap.getValue(wDreMap.getContaByIndex(j)))));
//        end;
//        CloseFile(arq);
//
//      end;
      // até aqui

      // Lança efetivamente os registros do DRE

      for j := 0 to wDreMap.count - 1 do
      begin
        reg := TContFiscP150.Create(TObject(self), arquivo);
        reg.CODIGO := wDreMap.getContaByIndex(j);
        reg.DESCRICAO
          :=  DMOracle.FastSelect('DESC_PLANO_CONTA_REFERENCIAL',
          'TB_PLANO_CONTA_REFERENCIAL', 'NUM_PLANO_CONTA_REFERENCIAL = ' +
          quotedStr(reg.CODIGO));
        reg.TIPO := tipoContaReferencial(reg.CODIGO);
        reg.NIVEL := calculaNivelContaReferencial(reg.CODIGO);
        reg.COD_NAT := '04';
        reg.COD_CTA_SUP := contaReferencialSuperior(reg.CODIGO);
        reg.VALOR := abs(wDreMap.getValue(wDreMap.getContaByIndex(j)));
        reg.IND_VALOR := IfThen(
          (wDreMap.getValue(wDreMap.getContaByIndex(j)) >= 0), 'C', 'D');
        reg.grava;
        reg.Free;
        reg := nil;
      end;
      wDreMap.destroy;
      wDreMap := nil;
      Inc(i);
    end;
  end;
end;

procedure TContFisc.RegistroP200;
begin
  //
end;

procedure TContFisc.RegistroP230;
begin
  //
end;

procedure TContFisc.RegistroP300;
begin
  //
end;

procedure TContFisc.RegistroP400;
begin
  //
end;

procedure TContFisc.RegistroP500;
begin
  //
end;

procedure TContFisc.RegistroP990(QtdLinhas: integer);

begin

// fim registro p
end;

function TContFisc.contaReferencialSuperior(
  pNumContaReferencial: string): string;
begin
//  case length(pNumContaReferencial) of
//    16: result := copy(pNumContaReferencial, 1, 13);
//    13: result := copy(pNumContaReferencial, 1, 10);
//    10: result := copy(pNumContaReferencial, 1, 7);
//    7: result := copy(pNumContaReferencial, 1, 4);
//    4: result := copy(pNumContaReferencial, 1, 1);
//    else result := '';
//  end;
  result := copy(pNumContaReferencial, 1, Length(pNumContaReferencial) - 3);
end;

procedure TContFisc.RegistroM030;
var reg: TContFiscM030;
  wDataAux, wDataAuxFin: TDate;
begin
  // Anual
  reg := TContFiscM030.Create(TObject(Self), arquivo);
  query := executaQuery(DMContFiscM.QReg030);
  query.SetVariable('DT_INI_PERIODO', wDataIni);
  query.SetVariable('DT_FIN_PERIODO', wDataFin);
  query.Open;

  if query.IsEmpty then begin fechaQuery(query); exit; end;

  reg := TContFiscM030.Create(TObject(Self), arquivo);
  reg.DT_INI := wDataIni;
  reg.DT_FIN := pegaValor(query, 'DT_FIN');
  reg.grava;
  reg.Free;
  reg := nil;
  fechaQuery(query);

  {
  RegistroL100(wDataIni, wDataFin);
  RegistroL200;
  RegistroL300(wDataAux, wDataAuxFin);
  }

  // Por mês

  wDataAux := wDataIni;

  while formatDateTime('yyyymm', wDataAux) <= formatDateTime('yyyymm', wDataFin) do
  begin
    wDataAuxFin := StrToDate(DMOracle.FastSelect('LAST_DAY('
      + quotedStr(DateToStr(wDataAux))
      + ')'
      , 'DUAL'
      , '1=1'));
    reg := TContFiscM030.Create(TObject(Self), arquivo);
    query := executaQuery(DMContFiscM.QReg030);
    query.SetVariable('DT_INI_PERIODO', wDataAux);
    query.SetVariable('DT_FIN_PERIODO', wDataAuxFin);
    query.open;

    if query.IsEmpty then begin fechaQuery(query); Exit; end;

    reg := TContFiscM030.Create(TObject(Self), arquivo);
    reg.DT_INI := wDataIni;
    reg.DT_FIN := pegaValor(query, 'DT_FIN');
    reg.grava;
    reg.Free;
    reg := nil;
    fechaQuery(query);

    {
    RegistroL100(wDataAux, wDataAuxFin);
    RegistroL200;
    RegistroL300(wDataAux, wDataAuxFin);
    }
    wDataAux := IncMonth(wDataAux);
  end;

end;

{ TDreHashMap }

procedure TDreHashMap.addValue(pConta: string; pValor: double);
var i: integer;
begin
  for i := 0 to length(self.wConta) - 1 do
  begin
    if pConta = self.wConta[i] then
    begin
      self.wValor[i] := self.wValor[i] + pValor;
      exit;
    end;
  end;

  // Se chegou até aqui é porque ainda não existia conta no hashmap
  i := Length(self.wConta);
  SetLength(self.wConta, i + 1);
  SetLength(self.wValor, i + 1);
  self.wConta[i] := pConta;
  self.wValor[i] := pValor;
end;

procedure TDreHashMap.Clear;
begin
  setLength(self.wConta, 0);
  setLength(self.wValor, 0);
end;

function TDreHashMap.count: integer;
begin
  result := length(self.wConta);
end;

constructor TDreHashMap.Create;
begin
  inherited;
  Clear;
end;

//procedure TDreHashMap.destroy;
//begin
//  self.destroy;
//  self := nil;
//end;

function TDreHashMap.getContaByIndex(pIndice: integer): string;
begin
  result := self.wConta[pIndice];
end;

function TDreHashMap.getValue(pConta: string): double;
var i: integer;
begin
  for i := 0 to length(self.wConta) - 1 do
  begin
    if pConta = self.wConta[i] then
    begin
      result := self.wValor[i];
      exit;
    end;
  end;
end;

procedure TContFisc.RegistroY001;
var reg: TContFiscY001;
begin
  reg := TContFiscY001.Create(TObject(Self), arquivo);
  reg.IND_DAD := 1;
  reg.grava;
  reg.Free;
  reg := nil;

  RegistroY600;
end;
procedure TContFisc.RegistroY600;
var reg: TContFiscY600;
begin
  reg := TContFiscY600.Create(TObject(Self), arquivo);
  query := executaQuery(DMContFiscY.QReg600);
  query.Open;
  while not query.Eof do
  begin
    reg := TContFiscY600.Create(TObject(Self), arquivo);
    reg.DT_ALT_SOC := pegaValor(query, 'DT_ALT_SOC');
    if pegaValor(query, 'DT_FIM_SOC') <> '' then
      reg.DT_FIM_SOC := pegaValor(query, 'DT_FIM_SOC');
    reg.PAIS := pegaValor(query, 'PAIS');
    reg.IND_QUALIF := pegaValor(query, 'IND_QUALIF');
    reg.CPF_CNPJ := pegaValor(query, 'CPF_CNPJ');
    reg.NOME_EMP := pegaValor(query, 'NOME_EMP');
    reg.QUALIF := pegaValor(query, 'QUALIF');
    reg.PERC_CAP_TOT := pegaValor(query, 'PERC_CAP_TOT');
    reg.PERC_CAP_VOT := pegaValor(query, 'PERC_CAP_VOT');
    reg.CPF_REP_LEG := pegaValor(query, 'CPF_REP_LEG');
    reg.QUALIF_REP_LEG := pegaValor(query, 'QUALIF_REP_LEG');
    reg.VL_REM_TRAB := pegaValor(query, 'VL_REM_TRAB');
    reg.VL_LUC_DIV := pegaValor(query, 'VL_LUC_DIV');
    reg.VL_JUR_CAP := pegaValor(query, 'VL_JUR_CAP');
    reg.VL_DEM_REND := pegaValor(query, 'VL_DEM_REND');
    reg.VL_IR_RET := pegaValor(query, 'VL_IR_RET');
    reg.grava;
    reg.Free;
    reg := nil;
    query.Next;
  end;
  thread.mostramensagem('Registro Y600.');
  thread.tela.GProgresso.AddProgress(1);
  fechaQuery(query);
end;

procedure TContFisc.RegistroY990(QtdLinhas: integer);
var reg: TContFiscY990;
begin
  reg := TContFiscY990.Create(TObject(Self), arquivo);
  reg.QTD_LIN := QtdLinhas;
  reg.grava;
  reg.Free;
  reg := nil;
end;

function TContFisc.pegaVersao(pDataFin: TDate): Integer;
begin

  if (pDataFin >= (StrToDateTime('01/01/2014'))) and (pDataFin <= (StrToDateTime('31/12/2014')))then
    result := 1
  else
    if (pDataFin >= (StrToDateTime('01/01/2015'))) and (pDataFin <= (StrToDateTime('31/12/2015'))) then
      result := 2
    else
      if (pDataFin >= (StrToDateTime('01/01/2016'))) and (pDataFin <= (StrToDateTime('31/12/2016'))) then
        result := 3
      else
        if (pDataFin >= (StrToDateTime('01/01/2017'))) and (pDataFin <= (StrToDateTime('31/12/2017'))) then
          result := 4
        else
          if (pDataFin >= (StrToDateTime('01/01/2018'))) and (pDataFin <= (StrToDateTime('31/12/2018'))) then
            result := 5
          else
            if (pDataFin >= (StrToDateTime('01/01/2019'))) and (pDataFin <= (StrToDateTime('31/12/2019'))) then
              result := 6
            else
              if (pDataFin >= (StrToDateTime('01/01/2020'))) and (pDataFin <= (StrToDateTime('31/12/2020'))) then
                result := 7
              else
                if (pDataFin >= (StrToDateTime('01/01/2021'))) and (pDataFin <= (StrToDateTime('31/12/2021'))) then
                  result := 8
                else
                  if (pDataFin >= (StrToDateTime('01/01/2022'))) and (pDataFin <= (StrToDateTime('31/12/2022'))) then
                    result := 9
                  else
                  if (pDataFin >= (StrToDateTime('01/01/2023'))) and (pDataFin <= (StrToDateTime('31/12/2023'))) then
                    result := 10
                  else
                    if (pDataFin >= (StrToDateTime('01/01/2024'))) and (pDataFin <= (StrToDateTime('31/12/2024'))) then
                      result := 11
                    else
                      result := 12;
end;

end.
