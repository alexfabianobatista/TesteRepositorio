unit UCarregando;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls;

type
  TFInicio = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    pnFullLoad: TPanel;
    pnLoad: TPanel;
    tmLoading: TTimer;
    procedure tmLoadingTimer(Sender: TObject);
    procedure SetMainForm(NovoMainForm: TForm);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FInicio: TFInicio;

implementation

uses UMenu, UCOnfiguracao;

{$R *.dfm}

procedure TFInicio.SetMainForm(NovoMainForm: TForm);
var
  TmpMain: ^TCustomForm;
begin
  TmpMain := @Application.Mainform;
  TmpMain^ := NovoMainForm;
end;

procedure TFInicio.tmLoadingTimer(Sender: TObject);
var
  maximoLoad : Double;
begin
  maximoLoad := pnFullLoad.Width;

  if pnLoad.Width+5 < maximoLoad then
    pnLoad.Width := Round(10 + pnLoad.Width)
  else
  begin
    tmLoading.Enabled := False;
    FMenu.Show;
    SetMainForm(FMenu);
    FInicio.Release;
  end;
end;

end.
