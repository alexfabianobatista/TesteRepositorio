unit URemuneracaoLeitao_Cons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFRemuneracaoLeitao_Cons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRemuneracaoLeitao_Cons: TFRemuneracaoLeitao_Cons;

implementation

uses URemuneracaoLeitao_cl;

{$R *.dfm}

procedure TFRemuneracaoLeitao_Cons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DMRemuneracaoLeitao.QRemuneracaoLeitao_Cons.Close;
  DMRemuneracaoLeitao.QRemuneracaoLeitao_Cons.Open;
end;

end.
