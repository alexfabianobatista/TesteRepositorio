unit UPatrimonioCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFPatrimonioCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPatrimonioCons: TFPatrimonioCons;

implementation

uses UPatrimonio_cl;

{$R *.DFM}

procedure TFPatrimonioCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DMPatrimonio.QPatrimonioCons.Close;

  If Trim(METexto.Text) <> '' Then
    DMPatrimonio.QPatrimonioCons.SetVariable( 'DESC_PATRIMONIO', Trim(METexto.Text) )
  Else
    DMPatrimonio.QPatrimonioCons.SetVariable( 'DESC_PATRIMONIO', null);
  DMPatrimonio.QPatrimonioCons.Open;
end;

procedure TFPatrimonioCons.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := CaFree;
  FPatrimonioCons := nil;
end;

procedure TFPatrimonioCons.DBGrid1DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;
//  if Field.FieldName = 'COD_PATRIMONIO_CAB' Then
//    if Field.Value = 12 THEN
//      DBGRID1.Canvas.Draw(0,0,NIL)  //COLUMN.Color := CLRED
//    ELSE
//      COLUMN.Color := CLWHITE;
end;

end.
