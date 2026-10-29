unit Md4FontCombo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TMd4FontCombo = class(TComboBox)
  private
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create (AOwner: TComponent); override;
    procedure CreateWnd; override;
  published
    { Published declarations }
    property Style default csDropDownList;
    property Items stored False;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Samples', [TMd4FontCombo]);
end;

{ TMd4FontCombo }

constructor TMd4FontCombo.Create(AOwner: TComponent);
begin
  inherited Create (AOwner);
  Style:= csDropDownList;
end;

procedure TMd4FontCombo.CreateWnd;
begin
  inherited CreateWnd;
  Items:= Screen.Fonts;
end;

end.
