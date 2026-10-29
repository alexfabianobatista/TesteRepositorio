unit UTurnoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList;

type
  TFTurnoCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTurnoCad: TFTurnoCad;

implementation

uses UTurno_cl, UTurnoCons;

{$R *.DFM}

procedure TFTurnoCad.FormActivate(Sender: TObject);
begin
  inherited;
  With DMTurno do
  Begin
    QTurno.Open;
  End;
end;

procedure TFTurnoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FTurnoCons = Nil Then
    FTurnoCons := TFTurnoCons.Create(Application);
  If FTurnoCons.ShowModal = mrOk then
  With DMTurno do
  Begin
    QTurno.Close;
    QTurno.SetVariable('PK',QTurnoAllCod_Turno.Value);
    QTurno.Open;
  End;
end;

procedure TFTurnoCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(2);
end;

end.
