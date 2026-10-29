unit USmartThread;

interface

uses
  Classes;

type
  CThread = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  end;

implementation
  uses UMenu;

{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure CThread.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ CThread }

procedure CThread.Execute;
begin
  FMenu.start();
end;

end.
