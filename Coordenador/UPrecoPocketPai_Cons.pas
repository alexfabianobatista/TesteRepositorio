unit UPrecoPocketPai_Cons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, DB, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFPrecoPocketPai_Cons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrecoPocketPai_Cons: TFPrecoPocketPai_Cons;

implementation

uses UPrecoPocket1_cl;

{$R *.dfm}

procedure TFPrecoPocketPai_Cons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMPrecoPocket1 Do
  Begin
    QTabelaPocket_Cons.Close;
    QTabelaPocket_Cons.SetVariable('PK',DMPrecoPocket1.QPrecoPocket_CadCOD_TABELA_POCKET.AsString);
    If Trim(MeTexto.Text) <> '' Then
      QTabelaPocket_Cons.SetVariable('DESC_TABELA',Trim(MeTexto.Text))
    Else
      QTabelaPocket_Cons.SetVariable('DESC_TABELA',Null);
    QTabelaPocket_Cons.Open;
  End;
end;

end.
