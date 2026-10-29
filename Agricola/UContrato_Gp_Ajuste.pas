unit UContrato_Gp_Ajuste;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFContrato_Gp_Ajuste = class(TForm)
    Label1: TLabel;
    MeQuantidade: TMaskEdit;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    MeValor: TMaskEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContrato_Gp_Ajuste: TFContrato_Gp_Ajuste;

implementation

{$R *.dfm}

end.
