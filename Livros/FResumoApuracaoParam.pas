unit FResumoApuracaoParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, Mask, ComCtrls, ExtCtrls, Buttons;

type
  TFApuracaoResumoParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    Label5: TLabel;
    ME0PaginaI: TMaskEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FApuracaoResumoParam: TFApuracaoResumoParam;

implementation

{$R *.DFM}

end.
