unit UAguardoNfe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, UAguardoBloqueado, ComCtrls, Gauges, Menus;

type
  TFAguardoNfe = class(TForm, ITelaAguardo)
    TCancelamentoNfe: TTimer;
    TConsultaNfe: TTimer;
    PAguardoNfe: TPanel;
    LblAguarde: TLabel;
    IAguardoNfe: TImage;
    GAguardoNfe: TGauge;
    LblMensagem: TLabel;
    PMAguardoNfe: TPopupMenu;
    Ocultar1: TMenuItem;
    procedure TCancelamentoNfeTimer(Sender: TObject);
    procedure TConsultaNfeTimer(Sender: TObject);
    procedure PAguardoNfeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PAguardoNfeMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PAguardoNfeMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Ocultar1Click(Sender: TObject);
  private
    FChave: String;
    FTentativasMax: Integer;
    FTentativas: Integer;
    FClicado: Boolean;
    FPosClickX, FPosClickY: Integer;
    function GetMensagem: String;
    procedure SetMensagem(const Value: String);
  public
    procedure Acabou;
    procedure Limpa;
    //procedure MonitorarCancelamento(chave: String; TimeOut: Integer = 0);
    //procedure MonitorarConsulta(chave, filial: String; TimeOut: Integer = 0);
    property Mensagem: String read GetMensagem write SetMensagem;
    procedure Feito(Percentual: Extended);
    procedure MostraPercentual;
    procedure Notifica(Str: String);
  end;

var
  FAguardoNfe: TFAguardoNfe;

implementation

uses UNfe_cl, Math;

{$R *.dfm}

{procedure TFAguardoNfe.MonitorarCancelamento(chave: String; TimeOut: Integer = 0);
(*
 * Procedure que monitora o STATUS de uma nota a fim de descobrir quando retornou
 * o STATUS "Cancelamento homologado" da SEFAZ, para pode permitir o cancelamento da
 * nota correspondente na TB_NOTA_CAB.
 * Parâmetros:
 *   - chave = chave da nota a ser monitorada
 *   - TimeOut = tempo máximo do monitoramento. Se este parametro nao for atribuido
 *     ou receber o valor 0, será utilizado o timeout padrão, que se encontra em
 *     DMNfe.NFE_TIMEOUT (constante).
 *)
begin
  LblMensagem.Caption := 'Emitindo cancelamento para a SEFAZ';
  if chave <> '' then
  begin
    FChave := chave;
    DMNfe.SetaNfe(FChave, True);
    if DMNfe.QNfeind_cancelado.Value then
      ModalResult := MrOk
    else
    begin
      FTentativasMax := Trunc(IfThen(TimeOut = 0, NFE_TIMEOUT, TimeOut) * 1000 / TCancelamentoNfe.Interval);
      FTentativas := 0;
      DMNfe.CancelaNfe(FChave);
      TCancelamentoNfe.Enabled := True;
      ShowModal;
      DMNfe.QNfe.Close; // Fechando a query depois da utilização
    end;
  end;
end;   }

procedure TFAguardoNfe.TCancelamentoNfeTimer(Sender: TObject);
begin
  TCancelamentoNfe.Enabled := False;
  DMNfe.SetaNfe(FChave, True); //Aqui precisa forçar atualizacao para ver se ja retornou da SEFAZ o status.
  if (DMNfe.QNfeind_cancelado.Value) or (DMNfe.QNfeind_denegado.Value) then
  begin
    ModalResult := mrOk; //Se o STATUS voltou CANCELADO ou DENEGADO, ModalResult será MrOk.
    Exit;
  end
  else
  begin
    if FTentativas >= FTentativasMax then
    begin
      ModalResult := mrAbort; //Se chegou ao tempo máximo do monitoramento e a nota ainda não recebeu o STATUS
                              // esperado, ModalResult será MrAbort.
      Exit;
    end;
    TCancelamentoNfe.Enabled := True;
  end;
  Inc(FTentativas);
