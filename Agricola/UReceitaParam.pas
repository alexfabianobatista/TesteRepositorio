unit UReceitaParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, UFmDatas,
  UFmAgronomo, UFmFilial;

type
  TFReceitaParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    FmAgronomo1: TFmAgronomo;
    FmDatas1: TFmDatas;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FReceitaParam: TFReceitaParam;

implementation

{$R *.dfm}

end.
