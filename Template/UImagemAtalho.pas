unit UImagemAtalho;

interface

uses ExtCtrls, Menus, Classes, Controls, Buttons, Windows;

type
  TImagemAtalho = class(TImage)
  private
    procedure clica(Sender: TObject);
    procedure mouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    function tbKeyIsDown(const Key: integer): boolean;
  protected
  public
    MenuItem: TMenuItem;
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{ TImagemAtalho }

procedure TImagemAtalho.clica(Sender: TObject);
begin
//  if (not (Dragging)) then
  if (not (tbKeyIsDown(VK_CONTROL))) then
    MenuItem.Click;
end;

constructor TImagemAtalho.Create(AOwner: TComponent);
begin
  inherited;
  OnClick := clica;
  OnMouseDown := mouseDown;
  OnMouseUp := mouseUp;
  Visible := True;
  Width := 32;
  Height := 32;

//  DragMode := dmAutomatic;
end;

procedure TImagemAtalho.mouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if ssCtrl in Shift then
    BeginDrag(True);
end;

procedure TImagemAtalho.mouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
//  if (not (Dragging)) then
//    MenuItem.Click;
end;

function TImagemAtalho.tbKeyIsDown(const Key: integer): boolean;
begin
  Result := GetKeyState(Key) and 128 > 0;
end;

end.
