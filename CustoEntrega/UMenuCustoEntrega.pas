unit UMenuCustoEntrega;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTMENUPRINCIPAL, Menus, Buttons, ExtCtrls;

type
  TFMenuCustoEntrega = class(TFTMenuPrincipal)
    Manuteno1: TMenuItem;
    CustoEntrega1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure CustoEntrega1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuCustoEntrega: TFMenuCustoEntrega;

implementation

uses UCustoEntrega_Cad, UTela_cl;

{$R *.DFM}

procedure TFMenuCustoEntrega.FormCreate(Sender: TObject);
begin
  inherited;
  pModulo := 'CUSTO ENTREGA';
end;

procedure TFMenuCustoEntrega.CustoEntrega1Click(Sender: TObject);
begin
  inherited;
  If FCustoEntregaCad = Nil then
    FCustoEntregaCad := TFCustoEntregaCad.Create(Application);
  DMTela.VerificaTela(pModulo,FCustoEntregaCad.Caption,FCustoEntregaCad.Name);
  FCustoEntregaCad.ShowModal; 
end;

end.
