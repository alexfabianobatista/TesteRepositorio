unit UMenuReporter;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTMENUPRINCIPAL, Menus, Buttons, ExtCtrls;

type
  TFMenuReporter = class(TFTMenuPrincipal)
    Manuteo1: TMenuItem;
    Gerador1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuReporter: TFMenuReporter;

implementation

uses URelatorio;

{$R *.DFM}

procedure TFMenuReporter.FormCreate(Sender: TObject);
begin
  inherited;
  pModulo := 'REPORTER';
end;

procedure TFMenuReporter.FormActivate(Sender: TObject);
begin
  inherited;
  If FRelatorio = Nil then
    FRelatorio := TFRelatorio.Create(Self);
  FRelatorio.ShowModal;
  Close;
end;

end.
