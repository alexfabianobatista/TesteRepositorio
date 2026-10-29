unit UBanco_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Oracle, OraS;

type
  TDMBanco = class(TDataModule)
    DBCemapa2: TOraS;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMBanco: TDMBanco;

implementation

{$R *.DFM}

end.
