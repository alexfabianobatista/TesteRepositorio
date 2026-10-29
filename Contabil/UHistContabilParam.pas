unit UHistContabilParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, Mask, ComCtrls, ExtCtrls, Buttons;

type
  TFHistContabilParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    Label27: TLabel;
    Me0Pagina: TMaskEdit;
    Rg0Ordem: TRadioGroup;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FHistContabilParam: TFHistContabilParam;

implementation

{$R *.DFM}

end.
