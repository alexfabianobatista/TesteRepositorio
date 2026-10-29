unit UNotaSaidaAutomatica;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UThreadNotaAutomatica, ComCtrls, StdCtrls, Grids, DBGrids,
  ExtCtrls, UThreadNotaSincronismo, Buttons;

type
  TFNotaSaidaAutomatica = class(TForm)
    DBGrid1: TDBGrid;
    PnRodando: TPanel;
    PnParado: TPanel;
    ImgRodando: TImage;
    Label1: TLabel;
    ImgParado: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Timer1: TTimer;
    lbMensagem: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    procedure ParaSincronismo;
  end;

var
  FNotaSaidaAutomatica: TFNotaSaidaAutomatica;
  t: ThreadNotaAutomatica;
  threadSinc: ThreadNotaSincronismo;

implementation

uses UNotaSaida_cl, UNotaSaidaCad, UNotaSaida_Confirma, UBibVenda, Math,
  UNotaSaidaAutomatica_cl, UNotaAutomaticaFlag;

{$R *.dfm}

procedure TFNotaSaidaAutomatica.FormActivate(Sender: TObject);
var cont: integer;
begin
  if NotaAutomaticaFlag = Nil then
    NotaAutomaticaFlag := TNotaAutomaticaFlag.Create;
  NotaAutomaticaFlag.pNotaAutomatica := true;

  // Controla se as threads serão executadas ou não
  PnParado.Visible := false;

  lbMensagem.Caption := '';

  //DBGrid1.DataSource := DMNotaSaidaAutomatica.DSNotaSaidaEmitida;
  DMNotaSaidaAutomatica.QNotaSaidaEmitida.Close;
  DMNotaSaidaAutomatica.QNotaSaidaEmitida.Open;
  Application.ProcessMessages;
  
end;

procedure TFNotaSaidaAutomatica.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  if not threadSinc.Suspended then
//    threadSinc.Suspend;
//  if not t.Suspended then
//    t.Suspend;
  Timer1.Enabled := false;
end;

procedure TFNotaSaidaAutomatica.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if copy(DMNotaSaidaAutomatica.QNotaSaidaEmitidaSITUACAO.Value, 0, 4) <> '100 ' then
  begin
    DBGrid1.Canvas.Brush.Color := clSilver;
    //DBGrid1.Canvas.Font.Color := clWhite;
    DBGrid1.Canvas.FillRect(Rect);
    DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFNotaSaidaAutomatica.ParaSincronismo;
begin
//    threadSinc.Suspend;
end;

procedure TFNotaSaidaAutomatica.Timer1Timer(Sender: TObject);
begin

  // Se estiver marcado como parado não deve executar as threads
  if PnParado.Visible then
    exit;

  DMNotaSaidaAutomatica.DSNotaSaidaEmitida.Enabled := true;
  DBGrid1.Refresh;
  Application.ProcessMessages;

  // Transforma o pedido em nota
  if threadSinc = Nil then
    threadSinc := ThreadNotaSincronismo.Create(true);
  threadSinc.pForm := FNotaSaidaAutomatica;
  threadSinc.Resume;
  threadSinc.WaitFor;
  threadSinc.Terminate;
  threadSinc.Free;
  threadSinc := Nil;

  // Gera a confirmação da nota
  if t = Nil then
    t := ThreadNotaAutomatica.Create(true);
  t.pForm := FNotaSaidaAutomatica;
  t.Resume;
  t.WaitFor;
  t.Terminate;
  t.Free;
  t := Nil;

end;

end.
