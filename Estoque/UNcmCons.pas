unit UNcmCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFNcmCons = class(TFTConsulta)
    Label2: TLabel;
    MECodigo: TMaskEdit;
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNcmCons: TFNcmCons;

implementation

uses UNcm_cl;

{$R *.dfm}

procedure TFNcmCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMNcm do
  begin
    QNcmCons.Close;
    QNcmCons.ClearVariables;
    if METexto.Text <> '' then
      QNcmCons.SetVariable('DESCRICAO', '%'+METexto.Text+'%');
    if Trim(MECodigo.Text) <> '' then
      QNcmCons.SetVariable('COD_NCM', StrToInt(Trim(MECodigo.Text)))
    else
      QNcmCons.SetVariable('COD_NCM', null);
    QNcmCons.Open;
  end;
end;

end.
