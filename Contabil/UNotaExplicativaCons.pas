unit UNotaExplicativaCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFNotaExplicativaCons = class(TFTConsulta)
    BtConsFilial: TBitBtn;
    procedure BtConsFilialClick(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNotaExplicativaCons: TFNotaExplicativaCons;

implementation
uses uPlanilha_cl, UFilialCons, UFilial_cl;
{$R *.dfm}

procedure TFNotaExplicativaCons.BtConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    METexto.Text := DMFilial.QFilialConsCod_Filial.Text;
end;

procedure TFNotaExplicativaCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMPlanilha do
  Begin
    QNotaExplicativaCons.Close;
    If Trim(METexto.Text) = '' then
      QNotaExplicativaCons.SetVariable('COD_FILIAL',Null)
    Else
      QNotaExplicativaCons.SetVariable('COD_FILIAL',Trim(METexto.Text));
    QNotaExplicativaCons.Open;
  End;
end;

end.
