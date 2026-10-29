unit UEtiquetaMontagem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids;

type
  TFEtiquetaMontagem = class(TForm)
    StringGrid1: TStringGrid;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEtiquetaMontagem: TFEtiquetaMontagem;

implementation

{$R *.DFM}

procedure TFEtiquetaMontagem.BitBtn1Click(Sender: TObject);
var x : integer;
begin
  with StringGrid1 do
  begin
    for x := 1 to 80 do
    begin
      Rows[x].Add(IntToStr(x));
      Cols[1].Add('Teste1');
      Cols[2].Add('Teste2');
      Cols[3].Add('Teste3');
    end;
  end;
end;

end.
