unit UFCont;

interface

uses
  Controls, SysUtils, Windows, Forms, UThreadLocal, OraTeste, UBiblioteca,
  Classes,

  Arquivo,
  FCont0000,
  FContI001, FContI050, FContI051, FContI075, FContI100,
  FContI150, FContI155, FContI156, FContI200, FContI250,
  FContI256, FContI350, FContI355, FContI356, FContI990,
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
    procedure FContI155;
    procedure FContI200;
    procedure FContI250;
    procedure FContI350;
    procedure FContI355;
    procedure FContI356(pCodPCR: Integer);
    procedure FContI990(QtdLinhas: Double);
    procedure FContJ001;
    procedure FContJ930;
    procedure FContJ990(QtdLinhas: Double);
    procedure FContM001;
    procedure FContM020;
    procedure FContM025;
    procedure FContM030;
    procedure FContM990(QtdLinhas: Double);
    procedure FCont9999(QtdLinhas: Double);
    procedure GeraDatas;
    procedure CatalogaLanctoEncerramento;
    procedure Teste;
    function BuscaLancamento(pCodLanctoContabil: Integer): String;
    procedure AdicionaLancamento(pCodLanctoContabil: Integer;
  pTipoLancamentoSped: String; pOperacao: String; pValor: Double);
    procedure AdicionaEncerramento(pNumConta: String;
      pValLancamento: Double; pOperacao: String);
  public
    thread: TThreadLocal;
    procedure Gerar;
    constructor Create(DataIni, DataFin: TDate; Filiais: TStrings; wMatriz: Integer = 1);
  end;

implementation

uses UOracle_cl, DB, UFuncoes, Registro, Dialogs, USped_cl, Variants,
  OracleData, DateUtils, UFCont0_cl, UFilial_cl, UFContI_cl, UFContJ_cl,
  UFContM_cl, UGeraSPED;

var wTeste: Variant;
  wPartidaLanctos: TVariantMap;

constructor TFCont.Create(DataIni, DataFin: TDate; Filiais: TStrings; wMatriz: Integer = 1);
begin
  if wMatriz = 0 then
    wFilial := 1
  else
    wFilial := wMatriz;
  wDataIni := DataIni;
  wDataFin := DataFin;
  wFiliais := Filiais;
  wPartidaLanctos := TVariantMap.Create;
  inherited Create;
end;

procedure TFCont.Execute;
var
  path: string;
begin
  thread.mostramensagem('Inicializando geração');
  Application.ProcessMessages;
  path := ExtractFilePath(Application.ExeName);
  if not DirectoryExists(path + 'SPED') then
    CreateDir(path + 'SPED');
  if not DirectoryExists(path + 'SPED\FCONT') then
    CreateDir(path + 'SPED\FCONT');
  arquivo := TArquivo.Create(path + 'SPED\FCONT\SPED-FCONT_gerado_em_' + FormatDateTime('yyyy-MM-dd_hh-mm-ss', Date + Time) + '_competencia_' + FormatDateTime('yyyy-MM-dd', wDataIni) + '_' + FormatDateTime('yyyy-MM-dd', wDataFin) + '_filiais_' + geraStringFiliais('-') + '.txt');

  FCont0000;
  FCont9999(0);

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
    Application.ProcessMessages;
    if StrToInt(DMOracle.FastSelect('COUNT(*)', 'TB_FCONT_LANC_EXTEMPORANEO')) > 0 then
      MessageDlg('Uma configuração de lançamentos extemporâneos foi adicionada ao sistema.'+#13#10+
        'Para não considerar lançamentos de períodos anteriores comunique a CEMAPA.',
        mtInformation, [mbOk], 0);
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
  query := executaQuery(DmFCont0.QReg000);
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
  FContI990(0);
  FContJ001;
  FContJ990(0);
  FContM001;
  FContM990(0);
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
  FContI150;
  FContI200;
  FContI350;


  end;

procedure TFCont.FContI050;
var reg: TFContI050;
  query: TOracleDataSet1;
  super, indConta: string;
