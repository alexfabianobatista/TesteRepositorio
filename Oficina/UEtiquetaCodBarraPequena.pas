unit UEtiquetaCodBarraPequena;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UNITETIQUETA, QuickRpt, Qrctrls, Barcode, ExtCtrls;

type
  TEtiquetaCodBarraPequena = class(TTEtiquetaBarra)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EtiquetaCodBarraPequena: TEtiquetaCodBarraPequena;

implementation

{$R *.DFM}

end.
