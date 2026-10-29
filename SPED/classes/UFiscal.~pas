
unit UFiscal;

interface

uses
  Controls, SysUtils, Windows, Classes, ComCtrls, Forms, UThreadLocal, Variants,
  DateUtils,
  Arquivo,
  Registro0000, Registro0001, Registro0002, Registro0005, Registro0015,
  Registro0100, Registro0150, Registro0175, Registro0190, Registro0200,
  Registro0205, Registro0206, Registro0210, Registro0220, Registro0221,
  Registro0400, Registro0450, Registro0460, Registro0990, RegistroB001,
  RegistroB990, RegistroC001, RegistroC100, RegistroC110, RegistroC111,
  RegistroC112,
  RegistroC113, RegistroC114, RegistroC115, RegistroC120, RegistroC130,
  RegistroC140, RegistroC141, RegistroC160, RegistroC165, RegistroC170,
  RegistroC171, RegistroC172, RegistroC173, RegistroC174, RegistroC175,
  RegistroC176, RegistroC177, RegistroC178, RegistroC179, RegistroC190,
  RegistroC195, RegistroC197, RegistroC300, RegistroC310, RegistroC320,
  RegistroC321, RegistroC400, RegistroC405, RegistroC410, RegistroC420,
  RegistroC425, RegistroC460, RegistroC470, RegistroC490, RegistroC495,
  RegistroC500, RegistroC510, RegistroC590, RegistroC600, RegistroC601,
  RegistroC610, RegistroC690, RegistroC700, RegistroC790, RegistroC791,
  RegistroC990,
  RegistroD001, RegistroD100, RegistroD110, RegistroD120, RegistroD130,
  RegistroD140, RegistroD150, RegistroD160, RegistroD161, RegistroD170,
  RegistroD180, RegistroD190, RegistroD300, RegistroD301, RegistroD310,
  RegistroD350, RegistroD355, RegistroD360, RegistroD365, RegistroD370,
  RegistroD390, RegistroD400, RegistroD410, RegistroD411, RegistroD420,
  RegistroD500, RegistroD510, RegistroD530, RegistroD590, RegistroD600,
  RegistroD610, RegistroD690, RegistroD695, RegistroD696, RegistroD697,
  RegistroD990,
  RegistroE001, RegistroE100, RegistroE110, RegistroE111, RegistroE112,
  RegistroE113, RegistroE115, RegistroE116, RegistroE200, RegistroE210,
  RegistroE220, RegistroE230, RegistroE240, RegistroE250, RegistroE500,
  RegistroE510, RegistroE520, RegistroE530, RegistroE990, RegistroE531,
  RegistroG001, RegistroG110, RegistroG125, RegistroG130, RegistroG140,
  RegistroG990,
  RegistroH001, RegistroH005, RegistroH010, RegistroH020, RegistroH990,
  RegistroK001, RegistroK010, RegistroK100, RegistroK200, RegistroK220,
  RegistroK230,
  RegistroK235, RegistroK250, RegistroK255, RegistroK280, RegistroK990,
  Registro1001, Registro1010, Registro1100, Registro1105, Registro1110,
  Registro1200, Registro1210, Registro1300, Registro1310, Registro1320,
  Registro1400, Registro1990,
  Registro9001, Registro9900, Registro9990, Registro9999;

type
  TFiscal = class
  private
    wFilial: Integer;
    wDataIni, wDataFin: TDate;
    wFinalidade: Integer;
    arquivo: TArquivo;

    wDesconto, wDescontoRateado, wValNota: Extended; //Gambiarra

    procedure Registro0000;
    procedure Registro0001;
    procedure Registro0002;
    procedure Registro0005;
    procedure Registro0015;
    procedure Registro0100;
    procedure Registro0150;
    procedure Registro0175(codCadastro: Integer);
    procedure Registro0190;
    procedure Registro0200;
    procedure Registro0210(codProduto: integer);
    procedure Registro0205;
    procedure Registro0206;
    procedure Registro0220;
    procedure Registro0221(codProduto: integer);    
    procedure Registro0400;
    procedure Registro0450;
    procedure Registro0460;
    procedure Registro0990(QtdLinhas: Double);

    procedure RegistroB001;
    procedure RegistroB990(QtdLinhas: Double);

    procedure RegistroC001;
    procedure RegistroC100;
    procedure RegistroC110(notaCab: Integer);
    procedure RegistroC111(notaCab: Integer);
    procedure RegistroC112(notaCab: Integer);
    procedure RegistroC113(notaCab: Integer);
    procedure RegistroC114(notaCab: Integer);
    procedure RegistroC115(notaCab: Integer);
    procedure RegistroC120(notaCab: Integer);
    procedure RegistroC130(notaCab: Integer);
    procedure RegistroC140(notaCab: Integer);
    procedure RegistroC141(notaCab: Integer);
    procedure RegistroC160(notaCab: Integer);
    procedure RegistroC165(notaCab: Integer);
    procedure RegistroC170(notaCab: Integer);
    procedure RegistroC171(notaCab: Integer);
    procedure RegistroC172(notaCab: Integer);
    procedure RegistroC173(notaCab: Integer);
    procedure RegistroC174(notaCab: Integer);
    procedure RegistroC175(notaCab: Integer);
    procedure RegistroC176(notaCab: Integer);
    procedure RegistroC177(notaCab: Integer);
    procedure RegistroC178(notaCab: Integer);
    procedure RegistroC179(notaCab: Integer);
    procedure RegistroC190(notaCab: Integer);
    procedure RegistroC195(notaCab: Integer);
    procedure RegistroC197(notaCab: Integer);
    procedure RegistroC300;
    procedure RegistroC310;
    procedure RegistroC320;
    procedure RegistroC321;
    procedure RegistroC400;
    procedure RegistroC405;
    procedure RegistroC410;
    procedure RegistroC420;
    procedure RegistroC425;
    procedure RegistroC460;
    procedure RegistroC470;
    procedure RegistroC490;
    procedure RegistroC495;
    procedure RegistroC500;
    procedure RegistroC510;
    procedure RegistroC590(notaCab: Integer);
    procedure RegistroC600;
    procedure RegistroC601;
    procedure RegistroC610;
    procedure RegistroC690;
    procedure RegistroC700;
    procedure RegistroC790;
    procedure RegistroC791;
    procedure RegistroC990(QtdLinhas: Double);

    procedure RegistroD001;
    procedure RegistroD100;
    procedure RegistroD110;
    procedure RegistroD120;
    procedure RegistroD130(pCod_Conhecimento: Integer);
    procedure RegistroD140;
    procedure RegistroD150;
    procedure RegistroD160;
    procedure RegistroD161;
    procedure RegistroD170;
    procedure RegistroD180;
    procedure RegistroD190;
    procedure RegistroD300;
    procedure RegistroD301;
    procedure RegistroD310;
    procedure RegistroD350;
    procedure RegistroD355;
    procedure RegistroD360;
    procedure RegistroD365;
    procedure RegistroD370;
    procedure RegistroD390;
    procedure RegistroD400;
    procedure RegistroD410;
    procedure RegistroD411;
    procedure RegistroD420;
    procedure RegistroD500;
    procedure RegistroD510;
    procedure RegistroD530;
    procedure RegistroD590(pCodigo: Integer);
    procedure RegistroD600;
    procedure RegistroD610;
    procedure RegistroD690;
    procedure RegistroD695;
    procedure RegistroD696;
    procedure RegistroD697;
    procedure RegistroD990(QtdLinhas: Double);

    procedure RegistroE001;
    procedure RegistroE100;
    procedure RegistroE110;
    procedure RegistroE111;
    procedure RegistroE112;
    procedure RegistroE113;
    procedure RegistroE115;
    procedure RegistroE116(valor: Double);
    procedure RegistroE200;
    procedure RegistroE210(uf: string);
    procedure RegistroE220;
    procedure RegistroE230;
    procedure RegistroE240;
    procedure RegistroE250(uf: string);
    procedure RegistroE500;
    procedure RegistroE510;
    procedure RegistroE520;
    procedure RegistroE530;
    procedure RegistroE531(CodLivroLctoIpi: integer);
    procedure RegistroE990(QtdLinhas: Double);

    procedure RegistroG001;
    procedure RegistroG110;
    procedure RegistroG125;
    procedure RegistroG130(CodNotaCab: integer);
    procedure RegistroG140(CodNotaCab: integer);
    procedure RegistroG990(QtdLinhas: Double);

    procedure RegistroH001;
    procedure RegistroH005;
    procedure RegistroH010;
    procedure RegistroH990(QtdLinhas: Double);
    procedure RegistroK001;
    procedure RegistroK010;
    procedure RegistroK100;
    procedure RegistroK200;
    procedure RegistroK220;
    procedure RegistroK230;
    procedure RegistroK235(pTipo: string; pCodigo,pCodProduto: integer);
    procedure RegistroK280;
    procedure RegistroK990(QtdLinhas: Double);

    procedure Registro1001;
    procedure Registro1010;
    procedure Registro1100;
    procedure Registro1105(notaCab: Integer);
    procedure Registro1110;
    procedure Registro1200;
    procedure Registro1210;
    procedure Registro1300;
    procedure Registro1310;
    procedure Registro1320;
    procedure Registro1400;
    procedure Registro1990(QtdLinhas: Double);

    procedure Registro9001;
    procedure Registro9990(QtdLinhas: Double);

    procedure Registro9999(QtdLinhas: Double);
    function alteraValor(texto: string; posicao: Integer;
      textoNovo: string): string;
    procedure atualizaTotalizadorEIndicadorBloco;
    function localizaRegistro(vetor: array of string;
      registro: string): Integer;
    function recuperaValor(texto: string; posicao: Integer): string;
    procedure Execute;
    function calculaDesconto(valItem: Extended; ultimo: Boolean = False): Extended;
    function calculaDescontoRateioItens(qtItem: Integer; ultimo: Boolean = False): Extended;
    procedure RegistroC181(notaCab: Integer);

  public
    thread: TThreadLocal;
    procedure Gerar;
    constructor Create(Filial: Integer; DataIni, DataFin: TDate; Finalidade: Integer);
  end;

implementation

uses UOracle_cl, UBloco0_cl, DB, UBiblioteca, UBlocoC_cl, UFuncoes,
  Registro, UBlocoD_cl, UGia_Cl, URegEntrada_Cl, ULivroFiscal_cl,
  UBlocoH_cl, UBloco1_cl, USped_cl, Dialogs, UBlocoE_cl, UParamSistema_cl,
  UBlocoK_cl, Math, StrUtils, UBibSped, OraTeste, OracleData, UBlocoG_cl;
var
  wAtividade: String;
  bibSped: tBibSped;
constructor TFiscal.Create(Filial: Integer; DataIni, DataFin: TDate; Finalidade: Integer);
begin
  wFilial := Filial;
  wDataIni := DataIni;
  wDataFin := DataFin;
  wFinalidade := Finalidade;
  bibSped := TBibSped.Create;
  inherited Create;
  //  FreeOnTerminate := True;
end;

procedure TFiscal.Execute;
var
  path: string;
begin
  path := ExtractFilePath(Application.ExeName);
  if not DirectoryExists(path + 'SPED') then
    CreateDir(path + 'SPED');
  if not DirectoryExists(path + 'SPED\FISCAL') then
    CreateDir(path + 'SPED\FISCAL');
  arquivo := TArquivo.Create(path + 'SPED\FISCAL\SPED-FISCAL_gerado_em_' +
    FormatDateTime('yyyy-MM-dd_hh-mm-ss', Date + Time) + '_competencia_' +
    FormatDateTime('yyyy-MM-dd', wDataIni) + '_' + FormatDateTime('yyyy-MM-dd',
    wDataFin) + '_filial_' + FormatFloat('00', wFilial) + '.txt');

  Registro0000;
  Registro9999(0);

  atualizaTotalizadorEIndicadorBloco;

  arquivo.geraArquivo;
  arquivo.Destroy;
end;

procedure TFiscal.Gerar;
var
  teste: string;
begin
  try
    Execute;
  except
    on e: Exception do
      thread.avisaErro('Erro na geração do SPED Fiscal.' + #13 + #10 +
        e.Message);
  end;
end;

procedure TFiscal.Registro0000;
var
  reg: TFiscal0000;
begin
  DmBloco0.QReg000.Close;
  DmBloco0.QReg000.SetVariable('FILIAIS', '(' + IntToStr(wFilial) + ')');
  DmBloco0.QReg000.Open;

  if DmBloco0.QReg000.IsEmpty then
    Exit;

  reg := TFiscal0000.Create(TObject(Self), arquivo);
  reg.COD_VER := pegaVersao(wDataFin, 'FISCAL');
  reg.COD_FIN := wFinalidade;
  reg.DT_INI := wDataIni;
  reg.DT_FIN := wDataFin;
  reg.NOME := DmBloco0.QReg000DESC_FILIAL.Value;
  reg.CNPJ := DmBloco0.QReg000NUM_CGC.Value;
  reg.UF := DmBloco0.QReg000DESC_SIGLA_ESTADO.Value;
  reg.IE := DmBloco0.QReg000DESC_INSCRICAO.Value;
  reg.COD_MUN := StrToInt(DmBloco0.QReg000COD_CIDADE_IBGE.Text);
  reg.IM := DmBloco0.QReg000DESC_INSCRICAO_MUNICIPAL.Value;

  reg.SUFRAMA := DmBloco0.QReg000DESC_SUFRAMA.Value;
  reg.IND_PERFIL := DmBloco0.QReg000IND_PERFIL_SPED.Value;
  if DmBloco0.QReg000IND_TIPO_ATIVIDADE.Value = 'I' then
    reg.IND_ATIV := 0
  else
    reg.IND_ATIV := 1;

  //Utilizado para checar a necessidade de gerar registros E500
  //no registro E001
  wAtividade := DmBloco0.QReg000IND_TIPO_ATIVIDADE.Value;

  reg.grava;
  reg.Free;
  reg := nil;

  // Será utilizado no bloco C100 E 1010
  //DmBloco0.QReg000.Close;

  Registro0001;

  Registro0990(0);
  RegistroB001;
  RegistroB990(0);
  RegistroC001;
  RegistroC990(0);
  RegistroD001;
  RegistroD990(0);
  RegistroE001;
  RegistroE990(0);
  RegistroG001;
  RegistroG990(1);
  RegistroH001;
  RegistroH990(0);
  if wDataIni >= StrToDate('01/01/2016') then
  begin
    RegistroK001;
    RegistroK990(0);
  end;
  Registro1001;
  Registro1990(0);
  Registro9001;
  Registro9990(0);

  DmBloco0.QReg000.Close;

end;

procedure TFiscal.Registro0001;
var
  reg: TFiscal0001;
begin
  reg := TFiscal0001.Create(TObject(Self), arquivo);
  reg.IND_MOV := 1;
  reg.grava;
  reg.Free;
  reg := nil;

  if DmBloco0.QReg000IND_TIPO_ATIVIDADE.Value = 'I' then
    Registro0002;

  Registro0005;
  Registro0015;
  Registro0100;
  Registro0150;
  Registro0190;
  Registro0200;
  Registro0400;
  Registro0450;
  Registro0460;
end;

procedure TFiscal.Registro0002;
var
  reg: TFiscal0002;
begin

  DmBloco0.QReg002.Close;
  DmBloco0.QReg002.SetVariable('COD_FILIAL', wFilial);
  DmBloco0.QReg002.Open;

  if DmBloco0.QReg002.IsEmpty then
    Raise Exception.Create('A ATIVIDADE do contribuinte obriga a informação da CLASSIFICAÇÃO na filial. Por favor,'+
                            ' configurar antes de gerar o Sped ICMS IPI.') ;

  reg := TFiscal0002.Create(TObject(Self), arquivo);
  reg.CLAS_ESTAB_IND := DmBloco0.QReg002COD_CLASSIFICACAO_CONTRIB_IPI.Value;

  reg.grava;
  reg.Free;
  reg := nil;

  DmBloco0.QReg002.Close;

end;

procedure TFiscal.Registro0005;
var
  reg: TRegistro0005;
begin
  DmBloco0.QReg005.Close;
  DmBloco0.QReg005.SetVariable('COD_FILIAL', wFilial);
  DmBloco0.QReg005.Open;

  if DmBloco0.QReg005.IsEmpty then
    Exit;

  reg := TRegistro0005.Create(TObject(Self), arquivo);
  reg.FANTASIA := DmBloco0.QReg005DESC_FILIAL.Value;
  reg.CEP := DmBloco0.QReg005DESC_CEP.Value;
  reg.END_ := DmBloco0.QReg005DESC_ENDERECO.Value;
  reg.NUM := DmBloco0.QReg005NUM_ENDERECO.Value;
  reg.COMPL := DmBloco0.QReg005DESC_COMPLEMENTO_ENDERECO.Value;
  reg.BAIRRO := DmBloco0.QReg005DESC_BAIRRO.Value;
  reg.FONE := DmBloco0.QReg005DESC_TELEFONE.Value;
  reg.FAX := DmBloco0.QReg005DESC_FAX.Value;
  reg.EMAIL := DmBloco0.QReg005DESC_E_MAIL.Value;
  reg.grava;
  reg.Free;
  reg := nil;

  DmBloco0.QReg005.Close;
end;

procedure TFiscal.Registro0015;
var
  reg: TRegistro0015;
begin
  //  reg := TRegistro0015.Create(TObject(Self), arquivo);
  //  reg.UF := DmBloco0.QReg015DESC_SIGLA_ESTADO.Value;
  //  reg.IE := DmBloco0.QReg015DESC_INSCRICAO.Value;
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.Registro0100;
var
  reg: TRegistro0100;
begin
  try
    StrToInt(DMOracle.BuscaNome('SELECT COD_CADASTRO_CONTABILISTA FROM TB_FILIAL', 'COD_FILIAL = ' + IntToStr(wFilial)));
  except
    Raise Exception.Create('Contabilista não informado para esta filial');
    Exit;
  end;

  DmBloco0.QReg100.Close;
  DmBloco0.QReg100.SetVariable('COD_CADASTRO',
    StrToInt(DMOracle.BuscaNome('SELECT COD_CADASTRO_CONTABILISTA FROM TB_FILIAL',
    'COD_FILIAL = ' + IntToStr(wFilial))));
  DmBloco0.QReg100.Open;

  if DmBloco0.QReg100.IsEmpty then
    Exit;

  reg := TRegistro0100.Create(TObject(Self), arquivo);
  reg.NOME := DmBloco0.QReg100NOME.Value;
  reg.CPF := DmBloco0.QReg100DESC_CPF.Value;
  reg.CRC := DmBloco0.QReg100DESC_CRC.Value;
  reg.CNPJ := DmBloco0.QReg100DESC_CNPJ.Value;
  reg.CEP := DmBloco0.QReg100DESC_CEP.Value;
  reg.END_ := RemoveNumEndereco(DmBloco0.QReg100DESC_ENDERECO.Value,
    IntToStr(NumEndereco(DmBloco0.QReg100DESC_ENDERECO.Value)));
  reg.NUM := NumEndereco(DmBloco0.QReg100DESC_ENDERECO.Value);
  reg.COMPL := DmBloco0.QReg100DESC_COMPLEMENTO.Value;
  reg.BAIRRO := DmBloco0.QReg100DESC_BAIRRO.Value;
  reg.FONE := DmBloco0.QReg100DESC_TELEFONE.Value;
  reg.FAX := DmBloco0.QReg100DESC_FAX.Value;
  reg.EMAIL := DmBloco0.QReg100DESC_E_MAIL.Value;
  if SomenteNumeros(DmBloco0.QReg100COD_CIDADE_IBGE.Value) = '' then
    reg.COD_MUN := 0
  else
    reg.COD_MUN := StrToInt(FormatFloat('00',
      SomenteNumerosEConverte(DmBloco0.QReg100COD_UF_IBGE.Text)) +
      FormatFloat('00000',
      SomenteNumerosEConverte(DmBloco0.QReg100COD_CIDADE_IBGE.Text)));
  reg.grava;
  reg.Free;
  reg := nil;