begin
  query := executaQuery(DmFContI.QReg050);
  query.SetVariable('DT_INI', DateToStr(wDataIni));
  indConta := DateToStr(wDataIni);
//  query.SetVariable(':DT_FIN', wDataFin);
  query.SetVariable('FILIAIS', Bib.geraStringFiliais(wFiliais));
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
  query.SetVariable('COD_PLANO_CONTA', codPlanoConta);
  if not abreQuery(query) then Exit;

  if eNulo(query, 'NUM_PLANO_CONTA_REFERENCIAL') then
    numPlanoContaReferencial := ''
  else
    numPlanoContaReferencial := pegaValor(query, 'NUM_PLANO_CONTA_REFERENCIAL');
  {contaLendo := codPlanoConta;
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
  end;}

  if numPlanoContaReferencial = '' then
  begin
    fechaQuery(query);
    Exit;
  end;

  reg := TFContI051.Create(TObject(Self), arquivo);
  reg.COD_ENT_REF := '10';
  reg.COD_CCUS := '';
  reg.COD_CTA_REF := numPlanoContaReferencial;
  reg.grava;
  reg.Free;
  reg := nil;
  fechaQuery(query);
end;

procedure TFCont.FContI075;
var reg: TFContI075;
query: TOracleDataSet1;
begin
  query := executaQuery(DmFContI.QReg075);
  query.SetVariable(':DT_INI', wDataIni);
  query.SetVariable(':DT_FIN', wDataFin);
  query.SetVariable(':FILIAIS', Bib.geraStringFiliais(wFiliais));
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

  //for i := mesIni to mesFin do
  //begin
    reg := TFContI150.Create(TObject(Self), arquivo);

    //Bib.PriUltDataVar(dataIniAux, dataFinAux, True, StrToDate('01/' + FormatFloat('00', i) + '/' + FormatFloat('0000', anoIni)));

    //reg.DT_INI := dataIniAux;
    //reg.DT_FIN := dataFinAux;
    reg.DT_INI := wDataIni;
    reg.DT_FIN := wDataFin;
    reg.grava;
    reg.Free;
    reg := nil;

    //FContI155(dataIniAux);
    FContI155;
  //end;
end;

procedure TFCont.FContI155;
var reg: TFContI155;
  AnoMesIni,AnoMesFin: Integer;
  dia, mes, ano: Word;
begin
  DecodeDate(wDataIni, ano, mes, dia);
  AnoMesIni := StrToInt(IntToStr(ano) + FormatFloat('00', mes));
  DecodeDate(wDataFin, ano, mes, dia);
  AnoMesFin := StrToInt(IntToStr(ano) + FormatFloat('00', mes));
  query := executaQuery(DmFContI.QReg155);
  query.SetVariable('FILIAIS', Bib.geraStringFiliais(wFiliais));
  query.SetVariable('DT_ANO_MES_INI', AnoMesIni);
  query.SetVariable('DT_ANO_MES_FIN', AnoMesFin);
  query.open;

  if not abreQuery(query) then Exit;

  query.First;
  while not query.Eof do
  begin
    reg := TFContI155.Create(TObject(Self), arquivo);
    reg.COD_CTA := pegaValor(query, 'NUM_PLANO_CONTA');
    reg.COD_CCUS := '';
    reg.IND_DC_INI := pegaValor(query,'IND_DC_INI');
    reg.VL_SLD_INI := ABS(pegaValor(query, 'VL_SLD_INI'));
    reg.VL_DEB := pegaValor(query, 'VAL_DEBITO');
    reg.VL_CRED := pegaValor(query, 'VAL_CREDITO');
    reg.IND_DC_FIN := pegaValor(query, 'IND_DC_FIN');
    reg.VL_SLD_FIN := pegaValor(query, 'VL_SLD_FIN');
    reg.grava;
    reg.Free;
    reg := nil;
    query.Next;
  end;

  fechaQuery(query);
