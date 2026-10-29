unit Registro;

interface

uses Dialogs, Classes, TypInfo, SysUtils, Arquivo;

type
  TRegistro = class
  private
  protected
    arquivoPadrao: TArquivo;
    procedure grava;
    procedure afterGravacao;
  public
    linhaNaoGravada: string;
    bloco: string; //C(1)
    registro: string; //C(3)
    chamador: TObject;
    constructor Create(var chamador: TObject; var arquivoPadrao: TArquivo);
    procedure addCampo(texto: string); overload;
    procedure addCampo(texto: string; tamanho: Integer); overload;
    procedure addCampo(valor: Integer; caracteres: Integer); overload;
    procedure addCampo(data: TDateTime; tipo: string); overload;
    procedure addCampo(valor: Double; casas: Integer); overload;
    procedure addCampo(valor: Double; casasAntes, casasDepois: Integer); overload;
  end;

implementation

uses UFuncoes, UContabil, UFiscal, UPisCofins;

{ TRegistro }

constructor TRegistro.Create(var chamador: TObject; var arquivoPadrao: TArquivo);
begin
  Self.arquivoPadrao := arquivoPadrao;

  Self.bloco := Copy(ClassName, length(ClassName) - 3, 1);
  Self.registro := Copy(ClassName, length(ClassName) - 2, 3);

  linhaNaoGravada := '';

  Self.chamador := chamador;
  if (chamador.ClassName = 'TContabil') then
    TContabil(chamador).thread.mostramensagem('Gerando registro ' + Self.bloco + Self.registro, True);
  if (chamador.ClassName = 'TFiscal') then
    TFiscal(chamador).thread.mostramensagem('Gerando registro ' + Self.bloco + Self.registro, True);
  if (chamador.ClassName = 'TPisCofins') then
    TPisCofins(chamador).thread.mostramensagem('Gerando registro ' + Self.bloco + Self.registro, True);
end;

procedure TRegistro.grava;
begin
//  Destroy;
  linhaNaoGravada := '';
//  arquivoPadrao.addRegProgresso(bloco, registro);
end;

procedure TRegistro.afterGravacao;
begin
//  Self.Destroy;
end;

procedure TRegistro.addCampo(texto: string);
begin
  if linhaNaoGravada = '' then
    linhaNaoGravada := '|';

  linhaNaoGravada := linhaNaoGravada + Trim(Copy(TiraPipe(texto), 1, 255)) + '|';
end;

procedure TRegistro.addCampo(texto: string; tamanho: Integer);
begin
  if linhaNaoGravada = '' then
    linhaNaoGravada := '|';

  linhaNaoGravada := linhaNaoGravada + TiraPipe(Copy(texto, 1, tamanho)) + '|';
end;

procedure TRegistro.addCampo(valor: Integer; caracteres: Integer);
var i: Integer;
  formatacao: string;
begin
  if ((caracteres <= 0) and (valor = 0)) then
  begin
    addCampo('');
    Exit;
  end;

  for i := 1 to caracteres do
    formatacao := formatacao + '0';

  if linhaNaoGravada = '' then
    linhaNaoGravada := '|';

  linhaNaoGravada := linhaNaoGravada + FormatFloat(formatacao, valor) + '|';
end;

procedure TRegistro.addCampo(data: TDateTime; tipo: string);
begin
  if data = 0 then
  begin
    addCampo('');
    Exit;
  end;

  if linhaNaoGravada = '' then
    linhaNaoGravada := '|';

  if (tipo = 'D') then
    linhaNaoGravada := linhaNaoGravada + FormatDateTime('ddMMyyyy', data) + '|'
  else
    if (tipo = 'H') then
      linhaNaoGravada := linhaNaoGravada + FormatDateTime('hhnnss', data) + '|'
//    else
//      if (tipo = 'M') then
//        linhaNaoGravada := linhaNaoGravada + FormatDateTime('MMyyyy', data) + '|'
      else
        linhaNaoGravada := linhaNaoGravada + '|';
end;

procedure TRegistro.addCampo(valor: Double; casas: Integer);
var i: Integer;
  formatacao: string;
begin
  for i := 1 to casas do
    formatacao := formatacao + '0';
  if casas > 0 then
    formatacao := '#0.' + formatacao;

  if linhaNaoGravada = '' then
    linhaNaoGravada := '|';

  linhaNaoGravada := linhaNaoGravada + FormatFloat(formatacao, valor) + '|';
end;

procedure TRegistro.addCampo(valor: Double; casasAntes, casasDepois: Integer);
var i: Integer;
  formatacao: string;
begin
  for i := 1 to casasAntes do
    formatacao := formatacao + '0';
  formatacao := formatacao + '.';
  for i := 1 to casasDepois do
    formatacao := formatacao + '0';
  if casasAntes <= 0 then
    formatacao := '#0' + formatacao;

  if linhaNaoGravada = '' then
    linhaNaoGravada := '|';

  linhaNaoGravada := linhaNaoGravada + FormatFloat(formatacao, valor) + '|';
end;

end.