end;

procedure TFiscal.Registro0150;
var
  reg: TFiscal0150;
begin
  DmBloco0.QReg150.Close;
  DmBloco0.QReg150.SetVariable('Dt_Inicial', wDataIni);
  DmBloco0.QReg150.SetVariable('Dt_Final', wDataFin);
  DmBloco0.QReg150.SetVariable('Cod_Filial', wFilial);
  DmBloco0.QReg150.Open;

  if DmBloco0.QReg150.IsEmpty then
    Exit;

  DmBloco0.QReg150.First;
  while not DmBloco0.QReg150.Eof do
  begin
    reg := TFiscal0150.Create(TObject(Self), arquivo);
    reg.COD_PART := IntToStr(DmBloco0.QReg150COD_CADASTRO.AsInteger);
    reg.NOME := DmBloco0.QReg150NOME.Value;
    reg.COD_PAIS := DmBloco0.QReg150COD_PAIS_IBGE.AsInteger;
    reg.CNPJ := DmBloco0.QReg150DESC_CNPJ.Value;
    reg.CPF := DmBloco0.QReg150DESC_CPF.Value;

    if DmBloco0.QReg150IND_FISICA_JURIDICA.Value = 'F' then
    begin
      if ((DmBloco0.QReg150DESC_INSCRICAO_MUNICIPAL.IsNull) or
        (DmBloco0.QReg150DESC_INSCRICAO_MUNICIPAL.Value = '')) then
        reg.IE := ''
      else
        reg.IE := DmBloco0.QReg150DESC_INSCRICAO_MUNICIPAL.Value;
    end
    else
    begin
      // Para pessoa jurídica que é produtor rural (Ex: UNIOESTE - GRASEL)
      if (not DmBloco0.QReg150DESC_INSCRICAO_MUNICIPAL.IsNull)
        and ((DmBloco0.QReg150NUM_INSCRICAO.IsNull) or (DmBloco0.QReg150NUM_INSCRICAO.Value = 'ISENTO'))
      then
        reg.IE := DmBloco0.QReg150DESC_INSCRICAO_MUNICIPAL.Value
      else
        reg.IE := DmBloco0.QReg150NUM_INSCRICAO.Value;
    end;

    //    reg.IE := DmBloco0.QReg150NUM_INSCRICAO.Value;
    if SomenteNumeros(DmBloco0.QReg150COD_CIDADE_IBGE.Value) = '' then
      reg.COD_MUN := 0
    else
      reg.COD_MUN := StrToInt(FormatFloat('00',
        SomenteNumerosEConverte(DmBloco0.QReg150COD_UF_IBGE.Text)) +
        FormatFloat('00000',
        SomenteNumerosEConverte(DmBloco0.QReg150COD_CIDADE_IBGE.Text)));
    reg.SUFRAMA := DmBloco0.QReg150DESC_SUFRAMA.Value;
    reg.END_ := RemoveNumEndereco(DmBloco0.QReg150DESC_ENDERECO.Value,
      IntToStr(NumEndereco(DmBloco0.QReg150DESC_ENDERECO.Value)));
    reg.NUM := NumEndereco(DmBloco0.QReg150DESC_ENDERECO.Value);
    reg.COMPL := DmBloco0.QReg150DESC_COMPLEMENTO.Value;
    reg.BAIRRO := DmBloco0.QReg150DESC_BAIRRO.Value;
    reg.grava;
    reg.Free;
    reg := nil;

    Registro0175(DmBloco0.QReg150COD_CADASTRO.AsInteger);

    DmBloco0.QReg150.Next;
  end;
end;

procedure TFiscal.Registro0175(codCadastro: Integer);
var
  reg: TRegistro0175;
begin
  //  reg := TRegistro0175.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.Registro0190;
var
  reg: TRegistro0190;
  aux: Integer;
  wAno, wMes, wDia: Word;
  bibSped: TBibSped;
  wDataAux: TDate;
begin
  bibSped := TBibSped.Create;
  wDataAux := bibSped.DataInventario(wDataFin);
  DecodeDate(wDataAux, wAno, wMes, wDia);

  DmBloco0.QReg190.Close;
  DmBloco0.QReg190.SetVariable('Dt_Inicial', wDataIni);
  DmBloco0.QReg190.SetVariable('Dt_Final', wDataFin);
  DmBloco0.QReg190.SetVariable('Cod_Filial', wFilial);
  DmBloco0.QReg190.SetVariable('NUM_ANO', wAno);
  DmBloco0.QReg190.SetVariable('NUM_MES', wMes);
  DmBloco0.QReg190.SetVariable('MES_INV', MonthOf(wDataIni));  
  DmBloco0.QReg190.Open;

  if DmBloco0.QReg190.IsEmpty then
    Exit;

  DmBloco0.QReg190.First;
  aux := 1;
  while not DmBloco0.QReg190.Eof do
  begin
    reg := TRegistro0190.Create(TObject(Self), arquivo);
    //    reg.UNID := IntToStr(aux);
    reg.UNID := DmBloco0.QReg190DESC_UNIDADE.Value;
    reg.DESCR := DmBloco0.QReg190DESC_UNIDADE.Value + '.';
    reg.grava;
    reg.Free;
    reg := nil;

    Inc(aux);

    DmBloco0.QReg190.Next;
  end;
end;

procedure TFiscal.Registro0200;
var
  reg: TRegistro0200;
  i: Integer;
  wAno, wMes, wDia: Word;
  wDataAux: tdatetime;
  bibSped: TBibSped;
begin
  bibSped := TBibSped.Create;
  wDataAux := bibSped.dataInventario(wDataFin);
  DecodeDate(wDataAux, wAno, wMes, wDia);

  DmBloco0.QReg200.Close;
  DmBloco0.QReg200.SetVariable('Dt_Inicial', wDataIni);
  DmBloco0.QReg200.SetVariable('Dt_Final', wDataFin);
  DmBloco0.QReg200.SetVariable('Cod_Filial', wFilial);
  DmBloco0.QReg200.SetVariable('NUM_ANO', wAno);
  DmBloco0.QReg200.SetVariable('NUM_MES', wMes);
  DmBloco0.QReg200.SetVariable('MES_INV', MonthOf(wDataIni));
  if bibSped.GeraBlocoK then
    DmBloco0.QReg200.SetVariable('BLOCOK', '1 = 1') // Variável de substituição na cláusula where
  else
    DmBloco0.QReg200.SetVariable('BLOCOK', '1 = 0');
  DmBloco0.QReg200.Open;

  if DmBloco0.QReg200.IsEmpty then
    Exit;

  DmBloco0.QReg200.First;

  while not DmBloco0.QReg200.Eof do
  begin
    reg := TRegistro0200.Create(TObject(Self), arquivo);
    reg.pDataArquivo := wDataFin;
    reg.COD_ITEM := FloatToStr(DmBloco0.QReg200COD_PRODUTO.Value);
    reg.DESCR_ITEM := DmBloco0.QReg200DESC_PRODUTO.Value;
    reg.COD_BARRA := DmBloco0.QReg200NUM_FABRICANTE.Value;
    reg.COD_ANT_ITEM := '';
    if ((DmBloco0.QReg200DESC_UNIDADE.IsNull) or
      (DmBloco0.QReg200DESC_UNIDADE.Value = '')) then
      reg.UNID_INV := 'UN'
    else
      reg.UNID_INV := DmBloco0.QReg200DESC_UNIDADE.Value;
    if Bib.LimpaNumero(DmBloco0.QReg200COD_TIPO_PRODUTO.Value) = '' then
      reg.TIPO_ITEM := 0
    else
      reg.TIPO_ITEM := StrToInt(DmBloco0.QReg200COD_TIPO_PRODUTO.Value);
    reg.COD_NCM := DmBloco0.QReg200NUM_GENERO_NCM.Value;
    reg.EX_IPI := DmBloco0.QReg200COD_EX_TIPI.Value;
    reg.COD_GEN := DmBloco0.QReg200COD_GENERO_PRODUTO.AsInteger;
    reg.COD_LST := DmBloco0.QReg200COD_LISTA_SERVICO.Text;
    reg.ALIQ_ICMS := DmBloco0.QReg200PERC_ALIQUOTA.Value;

    reg.grava;

    Registro0205;
    Registro0206;
    // 0210 informado só até 01/01/2021
   // Registro0210(DmBloco0.QReg200COD_PRODUTO.AsInteger);
    Registro0220;

    if (wDataIni > StrToDate('31/12/2022')) and (reg.TIPO_ITEM = 0)  then
      Registro0221(DmBloco0.QReg200COD_PRODUTO.AsInteger);

    reg.Free;
    reg := nil;

    DmBloco0.QReg200.Next;
  end;
end;

procedure TFiscal.Registro0205;
var
  reg: TRegistro0205;
begin
  //  reg := TRegistro0205.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.Registro0206;
var
  reg: TRegistro0206;
begin
  //  reg := TRegistro0206.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.Registro0210(codProduto: integer);
var
  reg: TRegistro0210;
begin
  reg := TRegistro0210.Create(TObject(self), arquivo);

  DmBloco0.QReg210.Close;
  DmBloco0.QReg210.SetVariable('DT_INI', wDataIni);
  DmBloco0.QReg210.SetVariable('DT_FIN', wDataFin);
  DmBloco0.QReg210.SetVariable('COD_PRODUTO', codProduto);
  DmBloco0.QReg210.SetVariable('FILIAL', wFilial);
  if bibSped.GeraBlocoK then
    DmBloco0.QReg210.SetVariable('BLOCOK', '1 = 1') // Variável de substituição na cláusula where
  else
    DmBloco0.QReg210.SetVariable('BLOCOK', '1 = 0');
  DmBloco0.QReg200.Open;

  DmBloco0.QReg210.Open;

  while not DmBloco0.QReg210.Eof do
  begin
    reg.COD_ITEM_COMP := DmBloco0.QReg210COD_ITEM_COMP.Text;
    reg.QTD_COMP := DmBloco0.QReg210QTD_COMP.Value;
    reg.PERDA := DmBloco0.QReg210PERDA.Value;
    reg.grava;
    DmBloco0.QReg210.Next;
  end;

  reg.Free;
  reg := nil;

end;

procedure TFiscal.Registro0220;
var
  reg: TRegistro0220;
begin
  //  reg := TRegistro0220.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.Registro0221(codProduto: integer);
  var reg221: TRegistro0221;
begin

  with DMBloco0 do
  begin
    QReg221.Close;
    QReg221.SetVariable('COD_PRODUTO', codProduto);
    QReg221.Open;

    if QReg221.RecordCount = 0 then
    begin
      reg221 := TRegistro0221.Create(TObject(Self), arquivo);

      reg221.COD_ITEM_ATOMICO := IntToStr(codProduto);
      reg221.QTD_CONTIDA := 1;
      reg221.grava;
      reg221.Free;
      reg221 := nil;
    end
    else
    begin
      if (QReg221.RecordCount = 1) and (QReg221COD_PRODUTO_BAIXA.Text = '0') then
      begin
        reg221.COD_ITEM_ATOMICO := IntToStr(codProduto);
        reg221.QTD_CONTIDA := 1;
        reg221.grava;
        reg221.Free;
        reg221 := nil;
      end
      else
      begin

        while not QReg221.Eof do
        begin
          if (QReg221COD_PRODUTO_BAIXA.Text <> '0') then
          begin
            reg221 := TRegistro0221.Create(TObject(Self), arquivo);

            reg221.COD_ITEM_ATOMICO := QReg221COD_PRODUTO_BAIXA.Text;
            reg221.QTD_CONTIDA := QReg221QT_BAIXA.Value;
            reg221.grava;
            reg221.Free;
             reg221 := nil;
           end;
           QReg221.Next;
        end;
        
      end;
    end;
  end;
end;

procedure TFiscal.Registro0400;
var
  reg: TRegistro0400;
begin
  DmBloco0.QReg400.Close;
  DmBloco0.QReg400.SetVariable('DT_INICIAL', wDataIni);
  DmBloco0.QReg400.SetVariable('DT_FINAL', wDataFin);
  DmBloco0.QReg400.SetVariable('COD_FILIAL', wFilial);
  DmBloco0.QReg400.Open;

  if DmBloco0.QReg400.IsEmpty then
    Exit;

  DmBloco0.QReg400.First;
  while not DmBloco0.QReg400.Eof do
  begin
    reg := TRegistro0400.Create(TObject(Self), arquivo);
    reg.COD_NAT := IntToStr(DmBloco0.QReg400COD_OPERACAO.AsInteger);
    reg.DESCR_NAT := DmBloco0.QReg400DESC_OPERACAO.Value;
    reg.grava;
    reg.Free;
    reg := nil;

    DmBloco0.QReg400.Next;
  end;
end;

procedure TFiscal.Registro0450;
var
  reg: TRegistro0450;
begin
  DmBloco0.QReg450.Close;
  DmBloco0.QReg450.SetVariable('DATA_INI', wDataIni);
  DmBloco0.QReg450.SetVariable('DATA_FIN', wDataFin);
  DmBloco0.QReg450.SetVariable('COD_FILIAL', wFilial);
  DmBloco0.QReg450.Open;


  if DmBloco0.QReg450.IsEmpty then
    Exit;

  DmBloco0.QReg450.First;
  while not DmBloco0.QReg450.Eof do
  begin
    reg := TRegistro0450.Create(TObject(Self), arquivo);
    reg.COD_INF := IntToStr(DmBloco0.QReg450Cod_Mensagem.AsInteger);
    reg.TXT := DmBloco0.QReg450DESC_MENSAGEM.Value;
    reg.grava;
    reg.Free;
    reg := nil;

    DmBloco0.QReg450.Next;
  end;
end;

procedure TFiscal.Registro0460;
var
  reg: TRegistro0460;
begin
    DmBloco0.QReg460.Close;
    DmBloco0.QReg460.SetVariable('Dt_Inicial',wDataIni);
    DmBloco0.QReg460.SetVariable('Dt_Final',wDataFin);
    DmBloco0.QReg460.SetVariable('Cod_Filial',wFilial);
    DmBloco0.QReg460.SetVariable('COD_NOTA', null);
    DmBloco0.QReg460.Open;

    if DmBloco0.QReg460.IsEmpty then Exit;

    DmBloco0.QReg460.First;
    while not DmBloco0.QReg460.Eof do
    Begin
      reg := TRegistro0460.Create(TObject(Self), arquivo);
      reg.COD_OBS := DMBloco0.qreg460COD_OBS.Text;
      reg.TXT := DmBloco0.QReg460DESC_MENSAGEM.Value;
      reg.grava;
    reg.Free;
    reg := nil;
    DmBloco0.QReg460.Next;
    End;
end;

procedure TFiscal.Registro0990(QtdLinhas: Double);
var
  reg: TRegistro0990;
begin
  reg := TRegistro0990.Create(TObject(Self), arquivo);
  reg.QTD_LIN_0 := QtdLinhas;
  reg.grava;
  reg.Free;
  reg := nil;
end;

procedure TFiscal.RegistroC001;
var
  reg: TRegistroC001;
begin
  reg := TRegistroC001.Create(TObject(Self), arquivo);
  reg.IND_MOV := 1;
  reg.grava;
  reg.Free;
  reg := nil;

  RegistroC100;
  RegistroC300;
  RegistroC400;
  RegistroC495;
  RegistroC500;
  RegistroC600;
  RegistroC700;
end;

procedure TFiscal.RegistroC100;
var
  reg: TRegistroC100;
  wEmissaoPropria: Boolean;
  wcnpj: string;
  bibSped: tBibSped;
  i: integer;
