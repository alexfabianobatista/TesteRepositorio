unit UPisCofins;

interface

uses
  Controls, SysUtils, Windows, Forms, UThreadLocal, OraTeste, UBiblioteca,
  Classes, DBClient, UBibSped, Math,

  Arquivo,
  PisCofins0000, PisCofins0001, PisCofins0110, PisCofins0100, PisCofins0111,
  PisCofins0140, PisCofins0145, PisCofins0150, PisCofins0190, PisCofins0200,
  PisCofins0208, PisCofins0205, PisCofins0206, PisCofins0400, PisCofins0450,
  PisCofins0500, PisCofins0600, PisCofins0990,
  PisCofinsA001, PisCofinsA010, PisCofinsA100, PisCofinsA110, PisCofinsA111,
  PisCofinsA120, PisCofinsA170, PisCofinsA990,
  PisCofinsC010, PisCofinsC001, PisCofinsC100, PisCofinsC110, PisCofinsC111,
  PisCofinsC120, PisCofinsC170, PisCofinsC181, PisCofinsC180, PisCofinsC185,
  PisCofinsC188, PisCofinsC190, PisCofinsC191, PisCofinsC195, PisCofinsC198,
  PisCofinsC199, PisCofinsC380, PisCofinsC381, PisCofinsC385, PisCofinsC395,
  PisCofinsC396, PisCofinsC400, PisCofinsC405, PisCofinsC485, PisCofinsC489,
  PisCofinsC490, PisCofinsC491, PisCofinsC495, PisCofinsC499, PisCofinsC500,
  PisCofinsC501, PisCofinsC505, PisCofinsC509, PisCofinsC600, PisCofinsC601,
  PisCofinsC605, PisCofinsC609, PisCofinsC990, PisCofinsC175,
  PisCofinsD001, PisCofinsD010, PisCofinsD100, PisCofinsD101, PisCofinsD105,
  PisCofinsD111, PisCofinsD200, PisCofinsD201, PisCofinsD205, PisCofinsD209,
  PisCofinsD300, PisCofinsD309, PisCofinsD350, PisCofinsD359, PisCofinsD500,
  PisCofinsD501, PisCofinsD505, PisCofinsD509, PisCofinsD600, PisCofinsD601,
  PisCofinsD605, PisCofinsD609, PisCofinsD990,
  PisCofinsF001, PisCofinsF010, PisCofinsF100, PisCofinsF111, PisCofinsF120,
  PisCofinsF129, PisCofinsF130, PisCofinsF139, PisCofinsF150, PisCofinsF200,
  PisCofinsF205, PisCofinsF210, PisCofinsF211, PisCofinsF600, PisCofinsF700,
  PisCofinsF800, PisCofinsF990,
  PisCofinsM001, PisCofinsM100, PisCofinsM105, PisCofinsM110, PisCofinsM200,
  PisCofinsM210, PisCofinsM211, PisCofinsM220, PisCofinsM230, PisCofinsM300,
  PisCofinsM350, PisCofinsM400, PisCofinsM410, PisCofinsM500, PisCofinsM505,
  PisCofinsM510, PisCofinsM600, PisCofinsM610, PisCofinsM611, PisCofinsM620,
  PisCofinsM630, PisCofinsM700, PisCofinsM800, PisCofinsM810, PisCofinsM990,
  PisCofins1001, PisCofins1010, PisCofins1020, PisCofins1100, PisCofins1101,
  PisCofins1102, PisCofins1200, PisCofins1210, PisCofins1220, PisCofins1300,
  PisCofins1500, PisCofins1501, PisCofins1502, PisCofins1600, PisCofins1610,
  PisCofins1620, PisCofins1700, PisCofins1800, PisCofins1809, PisCofins1990,
  PisCofins9001, PisCofins9900, PisCofins9990, PisCofins9999,
  PisCofinsP001, PisCofinsP010, PisCofinsP100, PisCofinsP200, PisCofinsP990;

type
  TPisCofins = class
  private
    wFilial: Integer;
    wDataIni, wDataFin: TDate;
    wFiliais: TStrings;
    arquivo: TArquivo;
    query: TOracleDataSet1;
    wMes, wAno: Integer;
    wCodReg: Integer;
    wC010IndEscri :String;
    wPercPis: String;
    wPercCofins: String;
    wCodIncTrib: Integer;
    wAproCred: string;
    wCfop: integer;
    wGeraBlocoP: boolean;

    procedure PisCofins0000;

    // registros 0
    procedure PisCofins0001;
    procedure PisCofins0100;
    procedure PisCofins0110;
    procedure PisCofins0111;
    procedure PisCofins0140;
    procedure PisCofins0145(pFilial: Integer);
    procedure PisCofins0150;
    procedure PisCofins0190;
    procedure PisCofins0200;
    procedure PisCofins0205;
    procedure PisCofins0206;
    procedure PisCofins0208;
    procedure PisCofins0400(pFilial: Integer);
    procedure PisCofins0450(pFilial: Integer);
    procedure PisCofins0500;
    procedure PisCofins0990(QtdLinhas: Double);
    // registros A
    procedure PisCofinsA001;
    procedure PisCofinsA010;
    procedure PisCofinsA100(pFilial: Integer);
    procedure PisCofinsA110(pCodNota: Integer);
    procedure PisCofinsA120(pCodNota: Integer);
    procedure PisCofinsA170(pCodNota: Integer; pIndOper: Integer;
      pRetencao: boolean = false; pRetencaoGrasel: boolean = false);
    procedure PisCofinsA990(QtdLinhas: Double);

    // registros C
    procedure PisCofinsC001;
    procedure PisCofinsC010;
    procedure PisCofinsC100(pFilial: Integer);
    procedure PisCofinsC110(pCodNota: Integer);
    procedure PisCofinsC120(pCodNota: Integer);
    procedure PisCofinsC170(pCodNota: Integer; pCodMod, IndComb: String; pIndOper: Integer);
    procedure PisCofinsC175(pCodNota: Integer);
    procedure PisCofinsC180;
    procedure PisCofinsC181;
    procedure PisCofinsC185;
    procedure PisCofinsC190;
    procedure PisCofinsC191;
    procedure PisCofinsC195;
    procedure PisCofinsC199;
    procedure PisCofinsC380(pFilial: Integer);
    procedure PisCofinsC381;
    procedure PisCofinsC385;
    procedure PisCofinsC395(pFilial: Integer);
    procedure PisCofinsC396;
    procedure PisCofinsC490(pFilial: Integer);
    procedure PisCofinsC491(pModelo: String);
    procedure PisCofinsC495(pModelo: String);
    procedure PisCofinsC500(pFilial: Integer);
    procedure PisCofinsC501(pCodNota: Integer);
    procedure PisCofinsC505(pCodNota: Integer);
    procedure PisCofinsC990(QtdLinhas: Double);

    // registros D
    procedure PisCofinsD001;
    procedure PisCofinsD010;
    procedure PisCofinsD100(pFilial: Integer);
    procedure PisCofinsD101(pCodConhecimento: Integer; pTipo: String; pIndOper: integer);
    procedure PisCofinsD105(pCodConhecimento: Integer; pTipo: String; pIndOper: integer);
    procedure PisCofinsD200(pFilial: Integer);
    procedure PisCofinsD201(pDataRef: TDateTime; pCfop: Integer; pCodMod :String);
    procedure PisCofinsD205(pDataRef: TDateTime; pCfop: Integer; pCodMod :String);
    procedure PisCofinsD500(pFilial: Integer);
    procedure PisCofinsD501(pCodNota: Integer);
    procedure PisCofinsD505(pCodNota: Integer);
    procedure PisCofinsD990(QtdLinhas: Double);

    // registros F
    procedure PisCofinsF001;
    procedure PisCofinsF010;
    procedure PisCofinsF120(pFilial: Integer);
    procedure PisCofinsF130(pFilial: Integer);
    procedure PisCofinsF600(pFilial: Integer);
    procedure PisCofinsF990(QtdLinhas: Double);

    // registros M
    procedure PisCofinsM001;
    procedure PisCofinsM100;
    procedure PisCofinsM105(CodNaturezaReceita: integer; PercAliquota: double);
    procedure PisCofinsM110(valor: double);
    procedure PisCofinsM200;
    procedure PisCofinsM205(valor: double);
    procedure PisCofinsM210;
    procedure PisCofinsM400;
    procedure PisCofinsM410(pCst, pCodCta: String);
    procedure PisCofinsM500;
    procedure PisCofinsM505(CodNaturezaReceita: integer; PercAliquota: double);
    procedure PisCofinsM510(valor: double);
    procedure PisCofinsM600;
    procedure PisCofinsM605(valor: double);
    procedure PisCofinsM610;
    procedure PisCofinsM800;
    procedure PisCofinsM810(pCst, pCodCta: String);
    procedure PisCofinsM990(QtdLinhas: Double);

    // registros P
    procedure PisCofinsP001(geraBlocoP: boolean);
    procedure PisCofinsP010;
    procedure PisCofinsP100(pFilial: Integer);
    procedure PisCofinsP200;
    procedure PisCofinsP990(QtdLinhas: Double);

    // registros 1
    procedure PisCofins1001;
    procedure PisCofins1990(QtdLinhas: Double);

    // registros 9
    procedure PisCofins9001;
    procedure PisCofins9990(QtdLinhas: Double);
    procedure PisCofins9999(QtdLinhas: Double);

    function localizaRegistro(vetor: array of string; registro: string): Integer;
    function recuperaValor(texto: string; posicao: Integer): string;
    function alteraValor(texto: string; posicao: Integer; textoNovo: string): string;
    procedure atualizaTotalizadorEIndicadorBloco;
    procedure Execute;
    function geraStringFiliais(separador: string = ', '): string;
    procedure insereApuracao(pRegistro: String; pValor: Double; pCstPis: String;
      pCstCofins: String; pCodCta: String;
      pCodNatRec: Integer = 999);
    procedure insereApuracaoM100_M500(pRegistro: string;
      pValor, pValBC: double; pCst: string; pAliq: double; pCfop: string;
      pCodNatBCCred: integer; pObs: string; pRetencaoGrasel: boolean = false);
    procedure insereApuracaoM200_M600(pRegistro: string;
      pValor, pValBC: double; pCst: string; pAliq, pValRecBruta: double);
    procedure mostraApuracao(registro: string);
  public
    thread: TThreadLocal;
    procedure Gerar;
    constructor Create(DataIni, DataFin: TDate; Filiais: TStrings; geraBlocoP: boolean;wMatriz: Integer = 1);
  end;

implementation

uses UOracle_cl, DB, UFuncoes, Registro, Dialogs, USped_cl, Variants,
  OracleData, DateUtils, UPisCofins0_cl, UPisCofinsC_cl, UPisCofinsA_cl,
  UPisCofinsD_cl, UPisCofinsF_cl, UPisCofinsM_cl, StrUtils, UGeraSped,
  UPisCofinsP_cl, PisCofinsM205, PisCofinsM605, UMostraDRE, UParamSistema_cl;

constructor TPisCofins.Create(DataIni, DataFin: TDate; Filiais: TStrings; geraBlocoP: boolean; wMatriz: Integer = 1);
var ano,mes,dia: Word;
begin
  if wMatriz = 0 then
    wFilial := 1
  else
    wFilial := wMatriz;
  wDataIni := DataIni;
  wDataFin := DataFin;
  wFiliais := Filiais;
  DecodeDate(DataIni, ano, mes, dia);
  wMes := mes;
  wAno := ano;
  wGeraBlocoP := geraBlocoP;
  inherited Create;

end;

procedure TPisCofins.Execute;
var
  path: string;
begin
  thread.mostramensagem('Inicializando geração');
  wCodReg := 0;
  wC010IndEscri := '';
  path := ExtractFilePath(Application.ExeName);
  if not DirectoryExists(path + 'SPED') then
    CreateDir(path + 'SPED');
  if not DirectoryExists(path + 'SPED\PISCOFINS') then
    CreateDir(path + 'SPED\PISCOFINS');
  arquivo := TArquivo.Create(path + 'SPED\PISCOFINS\SPED-PISCOFINS_gerado_em_' + FormatDateTime('yyyy-MM-dd_hh-mm-ss', Date + Time) + '_competencia_' + FormatDateTime('yyyy-MM-dd', wDataIni) + '_' + FormatDateTime('yyyy-MM-dd', wDataFin) + '_filiais_' + geraStringFiliais('-') + '.txt');
  try

  PisCofins0000;
  PisCofins9999(0);

  //thread.mostramensagem('Ajustando totalizadores');
  atualizaTotalizadorEIndicadorBloco;

  //thread.mostramensagem('Gerando arquivo texto');
  arquivo.geraArquivo;

  //thread.mostramensagem('Arquivo gerado');
  arquivo.Destroy;
  Except on e: Exception do
    if(MessageDlg(e.Message, mtError, [mbOk], 0)= mrOk) then
    Exit;
  end;
end;

procedure TPisCofins.Gerar;
var
  teste: string;