end;

procedure TFCont.GeraDatas;
var wMesIni, wMesFin, i: Integer;
  wInicio,wFim: String;
begin

  with DMFContI, DMFContI.CDSDatas do
  begin
    QLancExtemporaneo.Close;
    QLancExtemporaneo.Open;
    QLancExtemporaneo.Append;
    QLancExtemporaneoDT_INI.Value := wDataIni;
    QLancExtemporaneoDT_FIN.Value := wDataFin;
    QLancExtemporaneo.Post;
    QLancExtemporaneo.First;
    DmFContI.CDSDatas.EmptyDataSet;
    while not QLancExtemporaneo.Eof do
    begin
      wMesIni := StrToInt(copy(QLancExtemporaneoDT_INI.Text,4,2));
      wMesFin := StrToInt(copy(QLancExtemporaneoDT_FIN.Text,4,2));
      for i:=wMesIni to wMesFin do
      begin
        if i = wMesIni then
          wInicio := QLancExtemporaneoDT_INI.Text
        else
          wInicio := '01'+Format('/%.2d/',[i])+
            copy(QLancExtemporaneoDT_INI.Text,7,4);
        if i = wMesFin then
          wFim := QLancExtemporaneoDT_FIN.Text
        else
          wFim := DMOracle.FastSelect('LAST_DAY(' +
            quotedStr(wInicio)+')','DUAL');
        Append;
        DmFContI.CDSDatasDT_INI.Text := wInicio;
        DmFContI.CDSDatasDT_FIN.Text := wFim;
        DmFContI.CDSDatasCOD_HISTORICO_CONTABIL.Value :=
          QLancExtemporaneoCOD_HISTORICO_CONTABIL.Value;
        Post;
      end;
      QLancExtemporaneo.Next;
    end;
  end;
end;

procedure TFCont.AdicionaEncerramento(pNumConta: String;
  pValLancamento: Double; pOperacao: String);
var wValor: Double;
begin
  with DMFContI.CDSEncerramento do
  begin
    First;
    while not Eof do
    begin
      if pOperacao = 'C' then
        wValor := pValLancamento * -1
      else
        wValor := pValLancamento;
      if DMFContI.CDSEncerramentoNUM_PLANO_CONTA.Value = pNumConta then
      begin
        Edit;
        DmFContI.CDSEncerramentoVAL_LANCAMENTO.Value :=
          DmFContI.CDSEncerramentoVAL_LANCAMENTO.Value + wValor;
        Post;
        Exit;
      end;
      Next;
    end;

    Append;
    DmFContI.CDSEncerramentoNUM_PLANO_CONTA.Value := pNumConta;
    DmFContI.CDSEncerramentoVAL_LANCAMENTO.Value := wValor;
    Post;
    
  end;
end;


procedure TFcont.CatalogaLanctoEncerramento;
var dia,mes,ano,diaLanc,mesLanc,anoLanc: word;
begin
  with DMFContI do
  begin
    query.First;
    decodeDate(wDataFin,ano,mes,dia);
    decodeDate(pegaValor(query,'DT_LANCAMENTO'),anoLanc,mesLanc,diaLanc);
    if mes <> mesLanc then
      Exit;

    while not query.Eof do
    begin
      if (pegaValor(query,'IND_LANCAMENTO') = 'E') and
       (pegaValor(query,'DESC_NATUREZA_CONTA') = '04') then
      begin
        AdicionaEncerramento(pegaValor(query,'NUM_PLANO_CONTA'),
          pegaValor(query,'VAL_LANCAMENTO'),
          pegaValor(query,'IND_OPERACAO'));
      end;
      query.Next;
    end;
    query.First;
  end;
end;

function TFCont.BuscaLancamento(pCodLanctoContabil: Integer): String;
begin
  Result := '';
  with DMFContI.CDSPartida do
  begin
    First;
    while not Eof do
    begin
      if DmFContI.CDSPartidaCOD_LANCTO_CONTABIL.Value = pCodLanctoContabil then
      begin
        Result := DmFContI.CDSPartidaIND_TIPO_LANCAMENTO_SPED.Value;
        Exit;
      end;
      Next;
    end;
  end;
