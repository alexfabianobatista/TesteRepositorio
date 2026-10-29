unit UNcmSemSimilarNacCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFNcmSemSimilarNacCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNcmSemSimilarNacCons: TFNcmSemSimilarNacCons;

implementation

uses UNcm_cl;

{$R *.dfm}

procedure TFNcmSemSimilarNacCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMNcm do
  begin
    QNcmSemSimilarNacCons.Close;
    QNcmSemSimilarNacCons.SetVariable('NCM',Trim(METexto.Text));
    QNcmSemSimilarNacCons.Open;
  end;
end;

end.
