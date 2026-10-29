unit UContasReceberJuro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons;

type
  TFContaReceberJuro = class(TForm)
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    MEJuro: TMaskEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContaReceberJuro: TFContaReceberJuro;

implementation

{$R *.DFM}

end.
