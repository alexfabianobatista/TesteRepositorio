unit UPragaParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, UFmDatas,
  UFmFilial;

type
  TFPragaParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    Fm0Data: TFmDatas;
    Fm0Filial: TFmFilial;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPragaParam: TFPragaParam;

implementation

{$R *.dfm}

end.
