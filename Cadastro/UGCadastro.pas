unit UGCadastro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Grids, {mxgrid, }ExtCtrls, TeeProcs, TeEngine, Chart, {mxgraph,}
  StdCtrls, Buttons, {mxpivsrc, mxDB, }Db, DBTables, {mxtables, mxstore,}
  Series;

type
  TFGCadastro = class(TForm)
    BtAtualizar: TBitBtn;
    procedure BtAtualizarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGCadastro: TFGCadastro;

implementation

uses UCadastro_cl;

{$R *.DFM}

procedure TFGCadastro.BtAtualizarClick(Sender: TObject);
begin
{  With DMCadastro do
  Begin
    DQCadRegiao.Close;
    DQCadRegiao.Open;
  End; }
end;



procedure TFGCadastro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  FGCadastro := CaFree;
//  FGCadastro := Nil;
end;

end.
