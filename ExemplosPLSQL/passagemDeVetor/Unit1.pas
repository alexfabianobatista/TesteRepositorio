unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Oracle, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Q: TOracleQuery;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
var v : variant; i : integer;
begin

  i := 20;

  v := VarArrayCreate([1, i], varVariant);
  v[1] := 3.0;
  v[2] := 4.0;
  v[3] := 1.5;
  v[4] := 5;

  q.Close;
  q.SetVariable('VET', v);
  q.Execute;


  showmessage('a soma é: ' + STRING(q.GetVariable('SOMA')));
end;

end.
