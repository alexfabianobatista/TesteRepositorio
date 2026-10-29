unit USMTPCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons, UBiblioteca;

type
  TFSMTPCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSMTPCons: TFSMTPCons;

implementation

uses UMalaDireta_cl;

{$R *.dfm}

procedure TFSMTPCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMMalaDireta do
  begin
    QSMTPCons.Close;
    Bib.setVariableOuNull(QSMTPCons, 'DESC_EMAIL', Trim(METexto.Text + '%'));
    QSMTPCons.Open;
  end;
end;

end.
