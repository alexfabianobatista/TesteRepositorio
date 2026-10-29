unit UFinalidadeParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, ComCtrls, StdCtrls, ExtCtrls, Buttons;

type
  TFFinalidadeParam = class(TFTParametro)
    TSFinalidade: TTabSheet;
    Rg0Ordem: TRadioGroup;
    Rg0Limite: TRadioGroup;
    Rg0LiberadoUso: TRadioGroup;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFinalidadeParam: TFFinalidadeParam;

implementation

{$R *.DFM}

end.
