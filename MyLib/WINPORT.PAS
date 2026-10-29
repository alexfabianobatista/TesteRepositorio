unit WinPort;

{********************************************************************

  Component TWinPort ver 1.0 - Win95 Direct Port Access

  Copyright © 1998 by Stefanus M. <ogre@notme.com>

  Send me an E-mail if you have any comments, questions or bug report.

  Legal issues:
  This component is a freeware. I will not responsible for any damage
  that occurs, when you use this component. Although it has been
  tested and works fine. USE IT AT YOUR OWN RISK !
  Feels free to use, modify, and redistribute it as long as this notice
  didn't removed or altered.

  Note:
  The easiest way to test this component is by setting the PortAddress
  property to $03F8 (considering your mouse is connected to COM1) and
  AlwaysCheck to True. Then printout the Value passed from
  OnDataChanged to the form. Now run the application and move your
  mouse around.
  
  Have fun.

 ********************************************************************}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TOnDataChange = procedure(Sender: TObject; Const Value: Word) of object;
  TTimerPriority = (cpHighest, cpHigher, cpNormal, cpLower, cpLowest, cpIdle);

  TWPTimer = class(TThread)
  private
    FExit: Boolean;
    FInterval: Word;
    FTimer: LongInt;
    function GetTimer: LongInt;
  protected
    procedure Execute; override;
  public
    FUpdate: TNotifyEvent;
    constructor Create;
  end;

  TWinPort = class(TComponent)
  private
    FOnDataChange: TOnDataChange;
    FLastData, FCurrentData: Byte;
    FPortAddress: Word;
    FAlwaysCheck: Boolean;
    FPriority: TTimerPriority;
    FInterval: Word;
    procedure FUpdate(Sender: TObject);
    procedure SetPortAddr(Address: Word);
    function GetPortAddr: Word;
    procedure SetPortValue(Value: Byte);
    function GetPortValue: Byte;
    procedure SetAC(Value: Boolean);
    function GetAC: Boolean;
    procedure SetPriority(Value: TTimerPriority);
    function GetPriority: TTimerPriority;
    procedure SetInterval(Value: Word);
    function GetInterval: Word;
  protected
    procedure DataChanged;
    function PortIn(PortNo: Word): Byte;
    procedure PortOut(PortNo: Word; Data: Byte);
  public
    FTTimer: TWPTimer;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Value: Byte read GetPortValue write SetPortValue;
  published
    property PortAddress: Word read GetPortAddr write SetPortAddr;
    property AlwaysCheck: Boolean read GetAC write SetAC default False;
    property OnDataChange: TOnDataChange read FOnDataChange write FOnDataChange;
    property CheckPriority: TTimerPriority read GetPriority write SetPriority default cpNormal;
    property CheckInterval: Word read GetInterval write SetInterval default 0;
  end;


procedure Register;

implementation

// ------------------ TWPTimer ------------------- //

constructor TWPTimer.Create;
begin
  FreeOnTerminate:=True;
  Priority:=tpNormal;
  FExit:=False;
  inherited Create(True);
end;

function TWPTimer.GetTimer: LongInt;
var h,m,s,ms: Word;
    t: TDateTime;
begin
  t:=Time;
  DecodeTime(t,h,m,s,ms);
  Result:=h*360000+m*60000+s*1000+ms;
end;

procedure TWPTimer.Execute;
begin
  FTimer:=GetTimer;
  repeat
    if Abs(GetTimer-FTimer)>FInterval then
    begin
      if Assigned(FUpdate) then FUpdate(Self);
      FTimer:=GetTimer;
    end;
  until FExit;
end;


// ------------------- TWinPort ---------------------- //

constructor TWinPort.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FPortAddress:=0;
  FLastData:=PortIn(FPortAddress);
  FAlwaysCheck:=False;
  FTTimer:=TWPTimer.Create;
  FTTimer.FUpdate:=FUpdate;
  FPriority:=cpNormal;
end;

destructor TWinPort.Destroy;
begin
  FTTimer.FExit:=True;
  inherited Destroy;
end;

procedure TWinPort.SetInterval(Value: Word);
begin
  FInterval:=Value;
  FTTimer.FInterval:=Value;
end;

function TWinPort.GetInterval: Word;
begin
  Result:=FInterval;
end;

procedure TWinPort.SetPriority(Value: TTimerPriority);
begin
  FPriority:=Value;
  case FPriority of
    cpIdle     : FTTimer.Priority:=tpIdle;
    cpLowest   : FTTimer.Priority:=tpLowest;
    cpLower    : FTTimer.Priority:=tpLower;
    cpNormal   : FTTimer.Priority:=tpNormal;
    cpHigher   : FTTimer.Priority:=tpHigher;
    cpHighest  : FTTimer.Priority:=tpHighest;
  end;
end;

function TWinPort.GetPriority: TTimerPriority;
begin
  Result:=FPriority;
end;

procedure TWinPort.SetAC(Value: Boolean);
begin
  FAlwaysCheck:=Value;
  if Value then FTTimer.Resume else FTTimer.Suspend;
end;

function TWinPort.GetAC: Boolean;
begin
  Result:=FAlwaysCheck;
end;

procedure TWinPort.FUpdate(Sender: TObject);
begin
  FCurrentData:=PortIn(FPortAddress);
  if FCurrentData<>FLastData then DataChanged;
end;

procedure TWinPort.DataChanged;
begin
  FLastData:=FCurrentData;
  if Assigned(FOnDataChange) then
    FOnDataChange(Self, FCurrentData);
end;

function TWinPort.PortIn(PortNo: Word): Byte; Assembler;
asm
  mov dx,PortNo
  in  al,dx
  mov result,al
end;

procedure TWinPort.PortOut(PortNo: Word; Data: Byte); Assembler;
asm
  mov  dx,PortNo
  mov  al,Data
  out  dx,al
end;

procedure TWinPort.SetPortAddr(Address: Word);
begin
  FPortAddress:=Address;
  FLastData:=PortIn(FPortAddress);
end;

function TWinPort.GetPortAddr: Word;
begin
  Result:=FPortAddress;
end;

procedure TWinPort.SetPortValue(Value: Byte);
begin
  PortOut(FPortAddress, Value);
end;

function TWinPort.GetPortValue: Byte;
begin
  Result:=PortIn(FPortAddress);
end;


// ---------------- Register Component --------------- //

procedure Register;
begin
  RegisterComponents('Samples', [TWinPort]);
end;

end.
