unit URomaneioCancela;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask;

type
  TFRomaneioCancela = class(TForm)
    Label1: TLabel;
    MeMotivo: TMaskEdit;
    BtOk: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRomaneioCancela: TFRomaneioCancela;

implementation

{$R *.DFM}

procedure TFRomaneioCancela.FormActivate(Sender: TObject);
begin
  MeMotivo.Clear;
end;

end.
