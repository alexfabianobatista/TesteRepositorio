unit URelatorio_Rel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Buttons;

type
  TFRelatorio_Rel = class(TForm)
    Label1: TLabel;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRelatorio_Rel: TFRelatorio_Rel;

implementation

uses URelatorio_cl;

{$R *.DFM}

end.
