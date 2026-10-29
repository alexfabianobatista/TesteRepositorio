unit UOSVoltaFechamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TFOSVoltaFechamento = class(TForm)
    EdNUM_OS: TEdit;
    Label1: TLabel;
    SBOSCons: TSpeedButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure SBOSConsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOSVoltaFechamento: TFOSVoltaFechamento;

implementation

uses UOSCons, UOs_cl;

{$R *.DFM}

procedure TFOSVoltaFechamento.SBOSConsClick(Sender: TObject);
begin
  if FOsCons = nil then
    FOsCons := TFOsCons.Create(Application);
  if FOsCons.ShowModal = mrOk then
    EdNUM_OS.Text:= IntToStr(DMOs.QOSConsNUM_OS.Value);
end;

end.
