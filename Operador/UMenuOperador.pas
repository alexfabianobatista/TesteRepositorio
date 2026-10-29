unit UMenuOperador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTMENUPRINCIPAL, Menus, Buttons, ExtCtrls;

type
  TFMenuOperador = class(TFTMenuPrincipal)
    Manuteno1: TMenuItem;
    ConsultaSaldoContratos1: TMenuItem;
    MovimentoPerodo1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure ConsultaSaldoContratos1Click(Sender: TObject);
    procedure MovimentoPerodo1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuOperador: TFMenuOperador;

implementation

uses UOperador_Cons1, UTela_cl, UMovimentoPeriodo;

{$R *.DFM}

procedure TFMenuOperador.FormCreate(Sender: TObject);
begin
  inherited;
  Self.pModulo:='OPERADOR';
end;

procedure TFMenuOperador.ConsultaSaldoContratos1Click(Sender: TObject);
begin
  inherited;
  If FOperador_Cons1=Nil then
    FOperador_Cons1:=TFOperador_Cons1.Create(Application);
  DMTela.VerificaTela(pModulo,FOperador_Cons1.Caption,FOperador_Cons1.Name);
  FOperador_Cons1.ShowModal;

end;

procedure TFMenuOperador.MovimentoPerodo1Click(Sender: TObject);
begin
  inherited;
  If FMovimentoPeriodo=Nil then
    FMovimentoPeriodo:=TFMovimentoPeriodo.Create(Application);
  DMTela.VerificaTela(pModulo,FMovimentoPeriodo.Caption,FMovimentoPeriodo.Name);
  FMovimentoPeriodo.ShowModal;

end;

end.
