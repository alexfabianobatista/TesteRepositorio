unit UConsultaEstoquePorNota;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, StdCtrls, Buttons;

type
  TFConsultaEstoquePorNota = class(TForm)
    DBGrid1: TDBGrid;
    DSConsultaEstoqueNota: TDataSource;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConsultaEstoquePorNota: TFConsultaEstoquePorNota;

implementation

uses UNotaEntrada_cl;

{$R *.dfm}

procedure TFConsultaEstoquePorNota.BitBtn1Click(Sender: TObject);
begin
  close;
end;

end.