end;

procedure TFCont.AdicionaLancamento(pCodLanctoContabil: Integer;
  pTipoLancamentoSped: String; pOperacao: String; pValor: Double);
begin
  with DMFContI.CDSPartida do
  begin
    First;

    while not Eof do
    begin
      if DMFContI.CDSPartidaCOD_LANCTO_CONTABIL.Value = pCodLanctoContabil then
      begin
        Edit;
        if pTipoLancamentoSped <> 'VALOR' then
          DMFContI.CDSPartidaIND_TIPO_LANCAMENTO_SPED.Value :=
            pTipoLancamentoSped;

        if (pTipoLancamentoSped = 'VALOR') and (pOperacao = 'C') then
          DMFContI.CDSPartidaVAL_LANCAMENTO.Value :=
            DMFContI.CDSPartidaVAL_LANCAMENTO.Value + pValor;

        Post;
        Exit;
      end;
      Next;
    end;

    Append;
    DMFContI.CDSPartidaCOD_LANCTO_CONTABIL.Value := pCodLanctoContabil;
    DMFContI.CDSPartidaIND_TIPO_LANCAMENTO_SPED.Value := pTipoLancamentoSped;
    Post;

  end;
end;

procedure TFCont.Teste;
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
  DmFContI.CDSPartida.EmptyDataSet;
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

      if ((pegaValor(query,'COD_LANCTO_CONTABIL') = 398411) or
       (pegaValor(query,'COD_LANCTO_CONTABIL') = 398412)) then
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

procedure TFCont.FContI200;
var reg: TFContI200;
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
  DmFContI.CDSDatas.First;
  DmFContI.CDSEncerramento.EmptyDataSet;

  while not DmFContI.CDSDatas.Eof do
  begin
    query := executaQuery(DmFContI.QReg200);

    if Bib.geraStringFiliais(wFiliais) <> '' then
      query.SetVariable('FILIAIS', Bib.geraStringFiliais(wFiliais))
    else
      query.SetVariable('FILIAIS', '(SELECT COD_FILIAL FROM TB_FILIAL)');
    query.SetVariable('DATA_INI', DmFContI.CDSDatasDT_INI.Value);
    query.SetVariable('DATA_FIN', DmFContI.CDSDatasDT_FIN.Value);
    query.open;

    if query.IsEmpty then
    begin
      fechaQuery(query);
      DmFContI.CDSDatas.Next;
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
      reg := TFContI200.Create(TObject(Self), arquivo);
      reg.NUM_LCTO := IntToStr(pegaValor(query, 'COD_LANCTO_CONTABIL'));
      reg.DT_LCTO := pegaValor(query, 'DT_LANCAMENTO');
      if (reg.DT_LCTO < wDataIni) or (reg.DT_LCTO > wDataFin) then
        reg.DT_LCTO := wDataIni;
      reg.VL_LCTO := DmFContI.CDSPartidaVAL_LANCAMENTO.Value;
      reg.IND_LCTO := pegaValor(query, 'IND_LANCAMENTO');
      reg.grava;
      reg.Free;
      reg := Nil;
      FContI250;
    end;
    fechaQuery(query);
    DmFContI.CDSDatas.Next;
  end;
  //ShowMessage(wTeste);
end;

