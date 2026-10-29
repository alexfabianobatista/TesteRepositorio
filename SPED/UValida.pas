unit UValida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, Grids, DBGrids, Mask, DBCtrls,
  Gauges, ComCtrls, UFmFilial, ToolEdit, xmldom, XMLIntf, msxmldom, XMLDoc,
  UFmSerie, OracleData, OraTeste, QuickRpt, QRCtrls;

type
  TConsisteInscricaoEstadual = function(const Insc, UF: string): Integer; stdcall;
type
  TFValida = class(TForm)
    PcValidacao: TPageControl;
    TsCadastro: TTabSheet;
    TsNotas: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    LCPFCNPJ: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    LCpfCnpjInvalido: TLabel;
    LIEInvalida: TLabel;
    Label3: TLabel;
    LTelefoneInvalido: TLabel;
    BtnCarregar: TBitBtn;
    GroupBox1: TGroupBox;
    DbGCadastro: TDBGrid;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    MeCPFCNPJ: TMaskEdit;
    DBRadioGroup1: TDBRadioGroup;
    MeIE: TMaskEdit;
    DBEdit3: TDBEdit;
    CbEstado: TDBLookupComboBox;
    BtnGravar: TBitBtn;
    BitBtn1: TBitBtn;
    MeTelefone: TMaskEdit;
    DsCadastro: TDataSource;
    DsConsEstado: TDataSource;
    DsNotas: TDataSource;
    DBGrid1: TDBGrid;
    BitBtn2: TBitBtn;
    RgTipo: TRadioGroup;
    FmFilial: TFmFilial;
    Label4: TLabel;
    Label8: TLabel;
    MeDataIni: TMaskEdit;
    MeDataFin: TMaskEdit;
    TsXML: TTabSheet;
    Label9: TLabel;
    DeDiretorio: TDirectoryEdit;
    Fm2Serie: TFmSerie;
    BitBtn3: TBitBtn;
    procedure BtnCarregarClick(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure CbEstadoClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FmFilialMeFilialChange(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
//    arquivos: array of string;
    procedure ListarArquivos(Diretorio: string);
    procedure ImportaXML(arquivo: string);

    function ValidaIEstadual(wInscricao, wEstado: string): boolean;
    function SomenteNumeros(wString: string): string;
    function adicionaMascara(valor, mascara: string): string;
    function ValidaTelefone(telefone: string): Boolean;
    procedure AnalisaCadastros(Sender: TObject);
    procedure AnalisaNotas(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FValida: TFValida;

implementation

uses Oracle, MaskUtils, UValida_cl, UOracle_cl, UThreadAction,
  UThreadLocal, URConsulta, UParamSistema_cl;

{$R *.dfm}

function TFValida.ValidaIEstadual(wInscricao, wEstado: string): boolean;
var
  LibHandle: THandle;
  ConsisteInscricaoEstadual: TConsisteInscricaoEstadual;
begin
  try
    LibHandle := LoadLibrary(PChar(Trim('DllInscE32.dll')));
    if LibHandle <= HINSTANCE_ERROR then
      raise Exception.Create('Dll não carregada');

    @ConsisteInscricaoEstadual := GetProcAddress(LibHandle, 'ConsisteInscricaoEstadual');
    if @ConsisteInscricaoEstadual = nil then
      raise Exception.Create('Entrypoint Download não encontrado na Dll');

    Result := ConsisteInscricaoEstadual(SomenteNumeros(wInscricao), wEstado) = 0;

    FreeLibrary(LibHandle);
  except
    raise exception.Create('Erro ao tentar abrir biblioteca para validar Inscr. Estadual');
  end;
end;

function chInt(ch: Char): ShortInt;
begin
  Result := Ord(ch) - Ord('0');
end;

{ intCh = Converte um valor inteiro (de 0 a 9) para o caracter numérico
  correspondente. }

function intCh(int: ShortInt): Char;
begin
  Result := Chr(int + Ord('0'));
end;

{ DvModulo11 - Retorna 1 dv calculado pelo método do modulo 11 padrão. }

function DvModulo11(str: string): Char;
var
  soma, fator, i: Integer;
begin
  soma := 0;
  fator := 2;
  for i := Length(str) downto 1 do
  begin
    soma := soma + chInt(str[i]) * fator;
    Inc(fator);
    if fator = 10 then
      fator := 2;
  end;
  soma := 11 - (soma mod 11);
  if soma >= 10 then
    Result := '0'
  else
    Result := intCh(soma);
end;

{ dvModulo11ParaCPF - Retorna 1 dv calculado pelo método do modulo 11
  ligeiramente alterado para o CPF. }

function dvModulo11ParaCPF(str: string): Char;
var
  soma, fator, i: Integer;
begin
  soma := 0;
  fator := 2;
  for i := Length(str) downto 1 do
  begin
    soma := soma + chInt(str[i]) * fator;
    Inc(fator);
  end;
  soma := 11 - (soma mod 11);
  if soma >= 10 then
    Result := '0'
  else
    Result := intCh(soma);
end;

{ DvModulo10 - Retorna 1 dv calculado pelo método do modulo 10 padrão. }

function DvModulo10(str: string): Char;
var
  soma, fator, i: Integer;
begin
  soma := 0;
  fator := 2;
  for i := Length(str) downto 1 do
  begin
    soma := soma + chInt(str[i]) * fator;
    Dec(fator);
    if fator = 0 then
      fator := 2;
  end;
  soma := 10 - (soma div 11);
  if soma >= 10 then
    Result := '0'
  else
    Result := intCh(soma);
end;

{ DvCNPJ - Retorna os dois dvs de um CNPJ, dado o CNPJ sem os dvs em forma de
  string (12 caracteres numéricos). }

function DvCNPJ(str: string): string;
var
  dv1: Char;
begin
  dv1 := DvModulo11(str);
  Result := dv1 + DvModulo11(str + dv1);
end;

{ DvCPF - Retorna os dois dvs de um CPF, dado o CPF sem os dvs em forma de
  string (9 caracteres numéricos). }

function DvCPF(str: string): string;
var
  dv1: Char;
begin
  dv1 := dvModulo11ParaCPF(str);
  Result := dv1 + dvModulo11ParaCPF(str + dv1);
end;

{ ValidaCNPJ - Retorna true se o CNPJ dado é valido. O CNPJ deve ser um string
  de 14 caracteres numéricos. }

function ValidaCNPJ(str: string): Boolean;
begin
  Result := Copy(str, 13, 2) = DvCNPJ(Copy(str, 1, 12));
end;

{ ValidaCPF - Retorna true se o CPF dado é valido. O CPF deve ser um string
  de 11 caracteres numéricos. }

function ValidaCPF(str: string): Boolean;
begin
  Result := Copy(str, 10, 2) = DvCPF(Copy(str, 1, 9));
end;

function TFValida.SomenteNumeros(wString: string): string;
var
  i: Integer;
  wStringNova: string;
begin
  wStringNova := '';

  for i := 1 to Length(wString) do
    if wString[i] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'] then
      wStringNova := wStringNova + wString[i];

  Result := wStringNova;
end;

function TFValida.ValidaTelefone(telefone: string): Boolean;
begin
  if (length(SomenteNumeros(telefone)) = 10) or (length(telefone) = 0) { or
  ((length(SomenteNumeros(telefone)) = 10) and (length(telefone) > 10))}then
    Result := True
  else
    Result := False;
end;

procedure TFValida.BtnCarregarClick(Sender: TObject);
var
  thread: TThreadLocal;
begin
  thread := TThreadLocal.Create;
  thread.thread.OnRun := AnalisaCadastros;
  thread.Resume;
end;

procedure TFValida.AnalisaCadastros(Sender: TObject);
var
  Erros: TStringList;
  ieUsar: string;
begin
  Erros := TStringList.Create;

  DmValida.CdCadastro.Close;
  DmValida.CdCadastro.Open;

  DmValida.CdCadastro.Filtered := False;

  DsCadastro.DataSet := nil;
  DmValida.CdCadastro.First;
  while not DmValida.CdCadastro.Eof do
  begin
    Erros.Clear;
    DmValida.CdCadastro.Edit;
    DmValida.CdCadastroIND_ERRO.Value := 'N';

    //    if DmValida.CdCadastroIND_FISICA_JURIDICA.Value = 'F' then
    //    Begin
    //      if ((DmValida.CdCadastroDESC_INSCRICAO_MUNICIPAL.IsNull) or (DmValida.CdCadastroDESC_INSCRICAO_MUNICIPAL.Value = '')) then
    //        ieUsar := ''
    //      else
    //        ieUsar := DmValida.CdCadastroDESC_INSCRICAO_MUNICIPAL.Value;
    //    End
    //    Else
    //      ieUsar := DmValida.CdCadastroNUM_INSCRICAO.Value;

    ieUsar := DmValida.CdCadastroNUM_INSCRICAO.Value;

    DmValida.CdCadastroDESC_CNPJ_NUMEROS.Value := SomenteNumeros(DmValida.CdCadastroDESC_CNPJ.Value);
    DmValida.CdCadastroDESC_CPF_NUMEROS.Value := SomenteNumeros(DmValida.CdCadastroDESC_CPF.Value);
    DmValida.CdCadastroNUM_INSCRICAO_NUMEROS.Value := SomenteNumeros(ieUsar);
    DmValida.CdCadastroDESC_TELEFONE_NUMEROS.Value := SomenteNumeros(DmValida.CdCadastroDESC_TELEFONE.Value);

    if (DmValida.CdCadastroNUM_INSCRICAO_NUMEROS.Value <> '') and (not DmValida.CdCadastroNUM_INSCRICAO_NUMEROS.IsNull) then
      if (not ValidaIEstadual(DmValida.CdCadastroNUM_INSCRICAO_NUMEROS.Value, DmValida.CdCadastroDESC_SIGLA_ESTADO.Value)) then
      begin
        DmValida.CdCadastroIND_ERRO.Value := 'S';
        DmValida.CdCadastroIND_ERRO_IE.Value := 'S';
        Erros.Append('Inscrição Estadual inválida.');
      end;

    if (DmValida.CdCadastroIND_FISICA_JURIDICA.Value = 'J') and (not ValidaCNPJ(DmValida.CdCadastrodesc_cnpj_numeros.Value)) then
    begin
      DmValida.CdCadastroIND_ERRO.Value := 'S';
      DmValida.CdCadastroIND_ERRO_CNPJ.Value := 'S';
      Erros.Append('CNPJ inválido.');
    end;

    if (DmValida.CdCadastroIND_FISICA_JURIDICA.Value = 'F') and (not ValidaCPF(DmValida.CdCadastrodesc_cpf_numeros.Value)) then
    begin
      DmValida.CdCadastroIND_ERRO.Value := 'S';
      DmValida.CdCadastroIND_ERRO_CPF.Value := 'S';
      Erros.Append('CPF inválido.');
    end;

    if (not ValidaTelefone(DmValida.CdCadastroDESC_TELEFONE.Value)) then
    begin
      DmValida.CdCadastroIND_ERRO.Value := 'S';
      DmValida.CdCadastroIND_ERRO_TELEFONE.Value := 'S';
      Erros.Append('Telefone inválido.');

      try
        if ((length(FloatToStr(StrToFloat(DmValida.CdCadastroDESC_TELEFONE_NUMEROS.Value))) = 10) and (length(DmValida.CdCadastroDESC_TELEFONE.Value) > 10)) then
          DmValida.CdCadastroDESC_TELEFONE_NUMEROS.Value := FloatToStr(StrToFloat(DmValida.CdCadastroDESC_TELEFONE_NUMEROS.Value));
      except
        DmValida.CdCadastroDESC_TELEFONE_NUMEROS.Value := '';
      end;
    end;

    DmValida.CdCadastroDESC_MENSAGEM_ERRO.Value := Erros.Text;

    DmValida.CdCadastro.Post;
    DmValida.CdCadastro.Next;
  end;
  DmValida.CdCadastro.Filtered := True;
  DsCadastro.DataSet := DmValida.CdCadastro;

  DmValida.QConsEstado.Close;
  DmValida.QConsEstado.open;
end;

procedure TFValida.DBEdit1Change(Sender: TObject);
var
  cnpjFormat, cpfFormat: string;
begin
  cnpjFormat := copy(DmValida.CdCadastrodesc_cnpj_numeros.Value, 1, 14);
  cpfFormat := copy(DmValida.CdCadastrodesc_cpf_numeros.Value, 1, 11);

  CbEstadoClick(Self);
  if DmValida.CdCadastroIND_FISICA_JURIDICA.Value = 'F' then
  begin
    MeCPFCNPJ.EditMask := '999\.999\.999\-99;0;_';
    LCPFCNPJ.Caption := 'CPF';
    MeCPFCNPJ.Text := cpfFormat;

    if DmValida.CdCadastroIND_ERRO_CPF.Value = 'S' then
    begin
      LCpfCnpjInvalido.Visible := True;
      LCpfCnpjInvalido.Caption := '* CPF Inválido';
    end
    else
      LCpfCnpjInvalido.Visible := False;
  end
  else
  begin
    MeCPFCNPJ.EditMask := '99\.999\.999\/9999\-99;0;_';
    LCPFCNPJ.Caption := 'CNPJ';
    MeCPFCNPJ.Text := cnpjFormat;

    if DmValida.CdCadastroIND_ERRO_CNPJ.Value = 'S' then
    begin
      LCpfCnpjInvalido.Visible := True;
      LCpfCnpjInvalido.Caption := '* CNPJ Inválido';
    end
    else
      LCpfCnpjInvalido.Visible := False;
  end;

  MeTelefone.Text := copy(DmValida.CdCadastroDESC_TELEFONE_NUMEROS.Value, 1, 10);

  if DmValida.CdCadastroIND_ERRO_IE.Value = 'S' then
    LIEInvalida.Visible := True
  else
    LIEInvalida.Visible := False;

  if DmValida.CdCadastroIND_ERRO_TELEFONE.Value = 'S' then
    LTelefoneInvalido.Visible := True
  else
    LTelefoneInvalido.Visible := False;
end;

function TFValida.adicionaMascara(valor, mascara: string): string;
var
  i, barras: Integer;
  textoTemp, mascaraSemBarra: string;
begin
  mascaraSemBarra := '';
  for i := 1 to length(mascara) do
  begin
    if mascara[i] <> '\' then
      mascaraSemBarra := mascaraSemBarra + mascara[i];
    if mascara[i] = ';' then
      Break;
  end;

  textoTemp := '';
  barras := 0;
  i := 1;
  while i <= length(valor) do
  begin
    if mascaraSemBarra[i] = ';' then
      Break;
    if (mascaraSemBarra[i] = '/') or (mascaraSemBarra[i] = '.') or (mascaraSemBarra[i] = '-') or (mascaraSemBarra[i] = ' ') or (mascaraSemBarra[i] = '(') or (mascaraSemBarra[i] = ')') then
    begin
      textoTemp := textoTemp + mascaraSemBarra[i];
      delete(mascaraSemBarra, i, 1);
    end
    else
    begin
      textoTemp := textoTemp + valor[i];
      inc(i);
    end;
  end;

  Result := textoTemp;
end;

procedure TFValida.CbEstadoClick(Sender: TObject);
//var i, barras: Integer;
//textoTemp, mascaraSemBarra: String;
begin
  MeIE.EditMask := '99999999\-99;1;_'; //PR

  if DmValida.CdCadastroDESC_SIGLA_ESTADO.Value = 'AC' then
    MeIE.EditMask := '99\.999\.999\/999\-99;1;_';
  if DmValida.CdCadastroDESC_SIGLA_ESTADO.Value = 'AL' then
    MeIE.EditMask := '999999999;1;_';
  if DmValida.CdCadastroDESC_SIGLA_ESTADO.Value = 'AP' then
    MeIE.EditMask := '999999999;1;_';
  if DmValida.CdCadastroDESC_SIGLA_ESTADO.Value = 'AM' then
    MeIE.EditMask := '99\.999\.999\-9;1;_';
  if DmValida.CdCadastroDESC_SIGLA_ESTADO.Value = 'BA' then
    MeIE.EditMask := '999999\-99;1;_';
  if DmValida.CdCadastroDESC_SIGLA_ESTADO.Value = 'CE' then
    MeIE.EditMask := '99999999\-9;1;_';
  if DmValida.CdCadastroDESC_SIGLA_ESTADO.Value = 'DF' then
    MeIE.EditMask := '99999999999\-99;1;_';
  if DmValida.CdCadastroDESC_SIGLA_ESTADO.Value = 'ES' then
    MeIE.EditMask := '999999999;1;_';
  if DmValida.CdCadastroDESC_SIGLA_ESTADO.Value = 'GO' then
    MeIE.EditMask := '99\.999\.999\-9;1;_';
  if DmValida.CdCadastroDESC_SIGLA_ESTADO.Value = 'MA' then
    MeIE.EditMask := '999999999;1;_';
  if DmValida.CdCadastroDESC_SIGLA_ESTADO.Value = 'MT' then
    MeIE.EditMask := '9999999999\-9;1;_';
  if DmValida.CdCadastroDESC_SIGLA_ESTADO.Value = 'MS' then
    MeIE.EditMask := '999999999;1;_';
  if DmValida.CdCadastroDESC_SIGLA_ESTADO.Value = 'MG' then
    MeIE.EditMask := '999\.999\.999\/9999;1;_';
  if DmValida.CdCadastroDESC_SIGLA_ESTADO.Value = 'PA' then
    MeIE.EditMask := '99\-999999\-9;1;_';
  if DmValida.CdCadastroDESC_SIGLA_ESTADO.Value = 'PB' then
    MeIE.EditMask := '99999999\-9;1;_';
  if DmValida.CdCadastroDESC_SIGLA_ESTADO.Value = 'PR' then
    MeIE.EditMask := '99999999\-99;1;_';
  if DmValida.CdCadastroDESC_SIGLA_ESTADO.Value = 'PE' then
    MeIE.EditMask := '99\.9\.999\.9999999\-9;1;_';
  if DmValida.CdCadastroDESC_SIGLA_ESTADO.Value = 'PI' then
    MeIE.EditMask := '999999999;1;_';
  if DmValida.CdCadastroDESC_SIGLA_ESTADO.Value = 'RJ' then
    MeIE.EditMask := '99\.999\.99\-9;1;_';
  if DmValida.CdCadastroDESC_SIGLA_ESTADO.Value = 'RN' then
    MeIE.EditMask := '99\.999\.999\-9;1;_';
  if DmValida.CdCadastroDESC_SIGLA_ESTADO.Value = 'RS' then
    MeIE.EditMask := '999\/9999999;1;_';
  if DmValida.CdCadastroDESC_SIGLA_ESTADO.Value = 'RO' then
    MeIE.EditMask := '999\.99999\-9;1;_';
  if DmValida.CdCadastroDESC_SIGLA_ESTADO.Value = 'RR' then
    MeIE.EditMask := '99999999\-9;1;_';
  if DmValida.CdCadastroDESC_SIGLA_ESTADO.Value = 'SC' then
    MeIE.EditMask := '999\.999\.999;1;_';
  if DmValida.CdCadastroDESC_SIGLA_ESTADO.Value = 'SP' then
    MeIE.EditMask := '999\.999\.999\.999;1;_';
  if DmValida.CdCadastroDESC_SIGLA_ESTADO.Value = 'SE' then
    MeIE.EditMask := '999999999\-9;1;_';
  if DmValida.CdCadastroDESC_SIGLA_ESTADO.Value = 'TO' then
    MeIE.EditMask := '99999999999;1;_';

  MeIE.Text := adicionaMascara(DmValida.CdCadastroNUM_INSCRICAO_NUMEROS.Value, MeIE.EditMask)

  //  mascaraSemBarra := '';
  //  for i := 1 to length(MeIE.EditMask) do
  //  Begin
  //    if MeIE.EditMask[i] <> '\' then
  //      mascaraSemBarra := mascaraSemBarra + MeIE.EditMask[i];
  //    if MeIE.EditMask[i] = ';' then
  //      Break;
  //  End;
  //
  //  textoTemp := '';
  //  barras := 0;
  //  i := 1;
  //  while i <= length(DmValida.CdCadastronum_inscricao_numeros.Value) do
  //  Begin
  //    if mascaraSemBarra[i] = ';' then
  //      Break;
  //    if (mascaraSemBarra[i] = '/') or (mascaraSemBarra[i] = '.') or (mascaraSemBarra[i] = '-') then
  //    Begin
  //      textoTemp := textoTemp + mascaraSemBarra[i];
  //      delete(mascaraSemBarra, i, 1);
  //    End
  //    else
  //    Begin
  //      textoTemp := textoTemp + DmValida.CdCadastronum_inscricao_numeros.Value[i];
  //      inc(i);
  //    End;
  //  End;
  //
  //  MeIE.Text := textoTemp;
end;

procedure TFValida.BtnGravarClick(Sender: TObject);
var
  Erro: Boolean;
begin
  if (not (DmValida.CdCadastro.State in [dsEdit])) then
    DmValida.CdCadastro.Edit;

  Erro := False;
  DmValida.CdCadastroIND_ERRO_CPF.Value := 'N';
  DmValida.CdCadastroIND_ERRO_CNPJ.Value := 'N';
  DmValida.CdCadastroIND_ERRO_IE.Value := 'N';
  DmValida.CdCadastroIND_ERRO_TELEFONE.Value := 'N';
  LCPFCNPJInvalido.Visible := False;
  LIEInvalida.Visible := False;
  LTelefoneInvalido.Visible := False;

  if (DmValida.CdCadastroIND_FISICA_JURIDICA.Value = 'F') and (not ValidaCPF(MeCPFCNPJ.Text)) then
  begin
    DmValida.CdCadastroIND_ERRO_CPF.Value := 'S';
    LCpfCnpjInvalido.Visible := True;
    LCpfCnpjInvalido.Caption := '* CPF Inválido';
    Erro := True;
  end;

  if (DmValida.CdCadastroIND_FISICA_JURIDICA.Value = 'J') and (not ValidaCNPJ(MeCPFCNPJ.Text)) then
  begin
    DmValida.CdCadastroIND_ERRO_CNPJ.Value := 'S';
    LCpfCnpjInvalido.Visible := True;
    LCpfCnpjInvalido.Caption := '* CNPJ Inválido';
    Erro := True;
  end;

  if SomenteNumeros(MeIE.Text) <> '' then
  begin
    if (not ValidaIEstadual(MeIE.Text, DmValida.CdCadastroDESC_SIGLA_ESTADO.Value)) then
    begin
      DmValida.CdCadastroIND_ERRO_IE.Value := 'S';
      LIEInvalida.Visible := True;
      Erro := True;
    end;
  end
  else
    DmValida.CdCadastroNUM_INSCRICAO.Clear;

  if (not ValidaTelefone(MeTelefone.Text)) then
  begin
    DmValida.CdCadastroIND_ERRO_TELEFONE.Value := 'S';
    LTelefoneInvalido.Visible := True;
    Erro := True;
  end;

  if SomenteNumeros(MeIE.Text) <> '' then
    DmValida.CdCadastroNUM_INSCRICAO.Value := MeIE.Text;
  if DmValida.CdCadastroIND_FISICA_JURIDICA.Value = 'F' then
    DmValida.CdCadastrodesc_cpf_numeros.Value := MeCPFCNPJ.Text
  else
    DmValida.CdCadastrodesc_cnpj_numeros.Value := MeCPFCNPJ.Text;
  DmValida.CdCadastroDESC_TELEFONE_NUMEROS.Value := MeTelefone.Text;

  if Erro then
  begin
    DmValida.CdCadastroIND_ERRO.Value := 'S';
    MessageDlg('Gravado.' + #13 + #10 + 'Mas ainda contém erros.', mtWarning, [mbOK], 0);
  end
  else
  begin
    DmValida.CdCadastroIND_ALTERADO.Value := 'S';
    DmValida.CdCadastroIND_ERRO.Value := 'N';
  end;

  DmValida.CdCadastro.Post;
end;

procedure TFValida.BitBtn1Click(Sender: TObject);
begin
  DsCadastro.DataSet := nil;

  DmValida.CdCadastro.Filtered := False;

  DmValida.CdCadastro.First;
  while not DmValida.CdCadastro.Eof do
  begin
    if DmValida.CdCadastroIND_ALTERADO.Value = 'S' then
    begin
      DMOracle.DBCemapa.StartTransaction;
      if DmValida.CdCadastroIND_FISICA_JURIDICA.Value = 'F' then
        DMOracle.QExecSQL.SQL.Add('UPDATE TB_CADASTRO SET NUM_CGC_CPF = ' + QuotedStr(DmValida.CdCadastroDESC_CPF_NUMEROS.Value) + ', NUM_INSCRICAO = ' + QuotedStr(DmValida.CdCadastroNUM_INSCRICAO.Value) + ', DESC_TELEFONE = ' + QuotedStr(DmValida.CdCadastroDESC_TELEFONE_NUMEROS.Value) + ' WHERE COD_CADASTRO = ' + IntToStr(DmValida.CdCadastroCOD_CADASTRO.Value))
      else
        DMOracle.QExecSQL.SQL.Add('UPDATE TB_CADASTRO SET NUM_CGC_CPF = ' + QuotedStr(DmValida.CdCadastroDESC_CNPJ_NUMEROS.Value) + ', NUM_INSCRICAO = ' + QuotedStr(DmValida.CdCadastroNUM_INSCRICAO.Value) + ', DESC_TELEFONE = ' + QuotedStr(DmValida.CdCadastroDESC_TELEFONE_NUMEROS.Value) + ' WHERE COD_CADASTRO = ' + IntToStr(DmValida.CdCadastroCOD_CADASTRO.Value));
      DMOracle.QExecSQL.Close;
      try
        DMOracle.QExecSQL.ExecSQL;
        DMOracle.DBCemapa.Commit;
      except
        DMOracle.DBCemapa.Rollback;
      end;
    end;

    DmValida.CdCadastro.Next;
  end;
end;

procedure TFValida.FmFilialMeFilialChange(Sender: TObject);
begin
  if Trim(FmFilial.MeFilial.Text) = '0' then
    FmFilial.EdFilial.Text := 'TODAS';
end;

procedure TFValida.BitBtn2Click(Sender: TObject);
var
  thread: TThreadLocal;
begin
  thread := TThreadLocal.Create;
  thread.thread.OnRun := AnalisaNotas;
  thread.Resume;
end;

procedure TFValida.AnalisaNotas(Sender: TObject);
begin
  DmValida.QNotas.Close;
  DmValida.QNotas.SetVariable('TIPO', RgTipo.ItemIndex);
  DmValida.QNotas.SetVariable('COD_FILIAL', Trim(FmFilial.MeFilial.Text));
  DmValida.QNotas.SetVariable('DATA_INI', MeDataIni.Text);
  DmValida.QNotas.SetVariable('DATA_FIN', MeDataFin.Text);
  DmValida.QNotas.open;
end;

procedure TFValida.ListarArquivos(Diretorio: string);
var
  F: TSearchRec;
  Ret: Integer;
begin
  //  SetLength(arquivos, 0);

  Ret := FindFirst(Diretorio + '\*procNFe.xml', faAnyFile, F);
  try
    while Ret = 0 do
    begin
      //      SetLength(arquivos, length(arquivos) + 1);
      //      arquivos[Length(arquivos) - 1] := Diretorio + '\' + F.Name;
      ImportaXML(Diretorio + '\' + F.Name);
      Ret := FindNext(F);
    end;
  finally
    FindClose(F);
  end;

  MessageDlg('Importação concluída.', mtInformation, [mbOK], 0);
end;

procedure TFValida.ImportaXML(arquivo: string);
var
  xml: TXMLDocument;
  NodePai, NodeSec: IXMLNode;
  wChave, wNumNota, wNotaCab: String;
begin
  try
    xml := TXMLDocument.Create(Self);
    xml.LoadFromFile(arquivo);

    NodePai := xml.DocumentElement.childNodes.First.ChildNodes.FindNode('infNFe');
    NodeSec := NodePai.ChildNodes.First.ChildNodes.FindNode('nNF');

    wChave := NodePai.Attributes['Id'];
    wNumNota := NodeSec.NodeValue;

    wNotaCab := DMOracle.BuscaNome('SELECT DECODE(DESC_CHAVE_ACESSO, NULL, COD_NOTA_CAB, 0) FROM TB_NOTA_CAB', 'NUM_NOTA = ' + wNumNota + ' AND COD_SERIE = ' + QuotedStr(Trim(Fm2Serie.MeSerie.Text)));
    if ((wNotaCab <> '0') and (wNotaCab <> '')) then
      DMOracle.ExecutaSql('UPDATE TB_NOTA_CAB SET DESC_CHAVE_ACESSO = ' + QuotedStr(wChave) + ' WHERE COD_NOTA_CAB = ' + wNotaCab, False);

    DMOracle.DBCemapa.Commit;
  except
    DMOracle.DBCemapa.Rollback;
    Exit;
  end;
end;

procedure TFValida.BitBtn3Click(Sender: TObject);
begin
  ListarArquivos(DeDiretorio.Text);
end;

end.
