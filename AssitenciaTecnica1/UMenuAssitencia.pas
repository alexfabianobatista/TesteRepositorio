unit UMenuAssitencia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTMENUPRINCIPAL, Menus, ExtCtrls, Buttons;

type
  TFMenuAssistencia = class(TFTMenuPrincipal)
    OrdemdeServio1: TMenuItem;
    OrdemdeServio2: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure OrdemdeServio2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuAssistencia: TFMenuAssistencia;

implementation

uses UOrdemServicoCad, UTela_cl;

{$R *.DFM}

procedure TFMenuAssistencia.FormCreate(Sender: TObject);
begin
  inherited;
  pModulo := 'ASSISTENCIA TECNICA';
end;

procedure TFMenuAssistencia.OrdemdeServio2Click(Sender: TObject);
begin
  inherited;
  If FOrdemServicoCad = Nil then
    FOrdemServicoCad := TFOrdemServicoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FOrdemServicoCad.Caption);
  FOrdemServicoCad.ShowModal;
end;

end.