end;

{procedure TFAguardoNfe.MonitorarConsulta(chave, filial: String; TimeOut: Integer = 0);
(*
 * Procedure que monitora a consulta de uma nota a fim de descobrir quando retornou
 * o STATUS "Autorizado o uso da NF-e" da SEFAZ, para pode permitir a importação de XML de
 * nota de entrada.
 * Parâmetros:
 *   - chave = chave da nota a ser monitorada
 *   - filial = filial da importação. Necessária para descobrir o ambiente e o tipo de emissão (Normal, Contingencia, Scan)
 *   - TimeOut = tempo máximo do monitoramento. Se este parametro nao for atribuido
 *     ou receber o valor 0, será utilizado o timeout padrão, que se encontra em
 *     DMNfe.NFE_TIMEOUT (constante).
 *)
begin
  LblMensagem.Caption := 'Consultando NF-e na SEFAZ';
  if chave <> '' then
  begin
    FChave := chave;
    DMNfe.SetaNfeConsEntr(FChave, True);
    if DMNfe.QNfeConsEntrind_aprovado.Value then
      ModalResult := MrOk
    else
    begin
      FTentativasMax := Trunc(IfThen(TimeOut = 0, NFE_TIMEOUT, TimeOut) * 1000 / TConsultaNfe.Interval);
      FTentativas := 0;
      DMNfe.ConsultaNfeEntrada(FChave, filial);
      TConsultaNfe.Enabled := True;
      ShowModal;
      DMNfe.QNfeConsEntr.Close; // Fechando a query depois da utilização
    end;
  end;
end;  }

procedure TFAguardoNfe.TConsultaNfeTimer(Sender: TObject);
begin
  TConsultaNfe.Enabled := False;
  DMNfe.SetaNfeConsEntr(FChave, True); //Aqui precisa forçar atualizacao para ver se ja retornou da SEFAZ o status.
  if (DMNfe.QNfeConsEntrind_aprovado.Value) then
  begin
    ModalResult := mrOk; //Se o STATUS voltou AUTORIZADO, ModalResult será MrOk.
    Exit;
  end
  else
  begin
    if FTentativas >= FTentativasMax then
    begin
      ModalResult := mrAbort; //Se chegou ao tempo máximo do monitoramento e a nota ainda não recebeu o STATUS
                              // esperado, ModalResult será MrAbort.
      Exit;
    end;
    TConsultaNfe.Enabled := True;
  end;
  Inc(FTentativas);
end;

function TFAguardoNfe.GetMensagem: String;
begin
  Result := LblMensagem.Caption;
end;

procedure TFAguardoNfe.SetMensagem(const Value: String);
begin
  LblMensagem.Caption := Value;
end;

procedure TFAguardoNfe.Notifica(Str: String);
begin
  Mensagem := Str;
end;

procedure TFAguardoNfe.Feito(Percentual: Extended);
begin
  GAguardoNfe.Progress := Round(Percentual);
end;

procedure TFAguardoNfe.MostraPercentual;
begin
  GAguardoNfe.Visible := True;
end;

procedure TFAguardoNfe.PAguardoNfeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FClicado := True;
  FPosClickX := X;
  FPosClickY := Y;
end;

procedure TFAguardoNfe.PAguardoNfeMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FClicado := False;
end;

procedure TFAguardoNfe.PAguardoNfeMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if FClicado then
  begin
    Self.Left := Self.Left + X - FPosClickX;
    Self.Top := Self.Top + Y - FPosClickY;
  end;
end;

procedure TFAguardoNfe.Ocultar1Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TFAguardoNfe.Acabou;
begin
  Mensagem := 'Concluído (mova o mouse)';
end;

procedure TFAguardoNfe.Limpa;
begin
  GAguardoNfe.Progress := 0;
  GAguardoNfe.Visible := False;
  Mensagem := 'Aguardando resposta do servidor';
  FClicado := False;
end;

end.

