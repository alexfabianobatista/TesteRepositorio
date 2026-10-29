unit UCarregando2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, Gauges, StdCtrls, ComCtrls;

type
  TFCarregando2 = class(TForm)
    Panel1: TPanel;
    Gauge1: TGauge;
    lbDetalhes: TLabel;
    Panel2: TPanel;
    Image1: TImage;
    lbAguarde: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    fModoVisualizacao : string;
    fProgresso: Double;
    procedure Recarrega(vModo : string);
  public
    { Public declarations }
    procedure Progresso(valor : Double);
    procedure Incremeta(valor : Double);
    procedure Decrementa(valor : Double);
    function Atualmente(): Double;
    procedure ModoCompacto();
    procedure ModoAmpliado();  
    procedure Centralizar();
    procedure Detalhe(vLinha : string);
  end;


implementation

{
  Carregando2 pode ser utilizado para exibir um menu de carregamento enquanto o código executa qualquer tarefa.
  Ela trabalha em 2 modos:
  -Compacto: Uma janela menor, mostra apenas a barra de carregamento com a mensagem "carregando...".
  -Ampliado: Uma janela um pouco maior, agora é possível mostrar mensagens enquanto ocorre o carregamento.

  Importante: O valor máximo da barra de carregamento é 100, que é equivalente a 100% da barra carregada.
  -Os métodos Progresso, Incrementa e Decrementa estipulam o valor da barra de carregamento.
  -Os método Detalhe informa a mensagem que será exibida no modo Apliado.
  -Por padrão o método carregado é o Compacto, caso queira utilizar o Ampliado é necessário Ativa-lo antes.
}

procedure TFCarregando2.Detalhe(vLinha: string);
begin
  lbDetalhes.Caption := vLinha;
  Application.ProcessMessages;
end;

procedure TFCarregando2.Recarrega(vModo: string);
begin
  if vModo = 'AMPLIADO' then
  begin
    if fModoVisualizacao = 'COMPACTO' then
      ClientWidth := ClientWidth*2;
    fModoVisualizacao := 'AMPLIADO';
    lbDetalhes.Visible := True;
  end
  else if vModo = 'COMPACTO' then
  begin
    if fModoVisualizacao = 'AMPLIADO' then
      ClientWidth := Round(ClientWidth/2); 
    fModoVisualizacao := 'COMPACTO';
    lbDetalhes.Visible := False;
  end;
  Centralizar;
end;

procedure TFCarregando2.ModoCompacto();
begin
  Recarrega('COMPACTO');
end;

procedure TFCarregando2.ModoAmpliado();
begin
  Recarrega('AMPLIADO');
end;

procedure TFCarregando2.Progresso(valor: Double);
begin
  if valor > 100 then
    valor := 100
  else if valor < 0 then
    valor := 0;
  fProgresso := valor;
  Gauge1.Progress := Trunc(fProgresso);
  Application.ProcessMessages;
end;

procedure TFCarregando2.Incremeta(valor: Double);
begin
  fProgresso := fProgresso + valor;
  if fProgresso > 100 then
    fProgresso := 100
  else if fProgresso < 0 then
    fProgresso := 0;

  Gauge1.Progress := Trunc(fProgresso);
  Application.ProcessMessages;
end;

procedure TFCarregando2.Decrementa(valor: Double);
begin
  fProgresso := fProgresso - valor;
  
  if fProgresso > 100 then
    fProgresso := 100
  else if fProgresso < 0 then
    fProgresso := 0;

  Gauge1.Progress := Trunc(fProgresso);
  Application.ProcessMessages;
end;

function TFCarregando2.Atualmente() : Double;
begin
  Result := Gauge1.Progress;
end;

{$R *.dfm}

procedure TFCarregando2.FormShow(Sender: TObject);
begin
  Gauge1.Progress := 0;
  Centralizar;
end;

procedure TFCarregando2.FormCreate(Sender: TObject);
begin
  fModoVisualizacao := 'COMPACTO';
  Centralizar;
end;

procedure TFCarregando2.Centralizar;
var
  LRect: TRect;
  X, Y: Integer;
begin
  LRect := Screen.WorkAreaRect;
  X := LRect.Left + (LRect.Right - LRect.Left - Width) div 2;
  Y := LRect.Top + (LRect.Bottom - LRect.Top - Height) div 2;
  SetBounds(X, Y, Width, Height);
  Application.ProcessMessages;
end;

procedure TFCarregando2.FormActivate(Sender: TObject);
begin
  fProgresso := 0;
end;

procedure TFCarregando2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then
    Close;
end;

end.
