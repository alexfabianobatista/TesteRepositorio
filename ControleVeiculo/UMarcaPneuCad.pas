unit UMarcaPneuCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, ExtCtrls, Buttons, DBPanel;

type
  TFMarcaPneuCad = class(TFTCadSimples)
    Panel2: TPanel;
    DBPCodMarcaPneu: TDBPanel;
    DBPanel1: TDBPanel;
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMarcaPneuCad: TFMarcaPneuCad;

implementation

uses UOracle_cl, UMarcaPneu_cl, UMarcaPneuCons;

{$R *.dfm}

procedure TFMarcaPneuCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMMarcaPneu.QMarcaPneu.Open;
end;

procedure TFMarcaPneuCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FMarcaPneuCons = nil then
    FMarcaPneuCons := TFMarcaPneuCons.Create(Application);
  if FMarcaPneuCons.ShowModal = MrOK then
  begin
    with DMMarcaPneu do
    begin
      QMarcaPneu.Close;
      QMarcaPneu.SetVariable('PK', QMarcaPneuConsCOD_MARCA_PNEU.Value);
      QMarcaPneu.Open;
    end;
  end;
end;

end.