begin
  bibSped := tBibSped.Create;

  DmBlocoC.QReg100.Close;
  DmBlocoC.QReg100.SetVariable('COD_FILIAL', wFilial);
  DmBlocoC.QReg100.SetVariable('DATA_INI', wDataIni);
  DmBlocoC.QReg100.SetVariable('DATA_FIN', wDataFin);
  DmBlocoC.QReg100.Open;

  if DmBlocoC.QReg100.IsEmpty then
    Exit;

  DmBlocoC.QReg100.First;
  while not DmBlocoC.QReg100.Eof do
  begin
    reg := TRegistroC100.Create(TObject(Self), arquivo);
    if DmBlocoC.QReg100IND_ENTRADA_SAIDA.Value = 'S' then
      reg.IND_OPER := 1
    else
    begin
      reg.IND_OPER := 0;
    end;
    if (DmBlocoC.QReg100IND_EMITE.Value = 'F') and
      (DmBlocoC.QReg100IND_ENTRADA_SAIDA.Value = 'S') then
      reg.IND_EMIT := 0
    else
      if (DmBlocoC.QReg100IND_EMITE.Value = 'N') and
        (DmBlocoC.QReg100IND_ENTRADA_SAIDA.Value = 'S') then
        reg.IND_EMIT := 0
      else
        if (DmBlocoC.QReg100IND_EMITE.Value = 'F') and
          (DmBlocoC.QReg100IND_ENTRADA_SAIDA.Value = 'E') then
          reg.IND_EMIT := 0
        else
          reg.IND_EMIT := 1;

    // Para notas de devolução de compra feitas pela própria empresa que realizou a venda (fornecedora)
    // (Caso a empresa que comprou se recuse a emitir nota de devolução)
    // Deve-se cadastrar a nota de devolução de compras emitida pela empresa fornecedora no vendas
    // Sem enviar para sefaz. (A nota já foi enviada pela empresa fornecedora)
    // O sistema vai comparar o cnpj da chave de acesso e marcar a nota como emitida por terceiros
    if (Trim(DmBlocoC.QReg100DESC_CHAVE_ACESSO.Value) <> '')
      and (DmBlocoC.QReg100IND_ENTRADA_SAIDA.Value = 'S') then
    begin
      if StringReplace(
          StringReplace(
            StringReplace(
              DmBloco0.QReg000NUM_CGC.Text, '.', '', [rfReplaceAll]
            ), '/', '', [rfReplaceAll]
          ), '-', '', [rfReplaceAll]
        ) <> copy(DmBlocoC.QReg100DESC_CHAVE_ACESSO.Value, 10,14) then
        reg.IND_EMIT := 1;
    end;

    wEmissaoPropria := (reg.IND_EMIT = 0);

    reg.CHV_NFE := StringReplace(DmBlocoC.QReg100DESC_CHAVE_ACESSO.Value,'NFe','',
      [rfReplaceAll, rfIgnoreCase]);

    reg.COD_MOD := DmBlocoC.QReg100COD_SERIE_MODELO.Value;
    if DmBlocoC.QReg100IND_SITUACAO.Value = '2' then
      reg.COD_SIT := 0
    else
      reg.COD_SIT := 2;

    // Notas com cnpj na chave de acesso da SEFAZ (RS - SC - MS - PR)
    // devem possuir situação especial
    if (copy(reg.CHV_NFE, 7, 14) = '87958674000181')
      or (copy(reg.CHV_NFE, 7, 14) = '82951310000156')
      or (copy(reg.CHV_NFE, 7, 14) = '16907746000113') // MG - Vanessa 09/05/2016
      or (copy(reg.CHV_NFE, 7, 14) = '02935843000105')
      or (copy(reg.CHV_NFE, 7, 14) = '78393592000146') then   //Paraná
      reg.COD_SIT := 8;

    if DMBlocoC.QReg100NUM_SERIE_FISCAL.Value > 0 then
      reg.SER := trunc(DmBlocoC.QReg100NUM_SERIE_FISCAL.Value)
    else
      reg.SER := strToInt(DmBlocoC.QReg100COD_SERIE.Value);

    reg.NUM_DOC := DmBlocoC.QReg100NUM_NOTA.AsInteger;
    if DmBlocoC.QReg100IND_SITUACAO.Value = '2' then // quando nota cancelada nao apresenta esta informacao
    begin
      reg.COD_PART := DmBlocoC.QReg100COD_CADASTRO.Text;
      if ((DmBlocoC.QReg100IND_EMITE.Value = 'F') and
        (DmBlocoC.QReg100COD_SERIE_MODELO.Value = '55')) then
        reg.CHV_NFE := StringReplace(DmBlocoC.QReg100DESC_CHAVE_ACESSO.Value,'NFe','',
          [rfReplaceAll, rfIgnoreCase]);
      reg.DT_DOC := DmBlocoC.QReg100DT_EMISSAO.Value;

      // Documentos com emissão no período mas saída fora do período da escrituração
      // devem ficar com data de saída ou entrada em branco
      if (DmBlocoC.QReg100DT_RECEBIMENTO.Value >= wDataIni) and
      (DmBlocoC.QReg100DT_RECEBIMENTO.Value <= wDataFin) then
        reg.DT_E_S := DmBlocoC.QReg100DT_RECEBIMENTO.Value;

      reg.VL_DOC := DmBlocoC.QReg100VAL_TOTAL.Value;
      if (DmBlocoC.QReg100IND_CONDICAO_PAGTO.Value = '1') then //a vista
        reg.IND_PGTO := 0;
      if (DmBlocoC.QReg100IND_CONDICAO_PAGTO.Value = '2') then //a prazo
      begin
        if DmBlocoC.QReg100QT_FATURAS.Value = 0 then //existem (no sei por que) notas a prazo sem faturas lançadas
          reg.IND_PGTO := 0 //usa a vista mesmo
        else
          reg.IND_PGTO := 1; //aqui sim coloca a prazo
      end;
      if (DmBlocoC.QReg100IND_CONDICAO_PAGTO.Value = '3') then //sem pagamento
      begin
        if wDataIni >= StrToDate('01/07/2012') then
          reg.IND_PGTO := 2
        else
          reg.IND_PGTO := 9;
      end;
      reg.VL_DESC := DmBlocoC.QReg100VAL_DESCONTO.Value;
      wDesconto := reg.VL_DESC; //Gambiarra
      wDescontoRateado := 0;
      wValNota := reg.VL_DOC;
      reg.VL_ABAT_NT := 0;

      reg.VL_MERC := bibSped.ValMercadoria(DmBlocoC.QReg100VAL_MERCADORIAS.Value
        , DmBlocoC.QReg100COD_NOTA_CAB.Value
        , DmBlocoC.QReg100IND_ENTRADA_SAIDA.Value);

      if DmBlocoC.QReg100VAL_FRETE.Value <= 0 then
        reg.IND_FRT := 9
      else if DmBlocoC.QReg100IND_TIPO_FRETE.Value = 'CIF' then
        reg.IND_FRT := 0
      else
        reg.IND_FRT := 1;
      reg.VL_FRT := DmBlocoC.QReg100VAL_FRETE.Value;
      reg.VL_SEG := 0;
      reg.VL_OUT_DA := DmBlocoC.QReg100VAL_DESPESAS.Value;
      reg.VL_BC_ICMS := DmBlocoC.QReg100VAL_ICM_BASE.Value;
      reg.VL_ICMS := DmBlocoC.QReg100VAL_ICM.Value;
      reg.VL_BC_ICMS_ST :=  bibSped.ICMSST(DmBlocoC.QReg100VAL_BASE_SUBST.Value
        , DMBlocoC.QReg100IND_ENTRADA_SAIDA.Value);
      reg.VL_ICMS_ST := bibSped.ICMSST(DmBlocoC.QReg100VAL_ICMS_SUBST.Value
        , DMBlocoC.QReg100IND_ENTRADA_SAIDA.Value);
      reg.VL_IPI := DmBlocoC.QReg100VAL_IPI.Value;
      reg.VL_PIS := DmBlocoC.QReg100VAL_PIS.Value;
      reg.VL_COFINS := DmBlocoC.QReg100VAL_CONFINS.Value;
      reg.VL_PIS_ST := 0;
      reg.VL_COFINS_ST := 0;
    end;
    reg.grava;
    reg.Free;
    reg := nil;

    if DmBlocoC.QReg100IND_SITUACAO.Value = '2' then
    begin
      RegistroC110(DmBlocoC.QReg100COD_NOTA_CAB.Value);
     // RegistroC120(DmBlocoC.QReg100COD_NOTA_CAB.Value);
      RegistroC130(DmBlocoC.QReg100COD_NOTA_CAB.Value);
      RegistroC140(DmBlocoC.QReg100COD_NOTA_CAB.Value);
      if ((DmBlocoC.QReg100COD_SERIE_MODELO.Value = '01') or (DmBlocoC.QReg100COD_SERIE_MODELO.Value = '04')) then
        RegistroC160(DmBlocoC.QReg100COD_NOTA_CAB.Value);
      //if (DmBlocoC.QReg100COD_SERIE_MODELO.Value = '55') and
      //  (not wEmissaoPropria) then
      RegistroC170(DmBlocoC.QReg100COD_NOTA_CAB.Value);
      RegistroC190(DmBlocoC.QReg100COD_NOTA_CAB.Value);
      RegistroC195(DmBlocoC.QReg100COD_NOTA_CAB.Value);
    end;

    DmBlocoC.QReg100.Next;
  end;

  { Inutilizações removidas do Sped a partir de jan/2023
  // Inutilizações
  with DMBlocoC do
  begin
    QReg100Inut.Close;
    QReg100Inut.SetVariable('COD_FILIAL', wFilial);
    QReg100Inut.SetVariable('DATA_INI', wDataIni);
    QReg100Inut.SetVariable('DATA_FIN', wDataFin);
    QReg100Inut.Open;
    if QReg100Inut.IsEmpty then
      exit;

    QReg100Inut.First;
    while not QReg100Inut.Eof do
    begin
      reg := TRegistroC100.Create(TObject(Self), arquivo);
      for i := QReg100InutNUM_INICIAL.Value to QReg100InutNUM_FINAL.Value do
      begin
        reg.IND_OPER := QReg100InutIND_OPER.AsInteger;
        reg.IND_EMIT := QReg100InutIND_EMIT.AsInteger;
        reg.COD_MOD := QReg100InutCOD_MOD.Text;
        reg.COD_SIT := QReg100InutCOD_SIT.AsInteger;
        reg.SER := QReg100InutSER.AsInteger;
        reg.NUM_DOC := i;
        reg.grava;
      end;
      QReg100Inut.Next;
      reg.Free;
      reg := nil;
    end;


  end;
  }
end;

procedure TFiscal.RegistroC110(notaCab: Integer);
var
  reg: TRegistroC110;
  query110: TOracleDataSet1;
begin

  query110 := executaQuery(DmBlocoC.QReg110);
  query110.SetVariable('COD_NOTA_CAB', notaCab);
  query110.Open;

  if query110.IsEmpty then begin
    fechaQuery(query110); Exit; end;

  reg := TRegistroC110.Create(TObject(Self), arquivo);
  reg.COD_INF := pegaValor(query110, 'COD_MENSAGEM');
  reg.TXT_COMPL := pegaValor(query110, 'DESC_COMPLEMENTO');
  reg.grava;
  reg.Free;
  reg := nil;
  fechaQuery(query110);
  RegistroC111(notaCab);
  RegistroC112(notaCab);
  RegistroC113(notaCab);
  RegistroC114(notaCab);
  RegistroC115(notaCab);
end;

procedure TFiscal.RegistroC111(notaCab: Integer);
var
  reg: TRegistroC111;
begin
  //  reg := TRegistroC111.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.RegistroC112(notaCab: Integer);
var
  reg: TRegistroC112;
  query112: TOracleDataSet1;
begin
//  DmBlocoC.QReg112.Close;
//  DmBlocoC.QReg112.SetVariable('COD_NOTA_CAB', notaCab);
//  DmBlocoC.QReg112.Open;

  query112 := executaQuery(DmBlocoC.QReg112);
  query112.SetVariable('COD_NOTA_CAB', notaCab);
  query112.Open;

  if query112.IsEmpty then begin
    fechaQuery(query112); Exit; end;

  query112.First;
  while not query112.Eof do
  begin
    reg := TRegistroC112.Create(TObject(Self), arquivo);
    reg.COD_DA := pegaValor(query112, 'IND_DOCUMENTO_ARRECADACAO');
    reg.UF :=  pegaValor(query112, 'DESC_SIGLA_ESTADO');
    reg.NUM_DA := pegaValor(query112,'NUM_DOCUMENTO_ARRECADACAO');
    reg.COD_AUT := pegaValor(query112,'COD_AUTENTICACAO');
    reg.VL_DA :=  pegaValor(query112,'VAL_DOCUMENTO_ARRECADACAO');
    reg.DT_VCTO := pegaValor(query112,'DT_VCTO');
    reg.DT_PGTO := pegaValor(query112,'DT_PGTO');
    reg.grava;
    reg.Free;
    reg := nil;
    query112.Next;
  end;

  fechaQuery(query112);

end;

procedure TFiscal.RegistroC113(notaCab: Integer);
var
  reg: TRegistroC113;
  query113: TOracleDataSet1;
begin
  query113 := executaQuery(DmBlocoC.QReg113);
  query113.SetVariable('COD_NOTA_CAB',notaCab);
  query113.Open;

  if query113.IsEmpty then begin
    fechaQuery(query113); Exit; end;

  query113.First;
  while not query113.Eof do
  begin
    reg := TRegistroC113.Create(TObject(Self), arquivo);
    if pegaValor(query113, 'IND_ENTRADA_SAIDA') = 'E' then
      reg.IND_OPER := '0'
    else
      reg.IND_OPER := '1';
    if pegaValor(query113, 'IND_EMITE') = 'F' then
      reg.IND_OPER := '0'
    else
      reg.IND_OPER := '1';
    reg.COD_PART := pegaValor(query113, 'COD_CADASTRO');
    reg.COD_MOD := pegaValor(query113, 'COD_SERIE_MODELO');
    if pegaValor(query113, 'NUM_SERIE_FISCAL') > 0 then
      reg.SER := pegaValor(query113, 'NUM_SERIE_FISCAL')
    else
      reg.SER := pegaValor(query113, 'COD_SERIE');
    reg.SUB := 1;
    reg.NUM_DOC := pegaValor(query113, 'NUM_NOTA');
    reg.DT_DOC := pegaValor(query113, 'DT_EMISSAO');
    reg.grava;
    reg.Free;
    reg := nil;
    query113.Next;
  end;
  fechaQuery(query113);

end;

procedure TFiscal.RegistroC114(notaCab: Integer);
var
  reg: TRegistroC114;
begin
  //  reg := TRegistroC114.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.RegistroC115(notaCab: Integer);
var
  reg: TRegistroC115;
begin
  //  reg := TRegistroC115.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.RegistroC120(notaCab: Integer);
var
  reg: TRegistroC120;
begin
  //  reg := TRegistroC120.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.RegistroC130(notaCab: Integer);
var
  reg: TRegistroC130;
  query130: TOracleDataSet1;
begin

  query130 := executaQuery(DmBlocoC.QReg130);
  query130.SetVariable('COD_NOTA_CAB', notaCab);
  query130.Open;

  if query130.IsEmpty then begin
    fechaQuery(query130); Exit; end;

  reg := TRegistroC130.Create(TObject(Self), arquivo);
  reg.VL_SERV_NT := 0;
  reg.VL_BC_ISSQN := 0;
  reg.VL_ISSQN := pegaValor(query130, 'VAL_ISS');
  reg.VL_BC_IRRF := 0;
  reg.VL_IRRF := 0;
  reg.VL_BC_PREV := 0;
  reg.VL_PREV := 0;
  reg.grava;
  reg.Free;
  reg := nil;

  fechaQuery(query130);

end;

procedure TFiscal.RegistroC140(notaCab: Integer);
var
  reg: TRegistroC140;
  query140: TOracleDataSet1;
begin

  query140 := executaQuery(DmBlocoC.QReg140);
  query140.SetVariable('COD_NOTA_CAB', notaCab);
  query140.Open;

  if query140.IsEmpty then begin
    fechaQuery(query140); Exit; end;

  reg := TRegistroC140.Create(TObject(Self), arquivo);
  reg.IND_EMIT := '0';
  reg.IND_TIT := '00';
  reg.DESC_TIT := '';
  reg.NUM_TIT := pegaValor(query140, 'NUM_TITULO');
  reg.QTD_PARC := pegaValor(query140, 'QTD_PARCELAS');
  reg.VL_TIT := pegaValor(query140, 'VAL_TITULO');
  reg.grava;
  reg.Free;
  reg := nil;
  fechaQuery(query140);
  RegistroC141(notaCab);
end;

procedure TFiscal.RegistroC141(notaCab: Integer);
var
  reg: TRegistroC141;
  wNumParcela: Integer;
  query141: TOracleDataSet1;
begin

  query141 := executaQuery(DmBlocoC.QReg141);
  query141.SetVariable('COD_NOTA_CAB', notaCab);
  query141.Open;

  if query141.IsEmpty then begin
    fechaQuery(query141); Exit; end;

  wNumParcela := 0;

  query141.First;
  while not query141.Eof do
  begin
    inc(wNumParcela);
    reg := TRegistroC141.Create(TObject(Self), arquivo);
    reg.NUM_PARC := wNumParcela;
    reg.DT_VCTO := pegaValor(query141, 'DT_VENCIMENTO');
    reg.VL_PARC := pegaValor(query141, 'VAL_TITULO');
    reg.grava;
    reg.Free;
    reg := nil;
    query141.Next;
  end;
  fechaQuery(query141);

end;

procedure TFiscal.RegistroC160(notaCab: Integer);
var
  reg: TRegistroC160;
  query160: TOracleDataSet1;
begin

  query160 := executaQuery(DmBlocoC.QReg160);
  query160.SetVariable('COD_NOTA_CAB', notaCab);
  query160.Open;

  if query160.IsEmpty then begin
    fechaQuery(query160); Exit; end;

  reg := TRegistroC160.Create(TObject(Self), arquivo);
  reg.COD_PART := pegaValor(query160, 'COD_TRANSPORTADOR');
  reg.VEIC_ID := pegaValor(query160, 'DESC_PLACA');
  reg.QTD_VOL := pegaValor(query160, 'NUM_VOLUMES');
  reg.PESO_BRT := pegaValor(query160, 'QT_PESO_BRUTO');
  reg.PESO_LIQ := pegaValor(query160, 'QT_PESO_LIQUIDO');
  reg.UF_ID := pegaValor(query160, 'COD_ESTADO');
  reg.grava;
  reg.Free;
  reg := nil;
  fechaQuery(query160);

  RegistroC165(notaCab);
end;

procedure TFiscal.RegistroC165(notaCab: Integer);
var
  reg: TRegistroC165;
begin
  //  reg := TRegistroC165.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.RegistroC170(notaCab: Integer);
var
  reg: TRegistroC170;
  seq: Integer;
  bibSped: tBibSped;
  query170: TOracleDataSet1;
begin
  bibSped := tBibSped.Create;

  query170 := executaQuery(DmBlocoC.QReg170);
  query170.SetVariable('COD_NOTA_CAB', notaCab);
  query170.Open;

  if query170.IsEmpty then begin
    fechaQuery(query170); Exit; end;

  seq := 0;

  query170.First;
  while not query170.Eof do
  begin
    Inc(seq);
    reg := TRegistroC170.Create(TObject(Self), arquivo);
    reg.NUM_ITEM := seq;
    reg.COD_ITEM := pegaValor(query170, 'COD_PRODUTO');
    reg.DESCR_COMPL := pegaValor(query170, 'DESC_COMPLEMENTO');
    if pegaValor(query170, 'QT_QUANTIDADE') = 0 then
      reg.QTD := 1
    else
      reg.QTD := pegaValor(query170, 'QT_QUANTIDADE');
    if (pegaValor(query170, 'DESC_UNIDADE') = '') then
      reg.UNID := 'UN'
    else
      reg.UNID := pegaValor(query170, 'DESC_UNIDADE');
    reg.VL_ITEM := bibSped.ValTotalItem(
      pegaValor(query170, 'VAL_TOTAL')
      , Trunc(pegaValor(query170, 'COD_NOTA_ITEM'))
      , pegaValor(query170, 'IND_ENTRADA_SAIDA'));
    //if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DEBONA') then
//      reg.VL_DESC := calculaDesconto(reg.VL_ITEM, DmBlocoC.QReg170.Eof)
//    else
      if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'BEGNINI') then
        reg.VL_DESC := calculaDescontoRateioItens(query170.RecordCount,
          (query170.RecNo = query170.RecordCount))
      else
        reg.VL_DESC := pegaValor(query170, 'VAL_DESCONTO');
    if pegaValor(query170, 'IND_MOVIMENTA_ESTOQUE') = 'S' then
      reg.IND_MOV := '0'
    else
      reg.IND_MOV := '1';
    try
      reg.CST_ICMS := StrToInt(pegaValor(query170, 'DESC_SITUACAO_TRIB'));
    except
      reg.CST_ICMS := 0;
    end;
    reg.CFOP := pegaValor(query170, 'NUM_CFOP');
    reg.COD_NAT := pegaValor(query170, 'COD_OPERACAO');
    reg.VL_BC_ICMS := pegaValor(query170, 'VAL_ICM_BASE');
    reg.ALIQ_ICMS := pegaValor(query170, 'PERC_ALIQUOTA');
    reg.VL_ICMS := pegaValor(query170, 'VAL_ICM');
    reg.VL_BC_ICMS_ST := bibSped.ICMSST(pegaValor(query170, 'VAL_BASE_SUBST')
      , pegaValor(query170, 'IND_ENTRADA_SAIDA'));
    if bibSped.ICMSST(pegaValor(query170, 'VAL_BASE_SUBST'), pegaValor(query170, 'IND_ENTRADA_SAIDA')) > 0 then
      reg.ALIQ_ST := pegaValor(query170, 'PERC_ALIQ_SUBST')
    else
      reg.ALIQ_ST := 0;
    reg.VL_ICMS_ST := bibSped.ICMSST(pegaValor(query170, 'VAL_ICMS_SUBST')
      , pegaValor(query170, 'IND_ENTRADA_SAIDA'));
    reg.IND_APUR := '0';
    reg.CST_IPI := '';
    reg.COD_ENQ := '';
    if pegaValor(query170, 'VAL_IPI') > 0 then
      reg.VL_BC_IPI := pegaValor(query170, 'VAL_TOTAL')
    else
      reg.VL_BC_IPI := 0;
    reg.ALIQ_IPI := pegaValor(query170, 'PERC_IPI');
    reg.VL_IPI := pegaValor(query170, 'VAL_IPI');
    reg.CST_PIS := pegaValor(query170, 'COD_CST_PIS');
    if pegaValor(query170, 'VAL_PIS') > 0 then
    begin
      reg.VL_BC_PIS := bibSped.BcPisCofins(pegaValor(query170, 'VAL_TOTAL')
        , pegaValor(query170, 'VAL_ICMS_SUBST')
        , pegaValor(query170, 'IND_ENTRADA_SAIDA')
        , pegaValor(query170, 'IND_DESCONTA_ICMS_ST_PISCOFINS'));
      reg.ALIQ_PIS_PERC := pegaValor(query170, 'Perc_Pis');
