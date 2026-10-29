unit UGeraSPEDParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, UFmFilial,
  UFmDatas;

type
  TFGeraSPEDParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    FmFilial1: TFmFilial;
    FmDatas1: TFmDatas;
    TabSheet2: TTabSheet;
    FmFilial2: TFmFilial;
    FmDatas2: TFmDatas;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGeraSPEDParam: TFGeraSPEDParam;

implementation

{$R *.dfm}

end.