procedure TFCont.FContI250;
var reg: TFContI250;
begin
  with DmFContI do
  begin
    reg := TFContI250.Create(TObject(Self), arquivo);
    reg.COD_CTA := pegaValor(query, 'NUM_PLANO_CONTA');
    reg.COD_CCUS := '';
    if pegaValor(query, 'VAL_LANCAMENTO') >= 0 then
      reg.VL_DC := pegaValor(query, 'VAL_LANCAMENTO')
    else
      reg.VL_DC := pegaValor(query, 'VAL_LANCAMENTO') * -1;
    reg.IND_DC := pegaValor(query, 'IND_OPERACAO');
    reg.NUM_ARQ := '';
    if CDSDatasCOD_HISTORICO_CONTABIL.Value > 0 then
      reg.COD_HIST_PAD := CDSDatasCOD_HISTORICO_CONTABIL.Text
    else
      reg.COD_HIST_PAD := IntToStr(pegaValor(query, 'COD_HISTORICO_CONTABIL'));
    if CDSDatasCOD_HISTORICO_CONTABIL.Value > 0 then
      reg.HIST := DMOracle.FastSelect('DESC_HISTORICO_CONTABIL',
        'TB_HISTORICO_CONTABIL','COD_HISTORICO_CONTABIL = '+
        CDSDatasCOD_HISTORICO_CONTABIL.Text,true)
    else
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
        reg := TFContI250.Create(TObject(Self), arquivo);
        reg.COD_CTA := pegaValor(query, 'NUM_PLANO_CONTA');
        reg.COD_CCUS := '';
        if pegaValor(query, 'VAL_LANCAMENTO') >= 0 then
          reg.VL_DC := pegaValor(query, 'VAL_LANCAMENTO')
        else
          reg.VL_DC := pegaValor(query, 'VAL_LANCAMENTO') * -1;
        reg.IND_DC := pegaValor(query, 'IND_OPERACAO');
        reg.NUM_ARQ := '';
        if CDSDatasCOD_HISTORICO_CONTABIL.Value > 0 then
          reg.COD_HIST_PAD := CDSDatasCOD_HISTORICO_CONTABIL.Text
        else
          reg.COD_HIST_PAD := IntToStr(pegaValor(query, 'COD_HISTORICO_CONTABIL'));
        if CDSDatasCOD_HISTORICO_CONTABIL.Value > 0 then
          reg.HIST := DMOracle.FastSelect('DESC_HISTORICO_CONTABIL',
            'TB_HISTORICO_CONTABIL','COD_HISTORICO_CONTABIL = '+
            CDSDatasCOD_HISTORICO_CONTABIL.Text,true)
        else
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
end;

procedure TFCont.FContI350;
var reg: TFContI350;
begin
  reg := TFContI350.Create(TObject(Self), arquivo);
  reg.DT_RES := wDataFin;
  reg.grava;
  reg.Free;
  reg := nil;
  FContI355;
end;

procedure TFCont.FContI355;
var reg: TFContI355;
query: TOracleDataSet1;
wDia, wMes, wAno: Word;
wAnoMes: string;
begin

  query := executaQuery(DmFContI.QReg355);
  DecodeDate(wDataFin, wAno, wMes, wDia);
  wAnoMes := IntToStr(wAno) + IntToStr(wMes);
  query.SetVariable('DT_ANO_MES', wAnoMes);
  query.SetVariable('FILIAIS', bib.geraStringFiliais(wFiliais));
  //query.SetVariable('DT_INI', wDataIni);
  //query.SetVariable('DT_FIN', wDataFin);
  if not abreQuery(query) then exit;

  while not query.Eof do
  begin
    reg := TFContI355.Create(TObject(Self), arquivo);
    reg.COD_CTA := pegaValor(query, 'NUM_PLANO_CONTA');
    reg.VL_CTA := pegaValor(query, 'VAL_ATUAL');
    reg.IND_DC := pegaValor(query, 'IND_DC');
    //FContI356(pegaValor(query, 'COD_PLANO_CONTA'));
    query.Next;
    reg.grava;
    reg.Free;
    reg := nil;
  end;
  fechaQuery(query);
end;