//      reg.QUANT_BC_PIS := DmBlocoC.QReg170VAL_TOTAL.Value;
//      reg.ALIQ_PIS_VAL := DmBlocoC.QReg170VAL_PIS.Value;
      reg.QUANT_BC_PIS := 0;
      reg.ALIQ_PIS_VAL := 0;
      reg.VL_PIS := pegaValor(query170, 'VAL_PIS');
    end
    else
    begin
      reg.VL_BC_PIS := 0;
      reg.ALIQ_PIS_PERC := 0;
      reg.QUANT_BC_PIS := 0;
      reg.ALIQ_PIS_VAL := 0;
      reg.VL_PIS := 0;
    end;
    reg.CST_COFINS := pegaValor(query170, 'COD_CST_COFINS');
    if pegaValor(query170, 'VAL_COFINS') > 0 then
    begin
      reg.VL_BC_COFINS := bibSped.BcPisCofins(pegaValor(query170, 'VAL_TOTAL')
        , pegaValor(query170, 'VAL_ICMS_SUBST')
        , pegaValor(query170, 'IND_ENTRADA_SAIDA')
        , pegaValor(query170, 'IND_DESCONTA_ICMS_ST_PISCOFINS'));
      reg.ALIQ_COFINS_PERC := pegaValor(query170, 'Perc_Cofins');
//      reg.QUANT_BC_COFINS := DmBlocoC.QReg170VAL_TOTAL.Value;
//      reg.ALIQ_COFINS_VAL := DmBlocoC.QReg170VAL_COFINS.Value;
      reg.QUANT_BC_COFINS := 0;
      reg.ALIQ_COFINS_VAL := 0;
      reg.VL_COFINS := pegaValor(query170, 'VAL_COFINS');
    end
    else
    begin
      reg.VL_BC_COFINS := 0;
      reg.ALIQ_COFINS_PERC := 0;
      reg.QUANT_BC_COFINS := 0;
      reg.ALIQ_COFINS_VAL := 0;
      reg.VL_COFINS := 0;
    end;
    reg.COD_CTA := pegaValor(query170, 'Conta_Contabil');

    reg.grava;
    reg.Free;
    reg := nil;

    RegistroC171(notaCab);
    RegistroC172(notaCab);
    RegistroC173(notaCab);
    RegistroC174(notaCab);
    RegistroC175(notaCab);
    RegistroC176(notaCab);
    RegistroC177(notaCab);
    RegistroC178(notaCab);
    RegistroC179(notaCab);

    query170.Next;
  end;



  fechaQuery(query170);

end;

procedure TFiscal.RegistroC171(notaCab: Integer);
var
  reg: TRegistroC171;
begin
  //  reg := TRegistroC171.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.RegistroC172(notaCab: Integer);
var
  reg: TRegistroC172;
  query172: TOracleDataSet1;
begin

  query172 := executaQuery(DmBlocoC.QReg172);
  query172.SetVariable('COD_NOTA_CAB', notaCab);
  query172.Open;

  if query172.IsEmpty then begin
    fechaQuery(query172); Exit; end;

  reg := TRegistroC172.Create(TObject(Self), arquivo);
  reg.VL_BC_ISSQN := pegaValor(query172, 'VAL_BASE_ISS');
  reg.ALIQ_ISSQN := pegaValor(query172, 'PERC_ISS');
  reg.VL_ISSQN := pegaValor(query172, 'VAL_TOTAL_ISS');
  reg.grava;
  reg.Free;
  reg := nil;

  fechaQuery(query172);

end;

procedure TFiscal.RegistroC173(notaCab: Integer);
var
  reg: TRegistroC173;
begin
  //  reg := TRegistroC173.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.RegistroC174(notaCab: Integer);
var
  reg: TRegistroC174;
begin
  //  reg := TRegistroC174.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.RegistroC175(notaCab: Integer);
var
  reg: TRegistroC175;
begin
  //  reg := TRegistroC175.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.RegistroC176(notaCab: Integer);
var
  reg: TRegistroC176;
begin
  //  reg := TRegistroC176.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.RegistroC177(notaCab: Integer);
var
  reg: TRegistroC177;
begin
  //  reg := TRegistroC177.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.RegistroC178(notaCab: Integer);
var
  reg: TRegistroC178;
begin
  //  reg := TRegistroC178.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.RegistroC179(notaCab: Integer);
var
  reg: TRegistroC179;
begin
  //  reg := TRegistroC179.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.RegistroC181(notaCab: Integer);
begin

  //busca dos dados aqui

end;

procedure TFiscal.RegistroC190(notaCab: Integer);
var
  reg: TRegistroC190;
  bibSped: tBibSped;
  query190: TOracleDataSet1;
begin
  bibSped := tBibSped.Create;

  query190 := executaQuery(DmBlocoC.QReg190);
  query190.SetVariable('COD_NOTA_CAB', notaCab);
  query190.Open;

  if query190.IsEmpty then begin
    fechaQuery(query190); Exit; end;
  query190.First;
  while not query190.Eof do
  begin

    reg := TRegistroC190.Create(TObject(Self), arquivo);
    try
      reg.CST_ICMS := pegaValor(query190, 'CST_ICMS');
    except
      reg.CST_ICMS := 0;
    end;


    reg.CFOP := Trunc(pegaValor(query190, 'CFOP'));
    reg.ALIQ_ICMS := pegaValor(query190, 'ALIQ_ICMS');
    reg.VL_OPR := pegaValor(query190, 'VL_OPR');
    reg.VL_BC_ICMS := pegaValor(query190, 'VL_BC_ICMS');
    reg.VL_ICMS := pegaValor(query190, 'VL_ICMS');
    reg.VL_BC_ICMS_ST := bibSped.ICMSST(pegaValor(query190, 'VL_BC_ICMS_ST')
      , pegaValor(query190, 'IND_ENTRADA_SAIDA'));
    reg.VL_ICMS_ST := bibSped.ICMSST(pegaValor(query190, 'VL_ICMS_ST')
      , pegaValor(query190, 'IND_ENTRADA_SAIDA'));
    reg.VL_RED_BC := pegaValor(query190, 'VL_RED_BC');
    reg.VL_IPI := pegaValor(query190, 'VL_IPI');
    reg.COD_OBS := '';
    reg.grava;
    reg.Free;
    reg := nil;
    query190.Next;
  end;

  fechaQuery(query190);
end;

procedure TFiscal.RegistroC195(notaCab: Integer);
var
  reg: TRegistroC195;
  query460: TOracleDataSet1;
begin
    with DmBloco0 do
    begin

      query460 := executaQuery(DmBloco0.QReg460);
      query460.SetVariable('Dt_Inicial', wDataIni);
      query460.SetVariable('Dt_Final', wDataFin);
      query460.SetVariable('Cod_Filial', wFilial);
      query460.SetVariable('COD_NOTA', notaCab);
      query460.Open;

      if query460.IsEmpty then begin
        fechaQuery(query460); Exit; end;

      query460.First;
      reg := TRegistroC195.Create(TObject(Self), arquivo);
      reg.COD_OBS := pegaValor(query460, 'COD_OBS');
      reg.TXT_COMPL := pegaValor(query460, 'DESC_MENSAGEM');
      reg.grava;
      reg.Free;
      reg := nil;
    end;
    fechaQuery(query460);
  //RegistroC197(notaCab);
end;

procedure TFiscal.RegistroC197(notaCab: Integer);
var
  reg: TRegistroC197;
begin
  //  reg := TRegistroC197.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.RegistroC300;
var
  reg: TRegistroC300;
begin
  //  reg := TRegistroC300.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;

  RegistroC310;
  RegistroC320;
end;

procedure TFiscal.RegistroC310;
var
  reg: TRegistroC310;
begin
  //  reg := TRegistroC310.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.RegistroC320;
var
  reg: TRegistroC320;
begin
  //  reg := TRegistroC320.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
  RegistroC321;
end;

procedure TFiscal.RegistroC321;
var
  reg: TRegistroC321;
begin
  //  reg := TRegistroC321.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.RegistroC400;
var
  reg: TRegistroC400;
begin
  //  reg := TRegistroC400.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
  RegistroC405;
end;

procedure TFiscal.RegistroC405;
var
  reg: TRegistroC405;
begin
  //  reg := TRegistroC405.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
  RegistroC410;
  RegistroC420;
  RegistroC460;
  RegistroC490;
end;

procedure TFiscal.RegistroC410;
var
  reg: TRegistroC410;
begin
  //  reg := TRegistroC410.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.RegistroC420;
var
  reg: TRegistroC420;
begin
  //  reg := TRegistroC420.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
  RegistroC425;
end;

procedure TFiscal.RegistroC425;
var
  reg: TRegistroC425;
begin
  //  reg := TRegistroC425.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.RegistroC460;
var
  reg: TRegistroC460;
begin
  //  reg := TRegistroC460.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
  RegistroC470;
end;

procedure TFiscal.RegistroC470;
var
  reg: TRegistroC470;
begin
  //  reg := TRegistroC470.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.RegistroC490;
var
  reg: TRegistroC490;
begin
  //  reg := TRegistroC490.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.RegistroC495;
var
  reg: TRegistroC495;
begin
  //  reg := TRegistroC495.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.RegistroC500;
var
  reg: TRegistroC500;
  query500: TOracleDataSet1;
begin

  query500 := executaQuery(DmBlocoC.QReg500);
  query500.SetVariable('COD_FILIAL', wFilial);
  query500.SetVariable('DATA_INI', wDataIni);
  query500.SetVariable('DATA_FIN', wDataFin);
  query500.Open;

  if query500.IsEmpty then begin
    fechaQuery(query500); Exit; end;

  query500.First;
  while not query500.Eof do
  begin
    reg := TRegistroC500.Create(TObject(Self), arquivo);
    if pegaValor(query500, 'IND_ENTRADA_SAIDA') = 'E' then
      reg.IND_OPER := '0'
    else
      reg.IND_OPER := '1';
    if pegaValor(query500, 'IND_EMITE') = 'F' then
      reg.IND_EMIT := '0'
    else
      reg.IND_EMIT := '1';
    reg.COD_MOD := pegaValor(query500, 'COD_SERIE_MODELO');
    if pegaValor(query500, 'IND_SITUACAO') = '2' then
      reg.COD_SIT := 0
    else
      reg.COD_SIT := 1;
    if pegaValor(query500, 'NUM_SERIE_FISCAL') > 0 then
      reg.SER := pegaValor(query500, 'NUM_SERIE_FISCAL')
    else
      reg.SER := pegaValor(query500, 'COD_SERIE');
    reg.NUM_DOC := pegaValor(query500, 'NUM_NOTA');
    reg.DT_DOC := pegaValor(query500, 'DT_EMISSAO');
    if pegaValor(query500, 'IND_SITUACAO') = '2' then // quando nota cancelada nao apresenta esta informacao
    begin
      reg.COD_PART := pegaValor(query500, 'COD_CADASTRO');
      reg.DT_E_S := pegaValor(query500, 'DT_RECEBIMENTO');
      reg.VL_DOC := pegaValor(query500, 'VAL_TOTAL');
      reg.VL_DESC := pegaValor(query500, 'VAL_DESCONTO');
      reg.VL_SERV_NT := pegaValor(query500, 'VL_SERV_NT');
      reg.VL_FORN := pegaValor(query500, 'VAL_MERCADORIAS');
      reg.VL_DA := pegaValor(query500, 'VAL_DESPESAS');
      reg.VL_BC_ICMS := pegaValor(query500, 'VAL_ICM_BASE');
      reg.VL_ICMS := pegaValor(query500, 'VAL_ICM');
      reg.VL_BC_ICMS_ST := pegaValor(query500, 'VAL_BASE_SUBST');
      reg.VL_ICMS_ST := pegaValor(query500, 'VAL_ICMS_SUBST');
      reg.VL_PIS := pegaValor(query500, 'VAL_PIS');
      reg.VL_COFINS := pegaValor(query500, 'VAL_CONFINS');
      if reg.COD_MOD <> '66' then
      begin
        reg.COD_CONS := pegaValor(query500, 'COD_CLASSE_CONSUMO');
        reg.TP_LIGACAO := pegaValor(query500, 'IND_TIPO_ENERGIA');
        reg.COD_GRUPO_TENSAO := pegaValor(query500, 'COD_ENERGIA_TENSAO');
      end
      else
      begin
        reg.COD_CONS := '';
        reg.TP_LIGACAO := '';
        reg.COD_GRUPO_TENSAO := '';
        reg.FIN_DOCe := '1';  // FINALIDADE É SEMPRE NORMAL. CASO HAJA SUBSTITUIÇÃO OU OUTRA SITUAÇÃO PRECISA
                              // NOVO CAMPO NA NOTA PARA CONTROLE
      end;
      reg.CHV_DOCe := pegaValor(query500, 'DESC_CHAVE_ACESSO');
    end;

    reg.grava;
    reg.Free;
    reg := nil;

    if pegaValor(query500, 'IND_ENTRADA_SAIDA') = 'E' then
      RegistroC510;
    RegistroC590(pegaValor(query500, 'COD_NOTA_CAB'));

    query500.Next;
  end;

  fechaQuery(query500);
end;

procedure TFiscal.RegistroC510;
var
  reg: TRegistroC510;
begin
  //  reg := TRegistroC510.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.RegistroC590(notaCab: Integer);
var
  reg: TRegistroC590;
  query590: TOracleDataSet1;
begin

  query590 := executaQuery(DmBlocoC.QReg590);
  query590.SetVariable('COD_NOTA_CAB', notaCab);
  query590.Open;

  if query590.IsEmpty then begin
    fechaQuery(query590); Exit; end;

  query590.First;
  while not query590.Eof do
  begin
    reg := TRegistroC590.Create(TObject(Self), arquivo);
    try
      reg.CST_ICMS := pegaValor(query590, 'CST_ICMS');
    except
      reg.CST_ICMS := 0;
    end;
    reg.CFOP := Trunc(pegaValor(query590, 'CFOP'));
    reg.ALIQ_ICMS := pegaValor(query590, 'ALIQ_ICMS');
    reg.VL_OPR := pegaValor(query590, 'VL_OPR');
    reg.VL_BC_ICMS := pegaValor(query590, 'VL_BC_ICMS');
    reg.VL_ICMS := pegaValor(query590, 'VL_ICMS');
    reg.VL_BC_ICMS_ST := pegaValor(query590, 'VL_BC_ICMS_ST');
    reg.VL_ICMS_ST := pegaValor(query590, 'VL_ICMS_ST');
    reg.VL_RED_BC := pegaValor(query590, 'VL_RED_BC');
//    reg.VL_IPI := DmBlocoC.QReg590VL_IPI.Value;
    reg.COD_OBS := '';
    reg.grava;
    reg.Free;
    reg := nil;

    query590.Next;
  end;

  fechaQuery(query590);
end;

procedure TFiscal.RegistroC600;
var
  reg: TRegistroC600;
begin
  //  reg := TRegistroC600.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;

  RegistroC601;
  RegistroC610;
  RegistroC690;
end;

procedure TFiscal.RegistroC601;
var
  reg: TRegistroC601;
begin
  //  reg := TRegistroC601.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.RegistroC610;
var
  reg: TRegistroC610;
begin
  //  reg := TRegistroC610.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.RegistroC690;
var
  reg: TRegistroC690;
begin
  //  reg := TRegistroC690.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.RegistroC700;
var
  reg: TRegistroC700;
begin
  //  reg := TRegistroC700.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;

  RegistroC790;
end;

procedure TFiscal.RegistroC790;
var
  reg: TRegistroC790;
begin
  //  reg := TRegistroC790.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;

  RegistroC791;
end;

procedure TFiscal.RegistroC791;
var
  reg: TRegistroC791;
begin
  //  reg := TRegistroC791.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.RegistroC990(QtdLinhas: Double);
var
  reg: TRegistroC990;
begin
  reg := TRegistroC990.Create(TObject(Self), arquivo);
  reg.QTD_LIN_C := QtdLinhas;
  reg.grava;
  reg.Free;
  reg := nil;
end;

procedure TFiscal.Registro9999(QtdLinhas: Double);
var
  reg: TRegistro9999;
begin
  reg := TRegistro9999.Create(TObject(Self), arquivo);
  reg.QTD_LIN := QtdLinhas;
  reg.grava;
  reg.Free;
  reg := nil;
end;

procedure TFiscal.RegistroD001;
var
  reg: TRegistroD001;
begin
  reg := TRegistroD001.Create(TObject(Self), arquivo);
  reg.IND_MOV := 1;
  reg.grava;
  reg.Free;
  reg := nil;

  RegistroD100;
  RegistroD300;
  RegistroD350;
  RegistroD400;
  RegistroD500;
  RegistroD600;
  RegistroD695;
end;

procedure TFiscal.RegistroD100;
var
  reg: TRegistroD100;
  nCodCon: Integer;
  sCodConRef, sChaveConRef: String;
begin
  DmBlocoD.QReg100.Close;
  DmBlocoD.QReg100.SetVariable('Dt_Inicial', wDataIni);
  DmBlocoD.QReg100.SetVariable('Dt_Final', wDataFin);
  DmBlocoD.QReg100.SetVariable('Cod_Filial', wFilial);
  DmBlocoD.QReg100.Open;

  if DmBlocoD.QReg100.IsEmpty then
    Exit;

  DmBlocoD.QReg100.First;
  while not DmBlocoD.QReg100.Eof do
  begin
    reg := TRegistroD100.Create(TObject(Self), arquivo);
    if DmBlocoD.QReg100IND_TIPO_OPERACAO.Value = 'E' then
      reg.IND_OPER := '0'
    else
      reg.IND_OPER := '1';
   if DmBlocoD.QReg100IND_EMITE.Value = 'F' then
      reg.IND_EMIT := '0'
    else
      reg.IND_EMIT := '1';

    reg.COD_MOD := DmBlocoD.QReg100COD_SERIE_MODELO.Value;
    if DmBlocoD.QReg100IND_SITUACAO.Value = '2' then
      reg.COD_SIT := 0
    else
      reg.COD_SIT := 2;
    if DMBlocoD.QReg100NUM_SERIE_FISCAL.Value > 0 then
      reg.SER := DmBlocoD.QReg100NUM_SERIE_FISCAL.Text
    else
      reg.SER := DMBlocoD.QReg100COD_SERIE.Value;
    reg.SUB := '';
    reg.NUM_DOC := Trunc(DmBlocoD.QReg100NUM_CONHECIMENTO.Value);
    //Esse bloco é para ctes cancelados/inutilizados - Junior 18/12/2013
    if DmBlocoD.QReg100IND_SITUACAO.Value <> '2' then
    begin
      if AnsiUpperCase(Copy(DmBlocoD.QReg100DESC_CHAVE_ACESSO_CTE.Value,1,3)) = 'CTE' then
        reg.CHV_CTE := Copy(DmBlocoD.QReg100DESC_CHAVE_ACESSO_CTE.Value,4,Length(DmBlocoD.QReg100DESC_CHAVE_ACESSO_CTE.Value))
      else
        reg.CHV_CTE := DmBlocoD.QReg100DESC_CHAVE_ACESSO_CTE.Value;
      if wDataIni >= StrToDate('01/01/2018') then
      begin
        reg.COD_MUN_ORIG := '';
        reg.COD_MUN_DEST := '';
      end;
    end
    else
    begin
      reg.TP_CT_e := DmBlocoD.QReg100IND_TIPO_CTE.Value;
      if DmBlocoD.QReg100IND_SITUACAO.Value = '2' then
        // quando nota cancelada nao apresenta esta informacao
      begin
        reg.COD_PART := DmBlocoD.QReg100COD_CADASTRO.Text;

        if (DmBlocoD.QReg100IND_TIPO_OPERACAO.Value = 'E') and
          (DMParamSistema.CodEmpresa = 'CGS') then
        begin
          //caso nota de entrada com emissão em mês anterior (transporte com
          //emissão de nota e recebimento posterior
          if ((DmBlocoD.QReg100DT_EMISSAO.Value < wDataIni)
            and (DmBlocoD.QReg100DT_RECEBIMENTO.Value > wDataFin)) then
            reg.COD_SIT := 1;

          if ((DmBlocoD.QReg100DT_EMISSAO.Value < wDataIni)
            and (DmBlocoD.QReg100DT_RECEBIMENTO.Value < wDataIni)) then
            reg.COD_SIT := 1;
        end;

        reg.DT_DOC := DmBlocoD.QReg100DT_EMISSAO.Value;
        reg.DT_A_P := DmBlocoD.QReg100DT_RECEBIMENTO.Value;
        reg.VL_DOC := DmBlocoD.QReg100VAL_TOTAL.Value;
        reg.VL_DESC := DmBlocoD.QReg100VAL_DESCONTO.Value;
        reg.IND_FRT := '1';
        reg.VL_SERV := DmBlocoD.QReg100val_servico.Value;
        reg.VL_BC_ICMS := DmBlocoD.QReg100VAL_BASE_CALCULO.Value;
        reg.VL_ICMS := DmBlocoD.QReg100VAL_ICMS.Value;
        reg.VL_NT := DmBlocoD.QReg100VAL_NAO_TRIBUTADO.Value;
        reg.COD_INF := '';
        reg.VL_PIS := DmBlocoD.QReg100VAL_PIS.Value;
        reg.VL_COFINS := DmBlocoD.QReg100VAL_COFINS.Value;
        reg.COD_CTA := '';
        if AnsiUpperCase(Copy(DmBlocoD.QReg100DESC_CHAVE_ACESSO_CTE.Value,1,3)) = 'CTE' then
          reg.CHV_CTE := Copy(DmBlocoD.QReg100DESC_CHAVE_ACESSO_CTE.Value,4,Length(DmBlocoD.QReg100DESC_CHAVE_ACESSO_CTE.Value))
        else
          reg.CHV_CTE := DmBlocoD.QReg100DESC_CHAVE_ACESSO_CTE.Value;
        if wDataIni >= StrToDate('01/01/2018') then
        begin
          reg.COD_MUN_ORIG := DmBlocoD.QReg100COD_MUN_ORIG.Value;
          reg.COD_MUN_DEST := DmBlocoD.QReg100COD_MUN_DEST.Value;
        end;
      end;
    end;
    if (reg.TP_CT_e = '3') or (reg.TP_CT_e = '6') then
      reg.CHV_CTE_REF := DmBlocoD.QReg100DESC_CHAVE_ACESSO_REF.Value;
    reg.grava;
    reg.Free;
    reg := nil;
    //daqui pra baixo não foi mexido.
    if DmBlocoD.QReg100IND_SITUACAO.Value = '2' then
      // quando nota cancelada nao apresenta esta informacao
    begin
      RegistroD110;
      RegistroD120;
      if DmBlocoD.QReg100IND_TIPO_OPERACAO.Value = 'S' then
        if ((DmBlocoD.QReg100COD_SERIE_MODELO.Value = '08') or (DmBlocoD.QReg100COD_SERIE_MODELO.Value = '8B')) then
          RegistroD130(Trunc(DmBlocoD.QReg100COD_CONHECIMENTO.Value));
      RegistroD140;
      RegistroD150;
      RegistroD160;
      RegistroD170;
      RegistroD180;
      RegistroD190;
    end;
    DmBlocoD.QReg100.Next;
  end;
  DmBlocoD.QReg590.Close;
