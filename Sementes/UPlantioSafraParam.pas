unit UPlantioSafraParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls;

type
  TFPlantioSafraParam = class(TFTParametro)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPlantioSafraParam: TFPlantioSafraParam;

implementation

{$R *.DFM}

procedure TFPlantioSafraParam.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := CaFree;
  FPlantioSafraParam := Nil;
end;

end.