procedure TFCont.FContI356(pCodPCR: Integer);
var reg: TFContI356;
query: TOracleDataSet1;
begin
  query := executaQuery(DmFContI.QReg356);
  query.SetVariable('COD_PCR', pCodPCR);
  if not abreQuery(query) then exit;

  while not query.Eof do
  begin
    reg := TFContI356.Create(TObject(Self), arquivo);
    reg.COD_CTA_REF := StringReplace(pegaValor(query, 'COD_CTA_REF'),'.','',
      [rfIgnoreCase]);
    reg.VL_CTA := pegaValor(query, 'VL_CTA');
    reg.IND_DC := pegaValor(query, 'IND_DC');
    query.Next;
    reg.grava;
    reg.Free;
    reg := nil;
  end;
  fechaQuery(query);
end;

procedure TFCont.FContI990(QtdLinhas: Double);
var reg: TFContI990;
begin
  reg := TFContI990.Create(TObject(Self), arquivo);
  reg.QTD_LIN_I := QtdLinhas;
  reg.grava;
  reg.Free;
  reg := nil;
end;

procedure TFCont.FContJ001;
var reg: TFContJ001;
begin
  reg := TFContJ001.Create(TObject(Self), arquivo);
  reg.IND_DAD := 1;
  reg.grava;
  reg.Free;
  reg := nil;
  FContJ930;
end;

procedure TFCont.FContJ930;
var reg: TFContJ930;
query: TOracleDataSet1;
begin
  query := executaQuery(DMFcontJ.QReg930);
  query.SetVariable('FILIAL', wFilial);
  if not abreQuery(query) then exit;
  while(not query.Eof) do
  begin
    reg := TFContJ930.Create(TObject(Self), arquivo);
    reg.IDENT_NOM := pegaValor(query, 'IDENT_NOM');
    reg.IDENT_CPF_CNPJ := pegaValor(query, 'IDENT_CPF_CNPJ');
    reg.IDENT_QUALIF := pegaValor(query, 'IDENT_QUALIF');
    reg.COD_ASSIN := pegaValor(query, 'COD_ASSIN');
    reg.IND_CRC := pegaValor(query, 'IND_CRC');
    reg.grava;
    reg.Free;
    reg := Nil;
    query.Next;
  end;
  fechaQuery(query);
end;

procedure TFCont.FContJ990(QtdLinhas: Double);
var reg: TFContJ990;
begin
  reg := TFContJ990.Create(TObject(Self), arquivo);
  reg.QTD_LIN_J := QtdLinhas;
  reg.grava;
  reg.Free;
  reg := nil;
end;

procedure TFCont.FContM001;
var reg: TFContM001;
begin
  reg := TFContM001.Create(TObject(Self), arquivo);
  reg.IND_DAD := 1;
  reg.grava;
  reg.Free;
  reg := nil;
  FContM020;
  FContM025;
  FContM030;
end;

procedure TFCont.FContM020;
var reg: TFContM020;
query: TOracleDataSet1;
begin

  query := executaQuery(DMFContM.QReg020);
  query.Open;
  if not abreQuery(query) then exit;
  while not query.Eof do
  begin
    reg := TFContM020.Create(TObject(Self), arquivo);
    reg.QUALI_PJ := pegaValor(query, 'QUALI_PJ');
    reg.FORM_APUR := pegaValor(query, 'FORM_APUR');
    reg.FORM_TRIBUT := pegaValor(query, 'FORM_TRIBUT');
    reg.TIPO_ESCRIT := FGeraSped.TipoFCont;
    reg.NRO_REC_ANTERIOR := FGeraSped.RecAntFCont;
    reg.grava;
    reg.Free;
    reg := nil;
    query.Next;
  end;
  fechaQuery(query);
end;

procedure TFCont.FContM025;
var reg: TFContM025;
  query: TOracleDataSet1;
  wDia, wMes, wAno: Word;