end;

procedure TFiscal.RegistroD110;
var
  reg: TRegistroD110;
begin
  //  reg := TRegistroD110.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.RegistroD120;
var
  reg: TRegistroD120;
begin
  //  reg := TRegistroD120.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.RegistroD130(pCod_Conhecimento: Integer);
var
  reg: TRegistroD130;
begin
  //
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;

  DmBlocoD.QReg130.Close;
  DmBlocoD.QReg130.SetVariable('COD_CONHECIMENTO', pCod_Conhecimento);
  DmBlocoD.QReg130.Open;

  if DmBlocoD.QReg130.IsEmpty then
    Exit;

  reg := TRegistroD130.Create(TObject(Self), arquivo);
  reg.COD_PART_CONSG := '';
  reg.COD_PART_RED := '';
  reg.IND_FRT_RED := '0';
  reg.COD_MUN_ORIG := StrToInt(FormatFloat('00',
    SomenteNumerosEConverte(DmBlocoD.QReg130COD_UF_IBGE_ORIGEM.Text)) +
    FormatFloat('00000',
    SomenteNumerosEConverte(DmBlocoD.QReg130COD_CIDADE_IBGE_ORIGEM.Text)));
  reg.COD_MUN_DEST := StrToInt(FormatFloat('00',
    SomenteNumerosEConverte(DmBlocoD.QReg130COD_UF_IBGE_DESTINO.Text)) +
    FormatFloat('00000',
    SomenteNumerosEConverte(DmBlocoD.QReg130COD_CIDADE_IBGE_DESTINO.Text)));
  reg.VEIC_ID := DmBlocoD.QReg130DESC_PLACA.Value;
  reg.VL_LIQ_FRT := DmBlocoD.QReg130VAL_LIQUIDO.Value;
  reg.VL_SEC_CAT := 0;
  reg.VL_DESP := 0;
  reg.VL_PEDG := DmBlocoD.QReg130VAL_PEDAGIO.Value;
  reg.VL_OUT := 0;
  reg.VL_FRT := DmBlocoD.QReg130VAL_FRETE.Value;
  reg.grava;
  reg.Free;
  reg := nil;
end;

procedure TFiscal.RegistroD140;
var
  reg: TRegistroD140;
begin
  //  reg := TRegistroD140.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.RegistroD150;
var
  reg: TRegistroD150;
begin
  //  reg := TRegistroD150.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.RegistroD160;
var
  reg: TRegistroD160;
begin
  //  reg := TRegistroD160.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
  RegistroD161;
end;

procedure TFiscal.RegistroD161;
var
  reg: TRegistroD161;
begin
  //  reg := TRegistroD161.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.RegistroD170;
var
  reg: TRegistroD170;
begin
  //  reg := TRegistroD170.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.RegistroD180;
var
  reg: TRegistroD180;
begin
  //  reg := TRegistroD180.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.RegistroD190;
var
  reg: TRegistroD190;
begin
  reg := TRegistroD190.Create(TObject(Self), arquivo);
  reg.CST_ICMS := StrToInt(DmBlocoD.QReg100CST_ICMS.Value);
  reg.CFOP := Trunc(DmBlocoD.QReg100CFOP.Value);
  reg.ALIQ_ICMS := DmBlocoD.QReg100ALIQ_ICMS.Value;
  reg.VL_OPR := DmBlocoD.QReg100VAL_TOTAL.Value;
  reg.VL_BC_ICMS := DmBlocoD.QReg100VAL_BASE_CALCULO.Value;
  reg.VL_ICMS := DmBlocoD.QReg100VAL_ICMS.Value;
  reg.VL_RED_BC := 0;
  reg.COD_OBS := '';
  reg.grava;
  reg.Free;
  reg := nil;
end;

procedure TFiscal.RegistroD300;
var
  reg: TRegistroD300;
begin
  //  reg := TRegistroD300.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
  RegistroD301;
  RegistroD310;
end;

procedure TFiscal.RegistroD301;
var
  reg: TRegistroD301;
begin
  //  reg := TRegistroD301.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.RegistroD310;
var
  reg: TRegistroD310;
begin
  //  reg := TRegistroD310.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.RegistroD350;
var
  reg: TRegistroD350;
begin
  //  reg := TRegistroD350.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
  RegistroD355;
end;

procedure TFiscal.RegistroD355;
var
  reg: TRegistroD355;
begin
  //  reg := TRegistroD355.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
  RegistroD360;
  RegistroD365;
  RegistroD390;
end;

procedure TFiscal.RegistroD360;
var
  reg: TRegistroD360;
begin
  //  reg := TRegistroD360.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.RegistroD365;
var
  reg: TRegistroD365;
begin
  //  reg := TRegistroD365.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
  RegistroD370;
end;

procedure TFiscal.RegistroD370;
var
  reg: TRegistroD370;
begin
  //  reg := TRegistroD370.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.RegistroD390;
var
  reg: TRegistroD390;
begin
  //  reg := TRegistroD390.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.RegistroD400;
var
  reg: TRegistroD400;
begin
  //  reg := TRegistroD400.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
  RegistroD410;
  RegistroD420;
end;

procedure TFiscal.RegistroD410;
var
  reg: TRegistroD410;
begin
  //  reg := TRegistroD410.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
  RegistroD411;
end;

procedure TFiscal.RegistroD411;
var
  reg: TRegistroD411;
begin
  //  reg := TRegistroD411.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.RegistroD420;
var
  reg: TRegistroD420;
begin
  //  reg := TRegistroD420.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.RegistroD500;
var
  reg: TRegistroD500;
begin
  DmBlocoD.QReg500.Close;
  DmBlocoD.QReg500.SetVariable('COD_FILIAL', wFilial);
  DmBlocoD.QReg500.SetVariable('Dt_Inicial', wDataIni);
  DmBlocoD.QReg500.SetVariable('Dt_Final', wDataFin);
  DmBlocoD.QReg500.Open;

  DmBlocoD.QReg500.First;
  if DmBlocoD.QReg500.IsEmpty then
    Exit;

  while not DmBlocoD.QReg500.Eof do
  begin
    reg := TRegistroD500.Create(TObject(Self), arquivo);
    reg.IND_OPER := '0';
    reg.IND_EMIT := '1';
    reg.COD_PART := DmBlocoD.QReg500COD_PART.Value;
    reg.COD_MOD := DmBlocoD.QReg500COD_MOD.Text;
    if DmBlocoD.QReg500COD_SIT.Value = '2' then
      reg.COD_SIT := 0
    else
      reg.COD_SIT := 1;
    if DMBlocoD.QReg500NUM_SERIE_FISCAL.Value > 0 then
      reg.SER := DmBlocoD.QReg500NUM_SERIE_FISCAL.Text
    else
      reg.SER := DmBlocoD.QReg500COD_SERIE.Value;
    reg.NUM_DOC := DmBlocoD.QReg500NUM_DOC.AsInteger;
    reg.DT_DOC := DmBlocoD.QReg500DT_DOC.Value;
    reg.DT_A_P := DmBlocoD.QReg500DT_A_P.Value;
    reg.VL_DOC := DmBlocoD.QReg500VAL_DOC.Value;
    reg.VL_BC_ICMS := DmBlocoD.QReg500VL_BC_ICMS.Value;
    reg.VL_SERV := DmBlocoD.QReg500VAL_SERV.Value;
    reg.VL_ICMS := DmBlocoD.QReg500VL_ICMS.Value;
    reg.TP_ASSINANTE := 1;
    reg.grava;
    reg.Free;
    reg := nil;
    RegistroD590(DMBlocoD.QReg500COD_NOTA_CAB.Value);
    DmBlocoD.QReg500.Next;
  end;
  DmBlocoD.QReg500.Close;
  //  RegistroD510;
  //  RegistroD530;

end;

procedure TFiscal.RegistroD510;
var
  reg: TRegistroD510;
begin
  //  reg := TRegistroD510.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.RegistroD530;
var
  reg: TRegistroD530;
begin
  //  reg := TRegistroD530.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.RegistroD590(pCodigo: Integer);
var
  reg: TRegistroD590;
begin
  DmBlocoD.QReg590.Close;
  DmBlocoD.QReg590.SetVariable('COD_NOTA', pCodigo);
  DmBlocoD.QReg590.Open;

  DmBlocoD.QReg590.First;
  if DmBlocoD.QReg590.IsEmpty then
    Exit;
  reg := TRegistroD590.Create(TObject(Self), arquivo);
  while not DmBlocoD.QReg590.Eof do
  begin

    try
      reg.CST_ICMS := StrToInt(DmBlocoD.QReg590CST_ICMS.Value);
    except
      reg.CST_ICMS := 0;
    end;

    reg.CFOP := Trunc(DmBlocoD.QReg590CFOP.Value);
    reg.ALIQ_ICMS := DmBlocoD.QReg590ALIQ_ICMS.Value;
    reg.VL_OPR := DmBlocoD.QReg590VL_OPR.Value;
    reg.VL_BC_ICMS := DmBlocoD.QReg590VL_BC_ICMS.Value;
    reg.VL_ICMS := DmBlocoD.QReg590VL_ICMS.Value;
    reg.VL_BC_ICMS_ST := DmBlocoD.QReg590VL_BC_ICMS_ST.Value;
    reg.VL_ICMS_ST := DmBlocoD.QReg590VL_ICMS_ST.Value;
    reg.VL_RED_BC := DmBlocoD.QReg590VL_RED_BC.Value;
    reg.grava;
    DmBlocoD.QReg590.Next;
  end;
  reg.Free;
  reg := nil;
  DmBlocoD.QReg590.Close;
end;

procedure TFiscal.RegistroD600;
var
  reg: TRegistroD600;
begin
  //  reg := TRegistroD600.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
  RegistroD610;
  RegistroD690;
end;

procedure TFiscal.RegistroD610;
var
  reg: TRegistroD610;
begin
  //  reg := TRegistroD610.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.RegistroD690;
var
  reg: TRegistroD690;
begin
  //  reg := TRegistroD690.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.RegistroD695;
var
  reg: TRegistroD695;
begin
  //  reg := TRegistroD695.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
  RegistroD696;
end;

procedure TFiscal.RegistroD696;
var
  reg: TRegistroD696;
begin
  //  reg := TRegistroD696.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
  RegistroD697;
end;

procedure TFiscal.RegistroD697;
var
  reg: TRegistroD697;
begin
  //  reg := TRegistroD697.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.RegistroD990(QtdLinhas: Double);
var
  reg: TRegistroD990;
begin
  reg := TRegistroD990.Create(TObject(Self), arquivo);
  reg.QTD_LIN_D := QtdLinhas;
  reg.grava;
  reg.Free;
  reg := nil;
end;

procedure TFiscal.RegistroE001;
var
  reg: TRegistroE001;
begin
  reg := TRegistroE001.Create(TObject(Self), arquivo);
  reg.IND_MOV := 1;
  reg.grava;
  reg.Free;
  reg := nil;

  RegistroE100;
  RegistroE200;
  if wAtividade = 'I' then
    RegistroE500;
end;

procedure TFiscal.RegistroE100;
var
  reg: TRegistroE100;
begin
  reg := TRegistroE100.Create(TObject(Self), arquivo);
  reg.DT_INI := wDataIni;
  reg.DT_FIN := wDataFin;
  reg.grava;
  reg.Free;
  reg := nil;
  RegistroE110;
end;

procedure TFiscal.RegistroE110;
var
  reg: TRegistroE110;
  wAno, wMes, wDia: Word;
  wSaldoApurado: Double;
  valorRecolher: Double;
begin
  DecodeDate(wDataFin, wAno, wMes, wDia);
  DMGia.QGia.Close;
  DMGia.QGia.SetVariable('Filial', wFilial);
  DMGia.QGia.SetVariable('ANO', wAno);
  DMGia.QGia.SetVariable('MES', wMes);
  DMGia.QGia.Open;
  reg := TRegistroE110.Create(TObject(Self), arquivo);
  if DMGia.QGiaVal_51.Value > 0 then
    reg.VL_TOT_DEBITOS := DMGia.QGiaVal_51.Value
  else
    reg.VL_TOT_DEBITOS := 0;
  reg.VL_AJ_DEBITOS := 0;
  if (DMGia.QGiaVal_52.Value + DMGia.QGiaVal_54.Value + DMGia.QGiaVal_55.Value +
    DMGia.QGiaVal_56.Value + DMGia.QGiaVal_58.Value + DMGia.QGiaVal_59.Value) > 0
    then
    reg.VL_TOT_AJ_DEBITOS := DMGia.QGiaVal_52.Value + DMGia.QGiaVal_54.Value +
      DMGia.QGiaVal_55.Value + DMGia.QGiaVal_56.Value + DMGia.QGiaVal_58.Value +
      DMGia.QGiaVal_59.Value
  else
    reg.VL_TOT_AJ_DEBITOS := 0;
  if DMGia.QGiaVal_53.Value > 0 then
    reg.VL_ESTORNOS_CRED := DMGia.QGiaVal_53.Value
  else
    reg.VL_ESTORNOS_CRED := 0;

  // os registros 67 em alguns casos são creditados pela nota (por cfop)
  // e devem contemplar o total de créditos e não entrar como ajuste
  //Se for o caso de ter que entrar como ajuste, tem que configurar a nota
  //para não creditar icms
  if (DMGia.QGiaVal_62.Value > 0)  then
    reg.VL_TOT_CREDITOS := bibSped.ArrumaAjustesGIA(DMGia.QGiaVal_62.Value
      , DMGia.QGiaval_66.Value)
  else
    reg.VL_TOT_CREDITOS := 0;
  reg.VL_AJ_CREDITOS := 0;

  if (DMGia.QGiaVal_63.Value + DMGia.QGiaVal_65.Value + DMGia.QGiaVal_66.Value +
    DMGia.QGiaVAL_69.Value + DMGia.QGiaVAL_67.Value) > 0 then
    reg.VL_TOT_AJ_CREDITOS := DMGia.QGiaVal_63.Value + DMGia.QGiaVal_65.Value +
      DMGia.QGiaVal_66.Value + DMGia.QGiaVAL_69.Value + DMGia.QGiaVAL_67.Value
  else
    reg.VL_TOT_AJ_CREDITOS := 0;
  reg.VL_TOT_AJ_CREDITOS := reg.VL_TOT_AJ_CREDITOS + DMGia.QGiaVAL_68.Value;


  reg.VL_TOT_AJ_CREDITOS := bibSped.ArrumaAjustesGIA(reg.VL_TOT_AJ_CREDITOS
    , DMGia.QGiaval_66.Value, 'DIMINUI');

  if DMGia.QGiaVal_64.Value > 0 then
    reg.VL_ESTORNOS_DEB := DMGia.QGiaVal_64.Value
  else
    reg.VL_ESTORNOS_DEB := 0;
  if DMGia.QGiaVal_61.Value > 0 then
    reg.VL_SLD_CREDOR_ANT := DMGia.QGiaVal_61.Value
  else
    reg.VL_SLD_CREDOR_ANT := 0;
  reg.VL_SLD_APURADO := reg.VL_TOT_DEBITOS + reg.VL_AJ_DEBITOS +
    reg.VL_TOT_AJ_DEBITOS + reg.VL_ESTORNOS_CRED -
    reg.VL_TOT_CREDITOS - reg.VL_AJ_CREDITOS - reg.VL_TOT_AJ_CREDITOS -
    reg.VL_ESTORNOS_DEB - reg.VL_SLD_CREDOR_ANT;
  wSaldoApurado := reg.VL_TOT_DEBITOS + reg.VL_AJ_DEBITOS + reg.VL_TOT_AJ_DEBITOS
    + reg.VL_ESTORNOS_CRED - reg.VL_TOT_CREDITOS - reg.VL_AJ_CREDITOS -
    reg.VL_TOT_AJ_CREDITOS - reg.VL_ESTORNOS_DEB - reg.VL_SLD_CREDOR_ANT;
  if wSaldoApurado >= 0 then
  begin
    reg.VL_SLD_APURADO := wSaldoApurado;
    reg.VL_SLD_CREDOR_TRANSPORTAR := 0;
  end
  else
  begin
    reg.VL_SLD_APURADO := 0;
    reg.VL_SLD_CREDOR_TRANSPORTAR := wSaldoApurado * (-1);
  end;
  reg.VL_TOT_DED := 0;
  reg.VL_ICMS_RECOLHER := reg.VL_SLD_APURADO - reg.VL_TOT_DED;
  reg.DEB_ESP := 0;

  valorRecolher := reg.VL_ICMS_RECOLHER;

  reg.grava;
  reg.Free;
  reg := nil;

  RegistroE111;
  RegistroE115;
  valorRecolher := SimpleRoundTo(valorRecolher);
  if valorRecolher > 0 then
    RegistroE116(valorRecolher);
end;

