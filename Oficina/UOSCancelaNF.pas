unit UOSCancelaNF;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls;

type
  TFOFI0012 = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    Bevel1: TBevel;
    Label1: TLabel;
    EdNUM_OS: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    SBOSCons: TSpeedButton;
    procedure SBOSConsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOFI0012: TFOFI0012;

implementation

uses UOSCons, UOs_cl;

{$R *.DFM}

procedure TFOFI0012.SBOSConsClick(Sender: TObject);
begin
  if FOsCons = nil then
    FOsCons := TFOsCons.Create(Application);
  if FOsCons.ShowModal = mrOk then
    EdNUM_OS.Text := DMOs.QOSConsNUM_OS.Text;
end;

end.
