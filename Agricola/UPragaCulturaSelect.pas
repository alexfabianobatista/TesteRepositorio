unit UPragaCulturaSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Buttons, DB;

type
  TFPragaCulturaSelect = class(TForm)
    Label1: TLabel;
    BtCancela: TBitBtn;
    BtOk: TBitBtn;
    DBGrid1: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPragaCulturaSelect: TFPragaCulturaSelect;

implementation

uses UPraga_cl;

{$R *.dfm}

end.
