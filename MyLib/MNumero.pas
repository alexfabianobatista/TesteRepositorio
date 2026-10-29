unit MNumero;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TMNumero = class(TCustomMemo)
  private
    { Private declarations }
  protected
    { Protected declarations }
    procedure KeyPress(var Key: Char); override;    
  public
    { Public declarations }
   constructor Create(Owner: TComponent); override;
  published
    { Published declarations }
    property Alignment;
    property ParentColor;
    property ReadOnly;
    
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Additional', [TMNumero]);
end;

{ TMNumero }

{ TMNumero }

constructor TMNumero.Create(Owner: TComponent);
begin
  Inherited Create(Owner);
  Height := 22;
  Alignment := taRightJustify;
end;

procedure TMNumero.KeyPress(var Key: Char);
begin
  inherited KeyPress(Key);
  if Key = Char(VK_RETURN) then Key := #0;
end;

end.