procedure TFiscal.RegistroE111;
var
  reg: TRegistroE111;
  tot0, tot1, tot2, tot3, tot4, tot5: Integer;
  wAno, wMes, wDia, wAnoIni, wMesIni, wDiaIni: Word;
  bibSped: TBibSped;
begin
  DecodeDate(wDataFin, wAno, wMes, wDia);
  DecodeDate(wDataIni, wAnoIni, wMesIni, wDiaIni);
  DmBlocoE.QReg111.Close;
  DmBlocoE.QReg111.SetVariable('COD_FILIAL', wFilial);
  DmBlocoE.QReg111.SetVariable('NUM_ANO', wAno);
  DmBlocoE.QReg111.SetVariable('NUM_MES', wMes);
  DmBlocoE.QReg111.Open;

  tot0 := 0;
  tot1 := 0;
  tot2 := 0;
  tot3 := 0;
  tot4 := 0;
  tot5 := 0;

  DmBlocoE.QReg111.First;
  while not (DmBlocoE.QReg111.Eof) do
  begin
    reg := TRegistroE111.Create(TObject(Self), arquivo);

    if DmBlocoE.QReg111Cod_Gia.Value = 52 then
      reg.COD_AJ_APUR := 'PR009999';
    if DmBlocoE.QReg111Cod_Gia.Value = 53 then
      reg.COD_AJ_APUR := 'PR019999';
    if DmBlocoE.QReg111Cod_Gia.Value = 54 then
      reg.COD_AJ_APUR := 'PR000081';
    if DmBlocoE.QReg111Cod_Gia.Value = 55 then
      reg.COD_AJ_APUR := 'PR000062';
    if DmBlocoE.QReg111Cod_Gia.Value = 56 then
      reg.COD_AJ_APUR := 'PR010022';
    if DmBlocoE.QReg111Cod_Gia.Value = 59 then
      reg.COD_AJ_APUR := 'PR000072';
    if DmBlocoE.QReg111Cod_Gia.Value = 63 then
      reg.COD_AJ_APUR := 'PR029999';
    if DmBlocoE.QReg111Cod_Gia.Value = 64 then
      reg.COD_AJ_APUR := 'PR039999';
    if DmBlocoE.QReg111Cod_Gia.Value = 65 then
      reg.COD_AJ_APUR := 'PR020061';
    if DmBlocoE.QReg111Cod_Gia.Value = 66 then
      reg.COD_AJ_APUR := 'PR020021';
    if DmBlocoE.QReg111Cod_Gia.Value = 67 then
      reg.COD_AJ_APUR := 'PR020041';
    if DmBlocoE.QReg111Cod_Gia.Value = 68 then
      reg.COD_AJ_APUR := 'PR029999';
    if DmBlocoE.QReg111Cod_Gia.Value = 69 then
      reg.COD_AJ_APUR := 'PR029999';

    bibSped := TBibSped.Create;
    reg.COD_AJ_APUR := bibSped.PersonalizaE111(reg.COD_AJ_APUR);

    reg.DESCR_COMPL_AJ := DmBlocoE.QReg111Desc_Lcto.Value;
    reg.VL_AJ_APUR := DmBlocoE.QReg111Val_Imposto.Value;
    reg.grava;
    reg.Free;
    reg := nil;

    DmBlocoE.QReg111.Next;
  end;
  DmBlocoE.QReg111.Close;
  DMGia.QGia.Close;

  RegistroE112;
  RegistroE113;
end;

procedure TFiscal.RegistroE112;
var
  reg: TRegistroE112;
begin
  //  reg := TRegistroE112.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.RegistroE113;
var
  reg: TRegistroE113;
begin
  //  reg := TRegistroE113.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.RegistroE115;
var
  reg: TRegistroE115;
begin
  //  reg := TRegistroE115.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.RegistroE116(valor: Double);
var
  reg: TRegistroE116;
  wAno, wMes, wDia, wAnoIni, wMesIni, wDiaIni: Word;
begin
  DecodeDate(wDataFin, wAno, wMes, wDia);
  DecodeDate(wDataIni, wAnoIni, wMesIni, wDiaIni);
  DmBlocoE.QReg116.Close;
  DmBlocoE.QReg116.SetVariable('COD_FILIAL', wFilial);
  DmBlocoE.QReg116.SetVariable('NUM_ANO', wAno);
  DmBlocoE.QReg116.SetVariable('NUM_MES', wMes);
  DmBlocoE.QReg116.Open;

  reg := TRegistroE116.Create(TObject(Self), arquivo);
  if Trim(DMBlocoE.QReg116IND_ORIGEM.Value) <> '' then
    reg.COD_OR := FormatFloat('000', StrToFloat(DMBlocoE.QReg116IND_ORIGEM.Value))
  else
    reg.COD_OR := DmBlocoE.QReg116IND_ORIGEM.Value;
  reg.VL_OR := valor;
  reg.DT_VCTO := DmBlocoE.QReg116DT_VENCIMENTO_RECOLHIMENTO.Value;
  reg.COD_REC := DmBlocoE.QReg116COD_RECEITA.Text;
  reg.NUM_PROC := DmBlocoE.QReg116NUM_PROCESSO.Value;
  if reg.NUM_PROC <> '' then
  begin
    reg.IND_PROC := DmBlocoE.QReg116IND_PROCESSO.Text;
    reg.PROC := DmBlocoE.QReg116DESC_PROCESSO.Value;
  end;
  reg.TXT_COMPL := '';
  reg.MES_REF := StrToInt(IntToStr(wMesIni) + IntToStr(wAno));
  reg.grava;
  reg.Free;
  reg := nil;
end;

procedure TFiscal.RegistroE200;
var
  reg: TRegistroE200;
begin
  DmBlocoE.QReg200.Close;
  DmBlocoE.QReg200.SetVariable('COD_FILIAL', wFilial);
  DmBlocoE.QReg200.SetVariable('DATA_INI', wDataIni);
  DmBlocoE.QReg200.SetVariable('DATA_FIN', wDataFin);
  DmBlocoE.QReg200.Open;
  DmBlocoE.QReg200.First;

  while not DmBlocoE.QReg200.Eof do
  begin
    reg := TRegistroE200.Create(TObject(Self), arquivo);
    reg.UF := DmBlocoE.QReg200COD_ESTADO.Value;
    reg.DT_INI := wDataIni;
    reg.DT_FIN := wDataFin;
    reg.grava;
    reg.Free;
    reg := nil;

    RegistroE210(DmBlocoE.QReg200COD_ESTADO.Value);

    DmBlocoE.QReg200.Next;
  end;
end;

procedure TFiscal.RegistroE210(uf: string);
var
  reg: TRegistroE210;
begin
  DmBlocoE.QReg210.Close;
  DmBlocoE.QReg210.SetVariable('COD_FILIAL', wFilial);
  DmBlocoE.QReg210.SetVariable('DATA_INI', wDataIni);
  DmBlocoE.QReg210.SetVariable('DATA_FIN', wDataFin);
  DmBlocoE.QReg210.SetVariable('COD_ESTADO', uf);
  DmBlocoE.QReg210.Open;
  DmBlocoE.QReg210.First;

  if DmBlocoE.QReg210.IsEmpty then
  begin
    reg := TRegistroE210.Create(TObject(Self), arquivo);
    reg.IND_MOV_ST := '0';
    reg.grava;
    reg.Free;
    reg := nil;

    Exit;
  end;

  while not DmBlocoE.QReg210.Eof do
  begin
    reg := TRegistroE210.Create(TObject(Self), arquivo);
    reg.IND_MOV_ST := DmBlocoE.QReg210IND_MOV_ST.Value;
    reg.VL_SLD_CRED_ANT_ST := DmBlocoE.QReg210VL_SLD_CRED_ANT_ST.Value;
    reg.VL_DEVOL_ST := DmBlocoE.QReg210VL_DEVOL_ST.Value;
    reg.VL_RESSARC_ST := DmBlocoE.QReg210VL_RESSARC_ST.Value;
    reg.VL_OUT_CRED_ST := DmBlocoE.QReg210VL_OUT_CRED_ST.Value;
    reg.VL_AJ_CREDITOS_ST := DmBlocoE.QReg210VL_AJ_CREDITOS_ST.Value;
    reg.VL_RETENCAO_ST := DmBlocoE.QReg210VL_RETENCAO_ST.Value;
    reg.VL_OUT_DEB_ST := DmBlocoE.QReg210VL_OUT_DEB_ST.Value;
    reg.VL_AJ_DEBITOS_ST := DmBlocoE.QReg210VL_AJ_DEBITOS_ST.Value;
    reg.VL_SLD_DEV_ANT_ST := DmBlocoE.QReg210VL_SLD_DEV_ANT_ST.Value;
    reg.VL_DEDUCOES_ST := DmBlocoE.QReg210VL_DEDUCOES_ST.Value;
    reg.VL_ICMS_RECOL_ST := DmBlocoE.QReg210VL_ICMS_RECOL_ST.Value;
    reg.VL_SLD_CRED_ST_TRANSPORTAR := DmBlocoE.QReg210VL_SLD_CRED_ST_TRANSPORTAR.Value;
    reg.DEB_ESP_ST := DmBlocoE.QReg210DEB_ESP_ST.Value;
    reg.grava;
    reg.Free;
    reg := nil;

//    RegistroE220;
    RegistroE250(uf);

    DmBlocoE.QReg210.Next;
  end;
end;

procedure TFiscal.RegistroE220;
var
  reg: TRegistroE220;
begin
  //  reg := TRegistroE220.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
  RegistroE230;
  RegistroE240;
end;

procedure TFiscal.RegistroE230;
var
  reg: TRegistroE230;
begin
  //  reg := TRegistroE230.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.RegistroE240;
var
  reg: TRegistroE240;
begin
  //  reg := TRegistroE240.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.RegistroE250(uf: string);
var
  reg: TRegistroE250;
begin
  DmBlocoE.QReg250.Close;
  DmBlocoE.QReg250.SetVariable('COD_FILIAL', wFilial);
  DmBlocoE.QReg250.SetVariable('DATA_INI', wDataIni);
  DmBlocoE.QReg250.SetVariable('DATA_FIN', wDataFin);
  DmBlocoE.QReg250.SetVariable('COD_ESTADO', uf);
  DmBlocoE.QReg250.Open;
  DmBlocoE.QReg250.First;

  if DmBlocoE.QReg250.RecordCount = 0 then Exit;

  while not DmBlocoE.QReg250.Eof do
  begin
    reg := TRegistroE250.Create(TObject(Self), arquivo);
    reg.COD_OR := DmBlocoE.QReg250COD_OBRIGACAO_ICMS.Value;
    reg.VL_OR := DmBlocoE.QReg250VAL_OR.Value;
    reg.DT_VCTO := DmBlocoE.QReg250DT_VENCIMENTO_OBRIGACAO_ICMS.Value;
    reg.COD_REC := DmBlocoE.QReg250COD_RECEITA_OBRIGACAO_ICMS.Value;
    reg.NUM_PROC := DmBlocoE.QReg250NUM_PROCESSO_OBRIGACAO_ICMS.Value;
    if DmBlocoE.QReg250NUM_PROCESSO_OBRIGACAO_ICMS.Value <> '' then
      reg.IND_PROC := DmBlocoE.QReg250IND_PROCESSO_OBRIGACAO_ICMS.Text;
    reg.PROC := DmBlocoE.QReg250DESC_PROCESSO_OBRIGACAO_ICMS.Value;
    reg.TEXT_COMPL := DmBlocoE.QReg250DESC_COMPL_OBRIGACAO_ICMS.Value;
    reg.MES_REF := DmBlocoE.QReg250NUM_MES_ANO_REFERENCIA.AsInteger;
    reg.grava;
    reg.Free;
    reg := nil;

    DmBlocoE.QReg250.Next;
  end;
end;

procedure TFiscal.RegistroE500;
var
  reg: TRegistroE500;
begin
  reg := TRegistroE500.Create(TObject(Self), arquivo);
  reg.IND_APUR := '0';
  reg.DT_INI := wDataIni;
  reg.DT_FIN := wDataFin;
  reg.grava;
  reg.Free;
  reg := nil;

  RegistroE510;
  RegistroE520;
end;

procedure TFiscal.RegistroE510;
var
  reg: TRegistroE510;
begin
  DmBlocoE.QReg510.Close;
  DmBlocoE.QReg510.SetVariable('COD_FILIAL', wFilial);
  DmBlocoE.QReg510.SetVariable('DATA_INI', wDataIni);
  DmBlocoE.QReg510.SetVariable('DATA_FIN', wDataFin);
  DmBlocoE.QReg510.Open;
  DmBlocoE.QReg510.First;

  while not DmBlocoE.QReg510.Eof do
  begin
    reg := TRegistroE510.Create(TObject(Self), arquivo);
    reg.CFOP := DmBlocoE.QReg510NUM_CFOP.AsInteger;
    reg.CST_IPI := DmBlocoE.QReg510COD_CST_IPI.Value;
    reg.VL_CONT_IPI := DmBlocoE.QReg510VAL_TOTAL.Value;
    reg.VL_BC_IPI := DmBlocoE.QReg510VAL_TOTAL.Value;
    reg.VL_IPI := DmBlocoE.QReg510VAL_IPI.Value;
    reg.grava;
    reg.Free;
    reg := nil;

    DmBlocoE.QReg510.Next;
  end;
end;

procedure TFiscal.RegistroE520;
var
  reg: TRegistroE520;
  wAno, wMes, wDia: Word;
begin
  DecodeDate(wDataFin, wAno, wMes, wDia);
  DmBlocoE.QReg520.Close;
  DmBlocoE.QReg520.SetVariable('COD_FILIAL', wFilial);
  DmBlocoE.QReg520.SetVariable('NUM_ANO', wAno);
  DmBlocoE.QReg520.SetVariable('NUM_MES', wMes);
  DmBlocoE.QReg520.Open;
  DmBlocoE.QReg520.First;

  reg := TRegistroE520.Create(TObject(Self), arquivo);
  reg.VL_SD_ANT_IPI := DmBlocoE.QReg520VAL_SALDO_ANTERIOR.Value;
  reg.VL_DEB_IPI := DmBlocoE.QReg520VAL_DB_ICM.Value;
  reg.VL_CRED_IPI := DmBlocoE.QReg520VAL_CR_ICM.Value;
  reg.VL_OD_IPI := DmBlocoE.QReg520VAL_OUTROS_DEBITOS.Value;
  reg.VL_OC_IPI := DmBlocoE.QReg520VAL_OUTROS_CREDITOS.Value;
  reg.VL_SC_IPI := DmBlocoE.QReg520VAL_SALDO_CREDOR.Value;
  reg.VL_SD_IPI := DmBlocoE.QReg520VAL_SALDO_DEVEDOR.Value;
  reg.grava;
  reg.Free;
  reg := nil;

  RegistroE530;
end;

procedure TFiscal.RegistroE530;
var
  reg: TRegistroE530;
  wAno, wMes, wDia: Word;
begin
  DecodeDate(wDataFin, wAno, wMes, wDia);
  DmBlocoE.QReg530.Close;
  DmBlocoE.QReg530.SetVariable('COD_FILIAL', wFilial);
  DmBlocoE.QReg530.SetVariable('NUM_ANO', wAno);
  DmBlocoE.QReg530.SetVariable('NUM_MES', wMes);
  DmBlocoE.QReg530.Open;
  DmBlocoE.QReg530.First;

  while not DMBlocoE.qreg530.Eof do
  begin
    reg := TRegistroE530.Create(TObject(Self), arquivo);
    reg.IND_AJ := DMBlocoE.qreg530IND_AJ.Value;
    reg.VL_AJ :=  DMBlocoE.QReg530VL_AJ.Value;
    reg.COD_AJ :=  DMBlocoE.QReg530COD_AJ.Value;
    reg.DESCR_AJ :=  DMBlocoE.QReg530DESCR_AJ.Value;
    reg.IND_DOC := DmBlocoE.QReg530IND_DOC.AsInteger;
    reg.grava;
    reg.Free;
    reg := nil;
    if DmBlocoE.QReg530IND_DOC.AsInteger = 3 then
      RegistroE531(DmBlocoE.QReg530COD_LIVRO_LCTO_IPI.Value);
    DMBlocoE.qreg530.Next;
  end;
  //  reg := TRegistroE530.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.RegistroE990(QtdLinhas: Double);
var
  reg: TRegistroE990;
begin
  reg := TRegistroE990.Create(TObject(Self), arquivo);
  reg.QTD_LIN_E := QtdLinhas;
  reg.grava;
  reg.Free;
  reg := nil;
end;

procedure TFiscal.RegistroG001;
var
  reg: TRegistroG001;
begin

  if (DMParamSistema.CodEmpresa = 'DBTRANSPOR') then
  begin
    reg := TRegistroG001.Create(TObject(Self), arquivo);
    reg.IND_MOV := 0;
    reg.grava;
    reg.Free;
    reg := nil;

    RegistroG110; //Gerar os internos do bloco G
  end
  else
  begin
    reg := TRegistroG001.Create(TObject(Self), arquivo);
    reg.IND_MOV := 1;
    reg.grava;
    reg.Free;
    reg := nil;
  end;   
end;

procedure TFiscal.RegistroG110;
var
  reg: TRegistroG110;

begin
  reg := TRegistroG110.Create(TObject(Self), arquivo);

  with DMBlocoG do
  begin
    QReg110.SetVariable('COD_FILIAL', wFilial);
    QReg110.SetVariable('DT_INICIAL', wDataIni);
    QReg110.SetVariable('DT_FINAL', wDataFin);
    QReg110.Open;
    QReg110.First;

    While not (QReg110.Eof) do
    begin

       reg.DT_INI := wDataIni;
       reg.DT_INI := wDataIni;
       reg.SALDO_IN_ICMS := QReg110VAL_CRED_ANT.Value;
       reg.SOM_PARC := QReg110VAL_CREDITO.Value;
       reg.VL_TRIB_EXP := QReg110VAL_TOTAL.Value;
       reg.VL_TOTAL := QReg110VAL_TOTAL.Value;
       reg.IND_PER_SAI := QReg110VAL_TOTAL.Value / QReg110VAL_TOTAL.Value;
       reg.CMS_APROP := QReg110VAL_CREDITO.Value;
       reg.SOM_ICMS_OC := 0;

       reg.grava;

       RegistroG125;

       QReg110.Next;
    end;
    QReg110.Close;
  end;
  reg.Free;
  reg := nil;

end;

procedure TFiscal.RegistroG125;
var
  reg: TRegistroG125;
  nCodNota: integer;
  dDataAquisicao, dDataFim, dDataFimCiap: TDate;
  sTipMov: String;
begin
  reg := TRegistroG125.Create(TObject(Self), arquivo);

  with DMBlocoG do
  begin
    QReg125.SetVariable('DT_INICIAL', wDataIni);
    QReg125.SetVariable('DT_FINAL', wDataFin);
    QReg125.Open;
    QReg125.First;

    While not (QReg125.Eof) do
    begin
      reg.COD_IND_BEM := QReg125COD_PATRIMONIO_ITEM.Text;
      reg.DT_MOV := QReg125DT_AQUISICAO.Value;

      // Validando a data final da imobilização para inserir o tipo de movimento
      dDataAquisicao :=  QReg125DT_AQUISICAO.Value;
      dDataFim := IncMonth(dDataAquisicao, 47);
      dDataFimCiap := IncMonth(dDataAquisicao, 48);
      sTipMov :=  IfThen(QReg125DT_AQUISICAO.Value < wDataIni, 'IM',
                                  IfThen(QReg125DT_AQUISICAO.Value < dDataFim, 'SI',
                                    IfThen((dDataFim > wDataIni),
                                     'SI',
                                     '')));

      reg.TIPO_MOV := sTipMov;
      reg.VL_IMOB_ICMS_OP := QReg125VAL_ICMS.Value;
      reg.VL_IMOB_ICMS_ST := 0;
      reg.VL_IMOB_ICMS_FRT := 0;
      reg.VL_IMOB_ICMS_DIF := 0;
      reg.NUM_PARC := MonthsBetween(dDataAquisicao, wDataFin);
      reg.VL_PARC_PASS := QReg125VAL_CREDITO.Value;

      nCodNota := QReg125COD_NOTA_CAB_ENTRADA.Value;

      reg.grava;
      RegistroG130(nCodNota);
      
      QReg125.Next;
    end;
    QReg125.Close;
  end;
  reg.Free;
  reg := nil;


