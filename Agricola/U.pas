unit U;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls;

type
  TFConhecimentoFreteCad = class(TFTCadSimples)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConhecimentoFreteCad: TFConhecimentoFreteCad;

implementation

uses UConhecimentoFrete_cl;


{$R *.DFM}

end.
