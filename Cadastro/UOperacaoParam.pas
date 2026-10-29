unit UOperacaoParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, ComCtrls, StdCtrls, ExtCtrls, Buttons, Mask;

type
  TFOperacaoParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    RGOrdem: TRadioGroup;
    RgTipoOperacao: TRadioGroup;
    RGLiberada: TRadioGroup;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOperacaoParam: TFOperacaoParam;

implementation

uses UFilialCons, UFilial_cl;

{$R *.DFM}

end.
