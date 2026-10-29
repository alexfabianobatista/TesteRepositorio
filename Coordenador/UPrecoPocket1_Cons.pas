unit UPrecoPocket1_Cons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, DB, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFPrecoPocket1_Cons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrecoPocket1_Cons: TFPrecoPocket1_Cons;

implementation

uses UPrecoPocket1_cl;

{$R *.dfm}

procedure TFPrecoPocket1_Cons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMPrecoPocket1 Do
  Begin
    QPrecoPocket_Cons.Close;
    If Trim(MeTexto.Text) <> '' Then
      QPrecoPocket_Cons.SetVariable('DESC_TABELA',Trim(MeTexto.Text))
    Else
      QPrecoPocket_Cons.SetVariable('DESC_TABELA',Null);
    QPrecoPocket_Cons.Open;
  End;
end;

end.
