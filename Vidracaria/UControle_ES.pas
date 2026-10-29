unit UControle_ES;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, Buttons, StdCtrls, Mask;

type
  TFControle_ES = class(TForm)
    Label1: TLabel;
    MEEmbarque: TMaskEdit;
    SpeedButton1: TSpeedButton;
    DBGrid8: TDBGrid;
    procedure SpeedButton1Click(Sender: TObject);
    procedure MEEmbarqueExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FControle_ES: TFControle_ES;

implementation

uses UEmbarqueCons, UEmbarque_cl, UVidracaria_cl;

{$R *.dfm}

procedure TFControle_ES.SpeedButton1Click(Sender: TObject);
begin
  if FEmbarqueCons = nil then
    FEmbarqueCons := TFEmbarqueCons.Create(Application);
  if FEmbarqueCons.ShowModal = mrOk then
  Begin
    MeEmbarque.Text := IntToStr(DMEmbarque.QEmbarqueConsCod_Embarque.Value);
    with DMEmbarque do
    begin
      DMVidracaria.QRControle_ES.Close;
      DMVidracaria.QRControle_ES.SetVariable('COD_EMBARQUE', QEmbarqueConsCod_Embarque.Value);
      DMVidracaria.QRControle_ES.Open;
    end;
  end;
end;

procedure TFControle_ES.MEEmbarqueExit(Sender: TObject);
begin
  if Trim(MeEmbarque.Text) <> '' then
  Begin
    with DMEmbarque do
    begin
      DMVidracaria.QRControle_ES.Close;
      DMVidracaria.QRControle_ES.SetVariable('COD_EMBARQUE', QEmbarqueConsCod_Embarque.Value);
      DMVidracaria.QRControle_ES.Open;
    end;
  end;   
end;

end.