begin
  query := executaQuery(DmFContM.QReg025);
  DecodeDate(wDataIni,wAno,wMes,wDia);
  query.SetVariable('FILIAIS', bib.geraStringFiliais(wFiliais));
  query.SetVariable('DT_ANO_MES', IntToStr(wAno) + FormatFloat('00',wMes));
  if not abreQuery(query) then exit;
  while not query.Eof do
  begin
    reg := TFContM025.Create(TObject(Self), arquivo);
    reg.COD_CTA := pegaValor(query, 'COD_CTA');
    reg.COD_CCUS := pegaValor(query, 'COD_CCUS');
    reg.COD_CTA_REF := pegaValor(query, 'COD_CTA_REF');
    reg.VL_SLD_FIN_FC := ABS(pegaValor(query, 'VL_SLD_FIN_FC'));
    reg.IND_DC_FIN_FC := pegaValor(query, 'IND_DC_FIN_FC');
    reg.VL_SLD_FIN_SOC := ABS(pegaValor(query, 'VL_SLD_FIN_SOC'));
    reg.IND_DC_FIN_SOC := pegaValor(query, 'IND_DC_FIN_SOC');
    reg.grava;
    reg.Free;
    reg := Nil;
    query.Next;
// Comentado por Djeison - 23/01/2014
//    FContM030;
  end;
  fechaQuery(query);
end;

procedure TFCont.FContM030;
var reg: TFContM030;
  query: TOracleDataSet1;
  wDia, wMes, wAno: Word;
begin
  query := executaQuery(DmFContM.QReg030);
  
  DecodeDate(wDataIni, wAno, wMes, wDia);
  query.SetVariable('DT_INI', IntToStr(wDia) + '/' + IntToStr(wMes) + '/' + IntToStr(wAno));
  DecodeDate(wDataFin, wAno, wMes, wDia);
  query.SetVariable('DT_FIN', IntToStr(wDia) + '/' + IntToStr(wMes) + '/' + IntToStr(wAno));
  query.SetVariable('FILIAIS', bib.geraStringFiliais(wFiliais));
  //query.SetVariable('DT_ANO', IntToStr(wAno));
  query.SetVariable('DT_ANO_MES', IntToStr(wAno) + IntToStr(wMes));

  if not abreQuery(query) then exit;
  while not query.Eof do
  begin
    reg := TFContM030.Create(TObject(Self), arquivo);
    reg.IND_PER := pegaValor(query, 'IND_PER');
    reg.VL_LUC_LIQ := pegaValor(query, 'VL_LUC_LIQ');
    reg.IND_LUC_LIQ := pegaValor(query, 'IND_LUC_LIQ');
    reg.grava;
    reg.Free;
    reg := Nil;
    query.Next;
  end;
  fechaQuery(query);
end;

procedure TFCont.FContM990(QtdLinhas: Double);
var reg: TFContM990;
begin
  reg := TFContM990.Create(TObject(Self), arquivo);
  reg.QTD_LIN_M := QtdLinhas;
  reg.grava;
  reg.Free;
  reg := nil;
end;

procedure TFCont.FCont9999(QtdLinhas: Double);
var
  reg: TFCont9999;
begin
  reg := TFCont9999.Create(TObject(Self), arquivo);
  reg.QTD_LIN := QtdLinhas;
  reg.grava;
  reg.Free;
  reg := nil;
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
  //fechaQuery(query1);  não está sendo gerado bloco 9

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
  query.First;

  while not query.Eof do
  begin
    query1 := executaQuery(DmSped.QContaRegistro);
    query1.SetVariable('DESC_BLOCO', copy(recuperaValor(pegaValor(query, 'DESC_CONTEUDO'), 2), 1, 1));
    query1.SetVariable('DESC_REGISTRO', copy(recuperaValor(pegaValor(query, 'DESC_CONTEUDO'), 2), 2, 3));
    query1.Open;
      DmSped.QContaRegistro.Close;
      DmSped.QContaRegistro.SetVariable('DESC_BLOCO', copy(recuperaValor(DmSped.QProcuraRegistroDESC_CONTEUDO.Value, 2), 1, 1));
      DmSped.QContaRegistro.SetVariable('DESC_REGISTRO', copy(recuperaValor(DmSped.QProcuraRegistroDESC_CONTEUDO.Value, 2), 2, 3));
      DmSped.QContaRegistro.open;
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

