unit ULinhaProducao_Cons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, DB, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFLinhaProducao_Cons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLinhaProducao_Cons: TFLinhaProducao_Cons;

implementation

uses ULinhaProducao_cl;

{$R *.dfm}

procedure TFLinhaProducao_Cons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMLinhaProducao do
  Begin
    QLinhaProducaoCons.Close;
    QLinhaProducaoCons.SetVariable('LINHA_PRODUCAO',Trim(METexto.Text));
    QLinhaProducaoCons.Open;
  End;
end;

procedure TFLinhaProducao_Cons.FormActivate(Sender: TObject);
begin
  inherited;
  METexto.Text :='';
end;

end.
