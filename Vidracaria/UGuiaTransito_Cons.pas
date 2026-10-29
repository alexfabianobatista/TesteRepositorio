unit UGuiaTransito_Cons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, DB, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFGuiaTransito_Cons = class(TFTConsulta)
    MeDtFim: TMaskEdit;
    Label2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGuiaTransito_Cons: TFGuiaTransito_Cons;

implementation

uses UGuiaTransito_cl;

{$R *.dfm}

end.
