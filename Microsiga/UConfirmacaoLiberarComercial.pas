unit UConfirmacaoLiberarComercial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons;

type
  TFConfirmacaoLiberarComercial = class(TForm)
    meComissao: TMaskEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConfirmacaoLiberarComercial: TFConfirmacaoLiberarComercial;

implementation

{$R *.DFM}

end.