end;

procedure TFiscal.RegistroG130(CodNotaCab: integer);
var
  reg: TRegistroG130;
begin
  reg := TRegistroG130.Create(TObject(Self), arquivo);

  with DMBlocoG do
  begin
    QReg130.SetVariable('cod_nota', CodNotaCab);
    QReg130.Open;
    QReg130.First;

    While not (QReg130.Eof) do
    begin

      reg.IND_EMIT := QReg130EMITENTE.AsInteger;
      reg.COD_PART := QReg130COD_CADASTRO.AsString;
      reg.COD_MOD := QReg130COD_SERIE_MODELO.AsString;
      reg.SERIE := QReg130COD_SERIE.AsString;
      reg.NUM_DOC := QReg130NUM_NOTA.Value;
      reg.CHV_NFE_CTE := QReg130DESC_CHAVE_ACESSO.Value;
        
      reg.grava;
      RegistroG140(CodNotaCab);
      QReg130.Next;
    end;
   QReg130.Close;
  end;

  reg.Free;
  reg := nil;

end;

procedure TFiscal.RegistroG140(CodNotaCab: integer);
var
  reg: TRegistroG140;
  nSeq: Integer;
begin
  reg := TRegistroG140.Create(TObject(Self), arquivo);
  nSeq := 0;

  with DMBlocoG do
  begin
    QReg140.SetVariable('cod_nota', CodNotaCab);
    QReg140.Open;
    QReg140.First;

    While not (QReg140.Eof) do
    begin
      inc(nSeq);
      reg.NUM_ITEM := nSeq;
      reg.COD_ITEM := QReg140COD_PRODUTO.AsString;
      reg.QTDE := QReg140QT_QUANTIDADE.Value;
      reg.UNID := QReg140DESC_UNIDADE.Value;
      reg.VL_ICMS_OP_APLICADO := QReg140VAL_ICMS.Value;
      reg.VL_ICMS_ST_APLICADO := QReg140VAL_ICMS_SUBST.Value;
      reg.VL_ICMS_FRT_APLICADO := QReg140VAL_ICMS_FRETE.Value;
      reg.VL_ICMS_DIF_APLICADO := QReg140VAL_ICMS_DIFERENCIAL.Value;
      reg.grava;

      QReg140.Next;

    end;

   QReg140.Close;
  end;

  reg.Free;
  reg := nil;

end;

procedure TFiscal.RegistroG990(QtdLinhas: Double);
var
  reg: TRegistroG990;
begin
  reg := TRegistroG990.Create(TObject(Self), arquivo);
  reg.QTD_LIN_G := QtdLinhas;
  reg.grava;
  reg.Free;
  reg := nil;
end;

procedure TFiscal.RegistroH001;
var
  reg: TRegistroH001;
begin
  reg := TRegistroH001.Create(TObject(Self), arquivo);
  reg.IND_MOV := 1;
  reg.grava;
  reg.Free;
  reg := nil;


  RegistroH005;
end;

procedure TFiscal.RegistroH005;
var
  reg: TRegistroH005;
  wAno, wMes, wDia: Word;
  wValEstoque: Double;
  wDataAux: tdatetime;
  filialStr, mesStr, sql: string;
  bibSped: TBibSped;
begin

  filialStr := IntToStr(wFilial);
  mesStr := intToStr(MonthOf(wDataIni));

  sql := 'NUM_MES = ' + mesStr + ' AND COD_FILIAL = ' + filialStr;

  if(DMOracle.FastSelect('NUM_MES', 'TB_FILIAL_INVENTARIO_MES', sql) = mesStr) then
  begin

    bibSped := TBibSped.Create;

    wDataAux := bibSped.DataInventario(wDataFin);
    DecodeDate(wDataAux, wAno, wMes, wDia);
    DMBlocoH.QReg005.Close;
    DMBlocoH.QReg005.SetVariable('COD_Filial', wFilial);
    DMBlocoH.QReg005.SetVariable('NUM_ANO', wAno);
    DMBlocoH.QReg005.SetVariable('NUM_MES', wMes);
    DMBlocoH.QReg005.SetVariable('MES_INVENTARIO', MonthOf(wDataIni));
    DMBlocoH.QReg005.Open;
    if DMBlocoH.QReg005.IsEmpty then
      wValEstoque := 0
    else
      wValEstoque := DMBlocoH.QReg005VL_INV.Value;

      reg := TRegistroH005.Create(TObject(Self), arquivo);
      reg.DT_INV := wDataAux;
      reg.VL_INV := wValEstoque;
      reg.MOT_INV := '01';
      reg.grava;
      reg.Free;
      reg := nil;


    bibSped.Free;
      bibSped := nil;

    DMBlocoH.QReg005.Close;

    if wValEstoque <> 0 then
      RegistroH010;

  end;

end;

procedure TFiscal.RegistroH010;
var
  reg: TRegistroH010;
  regH20: TRegistroH020;
  wAno, wMes, wDia: Word;
  dtInvAnterior: TDate;
  anoInvAnt, mesInvAnt, diaInvAnt: Word;
  bibSped: TBibSped;
  wDataAux: tdatetime;
begin
  bibSped := TBibSped.Create;

  // para Conkreta, verificar a função TBibSped.DataInventario e a query QREG005 e QREG010 do bloco H
  // Ajustado para que seja possível pegar inventário de período anterior para possível correção
  if (Trim(DMBloco0.QReg000DT_INVENTARIO.Text) <> '') then
  begin
    dtInvAnterior :=  DMBloco0.QReg000DT_INVENTARIO.Value;
    DecodeDate(dtInvAnterior, anoInvAnt, mesInvAnt, diaInvAnt);
    wDataAux := wDataIni;
  end
  else
    wDataAux := bibSped.DataInventario(wDataFin);

  DecodeDate(wDataAux, wAno, wMes, wDia);

  DMBlocoH.QReg010.Close;
  DMBlocoH.QReg010.SetVariable('COD_Filial', wFilial);
  if (Trim(DMBloco0.QReg000DT_INVENTARIO.Text) <> '') then
  begin
    DMBlocoH.QReg010.SetVariable('NUM_ANO', anoInvAnt);
    DMBlocoH.QReg010.SetVariable('NUM_MES', mesInvAnt);
  end
  else
  begin
    DMBlocoH.QReg010.SetVariable('NUM_ANO', wAno);
    DMBlocoH.QReg010.SetVariable('NUM_MES', wMes);
 end;
  DMBlocoH.QReg010.Open;

  DMBlocoH.QReg010.First;
  while not (DMBlocoH.QReg010.eof) do
  begin
    reg := TRegistroH010.Create(TObject(Self), arquivo);
    reg.COD_ITEM := DMBlocoH.QReg010COD_ITEM.Text;
    if ((DMBlocoH.QReg010UNID.IsNull) or (DMBlocoH.QReg010UNID.Value = '')) then
      reg.UNID := 'UN'
    else
      reg.UNID := DMBlocoH.QReg010UNID.Value;
    reg.QTD := DMBlocoH.QReg010QTD.Value;
    reg.VL_UNIT := DMBlocoH.QReg010VL_UNIT.Value;
    reg.VL_ITEM := DMBlocoH.QReg010VL_ITEM.Value;
    reg.IND_PROP := '0';
    reg.COD_CTA := DMBlocoH.QReg010COD_CONTABIL_INVENTARIO.Value;

    reg.grava(wDataAux);


    if (DMParamSistema.CodEmpresa = 'CONKRETA') and
      (Trim(DMBloco0.QReg000DT_INVENTARIO.Text) <> '') 
       and ((integer(wMes) = 1) and (integer(wAno) = 2022)) then
    begin
      regH20 := TRegistroH020.Create(TObject(Self), arquivo);
      regH20.CST_ICMS := '000';
      regH20.BC_ICMS :=  reg.VL_ITEM;
      regH20.VL_ICMS := reg.VL_ITEM * 0.12;
      regH20.grava(wDataAux);
      regH20.Free;
      regH20 := nil;
    end;                     

    reg.Free;
    reg := nil;

    DMBlocoH.QReg010.Next;
  end;
  DMBlocoH.QReg010.Close;
end;

procedure TFiscal.RegistroH990(QtdLinhas: Double);
var
  reg: TRegistroH990;
begin
  reg := TRegistroH990.Create(TObject(Self), arquivo);
  reg.QTD_LIN_H := QtdLinhas;
  reg.grava;
  reg.Free;
  reg := nil;
end;

procedure TFiscal.RegistroK001;
var
  reg: TRegistroK001;
begin

  reg := TRegistroK001.Create(TObject(Self), arquivo);
  reg.IND_MOV := 1;
  reg.grava;
  reg.Free;
  reg := nil;

  with DMOracle do
  begin
    if FastSelect('IND_TIPO_ATIVIDADE','TB_FILIAL','COD_FILIAL = ' +
      IntToStr(wFilial)) = 'I' then
        if bibSped.GeraBlocoK then
        begin
          RegistroK010;
          RegistroK100;
        end;
  end;
end;

procedure TFiscal.RegistroK010;
var reg: TRegistroK010;
begin
  reg := TRegistroK010.Create(TObject(Self),arquivo);

  reg.IND_TP_LEIAUTE := '0';

  reg.grava;
  reg.Free;
  reg := Nil;
end;

procedure TFiscal.RegistroK100;
var reg: TRegistroK100;
begin
  reg := TRegistroK100.Create(TObject(Self),arquivo);
  reg.DT_INI := wDataIni;
  reg.DT_FIN := wDataFin;
  reg.grava;
  reg.Free;
  reg := Nil;
  RegistroK200;
  //RegistroK220;
  //RegistroK230;
  //RegistroK280;
end;

procedure TFiscal.RegistroK200;
var reg: TRegistroK200;
  wDia, wMes, wAno: word;
begin
  with DMBlocoK do
  begin
    DecodeDate(wDataFin, wAno, wMes, wDia);
    QReg200.Close;
    QReg200.SetVariable('COD_FILIAL',wFilial);
    QReg200.SetVariable('DT_INICIAL',wDataIni);
    QReg200.SetVariable('DT_FINAL',wDataFin);
    QReg200.SetVariable('NUM_MES', wMes);
    QReg200.SetVariable('NUM_ANO', wAno);
    QReg200.Open;
    QReg200.First;
    while not QReg200.Eof do
    begin
      reg := TRegistroK200.Create(TObject(Self),arquivo);
      //reg.DT_EST := pegaValor(QReg200,'DT_EST');
      reg.DT_EST := wDataFin;
      reg.COD_ITEM := pegaValor(QReg200,'COD_ITEM');
      reg.QTD := pegaValor(QReg200,'QTD');
      reg.IND_EST := pegaValor(QReg200,'IND_EST');
      reg.COD_PART := pegaValor(QReg200,'COD_PART');
      reg.grava;
      reg.Free;
      reg := Nil;
      QReg200.Next;
    end;
    //fechaQuery(QReg200);
  end;
end;

procedure TFiscal.RegistroK220;
var
  reg: TRegistroK220;
begin
  with DMBlocoK do
  begin
    QReg220.Close;
    QReg220.SetVariable('DT_INICIAL',wDataIni);
    QReg220.SetVariable('DT_FINAL',wDataFin);
    QReg220.Open;
    QReg220.First;
    while not QReg220.Eof do
    begin
      reg := TRegistroK220.Create(TObject(Self),arquivo);
      reg.DT_MOV := pegaValor(QReg220,'DT_TRANSFERENCIA');
      reg.COD_ITEM_ORI := pegaValor(QReg220, 'COD_PRODUTO_ORIGEM');
      reg.COD_ITEM_DEST := pegaValor(QReg220, 'COD_PRODUTO_DESTINO');
      reg.QTD := pegaValor(QReg220, 'QT_QUANTIDADE');
      reg.grava;
      reg.Free;
      reg := Nil;
      QReg220.Next;
    end;
    fechaQuery(QReg220);
  end;
end;

procedure TFiscal.RegistroK230;
var
  reg: TRegistroK230;
begin
  with DMBlocoK do
  begin
    QReg230.Close;
    QReg230.SetVariable('FILIAL',wFilial);
    QReg230.SetVariable('DT_INI',wDataIni);
    QReg230.SetVariable('DT_FIN',wDataFin);
    QReg230.Open;
    QReg230.First;
    while not QReg230.Eof do
    begin
      reg := TRegistroK230.Create(TObject(Self),arquivo);
      reg.DT_INI_OP := pegaValor(QReg230,'DT_INI_OP');
      if pegaValor(QReg230,'DT_FIN_OP') <> null then
        reg.DT_FIN_OP := pegaValor(QReg230,'DT_FIN_OP');
      reg.COD_DOC_OP := pegaValor(QReg230,'COD_DOC_OP');
      reg.COD_ITEM := pegaValor(QReg230,'COD_ITEM');
      reg.QTD_ENC := pegaValor(QReg230,'QTD_ENC');
      reg.grava;
      reg.Free;
      reg := Nil;
      RegistroK235(QReg230TIPO.Value,QReg230COD_DOC_OP.Value,QReg230COD_ITEM.Value);
      QReg230.Next;
    end;
    fechaQuery(QReg235);
    fechaQuery(QReg230);
  end;
end;

procedure TFiscal.RegistroK235(pTipo: string; pCodigo,pCodProduto: integer);
var
  reg: TRegistroK235;
begin
  with DMBlocoK do
  begin
    QReg235.Close;
    QReg235.SetVariable('TIPO',pTipo);
    QReg235.SetVariable('COD_PRODUCAO',pCodigo);
    QReg235.SetVariable('COD_PRODUTO',pCodProduto);
    QReg235.Open;
    QReg235.First;
    while not QReg235.Eof do
    begin
      reg := TRegistroK235.Create(TObject(Self),arquivo);
      reg.DT_SAIDA := pegaValor(QReg235,'DT_SAIDA');
      reg.COD_ITEM := pegaValor(QReg235,'COD_ITEM');
      reg.QTD := pegaValor(QReg235,'QTD');
      reg.COD_INS_SUBST := pegaValor(QReg235,'COD_INS_SUBST');
      reg.grava;
      reg.Free;
      reg := Nil;
      QReg235.Next;
    end;
  end;
end;

procedure TFiscal.RegistroK280;
var
  reg: TRegistroK280;
  wDia, wMes, wAno: word;
begin

  with DMBlocoK do
  begin
    DecodeDate(wDataIni, wAno, wMes, wDia);
    QReg200.Close;
    QReg200.SetVariable('COD_FILIAL',wFilial);
    QReg200.SetVariable('DT_INICIAL',wDataIni);
    QReg200.SetVariable('DT_FINAL',wDataFin);
    QReg200.SetVariable('NUM_MES', wMes);
    QReg200.SetVariable('NUM_ANO', wAno);
    QReg200.Open;
    QReg200.First;
    while not QReg200.Eof do
    begin
      reg := TRegistroK280.Create(TObject(Self),arquivo);
      reg.DT_EST := wDataFin-1;
      reg.COD_ITEM := pegaValor(QReg200, 'COD_ITEM');
      reg.QTD_COR_POS := 0;
      reg.QTD_COR_NEG := 0;
      reg.IND_EST := pegaValor(QReg200, 'IND_EST');
      reg.COD_PART := pegaValor(QReg200, 'COD_PART');

      reg.grava;
      reg.Free;
      reg := Nil;
      QReg200.Next;
    end;
    fechaQuery(QReg200);
  end;
end;

procedure TFiscal.RegistroK990(QtdLinhas: Double);
var
  reg: TRegistroK990;
begin
  reg := TRegistroK990.Create(TObject(Self), arquivo);
  reg.QTD_LIN_K := QtdLinhas;
  reg.grava;
  reg.Free;
  reg := nil;
end;


procedure TFiscal.Registro1001;
var
  reg: TRegistro1001;
begin
  reg := TRegistro1001.Create(TObject(Self), arquivo);
  reg.IND_MOV := 1;
  reg.grava;
  reg.Free;
  reg := nil;

  Registro1010;
  Registro1100;
  Registro1200;
  Registro1300;

  DmBloco0.QReg000.Close;
  DmBloco0.QReg000.SetVariable('FILIAIS', '(' + IntToStr(wFilial) + ')');
  DmBloco0.QReg000.Open;

   if (DmBloco0.QReg000DESC_CNAE.Value <> '') then
    if (DMBloco0.QReg000IND_VALORES_AGREGADOS.Value = 'SIM') OR
       (DmBloco0.QReg000DESC_CNAE.AsInteger = 3511501) OR
       (DmBloco0.QReg000DESC_CNAE.AsInteger = 3512300) OR
       (DmBloco0.QReg000DESC_CNAE.AsInteger = 3514000) OR
       (DmBloco0.QReg000DESC_CNAE.AsInteger = 3513100) OR
       (DmBloco0.QReg000DESC_CNAE.AsInteger = 1931400) OR
       ((DmBloco0.QReg000DESC_CNAE.AsInteger >= 6022501) AND (DmBloco0.QReg000DESC_CNAE.AsInteger <= 6190699)) OR
       ((DmBloco0.QReg000DESC_CNAE.AsInteger >= 0111301) AND (DmBloco0.QReg000DESC_CNAE.AsInteger <= 0322199)) OR
       ((DmBloco0.QReg000DESC_CNAE.AsInteger >= 1011201) AND (DmBloco0.QReg000DESC_CNAE.AsInteger <= 1322700)) OR
       ((DmBloco0.QReg000DESC_CNAE.AsInteger >= 1610201) AND (DmBloco0.QReg000DESC_CNAE.AsInteger <= 1749400)) OR
       ((DmBloco0.QReg000DESC_CNAE.AsInteger >= 4621400) AND (DmBloco0.QReg000DESC_CNAE.AsInteger <= 4634699))  THEN
         Registro1400;

end;

procedure TFiscal.Registro1010;
var reg: TRegistro1010;
begin
  with DMBloco1 do
  begin
    reg := TRegistro1010.Create(TObject(Self), arquivo);
    QReg100.Close;
    QReg100.SetVariable('COD_FILIAL', wFilial);
    QReg100.SetVariable('DT_INICIAL', wDataIni);
    QReg100.SetVariable('DT_FINAL', wDataFin);
    QReg100.Open;
    if QReg100.RecordCount > 0 then
      reg.IND_EXP :=  'S'
    else
      reg.IND_EXP :=  'N';
    reg.IND_CCRF := 'N';
    reg.IND_COMB := 'N';
    reg.IND_USINA := 'N';
    QReg400.Close;
    QReg400.SetVariable('COD_FILIAL', wFilial);
    QReg400.SetVariable('DATA_INI', wDataIni);
    QReg400.SetVariable('DATA_FIN', wDataFin);
    QReg400.Open;
    if (QReg400.RecordCount > 0) AND (DMBloco0.QReg000IND_VALORES_AGREGADOS.Value = 'SIM') then
      reg.IND_VA := 'S'
    else
      reg.IND_VA := 'N';
    reg.IND_EE := 'N';
    reg.IND_CART := 'N';
    reg.IND_FORM := 'N';
    reg.IND_AER := 'N';
    reg.IND_GIAF1 := 'N';
    reg.IND_GIAF3 := 'N';
    reg.IND_GIAF4 := 'N';
    reg.IND_REST_RESSARC_COMPL_ICMS := 'N'; 
    reg.grava;
    reg.Free;
    reg := nil;
  end;
