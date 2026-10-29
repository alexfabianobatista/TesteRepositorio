unit URecebimentoParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, UFmDatas;

type
  TFRecebimentoParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    FmDatas1: TFmDatas;
    Cb1Ordem: TComboBox;
    Label307: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRecebimentoParam: TFRecebimentoParam;

implementation

{$R *.dfm}

end.
