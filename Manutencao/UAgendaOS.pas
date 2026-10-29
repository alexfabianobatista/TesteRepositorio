unit UAgendaOS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ComCtrls, ExtCtrls;

type
  TFAgendaOS = class(TForm)
    GroupBox1: TGroupBox;
    MEDT_Prox: TMaskEdit;
    BtOk: TBitBtn;
    lb_data: TLabel;
    StatusBar1: TStatusBar;
    lb_dias: TLabel;
    GroupBox2: TGroupBox;
    MEDT_Dias: TMaskEdit;
    RGAgenda: TRadioGroup;
    BtCancela: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RGAgendaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAgendaOS: TFAgendaOS;

implementation

{$R *.DFM}

procedure TFAgendaOS.FormActivate(Sender: TObject);
begin
  StatusBar1.Panels[1].text:=DateToStr(Date);
  MEDT_Dias.enabled:=false;
  LB_Dias.enabled:=false;
end;

procedure TFAgendaOS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  action :=CaFree;
 // FAgendaOs :=nil;
end;

procedure TFAgendaOS.RGAgendaClick(Sender: TObject);
begin
  if RGAgenda.ItemIndex = 0  then
  Begin
   MEDT_Prox.enabled:=true;
   MEDT_Dias.enabled:=false;
   LB_Data.enabled:=True;
   LB_Dias.enabled:=false;
  end
  else
  Begin
   MEDT_Dias.enabled:=true;
   MEDT_Prox.enabled:=false;
   LB_Data.enabled:=False;
   LB_Dias.enabled:=True;
  End;
end;

end.
