unit UImprimirNota;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFImprimirNota = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FImprimirNota: TFImprimirNota;

implementation

{$R *.dfm}

procedure TFImprimirNota.FormActivate(Sender: TObject);
begin
  BitBtn2.SetFocus;   
end;

end.