begin
  try
    with DMOracle do
    begin
      wPercPis := FastSelect('NVL(PERC_PIS,0)', 'TB_PARAM_SISTEMA','1=1');
      wPercCofins := FastSelect('NVL(PERC_COFINS,0)', 'TB_PARAM_SISTEMA','1=1');
    end;
    Execute;
  except
    on e: Exception do
      thread.avisaErro('Erro na geração do SPED PIS/Cofins.' + #13 + #10 + e.Message);
  end;
end;

procedure TPisCofins.PisCofins0000;
var reg: TPisCofins0000;
  query: TOracleDataSet1;
  query0145: TClientDataSet;
begin
  query := executaQuery(DmPisCofins0.QReg000);
  query.SetVariable('COD_FILIAL', wFilial);
  query.open;

  if query.IsEmpty then begin fechaQuery(query); Exit; end;
  reg := TPisCofins0000.Create(TObject(Self), arquivo);
  reg.COD_VER := pegaVersao(wDataFin, 'PISCOFINS');
  reg.TIPO_ESCRIT := FGeraSped.TipoPisCofins;
  if (FGeraSped.RecAntPisCofins <> '') and
    (FGeraSped.TipoPisCofins = 1) then
    reg.NUM_REC_ANTERIOR := FGeraSped.RecAntPisCofins;
  reg.IND_SIT_ESP := 0;
  reg.DT_INI := wDataIni;
  reg.DT_FIN := wDataFin;
  reg.NOME := pegaValor(query, 'DESC_FILIAL');
  reg.CNPJ := pegaValor(query, 'NUM_CGC');
  reg.UF := pegaValor(query, 'DESC_SIGLA_ESTADO');
  REG.IND_ATIV := pegaValor(query, 'IND_ATIV_PREPONDERANTE');
  if SomenteNumeros(pegaValor(query, 'COD_CIDADE_IBGE')) = '' then
    reg.COD_MUN := 0
  else
    reg.COD_MUN := StrToInt(SomenteNumeros(pegaValor(query, 'COD_CIDADE_IBGE')));
  reg.grava;
  PisCofins0001;
  PisCofins0990(0);
  PisCofinsA001;
  PisCofinsA990(0);
  PisCofinsC001;
  PisCofinsC990(0);
  PisCofinsD001;
  PisCofinsD990(0);
  PisCofinsF001;
  PisCofinsF990(0);

  //mostraApuracao('M100');
  mostraApuracao('M500');
  //mostraApuracao('M105');
  //mostraApuracao('M200');
  //mostraApuracao('M205');
  //mostraApuracao('M210');
  mostraApuracao('M600');
  //mostraApuracao('M610');


  PisCofinsM001;
  PisCofinsM990(0);


  PisCofinsP001(wGeraBlocoP);
  PisCofinsP990(0);
  PisCofins1001;
  PisCofins1990(0);
  PisCofins9001;
  PisCofins9990(0);
  reg.Free;
  reg := nil;
  fechaQuery(query);
  //DMOracle.ExecutaSql('DELETE FROM TB_SPED_APURACAO', true);
  //mostraApuracao('M100');
  //mostraApuracao('M500');
  //mostraApuracao('M105');
  //mostraApuracao('M200');
  //mostraApuracao('M205');
  //mostraApuracao('M210');
  //mostraApuracao('M600');
  //mostraApuracao('M610');


end;

// Bloco 0

procedure TPisCofins.PisCofins0001;
var reg: TPisCofins0001;
begin
  reg := TPisCofins0001.Create(TObject(Self), arquivo);
  reg.IND_MOV := 1;
  reg.grava;
  reg.Free;
  reg := nil;

  PisCofins0100;
  PisCofins0110;
  PisCofins0140;
  PisCofins0500;
end;

procedure TPisCofins.PisCofins0100;
var reg: TPisCofins0100;
  query: TOracleDataSet1;
begin
  query := executaQuery(DmPisCofins0.QReg100, True);
  if not abreQuery(query) then Exit;

  while not query.Eof do
  begin
    reg := TPisCofins0100.Create(TObject(Self), arquivo);
    reg.NOME := pegaValor(query, 'NOME');
    reg.CPF := pegaValor(query, 'DESC_CPF');
    reg.CRC := pegaValor(query, 'DESC_CRC');
    reg.CNPJ := pegaValor(query, 'DESC_CNPJ');
    reg.CEP := pegaValor(query, 'DESC_CEP');
    reg.END_ := RemoveNumEndereco(pegaValor(query, 'DESC_ENDERECO'),
      IntToStr(NumEndereco(pegaValor(query, 'DESC_ENDERECO'))));
    reg.NUM := NumEndereco(pegaValor(query, 'DESC_ENDERECO'));
    reg.COMPL := pegaValor(query, 'DESC_COMPLEMENTO');
    reg.BAIRRO := pegaValor(query, 'DESC_BAIRRO');
    reg.FONE := pegaValor(query, 'DESC_TELEFONE');
    reg.FAX := pegaValor(query, 'DESC_FAX');
    reg.EMAIL := pegaValor(query, 'DESC_E_MAIL');
    if SomenteNumeros(pegaValor(query, 'COD_CIDADE_IBGE')) = '' then
      reg.COD_MUN := 0
    else
      reg.COD_MUN := StrToInt(FormatFloat('00',
        SomenteNumerosEConverte(pegaValor(query, 'COD_UF_IBGE'))) +
        FormatFloat('00000',
        SomenteNumerosEConverte(pegaValor(query, 'COD_CIDADE_IBGE'))));
    reg.grava;
    reg.Free;
    reg := nil;

    query.Next;
  end;
  fechaQuery(query);
end;

procedure TPisCofins.PisCofins0110;
var reg: TPisCofins0110;
  query: TOracleDataSet1;
begin
  query := executaQuery(DmPisCofins0.QReg110);
  query.SetVariable('FILIAL', wFilial);
  if not abreQuery(query) then Exit;

  reg := TPisCofins0110.Create(TObject(Self), arquivo);
  reg.COD_INC_TRIB := pegaValor(query, 'COD_INC_TRIB');
  wCodIncTrib := pegaValor(query, 'COD_INC_TRIB');
  if (not eNulo(query,'COD_APROPRIACAO_CRED')) then
  begin
    reg.IND_APRO_CRED :=  pegaValor(query, 'COD_APROPRIACAO_CRED');
    wAproCred := pegaValor(query, 'COD_APROPRIACAO_CRED');
  end
  else
    wAproCred := '';
  reg.COD_TIPO_CONT := pegaValor(query, 'COD_TIPO_CONT');
  if wDataIni >= strToDate('01/08/2012') then
    reg.IND_REG_CUM :=  pegaValor(query, 'COD_CRITERIO_ESCRIT');
  reg.grava;
  reg.Free;
  reg := nil;

  if (not eNulo(query,'COD_APROPRIACAO_CRED')) then
    if pegaValor(query, 'COD_APROPRIACAO_CRED') = 2 then
      PisCofins0111;

  fechaQuery(query);

end;

procedure TPisCofins.PisCofins0111;
var reg: TPisCofins0111;
  query: TOracleDataSet1;
begin
  query := executaQuery(DmPisCofins0.QReg111);
  query.SetVariable('FILIAIS', bib.geraStringFiliais(wFiliais));
  query.SetVariable('DT_INI', wDataIni);
  query.SetVariable('DT_FIN', wDataFin);
  if not abreQuery(query) then Exit;             
  reg := TPisCofins0111.Create(TObject(Self), arquivo);
  reg.REC_BRU_NCUM_TRIB_MI := pegaValor(query, 'REC_BRU_NCUM_TRIB_MI');
  reg.REC_BRU_NCUM_NT_MI := pegaValor(query, 'REC_BRU_NCUM_NT_MI');
  reg.REC_BRU_NCUM_EXP := pegaValor(query, 'REC_BRU_NCUM_EXP');
  reg.REC_BRU_CUM := pegaValor(query, 'REC_BRU_CUM');
  reg.REC_BRU_TOTAL := pegaValor(query, 'REC_BRU_TOTAL');
  reg.grava;
  reg.Free;
  reg := nil;
end;

procedure TPisCofins.PisCofins0140;
var reg: TPisCofins0140;
  query: TOracleDataSet1;
begin
  query := executaQuery(DmPisCofins0.QReg140);
  query.SetVariable('FILIAIS', bib.geraStringFiliais(wFiliais));
  query.Open;
  if not abreQuery(query) then Exit;
  
  while not query.Eof do
  begin
    reg := TPisCofins0140.Create(TObject(Self), arquivo);
    reg.COD_EST := pegaValor(query, 'COD_FILIAL');
    reg.NOME := pegaValor(query, 'DESC_FILIAL');
    reg.CNPJ := pegaValor(query, 'NUM_CGC');
    reg.UF := pegaValor(query, 'DESC_SIGLA_ESTADO');
    reg.IE := pegaValor(query, 'DESC_INSCRICAO');
    if ((SomenteNumeros(pegaValor(query, 'COD_CIDADE_IBGE')) = '') or
      (SomenteNumeros(pegaValor(query, 'COD_UF_IBGE')) = '')) then
      reg.COD_MUN := 0
    else
      reg.COD_MUN :=
        StrToInt(FormatFloat('00', SomenteNumerosEConverte(pegaValor(query, 'COD_UF_IBGE'))) +
        FormatFloat('00000', SomenteNumerosEConverte(pegaValor(query, 'COD_CIDADE_IBGE'))));
    reg.IM := pegaValor(query, 'DESC_INSCRICAO_MUNICIPAL');
    reg.SUFRAMA := pegaValor(query, 'DESC_SUFRAMA');
    reg.grava;
    reg.Free;
    reg := nil;

    PisCofins0145(pegaValor(query, 'COD_FILIAL'));
    PisCofins0150;
    PisCofins0190;
    PisCofins0200;
    PisCofins0400(pegaValor(query, 'COD_FILIAL'));
    PisCofins0450(pegaValor(query, 'COD_FILIAL'));
    query.Next;
  end;
  fechaQuery(query);

end;

procedure TPisCofins.PisCofins0145(pFilial: Integer);
var reg: TPisCofins0145;
  query: TClientDataSet;
begin
  if pFilial = FGeraSPED.wMatriz then
  begin
    {query := executaQuery(DmPisCofins0.QReg145);
    query.SetVariable('DT_INI', wDataIni);
    query.SetVariable('DT_FIN', wDataFin);
    query.Open;}
    query := DmPisCofins0.CDS145;
    //if not abreQuery(query) then Exit;

    if query.RecordCount = 0 then Exit;
    query.First;
    while not query.Eof do
    begin
      reg := TPisCofins0145.Create(TObject(Self), arquivo);
      {reg.COD_INC_TRIB := pegaValor(query, 'COD_INC_TRIB');
      reg.VL_REC_TOT := pegaValor(query, 'VL_REC_TOT');
      reg.VL_REC_ATIV := pegaValor(query, 'VL_REC_ATIV');
      reg.VL_REC_DEMAIS_ATIV := pegaValor(query, 'VL_REC_DEMAIS_ATIV');
      reg.INFO_COMPL := pegaValor(query, 'INFO_COMPL');}

      reg.COD_INC_TRIB := query.FieldValues['COD_INC_TRIB'];
      reg.VL_REC_TOT := query.FieldValues['VL_REC_TOT'];
      reg.VL_REC_ATIV := query.FieldValues['VL_REC_ATIV'];
      //reg.VL_REC_DEMAIS_ATIV := query.FieldValues['VL_REC_DEMAIS_ATIV'];
      //reg.INFO_COMPL := query.FieldValues['INFO_COMPL'];
      reg.grava;
      reg.Free;
      reg := nil;
      query.Next;
    end;
    query.Close;
    //fechaQuery(query);
  end;
end;

procedure TPisCofins.PisCofins0150;
var reg: TPisCofins0150;
  query: TOracleDataSet1;
  wUf, wCidade: String;
begin
  wUf := '';
  wCidade := '';
  query := executaQuery(DmPisCofins0.QReg150);
  query.SetVariable('FILIAIS', bib.geraStringFiliais(wFiliais));
  query.SetVariable('DT_INICIAL', wDataIni);
  query.SetVariable('DT_FINAL', wDataFin);
  query.Open;
  if not abreQuery(query) then Exit;

  while not query.Eof do
  begin
    reg := TPisCofins0150.Create(TObject(Self), arquivo);
    reg.COD_PART := pegaValor(query, 'COD_CADASTRO');
    reg.NOME := pegaValor(query, 'NOME');
    reg.COD_PAIS := pegaValor(query, 'COD_PAIS_IBGE');
    reg.CNPJ := IfThen(pegaValor(query, 'DESC_CNPJ') <> '',
      pegaValor(query, 'DESC_CNPJ'),'');
    reg.CPF := IfThen(pegaValor(query, 'DESC_CNPJ') <> '', '',
      pegaValor(query, 'DESC_CPF'));
    reg.IE := pegaValor(query, 'NUM_INSCRICAO');
    wUf := pegaValor(query, 'COD_UF_IBGE');
    wCidade := pegaValor(query, 'COD_CIDADE_IBGE');
    reg.COD_MUN := wUf + wCidade;
    reg.SUFRAMA := pegaValor(query, 'DESC_SUFRAMA');
    reg.END_ := pegaValor(query, 'DESC_ENDERECO');
    reg.COMPL := pegaValor(query, 'DESC_COMPLEMENTO');
    reg.BAIRRO := pegaValor(query, 'DESC_BAIRRO');
    reg.grava;
    reg.Free;
    reg := nil;
    query.Next;
  end;
  fechaQuery(query);
end;

procedure TPisCofins.PisCofins0190;
var reg: TPisCofins0190;
  query: TOracleDataSet1;
begin

  query := executaQuery(DmPisCofins0.QReg190);
  query.SetVariable('FILIAIS', bib.geraStringFiliais(wFiliais));
  query.SetVariable('DT_INICIAL', wDataIni);
  query.SetVariable('DT_FINAL', wDataFin);
  query.SetVariable('NUM_ANO', wAno);
  query.SetVariable('NUM_MES', wMes);
  query.Open;
  if not abreQuery(query) then Exit;

  while not query.Eof do
  begin
    reg := TPisCofins0190.Create(TObject(Self), arquivo);
    reg.UNID := pegaValor(query, 'DESC_UNIDADE');
    reg.DESCR := pegaValor(query, 'DESC_UNIDADE');
    reg.grava;
    reg.Free;
    reg := nil;
    query.Next;
  end;
  fechaQuery(query);
end;

procedure TPisCofins.PisCofins0200;
var reg: TPisCofins0200;
  query: TOracleDataSet1;
begin
  query := executaQuery(DmPisCofins0.QReg200);
  query.SetVariable('FILIAIS', bib.geraStringFiliais(wFiliais));
  query.SetVariable('DT_INICIAL', wDataIni);
  query.SetVariable('DT_FINAL', wDataFin);
  query.SetVariable('NUM_ANO', wAno);
  query.SetVariable('NUM_MES', wMes);
  query.Open;
  if not abreQuery(query) then Exit;

  while not query.Eof do
  begin
    reg := TPisCofins0200.Create(TObject(Self), arquivo);
    reg.COD_ITEM := pegaValor(query, 'COD_PRODUTO');
    reg.DESCR_ITEM := pegaValor(query, 'DESC_PRODUTO');
    reg.COD_BARRA := pegaValor(query, 'NUM_FABRICANTE');
    reg.TIPO_ITEM :=  pegaValor(query, 'COD_TIPO_PRODUTO');
    reg.COD_NCM := pegaValor(query, 'NUM_GENERO_NCM');
    reg.EX_IPI := pegaValor(query, 'COD_EX_TIPI');
    reg.COD_GEN := pegaValor(query, 'COD_GENERO_PRODUTO');
    reg.ALIQ_ICMS := pegaValor(query, 'PERC_ALIQUOTA');
    reg.COD_LST := pegaValor(query, 'COD_LISTA_SERVICO');
    reg.UNID_INV := pegaValor(query, 'DESC_UNIDADE');
    reg.IND_TIPO_PRODUTO := pegaValor(query, 'IND_TIPO_PRODUTO');
    reg.grava;
    reg.Free;
    reg := nil;
    PisCofins0205;
    PisCofins0206;
    PisCofins0208;
    query.Next;
  end;
  fechaQuery(query);

end;

procedure TPisCofins.PisCofins0205;
var reg: TPisCofins0205;
begin
  {reg := TPisCofins0205.Create();
  reg.grava;
  reg.Free;
  reg := nil;}
end;

procedure TPisCofins.PisCofins0206;
var reg: TPisCofins0206;
begin
  {reg := TPisCofins0206.Create();
  reg.grava;
  reg.Free;
  reg := nil;}
end;

procedure TPisCofins.PisCofins0208;
var reg: TPisCofins0208;
begin
  {reg := TPisCofins0208.Create();
  reg.grava;
  reg.Free;
  reg := nil;}
end;

procedure TPisCofins.PisCofins0400(pFilial: Integer);
var reg: TPisCofins0400;
  query: TOracleDataSet1;
begin
  query := executaQuery(DmPisCofins0.QReg400);
  query.SetVariable('COD_FILIAL', pFilial);
  query.SetVariable('DT_INICIAL', wDataIni);
  query.SetVariable('DT_FINAL', wDataFin);
  query.Open;
  if not abreQuery(query) then Exit;

  while not query.Eof do
  begin
    reg := TPisCofins0400.Create(TObject(Self), arquivo);
    reg.COD_NAT := pegaValor(query, 'COD_OPERACAO');
    reg.DESCR_NAT := pegaValor(query, 'DESC_OPERACAO');
    reg.grava;
    reg.Free;
    reg := nil;
    query.Next;
  end;
  fechaQuery(query);
end;

procedure TPisCofins.PisCofins0450(pFilial :Integer);
var reg: TPisCofins0450;
  query: TOracleDataSet1;
begin
  query := executaQuery(DmPisCofins0.QReg450);
  query.SetVariable('COD_FILIAL', wFilial);
  query.SetVariable('DATA_INI', wDataIni);
  query.SetVariable('DATA_FIN', wDataFin);
  query.open;
  if not abreQuery(query) then Exit;

  while not query.Eof do
  begin
    reg := TPisCofins0450.Create(TObject(Self), arquivo);
    reg.COD_INF := pegaValor(query, 'COD_MENSAGEM');
    reg.TXT := pegaValor(query, 'DESC_MENSAGEM');
    reg.grava;
    reg.Free;
    reg := nil;
    query.Next;
  end;
  fechaQuery(query);
end;

procedure TPisCofins.PisCofins0500;
var reg: TPisCofins0500;
  query: TOracleDataSet1;
begin
  query := executaQuery(DmPisCofins0.QReg500);
  query.SetVariable('FILIAIS', bib.geraStringFiliais(wFiliais));
  query.SetVariable('DATA_INI', wDataIni);
  query.SetVariable('DATA_FIN', wDataFin);
  query.open;
  if not abreQuery(query) then Exit;

  while not query.Eof do
  begin
    reg := TPisCofins0500.Create(TObject(Self), arquivo);
    //reg.DT_ALT := pegaValor(query, 'DT_ALT');
    reg.DT_ALT := wDataFin;
    reg.COD_NAT_CC := pegaValor(query, 'COD_NAT_CC');
    reg.IND_CTA := pegaValor(query, 'IND_CTA');
    reg.NIVEL := pegaValor(query, 'NIVEL');
    reg.COD_CTA := pegaValor(query, 'COD_CTA');
    reg.NOME_CTA := pegaValor(query, 'NOME_CTA');
    reg.COD_CTA_REF := pegaValor(query, 'COD_CTA_REF');
    reg.CNPJ_EST := pegaValor(query, 'CNPJ_EST');
    reg.grava;
    reg.Free;
    reg := nil;
    query.Next;
  end;
  fechaQuery(query);
end;


procedure TPisCofins.PisCofins0990(QtdLinhas: Double);
var reg: TPisCofins0990;
begin
  reg := TPisCofins0990.Create(TObject(Self), arquivo);
  reg.QTD_LIN_0 := QtdLinhas;
  reg.grava;
  reg.Free;
  reg := nil;
end;

// Fim Bloco 0

// Inicio Bloco A

procedure TPisCofins.PisCofinsA001;
var reg: TPisCofinsA001;
begin
  reg := TPisCofinsA001.Create(TObject(Self), arquivo);
  reg.IND_MOV := 1;
  reg.grava;
  reg.Free;
  reg := nil;

  PisCofinsA010;
end;

procedure TPisCofins.PisCofinsA010;
var reg :TPisCofinsA010;
  query: TOracleDataSet1;
begin
  query := executaQuery(DmPisCofinsA.QReg010);
  query.SetVariable('FILIAIS', bib.geraStringFiliais(wFiliais));
  query.SetVariable('DATA_INI', wDataIni);
  query.SetVariable('DATA_FIN', wDataFin);
  query.Open;
  if not abreQuery(query) then Exit;

  while not query.Eof do
  begin
    reg := TPisCofinsA010.Create(TObject(Self), arquivo);
    reg.CNPJ := pegaValor(query, 'CNPJ');
    reg.grava;
    reg.Free;
    reg := nil;
    PisCofinsA100(pegaValor(query, 'COD_FILIAL'));
    query.Next;
  end;
  fechaQuery(query);
end;

//Atenção
// Notas de serviço emitidas para pessoa jurídica fazem retenção de pis e cofins
// Isso altera o valor total de pis e cofins.
procedure TPisCofins.PisCofinsA100(pFilial :Integer);
var reg: TPisCofinsA100;
  query: TOracleDataSet1;
begin
  query := executaQuery(DmPisCofinsA.QReg100);
  query.SetVariable('FILIAIS', '(' + IntToStr(pFilial) + ')');
  query.SetVariable('DATA_INI', wDataIni);
  query.SetVariable('DATA_FIN', wDataFin);
  query.Open;
  if not abreQuery(query) then Exit;
  while not query.Eof do
  begin
    reg := TPisCofinsA100.Create(TObject(Self), arquivo);
    reg.IND_OPER := pegaValor(query, 'IND_OPER');
    reg.IND_EMIT := pegaValor(query, 'IND_EMIT');
    reg.COD_PART := pegaValor(query, 'COD_PART');
    reg.COD_SIT := pegaValor(query, 'COD_SIT');
    reg.SER := pegaValor(query, 'SER');
    reg.NUM_DOC := pegaValor(query, 'NUM_DOC');
    reg.DT_DOC := pegaValor(query, 'DT_DOC');
    reg.IND_PGTO := pegaValor(query, 'IND_PAGTO');
    reg.VL_DESC := pegaValor(query, 'VL_DESC');
    reg.VL_ISS := pegaValor(query, 'VL_ISS');
    reg.VL_DOC := pegaValor(query, 'VL_DOC');
    reg.VL_BC_PIS := pegaValor(query, 'VL_BC_PIS');
    reg.VL_BC_COFINS := pegaValor(query, 'VL_BC_COFINS');
    if (pegaValor(query, 'IND_PIS_COFINS_RETIDO') = 'SIM') and (pegaValor(query, 'RETENCAO_GRASEL') = 'NAO') then
    begin
      reg.VL_PIS_RET := pegaValor(query, 'VL_PIS');
      reg.VL_COFINS_RET := pegaValor(query, 'VL_COFINS');
      reg.VL_PIS := 0;
      reg.VL_COFINS := 0;
    end
    else
    begin
      reg.VL_PIS := pegaValor(query, 'VL_PIS');
      reg.VL_COFINS := pegaValor(query, 'VL_COFINS');
      reg.VL_PIS_RET := 0;
      reg.VL_COFINS_RET := 0;
    end;
    reg.grava;
    PisCofinsA110(pegaValor(query, 'COD_NOTA_CAB'));
    PisCofinsA120(pegaValor(query, 'COD_NOTA_CAB'));
    PisCofinsA170(pegaValor(query, 'COD_NOTA_CAB'), reg.IND_OPER,
      // boolean tem retenção
      (pegaValor(query, 'IND_PIS_COFINS_RETIDO') = 'SIM'),
      (pegaValor(query, 'RETENCAO_GRASEL') = 'SIM'));
    reg.Free;
    reg := nil;
    query.Next;
  end;
  fechaQuery(query);
end;

procedure TPisCofins.PisCofinsA110(pCodNota: Integer);
var reg: TPisCofinsA110;
  query: TOracleDataSet1;
begin
  query := executaQuery(DmPisCofinsA.QReg110);
  query.SetVariable('COD_NOTA_CAB', pCodNota);
  query.Open;
  if not abreQuery(query) then Exit;

  while not query.Eof do
  begin
    reg := TPisCofinsA110.Create(TObject(Self), arquivo);
    reg.COD_INF := pegaValor(query, 'COD_MENSAGEM');
    reg.TXT_COMPL := pegaValor(query, 'DESC_MENSAGEM');
    reg.grava;
    reg.Free;
    reg := nil;
    query.Next;
  end;
  fechaQuery(query);
end;

procedure TPisCofins.PisCofinsA120(pCodNota: Integer);
var reg: TPisCofinsA120;
  query: TOracleDataSet1;
begin
  query := executaQuery(DmPisCofinsA.QReg120);
  query.SetVariable('COD_NOTA_CAB', pCodNota);
  query.Open;
  if not abreQuery(query) then Exit;

  while not query.Eof do
  begin
    reg := TPisCofinsA120.Create(TObject(Self), arquivo);
    reg.VL_TOT_SERV := pegaValor(query,'VL_TOT_SERV');
    reg.VL_BC_PIS := pegaValor(query, 'VL_BC_PIS');
    reg.VL_PIS_IMP := pegaValor(query, 'VL_PIS_IMP');
    reg.DT_PAG_PIS := pegaValor(query,'DT_PAG_PIS');
    reg.VL_BC_COFINS := pegaValor(query, 'VL_BC_COFINS');
    reg.VL_COFINS_IMP := pegaValor(query, 'VL_COFINS_IMP');
    reg.DT_PAG_COFINS := pegaValor(query, 'DT_PAG_COFINS');
    reg.LOC_EXE_SERV := pegaValor(query, 'LOC_EXE_SERV');
    reg.grava;
    reg.Free;
    reg := nil;
    query.Next;
  end;
  fechaQuery(query);
end;

procedure TPisCofins.PisCofinsA170(pCodNota: Integer; pIndOper: Integer;
  pRetencao: boolean = false; pRetencaoGrasel: boolean = false);
var reg: TPisCofinsA170;
  query: TOracleDataSet1;
  seq: Integer;
begin
  seq := 0;
  query := executaQuery(DmPisCofinsA.QReg170);
  query.SetVariable('COD_NOTA_CAB', pCodNota);
  query.Open;
  if not abreQuery(query) then Exit;

  //pause
  {if pCodNota = 61343 then
    sleep(100);   }

  while not query.Eof do
  begin
    Inc(seq);
    reg := TPisCofinsA170.Create(TObject(Self), arquivo);
    reg.NUM_ITEM := seq;
    reg.COD_ITEM := pegaValor(query, 'COD_ITEM');
    reg.DESCR_COMPL := pegaValor(query, 'DESCR_COMPL');
    reg.VL_ITEM := pegaValor(query, 'VL_ITEM');
    reg.VL_DESC := pegaValor(query, 'VL_DESC');
    reg.NAT_BC_CRED := pegaValor(query, 'COD_NATUREZA_RECEITA');
    if(Length(reg.NAT_BC_CRED) = 1) then
      reg.NAT_BC_CRED := '0' + reg.NAT_BC_CRED;
    // Operação de saída não deve ter Natureza da base de cálculo do crédito
    if pegaValor(query, 'IND_ENTRADA_SAIDA') = 'S' then
      reg.NAT_BC_CRED := '';
    reg.CST_PIS := pegaValor(query, 'CST_PIS');
    reg.CST_COFINS := pegaValor(query, 'CST_COFINS');
    reg.ALIQ_PIS := pegaValor(query, 'ALIQ_PIS');
    reg.ALIQ_COFINS := pegaValor(query, 'ALIQ_COFINS');
    if (pRetencao) and (not pRetencaoGrasel) then
    begin
      reg.VL_BC_PIS := 0;
      reg.VL_BC_COFINS := 0;
      reg.VL_PIS := 0;
      reg.VL_COFINS := 0;
    end
    else
    begin
      reg.VL_BC_PIS := pegaValor(query, 'VL_BC_PIS');
      reg.VL_BC_COFINS := pegaValor(query, 'VL_BC_COFINS');
      reg.VL_PIS := pegaValor(query, 'VL_PIS');
      reg.VL_COFINS := pegaValor(query, 'VL_COFINS');
    end;
    reg.COD_CTA := pegaValor(query, 'COD_CTA');
    reg.IND_ORIG_CRED :=  IfThen(((pegaValor(query, 'NUM_NATUREZA_INT_NOVO') >= 3000) and
      (pegaValor(query, 'NUM_NATUREZA_INT_NOVO') < 4000)), '1', '0');
    // Saídas não devem ter origem de crédito
    if pegaValor(query, 'IND_ENTRADA_SAIDA') = 'S' then
      reg.IND_ORIG_CRED := '';
    if (pRetencaoGrasel) and (pegaValor(query, 'IND_ENTRADA_SAIDA') = 'S') then // Virou entrada
    begin
      reg.CST_PIS := '50';
      reg.CST_COFINS := '50';
      reg.IND_ORIG_CRED :=  '0';
      reg.NAT_BC_CRED := '03';
    end
    else
      if (pRetencaoGrasel) and (pegaValor(query, 'IND_ENTRADA_SAIDA') = 'E') then // Virou saída
      begin
        reg.CST_PIS := '02';
        reg.CST_COFINS := '02';
        reg.IND_ORIG_CRED :=  '';
        reg.NAT_BC_CRED := '';
      end;
    reg.grava;
    if (pIndOper = 1) and (not pRetencao) then  // grava apuracao
    begin
      if (reg.CST_PIS = '04') or ((reg.CST_PIS = '05') and (wPercPis = '0')) or (reg.CST_PIS = '06')
        or (reg.CST_PIS = '07') or (reg.CST_PIS = '08') or (reg.CST_PIS = '09')then
        insereApuracao('M400',reg.VL_ITEM, reg.CST_PIS, '', reg.COD_CTA, pegaValor(query, 'COD_NATUREZA_RECEITA'));
      if (reg.CST_COFINS = '04') or ((reg.CST_COFINS = '05') and (wPercCofins = '0')) or (reg.CST_COFINS = '06')
        or (reg.CST_COFINS = '07') or (reg.CST_COFINS = '08') or (reg.CST_COFINS = '09')then
        insereApuracao('M800',reg.VL_ITEM, '', reg.CST_COFINS, reg.COD_CTA, pegaValor(query, 'COD_NATUREZA_RECEITA'));
    end;
    if(reg.CST_PIS <> '') then
    begin
      if(pIndOper = 0) then //notas de entrada
      begin
        insereApuracaoM100_M500('M100', reg.VL_PIS, reg.VL_BC_PIS, reg.CST_PIS, reg.ALIQ_PIS, '', pegaValor(query, 'COD_BC_CREDITO_PISCOFINS'), 'NFS-e', pRetencaoGrasel);
        insereApuracaoM100_M500('M500', reg.VL_COFINS, reg.VL_BC_COFINS, reg.CST_COFINS, reg.ALIQ_COFINS, '', pegaValor(query, 'COD_BC_CREDITO_PISCOFINS'), 'NFS-e', pRetencaoGrasel);
      end
      else
      begin
        insereApuracaoM200_M600('M200', reg.VL_PIS, reg.VL_BC_PIS, reg.CST_PIS, reg.ALIQ_PIS, reg.VL_ITEM);
        insereApuracaoM200_M600('M600', reg.VL_COFINS, reg.VL_BC_COFINS, reg.CST_COFINS, reg.ALIQ_COFINS, reg.VL_ITEM);
      end;
    end;
    reg.Free;
    reg := nil;
    query.Next;
  end;
  fechaQuery(query);
end;


procedure TPisCofins.PisCofinsA990(QtdLinhas: Double);
var reg: TPisCofinsA990;
begin
  reg := TPisCofinsA990.Create(TObject(Self), arquivo);
  reg.QTD_LIN_A := QtdLinhas;
  reg.grava;
  reg.Free;
  reg := nil;
end;

// Fim Bloco A

// Inicio Bloco C

procedure TPisCofins.PisCofinsC001;
var reg: TPisCofinsC001;
begin
  reg := TPisCofinsC001.Create(TObject(Self), arquivo);
  reg.IND_MOV := 1;
  reg.grava;
  reg.Free;
  reg := nil;

  PisCofinsC010;
end;

procedure TPisCofins.PisCofinsC010;
var reg: TPisCofinsC010;
  query: TOracleDataSet1;
begin
  query := executaQuery(DmPisCofinsC.QReg010);
  query.SetVariable('FILIAIS', bib.geraStringFiliais(wFiliais));
  query.SetVariable('DATA_INI', wDataIni);
  query.SetVariable('DATA_FIN', wDataFin);
  query.Open;
  if not abreQuery(query) then Exit;

  while not query.Eof do
  begin
    reg := TPisCofinsC010.Create(TObject(Self), arquivo);
    reg.CNPJ := pegaValor(query, 'CNPJ');
    reg.IND_ESCRI := pegaValor(query, 'IND_ESCRI');
    reg.grava;
    wC010IndEscri := reg.IND_ESCRI;
    PisCofinsC100(pegaValor(query, 'COD_FILIAL'));
    reg.Free;
    reg := nil;
    //PisCofinsC180;
    //PisCofinsC190;
    PisCofinsC380(pegaValor(query, 'COD_FILIAL'));
    PisCofinsC395(pegaValor(query, 'COD_FILIAL'));
    PisCofinsC490(pegaValor(query, 'COD_FILIAL'));
    PisCofinsC500(pegaValor(query, 'COD_FILIAL'));
    query.Next;
  end;
  fechaQuery(query);

end;

procedure TPisCofins.PisCofinsC100(pFilial: Integer);
var
  reg: TPisCofinsC100;
  query: TOracleDataSet1;
  bibSped: TBibSped;
  cnpj, sFastSelect: string;
  aliqPis, aliqCofins, vlPis, vlCofins: Currency;
begin
  bibSped := TBibSped.Create;
  query := executaQuery(DmPisCofinsC.QReg100);
  query.SetVariable('COD_FILIAL', pFilial);
  query.SetVariable('DATA_INI', wDataIni);
  query.SetVariable('DATA_FIN', wDataFin);
  query.Open;
  if not abreQuery(query) then Exit;

  while not query.Eof do
  begin
    reg := TPisCofinsC100.Create(TObject(Self), arquivo);
    reg.IND_OPER := pegaValor(query, 'IND_OPER');
    reg.IND_EMIT := pegaValor(query, 'IND_EMIT');

    reg.COD_SIT := pegaValor(query, 'COD_SIT');

    // Notas com cnpj na chave de acesso da SEFAZ (RS - SC - MS - PR)
    // devem possuir situação especial
    if (copy(pegaValor(query, 'CHV_NFE'), 10, 14) = '87958674000181')
      or (copy(pegaValor(query, 'CHV_NFE'), 10, 14) = '82951310000156')
      or (copy(pegaValor(query, 'CHV_NFE'), 10, 14) = '16907746000113') // MG - Vanessa 09/05/2016
      or (copy(pegaValor(query, 'CHV_NFE'), 10, 14) = '02935843000105')
      or (copy(pegaValor(query, 'CHV_NFE'), 10, 14) = '78393592000146') then   //Paraná
      reg.COD_SIT := '08';

    reg.SER := pegaValor(query, 'SER');
    reg.COD_MOD := pegaValor(query, 'COD_MOD');
    reg.NUM_DOC := pegaValor(query, 'NUM_DOC');
    if  ((pegaValor(query, 'COD_MOD') = '55') or (pegaValor(query, 'COD_MOD') = '65'))
      and (pegaValor(query, 'CHV_NFE') <> '') then
        reg.CHV_NFE := StringReplace(pegaValor(query, 'CHV_NFE'),'NFe','',
          [rfReplaceAll, rfIgnoreCase]);
    if pegaValor(query, 'COD_SIT') = '00' then // quando nota cancelada nao apresenta esta informacao
    begin
      if pegaValor(query, 'COD_PART') > 0 then
        reg.COD_PART := IntToStr(pegaValor(query, 'COD_PART'))
      else
        reg.COD_PART := '';
      //if ((pegaValor(query, 'IND_EMITE') = 'F') and
      reg.DT_DOC := pegaValor(query, 'DT_DOC');
      reg.DT_E_S := pegaValor(query, 'DT_E_S');
      reg.VL_DOC := pegaValor(query, 'VL_DOC');
      if (pegaValor(query, 'IND_PAGTO') = '0') then //a vista
        reg.IND_PGTO := pegaValor(query, 'IND_PAGTO');
      if(pegaValor(query, 'IND_PAGTO') = '9') then//outros
      begin
        if wDataFin >= StrToDate('31/07/2012') then
          reg.IND_PGTO := 2
        else
          reg.IND_PGTO := 9;
      end;
      if (pegaValor(query, 'IND_PAGTO') = '1') then //a prazo
      begin
        if pegaValor(query, 'QT_FATURAS') = 0 then //existem (no sei por que) notas a prazo sem faturas lançadas
          reg.IND_PGTO := 0 //usa a vista mesmo
        else
          reg.IND_PGTO := pegaValor(query, 'IND_PAGTO'); //aqui sim coloca a prazo
      end;
      reg.VL_DESC := pegaValor(query, 'VL_DESC');
      reg.VL_ABAT_NT := 0;
      reg.VL_MERC := pegaValor(query, 'VL_MERC');
      if pegaValor(query, 'VL_FRT') <= 0 then
        reg.IND_FRT := 9
      else if pegaValor(query, 'IND_FRT') = 'CIF' then
        reg.IND_FRT := 1
      else
        reg.IND_FRT := 2;
      reg.VL_FRT := pegaValor(query, 'VL_FRT');
      reg.VL_SEG := 0;
      reg.VL_OUT_DA := pegaValor(query, 'VL_OUT_DA');
      reg.VL_BC_ICMS := pegaValor(query, 'VL_BC_ICMS');
      reg.VL_ICMS := pegaValor(query, 'VL_ICMS');
      reg.VL_BC_ICMS_ST := bibSped.ICMSST(pegaValor(query, 'VL_BC_ICMS_ST')
        , pegaValor(query, 'IND_ENTRADA_SAIDA'));
      reg.VL_ICMS_ST := bibSped.ICMSST(pegaValor(query, 'VL_ICMS_ST')
        , pegaValor(query, 'IND_ENTRADA_SAIDA'));
      reg.VL_IPI := pegaValor(query, 'VL_IPI');
      reg.VL_PIS := pegaValor(query, 'VL_PIS');
      reg.VL_COFINS := pegaValor(query, 'VL_COFINS');
      reg.VL_PIS_ST := 0;
      reg.VL_COFINS_ST := 0;

      if (reg.VL_PIS = 0) and (pegaValor(query, 'IND_COMBUSTIVEL') = 'S') then
      begin
        sFastSelect :=  DMOracle.FastSelect('PERC_PIS', 'TB_PARAM_SISTEMA'
        , '');
        aliqPis := StrToFloat(sFastSelect);
        vlPis := (reg.VL_DOC - reg.VL_ICMS) * (aliqPis/100);
        reg.VL_PIS := bib.RoundTo2(vlPis, -2);

      end;

      if (reg.VL_COFINS = 0) and (pegaValor(query, 'IND_COMBUSTIVEL') = 'S') then
      begin
        sFastSelect :=  DMOracle.FastSelect('PERC_COFINS', 'TB_PARAM_SISTEMA'
        , '');
        aliqCofins := StrToFloat(sFastSelect);
        vlCofins := (reg.VL_DOC - reg.VL_ICMS) * (aliqCofins/100);
        reg.VL_COFINS := bib.RoundTo2(vlCofins, -2);

      end;


    end;
    reg.grava;
    if pegaValor(query, 'COD_SIT') = '00' then
    begin
      PisCofinsC110(pegaValor(query, 'COD_NOTA_CAB'));
      PisCofinsC120(pegaValor(query, 'COD_NOTA_CAB'));
      PisCofinsC170(pegaValor(query, 'COD_NOTA_CAB'), reg.COD_MOD,
                                              pegaValor(query, 'IND_COMBUSTIVEL'), reg.IND_OPER);
      PisCofinsC175(pegaValor(query, 'COD_NOTA_CAB'));
    end;
    reg.Free;
    reg := nil;
    query.Next;
  end;
  fechaQuery(query);
end;

procedure TPisCofins.PisCofinsC110(pCodNota: Integer);
var reg: TPisCofinsC110;
 query: TOracleDataSet1;
begin
  query := executaQuery(DmPisCofinsC.QReg110);
  query.SetVariable('CODNOTA', pCodNota);
  query.Open;
  if not abreQuery(query) then Exit;

  while not query.Eof do
  begin
    reg := TPisCofinsC110.Create(TObject(Self), arquivo);
    reg.COD_INF := pegaValor(query, 'COD_MENSAGEM');
    reg.TXT_COMPL := pegaValor(query, 'DESC_MENSAGEM');
    reg.grava;
    reg.Free;
    reg := nil;
    query.Next;
  end;
  fechaQuery(query);

end;

procedure TPisCofins.PisCofinsC120(pCodNota: Integer);
var reg: TPisCofinsC120;
 query: TOracleDataSet1;
begin
  query := executaQuery(DmPisCofinsC.QReg120);
  query.SetVariable('COD_NOTA', pCodNota);
  query.Open;
  if not abreQuery(query) then Exit;

  while not query.Eof do
  begin
    reg := TPisCofinsC120.Create(TObject(Self), arquivo);
    reg.COD_DOC_IMP := pegaValor(query, 'COD_DOC_IMP');
    reg.NUM_DOC_IMP := pegaValor(query, 'NUM_DOC_IMP');
    reg.VL_PIS_IMP := pegaValor(query, 'VL_PIS_IMP');
    reg.VL_COFINS_IMP := pegaValor(query, 'VL_COFINS_IMP');
    reg.NUM_ACDR_AW := '0';
    reg.grava;
    reg.Free;
    reg := nil;
    query.Next;
  end;
  fechaQuery(query);

end;

procedure TPisCofins.PisCofinsC170(pCodNota: Integer; pCodMod, IndComb: String; pIndOper: Integer);
var reg: TPisCofinsC170;
  query: TOracleDataSet1;
  seq: Integer;
  wDevolucao: Boolean;
  bibSped: TBibSped;
  wOperacao: String;
  wCodNatBCCred: string;
  wIndCombustivel: String;
  ValPisCalculado, ValCofinsCalculado: Double;
begin
  bibSped := TBibSped.Create;
  query := executaQuery(DmPisCofinsC.QReg170);
  query.SetVariable('CODNOTA', pCodNota);

  wIndCombustivel := IndComb;

  query.Open;
  if not abreQuery(query) then Exit;

  seq := 0;
  while not query.Eof do
  begin
    Inc(seq);
    reg := TPisCofinsC170.Create(TObject(Self), arquivo);
    reg.NUM_ITEM := seq;
    reg.COD_ITEM := pegaValor(query, 'COD_ITEM');
    reg.DESCR_COMPL := pegaValor(query, 'DESCR_COMPL');
    reg.QTD := pegaValor(query, 'QT_QUANTIDADE');
    reg.UNID := pegaValor(query, 'DESC_UNIDADE');
    reg.VL_ITEM := pegaValor(query, 'VAL_TOTAL');
    reg.VL_DESC := pegaValor(query, 'VL_DESC');
    if pegaValor(query, 'IND_MOV') = 'S' then
      reg.IND_MOV := '0'
    else
      reg.IND_MOV := '1';
    reg.CST_ICMS := pegaValor(query, 'DESC_SITUACAO_TRIB');
    reg.CFOP := pegaValor(query, 'CFOP');
    reg.COD_NAT := pegaValor(query, 'COD_NAT');
    reg.VL_BC_ICMS := pegaValor(query, 'VL_BC_ICMS');
    reg.ALIQ_ICMS := pegaValor(query, 'ALIQ_ICMS');
    reg.VL_ICMS := pegaValor(query, 'VL_ICMS');
    reg.VL_BC_ICMS_ST := bibSped.ICMSST(pegaValor(query, 'VL_BC_ICMS_ST')
      , pegaValor(query, 'IND_ENTRADA_SAIDA'));
    reg.ALIQ_ST := pegaValor(query, 'ALIQ_ST');
    reg.VL_ICMS_ST := bibSped.ICMSST(pegaValor(query, 'VL_ICMS_ST')
      , pegaValor(query, 'IND_ENTRADA_SAIDA'));
    reg.CST_IPI := pegaValor(query, 'CST_IPI');
    reg.ALIQ_PIS := pegaValor(query, 'ALIQ_PIS');
    if not (integer(pegaValor(query, 'CST_PIS')) in [4,6,7,8,9,49]) then
    begin
      reg.VL_PIS := pegaValor(query, 'VL_PIS');

      if pegaValor(query, 'VAL_BC_DI') > 0 then
        reg.VL_BC_PIS := pegaValor(query, 'VAL_BC_DI')
      else
        if wCodIncTrib = 1 then
        begin
          reg.VL_BC_PIS := (pegaValor(query, 'PERC_BASE_PIS')
            * (bibSped.BcPisCofins(pegaValor(query, 'VAL_TOTAL')
              , pegaValor(query, 'VL_ICMS_ST')
              , pegaValor(query, 'IND_ENTRADA_SAIDA')
              , pegaValor(query, 'IND_DESCONTA_ICMS_ST_PISCOFINS'))
            + pegaValor(query, 'VL_DESPESA')
            - pegaValor(query,'VL_DESC')));

          reg.VL_BC_PIS := reg.VL_BC_PIS/100;

          if DMParamSistema.CodEmpresa <> 'GRASEL' then
            reg.VL_BC_PIS := reg.VL_BC_PIS - bib.iif(reg.VL_BC_PIS = 0, 0, pegaValor(query, 'VL_ICMS'));

          if wIndCombustivel = 'S' then
          begin
            ValPisCalculado := reg.VL_BC_PIS * (reg.ALIQ_PIS/100);
            reg.VL_PIS := ValPisCalculado;
          end;

        end
        else
          if wCodIncTrib = 2 then
          begin
            {
            reg.VL_BC_PIS := (pegaValor(query, 'PERC_BASE_PIS')
              * (pegaValor(query, 'VAL_TOTAL')
              - pegaValor(query, 'VL_IPI')
              - pegaValor(query,'VL_ICMS_ST'))) /100;
            }
            reg.VL_BC_PIS := (pegaValor(query, 'PERC_BASE_PIS')
              * ((bibSped.BcPisCofins(pegaValor(query, 'VAL_TOTAL')
                  , pegaValor(query, 'VL_ICMS_ST')
                  , pegaValor(query, 'IND_ENTRADA_SAIDA')
                  , pegaValor(query, 'IND_DESCONTA_ICMS_ST_PISCOFINS'))
                ) - pegaValor(query, 'VL_IPI')));

            reg.VL_BC_PIS := reg.VL_BC_PIS / 100;

            if DMParamSistema.CodEmpresa <> 'GRASEL' then
            begin
              if reg.VL_BC_PIS > 0 then
              reg.VL_BC_PIS := reg.VL_BC_PIS - pegaValor(query, 'VL_ICMS');
            end;
            if wIndCombustivel = 'S' then
            begin
              ValPisCalculado := reg.VL_BC_PIS * (reg.ALIQ_PIS/100);
              reg.VL_PIS := ValPisCalculado;
            end;

          end;
      {reg.VL_PIS := bibSped.ValPisCofins(pegaValor(query, 'VL_PIS') // valor calculado pela sql
        , pegaValor(query, 'IND_ENTRADA_SAIDA'), reg.VL_BC_PIS, reg.ALIQ_PIS);}
    end
    else
    begin
      reg.VL_PIS := 0;
      reg.VL_BC_PIS := 0;
    end;

    reg.CST_PIS := pegaValor(query, 'CST_PIS');
    reg.ALIQ_IPI := pegaValor(query, 'ALIQ_IPI');
    reg.VL_BC_IPI := (100 * pegaValor(query, 'VAL_TOTAL')) /100;  // assume que base de calculo é 100%
    reg.VL_IPI := pegaValor(query, 'VL_IPI');
    reg.CST_COFINS := pegaValor(query, 'CST_COFINS');
    reg.ALIQ_COFINS := pegaValor(query, 'ALIQ_COFINS');
    if not (integer(pegaValor(query, 'CST_COFINS')) in [4,6,7,8,9,49]) then
    begin
      reg.VL_COFINS := pegaValor(query,'VL_COFINS');
      if pegaValor(query, 'VAL_BC_DI') > 0 then
        reg.VL_BC_COFINS := pegaValor(query, 'VAL_BC_DI')
      else
        if wCodIncTrib = 1 then
        begin
          reg.VL_BC_COFINS := (pegaValor(query, 'PERC_BASE_COFINS')
            * (bibSped.BcPisCofins(pegaValor(query, 'VAL_TOTAL')
              , pegaValor(query, 'VL_ICMS_ST')
              , pegaValor(query, 'IND_ENTRADA_SAIDA')
              , pegaValor(query, 'IND_DESCONTA_ICMS_ST_PISCOFINS'))
            + pegaValor(query, 'VL_DESPESA')
            - pegaValor(query,'VL_DESC')));

          reg.VL_BC_COFINS := reg.VL_BC_COFINS / 100;

          if DMParamSistema.CodEmpresa <> 'GRASEL' then
          begin
            if reg.VL_BC_COFINS > 0 then
              reg.VL_BC_COFINS := reg.VL_BC_COFINS - pegaValor(query, 'VL_ICMS');
          end;
          if  wIndCombustivel = 'S' then
          begin
            ValCofinsCalculado := reg.VL_BC_COFINS * (reg.ALIQ_COFINS/100);
            reg.VL_COFINS := ValCofinsCalculado;
          end;

        end
        else
          if wCodIncTrib = 2 then
          begin
            reg.VL_BC_COFINS := (pegaValor(query, 'PERC_BASE_COFINS')
              * (bibSped.BcPisCofins(pegaValor(query, 'VAL_TOTAL')
                , pegaValor(query, 'VL_ICMS_ST')
                , pegaValor(query, 'IND_ENTRADA_SAIDA')
                , pegaValor(query, 'IND_DESCONTA_ICMS_ST_PISCOFINS'))
                - pegaValor(query, 'VL_IPI')));

            reg.VL_BC_COFINS := reg.VL_BC_COFINS / 100;
            
            if DMParamSistema.CodEmpresa <> 'GRASEL' then
            begin
              if reg.VL_BC_COFINS > 0 then
              reg.VL_BC_COFINS := reg.VL_BC_COFINS - pegaValor(query, 'VL_ICMS');
            end;
            if wIndCombustivel = 'S' then
            begin
              ValCofinsCalculado := reg.VL_BC_COFINS * (reg.ALIQ_COFINS/100);
              reg.VL_COFINS := ValCofinsCalculado;
            end;

         end;
    end
    else
    begin
      reg.VL_COFINS := 0;
      reg.VL_BC_COFINS := 0;
    end;

    reg.COD_CTA := pegaValor(query, 'COD_CTA');

    // Verifica se operação possui conta contábil do sped contribuições informada
    if (Trim(reg.COD_CTA) = '') and (Pos(reg.CST_PIS, '04, 05, 06, 07, 08, 09') > 0) then
    begin
      wOperacao :=  DMOracle.FastSelect('COD_OPERACAO', 'TB_NOTA_CAB'
        , 'COD_NOTA_CAB = ' + IntToStr(pCodNota));
      Raise Exception.Create('Erro: Documento fiscal nº ' + IntToStr(pegaValor(query, 'NUM_NOTA'))
        + #13 + #10 + 'Operação ' + wOperacao + ' - ' +
        DMOracle.FastSelect('DESC_OPERACAO', 'TB_OPERACAO', 'COD_OPERACAO = ' +
          wOperacao)
        + ' não possui conta contábil do sped contribuições informada'
        + #13 + #10 + 'CST de PIS/COFINS informado ' + reg.CST_PIS);
    end;

    if (pIndOper = 1) and // notas de saida
      ((pCodMod <> '55') or
      ((pCodMod = '55') and (wC010IndEscri = '2')))then  // Insere apuracao M400
    begin
      if (reg.CST_PIS = '04') or ((reg.CST_PIS = '05') and (wPercPis = '0')) or (reg.CST_PIS = '06')
        or (reg.CST_PIS = '07') or (reg.CST_PIS = '08') or (reg.CST_PIS = '09')then
        insereApuracao('M400', reg.VL_ITEM, reg.CST_PIS, '', reg.COD_CTA, pegaValor(query,'COD_NATUREZA_RECEITA'));
      if (reg.CST_COFINS = '04') or ((reg.CST_COFINS = '05') and (wPercCofins = '0')) or (reg.CST_COFINS = '06')
        or (reg.CST_COFINS = '07') or (reg.CST_COFINS = '08') or (reg.CST_COFINS = '09')then
        insereApuracao('M800', reg.VL_ITEM, '', reg.CST_COFINS, reg.COD_CTA, pegaValor(query,'COD_NATUREZA_RECEITA'));
    end;
    if reg.CST_PIS <> '' then
    begin
      if(pIndOper = 0) then //notas de entrada
      begin
        wCodNatBCCred := '';
        if Pos(pegaValor(query, 'CFOP'), '1102,1113,1117,1118,1121,1251,1403,1652,2102,2113,2117,2118,2121,2251,2403,2652,3102,3251,3652') > 0 then
          wCodNatBCCred := '01'
        else
          if Pos(pegaValor(query, 'CFOP'), '1101,1111,1116,1120,1122,1126,1128,1401,1407,1556,1651,1653,2101,2111,2116,2120,2122,2126,2128,2401,2407,2556,2651,2653,3101,3126,3128,3556,3651,3653') > 0 then
            wCodNatBCCred := '02'
        else
          if Pos(pegaValor(query, 'CFOP'), '1124,1125,1933,2124,2125,2933') > 0 then
            wCodNatBCCred := '03'
        else
          if Pos(pegaValor(query, 'CFOP'), '1201,1202,1203,1204,1410,1411,1660,1661,1662,2201,2202,2410,2411,2660,2661,2662') > 0 then
            wCodNatBCCred := '12'
        else
          if Pos(pegaValor(query, 'CFOP'), '1922,2922') > 0 then
            wCodNatBCCred := '13';
        if wCodNatBcCred <> '' then
        begin
          insereApuracaoM100_M500('M100', reg.VL_PIS, reg.VL_BC_PIS, reg.CST_PIS, reg.ALIQ_PIS, IntToStr(reg.CFOP), StrToInt(wCodNatBCCred), 'NF-e');
          insereApuracaoM100_M500('M500', reg.VL_COFINS, reg.VL_BC_COFINS, reg.CST_COFINS, reg.ALIQ_COFINS, IntToStr(reg.CFOP), StrToInt(wCodNatBCCred), 'NF-e');
        end;
      end
      else
      begin
        insereApuracaoM200_M600('M200', reg.VL_PIS, reg.VL_BC_PIS, reg.CST_PIS, reg.ALIQ_PIS, reg.VL_ITEM);
        insereApuracaoM200_M600('M600', reg.VL_COFINS, reg.VL_BC_COFINS, reg.CST_COFINS, reg.ALIQ_COFINS, reg.VL_ITEM);
      end;
    end;
    reg.grava;
    reg.Free;
    reg := nil;
    query.Next;
  end;
  fechaQuery(query);

end;

procedure TPisCofins.PisCofinsC180;
var reg: TPisCofinsC180;
  query: TOracleDataSet1;
begin
  query := executaQuery(DmPisCofinsC.QReg180);
  query.SetVariable('COD_FILIAL', wFilial);
  query.setVariable('DATA_INI', wDataIni);
  query.setVariable('DATA_FIN', wDataFin);
  query.Open;
  if not abreQuery(query) then Exit;

  while not query.Eof do
  begin
    reg := TPisCofinsC180.Create(TObject(Self), arquivo);
    reg.COD_MOD := pegaValor(query, 'COD_MOD');
    reg.COD_ITEM := pegaValor(query, 'COD_PRODUTO');
    reg.COD_NCM := pegaValor(query, 'COD_NCM');
    reg.EX_IPI := pegaValor(query, 'EX_IPI');
    reg.DT_DOC_INI := pegaValor(query, 'DT_DOC_INI');
    reg.DT_DOC_FIN := pegaValor(query, 'DT_DOC_FIN');
    reg.VL_TOT_ITEM := pegaValor(query, 'VL_TOT_ITEM');
    reg.grava;
    reg.Free;
    reg := nil;
    PisCofinsC181;
    PisCofinsC185;
    query.Next;
  end;
  fechaQuery(query);

end;

procedure TPisCofins.PisCofinsC181;
var reg: TPisCofinsC181;
  query: TOracleDataSet1;
begin
  query := executaQuery(DmPisCofinsC.QReg181);
  query.SetVariable('COD_FILIAL', wFilial);
  query.setVariable('DATA_INI', wDataIni);
  query.setVariable('DATA_FIN', wDataFin);
  query.Open;
  if not abreQuery(query) then Exit;

  while not query.Eof do
  begin
    reg := TPisCofinsC181.Create(TObject(Self), arquivo);
    reg.CST_PIS := pegaValor(query, 'CST_PIS');
    reg.CFOP := pegaValor(query, 'CFOP');
    reg.ALIQ_PIS := pegaValor(query, 'ALIQ_PIS');
    reg.COD_CTA := pegaValor(query, 'COD_CTA');
    reg.VL_DESC := pegaValor(query, 'VL_DESC');
    reg.VL_BC_PIS := pegaValor(query, 'VL_BC_PIS');
    reg.VL_ITEM := pegaValor(query, 'VL_ITEM');
    reg.VL_PIS := pegaValor(query, 'VL_PIS');
    reg.grava;
    if wC010IndEscri = '1' then  //Insere apuracao M400
      if (reg.CST_PIS = '04') or ((reg.CST_PIS = '05') and (wPercPis = '0')) or (reg.CST_PIS = '06')
        or (reg.CST_PIS = '07') or (reg.CST_PIS = '08') or (reg.CST_PIS = '09')then
        insereApuracao('M400', reg.VL_ITEM, reg.CST_PIS, '', reg.COD_CTA);
    reg.Free;
    reg := nil;
    query.Next;
  end;
  fechaQuery(query);

end;

procedure TPisCofins.PisCofinsC185;
var reg: TPisCofinsC185;
  query: TOracleDataSet1;
begin
  query := executaQuery(DmPisCofinsC.QReg185);
  query.SetVariable('COD_FILIAL', wFilial);
  query.setVariable('DATA_INI', wDataIni);
  query.setVariable('DATA_FIN', wDataFin);
  query.Open;
  if not abreQuery(query) then Exit;

  while not query.Eof do
  begin
    reg := TPisCofinsC185.Create(TObject(Self), arquivo);
    reg.CST_COFINS := pegaValor(query, 'CST_COFINS');
    reg.CFOP := pegaValor(query, 'CFOP');
    reg.ALIQ_COFINS := pegaValor(query, 'ALIQ_COFINS');
    reg.COD_CTA := pegaValor(query, 'COD_CTA');
    reg.VL_BC_COFINS := pegaValor(query, 'VL_BC_COFINS');
    reg.VL_DESC := pegaValor(query, 'VL_DESC');
    reg.VL_ITEM := pegaValor(query, 'VL_ITEM');
    reg.VL_COFINS := pegaValor(query, 'VL_COFINS');
    reg.grava;
    reg.Free;
    reg := nil;
    query.Next;
  end;
  fechaQuery(query);

end;

procedure TPisCofins.PisCofinsC190;
var reg: TPisCofinsC190;
  query: TOracleDataSet1;
begin
  query := executaQuery(DmPisCofinsC.QReg190);
  query.SetVariable('COD_FILIAL', wFilial);
  query.setVariable('DATA_INI', wDataIni);
  query.setVariable('DATA_FIN', wDataFin);
  query.Open;
  if not abreQuery(query) then Exit;

  while not query.Eof do
  begin
    reg := TPisCofinsC190.Create(TObject(Self), arquivo);
    reg.COD_MOD := pegaValor(query, 'COD_MOD');
    reg.COD_ITEM := pegaValor(query, 'COD_ITEM');
    reg.COD_NCM := pegaValor(query, 'COD_NCM');
    reg.EX_IPI := pegaValor(query, 'EX_TIPI');
    reg.DT_REF_INI := pegaValor(query, 'DT_REF_INI');
    reg.DT_REF_FIN := pegaValor(query, 'DT_REF_FIN');
    reg.VL_TOT_ITEM := pegaValor(query, 'VL_TOT_ITEM');
    reg.grava;
    reg.Free;
    reg := nil;
    PisCofinsC191;
    PisCofinsC195;
    PisCofinsC199;
    query.Next;
  end;
  fechaQuery(query);
end;

procedure TPisCofins.PisCofinsC191;
var reg: TPisCofinsC191;
  query: TOracleDataSet1;
begin
  query := executaQuery(DmPisCofinsC.QReg191);
  query.SetVariable('COD_FILIAL', wFilial);
  query.setVariable('DATA_INI', wDataIni);
  query.setVariable('DATA_FIN', wDataFin);
  query.Open;
  if not abreQuery(query) then Exit;

  while not query.Eof do
  begin
    reg := TPisCofinsC191.Create(TObject(Self), arquivo);
    reg.CNPJ_CPF_PART := pegaValor(query, 'CNPJ_CPF_PART');
    reg.CST_PIS := pegaValor(query, 'CST_PIS');
    reg.CFOP := pegaValor(query, 'CFOP');
    reg.ALIQ_PIS := pegaValor(query, 'ALIQ_PIS');
    reg.COD_CTA := pegaValor(query, 'COD_CTA');
    reg.VL_DESC := pegaValor(query, 'VL_DESC');
    reg.VL_BC_PIS := pegaValor(query, 'VL_BC_PIS');
    reg.VL_ITEM := pegaValor(query, 'VL_ITEM');
    reg.VL_PIS := pegaValor(query, 'VL_PIS');

    reg.grava;
    reg.Free;
    reg := nil;
    query.Next;
  end;
  fechaQuery(query);

end;

procedure TPisCofins.PisCofinsC195;
var reg: TPisCofinsC195;
  query: TOracleDataSet1;
begin
  query := executaQuery(DmPisCofinsC.QReg195);
  query.SetVariable('COD_FILIAL', wFilial);
  query.setVariable('DATA_INI', wDataIni);
  query.setVariable('DATA_FIN', wDataFin);
  query.Open;
  if not abreQuery(query) then Exit;

  while not query.Eof do
  begin
    reg := TPisCofinsC195.Create(TObject(Self), arquivo);
    reg.CNPJ_CPF_PART := pegaValor(query, 'CNPJ_CPF_PART');
    reg.CST_COFINS := pegaValor(query, 'CST_COFINS');
    reg.CFOP := pegaValor(query, 'CFOP');
    reg.ALIQ_COFINS := pegaValor(query, 'ALIQ_COFINS');
    reg.COD_CTA := pegaValor(query, 'COD_CTA');
    reg.VL_DESC := pegaValor(query, 'VL_DESC');
    reg.VL_BC_COFINS := pegaValor(query, 'VL_BC_COFINS');
    reg.VL_ITEM := pegaValor(query, 'VL_ITEM');
    reg.VL_COFINS := pegaValor(query, 'VL_COFINS');

    reg.grava;
    reg.Free;
    reg := nil;
    query.Next;
  end;
  fechaQuery(query);

end;

procedure TPisCofins.PisCofinsC199;
var reg: TPisCofinsC199;
  query: TOracleDataSet1;
begin
  query := executaQuery(DmPisCofinsC.QReg199);
  query.SetVariable('COD_FILIAL', wFilial);
  query.setVariable('DATA_INI', wDataIni);
  query.setVariable('DATA_FIN', wDataFin);
  query.Open;
  if not abreQuery(query) then Exit;

  while not query.Eof do
  begin
    reg := TPisCofinsC199.Create(TObject(Self), arquivo);
    reg.COD_DOC_IMP := pegaValor(query, 'COD_DOC_IMP');
    reg.NUM_DOC_IMP := pegaValor(query, 'NUM_DOC_IMP');
    reg.VL_PIS_IMP := pegaValor(query, 'VL_PIS_IMP');
    reg.VL_COFINS_IMP := pegaValor(query, 'VL_COFINS_IMP');

    reg.grava;
    reg.Free;
    reg := nil;
    query.Next;
  end;
  fechaQuery(query);

end;

procedure TPisCofins.PisCofinsC380(pFilial: Integer);
var reg: TPisCofinsC380;
  query: TOracleDataSet1;
begin
  query := executaQuery(DmPisCofinsC.QReg380);
  query.SetVariable('COD_FILIAL', pFilial);
  query.setVariable('DATA_INI', wDataIni);
  query.setVariable('DATA_FIN', wDataFin);
  query.Open;
  if not abreQuery(query) then Exit;

  while not query.Eof do
  begin
    reg := TPisCofinsC380.Create(TObject(Self), arquivo);
    reg.COD_MOD := pegaValor(query, 'COD_MOD');
    reg.DT_DOC_INI := pegaValor(query, 'DT_DOC_INI');
    reg.DT_DOC_FIN := pegaValor(query, 'DT_DOC_FIN');
    reg.NUM_DOC_INI := pegaValor(query, 'NUM_DOC_INI');
    reg.NUM_DOC_FIN := pegaValor(query, 'NUM_DOC_FIN');
    reg.VL_DOC_CANC := pegaValor(query, 'VL_DOC_CANC');
    reg.VL_DOC := pegaValor(query, 'VL_DOC');

    reg.grava;
    reg.Free;
    reg := nil;
    PisCofinsC381;
    PisCofinsC385;
    query.Next;
  end;
  fechaQuery(query);

end;

procedure TPisCofins.PisCofinsC381;
var reg: TPisCofinsC381;
  query: TOracleDataSet1;
begin
  query := executaQuery(DmPisCofinsC.QReg381);
  query.SetVariable('COD_FILIAL', wFilial);
  query.setVariable('DATA_INI', wDataIni);
  query.setVariable('DATA_FIN', wDataFin);
  query.Open;
  if not abreQuery(query) then Exit;

  while not query.Eof do
  begin
    reg := TPisCofinsC381.Create(TObject(Self), arquivo);
    reg.CST_PIS := pegaValor(query, 'CST_PIS');
    reg.COD_ITEM := pegaValor(query, 'COD_ITEM');
    reg.VL_ITEM := pegaValor(query, 'VL_ITEM');
    reg.VL_BC_PIS := pegaValor(query, 'VL_BC_PIS');
    reg.ALIQ_PIS := pegaValor(query, 'ALIQ_PIS');
    reg.VL_PIS := pegaValor(query, 'VL_PIS');
    reg.COD_CTA := pegaValor(query, 'COD_CTA');
    reg.grava;
      if (reg.CST_PIS = '04') or ((reg.CST_PIS = '05') and (wPercPis = '0')) or (reg.CST_PIS = '06')
        or (reg.CST_PIS = '07') or (reg.CST_PIS = '08') or (reg.CST_PIS = '09')then
        insereApuracao('M400', reg.VL_ITEM, reg.CST_PIS, '', reg.COD_CTA);
    reg.Free;
    reg := nil;
    query.Next;
  end;
  fechaQuery(query);

end;

procedure TPisCofins.PisCofinsC385;
var reg: TPisCofinsC385;
  query: TOracleDataSet1;
begin
  query := executaQuery(DmPisCofinsC.QReg385);
  query.SetVariable('COD_FILIAL', wFilial);
  query.setVariable('DATA_INI', wDataIni);
  query.setVariable('DATA_FIN', wDataFin);
  query.Open;
  if not abreQuery(query) then Exit;

  while not query.Eof do
  begin
    reg := TPisCofinsC385.Create(TObject(Self), arquivo);
    reg.CST_COFINS := pegaValor(query, 'CST_COFINS');
    reg.COD_ITEM := pegaValor(query, 'COD_ITEM');
    reg.VL_ITEM := pegaValor(query, 'VL_ITEM');
    reg.VL_BC_COFINS := pegaValor(query, 'VL_BC_COFINS');
    reg.ALIQ_COFINS := pegaValor(query, 'ALIQ_COFINS');
    reg.VL_COFINS := pegaValor(query, 'VL_COFINS');
    reg.COD_CTA := pegaValor(query, 'COD_CTA');

    reg.grava;
    reg.Free;
    reg := nil;
    query.Next;
  end;

  fechaQuery(query);
end;

procedure TPisCofins.PisCofinsC395(pFilial: Integer);
var reg: TPisCofinsC395;
  query: TOracleDataSet1;
begin
  query := executaQuery(DmPisCofinsC.QReg395, True);
  query.SetVariable('COD_FILIAL', pFilial);
  query.setVariable('DATA_INI', wDataIni);
  query.setVariable('DATA_FIN', wDataFin);
  if not abreQuery(query) then Exit;

  while not query.Eof do
  begin
    reg := TPisCofinsC395.Create(TObject(Self), arquivo);
    reg.COD_MOD := pegaValor(query, 'COD_MOD');
    reg.COD_PART := pegaValor(query, 'COD_PART');
    reg.SER := pegaValor(query, 'SER');
    reg.NUM_DOC := pegaValor(query, 'NUM_DOC');
    reg.DT_DOC := pegaValor(query, 'DT_DOC');
    reg.VL_DOC := pegaValor(query, 'VL_DOC');

    reg.grava;
    reg.Free;
    reg := nil;
    PisCofinsC396;
    query.Next;
  end;

  fechaQuery(query);

end;

procedure TPisCofins.PisCofinsC396;
var reg: TPisCofinsC396;
  query: TOracleDataSet1;
begin
  query := executaQuery(DmPisCofinsC.QReg396, True);
  query.SetVariable('COD_FILIAL', wFilial);
  query.setVariable('DATA_INI', wDataIni);
  query.setVariable('DATA_FIN', wDataFin);
  if not abreQuery(query) then Exit;

  while not query.Eof do
  begin
    reg := TPisCofinsC396.Create(TObject(Self), arquivo);
    reg.COD_ITEM := pegaValor(query, 'COD_MOD');
    reg.VL_ITEM := pegaValor(query, 'VL_ITEM');
    reg.VL_DESC := pegaValor(query, 'VL_DESC');
    reg.NAT_BC_CRED := pegaValor(query, 'NAT_BC_CRED');
    reg.CST_PIS := pegaValor(query, 'CST_PIS');
    reg.VL_BC_PIS := pegaValor(query, 'VL_BC_PIS');
    reg.ALIQ_PIS := pegaValor(query, 'ALIQ_PIS');
    reg.VL_PIS := pegaValor(query, 'VL_PIS');
    reg.CST_COFINS := pegaValor(query, 'CST_COFINS');
    reg.VL_BC_COFINS := pegaValor(query, 'VL_BC_COFINS');
    reg.ALIQ_COFINS := pegaValor(query, 'ALIQ_COFINS');
    reg.VL_COFINS := pegaValor(query, 'VL_COFINS');
    reg.COD_CTA := pegaValor(query, 'COD_CTA');

    reg.grava;
    reg.Free;
    reg := nil;
    query.Next;
  end;

  fechaQuery(query);
end;

procedure TPisCofins.PisCofinsC490(pFilial: Integer);
var reg: TPisCofinsC490;
  query: TOracleDataSet1;
begin
  query := executaQuery(DmPisCofinsC.QReg490);
  query.SetVariable('COD_FILIAL', pFilial);
  query.setVariable('DATA_INI', wDataIni);
  query.setVariable('DATA_FIN', wDataFin);
  query.Open;
  if not abreQuery(query) then Exit;

  while not query.Eof do
  begin
    reg := TPisCofinsC490.Create(TObject(Self), arquivo);
    reg.DT_DOC_INI := pegaValor(query, 'DT_DOC_INI');
    reg.DT_DOC_FIN := pegaValor(query, 'DT_DOC_FIN');
    reg.COD_MOD := pegaValor(query, 'COD_MOD');

    reg.grava;
    reg.Free;
    reg := nil;
    PisCofinsC491(pegaValor(query, 'COD_MOD'));
    PisCofinsC495(pegaValor(query, 'COD_MOD'));
    query.Next;
  end;
  fechaQuery(query);

end;

procedure TPisCofins.PisCofinsC491(pModelo: String);
var reg: TPisCofinsC491;
  query: TOracleDataSet1;
begin
  query := executaQuery(DmPisCofinsC.QReg491);
  query.SetVariable('COD_FILIAL', wFilial);
  query.setVariable('DATA_INI', wDataIni);
  query.setVariable('DATA_FIN', wDataFin);
  query.SetVariable('MODELO', pModelo);
  query.Open;
  if not abreQuery(query) then Exit;

  while not query.Eof do
  begin
    reg := TPisCofinsC491.Create(TObject(Self), arquivo);
    reg.COD_ITEM := pegaValor(query, 'COD_ITEM');
    reg.CST_PIS := pegaValor(query, 'CST_PIS');
    reg.CFOP := pegaValor(query, 'CFOP');
    reg.ALIQ_PIS := pegaValor(query, 'ALIQ_PIS');
    reg.COD_CTA := pegaValor(query, 'COD_CTA');
    reg.VL_ITEM := pegaValor(query, 'VL_ITEM');
    reg.VL_BC_PIS := pegaValor(query, 'VL_BC_PIS');
    reg.VL_PIS := pegaValor(query, 'VL_PIS');
    reg.grava;
    if wC010IndEscri = '1' then
      if (reg.CST_PIS = '04') or ((reg.CST_PIS = '05') and (wPercPis = '0')) or (reg.CST_PIS = '06')
          or (reg.CST_PIS = '07') or (reg.CST_PIS = '08') or (reg.CST_PIS = '09')then
        insereApuracao('M400', reg.VL_ITEM, reg.CST_PIS, '', reg.COD_CTA);
    reg.Free;
    reg := nil;
    query.Next;
  end;

  fechaQuery(query);
end;

procedure TPisCofins.PisCofinsC495(pModelo: String);
var reg: TPisCofinsC495;
  query: TOracleDataSet1;
begin
  query := executaQuery(DmPisCofinsC.QReg495);
  query.SetVariable('COD_FILIAL', wFilial);
  query.setVariable('DATA_INI', wDataIni);
  query.setVariable('DATA_FIN', wDataFin);
  query.SetVariable('MODELO', pModelo);
  query.Open;
  if not abreQuery(query) then Exit;

  while not query.Eof do
  begin
    reg := TPisCofinsC495.Create(TObject(Self), arquivo);
    reg.COD_ITEM := pegaValor(query, 'COD_ITEM');
    reg.CST_COFINS := pegaValor(query, 'CST_COFINS');
    reg.CFOP := pegaValor(query, 'CFOP');
    reg.ALIQ_COFINS := pegaValor(query, 'ALIQ_COFINS');
    reg.COD_CTA := pegaValor(query, 'COD_CTA');
    reg.VL_ITEM := pegaValor(query, 'VL_ITEM');
    reg.VL_BC_COFINS := pegaValor(query, 'VL_BC_COFINS');
    reg.VL_COFINS := pegaValor(query, 'VL_COFINS');

    reg.grava;
    reg.Free;
    reg := nil;
    query.Next;
  end;

  fechaQuery(query);
end;

procedure TPisCofins.PisCofinsC500(pFilial: Integer);
var reg: TPisCofinsC500;
  query: TOracleDataSet1;
begin
  query := executaQuery(DmPisCofinsC.QReg500);
  query.SetVariable('COD_FILIAL', pFilial);
  query.setVariable('DATA_INI', wDataIni);
  query.setVariable('DATA_FIN', wDataFin);
  query.Open;
  if not abreQuery(query) then Exit;

  while not query.Eof do
  begin
    reg := TPisCofinsC500.Create(TObject(Self), arquivo);
    reg.COD_PART := pegaValor(query, 'COD_PARTICIPANTE');
    reg.COD_MOD := pegaValor(query, 'COD_MOD');
    reg.COD_SIT := pegaValor(query, 'COD_SIT');
    reg.SER := pegaValor(query, 'SER');
    reg.NUM_DOC := pegaValor(query, 'NUM_DOC');
    reg.DT_DOC := pegaValor(query, 'DT_DOC');
    reg.DT_ENT := pegaValor(query, 'DT_ENT');
    reg.VL_DOC := pegaValor(query, 'VL_DOC');
    reg.VL_ICMS := pegaValor(query, 'VL_ICMS');
    reg.COD_INF := pegaValor(query, 'COD_INF');
    reg.VL_PIS := pegaValor(query, 'VL_PIS');
    reg.VL_COFINS := pegaValor(query, 'VL_COFINS');
    reg.CHV_DOCe := pegaValor(query, 'CHV_DOCE');

    reg.grava;
    reg.Free;
    reg := nil;
    PisCofinsC501(pegaValor(query, 'COD_NOTA_CAB'));
    PisCofinsC505(pegaValor(query, 'COD_NOTA_CAB'));
    query.Next;
  end;

  fechaQuery(query);

end;

procedure TPisCofins.PisCofinsC501(pCodNota: Integer);
var reg: TPisCofinsC501;
  query: TOracleDataSet1;
begin
  query := executaQuery(DmPisCofinsC.QReg501);
  query.SetVariable('COD_NOTA', pCodNota);
  query.Open;
  if not abreQuery(query) then Exit;

  while not query.Eof do
  begin
    reg := TPisCofinsC501.Create(TObject(Self), arquivo);
    reg.CST_PIS := pegaValor(query, 'CST_PIS');
    reg.VL_ITEM := pegaValor(query, 'VL_ITEM');
    reg.NAT_BC_CRED := pegaValor(query, 'NAT_BC_CRED');
    reg.VL_BC_PIS := pegaValor(query, 'VL_BC_PIS');
    reg.ALIQ_PIS := pegaValor(query, 'ALIQ_PIS');
    reg.VL_PIS := pegaValor(query, 'VL_PIS');
    reg.COD_CTA := pegaValor(query, 'COD_CTA');
    reg.grava;
    if reg.CST_PIS <> '' then
      insereApuracaoM100_M500('M100', reg.VL_PIS, reg.VL_BC_PIS, reg.CST_PIS, reg.ALIQ_PIS, '', pegaValor(query, 'COD_BC_CREDITO_PISCOFINS'), 'ENERGIA ELÉTRICA');
    reg.Free;
    reg := nil;
    query.Next;
  end;

  fechaQuery(query);
end;

procedure TPisCofins.PisCofinsC505(pCodNota: Integer);
var reg: TPisCofinsC505;
  query: TOracleDataSet1;
begin
  query := executaQuery(DmPisCofinsC.QReg505);
  query.SetVariable('COD_NOTA', pCodNota);
  query.Open;
  if not abreQuery(query) then Exit;

  while not query.Eof do
  begin
    reg := TPisCofinsC505.Create(TObject(Self), arquivo);
    reg.CST_COFINS := pegaValor(query, 'CST_COFINS');
    reg.VL_ITEM := pegaValor(query, 'VL_ITEM');
    reg.NAT_BC_CRED := pegaValor(query, 'NAT_BC_CRED');
    reg.VL_BC_COFINS := pegaValor(query, 'VL_BC_COFINS');
    reg.ALIQ_COFINS := pegaValor(query, 'ALIQ_COFINS');
    reg.VL_COFINS := pegaValor(query, 'VL_COFINS');
    reg.COD_CTA := pegaValor(query, 'COD_CTA');
    if reg.CST_COFINS <> '' then
      insereApuracaoM100_M500('M500', reg.VL_COFINS, reg.VL_BC_COFINS, reg.CST_COFINS, reg.ALIQ_COFINS, '', pegaValor(query, 'COD_BC_CREDITO_PISCOFINS'), 'ENERGIA ELÉTRICA');
    reg.grava;
    reg.Free;
    reg := nil;
    query.Next;
  end;

  fechaQuery(query);
end;

procedure TPisCofins.PisCofinsC990(QtdLinhas: Double);
var reg: TPisCofinsC990;
begin
  reg := TPisCofinsC990.Create(TObject(Self), arquivo);
  reg.QTD_LIN_C := QtdLinhas;
  reg.grava;
  reg.Free;
  reg := nil;
end;

// Fim Bloco C

// Inicio Bloco D

procedure TPisCofins.PisCofinsD001;
var reg: TPisCofinsD001;
begin
  reg := TPisCofinsD001.Create(TObject(Self), arquivo);
  reg.IND_MOV := 1;
  reg.grava;
  reg.Free;
  reg := nil;

  PisCofinsD010;
end;

procedure TPisCofins.PisCofinsD010;
var reg: TPisCofinsD010;
  query: TOracleDataSet1;
begin
  query := executaQuery(DmPisCofinsD.QReg010);
 // query.SetVariable('COD_FILIAL', wFilial);
  query.setVariable('DATA_INI', wDataIni);
  query.setVariable('DATA_FIN', wDataFin);
  query.Open;
  if not abreQuery(query) then Exit;

  while not query.Eof do
  begin
    reg := TPisCofinsd010.Create(TObject(Self), arquivo);
    reg.CNPJ := pegaValor(query, 'CNPJ');
    reg.grava;
    reg.Free;
    reg := nil;
    PisCofinsD100(StrToInt(wFiliais.Strings[query.RecNo-1]));
    PisCofinsD200(StrToInt(wFiliais.Strings[query.RecNo-1]));;
    PisCofinsD500(StrToInt(wFiliais.Strings[query.RecNo-1]));;
    query.Next;
  end;

  fechaQuery(query);
end;

procedure TPisCofins.PisCofinsD100(pFilial: Integer);
var reg: TPisCofinsD100;
  query: TOracleDataSet1;
begin
  query := executaQuery(DmPisCofinsD.QReg100);
  query.SetVariable('COD_FILIAL', pFilial);
  query.setVariable('DATA_INI', wDataIni);
  query.setVariable('DATA_FIN', wDataFin);
  query.Open;
  if not abreQuery(query) then Exit;

  while not query.Eof do
  begin
    reg := TPisCofinsd100.Create(TObject(Self), arquivo);
    if pegaValor(query, 'IND_TIPO_OPERACAO') = 'E' then
      reg.IND_OPER := '0'
    else
      reg.IND_OPER := '1';
    if pegaValor(query, 'IND_EMITE') = 'F' then
      reg.IND_EMIT := '0'
    else
      reg.IND_EMIT := '1';
    reg.COD_PART := pegaValor(query, 'COD_PART');
    reg.COD_MOD := pegaValor(query, 'COD_MOD');
    if pegaValor(query, 'IND_SITUACAO') = '2' then
      reg.COD_SIT := 0
    else
      reg.COD_SIT := 2;
    reg.SER := pegaValor(query, 'SER');
    reg.NUM_DOC := Trunc(pegaValor(query, 'NUM_DOC'));
    reg.DT_DOC := pegaValor(query, 'DT_DOC');
    reg.DT_A_P := pegaValor(query, 'DT_A_P');
    reg.VL_DOC := pegaValor(query, 'VL_DOC');
    reg.VL_DESC := pegaValor(query, 'VL_DESC');
    reg.IND_FRT := '1';
    reg.VL_SERV := pegaValor(query, 'VL_SERV');
    reg.VL_BC_ICMS := pegaValor(query, 'VL_BC_ICMS');
    reg.VL_ICMS := pegaValor(query, 'VL_ICMS');
    reg.VL_NT := pegaValor(query, 'VL_NT');
    reg.COD_INF := '';
    reg.COD_CTA := pegaValor(query, 'COD_CTA');
    reg.CHV_CTE := SomenteNumeros(pegaValor(query, 'DESC_CHAVE_ACESSO_CTE'));  //Pegara apenas os numeros da chave de acesso. Vanessa 21/02/2014
    reg.grava;

    PisCofinsD101(pegaValor(query, 'COD_CONHECIMENTO'),
      pegaValor(query, 'TIPO'), StrToInt(reg.IND_OPER));
    PisCofinsD105(pegaValor(query, 'COD_CONHECIMENTO'),
      pegaValor(query, 'TIPO'), StrToInt(reg.IND_OPER));

    reg.Free;
    reg := nil;
    query.Next;
  end;

  fechaQuery(query);
end;

procedure TPisCofins.PisCofinsD101(pCodConhecimento: Integer; pTipo: String;
  pIndOper: integer);
var reg: TPisCofinsD101;
  query: TOracleDataSet1;
  indExportacao: string;
begin
  query := executaQuery(DmPisCofinsD.QReg101);
  query.SetVariable('COD_CONHECIMENTO', pCodConhecimento);
  query.SetVariable('TIPO', pTipo);
  query.Open;
  if not abreQuery(query) then Exit;

  indExportacao := DMOracle.FastSelect('COD_UF_DESTINO', 'TB_CONHECIMENTO', 'COD_CONHECIMENTO = ' +
                                        IntToStr(pCodConhecimento));

  while not query.Eof do
  begin
    reg := TPisCofinsD101.Create(TObject(Self), arquivo);
    reg.IND_NAT_FRT := pegaValor(query, 'IND_NAT_FRT');
    reg.CST_PIS := pegaValor(query, 'CST_PIS');
    reg.NAT_BC_CRED := pegaValor(query,'NAT_BC_CRED');
    reg.ALIQ_PIS := pegaValor(query, 'ALIQ_PIS');
    reg.VL_PIS := pegaValor(query, 'VL_PIS');
    reg.COD_CTA := pegaValor(query, 'COD_CTA');
    reg.VL_BC_PIS := pegaValor(query, 'VL_BC_PIS');
    reg.VL_ITEM := pegaValor(query, 'VL_ITEM');

    if(pIndOper = 0) and ((reg.CST_PIS <> '') and
                         (not (StrToInt(reg.CST_PIS) in [70, 71, 72, 73, 74, 75, 98]))) then   //notas de entrada
    begin
      //Adciona apurações
     if pegaValor(query, 'COD_BC_CREDITO_PISCOFINS') = '' then
      begin
        MessageDlg('Base de Cálculo do Crédito não informada na Operação! Operação de entrada.', MTError, [MBOk], 0);
        Abort;
      end;

      insereApuracaoM100_M500('M100', reg.VL_PIS, reg.VL_BC_PIS, reg.CST_PIS, reg.ALIQ_PIS, '', pegaValor(query, 'COD_BC_CREDITO_PISCOFINS'), 'CT-e')

    end;

    reg.grava;
    reg.Free;
    reg := nil;
    query.Next;
  end;
  fechaQuery(query);
end;

procedure TPisCofins.PisCofinsD105(pCodConhecimento: Integer; pTipo: String;
pIndOper: integer);
var reg: TPisCofinsD105;
  query: TOracleDataSet1;
  indExportacao: string;
begin
  query := executaQuery(DmPisCofinsD.QReg105);
  query.SetVariable('COD_CONHECIMENTO', pCodConhecimento);
  query.setVariable('TIPO', pTipo);
  query.Open;
  if not abreQuery(query) then Exit;

  indExportacao := DMOracle.FastSelect('COD_UF_DESTINO', 'TB_CONHECIMENTO', 'COD_CONHECIMENTO = ' +
                                        IntToStr(pCodConhecimento));

  while not query.Eof do
  begin
    reg := TPisCofinsD105.Create(TObject(Self), arquivo);
    reg.IND_NAT_FRT := pegaValor(query, 'IND_NAT_FRT');
    reg.CST_COFINS := pegaValor(query, 'CST_COFINS');
    reg.NAT_BC_CRED := pegaValor(query,'NAT_BC_CRED');
    reg.ALIQ_COFINS := pegaValor(query, 'ALIQ_COFINS');
    reg.VL_COFINS := pegaValor(query, 'VL_COFINS');
    reg.COD_CTA := pegaValor(query, 'COD_CTA');
    reg.VL_BC_COFINS := pegaValor(query, 'VL_BC_COFINS');
    reg.VL_ITEM := pegaValor(query, 'VL_ITEM');

    if(pIndOper = 0) and ((reg.CST_COFINS <> '') and
                        (not (StrToInt(reg.CST_COFINS) in [70, 71, 72, 73, 74, 75, 98]))) then   //notas de entrada
    begin
      //Adciona apurações
     if pegaValor(query, 'COD_BC_CREDITO_PISCOFINS') = '' then
      begin
        MessageDlg('Base de Cálculo do Crédito não informada na Operação! Operação de entrada.', MTError, [MBOk], 0);
        Abort;
      end;
      
      if indExportacao <> 'EX' then
        insereApuracaoM100_M500('M500', reg.VL_COFINS, reg.VL_BC_COFINS, reg.CST_COFINS, reg.ALIQ_COFINS, '', pegaValor(query, 'COD_BC_CREDITO_PISCOFINS'), 'CT-e')
      else
        insereApuracaoM100_M500('M500', 0, reg.VL_BC_COFINS, reg.CST_COFINS, reg.ALIQ_COFINS, '', pegaValor(query, 'COD_BC_CREDITO_PISCOFINS'), 'CT-e');

    end;

    reg.grava;
    reg.Free;
    reg := nil;
    query.Next;
  end;

  fechaQuery(query);
end;

procedure TPisCofins.PisCofinsD200(pFilial: Integer);
var reg: TPisCofinsD200;
  query: TOracleDataSet1;
begin
  query := executaQuery(DmPisCofinsD.QReg200);
  query.SetVariable('COD_FILIAL', pFilial);
  query.setVariable('DATA_INI', wDataIni);
  query.setVariable('DATA_FIN', wDataFin);
  query.Open;
  if not abreQuery(query) then Exit;

  while not query.Eof do
  begin
    reg := TPisCofinsD200.Create(TObject(Self), arquivo);
    reg.COD_MOD := pegaValor(query, 'COD_MOD');
    if pegaValor(query, 'IND_SITUACAO') = '2' then
      reg.COD_SIT := 0
    else
      reg.COD_SIT := 2;
    reg.SER := pegaValor(query, 'SER');
    reg.NUM_DOC_INI := pegaValor(query, 'NUM_DOC_INI');
    reg.NUM_DOC_FIN := pegaValor(query, 'NUM_DOC_FIN');
    reg.CFOP := pegaValor(query, 'CFOP');
    reg.DT_REF := pegaValor(query, 'DT_REF');
    reg.VL_DOC := pegaValor(query, 'VL_DOC');
    reg.VL_DESC := pegaValor(query, 'VL_DESC');
    reg.grava;
    PisCofinsD201(reg.DT_REF, reg.CFOP, reg.COD_MOD);
    PisCofinsD205(reg.DT_REF, reg.CFOP, reg.COD_MOD);
    reg.Free;
    reg := nil;
    query.Next;
  end;
  fechaQuery(query);

end;

procedure TPisCofins.PisCofinsD201(pDataRef: TDateTime; pCfop: Integer; pCodMod :String);
var reg: TPisCofinsD201;
  query: TOracleDataSet1;
begin
  query := executaQuery(DmPisCofinsD.QReg201);
  query.SetVariable('COD_FILIAL', wFilial);
  query.setVariable('DATA_REF', pDataRef);
  query.SetVariable('COD_SERIE_MODELO', pCodMod);
  query.SetVariable('CFOP', pCfop);
  query.Open;
  if not abreQuery(query) then Exit;

  while not query.Eof do
  begin
    reg := TPisCofinsD201.Create(TObject(Self), arquivo);
    reg.CST_PIS := pegaValor(query, 'CST_PIS');
    reg.VL_ITEM := pegaValor(query, 'VL_ITEM');

    { if DMParamSistema.CodEmpresa <> 'GRASEL' then
      reg.VL_BC_PIS := pegaValor(query, 'VL_BC_PIS') - pegaValor(query, 'VL_ICMS')
    else                             }
    reg.VL_BC_PIS := pegaValor(query, 'VL_BC_PIS');

    reg.ALIQ_PIS := pegaValor(query, 'ALIQ_PIS');
    reg.VL_PIS := pegaValor(query, 'VL_PIS');
    reg.COD_CTA := pegaValor(query, 'COD_CTA');
    reg.grava;
    if (reg.CST_PIS = '4') or ((reg.CST_PIS = '5') and (wPercPis = '0')) or (reg.CST_PIS = '6')
        or (reg.CST_PIS = '7') or (reg.CST_PIS = '8') or (reg.CST_PIS = '9') then
      insereApuracao('M400', reg.VL_ITEM, pegaValor(query, 'CST_PIS'), '', reg.COD_CTA);

    insereApuracaoM200_M600('M200', reg.VL_PIS, reg.VL_BC_PIS, reg.CST_PIS, reg.ALIQ_PIS, reg.VL_ITEM);

    reg.Free;
    reg := nil;
    query.Next;
  end;
  fechaQuery(query);
end;

procedure TPisCofins.PisCofinsD205(pDataRef: TDateTime; pCfop: Integer; pCodMod :String);
var reg: TPisCofinsD205;
  query: TOracleDataSet1;
begin
  query := executaQuery(DmPisCofinsD.QReg205);
  query.SetVariable('COD_FILIAL', wFilial);
  query.setVariable('DATA_REF', pDataRef);
  query.SetVariable('COD_SERIE_MODELO', pCodMod);
  query.SetVariable('CFOP', pCfop);
  query.Open;
  if not abreQuery(query) then Exit;

  while not query.Eof do
  begin
    reg := TPisCofinsD205.Create(TObject(Self), arquivo);
    reg.CST_COFINS := pegaValor(query, 'CST_COFINS');
    reg.VL_ITEM := pegaValor(query, 'VL_ITEM');

    {if DMParamSistema.CodEmpresa <> 'GRASEL' then
      reg.VL_BC_COFINS := pegaValor(query, 'VL_BC_COFINS') - pegaValor(query, 'VL_ICMS')
    else  }
    reg.VL_BC_COFINS := pegaValor(query, 'VL_BC_COFINS');

    reg.ALIQ_COFINS := pegaValor(query, 'ALIQ_COFINS');
    reg.VL_COFINS := pegaValor(query, 'VL_COFINS');
    reg.COD_CTA := pegaValor(query, 'COD_CTA');
    reg.grava;

    insereApuracaoM200_M600('M600', reg.VL_COFINS, reg.VL_BC_COFINS, reg.CST_COFINS, reg.ALIQ_COFINS, reg.VL_ITEM);

    reg.Free;
    reg := nil;
    query.Next;
  end;
  fechaQuery(query);
end;

procedure TPisCofins.PisCofinsD500(pFilial: Integer);
var reg: TPisCofinsD500;
  query: TOracleDataSet1;
begin
  query := executaQuery(DmPisCofinsD.QReg500);
  query.SetVariable('COD_FILIAL', pFilial);
  query.setVariable('DATA_INI', wDataIni);
  query.setVariable('DATA_FIN', wDataFin);
  query.Open;
  if not abreQuery(query) then Exit;

  while not query.Eof do
  begin
    reg := TPisCofinsD500.Create(TObject(Self), arquivo);
    reg.IND_OPER := pegaValor(query, 'IND_OPER');
    reg.IND_EMIT := pegaValor(query, 'IND_EMIT');
    reg.COD_PART := pegaValor(query, 'COD_PART');
    reg.COD_MOD := pegaValor(query, 'COD_MOD');
    reg.COD_SIT := pegaValor(query, 'COD_SIT');
    reg.SER := pegaValor(query, 'SER');
    reg.NUM_DOC := pegaValor(query, 'NUM_DOC');
    reg.DT_DOC := pegaValor(query, 'DT_DOC');
    reg.DT_A_P := pegaValor(query, 'DT_A_P');
    reg.VL_DOC := pegaValor(query, 'VL_DOC');
    reg.VL_DESC := pegaValor(query, 'VL_DESC');
    reg.VL_SERV := pegaValor(query, 'VL_SERV');
    reg.VL_SERV_NT := pegaValor(query, 'VL_SERV_NT');
    reg.VL_TERC := pegaValor(query, 'VL_TERC');
    reg.VL_DA := pegaValor(query, 'VL_DA');
    reg.VL_BC_ICMS := pegaValor(query, 'VAL_BC_ICMS');
    reg.VL_ICMS := pegaValor(query, 'VL_ICMS');
    reg.COD_INF := pegaValor(query, 'COD_INF');
    reg.VL_PIS := pegaValor(query, 'VAL_PIS');
    reg.VL_COFINS := pegaValor(query, 'VL_COFINS');
    reg.grava;
    reg.Free;
    reg := nil;
    PisCofinsD501(pegaValor(query, 'COD_NOTA_CAB'));
    PisCofinsD505(pegaValor(query, 'COD_NOTA_CAB'));
    query.Next;
  end;
  fechaQuery(query);

end;

procedure TPisCofins.PisCofinsD501(pCodNota: Integer);
var reg: TPisCofinsD501;
  query: TOracleDataSet1;
begin
  query := executaQuery(DmPisCofinsD.QReg501);
  query.SetVariable('COD_NOTA', pCodNota);
  query.Open;
  if not abreQuery(query) then Exit;

  while not query.Eof do
  begin
    reg := TPisCofinsD501.Create(TObject(Self), arquivo);
    reg.CST_PIS := pegaValor(query, 'CST_PIS');
    reg.VL_ITEM := pegaValor(query, 'VL_ITEM');
    reg.NAT_BC_CRED := pegaValor(query, 'NAT_BC_CRED');
    reg.VL_BC_PIS := pegaValor(query, 'VL_BC_PIS');
    reg.ALIQ_PIS := pegaValor(query, 'ALIQ_PIS');
    reg.VL_PIS := pegaValor(query, 'VL_PIS');
    reg.COD_CTA := pegaValor(query, 'COD_CTA');
    reg.grava;
    if(pegaValor(query, 'IND_OPER') = 0) and (pegaValor(query, 'CST_PIS') <> '')  then //notas de entrada
    begin
      //Adiciona apurações
      insereApuracaoM100_M500('M100', reg.VL_PIS, reg.VL_BC_PIS, reg.CST_PIS, reg.ALIQ_PIS, '', pegaValor(query, 'COD_BC_CREDITO_PISCOFINS'), 'TELEFONIA');
    end;
    reg.Free;
    reg := nil;
    query.Next;

  end;
  fechaQuery(query);
end;

procedure TPisCofins.PisCofinsD505(pCodNota: Integer);
var reg: TPisCofinsD505;
  query: TOracleDataSet1;
begin
  query := executaQuery(DmPisCofinsD.QReg505);
  query.SetVariable('COD_NOTA', pCodNota);
  query.Open;
  if not abreQuery(query) then Exit;

  while not query.Eof do
  begin
    reg := TPisCofinsD505.Create(TObject(Self), arquivo);
    reg.CST_COFINS := pegaValor(query, 'CST_COFINS');
    reg.VL_ITEM := pegaValor(query, 'VL_ITEM');
    reg.NAT_BC_CRED := pegaValor(query, 'NAT_BC_CRED');
    reg.VL_BC_COFINS := pegaValor(query, 'VL_BC_COFINS');
    reg.ALIQ_COFINS := pegaValor(query, 'ALIQ_COFINS');
    reg.VL_COFINS := pegaValor(query, 'VL_COFINS');
    reg.COD_CTA := pegaValor(query, 'COD_CTA');
    reg.grava;
    if(pegaValor(query, 'IND_OPER') = 0) and (pegaValor(query, 'CST_COFINS') <> '')  then //notas de entrada
    begin
      //Adciona apurações
      insereApuracaoM100_M500('M500', reg.VL_COFINS, reg.VL_BC_COFINS, reg.CST_COFINS, reg.ALIQ_COFINS, '', pegaValor(query, 'COD_BC_CREDITO_PISCOFINS'), 'TELEFONIA');
    end;
    reg.Free;
    reg := nil;
    query.Next;
  end;
  fechaQuery(query);
end;

procedure TPisCofins.PisCofinsD990(QtdLinhas: Double);
var reg: TPisCofinsD990;
begin
  reg := TPisCofinsD990.Create(TObject(Self), arquivo);
  reg.QTD_LIN_D := QtdLinhas;
  reg.grava;
  reg.Free;
  reg := nil;
end;

//Fim Bloco D

//Inicio Bloco F

procedure TPisCofins.PisCofinsF001;
var reg: TPisCofinsF001;
begin
  reg := TPisCofinsF001.Create(TObject(Self), arquivo);
  reg.IND_MOV := 1;
  reg.grava;
  reg.Free;
  reg := nil;

  PisCofinsF010;
end;

procedure TPisCofins.PisCofinsF010;
var reg: TPisCofinsF010;
  query: TOracleDataSet1;
begin
  query := executaQuery(DmPisCofinsF.QReg010);
  query.SetVariable('FILIAIS', bib.geraStringFiliais(wFiliais));
  query.setVariable('DATA_INI', wDataIni);
  query.setVariable('DATA_FIN', wDataFin);
  query.Open;
  if not abreQuery(query) then Exit;

  while not query.Eof do
  begin
    reg := TPisCofinsF010.Create(TObject(Self), arquivo);
    reg.CNPJ := pegaValor(query, 'CNPJ');
    reg.grava;
    PisCofinsF120(pegaValor(query, 'FILIAL'));
    PisCofinsF130(pegaValor(query, 'FILIAL'));
    PisCofinsF600(pegaValor(query, 'FILIAL'));
    reg.Free;
    reg := nil;
    query.Next;
  end;
  fechaQuery(query);
end;

procedure TPisCofins.PisCofinsF120(pFilial: Integer);
var reg: TPisCofinsF120;
  query: TOracleDataSet1;
begin
  query := executaQuery(DmPisCofinsF.QReg120);
  query.SetVariable('COD_FILIAL', pFilial);
  query.setVariable('DATA_INI', wDataIni);
  query.setVariable('DATA_FIN', wDataFin);
  query.Open;
  if not abreQuery(query) then Exit;

  while not query.Eof do
  begin
    reg := TPisCofinsF120.Create(TObject(Self), arquivo);
    reg.NAT_BC_CRED := pegaValor(query, 'NAT_BC_CRED');
    reg.IDENT_BEM_IMOB := pegaValor(query, 'IDENT_BEM_IMOB');
    reg.IND_ORIG_CRED := pegaValor(query, 'IND_ORIG_CRED');
    reg.IND_UTIL_BEM_IMOB := pegaValor(query, 'IND_UTIL_BEM_IMOB');
    reg.VL_OPER_DEP := pegaValor(query, 'VL_OPER_DEP');
    reg.CST_PIS := pegaValor(query, 'CST_PIS');
    reg.VL_BC_PIS := pegaValor(query, 'VL_BC_PIS');
    reg.ALIQ_PIS := pegaValor(query, 'ALIQ_PIS');
    reg.VL_PIS := pegaValor(query, 'VL_PIS');
    reg.CST_COFINS := pegaValor(query, 'CST_COFINS');
    reg.VL_BC_COFINS := pegaValor(query, 'VL_BC_COFINS');
    reg.ALIQ_COFINS := pegaValor(query, 'ALIQ_COFINS');
    reg.VL_COFINS := pegaValor(query, 'VL_COFINS');
    reg.COD_CTA := pegaValor(query, 'COD_CTA');
    reg.grava;
    if reg.CST_PIS <> '' then
      insereApuracaoM100_M500('M100', reg.VL_PIS, reg.VL_BC_PIS, reg.CST_PIS, reg.ALIQ_PIS, '', pegaValor(query, 'COD_BC_CREDITO_PISCOFINS'), 'PATRIMÔNIO DEPRECIAÇÃO');
    if reg.CST_COFINS <> '' then
      insereApuracaoM100_M500('M500', reg.VL_COFINS, reg.VL_BC_COFINS, reg.CST_COFINS, reg.ALIQ_COFINS, '', pegaValor(query, 'COD_BC_CREDITO_PISCOFINS'), 'PATRIMÔNIO DEPRECIAÇÃO');
    reg.Free;
    reg := nil;
    query.Next;
  end;
  fechaQuery(query);
end;

procedure TPisCofins.PisCofinsF130(pFilial: Integer);
var reg: TPisCofinsF130;
  query: TOracleDataSet1;
begin
  query := executaQuery(DmPisCofinsF.QReg130);
  query.SetVariable('COD_FILIAL', pFilial);
  query.setVariable('DATA_INI', wDataIni);
  query.setVariable('DATA_FIN', wDataFin);
  query.Open;
  if not abreQuery(query) then Exit;

  while not query.Eof do
  begin
    reg := TPisCofinsF130.Create(TObject(Self), arquivo);
    reg.NAT_BC_CRED := pegaValor(query, 'NAT_BC_CRED');
    reg.IDENT_BEM_IMOB := pegaValor(query, 'IDENT_BEM_IMOB');
    reg.IND_ORIG_CRED := pegaValor(query, 'IND_ORIG_CRED');
    reg.IND_UTIL_BEM_IMOB := pegaValor(query, 'IND_UTIL_BEM_IMOB');
    reg.MES_OPER_AQUIS := pegaValor(query, 'MES_OPER_AQUIS');
    reg.VL_OPER_AQUIS := pegaValor(query, 'VL_OPER_AQUIS');
    reg.VL_BC_CRED := pegaValor(query, 'VL_BC_CRED');
    reg.IND_NR_PARC := pegaValor(query, 'IND_NR_PARC');
    reg.CST_PIS := pegaValor(query, 'CST_PIS');
    reg.VL_BC_PIS := pegaValor(query, 'VL_BC_PIS');
    reg.ALIQ_PIS := pegaValor(query, 'ALIQ_PIS');
    reg.VL_PIS := pegaValor(query, 'VL_PIS');
    reg.CST_COFINS := pegaValor(query, 'CST_COFINS');
    reg.VL_BC_COFINS := pegaValor(query, 'VL_BC_COFINS');
    reg.ALIQ_COFINS := pegaValor(query, 'ALIQ_COFINS');
    reg.VL_COFINS := pegaValor(query, 'VL_COFINS');
    reg.COD_CTA := pegaValor(query, 'COD_CTA');
    reg.grava;
    if reg.CST_PIS <> '' then
      insereApuracaoM100_M500('M100', reg.VL_PIS, reg.VL_BC_PIS, reg.CST_PIS, reg.ALIQ_PIS, '', pegaValor(query, 'COD_BC_CREDITO_PISCOFINS'), 'PATRIMÔNIO AQUISIÇÃO');
    if reg.CST_COFINS <> '' then
      insereApuracaoM100_M500('M500', reg.VL_COFINS, reg.VL_BC_COFINS, reg.CST_COFINS, reg.ALIQ_COFINS, '', pegaValor(query, 'COD_BC_CREDITO_PISCOFINS'), 'PATRIMÔNIO AQUISIÇÃO');
    reg.Free;
    reg := nil;
    query.Next;
  end;
  fechaQuery(query);
end;

procedure TPisCofins.PisCofinsF600(pFilial: Integer);
var reg: TPisCofinsF600;
    query: TOracleDataSet1;
begin
  query := executaQuery(DmPisCofinsF.QReg600);

  query.SetVariable('FILIAIS', bib.geraStringFiliais(wFiliais));
  query.SetVariable('DATA_INI', wDataIni);
  query.SetVariable('DATA_FIN', wDataFin);
  query.SetVariable('IND_ENTRADA_SAIDA', null);       

  query.Open;
  if not abreQuery(query) then Exit;

  while not query.Eof do
  begin
    reg := TPisCofinsF600.Create(TObject(Self), arquivo);
    reg.IND_NAT_RET := pegaValor(query, 'IND_NAT_RET');
    reg.DT_RET := pegaValor(query, 'DT_RET');
    reg.VL_BC_RET := pegaValor(query, 'VL_BC_RET');
    reg.VL_RET := pegaValor(query, 'VL_RET');
    reg.COD_REC := pegaValor(query, 'COD_REC');
    reg.IND_NAT_REC := pegaValor(query, 'IND_NAT_REC');
    reg.CNPJ := pegaValor(query, 'CNPJ');
    reg.VL_RET_PIS := pegaValor(query, 'VL_RET_PIS');
    reg.VL_RET_COFINS := pegaValor(query, 'VL_RET_COFINS');
    reg.IND_DEC := pegaValor(query, 'IND_DEC');
    reg.grava;
    reg.free;
    reg := nil;

    query.Next;
  end;

  query.Close;
  fechaQuery(query);

end;

procedure TPisCofins.PisCofinsF990(QtdLinhas: Double);
var reg: TPisCofinsF990;
begin
  reg := TPisCofinsF990.Create(TObject(Self), arquivo);
  reg.QTD_LIN_F := QtdLinhas;
  reg.grava;
  reg.Free;
  reg := nil;
end;


//Fim Bloco F

//Inicio Bloco M

procedure TPisCofins.PisCofinsM001;
var reg: TPisCofinsM001;
begin
  reg := TPisCofinsM001.Create(TObject(Self), arquivo);
  reg.IND_MOV := '1';
  reg.grava;
  reg.Free;
  reg := nil;
  PisCofinsM100;
  PisCofinsM200;
  PisCofinsM400;
  PisCofinsM500;
  PisCofinsM600;
  PisCofinsM800;
end;

procedure TPisCofins.PisCofinsM100;
var reg: TPisCofinsM100;
  query, queryRet: TOracleDataSet1;
  wValor: Double;
  wValContrib, wValRet: double;
  wReducao: boolean;
begin
  //mostraApuracao('M200');
  wReducao := false;
  if wCodIncTrib = 2 then
    exit;
  wValContrib := 0;
  with DMPisCofinsM, DMParamSistema do
  begin

    QParamSistema.Open;  // Para definir onde será lançada a retençao. Deve ser o percentual no sistema de apuração da empresa
    // Busca o valor da contribuição no período
    QReg200.Close;
    QReg200.SetVariable('REGISTRO', 'M200');
    QReg200.Open;
    QReg200.First;
    while not QReg200.Eof do
    begin
      if QReg200COD_CONT.Value in [1,2,2,4,32,71] then
        wValContrib := wValContrib + QReg200VAL_REGISTRO.Value;
      QReg200.Next;
    end;

    // Busca retenções
    wValRet := 0;
    queryRet := executaQuery(DmPisCofinsF.QReg600, false);
    queryRet.SetVariable('FILIAIS', bib.geraStringFiliais(wFiliais));
    queryRet.setVariable('DATA_INI', wDataIni);
    queryRet.setVariable('DATA_FIN', wDataFin);
    queryRet.SetVariable('IND_ENTRADA_SAIDA', 'E');
    if abreQuery(queryRet) then
      queryRet.First;
    while not queryRet.Eof do
    begin
      wValRet := wValRet + pegaValor(queryRet, 'VL_RET_PIS');
      queryRet.Next;
    end;

    QReg100.Close;
    QReg100.SetVariable('REGISTRO', 'M100');
    QReg100.Open;
    QReg100.First;
    while not QReg100.Eof do
    begin

      //Abre o registro M105 apenas para saber se existe notas de serviço
      //para o caso de haver retenções e necessitar lançar redução
      query := executaQuery(DmPisCofinsM.QReg105, false);
      query.SetVariable('REGISTRO', 'M100');
      query.SetVariable('COD_NATUREZA_RECEITA', QReg100COD_NATUREZA_RECEITA.Text);
      query.SetVariable('PERC_ALIQUOTA', QReg100PERC_ALIQUOTA.Value);

      if (abreQuery(query)) and (not wReducao) then
      begin
        query.First;
        while not query.Eof do
        begin
          if pegaValor(query, 'COD_NAT_BC_CRED') = 3 then
          begin
            if ((QReg100VAL_REGISTRO.Value - wValRet) > 0) then
              wReducao := true;
          end;
          query.Next;
        end;
      end
      else
        wReducao := false;

      reg := TPisCofinsM100.Create(TObject(self), arquivo);
      reg.ALIQ_PIS := QReg100PERC_ALIQUOTA.Value;

      reg.COD_CRED := QReg100COD_NATUREZA_RECEITA.Text;
      reg.IND_CRED_ORI := 0;
      if Copy(QReg100COD_NATUREZA_RECEITA.Text, 1, 1) = '2' then
        reg.VL_BC_PIS := 0
      else
        reg.VL_BC_PIS := QReg100VAL_BC.Value;
      reg.VL_CRED := QReg100VAL_REGISTRO.Value;
      reg.VL_AJUS_ACRES := 0;
      if (QReg100VAL_REGISTRO.Value > 0) and (wValRet > 0) and (QParamSistemaPERC_PIS.value = reg.ALIQ_PIS) then
        reg.VL_AJUS_REDUC := wValRet
      else
        reg.VL_AJUS_REDUC := 0;
      reg.VL_CRED_DIF := 0;
      reg.VL_CRED_DISP := QReg100VAL_REGISTRO.Value + reg.VL_AJUS_ACRES - reg.VL_AJUS_REDUC;
      //if reg.VL_CRED_DISP > wValContrib then
      if reg.VL_BC_PIS > 0 then
        reg.IND_DESC_CRED := '1'
      else
        reg.IND_DESC_CRED := '0';
      if reg.IND_DESC_CRED = '0' then
        //reg.VL_CRED_DESC := reg.VL_CRED_DISP
        reg.VL_CRED_DESC := 0
      else
        //reg.VL_CRED_DESC := wValContrib - wValRet; // valor do PVA (Gerar Apuração). (Diverge do que está escrito no manual)
        if reg.VL_CRED_DISP > wValContrib then
          reg.VL_CRED_DESC := wValContrib - reg.VL_AJUS_REDUC
        else
          reg.VL_CRED_DESC := 0;
      if reg.VL_CRED_DISP > reg.VL_CRED_DESC then
        reg.SLD_CRED := reg.VL_CRED_DISP - reg.VL_CRED_DESC
      else
        reg.SLD_CRED := reg.VL_CRED_DISP;
      reg.grava;
      PisCofinsM105(QReg100COD_NATUREZA_RECEITA.AsInteger, QReg100PERC_ALIQUOTA.Value);
      if (wValRet > 0) and (reg.VL_CRED_DISP > 0) and (reg.VL_AJUS_REDUC > 0) and (QParamSistemaPERC_PIS.value = reg.ALIQ_PIS)  then
        PisCofinsM110(wValRet);
      reg.Free;
      reg := nil;
      QReg100.Next;
    end;
    QReg100.Close;
  end;


//  query := executaQuery(DmPisCofinsM.QReg100, false);
//  query.SetVariable('FILIAIS', bib.geraStringFiliais(wFiliais));
//  query.setVariable('DT_INI', wDataIni);
//  query.setVariable('DT_FIN', wDataFin);
//
//  if not abreQuery(query) then Exit;
//
//  while not query.Eof do
//  begin
//    if pegaValor(query,'VL_CRED') > 0 then
//    begin
//      reg := TPisCofinsM100.Create(TObject(self), arquivo);
//      reg.COD_CRED := pegaValor(query,'COD_CRED');
//      reg.IND_CRED_ORI := pegaValor(query,'IND_CRED_ORI');
//      reg.VL_CRED := pegaValor(query,'VL_CRED');
//      reg.VL_AJUS_ACRES := pegaValor(query,'VL_AJUS_ACRES');
//      reg.VL_AJUS_REDUC := pegaValor(query,'VL_AJUS_REDUC');
//      reg.VL_CRED_DIF := pegaValor(query,'VL_CRED_DIF');
//      reg.VL_CRED_DISP := pegaValor(query,'VL_CRED_DISP');
//      reg.IND_DESC_CRED := pegaValor(query,'IND_DESC_CRED');
//      reg.SLD_CRED := pegaValor(query,'SLD_CRED');
//      reg.ALIQ_PIS := pegaValor(query,'ALIQ_PIS');
//      reg.VL_BC_PIS := pegaValor(query, 'VL_BC_PIS');
//      reg.VL_CRED_DESC := pegaValor(query, 'VL_CRED_DESC');
//      reg.grava;
//      reg.Free;
//      reg := nil;
//    end;
//    query.Next;
//  end;
//  fechaQuery(query);
//  PisCofinsM105;
end;

procedure TPisCofins.PisCofinsM105(CodNaturezaReceita: integer; PercAliquota: double);
var reg: TPisCofinsM105;
  query: TOracleDataSet1;
  wValor: Double;
begin
  with DMPisCofinsM do
  begin
    query := executaQuery(DmPisCofinsM.QReg105, false);
    query.SetVariable('REGISTRO', 'M100');
    query.SetVariable('COD_NATUREZA_RECEITA', CodNaturezaReceita);
    query.SetVariable('PERC_ALIQUOTA', PercAliquota);

    if not abreQuery(query) then Exit;

      while not query.Eof do
      begin
        reg := TPisCofinsM105.Create(TObject(self), arquivo);
        reg.NAT_BC_CRED := pegaValor(query,'COD_NAT_BC_CRED');
        reg.NAT_BC_CRED := bib.StrZero(reg.NAT_BC_CRED, 2);
        reg.CST_PIS := pegaValor(query,'COD_CST_PIS');
        reg.VL_BC_PIS_TOT := pegaValor(query,'VAL_BC');
        if wCodIncTrib = 3 then
          reg.VL_BC_PIS_CUM := pegaValor(query,'VAL_BC')
        else
          reg.VL_BC_PIS_CUM := 0;
        if wCodIncTrib = 1 then
          reg.VL_BC_PIS_NC := pegaValor(query,'VAL_BC')
        else
          if wCodIncTrib = 3 then
            reg.VL_BC_PIS_NC := pegaValor(query,'VAL_BC') - reg.VL_BC_PIS_CUM
          else
            reg.VL_BC_PIS_NC := 0;
         // 1 apropriação direta, 2 rateio proporcional

        if reg.CST_PIS in [50,51,52,60,61,62] then
          reg.VL_BC_PIS := reg.VL_BC_PIS_NC
        else
        begin
          if reg.CST_PIS in [53,54,55,56,63,64,65,66] then
          begin
            if wAproCred =  '1' then // Apropriação direta
              reg.VL_BC_PIS := pegaValor(query,'VAL_BC')
            else
            begin
              if CodNaturezaReceita = 101 then // Não tributado no mercado interno
                reg.VL_BC_PIS := pegaValor(query,'VAL_BC')
              else
                reg.VL_BC_PIS := 0;
            end;
          end;
        end;
        reg.QUANT_BC_PIS_TOT := 0;
        reg.QUANT_BC_PIS := 0;
        reg.DESC_CRED := '';

        reg.grava;
        reg.Free;
        reg := nil;
        query.Next;
      end;
      fechaQuery(query);
    end;

//  query := executaQuery(DmPisCofinsM.QReg105, false);
//  query.SetVariable('FILIAIS', bib.geraStringFiliais(wFiliais));
//  query.setVariable('DT_INI', wDataIni);
//  query.setVariable('DT_FIN', wDataFin);
//
//  if not abreQuery(query) then Exit;
//
//  while not query.Eof do
//  begin
//    reg := TPisCofinsM105.Create(TObject(self), arquivo);
//    reg.NAT_BC_CRED := pegaValor(query,'NAT_BC_CRED');
//    reg.CST_PIS := pegaValor(query,'CST_PIS');
//    reg.VL_BC_PIS_TOT := pegaValor(query,'VL_BC_PIS_TOT');
//    reg.VL_BC_PIS_CUM := pegaValor(query,'VL_BC_PIS_CUM');
//    reg.VL_BC_PIS_NC := pegaValor(query,'VL_BC_PIS_NC');
//    reg.VL_BC_PIS := pegaValor(query,'VL_BC_PIS');
//    reg.grava;
//    reg.Free;
//    reg := nil;
//    query.Next;
//  end;
//  fechaQuery(query);
end;

procedure TPiscofins.PisCofinsM110(valor: double);
var reg: TPisCofinsM110;
begin
  // Ajuste de redução para pis retido na fonte
  reg := TPisCofinsM110.Create(TObject(self), arquivo);
  reg.IND_AJ := '0';
  reg.VAL_AJ := valor;
  reg.COD_AJ := 03;
  reg.DESCR_AJ := 'RETENCAO NA FONTE';
  reg.grava;
  reg.Free;
  reg := nil;
end;

procedure TPisCofins.PisCofinsM200;
var reg: TPisCofinsM200;
  query: TOracleDataSet1;
  queryRet: TOracleDataSet1;
  wValRet: Double;
  wValCred: double;
begin
  // Busca retenções
  wValRet := 0;
  wValCred := 0;
  queryRet := executaQuery(DmPisCofinsF.QReg600, false);
  queryRet.SetVariable('FILIAIS', bib.geraStringFiliais(wFiliais));
  queryRet.setVariable('DATA_INI', wDataIni);
  queryRet.setVariable('DATA_FIN', wDataFin);
  queryRet.SetVariable('IND_ENTRADA_SAIDA', 'E');

  if abreQuery(queryRet) then
    queryRet.First;
    
  while not queryRet.Eof do
  begin
    wValRet := wValRet + pegaValor(queryRet, 'VL_RET_PIS');
    queryRet.Next;
  end;

  // Busca Créditos
  with DMPisCofinsM do
  begin
    //with DmSped do
//    begin
//      QApuracaoPisNatCons.Close;
//      QApuracaoPisNatCons.SetVariable('REGISTRO', 'M100');
//      QApuracaoPisNatCons.Open;
//      QApuracaoPisNatCons.First;
//      while not QApuracaoPisNatCons.Eof do
//      begin
//        wValCred := wValCred + QApuracaoPisNatConsVAL_REGISTRO.Value;
//        QApuracaoPisNatCons.Next;
//      end;
//    end;
    QReg200.Close;
    QReg200.SetVariable('REGISTRO', 'M200');
    QReg200.Open;
    QReg200.First;

    CDS200_600.Close;
    CDS200_600.Open;
    CDS200_600.EmptyDataSet;
    CDS200_600.Insert;
    while not QReg200.Eof do
    begin
      if QReg200COD_CONT.Value in [1,2,3,4,32,71] then
        CDS200_600VL_TOT_CONT_NC_PER.Value := CDS200_600VL_TOT_CONT_NC_PER.Value + QReg200VAL_REGISTRO.Value;
      if QReg200COD_CONT.Value in [31,32,51,52,53,54,72] then
        CDS200_600VL_TOT_CONT_CUM_PER.Value := CDS200_600VL_TOT_CONT_CUM_PER.Value + QReg200VAL_REGISTRO.Value;
      QReg200.Next;
    end;
    CDS200_600.Post;

    QReg200.First;
    if QReg200VAL_REGISTRO.Value > 0 then
    begin
      reg := TPisCofinsM200.Create(TObject(self), arquivo);
      if wCodIncTrib = 2 then
        reg.VL_TOT_CONT_NC_PER := 0
      else
        reg.VL_TOT_CONT_NC_PER := CDS200_600VL_TOT_CONT_NC_PER.Value;

      if wCodIncTrib = 2 then
        reg.VL_TOT_CRED_DESC := 0
      else
        reg.VL_TOT_CRED_DESC := reg.VL_TOT_CONT_NC_PER - wValRet;

      reg.VL_TOT_CRED_DESC_ANT := 0;

      if(reg.VL_TOT_CONT_NC_PER - reg.VL_TOT_CRED_DESC - reg.VL_TOT_CRED_DESC_ANT) > 0 then
        reg.VL_TOT_CONT_NC_DEV := reg.VL_TOT_CONT_NC_PER - reg.VL_TOT_CRED_DESC - reg.VL_TOT_CRED_DESC_ANT
      else
        reg.VL_TOT_CONT_NC_DEV := 0;
      if wCodIncTrib = 2 then
        reg.VL_RET_NC := 0
      else
        reg.VL_RET_NC := wValRet;
      reg.VL_OUT_DED_NC := 0;
      if wCodIncTrib = 2 then
        reg.VL_CONT_NC_REC := 0
      else
        reg.VL_CONT_NC_REC := ABS(RoundTo(reg.VL_TOT_CONT_NC_DEV,-2) - RoundTo(reg.VL_RET_NC,-2) - RoundTo(reg.VL_OUT_DED_NC,-2));


      if wCodIncTrib = 1 then
        reg.VL_TOT_CONT_CUM_PER := 0
      else
        reg.VL_TOT_CONT_CUM_PER := CDS200_600VL_TOT_CONT_CUM_PER.Value;
      if wCodIncTrib = 1 then
        reg.VL_RET_CUM := 0
      else
        reg.VL_RET_CUM := wValRet;
      reg.VL_OUT_DED_CUM := 0;
      if wCodIncTrib = 1 then
        reg.VL_CONT_CUM_REC := 0
      else
        reg.VL_CONT_CUM_REC := reg.VL_TOT_CONT_CUM_PER - reg.VL_RET_CUM - reg.VL_OUT_DED_CUM;
      reg.VL_TOT_CONT_REC := reg.VL_CONT_NC_REC + reg.VL_CONT_CUM_REC;
      reg.grava;
      if (reg.VL_CONT_CUM_REC > 0) or (reg.VL_CONT_NC_REC > 0) then
        PisCofinsM205(reg.VL_CONT_CUM_REC + reg.VL_CONT_NC_REC);

      reg.Free;
      reg := nil;
    end;

  end;



//  query := executaQuery(DmPisCofinsM.QReg200, false);
//  query.SetVariable('FILIAIS', bib.geraStringFiliais(wFiliais));
//  query.setVariable('DT_INI', wDataIni);
//  query.setVariable('DT_FIN', wDataFin);
//  queryRet := executaQuery(DmPisCofinsF.QReg600, false);
//  queryRet.SetVariable('FILIAIS', bib.geraStringFiliais(wFiliais));
//  queryRet.setVariable('DATA_INI', wDataIni);
//  queryRet.setVariable('DATA_FIN', wDataFin);
//  if not abreQuery(query) then Exit;
//  wValor := 0;
//  abreQuery(queryRet);
//  while not queryRet.Eof do
//  begin
//    wValor := wValor + pegaValor(queryRet, 'VL_RET_PIS');
//    queryRet.Next;
//  end;
//  while not query.Eof do
//  begin
//    reg := TPisCofinsM200.Create(TObject(self), arquivo);
//    reg.VL_TOT_CONT_NC_PER := pegaValor(query, 'VL_TOT_CONT_NC_PER');
//    reg.VL_TOT_CRED_DESC := pegaValor(query, 'VL_TOT_CRED_DESC');
//    reg.VL_TOT_CRED_DESC_ANT := pegaValor(query, 'VL_TOT_CRED_DESC_ANT');
//    reg.VL_TOT_CONT_CUM_PER := pegaValor(query, 'VL_TOT_CONT_CUM_PER');
//    reg.VL_CONT_CUM_REC := pegaValor(query,'VL_CONT_CUM_REC');
//    reg.VL_TOT_CONT_NC_DEV := pegaValor(query, 'VL_TOT_CONT_NC_DEV');
////    reg.VL_RET_NC := pegaValor(query, 'VL_RET_NC');
//    reg.VL_RET_NC := wValor;
////    reg.VL_OUT_DED_NC := pegaValor(query, 'VL_OUT_DED_NC');
//    reg.VL_CONT_NC_REC :=  Abs(pegaValor(query,'VL_CONT_NC_REC') - wValor);
//    reg.VL_TOT_CONT_REC := reg.VL_CONT_NC_REC + reg.VL_CONT_CUM_REC;
//    reg.grava;
//
//    if (reg.VL_CONT_CUM_REC > 0) or
//    (reg.VL_CONT_NC_REC > 0)then
//      PisCofinsM205(reg.VL_CONT_CUM_REC + reg.VL_CONT_NC_REC);
//
//    reg.Free;
//    reg := nil;
//    query.Next;
//  end;
//  fechaQuery(query);
  PisCofinsM210;
end;

procedure TPisCofins.PisCofinsM205(valor: double);
var reg: TPisCofinsM205;
  query: TOracleDataSet1;
begin
  query := executaQuery(DmPisCofinsM.QReg205, false);
  query.SetVariable('FILIAIS', bib.geraStringFiliais(wFiliais));
  query.setVariable('DT_INI', wDataIni);
  query.setVariable('DT_FIN', wDataFin);
  if not abreQuery(query) then Exit;

  while not query.Eof do
  begin
    reg := TPisCofinsM205.Create(TObject(self), arquivo);
    reg.NUM_CAMPO := pegaValor(query, 'NUM_CAMPO');
    reg.COD_REC := pegaValor(query, 'COD_REC');
    //reg.VL_DEBITO := pegaValor(query, 'VL_DEBITO');
    reg.VL_DEBITO := valor;
    reg.grava;
    reg.Free;
    reg := nil;
    query.Next;
  end;
  fechaQuery(query);
end;

procedure TPisCofins.PisCofinsM210;
var reg: TPisCofinsM210;
  query: TOracleDataSet1;
  wValor: Double;
  wTemRegistro: boolean;
  dados: TDataSource;
  tela: TFMostraDRE;
  wCodCont: integer;
begin
  wTemRegistro := false;

  with DMPisCofinsM do
  begin
    query := executaQuery(DmPisCofinsM.QReg210_610, false);
    query.SetVariable('REGISTRO', 'M200');
    if not abreQuery(query) then Exit;
    CDS210_610.Open;
    CDS210_610.EmptyDataSet;
    while not query.Eof do
    begin
      // Obtém o COD_CONT
      wCodCont := 0;
      if pegaValor(query, 'COD_CST_PIS') = '01' then
      begin
        if (wCodIncTrib in [1, 3]) and (query.FieldByName('PERC_ALIQUOTA').Text = '1,65') then
          wCodCont := 1;
        if (wCodIncTrib in [2, 3]) and (query.FieldByName('PERC_ALIQUOTA').Text = '0,65') then
          wCodCont := 51;
      end;
      if pegaValor(query, 'COD_CST_PIS') = '02' then
      begin
        if wCodIncTrib in [1, 3] then
          wCodCont := 2;
        if wCodIncTrib = 2 then
          wCodCont := 52;
      end;
      if pegaValor(query, 'COD_CST_PIS') = '03' then
      begin
        if (wCodIncTrib in [1, 3]) and (query.FieldByName('PERC_ALIQUOTA').AsFloat > 0) then
          wCodCont := 3;
        if (wCodIncTrib = 2) and (query.FieldByName('PERC_ALIQUOTA').AsFloat > 0) then
          wCodCont :=  53;
      end;
      if pegaValor(query, 'COD_CST_PIS') = '05' then
      begin
        if query.FieldByName('PERC_ALIQUOTA').AsFloat = 3 then
          wCodCont := 31;
        if (query.FieldByName('PERC_ALIQUOTA').AsFloat <> 3) and (query.FieldByName('PERC_ALIQUOTA').AsFloat <> 0) then
          wCodCont := 32;
      end;

      // Busca pelo registro no clientdataset
      // O locate não funcionou
      CDS210_610.First;
      while not CDS210_610.Eof do
      begin
        wTemRegistro := ((CDS210_610COD_CONT.Value = wCodCont)
          and (CDS210_610PERC_ALIQUOTA.Value = query.FieldByName('PERC_ALIQUOTA').AsFloat));
        if wTemRegistro then
          break;
        CDS210_610.Next;
      end;

      if wTemRegistro then
      begin
        CDS210_610.Edit;
        CDS210_610VAL_REGISTRO.Value := CDS210_610VAL_REGISTRO.Value + pegaValor(query, 'VAL_REGISTRO');
        if Pos(bib.AjustaStrContrario(pegaValor(query, 'COD_CONT'), 2, '0'), '01 51 02 52 31 32') > 0 then
        begin
          if Pos(pegaValor(query, 'COD_CST_COFINS'), '01 02 03 04 05') > 0 then
          begin
            CDS210_610VL_REC_BRT.Value := CDS210_610VL_REC_BRT.Value + pegaValor(query, 'VAL_REC_BRT');
            CDS210_610VAL_BC.Value := CDS210_610VAL_BC.Value + pegaValor(query, 'VAL_BC');
          end;
        end
        else
//        if Pos(bib.AjustaStrContrario(pegaValor(query, 'COD_CONT'), 2, '0'), '03 53') > 0 then
        CDS210_610VAL_BC.Value := 0;
        CDS210_610.Post;
      end
      else
      begin
        CDS210_610.Insert;
        CDS210_610DESC_REGISTRO.Value := pegaValor(query, 'DESC_REGISTRO');
        CDS210_610PERC_ALIQUOTA.Value := query.FieldByName('PERC_ALIQUOTA').AsFloat;
        CDS210_610COD_CONT.Value := wCodCont;
        CDS210_610VAL_REGISTRO.Value := pegaValor(query, 'VAL_REGISTRO');
        if Pos(bib.AjustaStrContrario(pegaValor(query, 'COD_CONT'), 2, '0'), '01 51 02 52 31 32') > 0 then
        begin
          if Pos(pegaValor(query, 'COD_CST_PIS'), '01 02 03 04 05') > 0 then
          begin
            CDS210_610VL_REC_BRT.Value := CDS210_610VL_REC_BRT.Value + pegaValor(query, 'VAL_REC_BRT');
            CDS210_610VAL_BC.Value := pegaValor(query, 'VAL_BC');
          end;
        end
        else
        //if Pos(bib.AjustaStrContrario(pegaValor(query, 'COD_CONT'), 2, '0'), '03 53') > 0 then
        CDS210_610VAL_BC.Value := 0;
        CDS210_610.Post;
      end;
      query.Next;
    end;

//    tela := TFMostraDRE.Create(Application);
//      dados := TDataSource.Create(Application);
//
//      dados.DataSet := query;
//
//      tela.DBGrid1.DataSource := dados;
//      tela.ShowModal;
//      tela.Free;
//      tela := Nil;


    CDS210_610.First;
    while not CDS210_610.Eof do
    begin
      reg := TPisCofinsM210.Create(TObject(self), arquivo);
      reg.COD_CONT := bib.AjustaStrContrario(CDS210_610COD_CONT.Text, 2, '0');
      reg.VL_REC_BRT := CDS210_610VL_REC_BRT.Value;
      reg.VL_BC_CONT := CDS210_610VAL_BC.Value;
      reg.VL_AJUS_ACRES_BC_PIS := 0;
      reg.VL_AJUS_REDUC_BC_PIS := 0;
      reg.VL_BC_CONT_AJUS :=  reg.VL_BC_CONT + reg.VL_AJUS_ACRES_BC_PIS - reg.VL_AJUS_REDUC_BC_PIS;
      reg.ALIQ_PIS := CDS210_610PERC_ALIQUOTA.Value;
      reg.QUANT_BC_PIS := 0;
      reg.ALIQ_PIS_QUANT := 0;
      reg.VL_CONT_APUR := CDS210_610VAL_REGISTRO.Value;
      reg.VL_AJUS_ACRES := 0;
      reg.VL_AJUS_REDUC := 0;
      reg.VL_CONT_DIFER := 0;
      reg.VL_CONT_DIFER_ANT := 0;
      reg.VL_CONT_PER := reg.VL_CONT_APUR + reg.VL_AJUS_ACRES - reg.VL_AJUS_REDUC - reg.VL_CONT_DIFER + reg.VL_CONT_DIFER_ANT;
      reg.DT_INI := wDataIni;
      reg.grava;
      reg.Free;
      reg := nil;
      CDS210_610.Next;
    end;

//    tela := TFMostraDRE.Create(Application);
//      dados := TDataSource.Create(Application);
//
//      dados.DataSet := CDS210_610;
//
//      tela.DBGrid1.DataSource := dados;
//      tela.ShowModal;
//      tela.Free;
//      tela := Nil;

    fechaQuery(query);
  end;

//  query := executaQuery(DmPisCofinsM.QReg210, false);
//  query.SetVariable('FILIAIS', bib.geraStringFiliais(wFiliais));
//  query.setVariable('DT_INI', wDataIni);
//  query.setVariable('DT_FIN', wDataFin);
//
//  if not abreQuery(query) then Exit;
//
//  while not query.Eof do
//  begin
//    reg := TPisCofinsM210.Create(TObject(self), arquivo);
//    reg.COD_CONT := pegaValor(query, 'COD_CONT');
//    reg.VL_REC_BRT := pegaValor(query, 'VL_REC_BRT');
//    reg.VL_BC_CONT := pegaValor(query, 'VL_BC_CONT');
//    reg.VL_AJUS_ACRES_BC_PIS := 0;
//    reg.VL_AJUS_REDUC_BC_PIS := 0;
//    reg.VL_BC_CONT_AJUS := reg.VL_BC_CONT;
//    reg.ALIQ_PIS := pegaValor(query, 'ALIQ_PIS');
//    reg.VL_CONT_APUR := pegaValor(query, 'VL_CONT_APUR');
//    reg.VL_AJUS_ACRES  := 0;
//    reg.VL_AJUS_REDUC := 0;
//    reg.VL_CONT_PER := pegaValor(query, 'VL_CONT_PER');
//    reg.DT_INI := wDataIni;
//    reg.grava;
//    reg.Free;
//    reg := nil;
//    query.Next;
//  end;
//  fechaQuery(query);
end;

procedure TPisCofins.PisCofinsM400;
var reg: TPisCofinsM400;
  query: TOracleDataSet1;
  wValor: Double;
begin
  query := executaQuery(DmPisCofinsM.QReg400, false);
  query.SetVariable('FILIAIS', bib.geraStringFiliais(wFiliais));
  query.setVariable('DATA_INI', wDataIni);
  query.setVariable('DATA_FIN', wDataFin);

  if not abreQuery(query) then Exit;
  while not query.Eof do
  begin
    with DMSped do
    begin
      reg := TPisCofinsM400.Create(TObject(Self), arquivo);
      QApuracaoPisCons.Close;
      QApuracaoPisCons.SetVariable('REGISTRO', 'M400');
      QApuracaoPisCons.SetVariable('CST', FormatFloat('#00', pegaValor(query, 'CST_PIS')));
      QApuracaoPisCons.SetVariable('COD_CTA', pegaValor(query, 'COD_CTA'));
      QApuracaoPisCons.Open;
      wValor := 0;
      while not QApuracaoPisCons.Eof do
      begin
        wValor := wValor + QApuracaoPisConsVAL_REGISTRO.Value;
        QApuracaoPisCons.Next;
      end;
      if pegaValor(query, 'COD_CTA') = '' then
        exit;
      reg.CST_PIS := pegaValor(query, 'CST_PIS');
      reg.VL_TOT_REC := wValor;
      reg.COD_CTA := pegaValor(query, 'COD_CTA');
      reg.grava;
      reg.Free;
      reg := nil;
    end;
    PisCofinsM410(pegaValor(query, 'CST_PIS'), pegaValor(query, 'COD_CTA'));
    query.Next;
  end;
  fechaQuery(query);
end;

procedure TPisCofins.PisCofinsM410(pCst, pCodCta: String);
var reg: TPisCofinsM410;
  query: TOracleDataSet1;
  wValor: Double;
begin
  {wValor := 0;
  query := executaQuery(DmPisCofinsM.QReg410, false);
  query.SetVariable('FILIAIS', bib.geraStringFiliais(wFiliais));
  query.setVariable('DATA_INI', wDataIni);
  query.setVariable('DATA_FIN', wDataFin);

  if not abreQuery(query) then Exit;

  while not query.Eof do
  begin}
    with DMSped do
    begin
      QApuracaoPisNatCons.Close;
      QApuracaoPisNatCons.SetVariable('REGISTRO', 'M400');
      QApuracaoPisNatCons.SetVariable('CST', pCst);
      QApuracaoPisNatCons.SetVariable('COD_CTA', pCodCta);
      QApuracaoPisNatCons.Open;
      while not QApuracaoPisNatCons.Eof do
      begin
        reg := TPisCofinsM410.Create(TObject(Self), arquivo);
        reg.NAT_REC := QApuracaoPisNatConsCOD_NATUREZA_RECEITA.AsInteger;
        reg.VL_REC := QApuracaoPisNatConsVAL_REGISTRO.Value;
        reg.COD_CTA := pCodCta;
        QApuracaoPisNatCons.Next;
        reg.grava;
        reg.Free;
        reg := nil;
      end;
    end;
    //query.Next;
  //end;
end;

procedure TPisCofins.PisCofinsM500;
var reg: TPisCofinsM500;
  query, queryRet: TOracleDataSet1;
  wValor, wValRet: Double;
  wValContrib: double;
  wReducao: boolean;
begin
  wReducao := false;

  if wCodIncTrib = 2 then
    exit;
  with DMPisCofinsM, DMParamSistema do
  begin

    QParamSistema.Open; //Para definir onde será lançada a retenção. Deve ser no sistema apuração da empresa

    // Busca o valor da contribuição no período
    QReg600.Close;
    QReg600.SetVariable('REGISTRO', 'M600');
    QReg600.Open;
    QReg600.First;
    wValContrib := 0;
    while not QReg600.Eof do
    begin
      if QReg600COD_CONT.Value in [1,2,3,4,32,71] then
        wValContrib := wValContrib + QReg600VAL_REGISTRO.Value;
      QReg600.Next;
    end;

    // Busca retenções
    wValRet := 0;
    queryRet := executaQuery(DmPisCofinsF.QReg600, false);
    queryRet.SetVariable('FILIAIS', bib.geraStringFiliais(wFiliais));
    queryRet.setVariable('DATA_INI', wDataIni);
    queryRet.setVariable('DATA_FIN', wDataFin);
    queryRet.SetVariable('IND_ENTRADA_SAIDA', 'E');
    if abreQuery(queryRet) then
      queryRet.First;
    while not queryRet.Eof do
    begin
      wValRet := wValRet + pegaValor(queryRet, 'VL_RET_COFINS');
      queryRet.Next;
    end;

    QReg500.Close;
    QReg500.SetVariable('REGISTRO', 'M500');
    QReg500.Open;
    QReg500.First;
    while not QReg500.Eof do
    begin

      //Abre o registro M505 apenas para saber se existe notas de serviço
      //para o caso de haver retenções e necessitar lançar redução
      query := executaQuery(DmPisCofinsM.QReg505, false);
      query.SetVariable('REGISTRO', 'M500');
      query.SetVariable('COD_NATUREZA_RECEITA', QReg500COD_NATUREZA_RECEITA.Text);
      query.SetVariable('PERC_ALIQUOTA', QReg500PERC_ALIQUOTA.Value);

      if (abreQuery(query)) and (not wReducao) then
      begin
        query.First;
        while not query.Eof do
        begin
          if pegaValor(query, 'COD_NAT_BC_CRED') = 3 then
          begin
            if ((QReg500VAL_REGISTRO.Value - wValRet) > 0) then
              wReducao := true;
          end;
          query.Next;
        end;
      end
      else
        wReducao := false;

      reg := TPisCofinsM500.Create(TObject(self), arquivo);
      reg.ALIQ_COFINS := QReg500PERC_ALIQUOTA.Value;

      {if (wValRet > 0) and (wReducao) and (QParamSistemaPERC_COFINS.value = reg.ALIQ_COFINS) then
      begin
        wValContrib := wValContrib - wValRet;
      end;  }

      reg.COD_CRED := QReg500COD_NATUREZA_RECEITA.Text;
      reg.IND_CRED_ORI := 0;
      if Copy(QReg500COD_NATUREZA_RECEITA.Text, 1, 1) = '2' then
        reg.VL_BC_COFINS := 0
      else
        reg.VL_BC_COFINS := QReg500VAL_BC.Value;

      reg.VL_CRED := QReg500VAL_REGISTRO.Value;
      reg.VL_AJUS_ACRES := 0;
      reg.VL_AJUS_REDUC := 0;

      if (QReg500VAL_REGISTRO.Value > 0) and (wValRet > 0) and (QParamSistemaPERC_COFINS.value = reg.ALIQ_COFINS) then
      begin
        reg.VL_AJUS_REDUC := wValRet;
      end;
      reg.VL_CRED_DIF := 0;
      reg.VL_CRED_DISP := QReg500VAL_REGISTRO.Value + reg.VL_AJUS_ACRES - reg.VL_AJUS_REDUC;
      //if reg.VL_CRED_DISP > wValContrib then
      if reg.VL_BC_COFINS > 0 then
        reg.IND_DESC_CRED := '1'
      else
        reg.IND_DESC_CRED := '0';

      if reg.IND_DESC_CRED = '0' then
        //reg.VL_CRED_DESC := reg.VL_CRED_DISP
        reg.VL_CRED_DESC := 0
      else
        //reg.VL_CRED_DESC := wValContrib - wValRet; // valor do PVA (Gerar Apuração). (Diverge do que está escrito no manual)
        if (reg.VL_CRED_DISP > wValContrib) and wReducao then
          reg.VL_CRED_DESC := wValContrib - reg.VL_AJUS_REDUC
        else
          reg.VL_CRED_DESC := 0;

      if (reg.VL_CRED_DISP > reg.VL_CRED_DESC) and (QParamSistemaPERC_COFINS.Value = reg.ALIQ_COFINS) then
      begin
        reg.SLD_CRED := reg.VL_CRED_DISP - reg.VL_CRED_DESC;
      end
      else
        reg.SLD_CRED := reg.VL_CRED_DISP;

      reg.grava;
      PisCofinsM505(QReg500COD_NATUREZA_RECEITA.AsInteger, QReg500PERC_ALIQUOTA.Value);
      if (wValRet > 0) and (reg.VL_CRED_DISP > 0) and (reg.VL_AJUS_REDUC > 0) AND (QParamSistemaPERC_COFINS.Value = reg.ALIQ_COFINS) then
      begin
        PisCofinsM510(wValRet);
      end;
      reg.Free;
      reg := nil;
      QReg500.Next;
    end;
    QReg500.Close;
  end;

//  query := executaQuery(DmPisCofinsM.QReg500, false);
//  query.SetVariable('FILIAIS', bib.geraStringFiliais(wFiliais));
//  query.setVariable('DT_INI', wDataIni);
//  query.setVariable('DT_FIN', wDataFin);
//
//  if not abreQuery(query) then Exit;
//
//  while not query.Eof do
//  begin
//    if pegaValor(query,'VL_CRED') > 0 then
//    begin
//      reg := TPisCofinsM500.Create(TObject(self), arquivo);
//      reg.COD_CRED := pegaValor(query,'COD_CRED');
//      reg.IND_CRED_ORI := pegaValor(query,'IND_CRED_ORI');
//      reg.VL_CRED := pegaValor(query,'VL_CRED');
//      reg.VL_AJUS_ACRES := pegaValor(query,'VL_AJUS_ACRES');
//      reg.VL_AJUS_REDUC := pegaValor(query,'VL_AJUS_REDUC');
//      reg.VL_CRED_DIF := pegaValor(query,'VL_CRED_DIF');
//      reg.VL_CRED_DISP := pegaValor(query,'VL_CRED_DISP');
//      reg.IND_DESC_CRED := pegaValor(query,'IND_DESC_CRED');
//      reg.SLD_CRED := pegaValor(query,'SLD_CRED');
//      reg.ALIQ_COFINS := pegaValor(query,'ALIQ_COFINS');
//      reg.VL_BC_COFINS := pegaValor(query, 'VL_BC_COFINS');
//      reg.VL_CRED_DESC := pegaValor(query, 'VL_CRED_DESC');
//      reg.grava;
//      reg.Free;
//      reg := nil;
//    end;
//    query.Next;
//  end;
//  fechaQuery(query);
//  PisCofinsM505;
end;

procedure TPisCofins.PisCofinsM505(CodNaturezaReceita: integer; PercAliquota: double);
var reg: TPisCofinsM505;
  query: TOracleDataSet1;
  vRetencao: boolean;
  wValor: Double;
begin

  with DMPisCofinsM do
  begin
    query := executaQuery(DmPisCofinsM.QReg505, false);
    query.SetVariable('REGISTRO', 'M500');
    query.SetVariable('COD_NATUREZA_RECEITA', CodNaturezaReceita);
    query.SetVariable('PERC_ALIQUOTA', PercAliquota);

    if not abreQuery(query) then Exit;

    while not query.Eof do
    begin
      reg := TPisCofinsM505.Create(TObject(self), arquivo);
      reg.NAT_BC_CRED := pegaValor(query,'COD_NAT_BC_CRED');
      reg.NAT_BC_CRED := bib.StrZero(reg.NAT_BC_CRED, 2);
      reg.CST_COFINS := pegaValor(query,'COD_CST_COFINS');
      reg.VL_BC_COFINS_TOT := pegaValor(query,'VAL_BC');
      if wCodIncTrib = 3 then
        reg.VL_BC_COFINS_CUM := pegaValor(query,'VAL_BC')
      else
        reg.VL_BC_COFINS_CUM := 0;
      if wCodIncTrib = 1 then
        reg.VL_BC_COFINS_NC := pegaValor(query,'VAL_BC')
      else
        if wCodIncTrib = 3 then
          reg.VL_BC_COFINS_NC := pegaValor(query,'VAL_BC') - reg.VL_BC_COFINS_CUM
        else
          reg.VL_BC_COFINS_NC := 0;
       // 1 apropriação direta, 2 rateio proporcional

      if reg.CST_COFINS in [50,51,52,60,61,62] then
        reg.VL_BC_COFINS := reg.VL_BC_COFINS_NC
      else
      begin
        if reg.CST_COFINS in [53,54,55,56,63,64,65,66] then
        begin
          if wAproCred =  '1' then // Apropriação direta
            reg.VL_BC_COFINS := pegaValor(query,'VAL_BC')
          else
          begin
            if CodNaturezaReceita = 101 then // Não tributado no mercado interno
              reg.VL_BC_COFINS := pegaValor(query,'VAL_BC')
            else
              reg.VL_BC_COFINS := 0;
          end;
        end;
      end;
      reg.QUANT_BC_COFINS_TOT := 0;
      reg.QUANT_BC_COFINS := 0;
      reg.DESC_CRED := '';

      reg.grava;
      reg.Free;
      reg := nil;
      query.Next;
    end;
    fechaQuery(query);
  end;



//  query := executaQuery(DmPisCofinsM.QReg505, false);
//  query.SetVariable('FILIAIS', bib.geraStringFiliais(wFiliais));
//  query.setVariable('DT_INI', wDataIni);
//  query.setVariable('DT_FIN', wDataFin);
//
//  if not abreQuery(query) then Exit;
//
//  while not query.Eof do
//  begin
//    reg := TPisCofinsM505.Create(TObject(self), arquivo);
//    reg.NAT_BC_CRED := pegaValor(query,'NAT_BC_CRED');
//    reg.CST_COFINS := pegaValor(query,'CST_COFINS');
//    reg.VL_BC_COFINS_TOT := pegaValor(query,'VL_BC_COFINS_TOT');
//    reg.VL_BC_COFINS_CUM := pegaValor(query,'VL_BC_COFINS_CUM');
//    reg.VL_BC_COFINS_NC := pegaValor(query,'VL_BC_COFINS_NC');
//    reg.VL_BC_COFINS := pegaValor(query,'VL_BC_COFINS');
//    reg.grava;
//    reg.Free;
//    reg := nil;
//    query.Next;
//  end;
//  fechaQuery(query);
end;

procedure TPiscofins.PisCofinsM510(valor: double);
var reg: TPisCofinsM510;
begin
  // Ajuste de redução para cofins retido na fonte
  reg := TPisCofinsM510.Create(TObject(self), arquivo);
  reg.IND_AJ := '0';
  reg.VAL_AJ := valor;
  reg.COD_AJ := 03;
  reg.DESCR_AJ := 'RETENCAO NA FONTE';
  reg.grava;
  reg.Free;
  reg := nil;           
end;

procedure TPisCofins.PisCofinsM600;
var reg: TPisCofinsM600;
  query: TOracleDataSet1;
  queryRet: TOracleDataSet1;
  wValRet: Double;
  wValCred: double;
begin

  // Busca retenções
  wValRet := 0;
  wValCred := 0;
  queryRet := executaQuery(DmPisCofinsF.QReg600, false);
  queryRet.SetVariable('FILIAIS', bib.geraStringFiliais(wFiliais));
  queryRet.setVariable('DATA_INI', wDataIni);
  queryRet.setVariable('DATA_FIN', wDataFin);
  queryRet.SetVariable('IND_ENTRADA_SAIDA', 'E');
  if abreQuery(queryRet) then
    queryRet.First;
  while not queryRet.Eof do
  begin
    wValRet := wValRet + pegaValor(queryRet, 'VL_RET_COFINS');
    queryRet.Next;
  end;

  // Busca Créditos
  with DMPisCofinsM do
  begin
    QReg600.Close;
    QReg600.SetVariable('REGISTRO', 'M600');
    QReg600.Open;
    QReg600.First;

    CDS200_600.Close;
    CDS200_600.Open;
    CDS200_600.EmptyDataSet;
    CDS200_600.Insert;
    while not QReg600.Eof do
    begin
      if QReg600COD_CONT.Value in [1,2,3,4,32,71] then
        CDS200_600VL_TOT_CONT_NC_PER.Value := CDS200_600VL_TOT_CONT_NC_PER.Value + QReg600VAL_REGISTRO.Value;
      if QReg600COD_CONT.Value in [31,32,51,52,53,54,72] then
        CDS200_600VL_TOT_CONT_CUM_PER.Value := CDS200_600VL_TOT_CONT_CUM_PER.Value + QReg600VAL_REGISTRO.Value;
      QReg600.Next;
    end;
    CDS200_600.Post;


    QReg600.First;
    if QReg600VAL_REGISTRO.Value > 0 then
    begin
      reg := TPisCofinsM600.Create(TObject(self), arquivo);
      if wCodIncTrib = 2 then
        reg.VL_TOT_CONT_NC_PER := 0
      else
        reg.VL_TOT_CONT_NC_PER := CDS200_600VL_TOT_CONT_NC_PER.Value;

      if wCodIncTrib = 2 then
        reg.VL_TOT_CRED_DESC := 0
      else
        reg.VL_TOT_CRED_DESC := reg.VL_TOT_CONT_NC_PER - wValRet;

      reg.VL_TOT_CRED_DESC_ANT := 0;

      if(reg.VL_TOT_CONT_NC_PER - reg.VL_TOT_CRED_DESC - reg.VL_TOT_CRED_DESC_ANT) > 0 then
        reg.VL_TOT_CONT_NC_DEV := reg.VL_TOT_CONT_NC_PER - reg.VL_TOT_CRED_DESC - reg.VL_TOT_CRED_DESC_ANT
      else
        reg.VL_TOT_CONT_NC_DEV := 0;
      if wCodIncTrib = 2 then
        reg.VL_RET_NC := 0
      else
        reg.VL_RET_NC := wValRet;
      reg.VL_OUT_DED_NC := 0;
      if wCodIncTrib = 2 then
        reg.VL_CONT_NC_REC := 0
      else
        reg.VL_CONT_NC_REC := Abs(RoundTo(reg.VL_TOT_CONT_NC_DEV,-2) - RoundTo(reg.VL_RET_NC,-2) - RoundTo(reg.VL_OUT_DED_NC,-2));

      if wCodIncTrib = 1 then
        reg.VL_TOT_CONT_CUM_PER := 0
      else
        reg.VL_TOT_CONT_CUM_PER := CDS200_600VL_TOT_CONT_CUM_PER.Value;
      if wCodIncTrib = 1 then
        reg.VL_RET_CUM := 0
      else
        reg.VL_RET_CUM := wValRet;
      reg.VL_OUT_DED_CUM := 0;
      if wCodIncTrib = 1 then
        reg.VL_CONT_CUM_REC := 0
      else
        reg.VL_CONT_CUM_REC := reg.VL_TOT_CONT_CUM_PER - reg.VL_RET_CUM - reg.VL_OUT_DED_CUM;
      reg.VL_TOT_CONT_REC := reg.VL_CONT_NC_REC + reg.VL_CONT_CUM_REC;
      reg.grava;
      if (reg.VL_CONT_CUM_REC > 0) or (reg.VL_CONT_NC_REC > 0) then
        PisCofinsM605(reg.VL_CONT_CUM_REC + reg.VL_CONT_NC_REC);

      reg.Free;
      reg := nil;
    end;  
  end;

  PisCofinsM610;


//  query := executaQuery(DmPisCofinsM.QReg600, false);
//  query.SetVariable('FILIAIS', bib.geraStringFiliais(wFiliais));
//  query.setVariable('DT_INI', wDataIni);
//  query.setVariable('DT_FIN', wDataFin);
//  queryRet := executaQuery(DmPisCofinsF.QReg600, false);
//  queryRet.SetVariable('FILIAIS', bib.geraStringFiliais(wFiliais));
//  queryRet.setVariable('DATA_INI', wDataIni);
//  queryRet.setVariable('DATA_FIN', wDataFin);
//  if not abreQuery(query) then Exit;
//  wValor := 0;
//  abreQuery(queryRet);
//  while not queryRet.Eof do
//  begin
//    wValor := wValor + pegaValor(queryRet, 'VL_RET_PIS');
//    queryRet.Next;
//  end;
//  while not query.Eof do
//  begin
//    reg := TPisCofinsM600.Create(TObject(self), arquivo);
//    reg.VL_TOT_CONT_NC_PER := pegaValor(query, 'VL_TOT_CONT_NC_PER');
//    reg.VL_TOT_CRED_DESC := pegaValor(query, 'VL_TOT_CRED_DESC');
//    reg.VL_TOT_CRED_DESC_ANT := pegaValor(query, 'VL_TOT_CRED_DESC_ANT');
//    reg.VL_TOT_CONT_CUM_PER := pegaValor(query, 'VL_TOT_CONT_CUM_PER');
//    reg.VL_CONT_CUM_REC := pegaValor(query, 'VL_CONT_CUM_REC');
//    reg.VL_TOT_CONT_NC_DEV := pegaValor(query, 'VL_TOT_CONT_NC_DEV');
//    reg.VL_RET_NC := wValor;
//    reg.VL_CONT_NC_REC := Abs(pegaValor(query,'VL_CONT_NC_REC') - wValor);
//    reg.VL_TOT_CONT_REC := reg.VL_CONT_NC_REC + reg.VL_CONT_CUM_REC;
//    reg.grava;
//    if (reg.VL_CONT_CUM_REC > 0) or
//    (reg.VL_CONT_NC_REC > 0)then
//      PisCofinsM605(reg.VL_CONT_CUM_REC + reg.VL_CONT_NC_REC);
//    reg.Free;
//    reg := nil;
//    query.Next;
//  end;
//  fechaQuery(query);
//  PisCofinsM610;
end;


procedure TPisCofins.PisCofinsM605(valor: double);
var reg: TPisCofinsM605;
  query: TOracleDataSet1;
  wValor: Double;
begin
  query := executaQuery(DmPisCofinsM.QReg605, false);
  query.SetVariable('FILIAIS', bib.geraStringFiliais(wFiliais));
  query.setVariable('DT_INI', wDataIni);
  query.setVariable('DT_FIN', wDataFin);

  if not abreQuery(query) then Exit;

  while not query.Eof do
  begin
    reg := TPisCofinsM605.Create(TObject(self), arquivo);
    reg.NUM_CAMPO := pegaValor(query, 'NUM_CAMPO');
    reg.COD_REC := pegaValor(query, 'COD_REC');
    //reg.VL_DEBITO := pegaValor(query, 'VL_DEBITO');
    reg.VL_DEBITO := valor;
    reg.grava;
    reg.Free;
    reg := nil;
    query.Next;
  end;
  fechaQuery(query);
end;

procedure TPisCofins.PisCofinsM610;
var reg: TPisCofinsM610;
  query: TOracleDataSet1;
  wValor: Double;
  wTemRegistro: boolean;
  dados: TDataSource;
  tela: TFMostraDRE;
  wCodCont: integer;
begin
  wTemRegistro := false;

  with DMPisCofinsM do
  begin
    query := executaQuery(DmPisCofinsM.QReg210_610, false);
    query.SetVariable('REGISTRO', 'M600');
    if not abreQuery(query) then Exit;
    CDS210_610.Open;
    CDS210_610.EmptyDataSet;
    while not query.Eof do
    begin
      // Obtém o COD_CONT
      wCodCont := 0;
      if pegaValor(query, 'COD_CST_COFINS') = '01' then
      begin
        if (wCodIncTrib in [1, 3]) and (query.FieldByName('PERC_ALIQUOTA').Text = '7,6') then
          wCodCont := 1;
        if (wCodIncTrib in [2, 3]) and (query.FieldByName('PERC_ALIQUOTA').AsFloat = 3) then
          wCodCont := 51;
      end;
      if pegaValor(query, 'COD_CST_COFINS') = '02' then
      begin
        if wCodIncTrib in [1, 3] then
          wCodCont := 2;
        if wCodIncTrib = 2 then
          wCodCont := 52;
      end;
      if pegaValor(query, 'COD_CST_COFINS') = '03' then
      begin
        if (wCodIncTrib in [1, 3]) and (query.FieldByName('PERC_ALIQUOTA').AsFloat > 0) then
          wCodCont := 3;
        if (wCodIncTrib = 2) and (query.FieldByName('PERC_ALIQUOTA').AsFloat > 0) then
          wCodCont :=  53;
      end;
      if pegaValor(query, 'COD_CST_COFINS') = '05' then
      begin
        if query.FieldByName('PERC_ALIQUOTA').AsFloat = 3 then
          wCodCont := 31;
        if (query.FieldByName('PERC_ALIQUOTA').AsFloat <> 3) and (query.FieldByName('PERC_ALIQUOTA').AsFloat <> 0) then
          wCodCont := 32;
      end;

      // Busca pelo registro no clientdataset
      // O locate não funcionou
      CDS210_610.First;
      while not CDS210_610.Eof do
      begin
        wTemRegistro := ((CDS210_610COD_CONT.Value = wCodCont)
          and (CDS210_610PERC_ALIQUOTA.Value = query.FieldByName('PERC_ALIQUOTA').AsFloat));
        if wTemRegistro then
          break;
        CDS210_610.Next;
      end;

      if wTemRegistro then
      begin
        CDS210_610.Edit;
        CDS210_610VAL_REGISTRO.Value := CDS210_610VAL_REGISTRO.Value + pegaValor(query, 'VAL_REGISTRO');
        if Pos(bib.AjustaStrContrario(pegaValor(query, 'COD_CONT'), 2, '0'), '01 51 02 52 31 32') > 0 then
        begin
          if Pos(pegaValor(query, 'COD_CST_COFINS'), '01 02 03 04 05') > 0 then
          begin
            CDS210_610VL_REC_BRT.Value := CDS210_610VL_REC_BRT.Value + pegaValor(query, 'VAL_REC_BRT');
            CDS210_610VAL_BC.Value := CDS210_610VAL_BC.Value + pegaValor(query, 'VAL_BC');
          end;
        end
        else
//        if Pos(bib.AjustaStrContrario(pegaValor(query, 'COD_CONT'), 2, '0'), '03 53') > 0 then
        CDS210_610VAL_BC.Value := 0;
        CDS210_610.Post;
      end
      else
      begin
        CDS210_610.Insert;
        CDS210_610DESC_REGISTRO.Value := pegaValor(query, 'DESC_REGISTRO');
        CDS210_610PERC_ALIQUOTA.Value := query.FieldByName('PERC_ALIQUOTA').AsFloat;
        CDS210_610COD_CONT.Value := wCodCont;
        CDS210_610VAL_REGISTRO.Value := pegaValor(query, 'VAL_REGISTRO');
        if Pos(bib.AjustaStrContrario(pegaValor(query, 'COD_CONT'), 2, '0'), '01 51 02 52 31 32') > 0 then
        begin
          if Pos(pegaValor(query, 'COD_CST_COFINS'), '01 02 03 04 05') > 0 then
          begin
            CDS210_610VL_REC_BRT.Value := CDS210_610VL_REC_BRT.Value + pegaValor(query, 'VAL_REC_BRT');
            CDS210_610VAL_BC.Value := pegaValor(query, 'VAL_BC');
          end;
        end
        else
        //if Pos(bib.AjustaStrContrario(pegaValor(query, 'COD_CONT'), 2, '0'), '03 53') > 0 then
        CDS210_610VAL_BC.Value := 0;
        CDS210_610.Post;
      end;
      query.Next;
    end;
//    tela := TFMostraDRE.Create(Application);
//      dados := TDataSource.Create(Application);
//
//      dados.DataSet := CDS210_610;
//
//      tela.DBGrid1.DataSource := dados;
//      tela.ShowModal;
//      tela.Free;
//      tela := Nil;


    CDS210_610.First;
    while not CDS210_610.Eof do
    begin
      reg := TPisCofinsM610.Create(TObject(self), arquivo);
      reg.COD_CONT := bib.AjustaStrContrario(CDS210_610COD_CONT.Text, 2, '0');
      reg.VL_REC_BRT := CDS210_610VL_REC_BRT.Value;
      reg.VL_BC_CONT := CDS210_610VAL_BC.Value;
      reg.VL_AJUS_ACRES_BC_COFINS := 0;
      reg.VL_AJUS_REDUC_BC_COFINS := 0;
      reg.VL_BC_CONT_AJUS :=  reg.VL_BC_CONT + reg.VL_AJUS_ACRES_BC_COFINS - reg.VL_AJUS_REDUC_BC_COFINS;
      reg.ALIQ_COFINS := CDS210_610PERC_ALIQUOTA.Value;
      reg.QUANT_BC_COFINS := 0;
      reg.ALIQ_COFINS_QUANT := 0;
      reg.VL_CONT_APUR := CDS210_610VAL_REGISTRO.Value;
      reg.VL_AJUS_ACRES := 0;
      reg.VL_AJUS_REDUC := 0;
      reg.VL_CONT_DIFER := 0;
      reg.VL_CONT_DIFER_ANT := 0;
      reg.VL_CONT_PER := reg.VL_CONT_APUR + reg.VL_AJUS_ACRES - reg.VL_AJUS_REDUC - reg.VL_CONT_DIFER + reg.VL_CONT_DIFER_ANT;
      reg.DT_INI := wDataIni;
      reg.grava;
      reg.Free;
      reg := nil;
      CDS210_610.Next;
    end;

//    tela := TFMostraDRE.Create(Application);
//      dados := TDataSource.Create(Application);
//
//      dados.DataSet := query;
//
//      tela.DBGrid1.DataSource := dados;
//      tela.ShowModal;
//      tela.Free;
//      tela := Nil;

    fechaQuery(query);
  end;

//  query := executaQuery(DmPisCofinsM.QReg610, false);
//  query.SetVariable('FILIAIS', bib.geraStringFiliais(wFiliais));
//  query.setVariable('DT_INI', wDataIni);
//  query.setVariable('DT_FIN', wDataFin);
//
//  if not abreQuery(query) then Exit;
//
//  while not query.Eof do
//  begin
//    reg := TPisCofinsM610.Create(TObject(self), arquivo);
//    reg.COD_CONT := pegaValor(query, 'COD_CONT');
//    reg.VL_REC_BRT := pegaValor(query, 'VL_REC_BRT');
//    reg.VL_BC_CONT := pegaValor(query, 'VL_BC_CONT');
//    reg.VL_AJUS_ACRES_BC_COFINS := 0;
//    reg.VL_AJUS_REDUC_BC_COFINS := 0;
//    reg.VL_BC_CONT_AJUS := reg.VL_BC_CONT;
//    reg.ALIQ_COFINS := pegaValor(query, 'ALIQ_COFINS');
//    reg.VL_CONT_APUR := pegaValor(query, 'VL_CONT_APUR');
//    reg.VL_AJUS_ACRES  := 0;
//    reg.VL_AJUS_REDUC := 0;
//    reg.VL_CONT_PER := pegaValor(query, 'VL_CONT_PER');
//    reg.DT_INI := wDataIni;
//    reg.grava;
//    reg.Free;
//    reg := nil;
//    query.Next;
//  end;
//  fechaQuery(query);
end;

procedure TPisCofins.PisCofinsM800;
var reg: TPisCofinsM800;
  query: TOracleDataSet1;
  wValor: Double;
begin
  query := executaQuery(DmPisCofinsM.QReg800, false);
  query.SetVariable('FILIAIS', bib.geraStringFiliais(wFiliais));
  query.setVariable('DATA_INI', wDataIni);
  query.setVariable('DATA_FIN', wDataFin);

  if not abreQuery(query) then Exit;

  while not query.Eof do
  begin
    with DMSped do
    begin
      reg := TPisCofinsM800.Create(TObject(Self), arquivo);
      QApuracaoCofinsCons.Close;
      QApuracaoCofinsCons.SetVariable('REGISTRO', 'M800');
      QApuracaoCofinsCons.SetVariable('COFINS', FormatFloat('#00', pegaValor(query, 'CST_COFINS')));
      QApuracaoCofinsCons.SetVariable('COD_CTA', pegaValor(query, 'COD_CTA'));
      QApuracaoCofinsCons.Open;
      wValor := 0;
      while not QApuracaoCofinsCons.Eof do
      begin
        wValor := wValor + QApuracaoCofinsConsVAL_REGISTRO.Value;
        QApuracaoCofinsCons.Next;
      end;
      if pegaValor(query, 'COD_CTA') = '' then
        exit;
      reg.CST_COFINS := pegaValor(query, 'CST_COFINS');
      reg.VL_TOT_REC := wValor;
      reg.COD_CTA := pegaValor(query, 'COD_CTA');
      reg.grava;
      reg.Free;
      reg := nil;
    end;
    PisCofinsM810(pegaValor(query, 'CST_COFINS'), pegaValor(query, 'COD_CTA'));
    query.Next;
  end;
  fechaQuery(query);
end;

procedure TPisCofins.PisCofinsM810(pCst, pCodCta: String);
var reg: TPisCofinsM810;
  query: TOracleDataSet1;
  wValor: Double;
begin
  {wValor := 0;
  query := executaQuery(DmPisCofinsM.QReg810, false);
  query.SetVariable('FILIAIS', bib.geraStringFiliais(wFiliais));
  query.setVariable('DATA_INI', wDataIni);
  query.setVariable('DATA_FIN', wDataFin);

  if not abreQuery(query) then Exit;

  while not query.Eof do
  begin}
    with DMSped do
    begin
      QApuracaoCofinsNatCons.Close;
      QApuracaoCofinsNatCons.SetVariable('REGISTRO', 'M800');
      QApuracaoCofinsNatCons.SetVariable('CST', pCst);
      QApuracaoCofinsNatCons.SetVariable('COD_CTA', pCodCta);
      QApuracaoCofinsNatCons.Open;
      while not QApuracaoCofinsNatCons.Eof do
      begin
        reg := TPisCofinsM810.Create(TObject(Self), arquivo);
        reg.NAT_REC := QApuracaoCofinsNatConsCOD_NATUREZA_RECEITA.AsInteger;
        reg.VL_REC := QApuracaoCofinsNatConsVAL_REGISTRO.Value;
        reg.COD_CTA := pCodCta;
        QApuracaoCofinsNatCons.Next;
        reg.grava;
        reg.Free;
        reg := nil;
      end;
    end;
    //query.Next;
  //end;
end;


procedure TPisCofins.PisCofinsM990(QtdLinhas: Double);
var reg: TPisCofinsM990;
begin
  reg := TPisCofinsM990.Create(TObject(Self), arquivo);
  reg.QTD_LIN_M := QtdLinhas;
  reg.grava;
  reg.Free;
  reg := nil;
end;

//Fim Bloco M

//Início Bloco P

procedure TPisCofins.PisCofinsP001(geraBlocoP: boolean);
var reg: TPisCofinsP001;
begin
  reg := TPisCofinsP001.Create(TObject(Self), arquivo);
  reg.IND_MOV := 1;
  reg.grava;
  reg.Free;
  reg := nil;
end;

procedure TPisCofins.PisCofinsP010;
var reg: TPisCofinsP010;
query: TOracleDataSet1;
begin       
  query := executaQuery(DmPisCofinsP.QReg010, false);
  //query.SetVariable('FILIAL', wFilial);
  //query.setVariable('DT_INI', wDataIni);
  //query.setVariable('DT_FIN', wDataFin);

  if not abreQuery(query) then Exit;

  while not query.Eof do
  begin
    reg := TPisCofinsP010.Create(TObject(Self), arquivo);
    reg.CNPJ := pegaValor(query, 'CNPJ');
    reg.grava;
    reg.Free;
    reg := nil;
    PisCofinsP100(pegaValor(query,'COD_FILIAL'));
    query.Next;
  end; 
  fechaQuery(query);                            
end;

procedure TPisCofins.PisCofinsP100(pFilial: Integer);
var reg: TPisCofinsP100;
query: TClientDataSet;
begin
  {query := executaQuery(DMPisCofinsP.QReg100, false);
  query.SetVariable('FILIAL', pFilial);
  query.SetVariable('DT_INI', wDataIni);
  query.SetVariable('DT_FIN', wDataFin);}

  query := DMPisCofinsP.CDS100;

  //if not abreQuery(query) then Exit;
  if query.RecordCount = 0 then Exit;
  query.First;

  while not query.Eof do
  begin
    if query.FieldValues['COD_FILIAL'] = pFilial then
    begin
      reg := TPisCofinsP100.Create(TObject(Self), arquivo);

      reg.DT_INI := wDataIni;
      reg.DT_FIN := wDataFin;

      reg.VL_REC_TOT_EST := query.FieldValues['VL_REC_TOT_EST'];
      reg.COD_ATIV_ECON := query.FieldValues['COD_ATIV_ECON'];
      reg.VL_REC_ATIV_ESTAB := query.FieldValues['VL_REC_ATIV_ESTAB'];
      //reg.VL_EXC := query.FieldValues['VL_EXC'];
      reg.VL_BC_CONT := query.FieldValues['VL_BC_CONT'];
      reg.ALIQ_CONT := query.FieldValues['ALIQ_CONT'];
      reg.VL_CONT_APU := query.FieldValues['VL_CONT_APU'];

      {reg.COD_ATIV_ECON := pegaValor(query, 'COD_ATIV_ECON');
      reg.VL_REC_ATIV_ESTAB := pegaValor(query, 'VL_REC_ATIV_ESTAB');
      reg.VL_EXC := pegaValor(query, 'VL_EXC');
      reg.VL_BC_CONT := pegaValor(query, 'VL_BC_CONT');
      reg.ALIQ_CONT := pegaValor(query, 'ALIQ_CONT');
      reg.VL_CONT_APU := pegaValor(query, 'VL_CONT_APU');
      reg.COD_CTA := pegaValor(query, 'COD_CTA');
      reg.INFO_COMPL := pegaValor(query, 'INFO_COMPL');}
      reg.grava;
      reg.Free;
      reg := Nil;
    end;
    query.Next;
  end;
  //fechaQuery(query);
  query.Close;
end;

procedure TPisCofins.PisCofinsP200;
var reg: TPisCofinsP200;
query: TClientDataSet;
wData: String;
wDataArray: TStringList;
begin
  {query := executaQuery(DMPisCofinsP.QReg200, false);
  query.SetVariable('DT_INI', wDataIni);
  query.SetVariable('DT_FIN', wDataFin);}
  query := DmPisCofinsP.CDS200;

  //if not abreQuery(query) then Exit;
  if query.RecordCount = 0 then Exit;

  wDataArray := TStringList.Create;
  wDataArray.Delimiter := '/';
  wDataArray.DelimitedText := DateToStr(wDataIni);
  wData := wDataArray[1] + wDataArray[2];
  while not query.Eof do
  begin
    reg := TPisCofinsP200.Create(TObject(Self), arquivo);
    reg.VL_TOT_CONT_APU := query.FieldValues['VL_TOT_CONT_APU'];
    //reg.VL_TOT_AJ_REDUC := query.FieldValues['VL_TOT_AJ_REDUC'];
    //reg.VL_TOT_AJ_ACRES := query.FieldValues['VL_TOT_AJ_ACRES'];
    reg.VL_TOT_CONT_DEV := reg.VL_TOT_CONT_APU;
    reg.COD_REC := query.FieldValues['COD_REC'];
    reg.PERC_REF := wData;

    {reg.PERC_REF := pegaValor(query, 'PERC_REF');
    reg.VL_TOT_CONT_APU := pegaValor(query, 'VL_TOT_CONT_APU');
    reg.VL_TOT_AJ_REDUC := pegaValor(query, 'VL_TOT_AJ_REDUC');
    reg.VL_TOT_AJ_ACRES := pegaValor(query, 'VL_TOT_AJ_ACRES');
    reg.VL_TOT_CONT_DEV := pegaValor(query, 'VL_TOT_CONT_DEV');
    reg.COD_REC := pegaValor(query, 'COD_REC');}
    reg.grava;
    reg.Free;
    reg := Nil;
    query.Next;
  end;
  //fechaQuery(query);
  query.Close;
end;

procedure TPisCofins.PisCofinsP990(QtdLinhas: Double);
var reg: TPisCofinsP990;
begin
  reg := TPisCofinsP990.Create(TObject(Self), arquivo);
  reg.QTD_LIN_M := QtdLinhas;
  reg.grava;
  reg.Free;
  reg := nil;
end;

//Fim Bloco P

//Inicio Bloco 1

procedure TPisCofins.PisCofins1001;
var reg: TPisCofins1001;
begin
  reg := TPisCofins1001.Create(TObject(Self), arquivo);
  reg.IND_MOV := 1;
  reg.grava;
  reg.Free;
  reg := nil;
end;

procedure TPisCofins.PisCofins1990(QtdLinhas: Double);
var reg: TPisCofins1990;
begin
  reg := TPisCofins1990.Create(TObject(Self), arquivo);
  reg.QTD_LIN_1 := QtdLinhas;
  reg.grava;
  reg.Free;
  reg := nil;
end;
//Fim Bloco 1

//Inicio Bloco 9
procedure TPisCofins.PisCofins9001;
var
  reg: TPisCofins9001;
begin
  reg := TPisCofins9001.Create(TObject(Self), arquivo);
  reg.IND_MOV := 1;
  reg.grava;
  reg.Free;
  reg := nil;
end;

procedure TPisCofins.PisCofins9990(QtdLinhas: Double);
var
  reg: TPisCofins9990;
begin
  reg := TPisCofins9990.Create(TObject(Self), arquivo);
  reg.QTD_LIN_9 := QtdLinhas;
  reg.grava;
  reg.Free;
  reg := nil;
end;

//Fim Bloco 9

function TPisCofins.localizaRegistro(vetor: array of string; registro: string): Integer;
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

function TPisCofins.alteraValor(texto: string; posicao: Integer; textoNovo: string): string;
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

procedure TPisCofins.atualizaTotalizadorEIndicadorBloco;
var movimento: string;
  reg: TPisCofins9900;
  query, query1, query2: TOracleDataSet1;
begin
  // --- Totaliza e seta o indicador dos blocos --- //

  query := executaQuery(DmSped.QBlocos, True);
  query.First;

  while not query.Eof do
  begin
    query1 := executaQuery(DmSped.QProcuraRegistro);
    query1.SetVariable('DESC_BLOCO', pegaValor(query, 'DESC_BLOCO'));
    query1.SetVariable('DESC_REGISTRO', '990');
    query1.Open;
    if (not query1.IsEmpty) then
    begin
      query2 := executaQuery(DmSped.QContaBloco);
      query2.SetVariable('DESC_BLOCO', pegaValor(query, 'DESC_BLOCO'));
      query2.Open;
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
    if (not query1.IsEmpty) then
    begin
      query2 := executaQuery(DmSped.QContaBloco);
      query2.SetVariable('DESC_BLOCO', pegaValor(query, 'DESC_BLOCO'));
      query2.Open;
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
  query.First;

  while not query.Eof do
  begin
    reg := TPisCofins9900.Create(TObject(Self), arquivo);
    reg.REG_BLC := pegaValor(query, 'DESC_BLOCO') + pegaValor(query, 'DESC_REGISTRO');
    reg.QTD_REG_BLC := 0;
    reg.grava;
    reg.Free;
    reg := nil; 
    query.Next;
  end;
  fechaQuery(query);

  reg := TPisCofins9900.Create(TObject(Self), arquivo);
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
  if (not query.IsEmpty) then
  begin
    query1 := executaQuery(DmSped.QContaBloco);
    query1.SetVariable('DESC_BLOCO', '9');
    query1.Open; 
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
  query1 := executaQuery(DmSped.QConta, True);
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

  query1 := executaQuery(DmSped.QMaxRegistro, True);
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

  query1 := executaQuery(DmSped.QMaxRegistro, True);

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

  //thread.mostramensagem('Atualizando Registro I030');

  //query := executaQuery(DmSped.QProcuraRegistro);
  //query.SetVariable('DESC_BLOCO', 'I');
  //query.SetVariable('DESC_REGISTRO', '030');
  //query.Open;
  //query1 := executaQuery(DmSped.QConta, True);
  //if ((not query.IsEmpty) and (not (eNulo(query, 'COD_REGISTRO')))) then
  //begin
    //DmSped.QUpSped.Close;
    //DmSped.QUpSped.SetVariable('COD_REGISTRO', pegaValor(query, 'COD_REGISTRO'));
    //DmSped.QUpSped.SetVariable('DESC_CONTEUDO', alteraValor(pegaValor(query, 'DESC_CONTEUDO'), 5, IntToStr(pegaValor(query1, 'TOTAL'))));
    //try
      //DmSped.QUpSped.ExecSQL;
    //except
      //DMOracle.DBCemapa.Rollback;
      //MessageDlg('Erro na gravação.', mtError, [mbOK], 0);
      //Abort;
    //end;
  //end;
  //fechaQuery(query);
  //fechaQuery(query1);

  // --- Altera o Campo QTD_LIN do Registro J900 --- //

  //thread.mostramensagem('Totalizando Registro J900');

  //query := executaQuery(DmSped.QProcuraRegistro);
  //query.SetVariable('DESC_BLOCO', 'J');
  //query.SetVariable('DESC_REGISTRO', '900');
  //query.Open;
  //query1 := executaQuery(DmSped.QConta, True);
  //if ((not query.IsEmpty) and (not (eNulo(query, 'COD_REGISTRO')))) then
  //begin
    //DmSped.QUpSped.Close;
    //DmSped.QUpSped.SetVariable('COD_REGISTRO', pegaValor(query, 'COD_REGISTRO'));
    //DmSped.QUpSped.SetVariable('DESC_CONTEUDO', alteraValor(pegaValor(query, 'DESC_CONTEUDO'), 6, IntToStr(pegaValor(query1, 'TOTAL'))));
    //try
      //DmSped.QUpSped.ExecSQL;
    //except
      //DMOracle.DBCemapa.Rollback;
      //MessageDlg('Erro na gravação.', mtError, [mbOK], 0);
      //Abort;
    //end;
  //end;
  //fechaQuery(query);
  //fechaQuery(query1);

  // --- Altera a quantidade nos registros 9900 --- //

  thread.mostramensagem('Totalizando Registros 9900');

  query := executaQuery(DmSped.QProcuraRegistro);
  query.SetVariable('DESC_BLOCO', '9');
  query.SetVariable('DESC_REGISTRO', '900');
  query.Open;
  query.First;

  while not query.Eof do
  begin
    query1 := executaQuery(DmSped.QContaRegistro);
    query1.SetVariable('DESC_BLOCO', copy(recuperaValor(pegaValor(query, 'DESC_CONTEUDO'), 2), 1, 1));
    query1.SetVariable('DESC_REGISTRO', copy(recuperaValor(pegaValor(query, 'DESC_CONTEUDO'), 2), 2, 3));
    query1.Open;
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

function TPisCofins.geraStringFiliais(separador: string = ', '): string;
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

function TPisCofins.recuperaValor(texto: string; posicao: Integer): string;
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

procedure TPisCofins.PisCofins9999(QtdLinhas: Double);
var
  reg: TPisCofins9999;
begin
  reg := TPisCofins9999.Create(TObject(Self), arquivo);
  reg.QTD_LIN := QtdLinhas;
  reg.grava;
  reg.Free;
  reg := nil;
end;

procedure TPisCofins.insereApuracao(pRegistro: String; pValor: Double;
  pCstPis: String; pCstCofins: String;
  pCodCta: String; pCodNatRec: Integer = 999);
begin
  if pCstPis = '' then
    pCstPis := '0';
  if pCstCofins = '' then
    pCstCofins := '0';
  if ((StrToInt(pCstPis) in [4, 5, 6, 7, 8, 9]) and (pRegistro = 'M400')) or
    ((StrToInt(pCstCofins) in [4, 5, 6, 7, 8, 9]) and (pRegistro = 'M800')) then
  begin
    Inc(wCodReg);
    if pCodNatRec = 0 then
      pCodNatRec := 999;
    if pCodCta = '' then
    begin
      MessageDlg('Erro ao gerar apurações de receitas isentas (Registros M400 e M800)'
        + #13#10
        + 'Operação sem conta contábil informada'
        + #13#10
        + 'Verificar operação de documentos com CST de PIS/COFINS 04, 05, 06, 07, 08 e 09'
        , mtError, [mbOk], 0);
      abort;
    end;
    with DMSped do
    begin
      QInsSpedApuracao.Close;
      QInsSpedApuracao.SetVariable('COD_REGISTRO', wCodReg);
      QInsSpedApuracao.SetVariable('DESC_REGISTRO', pRegistro);
      QInsSpedApuracao.SetVariable('VAL_REGISTRO', pValor);
      QInsSpedApuracao.SetVariable('COD_CST_PIS', pCstPis);
      QInsSpedApuracao.SetVariable('COD_CST_COFINS', pCstCofins);
      QInsSpedApuracao.SetVariable('COD_NATUREZA_RECEITA', pCodNatRec);
      QInsSpedApuracao.SetVariable('COD_CTA', pCodCta);
      try
        QInsSpedApuracao.ExecSQL;
      except
        DMOracle.DBCemapa.Rollback;
        MessageDlg('Erro na gravação das apurações.', mtError, [mbOK], 0);
        Abort;
      end;
    end;
  end;
end;

procedure TPisCofins.PisCofinsC175(pCodNota: Integer);
var reg: TPisCofinsC175;
  query: TOracleDataSet1;
begin
  query := executaQuery(DmPisCofinsC.QReg175);
  query.SetVariable('COD_NOTA_CAB', pCodNota);
  query.Open;
  if not abreQuery(query) then Exit;

  while not query.Eof do
  begin
    reg := TPisCofinsC175.Create(TObject(self), arquivo);
    reg.CFOP := pegaValor(query, 'CFOP');
    reg.VL_OPR := pegaValor(query, 'VL_OPR');
    reg.VL_DESC := pegaValor(query, 'VL_DESC') + pegaValor(query, 'VL_ICMS');
    reg.CST_PIS := pegaValor(query, 'CST_PIS');
    reg.VL_BC_PIS := pegaValor(query, 'VL_BC_PIS') - pegaValor(query, 'VL_ICMS');
    reg.ALIQ_PIS := pegaValor(query, 'ALIQ_PIS');
    reg.QUANT_BC_PIS := pegaValor(query, 'QUANT_BC_PIS');
    reg.ALIQ_PIS_QUANT := pegaValor(query, 'ALIQ_PIS_QUANT');
    reg.VL_PIS := pegaValor(query, 'VL_PIS');
    reg.CST_COFINS := pegaValor(query, 'CST_COFINS');
    reg.VL_BC_COFINS := pegaValor(query, 'VL_BC_COFINS') - pegaValor(query, 'VL_ICMS');
    reg.ALIQ_COFINS := pegaValor(query, 'ALIQ_COFINS');
    reg.QUANT_BC_COFINS := pegaValor(query, 'QUANT_BC_COFINS');
    reg.ALIQ_COFINS_QUANT := pegaValor(query, 'ALIQ_COFINS_QUANT');
    reg.VL_COFINS := pegaValor(query, 'VL_COFINS');
    reg.COD_CTA := pegaValor(query, 'COD_CTA');
    reg.INFO_COMPL := pegaValor(query, 'INFO_COMPL');
    reg.grava;
    reg.Free;
    reg := nil;
    query.Next;
  end;
  fechaQuery(query);

end;

procedure TPisCofins.insereApuracaoM100_M500(pRegistro: string;
  pValor, pValBC: double; pCst: string; pAliq: double; pCfop: string;
  pCodNatBCCred: integer; pObs: string; pRetencaoGrasel: boolean = false);
  var codNatRec, i: integer;
  natRec: TVariantMap;
  keys: TVariantKeys;
  wTributado: boolean;
begin
  if wCodIncTrib = 2 then
    exit;

  if ((StrToInt(pCst) in [50, 51, 52, 53, 54, 55, 56, 60, 61, 62, 63, 64, 65, 66]) and ((pRegistro = 'M100') or (pRegistro = 'M500'))) then
  begin
    codNatRec := 0;
    natRec := TVariantMap.Create;
    if pCst = '50' then
    begin
      if (copy(pCfop, 1, 1) <> '3') or (pCfop = '') then //Não é importação
      begin
        if wCodIncTrib = 1 then
        begin
          if pRegistro = 'M100' then // Pis
          begin
            if (FloatToStr(pAliq) = '1,65') or (pRetencaoGrasel) then
              natRec.addValue(codNatRec, 101)
            else
              natRec.addValue(codNatRec, 102);
          end;
          if pRegistro = 'M500' then // Cofins
          begin
            if (FloatToStr(pAliq) = '7,6') or (pRetencaoGrasel) then
              natRec.addValue(codNatRec, 101)
            else
              natRec.addValue(codNatRec, 102);
          end;
        end;
        if wCodIncTrib = 2 then
        begin
          if pRegistro = 'M100' then
          begin
            if FloatToStr(pAliq) = '0,65' then
              natRec.addValue(codNatRec, 101)
            else
              natRec.addValue(codNatRec, 102);
          end;
          if pRegistro = 'M500' then
          begin
            if FloatToStr(pAliq) = '3' then
              natRec.addValue(codNatRec, 101)
            else
              natRec.addValue(codNatRec, 102);
          end;
        end;
      end
      else //Importação
        natRec.addValue(codNatRec, 108);
      Inc(codNatRec);
    end;

    if pCst = '51' then
    begin
      if (copy(pCfop, 1, 1) <> '3') or (pCfop = '') then
      begin
        if wCodIncTrib = 1 then
        begin
          if pRegistro = 'M100' then
          begin
            if FloatToStr(pAliq) = '1,65' then
              natRec.addValue(codNatRec, 201)
            else
              natRec.addValue(codNatRec, 202);
          end;
          if pregistro = 'M500' then
          begin
            if FloatToStr(pAliq) = '7,6' then
              natRec.addValue(codNatRec, 201)
            else
              natRec.addValue(codNatRec, 202);
          end;
        end;
        if wCodIncTrib = 2 then
        begin
          if pRegistro = 'M100' then
          begin
            if FloatToStr(pAliq) = '0,65' then
              natRec.addValue(codNatRec, 201)
            else
              natRec.addValue(codNatRec, 202);
          end;
          if pRegistro = 'M500' then
          begin
            if FloatToStr(pAliq) = '3' then
              natRec.addValue(codNatRec, 201)
            else
              natRec.addValue(codNatRec, 202);
          end;
        end;
      end
      else
        natRec.addValue(codNatRec, 208);
      Inc(codNatRec);
    end;

    if pCst = '52' then
    begin
      if (copy(pCfop, 1, 1) <> '3') or (pCfop = '') then
      begin
        if wCodIncTrib = 1 then
        begin
          if pRegistro = 'M100' then
          begin
            if FloatToStr(pAliq) = '1,65' then
              natRec.addValue(codNatRec, 301)
            else
              natRec.addValue(codNatRec, 302);
          end;
          if pRegistro = 'M500' then
          begin
            if FloatToStr(pAliq) = '7,6' then
              natRec.addValue(codNatRec, 301)
            else
              natRec.addValue(codNatRec, 302);
          end;
        end;
        if wCodIncTrib = 2 then
        begin
          if pRegistro = '100' then
          begin
            if FloatToStr(pAliq) = '0,65' then
              natRec.addValue(codNatRec, 301)
            else
              natRec.addValue(codNatRec, 302);
          end;
          if pRegistro = '500' then
          begin
            if FloatToStr(pAliq) = '3' then
              natRec.addValue(codNatRec, 301)
            else
              natRec.addValue(codNatRec, 302);
          end;
        end;
      end
      else
        natRec.addValue(codNatRec, 308);
      Inc(codNatRec);
    end;

    if (StrToInt(pCst) in [53, 54, 55, 56]) then
    begin
      if pcst = '53' then
      begin
        if (copy(pCfop, 1, 1) <> '3') or (pCfop = '') then
        begin
          if wCodIncTrib = 1 then
          begin
            if pRegistro = 'M100' then
            begin
              if FloatToStr(pAliq) = '1,65' then
              begin
                natRec.addValue(codNatRec, 101);
                Inc(codNatRec);
                natRec.addValue(codNatRec, 201);
              end
              else
              begin
                natRec.addValue(codNatRec, 102);
                Inc(codNatRec);
                natRec.addValue(codNatRec, 202);
              end;
            end;
            if pRegistro = 'M500' then
            begin
              if FloatToStr(pAliq) = '7,6' then
              begin
                natRec.addValue(codNatRec, 101);
                Inc(codNatRec);
                natRec.addValue(codNatRec, 201);
              end
              else
              begin
                natRec.addValue(codNatRec, 102);
                Inc(codNatRec);
                natRec.addValue(codNatRec, 202);
              end;
            end;
          end;
          if wCodIncTrib = 2 then
          begin
            if pRegistro = 'M100' then
            begin
              if FloatToStr(pAliq) = '0,65' then
              begin
                natRec.addValue(codNatRec, 101);
                Inc(codNatRec);
                natRec.addValue(codNatRec, 201);
              end
              else
              begin
                natRec.addValue(codNatRec, 102);
                Inc(codNatRec);
                natRec.addValue(codNatRec, 202);
              end;
            end;
            if pRegistro = 'M500' then
            begin
              if FloatToStr(pAliq) = '3' then
              begin
                natRec.addValue(codNatRec, 101);
                Inc(codNatRec);
                natRec.addValue(codNatRec, 201);
              end
              else
              begin
                natRec.addValue(codNatRec, 102);
                Inc(codNatRec);
                natRec.addValue(codNatRec, 202);
              end;
            end;
          end;
        end
        else
        begin
          natRec.addValue(codNatRec, 108);
          Inc(codNatRec);
          natRec.addValue(codNatRec, 208);
        end;
        Inc(codNatRec);
      end;
      if pCst = '55' then
      begin
        if (copy(pCfop, 1, 1) <> '3') or (pCfop = '') then
        begin
          if wCodIncTrib = 1 then
          begin
            if pRegistro = 'M100' then
            begin
              if FloatToStr(pAliq) = '1,65' then
              begin
                natRec.addValue(codNatRec, 201);
                Inc(codNatRec);
                natRec.addValue(codNatRec, 301);
              end
              else
              begin
                natRec.addValue(codNatRec, 202);
                Inc(codNatRec);
                natRec.addValue(codNatRec, 302);
              end;
            end;
            if pRegistro = 'M500' then
            begin
              if FloatToStr(pAliq) = '7,6' then
              begin
                natRec.addValue(codNatRec, 201);
                Inc(codNatRec);
                natRec.addValue(codNatRec, 301);
              end
              else
              begin
                natRec.addValue(codNatRec, 202);
                Inc(codNatRec);
                natRec.addValue(codNatRec, 302);
              end;
            end;
          end;
          if wCodIncTrib = 2 then
          begin
            if pRegistro = 'M100' then
            begin
              if FloatToStr(pAliq) = '0,65' then
              begin
                natRec.addValue(codNatRec, 201);
                Inc(codNatRec);
                natRec.addValue(codNatRec, 301);
              end
              else
              begin
                natRec.addValue(codNatRec, 202);
                Inc(codNatRec);
                natRec.addValue(codNatRec, 302);
              end;
            end;
            if pRegistro = 'M500' then
            begin
              if FloatToStr(pAliq) = '3' then
              begin
                natRec.addValue(codNatRec, 201);
                Inc(codNatRec);
                natRec.addValue(codNatRec, 301);
              end
              else
              begin
                natRec.addValue(codNatRec, 202);
                Inc(codNatRec);
                natRec.addValue(codNatRec, 302);
              end;
            end;
          end;
        end
        else
        begin
          natRec.addValue(codNatRec, 208);
          Inc(codNatRec);
          natRec.addValue(codNatRec, 308);
        end;
        Inc(codNatRec);
      end;
      if pCst = '56' then
      begin
        if (copy(pCfop, 1, 1) <> '3') or (pCfop = '') then
        begin
          if wCodIncTrib = 1 then
          begin
            if pRegistro = 'M100' then
            begin
              if FloatToStr(pAliq) = '1,65' then
              begin
                natRec.addValue(codNatRec, 101);
                Inc(codNatRec);
                natRec.addValue(codNatRec, 201);
                Inc(codNatRec);
                natRec.addValue(codNatRec, 301);
              end
              else
              begin
                natRec.addValue(codNatRec, 102);
                Inc(codNatRec);
                natRec.addValue(codNatRec, 202);
                Inc(codNatRec);
                natRec.addValue(codNatRec, 302);
              end;
            end;
            if pRegistro = 'M500' then
            begin
              if FloatToStr(pAliq) = '7,6' then
              begin
                natRec.addValue(codNatRec, 101);
                Inc(codNatRec);
                natRec.addValue(codNatRec, 201);
                Inc(codNatRec);
                natRec.addValue(codNatRec, 301);
              end
              else
              begin
                natRec.addValue(codNatRec, 102);
                Inc(codNatRec);
                natRec.addValue(codNatRec, 202);
                Inc(codNatRec);
                natRec.addValue(codNatRec, 302);
              end;
            end;
          end;
          if wCodIncTrib = 2 then
          begin
            if pRegistro = 'M100' then
            begin
              if FloatToStr(pAliq) = '0,65' then
              begin
                natRec.addValue(codNatRec, 101);
                Inc(codNatRec);
                natRec.addValue(codNatRec, 201);
                Inc(codNatRec);
                natRec.addValue(codNatRec, 301);
              end
              else
              begin
                natRec.addValue(codNatRec, 201);
                Inc(codNatRec);
                natRec.addValue(codNatRec, 202);
                Inc(codNatRec);
                natRec.addValue(codNatRec, 302);
              end;
            end;
            if pRegistro = 'M500' then
            begin
              if FloatToStr(pAliq) = '3' then
              begin
                natRec.addValue(codNatRec, 101);
                Inc(codNatRec);
                natRec.addValue(codNatRec, 201);
                Inc(codNatRec);
                natRec.addValue(codNatRec, 301);
              end
              else
              begin
                natRec.addValue(codNatRec, 201);
                Inc(codNatRec);
                natRec.addValue(codNatRec, 202);
                Inc(codNatRec);
                natRec.addValue(codNatRec, 302);
              end;
            end;
          end;
        end
        else
        begin
          natRec.addValue(codNatRec, 108);
          Inc(codNatRec);
          natRec.addValue(codNatRec, 208);
          Inc(codNatRec);
          natRec.addValue(codNatRec, 308);
        end;
      end;
      Inc(codNatRec);
    end;

    if (StrToInt(pCst) in [60, 61, 62, 63, 64, 65, 66]) then
    begin
      MessageDlg('Erro ao gerar apurações (Registro M100).'
        + chr(13) + chr(10)
        + 'CST de Pis referente a crédito presumido.'
        + 'Implementar a apuração conformed escrita no manual do SPED Contribuições.'
        , mtError, [mbOk], 0);
      Exit;
    end;

    keys := natRec.getKeys;
    for i := VarArrayLowBound(keys.keys, 1) to VarArrayHighBound(keys.keys, 1) do
    begin
      Inc(wCodReg);
      if copy(natRec.getValue(i), 1, 1) = '1' then
        wTributado := true;
      if copy(natRec.getValue(i), 1, 1) = '2' then
        wTributado := false;
      if copy(natRec.getValue(i), 1, 1) = '3' then
        wTributado := true;

      with DMSped do
      begin
        QInsSpedApuracao.Close;
        QInsSpedApuracao.SetVariable('COD_REGISTRO', wCodReg);
        QInsSpedApuracao.SetVariable('DESC_REGISTRO', pRegistro);
        if pRegistro = 'M100' then
          QInsSpedApuracao.SetVariable('COD_CST_PIS', pCst)
        else
          QInsSpedApuracao.SetVariable('COD_CST_COFINS', pCst);
        QInsSpedApuracao.SetVariable('COD_NATUREZA_RECEITA', natRec.getValue(i));
        QInsSpedApuracao.SetVariable('COD_CTA', null);
        QInsSpedApuracao.SetVariable('PERC_ALIQUOTA', pAliq);
        QInsSpedApuracao.SetVariable('VAL_BC', pValBC);
        if wTributado then
        begin
          //QInsSpedApuracao.SetVariable('VAL_BC', pValBC);
          QInsSpedApuracao.SetVariable('VAL_REGISTRO', pValor);
        end
        else
        begin
          //QInsSpedApuracao.SetVariable('VAL_BC', 0);
          QInsSpedApuracao.SetVariable('VAL_REGISTRO', 0);
        end;
        QInsSpedApuracao.SetVariable('COD_NAT_BC_CRED', pCodNatBCCred);
        QInsSpedApuracao.SetVariable('DESC_OBS', pObs);
        try
          QInsSpedApuracao.ExecSQL;
          QInsSpedApuracao.Close;
        except
          DMOracle.DBCemapa.Rollback;
          MessageDlg('Erro na gravação das apurações.', mtError, [mbOK], 0);
          Abort;
        end;
      end;
    end;
    natRec.Clear;
    natRec := nil;
    keys.Free;
    keys := nil;
  end;
end;

procedure TPisCofins.mostraApuracao(registro: string);
  var tela: TFMostraDRE;
  dados: TDataSource;
begin
  with DmSped, DmPisCofinsM do
  begin
    if Pos(registro, 'M100 M200 M500 M600') > 0 then
    begin
      QApuracaoPisNatCons.Close;
      QApuracaoPisNatCons.SetVariable('REGISTRO', registro);
      QApuracaoPisNatCons.Open;
    end;
    if Pos(registro, 'M105') > 0 then
    begin
      QReg105.Close;
      QReg105.SetVariable('REGISTRO', 'M100');
      QReg105.Open;
    end;
    {if (not QApuracaoPisNatCons.IsEmpty) or (not QReg105.Eof) then
    begin
      tela := TFMostraDRE.Create(Application);
      dados := TDataSource.Create(Application);
      if Pos(registro, 'M100 M200 M500 M600') > 0 then
        dados.DataSet := QApuracaoPisNatCons;
      if Pos(registro, 'M105') > 0 then
        dados.DataSet := QReg105;
      tela.DBGrid1.DataSource := dados;
      tela.ShowModal;
      tela.Free;
      tela := Nil;
    end;}
  end;
end;

procedure TPisCofins.insereApuracaoM200_M600(pRegistro: string; pValor,
  pValBC: double; pCst: string; pAliq, pValRecBruta: double);
var
  wCodCont: integer;
begin
  if (pRegistro = 'M200') or (pRegistro = 'M600') then
  begin
    if wCodIncTrib = 1 then // Regime não cumulativo
    begin
      if pRegistro = 'M200' then
        if FloatToStr(pAliq) = '1,65' then
          wCodCont := 01
        else
          wCodCont := 02
      else
        if FloatToStr(pAliq) = '7,6' then
          wCodCont := 01
        else
          wCodCont := 02;
    end
    else
    begin
      if pRegistro = 'M200' then
        if FloatToStr(pAliq) = '0,65' then
          wCodCont := 51
        else
          wCodCont := 52
      else
        if FloatToStr(pAliq) = '3' then
          wCodCont := 51
        else
          wCodCont := 52
    end;
    with DMSped do
    begin
      Inc(wCodReg);
      QInsSpedApuracao.Close;
      QInsSpedApuracao.SetVariable('COD_REGISTRO', wCodReg);
      QInsSpedApuracao.SetVariable('DESC_REGISTRO', pRegistro);
      QInsSpedApuracao.SetVariable('COD_CST_PIS', pCst);
      QInsSpedApuracao.SetVariable('COD_CST_COFINS', pCst);
      QInsSpedApuracao.SetVariable('COD_NATUREZA_RECEITA', null);
      QInsSpedApuracao.SetVariable('COD_CTA', null);
      QInsSpedApuracao.SetVariable('PERC_ALIQUOTA', pAliq);
      QInsSpedApuracao.SetVariable('VAL_BC', pValBC);
      QInsSpedApuracao.SetVariable('VAL_REGISTRO', pValor);
      QInsSpedApuracao.SetVariable('COD_CONT', wCodCont);
      QInsSpedApuracao.SetVariable('VAL_RECEITA_BRUTA', pValRecBruta);
      try
        QInsSpedApuracao.ExecSQL;
        QInsSpedApuracao.Close;
      except
        DMOracle.DBCemapa.Rollback;
        MessageDlg('Erro na gravação das apurações.', mtError, [mbOK], 0);
        Abort;
      end;
    end;
  end;
end;

end.
