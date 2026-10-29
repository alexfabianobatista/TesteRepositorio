unit UProgresso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Gauges;

type
  TFProgresso = class(TForm)
    GProgresso: TGauge;
  private
    { Private declarations }
    procedure setMax(max: Integer);
    function getMax(): Integer;
    function getMin: Integer;
    function getProgress: Integer;
    procedure setMin(min: Integer);
    procedure setProgress(progress: Integer);
  public
    { Public declarations }
    Property Max: Integer Read getMax Write setMax;
  end;

var
  FProgresso: TFProgresso;

implementation

{$R *.dfm}

{ TFProgresso }

function TFProgresso.getMax: Integer;
begin
  Result := GProgresso.MaxValue;
end;

procedure TFProgresso.setMax(max: Integer);
begin
  GProgresso.MaxValue := max;
end;

function TFProgresso.getMin: Integer;
begin
  Result := GProgresso.MinValue;
end;

procedure TFProgresso.setMin(min: Integer);
begin
  GProgresso.MinValue := min;
end;

function TFProgresso.getProgress: Integer;
begin
  Result := GProgresso.Progress;
end;

procedure TFProgresso.setProgress(progress: Integer);
begin
  GProgresso.Progress := progress;
end;

end.
