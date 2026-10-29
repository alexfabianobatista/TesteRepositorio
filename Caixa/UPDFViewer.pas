unit UPDFViewer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, PdfLib_TLB;

type
  TFPDFViewer = class(TForm)
    Pdf1: TPdf;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPDFViewer: TFPDFViewer;

implementation

{$R *.dfm}

end.