end;

procedure TFiscal.Registro1100;
var
  reg: TRegistro1100;
begin
  DMBloco1.QReg100.Close;
  DMBloco1.QReg100.SetVariable('DT_INICIAL', wDataIni);
  DMBloco1.QReg100.SetVariable('DT_FINAL', wDataFin);
  DMBloco1.QReg100.SetVariable('COD_FILIAL', wFilial);
  DMBloco1.QReg100.Open;
  DMBloco1.QReg100.First;
  while not (DMBloco1.QReg100.Eof) do
  begin
    reg := TRegistro1100.Create(TObject(Self), arquivo);
    if DMBloco1.QReg100IND_TIPO_DOCUMENTO.Value = 'C' then
      reg.IND_DOC := 0
    else
      reg.IND_DOC := 1;
    reg.NRO_DE := DMBloco1.QReg100NUM_DECLARACAO.Value;
    reg.DT_DE := DMBloco1.QReg100DT_DECLARACAO.Value;
    if DMBloco1.QReg100IND_NATUREZA_EXPORTACAO.Value = 'I' then
      reg.NAT_EXP := 1
    else
      reg.NAT_EXP := 0;
    reg.NRO_RE := DMBloco1.QReg100NUMERO_RE.Value;
    reg.DT_RE := DMBloco1.QReg100DT_EMISSAO.Value;
    reg.CHC_EMB := DMBloco1.QReg100NUM_CONHECIMENTO.Value;
    reg.DT_CHC := DMBloco1.QReg100DT_CONHECIMENTO.Value;
    reg.DT_AVB := DMBloco1.QReg100DT_AVERBACAO.Value;
    if SomenteNumeros(DMBloco1.QReg100NUM_TIPO_CONHECIMENTO.Value) = '' then
      reg.TP_CHC := 99
    else
      reg.TP_CHC :=
        SomenteNumerosEConverte(DMBloco1.QReg100NUM_TIPO_CONHECIMENTO.Value);
    reg.PAIS := DMBloco1.QReg100COD_PAIS_SISCOMEX.AsInteger;
    reg.grava;
    reg.Free;
    reg := nil;

    Registro1105(DMBloco1.QReg100COD_NOTA_CAB.Value);

    DMBloco1.QReg100.Next;
  end;
  DMBloco1.QReg100.Close;
end;

procedure TFiscal.Registro1105(notaCab: Integer);
var
  reg: TRegistro1105;
begin
  DMBloco1.QReg105.Close;
  DMBloco1.QReg105.SetVariable('COD_NOTA_CAB', notaCab);
  DMBloco1.QReg105.Open;
  DMBloco1.QReg105.First;
  while not (DMBloco1.QReg105.Eof) do
  begin
    reg := TRegistro1105.Create(TObject(Self), arquivo);
    reg.COD_MOD := DMBloco1.QReg105COD_SERIE_MODELO.Value;
    //    IF Trim(DmBloco1.QReg105DESC_CHAVE_ACESSO.Value) = '' Then
    //      reg.SERIE := '1'
    //    else
    //      reg.SERIE := '55';
    if DMBloco1.QReg105NUM_SERIE_FISCAL.Value > 0 then
      reg.SERIE := DMBloco1.QReg105NUM_SERIE_FISCAL.Text
    else
      reg.SERIE := DMBloco1.QReg105COD_SERIE.Value;
    reg.NUM_DOC := DMBloco1.QReg105NUM_NOTA.AsInteger;
    reg.CHV_NFE := DMBloco1.QReg105DESC_CHAVE_ACESSO.Value;
    reg.DT_DOC := DMBloco1.QReg105DT_EMISSAO.Value;
    reg.COD_ITEM := DMBloco1.QReg105COD_PRODUTO.Text;
    reg.grava;
    reg.Free;
    reg := nil;

    if DMBloco1.QReg105IND_NATUREZA_EXPORTACAO.Value = 'I' then
      Registro1110;

    DMBloco1.QReg105.Next;
  end;
  DMBloco1.QReg105.Close;
end;

procedure TFiscal.Registro1110;
var
  reg: TRegistro1110;
begin
  //  reg := TRegistro1110.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.Registro1200;
var
  reg: TRegistro1200;
begin
  //  reg := TRegistro1200.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
  Registro1210;
end;

procedure TFiscal.Registro1210;
var
  reg: TRegistro1210;
begin
  //  reg := TRegistro1210.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.Registro1300;
var
  reg: TRegistro1300;
begin
  //  reg := TRegistro1300.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
  Registro1310;
  Registro1320;
end;

procedure TFiscal.Registro1310;
var
  reg: TRegistro1310;
begin
  //  reg := TRegistro1310.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.Registro1320;
var
  reg: TRegistro1320;
begin
  //  reg := TRegistro1320.Create(TObject(Self), arquivo);
  //  reg.grava;
  //  reg.Free;
  //  reg := nil;
end;

procedure TFiscal.Registro1400;
var
  reg: TRegistro1400;
begin

  with DMBloco0 do
  begin
    if (QReg400.RecordCount > 0) AND (QReg000IND_VALORES_AGREGADOS.Value = 'SIM') then
    begin
      DMBloco1.QReg400.Close;
      DMBloco1.QReg400.SetVariable('COD_FILIAL', wFilial);
      DMBloco1.QReg400.SetVariable('DATA_INI', wDataIni);
      DMBloco1.QReg400.SetVariable('DATA_FIN', wDataFin);
      DMBloco1.QReg400.Open;
      DMBloco1.QReg400.First;
      while not DMBloco1.QReg400.Eof do
      begin
        reg := TRegistro1400.Create(TObject(Self), arquivo);
        reg.COD_ITEM := DMBloco1.QReg400COD_ITEM_IPM.Text;
        if SomenteNumeros(DMBloco1.QReg400MUN.Value) = '' then
          reg.MUN := 0
        else
          reg.MUN := strToInt(SomenteNumeros(DMBloco1.QReg400MUN.Value));
        reg.VALOR := DMBloco1.QReg400Valor.Value;
        reg.grava;
        reg.Free;
        reg := nil;
        DMBloco1.QReg400.Next;
      end;
      DMBloco1.QReg400.Close;
    end;
  end;
end;

procedure TFiscal.Registro1990(QtdLinhas: Double);
var
  reg: TRegistro1990;
begin
  reg := TRegistro1990.Create(TObject(Self), arquivo);
  reg.QTD_LIN_1 := QtdLinhas;
  reg.grava;
  reg.Free;
  reg := nil;
end;

procedure TFiscal.Registro9001;
var
  reg: TFiscal9001;
begin
  reg := TFiscal9001.Create(TObject(Self), arquivo);
  reg.IND_MOV := 1;
  reg.grava;
  reg.Free;
  reg := nil;
end;

procedure TFiscal.Registro9990(QtdLinhas: Double);
var
  reg: TRegistro9990;
begin
  reg := TRegistro9990.Create(TObject(Self), arquivo);
  reg.QTD_LIN_9 := QtdLinhas;
  reg.grava;
  reg.Free;
  reg := nil;
end;

function TFiscal.localizaRegistro(vetor: array of string; registro: string):
  Integer;
var
  i: Integer;
begin
  for i := 0 to Length(vetor) - 1 do
    if vetor[i] = registro then
    begin
      Result := i;
      Exit;
    end;
  Result := -1;
end;

function TFiscal.recuperaValor(texto: string; posicao: Integer): string;
var
  i, cont, posicaoIni, posicaoFin: Integer;
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

function TFiscal.alteraValor(texto: string; posicao: Integer; textoNovo:
  string): string;
var
  i, cont, posicaoIni, posicaoFin: Integer;
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

procedure TFiscal.atualizaTotalizadorEIndicadorBloco;
var
  movimento: string;
  reg: TRegistro9900;
begin
  // --- Totaliza e seta o indicador dos blocos --- //

  DmSped.QBlocos.Close;
  DmSped.QBlocos.open;
  DmSped.QBlocos.First;

  while not DmSped.QBlocos.Eof do
  begin
    DmSped.QProcuraRegistro.Close;
    DmSped.QProcuraRegistro.SetVariable('DESC_BLOCO',
      DmSped.QBlocosDESC_BLOCO.Value);
    DmSped.QProcuraRegistro.SetVariable('DESC_REGISTRO', '990');
    DmSped.QProcuraRegistro.open;
    if (not DmSped.QProcuraRegistro.IsEmpty) then
    begin
      DmSped.QContaBloco.Close;
      DmSped.QContaBloco.SetVariable('DESC_BLOCO',
        DmSped.QBlocosDESC_BLOCO.Value);
      DmSped.QContaBloco.open;
      DmSped.QUpSped.Close;
      DmSped.QUpSped.SetVariable('COD_REGISTRO',
        DmSped.QProcuraRegistroCOD_REGISTRO.Value);
      DmSped.QUpSped.SetVariable('DESC_CONTEUDO',
        alteraValor(DmSped.QProcuraRegistroDESC_CONTEUDO.Value, 2,
        IntToStr(DmSped.QContaBlocoTOTAL.AsInteger)));
      try
        DmSped.QUpSped.ExecSQL;
      except
        DMOracle.DBCemapa.Rollback;
        MessageDlg('Erro na gravao.', mtError, [mbOK], 0);
        Abort;
      end;
    end;

    DmSped.QProcuraRegistro.Close;
    DmSped.QProcuraRegistro.SetVariable('DESC_BLOCO',
      DmSped.QBlocosDESC_BLOCO.Value);
    DmSped.QProcuraRegistro.SetVariable('DESC_REGISTRO', '001');
    DmSped.QProcuraRegistro.open;
    if (not DmSped.QProcuraRegistro.IsEmpty) then
    begin
      DmSped.QContaBloco.Close;
      DmSped.QContaBloco.SetVariable('DESC_BLOCO',
        DmSped.QBlocosDESC_BLOCO.Value);
      DmSped.QContaBloco.open;
      if DmSped.QContaBlocoTOTAL.AsInteger > 2 then
        movimento := '0'
      else
        movimento := '1';
      DmSped.QUpSped.Close;
      DmSped.QUpSped.SetVariable('COD_REGISTRO',
        DmSped.QProcuraRegistroCOD_REGISTRO.Value);
      DmSped.QUpSped.SetVariable('DESC_CONTEUDO',
        alteraValor(DmSped.QProcuraRegistroDESC_CONTEUDO.Value, 2, movimento));
      try
        DmSped.QUpSped.ExecSQL;
      except
        DMOracle.DBCemapa.Rollback;
        MessageDlg('Erro na gravao.', mtError, [mbOK], 0);
        Abort;
      end;
    end;

    DmSped.QBlocos.Next;
  end;

  // --- Cria os objetos do registro 9900 --- //

  DmSped.QRegistros.Close;
  DmSped.QRegistros.open;
  DmSped.QRegistros.First;

  while not DmSped.QRegistros.Eof do
  begin
    reg := TRegistro9900.Create(TObject(Self), arquivo);
    reg.REG_BLC := DmSped.QRegistrosDESC_BLOCO.Value +
      DmSped.QRegistrosDESC_REGISTRO.Value;
    reg.QTD_REG_BLC := 0;
    reg.grava;
    reg.Free;
    reg := nil;

    DmSped.QRegistros.Next;
  end;

  reg := TRegistro9900.Create(TObject(Self), arquivo);
  reg.REG_BLC := '9900';
  reg.QTD_REG_BLC := 0;
  reg.grava;
  reg.Free;
  reg := nil;

  // --- Altera as quantidades --- //

  DmSped.QProcuraRegistro.Close;
  DmSped.QProcuraRegistro.SetVariable('DESC_BLOCO', '9');
  DmSped.QProcuraRegistro.SetVariable('DESC_REGISTRO', '990');
  DmSped.QProcuraRegistro.open;
  if (not DmSped.QProcuraRegistro.IsEmpty) then
  begin
    DmSped.QContaBloco.Close;
    DmSped.QContaBloco.SetVariable('DESC_BLOCO', '9');
    DmSped.QContaBloco.open;
    DmSped.QUpSped.Close;
    DmSped.QUpSped.SetVariable('COD_REGISTRO',
      DmSped.QProcuraRegistroCOD_REGISTRO.Value);
    DmSped.QUpSped.SetVariable('DESC_CONTEUDO',
      alteraValor(DmSped.QProcuraRegistroDESC_CONTEUDO.Value, 2,
      IntToStr(DmSped.QContaBlocoTOTAL.AsInteger)));
    try
      DmSped.QUpSped.ExecSQL;
    except
      DMOracle.DBCemapa.Rollback;
      MessageDlg('Erro na gravao.', mtError, [mbOK], 0);
      Abort;
    end;
  end;

  DmSped.QProcuraRegistro.Close;
  DmSped.QProcuraRegistro.SetVariable('DESC_BLOCO', '9');
  DmSped.QProcuraRegistro.SetVariable('DESC_REGISTRO', '999');
  DmSped.QProcuraRegistro.open;
  DmSped.QConta.Close;
  DmSped.QConta.open;
  DmSped.QUpSped.Close;
  DmSped.QUpSped.SetVariable('COD_REGISTRO',
    DmSped.QProcuraRegistroCOD_REGISTRO.Value);
  DmSped.QUpSped.SetVariable('DESC_CONTEUDO',
    alteraValor(DmSped.QProcuraRegistroDESC_CONTEUDO.Value, 2,
    IntToStr(DmSped.QContaTOTAL.AsInteger)));
  try
    DmSped.QUpSped.ExecSQL;
  except
    DMOracle.DBCemapa.Rollback;
    MessageDlg('Erro na gravao.', mtError, [mbOK], 0);
    Abort;
  end;

  // --- Altera os cdigos --- //

  DmSped.QProcuraRegistro.Close;
  DmSped.QProcuraRegistro.SetVariable('DESC_BLOCO', '9');
  DmSped.QProcuraRegistro.SetVariable('DESC_REGISTRO', '990');
  DmSped.QProcuraRegistro.open;
  DmSped.QMaxRegistro.Close;
  DmSped.QMaxRegistro.open;
  DmSped.QAlteraCodigo.Close;
  DmSped.QAlteraCodigo.SetVariable('COD_REGISTRO',
    DmSped.QProcuraRegistroCOD_REGISTRO.Value);
  DmSped.QAlteraCodigo.SetVariable('COD_REGISTRO_NOVO',
    DmSped.QMaxRegistroMAXIMO.AsInteger + 1);
  try
    DmSped.QAlteraCodigo.ExecSQL;
  except
    DMOracle.DBCemapa.Rollback;
    MessageDlg('Erro na gravao.', mtError, [mbOK], 0);
    Abort;
  end;

  DmSped.QProcuraRegistro.Close;
  DmSped.QProcuraRegistro.SetVariable('DESC_BLOCO', '9');
  DmSped.QProcuraRegistro.SetVariable('DESC_REGISTRO', '999');
  DmSped.QProcuraRegistro.open;
  DmSped.QMaxRegistro.Close;
  DmSped.QMaxRegistro.open;
  DmSped.QAlteraCodigo.Close;
  DmSped.QAlteraCodigo.SetVariable('COD_REGISTRO',
    DmSped.QProcuraRegistroCOD_REGISTRO.Value);
  DmSped.QAlteraCodigo.SetVariable('COD_REGISTRO_NOVO',
    DmSped.QMaxRegistroMAXIMO.AsInteger + 1);
  try
    DmSped.QAlteraCodigo.ExecSQL;
  except
    DMOracle.DBCemapa.Rollback;
    MessageDlg('Erro na gravao.', mtError, [mbOK], 0);
    Abort;
  end;

  // --- Altera a quantidade nos registros 9900 --- //

  DmSped.QProcuraRegistro.Close;
  DmSped.QProcuraRegistro.SetVariable('DESC_BLOCO', '9');
  DmSped.QProcuraRegistro.SetVariable('DESC_REGISTRO', '900');
  DmSped.QProcuraRegistro.open;
  DmSped.QProcuraRegistro.First;

  while not DmSped.QProcuraRegistro.Eof do
  begin
    DmSped.QContaRegistro.Close;
    DmSped.QContaRegistro.SetVariable('DESC_BLOCO',
      copy(recuperaValor(DmSped.QProcuraRegistroDESC_CONTEUDO.Value, 2), 1, 1));
    DmSped.QContaRegistro.SetVariable('DESC_REGISTRO',
      copy(recuperaValor(DmSped.QProcuraRegistroDESC_CONTEUDO.Value, 2), 2, 3));
    DmSped.QContaRegistro.open;
    DmSped.QUpSped.Close;
    DmSped.QUpSped.SetVariable('COD_REGISTRO',
      DmSped.QProcuraRegistroCOD_REGISTRO.Value);
    DmSped.QUpSped.SetVariable('DESC_CONTEUDO',
      alteraValor(DmSped.QProcuraRegistroDESC_CONTEUDO.Value, 3,
      IntToStr(DmSped.QContaRegistroTOTAL.AsInteger)));
    try
      DmSped.QUpSped.ExecSQL;
    except
      DMOracle.DBCemapa.Rollback;
      MessageDlg('Erro na gravao.', mtError, [mbOK], 0);
      Abort;
    end;

    DmSped.QProcuraRegistro.Next;
  end;
end;

function TFiscal.calculaDesconto(valItem: Extended; ultimo: Boolean = False): Extended;
var
  wDescontoItem: Extended;
begin
  wDescontoItem := (wDesconto * valItem) / wValNota;
  wDescontoItem := Bib.Arredondar(wDescontoItem, 2);

  wDescontoRateado := wDescontoRateado - wDescontoItem;
  if ultimo then
    wDescontoItem := wDescontoItem + wDescontoRateado;

  Result := wDescontoItem;
end;

function TFiscal.calculaDescontoRateioItens(qtItem: Integer; ultimo: Boolean = False): Extended;
var
  wDescontoItem: Double;
begin
  wDescontoItem := StrToFloat(FormatFloat('#,##0.00',(wDesconto/qtItem)));

  if ultimo then
    wDescontoItem := wDescontoItem + (wDesconto - (qtItem*wDescontoItem));

  Result := wDescontoItem;
end;

procedure TFiscal.RegistroE531(CodLivroLctoIpi: integer);
var reg: TRegistroE531;
begin
  with DmBlocoE do
  begin
    QReg531.Close;
    QReg531.SetVariable('COD_LIVRO_LCTO_IPI', CodLivroLctoIpi);
    QReg531.Open;

    while not QReg531.Eof do
    begin
      reg := TRegistroE531.Create(TObject(Self), arquivo);
      reg.COD_PART := QReg531COD_PART.Text;
      reg.COD_MOD := QReg531COD_MOD.Value;
      reg.SER := StrToInt(QReg531SERIE.Value);
      reg.NUM_DOC := QReg531NUM_DOC.Value;
      reg.DT_DOC := QReg531DT_DOC.Value;
      reg.COD_ITEM := QReg531COD_ITEM.Text;
      reg.VL_AJ_ITEM := QReg531VL_AJ_ITEM.Value;
      reg.CHV_NFE := StringReplace(QReg531DESC_CHAVE_ACESSO.Value,'NFe','',
        [rfReplaceAll, rfIgnoreCase]);
      reg.grava;
      reg.Free;
      reg := nil;
      QReg531.Next;
    end;
  end;
end;

procedure TFiscal.RegistroB001;
var
  reg: TRegistroB001;
begin
  reg := TRegistroB001.Create(TObject(Self), arquivo);
  reg.IND_MOV := 1;
  reg.grava;
  reg.Free;
  reg := nil;
end;

procedure TFiscal.RegistroB990(QtdLinhas: Double);
var
  reg: TRegistroB990;
begin
  reg := TRegistroB990.Create(TObject(Self), arquivo);
  reg.QTD_LIN_C := QtdLinhas;
  reg.grava;
  reg.Free;
  reg := nil;
end;

end.

