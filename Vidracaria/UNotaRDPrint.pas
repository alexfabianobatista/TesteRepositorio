unit UNotaRDPrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RDprint;

type
  TFNotaRDPrint = class(TForm)
    RDprint: TRDprint;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNotaRDPrint: TFNotaRDPrint;

implementation

{$R *.dfm}

end.
