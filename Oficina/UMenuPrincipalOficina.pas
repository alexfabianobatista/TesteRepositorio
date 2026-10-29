unit UMenuPrincipalOficina;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTMENUPRINCIPAL, Menus, Buttons, ExtCtrls;

type
  TFMenuOficina = class(TFTMenuPrincipal)
    Manuteno1: TMenuItem;
    Mecanicos1: TMenuItem;
    Veiculos1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    Modelosveiculos1: TMenuItem;
    Ordemdeservio1: TMenuItem;
    ManutenoOS1: TMenuItem;
    TiposdeOS1: TMenuItem;
    N3: TMenuItem;
    Requisio1: TMenuItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuOficina: TFMenuOficina;

implementation

{$R *.DFM}

end.
