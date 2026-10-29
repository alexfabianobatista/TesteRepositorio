unit UAnpCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, ExtCtrls, Buttons, DBCtrls;

type
  TFAnpCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAnpCad: TFAnpCad;

implementation

uses UAnp_cl, UAnpCons;

{$R *.dfm}

procedure TFAnpCad.FormCreate(Sender: TObject);
begin
  inherited;
  if DSPrimario.DataSet = nil then
    DSPrimario.DataSet := DMAnp.QAnp;
end;

procedure TFAnpCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DMAnp.QAnp.close;
  DMAnp.QAnpCons.Close;
  Action := CaFree;
  FAnpCad := nil;
end;

procedure TFAnpCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FAnpCons = nil then
    FAnpCons := TFAnpCons.Create(application);
  if FAnpCons.ShowModal = MrOk then
  with DMAnp do
  begin
    QAnp.Close;
    QAnp.SetVariable('PK',QAnpConsCOD_ANP.Value);
    QAnp.open;
  end;
end;

procedure TFAnpCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMAnp.QAnp.Open;
end;

end.
