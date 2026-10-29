unit UBibliotecaUI;

interface

uses
  DBCtrls, Graphics;

type
  TBibliotecaUI = class

  private

  protected

  public
    procedure Desabilita(DBEdit: TDBEdit);
    procedure Habilita(DBEdit: TDBEdit);
  end;

var
  BibUI: TBibliotecaUI;

implementation

{ TBibliotecaUI }

procedure TBibliotecaUI.Desabilita(DBEdit: TDBEdit);
begin
  DBEdit.ReadOnly := True;
  DBEdit.Color := clBtnFace;
end;

procedure TBibliotecaUI.Habilita(DBEdit: TDBEdit);
begin
  DBEdit.ReadOnly := False;
  DBEdit.Color := clWindow;
end;

initialization
  BibUI := TBibliotecaUI.Create;

end.
 